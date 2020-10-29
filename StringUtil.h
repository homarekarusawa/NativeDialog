#import <Foundation/Foundation.h>

@interface StringUtil : NSObject

+ (NSString*) charToNSString: (char*)value;
+ (const char *) NSStringToChar: (NSString *) value;

@end

