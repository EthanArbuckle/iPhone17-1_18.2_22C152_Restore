@interface SKUIStandardInteractiveSegment
+ (double)defaultHeight;
- (CGSize)_titleLabelSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)attributedTitle;
- (SKUIStandardInteractiveSegment)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentEdgeInsets;
- (double)_normalizedSelectionProgressForRelativeSelectionProgress:(double)a3;
- (double)relativeSelectionProgress;
- (id)_backgroundImage;
- (id)_borderImage;
- (id)_createCorneredImageWithScale:(double)a3 forBorder:(BOOL)a4;
- (id)_inverseProgressTimingFunction;
- (id)_progressTimingFunction;
- (int64_t)segmentPosition;
- (unint64_t)_cornersForSegmentPosition:(int64_t)a3;
- (void)_applySelectionProgress;
- (void)_reloadCorneredImages;
- (void)_setNeedsReloadCorneredImages;
- (void)_updateBorderAndBackgroundContainerViewTinting;
- (void)layoutSubviews;
- (void)setAttributedTitle:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRelativeSelectionProgress:(double)a3;
- (void)setSegmentPosition:(int64_t)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SKUIStandardInteractiveSegment

- (SKUIStandardInteractiveSegment)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStandardInteractiveSegment initWithFrame:]();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIStandardInteractiveSegment;
  v8 = -[SKUIStandardInteractiveSegment initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    *(_OWORD *)&v8->_contentEdgeInsets.top = xmmword_1C1CCBA60;
    *(_OWORD *)&v8->_contentEdgeInsets.bottom = xmmword_1C1CCBA60;
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
    borderAndBackgroundContainerView = v9->_borderAndBackgroundContainerView;
    v9->_borderAndBackgroundContainerView = (UIView *)v15;

    [(UIView *)v9->_borderAndBackgroundContainerView setTintAdjustmentMode:1];
    [(UIView *)v9->_borderAndBackgroundContainerView setUserInteractionEnabled:0];
    [(SKUIStandardInteractiveSegment *)v9 addSubview:v9->_borderAndBackgroundContainerView];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v11, v12, v13, v14);
    borderImageView = v9->_borderImageView;
    v9->_borderImageView = (UIImageView *)v17;

    [(UIImageView *)v9->_borderImageView setContentMode:0];
    [(UIView *)v9->_borderAndBackgroundContainerView addSubview:v9->_borderImageView];
    [(SKUIStandardInteractiveSegment *)v9 _updateBorderAndBackgroundContainerViewTinting];
  }
  return v9;
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)SKUIStandardInteractiveSegment;
  [(SKUIStandardInteractiveSegment *)&v47 layoutSubviews];
  v3 = [(SKUIStandardInteractiveSegment *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  if (v5 > 0.00000011920929)
  {
    double v46 = v5;
    [(SKUIStandardInteractiveSegment *)self bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    -[UIView setFrame:](self->_borderAndBackgroundContainerView, "setFrame:");
    [(UIView *)self->_borderAndBackgroundContainerView bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    if (!self->_hasValidCorneredImages) {
      [(SKUIStandardInteractiveSegment *)self _reloadCorneredImages];
    }
    char v22 = [(SKUIStandardInteractiveSegment *)self _cornersForSegmentPosition:self->_segmentPosition];
    v48.origin.double x = v15;
    v48.origin.double y = v17;
    v48.size.double width = v19;
    v48.size.double height = v21;
    CGFloat v40 = v17;
    CGFloat v41 = v19;
    double Width = CGRectGetWidth(v48);
    double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    v49.origin.double x = v7;
    v49.origin.double y = v9;
    v49.size.double width = v11;
    v49.size.double height = v13;
    CGFloat v24 = v21;
    double v25 = CGRectGetWidth(v49);
    v50.origin.double x = v7;
    v50.origin.double y = v9;
    v50.size.double width = v11;
    v50.size.double height = v13;
    double Height = CGRectGetHeight(v50);
    double v26 = Width + -0.5;
    double v27 = v25 + -1.0;
    double v28 = 1.0;
    if ((~v22 & 5) != 0)
    {
      double v28 = 0.0;
      double v27 = v25;
      double v26 = Width;
      double v29 = 0.0;
    }
    else
    {
      double v29 = 0.5;
    }
    double v30 = v27 + -1.0;
    if ((v22 & 0xA) != 0xALL) {
      double v30 = v27;
    }
    double v42 = v30;
    double v43 = v28;
    if ((v22 & 0xA) == 0xALL) {
      double v31 = v26 + -0.5;
    }
    else {
      double v31 = v26;
    }
    v51.origin.double x = v15;
    v51.origin.double y = v40;
    v51.size.double width = v41;
    v51.size.double height = v24;
    CGFloat v32 = CGRectGetHeight(v51) + -1.0;
    -[UIImageView setFrame:](self->_highlightedBackgroundImageView, "setFrame:", v29, 0.5, v31, v32);
    -[UIImageView setFrame:](self->_selectedBackgroundImageView, "setFrame:", v29, 0.5, v31, v32);
    [(UIImageView *)self->_borderImageView frame];
    v52.origin.double x = v15;
    v52.origin.double y = v40;
    v52.size.double width = v41;
    v52.size.double height = v24;
    double v33 = CGRectGetWidth(v52);
    v53.origin.double x = v15;
    v53.origin.double y = v40;
    v53.size.double width = v41;
    v53.size.double height = v24;
    -[UIImageView setFrame:](self->_borderImageView, "setFrame:", 0.0, 0.0, v33, CGRectGetHeight(v53));
    double top = self->_contentEdgeInsets.top;
    double left = self->_contentEdgeInsets.left;
    CGFloat v36 = v43 + left;
    CGFloat v37 = v45 + top;
    CGFloat v38 = v42 - (left + self->_contentEdgeInsets.right);
    CGFloat v39 = Height - (top + self->_contentEdgeInsets.bottom);
    [(SKUIStandardInteractiveSegment *)self _titleLabelSize];
    v54.origin.double x = v36;
    v54.origin.double y = v37;
    v54.size.double width = v38;
    v54.size.double height = v39;
    CGRectGetWidth(v54);
    v55.origin.double x = v36;
    v55.origin.double y = v37;
    v55.size.double width = v38;
    v55.size.double height = v39;
    CGRectGetHeight(v55);
    UIRectCenteredIntegralRectScale();
    [(UILabel *)self->_titleLabel setFrame:*(void *)&v46];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(SKUIStandardInteractiveSegment *)self _titleLabelSize];
  double v7 = v6;
  double top = self->_contentEdgeInsets.top;
  double bottom = self->_contentEdgeInsets.bottom;
  double v11 = v10 + self->_contentEdgeInsets.left + self->_contentEdgeInsets.right;
  char v12 = ~[(SKUIStandardInteractiveSegment *)self _cornersForSegmentPosition:self->_segmentPosition];
  double v13 = v11 + 1.0;
  if ((v12 & 5) != 0) {
    double v13 = v11;
  }
  double v14 = v13 + 1.0;
  if ((v12 & 0xA) != 0) {
    double v14 = v13;
  }
  double v15 = v7 + top + bottom;
  if (width < v14) {
    double v14 = width;
  }
  if (height < v15) {
    double v15 = height;
  }
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SKUIStandardInteractiveSegment;
  [(SKUIStandardInteractiveSegment *)&v3 tintColorDidChange];
  [(SKUIStandardInteractiveSegment *)self _updateBorderAndBackgroundContainerViewTinting];
  [(SKUIStandardInteractiveSegment *)self _applySelectionProgress];
}

- (void)traitCollectionDidChange:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SKUIStandardInteractiveSegment;
  id v4 = a3;
  [(SKUIStandardInteractiveSegment *)&v13 traitCollectionDidChange:v4];
  objc_msgSend(v4, "displayScale", v13.receiver, v13.super_class);
  double v6 = v5;

  double v7 = [(SKUIStandardInteractiveSegment *)self traitCollection];
  [v7 displayScale];
  double v9 = v8;

  BOOL v10 = v6 > 0.00000011920929 || v9 <= 0.00000011920929;
  double v11 = vabdd_f64(v9, v6);
  if (!v10 || v11 > 0.00000011920929) {
    [(SKUIStandardInteractiveSegment *)self _setNeedsReloadCorneredImages];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SKUIStandardInteractiveSegment *)self isHighlighted];
  v17.receiver = self;
  v17.super_class = (Class)SKUIStandardInteractiveSegment;
  [(SKUIStandardInteractiveSegment *)&v17 setHighlighted:v3];
  int v6 = [(SKUIStandardInteractiveSegment *)self isHighlighted];
  if (v5 != v6)
  {
    int64_t highlightTransactionCount = self->_highlightTransactionCount;
    if (v6)
    {
      self->_int64_t highlightTransactionCount = highlightTransactionCount + 1;
      highlightedBackgroundImageView = self->_highlightedBackgroundImageView;
      if (!highlightedBackgroundImageView)
      {
        id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
        BOOL v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v11 = self->_highlightedBackgroundImageView;
        self->_highlightedBackgroundImageView = v10;

        [(UIImageView *)self->_highlightedBackgroundImageView setContentMode:0];
        char v12 = self->_highlightedBackgroundImageView;
        objc_super v13 = [(SKUIStandardInteractiveSegment *)self _backgroundImage];
        [(UIImageView *)v12 setImage:v13];

        [(UIView *)self->_borderAndBackgroundContainerView insertSubview:self->_highlightedBackgroundImageView belowSubview:self->_borderImageView];
        [(SKUIStandardInteractiveSegment *)self setNeedsLayout];
        highlightedBackgroundImageView = self->_highlightedBackgroundImageView;
      }
      [(UIImageView *)highlightedBackgroundImageView setAlpha:0.15];
    }
    else
    {
      int64_t v14 = highlightTransactionCount - 1;
      if (v14)
      {
        self->_int64_t highlightTransactionCount = v14;
      }
      else
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke;
        v16[3] = &unk_1E6422020;
        v16[4] = self;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke_2;
        v15[3] = &unk_1E64223D0;
        v15[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:327680 delay:v16 options:v15 animations:0.2 completion:0.0];
      }
    }
  }
}

