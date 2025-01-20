@interface PKDashboardBalanceView
- (BOOL)showDisclosure;
- (BOOL)topUpEnabled;
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)availableCredit;
- (NSString)balance;
- (NSString)title;
- (NSString)topUpTitle;
- (PKDashboardBalanceView)initWithFrame:(CGRect)a3;
- (UIColor)titleColor;
- (id)topUpAction;
- (void)_buttonPressed:(id)a3;
- (void)createSubviews;
- (void)layoutSubviews;
- (void)resetFonts;
- (void)setAvailableCredit:(id)a3;
- (void)setBalance:(id)a3;
- (void)setShowDisclosure:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTopUpAction:(id)a3;
- (void)setTopUpEnabled:(BOOL)a3;
- (void)setTopUpTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKDashboardBalanceView

- (PKDashboardBalanceView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardBalanceView;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKDashboardBalanceView *)v3 createSubviews];
    [(PKDashboardCollectionViewCell *)v4 setMaskType:3];
    [(PKDashboardCollectionViewCell *)v4 setWantsCustomAppearance:0];
    v4->_topUpEnabled = 1;
  }
  return v4;
}

- (void)createSubviews
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  v5 = self->_titleLabel;
  objc_super v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v5 setTextColor:v6];

  [(UILabel *)self->_titleLabel setNumberOfLines:1];
  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [(PKDashboardBalanceView *)self addSubview:self->_titleLabel];
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  detailLabel = self->_detailLabel;
  self->_detailLabel = v7;

  v9 = self->_detailLabel;
  v10 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v9 setTextColor:v10];

  [(UILabel *)self->_detailLabel setNumberOfLines:0];
  [(UILabel *)self->_detailLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  [(PKDashboardBalanceView *)self addSubview:self->_detailLabel];
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  availableCreditLabel = self->_availableCreditLabel;
  self->_availableCreditLabel = v11;

  [(UILabel *)self->_availableCreditLabel setNumberOfLines:1];
  v13 = self->_availableCreditLabel;
  v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v13 setTextColor:v14];

  [(UILabel *)self->_availableCreditLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  [(PKDashboardBalanceView *)self addSubview:self->_availableCreditLabel];
  uint64_t v29 = 0x4034000000000000;
  long long v30 = xmmword_1A040E960;
  int64x2_t v31 = vdupq_n_s64(2uLL);
  v15 = [[PKContinuousButton alloc] initWithConfiguration:&v29];
  actionButton = self->_actionButton;
  self->_actionButton = v15;

  v17 = self->_actionButton;
  v18 = [MEMORY[0x1E4FB1618] labelColor];
  [(PKContinuousButton *)v17 setTintColor:v18];

  v19 = self->_actionButton;
  v20 = [(id)objc_opt_class() defaultBackgroundColor];
  [(PKContinuousButton *)v19 updateTitleColorWithColor:v20];

  -[PKContinuousButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 10.0, 16.0, 10.0, 16.0);
  [(PKContinuousButton *)self->_actionButton addTarget:self action:sel__buttonPressed_ forControlEvents:64];
  [(PKContinuousButton *)self->_actionButton setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
  [(PKDashboardBalanceView *)self addSubview:self->_actionButton];
  v21 = [MEMORY[0x1E4FB1830] configurationWithWeight:6];
  v22 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  v23 = [v21 configurationByApplyingConfiguration:v22];

  v24 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v23];
  v25 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v24];
  disclosureView = self->_disclosureView;
  self->_disclosureView = v25;

  v27 = self->_disclosureView;
  v28 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIImageView *)v27 setTintColor:v28];

  [(PKDashboardBalanceView *)self addSubview:self->_disclosureView];
  [(PKDashboardBalanceView *)self resetFonts];
  [(PKDashboardBalanceView *)self setAccessibilityIdentifier:*MEMORY[0x1E4F852A8]];
}

- (void)resetFonts
{
  titleLabel = self->_titleLabel;
  v4 = (void *)*MEMORY[0x1E4FB28C8];
  v5 = (void *)*MEMORY[0x1E4FB2790];
  objc_super v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)titleLabel setFont:v6];

  detailLabel = self->_detailLabel;
  v8 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], (void *)*MEMORY[0x1E4FB2988], v5, 32770, 0, *MEMORY[0x1E4FB09B8]);
  [(UILabel *)detailLabel setFont:v8];

  availableCreditLabel = self->_availableCreditLabel;
  v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)v5);
  [(UILabel *)availableCreditLabel setFont:v10];

  id v12 = [(PKContinuousButton *)self->_actionButton titleLabel];
  v11 = PKFontForDefaultDesign(v4, (void *)*MEMORY[0x1E4FB27B0], 2, 0);
  [v12 setFont:v11];
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  title = self->_title;
  v10 = (NSString *)v4;
  objc_super v6 = title;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_title;
    self->_title = v8;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKDashboardBalanceView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTitleColor:(id)a3
{
  p_titleColor = &self->_titleColor;
  id v8 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleColor, a3);
    titleLabel = self->_titleLabel;
    if (*p_titleColor)
    {
      -[UILabel setTextColor:](self->_titleLabel, "setTextColor:");
    }
    else
    {
      BOOL v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)titleLabel setTextColor:v7];
    }
    [(PKDashboardBalanceView *)self setNeedsLayout];
  }
}

