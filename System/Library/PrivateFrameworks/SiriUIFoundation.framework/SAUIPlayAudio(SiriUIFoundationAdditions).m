@interface SAUIPlayAudio(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUIPlayAudio(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return 1;
}

@end