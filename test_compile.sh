#!/bin/bash

echo "=== Rules of the Moment - Compilation Test ==="
echo ""

# Test compilation without linking (just checking syntax)
echo "Testing C syntax compilation..."

SUCCESS_COUNT=0
TOTAL_FILES=7

# Check each source file separately
for file in src/*.c; do
    echo -n "Checking $file... "
    if gcc -std=c99 -Wall -Wextra -Wpedantic -Iinclude -c "$file" -o /tmp/test.o 2>/dev/null; then
        echo "OK"
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
    else
        echo "FAILED"
    fi
done

echo ""
echo "Results: $SUCCESS_COUNT/$TOTAL_FILES files compiled successfully"
echo ""

# Check header files too
echo "Checking header files..."
for file in include/*.h; do
    echo -n "Checking $file... "
    if gcc -std=c99 -Wall -Wextra -Wpedantic -Iinclude -c "$file" -o /tmp/test.o 2>/dev/null; then
        echo "OK"
    else
        echo "FAILED"
    fi
done

echo ""
echo "=== Test Complete ==="