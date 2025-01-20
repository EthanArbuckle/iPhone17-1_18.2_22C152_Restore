@interface content_cleanup
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation content_cleanup

+ (NSString)sourceName
{
  return (NSString *)@"content_cleanup.js";
}

+ (NSString)source
{
  return (NSString *)&cfstr_Copyright2018A;
}

@end