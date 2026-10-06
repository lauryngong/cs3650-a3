/* Complete the C version of the driver program for mystery. This C code does
 * not need to compile. */

#include <stdio.h>
#include <stdlib.h>

extern long crunch(long, long);

int main(int argc, char *argv[]) {

    // The program requires exactly two command-line arguments.
    // argc is 3 because argv[0] is the program name.
    if (argc != 3) {
        printf("Two arguments required.\n");
        return 1;
    }

    // Convert the two command-line arguments from strings to long integers.
    long first = atol(argv[1]);
    long second = atol(argv[2]);

    // Call the provided mystery function.
    long result = crunch(first, second);

    // Print a message depending on the result returned by crunch.
    if (result < 0) {
        printf("hat\n");
    }
    else if (result == 0) {
        printf("tea\n");
    }
    else {
        printf("beer\n");
    }
    
    return 0;
}

