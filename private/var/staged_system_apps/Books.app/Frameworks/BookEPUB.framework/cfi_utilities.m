@interface cfi_utilities
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation cfi_utilities

+ (NSString)sourceName
{
  return (NSString *)@"cfi_utilities.js";
}

+ (NSString)source
{
  return (NSString *)&cfstr_Copyright2018A_0;
}

@end