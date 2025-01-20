@interface NCNotificationAppSectionListSummarizedContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationAppSectionListSummarizedContentViewDelegate)delegate;
- (NSArray)attachmentImageViews;
- (NSArray)titleAndContentStrings;
- (NSString)title;
- (double)_allowedWidthForTextInRect:(CGRect)a3;
- (double)_countBackgroundDimensionInRect:(CGRect)a3;
- (id)_newContentStringLabelForText:(id)a3;
- (unint64_t)_maximumNumberOfLinesForContentText;
- (unint64_t)_maximumNumberOfLinesForTitleText;
- (unint64_t)_numberOfLinesForContentTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3;
- (unint64_t)count;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureShadowForAttachmentView:(id)a3;
- (void)_configureTapGestureRecognizerIfNecessary;
- (void)_layoutAttachmentImageViews;
- (void)_layoutBackgroundView;
- (void)_layoutCountLabel;
- (void)_layoutTitleAndContentStringLabels;
- (void)_layoutTitleLabel;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForCountLabel;
- (void)_updateTextAttributesForTitleAndContentStringLabels;
- (void)_updateTextAttributesForTitleLabel;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)didMoveToWindow;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)setAttachmentImageViews:(id)a3;
- (void)setCount:(unint64_t)count;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAndContentStrings:(id)a3;
@end

@implementation NCNotificationAppSectionListSummarizedContentView

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v4 isEqualToString:v10];

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      [(NCNotificationAppSectionListSummarizedContentView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v10];
    [(NCNotificationAppSectionListSummarizedContentView *)self _updateTextAttributesForTitleLabel];
    v9 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
    [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_titleLabel style:0 visualStylingProvider:v9 outgoingProvider:0];
    [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
  }
}

- (void)setCount:(unint64_t)count
{
  if (self->_count != count)
  {
    self->_count = count;
    countLabel = self->_countLabel;
    if (count)
    {
      if (!countLabel)
      {
        char v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
        countBackgroundView = self->_countBackgroundView;
        self->_countBackgroundView = v5;

        v7 = [(UIView *)self->_countBackgroundView layer];
        [v7 setCornerCurve:*MEMORY[0x1E4F39EA0]];

        [(NCNotificationAppSectionListSummarizedContentView *)self addSubview:self->_countBackgroundView];
        v8 = self->_countBackgroundView;
        v9 = [MEMORY[0x1E4FB1618] blackColor];
        [(UIView *)v8 setBackgroundColor:v9];

        [(UIView *)self->_countBackgroundView setAlpha:0.25];
        id v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v11 = self->_countLabel;
        self->_countLabel = v10;

        [(UILabel *)self->_countLabel setTextAlignment:1];
        v12 = self->_countLabel;
        v13 = [MEMORY[0x1E4FB1618] systemWhiteColor];
        [(UILabel *)v12 setTextColor:v13];

        [(NCNotificationAppSectionListSummarizedContentView *)self addSubview:self->_countLabel];
        [(NCNotificationAppSectionListSummarizedContentView *)self _updateTextAttributesForCountLabel];
        countLabel = self->_countLabel;
        count = self->_count;
      }
      v14 = (void *)MEMORY[0x1E4F28EE0];
      id v18 = [NSNumber numberWithUnsignedInteger:count];
      v15 = [v14 localizedStringFromNumber:v18 numberStyle:0];
      [(UILabel *)countLabel setText:v15];
    }
    else if (countLabel)
    {
      [(UILabel *)self->_countLabel removeFromSuperview];
      v16 = self->_countLabel;
      self->_countLabel = 0;

      [(UIView *)self->_countBackgroundView removeFromSuperview];
      v17 = self->_countBackgroundView;
      self->_countBackgroundView = 0;

      [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
    }
  }
}

- (void)setTitleAndContentStrings:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToArray:self->_titleAndContentStrings] & 1) == 0)
  {
    [(NSArray *)self->_titleAndContentStringLabels enumerateObjectsUsingBlock:&__block_literal_global_16];
    titleAndContentStringLabels = self->_titleAndContentStringLabels;
    self->_titleAndContentStringLabels = 0;

    if ([v4 count])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke_3;
      v13 = &unk_1E6A93950;
      v14 = self;
      v7 = (NSArray *)v6;
      v15 = v7;
      [v4 enumerateObjectsUsingBlock:&v10];
      v8 = self->_titleAndContentStringLabels;
      self->_titleAndContentStringLabels = v7;
      v9 = v7;

      [(NCNotificationAppSectionListSummarizedContentView *)self _updateTextAttributesForTitleAndContentStringLabels];
    }
    [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
  }
}

