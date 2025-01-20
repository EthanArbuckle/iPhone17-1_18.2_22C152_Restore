@interface NTKCurvedPickerView
- (BOOL)interior;
- (CGAffineTransform)_transformForAngle:(SEL)a3;
- (CGPoint)circleCenter;
- (NTKCurvedPickerView)init;
- (double)_alphaForIndex:(unint64_t)a3;
- (double)_angleForIndex:(unint64_t)a3;
- (double)centerAngle;
- (double)circleRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)viewForSideAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSides;
- (unint64_t)numberOfVisibleSides;
- (void)_setCurrentFraction:(double)a3;
- (void)enumerateSideViewsWithBlock:(id)a3;
- (void)layoutSubviews;
- (void)setCircleRadius:(double)a3 centerAngle:(double)a4 circleCenter:(CGPoint)a5 interior:(BOOL)a6;
- (void)setView:(id)a3 forSideAtIndex:(unint64_t)a4;
- (void)transitionToFraction:(double)a3 fromSideAtIndex:(unint64_t)a4 toSideAtIndex:(unint64_t)a5;
- (void)transitionToSideAtIndex:(unint64_t)a3;
@end

@implementation NTKCurvedPickerView

- (NTKCurvedPickerView)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCurvedPickerView;
  v2 = [(NTKCurvedPickerView *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sideViews = v2->_sideViews;
    v2->_sideViews = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setCircleRadius:(double)a3 centerAngle:(double)a4 circleCenter:(CGPoint)a5 interior:(BOOL)a6
{
  self->_circleRadius = a3;
  self->_centerAngle = a4;
  self->_interior = a6;
  self->_circleCenter = a5;
  [(NTKCurvedPickerView *)self setNeedsLayout];
}

- (unint64_t)numberOfSides
{
  return 3;
}

- (unint64_t)numberOfVisibleSides
{
  return 1;
}

- (void)setView:(id)a3 forSideAtIndex:(unint64_t)a4
{
  id v8 = a3;
  objc_super v6 = [NSNumber numberWithUnsignedInteger:a4];
  id v7 = [(NSMutableDictionary *)self->_sideViews objectForKeyedSubscript:v6];
  if (v7 != v8)
  {
    [v7 removeFromSuperview];
    if (v8) {
      [(NTKCurvedPickerView *)self addSubview:v8];
    }
    [(NSMutableDictionary *)self->_sideViews setObject:v8 forKeyedSubscript:v6];
  }
}

- (id)viewForSideAtIndex:(unint64_t)a3
{
  sideViews = self->_sideViews;
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(NSMutableDictionary *)sideViews objectForKeyedSubscript:v4];

  return v5;
}

- (void)enumerateSideViewsWithBlock:(id)a3
{
  v4 = (void (**)(id, unint64_t, void *, unsigned char *))a3;
  unsigned __int8 v10 = 0;
  [(NTKCurvedPickerView *)self numberOfSides];
  unint64_t v5 = 0;
  do
  {
    sideViews = self->_sideViews;
    id v7 = [NSNumber numberWithUnsignedInteger:v5];
    id v8 = [(NSMutableDictionary *)sideViews objectForKeyedSubscript:v7];

    if (v8) {
      v4[2](v4, v5, v8, &v10);
    }
    int v9 = v10;

    if (v9) {
      break;
    }
    ++v5;
  }
  while (v5 <= [(NTKCurvedPickerView *)self numberOfSides]);
}

- (void)transitionToSideAtIndex:(unint64_t)a3
{
  self->_activeSide = a3;
  self->_transitioningSide = a3;
  [(NTKCurvedPickerView *)self _setCurrentFraction:0.0];
}

- (void)transitionToFraction:(double)a3 fromSideAtIndex:(unint64_t)a4 toSideAtIndex:(unint64_t)a5
{
  self->_activeSide = a4;
  self->_transitioningSide = a5;
  [(NTKCurvedPickerView *)self _setCurrentFraction:a3];
}

- (void)_setCurrentFraction:(double)a3
{
  unint64_t v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  *(float *)&double v6 = a3;
  [v5 _solveForInput:v6];
  self->_currentFraction = v7;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__NTKCurvedPickerView__setCurrentFraction___block_invoke;
  v8[3] = &unk_1E62C9410;
  v8[4] = self;
  [(NTKCurvedPickerView *)self enumerateSideViewsWithBlock:v8];
}

void __43__NTKCurvedPickerView__setCurrentFraction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _angleForIndex:a2];
  if (v5)
  {
    objc_msgSend(v5, "_transformForAngle:");
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v8 = 0u;
  }
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  [v6 setTransform:v7];
  [*(id *)(a1 + 32) _alphaForIndex:a2];
  objc_msgSend(v6, "setAlpha:");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCurvedPickerView;
  -[NTKCurvedPickerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  unint64_t v5 = (NTKCurvedPickerView *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    unint64_t v5 = 0;
  }
  float v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)NTKCurvedPickerView;
  [(NTKCurvedPickerView *)&v21 layoutSubviews];
  [(NTKCurvedPickerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTKCurvedPickerView *)self maskView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[NTKCurvedPickerView convertPoint:fromView:](self, "convertPoint:fromView:", 0, self->_circleCenter.x, self->_circleCenter.y);
  double v13 = v12;
  double v15 = v14;
  double circleRadius = self->_circleRadius;
  __double2 v17 = __sincos_stret(dbl_1BC8A2510[!self->_interior] - self->_centerAngle);
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  double v18 = (v13 + circleRadius * v17.__cosval) / CGRectGetWidth(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  CGFloat Height = CGRectGetHeight(v23);
  v20[1] = 3221225472;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[2] = __37__NTKCurvedPickerView_layoutSubviews__block_invoke;
  v20[3] = &unk_1E62C8BF0;
  *(double *)&v20[5] = v18;
  *(double *)&v20[6] = (v15 + circleRadius * v17.__sinval) / Height;
  *(double *)&v20[7] = v4;
  *(double *)&v20[8] = v6;
  *(double *)&v20[9] = v8;
  *(double *)&v20[10] = v10;
  v20[4] = self;
  [(NTKCurvedPickerView *)self enumerateSideViewsWithBlock:v20];
}

void __37__NTKCurvedPickerView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 48);
  double v8 = [v5 layer];
  objc_msgSend(v8, "setAnchorPoint:", v6, v7);

  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v17[0] = *MEMORY[0x1E4F1DAB8];
  v17[1] = v9;
  v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v5 setTransform:v17];
  objc_msgSend(v5, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  [*(id *)(a1 + 32) _angleForIndex:a2];
  double v11 = v10;
  double v12 = *(void **)(a1 + 32);
  if (v12)
  {
    [v12 _transformForAngle:v10];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  [v5 setTransform:v13];
  [*(id *)(a1 + 32) _alphaForIndex:a2];
  objc_msgSend(v5, "setAlpha:");
  if (objc_opt_respondsToSelector()) {
    [v5 setCurvedAngle:-v11];
  }
}

- (CGAffineTransform)_transformForAngle:(SEL)a3
{
  [(NTKCurvedPickerView *)self bounds];
  result = (CGAffineTransform *)CGRectIsEmpty(v19);
  if (result)
  {
    uint64_t v8 = MEMORY[0x1E4F1DAB8];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v9;
    long long v10 = *(_OWORD *)(v8 + 32);
  }
  else
  {
    double circleRadius = self->_circleRadius;
    __double2 v12 = __sincos_stret(dbl_1BC8A2510[!self->_interior] - self->_centerAngle);
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransformMakeTranslation(retstr, -(circleRadius * v12.__cosval), -(circleRadius * v12.__sinval));
    long long v13 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v17.c = v13;
    *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v18, &v17, a4);
    long long v14 = *(_OWORD *)&v18.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
    *(_OWORD *)&retstr->c = v14;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v18.tx;
    long long v15 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v17.c = v15;
    *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v18, &v17, circleRadius * v12.__cosval, circleRadius * v12.__sinval);
    long long v16 = *(_OWORD *)&v18.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
    *(_OWORD *)&retstr->c = v16;
    long long v10 = *(_OWORD *)&v18.tx;
  }
  *(_OWORD *)&retstr->tx = v10;
  return result;
}

