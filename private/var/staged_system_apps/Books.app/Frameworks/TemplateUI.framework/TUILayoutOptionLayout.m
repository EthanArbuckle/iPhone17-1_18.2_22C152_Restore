@interface TUILayoutOptionLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (TUILayoutOptionLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (double)computedScale;
- (double)scale;
- (void)computeLayout;
- (void)setScale:(double)a3;
@end

@implementation TUILayoutOptionLayout

- (TUILayoutOptionLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TUILayoutOptionLayout;
  result = [(TUILayout *)&v6 initWithModel:a3 parent:a4 controller:a5];
  if (result) {
    result->_scale = 1.0;
  }
  return result;
}

- (double)computedScale
{
  v5.receiver = self;
  v5.super_class = (Class)TUILayoutOptionLayout;
  [(TUILayout *)&v5 computedScale];
  return v3 * self->_scale;
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(TUILayout *)self onComputedScaleDidChange];
  }
}

- (void)computeLayout
{
  double v3 = [(TUILayout *)self children];
  id v4 = [v3 firstObject];

  [(TUILayout *)self containingWidth];
  [v4 setContainingWidth:];
  [(TUILayout *)self containingHeight];
  [v4 setContainingHeight:];
  [(TUILayout *)self flexedWidth];
  [v4 setFlexedWidth:];
  [(TUILayout *)self flexedHeight];
  [v4 setFlexedHeight:];
  [v4 validateLayout];
  [v4 setComputedOrigin:CGPointZero.x, CGPointZero.y];
  [v4 computedTransformedSize];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  double v3 = [(TUILayout *)self children];
  id v4 = [v3 firstObject];

  objc_super v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 validatedIntrinsicWidthConsideringSpecified];
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  double v3 = [(TUILayout *)self children];
  id v4 = [v3 firstObject];

  objc_super v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 validatedIntrinsicHeightConsideringSpecified];
  return v5;
}

- (double)scale
{
  return self->_scale;
}

@end