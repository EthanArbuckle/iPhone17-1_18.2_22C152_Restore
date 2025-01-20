@interface PKConnectedCollectionViewCell
+ (double)textInsetWithOuterRadius:(double)a3;
- (BOOL)centerPrimaryText;
- (BOOL)showChevron;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)amountText;
- (NSAttributedString)primaryText;
- (NSAttributedString)secondaryText;
- (NSAttributedString)tertiaryText;
- (PKGradientVerticalConnector)bottomConnector;
- (PKGradientVerticalConnector)topConnector;
- (UIColor)amountTextColor;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (UIColor)tertiaryTextColor;
- (UIFont)amountFont;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (double)minimumHeight;
- (unint64_t)targetType;
- (void)_configureView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAmountFont:(id)a3;
- (void)setAmountText:(id)a3;
- (void)setAmountTextColor:(id)a3;
- (void)setBottomConnector:(id)a3;
- (void)setCenterPrimaryText:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setShowChevron:(BOOL)a3;
- (void)setTargetType:(unint64_t)a3;
- (void)setTertiaryText:(id)a3;
- (void)setTertiaryTextColor:(id)a3;
- (void)setTopConnector:(id)a3;
@end

@implementation PKConnectedCollectionViewCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKConnectedCollectionViewCell;
  [(PKConnectedCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKConnectedCollectionViewCell *)self contentView];
  [v3 bounds];
  -[PKConnectedCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKConnectedCollectionViewCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  double v8 = a3.origin.x + 16.0;
  double v9 = a3.origin.y + 16.0;
  double v10 = a3.size.width + -32.0;
  double v11 = a3.size.height + -32.0;
  if ([(PKConnectedCollectionViewCell *)self _shouldReverseLayoutDirection])CGRectEdge v12 = CGRectMaxXEdge; {
  else
  }
    CGRectEdge v12 = CGRectMinXEdge;
  remainder.origin.x = v8;
  remainder.origin.y = v9;
  remainder.size.double width = width + -32.0;
  remainder.size.CGFloat height = v11;
  circleView = self->_circleView;
  if (circleView)
  {
    -[PKConnectedCircleView sizeThatFits:](circleView, "sizeThatFits:", width + -32.0, v11);
    double v15 = v14;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB30];
  }
  memset(&v34, 0, sizeof(v34));
  CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v16;
  if (v15 > 0.0)
  {
    v36.origin.x = v8;
    v36.origin.y = v9;
    v36.size.double width = width + -32.0;
    v36.size.CGFloat height = v11;
    CGRectDivide(v36, &slice, &remainder, v15, v12);
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    slice.origin.x = v17;
    slice.size.double width = v18;
    slice.size.CGFloat height = height;
    slice.origin.y = 0.0;
    CGRectDivide(remainder, &v34, &remainder, 16.0, v12);
    double v10 = remainder.size.width;
    double v11 = remainder.size.height;
  }
  -[PKTitleDetailValueTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, v11);
  double v20 = v19;
  memset(&v31, 0, sizeof(v31));
  CGRectDivide(remainder, &v31, &remainder, v21, v12);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  v31.origin.x = v22;
  v31.origin.y = v23;
  v31.size.double width = v24;
  v31.size.CGFloat height = v25;
  if (!a4)
  {
    -[PKConnectedCircleView setFrame:](self->_circleView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    -[PKTitleDetailValueTextView setFrame:](self->_textView, "setFrame:", *(_OWORD *)&v31.origin, *(_OWORD *)&v31.size);
  }
  double minimumHeight = self->_minimumHeight;
  double v27 = fmax(v20 + 0.0 + 32.0, minimumHeight);
  if (minimumHeight <= 0.0) {
    double v28 = v20 + 0.0 + 32.0;
  }
  else {
    double v28 = v27;
  }
  [(PKConnectedCircleView *)self->_circleView setNeedsDisplay];
  double v29 = width;
  double v30 = v28;
  result.CGFloat height = v30;
  result.double width = v29;
  return result;
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setPrimaryText:v4];
}

- (void)setAmountText:(id)a3
{
}

- (void)setSecondaryText:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setSecondaryText:v4];
}

- (void)setTertiaryText:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setTertiaryText:v4];
}

- (void)setShowChevron:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  textView = self->_textView;

  [(PKTitleDetailValueTextView *)textView setAccessory:v3];
}

- (void)setCenterPrimaryText:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  textView = self->_textView;

  [(PKTitleDetailValueTextView *)textView setCenterPrimaryText:v3];
}

- (void)setPrimaryTextColor:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setPrimaryTextColor:v4];
}

- (void)setAmountTextColor:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setAmountTextColor:v4];
}

- (void)setSecondaryTextColor:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setSecondaryTextColor:v4];
}

- (void)setTertiaryTextColor:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setTertiaryTextColor:v4];
}

- (void)setPrimaryFont:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setPrimaryFont:v4];
}

- (void)setSecondaryFont:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setSecondaryFont:v4];
}

- (void)setAmountFont:(id)a3
{
  id v4 = a3;
  [(PKConnectedCollectionViewCell *)self _configureView];
  [(PKTitleDetailValueTextView *)self->_textView setAmountFont:v4];
}

- (void)setTopConnector:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_topConnector, a3);
    [(PKConnectedCollectionViewCell *)self _configureView];
  }
}

- (void)setBottomConnector:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_bottomConnector, a3);
    [(PKConnectedCollectionViewCell *)self _configureView];
  }
}

- (void)setTargetType:(unint64_t)a3
{
  if (self->_targetType != a3)
  {
    self->_targetType = a3;
    [(PKConnectedCollectionViewCell *)self _configureView];
  }
}

