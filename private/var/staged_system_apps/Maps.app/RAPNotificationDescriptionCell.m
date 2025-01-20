@interface RAPNotificationDescriptionCell
+ (id)identifier;
- (RAPNotificationDescriptionCell)initWithFrame:(CGRect)a3;
- (RAPNotificationDescriptionCellDelegate)delegate;
- (RAPNotificationDescriptionViewModel)viewModel;
- (UIButton)linkButton;
- (UIImageView)statusIcon;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)cellLayoutGuide;
- (UIView)statusIconBackground;
- (void)_linkButtonClick;
- (void)_setupConstraints;
- (void)_setupLinkButtonIfNeeded;
- (void)_setupViews;
- (void)setCellLayoutGuide:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setStatusIcon:(id)a3;
- (void)setStatusIconBackground:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation RAPNotificationDescriptionCell

+ (id)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (RAPNotificationDescriptionCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDescriptionCell;
  v3 = -[RAPNotificationDescriptionCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RAPNotificationDescriptionCell *)v3 _setupViews];
    [(RAPNotificationDescriptionCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UIStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  containerView = self->_containerView;
  self->_containerView = v7;

  [(UIStackView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(RAPNotificationDescriptionCell *)self contentView];
  [v9 addSubview:self->_containerView];

  v10 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  descriptionTitleContainer = self->_descriptionTitleContainer;
  self->_descriptionTitleContainer = v10;

  [(UIStackView *)self->_descriptionTitleContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_descriptionTitleContainer setAxis:0];
  [(UIStackView *)self->_descriptionTitleContainer setSpacing:8.0];
  [(UIStackView *)self->_descriptionTitleContainer setAlignment:3];
  id v12 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(RAPNotificationDescriptionCell *)self setStatusIconBackground:v12];

  v13 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v15 = [v14 layer];
  [v15 setCornerRadius:12.0];

  v16 = +[UIColor clearColor];
  v17 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  [v17 setBackgroundColor:v16];

  v18 = self->_descriptionTitleContainer;
  v19 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  [(UIStackView *)v18 addArrangedSubview:v19];

  id v20 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(RAPNotificationDescriptionCell *)self setStatusIcon:v20];

  v21 = [(RAPNotificationDescriptionCell *)self statusIcon];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v22 = +[UIColor clearColor];
  v23 = [(RAPNotificationDescriptionCell *)self statusIcon];
  [v23 setBackgroundColor:v22];

  v24 = +[UIColor systemWhiteColor];
  v25 = [(RAPNotificationDescriptionCell *)self statusIcon];
  [v25 setTintColor:v24];

  v26 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v27 = [(RAPNotificationDescriptionCell *)self statusIcon];
  [v26 addSubview:v27];

  id v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(RAPNotificationDescriptionCell *)self setTitleLabel:v28];

  v29 = [(RAPNotificationDescriptionCell *)self titleLabel];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(RAPNotificationDescriptionCell *)self titleLabel];
  [v30 setNumberOfLines:0];

  v31 = +[UIColor labelColor];
  v32 = [(RAPNotificationDescriptionCell *)self titleLabel];
  [v32 setTextColor:v31];

  uint64_t v33 = sub_1000BBB44(self);
  v34 = [(RAPNotificationDescriptionCell *)self titleLabel];
  if (v33 == 5) {
    v35 = &stru_1013214C0;
  }
  else {
    v35 = &stru_1013212C0;
  }
  +[DynamicTypeWizard autorefreshLabel:v34 withFontProvider:v35];

  v36 = self->_descriptionTitleContainer;
  v37 = [(RAPNotificationDescriptionCell *)self titleLabel];
  [(UIStackView *)v36 addArrangedSubview:v37];

  id v38 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(RAPNotificationDescriptionCell *)self setDescriptionLabel:v38];

  v39 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

  v40 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
  [v40 setNumberOfLines:0];

  v41 = +[UIColor labelColor];
  v42 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
  [v42 setTextColor:v41];

  v43 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
  +[DynamicTypeWizard autorefreshLabel:v43 withFontProvider:&stru_101321300];

  [(UIStackView *)self->_containerView addArrangedSubview:self->_descriptionTitleContainer];
  v44 = self->_containerView;
  v45 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
  [(UIStackView *)v44 addArrangedSubview:v45];

  [(UIStackView *)self->_containerView setAxis:1];
  [(UIStackView *)self->_containerView setSpacing:10.0];
  v46 = self->_containerView;

  [(UIStackView *)v46 setAlignment:1];
}

