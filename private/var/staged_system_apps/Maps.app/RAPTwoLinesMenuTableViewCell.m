@interface RAPTwoLinesMenuTableViewCell
+ (NSString)reuseIdentifier;
- (RAPTwoLinesMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (RAPTwoLinesViewModel)viewModel;
- (UIImageView)leftImageView;
- (void)_contentSizeChanged;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateContent;
- (void)prepareForReuse;
- (void)setViewModel:(id)a3;
@end

@implementation RAPTwoLinesMenuTableViewCell

- (RAPTwoLinesMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)RAPTwoLinesMenuTableViewCell;
  v4 = [(RAPTwoLinesMenuTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(RAPTwoLinesMenuTableViewCell *)v4 setAccessibilityIdentifier:v6];

    [(RAPTwoLinesMenuTableViewCell *)v4 _setupSubviews];
    [(RAPTwoLinesMenuTableViewCell *)v4 _setupConstraints];
    [(RAPTwoLinesMenuTableViewCell *)v4 setAccessoryType:1];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v4 selector:"_contentSizeChanged" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)_setupSubviews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  mainTitleLabel = self->_mainTitleLabel;
  self->_mainTitleLabel = v7;

  [(UILabel *)self->_mainTitleLabel setAccessibilityIdentifier:@"MainTitleLabel"];
  [(UILabel *)self->_mainTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_mainTitleLabel setNumberOfLines:0];
  objc_super v9 = +[UIFont system17];
  [(UILabel *)self->_mainTitleLabel setFont:v9];

  v10 = +[UIColor labelColor];
  [(UILabel *)self->_mainTitleLabel setTextColor:v10];

  v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  secondTitleLabel = self->_secondTitleLabel;
  self->_secondTitleLabel = v11;

  [(UILabel *)self->_secondTitleLabel setAccessibilityIdentifier:@"SecondTitleLabel"];
  [(UILabel *)self->_secondTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_secondTitleLabel setNumberOfLines:0];
  v13 = +[UIFont system13Adaptive];
  [(UILabel *)self->_secondTitleLabel setFont:v13];

  v14 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_secondTitleLabel setTextColor:v14];

  v15 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  leftImageView = self->_leftImageView;
  self->_leftImageView = v15;

  [(UIImageView *)self->_leftImageView setAccessibilityIdentifier:@"LeftImageView"];
  [(UIImageView *)self->_leftImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_leftImageView setContentMode:1];
  v17 = +[UIImageSymbolConfiguration configurationWithPointSize:26.0];
  [(UIImageView *)self->_leftImageView setPreferredSymbolConfiguration:v17];

  v18 = +[UIColor systemLightGrayColor];
  [(UIImageView *)self->_leftImageView setTintColor:v18];

  v19 = [(RAPTwoLinesMenuTableViewCell *)self contentView];
  [v19 addSubview:self->_mainTitleLabel];

  v20 = [(RAPTwoLinesMenuTableViewCell *)self contentView];
  [v20 addSubview:self->_secondTitleLabel];

  id v21 = [(RAPTwoLinesMenuTableViewCell *)self contentView];
  [v21 addSubview:self->_leftImageView];
}

