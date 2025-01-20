@interface COSPartnerAppCell
+ (unint64_t)didInstallPostSetupEvent;
- (COSAppInstallButton)getButton;
- (COSAppInstallationController)installController;
- (COSPartnerAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UIImageView)iconView;
- (UILabel)appTitleLabel;
- (UILabel)companyLabel;
- (id)appIcon;
- (id)localizedAppTitle;
- (id)localizedPartnerTitle;
- (id)partnerAppBundleIdentifier;
- (id)partnerAppStoreIdentifier;
- (id)productParameters;
- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3;
- (void)appIsAvailableStateDidChange:(unint64_t)a3;
- (void)dealloc;
- (void)didBeginInstallationWithSuccess:(BOOL)a3;
- (void)didCompleteInstallationWithSuccess:(BOOL)a3;
- (void)didInitiatePurchase;
- (void)layoutSubviews;
- (void)pressedGet:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAppTitleLabel:(id)a3;
- (void)setCompanyLabel:(id)a3;
- (void)setGetButton:(id)a3;
- (void)setIconView:(id)a3;
- (void)setInitialInstallState;
- (void)setInstallController:(id)a3;
- (void)setMode:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation COSPartnerAppCell

- (COSPartnerAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v38.receiver = self;
  v38.super_class = (Class)COSPartnerAppCell;
  v5 = [(COSPartnerAppCell *)&v38 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = [COSAppInstallationController alloc];
    v7 = [(COSPartnerAppCell *)v5 partnerAppBundleIdentifier];
    v8 = [(COSPartnerAppCell *)v5 partnerAppStoreIdentifier];
    v9 = [(COSAppInstallationController *)v6 initWithBundleID:v7 andStoreIdentifier:v8];
    installController = v5->_installController;
    v5->_installController = v9;

    [(COSAppInstallationController *)v5->_installController addObserver:v5];
    id v11 = objc_alloc((Class)UIImageView);
    v12 = [(COSPartnerAppCell *)v5 appIcon];
    v13 = (UIImageView *)[v11 initWithImage:v12];
    iconView = v5->_iconView;
    v5->_iconView = v13;

    v15 = [(COSPartnerAppCell *)v5 contentView];
    [v15 addSubview:v5->_iconView];

    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    appTitleLabel = v5->_appTitleLabel;
    v5->_appTitleLabel = v16;

    v18 = v5->_appTitleLabel;
    v19 = [(COSPartnerAppCell *)v5 localizedAppTitle];
    [(UILabel *)v18 setText:v19];

    [(UILabel *)v5->_appTitleLabel setNumberOfLines:1];
    v20 = v5->_appTitleLabel;
    v21 = +[UIFont boldSystemFontOfSize:16.0];
    [(UILabel *)v20 setFont:v21];

    v22 = v5->_appTitleLabel;
    v23 = BPSTextColor();
    [(UILabel *)v22 setTextColor:v23];

    v24 = [(COSPartnerAppCell *)v5 contentView];
    [v24 addSubview:v5->_appTitleLabel];

    v25 = (UILabel *)objc_alloc_init((Class)UILabel);
    companyLabel = v5->_companyLabel;
    v5->_companyLabel = v25;

    v27 = v5->_companyLabel;
    v28 = [(COSPartnerAppCell *)v5 localizedPartnerTitle];
    [(UILabel *)v27 setText:v28];

    v29 = v5->_companyLabel;
    v30 = +[UIFont systemFontOfSize:13.0];
    [(UILabel *)v29 setFont:v30];

    v31 = v5->_companyLabel;
    v32 = +[UIColor systemMidGrayColor];
    [(UILabel *)v31 setTextColor:v32];

    v33 = [(COSPartnerAppCell *)v5 contentView];
    [v33 addSubview:v5->_companyLabel];

    uint64_t v34 = +[COSAppInstallButton buttonWithType:1];
    getButton = v5->_getButton;
    v5->_getButton = (COSAppInstallButton *)v34;

    [(COSAppInstallButton *)v5->_getButton addTarget:v5 action:"pressedGet:" forControlEvents:64];
    [(COSPartnerAppCell *)v5 setInitialInstallState];
    v36 = [(COSPartnerAppCell *)v5 contentView];
    [v36 addSubview:v5->_getButton];
  }
  return v5;
}

- (void)dealloc
{
  [(COSAppInstallationController *)self->_installController removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)COSPartnerAppCell;
  [(COSPartnerAppCell *)&v3 dealloc];
}