uint64_t __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateObjectsUsingBlock:&__block_literal_global_7];
}

uint64_t __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

void __79__NCNotificationAppSectionListSummarizedContentView_setTitleAndContentStrings___block_invoke_3(uint64_t a1, void *a2)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v4 objectAtIndex:0];
  id v6 = (void *)[v3 _newContentStringLabelForText:v5];

  v7 = *(void **)(a1 + 32);
  v8 = [v4 objectAtIndex:1];

  v9 = (void *)[v7 _newContentStringLabelForText:v8];
  uint64_t v10 = *(void **)(a1 + 40);
  v12[0] = v6;
  v12[1] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v10 addObject:v11];
}

- (void)setAttachmentImageViews:(id)a3
{
  id v5 = a3;
  p_attachmentImageViews = &self->_attachmentImageViews;
  if (([v5 isEqualToArray:self->_attachmentImageViews] & 1) == 0)
  {
    [(NSArray *)*p_attachmentImageViews enumerateObjectsUsingBlock:&__block_literal_global_12];
    v7 = *p_attachmentImageViews;
    *p_attachmentImageViews = 0;

    [(UIView *)self->_attachmentImageBoundingView removeFromSuperview];
    attachmentImageBoundingView = self->_attachmentImageBoundingView;
    self->_attachmentImageBoundingView = 0;

    if ([v5 count])
    {
      v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      uint64_t v10 = self->_attachmentImageBoundingView;
      self->_attachmentImageBoundingView = v9;

      [(NCNotificationAppSectionListSummarizedContentView *)self addSubview:self->_attachmentImageBoundingView];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __77__NCNotificationAppSectionListSummarizedContentView_setAttachmentImageViews___block_invoke_2;
      v11[3] = &unk_1E6A93350;
      v11[4] = self;
      [v5 enumerateObjectsUsingBlock:v11];
      objc_storeStrong((id *)&self->_attachmentImageViews, a3);
    }
    [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
  }
}

uint64_t __77__NCNotificationAppSectionListSummarizedContentView_setAttachmentImageViews___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperview];
}

uint64_t __77__NCNotificationAppSectionListSummarizedContentView_setAttachmentImageViews___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 480) addSubview:a2];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[NCNotificationAppSectionListSummarizedContentView _countBackgroundDimensionInRect:](self, "_countBackgroundDimensionInRect:", 0.0, 0.0, a3.width, a3.height);
  -[NCNotificationAppSectionListSummarizedContentView _allowedWidthForTextInRect:](self, "_allowedWidthForTextInRect:", 0.0, 0.0, width, height);
  double v7 = v6;
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", titleLabel, -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v6, height));
  }
  if ([(NSArray *)self->_titleAndContentStringLabels count])
  {
    v9 = [(NSArray *)self->_titleAndContentStringLabels firstObject];
    uint64_t v10 = [v9 firstObject];

    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", v10, -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForContentTextInFrame:](self, "_numberOfLinesForContentTextInFrame:", 0.0, 0.0, v7, height));
  }
  if (self->_attachmentImageBoundingView) {
    [(NSArray *)self->_attachmentImageViews count];
  }
  uint64_t v11 = [(NCNotificationAppSectionListSummarizedContentView *)self traitCollection];
  [v11 displayScale];
  UICeilToScale();
  double v13 = v12;

  double v14 = width;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationAppSectionListSummarizedContentView;
  [(NCNotificationAppSectionListSummarizedContentView *)&v4 layoutSubviews];
  [(NCNotificationAppSectionListSummarizedContentView *)self _configureBackgroundViewIfNecessary];
  [(NCNotificationAppSectionListSummarizedContentView *)self _configureTapGestureRecognizerIfNecessary];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__NCNotificationAppSectionListSummarizedContentView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E6A91BB0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

