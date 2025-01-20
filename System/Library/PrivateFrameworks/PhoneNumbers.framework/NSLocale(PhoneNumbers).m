@interface NSLocale(PhoneNumbers)
+ (id)nationalDirectDialingPrefixForISOCountryCode:()PhoneNumbers;
+ (uint64_t)ITUCountryCodeForISOCountryCode:()PhoneNumbers;
- (id)nationalDirectDialingPrefix;
- (uint64_t)ITUCountryCode;
@end

@implementation NSLocale(PhoneNumbers)

+ (uint64_t)ITUCountryCodeForISOCountryCode:()PhoneNumbers
{
  v0 = (void *)_PNCopyInternationalCodeForCountry();
  v1 = v0;
  if (v0 && [v0 integerValue] >= 1) {
    uint64_t v2 = [v1 integerValue];
  }
  else {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

+ (id)nationalDirectDialingPrefixForISOCountryCode:()PhoneNumbers
{
  v0 = (void *)_PNCopyNationalDirectDialingPrefixForCountry();
  return v0;
}

- (uint64_t)ITUCountryCode
{
  v1 = [a1 countryCode];
  if (v1) {
    uint64_t v2 = [(id)objc_opt_class() ITUCountryCodeForISOCountryCode:v1];
  }
  else {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

- (id)nationalDirectDialingPrefix
{
  v1 = [a1 countryCode];
  if (v1)
  {
    uint64_t v2 = [(id)objc_opt_class() nationalDirectDialingPrefixForISOCountryCode:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end