uint64_t __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setAlpha:0.0];
}

void __49__SKUIStandardInteractiveSegment_setHighlighted___block_invoke_2(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 504);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 504))
  {
    [*(id *)(v1 + 496) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 496);
    *(void *)(v3 + 496) = 0;
  }
}

- (double)relativeSelectionProgress
{
  return self->_relativeSelectionProgress;
}

- (int64_t)segmentPosition
{
  return self->_segmentPosition;
}

- (void)setRelativeSelectionProgress:(double)a3
{
  double v3 = self->_relativeSelectionProgress - a3;
  if (v3 < 0.0 || v3 > 0.0 || !self->_hasSetRelativeSelectionProgress)
  {
    self->_hasSetRelativeSelectionProgress = 1;
    self->_relativeSelectionProgress = a3;
    [(SKUIStandardInteractiveSegment *)self _applySelectionProgress];
  }
}

- (void)setSegmentPosition:(int64_t)a3
{
  if (self->_segmentPosition != a3)
  {
    self->_segmentPosition = a3;
    [(SKUIStandardInteractiveSegment *)self _setNeedsReloadCorneredImages];
  }
}

- (void)setAttributedTitle:(id)a3
{
  id v4 = (NSAttributedString *)a3;
  attributedTitle = self->_attributedTitle;
  if (attributedTitle != v4)
  {
    double v11 = v4;
    attributedTitle = (NSAttributedString *)[(NSAttributedString *)attributedTitle isEqualToAttributedString:v4];
    id v4 = v11;
    if ((attributedTitle & 1) == 0)
    {
      int v6 = (NSAttributedString *)[(NSAttributedString *)v11 copy];
      double v7 = self->_attributedTitle;
      self->_attributedTitle = v6;

      double v8 = (NSAttributedString *)[(NSAttributedString *)self->_attributedTitle mutableCopy];
      -[NSAttributedString removeAttribute:range:](v8, "removeAttribute:range:", *MEMORY[0x1E4FB0700], 0, [(NSAttributedString *)v8 length]);
      titleLabelAttributedString = self->_titleLabelAttributedString;
      if (titleLabelAttributedString != v8
        && ![(NSAttributedString *)titleLabelAttributedString isEqualToAttributedString:v8])
      {
        objc_storeStrong((id *)&self->_titleLabelAttributedString, v8);
        titleLabel = self->_titleLabel;
        if (titleLabel)
        {
          [(UILabel *)titleLabel setAttributedText:self->_titleLabelAttributedString];
          self->_hasDirtyTitleLabelSize = 1;
          [(SKUIStandardInteractiveSegment *)self setNeedsLayout];
        }
        [(SKUIStandardInteractiveSegment *)self _applySelectionProgress];
      }

      id v4 = v11;
    }
  }

  MEMORY[0x1F41817F8](attributedTitle, v4);
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_contentEdgeInsets.left != a3.left
    || self->_contentEdgeInsets.top != a3.top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets = a3;
    [(SKUIStandardInteractiveSegment *)self setNeedsLayout];
  }
}

