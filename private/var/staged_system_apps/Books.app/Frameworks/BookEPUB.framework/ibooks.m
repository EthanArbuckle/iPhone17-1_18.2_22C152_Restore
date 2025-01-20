@interface ibooks
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation ibooks

+ (NSString)sourceName
{
  return (NSString *)@"ibooks.js";
}

+ (NSString)source
{
  return (NSString *)&cfstr_IbooksJsFramew;
}

@end