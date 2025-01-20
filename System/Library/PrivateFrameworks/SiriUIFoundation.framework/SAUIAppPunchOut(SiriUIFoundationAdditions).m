@interface SAUIAppPunchOut(SiriUIFoundationAdditions)
- (uint64_t)sruif_aceCommandType;
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUIAppPunchOut(SiriUIFoundationAdditions)

- (uint64_t)sruif_aceCommandType
{
  return 2;
}

- (uint64_t)sruif_usefulUserResultType
{
  return 2;
}

@end