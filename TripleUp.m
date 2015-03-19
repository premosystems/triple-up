//
//  TripleUp.m
//  iFit
//
//  Created by Brady Randall on 1/31/14.
//
//

#import "TripleUp.h"

@implementation TripleUp

/********************************
 * Return true if the array contains, somewhere, three increasing
 * adjacent numbers like .... 4, 5, 6, ... or 23, 24, 25.
 *
 * See the verify lines below for examples of input
 * and expected output.
 *
 * Run this class, If you see errors, it is because the tests below
 * did not pass. Once the tests do pass, you will see a log of `Success!`
 ********************************/
+(void)runTests {
    @try {
        // These are the tests that will run against your code
        // vars = array of ints, expected answer
        
        [self verify:@[@1, @4, @5, @6, @2] expected:YES];
        [self verify:@[@1, @2, @4, @5, @7, @6, @5, @6, @7, @6] expected:YES];
        [self verify:@[@1, @2, @4, @5, @7, @6, @5, @7, @7, @6] expected:NO];
        [self verify:@[@1, @2] expected:NO];
        [self verify:@[@10, @9, @8, @(-100), @(-99), @(-98), @100] expected:YES];
        [self verify:@[@10, @9, @8, @(-100), @(-99), @99, @100] expected:NO];
        NSLog(@"runTests - Success!");
    } @catch (NSException *exc) {
        NSLog(@"runTests - exception: %@", [exc reason]);
    }
}

/********************************
 * YOUR CODE BELOW HERE
 ********************************/
+(BOOL)triple:(NSArray*)nums {
    
    BOOL triple = NO;
    
    for (int x = 0; x < nums.count - 2; x++) {
        if (((NSNumber*)nums[x]).intValue == (((NSNumber*)nums[x+1]).intValue - 1) &&  ((NSNumber*)nums[x]).intValue == (((NSNumber*)nums[x+2]).intValue - 2)) {
            triple = YES;
            break;
        }
    }
    
    return triple;
}
/********************************
 * YOUR CODE ABOVE HERE
 ********************************/

+(void)verify:(NSArray*)nums expected:(BOOL)expected {
    BOOL answer = [self triple:nums];
    if (answer != expected) {
        @throw [NSException exceptionWithName:@"Wrong answer" reason:[NSString stringWithFormat:@"wrong answer, expected %@ to equal %@", answer?@"true":@"false", expected?@"true":@"false"] userInfo:nil];
    }
}

@end
