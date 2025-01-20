@interface NavTrayActionCell
+ (double)heightForCellWithText:(id)a3 width:(double)a4;
- (NavTrayActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)leadingImageView;
- (UILabel)titleLabel;
- (UIView)leadingImageBackgroundView;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation NavTrayActionCell

- (NavTrayActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v74.receiver = self;
  v74.super_class = (Class)NavTrayActionCell;
  v4 = [(NavTrayActionCell *)&v74 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(NavTrayActionCell *)v4 setAccessibilityIdentifier:v6];

    v73 = +[UIBackgroundConfiguration listCellConfiguration];
    [v73 setCornerRadius:10.0];
    [(NavTrayActionCell *)v4 setBackgroundConfiguration:v73];
    v7 = objc_opt_new();
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 setAccessibilityIdentifier:@"ImageViewContainer"];
    v8 = [(NavTrayActionCell *)v4 contentView];
    [v8 addSubview:v7];

    uint64_t v9 = objc_opt_new();
    leadingImageBackgroundView = v4->_leadingImageBackgroundView;
    v4->_leadingImageBackgroundView = (UIView *)v9;

    [(UIView *)v4->_leadingImageBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_leadingImageBackgroundView setAccessibilityIdentifier:@"LeadingImageBackground"];
    v11 = [(UIView *)v4->_leadingImageBackgroundView layer];
    [v11 setCornerRadius:22.5];

    [v7 addSubview:v4->_leadingImageBackgroundView];
    uint64_t v12 = objc_opt_new();
    leadingImageView = v4->_leadingImageView;
    v4->_leadingImageView = (UIImageView *)v12;

    [(UIImageView *)v4->_leadingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_leadingImageView setContentMode:1];
    [(UIImageView *)v4->_leadingImageView setAccessibilityIdentifier:@"LeadingImageView"];
    [v7 addSubview:v4->_leadingImageView];
    uint64_t v14 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v14;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    [(UILabel *)v4->_titleLabel setFont:v16];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    v17 = [(NavTrayActionCell *)v4 contentView];
    [v17 addSubview:v4->_titleLabel];

    v71 = [v7 leadingAnchor];
    v72 = [(NavTrayActionCell *)v4 contentView];
    v70 = [v72 leadingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v75[0] = v69;
    v68 = [v7 widthAnchor];
    v67 = [v68 constraintEqualToConstant:76.0];
    v75[1] = v67;
    v65 = [v7 topAnchor];
    v66 = [(NavTrayActionCell *)v4 contentView];
    v64 = [v66 topAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v75[2] = v63;
    v61 = [v7 bottomAnchor];
    v62 = [(NavTrayActionCell *)v4 contentView];
    v60 = [v62 bottomAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v75[3] = v59;
    v58 = [(UIView *)v4->_leadingImageBackgroundView centerXAnchor];
    v57 = [v7 centerXAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v75[4] = v56;
    v55 = [(UIView *)v4->_leadingImageBackgroundView centerYAnchor];
    v54 = [v7 centerYAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v75[5] = v53;
    v51 = [(UIView *)v4->_leadingImageBackgroundView heightAnchor];
    v50 = [v51 constraintEqualToConstant:45.0];
    v75[6] = v50;
    v49 = [(UIView *)v4->_leadingImageBackgroundView widthAnchor];
    v48 = [v49 constraintEqualToConstant:45.0];
    v75[7] = v48;
    v47 = [(UIImageView *)v4->_leadingImageView centerXAnchor];
    v46 = [v7 centerXAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v75[8] = v45;
    v44 = [(UIImageView *)v4->_leadingImageView centerYAnchor];
    v52 = v7;
    v43 = [v7 centerYAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v75[9] = v42;
    v41 = [(UIImageView *)v4->_leadingImageView heightAnchor];
    v40 = [(UIView *)v4->_leadingImageBackgroundView heightAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 multiplier:0.600000024];
    v75[10] = v39;
    v38 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v37 = [v7 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v75[11] = v36;
    v34 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v35 = [(NavTrayActionCell *)v4 contentView];
    v33 = [v35 trailingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:-16.0];
    v75[12] = v32;
    v30 = [(UILabel *)v4->_titleLabel centerYAnchor];
    v31 = [(NavTrayActionCell *)v4 contentView];
    v29 = [v31 centerYAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v75[13] = v28;
    v18 = [(UILabel *)v4->_titleLabel topAnchor];
    v19 = [(NavTrayActionCell *)v4 contentView];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintGreaterThanOrEqualToAnchor:v20];
    v75[14] = v21;
    v22 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v23 = [(NavTrayActionCell *)v4 contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintLessThanOrEqualToAnchor:v24];
    v75[15] = v25;
    v26 = +[NSArray arrayWithObjects:v75 count:16];
    +[NSLayoutConstraint activateConstraints:v26];
  }
  return v4;
}

+ (double)heightForCellWithText:(id)a3 width:(double)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v16 = NSFontAttributeName;
  v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
  v17 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v9 = [v6 initWithString:v5 attributes:v8];

  [v9 boundingRectWithSize:1 options:0 context:a4 + -76.0 + -16.0];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double v14 = 78.0;
  if (ceil(CGRectGetMaxY(v18)) > 78.0)
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v14 = ceil(CGRectGetMaxY(v19));
  }

  return v14;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NavTrayActionCell;
  id v4 = a3;
  [(NavTrayActionCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(NavTrayActionCell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(NavTrayActionCell *)self setNeedsUpdateConfiguration];
  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v10 = a3;
  id v4 = [(NavTrayActionCell *)self backgroundConfiguration];
  id v5 = [v4 updatedConfigurationForState:v10];

  id v6 = [(NavTrayActionCell *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (([v10 isHighlighted] & 1) != 0 || objc_msgSend(v10, "isSelected"))
  {
    if (v7 == (id)2) {
      +[UIColor tertiarySystemGroupedBackgroundColor];
    }
    else {
    uint64_t v8 = +[UIColor systemLightMidGrayColor];
    }
  }
  else
  {
    uint64_t v8 = +[UIColor secondarySystemGroupedBackgroundColor];
  }
  id v9 = (void *)v8;
  [v5 setBackgroundColor:v8];

  [(NavTrayActionCell *)self setBackgroundConfiguration:v5];
}

- (UIImageView)leadingImageView
{
  return self->_leadingImageView;
}

- (UIView)leadingImageBackgroundView
{
  return self->_leadingImageBackgroundView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_leadingImageBackgroundView, 0);

  objc_storeStrong((id *)&self->_leadingImageView, 0);
}

@end