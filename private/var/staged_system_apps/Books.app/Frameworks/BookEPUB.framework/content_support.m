@interface content_support
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation content_support

+ (NSString)sourceName
{
  return (NSString *)@"content_support.js";
}

+ (NSString)source
{
  return (NSString *)&cfstr_Copyright20182;
}

@end