+ (double)defaultHeight
{
  return 29.0;
}

- (void)_applySelectionProgress
{
  if (self->_hasSetRelativeSelectionProgress)
  {
    [(SKUIStandardInteractiveSegment *)self _normalizedSelectionProgressForRelativeSelectionProgress:self->_relativeSelectionProgress];
    double v4 = v3;
    int v5 = [(SKUIStandardInteractiveSegment *)self _progressTimingFunction];
    *(float *)&double v6 = v4;
    id v32 = v5;
    [v5 _solveForInput:v6];
    float v8 = v7;
    NSUInteger v9 = [(NSAttributedString *)self->_titleLabelAttributedString length];
    titleLabel = self->_titleLabel;
    if (v9)
    {
      if (!titleLabel)
      {
        id v11 = objc_alloc(MEMORY[0x1E4FB1930]);
        char v12 = (UILabel *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        objc_super v13 = self->_titleLabel;
        self->_titleLabel = v12;

        int64_t v14 = self->_titleLabel;
        double v15 = [MEMORY[0x1E4FB1618] clearColor];
        [(UILabel *)v14 setBackgroundColor:v15];

        double v16 = self->_titleLabel;
        objc_super v17 = [MEMORY[0x1E4FB08E0] systemFontOfSize:13.0];
        [(UILabel *)v16 setFont:v17];

        [(UILabel *)self->_titleLabel setAttributedText:self->_titleLabelAttributedString];
        [(UILabel *)self->_titleLabel _setTextColorFollowsTintColor:1];
        [(SKUIStandardInteractiveSegment *)self addSubview:self->_titleLabel];
        self->_hasDirtyTitleLabelSize = 1;
        [(SKUIStandardInteractiveSegment *)self setNeedsLayout];
      }
      double v18 = [(UILabel *)self->_titleLabel layer];
      CGFloat v19 = v18;
      if (v8 <= 0.00000011921) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = *MEMORY[0x1E4F3A370];
      }
      [(UILabel *)v18 setCompositingFilter:v20];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      CGFloat v19 = self->_titleLabel;
      self->_titleLabel = 0;
    }

    CGFloat v21 = [(SKUIStandardInteractiveSegment *)self _inverseProgressTimingFunction];
    double v22 = 1.0 - v4;
    *(float *)&double v22 = 1.0 - v4;
    [v21 _solveForInput:v22];
    double v24 = 1.0 - v23;
    selectedBackgroundImageView = self->_selectedBackgroundImageView;
    if (v24 <= 0.00000011920929)
    {
      [(UIImageView *)selectedBackgroundImageView removeFromSuperview];
      double v31 = self->_selectedBackgroundImageView;
      self->_selectedBackgroundImageView = 0;
    }
    else
    {
      if (!selectedBackgroundImageView)
      {
        id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
        double v27 = (UIImageView *)objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v28 = self->_selectedBackgroundImageView;
        self->_selectedBackgroundImageView = v27;

        [(UIImageView *)self->_selectedBackgroundImageView setContentMode:0];
        double v29 = self->_selectedBackgroundImageView;
        double v30 = [(SKUIStandardInteractiveSegment *)self _backgroundImage];
        [(UIImageView *)v29 setImage:v30];

        [(UIView *)self->_borderAndBackgroundContainerView insertSubview:self->_selectedBackgroundImageView aboveSubview:self->_borderImageView];
        [(SKUIStandardInteractiveSegment *)self setNeedsLayout];
        selectedBackgroundImageView = self->_selectedBackgroundImageView;
      }
      [(UIImageView *)selectedBackgroundImageView setAlpha:v24];
    }
  }
}

