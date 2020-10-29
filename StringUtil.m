#import "StringUtil.h"

@implementation StringUtil

// UTF8の文字列をNSStringに変換する
+(NSString *) charToNSString:(char *)value
{
    if (value != NULL)
    {
        return [NSString stringWithUTF8String: value];
    }
    else
    {
        return [NSString stringWithUTF8String: ""];
    }
}

// NSStringをUTF8の文字列に変換する
+ (const char *)NSStringToChar:(NSString *)value
{
    return [value UTF8String];
}

@end

