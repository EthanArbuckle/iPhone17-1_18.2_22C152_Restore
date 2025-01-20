@interface VUIAccessView
@end

@implementation VUIAccessView

void __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 480);
  id v2 = [*(id *)(a1 + 40) colorWithAlphaComponent:0.5];
  [v1 setBackgroundColor:v2];
}

uint64_t __68__VUIAccessView_iOS_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 480) setBackgroundColor:*(void *)(a1 + 40)];
}

@end