@interface TonePickerStyleProvider
- (BOOL)tonePickerUsesOpaqueBackground;
- (BOOL)vibrationPickerUsesOpaqueBackground;
- (BOOL)wantsCustomTonePickerHeaderView;
- (BOOL)wantsCustomVibrationPickerHeaderView;
- (UIColor)tonePickerCellBackgroundColor;
- (UIColor)tonePickerCellHighlightedTextColor;
- (UIColor)tonePickerCellTextColor;
- (UIColor)tonePickerHeaderTextColor;
- (UIColor)tonePickerHeaderTextShadowColor;
- (UIColor)vibrationPickerCellBackgroundColor;
- (UIColor)vibrationPickerCellHighlightedTextColor;
- (UIColor)vibrationPickerCellTextColor;
- (UIColor)vibrationPickerHeaderTextColor;
- (UIColor)vibrationPickerHeaderTextShadowColor;
- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets;
- (UIFont)tonePickerCellTextFont;
- (UIFont)tonePickerHeaderTextFont;
- (UIFont)vibrationPickerCellTextFont;
- (UIFont)vibrationPickerHeaderTextFont;
- (UIOffset)tonePickerHeaderTextShadowOffset;
- (_TtC13SleepHealthUI23TonePickerStyleProvider)init;
- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell;
- (id)newAccessoryDisclosureIndicatorViewForVibrationPickerCell;
- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3;
- (id)newBackgroundViewForSelectedVibrationPickerCell:(BOOL)a3;
- (int64_t)tonePickerTableViewSeparatorStyle;
- (int64_t)vibrationPickerTableViewSeparatorStyle;
@end

@implementation TonePickerStyleProvider

- (_TtC13SleepHealthUI23TonePickerStyleProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TonePickerStyleProvider();
  return [(TonePickerStyleProvider *)&v3 init];
}

- (BOOL)tonePickerUsesOpaqueBackground
{
  return 1;
}

- (int64_t)tonePickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)tonePickerCellTextFont
{
  return (UIFont *)0;
}

- (UIColor)tonePickerCellTextColor
{
  return (UIColor *)0;
}

- (UIColor)tonePickerCellHighlightedTextColor
{
  return (UIColor *)0;
}

- (UIColor)tonePickerCellBackgroundColor
{
  return (UIColor *)0;
}

- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3
{
  return 0;
}

- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell
{
  return 0;
}

- (BOOL)wantsCustomTonePickerHeaderView
{
  return 0;
}

- (UIFont)tonePickerHeaderTextFont
{
  return (UIFont *)0;
}

- (UIColor)tonePickerHeaderTextColor
{
  return (UIColor *)0;
}

- (UIColor)tonePickerHeaderTextShadowColor
{
  return (UIColor *)0;
}

- (UIOffset)tonePickerHeaderTextShadowOffset
{
  double v2 = *MEMORY[0x1E4FB2E10];
  double v3 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)vibrationPickerUsesOpaqueBackground
{
  return 1;
}

- (int64_t)vibrationPickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)vibrationPickerCellTextFont
{
  id v2 = objc_msgSend(self, sel_preferredFontForTextStyle_, *MEMORY[0x1E4FB28C8]);
  return (UIFont *)v2;
}

- (UIColor)vibrationPickerCellTextColor
{
  return (UIColor *)0;
}

- (UIColor)vibrationPickerCellHighlightedTextColor
{
  return (UIColor *)0;
}

- (UIColor)vibrationPickerCellBackgroundColor
{
  return (UIColor *)0;
}

- (id)newAccessoryDisclosureIndicatorViewForVibrationPickerCell
{
  return 0;
}

- (BOOL)wantsCustomVibrationPickerHeaderView
{
  return 0;
}

- (UIFont)vibrationPickerHeaderTextFont
{
  return (UIFont *)0;
}

- (UIColor)vibrationPickerHeaderTextColor
{
  return (UIColor *)0;
}

- (UIColor)vibrationPickerHeaderTextShadowColor
{
  return (UIColor *)0;
}

- (id)newBackgroundViewForSelectedVibrationPickerCell:(BOOL)a3
{
  return 0;
}

@end