uint64_t __67__NCNotificationAppSectionListSummarizedContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutBackgroundView];
  [*(id *)(a1 + 32) _layoutCountLabel];
  [*(id *)(a1 + 32) _layoutAttachmentImageViews];
  [*(id *)(a1 + 32) _layoutTitleLabel];
  v2 = *(void **)(a1 + 32);

  return [v2 _layoutTitleAndContentStringLabels];
}

- (void)didMoveToWindow
{
  v3 = [(NCNotificationAppSectionListSummarizedContentView *)self window];

  if (v3)
  {
    [(NCNotificationListBaseContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    v3 = (UIView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:1];
    [(UIView *)v3 _setContinuousCornerRadius:23.5];
    objc_super v4 = [(NCNotificationAppSectionListSummarizedContentView *)self delegate];
    id v5 = [v4 backgroundGroupNameBaseForAppSectionListSummarizedContentView:self];
    [(UIView *)v3 setMaterialGroupNameBase:v5];

    [(NCNotificationAppSectionListSummarizedContentView *)self addSubview:v3];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;
  }
}

- (void)_configureTapGestureRecognizerIfNecessary
{
  if (!self->_tapGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTap_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v3;

    id v5 = self->_tapGestureRecognizer;
    [(NCNotificationAppSectionListSummarizedContentView *)self addGestureRecognizer:v5];
  }
}

- (void)_layoutBackgroundView
{
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(NCNotificationAppSectionListSummarizedContentView *)self bounds];
    -[UIView setFrame:](backgroundView, "setFrame:");
    objc_super v4 = self->_backgroundView;
    [(NCNotificationAppSectionListSummarizedContentView *)self sendSubviewToBack:v4];
  }
}

- (void)_layoutCountLabel
{
  if (self->_countLabel)
  {
    [(NCNotificationAppSectionListSummarizedContentView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(UIView *)self->_countBackgroundView frame];
    -[UILabel sizeThatFits:](self->_countLabel, "sizeThatFits:", v8, v10);
    -[NCNotificationAppSectionListSummarizedContentView _countBackgroundDimensionInRect:](self, "_countBackgroundDimensionInRect:", v4, v6, v8, v10);
    double v12 = v11;
    if ([(NCNotificationAppSectionListSummarizedContentView *)self _shouldReverseLayoutDirection])
    {
      v16.origin.x = v4;
      v16.origin.y = v6;
      v16.size.double width = v8;
      v16.size.double height = v10;
      CGRectGetWidth(v16);
    }
    UIRectCenteredYInRect();
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_countBackgroundView, "setFrame:");
    double v13 = [(UIView *)self->_countBackgroundView layer];
    [v13 setCornerRadius:v12 * 0.5];

    [(UILabel *)self->_countLabel frame];
    UIRectCenteredRect();
    UIRectIntegralWithScale();
    countLabel = self->_countLabel;
    -[UILabel setFrame:](countLabel, "setFrame:");
  }
}

