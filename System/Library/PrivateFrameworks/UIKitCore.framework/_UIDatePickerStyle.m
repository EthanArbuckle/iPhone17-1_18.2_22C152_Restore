@interface _UIDatePickerStyle
- (BOOL)overlayPlatterWantsShadowView;
- (CGSize)compactLabelBackgroundPadding;
- (CGSize)idealLayoutFittingSizeForDatePickerMode:(int64_t)a3;
- (UIEdgeInsets)maximumWidthOverhangForProposedLayoutMargins:(UIEdgeInsets)a3;
- (UIOffset)overlayPlatterPaddingForAppliedInsets:(UIEdgeInsets)a3 datePickerMode:(int64_t)a4;
- (double)compactDateLabelPlatterHorizontalPadding;
- (double)compactDateLabelPlatterVerticalPadding;
- (double)compactLabelButtonSpacing;
- (double)compactLabelCornerRadius;
- (double)horizontalDatePadding;
- (double)horizontalEdgeInset;
- (double)horizontalPaddingForAMPM;
- (double)horizontalTimeColumnPadding;
- (double)horizontalWeekMonthDayPadding;
- (double)horizontalWeekdayTimePadding;
- (double)inlineDatePickerMaximumWidth;
- (double)inlineDatePickerMinimumMargin;
- (double)inlineDateViewMinimumWidth;
- (double)inlineTimeAndDateSpacing;
- (double)inlineTimeViewMinimumWidth;
- (double)overlayPlatterCornerRadius;
- (double)overlayPlatterDefaultMargin;
- (double)overlayPlatterDefaultSpacing;
- (double)overlayPlatterInitialHeight;
- (double)overlayPlatterInitialScale;
- (double)pickerHorizontalEdgeInset;
- (id)compactLabelBackgroundButtonConfiguration;
- (id)compactLabelBackgroundColorForEnabledState:(BOOL)a3;
- (id)compactLabelTextColorForEditingState:(BOOL)a3;
- (id)createOverlayBackgroundView;
- (int64_t)datePickerModalPresentationStyle;
- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3 datePickerMode:(int64_t)a4 dayIsBeforeMonth:(BOOL)a5;
- (void)addSubview:(id)a3 toOverlayBackgroundView:(id)a4;
@end

@implementation _UIDatePickerStyle

- (id)createOverlayBackgroundView
{
  v2 = objc_opt_new();
  return v2;
}

- (void)addSubview:(id)a3 toOverlayBackgroundView:(id)a4
{
}

- (double)horizontalDatePadding
{
  return 10.0;
}

- (double)horizontalTimeColumnPadding
{
  return 15.0;
}

- (double)horizontalWeekMonthDayPadding
{
  return 11.0;
}

- (double)horizontalWeekdayTimePadding
{
  return 10.0;
}

- (double)horizontalPaddingForAMPM
{
  return 8.0;
}

- (CGSize)idealLayoutFittingSizeForDatePickerMode:(int64_t)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)inlineDateViewMinimumWidth
{
  return 0.0;
}

- (double)inlineTimeViewMinimumWidth
{
  return 0.0;
}

- (double)inlineDatePickerMaximumWidth
{
  return 0.0;
}

- (UIEdgeInsets)maximumWidthOverhangForProposedLayoutMargins:(UIEdgeInsets)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIOffset)overlayPlatterPaddingForAppliedInsets:(UIEdgeInsets)a3 datePickerMode:(int64_t)a4
{
  double left = a3.left;
  double top = a3.top;
  [(_UIDatePickerStyle *)self overlayPlatterDefaultMargin];
  double v8 = v7 - left;
  [(_UIDatePickerStyle *)self overlayPlatterDefaultMargin];
  double v10 = v9 - top;
  double v11 = v8;
  result.vertical = v10;
  result.horizontal = v11;
  return result;
}

- (double)inlineTimeAndDateSpacing
{
  return 0.0;
}

- (double)inlineDatePickerMinimumMargin
{
  return 0.0;
}

- (double)compactLabelButtonSpacing
{
  return 0.0;
}

- (double)compactLabelCornerRadius
{
  return 0.0;
}

- (CGSize)compactLabelBackgroundPadding
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)datePickerModalPresentationStyle
{
  return -1;
}

- (double)overlayPlatterCornerRadius
{
  return 0.0;
}

- (double)overlayPlatterInitialScale
{
  return 0.0;
}

- (double)overlayPlatterInitialHeight
{
  return 0.0;
}

- (double)overlayPlatterDefaultSpacing
{
  return 0.0;
}

- (double)overlayPlatterDefaultMargin
{
  return 0.0;
}

- (double)horizontalEdgeInset
{
  return 13.0;
}

- (BOOL)overlayPlatterWantsShadowView
{
  return 0;
}

- (id)compactLabelTextColorForEditingState:(BOOL)a3
{
  if (a3) {
    +[UIColor blackColor];
  }
  else {
  double v3 = +[UIColor labelColor];
  }
  return v3;
}

- (id)compactLabelBackgroundColorForEnabledState:(BOOL)a3
{
  if (a3)
  {
    double v4 = +[UIColor tertiarySystemFillColor];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)compactLabelBackgroundButtonConfiguration
{
  return +[UIButtonConfiguration plainButtonConfiguration];
}

- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3 datePickerMode:(int64_t)a4 dayIsBeforeMonth:(BOOL)a5
{
  int64_t v5 = 2;
  uint64_t v6 = 1;
  uint64_t v7 = 2;
  if (a5) {
    uint64_t v7 = 0;
  }
  if (a3 == 8) {
    uint64_t v6 = v7;
  }
  if (a3 == 16) {
    uint64_t v6 = 2;
  }
  if (a3 != 32) {
    int64_t v5 = v6;
  }
  if (a4 == 3) {
    return 2;
  }
  else {
    return v5;
  }
}

- (double)compactDateLabelPlatterHorizontalPadding
{
  return 0.0;
}

- (double)compactDateLabelPlatterVerticalPadding
{
  return 0.0;
}

- (double)pickerHorizontalEdgeInset
{
  return self->_pickerHorizontalEdgeInset;
}

@end