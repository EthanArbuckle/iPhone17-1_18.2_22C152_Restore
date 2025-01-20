@interface SBXXAddAlertItemsSuppressionAssertion
@end

@implementation SBXXAddAlertItemsSuppressionAssertion

void ___SBXXAddAlertItemsSuppressionAssertion_block_invoke(uint64_t a1)
{
  id v2 = +[SBAlertItemsController sharedInstance];
  [v2 captureSuppressionAssertion:*(void *)(a1 + 32) reason:*(void *)(a1 + 40)];
}

@end