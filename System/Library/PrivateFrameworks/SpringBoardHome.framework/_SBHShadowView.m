@interface _SBHShadowView
+ (BOOL)supportsMaterialsBasedShadow;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)useMaterialBasedShadow;
- (CGRect)frameWithContentWithFrame:(CGRect)a3;
- (_SBHShadowView)initWithFrame:(CGRect)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateShadow;
- (void)layoutSubviews;
- (void)setUseMaterialBasedShadow:(BOOL)a3;
@end

@implementation _SBHShadowView

+ (BOOL)supportsMaterialsBasedShadow
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (_SBHShadowView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SBHShadowView;
  result = -[_SBHShadowView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_useMaterialBasedShadow = 1;
  }
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_SBHShadowView;
  [(_SBHShadowView *)&v6 layoutSubviews];
  shadowLayer = self->_shadowLayer;
  if (!shadowLayer)
  {
    if (self->_shadowView)
    {
      shadowLayer = 0;
    }
    else
    {
      [(_SBHShadowView *)self _updateShadow];
      shadowLayer = self->_shadowLayer;
    }
  }
  objc_super v4 = [(_SBHShadowView *)self layer];
  [v4 bounds];
  -[CALayer setFrame:](shadowLayer, "setFrame:");

  shadowView = self->_shadowView;
  [(_SBHShadowView *)self bounds];
  -[MTShadowView setFrame:](shadowView, "setFrame:");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  [(_SBHShadowView *)self _continuousCornerRadius];
  v5.receiver = self;
  v5.super_class = (Class)_SBHShadowView;
  [(_SBHShadowView *)&v5 _setContinuousCornerRadius:a3];
  [(_SBHShadowView *)self _continuousCornerRadius];
  if ((BSFloatEqualToFloat() & 1) == 0) {
    [(_SBHShadowView *)self _updateShadow];
  }
}

- (void)setUseMaterialBasedShadow:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(id)objc_opt_class() supportsMaterialsBasedShadow];
  if (self->_useMaterialBasedShadow != (v5 & v3))
  {
    self->_useMaterialBasedShadow = v5 & v3;
    [(_SBHShadowView *)self _updateShadow];
    [(_SBHShadowView *)self setNeedsLayout];
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled])
    {
      [(_SBHShadowView *)self layoutIfNeeded];
    }
  }
}

- (void)_updateShadow
{
  [(_SBHShadowView *)self _continuousCornerRadius];
  double v4 = v3;
  if (self->_useMaterialBasedShadow)
  {
    if ([(id)objc_opt_class() supportsMaterialsBasedShadow]
      && self->_useMaterialBasedShadow)
    {
      [(CALayer *)self->_shadowLayer removeFromSuperlayer];
      shadowLayer = self->_shadowLayer;
      self->_shadowLayer = 0;

      if (v4 <= 0.0) {
        return;
      }
      shadowView = self->_shadowView;
      if (shadowView)
      {
        [(MTShadowView *)shadowView maskCornerRadius];
        if (v7 == v4) {
          return;
        }
        shadowView = self->_shadowView;
      }
      [(MTShadowView *)shadowView removeFromSuperview];
      uint64_t v20 = 1065353216;
      long long v21 = xmmword_1D81E5000;
      uint64_t v22 = 0x4032000000000000;
      v8 = (MTShadowView *)[objc_alloc(MEMORY[0x1E4F743D0]) initWithShadowAttributes:&v20 maskCornerRadius:v4];
      v9 = self->_shadowView;
      self->_shadowView = v8;

      [(_SBHShadowView *)self addSubview:self->_shadowView];
    }
    else
    {
      [(CALayer *)self->_shadowLayer removeFromSuperlayer];
      v10 = self->_shadowLayer;
      self->_shadowLayer = 0;

      [(MTShadowView *)self->_shadowView removeFromSuperview];
      v11 = self->_shadowView;
      self->_shadowView = 0;
    }
  }
  else
  {
    [(MTShadowView *)self->_shadowView removeFromSuperview];
    v12 = self->_shadowView;
    self->_shadowView = 0;

    v13 = self->_shadowLayer;
    if (!v13)
    {
      v14 = [MEMORY[0x1E4F39BE8] layer];
      v15 = self->_shadowLayer;
      self->_shadowLayer = v14;

      [(CALayer *)self->_shadowLayer setShadowPathIsBounds:1];
      v16 = self->_shadowLayer;
      id v17 = [MEMORY[0x1E4FB1618] blackColor];
      -[CALayer setShadowColor:](v16, "setShadowColor:", [v17 CGColor]);

      -[CALayer setShadowOffset:](self->_shadowLayer, "setShadowOffset:", 0.0, 18.0);
      [(CALayer *)self->_shadowLayer setShadowRadius:18.0];
      LODWORD(v18) = 0.25;
      [(CALayer *)self->_shadowLayer setShadowOpacity:v18];
      [(CALayer *)self->_shadowLayer setCornerCurve:*MEMORY[0x1E4F39EA8]];
      v19 = [(_SBHShadowView *)self layer];
      [v19 addSublayer:self->_shadowLayer];

      v13 = self->_shadowLayer;
    }
    [(CALayer *)v13 setCornerRadius:v4];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"zPosition"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBHShadowView;
    BOOL v5 = [(_SBHShadowView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_useMaterialBasedShadow)
  {
    shadowView = self->_shadowView;
    if (!shadowView)
    {
      [(_SBHShadowView *)self _updateShadow];
      [(_SBHShadowView *)self setNeedsLayout];
      shadowView = self->_shadowView;
    }
    -[MTShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:", x, y, width, height);
    double x = v9;
    double y = v10;
    double width = v11;
    double height = v12;
    -[MTShadowView setFrame:](self->_shadowView, "setFrame:");
  }
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)useMaterialBasedShadow
{
  return self->_useMaterialBasedShadow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end