@interface SAUIUnlockDevice(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUIUnlockDevice(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return 1;
}

@end