- (void)setMode:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = +[MCProfileConnection sharedConnection];
  unsigned int v8 = [v7 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed];

  getButton = self->_getButton;
  if (v8 == 2) {
    unint64_t v10 = 3;
  }
  else {
    unint64_t v10 = a3;
  }

  [(COSAppInstallButton *)getButton setMode:v10 animated:v4];
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)COSPartnerAppCell;
  [(COSPartnerAppCell *)&v29 layoutSubviews];
  objc_super v3 = [(COSPartnerAppCell *)self textLabel];
  [v3 setHidden:1];

  [(COSPartnerAppCell *)self bounds];
  CGFloat v27 = v5;
  CGFloat v28 = v4;
  CGFloat v25 = v7;
  CGFloat v26 = v6;
  double height = CGSizeZero.height;
  -[UIImageView sizeThatFits:](self->_iconView, "sizeThatFits:", CGSizeZero.width, height);
  -[UIImageView setFrame:](self->_iconView, "setFrame:", 10.0, 10.0, 55.0, 55.0);
  -[UILabel sizeThatFits:](self->_appTitleLabel, "sizeThatFits:", CGSizeZero.width, height);
  double v10 = v9;
  double v12 = v11;
  -[UILabel sizeThatFits:](self->_companyLabel, "sizeThatFits:", CGSizeZero.width, height);
  double v23 = v14;
  double v24 = v13;
  *(float *)&double v13 = (55.0 - (v12 + v14 + 1.0)) * 0.5;
  double v15 = floorf(*(float *)&v13);
  v30.origin.x = 10.0;
  v30.origin.y = 10.0;
  v30.size.width = 55.0;
  v30.size.double height = 55.0;
  CGFloat v16 = CGRectGetMaxX(v30) + 10.0;
  v31.origin.x = 10.0;
  v31.origin.y = 10.0;
  v31.size.width = 55.0;
  v31.size.double height = 55.0;
  CGFloat v17 = CGRectGetMinY(v31) + v15;
  v32.origin.x = 10.0;
  v32.origin.y = 10.0;
  v32.size.width = 55.0;
  v32.size.double height = 55.0;
  CGFloat v18 = CGRectGetMaxX(v32) + 10.0;
  v33.origin.x = v16;
  v33.origin.y = v17;
  v33.size.width = v10;
  v33.size.double height = v12;
  CGFloat v19 = CGRectGetMaxY(v33) + 1.0;
  -[UILabel setFrame:](self->_appTitleLabel, "setFrame:", v16, v17, v10, v12);
  -[UILabel setFrame:](self->_companyLabel, "setFrame:", v18, v19, v24, v23);
  -[COSAppInstallButton sizeThatFits:](self->_getButton, "sizeThatFits:", CGSizeZero.width, height);
  double v21 = v20;
  v34.origin.x = v28;
  v34.origin.y = v27;
  v34.size.width = v26;
  v34.size.double height = v25;
  CGFloat v22 = CGRectGetWidth(v34) + -10.0 - v21;
  v35.origin.x = v28;
  v35.origin.y = v27;
  v35.size.width = v26;
  v35.size.double height = v25;
  -[COSAppInstallButton setFrame:](self->_getButton, "setFrame:", v22, 0.0, v21, CGRectGetHeight(v35));
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  double v4 = [(COSPartnerAppCell *)self titleLabel];
  [v4 setHidden:1];

  if (![(COSAppInstallationController *)self->_installController isInstalled])
  {
    unint64_t v5 = [(COSAppInstallationController *)self->_installController isAvailableInStore];
    double v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = +[NSNumber numberWithBool:v5 != 0];
      int v8 = 138412290;
      double v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App Available In Current Store: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setInitialInstallState
{
  unsigned int v3 = [(COSAppInstallationController *)self->_installController installInProgress];
  unsigned int v4 = [(COSAppInstallationController *)self->_installController isInstalled];
  uint64_t v5 = 4;
  if (!v3) {
    uint64_t v5 = 1;
  }
  if (v4) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }

  [(COSPartnerAppCell *)self setMode:v6 animated:0];
}

- (id)productParameters
{
  unsigned int v3 = +[NSMutableDictionary dictionary];
  unsigned int v4 = [(COSPartnerAppCell *)self partnerAppStoreIdentifier];
  [v3 setObject:v4 forKey:SKStoreProductParameterITunesItemIdentifier];

  return v3;
}

+ (unint64_t)didInstallPostSetupEvent
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "+[COSPartnerAppCell didInstallPostSetupEvent]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass requires override %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (void)pressedGet:(id)a3
{
  +[PBBridgeCAReporter incrementSuccessType:](PBBridgeCAReporter, "incrementSuccessType:", [(id)objc_opt_class() didInstallPostSetupEvent]);
  [(COSAppInstallationController *)self->_installController startInstalling];
  int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Began Installing Partner App", v5, 2u);
  }
}

- (void)didInitiatePurchase
{
}

- (void)didBeginInstallationWithSuccess:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 1;
  }
  [(COSPartnerAppCell *)self setMode:v3 animated:1];
}

- (void)didCompleteInstallationWithSuccess:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(COSPartnerAppCell *)self setMode:v3 animated:1];
  int v4 = pbb_bridge_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did Complete Installing Partner Apps", v5, 2u);
  }
}

- (void)appIsAvailableStateDidChange:(unint64_t)a3
{
  if (a3 == 2) {
    [(COSPartnerAppCell *)self setMode:3 animated:1];
  }
}

- (void)_accessibilitySetInterfaceStyleIntent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSPartnerAppCell;
  -[COSPartnerAppCell _accessibilitySetInterfaceStyleIntent:](&v5, "_accessibilitySetInterfaceStyleIntent:");
  [(COSAppInstallButton *)self->_getButton _accessibilitySetInterfaceStyleIntent:a3];
}

- (id)appIcon
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[COSPartnerAppCell appIcon]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)localizedAppTitle
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[COSPartnerAppCell localizedAppTitle]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)localizedPartnerTitle
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[COSPartnerAppCell localizedPartnerTitle]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)partnerAppBundleIdentifier
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[COSPartnerAppCell partnerAppBundleIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (id)partnerAppStoreIdentifier
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    objc_super v5 = "-[COSPartnerAppCell partnerAppStoreIdentifier]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Subclass must override class: %s", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (COSAppInstallationController)installController
{
  return self->_installController;
}

- (void)setInstallController:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)appTitleLabel
{
  return self->_appTitleLabel;
}

- (void)setAppTitleLabel:(id)a3
{
}

- (UILabel)companyLabel
{
  return self->_companyLabel;
}

- (void)setCompanyLabel:(id)a3
{
}

- (COSAppInstallButton)getButton
{
  return self->_getButton;
}

- (void)setGetButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getButton, 0);
  objc_storeStrong((id *)&self->_companyLabel, 0);
  objc_storeStrong((id *)&self->_appTitleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_installController, 0);
}

@end