- (void)_layoutAttachmentImageViews
{
  attachmentImageBoundingView = self->_attachmentImageBoundingView;
  if (attachmentImageBoundingView)
  {
    [(UIView *)attachmentImageBoundingView frame];
    [(NCNotificationAppSectionListSummarizedContentView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    NSUInteger v12 = [(NSArray *)self->_attachmentImageViews count];
    if (([(NCNotificationAppSectionListSummarizedContentView *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      v27.origin.x = v5;
      v27.origin.y = v7;
      v27.size.double width = v9;
      v27.size.double height = v11;
      CGRectGetWidth(v27);
    }
    double v13 = 0.0;
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_attachmentImageBoundingView, "setFrame:");
    [(UIView *)self->_attachmentImageBoundingView bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    attachmentImageViews = self->_attachmentImageViews;
    if (v12 == 1)
    {
      id v25 = [(NSArray *)attachmentImageViews firstObject];
      objc_msgSend(v25, "setFrame:", v15, v17, v19, v21);
    }
    else
    {
      id v25 = [(NSArray *)attachmentImageViews objectAtIndex:0];
      if ([(NCNotificationAppSectionListSummarizedContentView *)self _shouldReverseLayoutDirection])
      {
        v28.origin.x = v15;
        v28.origin.y = v17;
        v28.size.double width = v19;
        v28.size.double height = v21;
        double v13 = CGRectGetMaxX(v28) + -44.0;
      }
      double v23 = 0.0;
      objc_msgSend(v25, "setFrame:", v13, 0.0, 44.0, 44.0);
      [(NCNotificationAppSectionListSummarizedContentView *)self _configureShadowForAttachmentView:v25];
      v24 = [(NSArray *)self->_attachmentImageViews objectAtIndex:1];
      if (([(NCNotificationAppSectionListSummarizedContentView *)self _shouldReverseLayoutDirection] & 1) == 0)
      {
        v29.origin.x = v15;
        v29.origin.y = v17;
        v29.size.double width = v19;
        v29.size.double height = v21;
        double v23 = CGRectGetMaxX(v29) + -44.0;
      }
      v30.origin.x = v15;
      v30.origin.y = v17;
      v30.size.double width = v19;
      v30.size.double height = v21;
      objc_msgSend(v24, "setFrame:", v23, CGRectGetMaxY(v30) + -44.0, 44.0, 44.0);
      [(UIView *)self->_attachmentImageBoundingView sendSubviewToBack:v24];
      [(NCNotificationAppSectionListSummarizedContentView *)self _configureShadowForAttachmentView:v24];
    }
  }
}

- (void)_layoutTitleLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    [(NCNotificationAppSectionListSummarizedContentView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    -[NCNotificationAppSectionListSummarizedContentView _allowedWidthForTextInRect:](self, "_allowedWidthForTextInRect:");
    double v11 = v10;
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", v5, v7, v10, v9));
    CGFloat v13 = v12;
    int v14 = [(NCNotificationAppSectionListSummarizedContentView *)self _shouldReverseLayoutDirection];
    double v15 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__countBackgroundView;
    if (v14) {
      double v15 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__attachmentImageBoundingView;
    }
    [*(id *)((char *)&self->super.super.super.super.isa + *v15) frame];
    CGFloat v16 = CGRectGetMaxX(v19) + 12.0;
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_titleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationAppSectionListSummarizedContentView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", v5, v7, v11, v9));
    v20.origin.y = 10.0;
    v20.origin.x = v16;
    v20.size.double width = v11;
    v20.size.double height = v13;
    CGRectGetWidth(v20);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    double v17 = self->_titleLabel;
    -[UILabel setFrame:](v17, "setFrame:");
  }
}

- (void)_layoutTitleAndContentStringLabels
{
  if ([(NSArray *)self->_titleAndContentStringLabels count])
  {
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    double v19 = 0.0;
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      [(UILabel *)titleLabel frame];
      double v4 = CGRectGetMaxY(v20) + 1.0;
    }
    else
    {
      double v4 = 10.0;
    }
    double v19 = v4;
    [(NCNotificationAppSectionListSummarizedContentView *)self bounds];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    -[NCNotificationAppSectionListSummarizedContentView _allowedWidthForTextInRect:](self, "_allowedWidthForTextInRect:");
    uint64_t v12 = v11;
    int v13 = [(NCNotificationAppSectionListSummarizedContentView *)self _shouldReverseLayoutDirection];
    int v14 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__countBackgroundView;
    if (v13) {
      int v14 = &OBJC_IVAR___NCNotificationAppSectionListSummarizedContentView__attachmentImageBoundingView;
    }
    [*(id *)((char *)&self->super.super.super.super.isa + *v14) frame];
    CGFloat MaxX = CGRectGetMaxX(v21);
    titleAndContentStringLabels = self->_titleAndContentStringLabels;
    v17[1] = 3221225472;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[2] = __87__NCNotificationAppSectionListSummarizedContentView__layoutTitleAndContentStringLabels__block_invoke;
    v17[3] = &unk_1E6A93998;
    v17[6] = v6;
    v17[7] = v8;
    v17[8] = v12;
    v17[9] = v10;
    v17[4] = self;
    v17[5] = v18;
    v17[10] = v12;
    *(double *)&v17[11] = MaxX + 12.0;
    [(NSArray *)titleAndContentStringLabels enumerateObjectsUsingBlock:v17];
    _Block_object_dispose(v18, 8);
  }
}

void __87__NCNotificationAppSectionListSummarizedContentView__layoutTitleAndContentStringLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v37 = [v3 objectAtIndex:0];
  [v37 frame];
  objc_msgSend(v37, "unui_measuringHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72)));
  CGFloat v5 = v4;
  objc_msgSend(v37, "sizeThatFits:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  if (v6 >= *(double *)(a1 + 80)) {
    double v7 = *(double *)(a1 + 80);
  }
  else {
    double v7 = v6;
  }
  CGFloat v8 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  int v9 = [*(id *)(a1 + 32) _shouldReverseLayoutDirection];
  double v10 = *(double *)(a1 + 88);
  if (v9) {
    double v10 = v10 + *(double *)(a1 + 80) - v7;
  }
  objc_msgSend(v37, "unui_drawingHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72)));
  v39.origin.x = v10;
  v39.origin.y = v8;
  v39.size.double width = v7;
  v39.size.double height = v5;
  CGRectGetWidth(v39);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v37 setFrame:0];
  double v19 = [v3 objectAtIndex:1];

  [v19 frame];
  CGRect v20 = [*(id *)(a1 + 32) preferredContentSizeCategory];
  if (!UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v20))
  {

    goto LABEL_10;
  }
  v40.origin.x = v12;
  v40.origin.y = v14;
  v40.size.double width = v16;
  v40.size.double height = v18;
  double Width = CGRectGetWidth(v40);

  if (Width <= 0.0)
  {
LABEL_10:
    CGFloat rect = v16;
    CGFloat v35 = v14;
    CGFloat v36 = v12;
    double v26 = *(double *)(a1 + 72);
    double v27 = fmax(*(double *)(a1 + 80) - v7 + -2.0, 0.0);
    double v29 = *(double *)(a1 + 48);
    double v28 = *(double *)(a1 + 56);
    objc_msgSend(v19, "unui_measuringHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", v29, v28, v27, v26));
    CGFloat v31 = v30;
    if ([*(id *)(a1 + 32) _shouldReverseLayoutDirection])
    {
      double v32 = *(double *)(a1 + 88);
    }
    else
    {
      v41.origin.y = v35;
      v41.origin.x = v36;
      v41.size.double width = rect;
      v41.size.double height = v18;
      double v32 = CGRectGetMaxX(v41) + 2.0;
    }
    objc_msgSend(v19, "unui_drawingHeightWithNumberOfLines:", objc_msgSend(*(id *)(a1 + 32), "_numberOfLinesForContentTextInFrame:", v29, v28, v27, v26));
    v42.origin.x = v32;
    v42.origin.y = v8;
    v42.size.double width = v27;
    v42.size.double height = v31;
    CGRectGetWidth(v42);
    BSRectWithSize();
    uint64_t v33 = 0;
    UIRectCenteredIntegralRectScale();
    CGFloat v14 = v35;
    CGFloat v12 = v36;
    CGFloat v16 = rect;
    goto LABEL_14;
  }
  double v22 = *MEMORY[0x1E4F1DB28];
  double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_14:
  objc_msgSend(v19, "setFrame:", v22, v23, v24, v25, v33);
  v43.origin.x = v12;
  v43.origin.y = v14;
  v43.size.double width = v16;
  v43.size.double height = v18;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CGRectGetMaxY(v43) + 0.0;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_titleLabel style:0 visualStylingProvider:v7 outgoingProvider:v8];
  titleAndContentStringLabels = self->_titleAndContentStringLabels;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke;
  void v12[3] = &unk_1E6A939E8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [(NSArray *)titleAndContentStringLabels enumerateObjectsUsingBlock:v12];
}

void __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke_2;
  v5[3] = &unk_1E6A939C0;
  double v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [a2 enumerateObjectsUsingBlock:v5];
}

