@interface HOiCloudDisabledViewController
- (HUColoredButton)preferencesButton;
- (NSLayoutConstraint)bodyWidthConstraint;
- (UIImageView)imageView;
- (UILabel)bodyLabel;
- (UILabel)titleLabel;
- (UIView)containerView;
- (id)hu_preloadContent;
- (unint64_t)dataSyncState;
- (unint64_t)status;
- (void)preferencesButtonTapped;
- (void)setBodyLabel:(id)a3;
- (void)setBodyWidthConstraint:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDataSyncState:(unint64_t)a3;
- (void)setImageView:(id)a3;
- (void)setPreferencesButton:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateLabels;
- (void)viewDidLoad;
@end

@implementation HOiCloudDisabledViewController

- (void)viewDidLoad
{
  v123.receiver = self;
  v123.super_class = (Class)HOiCloudDisabledViewController;
  [(HOiCloudDisabledViewController *)&v123 viewDidLoad];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [(HOiCloudDisabledViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v5;

  v7 = +[UIImage imageNamed:@"app-icon-mac"];
  [(UIImageView *)self->_imageView setImage:v7];

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v10 = +[UIFont boldSystemFontOfSize:20.0];
  [(UILabel *)self->_titleLabel setFont:v10];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  v11 = (UILabel *)objc_alloc_init((Class)UILabel);
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v11;

  [(UILabel *)self->_bodyLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_bodyLabel setFont:v13];

  [(UILabel *)self->_bodyLabel setTextAlignment:1];
  [(UILabel *)self->_bodyLabel setNumberOfLines:0];
  v14 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v14;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [objc_alloc((Class)HUColoredButton) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  preferencesButton = self->_preferencesButton;
  self->_preferencesButton = v16;

  [(HUColoredButton *)self->_preferencesButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = self->_preferencesButton;
  v19 = sub_100039ED8(@"HODataSycningNoAccountActionTitle");
  [(HUColoredButton *)v18 setTitle:v19 forState:0];

  [(HUColoredButton *)self->_preferencesButton addTarget:self action:"preferencesButtonTapped" forControlEvents:64];
  v20 = self->_preferencesButton;
  v21 = +[UIColor systemOrangeColor];
  [(HUColoredButton *)v20 setTintColor:v21];

  v22 = self->_preferencesButton;
  v23 = +[UIColor systemOrangeColor];
  [(HUColoredButton *)v22 setBackgroundColor:v23];

  v24 = [(HOiCloudDisabledViewController *)self view];
  v25 = [(HOiCloudDisabledViewController *)self containerView];
  [v24 addSubview:v25];

  v26 = [(HOiCloudDisabledViewController *)self containerView];
  v27 = [(HOiCloudDisabledViewController *)self imageView];
  [v26 addSubview:v27];

  v28 = [(HOiCloudDisabledViewController *)self containerView];
  v29 = [(HOiCloudDisabledViewController *)self titleLabel];
  [v28 addSubview:v29];

  v30 = [(HOiCloudDisabledViewController *)self containerView];
  v31 = [(HOiCloudDisabledViewController *)self bodyLabel];
  [v30 addSubview:v31];

  v32 = [(HOiCloudDisabledViewController *)self containerView];
  v33 = [(HOiCloudDisabledViewController *)self preferencesButton];
  [v32 addSubview:v33];

  v34 = objc_opt_new();
  v35 = [(HOiCloudDisabledViewController *)self containerView];
  v36 = [v35 centerYAnchor];
  v37 = [(HOiCloudDisabledViewController *)self view];
  v38 = [v37 centerYAnchor];
  v39 = [v36 constraintEqualToAnchor:v38];
  [v34 addObject:v39];

  v40 = [(HOiCloudDisabledViewController *)self containerView];
  v41 = [v40 widthAnchor];
  v42 = [(HOiCloudDisabledViewController *)self view];
  v43 = [v42 widthAnchor];
  v44 = [v41 constraintEqualToAnchor:v43];
  [v34 addObject:v44];

  v45 = [(HOiCloudDisabledViewController *)self containerView];
  v46 = [v45 leadingAnchor];
  v47 = [(HOiCloudDisabledViewController *)self view];
  v48 = [v47 leadingAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [v34 addObject:v49];

  v50 = [(HOiCloudDisabledViewController *)self containerView];
  v51 = [v50 trailingAnchor];
  v52 = [(HOiCloudDisabledViewController *)self view];
  v53 = [v52 trailingAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  [v34 addObject:v54];

  v55 = [(HOiCloudDisabledViewController *)self imageView];
  v56 = [v55 topAnchor];
  v57 = [(HOiCloudDisabledViewController *)self containerView];
  v58 = [v57 topAnchor];
  v59 = [v56 constraintEqualToAnchor:v58];
  [v34 addObject:v59];

  v60 = [(HOiCloudDisabledViewController *)self imageView];
  v61 = [v60 widthAnchor];
  v62 = [v61 constraintEqualToConstant:256.0];
  [v34 addObject:v62];

  v63 = [(HOiCloudDisabledViewController *)self imageView];
  v64 = [v63 heightAnchor];
  v65 = [v64 constraintEqualToConstant:256.0];
  [v34 addObject:v65];

  v66 = [(HOiCloudDisabledViewController *)self imageView];
  v67 = [v66 centerXAnchor];
  v68 = [(HOiCloudDisabledViewController *)self containerView];
  v69 = [v68 centerXAnchor];
  v70 = [v67 constraintEqualToAnchor:v69];
  [v34 addObject:v70];

  v71 = [(HOiCloudDisabledViewController *)self titleLabel];
  v72 = [v71 leadingAnchor];
  v73 = [(HOiCloudDisabledViewController *)self containerView];
  v74 = [v73 leadingAnchor];
  v75 = [v72 constraintEqualToAnchor:v74];
  [v34 addObject:v75];

  v76 = [(HOiCloudDisabledViewController *)self titleLabel];
  v77 = [v76 trailingAnchor];
  v78 = [(HOiCloudDisabledViewController *)self containerView];
  v79 = [v78 trailingAnchor];
  v80 = [v77 constraintEqualToAnchor:v79];
  [v34 addObject:v80];

  v81 = [(HOiCloudDisabledViewController *)self titleLabel];
  v82 = [v81 topAnchor];
  v83 = [(HOiCloudDisabledViewController *)self imageView];
  v84 = [v83 bottomAnchor];
  v85 = [v82 constraintEqualToAnchor:v84 constant:10.0];
  [v34 addObject:v85];

  v86 = [(HOiCloudDisabledViewController *)self bodyLabel];
  v87 = [v86 topAnchor];
  v88 = [(HOiCloudDisabledViewController *)self titleLabel];
  v89 = [v88 bottomAnchor];
  v90 = [v87 constraintEqualToSystemSpacingBelowAnchor:v89 multiplier:1.0];
  [v34 addObject:v90];

  v91 = [(HOiCloudDisabledViewController *)self bodyLabel];
  v92 = [v91 centerXAnchor];
  v93 = [(HOiCloudDisabledViewController *)self containerView];
  v94 = [v93 centerXAnchor];
  v95 = [v92 constraintEqualToAnchor:v94];
  [v34 addObject:v95];

  v96 = [(HOiCloudDisabledViewController *)self bodyLabel];
  v97 = [v96 widthAnchor];
  v98 = [(HOiCloudDisabledViewController *)self view];
  [v98 frame];
  v100 = [v97 constraintEqualToConstant:v99];
  [(HOiCloudDisabledViewController *)self setBodyWidthConstraint:v100];

  v101 = [(HOiCloudDisabledViewController *)self bodyWidthConstraint];
  [v34 addObject:v101];

  v102 = [(HOiCloudDisabledViewController *)self preferencesButton];
  v103 = [v102 centerXAnchor];
  v104 = [(HOiCloudDisabledViewController *)self containerView];
  v105 = [v104 centerXAnchor];
  v106 = [v103 constraintEqualToAnchor:v105];
  [v34 addObject:v106];

  v107 = [(HOiCloudDisabledViewController *)self preferencesButton];
  v108 = [v107 topAnchor];
  v109 = [(HOiCloudDisabledViewController *)self bodyLabel];
  v110 = [v109 bottomAnchor];
  v111 = [v108 constraintEqualToAnchor:v110 constant:40.0];
  [v34 addObject:v111];

  v112 = [(HOiCloudDisabledViewController *)self preferencesButton];
  v113 = [v112 bottomAnchor];
  v114 = [(HOiCloudDisabledViewController *)self containerView];
  v115 = [v114 bottomAnchor];
  v116 = [v113 constraintEqualToAnchor:v115];
  [v34 addObject:v116];

  v117 = [(HOiCloudDisabledViewController *)self preferencesButton];
  v118 = [v117 heightAnchor];
  v119 = [v118 constraintEqualToConstant:50.0];
  [v34 addObject:v119];

  v120 = [(HOiCloudDisabledViewController *)self preferencesButton];
  v121 = [v120 widthAnchor];
  v122 = [v121 constraintEqualToConstant:250.0];
  [v34 addObject:v122];

  +[NSLayoutConstraint activateConstraints:v34];
  [(HOiCloudDisabledViewController *)self updateLabels];
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult];
}

- (void)setDataSyncState:(unint64_t)a3
{
  self->_dataSyncState = a3;
  [(HOiCloudDisabledViewController *)self updateLabels];
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
  [(HOiCloudDisabledViewController *)self updateLabels];
}

- (void)updateLabels
{
  uint64_t v3 = [(HOiCloudDisabledViewController *)self titleLabel];
  if (!v3) {
    return;
  }
  v4 = (void *)v3;
  v5 = [(HOiCloudDisabledViewController *)self bodyLabel];

  if (!v5) {
    return;
  }
  if (([(HOiCloudDisabledViewController *)self status] & 0x20) != 0)
  {
    v14 = sub_100039ED8(@"HODataSyncingNoAccountAlertTitle");
    v15 = [(HOiCloudDisabledViewController *)self titleLabel];
    [v15 setText:v14];

    v16 = sub_100039ED8(@"HODataSyncingNoAccountAlertBody");
    v17 = [(HOiCloudDisabledViewController *)self bodyLabel];
    [v17 setText:v16];

    v10 = [(HOiCloudDisabledViewController *)self bodyWidthConstraint];
    [v10 setConstant:380.0];
    goto LABEL_8;
  }
  if ((id)[(HOiCloudDisabledViewController *)self dataSyncState] == (id)3)
  {
    v6 = sub_100039ED8(@"HODataSyncingTurnedOffAlertTitle");
    v7 = [(HOiCloudDisabledViewController *)self titleLabel];
    [v7 setText:v6];

    v8 = sub_100039ED8(@"HODataSyncingTurnedOffAlertBody");
    v9 = [(HOiCloudDisabledViewController *)self bodyLabel];
    [v9 setText:v8];

    v10 = [(HOiCloudDisabledViewController *)self view];
    [v10 frame];
    double v12 = v11;
    v13 = [(HOiCloudDisabledViewController *)self bodyWidthConstraint];
    [v13 setConstant:v12];

LABEL_8:
  }
  id v18 = [(HOiCloudDisabledViewController *)self view];
  [v18 layoutIfNeeded];
}

- (void)preferencesButtonTapped
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    int v8 = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    double v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);
  }
  v6 = +[UIApplication sharedApplication];
  v7 = +[NSURL hf_openiCloudPreferencesURL];
  [v6 openURL:v7 withCompletionHandler:0];
}

- (unint64_t)dataSyncState
{
  return self->_dataSyncState;
}

- (unint64_t)status
{
  return self->_status;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (HUColoredButton)preferencesButton
{
  return self->_preferencesButton;
}

- (void)setPreferencesButton:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (NSLayoutConstraint)bodyWidthConstraint
{
  return self->_bodyWidthConstraint;
}

- (void)setBodyWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_preferencesButton, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end