- (id)_backgroundImage
{
  if (!self->_backgroundImage)
  {
    double v3 = [(SKUIStandardInteractiveSegment *)self traitCollection];
    [v3 displayScale];
    double v5 = v4;

    if (v5 > 0.00000011920929)
    {
      double v6 = [(SKUIStandardInteractiveSegment *)self _createCorneredImageWithScale:0 forBorder:v5];
      backgroundImage = self->_backgroundImage;
      self->_backgroundImage = v6;
    }
  }
  float v8 = self->_backgroundImage;

  return v8;
}

- (id)_borderImage
{
  if (!self->_borderImage)
  {
    double v3 = [(SKUIStandardInteractiveSegment *)self traitCollection];
    [v3 displayScale];
    double v5 = v4;

    if (v5 > 0.00000011920929)
    {
      double v6 = [(SKUIStandardInteractiveSegment *)self _createCorneredImageWithScale:1 forBorder:v5];
      borderImage = self->_borderImage;
      self->_borderImage = v6;
    }
  }
  float v8 = self->_borderImage;

  return v8;
}

- (unint64_t)_cornersForSegmentPosition:(int64_t)a3
{
  if (a3 == 3)
  {
    double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v5 = [v4 userInterfaceLayoutDirection];

    BOOL v6 = v5 == 0;
    unint64_t v7 = 5;
    unint64_t v8 = 10;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3) {
        return 0;
      }
      else {
        return -1;
      }
    }
    NSUInteger v9 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v10 = [v9 userInterfaceLayoutDirection];

    BOOL v6 = v10 == 0;
    unint64_t v7 = 10;
    unint64_t v8 = 5;
  }
  if (v6) {
    return v8;
  }
  else {
    return v7;
  }
}

