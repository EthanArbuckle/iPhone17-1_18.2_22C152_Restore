@interface ExtensionFlowHeaderView
- (CardButton)dismissButtonX;
- (ExtensionFlowHeaderView)initWithFrame:(CGRect)a3;
- (ExtensionFlowHeaderViewDelegate)delegate;
- (NSLayoutConstraint)iconImageViewLeadingConstraint;
- (NSLayoutConstraint)titleVerticalConstraintDetailNotPresent;
- (NSLayoutConstraint)titleVerticalConstraintDetailPresent;
- (NSString)detailText;
- (NSString)titleText;
- (UIButton)dismissButtonDone;
- (UIImage)bannerImage;
- (UIImage)iconImage;
- (UIImageView)bannerImageView;
- (UIImageView)iconImageView;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (unint64_t)dismissButtonType;
- (void)configureDismissButton;
- (void)configureImages;
- (void)dismissButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setBannerImage:(id)a3;
- (void)setBannerImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDismissButtonType:(unint64_t)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setIconImageViewLeadingConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setTitleVerticalConstraintDetailNotPresent:(id)a3;
- (void)setTitleVerticalConstraintDetailPresent:(id)a3;
- (void)setupConstraints;
@end

@implementation ExtensionFlowHeaderView

- (ExtensionFlowHeaderView)initWithFrame:(CGRect)a3
{
  v44.receiver = self;
  v44.super_class = (Class)ExtensionFlowHeaderView;
  v3 = -[ExtensionFlowHeaderView initWithFrame:](&v44, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ExtensionFlowHeaderView *)v3 setAutoresizingMask:2];
    v4->_dismissButtonType = 0;
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v5;

    v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    bannerImageView = v4->_bannerImageView;
    v4->_bannerImageView = v7;

    [(UIImageView *)v4->_bannerImageView setContentMode:1];
    uint64_t v9 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v9;

    v11 = +[UIFont systemFontOfSize:20.0 weight:UIFontWeightMedium];
    [(UILabel *)v4->_titleLabel setFont:v11];

    v12 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v12];

    uint64_t v13 = objc_opt_new();
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = (UILabel *)v13;

    v15 = +[UIFont systemFontOfSize:14.0 weight:UIFontWeightRegular];
    [(UILabel *)v4->_detailLabel setFont:v15];

    v16 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_detailLabel setTextColor:v16];

    v17 = [CardButton alloc];
    v18 = +[CardButtonConfiguration close];
    v19 = [(CardButton *)v17 initWithConfiguration:v18];
    dismissButtonX = v4->_dismissButtonX;
    v4->_dismissButtonX = v19;

    uint64_t v21 = +[UIButton buttonWithType:102];
    dismissButtonDone = v4->_dismissButtonDone;
    v4->_dismissButtonDone = (UIButton *)v21;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v45[0] = v4->_dismissButtonX;
    v45[1] = v4->_dismissButtonDone;
    v23 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 2, 0);
    id v24 = [v23 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v24)
    {
      id v26 = v24;
      uint64_t v27 = *(void *)v41;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(v23);
          }
          v29 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          LODWORD(v25) = 1148846080;
          [v29 setContentCompressionResistancePriority:0 forAxis:v25];
          LODWORD(v30) = 1148846080;
          [v29 setContentHuggingPriority:0 forAxis:v30];
        }
        id v26 = [v23 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v26);
    }

    v31 = [(ExtensionFlowHeaderView *)v4 dismissButtonDone];
    [v31 addTarget:v4 action:"dismissButtonTapped:" forControlEvents:64];

    v32 = [(ExtensionFlowHeaderView *)v4 dismissButtonX];
    [v32 addTarget:v4 action:"dismissButtonTapped:" forControlEvents:64];

    v33 = [(ExtensionFlowHeaderView *)v4 bannerImageView];
    [(ExtensionFlowHeaderView *)v4 addSubview:v33];

    v34 = [(ExtensionFlowHeaderView *)v4 iconImageView];
    [(ExtensionFlowHeaderView *)v4 addSubview:v34];

    v35 = [(ExtensionFlowHeaderView *)v4 titleLabel];
    [(ExtensionFlowHeaderView *)v4 addSubview:v35];

    v36 = [(ExtensionFlowHeaderView *)v4 detailLabel];
    [(ExtensionFlowHeaderView *)v4 addSubview:v36];

    v37 = [(ExtensionFlowHeaderView *)v4 dismissButtonX];
    [(ExtensionFlowHeaderView *)v4 addSubview:v37];

    v38 = [(ExtensionFlowHeaderView *)v4 dismissButtonDone];
    [(ExtensionFlowHeaderView *)v4 addSubview:v38];

    [(ExtensionFlowHeaderView *)v4 setupConstraints];
    [(ExtensionFlowHeaderView *)v4 configureDismissButton];
  }
  return v4;
}

