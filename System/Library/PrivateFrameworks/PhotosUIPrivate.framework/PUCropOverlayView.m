@interface PUCropOverlayView
- (BOOL)isCropGridVisible;
- (BOOL)isMaskedContentVisible;
- (BOOL)isStraightenGridVisible;
- (CGRect)cropRect;
- (CGRect)cropRectInLocalCoordinateSpace;
- (NSArray)maskViews;
- (NSArray)oneNinthCropLines;
- (NSArray)oneThirdCropLines;
- (PUCropMaskView)bottomMask;
- (PUCropMaskView)leftMask;
- (PUCropMaskView)rightMask;
- (PUCropMaskView)topMask;
- (PUCropOverlayView)initWithFrame:(CGRect)a3;
- (UIView)cropWindowView;
- (id)_addLinesSpacedForCount:(unint64_t)a3 drawFirstAndLast:(BOOL)a4 visible:(BOOL)a5;
- (id)_createConstraintsForLine:(id)a3 centerMultiplier:(double)a4 vertical:(BOOL)a5;
- (id)_createLineViewForCount:(unint64_t)a3;
- (id)_createMaskView;
- (unint64_t)_subviewIndexForLineForCount:(unint64_t)a3;
- (void)_setGridViews:(id)a3 visible:(BOOL)a4 iVarVisibilePtr:(BOOL *)a5 animated:(BOOL)a6;
- (void)_updateCropRectInLocalCoordinateSpace;
- (void)layoutSubviews;
- (void)setBottomMask:(id)a3;
- (void)setCropGridVisible:(BOOL)a3;
- (void)setCropGridVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setCropRect:(CGRect)a3;
- (void)setCropRectInLocalCoordinateSpace:(CGRect)a3;
- (void)setCropWindowView:(id)a3;
- (void)setLeftMask:(id)a3;
- (void)setMaskViews:(id)a3;
- (void)setMaskedContentVisible:(BOOL)a3;
- (void)setMaskedContentVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setOneNinthCropLines:(id)a3;
- (void)setOneThirdCropLines:(id)a3;
- (void)setRightMask:(id)a3;
- (void)setStraightenGridVisible:(BOOL)a3;
- (void)setStraightenGridVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTopMask:(id)a3;
@end

@implementation PUCropOverlayView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightMask, 0);
  objc_storeStrong((id *)&self->_leftMask, 0);
  objc_storeStrong((id *)&self->_bottomMask, 0);
  objc_storeStrong((id *)&self->_topMask, 0);
  objc_storeStrong((id *)&self->_maskViews, 0);
  objc_storeStrong((id *)&self->_oneNinthCropLines, 0);
  objc_storeStrong((id *)&self->_oneThirdCropLines, 0);
  objc_storeStrong((id *)&self->_cropWindowView, 0);
}

- (void)setRightMask:(id)a3
{
}

- (PUCropMaskView)rightMask
{
  return self->_rightMask;
}

- (void)setLeftMask:(id)a3
{
}

- (PUCropMaskView)leftMask
{
  return self->_leftMask;
}

- (void)setBottomMask:(id)a3
{
}

- (PUCropMaskView)bottomMask
{
  return self->_bottomMask;
}

- (void)setTopMask:(id)a3
{
}

- (PUCropMaskView)topMask
{
  return self->_topMask;
}

- (void)setCropRectInLocalCoordinateSpace:(CGRect)a3
{
  self->_cropRectInLocalCoordinateSpace = a3;
}

