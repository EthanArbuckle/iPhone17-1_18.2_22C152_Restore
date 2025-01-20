@interface COSDiscoverSectionHeader
+ (double)bottomMargin;
+ (double)topMargin;
+ (id)reuseIdentifier;
+ (id)titleLabelFont;
- (COSDiscoverSectionHeader)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)setSectionTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation COSDiscoverSectionHeader

+ (id)reuseIdentifier
{
  return @"COSDiscoverSectionHeader";
}

- (COSDiscoverSectionHeader)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)COSDiscoverSectionHeader;
  v3 = -[COSDiscoverSectionHeader initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v4;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = v3->_titleLabel;
    v7 = [(id)objc_opt_class() titleLabelFont];
    [(UILabel *)v6 setFont:v7];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v8 = +[UIColor whiteColor];
    [(UILabel *)v3->_titleLabel setTextColor:v8];

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    [(COSDiscoverSectionHeader *)v3 addSubview:v3->_titleLabel];
    v22 = [(UILabel *)v3->_titleLabel topAnchor];
    v21 = [(COSDiscoverSectionHeader *)v3 topAnchor];
    [(id)objc_opt_class() topMargin];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v9 = [(COSDiscoverSectionHeader *)v3 leadingAnchor];
    v10 = [v19 constraintEqualToAnchor:v9 constant:20.0];
    v24[1] = v10;
    v11 = [(COSDiscoverSectionHeader *)v3 trailingAnchor];
    v12 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:20.0];
    v24[2] = v13;
    v14 = [(COSDiscoverSectionHeader *)v3 bottomAnchor];
    v15 = [(UILabel *)v3->_titleLabel bottomAnchor];
    [(id)objc_opt_class() bottomMargin];
    v16 = [v14 constraintEqualToAnchor:v15];
    v24[3] = v16;
    v17 = +[NSArray arrayWithObjects:v24 count:4];
    +[NSLayoutConstraint activateConstraints:v17];
  }
  return v3;
}

+ (id)titleLabelFont
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:2 options:0];
  v3 = +[UIFont fontWithDescriptor:v2 size:0.0];

  return v3;
}

+ (double)topMargin
{
  return 10.0;
}

+ (double)bottomMargin
{
  return 4.0;
}

- (void)setSectionTitle:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];

  [(COSDiscoverSectionHeader *)self layoutSubviews];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end