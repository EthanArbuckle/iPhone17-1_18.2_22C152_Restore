@interface UIDatePickerIOSCompactView
@end

@implementation UIDatePickerIOSCompactView

void __67___UIDatePickerIOSCompactView_createDatePickerForCompactDateLabel___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 sender];
  v4 = [v3 date];
  [*(id *)(*(void *)(a1 + 32) + 552) setDate:v4];

  [*(id *)(a1 + 32) _updateUI];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 544));
  [WeakRetained _emitValueChanged];
}

@end