- (void)setBalance:(id)a3
{
  id v5 = a3;
  balance = self->_balance;
  v9 = (NSString *)v5;
  BOOL v7 = balance;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_balance, a3);
    [(UILabel *)self->_detailLabel setText:self->_balance];
    [(PKDashboardBalanceView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setAvailableCredit:(id)a3
{
  id v5 = a3;
  availableCredit = self->_availableCredit;
  v9 = (NSString *)v5;
  BOOL v7 = availableCredit;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_availableCredit, a3);
    [(UILabel *)self->_availableCreditLabel setText:self->_availableCredit];
    [(PKDashboardBalanceView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTopUpTitle:(id)a3
{
  id v5 = a3;
  topUpTitle = self->_topUpTitle;
  v9 = (NSString *)v5;
  BOOL v7 = topUpTitle;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(NSString *)v9 isEqualToString:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_topUpTitle, a3);
    [(PKContinuousButton *)self->_actionButton setTitle:self->_topUpTitle forState:0];
    [(PKDashboardBalanceView *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setTopUpAction:(id)a3
{
  id v4 = _Block_copy(a3);
  id topUpAction = self->_topUpAction;
  self->_id topUpAction = v4;

  [(PKContinuousButton *)self->_actionButton setHidden:self->_topUpAction == 0];

  [(PKDashboardBalanceView *)self setNeedsLayout];
}

- (void)setTopUpEnabled:(BOOL)a3
{
  if (((!self->_topUpEnabled ^ a3) & 1) == 0)
  {
    self->_topUpEnabled = a3;
    -[PKContinuousButton setEnabled:](self->_actionButton, "setEnabled:");
    actionButton = self->_actionButton;
    if (self->_topUpEnabled)
    {
      id v5 = [MEMORY[0x1E4FB1618] labelColor];
      [(PKContinuousButton *)actionButton setTintColor:v5];

      objc_super v6 = self->_actionButton;
      uint64_t v7 = [(id)objc_opt_class() defaultBackgroundColor];
      BOOL v8 = v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] systemFillColor];
      [(PKContinuousButton *)actionButton setTintColor:v9];

      v10 = self->_actionButton;
      uint64_t v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      BOOL v8 = v10;
    }
    id v11 = (id)v7;
    -[PKContinuousButton updateTitleColorWithColor:](v8, "updateTitleColorWithColor:");
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardBalanceView;
  [(PKDashboardCollectionViewCell *)&v3 layoutSubviews];
  [(PKDashboardBalanceView *)self bounds];
  [(PKDashboardBalanceView *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->_isTemplateLayout = 1;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  -[PKDashboardBalanceView _layoutWithBounds:](self, "_layoutWithBounds:", v6, v7, width + v8 * -2.0, height);
  self->_isTemplateLayout = 0;
  double v11 = fmin(height, 80.0);
  if (v10 < 80.0) {
    double v10 = v11;
  }
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  double v4 = a3.origin.x + 13.0;
  double v5 = a3.origin.y + 16.0;
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  double v6 = a3.size.width + -26.0;
  double v7 = a3.size.height + -32.0;
  if ([(PKDashboardBalanceView *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v8 = CGRectMinXEdge;
  }
  else {
    CGRectEdge v8 = CGRectMaxXEdge;
  }
  remainder.origin.CGFloat x = v4;
  remainder.origin.CGFloat y = v5;
  remainder.size.CGFloat width = v6;
  remainder.size.CGFloat height = v7;
  double v9 = [(UILabel *)self->_titleLabel font];
  [v9 pointSize];
  double v11 = v10;

  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, v7);
  double v44 = v12;
  CGFloat v47 = v13;
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", v6, v7);
  double v15 = v14;
  -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v6, v7);
  double v17 = v16;
  CGFloat v48 = v18;
  if (self->_showDisclosure)
  {
    -[UIImageView sizeThatFits:](self->_disclosureView, "sizeThatFits:", v6, v7);
    double v20 = v19;
    uint64_t v43 = v21;
  }
  else
  {
    double v20 = *MEMORY[0x1E4F1DB30];
    uint64_t v43 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v11 < 30.0 && fmax(v44, v15) + v17 + v20 + 26.0 <= v6)
  {
    [(UILabel *)self->_titleLabel setNumberOfLines:2];
    v22 = [(PKContinuousButton *)self->_actionButton titleLabel];
    [v22 setNumberOfLines:1];
    char v23 = 0;
  }
  else
  {
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0, v43);
    v22 = [(PKContinuousButton *)self->_actionButton titleLabel];
    [v22 setNumberOfLines:0];
    char v23 = 1;
  }

  memset(&slice, 0, sizeof(slice));
  if (v17 <= v6) {
    CGFloat v24 = v17;
  }
  else {
    CGFloat v24 = v6;
  }
  if (self->_showDisclosure)
  {
    v54.origin.CGFloat x = v4;
    v54.origin.CGFloat y = v5;
    v54.size.CGFloat width = v6;
    v54.size.CGFloat height = v7;
    CGRectDivide(v54, &slice, &remainder, v20, v8);
    if (!self->_isTemplateLayout)
    {
      disclosureView = self->_disclosureView;
      PKSizeAlignedInRect();
      -[UIImageView setFrame:](disclosureView, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, 13.0, v8);
  }
  else
  {
    -[UIImageView setFrame:](self->_disclosureView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  id topUpAction = self->_topUpAction;
  if (topUpAction) {
    char v27 = v23;
  }
  else {
    char v27 = 1;
  }
  if ((v27 & 1) == 0)
  {
    CGRectDivide(remainder, &slice, &remainder, v24, v8);
    if (!self->_isTemplateLayout)
    {
      actionButton = self->_actionButton;
      PKSizeAlignedInRect();
      -[PKContinuousButton setFrame:](actionButton, "setFrame:");
    }
    CGRectDivide(remainder, &slice, &remainder, 4.0, v8);
    id topUpAction = self->_topUpAction;
  }
  BOOL v29 = topUpAction == 0;
  char v30 = v23 ^ 1;
  if (v29) {
    char v30 = 1;
  }
  if (v30) {
    PKContentAlignmentMake();
  }
  CGRectDivide(remainder, &slice, &remainder, v47, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    titleLabel = self->_titleLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](titleLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", remainder.size.width, remainder.size.height, v43);
  double v33 = v32;
  CGRectDivide(remainder, &slice, &remainder, v32, CGRectMinYEdge);
  if (!self->_isTemplateLayout)
  {
    detailLabel = self->_detailLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](detailLabel, "setFrame:");
  }
  double v35 = v47 + 16.0 + v33;
  if ([(NSString *)self->_availableCredit length])
  {
    -[UILabel sizeThatFits:](self->_availableCreditLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v37 = v36;
    CGRectDivide(remainder, &slice, &remainder, v36, CGRectMinYEdge);
    double v35 = v35 + v37;
    if (!self->_isTemplateLayout)
    {
      availableCreditLabel = self->_availableCreditLabel;
      PKSizeAlignedInRect();
      -[UILabel setFrame:](availableCreditLabel, "setFrame:");
    }
  }
  char v39 = v23 ^ 1;
  if (!self->_topUpAction) {
    char v39 = 1;
  }
  if ((v39 & 1) == 0)
  {
    CGRectDivide(remainder, &slice, &remainder, 1.0, CGRectMinYEdge);
    CGRectDivide(remainder, &slice, &remainder, v48, CGRectMinYEdge);
    double v35 = v48 + 1.0 + v35;
    if (!self->_isTemplateLayout)
    {
      if (self->_topUpAction)
      {
        v40 = self->_actionButton;
        PKSizeAlignedInRect();
        -[PKContinuousButton setFrame:](v40, "setFrame:");
      }
    }
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, CGRectMinYEdge);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  double v41 = CGRectGetWidth(v55);
  double v42 = v35 + 16.0;
  result.CGFloat height = v42;
  result.CGFloat width = v41;
  return result;
}

- (void)_buttonPressed:(id)a3
{
  id topUpAction = (void (**)(void))self->_topUpAction;
  if (topUpAction) {
    topUpAction[2]();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardBalanceView;
  [(PKDashboardBalanceView *)&v10 traitCollectionDidChange:v4];
  uint64_t v5 = [(PKDashboardBalanceView *)self traitCollection];
  double v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      double v7 = [v4 preferredContentSizeCategory];
      CGRectEdge v8 = [v6 preferredContentSizeCategory];
      NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

      if (v9) {
        [(PKDashboardBalanceView *)self resetFonts];
      }
    }
  }
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (NSString)balance
{
  return self->_balance;
}

- (NSString)availableCredit
{
  return self->_availableCredit;
}

- (NSString)topUpTitle
{
  return self->_topUpTitle;
}

- (id)topUpAction
{
  return self->_topUpAction;
}

- (BOOL)topUpEnabled
{
  return self->_topUpEnabled;
}

- (BOOL)showDisclosure
{
  return self->_showDisclosure;
}

- (void)setShowDisclosure:(BOOL)a3
{
  self->_showDisclosure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_topUpAction, 0);
  objc_storeStrong((id *)&self->_topUpTitle, 0);
  objc_storeStrong((id *)&self->_availableCredit, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_availableCreditLabel, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end