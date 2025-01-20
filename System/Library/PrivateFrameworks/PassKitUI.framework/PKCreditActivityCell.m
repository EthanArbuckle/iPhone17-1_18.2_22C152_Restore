@interface PKCreditActivityCell
- (BOOL)useAccessibilityLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)rewardsSummary;
- (NSString)title;
- (PKCreditActivityCell)initWithFrame:(CGRect)a3;
- (PKDashboardCreditAccountItem)item;
- (PKSpendingSummaryChartView)chartView;
- (UIColor)rewardsSummaryTextColor;
- (UIFont)rewardsSummaryFont;
- (UIFont)titleFont;
- (void)_createSubviews;
- (void)layoutSubviews;
- (void)setItem:(id)a3;
- (void)setRewardsSummary:(id)a3;
- (void)setRewardsSummaryFont:(id)a3;
- (void)setRewardsSummaryTextColor:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setUseAccessibilityLayout:(BOOL)a3;
@end

@implementation PKCreditActivityCell

- (PKCreditActivityCell)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCreditActivityCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_isCompactUI = PKUIGetMinScreenWidthType() == 0;
    [(PKCreditActivityCell *)v3 _createSubviews];
  }
  return v3;
}

- (void)_createSubviews
{
  id v12 = [(PKCreditActivityCell *)self contentView];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelTitle = self->_labelTitle;
  self->_labelTitle = v3;

  [(UILabel *)self->_labelTitle setNumberOfLines:1];
  [(UILabel *)self->_labelTitle setAdjustsFontSizeToFitWidth:1];
  objc_super v5 = self->_labelTitle;
  v6 = [MEMORY[0x1E4FB1618] labelColor];
  [(UILabel *)v5 setTextColor:v6];

  [(UILabel *)self->_labelTitle setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  [v12 addSubview:self->_labelTitle];
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  labelRewardsSummary = self->_labelRewardsSummary;
  self->_labelRewardsSummary = v7;

  [(UILabel *)self->_labelRewardsSummary setNumberOfLines:1];
  [(UILabel *)self->_labelRewardsSummary setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_labelRewardsSummary setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  if (PKRewardsCenterEnabled()) {
    [v12 addSubview:self->_labelRewardsSummary];
  }
  v9 = [PKSpendingSummaryChartView alloc];
  v10 = -[PKSpendingSummaryChartView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  chartView = self->_chartView;
  self->_chartView = v10;

  [(PKSpendingSummaryChartView *)self->_chartView setShowLegendGraph:0];
  [(PKSpendingSummaryChartView *)self->_chartView setShowPlaceholders:1];
  [(PKSpendingSummaryChartView *)self->_chartView setShowLegendLabels:0];
  [v12 addSubview:self->_chartView];
  [(PKCreditActivityCell *)self setAccessibilityIdentifier:*MEMORY[0x1E4F851C0]];
}

- (void)setTitleFont:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_labelTitle font];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_labelTitle setFont:v6];
    [(PKCreditActivityCell *)self setNeedsLayout];
  }
}

- (UIFont)titleFont
{
  return [(UILabel *)self->_labelTitle font];
}

- (void)setRewardsSummaryFont:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_labelRewardsSummary font];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_labelRewardsSummary setFont:v6];
    [(PKCreditActivityCell *)self setNeedsLayout];
  }
}