- (id)_createCorneredImageWithScale:(double)a3 forBorder:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = [(SKUIStandardInteractiveSegment *)self _cornersForSegmentPosition:self->_segmentPosition];
  if (v4) {
    double v7 = 8.0;
  }
  else {
    double v7 = 7.0;
  }
  if ((v6 & 5) != 0) {
    double v8 = -0.0;
  }
  else {
    double v8 = v7;
  }
  double v9 = v7 * 2.0 + 1.0 + v8;
  if ((v6 & 5) != 0) {
    double v10 = 0.0;
  }
  else {
    double v10 = 0.0 - v7;
  }
  if ((v6 & 0xA) != 0) {
    double v11 = -0.0;
  }
  else {
    double v11 = v7;
  }
  double v12 = v11 + v9;
  v26.double width = v7 * 2.0 + 1.0;
  v26.double height = v26.width;
  UIGraphicsBeginImageContextWithOptions(v26, 0, a3);
  objc_super v13 = [MEMORY[0x1E4FB1618] blackColor];
  [v13 set];

  int64_t v14 = (void *)MEMORY[0x1E4FB14C0];
  uint64_t v15 = 0;
  if (v4)
  {
    double v16 = v10;
    double v17 = v12;
    double v18 = v7 * 2.0 + 1.0;
    CGRect v27 = CGRectInset(*(CGRect *)(&v15 - 1), 0.5, 0.5);
    CGFloat v19 = objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v27.origin.x, v27.origin.y, v27.size.width, v27.size.height, 3.5);
    [v19 setLineWidth:1.0];
    [v19 stroke];
  }
  else
  {
    CGFloat v19 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v10, 0.0, v12, v7 * 2.0 + 1.0, 3.5);
    uint64_t v20 = [MEMORY[0x1E4FB1618] blackColor];
    [v20 setFill];

    [v19 fill];
  }

  CGFloat v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v22 = objc_msgSend(v21, "resizableImageWithCapInsets:", v7, v7, v7, v7);

  float v23 = [v22 imageWithRenderingMode:2];

  return v23;
}

