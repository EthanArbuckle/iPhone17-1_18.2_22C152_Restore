@interface PLPlatterHeaderContentViewLayoutManager
+ (double)_headerHeightWithFont:(id)a3 forWidth:(double)a4;
+ (double)_titleLabelBaselineOffsetWithFont:(id)a3;
+ (double)contentBaselineToBoundsBottomWithFont:(id)a3 boundsWidth:(double)a4 scale:(double)a5;
- (BOOL)_heedsHorizontalLayoutMargins;
- (BOOL)_shouldReverseLayoutDirection;
- (CGRect)_titleLabelBoundsForSize:(CGSize)a3 withNumberOfLines:(double)a4;
- (CGSize)_measuringSizeForWidth:(double)a3;
- (NSArray)_iconButtons;
- (NSDate)_date;
- (PLPlatterHeaderContentView)headerContentView;
- (PLPlatterHeaderContentViewLayoutManager)initWithPlatterHeaderContentView:(id)a3;
- (UIButton)_utilityButton;
- (UIEdgeInsets)_layoutMargins;
- (UILabel)_dateLabel;
- (UILabel)_titleLabel;
- (UIView)_utilityView;
- (double)_titleLabelBaselineOffset;
- (double)contentBaseline;
- (double)headerHeightForWidth:(double)a3;
- (void)layoutDateLabelWithScale:(double)a3;
- (void)layoutIconButtonsWithScale:(double)a3;
- (void)layoutTitleLabelWithTrailingXLimit:(double)a3 scale:(double)a4;
- (void)layoutUtilityButtonWithScale:(double)a3;
@end

@implementation PLPlatterHeaderContentViewLayoutManager

+ (double)_headerHeightWithFont:(id)a3 forWidth:(double)a4
{
  objc_msgSend(a3, "_scaledValueForValue:");
  return 10.0 + 20.0 + v4;
}

+ (double)contentBaselineToBoundsBottomWithFont:(id)a3 boundsWidth:(double)a4 scale:(double)a5
{
  id v7 = a3;
  [a1 _headerHeightWithFont:v7 forWidth:a4];
  [a1 _titleLabelBaselineOffsetWithFont:v7];

  UIRoundToScale();
  return result;
}

- (PLPlatterHeaderContentViewLayoutManager)initWithPlatterHeaderContentView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLPlatterHeaderContentViewLayoutManager;
  v5 = [(PLPlatterHeaderContentViewLayoutManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_headerContentView, v4);
  }

  return v6;
}

- (double)headerHeightForWidth:(double)a3
{
  v5 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  id v7 = [WeakRetained _titleLabelFont];
  [v5 _headerHeightWithFont:v7 forWidth:a3];
  double v9 = v8;

  return v9;
}

- (double)contentBaseline
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  [WeakRetained _iconDimension];
  double v5 = v4 + 10.0;
  [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
  double v7 = v6;

  if (v5 >= v7) {
    return v5;
  }
  else {
    return v7;
  }
}

