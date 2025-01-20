@interface PKAccountTableCell
+ (double)estimatedHeightForCellWithAccount:(id)a3;
+ (id)_subtitleForAccount:(id)a3;
+ (id)subtitleFont;
+ (id)titleFont;
- (PKAccountTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_accessoryForAccount:(id)a3;
- (id)_subtitleColorForAccountState:(unint64_t)a3;
- (id)_titleForAccount:(id)a3;
- (void)_configureCellForAccount:(id)a3;
- (void)layoutSubviews;
- (void)setSpecifier:(id)a3;
@end

@implementation PKAccountTableCell

- (PKAccountTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountTableCell;
  v9 = [(PKAccountTableCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v10 = v9;
  if (v9)
  {
    [(PKAccountTableCell *)v9 setSpecifier:v8];
    [(PKAccountTableCell *)v10 setAutoresizingMask:18];
  }

  return v10;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)PKAccountTableCell;
  [(PSTableCell *)&v32 layoutSubviews];
  int v3 = [(PKAccountTableCell *)self _shouldReverseLayoutDirection];
  if (v3) {
    CGRectEdge v4 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v4 = CGRectMinXEdge;
  }
  v5 = [(PKAccountTableCell *)self contentView];
  [v5 bounds];
  memset(&slice, 0, sizeof(slice));
  memset(&v29, 0, sizeof(v29));
  memset(&v28, 0, sizeof(v28));
  CGRect remainder = v33;
  CGRectDivide(v33, &slice, &remainder, 16.0, v4);
  CGRectDivide(remainder, &v29, &remainder, 29.0, v4);
  CGRectDivide(remainder, &slice, &remainder, 16.0, v4);
  accessoryView = self->_accessoryView;
  if (accessoryView)
  {
    if (v3) {
      CGRectEdge v7 = CGRectMinXEdge;
    }
    else {
      CGRectEdge v7 = CGRectMaxXEdge;
    }
    [(UIView *)accessoryView frame];
    CGRectDivide(remainder, &v28, &remainder, v8, v7);
  }
  double width = remainder.size.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, 1.79769313e308, *(_OWORD *)&v28.origin);
  CGFloat v11 = v10;
  double v12 = v10 + 12.0 + 12.0;
  v13 = [(UILabel *)self->_subtitleLabel text];

  if (v13)
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, 1.79769313e308);
    double v15 = v14;
    double v12 = v12 + v14 + 2.0;
  }
  else
  {
    double v15 = 0.0;
  }
  PKSizeAlignedInRect();
  double v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  double v22 = v18 + 12.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  v23 = [(UILabel *)self->_subtitleLabel text];

  if (v23)
  {
    v34.origin.x = v17;
    v34.origin.y = v22;
    v34.size.double width = v21;
    v34.size.height = v11;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v17, CGRectGetMaxY(v34) + 2.0, v21, v15);
  }
  double v24 = 44.0;
  if (v12 >= 44.0) {
    double v24 = v12;
  }
  v25 = [NSNumber numberWithDouble:v24];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F78]));
  [WeakRetained setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F93218]];

  v29.size.height = v12;
  v29.origin.y = v19;
  PKSizeAlignedInRect();
  -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
  v27 = self->_accessoryView;
  if (v27)
  {
    [(UIView *)v27 sizeThatFits:*(_OWORD *)&v28.size];
    PKSizeAlignedInRect();
    -[UIView setFrame:](self->_accessoryView, "setFrame:");
  }
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x1E4F92F78]));
  char v6 = [WeakRetained isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PKAccountTableCell;
    [(PSTableCell *)&v8 setSpecifier:v4];
    CGRectEdge v7 = [v4 objectForKeyedSubscript:@"pkAccount"];
    if (v7) {
      [(PKAccountTableCell *)self _configureCellForAccount:v7];
    }
  }
}