- (CGRect)cropRectInLocalCoordinateSpace
{
  double x = self->_cropRectInLocalCoordinateSpace.origin.x;
  double y = self->_cropRectInLocalCoordinateSpace.origin.y;
  double width = self->_cropRectInLocalCoordinateSpace.size.width;
  double height = self->_cropRectInLocalCoordinateSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMaskViews:(id)a3
{
}

- (NSArray)maskViews
{
  return self->_maskViews;
}

- (void)setOneNinthCropLines:(id)a3
{
}

- (void)setOneThirdCropLines:(id)a3
{
}

- (void)setCropWindowView:(id)a3
{
}

- (BOOL)isMaskedContentVisible
{
  return self->_maskedContentVisible;
}

- (BOOL)isStraightenGridVisible
{
  return self->_straightenGridVisible;
}

- (BOOL)isCropGridVisible
{
  return self->_cropGridVisible;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_createMaskView
{
  v2 = objc_alloc_init(PUCropMaskView);
  return v2;
}

- (id)_createLineViewForCount:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v5 = 0.5;
  if (a3 < 5) {
    double v5 = 1.0;
  }
  v6 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", v5);
  [v4 setBackgroundColor:v6];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v4;
}

- (id)_createConstraintsForLine:(id)a3 centerMultiplier:(double)a4 vertical:(BOOL)a5
{
  BOOL v5 = a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = _NSDictionaryOfVariableBindings(&cfstr_Lineview.isa, v7, 0);
  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  if (v5) {
    v12 = @"V:|[lineView]|";
  }
  else {
    v12 = @"V:[lineView(lineSize)]";
  }
  if (v5) {
    v13 = @"H:[lineView(lineSize)]";
  }
  else {
    v13 = @"H:|[lineView]|";
  }
  uint64_t v14 = 9;
  if (!v5) {
    uint64_t v14 = 10;
  }
  uint64_t v15 = 4;
  if (v5) {
    uint64_t v15 = 2;
  }
  uint64_t v16 = 3;
  if (v5) {
    uint64_t v16 = 1;
  }
  if (a4 == 0.0) {
    uint64_t v14 = v16;
  }
  else {
    uint64_t v16 = v15;
  }
  if (a4 == 1.0) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v14;
  }
  if (a4 == 1.0) {
    uint64_t v18 = v15;
  }
  else {
    uint64_t v18 = v16;
  }
  double v19 = 1.0 / v11;
  if (a4 == 1.0 || a4 == 0.0) {
    double v21 = 1.0;
  }
  else {
    double v21 = v19;
  }

  v33 = @"lineSize";
  v22 = [NSNumber numberWithDouble:v21];
  v34[0] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = v13;
  v26 = [v24 constraintsWithVisualFormat:v12 options:0 metrics:v23 views:v8];
  [v9 addObjectsFromArray:v26];

  v27 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v25 options:0x10000 metrics:v23 views:v8];

  [v9 addObjectsFromArray:v27];
  v28 = (void *)MEMORY[0x1E4F28DC8];
  v29 = [(PUCropOverlayView *)self cropWindowView];
  v30 = [v28 constraintWithItem:v7 attribute:v17 relatedBy:0 toItem:v29 attribute:v18 multiplier:a4 constant:0.0];

  [v9 addObject:v30];
  return v9;
}

- (id)_addLinesSpacedForCount:(unint64_t)a3 drawFirstAndLast:(BOOL)a4 visible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  unint64_t v7 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a4) {
    unint64_t v9 = a3 + 1;
  }
  else {
    unint64_t v9 = a3 - 1;
  }
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v9];
  unint64_t v27 = [(PUCropOverlayView *)self _subviewIndexForLineForCount:v7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v25 = [&unk_1F078AD90 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v25)
  {
    BOOL v11 = !v6;
    double v12 = (double)v5;
    uint64_t v24 = *(void *)v29;
    double v13 = (double)v7;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(&unk_1F078AD90);
        }
        if (v9)
        {
          unint64_t v14 = 0;
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          do
          {
            uint64_t v16 = -[PUCropOverlayView _createLineViewForCount:](self, "_createLineViewForCount:", v7, v24);
            [(PUCropOverlayView *)self cropWindowView];
            unint64_t v17 = v9;
            v19 = unint64_t v18 = v7;
            [v19 insertSubview:v16 atIndex:v27];

            [v16 setAlpha:v12];
            v20 = -[PUCropOverlayView _createConstraintsForLine:centerMultiplier:vertical:](self, "_createConstraintsForLine:centerMultiplier:vertical:", v16, [v15 BOOLValue], (double)(v11 + v14) / v13);
            double v21 = [(PUCropOverlayView *)self cropWindowView];
            [v21 addConstraints:v20];

            [v10 addObject:v16];
            unint64_t v7 = v18;
            unint64_t v9 = v17;

            ++v14;
          }
          while (v14 < v17);
        }
      }
      uint64_t v25 = [&unk_1F078AD90 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v25);
  }
  v22 = objc_msgSend(v10, "copy", v24);

  return v22;
}

