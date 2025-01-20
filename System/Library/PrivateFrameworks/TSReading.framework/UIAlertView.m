@interface UIAlertView
@end

@implementation UIAlertView

void __54__UIAlertView_KNAdditions__showWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 40) setCompletionHandler:0];
  v3 = *(void **)(a1 + 40);
}

@end