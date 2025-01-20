@interface COSUsageTotalUsedHeader
- (COSUsageTotalUsedHeader)initWithFrame:(CGRect)a3;
- (COSUsageTotalUsedHeader)initWithSpecifier:(id)a3;
- (UILabel)availableLabel;
- (UILabel)titleLabel;
- (UILabel)usedLabel;
- (double)height;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
- (void)recalcHeight;
- (void)setAvailable:(id)a3;
- (void)setAvailableLabel:(id)a3;
- (void)setHeight:(double)a3;
- (void)setName:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUsed:(id)a3;
- (void)setUsedLabel:(id)a3;
@end

@implementation COSUsageTotalUsedHeader

- (COSUsageTotalUsedHeader)initWithSpecifier:(id)a3
{
  return -[COSUsageTotalUsedHeader initWithFrame:](self, "initWithFrame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (COSUsageTotalUsedHeader)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)COSUsageTotalUsedHeader;
  v3 = -[COSUsageTotalUsedHeader initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    usedLabel = v3->_usedLabel;
    v3->_usedLabel = v8;

    v10 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_usedLabel setFont:v10];

    v11 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_usedLabel setTextColor:v11];

    [(UILabel *)v3->_usedLabel setTextAlignment:2];
    v12 = +[UIColor clearColor];
    [(UILabel *)v3->_usedLabel setBackgroundColor:v12];

    [(COSUsageTotalUsedHeader *)v3 addSubview:v3->_usedLabel];
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(0, y, width, height)];
    availableLabel = v3->_availableLabel;
    v3->_availableLabel = v13;

    v15 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_availableLabel setFont:v15];

    v16 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_availableLabel setTextColor:v16];

    v17 = +[UIColor clearColor];
    [(UILabel *)v3->_availableLabel setBackgroundColor:v17];

    [(COSUsageTotalUsedHeader *)v3 addSubview:v3->_availableLabel];
    v18 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v18;

    v20 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_titleLabel setFont:v20];

    v21 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_titleLabel setTextColor:v21];

    v22 = +[UIColor clearColor];
    [(UILabel *)v3->_titleLabel setBackgroundColor:v22];

    [(COSUsageTotalUsedHeader *)v3 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (void)recalcHeight
{
  [(UILabel *)self->_titleLabel frame];
  double v4 = v3;
  [(UILabel *)self->_availableLabel frame];
  double v6 = v5;
  [(UILabel *)self->_usedLabel frame];
  if (v6 >= v7) {
    double v8 = v6;
  }
  else {
    double v8 = v7;
  }
  double v9 = v4 + v8 + 11.0 + 11.0;
  unsigned int v10 = sub_100034028();
  double v11 = 15.0;
  if (v10) {
    double v11 = 24.0;
  }
  self->_double height = v11 + v9;
}

- (void)setName:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];
  [(UILabel *)self->_titleLabel sizeToFit];

  [(COSUsageTotalUsedHeader *)self recalcHeight];
}

- (void)setAvailable:(id)a3
{
  [(UILabel *)self->_availableLabel setText:a3];
  [(UILabel *)self->_availableLabel sizeToFit];

  [(COSUsageTotalUsedHeader *)self recalcHeight];
}

- (void)setUsed:(id)a3
{
  [(UILabel *)self->_usedLabel setText:a3];
  [(UILabel *)self->_usedLabel sizeToFit];

  [(COSUsageTotalUsedHeader *)self recalcHeight];
}

- (void)layoutSubviews
{
  [(COSUsageTotalUsedHeader *)self bounds];
  double v4 = v3;
  double v5 = [(COSUsageTotalUsedHeader *)self superview];
  [v5 _backgroundInset];
  double v7 = v6;

  double v8 = 15.0;
  double v9 = v7 + 15.0;
  double v10 = v4 + v9 * -2.0;
  [(UILabel *)self->_titleLabel frame];
  double v12 = v11;
  double v14 = v13;
  if (sub_100034028()) {
    double v8 = 24.0;
  }
  if (v10 < v12) {
    double v12 = v4 + v9 * -2.0;
  }
  double v30 = v4 - v9;
  if ([(COSUsageTotalUsedHeader *)self _shouldReverseLayoutDirection]) {
    double v15 = v4 - v9 - v12;
  }
  else {
    double v15 = v9;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v15, v8, v12, v14);
  [(UILabel *)self->_availableLabel frame];
  double v17 = v16;
  double v19 = v18;
  v32.origin.x = v15;
  v32.origin.double y = v8;
  v32.size.double width = v12;
  v32.size.double height = v14;
  double MaxY = CGRectGetMaxY(v32);
  [(UILabel *)self->_usedLabel frame];
  double v23 = v22;
  if (v17 + v21 + 6.0 <= v10)
  {
    double v25 = v21;
    double v24 = v17;
    goto LABEL_12;
  }
  double v24 = floor((v10 + -6.0) * (v17 / (v17 + v21)));
  double v25 = v10 + -6.0 - v24;
  if (v24 > v17)
  {
    double v25 = v25 + v24 - v17;
LABEL_12:
    double v26 = v30;
    goto LABEL_13;
  }
  double v26 = v30;
  if (v25 > v21) {
    double v24 = v24 + v25 - v21;
  }
LABEL_13:
  double v27 = v26 - v21;
  double v28 = MaxY + 11.0;
  -[UILabel setFrame:](self->_availableLabel, "setFrame:", v9, v28, v24, v19);
  usedLabel = self->_usedLabel;

  -[UILabel setFrame:](usedLabel, "setFrame:", v27, v28, v25, v23);
}

- (double)preferredHeightForWidth:(double)a3
{
  return self->_height;
}

- (UILabel)usedLabel
{
  return self->_usedLabel;
}

- (void)setUsedLabel:(id)a3
{
}

- (UILabel)availableLabel
{
  return self->_availableLabel;
}

- (void)setAvailableLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_double height = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_availableLabel, 0);

  objc_storeStrong((id *)&self->_usedLabel, 0);
}

@end