@interface VUIAppInstallConfirmationView
+ (CGSize)iconSize;
- (NSString)message;
- (NSString)title;
- (UIButton)actionButton;
- (UIButton)appStoreButton;
- (UIButton)cancelButton;
- (UIButton)secondaryLinkButton;
- (VUIAppInstallConfirmationView)initWithFrame:(CGRect)a3;
- (VUIAppInstallLockup)lockupView;
- (id)_buttonWithTitleForTV:(id)a3 textStyle:(id)a4;
- (void)_layoutForIos;
- (void)_layoutForTvos;
- (void)layoutSubviews;
- (void)setActionButton:(id)a3;
- (void)setAgeRating:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppStoreButton:(id)a3;
- (void)setAppSubtitle:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setIAP:(id)a3;
- (void)setLockupView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSecondaryLinkButton:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIAppInstallConfirmationView

- (VUIAppInstallConfirmationView)initWithFrame:(CGRect)a3
{
  v71.receiver = self;
  v71.super_class = (Class)VUIAppInstallConfirmationView;
  v3 = -[VUIAppInstallConfirmationView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VUIAppInstallLockup alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[VUIAppInstallLockup initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    lockupView = v3->_lockupView;
    v3->_lockupView = (VUIAppInstallLockup *)v9;

    LODWORD(v11) = 1148846080;
    [(VUIAppInstallLockup *)v3->_lockupView setContentCompressionResistancePriority:1 forAxis:v11];
    LODWORD(v12) = 1148846080;
    [(VUIAppInstallLockup *)v3->_lockupView setContentCompressionResistancePriority:0 forAxis:v12];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    imageSubtitleView = v3->_imageSubtitleView;
    v3->_imageSubtitleView = (UILabel *)v13;

    [(UILabel *)v3->_imageSubtitleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_imageSubtitleView setNumberOfLines:-1];
    [(UILabel *)v3->_imageSubtitleView setTextAlignment:1];
    [(UILabel *)v3->_imageSubtitleView setAccessibilityIdentifier:@"UIA.TV.Text.imageSubtitle"];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    titleView = v3->_titleView;
    v3->_titleView = (UILabel *)v15;

    [(UILabel *)v3->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleView setNumberOfLines:-1];
    [(UILabel *)v3->_titleView setTextAlignment:1];
    [(UILabel *)v3->_imageSubtitleView setAccessibilityIdentifier:@"UIA.TV.Text.title"];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    messageView = v3->_messageView;
    v3->_messageView = (UILabel *)v17;

    [(UILabel *)v3->_messageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_messageView setNumberOfLines:-1];
    [(UILabel *)v3->_messageView setTextAlignment:1];
    [(UILabel *)v3->_messageView setAccessibilityIdentifier:@"UIA.TV.Text.message"];
    v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    if (v20 == 2)
    {
      uint64_t v21 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      actionButton = v3->_actionButton;
      v3->_actionButton = (UIButton *)v21;

      [(UIButton *)v3->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIButton *)v3->_actionButton setAccessibilityIdentifier:@"UIA.TV.Button.install.state=\"inactive\""];
      v23 = v3->_imageSubtitleView;
      v24 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
      [(UILabel *)v23 setFont:v24];

      v25 = v3->_imageSubtitleView;
      v26 = [MEMORY[0x1E4FB1618] whiteColor];
      v27 = [v26 colorWithAlphaComponent:0.7];
      [(UILabel *)v25 setTextColor:v27];

      v28 = v3->_titleView;
      v29 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
      [(UILabel *)v28 setFont:v29];

      v30 = v3->_titleView;
      v31 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)v30 setTextColor:v31];

      v32 = v3->_messageView;
      uint64_t v33 = *MEMORY[0x1E4FB28C8];
      v34 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [(UILabel *)v32 setFont:v34];

      v35 = v3->_messageView;
      v36 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)v35 setTextColor:v36];

      uint64_t v37 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
      cancelButton = v3->_cancelButton;
      v3->_cancelButton = (UIButton *)v37;

      [(UIButton *)v3->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v39 = v3->_cancelButton;
      v40 = +[VUILocalizationManager sharedInstance];
      v41 = [v40 localizedStringForKey:@"APP_INSTALL_ACTION_TITLE_CANCEL"];
      [(UIButton *)v39 setTitle:v41 forState:0];

      [(UIButton *)v3->_cancelButton setAccessibilityIdentifier:@"UIA.TV.Button.close"];
      v42 = +[VUILocalizationManager sharedInstance];
      v43 = [v42 localizedStringForKey:@"APP_INSTALL_APPSTORE_BUTTON"];
      uint64_t v44 = [(VUIAppInstallConfirmationView *)v3 _buttonWithTitleForTV:v43 textStyle:v33];
      appStoreButton = v3->_appStoreButton;
      v3->_appStoreButton = (UIButton *)v44;

      [(UIButton *)v3->_appStoreButton setAccessibilityIdentifier:@"UIA.TV.Button.openAppStore"];
      uint64_t v46 = [(VUIAppInstallConfirmationView *)v3 _buttonWithTitleForTV:&stru_1F3E921E0 textStyle:v33];
      secondaryLinkButton = v3->_secondaryLinkButton;
      v3->_secondaryLinkButton = (UIButton *)v46;

      v48 = [(UIButton *)v3->_secondaryLinkButton titleLabel];
      [v48 setLineBreakMode:4];

      [(UIButton *)v3->_secondaryLinkButton setAccessibilityIdentifier:@"UIA.TV.Button.openSecondaryLink"];
      v49 = v3->_actionButton;
      v50 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
      [(UIButton *)v49 _setVisualEffectViewEnabled:0 backgroundColor:v50];

      v51 = v3->_cancelButton;
      v52 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
      [(UIButton *)v51 _setVisualEffectViewEnabled:0 backgroundColor:v52];
    }
    else
    {
      v53 = -[VUIBuyButtonLockup initWithFrame:]([VUIBuyButtonLockup alloc], "initWithFrame:", v5, v6, v7, v8);
      buyLockup = v3->_buyLockup;
      v3->_buyLockup = v53;

      [(VUIBuyButtonLockup *)v3->_buyLockup setTranslatesAutoresizingMaskIntoConstraints:0];
      [(VUIBuyButtonLockup *)v3->_buyLockup setSpacing:6.0];
      [(VUIBuyButtonLockup *)v3->_buyLockup setAxis:1];
      [(VUIBuyButtonLockup *)v3->_buyLockup setAlignment:3];
      v55 = [(VUIBuyButtonLockup *)v3->_buyLockup button];
      [v55 setAccessibilityIdentifier:@"UIA.TV.Button.install.state=\"inactive\""];

      uint64_t v56 = [(VUIBuyButtonLockup *)v3->_buyLockup button];
      v57 = v3->_actionButton;
      v3->_actionButton = (UIButton *)v56;

      v52 = [(VUIAppInstallLockup *)v3->_lockupView metadataStackView];
      v58 = [v52 arrangedSubviews];
      v59 = [v58 lastObject];

      [v52 addArrangedSubview:v3->_buyLockup];
      [v52 setCustomSpacing:v59 afterView:15.0];
      v60 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
      [(VUIAppInstallConfirmationView *)v3 setBackgroundColor:v60];

      v61 = v3->_imageSubtitleView;
      v62 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
      [(UILabel *)v61 setFont:v62];

      v63 = v3->_imageSubtitleView;
      v64 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
      v65 = [v64 colorWithAlphaComponent:0.8];
      [(UILabel *)v63 setTextColor:v65];

      v66 = v3->_messageView;
      v67 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
      [(UILabel *)v66 setFont:v67];

      v68 = v3->_messageView;
      v69 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
      [(UILabel *)v68 setTextColor:v69];
    }
  }
  [(VUIAppInstallConfirmationView *)v3 setAccessibilityIdentifier:@"UIA.TV.Dialog.AppInstallConfirmation"];
  return v3;
}