- (id)_inverseProgressTimingFunction
{
  inverseProgressTimingFunction = self->_inverseProgressTimingFunction;
  if (!inverseProgressTimingFunction)
  {
    BOOL v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
    uint64_t v5 = self->_inverseProgressTimingFunction;
    self->_inverseProgressTimingFunction = v4;

    inverseProgressTimingFunction = self->_inverseProgressTimingFunction;
  }

  return inverseProgressTimingFunction;
}

- (double)_normalizedSelectionProgressForRelativeSelectionProgress:(double)a3
{
  return 1.0 - fabs(a3);
}

- (id)_progressTimingFunction
{
  progressTimingFunction = self->_progressTimingFunction;
  if (!progressTimingFunction)
  {
    BOOL v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    uint64_t v5 = self->_progressTimingFunction;
    self->_progressTimingFunction = v4;

    progressTimingFunction = self->_progressTimingFunction;
  }

  return progressTimingFunction;
}

- (void)_reloadCorneredImages
{
  self->_hasValidCorneredImages = 1;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  borderImage = self->_borderImage;
  self->_borderImage = 0;

  if (self->_highlightedBackgroundImageView || self->_selectedBackgroundImageView)
  {
    uint64_t v5 = [(SKUIStandardInteractiveSegment *)self _backgroundImage];
    [(UIImageView *)self->_highlightedBackgroundImageView setImage:v5];
    [(UIImageView *)self->_selectedBackgroundImageView setImage:v5];
  }
  if (self->_borderImageView)
  {
    id v6 = [(SKUIStandardInteractiveSegment *)self _borderImage];
    [(UIImageView *)self->_borderImageView setImage:v6];
  }
}

- (void)_setNeedsReloadCorneredImages
{
  self->_hasValidCorneredImages = 0;
  [(SKUIStandardInteractiveSegment *)self setNeedsLayout];
}

- (CGSize)_titleLabelSize
{
  if (self->_hasDirtyTitleLabelSize)
  {
    self->_hasDirtyTitleLabelSize = 0;
    p_titleLabelSize = &self->_titleLabelSize;
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    p_titleLabelSize->double width = width;
    p_titleLabelSize->double height = height;
  }
  else
  {
    double width = self->_titleLabelSize.width;
    double height = self->_titleLabelSize.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateBorderAndBackgroundContainerViewTinting
{
  id v9 = [(SKUIStandardInteractiveSegment *)self tintColor];
  [v9 alphaComponent];
  double v4 = v3;
  double v5 = fabs(v3 + -1.0);
  borderAndBackgroundContainerView = self->_borderAndBackgroundContainerView;
  if (v5 <= 0.00000011920929)
  {
    [(UIView *)self->_borderAndBackgroundContainerView setTintColor:v9];
    double v4 = 1.0;
  }
  else
  {
    double v7 = [v9 colorWithAlphaComponent:1.0];
    [(UIView *)borderAndBackgroundContainerView setTintColor:v7];
  }
  [(UIView *)self->_borderAndBackgroundContainerView setAlpha:v4];
  double v8 = [(UIView *)self->_borderAndBackgroundContainerView layer];
  [v8 setAllowsGroupOpacity:v5 > 0.00000011920929];
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_titleLabelAttributedString, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressTimingFunction, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_inverseProgressTimingFunction, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_borderImageView, 0);
  objc_storeStrong((id *)&self->_borderImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);

  objc_storeStrong((id *)&self->_borderAndBackgroundContainerView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  uint64_t v1 = "-[SKUIStandardInteractiveSegment initWithFrame:]";
}

@end