- (UIFont)rewardsSummaryFont
{
  return [(UILabel *)self->_labelRewardsSummary font];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKCreditActivityCell;
  [(PKDashboardCollectionViewCell *)&v23 layoutSubviews];
  int v3 = PKRewardsCenterEnabled();
  BOOL isCompactUI = self->_isCompactUI;
  [(PKCreditActivityCell *)self bounds];
  double v9 = 12.0;
  if (isCompactUI) {
    double v9 = 8.0;
  }
  double v10 = v9 + v5;
  double v11 = v6 + 8.0;
  double v12 = 16.0;
  if (!isCompactUI) {
    double v12 = 24.0;
  }
  double v13 = v7 - v12;
  double v14 = v8 + -16.0;
  [(PKCreditActivityCell *)self _shouldReverseLayoutDirection];
  memset(&slice, 0, sizeof(slice));
  v21.size.width = v13;
  v21.size.height = v14;
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", v13, v14, *(void *)&v10, *(void *)&v11);
  double v16 = 2.0;
  if (!v3) {
    double v16 = 5.0;
  }
  CGFloat v17 = v16 + v15;
  v24.origin.x = v10;
  v24.origin.y = v11;
  v24.size.width = v13;
  v24.size.height = v14;
  CGRectDivide(v24, &slice, &v21, v17, CGRectMinYEdge);
  labelTitle = self->_labelTitle;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[UILabel setFrame:](labelTitle, "setFrame:");
  if (v3)
  {
    -[UILabel sizeThatFits:](self->_labelRewardsSummary, "sizeThatFits:", v21.size.width, v21.size.height);
    CGRect v25 = v21;
    CGRectDivide(v21, &slice, &v21, v25.origin.y + 5.0, CGRectMinYEdge);
    labelRewardsSummary = self->_labelRewardsSummary;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UILabel setFrame:](labelRewardsSummary, "setFrame:");
  }
  if (self->_useAccessibilityLayout) {
    PKFloatRoundToPixel();
  }
  chartView = self->_chartView;
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  -[PKSpendingSummaryChartView setFrame:](chartView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = PKRewardsCenterEnabled();
  double v7 = width + -24.0;
  if (self->_useAccessibilityLayout)
  {
    PKFloatRoundToPixel();
    double v7 = v8;
  }
  -[UILabel sizeThatFits:](self->_labelTitle, "sizeThatFits:", width + -24.0, height);
  double v10 = 2.0;
  if (!v6) {
    double v10 = 5.0;
  }
  double v11 = v10 + v9 + 16.0;
  if (v6)
  {
    -[UILabel sizeThatFits:](self->_labelRewardsSummary, "sizeThatFits:", width + -24.0, height);
    double v11 = v11 + v12 + 5.0;
  }
  -[PKSpendingSummaryChartView sizeThatFits:](self->_chartView, "sizeThatFits:", v7, height);
  double v14 = v11 + v13;
  double v15 = width;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  title = self->_title;
  double v9 = (NSString *)v5;
  double v7 = title;
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
    objc_storeStrong((id *)&self->_title, a3);
    [(UILabel *)self->_labelTitle setText:self->_title];
    [(PKCreditActivityCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setRewardsSummary:(id)a3
{
  id v5 = a3;
  rewardsSummary = self->_rewardsSummary;
  double v9 = (NSString *)v5;
  double v7 = rewardsSummary;
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
    objc_storeStrong((id *)&self->_rewardsSummary, a3);
    [(UILabel *)self->_labelRewardsSummary setText:self->_rewardsSummary];
    [(PKCreditActivityCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setRewardsSummaryTextColor:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_labelRewardsSummary textColor];
  char v5 = PKEqualObjects();

  if ((v5 & 1) == 0) {
    [(UILabel *)self->_labelRewardsSummary setTextColor:v6];
  }
}

- (UIColor)rewardsSummaryTextColor
{
  return [(UILabel *)self->_labelRewardsSummary textColor];
}

- (PKDashboardCreditAccountItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)rewardsSummary
{
  return self->_rewardsSummary;
}

- (PKSpendingSummaryChartView)chartView
{
  return self->_chartView;
}

- (BOOL)useAccessibilityLayout
{
  return self->_useAccessibilityLayout;
}

- (void)setUseAccessibilityLayout:(BOOL)a3
{
  self->_useAccessibilityLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_rewardsSummary, 0);
  objc_storeStrong((id *)&self->_labelRewardsSummary, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_labelTitle, 0);
}

@end