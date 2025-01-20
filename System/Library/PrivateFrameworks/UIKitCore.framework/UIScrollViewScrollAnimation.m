@interface UIScrollViewScrollAnimation
- (BOOL)revealsHorizontalScrollIndicator;
- (BOOL)revealsVerticalScrollIndicator;
- (float)progressForFraction:(float)a3;
- (void)adjustForContentOffsetDelta:(CGPoint)a3;
- (void)dealloc;
- (void)setProgress:(float)a3;
- (void)setRevealsHorizontalScrollIndicator:(BOOL)a3;
- (void)setRevealsVerticalScrollIndicator:(BOOL)a3;
@end

@implementation UIScrollViewScrollAnimation

- (void)adjustForContentOffsetDelta:(CGPoint)a3
{
  if (self->_adjustsForContentOffsetDelta)
  {
    CGFloat v3 = a3.y + self->_originalOffset.y;
    self->_originalOffset.x = a3.x + self->_originalOffset.x;
    self->_originalOffset.y = v3;
    CGFloat v4 = a3.y + self->_targetOffset.y;
    self->_targetOffset.x = a3.x + self->_targetOffset.x;
    self->_targetOffset.y = v4;
  }
}

- (void)setProgress:(float)a3
{
  v5 = [(UIAnimation *)self target];
  double x = self->_targetOffset.x;
  double y = self->_targetOffset.y;
  id v22 = v5;
  if (self->_targetOffsetValidAtStart)
  {
    if ([v5 _isAutomaticContentOffsetAdjustmentEnabled])
    {
      objc_msgSend(v22, "_adjustedContentOffsetForContentOffset:", x, y);
      double x = v8;
      double y = v9;
    }
    v5 = v22;
  }
  accuracdouble y = self->_accuracy;
  double v11 = self->_originalOffset.x;
  double v12 = a3;
  double v13 = (x - v11) * a3;
  if (accuracy == 1.0)
  {
    double v15 = round(v13);
    double v16 = self->_originalOffset.y;
    double v19 = round((y - v16) * v12);
  }
  else
  {
    double v14 = floor(v13);
    double v15 = v14 + round(accuracy * (v13 - v14)) / accuracy;
    double v16 = self->_originalOffset.y;
    double v17 = (y - v16) * v12;
    double v18 = floor(v17);
    double v19 = v18 + round(accuracy * (v17 - v18)) / accuracy;
  }
  double v20 = v11 + v15;
  double v21 = v16 + v19;
  [v5 _skipNextStartOffsetAdjustment];
  objc_msgSend(v22, "setContentOffset:", v20, v21);
}

- (float)progressForFraction:(float)a3
{
  float result = 1.0;
  if (a3 != 1.0)
  {
    customAnimation = self->_customAnimation;
    if (customAnimation)
    {
      v7 = [(CABasicAnimation *)customAnimation timingFunction];

      if (v7)
      {
        double v8 = [(CABasicAnimation *)self->_customAnimation timingFunction];
        *(float *)&double v9 = a3;
        [v8 _solveForInput:v9];
        a3 = v10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v12 = self->_customAnimation;
        *(float *)&double v11 = a3;
        [(CABasicAnimation *)v12 _solveForInput:v11];
      }
      else
      {
        return a3;
      }
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)UIScrollViewScrollAnimation;
      *(float *)&double v13 = a3;
      [(UIAnimation *)&v14 progressForFraction:v13];
    }
  }
  return result;
}

- (void)dealloc
{
  CGFloat v3 = [(UIAnimation *)self target];
  [v3 _clearContentOffsetAnimation:self];

  v4.receiver = self;
  v4.super_class = (Class)UIScrollViewScrollAnimation;
  [(UIScrollViewScrollAnimation *)&v4 dealloc];
}

- (BOOL)revealsHorizontalScrollIndicator
{
  return self->_revealsHorizontalScrollIndicator;
}

- (void)setRevealsHorizontalScrollIndicator:(BOOL)a3
{
  self->_revealsHorizontalScrollIndicator = a3;
}

- (BOOL)revealsVerticalScrollIndicator
{
  return self->_revealsVerticalScrollIndicator;
}

- (void)setRevealsVerticalScrollIndicator:(BOOL)a3
{
  self->_revealsVerticalScrollIndicator = a3;
}

- (void).cxx_destruct
{
}

@end