//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher


-(NSString *)encodeMessage:(NSString *)message withOffset:(NSInteger)key{
    NSString *encodedCharacter = @"";
    NSMutableString *encodedMessage = [@"" mutableCopy];
    NSUInteger lettersInAlphabet = 26;
    for (NSUInteger i = 0; i < [message length]; i++) {
        unichar asciiEquivalent = [message characterAtIndex:i];
        if (key >= lettersInAlphabet) {
            key = key % lettersInAlphabet;
        }
        unichar asciiPlusKey = asciiEquivalent + key;
        
        if (asciiEquivalent >= 'a' && asciiEquivalent <= 'z' && asciiPlusKey <= 'z') {
            encodedCharacter = [NSString stringWithFormat:@"%C", asciiPlusKey];
            [encodedMessage appendString:encodedCharacter];
        }
        if (asciiEquivalent >= 'a' && asciiEquivalent <= 'z' && asciiPlusKey > 'z') {
            
            if ((key % 26) != 0) {
                unichar asciiMinusKey = asciiEquivalent - (26 - key);
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiMinusKey];
                [encodedMessage appendString:encodedCharacter];
            }
            if ((key % 26) == 0) {
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiEquivalent];
                [encodedMessage appendString:encodedCharacter];
            }
        }
        if (asciiEquivalent >= 'A' && asciiEquivalent <= 'Z' && asciiPlusKey <= 'Z') {
            encodedCharacter = [NSString stringWithFormat:@"%C", asciiPlusKey];
            [encodedMessage appendString:encodedCharacter];
        }
        
        if (asciiEquivalent >= 'A' && asciiEquivalent <= 'Z' && asciiPlusKey >='Z') {
            if ((key % 26) != 0) {
                unichar asciiMinusKey = asciiEquivalent - (26 - key);
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiMinusKey];
                [encodedMessage appendString:encodedCharacter];
            }
            if ((key % 26) == 0) {
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiEquivalent];
                [encodedMessage appendString:encodedCharacter];
            }
        }
        if (!(asciiEquivalent >= 'a' && asciiEquivalent <= 'z') && !(asciiEquivalent > 'A' && asciiEquivalent <= 'Z')) {
            encodedCharacter = [NSString stringWithFormat:@"%C", asciiEquivalent];
            [encodedMessage appendString:encodedCharacter];
        }
    }
    return encodedMessage;
}

-(NSString *)decodeMessage:(NSString *)encodedMessage withOffset:(NSInteger)key{
    
    NSString *encodedCharacter = @"";
    NSMutableString *decodedMessage = [@"" mutableCopy];
    NSUInteger lettersInAlphabet = 26;
    NSInteger keyCopy = 0;
    for (NSUInteger i = 0; i < [encodedMessage length]; i++) {
        keyCopy = key;
        unichar asciiEquivalent = [encodedMessage characterAtIndex:i];
        if (keyCopy >= lettersInAlphabet) {
            keyCopy = keyCopy % lettersInAlphabet;
        }
        if (keyCopy > 0) {
            keyCopy = keyCopy * -1;
        }
        unichar asciiPlusKey = asciiEquivalent + keyCopy;
        
        if (asciiEquivalent >= 'a' && asciiEquivalent <= 'z' && asciiPlusKey >= 'a') {
            encodedCharacter = [NSString stringWithFormat:@"%C", asciiPlusKey];
            [decodedMessage appendString:encodedCharacter];
        }
        if (asciiEquivalent >= 'a' && asciiEquivalent <= 'z' && asciiPlusKey < 'a') {
            
            
            if ((keyCopy % 26) != 0) {
                unichar asciiPlusKey = asciiEquivalent + (26 + keyCopy);
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiPlusKey];
                [decodedMessage appendString:encodedCharacter];
            }
            if ((keyCopy % 26) == 0) {
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiEquivalent];
                [decodedMessage appendString:encodedCharacter];
            }
        }
        if (asciiEquivalent >= 'A' && asciiEquivalent <= 'Z' && asciiPlusKey >= 'A') {
            encodedCharacter = [NSString stringWithFormat:@"%C", asciiPlusKey];
            [decodedMessage appendString:encodedCharacter];
        }
        
        if (asciiEquivalent >= 'A' && asciiEquivalent <= 'Z' && asciiPlusKey <= 'A') {
            if ((keyCopy % 26) != 0) {
                unichar asciiPlusKey = asciiEquivalent + (26 + keyCopy);
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiPlusKey];
                [decodedMessage appendString:encodedCharacter];
            }
            if ((keyCopy % 26) == 0) {
                encodedCharacter = [NSString stringWithFormat:@"%C",asciiEquivalent];
                [decodedMessage appendString:encodedCharacter];
            }
        }
        if (!(asciiEquivalent >= 'a' && asciiEquivalent <= 'z') && !(asciiEquivalent > 'A' && asciiEquivalent <= 'Z')) {
            encodedCharacter = [NSString stringWithFormat:@"%C", asciiEquivalent];
            [decodedMessage appendString:encodedCharacter];
        }
    }
    return decodedMessage;

}


@end
