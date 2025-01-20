@interface PUParallaxComputer
- (CGPoint)contentParallaxOffsetForViewFrame:(CGRect)a3 visibleRect:(CGRect)a4;
- (double)parallaxFactor;
- (int64_t)model;
- (unint64_t)axis;
- (void)setAxis:(unint64_t)a3;
- (void)setModel:(int64_t)a3;
- (void)setParallaxFactor:(double)a3;
@end

@implementation PUParallaxComputer

- (void)setAxis:(unint64_t)a3
{
  self->_axis = a3;
}

- (unint64_t)axis
{
  return self->_axis;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setModel:(int64_t)a3
{
  self->_model = a3;
}

- (int64_t)model
{
  return self->_model;
}

- (CGPoint)contentParallaxOffsetForViewFrame:(CGRect)a3 visibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  if (CGRectIntersectsRect(a3, a4))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PUParallaxComputer_contentParallaxOffsetForViewFrame_visibleRect___block_invoke;
    aBlock[3] = &unk_1E5F28858;
    aBlock[4] = self;
    v13 = (double (**)(void, double, double, double, double))_Block_copy(aBlock);
    v14 = (double *)MEMORY[0x1E4F1DAD8];
    char v15 = [(PUParallaxComputer *)self axis];
    char v16 = v15;
    CGFloat v30 = height;
    if (v15)
    {
      v37.origin.CGFloat x = v11;
      v37.origin.CGFloat y = v10;
      v37.size.CGFloat width = v9;
      v37.size.CGFloat height = v8;
      double MinX = CGRectGetMinX(v37);
      v38.origin.CGFloat x = v11;
      v38.origin.CGFloat y = v10;
      v38.size.CGFloat width = v9;
      v38.size.CGFloat height = v8;
      double MaxX = CGRectGetMaxX(v38);
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      CGFloat v22 = CGRectGetMinX(v39);
      v40.size.CGFloat height = height;
      double v23 = v22;
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      CGFloat v24 = CGRectGetMaxX(v40);
      double v17 = v13[2](v13, MinX, MaxX, v23, v24);
      if ((v16 & 2) != 0) {
        goto LABEL_4;
      }
    }
    else
    {
      double v17 = *v14;
      if ((v15 & 2) != 0)
      {
LABEL_4:
        v33.origin.CGFloat x = v11;
        v33.origin.CGFloat y = v10;
        v33.size.CGFloat width = v9;
        v33.size.CGFloat height = v8;
        double MinY = CGRectGetMinY(v33);
        v34.origin.CGFloat x = v11;
        v34.origin.CGFloat y = v10;
        v34.size.CGFloat width = v9;
        v34.size.CGFloat height = v8;
        double MaxY = CGRectGetMaxY(v34);
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = v30;
        double v19 = CGRectGetMinY(v35);
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = v30;
        CGFloat v20 = CGRectGetMaxY(v36);
        double v21 = v13[2](v13, MinY, MaxY, v19, v20);
LABEL_8:

        goto LABEL_9;
      }
    }
    double v21 = v14[1];
    goto LABEL_8;
  }
  double v17 = *MEMORY[0x1E4F1DAD8];
  double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
LABEL_9:
  double v25 = v17;
  double v26 = v21;
  result.CGFloat y = v26;
  result.CGFloat x = v25;
  return result;
}

unint64_t __68__PUParallaxComputer_contentParallaxOffsetForViewFrame_visibleRect___block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) model];
  if (result < 2) {
    return [*(id *)(a1 + 32) parallaxFactor];
  }
  return result;
}

@end