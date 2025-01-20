@interface MTUITonePickerStyleProvider
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
- (UIColor)vibrationPickerCustomBackgroundColor;
- (UIColor)vibrationPickerHeaderTextColor;
- (UIColor)vibrationPickerHeaderTextShadowColor;
- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets;
- (UIEdgeInsets)vibrationPickerHeaderTextPaddingInsets;
- (UIFont)tonePickerCellTextFont;
- (UIFont)tonePickerHeaderTextFont;
- (UIFont)vibrationPickerCellTextFont;
- (UIFont)vibrationPickerHeaderTextFont;
- (UIOffset)tonePickerHeaderTextShadowOffset;
- (UIOffset)vibrationPickerHeaderTextShadowOffset;
- (id)newAccessoryDisclosureIndicatorViewForTonePickerCell;
- (id)newAccessoryDisclosureIndicatorViewForVibrationPickerCell;
- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3;
- (id)newBackgroundViewForSelectedVibrationPickerCell:(BOOL)a3;
- (int64_t)tonePickerTableViewSeparatorStyle;
- (int64_t)vibrationPickerTableViewSeparatorStyle;
@end

@implementation MTUITonePickerStyleProvider

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
  return (UIFont *)[MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
}

- (UIColor)tonePickerCellTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
}

- (UIColor)tonePickerCellHighlightedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
}

- (UIColor)tonePickerCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_foregroundColor");
}

- (id)newBackgroundViewForSelectedTonePickerCell:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  v3 = objc_opt_new();
  v4 = objc_msgSend(MEMORY[0x263F1C550], "mtui_cellHighlightColor");
  [v3 setBackgroundColor:v4];

  return v3;
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
  return (UIFont *)[MEMORY[0x263F1C658] systemFontOfSize:17.0];
}

- (UIColor)tonePickerHeaderTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_secondaryTextColor");
}

- (UIColor)tonePickerHeaderTextShadowColor
{
  return (UIColor *)[MEMORY[0x263F1C550] clearColor];
}

- (UIOffset)tonePickerHeaderTextShadowOffset
{
  double v2 = *MEMORY[0x263F1D4E8];
  double v3 = *(double *)(MEMORY[0x263F1D4E8] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)tonePickerHeaderTextPaddingInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
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

- (UIColor)vibrationPickerCustomBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_backgroundColor");
}

- (int64_t)vibrationPickerTableViewSeparatorStyle
{
  return 1;
}

- (UIFont)vibrationPickerCellTextFont
{
  return (UIFont *)[MEMORY[0x263F1C658] systemFontOfSize:17.0];
}

- (UIColor)vibrationPickerCellTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
}

- (UIColor)vibrationPickerCellHighlightedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_primaryTextColor");
}

- (UIColor)vibrationPickerCellBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_foregroundColor");
}

- (id)newBackgroundViewForSelectedVibrationPickerCell:(BOOL)a3
{
  if (!a3) {
    return 0;
  }
  double v3 = objc_opt_new();
  double v4 = objc_msgSend(MEMORY[0x263F1C550], "mtui_cellHighlightColor");
  [v3 setBackgroundColor:v4];

  return v3;
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
  return (UIFont *)[MEMORY[0x263F1C658] systemFontOfSize:17.0];
}

- (UIColor)vibrationPickerHeaderTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x263F1C550], "mtui_secondaryTextColor");
}

- (UIColor)vibrationPickerHeaderTextShadowColor
{
  return (UIColor *)[MEMORY[0x263F1C550] clearColor];
}

- (UIOffset)vibrationPickerHeaderTextShadowOffset
{
  double v2 = *MEMORY[0x263F1D4E8];
  double v3 = *(double *)(MEMORY[0x263F1D4E8] + 8);
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (UIEdgeInsets)vibrationPickerHeaderTextPaddingInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end