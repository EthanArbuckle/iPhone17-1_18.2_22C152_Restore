@interface SAUICloseAssistant(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUICloseAssistant(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return 2;
}

@end