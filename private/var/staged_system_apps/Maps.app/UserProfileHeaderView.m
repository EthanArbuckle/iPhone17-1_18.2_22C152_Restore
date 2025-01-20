@interface UserProfileHeaderView
- (NSString)userEmail;
- (NSString)userName;
- (UIImage)userIcon;
- (UIImageView)userImageView;
- (UserProfileHeaderView)initWithFrame:(CGRect)a3;
- (UserProfileHeaderViewDelegate)delegate;
- (void)_adjustEmailButtonState;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateFonts;
- (void)headerViewLinkTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUserEmail:(id)a3;
- (void)setUserIcon:(id)a3;
- (void)setUserName:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UserProfileHeaderView

- (UserProfileHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UserProfileHeaderView;
  v3 = -[UserProfileHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UserProfileHeaderView *)v3 setAccessibilityIdentifier:@"UserProfileHeader"];
    [(UserProfileHeaderView *)v4 _setupViews];
    [(UserProfileHeaderView *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectMake(0, y, width, height)];
  userNameLabel = self->_userNameLabel;
  self->_userNameLabel = v7;

  [(UILabel *)self->_userNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v9 = sub_1000BBB44(self);
  v10 = (id *)&UIFontTextStyleTitle3;
  if (v9 != 5) {
    v10 = (id *)&UIFontTextStyleTitle2;
  }
  id v11 = *v10;
  v12 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v11];
  v13 = [v12 fontDescriptorWithSymbolicTraits:2];
  v14 = +[UIFont fontWithDescriptor:v13 size:0.0];
  [(UILabel *)self->_userNameLabel setFont:v14];

  v15 = +[UIColor labelColor];
  [(UILabel *)self->_userNameLabel setTextColor:v15];

  [(UILabel *)self->_userNameLabel setAccessibilityIdentifier:@"UserNameLabel"];
  v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  userEmailLabel = self->_userEmailLabel;
  self->_userEmailLabel = v16;

  [(UILabel *)self->_userEmailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_userEmailLabel setLineBreakMode:4];
  v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_userEmailLabel setFont:v18];

  [(UILabel *)self->_userEmailLabel setAccessibilityIdentifier:@"UserEmailButton"];
  id v19 = objc_alloc((Class)UIStackView);
  v20 = self->_userEmailLabel;
  v27[0] = self->_userNameLabel;
  v27[1] = v20;
  v21 = +[NSArray arrayWithObjects:v27 count:2];
  v22 = (UIStackView *)[v19 initWithArrangedSubviews:v21];
  userInfoLabelsStackView = self->_userInfoLabelsStackView;
  self->_userInfoLabelsStackView = v22;

  [(UIStackView *)self->_userInfoLabelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_userInfoLabelsStackView setAxis:1];
  [(UIStackView *)self->_userInfoStackView setAlignment:1];
  [(UIStackView *)self->_userInfoLabelsStackView setSpacing:0.0];
  [(UIStackView *)self->_userInfoLabelsStackView setAccessibilityIdentifier:@"UserInfoLabelsStack"];
  v24 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  userImageView = self->_userImageView;
  self->_userImageView = v24;

  [(UIImageView *)self->_userImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = +[UIColor systemGrayColor];
  [(UIImageView *)self->_userImageView setTintColor:v26];

  [(UIImageView *)self->_userImageView setAccessibilityIdentifier:@"UserImageView"];
  [(UserProfileHeaderView *)self addSubview:self->_userImageView];
  [(UserProfileHeaderView *)self addSubview:self->_userInfoLabelsStackView];
}

