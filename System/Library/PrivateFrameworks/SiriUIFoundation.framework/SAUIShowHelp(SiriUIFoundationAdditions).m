@interface SAUIShowHelp(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUIShowHelp(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return 1;
}

@end