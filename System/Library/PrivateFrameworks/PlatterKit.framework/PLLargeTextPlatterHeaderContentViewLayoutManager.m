@interface PLLargeTextPlatterHeaderContentViewLayoutManager
+ (double)contentBaselineToBoundsBottomWithFont:(id)a3 boundsWidth:(double)a4 scale:(double)a5;
- (CGRect)_dateLabelBoundsThatFitsWidth:(double)a3;
- (CGRect)_titleLabelBoundsThatFitsWidth:(double)a3;
- (CGSize)_boundingRectSizeForLabel:(id)a3 width:(double)a4 numberOfLines:(unint64_t *)a5;
- (CGSize)_utilityViewSizeThatFitsWidth:(double)a3;
- (double)_dateLabelBaselineOffset;
- (double)_largeTextLabelBaselineOffsetFromBottom;
- (double)_largeTextUtilityLabelBaselineOffset;
- (double)_titleLabelBaselineOffset;
- (double)contentBaseline;
- (double)headerHeightForWidth:(double)a3;
- (id)_dateLabelFont;
- (unint64_t)_titleLabelNumberOfLinesThatFitsWidth:(double)a3;
- (void)_updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:(double)a3;
- (void)invalidateCachedSizeInfo;
- (void)layoutDateLabelWithScale:(double)a3;
- (void)layoutIconButtonsWithScale:(double)a3;
- (void)layoutTitleLabelWithTrailingXLimit:(double)a3 scale:(double)a4;
- (void)layoutUtilityButtonWithScale:(double)a3;
@end

@implementation PLLargeTextPlatterHeaderContentViewLayoutManager

+ (double)contentBaselineToBoundsBottomWithFont:(id)a3 boundsWidth:(double)a4 scale:(double)a5
{
  [a3 _scaledValueForValue:6.5];
  UIRoundToScale();
  return result;
}

- (double)headerHeightForWidth:(double)a3
{
  if (a3 <= 0.0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PLLargeTextPlatterHeaderContentViewLayoutManager;
    -[PLPlatterHeaderContentViewLayoutManager headerHeightForWidth:](&v10, sel_headerHeightForWidth_);
  }
  else
  {
    -[PLPlatterHeaderContentViewLayoutManager _measuringSizeForWidth:](self, "_measuringSizeForWidth:");
    double v5 = v4;
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBoundsThatFitsWidth:](self, "_titleLabelBoundsThatFitsWidth:");
    CGRectGetHeight(v11);
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _dateLabelBoundsThatFitsWidth:v5];
    CGRectGetHeight(v12);
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _largeTextLabelBaselineOffsetFromBottom];
    v6 = [MEMORY[0x1E4F42D90] mainScreen];
    [v6 scale];
    UIRoundToScale();
    double v8 = v7;

    return v8;
  }
  return result;
}

- (double)contentBaseline
{
  v3 = [(PLPlatterHeaderContentViewLayoutManager *)self _date];

  if (v3)
  {
    uint64_t v4 = [(PLPlatterHeaderContentViewLayoutManager *)self _dateLabel];
    goto LABEL_8;
  }
  double v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  [v5 alpha];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    uint64_t v4 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
LABEL_8:
    v14 = (void *)v4;
    if (v4) {
      goto LABEL_9;
    }
    return 0.0;
  }
  double v8 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  v9 = [v8 titleLabel];
  objc_super v10 = [v9 text];
  uint64_t v11 = [v10 length];

  CGRect v12 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  v13 = v12;
  if (!v11)
  {
    v17 = [v12 imageForState:0];

    if (v17)
    {
      v14 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
      [v14 frame];
      double MaxY = CGRectGetMaxY(v19);
      goto LABEL_10;
    }
    return 0.0;
  }
  v14 = [v12 titleLabel];

  if (!v14) {
    return 0.0;
  }
LABEL_9:
  [v14 _lastLineBaselineFrameOriginY];
LABEL_10:
  double v16 = MaxY;

  return v16;
}