- (void)_setupConstraints
{
  v29 = [(UIImageView *)self->_userImageView widthAnchor];
  v28 = [v29 constraintEqualToConstant:48.0];
  v30[0] = v28;
  v27 = [(UIImageView *)self->_userImageView heightAnchor];
  v26 = [(UIImageView *)self->_userImageView widthAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v30[1] = v25;
  v24 = [(UIImageView *)self->_userImageView topAnchor];
  v23 = [(UserProfileHeaderView *)self topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:16.0];
  v30[2] = v22;
  v21 = [(UIImageView *)self->_userImageView leadingAnchor];
  v20 = [(UserProfileHeaderView *)self leadingAnchor];
  id v19 = [v21 constraintEqualToAnchor:v20 constant:24.0];
  v30[3] = v19;
  v18 = [(UIImageView *)self->_userImageView trailingAnchor];
  v17 = [(UIStackView *)self->_userInfoLabelsStackView leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:-10.0];
  v30[4] = v16;
  v15 = [(UIStackView *)self->_userInfoLabelsStackView topAnchor];
  v14 = [(UserProfileHeaderView *)self topAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:16.0];
  v30[5] = v13;
  id v3 = [(UIStackView *)self->_userInfoLabelsStackView leadingAnchor];
  v4 = [(UIImageView *)self->_userImageView trailingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:10.0];
  v30[6] = v5;
  objc_super v6 = [(UIStackView *)self->_userInfoLabelsStackView trailingAnchor];
  v7 = [(UserProfileHeaderView *)self trailingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:-0.0];
  v30[7] = v8;
  uint64_t v9 = [(UIStackView *)self->_userInfoLabelsStackView bottomAnchor];
  v10 = [(UserProfileHeaderView *)self bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:-16.0];
  v30[8] = v11;
  v12 = +[NSArray arrayWithObjects:v30 count:9];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)headerViewLinkTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 headerViewLinkTapped:self];
  }
}

- (void)setUserName:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_userName != v5)
  {
    objc_storeStrong((id *)&self->_userName, a3);
    [(UILabel *)self->_userNameLabel setText:v5];
  }
}

- (void)setUserEmail:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_userEmail != v5)
  {
    objc_storeStrong((id *)&self->_userEmail, a3);
    [(UILabel *)self->_userEmailLabel setText:v5];
    [(UserProfileHeaderView *)self _adjustEmailButtonState];
  }
}

- (void)setUserIcon:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_userIcon != v5)
  {
    objc_storeStrong((id *)&self->_userIcon, a3);
    [(UIImageView *)self->_userImageView setImage:v5];
  }
}

- (void)_adjustEmailButtonState
{
  id v7 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"headerViewLinkTapped:"];
  [v7 setNumberOfTapsRequired:1];
  [(UILabel *)self->_userEmailLabel addGestureRecognizer:v7];
  id v3 = +[UserInformationManager sharedInstance];
  unsigned int v4 = [v3 loggedIn];

  userEmailLabel = self->_userEmailLabel;
  if (v4)
  {
    [(UILabel *)userEmailLabel setUserInteractionEnabled:0];
    +[UIColor systemGrayColor];
  }
  else
  {
    [(UILabel *)userEmailLabel setUserInteractionEnabled:1];
    +[UIColor systemBlueColor];
  char v6 = };
  [(UILabel *)self->_userEmailLabel setTextColor:v6];
}

- (void)_updateFonts
{
  uint64_t v3 = sub_1000BBB44(self);
  unsigned int v4 = &UIFontTextStyleTitle3;
  if (v3 != 5) {
    unsigned int v4 = &UIFontTextStyleTitle2;
  }
  v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:*v4];
  char v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  id v7 = +[UIFont fontWithDescriptor:v6 size:0.0];
  [(UILabel *)self->_userNameLabel setFont:v7];

  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_userEmailLabel setFont:v8];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UserProfileHeaderView;
  id v4 = a3;
  [(UserProfileHeaderView *)&v9 traitCollectionDidChange:v4];
  v5 = [(UserProfileHeaderView *)self traitCollection];
  char v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7);
  if (v8) {
    [(UserProfileHeaderView *)self _updateFonts];
  }
}

- (NSString)userName
{
  return self->_userName;
}

- (NSString)userEmail
{
  return self->_userEmail;
}

- (UIImage)userIcon
{
  return self->_userIcon;
}

- (UIImageView)userImageView
{
  return self->_userImageView;
}

- (UserProfileHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UserProfileHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userImageView, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_userEmail, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userInfoStackView, 0);
  objc_storeStrong((id *)&self->_userInfoLabelsStackView, 0);
  objc_storeStrong((id *)&self->_userEmailLabel, 0);

  objc_storeStrong((id *)&self->_userNameLabel, 0);
}

@end