@interface RAPDisplayUserContentTableViewCell
- (NSString)emailString;
- (NSString)nameString;
- (RAPDisplayUserContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_configureViews;
- (void)_retrieveUserInformation;
- (void)setEmailString:(id)a3;
- (void)setNameString:(id)a3;
@end

@implementation RAPDisplayUserContentTableViewCell

- (RAPDisplayUserContentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RAPDisplayUserContentTableViewCell;
  v4 = [(RAPDisplayUserContentTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(RAPDisplayUserContentTableViewCell *)v4 _configureViews];
    [(RAPDisplayUserContentTableViewCell *)v5 _retrieveUserInformation];
  }
  return v5;
}

- (void)_configureViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v7 = (UILabel *)[v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  userNameLabel = self->_userNameLabel;
  self->_userNameLabel = v7;

  [(UILabel *)self->_userNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_userNameLabel setNumberOfLines:1];
  v9 = +[RAPFontManager userInfoTableViewCellPrimaryLabelFont];
  [(UILabel *)self->_userNameLabel setFont:v9];

  v10 = +[UIColor labelColor];
  [(UILabel *)self->_userNameLabel setTextColor:v10];

  v11 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  userEmailLabel = self->_userEmailLabel;
  self->_userEmailLabel = v11;

  [(UILabel *)self->_userEmailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_userEmailLabel setNumberOfLines:1];
  v13 = +[RAPFontManager userInfoTableViewCellSecondaryLabelFont];
  [(UILabel *)self->_userEmailLabel setFont:v13];

  v14 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_userEmailLabel setTextColor:v14];

  id v15 = objc_alloc((Class)UIStackView);
  v16 = self->_userEmailLabel;
  v49[0] = self->_userNameLabel;
  v49[1] = v16;
  v17 = +[NSArray arrayWithObjects:v49 count:2];
  v18 = (UIStackView *)[v15 initWithArrangedSubviews:v17];
  labelsStackView = self->_labelsStackView;
  self->_labelsStackView = v18;

  [(UIStackView *)self->_labelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_labelsStackView setAxis:1];
  [(UIStackView *)self->_labelsStackView setSpacing:0.0];
  v20 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectMake(0, 0, width, height)];
  userImageView = self->_userImageView;
  self->_userImageView = v20;

  [(UIImageView *)self->_userImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [(RAPDisplayUserContentTableViewCell *)self contentView];
  [v22 addSubview:self->_labelsStackView];
  [v22 addSubview:self->_userImageView];
  if (sub_1000BBB44(self) == 5)
  {
    v23 = +[UIColor systemBackgroundColor];
    [v22 setBackgroundColor:v23];
  }
  v47 = [(UIImageView *)self->_userImageView widthAnchor];
  v46 = [v47 constraintEqualToConstant:36.0];
  v48[0] = v46;
  v45 = [(UIImageView *)self->_userImageView heightAnchor];
  v44 = [(UIImageView *)self->_userImageView widthAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v48[1] = v43;
  v42 = [(UIImageView *)self->_userImageView centerYAnchor];
  v41 = [v22 centerYAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v48[2] = v40;
  v39 = [(UIImageView *)self->_userImageView leadingAnchor];
  v38 = [v22 leadingAnchor];
  v37 = [v39 constraintEqualToAnchor:v38 constant:15.0];
  v48[3] = v37;
  v36 = [(UIStackView *)self->_labelsStackView leadingAnchor];
  v35 = [(UIImageView *)self->_userImageView trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:6.0];
  v48[4] = v34;
  v33 = [(UIStackView *)self->_labelsStackView trailingAnchor];
  v32 = [v22 trailingAnchor];
  v24 = [v33 constraintLessThanOrEqualToAnchor:v32 constant:-15.0];
  v48[5] = v24;
  v25 = [(UIStackView *)self->_labelsStackView topAnchor];
  v26 = [v22 topAnchor];
  v27 = [v25 constraintGreaterThanOrEqualToAnchor:v26 constant:15.0];
  v48[6] = v27;
  v28 = [(UIStackView *)self->_labelsStackView bottomAnchor];
  v29 = [v22 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:-15.0];
  v48[7] = v30;
  v31 = +[NSArray arrayWithObjects:v48 count:8];
  +[NSLayoutConstraint activateConstraints:v31];

  [(RAPDisplayUserContentTableViewCell *)self setSelectionStyle:0];
}

- (void)_retrieveUserInformation
{
  id v7 = +[GEOUserAccountInfo primaryICloudAccount];
  id v3 = +[UserInformationManager sharedInstance];
  if (v7)
  {
    v4 = [v3 userName];
    [(UILabel *)self->_userNameLabel setText:v4];

    v5 = [v3 userEmail];
    [(UILabel *)self->_userEmailLabel setText:v5];

    v6 = [v3 userIcon];
    [(UIImageView *)self->_userImageView setImage:v6];
  }
}

- (void)setNameString:(id)a3
{
}

- (NSString)nameString
{
  return [(UILabel *)self->_userNameLabel text];
}

- (void)setEmailString:(id)a3
{
}

- (NSString)emailString
{
  return [(UILabel *)self->_userEmailLabel text];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_userImageView, 0);
  objc_storeStrong((id *)&self->_userEmailLabel, 0);

  objc_storeStrong((id *)&self->_userNameLabel, 0);
}

@end