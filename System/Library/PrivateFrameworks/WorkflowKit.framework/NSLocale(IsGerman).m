@interface NSLocale(IsGerman)
+ (uint64_t)isGerman;
@end

@implementation NSLocale(IsGerman)

+ (uint64_t)isGerman
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 preferredLocalizations];
  v2 = [v1 firstObject];

  v3 = [v2 lowercaseString];
  uint64_t v4 = [v3 hasPrefix:@"de"];

  return v4;
}

@end