- (void)setAppIcon:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() iconSize];
  double v6 = v5;
  double v8 = v7;
  [(id)objc_opt_class() iconSize];
  +[VUIAppIconImageService iconCornerRadiusForSize:](VUIAppIconImageService, "iconCornerRadiusForSize:");
  objc_msgSend(v4, "vui_iconImageOfSize:radius:stroke:", v6, v8, v9, 0.0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  [(VUIAppInstallLockup *)self->_lockupView setIcon:v10];
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  objc_storeStrong((id *)&self->_title, a3);
  id v6 = a3;
  [(UILabel *)self->_titleView setText:*p_title];
}

- (void)setMessage:(id)a3
{
  p_message = &self->_message;
  objc_storeStrong((id *)&self->_message, a3);
  id v6 = a3;
  [(UILabel *)self->_messageView setText:*p_message];
}

- (void)setAppName:(id)a3
{
}

- (void)setAgeRating:(id)a3
{
}

- (void)setIAP:(id)a3
{
  -[VUIAppInstallLockup setIAP:](self->_lockupView, "setIAP:");
  buyLockup = self->_buyLockup;
  if (buyLockup)
  {
    [(VUIBuyButtonLockup *)buyLockup setHasIAP:a3 != 0];
  }
}

- (void)setAppSubtitle:(id)a3
{
}

