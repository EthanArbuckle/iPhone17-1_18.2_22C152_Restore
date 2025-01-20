@interface CarTrafficAlertBannerView
- (BNBannerSource)target;
- (BOOL)aperturePresentation;
- (BannerItem)item;
- (CGSize)sizeThatFits:(CGSize)result;
- (CarTrafficAlertBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (unint64_t)bannerType;
- (void)updateFromBannerItem;
@end

@implementation CarTrafficAlertBannerView

- (CarTrafficAlertBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v70.receiver = self;
  v70.super_class = (Class)CarTrafficAlertBannerView;
  v9 = -[CarTrafficAlertBannerView initWithFrame:](&v70, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [(CarTrafficAlertBannerView *)v9 setAccessibilityIdentifier:v11];

    id v68 = v8;
    objc_storeWeak((id *)&v9->_target, v7);
    objc_storeStrong((id *)&v9->_item, a4);
    v67 = +[UIImage _applicationIconImageForBundleIdentifier:MapsAppBundleId format:9];
    id v12 = [objc_alloc((Class)UIImageView) initWithImage:v67];
    [v12 setAccessibilityIdentifier:@"AppIconView"];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setContentMode:1];
    v13 = v12;
    [(CarTrafficAlertBannerView *)v9 addSubview:v12];
    uint64_t v14 = objc_opt_new();
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v14;

    [(UILabel *)v9->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(UILabel *)v9->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v16 = objc_opt_new();
    id v69 = v7;
    descriptionLabel = v9->_descriptionLabel;
    v9->_descriptionLabel = (UILabel *)v16;

    [(UILabel *)v9->_descriptionLabel setAccessibilityIdentifier:@"DescriptionLabel"];
    [(UILabel *)v9->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v18 = objc_alloc((Class)UIStackView);
    v72[0] = v9->_titleLabel;
    v72[1] = v9->_descriptionLabel;
    v19 = +[NSArray arrayWithObjects:v72 count:2];
    v20 = (UIStackView *)[v18 initWithArrangedSubviews:v19];
    labelStackView = v9->_labelStackView;
    v9->_labelStackView = v20;

    [(UIStackView *)v9->_labelStackView setAccessibilityIdentifier:@"LabelStackView"];
    [(UIStackView *)v9->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v9->_labelStackView setAxis:1];
    [(UIStackView *)v9->_labelStackView setDistribution:2];
    [(UIStackView *)v9->_labelStackView setAlignment:0];
    [(CarTrafficAlertBannerView *)v9 addSubview:v9->_labelStackView];
    uint64_t v22 = +[CPUIBannerViewButton buttonWithChevronImage];
    actionButton = v9->_actionButton;
    v9->_actionButton = (CPUIBannerViewButton *)v22;

    [(CPUIBannerViewButton *)v9->_actionButton setAccessibilityIdentifier:@"ActionButton"];
    [(CPUIBannerViewButton *)v9->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = +[CarDisplayController sharedInstance];
    v25 = [v24 window];
    v26 = [v25 windowScene];
    v27 = [v26 focusSystem];
    [(CPUIBannerViewButton *)v9->_actionButton setSelected:v27 != 0];

    LODWORD(v28) = 1148846080;
    [(CPUIBannerViewButton *)v9->_actionButton setContentHuggingPriority:0 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [(CPUIBannerViewButton *)v9->_actionButton setContentHuggingPriority:1 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(CPUIBannerViewButton *)v9->_actionButton setContentCompressionResistancePriority:0 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(CPUIBannerViewButton *)v9->_actionButton setContentCompressionResistancePriority:1 forAxis:v31];
    [(CarTrafficAlertBannerView *)v9 addSubview:v9->_actionButton];
    v66 = [v13 leadingAnchor];
    v65 = [(CarTrafficAlertBannerView *)v9 leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:12.0];
    v71[0] = v64;
    v63 = [v13 widthAnchor];
    v62 = [v63 constraintEqualToConstant:33.0];
    v71[1] = v62;
    v61 = [v13 centerYAnchor];
    v60 = [(CarTrafficAlertBannerView *)v9 centerYAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v71[2] = v59;
    v54 = v13;
    v58 = [v13 heightAnchor];
    v57 = [v58 constraintEqualToConstant:33.0];
    v71[3] = v57;
    v56 = [(CPUIBannerViewButton *)v9->_actionButton trailingAnchor];
    v55 = [(CarTrafficAlertBannerView *)v9 trailingAnchor];
    v53 = [v56 constraintEqualToAnchor:v55 constant:-12.0];
    v71[4] = v53;
    v52 = [(CPUIBannerViewButton *)v9->_actionButton widthAnchor];
    v51 = [v52 constraintEqualToConstant:29.0];
    v71[5] = v51;
    v50 = [(CPUIBannerViewButton *)v9->_actionButton centerYAnchor];
    v49 = [(CarTrafficAlertBannerView *)v9 centerYAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v71[6] = v48;
    v47 = [(CPUIBannerViewButton *)v9->_actionButton heightAnchor];
    v46 = [v47 constraintEqualToConstant:29.0];
    v71[7] = v46;
    v45 = [(UIStackView *)v9->_labelStackView leadingAnchor];
    v44 = [v13 trailingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:12.0];
    v71[8] = v43;
    v42 = [(UIStackView *)v9->_labelStackView trailingAnchor];
    v32 = [(CPUIBannerViewButton *)v9->_actionButton leadingAnchor];
    v33 = [v42 constraintEqualToAnchor:v32 constant:-12.0];
    v71[9] = v33;
    v34 = [(UIStackView *)v9->_labelStackView topAnchor];
    v35 = [(CarTrafficAlertBannerView *)v9 topAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:3.0];
    v71[10] = v36;
    v37 = [(UIStackView *)v9->_labelStackView bottomAnchor];
    v38 = [(CarTrafficAlertBannerView *)v9 bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:-3.0];
    v71[11] = v39;
    v40 = +[NSArray arrayWithObjects:v71 count:12];
    +[NSLayoutConstraint activateConstraints:v40];

    id v8 = v68;
    id v7 = v69;

    [(CarTrafficAlertBannerView *)v9 updateFromBannerItem];
  }

  return v9;
}

- (void)updateFromBannerItem
{
  if (qword_101611140 != -1) {
    dispatch_once(&qword_101611140, &stru_101322FB8);
  }
  id v11 = [(CarTrafficAlertBannerView *)self item];
  v3 = [v11 title];
  if (v3)
  {
    id v4 = objc_alloc((Class)NSAttributedString);
    v5 = [v11 title];
    id v6 = [v4 initWithString:v5 attributes:qword_101611130];
    [(UILabel *)self->_titleLabel setAttributedText:v6];
  }
  else
  {
    [(UILabel *)self->_titleLabel setAttributedText:0];
  }

  id v7 = [v11 subtitle];
  if (v7)
  {
    id v8 = objc_alloc((Class)NSAttributedString);
    v9 = [v11 subtitle];
    id v10 = [v8 initWithString:v9 attributes:qword_101611138];
    [(UILabel *)self->_descriptionLabel setAttributedText:v10];
  }
  else
  {
    [(UILabel *)self->_descriptionLabel setAttributedText:0];
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 54.0;
  result.height = v3;
  return result;
}

- (unint64_t)bannerType
{
  return 1;
}

- (BNBannerSource)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (BNBannerSource *)WeakRetained;
}

- (BannerItem)item
{
  return self->_item;
}

- (BOOL)aperturePresentation
{
  return self->_aperturePresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_labelStackView, 0);
}

@end