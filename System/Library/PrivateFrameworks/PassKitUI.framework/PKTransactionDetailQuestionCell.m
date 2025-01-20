@interface PKTransactionDetailQuestionCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKTransactionDetailQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKTransactionDetailQuestionCellDelegate)questionDelegate;
- (id)_createButton;
- (void)_enableButtons:(BOOL)a3;
- (void)_leadingButtonTapped:(id)a3;
- (void)_trailingButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setQuestionDelegate:(id)a3;
- (void)setTransaction:(id)a3 accountUserContact:(id)a4 submittingAnswer:(id)a5;
@end

@implementation PKTransactionDetailQuestionCell

- (PKTransactionDetailQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)PKTransactionDetailQuestionCell;
  v4 = [(PKTransactionDetailQuestionCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v4->_smallDevice = PKUIGetMinScreenWidthType() == 0;
    v5 = [(PKTransactionDetailQuestionCell *)v4 contentView];
    v6 = PKPassKitUIBundle();
    v29 = [v6 URLForResource:@"MessageAlert" withExtension:@"pdf"];

    double v7 = PKUIScreenScale();
    v8 = PKUIImageFromPDF(v29, 45.0, 45.0, v7);
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8];
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v9;

    [v5 addSubview:v4->_imageView];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    title = v4->_title;
    v4->_title = v11;

    v13 = v4->_title;
    v14 = (NSString *)*MEMORY[0x1E4FB2790];
    v15 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2790], 2, 0);
    [(UILabel *)v13 setFont:v15];

    [(UILabel *)v4->_title setNumberOfLines:2];
    [(UILabel *)v4->_title setAdjustsFontSizeToFitWidth:1];
    v16 = v4->_title;
    v17 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v16 setTextColor:v17];

    [(UILabel *)v4->_title setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [v5 addSubview:v4->_title];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    message = v4->_message;
    v4->_message = v18;

    v20 = v4->_message;
    v21 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], v14);
    [(UILabel *)v20 setFont:v21];

    [(UILabel *)v4->_message setNumberOfLines:0];
    [(UILabel *)v4->_message setAdjustsFontSizeToFitWidth:1];
    v22 = v4->_message;
    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v22 setTextColor:v23];

    [(UILabel *)v4->_message setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(UILabel *)v4->_message setMinimumScaleFactor:0.8];
    [v5 addSubview:v4->_message];
    uint64_t v24 = [(PKTransactionDetailQuestionCell *)v4 _createButton];
    leadingButton = v4->_leadingButton;
    v4->_leadingButton = (PKLegacyButtonInterface *)v24;

    [(PKLegacyButtonInterface *)v4->_leadingButton addTarget:v4 action:sel__leadingButtonTapped_ forControlEvents:64];
    [(PKLegacyButtonInterface *)v4->_leadingButton setAccessibilityIdentifier:*MEMORY[0x1E4F85668]];
    [v5 addSubview:v4->_leadingButton];
    uint64_t v26 = [(PKTransactionDetailQuestionCell *)v4 _createButton];
    trailingButton = v4->_trailingButton;
    v4->_trailingButton = (PKLegacyButtonInterface *)v26;

    [(PKLegacyButtonInterface *)v4->_trailingButton addTarget:v4 action:sel__trailingButtonTapped_ forControlEvents:64];
    [(PKLegacyButtonInterface *)v4->_trailingButton setAccessibilityIdentifier:*MEMORY[0x1E4F85AC8]];
    [v5 addSubview:v4->_trailingButton];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKTransactionDetailQuestionCell;
  [(PKTransactionDetailQuestionCell *)&v3 layoutSubviews];
  [(PKTransactionDetailQuestionCell *)self bounds];
  [(PKTransactionDetailQuestionCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(UILabel *)self->_title text];

  if (v6)
  {
    self->_isTemplateLayout = 1;
    -[PKTransactionDetailQuestionCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
    self->_isTemplateLayout = 0;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
    double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&slice, 0, sizeof(slice));
  CGRect remainder = a3;
  double v8 = [(PKTransactionDetailQuestionCell *)self traitCollection];
  uint64_t v9 = [v8 preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v9);

  int v11 = [(PKTransactionDetailQuestionCell *)self _shouldReverseLayoutDirection];
  if (v11) {
    CGRectEdge v12 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v12 = CGRectMinXEdge;
  }
  if (v11) {
    CGRectEdge v13 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v13 = CGRectMaxXEdge;
  }
  CGFloat v14 = PKUIPixelLength() * 3.0;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.double width = width;
  v38.size.CGFloat height = height;
  CGRectDivide(v38, &slice, &remainder, v14, CGRectMinYEdge);
  double v15 = PKUIPixelLength() * 3.0 + 0.0;
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinXEdge);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMaxXEdge);
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
  double v16 = v15 + 16.0;
  if (self->_smallDevice) {
    double v17 = 30.0;
  }
  else {
    double v17 = 45.0;
  }
  memset(&v34, 0, sizeof(v34));
  memset(&v33, 0, sizeof(v33));
  memset(&v32, 0, sizeof(v32));
  CGFloat v18 = remainder.origin.x;
  CGFloat v19 = remainder.origin.y;
  CGFloat v20 = remainder.size.width;
  CGFloat v21 = remainder.size.height;
  if (IsAccessibilityCategory)
  {
    CGRectDivide(*(CGRect *)&v18, &v34, &remainder, v17, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 10.0, CGRectMinYEdge);
    CGRectDivide(v34, &v34, &v33, v17, v12);
    double v16 = v16 + v17 + 10.0;
  }
  else
  {
    CGRectDivide(*(CGRect *)&v18, &v32, &remainder, v17, v12);
    CGRectDivide(v32, &v34, &v33, 10.0, CGRectMinYEdge);
    CGRectDivide(v33, &v34, &v33, v17, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, 12.0, v12);
  }
  if (!self->_isTemplateLayout) {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
  }
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v23 = v22;
  CGRectDivide(remainder, &slice, &remainder, v22, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_title, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(remainder, &slice, &remainder, 6.0, CGRectMinYEdge);
  -[UILabel sizeThatFits:](self->_message, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v25 = v24;
  CGRectDivide(remainder, &slice, &remainder, v24, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_message, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
  remainder.origin.CGFloat x = 16.0;
  remainder.size.double width = width + -32.0;
  -[PKLegacyButtonInterface sizeThatFits:](self->_leadingButton, "sizeThatFits:");
  double v27 = v26;
  if (!self->_isTemplateLayout)
  {
    memset(&v31, 0, sizeof(v31));
    CGRectDivide(remainder, &v31, &remainder, v26, CGRectMinYEdge);
    PKFloatRoundToPixel();
    CGRectDivide(v31, &slice, &v31, v28, v12);
    -[PKLegacyButtonInterface setFrame:](self->_leadingButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    CGRectDivide(v31, &slice, &v31, v31.size.width + -10.0, v13);
    -[PKLegacyButtonInterface setFrame:](self->_trailingButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v29 = v16 + v23 + 6.0 + v25 + 16.0 + v27 + 16.0;
  double v30 = width;
  result.CGFloat height = v29;
  result.double width = v30;
  return result;
}

- (void)setTransaction:(id)a3 accountUserContact:(id)a4 submittingAnswer:(id)a5
{
  id v33 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_transaction, a3);
  p_accountUserContact = &self->_accountUserContact;
  objc_storeStrong((id *)&self->_accountUserContact, a4);
  p_submittingAnswer = (id *)&self->_submittingAnswer;
  objc_storeStrong((id *)&self->_submittingAnswer, a5);
  transaction = self->_transaction;
  if (transaction)
  {
    uint64_t v14 = [(PKPaymentTransaction *)transaction effectiveTransactionSource];
    if (*p_accountUserContact)
    {
      double v15 = [(CNContact *)*p_accountUserContact givenName];
      title = self->_title;
      double v17 = PKLocalizedMadisonString(&cfstr_PaymentTransac_24.isa, &stru_1EF1B4C70.isa, v15);
      [(UILabel *)title setText:v17];

      message = self->_message;
      if (v14 == 6) {
        PKLocalizedMadisonString(&cfstr_PaymentTransac_25.isa, &stru_1EF1B5770.isa, v15, v15);
      }
      else {
      CGFloat v22 = PKLocalizedMadisonString(&cfstr_PaymentTransac_26.isa, &stru_1EF1B4C70.isa, v15);
      }
      [(UILabel *)message setText:v22];
    }
    else
    {
      CGFloat v19 = self->_title;
      CGFloat v20 = PKLocalizedFeatureString();
      [(UILabel *)v19 setText:v20];

      CGFloat v21 = self->_message;
      double v15 = PKLocalizedFeatureString();
      [(UILabel *)v21 setText:v15];
    }

    leadingButton = self->_leadingButton;
    CGFloat v24 = PKLocalizedFeatureString();
    [(PKLegacyButtonInterface *)leadingButton setTitle:v24 forState:0];

    trailingButton = self->_trailingButton;
    CGFloat v26 = PKLocalizedFeatureString();
    [(PKLegacyButtonInterface *)trailingButton setTitle:v26 forState:0];
  }
  else
  {
    [(UILabel *)self->_title setText:0];
    [(UILabel *)self->_message setText:0];
    [(PKLegacyButtonInterface *)self->_leadingButton setTitle:0 forState:0];
    [(PKLegacyButtonInterface *)self->_trailingButton setTitle:0 forState:0];
  }
  if (!*p_submittingAnswer)
  {
    [(PKTransactionDetailQuestionCell *)self _enableButtons:1];
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    goto LABEL_21;
  }
  [(PKTransactionDetailQuestionCell *)self _enableButtons:0];
  id v27 = (id)*MEMORY[0x1E4F87C20];
  id v28 = *p_submittingAnswer;
  if (v27 == v28)
  {

    goto LABEL_18;
  }
  double v29 = v28;
  if (v27 && v28)
  {
    char v30 = [v27 isEqualToString:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_20;
    }
LABEL_18:
    uint64_t v32 = 0;
    uint64_t v31 = 1;
    goto LABEL_21;
  }

LABEL_20:
  uint64_t v31 = 0;
  uint64_t v32 = 1;
LABEL_21:
  [(PKLegacyButtonInterface *)self->_leadingButton setShowSpinner:v31];
  [(PKLegacyButtonInterface *)self->_trailingButton setShowSpinner:v32];
  [(PKTransactionDetailQuestionCell *)self setNeedsLayout];
}

- (void)_trailingButtonTapped:(id)a3
{
  id v5 = [(PKPaymentTransaction *)self->_transaction unansweredQuestions];
  if ([v5 count])
  {
    [(PKTransactionDetailQuestionCell *)self _enableButtons:0];
    [(PKLegacyButtonInterface *)self->_trailingButton setShowSpinner:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_questionDelegate);
    [WeakRetained submitAnswer:*MEMORY[0x1E4F87C18]];
  }
}

- (void)_leadingButtonTapped:(id)a3
{
  id v5 = [(PKPaymentTransaction *)self->_transaction unansweredQuestions];
  if ([v5 count])
  {
    [(PKTransactionDetailQuestionCell *)self _enableButtons:0];
    [(PKLegacyButtonInterface *)self->_leadingButton setShowSpinner:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_questionDelegate);
    [WeakRetained submitAnswer:*MEMORY[0x1E4F87C20]];
  }
}

- (void)_enableButtons:(BOOL)a3
{
  BOOL v3 = a3;
  -[PKLegacyButtonInterface setEnabled:](self->_leadingButton, "setEnabled:");
  trailingButton = self->_trailingButton;

  [(PKLegacyButtonInterface *)trailingButton setEnabled:v3];
}

- (id)_createButton
{
  v2 = PKCreateLargeSolidButton();
  objc_msgSend(v2, "setContentEdgeInsets:", 12.0, 16.0, 12.0, 16.0);
  BOOL v3 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
  [v2 setTintColor:v3];

  v4 = [MEMORY[0x1E4FB1618] labelColor];
  [v2 updateTitleColorWithColor:v4];

  id v5 = [v2 titleLabel];
  v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [v5 setFont:v6];

  double v7 = [v2 titleLabel];
  [v7 setAdjustsFontSizeToFitWidth:1];

  double v8 = [MEMORY[0x1E4FB1618] labelColor];
  [v2 updateActivityIndicatorColorWithColor:v8];

  return v2;
}

- (PKTransactionDetailQuestionCellDelegate)questionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_questionDelegate);

  return (PKTransactionDetailQuestionCellDelegate *)WeakRetained;
}

- (void)setQuestionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_questionDelegate);
  objc_storeStrong((id *)&self->_submittingAnswer, 0);
  objc_storeStrong((id *)&self->_accountUserContact, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end