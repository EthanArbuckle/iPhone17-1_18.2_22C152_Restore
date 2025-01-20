@interface UIDatePickerWheelsTimeLabel
@end

@implementation UIDatePickerWheelsTimeLabel

void __49___UIDatePickerWheelsTimeLabel_setContentHidden___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) timeSeparatorLabel];
  [v2 setAlpha:v1];
}

@end