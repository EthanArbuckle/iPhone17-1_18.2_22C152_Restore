@interface AXFKATextFieldFocusRingShapeLayer
- (void)updateAppearance;
@end

@implementation AXFKATextFieldFocusRingShapeLayer

- (void)updateAppearance
{
  if ([(AXFKAFocusRingShapeLayer *)self kind] == 1 || ![(AXFKAFocusRingShapeLayer *)self kind])
  {
    uint64_t v4 = [(AXFKAFocusRingShapeLayer *)self tintColor];
    id v10 = (id)v4;
    if (v4)
    {
      id v2 = [(AXFKAFocusRingShapeLayer *)self bottomFocusRingColorForTintColor:v4];
      uint64_t v5 = [v2 CGColor];
    }
    else
    {
      uint64_t v5 = 0;
    }
    v6 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v6 setStrokeColor:v5];

    if (v10) {
    v7 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    }
    LODWORD(v8) = 0.25;
    [v7 setOpacity:v8];

    v9 = [(AXFKAFocusRingShapeLayer *)self bottomBorderLayer];
    [v9 setUnscaledLineWidth:3.0];

    [(AXFKAFocusRingShapeLayer *)self _updateBottomLayerPath];
  }
}

@end