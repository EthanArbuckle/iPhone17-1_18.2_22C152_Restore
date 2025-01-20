@interface RAPCategorySearchTableViewCell
+ (NSString)identifier;
- (BOOL)isChecked;
- (NSString)displayText;
- (RAPCategorySearchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_contentSizeDidChange;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateCheckmarkImageView;
- (void)setChecked:(BOOL)a3;
- (void)setDisplayText:(id)a3;
@end

@implementation RAPCategorySearchTableViewCell

- (RAPCategorySearchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)RAPCategorySearchTableViewCell;
  v4 = [(RAPCategorySearchTableViewCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_checked = 0;
    id v6 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    checkmarkImageView = v5->_checkmarkImageView;
    v5->_checkmarkImageView = v10;

    v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    categoryLabel = v5->_categoryLabel;
    v5->_categoryLabel = v12;

    [(RAPCategorySearchTableViewCell *)v5 _setupSubviews];
    [(RAPCategorySearchTableViewCell *)v5 _setupConstraints];
    [(RAPCategorySearchTableViewCell *)v5 _updateCheckmarkImageView];
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v5 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v5;
}

- (void)_setupSubviews
{
  [(UIImageView *)self->_checkmarkImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_categoryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_checkmarkImageView setClipsToBounds:1];
  [(UIImageView *)self->_checkmarkImageView _setContinuousCornerRadius:10.0];
  v3 = +[UIScreen mainScreen];
  [v3 nativeScale];
  double v5 = 2.0 / v4;
  id v6 = [(UIImageView *)self->_checkmarkImageView layer];
  [v6 setBorderWidth:v5];

  [(UIImageView *)self->_checkmarkImageView setContentMode:4];
  v7 = +[UIImageSymbolConfiguration configurationWithPointSize:20.0];
  [(UIImageView *)self->_checkmarkImageView setPreferredSymbolConfiguration:v7];

  v8 = +[UIFont system17];
  [(UILabel *)self->_categoryLabel setFont:v8];

  [(UILabel *)self->_categoryLabel setNumberOfLines:0];
  v9 = [(RAPCategorySearchTableViewCell *)self contentView];
  [v9 addSubview:self->_checkmarkImageView];

  v10 = [(RAPCategorySearchTableViewCell *)self contentView];
  [v10 addSubview:self->_categoryLabel];

  [(RAPCategorySearchTableViewCell *)self _updateCheckmarkImageView];
}

- (void)_setupConstraints
{
  v3 = [(UILabel *)self->_categoryLabel firstBaselineAnchor];
  double v4 = [(RAPCategorySearchTableViewCell *)self contentView];
  double v5 = [v4 topAnchor];
  id v6 = [(UILabel *)self->_categoryLabel font];
  [v6 _scaledValueForValue:33.0];
  [v3 constraintEqualToAnchor:v5];
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topLayoutConstraint = self->_topLayoutConstraint;
  self->_topLayoutConstraint = v7;

  v9 = [(UILabel *)self->_categoryLabel lastBaselineAnchor];
  v10 = [(RAPCategorySearchTableViewCell *)self contentView];
  v11 = [v10 bottomAnchor];
  v12 = [(UILabel *)self->_categoryLabel font];
  [v12 _scaledValueForValue:-22.0];
  [v9 constraintEqualToAnchor:v11];
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomLayoutConstraint = self->_bottomLayoutConstraint;
  self->_bottomLayoutConstraint = v13;

  v35 = [(UIImageView *)self->_checkmarkImageView leadingAnchor];
  v36 = [(RAPCategorySearchTableViewCell *)self contentView];
  v34 = [v36 leadingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:17.0];
  v37[0] = v33;
  v31 = [(UIImageView *)self->_checkmarkImageView centerYAnchor];
  v32 = [(RAPCategorySearchTableViewCell *)self contentView];
  v30 = [v32 centerYAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v37[1] = v29;
  v28 = [(UIImageView *)self->_checkmarkImageView widthAnchor];
  v27 = [v28 constraintEqualToConstant:20.0];
  v37[2] = v27;
  v26 = [(UIImageView *)self->_checkmarkImageView heightAnchor];
  v15 = [(UIImageView *)self->_checkmarkImageView widthAnchor];
  objc_super v16 = [v26 constraintEqualToAnchor:v15];
  v37[3] = v16;
  v17 = [(UIImageView *)self->_checkmarkImageView trailingAnchor];
  v18 = [(UILabel *)self->_categoryLabel leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:-14.0];
  v37[4] = v19;
  v20 = [(UILabel *)self->_categoryLabel trailingAnchor];
  v21 = [(RAPCategorySearchTableViewCell *)self contentView];
  v22 = [v21 trailingAnchor];
  v23 = [v20 constraintEqualToAnchor:v22 constant:-15.0];
  v24 = self->_topLayoutConstraint;
  v37[5] = v23;
  v37[6] = v24;
  v37[7] = self->_bottomLayoutConstraint;
  v25 = +[NSArray arrayWithObjects:v37 count:8];
  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)setDisplayText:(id)a3
{
  double v5 = (NSString *)a3;
  if (self->_displayText != v5)
  {
    objc_storeStrong((id *)&self->_displayText, a3);
    [(UILabel *)self->_categoryLabel setText:v5];
  }
}

- (void)setChecked:(BOOL)a3
{
  if (self->_checked != a3)
  {
    self->_checked = a3;
    [(RAPCategorySearchTableViewCell *)self _updateCheckmarkImageView];
  }
}

- (void)_updateCheckmarkImageView
{
  if (self->_checked)
  {
    v3 = +[UIImage systemImageNamed:@"checkmark.circle.fill"];
    [(UIImageView *)self->_checkmarkImageView setImage:v3];

    double v4 = +[UIColor systemBlueColor];
    [(UIImageView *)self->_checkmarkImageView setTintColor:v4];

    +[UIColor clearColor];
  }
  else
  {
    [(UIImageView *)self->_checkmarkImageView setImage:0];
    double v5 = +[UIColor clearColor];
    [(UIImageView *)self->_checkmarkImageView setBackgroundColor:v5];

    +[UIColor systemGrayColor];
  }
  id v8 = objc_claimAutoreleasedReturnValue();
  id v6 = [v8 CGColor];
  v7 = [(UIImageView *)self->_checkmarkImageView layer];
  [v7 setBorderColor:v6];
}

- (void)_contentSizeDidChange
{
  v3 = +[UIFont system17];
  [(UILabel *)self->_categoryLabel setFont:v3];

  double v4 = [(UILabel *)self->_categoryLabel font];
  [v4 _scaledValueForValue:33.0];
  -[NSLayoutConstraint setConstant:](self->_topLayoutConstraint, "setConstant:");

  id v5 = [(UILabel *)self->_categoryLabel font];
  [v5 _scaledValueForValue:-22.0];
  -[NSLayoutConstraint setConstant:](self->_bottomLayoutConstraint, "setConstant:");
}

+ (NSString)identifier
{
  return (NSString *)@"RAPCategorySearchTableViewCell";
}

- (NSString)displayText
{
  return self->_displayText;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_bottomLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_topLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_categoryLabel, 0);

  objc_storeStrong((id *)&self->_checkmarkImageView, 0);
}

@end