@interface PKSelectActionHeader
- (NSString)subtitle;
- (NSString)title;
- (PKSelectActionHeader)initWithTitle:(id)a3 subtitle:(id)a4;
- (void)layoutSubviews;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKSelectActionHeader

- (PKSelectActionHeader)initWithTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PKSelectActionHeader;
  v8 = [(PKSelectActionHeader *)&v25 init];
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v9;

    v11 = v8->_titleLabel;
    v12 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v11 setTextColor:v12];

    [(UILabel *)v8->_titleLabel setText:v6];
    uint64_t v13 = PKUIGetMinScreenWidthType();
    double v14 = 28.0;
    if (!v13) {
      double v14 = 24.0;
    }
    double v15 = PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2780], v14);
    v16 = v8->_titleLabel;
    v17 = PKRoundedSystemFontOfSizeAndWeight(v15, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v16 setFont:v17];

    [(UILabel *)v8->_titleLabel sizeToFit];
    [(UILabel *)v8->_titleLabel setNeedsLayout];
    [(PKSelectActionHeader *)v8 addSubview:v8->_titleLabel];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v8->_subtitleLabel;
    v8->_subtitleLabel = v18;

    [(UILabel *)v8->_subtitleLabel setText:v7];
    v20 = v8->_subtitleLabel;
    v21 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v20 setTextColor:v21];

    v22 = v8->_subtitleLabel;
    v23 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2790]);
    [(UILabel *)v22 setFont:v23];

    [(UILabel *)v8->_subtitleLabel sizeToFit];
    [(UILabel *)v8->_subtitleLabel setNeedsLayout];
    [(PKSelectActionHeader *)v8 addSubview:v8->_subtitleLabel];
  }

  return v8;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKSelectActionHeader;
  [(PKSelectActionHeader *)&v9 layoutSubviews];
  [(PKSelectActionHeader *)self bounds];
  double v4 = v3;
  [(UILabel *)self->_titleLabel frame];
  double v6 = v5;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", (v4 - v7) * 0.5, 20.0);
  [(UILabel *)self->_subtitleLabel frame];
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", (v4 - v8) * 0.5, v6 + 40.0);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end