- (double)_angleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(NTKCurvedPickerView *)self numberOfSides];
  unint64_t activeSide = self->_activeSide;
  double v7 = self->_circleRadius + self->_circleRadius;
  [(NTKCurvedPickerView *)self bounds];
  double Width = CGRectGetWidth(v16);
  double v9 = fabs(Width);
  double v10 = 0.0;
  if (fabs(v7) >= 0.00000011920929 && v9 >= 0.00000011920929)
  {
    if (v5 >= 0) {
      uint64_t v12 = v5;
    }
    else {
      uint64_t v12 = v5 + 1;
    }
    int64_t v13 = (v5 - a3 + (v12 >> 1) + activeSide) % v5 - (v12 >> 1);
    long double v14 = asin(Width / v7);
    return (v14 + v14) * (self->_currentFraction + (double)v13);
  }
  return v10;
}

- (double)_alphaForIndex:(unint64_t)a3
{
  if (self->_activeSide == a3) {
    return 1.0 - self->_currentFraction;
  }
  double result = 0.0;
  if (self->_transitioningSide == a3) {
    return self->_currentFraction;
  }
  return result;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (BOOL)interior
{
  return self->_interior;
}

- (CGPoint)circleCenter
{
  double x = self->_circleCenter.x;
  double y = self->_circleCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end