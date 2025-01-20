@interface NSLocale(IC)
- (uint64_t)localeIsArabic;
@end

@implementation NSLocale(IC)

- (uint64_t)localeIsArabic
{
  v1 = [a1 localeIdentifier];
  uint64_t v2 = [v1 hasPrefix:@"ar"];

  return v2;
}

@end