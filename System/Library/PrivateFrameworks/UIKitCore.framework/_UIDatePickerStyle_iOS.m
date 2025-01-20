@interface _UIDatePickerStyle_iOS
- (BOOL)overlayPlatterWantsShadowView;
- (CGSize)compactLabelBackgroundPadding;
- (CGSize)idealLayoutFittingSizeForDatePickerMode:(int64_t)a3;
- (double)compactLabelButtonSpacing;
- (double)compactLabelCornerRadius;
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
- (id)compactLabelBackgroundButtonConfiguration;
- (id)compactLabelBackgroundColorForEnabledState:(BOOL)a3;
- (id)compactLabelTextColorForEditingState:(BOOL)a3;
- (id)createOverlayBackgroundView;
- (int64_t)datePickerModalPresentationStyle;
- (void)addSubview:(id)a3 toOverlayBackgroundView:(id)a4;
@end

@implementation _UIDatePickerStyle_iOS

- (id)createOverlayBackgroundView
{
  v3 = [UIVisualEffectView alloc];
  v4 = +[UIBlurEffect effectWithStyle:8];
  v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];

  [(UIView *)v5 setAutoresizingMask:18];
  v6 = [(UIVisualEffectView *)v5 contentView];
  [v6 setClipsToBounds:1];

  [(_UIDatePickerStyle_iOS *)self overlayPlatterCornerRadius];
  -[UIVisualEffectView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
  return v5;
}

- (void)addSubview:(id)a3 toOverlayBackgroundView:(id)a4
{
  id v5 = a3;
  id v6 = [a4 contentView];
  [v6 addSubview:v5];
}

- (CGSize)idealLayoutFittingSizeForDatePickerMode:(int64_t)a3
{
  double v3 = 172.0;
  double v4 = 218.0;
  double v5 = 0.0;
  double v6 = 320.0;
  if (a3 == 3)
  {
    double v6 = 218.0;
    double v5 = 172.0;
  }
  if (a3)
  {
    double v4 = v6;
    double v3 = v5;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (double)inlineDateViewMinimumWidth
{
  return 280.0;
}

- (double)inlineTimeViewMinimumWidth
{
  return 0.0;
}

- (double)inlineTimeAndDateSpacing
{
  return 16.0;
}

- (double)inlineDatePickerMaximumWidth
{
  return 375.0;
}

- (double)inlineDatePickerMinimumMargin
{
  return 16.0;
}

- (double)compactLabelButtonSpacing
{
  return 4.0;
}

- (double)compactLabelCornerRadius
{
  return 8.0;
}

- (CGSize)compactLabelBackgroundPadding
{
  double v2 = 12.0;
  double v3 = 7.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)datePickerModalPresentationStyle
{
  return 5;
}

- (double)overlayPlatterCornerRadius
{
  return 13.0;
}

- (double)overlayPlatterInitialScale
{
  return 0.2;
}

- (double)overlayPlatterInitialHeight
{
  return 10.0;
}

- (double)overlayPlatterDefaultSpacing
{
  return 6.0;
}

- (double)overlayPlatterDefaultMargin
{
  return 16.0;
}

- (BOOL)overlayPlatterWantsShadowView
{
  return 1;
}

- (id)compactLabelTextColorForEditingState:(BOOL)a3
{
  if (a3) {
    +[UIColor tintColor];
  }
  else {
  double v3 = +[UIColor labelColor];
  }
  return v3;
}

- (id)compactLabelBackgroundColorForEnabledState:(BOOL)a3
{
  if (a3) {
    +[UIColor tertiarySystemFillColor];
  }
  else {
  double v3 = +[UIColor clearColor];
  }
  return v3;
}

- (id)compactLabelBackgroundButtonConfiguration
{
  double v3 = +[UIButtonConfiguration plainButtonConfiguration];
  [v3 setCornerStyle:-1];
  [(_UIDatePickerStyle_iOS *)self compactLabelCornerRadius];
  double v5 = v4;
  double v6 = [v3 background];
  [v6 setCornerRadius:v5];

  v7 = +[UIColor tertiarySystemFillColor];
  v8 = [v3 background];
  [v8 setBackgroundColor:v7];

  return v3;
}

@end