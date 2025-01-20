@interface CarActionButton
+ (id)actionButtonWithTitle:(id)a3 image:(id)a4;
- (BOOL)isAccessibilityElement;
- (CarActionButton)initWithTitle:(id)a3 image:(id)a4;
- (id)accessibilityLabel;
- (void)setTintColor:(id)a3;
- (void)updateSearchButtonTitle:(id)a3;
@end

@implementation CarActionButton

+ (id)actionButtonWithTitle:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithTitle:v7 image:v6];

  return v8;
}

- (CarActionButton)initWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CarActionButton;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[CarFocusableBlurControl initWithFrame:](&v50, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(CarFocusableBlurControl *)v11 setCastsShadow:0];
    [(CarFocusableBlurControl *)v12 setRoundedCornerRadius:9.0];
    v13 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    id v48 = v7;
    imageView = v12->_imageView;
    v12->_imageView = v13;

    [(UIImageView *)v12->_imageView setAccessibilityIdentifier:@"ImageView"];
    [(UIImageView *)v12->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v12->_imageView setContentMode:1];
    [(CarFocusableControl *)v12 addSubview:v12->_imageView];
    v15 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v12->_titleLabel;
    v12->_titleLabel = v15;

    [(UILabel *)v12->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(UILabel *)v12->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v17) = 1148846080;
    [(UILabel *)v12->_titleLabel setContentCompressionResistancePriority:1 forAxis:v17];
    [(UILabel *)v12->_titleLabel setText:v6];
    v18 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCallout weight:UIFontWeightMedium];
    [(UILabel *)v12->_titleLabel setFont:v18];

    [(UILabel *)v12->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v12->_titleLabel setMinimumScaleFactor:0.699999988];
    [(UILabel *)v12->_titleLabel setBaselineAdjustment:1];
    [(CarFocusableControl *)v12 addSubview:v12->_titleLabel];
    v47 = [(UIImageView *)v12->_imageView centerYAnchor];
    v46 = [(CarActionButton *)v12 centerYAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v51[0] = v45;
    v44 = [(UIImageView *)v12->_imageView centerXAnchor];
    v43 = [(CarActionButton *)v12 leadingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:20.5];
    v51[1] = v42;
    v41 = [(UIImageView *)v12->_imageView topAnchor];
    v40 = [(CarActionButton *)v12 topAnchor];
    v39 = [v41 constraintGreaterThanOrEqualToAnchor:v40 constant:4.0];
    v51[2] = v39;
    v38 = [(CarActionButton *)v12 bottomAnchor];
    v37 = [(UIImageView *)v12->_imageView bottomAnchor];
    v36 = [v38 constraintGreaterThanOrEqualToAnchor:v37 constant:4.0];
    v51[3] = v36;
    v35 = [(UIImageView *)v12->_imageView leadingAnchor];
    v34 = [(CarActionButton *)v12 leadingAnchor];
    v33 = [v35 constraintGreaterThanOrEqualToAnchor:v34 constant:4.0];
    v51[4] = v33;
    v32 = [(UILabel *)v12->_titleLabel firstBaselineAnchor];
    v31 = [(CarActionButton *)v12 topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:28.0];
    v51[5] = v30;
    v29 = [(CarActionButton *)v12 bottomAnchor];
    [(UILabel *)v12->_titleLabel firstBaselineAnchor];
    v19 = id v49 = v6;
    v20 = [v29 constraintEqualToAnchor:v19 constant:16.0];
    v51[6] = v20;
    v21 = [(UILabel *)v12->_titleLabel leadingAnchor];
    v22 = [(CarActionButton *)v12 leadingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:41.0];
    v51[7] = v23;
    v24 = [(CarActionButton *)v12 trailingAnchor];
    v25 = [(UILabel *)v12->_titleLabel trailingAnchor];
    v26 = [v24 constraintGreaterThanOrEqualToAnchor:v25 constant:10.0];
    v51[8] = v26;
    v27 = +[NSArray arrayWithObjects:v51 count:9];
    +[NSLayoutConstraint activateConstraints:v27];

    id v7 = v48;
    id v6 = v49;
  }
  return v12;
}

- (void)updateSearchButtonTitle:(id)a3
{
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarActionButton;
  [(CarActionButton *)&v6 setTintColor:v4];
  if ([(CarActionButton *)self state])
  {
    [(UILabel *)self->_titleLabel setTextColor:v4];
  }
  else
  {
    v5 = +[UIColor labelColor];
    [(UILabel *)self->_titleLabel setTextColor:v5];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(UILabel *)self->_titleLabel text];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end