- (void)layoutSubviews
{
  if (!self->_didLayout)
  {
    self->_didLayout = 1;
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v4 = [v3 userInterfaceIdiom];

    if (v4 == 2)
    {
      [(VUIAppInstallConfirmationView *)self _layoutForTvos];
    }
    else
    {
      [(VUIAppInstallConfirmationView *)self _layoutForIos];
    }
  }
}

- (void)_layoutForTvos
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  imageSubtitleView = self->_imageSubtitleView;
  v56[0] = self->_lockupView;
  v56[1] = imageSubtitleView;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  id v6 = (void *)[v3 initWithArrangedSubviews:v5];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAxis:1];
  [v6 setDistribution:3];
  [v6 setAlignment:3];
  id v7 = objc_alloc(MEMORY[0x1E4FB1C60]);
  messageView = self->_messageView;
  v55[0] = self->_titleView;
  v55[1] = messageView;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  id v10 = (void *)[v7 initWithArrangedSubviews:v9];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAxis:1];
  [v10 setDistribution:3];
  [v10 setAlignment:3];
  [v10 setSpacing:16.0];
  id v11 = objc_alloc(MEMORY[0x1E4FB1C60]);
  cancelButton = self->_cancelButton;
  v54[0] = self->_actionButton;
  v54[1] = cancelButton;
  secondaryLinkButton = self->_secondaryLinkButton;
  v54[2] = self->_appStoreButton;
  v54[3] = secondaryLinkButton;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
  uint64_t v15 = (void *)[v11 initWithArrangedSubviews:v14];

  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v15 setAxis:1];
  [v15 setDistribution:0];
  [v15 setAlignment:3];
  LODWORD(v16) = 1132068864;
  [v15 setContentCompressionResistancePriority:0 forAxis:v16];
  uint64_t v17 = [(UIButton *)self->_actionButton widthAnchor];
  v18 = [v17 constraintEqualToConstant:500.0];
  [v18 setActive:1];

  v19 = [(UIButton *)self->_cancelButton widthAnchor];
  uint64_t v20 = [v19 constraintEqualToConstant:500.0];
  [v20 setActive:1];

  uint64_t v21 = [(UIButton *)self->_appStoreButton widthAnchor];
  v22 = [v21 constraintEqualToConstant:500.0];
  [v22 setActive:1];

  LODWORD(v23) = 1112014848;
  [(UIButton *)self->_secondaryLinkButton setContentCompressionResistancePriority:0 forAxis:v23];
  [v15 setSpacing:14.0];
  v24 = [(UIButton *)self->_actionButton heightAnchor];
  v25 = [v24 constraintEqualToConstant:66.0];
  [v25 setActive:1];

  v26 = [(UIButton *)self->_cancelButton heightAnchor];
  v27 = [(UIButton *)self->_actionButton heightAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  id v29 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v53[0] = v6;
  v53[1] = v10;
  v53[2] = v15;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  v31 = (void *)[v29 initWithArrangedSubviews:v30];

  [(VUIAppInstallConfirmationView *)self addSubview:v31];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v31 setAxis:1];
  [v31 setDistribution:3];
  [v31 setAlignment:3];
  [v31 setSpacing:35.0];
  [v31 setCustomSpacing:v10 afterView:50.0];
  LODWORD(v32) = 1148846080;
  [v31 setContentHuggingPriority:0 forAxis:v32];
  uint64_t v33 = [v31 centerXAnchor];
  v34 = [(VUIAppInstallConfirmationView *)self centerXAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [v35 setActive:1];

  v36 = [v31 centerYAnchor];
  uint64_t v37 = [(VUIAppInstallConfirmationView *)self centerYAnchor];
  v38 = [v36 constraintEqualToAnchor:v37];
  [v38 setActive:1];

  v39 = [v31 topAnchor];
  v40 = [(VUIAppInstallConfirmationView *)self safeAreaLayoutGuide];
  v41 = [v40 topAnchor];
  v42 = [v39 constraintGreaterThanOrEqualToAnchor:v41];
  [v42 setActive:1];

  v43 = [v31 bottomAnchor];
  uint64_t v44 = [(VUIAppInstallConfirmationView *)self safeAreaLayoutGuide];
  v45 = [v44 bottomAnchor];
  uint64_t v46 = [v43 constraintLessThanOrEqualToAnchor:v45];
  [v46 setActive:1];

  v47 = [v15 leadingAnchor];
  v48 = [v31 leadingAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v49 setActive:1];

  v50 = [v15 trailingAnchor];
  v51 = [v31 trailingAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v52 setActive:1];
}