- (void)_configureCellForAccount:(id)a3
{
  id v33 = a3;
  uint64_t v4 = [v33 feature];
  if (!self->_titleLabel)
  {
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    CGRectEdge v7 = self->_titleLabel;
    objc_super v8 = [(PKAccountTableCell *)self _titleForAccount:v33];
    [(UILabel *)v7 setText:v8];

    v9 = self->_titleLabel;
    double v10 = +[PKAccountTableCell titleFont];
    [(UILabel *)v9 setFont:v10];

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel sizeToFit];
    CGFloat v11 = [(PKAccountTableCell *)self contentView];
    [v11 addSubview:self->_titleLabel];
  }
  if (!self->_subtitleLabel)
  {
    double v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v12;

    double v14 = self->_subtitleLabel;
    double v15 = [(id)objc_opt_class() _subtitleForAccount:v33];
    [(UILabel *)v14 setText:v15];

    double v16 = self->_subtitleLabel;
    double v17 = -[PKAccountTableCell _subtitleColorForAccountState:](self, "_subtitleColorForAccountState:", [v33 state]);
    [(UILabel *)v16 setColor:v17];

    double v18 = self->_subtitleLabel;
    CGFloat v19 = +[PKAccountTableCell subtitleFont];
    [(UILabel *)v18 setFont:v19];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)self->_subtitleLabel sizeToFit];
    double v20 = [(PKAccountTableCell *)self contentView];
    [v20 addSubview:self->_subtitleLabel];
  }
  if (!self->_iconImageView)
  {
    if (v4 == 5)
    {
      double v21 = PKPassKitUIBundle();
      double v22 = [v21 URLForResource:@"SAVINGS_Icon" withExtension:@"pdf"];

      double v23 = PKUIScreenScale();
      double v24 = PKUIImageFromPDF(v22, 29.0, 29.0, v23);
    }
    else
    {
      double v24 = 0;
    }
    v25 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v24];
    iconImageView = self->_iconImageView;
    self->_iconImageView = v25;

    [(UIImageView *)self->_iconImageView sizeToFit];
    v27 = [(UIImageView *)self->_iconImageView layer];
    [v27 setCornerRadius:6.0];
    [v27 setMasksToBounds:1];
    CGRect v28 = [(PKAccountTableCell *)self contentView];
    [v28 addSubview:self->_iconImageView];
  }
  if (!self->_accessoryView)
  {
    CGRect v29 = [(PKAccountTableCell *)self _accessoryForAccount:v33];
    accessoryView = self->_accessoryView;
    self->_accessoryView = v29;

    v31 = self->_accessoryView;
    if (v31)
    {
      [(UIView *)v31 sizeToFit];
      objc_super v32 = [(PKAccountTableCell *)self contentView];
      [v32 addSubview:self->_accessoryView];
    }
  }
}

- (id)_titleForAccount:(id)a3
{
  if ([a3 feature] == 5)
  {
    int v3 = PKLocalizedFeatureString();
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (id)_accessoryForAccount:(id)a3
{
  id v3 = a3;
  if ([v3 feature] == 5 && PKSavingsAccountIsThresholdExceededActive())
  {
    uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8]];
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.circle" withConfiguration:v4];
    char v6 = [v5 imageWithRenderingMode:1];

    CGRectEdge v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v6];
  }
  else
  {
    CGRectEdge v7 = 0;
  }

  return v7;
}

- (id)_subtitleColorForAccountState:(unint64_t)a3
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  }

  return v3;
}

+ (id)_subtitleForAccount:(id)a3
{
  id v3 = a3;
  [v3 feature];
  uint64_t v4 = [v3 state];
  if (v4 == 3 || v4 == 2) {
    goto LABEL_15;
  }
  if (v4 != 1
    || PKSavingsFDICSignageEnabled() && ![v3 FDICBehaviorShowSettingsBalance])
  {
    v9 = 0;
    goto LABEL_16;
  }
  if ([v3 type] == 4)
  {
    v5 = [v3 savingsDetails];
    char v6 = [v5 accountSummary];
    CGRectEdge v7 = [v5 currencyCode];
    objc_super v8 = [v6 currentBalance];
  }
  else
  {
    objc_super v8 = 0;
    CGRectEdge v7 = 0;
  }
  if (![v7 length] || !v8 || objc_msgSend(v8, "pk_isNotANumber"))
  {

LABEL_15:
    v9 = PKLocalizedFeatureString();
    goto LABEL_16;
  }
  CGFloat v11 = PKCurrencyAmountMake();
  double v12 = [v11 formattedStringValue];
  v9 = PKLocalizedFeatureString();

LABEL_16:

  return v9;
}

+ (id)titleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (id)subtitleFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (double)estimatedHeightForCellWithAccount:(id)a3
{
  id v4 = a3;
  v5 = [a1 titleFont];
  [v5 lineHeight];
  double v7 = v6;

  objc_super v8 = [a1 _subtitleForAccount:v4];

  if (v8)
  {
    v9 = [a1 subtitleFont];
    [v9 lineHeight];
    double v7 = v7 + v10 + 2.0;
  }
  return fmax(fmax(v7 + 24.0, 53.0), 44.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end