- (void)setupConstraints
{
  v3 = [(ExtensionFlowHeaderView *)self titleLabel];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v4 = [(ExtensionFlowHeaderView *)self detailLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(ExtensionFlowHeaderView *)self dismissButtonX];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(ExtensionFlowHeaderView *)self iconImageView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(ExtensionFlowHeaderView *)self bannerImageView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v9 = [(ExtensionFlowHeaderView *)self iconImageView];
  v10 = [v9 leadingAnchor];
  v11 = [(ExtensionFlowHeaderView *)self leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11 constant:15.0];
  [(ExtensionFlowHeaderView *)self setIconImageViewLeadingConstraint:v12];

  uint64_t v13 = [(ExtensionFlowHeaderView *)self titleLabel];
  v14 = [v13 lastBaselineAnchor];
  v15 = [(ExtensionFlowHeaderView *)self topAnchor];
  v16 = [v14 constraintEqualToAnchor:v15 constant:28.5];
  [(ExtensionFlowHeaderView *)self setTitleVerticalConstraintDetailPresent:v16];

  v17 = [(ExtensionFlowHeaderView *)self titleLabel];
  v18 = [v17 centerYAnchor];
  v19 = [(ExtensionFlowHeaderView *)self centerYAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [(ExtensionFlowHeaderView *)self setTitleVerticalConstraintDetailNotPresent:v20];

  v83 = [(ExtensionFlowHeaderView *)self iconImageViewLeadingConstraint];
  v84[0] = v83;
  v82 = [(ExtensionFlowHeaderView *)self iconImageView];
  v81 = [v82 centerYAnchor];
  v80 = [(ExtensionFlowHeaderView *)self centerYAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v84[1] = v79;
  v78 = [(ExtensionFlowHeaderView *)self bannerImageView];
  v76 = [v78 leadingAnchor];
  v77 = [(ExtensionFlowHeaderView *)self iconImageView];
  v75 = [v77 leadingAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v84[2] = v74;
  v73 = [(ExtensionFlowHeaderView *)self bannerImageView];
  v72 = [v73 centerYAnchor];
  v71 = [(ExtensionFlowHeaderView *)self centerYAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v84[3] = v70;
  v69 = [(ExtensionFlowHeaderView *)self bannerImageView];
  v68 = [v69 widthAnchor];
  v67 = [v68 constraintLessThanOrEqualToConstant:125.0];
  v84[4] = v67;
  v66 = [(ExtensionFlowHeaderView *)self bannerImageView];
  v65 = [v66 heightAnchor];
  v64 = [v65 constraintLessThanOrEqualToConstant:46.0];
  v84[5] = v64;
  v63 = [(ExtensionFlowHeaderView *)self titleLabel];
  v61 = [v63 leadingAnchor];
  v62 = [(ExtensionFlowHeaderView *)self iconImageView];
  v60 = [v62 trailingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:15.0];
  v84[6] = v59;
  v58 = [(ExtensionFlowHeaderView *)self titleLabel];
  v56 = [v58 trailingAnchor];
  v57 = [(ExtensionFlowHeaderView *)self dismissButtonX];
  v55 = [v57 leadingAnchor];
  v54 = [v56 constraintLessThanOrEqualToAnchor:v55 constant:-15.0];
  v84[7] = v54;
  v53 = [(ExtensionFlowHeaderView *)self titleVerticalConstraintDetailPresent];
  v84[8] = v53;
  v52 = [(ExtensionFlowHeaderView *)self detailLabel];
  v50 = [v52 leadingAnchor];
  v51 = [(ExtensionFlowHeaderView *)self titleLabel];
  v49 = [v51 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v84[9] = v48;
  v47 = [(ExtensionFlowHeaderView *)self detailLabel];
  v45 = [v47 trailingAnchor];
  v46 = [(ExtensionFlowHeaderView *)self titleLabel];
  objc_super v44 = [v46 trailingAnchor];
  long long v43 = [v45 constraintEqualToAnchor:v44];
  v84[10] = v43;
  long long v42 = [(ExtensionFlowHeaderView *)self detailLabel];
  long long v40 = [v42 lastBaselineAnchor];
  long long v41 = [(ExtensionFlowHeaderView *)self titleLabel];
  v39 = [v41 lastBaselineAnchor];
  v38 = [v40 constraintEqualToAnchor:v39 constant:17.5];
  v84[11] = v38;
  v37 = [(ExtensionFlowHeaderView *)self dismissButtonX];
  v36 = [v37 centerYAnchor];
  v35 = [(ExtensionFlowHeaderView *)self centerYAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v84[12] = v34;
  v33 = [(ExtensionFlowHeaderView *)self dismissButtonX];
  v32 = [v33 trailingAnchor];
  v31 = [(ExtensionFlowHeaderView *)self trailingAnchor];
  uint64_t v21 = [v32 constraintEqualToAnchor:v31];
  v84[13] = v21;
  v22 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
  v23 = [v22 centerYAnchor];
  id v24 = [(ExtensionFlowHeaderView *)self centerYAnchor];
  double v25 = [v23 constraintEqualToAnchor:v24];
  v84[14] = v25;
  id v26 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
  uint64_t v27 = [v26 trailingAnchor];
  v28 = [(ExtensionFlowHeaderView *)self trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:-15.0];
  v84[15] = v29;
  double v30 = +[NSArray arrayWithObjects:v84 count:16];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)configureDismissButton
{
  unint64_t v3 = [(ExtensionFlowHeaderView *)self dismissButtonType];
  if (v3 == 1)
  {
    v11 = [(ExtensionFlowHeaderView *)self dismissButtonX];
    [v11 setHidden:0];

    uint64_t v9 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
    id v12 = v9;
    uint64_t v10 = 1;
  }
  else
  {
    if (v3) {
      return;
    }
    v4 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"extension_flow_done_key" value:@"localized string not found" table:0];
    [v4 setTitle:v6 forState:0];

    v7 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
    [v7 setImage:0 forState:0];

    v8 = [(ExtensionFlowHeaderView *)self dismissButtonX];
    [v8 setHidden:1];

    uint64_t v9 = [(ExtensionFlowHeaderView *)self dismissButtonDone];
    id v12 = v9;
    uint64_t v10 = 0;
  }
  [v9 setHidden:v10];
}

- (void)configureImages
{
  unint64_t v3 = [(ExtensionFlowHeaderView *)self bannerImageView];
  v4 = [v3 image];

  v5 = [(ExtensionFlowHeaderView *)self bannerImageView];
  v6 = v5;
  if (v4)
  {
    [v5 setAlpha:1.0];

    v7 = [(ExtensionFlowHeaderView *)self iconImageView];
    [v7 setAlpha:0.0];

    v8 = [(ExtensionFlowHeaderView *)self titleLabel];
    [v8 setAlpha:0.0];

    uint64_t v9 = [(ExtensionFlowHeaderView *)self detailLabel];
    uint64_t v10 = v9;
    double v11 = 0.0;
  }
  else
  {
    [v5 setAlpha:0.0];

    id v12 = [(ExtensionFlowHeaderView *)self iconImageView];
    [v12 setAlpha:1.0];

    uint64_t v13 = [(ExtensionFlowHeaderView *)self titleLabel];
    [v13 setAlpha:1.0];

    uint64_t v9 = [(ExtensionFlowHeaderView *)self detailLabel];
    uint64_t v10 = v9;
    double v11 = 1.0;
  }
  [v9 setAlpha:v11];

  id v17 = [(ExtensionFlowHeaderView *)self iconImageView];
  v14 = [v17 image];
  if (v14) {
    double v15 = 15.0;
  }
  else {
    double v15 = 0.0;
  }
  v16 = [(ExtensionFlowHeaderView *)self iconImageViewLeadingConstraint];
  [v16 setConstant:v15];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ExtensionFlowHeaderView;
  [(ExtensionFlowHeaderView *)&v4 layoutSubviews];
  unint64_t v3 = +[UIColor systemBackgroundColor];
  [(ExtensionFlowHeaderView *)self setBackgroundColor:v3];
}

- (void)dismissButtonTapped:(id)a3
{
  id v4 = [(ExtensionFlowHeaderView *)self delegate];
  [v4 extensionFlowHeaderViewDidTapDismiss:self];
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  v5 = [(ExtensionFlowHeaderView *)self iconImageView];
  [v5 setImage:v4];

  [(ExtensionFlowHeaderView *)self configureImages];
}

- (UIImage)iconImage
{
  v2 = [(ExtensionFlowHeaderView *)self iconImageView];
  unint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setBannerImage:(id)a3
{
  id v4 = a3;
  v5 = [(ExtensionFlowHeaderView *)self bannerImageView];
  [v5 setImage:v4];

  [(ExtensionFlowHeaderView *)self configureImages];
}

- (UIImage)bannerImage
{
  v2 = [(ExtensionFlowHeaderView *)self bannerImageView];
  unint64_t v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setTitleText:(id)a3
{
  id v4 = a3;
  id v5 = [(ExtensionFlowHeaderView *)self titleLabel];
  [v5 setText:v4];
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  id v5 = [(ExtensionFlowHeaderView *)self detailLabel];
  [v5 setText:v4];

  id v6 = [v4 length];
  if (v6)
  {
    v7 = [(ExtensionFlowHeaderView *)self titleVerticalConstraintDetailPresent];
    [v7 setActive:1];

    [(ExtensionFlowHeaderView *)self titleVerticalConstraintDetailNotPresent];
  }
  else
  {
    v8 = [(ExtensionFlowHeaderView *)self titleVerticalConstraintDetailNotPresent];
    [v8 setActive:1];

    [(ExtensionFlowHeaderView *)self titleVerticalConstraintDetailPresent];
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 setActive:0];
}

- (NSString)titleText
{
  v2 = [(ExtensionFlowHeaderView *)self titleLabel];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (NSString)detailText
{
  v2 = [(ExtensionFlowHeaderView *)self detailLabel];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setDismissButtonType:(unint64_t)a3
{
  if (self->_dismissButtonType != a3)
  {
    self->_dismissButtonType = a3;
    [(ExtensionFlowHeaderView *)self configureDismissButton];
  }
}

- (unint64_t)dismissButtonType
{
  return self->_dismissButtonType;
}

- (ExtensionFlowHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ExtensionFlowHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CardButton)dismissButtonX
{
  return self->_dismissButtonX;
}

- (UIButton)dismissButtonDone
{
  return self->_dismissButtonDone;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIImageView)bannerImageView
{
  return self->_bannerImageView;
}

- (void)setBannerImageView:(id)a3
{
}

- (NSLayoutConstraint)iconImageViewLeadingConstraint
{
  return self->_iconImageViewLeadingConstraint;
}

- (void)setIconImageViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleVerticalConstraintDetailNotPresent
{
  return self->_titleVerticalConstraintDetailNotPresent;
}

- (void)setTitleVerticalConstraintDetailNotPresent:(id)a3
{
}

- (NSLayoutConstraint)titleVerticalConstraintDetailPresent
{
  return self->_titleVerticalConstraintDetailPresent;
}

- (void)setTitleVerticalConstraintDetailPresent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleVerticalConstraintDetailPresent, 0);
  objc_storeStrong((id *)&self->_titleVerticalConstraintDetailNotPresent, 0);
  objc_storeStrong((id *)&self->_iconImageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_bannerImageView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_dismissButtonDone, 0);
  objc_storeStrong((id *)&self->_dismissButtonX, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end