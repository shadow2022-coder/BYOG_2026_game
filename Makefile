# Makefile for Rules of the Moment game
# Based on raylib 5.x project structure

CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -Wpedantic -O2
DEBUG_FLAGS = -g -DDEBUG
LIBS = -lm

# Try to find raylib installation path
ifeq ($(shell pkg-config --exists raylib && echo "yes"), yes)
	LIBS = $(shell pkg-config --libs raylib) -lm
	CFLAGS += $(shell pkg-config --cflags raylib)
else
	# Use system installation paths as fallback
	CFLAGS += -I/usr/local/include
	LIBS = -L/usr/local/lib -lraylib -lm
endif

TARGET = rotm
SRCDIR = src
INCDIR = include
BUILDDIR = build
OBJDIR = $(BUILDDIR)/obj

# Source files by module
CORE_SRC = $(SRCDIR)/core/game.c $(SRCDIR)/core/input.c
PLAYER_SRC = $(SRCDIR)/player/player.c 
RULES_SRC = $(SRCDIR)/rules/rules.c
ENEMIES_SRC = $(SRCDIR)/enemies/enemies.c
UI_SRC = $(SRCDIR)/ui/ui.c
MAIN_SRC = $(SRCDIR)/main.c

# Object files
CORE_OBJ = $(OBJDIR)/core/game.o $(OBJDIR)/core/input.o
PLAYER_OBJ = $(OBJDIR)/player/player.o
RULES_OBJ = $(OBJDIR)/rules/rules.o
ENEMIES_OBJ = $(OBJDIR)/enemies/enemies.o
UI_OBJ = $(OBJDIR)/ui/ui.o
MAIN_OBJ = $(OBJDIR)/main.o

# Default build
all: $(BUILDDIR)/$(TARGET)

# Debug build
debug: CFLAGS += $(DEBUG_FLAGS)
debug: all

# Release build (default with optimization)
release: CFLAGS += -O3
release: all

# Build directory setup
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c | $(OBJDIR)
	$(CC) $(CFLAGS) -I$(INCDIR) -c $< -o $@

# Create object directories
$(OBJDIR):
	mkdir -p $(OBJDIR)
$(OBJDIR)/core:
	mkdir -p $(OBJDIR)/core
$(OBJDIR)/player:
	mkdir -p $(OBJDIR)/player
$(OBJDIR)/rules:
	mkdir -p $(OBJDIR)/rules
$(OBJDIR)/enemies:
	mkdir -p $(OBJDIR)/enemies
$(OBJDIR)/ui:
	mkdir -p $(OBJDIR)/ui

# Main executable
$(BUILDDIR)/$(TARGET): $(MAIN_OBJ) $(CORE_OBJ) $(PLAYER_OBJ) $(RULES_OBJ) $(ENEMIES_OBJ) $(UI_OBJ) | $(BUILDDIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

# Clean build artifacts
clean:
	rm -f $(BUILDDIR)/$(TARGET)
	rm -rf $(BUILDDIR)/*

# Test target
test: 
	@echo "Testing compilation of all core modules..."
	@$(CC) $(CFLAGS) -I$(INCDIR) -c $(MAIN_SRC) $(CORE_SRC) $(PLAYER_SRC) $(RULES_SRC) $(ENEMIES_SRC) $(UI_SRC) -o /tmp/test_build.o 2>/dev/null && echo "✅ All source files compile successfully" || echo "❌ Compilation failed"

.PHONY: all debug release clean test

# Dependency rules
$(MAIN_OBJ): $(MAIN_SRC)
$(CORE_OBJ): $(CORE_SRC)
$(PLAYER_OBJ): $(PLAYER_SRC)
$(RULES_OBJ): $(RULES_SRC)
$(ENEMIES_OBJ): $(ENEMIES_SRC)
$(UI_OBJ): $(UI_SRC)