- (void)_setupConstraints
{
  v44 = [(UIStackView *)self->_containerView topAnchor];
  v45 = [(RAPNotificationDescriptionCell *)self contentView];
  v43 = [v45 topAnchor];
  v42 = [v44 constraintEqualToAnchor:v43 constant:16.0];
  v46[0] = v42;
  v40 = [(UIStackView *)self->_containerView leadingAnchor];
  v41 = [(RAPNotificationDescriptionCell *)self contentView];
  v39 = [v41 leadingAnchor];
  id v38 = [v40 constraintEqualToAnchor:v39 constant:16.0];
  v46[1] = v38;
  v36 = [(UIStackView *)self->_containerView trailingAnchor];
  v37 = [(RAPNotificationDescriptionCell *)self contentView];
  v35 = [v37 trailingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:-16.0];
  v46[2] = v34;
  v32 = [(UIStackView *)self->_containerView bottomAnchor];
  uint64_t v33 = [(RAPNotificationDescriptionCell *)self contentView];
  v31 = [v33 bottomAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:-16.0];
  v46[3] = v30;
  v29 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v27 = [v29 heightAnchor];
  id v28 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v26 = [v28 widthAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v46[4] = v25;
  v24 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v23 = [v24 heightAnchor];
  v22 = [v23 constraintEqualToConstant:24.0];
  v46[5] = v22;
  v21 = [(RAPNotificationDescriptionCell *)self statusIcon];
  v19 = [v21 centerXAnchor];
  id v20 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v18 = [v20 centerXAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v46[6] = v17;
  v16 = [(RAPNotificationDescriptionCell *)self statusIcon];
  v14 = [v16 centerYAnchor];
  v15 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v13 = [v15 centerYAnchor];
  id v3 = [v14 constraintEqualToAnchor:v13];
  v46[7] = v3;
  v4 = [(RAPNotificationDescriptionCell *)self statusIcon];
  v5 = [v4 widthAnchor];
  objc_super v6 = [(RAPNotificationDescriptionCell *)self statusIcon];
  v7 = [v6 heightAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  v46[8] = v8;
  v9 = [(RAPNotificationDescriptionCell *)self statusIcon];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintEqualToConstant:16.0];
  v46[9] = v11;
  id v12 = +[NSArray arrayWithObjects:v46 count:10];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_setupLinkButtonIfNeeded
{
  id v3 = [(RAPNotificationDescriptionCell *)self viewModel];
  unsigned int v4 = [v3 shouldDisplayLink];

  v5 = [(RAPNotificationDescriptionCell *)self linkButton];
  id v11 = v5;
  if (v4)
  {

    if (v11) {
      return;
    }
    id v11 = +[UIButtonConfiguration plainButtonConfiguration];
    objc_super v6 = [(RAPNotificationDescriptionCell *)self viewModel];
    v7 = [v6 linkButtonText];
    [v11 setTitle:v7];

    v8 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:14.0];
    v9 = +[UIImage systemImageNamed:@"arrow.up.right" withConfiguration:v8];
    [v11 setImage:v9];

    [v11 setImagePlacement:8];
    [v11 setImagePadding:3.0];
    [v11 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
    v10 = +[UIButton buttonWithType:1];
    [v10 setConfiguration:v11];
    [v10 setPreferredBehavioralStyle:1];
    [v10 addTarget:self action:"_linkButtonClick" forControlEvents:0x2000];
    [(UIStackView *)self->_containerView addArrangedSubview:v10];
    [(RAPNotificationDescriptionCell *)self setLinkButton:v10];
  }
  else
  {
    [v5 removeFromSuperview];
  }
}

- (void)_linkButtonClick
{
  id v3 = [(RAPNotificationDescriptionCell *)self delegate];
  [v3 descriptionCellLinkButtonClick:self];
}

- (void)setViewModel:(id)a3
{
  v5 = (RAPNotificationDescriptionViewModel *)a3;
  if (self->_viewModel == v5) {
    goto LABEL_13;
  }
  id v28 = v5;
  objc_storeStrong((id *)&self->_viewModel, a3);
  objc_super v6 = [(RAPNotificationDescriptionViewModel *)v28 imageName];
  if (![v6 length])
  {

    goto LABEL_6;
  }
  v7 = [(RAPNotificationDescriptionViewModel *)v28 imageBackgroundColor];

  if (!v7)
  {
LABEL_6:
    v14 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
    v15 = v14;
    uint64_t v16 = 1;
    goto LABEL_7;
  }
  v8 = [(RAPNotificationDescriptionViewModel *)v28 imageName];
  v9 = +[UIImageSymbolConfiguration configurationWithWeight:6];
  v10 = +[UIImage systemImageNamed:v8 withConfiguration:v9];
  id v11 = [(RAPNotificationDescriptionCell *)self statusIcon];
  [v11 setImage:v10];

  id v12 = [(RAPNotificationDescriptionViewModel *)v28 imageBackgroundColor];
  v13 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  [v13 setBackgroundColor:v12];

  v14 = [(RAPNotificationDescriptionCell *)self statusIconBackground];
  v15 = v14;
  uint64_t v16 = 0;
LABEL_7:
  [v14 setHidden:v16];

  v17 = [(RAPNotificationDescriptionViewModel *)v28 titleText];
  id v18 = [v17 length];

  if (v18)
  {
    v19 = [(RAPNotificationDescriptionViewModel *)v28 titleText];
    id v20 = [(RAPNotificationDescriptionCell *)self titleLabel];
    [v20 setText:v19];
  }
  [(UIStackView *)self->_descriptionTitleContainer setHidden:v18 == 0];
  v21 = [(RAPNotificationDescriptionViewModel *)v28 descriptionText];
  id v22 = [v21 length];

  if (v22)
  {
    v23 = [(RAPNotificationDescriptionViewModel *)v28 descriptionText];
    v24 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
    [v24 setText:v23];

    v25 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
    v26 = v25;
    uint64_t v27 = 0;
  }
  else
  {
    v25 = [(RAPNotificationDescriptionCell *)self descriptionLabel];
    v26 = v25;
    uint64_t v27 = 1;
  }
  [v25 setHidden:v27];

  [(RAPNotificationDescriptionCell *)self _setupLinkButtonIfNeeded];
  v5 = v28;
LABEL_13:
}

- (RAPNotificationDescriptionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPNotificationDescriptionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RAPNotificationDescriptionViewModel)viewModel
{
  return self->_viewModel;
}

- (UILayoutGuide)cellLayoutGuide
{
  return self->_cellLayoutGuide;
}

- (void)setCellLayoutGuide:(id)a3
{
}

- (UIImageView)statusIcon
{
  return self->_statusIcon;
}

- (void)setStatusIcon:(id)a3
{
}

- (UIView)statusIconBackground
{
  return self->_statusIconBackground;
}

- (void)setStatusIconBackground:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_statusIconBackground, 0);
  objc_storeStrong((id *)&self->_statusIcon, 0);
  objc_storeStrong((id *)&self->_cellLayoutGuide, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_descriptionTitleContainer, 0);
}

@end