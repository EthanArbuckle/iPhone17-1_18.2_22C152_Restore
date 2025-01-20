@interface RAPDisplayCategoryTableViewCell
- (NSString)categoryText;
- (RAPDisplayCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 itemKind:(int64_t)a5;
- (void)_configureTokenView;
- (void)_contentSizeDidChange;
- (void)setCategoryText:(id)a3;
@end

@implementation RAPDisplayCategoryTableViewCell

- (void)_configureTokenView
{
  v3 = [(RAPDisplayCategoryTableViewCell *)self contentView];
  v4 = (UIView *)objc_alloc_init((Class)UIView);
  tokenView = self->_tokenView;
  self->_tokenView = v4;

  v6 = +[UIColor systemGrayColor];
  [(UIView *)self->_tokenView setBackgroundColor:v6];

  v7 = (UILabel *)objc_alloc_init((Class)UILabel);
  tokenLabel = self->_tokenLabel;
  self->_tokenLabel = v7;

  v9 = +[UIColor systemWhiteColor];
  [(UILabel *)self->_tokenLabel setTextColor:v9];

  [(UILabel *)self->_tokenLabel setNumberOfLines:0];
  v10 = +[UIFont system17];
  [(UILabel *)self->_tokenLabel setFont:v10];

  [(UILabel *)self->_tokenLabel setAdjustsFontSizeToFitWidth:1];
  [(UIView *)self->_tokenView addSubview:self->_tokenLabel];
  [v3 addSubview:self->_tokenView];
  [(UIView *)self->_tokenView _setContinuousCornerRadius:10.0];
  [(UILabel *)self->_tokenLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_tokenView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = [(UILabel *)self->_tokenLabel firstBaselineAnchor];
  v12 = [(UIView *)self->_tokenView topAnchor];
  v13 = [(UILabel *)self->_tokenLabel font];
  [v13 _scaledValueForValue:24.0];
  [v11 constraintEqualToAnchor:v12];
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  firstBaselineConstraint = self->_firstBaselineConstraint;
  self->_firstBaselineConstraint = v14;

  v16 = [(UILabel *)self->_tokenLabel lastBaselineAnchor];
  v17 = [(UIView *)self->_tokenView bottomAnchor];
  v18 = [(UILabel *)self->_tokenLabel font];
  [v18 _scaledValueForValue:-12.0];
  [v16 constraintEqualToAnchor:v17];
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  lastBaselineConstraint = self->_lastBaselineConstraint;
  self->_lastBaselineConstraint = v19;

  v42 = [(UIView *)self->_tokenView leadingAnchor];
  v41 = [(UILabel *)self->_tokenLabel leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:-15.0];
  v43[0] = v40;
  v39 = [(UIView *)self->_tokenView trailingAnchor];
  v38 = [(UILabel *)self->_tokenLabel trailingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:15.0];
  v21 = self->_firstBaselineConstraint;
  v43[1] = v37;
  v43[2] = v21;
  v43[3] = self->_lastBaselineConstraint;
  v36 = [v3 leadingAnchor];
  v35 = [(UIView *)self->_tokenView leadingAnchor];
  v33 = [v36 constraintEqualToAnchor:v35 constant:-15.0];
  v43[4] = v33;
  v22 = [(UIView *)self->_tokenView trailingAnchor];
  v23 = [(RAPCancellableTableViewCell *)self leadingAnchorForAccessoryView];
  v24 = [v22 constraintLessThanOrEqualToAnchor:v23 constant:-15.0];
  v43[5] = v24;
  v25 = v3;
  v34 = v3;
  v26 = [v3 topAnchor];
  v27 = [(UIView *)self->_tokenView topAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:-10.0];
  v43[6] = v28;
  v29 = [v25 bottomAnchor];
  v30 = [(UIView *)self->_tokenView bottomAnchor];
  v31 = [v29 constraintEqualToAnchor:v30 constant:9.0];
  v43[7] = v31;
  v32 = +[NSArray arrayWithObjects:v43 count:8];

  +[NSLayoutConstraint activateConstraints:v32];
}

- (RAPDisplayCategoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 itemKind:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)RAPDisplayCategoryTableViewCell;
  v5 = [(RAPCancellableTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 itemKind:a5];
  v6 = v5;
  if (v5)
  {
    [(RAPDisplayCategoryTableViewCell *)v5 setSelectionStyle:0];
    [(RAPDisplayCategoryTableViewCell *)v6 _configureTokenView];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v6;
}

- (void)setCategoryText:(id)a3
{
  p_categoryText = &self->_categoryText;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_categoryText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_categoryText, a3);
    [(UILabel *)self->_tokenLabel setText:*p_categoryText];
  }
}

- (void)_contentSizeDidChange
{
  v3 = +[UIFont system17];
  [(UILabel *)self->_tokenLabel setFont:v3];

  v4 = [(UILabel *)self->_tokenLabel font];
  [v4 _scaledValueForValue:24.0];
  -[NSLayoutConstraint setConstant:](self->_firstBaselineConstraint, "setConstant:");

  id v5 = [(UILabel *)self->_tokenLabel font];
  [v5 _scaledValueForValue:-12.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineConstraint, "setConstant:");
}

- (NSString)categoryText
{
  return self->_categoryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryText, 0);
  objc_storeStrong((id *)&self->_lastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_tokenLabel, 0);

  objc_storeStrong((id *)&self->_tokenView, 0);
}

@end