uint64_t __114__NCNotificationAppSectionListSummarizedContentView__visualStylingProviderDidChange_forCategory_outgoingProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateVisualStylingOfView:a2 style:0 visualStylingProvider:*(void *)(a1 + 40) outgoingProvider:*(void *)(a1 + 48)];
}

- (void)_updateTextAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationAppSectionListSummarizedContentView;
  [(NCNotificationListBaseContentView *)&v3 _updateTextAttributes];
  [(NCNotificationAppSectionListSummarizedContentView *)self _updateTextAttributesForCountLabel];
  [(NCNotificationAppSectionListSummarizedContentView *)self _updateTextAttributesForTitleLabel];
  [(NCNotificationAppSectionListSummarizedContentView *)self _updateTextAttributesForTitleAndContentStringLabels];
}

- (void)_updateTextAttributesForCountLabel
{
  if (self->_countLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    CGFloat v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      CGFloat v5 = (id *)MEMORY[0x1E4FB2950];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_countLabel withTextStyle:v6 fontWeight:0 additionalTraits:1 maximumNumberOfLines:*MEMORY[0x1E4FB09E0]];
    [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForTitleLabel
{
  if (self->_titleLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    CGFloat v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      CGFloat v5 = (id *)MEMORY[0x1E4FB2950];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_titleLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCNotificationAppSectionListSummarizedContentView *)self _maximumNumberOfLinesForTitleText] maximumNumberOfLines:*MEMORY[0x1E4FB09E0]];
    [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForTitleAndContentStringLabels
{
  if ([(NSArray *)self->_titleAndContentStringLabels count])
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);
    CGFloat v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      CGFloat v5 = (id *)MEMORY[0x1E4FB28F0];
    }
    id v6 = *v5;

    uint64_t v7 = *MEMORY[0x1E4FB09E0];
    uint64_t v8 = *MEMORY[0x1E4FB09D8];
    titleAndContentStringLabels = self->_titleAndContentStringLabels;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __104__NCNotificationAppSectionListSummarizedContentView__updateTextAttributesForTitleAndContentStringLabels__block_invoke;
    id v14 = &unk_1E6A93A10;
    double v15 = self;
    id v16 = v6;
    uint64_t v17 = v7;
    uint64_t v18 = v8;
    id v10 = v6;
    [(NSArray *)titleAndContentStringLabels enumerateObjectsUsingBlock:&v11];
    [(NCNotificationAppSectionListSummarizedContentView *)self setNeedsLayout];
  }
}

