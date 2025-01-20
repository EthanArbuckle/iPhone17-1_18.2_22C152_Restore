@interface NSUserDefaults(STSDefaults)
- (uint64_t)sts_legalNoticeCount;
- (uint64_t)sts_setLegalNoticeCount:()STSDefaults;
@end

@implementation NSUserDefaults(STSDefaults)

- (uint64_t)sts_legalNoticeCount
{
  return [a1 integerForKey:@"LegalNoticeCount"];
}

- (uint64_t)sts_setLegalNoticeCount:()STSDefaults
{
  [a1 setInteger:a3 forKey:@"LegalNoticeCount"];

  return [a1 synchronize];
}

@end