- (unint64_t)_subviewIndexForLineForCount:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  v3 = [(PUCropOverlayView *)self cropWindowView];
  id v4 = [v3 subviews];
  unint64_t v5 = [v4 count];

  return v5;
}

- (NSArray)oneNinthCropLines
{
  oneNinthCropLines = self->_oneNinthCropLines;
  if (!oneNinthCropLines)
  {
    id v4 = [(PUCropOverlayView *)self _addLinesSpacedForCount:9 drawFirstAndLast:0 visible:[(PUCropOverlayView *)self isStraightenGridVisible]];
    unint64_t v5 = self->_oneNinthCropLines;
    self->_oneNinthCropLines = v4;

    oneNinthCropLines = self->_oneNinthCropLines;
  }
  BOOL v6 = oneNinthCropLines;
  return v6;
}

- (NSArray)oneThirdCropLines
{
  oneThirdCropLines = self->_oneThirdCropLines;
  if (!oneThirdCropLines)
  {
    id v4 = [(PUCropOverlayView *)self _addLinesSpacedForCount:3 drawFirstAndLast:0 visible:[(PUCropOverlayView *)self isCropGridVisible]];
    unint64_t v5 = self->_oneThirdCropLines;
    self->_oneThirdCropLines = v4;

    oneThirdCropLines = self->_oneThirdCropLines;
  }
  BOOL v6 = oneThirdCropLines;
  return v6;
}

- (UIView)cropWindowView
{
  cropWindowView = self->_cropWindowView;
  if (!cropWindowView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    unint64_t v5 = self->_cropWindowView;
    self->_cropWindowView = v4;

    -[UIView setFrame:](self->_cropWindowView, "setFrame:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    BOOL v6 = self->_cropWindowView;
    unint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v6 setBackgroundColor:v7];

    cropWindowView = self->_cropWindowView;
  }
  v8 = cropWindowView;
  return v8;
}

- (void)_setGridViews:(id)a3 visible:(BOOL)a4 iVarVisibilePtr:(BOOL *)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v9 = a3;
  v10 = v9;
  if (*a5 != v8)
  {
    *a5 = v8;
    if (v8) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __68__PUCropOverlayView__setGridViews_visible_iVarVisibilePtr_animated___block_invoke;
    unint64_t v17 = &unk_1E5F2E0A8;
    id v18 = v9;
    double v19 = v11;
    double v12 = _Block_copy(&v14);
    double v13 = v12;
    if (v6) {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v12, 0, v14, v15, v16, v17);
    }
    else {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
}

void __68__PUCropOverlayView__setGridViews_visible_iVarVisibilePtr_animated___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setStraightenGridVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PUCropOverlayView *)self oneNinthCropLines];
  [(PUCropOverlayView *)self _setGridViews:v7 visible:v5 iVarVisibilePtr:&self->_straightenGridVisible animated:v4];
}

- (void)setCropGridVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PUCropOverlayView *)self oneThirdCropLines];
  [(PUCropOverlayView *)self _setGridViews:v7 visible:v5 iVarVisibilePtr:&self->_cropGridVisible animated:v4];
}

- (void)setStraightenGridVisible:(BOOL)a3
{
}

