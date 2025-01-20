@interface PKCellAccessoryBadge
+ (id)accessoryBadgeWithTitle:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKCellAccessoryBadge)initWithFrame:(CGRect)a3 title:(id)a4;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKCellAccessoryBadge

+ (id)accessoryBadgeWithTitle:(id)a3
{
  id v3 = a3;
  v4 = [PKCellAccessoryBadge alloc];
  v5 = -[PKCellAccessoryBadge initWithFrame:title:](v4, "initWithFrame:title:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v5 placement:1];

  return v6;
}

- (PKCellAccessoryBadge)initWithFrame:(CGRect)a3 title:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKCellAccessoryBadge;
  v10 = -[PKCellAccessoryBadge initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = v11;

    v13 = v10->_titleLabel;
    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v13 setTextColor:v14];

    v15 = v10->_titleLabel;
    v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27F0]);
    [(UILabel *)v15 setFont:v16];

    [(UILabel *)v10->_titleLabel setNumberOfLines:1];
    [(UILabel *)v10->_titleLabel setTextAlignment:1];
    [(UILabel *)v10->_titleLabel setText:v9];
    [(PKCellAccessoryBadge *)v10 addSubview:v10->_titleLabel];
    v17 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(PKCellAccessoryBadge *)v10 setBackgroundColor:v17];
  }
  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4 + 10.0;
  double v6 = fmax(v5, v3 + 10.0);
  result.double height = v5;
  result.double width = v6;
  return result;
}

- (void)layoutSubviews
{
  [(PKCellAccessoryBadge *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, v5);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", (v4 - v7) * 0.5, 5.0, v7, v8);
  id v9 = [(PKCellAccessoryBadge *)self layer];
  id v11 = v9;
  double v10 = v6 * 0.5;
  if (v6 != v4) {
    double v10 = 5.0;
  }
  [v9 setCornerRadius:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKCellAccessoryBadge;
  [(PKCellAccessoryBadge *)&v6 traitCollectionDidChange:a3];
  titleLabel = self->_titleLabel;
  double v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27F0]);
  [(UILabel *)titleLabel setFont:v5];
}

- (void).cxx_destruct
{
}

@end