void __104__NCNotificationAppSectionListSummarizedContentView__updateTextAttributesForTitleAndContentStringLabels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 objectAtIndex:0];
  objc_msgSend(*(id *)(a1 + 32), "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", v5, *(void *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "_maximumNumberOfLinesForContentText"), *(double *)(a1 + 48));
  double v4 = [v3 objectAtIndex:1];

  objc_msgSend(*(id *)(a1 + 32), "_updateTextAttributesForLabel:withTextStyle:fontWeight:additionalTraits:maximumNumberOfLines:", v4, *(void *)(a1 + 40), 0, objc_msgSend(*(id *)(a1 + 32), "_maximumNumberOfLinesForContentText"), *(double *)(a1 + 56));
}

- (unint64_t)_maximumNumberOfLinesForTitleText
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  unint64_t v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);

  return v3;
}

- (unint64_t)_maximumNumberOfLinesForContentText
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v2)) {
    unint64_t v3 = 2;
  }
  else {
    unint64_t v3 = 1;
  }

  return v3;
}

- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  titleLabel = self->_titleLabel;
  unint64_t v9 = [(NCNotificationAppSectionListSummarizedContentView *)self _maximumNumberOfLinesForTitleText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", titleLabel, v9, x, y, width, height);
}

- (unint64_t)_numberOfLinesForContentTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(NSArray *)self->_titleAndContentStringLabels firstObject];
  unint64_t v9 = [v8 objectAtIndex:1];

  unint64_t v10 = -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", v9, [(NCNotificationAppSectionListSummarizedContentView *)self _maximumNumberOfLinesForContentText], x, y, width, height);
  return v10;
}

