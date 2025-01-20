@interface PKDashboardActionButtonCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKDashboardActionButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)_contentHeightWithWidth:(double)a3;
- (double)_maxWidthForTransactionCellInWidth:(double)a3;
- (id)_textColor;
- (void)_layoutTitleLabel;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
@end

@implementation PKDashboardActionButtonCollectionViewCell

- (PKDashboardActionButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKDashboardActionButtonCollectionViewCell;
  v3 = -[PKDashboardCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    v7 = v3->_titleLabel;
    v8 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0, *MEMORY[0x1E4FB09E0]);
    [(UILabel *)v7 setFont:v8];

    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v9 = [(PKDashboardActionButtonCollectionViewCell *)v3 contentView];
    [v9 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKDashboardActionButtonCollectionViewCell _maxWidthForTransactionCellInWidth:](self, "_maxWidthForTransactionCellInWidth:", a3.width, a3.height);
  double v5 = v4;
  [(PKDashboardActionButtonCollectionViewCell *)self _contentHeightWithWidth:v4 + -16.0];
  double v7 = fmax(v6 + 16.0, 55.0);
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)_contentHeightWithWidth:(double)a3
{
  -[UILabel pkui_sizeThatFits:forceWordWrap:](self->_titleLabel, "pkui_sizeThatFits:forceWordWrap:", 1, a3, 1.79769313e308);
  return v3 + 16.0;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardActionButtonCollectionViewCell;
  [(PKDashboardCollectionViewCell *)&v12 layoutSubviews];
  double v3 = [(PKDashboardActionButtonCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v5 + 8.0, v7 + 8.0, v9 + -16.0, v11 + -16.0);
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    double v4 = (NSString *)[v6 copy];
    title = self->_title;
    self->_title = v4;

    [(PKDashboardActionButtonCollectionViewCell *)self _layoutTitleLabel];
  }
}

- (void)_layoutTitleLabel
{
  [(UILabel *)self->_titleLabel setText:self->_title];
  titleLabel = self->_titleLabel;
  double v4 = [(PKDashboardActionButtonCollectionViewCell *)self _textColor];
  [(UILabel *)titleLabel setTextColor:v4];

  [(PKDashboardActionButtonCollectionViewCell *)self setNeedsLayout];
}

- (double)_maxWidthForTransactionCellInWidth:(double)a3
{
  [(PKDashboardCollectionViewCell *)self horizontalInset];
  return a3 + v4 * -2.0;
}

- (id)_textColor
{
  if (-[PKDashboardActionButtonCollectionViewCell isUserInteractionEnabled](self, "isUserInteractionEnabled"))[MEMORY[0x1E4FB1618] labelColor]; {
  else
  }
  v2 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];

  return v2;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end