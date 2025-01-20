@interface _UIModernBarButtonVisualProvider
- (id)_newImageViewWithFrame:(CGRect)a3;
- (id)_newLabelWithFrame:(CGRect)a3;
@end

@implementation _UIModernBarButtonVisualProvider

- (id)_newImageViewWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIModernBarButtonVisualProvider;
  id v4 = -[UIButtonLegacyVisualProvider _newImageViewWithFrame:](&v6, sel__newImageViewWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v4, "_setGuardAgainstDegenerateBaselineCalculation:", -[UIButton _guardAgainstDegenerateBaselineCalculation](self->super._button, "_guardAgainstDegenerateBaselineCalculation"));
  }
  return v4;
}

- (id)_newLabelWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIModernBarButtonVisualProvider;
  id v3 = -[UIButtonLegacyVisualProvider _newLabelWithFrame:](&v5, sel__newLabelWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setAdjustsFontForContentSizeCategory:_UIBarsUseDynamicType()];
  return v3;
}

@end