- (void)handleTap:(id)a3
{
  id v4 = [(NCNotificationAppSectionListSummarizedContentView *)self delegate];
  [v4 appSectionListSummarizedContentViewDidRecognizeTapGesture:self];
}

- (id)_newContentStringLabelForText:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v5 _setTextAlignmentFollowsWritingDirection:1];
  [v5 setLineBreakMode:4];
  [(NCNotificationAppSectionListSummarizedContentView *)self addSubview:v5];
  id v6 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:v6 outgoingProvider:0];
  if (v6) {
    [v6 automaticallyUpdateView:v5 withStyle:0];
  }
  [v5 setText:v4];

  return v5;
}

- (void)_configureShadowForAttachmentView:(id)a3
{
  id v4 = [a3 layer];
  [v4 setShadowColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB60])];
  [v4 setShadowRadius:5.0];
  LODWORD(v3) = 1050253722;
  [v4 setShadowOpacity:v3];
  objc_msgSend(v4, "setShadowOffset:", 2.0, 3.0);
}

- (double)_countBackgroundDimensionInRect:(CGRect)a3
{
  -[UILabel sizeThatFits:](self->_countLabel, "sizeThatFits:", a3.size.width, a3.size.height);
  if (v3 < v4) {
    double v3 = v4;
  }
  double result = v3 + 10.0;
  if (result < 40.0) {
    return 40.0;
  }
  return result;
}

- (double)_allowedWidthForTextInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self->_countBackgroundView)
  {
    -[NCNotificationAppSectionListSummarizedContentView _countBackgroundDimensionInRect:](self, "_countBackgroundDimensionInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    double v9 = v8 + 12.0 + 12.0;
  }
  else
  {
    double v9 = 12.0;
  }
  attachmentImageBoundingView = self->_attachmentImageBoundingView;
  if (attachmentImageBoundingView)
  {
    [(UIView *)attachmentImageBoundingView frame];
    double v11 = CGRectGetWidth(v13) + 12.0 + 15.0;
  }
  else
  {
    double v11 = 15.0;
  }
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  return CGRectGetWidth(v14) - v9 - v11;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)titleAndContentStrings
{
  return self->_titleAndContentStrings;
}

- (NSArray)attachmentImageViews
{
  return self->_attachmentImageViews;
}

- (NCNotificationAppSectionListSummarizedContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationAppSectionListSummarizedContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleAndContentStrings, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_attachmentImageViews, 0);
  objc_storeStrong((id *)&self->_attachmentImageBoundingView, 0);
  objc_storeStrong((id *)&self->_titleAndContentStringLabels, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_countBackgroundView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end