+ (double)textInsetWithOuterRadius:(double)a3
{
  return a3 * 2.0 + 32.0;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(PKConnectedCollectionViewCell *)self isHighlighted] & 1) == 0 && !self->_backgroundColor)
  {
    id v5 = [(PKConnectedCollectionViewCell *)self backgroundConfiguration];
    v6 = [v5 backgroundColor];
    v7 = v6;
    if (v6)
    {
      double v8 = v6;
    }
    else
    {
      double v8 = [(PKConnectedCollectionViewCell *)self backgroundColor];
    }
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v8;
  }
  v15.receiver = self;
  v15.super_class = (Class)PKConnectedCollectionViewCell;
  [(PKConnectedCollectionViewCell *)&v15 setHighlighted:v3];
  if (v3)
  {
    double v10 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    double v10 = self->_backgroundColor;
  }
  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__PKConnectedCollectionViewCell_setHighlighted___block_invoke;
  v13[3] = &unk_1E59CA870;
  v13[4] = self;
  double v14 = v10;
  CGRectEdge v12 = v10;
  [v11 _animateUsingDefaultTimingWithOptions:0 animations:v13 completion:0];
}

uint64_t __48__PKConnectedCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)PKConnectedCollectionViewCell;
  [(PKConnectedCollectionViewCell *)&v7 prepareForReuse];
  [(PKTitleDetailValueTextView *)self->_textView removeFromSuperview];
  [(PKConnectedCircleView *)self->_circleView removeFromSuperview];
  topConnector = self->_topConnector;
  self->_topConnector = 0;

  bottomConnector = self->_bottomConnector;
  self->_bottomConnector = 0;

  textView = self->_textView;
  self->_textView = 0;

  circleView = self->_circleView;
  self->_circleView = 0;

  self->_double minimumHeight = 0.0;
  self->_targetType = 0;
}

- (void)_configureView
{
  if (!self->_textView)
  {
    BOOL v3 = objc_alloc_init(PKTitleDetailValueTextView);
    textView = self->_textView;
    self->_textView = v3;

    id v5 = [(PKConnectedCollectionViewCell *)self contentView];
    [v5 addSubview:self->_textView];
  }
  circleView = self->_circleView;
  if (self->_targetType == 1)
  {
    [(PKConnectedCircleView *)circleView removeFromSuperview];
    objc_super v7 = self->_circleView;
    self->_circleView = 0;
  }
  else
  {
    if (circleView) {
      goto LABEL_8;
    }
    double v8 = objc_alloc_init(PKConnectedCircleView);
    double v9 = self->_circleView;
    self->_circleView = v8;

    objc_super v7 = [(PKConnectedCollectionViewCell *)self contentView];
    [v7 addSubview:self->_circleView];
  }

  circleView = self->_circleView;
LABEL_8:
  [(PKConnectedCircleView *)circleView setTopConnector:self->_topConnector];
  [(PKConnectedCircleView *)self->_circleView setBottomConnector:self->_bottomConnector];
  switch(self->_targetType)
  {
    case 0uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedClearCircleView();
      goto LABEL_16;
    case 2uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedCircleEmptyView();
      goto LABEL_16;
    case 3uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedCircleTargetView();
      goto LABEL_16;
    case 4uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedCircleTargetDisabledView();
      goto LABEL_16;
    case 5uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedCircleCheckmarkView();
      goto LABEL_16;
    case 6uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedCircleCheckmarkDisabledView();
      goto LABEL_16;
    case 7uLL:
      double v10 = self->_circleView;
      uint64_t v11 = PKPayLaterPaymentScheduleConnectedCircleFlagView();
LABEL_16:
      CGRectEdge v12 = (void *)v11;
      [(PKConnectedCircleView *)v10 setTargetView:v11];

      break;
    default:
      break;
  }
  [(PKConnectedCollectionViewCell *)self setNeedsLayout];
  [(PKConnectedCircleView *)self->_circleView setNeedsDisplay];
  uint64_t v13 = *MEMORY[0x1E4F858A0];

  [(PKConnectedCollectionViewCell *)self setAccessibilityIdentifier:v13];
}

- (NSAttributedString)primaryText
{
  return self->_primaryText;
}

- (NSAttributedString)secondaryText
{
  return self->_secondaryText;
}

- (NSAttributedString)tertiaryText
{
  return self->_tertiaryText;
}

- (NSAttributedString)amountText
{
  return self->_amountText;
}

- (BOOL)showChevron
{
  return self->_showChevron;
}

- (BOOL)centerPrimaryText
{
  return self->_centerPrimaryText;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_double minimumHeight = a3;
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (UIColor)tertiaryTextColor
{
  return self->_tertiaryTextColor;
}

- (UIColor)amountTextColor
{
  return self->_amountTextColor;
}

- (UIFont)primaryFont
{
  return self->_primaryFont;
}

- (UIFont)secondaryFont
{
  return self->_secondaryFont;
}

- (UIFont)amountFont
{
  return self->_amountFont;
}

- (PKGradientVerticalConnector)topConnector
{
  return self->_topConnector;
}

- (PKGradientVerticalConnector)bottomConnector
{
  return self->_bottomConnector;
}

- (unint64_t)targetType
{
  return self->_targetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConnector, 0);
  objc_storeStrong((id *)&self->_topConnector, 0);
  objc_storeStrong((id *)&self->_amountFont, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_primaryFont, 0);
  objc_storeStrong((id *)&self->_amountTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_amountText, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_circleView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end