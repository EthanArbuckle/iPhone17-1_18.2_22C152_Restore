@interface _SBSystemApertureMagiciansCurtainView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_SBSystemApertureMagiciansCurtainView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
@end

@implementation _SBSystemApertureMagiciansCurtainView

- (_SBSystemApertureMagiciansCurtainView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SBSystemApertureMagiciansCurtainView;
  v3 = -[_SBSystemApertureGainMapView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_SBGainMapView *)v3->super._gainMapView setSupportsHitTesting:0];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4FA7D88], "sharedInstanceForEmbeddedDisplay", a3.width, a3.height);
  [v3 sensorRegionSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)_SBSystemApertureMagiciansCurtainView;
  [(_SBSystemApertureMagiciansCurtainView *)&v13 layoutSubviews];
  v3 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
  [v3 sensorRegionSize];
  BSRectWithSize();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(_SBSystemApertureMagiciansCurtainView *)self window];
  +[SBSystemApertureContainerView _defaultCornerRadiusForBounds:inWindow:](SBSystemApertureContainerView, "_defaultCornerRadiusForBounds:inWindow:", v12, v5, v7, v9, v11);
  -[_SBSystemApertureGainMapView setIDCornerRadius:](self, "setIDCornerRadius:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_SBSystemApertureMagiciansCurtainView;
  -[_SBSystemApertureMagiciansCurtainView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (_SBSystemApertureMagiciansCurtainView *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    double v5 = 0;
  }
  double v7 = v5;

  return v7;
}

@end