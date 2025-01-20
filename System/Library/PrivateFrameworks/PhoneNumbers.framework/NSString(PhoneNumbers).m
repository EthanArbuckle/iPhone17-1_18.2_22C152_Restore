@interface NSString(PhoneNumbers)
- (uint64_t)pn_hasInternationalDirectDialingPrefix;
@end

@implementation NSString(PhoneNumbers)

- (uint64_t)pn_hasInternationalDirectDialingPrefix
{
  return [a1 hasPrefix:@"+"];
}

@end