- (void)layoutIconButtonsWithScale:(double)a3
{
  id v32 = [(PLPlatterHeaderContentViewLayoutManager *)self _iconButtons];
  uint64_t v4 = [v32 count];
  if (v4)
  {
    uint64_t v5 = v4;
    double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self headerContentView];
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v34.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v34.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v34.size.width = 44.0;
    v34.size.height = 44.0;
    double v15 = (CGRectGetWidth(v34) + -20.0) * 0.5;
    BOOL v16 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
    double v17 = 10.0;
    if (v16)
    {
      v35.origin.x = v8;
      v35.origin.y = v10;
      v35.size.width = v12;
      v35.size.height = v14;
      double v17 = CGRectGetWidth(v35) + -10.0 + -20.0;
    }
    double v18 = v17 - v15;
    CGRect v19 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
    v20 = [v19 font];
    [v20 capHeight];
    double v22 = v21;

    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    double v24 = v23 + v22 * -0.5 + -10.0 - v15;
    BOOL v25 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
    for (unint64_t i = 0; i != v5; ++i)
    {
      v27 = [v32 objectAtIndex:i];
      UIRectIntegralWithScale();
      objc_msgSend(v27, "setFrame:");
      if (i < v5 - 1)
      {
        double v28 = v18;
        double v29 = v24;
        uint64_t v30 = 0x4046000000000000;
        uint64_t v31 = 0x4046000000000000;
        if (v25) {
          double v18 = CGRectGetMinX(*(CGRect *)&v28) + -10.0 + -20.0;
        }
        else {
          double v18 = CGRectGetMaxX(*(CGRect *)&v28) + 10.0 + -v15 * 2.0;
        }
      }
    }
  }
}

- (void)layoutTitleLabelWithTrailingXLimit:(double)a3 scale:(double)a4
{
  uint64_t v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
  if (v5)
  {
    id v24 = v5;
    double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self headerContentView];
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v26.origin.x = v8;
    v26.origin.y = v10;
    v26.size.width = v12;
    v26.size.height = v14;
    [(PLPlatterHeaderContentViewLayoutManager *)self _measuringSizeForWidth:CGRectGetWidth(v26)];
    -[PLLargeTextPlatterHeaderContentViewLayoutManager _titleLabelBoundsThatFitsWidth:](self, "_titleLabelBoundsThatFitsWidth:");
    objc_msgSend(v24, "setBounds:");
    [v24 frame];
    CGFloat v16 = v15;
    CGFloat rect = v17;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    double v22 = [(PLPlatterHeaderContentViewLayoutManager *)self _iconButtons];
    [v22 count];

    if ([(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection])
    {
      v27.origin.x = v8;
      v27.origin.y = v10;
      v27.size.width = v12;
      v27.size.height = v14;
      CGRectGetWidth(v27);
      v28.origin.x = v16;
      v28.origin.y = rect;
      v28.size.width = v19;
      v28.size.height = v21;
      CGRectGetWidth(v28);
    }
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    [v24 _firstLineBaselineOffsetFromBoundsTop];
    UIRectIntegralWithScale();
    objc_msgSend(v24, "setFrame:");
    uint64_t v5 = v24;
  }
}