- (void)layoutIconButtonsWithScale:(double)a3
{
  id v37 = [(PLPlatterHeaderContentViewLayoutManager *)self _iconButtons];
  uint64_t v4 = [v37 count];
  if (v4)
  {
    uint64_t v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
    [WeakRetained bounds];
    CGFloat v8 = v7;
    CGFloat v34 = v9;
    CGFloat v35 = v10;
    CGFloat rect = v11;
    [WeakRetained _iconDimension];
    double v13 = v12;
    BSRectWithSize();
    CGFloat x = v39.origin.x;
    CGFloat y = v39.origin.y;
    CGFloat width = v39.size.width;
    CGFloat height = v39.size.height;
    double v33 = (CGRectGetWidth(v39) - v13) * 0.5;
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v32 = (CGRectGetHeight(v40) - v13) * 0.5;
    [WeakRetained _iconLeadingPadding];
    double v19 = v18;
    if ([(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection])
    {
      v41.origin.CGFloat x = v8;
      v41.origin.CGFloat y = v34;
      v41.size.CGFloat height = v35;
      v41.size.CGFloat width = rect;
      CGRectGetWidth(v41);
    }
    UIRectCenteredYInRect();
    double v20 = v42.origin.x;
    CGFloat v21 = v42.size.width;
    CGFloat v22 = v42.size.height;
    double MinY = CGRectGetMinY(v42);
    if (MinY >= 10.0 - v32) {
      double v24 = MinY;
    }
    else {
      double v24 = 10.0 - v32;
    }
    BOOL v25 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
    for (unint64_t i = 0; i != v5; ++i)
    {
      v27 = [v37 objectAtIndex:i];
      UIRectIntegralWithScale();
      objc_msgSend(v27, "setFrame:");
      if (i < v5 - 1)
      {
        double v28 = v20;
        double v29 = v24;
        CGFloat v30 = v21;
        CGFloat v31 = v22;
        if (v25) {
          double v20 = CGRectGetMinX(*(CGRect *)&v28) - v19 - v13;
        }
        else {
          double v20 = v19 + CGRectGetMaxX(*(CGRect *)&v28) + -v33 * 2.0;
        }
      }
    }
  }
}

- (void)layoutTitleLabelWithTrailingXLimit:(double)a3 scale:(double)a4
{
  double v6 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];
  if (v6)
  {
    double v40 = a3;
    id v41 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
    [WeakRetained bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    CGFloat v36 = v11;
    CGFloat v38 = v9;
    v43.origin.CGFloat x = v9;
    v43.origin.CGFloat y = v11;
    CGFloat v32 = v15;
    CGFloat v34 = v13;
    v43.size.CGFloat width = v13;
    v43.size.CGFloat height = v15;
    [(PLPlatterHeaderContentViewLayoutManager *)self _measuringSizeForWidth:CGRectGetWidth(v43)];
    -[PLPlatterHeaderContentViewLayoutManager _titleLabelBoundsForSize:withNumberOfLines:](self, "_titleLabelBoundsForSize:withNumberOfLines:");
    objc_msgSend(v41, "setBounds:");
    [v41 frame];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    double v24 = [(PLPlatterHeaderContentViewLayoutManager *)self _dateLabel];
    if (v24) {
      double v25 = 0.0;
    }
    else {
      double v25 = 16.0;
    }

    v26 = [(PLPlatterHeaderContentViewLayoutManager *)self _iconButtons];
    if ([v26 count]) {
      double v27 = 10.0;
    }
    else {
      double v27 = 12.0;
    }

    double v28 = v27;
    if ([(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection])
    {
      double v28 = v25 + v40;
      v44.origin.CGFloat y = v36;
      v44.origin.CGFloat x = v38;
      v44.size.CGFloat height = v32;
      v44.size.CGFloat width = v34;
      CGFloat v29 = CGRectGetWidth(v44) - v27;
      v45.origin.CGFloat x = v17;
      v45.origin.CGFloat y = v19;
      v45.size.CGFloat width = v21;
      v45.size.CGFloat height = v23;
      double v30 = v29 - CGRectGetWidth(v45);
      if (v25 + v40 < v30) {
        double v28 = v30;
      }
    }
    BOOL v31 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
    v46.origin.CGFloat x = v28;
    v46.origin.CGFloat y = v19;
    v46.size.CGFloat width = v21;
    v46.size.CGFloat height = v23;
    CGRectGetWidth(v46);
    if (v31)
    {
      v47.origin.CGFloat y = v37;
      v47.origin.CGFloat x = v39;
      v47.size.CGFloat height = v33;
      v47.size.CGFloat width = v35;
      CGRectGetMaxX(v47);
    }
    v48.origin.CGFloat x = v28;
    v48.origin.CGFloat y = v19;
    v48.size.CGFloat width = v21;
    v48.size.CGFloat height = v23;
    CGRectGetMinX(v48);
    [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    [v41 _firstLineBaselineOffsetFromBoundsTop];
    UIRectIntegralWithScale();
    objc_msgSend(v41, "setFrame:");
    double v6 = v41;
  }
}

- (void)layoutUtilityButtonWithScale:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  [WeakRetained bounds];
  CGFloat v7 = v6;
  CGFloat v58 = v9;
  CGFloat v59 = v8;
  CGFloat rect = v10;

  CGFloat v11 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityView];
  double v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  }
  double v14 = v13;

  CGFloat v15 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  if (v14 == v15)
  {
    CGFloat v17 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
    double v18 = [v17 titleLabel];
    CGFloat v19 = [v18 text];
    BOOL v16 = [v19 length] != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  BOOL v20 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
  BOOL v21 = [(PLPlatterHeaderContentViewLayoutManager *)self _heedsHorizontalLayoutMargins];
  [(PLPlatterHeaderContentViewLayoutManager *)self _layoutMargins];
  double v23 = v22;
  double v25 = v24;
  [v14 sizeToFit];
  if (!v16)
  {
    [v14 bounds];
    CGFloat v62 = v46;
    CGFloat v63 = v45;
    CGFloat v60 = v48;
    CGFloat v61 = v47;
    if (!v20)
    {
LABEL_26:
      v68.origin.CGFloat x = v7;
      v68.size.CGFloat width = v58;
      v68.origin.CGFloat y = v59;
      v68.size.CGFloat height = rect;
      CGRectGetWidth(v68);
      v69.origin.CGFloat y = v62;
      v69.origin.CGFloat x = v63;
      v69.size.CGFloat height = v60;
      v69.size.CGFloat width = v61;
      CGRectGetMaxX(v69);
      goto LABEL_28;
    }
LABEL_24:
    v67.origin.CGFloat y = v62;
    v67.origin.CGFloat x = v63;
    v67.size.CGFloat height = v60;
    v67.size.CGFloat width = v61;
    CGRectGetMinX(v67);
    goto LABEL_28;
  }
  double v55 = a3;
  CGFloat v56 = v7;
  v26 = (void *)MEMORY[0x1E4F42FF0];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __72__PLPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke;
  v64[3] = &unk_1E6B5F800;
  id v27 = v14;
  id v65 = v27;
  [v26 performWithoutAnimation:v64];

  [v27 bounds];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  objc_msgSend(v27, "contentRectForBounds:");
  objc_msgSend(v27, "titleRectForContentRect:");
  CGFloat v62 = v37;
  CGFloat v63 = v36;
  CGFloat v60 = v39;
  CGFloat v61 = v38;
  if (v21)
  {
    double v40 = v23;
  }
  else
  {
    double v25 = 16.0;
    double v40 = 16.0;
  }
  if (v20) {
    double v41 = v40;
  }
  else {
    double v41 = v25;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    CGFloat v7 = v56;
    if (!v20) {
      goto LABEL_26;
    }
    goto LABEL_24;
  }
  if (v20) {
    double v42 = v40;
  }
  else {
    double v42 = 0.0;
  }
  if (v20) {
    double v43 = 0.0;
  }
  else {
    double v43 = v25;
  }
  objc_msgSend(v27, "setTitleEdgeInsets:", 0.0, v42, 0.0, v43, *(void *)&v55);
  v66.origin.CGFloat x = v29;
  v66.origin.CGFloat y = v31;
  v66.size.CGFloat width = v33;
  v66.size.CGFloat height = v35;
  double v44 = v41 + CGRectGetWidth(v66);
  if (!v20)
  {
    v70.size.CGFloat height = rect;
    v70.origin.CGFloat x = v56;
    v70.size.CGFloat width = v58;
    v70.origin.CGFloat y = v59;
    CGRectGetWidth(v70);
    v71.origin.CGFloat x = v29;
    v71.origin.CGFloat y = v31;
    v71.size.CGFloat width = v44;
    v71.size.CGFloat height = v35;
    CGRectGetWidth(v71);
  }
LABEL_28:
  v49 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  v50 = [v49 titleLabel];
  v51 = [v50 text];
  uint64_t v52 = [v51 length];

  if (v52)
  {
    [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    v53 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
    v54 = [v53 titleLabel];
    [v54 _firstLineBaselineOffsetFromBoundsTop];
    v72.origin.CGFloat y = v62;
    v72.origin.CGFloat x = v63;
    v72.size.CGFloat height = v60;
    v72.size.CGFloat width = v61;
    CGRectGetMinY(v72);
  }
  else
  {
    UIRectCenteredYInRect();
  }
  UIRectIntegralWithScale();
  objc_msgSend(v14, "setFrame:");
}

uint64_t __72__PLPlatterHeaderContentViewLayoutManager_layoutUtilityButtonWithScale___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)layoutDateLabelWithScale:(double)a3
{
  uint64_t v4 = [(PLPlatterHeaderContentViewLayoutManager *)self _dateLabel];
  if (!v4) {
    goto LABEL_12;
  }
  id v31 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  [WeakRetained bounds];
  CGFloat v29 = v7;
  CGFloat v30 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  BOOL v12 = [(PLPlatterHeaderContentViewLayoutManager *)self _shouldReverseLayoutDirection];
  [v31 sizeToFit];
  id v13 = [(PLPlatterHeaderContentViewLayoutManager *)self _utilityButton];
  double v14 = [v13 titleLabel];
  CGFloat v15 = [v14 text];
  if ([v15 length])
  {
    [v13 alpha];
    double v17 = v16;
    goto LABEL_6;
  }
  uint64_t v18 = [v13 currentImage];
  if (v18)
  {
    CGFloat v19 = (void *)v18;
    [v13 alpha];
    double v17 = v20;

LABEL_6:
    if (v17 > 0.0)
    {
      [v13 frame];
      CGRectGetWidth(v33);
    }
    goto LABEL_9;
  }

LABEL_9:
  [v31 frame];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  if (!v12)
  {
    CGFloat v27 = v21;
    CGFloat v28 = v22;
    v34.size.CGFloat width = v29;
    v34.origin.CGFloat x = v30;
    v34.origin.CGFloat y = v9;
    v34.size.CGFloat height = v11;
    CGRectGetWidth(v34);
    v35.origin.CGFloat x = v27;
    v35.origin.CGFloat y = v28;
    v35.size.CGFloat width = v24;
    v35.size.CGFloat height = v26;
    CGRectGetWidth(v35);
  }
  [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
  [v31 _firstLineBaselineOffsetFromBoundsTop];
  UIRectIntegralWithScale();
  objc_msgSend(v31, "setFrame:");

  uint64_t v4 = v31;
LABEL_12:
}

+ (double)_titleLabelBaselineOffsetWithFont:(id)a3
{
  [a3 _scaledValueForValue:15.0];
  return v3 + 10.0;
}

- (BOOL)_shouldReverseLayoutDirection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained _shouldReverseLayoutDirection];

  return v3;
}

