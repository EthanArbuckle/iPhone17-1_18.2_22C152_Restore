@interface SAUIButton(SiriUIFoundationAdditions)
- (uint64_t)sruif_hasButton;
@end

@implementation SAUIButton(SiriUIFoundationAdditions)

- (uint64_t)sruif_hasButton
{
  return 1;
}

@end