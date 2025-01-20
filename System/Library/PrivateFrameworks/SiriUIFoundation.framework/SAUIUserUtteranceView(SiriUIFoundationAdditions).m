@interface SAUIUserUtteranceView(SiriUIFoundationAdditions)
- (uint64_t)sruif_isUserUtterance;
@end

@implementation SAUIUserUtteranceView(SiriUIFoundationAdditions)

- (uint64_t)sruif_isUserUtterance
{
  return 1;
}

@end