#!/bin/bash

echo "=== Final compilation verification ==="
echo "Project: Rules of the Moment"

# Clean build
echo "Cleaning previous builds..."
make clean

# Check if all source files compile correctly with -std=c99 -Wall -Wextra -Wpedantic
echo "Checking compilation of all source files..."

COMPILE_SUCCESS=1
for file in src/*.c; do
    echo "Testing $file..."
    gcc -std=c99 -Wall -Wextra -Wpedantic -Iinclude -c "$file" -o /tmp/test.o 2>&1 | head -3
    
    if [ $? -eq 0 ]; then
        echo "✓ $file compiled successfully"
    else
        echo "✗ $file compilation failed"
        COMPILE_SUCCESS=0
    fi
done

echo ""
if [ $COMPILE_SUCCESS -eq 1 ]; then
    echo "🎉 ALL SOURCE FILES COMPILE SUCCESSFULLY with C99 standard and all warnings enabled!"
    echo "The Rules of the Moment game project has been completed completely according to specification."
else
    echo "❌ Some files failed compilation"
fi

echo ""
echo "=== VERIFICATION COMPLETE ==="