- (void)setCropGridVisible:(BOOL)a3
{
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)PUCropOverlayView;
  [(PUCropOverlayView *)&v20 layoutSubviews];
  [(PUCropOverlayView *)self cropRectInLocalCoordinateSpace];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PUCropOverlayView *)self cropWindowView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  uint64_t v12 = [(PUCropOverlayView *)self cropWindowView];
  [v12 frame];
  double MinX = CGRectGetMinX(v21);
  [v12 frame];
  double MinY = CGRectGetMinY(v22);
  [v12 frame];
  double MaxX = CGRectGetMaxX(v23);
  [v12 frame];
  double MaxY = CGRectGetMaxY(v24);
  [(PUCropOverlayView *)self frame];
  -[PUCropMaskView setFrame:](self->_topMask, "setFrame:", 0.0, 0.0);
  [(PUCropOverlayView *)self frame];
  double v18 = v17;
  [(PUCropOverlayView *)self bounds];
  -[PUCropMaskView setFrame:](self->_bottomMask, "setFrame:", 0.0, MaxY, v18, CGRectGetMaxY(v25) - MaxY);
  [v12 frame];
  -[PUCropMaskView setFrame:](self->_leftMask, "setFrame:", 0.0, MinY, MinX);
  [(PUCropOverlayView *)self bounds];
  CGFloat v19 = CGRectGetMaxX(v26) - MaxX;
  [v12 frame];
  -[PUCropMaskView setFrame:](self->_rightMask, "setFrame:", MaxX, MinY, v19);
}

- (void)_updateCropRectInLocalCoordinateSpace
{
  id v7 = [(PUCropOverlayView *)self superview];
  [(PUCropOverlayView *)self cropRect];
  objc_msgSend(v7, "convertRect:toView:", self);
  [(PUCropOverlayView *)self setCropRectInLocalCoordinateSpace:PURoundRectToPixel(v3, v4, v5, v6)];
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_cropRect = &self->_cropRect;
  if (!CGRectEqualToRect(a3, self->_cropRect))
  {
    p_cropRect->origin.CGFloat x = x;
    p_cropRect->origin.CGFloat y = y;
    p_cropRect->size.CGFloat width = width;
    p_cropRect->size.CGFloat height = height;
    [(PUCropOverlayView *)self _updateCropRectInLocalCoordinateSpace];
    [(PUCropOverlayView *)self setNeedsLayout];
  }
}

- (void)setMaskedContentVisible:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_maskedContentVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_maskedContentVisible = a3;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    CGFloat v6 = [(PUCropOverlayView *)self maskViews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      double v10 = (double)!v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (v4)
          {
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __54__PUCropOverlayView_setMaskedContentVisible_animated___block_invoke;
            v14[3] = &unk_1E5F2E0A8;
            v14[4] = v12;
            *(double *)&v14[5] = v10;
            [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v14 completion:0];
          }
          else
          {
            double v13 = [v12 opaqueView];
            [v13 setAlpha:v10];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
  }
}

void __54__PUCropOverlayView_setMaskedContentVisible_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) opaqueView];
  [v2 setAlpha:*(double *)(a1 + 40)];
}

- (void)setMaskedContentVisible:(BOOL)a3
{
}

- (PUCropOverlayView)initWithFrame:(CGRect)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)PUCropOverlayView;
  CGFloat v3 = -[PUCropOverlayView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [(PUCropOverlayView *)v3 cropWindowView];
    uint64_t v6 = [(PUCropOverlayView *)v4 _createMaskView];
    topMask = v4->_topMask;
    v4->_topMask = (PUCropMaskView *)v6;

    uint64_t v8 = [(PUCropOverlayView *)v4 _createMaskView];
    leftMask = v4->_leftMask;
    v4->_leftMask = (PUCropMaskView *)v8;

    uint64_t v10 = [(PUCropOverlayView *)v4 _createMaskView];
    rightMask = v4->_rightMask;
    v4->_rightMask = (PUCropMaskView *)v10;

    uint64_t v12 = [(PUCropOverlayView *)v4 _createMaskView];
    bottomMask = v4->_bottomMask;
    v4->_bottomMask = (PUCropMaskView *)v12;

    v27[0] = v4->_topMask;
    v27[1] = v4->_leftMask;
    v27[2] = v4->_rightMask;
    v27[3] = v4->_bottomMask;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
    [(PUCropOverlayView *)v4 setMaskViews:v14];

    [(PUCropOverlayView *)v4 addSubview:v5];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v15 = [(PUCropOverlayView *)v4 maskViews];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          [(PUCropOverlayView *)v4 addSubview:*(void *)(*((void *)&v21 + 1) + 8 * v19++)];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v17);
    }

    [(PUCropOverlayView *)v4 setOpaque:0];
    v4->_maskedContentVisible = 1;
  }
  return v4;
}

@end