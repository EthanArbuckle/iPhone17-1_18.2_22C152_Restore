@interface VTUIProximityDataSharingOptInView
- (UIButton)aboutLink;
- (UIButton)dismissButton;
- (VTUIButton)notNowButton;
- (VTUIButton)shareButton;
- (VTUIProximityDataSharingOptInView)initWithFrame:(CGRect)a3;
- (void)_setupContent;
- (void)_setupPortraitConstraints;
- (void)setAboutLink:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setShareButton:(id)a3;
@end

@implementation VTUIProximityDataSharingOptInView

- (VTUIProximityDataSharingOptInView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityDataSharingOptInView;
  v3 = -[VTUIProximityDataSharingOptInView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VTUIProximityDataSharingOptInView *)v3 _setupContent];
    [(VTUIProximityDataSharingOptInView *)v4 _setupPortraitConstraints];
  }
  return v4;
}

- (void)_setupContent
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v46 = 136315138;
    v47 = "-[VTUIProximityDataSharingOptInView _setupContent]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setup content", (uint8_t *)&v46, 0xCu);
  }
  v4 = +[VTUIStyle sharedStyle];
  v5 = objc_alloc_init(VTUIProximityContainerView);
  containerView = self->_containerView;
  self->_containerView = v5;

  [(VTUIProximityContainerView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityDataSharingOptInView *)self addSubview:self->_containerView];
  v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v7;

  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = self->_titleLabel;
  v10 = [v4 proxHeaderFont];
  [(UILabel *)v9 setFont:v10];

  v11 = self->_titleLabel;
  v12 = [v4 proxHeaderColor];
  [(UILabel *)v11 setTextColor:v12];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  v13 = self->_titleLabel;
  v14 = +[VTUIStringsHelper sharedStringsHelper];
  v15 = [v14 uiLocalizedStringForKey:@"DATA_SHARING_TITLE_SIRI"];
  [(UILabel *)v13 setText:v15];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_titleLabel];
  v16 = +[VTUIButton _vtuiProximityDismissButton];
  dismissButton = self->_dismissButton;
  self->_dismissButton = v16;

  [(UIButton *)self->_dismissButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_dismissButton];
  v18 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v18;

  [(UILabel *)self->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = self->_subtitleLabel;
  v21 = [v4 proxSubtitleFont];
  [(UILabel *)v20 setFont:v21];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  v22 = self->_subtitleLabel;
  v23 = [v4 VTUIDeviceSpecificString:@"DATA_SHARING_DETAIL"];
  [(UILabel *)v22 setText:v23];

  v24 = self->_subtitleLabel;
  v25 = [v4 proxSubtitleColor];
  [(UILabel *)v24 setTextColor:v25];

  [(UILabel *)self->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_subtitleLabel];
  v26 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  aboutLink = self->_aboutLink;
  self->_aboutLink = v26;

  [(UIButton *)self->_aboutLink setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [(UIButton *)self->_aboutLink titleLabel];
  v29 = [v4 proxSubtitleFont];
  [v28 setFont:v29];

  v30 = self->_aboutLink;
  v31 = +[VTUIStringsHelper sharedStringsHelper];
  v32 = [v31 uiLocalizedStringForKey:@"DATA_SHARING_DETAIL_LINK"];
  [(UIButton *)v30 setTitle:v32 forState:0];

  v33 = [(UIButton *)self->_aboutLink titleLabel];
  [v33 setNumberOfLines:0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_aboutLink];
  v34 = +[VTUIButton _vtuiProximityButtonWithPrimaryStyle];
  shareButton = self->_shareButton;
  self->_shareButton = v34;

  [(VTUIButton *)self->_shareButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v36 = self->_shareButton;
  v37 = +[VTUIStringsHelper sharedStringsHelper];
  v38 = [v37 uiLocalizedStringForKey:@"DATA_SHARING_CONFIRMATION_BUTTON_TITLE"];
  [(VTUIButton *)v36 setTitle:v38 forState:0];

  v39 = [(VTUIButton *)self->_shareButton titleLabel];
  [v39 setNumberOfLines:0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_shareButton];
  v40 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  notNowButton = self->_notNowButton;
  self->_notNowButton = v40;

  [(VTUIButton *)self->_notNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v42 = self->_notNowButton;
  v43 = +[VTUIStringsHelper sharedStringsHelper];
  v44 = [v43 uiLocalizedStringForKey:@"DATA_SHARING_DECLINE_BUTTON_TITLE"];
  [(VTUIButton *)v42 setTitle:v44 forState:0];

  v45 = [(VTUIButton *)self->_notNowButton titleLabel];
  [v45 setNumberOfLines:0];

  [(VTUIProximityContainerView *)self->_containerView addSubview:self->_notNowButton];
}

- (void)_setupPortraitConstraints
{
  v117[3] = *MEMORY[0x263EF8340];
  v3 = [(VTUIProximityDataSharingOptInView *)self safeAreaLayoutGuide];
  v109 = [(VTUIProximityContainerView *)self->_containerView safeAreaLayoutGuide];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v5 = +[VTUIStyle sharedStyle];
  objc_super v6 = +[MGWrapper sharedMGWrapper];
  int v7 = [v6 isDeviceIPad];

  containerView = self->_containerView;
  v108 = v3;
  if (v7)
  {
    v9 = [(VTUIProximityContainerView *)containerView centerYAnchor];
    v10 = [v3 centerYAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];

    v12 = [(VTUIProximityContainerView *)self->_containerView centerXAnchor];
    v13 = [v3 centerXAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];

    v15 = [(VTUIProximityContainerView *)self->_containerView widthAnchor];
    [v5 proxViewMaxWidth];
    v16 = objc_msgSend(v15, "constraintEqualToConstant:");

    v117[0] = v11;
    v117[1] = v14;
    v117[2] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:3];
    [(VTUIProximityDataSharingOptInView *)self addConstraints:v17];
  }
  else
  {
    v18 = [(VTUIProximityContainerView *)containerView bottomAnchor];
    v19 = [(VTUIProximityDataSharingOptInView *)self bottomAnchor];
    [v5 proxContainerHorizontalVerticalPadding];
    v11 = [v18 constraintEqualToAnchor:v19 constant:-v20];

    v21 = [(VTUIProximityContainerView *)self->_containerView leadingAnchor];
    v22 = [v3 leadingAnchor];
    [v5 proxContainerHorizontalVerticalPadding];
    v14 = objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22);

    v23 = [(VTUIProximityContainerView *)self->_containerView trailingAnchor];
    v24 = [v3 trailingAnchor];
    [v5 proxContainerHorizontalVerticalPadding];
    v16 = [v23 constraintEqualToAnchor:v24 constant:-v25];

    v26 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
    [v5 proxViewHeight];
    v17 = objc_msgSend(v26, "constraintGreaterThanOrEqualToConstant:");

    v27 = [(VTUIProximityContainerView *)self->_containerView heightAnchor];
    v28 = [v3 heightAnchor];
    v29 = [v27 constraintLessThanOrEqualToAnchor:v28 constant:0.0];

    v116[0] = v11;
    v116[1] = v14;
    v116[2] = v16;
    v116[3] = v17;
    v116[4] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:5];
    [v4 addObjectsFromArray:v30];
  }
  v31 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v32 = [v109 topAnchor];
  [v5 proxTitleFirstBaselineFromTop];
  v107 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);

  v33 = [(UILabel *)self->_titleLabel leadingAnchor];
  v34 = [v109 leadingAnchor];
  [v5 proxLeading];
  v106 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34);

  v35 = [(UILabel *)self->_titleLabel trailingAnchor];
  v36 = [v109 trailingAnchor];
  [v5 proxTrailing];
  v105 = [v35 constraintEqualToAnchor:v36 constant:-v37];

  v115[0] = v107;
  v115[1] = v106;
  v115[2] = v105;
  v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:3];
  [v4 addObjectsFromArray:v38];

  v39 = [(UIButton *)self->_dismissButton centerYAnchor];
  v40 = [v109 topAnchor];
  [v5 proxTrainingDismissButtonVerticalPaddingTop];
  v104 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40);

  v41 = [(UIButton *)self->_dismissButton centerXAnchor];
  v42 = [v109 trailingAnchor];
  [v5 proxTrainingDismissButtonHorizontalPadding];
  v103 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42);

  v43 = [(UIButton *)self->_dismissButton widthAnchor];
  [v5 proxTrainingDismissButtonWidthOrHeight];
  v102 = objc_msgSend(v43, "constraintEqualToConstant:");

  v44 = [(UIButton *)self->_dismissButton heightAnchor];
  [v5 proxTrainingDismissButtonWidthOrHeight];
  v101 = objc_msgSend(v44, "constraintEqualToConstant:");

  v114[0] = v104;
  v114[1] = v103;
  v114[2] = v102;
  v114[3] = v101;
  v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:4];
  [v4 addObjectsFromArray:v45];

  int v46 = [(UILabel *)self->_subtitleLabel topAnchor];
  v47 = [(UILabel *)self->_titleLabel bottomAnchor];
  [v5 proxPaddingDataSharingSubtitle];
  v100 = objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47);

  uint64_t v48 = [(UILabel *)self->_subtitleLabel leadingAnchor];
  v49 = [v109 leadingAnchor];
  [v5 proxLeading];
  v99 = objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49);

  v50 = [(UILabel *)self->_subtitleLabel trailingAnchor];
  v51 = [v109 trailingAnchor];
  [v5 proxTrailing];
  [v50 constraintEqualToAnchor:v51 constant:-v52];
  v98 = v90 = v4;

  v53 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  v54 = [(UIButton *)self->_aboutLink topAnchor];
  v97 = [v53 constraintEqualToAnchor:v54 constant:0.0];

  v113[0] = v100;
  v113[1] = v99;
  v113[2] = v98;
  v113[3] = v97;
  v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v113 count:4];
  [v4 addObjectsFromArray:v55];

  v56 = [(UIButton *)self->_aboutLink firstBaselineAnchor];
  v57 = [(UILabel *)self->_subtitleLabel bottomAnchor];
  [v5 proxAboutLinkFirstBaselineFromTop];
  v96 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57);

  v58 = [(UIButton *)self->_aboutLink leadingAnchor];
  v59 = [v109 leadingAnchor];
  [v5 proxLeading];
  v95 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59);

  v60 = [(UIButton *)self->_aboutLink trailingAnchor];
  v61 = [v109 trailingAnchor];
  [v5 proxTrailing];
  v94 = [v60 constraintEqualToAnchor:v61 constant:-v62];

  v63 = [(UIButton *)self->_aboutLink bottomAnchor];
  v64 = [(VTUIButton *)self->_shareButton topAnchor];
  v93 = [v63 constraintLessThanOrEqualToAnchor:v64 constant:0.0];

  v112[0] = v96;
  v112[1] = v95;
  v112[2] = v94;
  v112[3] = v93;
  v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:4];
  [v4 addObjectsFromArray:v65];

  v66 = [(VTUIButton *)self->_notNowButton leadingAnchor];
  v67 = [v109 leadingAnchor];
  [v5 proxLeading];
  v92 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67);

  v68 = [(VTUIButton *)self->_notNowButton trailingAnchor];
  v69 = [v109 trailingAnchor];
  [v5 proxTrailing];
  v91 = [v68 constraintEqualToAnchor:v69 constant:-v70];

  v71 = [(VTUIButton *)self->_notNowButton firstBaselineAnchor];
  v72 = [(VTUIProximityContainerView *)self->_containerView bottomAnchor];
  [v5 proxTrainingDismissButtonVerticalPaddingBottom];
  v74 = [v71 constraintEqualToAnchor:v72 constant:-v73];

  v111[0] = v92;
  v111[1] = v91;
  v111[2] = v74;
  v75 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:3];
  [v4 addObjectsFromArray:v75];

  v76 = [(VTUIButton *)self->_shareButton leadingAnchor];
  v77 = [v109 leadingAnchor];
  [v5 proxLeading];
  v78 = objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77);

  v79 = [(VTUIButton *)self->_shareButton trailingAnchor];
  v80 = [v109 trailingAnchor];
  [v5 proxTrailing];
  v82 = [v79 constraintEqualToAnchor:v80 constant:-v81];

  v83 = [(VTUIButton *)self->_shareButton firstBaselineAnchor];
  v84 = [(VTUIButton *)self->_notNowButton topAnchor];
  [v5 proxTrainingDismissButtonVerticalPaddingTop];
  v86 = [v83 constraintEqualToAnchor:v84 constant:-v85];

  v87 = [(VTUIButton *)self->_shareButton heightAnchor];
  [v5 proxPrimaryButtonHeight];
  v88 = objc_msgSend(v87, "constraintEqualToConstant:");

  v110[0] = v78;
  v110[1] = v82;
  v110[2] = v86;
  v110[3] = v88;
  v89 = [MEMORY[0x263EFF8C0] arrayWithObjects:v110 count:4];
  [v90 addObjectsFromArray:v89];

  [MEMORY[0x263F08938] activateConstraints:v90];
  [(VTUIProximityDataSharingOptInView *)self addConstraints:v90];
}

- (VTUIButton)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
}

- (VTUIButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (UIButton)aboutLink
{
  return self->_aboutLink;
}

- (void)setAboutLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutLink, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end