- (void)_setupConstraints
{
  id v3 = [(RAPTwoLinesMenuTableViewCell *)self contentView];
  v4 = [(UILabel *)self->_mainTitleLabel firstBaselineAnchor];
  v5 = [v3 topAnchor];
  v6 = [(UILabel *)self->_mainTitleLabel font];
  [v6 _mapkit_scaledValueForValue:29.0];
  [v4 constraintEqualToAnchor:v5];
  v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  topToTitleConstraint = self->_topToTitleConstraint;
  self->_topToTitleConstraint = v7;

  objc_super v9 = [(UILabel *)self->_mainTitleLabel lastBaselineAnchor];
  v10 = [(UILabel *)self->_secondTitleLabel firstBaselineAnchor];
  v11 = [(UILabel *)self->_mainTitleLabel font];
  [v11 _mapkit_scaledValueForValue:-19.0];
  [v9 constraintEqualToAnchor:v10];
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  titleToSubtitleConstraint = self->_titleToSubtitleConstraint;
  self->_titleToSubtitleConstraint = v12;

  v14 = [(UILabel *)self->_secondTitleLabel lastBaselineAnchor];
  v15 = [v3 bottomAnchor];
  v16 = [(UILabel *)self->_secondTitleLabel font];
  [v16 _mapkit_scaledValueForValue:-16.0];
  [v14 constraintEqualToAnchor:v15];
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  subtitleToBottomConstraint = self->_subtitleToBottomConstraint;
  self->_subtitleToBottomConstraint = v17;

  v45 = [(UIImageView *)self->_leftImageView widthAnchor];
  v44 = [v45 constraintEqualToConstant:26.0];
  v46[0] = v44;
  v43 = [(UIImageView *)self->_leftImageView heightAnchor];
  v42 = [(UIImageView *)self->_leftImageView widthAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v46[1] = v41;
  v40 = [(UIImageView *)self->_leftImageView centerYAnchor];
  v39 = [v3 centerYAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v46[2] = v38;
  v36 = [(UIImageView *)self->_leftImageView leadingAnchor];
  v37 = v3;
  v35 = [v3 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:15.0];
  v46[3] = v34;
  v33 = [(UILabel *)self->_mainTitleLabel leadingAnchor];
  v32 = [(UIImageView *)self->_leftImageView trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:15.0];
  v46[4] = v31;
  v19 = [(UILabel *)self->_mainTitleLabel trailingAnchor];
  v20 = [v3 trailingAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20 constant:-15.0];
  v22 = self->_topToTitleConstraint;
  v46[5] = v21;
  v46[6] = v22;
  v46[7] = self->_titleToSubtitleConstraint;
  v23 = [(UILabel *)self->_secondTitleLabel leadingAnchor];
  v24 = [(UILabel *)self->_mainTitleLabel leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v46[8] = v25;
  v26 = [(UILabel *)self->_secondTitleLabel trailingAnchor];
  v27 = [(UILabel *)self->_mainTitleLabel trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  v29 = self->_subtitleToBottomConstraint;
  v46[9] = v28;
  v46[10] = v29;
  v30 = +[NSArray arrayWithObjects:v46 count:11];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)setViewModel:(id)a3
{
  v5 = (RAPTwoLinesViewModel *)a3;
  if (self->_viewModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(RAPTwoLinesMenuTableViewCell *)self _updateContent];
    v5 = v6;
  }
}

- (void)_updateContent
{
  id v3 = [(RAPTwoLinesViewModel *)self->_viewModel image];
  [(UIImageView *)self->_leftImageView setImage:v3];

  v4 = [(RAPTwoLinesViewModel *)self->_viewModel title];
  [(UILabel *)self->_mainTitleLabel setText:v4];

  id v5 = [(RAPTwoLinesViewModel *)self->_viewModel subtitle];
  [(UILabel *)self->_secondTitleLabel setText:v5];
}

- (void)_contentSizeChanged
{
  id v3 = +[UIFont system17];
  [(UILabel *)self->_mainTitleLabel setFont:v3];

  v4 = +[UIFont system13Adaptive];
  [(UILabel *)self->_secondTitleLabel setFont:v4];

  id v5 = [(UILabel *)self->_mainTitleLabel font];
  [v5 _mapkit_scaledValueForValue:29.0];
  -[NSLayoutConstraint setConstant:](self->_topToTitleConstraint, "setConstant:");

  v6 = [(UILabel *)self->_mainTitleLabel font];
  [v6 _mapkit_scaledValueForValue:-19.0];
  -[NSLayoutConstraint setConstant:](self->_titleToSubtitleConstraint, "setConstant:");

  id v7 = [(UILabel *)self->_secondTitleLabel font];
  [v7 _mapkit_scaledValueForValue:-16.0];
  -[NSLayoutConstraint setConstant:](self->_subtitleToBottomConstraint, "setConstant:");
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)RAPTwoLinesMenuTableViewCell;
  [(RAPTwoLinesMenuTableViewCell *)&v5 prepareForReuse];
  [(UIImageView *)self->_leftImageView _setContinuousCornerRadius:0.0];
  id v3 = +[UIColor clearColor];
  [(UIImageView *)self->_leftImageView setBackgroundColor:v3];

  v4 = +[UIColor clearColor];
  [(UIImageView *)self->_leftImageView setTintColor:v4];
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"RAPTwoLinesMenuTableViewCell";
}

- (RAPTwoLinesViewModel)viewModel
{
  return self->_viewModel;
}

- (UIImageView)leftImageView
{
  return self->_leftImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_subtitleToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleToSubtitleConstraint, 0);
  objc_storeStrong((id *)&self->_topToTitleConstraint, 0);
  objc_storeStrong((id *)&self->_secondTitleLabel, 0);

  objc_storeStrong((id *)&self->_mainTitleLabel, 0);
}

@end