- (BOOL)_heedsHorizontalLayoutMargins
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained heedsHorizontalLayoutMargins];

  return v3;
}

- (NSArray)_iconButtons
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained iconButtons];

  return (NSArray *)v3;
}

- (UILabel)_titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained title];
  if ([v3 length])
  {
    uint64_t v4 = [WeakRetained _titleLabel];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (UILabel *)v4;
}

- (NSDate)_date
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained date];

  return (NSDate *)v3;
}

- (UILabel)_dateLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained _dateLabel];

  return (UILabel *)v3;
}

- (UIView)_utilityView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained utilityView];

  return (UIView *)v3;
}

- (UIButton)_utilityButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  char v3 = [WeakRetained _utilityButton];

  return (UIButton *)v3;
}

- (UIEdgeInsets)_layoutMargins
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  [WeakRetained layoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (double)_titleLabelBaselineOffset
{
  double v3 = objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  double v5 = [WeakRetained _titleLabelFont];
  [v3 _titleLabelBaselineOffsetWithFont:v5];
  double v7 = v6;

  return v7;
}

- (CGSize)_measuringSizeForWidth:(double)a3
{
  double v3 = a3 + -10.0 + -7.0;
  double v4 = 1.79769313e308;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (CGRect)_titleLabelBoundsForSize:(CGSize)a3 withNumberOfLines:(double)a4
{
  double v5 = [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabel];

  if (v5)
  {
    [(PLPlatterHeaderContentViewLayoutManager *)self _titleLabelBaselineOffset];
    BSRectWithSize();
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (PLPlatterHeaderContentView)headerContentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerContentView);
  return (PLPlatterHeaderContentView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end