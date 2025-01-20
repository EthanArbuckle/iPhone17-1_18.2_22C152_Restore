@interface SAUIClearScreen(SiriUIFoundationAdditions)
- (uint64_t)sruif_usefulUserResultType;
@end

@implementation SAUIClearScreen(SiriUIFoundationAdditions)

- (uint64_t)sruif_usefulUserResultType
{
  return 1;
}

@end