- (void)layoutUtilityButtonWithScale:(double)a3
{
  uint64_t v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityView];
  if (!v5)
  {
    uint64_t v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
    if (!v5) {
      return;
    }
  }
  double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self headerContentView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v45.origin.x = v8;
  v45.origin.y = v10;
  v45.size.width = v12;
  v45.size.height = v14;
  [(PLPlatterHeaderContentViewLayoutManager *)self _measuringSizeForWidth:CGRectGetWidth(v45)];
  -[PLLargeTextPlatterHeaderContentViewLayoutManager _utilityViewSizeThatFitsWidth:](self, "_utilityViewSizeThatFitsWidth:");
  double v38 = a3;
  UISizeRoundToScale();
  BSRectWithSize();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  objc_msgSend(v5, "setBounds:");
  double v23 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  if (v5 == v23)
  {
    BOOL v25 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
    CGRect v26 = [v25 titleLabel];
    CGRect v27 = [v26 text];
    uint64_t v28 = [v27 length];

    if (v28)
    {
      double v29 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v40 = MEMORY[0x1E4F143A8];
      uint64_t v41 = 3221225472;
      v42 = __81__PLLargeTextPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke;
      v43 = &unk_1E6B5F800;
      id v44 = v5;
      [v29 performWithoutAnimation:&v40];

      int v24 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  int v24 = 0;
LABEL_8:
  if ([(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection])
  {
    v46.origin.x = v16;
    v46.origin.y = v18;
    v46.size.width = v20;
    v46.size.height = v22;
    double MinX = CGRectGetMinX(v46);
    double v31 = 7.0;
  }
  else
  {
    v47.origin.x = v8;
    v47.origin.y = v10;
    v47.size.width = v12;
    v47.size.height = v14;
    double Width = CGRectGetWidth(v47);
    v48.origin.x = v16;
    v48.origin.y = v18;
    v48.size.width = v20;
    v48.size.height = v22;
    double MinX = Width - CGRectGetMaxX(v48);
    double v31 = -7.0;
  }
  double v33 = MinX + v31;
  [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self layoutTitleLabelWithTrailingXLimit:0.0 scale:v39];
  CGRect v34 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
  [v34 _lastLineBaselineFrameOriginY];
  if (v24)
  {
    CGRect v35 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
    v36 = [v35 titleLabel];
    [v36 _firstLineBaselineOffsetFromBoundsTop];
  }
  else
  {
    v37 = [v34 font];
    [v37 capHeight];

    v49.origin.x = v33;
    v49.origin.y = v18;
    v49.size.width = v20;
    v49.size.height = v22;
    CGRectGetHeight(v49);
  }
  UIRectIntegralWithScale();
  objc_msgSend(v5, "setFrame:");
}

uint64_t __81__PLLargeTextPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)layoutDateLabelWithScale:(double)a3
{
  uint64_t v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _dateLabel];
  if (!v5) {
    goto LABEL_12;
  }
  id v36 = v5;
  double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self headerContentView];
  [v6 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  BOOL v15 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
  CGFloat v32 = v10;
  CGFloat v34 = v8;
  v38.origin.x = v8;
  v38.origin.y = v10;
  v38.size.width = v12;
  v38.size.height = v14;
  [(PLPlatterHeaderContentViewLayoutManager *)self _measuringSizeForWidth:CGRectGetWidth(v38)];
  -[PLLargeTextPlatterHeaderContentViewLayoutManager _dateLabelBoundsThatFitsWidth:](self, "_dateLabelBoundsThatFitsWidth:");
  objc_msgSend(v36, "setBounds:");
  [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self layoutTitleLabelWithTrailingXLimit:0.0 scale:a3];
  CGFloat v16 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
  [v16 _lastLineBaselineFrameOriginY];

  double v17 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  CGFloat v18 = [v17 titleLabel];
  double v19 = [v18 text];
  if ([v19 length])
  {
    char v20 = [v17 isHidden];

    if (v20) {
      goto LABEL_9;
    }
LABEL_7:
    objc_msgSend(v17, "frame", *(void *)&v10, *(void *)&v8);
    CGRectGetWidth(v39);
    goto LABEL_9;
  }
  uint64_t v21 = [v17 currentImage];
  if (!v21)
  {

    goto LABEL_9;
  }
  CGFloat v22 = (void *)v21;
  char v23 = [v17 isHidden];

  if ((v23 & 1) == 0) {
    goto LABEL_7;
  }
LABEL_9:
  objc_msgSend(v36, "frame", *(void *)&v32, *(void *)&v34);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  if (v15)
  {
    CGFloat v30 = v24;
    CGFloat v31 = v25;
    v40.origin.y = v33;
    v40.origin.x = v35;
    v40.size.width = v12;
    v40.size.height = v14;
    CGRectGetWidth(v40);
    v41.origin.x = v30;
    v41.origin.y = v31;
    v41.size.width = v27;
    v41.size.height = v29;
    CGRectGetWidth(v41);
  }
  [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _dateLabelBaselineOffset];
  [v36 _firstLineBaselineOffsetFromBoundsTop];
  UIRectIntegralWithScale();
  objc_msgSend(v36, "setFrame:");

  uint64_t v5 = v36;
LABEL_12:
}

- (double)_titleLabelBaselineOffset
{
  v2 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
  v3 = [v2 font];
  [v3 _scaledValueForValue:16.5];
  double v5 = v4;

  return v5;
}

