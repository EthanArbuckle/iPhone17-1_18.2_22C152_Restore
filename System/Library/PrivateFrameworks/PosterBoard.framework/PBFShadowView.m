@interface PBFShadowView
- (CGAffineTransform)shadowSupplementaryTransform;
- (CGRect)frameWithContentWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (int64_t)shadowType;
- (void)_configureForShadowType;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setShadowType:(int64_t)a3;
@end

@implementation PBFShadowView

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PBFShadowView *)self shadowType] == 1)
  {
    -[UIView frameWithContentWithFrame:](self->_shadowView, "frameWithContentWithFrame:", x, y, width, height);
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGAffineTransform)shadowSupplementaryTransform
{
  CGRect result = [(PBFShadowView *)self shadowType];
  if (result == (CGAffineTransform *)2)
  {
    return CGAffineTransformMakeScale(retstr, 0.25, 0.25);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  }
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    uint64_t v5 = [(PBFShadowView *)self layer];
    [v5 setCornerRadius:a3];

    long long v6 = [(PBFShadowView *)self layer];
    [v6 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    [(PBFShadowView *)self _configureForShadowType];
  }
}

- (void)setShadowType:(int64_t)a3
{
  if (self->_shadowType != a3)
  {
    self->_shadowType = a3;
    [(PBFShadowView *)self _configureForShadowType];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PBFShadowView;
  [(PBFShadowView *)&v4 layoutSubviews];
  shadowView = self->_shadowView;
  [(PBFShadowView *)self bounds];
  -[UIView setFrame:](shadowView, "setFrame:");
}

- (void)_configureForShadowType
{
  [(UIView *)self->_shadowView removeFromSuperview];
  shadowView = self->_shadowView;
  self->_shadowView = 0;

  int64_t shadowType = self->_shadowType;
  if (shadowType == 2)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PBFShadowView *)self bounds];
    double v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
    double v12 = [(UIView *)v11 layer];
    [v12 setShadowPathIsBounds:1];
    id v13 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v12, "setShadowColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(v12, "setShadowOffset:", 0.0, self->_cornerRadius);
    [v12 setShadowRadius:self->_cornerRadius];
    LODWORD(v14) = 1041865114;
    [v12 setShadowOpacity:v14];
    [v12 setCornerRadius:self->_cornerRadius];
    [v12 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    double v15 = self->_shadowView;
    self->_shadowView = v11;
  }
  else if (shadowType == 1)
  {
    double cornerRadius = self->_cornerRadius;
    id v6 = objc_alloc(MEMORY[0x1E4F743D0]);
    double v7 = self->_cornerRadius;
    v16[0] = 1065353216;
    v16[1] = 0;
    *(double *)&v16[2] = cornerRadius;
    *(double *)&v16[3] = cornerRadius;
    double v8 = (UIView *)[v6 initWithShadowAttributes:v16 maskCornerRadius:1 continuousCorners:v7];
    double v9 = self->_shadowView;
    self->_shadowView = v8;
  }
  [(PBFShadowView *)self addSubview:self->_shadowView];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (void).cxx_destruct
{
}

@end