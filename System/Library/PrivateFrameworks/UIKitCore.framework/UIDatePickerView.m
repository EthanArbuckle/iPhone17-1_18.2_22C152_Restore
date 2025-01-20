@interface UIDatePickerView
@end

@implementation UIDatePickerView

uint64_t __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __54___UIDatePickerView_timeLabelDidBecomeFirstResponder___block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 588) &= ~0x200u;
  return result;
}

uint64_t __43___UIDatePickerView__dismissManualKeyboard__block_invoke(uint64_t result)
{
  *(_WORD *)(*(void *)(result + 32) + 588) &= ~0x200u;
  return result;
}

@end