- (id)_dateLabelFont
{
  v2 = [(PLPlatterHeaderContentViewLayoutManager *)self headerContentView];
  v3 = [v2 _dateLabelFont];

  return v3;
}

- (void)invalidateCachedSizeInfo
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D93DD000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Invalidating cached size info", (uint8_t *)&v2, 0xCu);
}

- (CGSize)_boundingRectSizeForLabel:(id)a3 width:(double)a4 numberOfLines:(unint64_t *)a5
{
  id v8 = a3;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v8 && a4 != 0.0)
  {
    if (!self->_drawingContext)
    {
      double v11 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x1E4F42688]);
      drawingContext = self->_drawingContext;
      self->_drawingContext = v11;

      [(NSStringDrawingContext *)self->_drawingContext setWantsNumberOfLineFragments:1];
    }
    double v13 = [v8 attributedText];
    objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, self->_drawingContext, a4, 1.79769313e308);
    double v9 = v14;
    double v10 = v15;

    if (a5) {
      *a5 = [(NSStringDrawingContext *)self->_drawingContext numberOfLineFragments];
    }
  }

  double v16 = v9;
  double v17 = v10;
  result.height = v17;
  result.width = v16;
  return result;
}

- (double)_largeTextUtilityLabelBaselineOffset
{
  int v2 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  uint64_t v3 = [v2 titleLabel];
  uint64_t v4 = [v3 font];
  [v4 _scaledValueForValue:16.5];
  double v6 = v5;

  return v6;
}

- (double)_largeTextLabelBaselineOffsetFromBottom
{
  int v2 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
  uint64_t v3 = [v2 font];
  [v3 _scaledValueForValue:6.5];
  double v5 = v4;

  return v5;
}

- (double)_dateLabelBaselineOffset
{
  int v2 = [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _dateLabelFont];
  [v2 _scaledValueForValue:16.5];
  double v4 = v3;

  return v4;
}

- (CGSize)_utilityViewSizeThatFitsWidth:(double)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3 > 0.0)
  {
    double v7 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityView];
    if (v7
      || ([(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton],
          (double v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v7, "sizeThatFits:", a3, 1.79769313e308);
      double v3 = v8;
      double v4 = v9;
    }
  }
  double v10 = v3;
  double v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:(double)a3
{
  double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];

  if (v6 && self->_referenceWidth != a3)
  {
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self invalidateCachedSizeInfo];
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _utilityViewSizeThatFitsWidth:a3];
    double v8 = v7 + 7.0;
    BOOL v9 = v7 <= 0.0;
    double v10 = 0.0;
    if (!v9) {
      double v10 = v8;
    }
    double v11 = a3 - v10;
    referencedouble Width = self->_referenceWidth;
    if (referenceWidth != 0.0 && referenceWidth != a3)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLLargeTextPlatterHeaderContentViewLayoutManager.m", 239, @"'_referenceWidth' is an unexpected value: %f", *(void *)&self->_referenceWidth);
    }
    self->_referencedouble Width = a3;
    id v17 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _boundingRectSizeForLabel:v17 width:&self->_cachedTitleNumberOfLines numberOfLines:v11];
    self->_cachedTitleBoundingRectSize.width = v14;
    self->_cachedTitleBoundingRectSize.height = v15;
  }
}

- (unint64_t)_titleLabelNumberOfLinesThatFitsWidth:(double)a3
{
  double v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];

  if (!v5) {
    return 0;
  }
  [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:a3];
  return self->_cachedTitleNumberOfLines;
}

- (CGRect)_dateLabelBoundsThatFitsWidth:(double)a3
{
  double v4 = [(PLPlatterHeaderContentViewLayoutManager *)self _date];

  if (v4)
  {
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    BSRectWithSize();
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_titleLabelBoundsThatFitsWidth:(double)a3
{
  double v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];

  if (v5)
  {
    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
    double v7 = [v6 font];
    [v7 lineHeight];

    [(PLLargeTextPlatterHeaderContentViewLayoutManager *)self _updateCachedTitleLabelSizeInfoIfNecessaryWithWidth:a3];
    BSRectWithSize();
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void).cxx_destruct
{
}

@end