- (void)_layoutForIos
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  imageSubtitleView = self->_imageSubtitleView;
  v40[0] = self->_lockupView;
  v40[1] = imageSubtitleView;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  id v6 = (void *)[v3 initWithArrangedSubviews:v5];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setAxis:1];
  [v6 setDistribution:3];
  [v6 setAlignment:3];
  id v7 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v39[0] = self->_messageView;
  v39[1] = v6;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  double v9 = (void *)[v7 initWithArrangedSubviews:v8];

  [(VUIAppInstallConfirmationView *)self addSubview:v9];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setAxis:1];
  [v9 setDistribution:3];
  [v9 setAlignment:3];
  [v9 setSpacing:24.0];
  [v9 setCustomSpacing:self->_messageView afterView:24.0];
  id v10 = [(UILabel *)self->_messageView widthAnchor];
  id v11 = [v9 widthAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11 constant:-80.0];
  [v12 setActive:1];

  LODWORD(v13) = 1144586240;
  [(UILabel *)self->_messageView setContentCompressionResistancePriority:1 forAxis:v13];
  LODWORD(v14) = 1144586240;
  [(UILabel *)self->_messageView setContentCompressionResistancePriority:0 forAxis:v14];
  uint64_t v15 = [v9 centerXAnchor];
  double v16 = [(VUIAppInstallConfirmationView *)self readableContentGuide];
  uint64_t v17 = [v16 centerXAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  v19 = [v9 centerYAnchor];
  uint64_t v20 = [(VUIAppInstallConfirmationView *)self readableContentGuide];
  uint64_t v21 = [v20 centerYAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  double v23 = [v9 topAnchor];
  v24 = [(VUIAppInstallConfirmationView *)self readableContentGuide];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintGreaterThanOrEqualToAnchor:v25 constant:20.0];
  [v26 setActive:1];

  v27 = [v9 bottomAnchor];
  v28 = [(VUIAppInstallConfirmationView *)self readableContentGuide];
  id v29 = [v28 bottomAnchor];
  v30 = [v27 constraintLessThanOrEqualToAnchor:v29 constant:-20.0];
  [v30 setActive:1];

  v31 = [v9 leftAnchor];
  double v32 = [(VUIAppInstallConfirmationView *)self readableContentGuide];
  uint64_t v33 = [v32 leftAnchor];
  v34 = [v31 constraintEqualToAnchor:v33 constant:20.0];
  [v34 setActive:1];

  v35 = [v9 rightAnchor];
  v36 = [(VUIAppInstallConfirmationView *)self readableContentGuide];
  uint64_t v37 = [v36 rightAnchor];
  v38 = [v35 constraintEqualToAnchor:v37 constant:-20.0];
  [v38 setActive:1];
}

+ (CGSize)iconSize
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 2;

  double v4 = dbl_1E38FE210[v3];
  double v5 = dbl_1E38FE220[v3];
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)_buttonWithTitleForTV:(id)a3 textStyle:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4FB14D0];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v5 buttonWithType:1];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v6];

  [v8 _setFont:v9];
  id v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [v8 setTitleColor:v10 forState:0];

  id v11 = [MEMORY[0x1E4FB1618] blackColor];
  [v8 setTitleColor:v11 forState:8];

  [v8 setBackgroundImage:0 forStates:0];
  [v8 _setVisualEffectViewEnabled:0 backgroundColor:0];
  [v8 setTitle:v7 forState:0];

  return v8;
}

- (VUIAppInstallLockup)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIButton)appStoreButton
{
  return self->_appStoreButton;
}

- (void)setAppStoreButton:(id)a3
{
}

- (UIButton)secondaryLinkButton
{
  return self->_secondaryLinkButton;
}

- (void)setSecondaryLinkButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLinkButton, 0);
  objc_storeStrong((id *)&self->_appStoreButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_buttonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_buyLockup, 0);
  objc_storeStrong((id *)&self->_imageSubtitleView, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end