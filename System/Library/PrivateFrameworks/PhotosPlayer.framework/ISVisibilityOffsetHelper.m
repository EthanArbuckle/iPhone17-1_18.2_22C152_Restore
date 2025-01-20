@interface ISVisibilityOffsetHelper
- (CGPoint)_targetContentOffset;
- (CGRect)boundsForView:(id)a3 inScrollView:(id)a4;
- (CGRect)visibleRectForScrollView:(id)a3;
- (ISVisibilityRange)_visibilityRangeForRect:(CGRect)a3;
- (UIScrollView)_scrollView;
- (double)maximumDistance;
- (double)maximumDistanceLag;
- (int64_t)direction;
- (void)_setScrollView:(id)a3;
- (void)_setTargetContentOffset:(CGPoint)a3;
- (void)_updateDirectionIfNeeded;
- (void)computeVisibilityOffsetsInScrollView:(id)a3 withTargetContentOffset:(CGPoint)a4 usingBlock:(id)a5;
- (void)getVisibility:(BOOL *)a3 offset:(double *)a4 targetVisibilityOffset:(double *)a5 forView:(id)a6;
- (void)setDirection:(int64_t)a3;
- (void)setMaximumDistance:(double)a3;
- (void)setMaximumDistanceLag:(double)a3;
@end

@implementation ISVisibilityOffsetHelper

- (void)_setScrollView:(id)a3
{
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIScrollView)_scrollView
{
  return self->__scrollView;
}

- (void)_setTargetContentOffset:(CGPoint)a3
{
  self->__targetContentOffset = a3;
}

- (void).cxx_destruct
{
}

- (CGPoint)_targetContentOffset
{
  double x = self->__targetContentOffset.x;
  double y = self->__targetContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMaximumDistanceLag:(double)a3
{
  self->_maximumDistanceLag = a3;
}

- (double)maximumDistanceLag
{
  return self->_maximumDistanceLag;
}

- (void)setMaximumDistance:(double)a3
{
  self->_maximumDistance = a3;
}

- (double)maximumDistance
{
  return self->_maximumDistance;
}

- (void)getVisibility:(BOOL *)a3 offset:(double *)a4 targetVisibilityOffset:(double *)a5 forView:(id)a6
{
  id v10 = a6;
  v11 = [(ISVisibilityOffsetHelper *)self _scrollView];
  if (![v10 isDescendantOfView:v11])
  {
    BOOL v38 = 0;
    double v41 = 0.0;
    double v40 = 0.0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(ISVisibilityOffsetHelper *)self visibleRectForScrollView:v11];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(ISVisibilityOffsetHelper *)self _targetContentOffset];
  double v21 = v20;
  double v23 = v22;
  -[ISVisibilityOffsetHelper _visibilityRangeForRect:](self, "_visibilityRangeForRect:", v13, v15, v17, v19);
  double v46 = v25;
  double v47 = v24;
  -[ISVisibilityOffsetHelper _visibilityRangeForRect:](self, "_visibilityRangeForRect:", v21, v23, v17, v19);
  double v44 = v27;
  double v45 = v26;
  [(ISVisibilityOffsetHelper *)self boundsForView:v10 inScrollView:v11];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  -[ISVisibilityOffsetHelper _visibilityRangeForRect:](self, "_visibilityRangeForRect:");
  uint64_t v42 = v37;
  uint64_t v43 = v36;
  v49.origin.double x = v29;
  v49.origin.double y = v31;
  v49.size.width = v33;
  v49.size.height = v35;
  v50.origin.double x = v13;
  v50.origin.double y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  BOOL v38 = CGRectIntersectsRect(v49, v50);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __80__ISVisibilityOffsetHelper_getVisibility_offset_targetVisibilityOffset_forView___block_invoke;
  v48[3] = &unk_1E6BECCB8;
  v48[4] = self;
  v48[5] = v43;
  v48[6] = v42;
  v39 = (double (**)(double, double))MEMORY[0x1E018D1E0](v48);
  double v40 = v39[2](v47, v46);
  double v41 = ((double (*)(double (**)(double, double), double, double))v39[2])(v39, v45, v44);

  if (a3) {
LABEL_5:
  }
    *a3 = v38;
LABEL_6:
  if (a4) {
    *a4 = v40;
  }
  if (a5) {
    *a5 = v41;
  }
}

uint64_t __80__ISVisibilityOffsetHelper_getVisibility_offset_targetVisibilityOffset_forView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) maximumDistanceLag];
}

- (CGRect)boundsForView:(id)a3 inScrollView:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)visibleRectForScrollView:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (ISVisibilityRange)_visibilityRangeForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  switch([(ISVisibilityOffsetHelper *)self direction])
  {
    case 2:
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v13);
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v14);
      goto LABEL_5;
    case 3:
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      double MinX = CGRectGetMinY(v15);
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      double MaxX = CGRectGetMaxY(v16);
LABEL_5:
      double v9 = MaxX;
      break;
    case 4:
      v17.origin.CGFloat x = x;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double MinX = -CGRectGetMaxX(v17);
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      double MinY = CGRectGetMinX(v18);
      goto LABEL_8;
    case 5:
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      double MinX = -CGRectGetMaxY(v19);
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v20);
LABEL_8:
      double v9 = -MinY;
      break;
    default:
      double v9 = 0.0;
      double MinX = 0.0;
      break;
  }
  double v11 = MinX;
  result.var1 = v9;
  result.var0 = v11;
  return result;
}

- (void)_updateDirectionIfNeeded
{
  if ([(ISVisibilityOffsetHelper *)self direction] == 1)
  {
    id v7 = [(ISVisibilityOffsetHelper *)self _scrollView];
    [v7 contentSize];
    double v4 = v3;
    [v7 bounds];
    if (v4 >= v5) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 3;
    }
    [(ISVisibilityOffsetHelper *)self setDirection:v6];
  }
}

- (void)computeVisibilityOffsetsInScrollView:(id)a3 withTargetContentOffset:(CGPoint)a4 usingBlock:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v9 = (void (**)(id, ISVisibilityOffsetHelper *))a5;
  [(ISVisibilityOffsetHelper *)self _setScrollView:a3];
  -[ISVisibilityOffsetHelper _setTargetContentOffset:](self, "_setTargetContentOffset:", x, y);
  [(ISVisibilityOffsetHelper *)self _updateDirectionIfNeeded];
  v9[2](v9, self);

  [(ISVisibilityOffsetHelper *)self _setScrollView:0];
}

@end