@interface PSUIAppInstallLockupViewCell
- (ASCLockupView)lockupView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PSUIAppInstallLockupViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)getLogger;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)_setupView;
- (void)installButtonAction;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)lockupViewFailed:(id)a3;
- (void)openButtonAction;
- (void)setLockupView:(id)a3;
- (void)updateConstraints;
@end

@implementation PSUIAppInstallLockupViewCell

- (PSUIAppInstallLockupViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PSUIAppInstallLockupViewCell;
  v9 = [(PSTableCell *)&v21 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    uint64_t v10 = [v8 propertyForKey:@"PSUIAppOpenURL"];
    openAppURL = v9->_openAppURL;
    v9->_openAppURL = (NSString *)v10;

    uint64_t v12 = [v8 propertyForKey:@"PSUIAppId"];
    appId = v9->_appId;
    v9->_appId = (NSString *)v12;

    uint64_t v14 = [v8 propertyForKey:@"PSUIAnalyticsEventForApp"];
    analyticsEventForApp = v9->_analyticsEventForApp;
    v9->_analyticsEventForApp = (NSString *)v14;

    uint64_t v16 = [v8 propertyForKey:@"PSUIAnalyticsEventDetailsCode"];
    analyticsEventDetailsCode = v9->_analyticsEventDetailsCode;
    v9->_analyticsEventDetailsCode = (NSNumber *)v16;

    if (!v9->_analyticsEventDetailsCode) {
      v9->_analyticsEventDetailsCode = (NSNumber *)&unk_26D425F00;
    }
    [(PSUIAppInstallLockupViewCell *)v9 _setupView];
    v18 = [(PSUIAppInstallLockupViewCell *)v9 getLogger];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v9->_appId;
      *(_DWORD *)buf = 136315394;
      v23 = "-[PSUIAppInstallLockupViewCell initWithStyle:reuseIdentifier:specifier:]";
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_221B17000, v18, OS_LOG_TYPE_DEFAULT, "%s appId:%@", buf, 0x16u);
    }
  }
  return v9;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)PSUIAppInstallLockupViewCell;
  [(PSTableCell *)&v14 layoutSubviews];
  [(PSUIAppInstallLockupViewCell *)self setNeedsUpdateConstraints];
  [(PSTableCell *)self setCellEnabled:1];
  v3 = [(PSUIAppInstallLockupViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  objc_msgSend(v13, "setLayoutMargins:", 8.0, 15.0, 8.0, 12.0);
}

- (void)updateConstraints
{
  v21[3] = *MEMORY[0x263EF8340];
  v13 = (void *)MEMORY[0x263F08938];
  v19 = [(PSUIAppInstallLockupViewCell *)self contentView];
  v17 = [v19 leadingAnchor];
  v18 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  uint64_t v16 = [v18 leadingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v21[0] = v15;
  objc_super v14 = [(PSUIAppInstallLockupViewCell *)self contentView];
  uint64_t v12 = [v14 trailingAnchor];
  v3 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  double v4 = [v3 trailingAnchor];
  double v5 = [v12 constraintEqualToAnchor:v4];
  v21[1] = v5;
  double v6 = [(PSUIAppInstallLockupViewCell *)self contentView];
  double v7 = [v6 topAnchor];
  double v8 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  double v9 = [v8 topAnchor];
  double v10 = [v7 constraintEqualToAnchor:v9];
  v21[2] = v10;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  [v13 activateConstraints:v11];

  v20.receiver = self;
  v20.super_class = (Class)PSUIAppInstallLockupViewCell;
  [(PSUIAppInstallLockupViewCell *)&v20 updateConstraints];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_setupView
{
  id v3 = objc_alloc(MEMORY[0x263F25380]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(PSUIAppInstallLockupViewCell *)self setLockupView:v4];

  double v5 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  [v5 setDelegate:self];

  double v6 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v7 = *MEMORY[0x263F25340];
  double v8 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  [v8 setLockupSize:v7];

  id v14 = (id)[objc_alloc(MEMORY[0x263F25350]) initWithStringValue:self->_appId];
  id v9 = objc_alloc(MEMORY[0x263F25378]);
  double v10 = (void *)[v9 _initWithID:v14 kind:*MEMORY[0x263F25330] context:*MEMORY[0x263F25320] clientID:@"SettingsView"];
  double v11 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  [v11 setRequest:v10];

  uint64_t v12 = [(PSUIAppInstallLockupViewCell *)self contentView];
  v13 = [(PSUIAppInstallLockupViewCell *)self lockupView];
  [v12 addSubview:v13];

  [(PSUIAppInstallLockupViewCell *)self layoutSubviews];
}

- (void)openButtonAction
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = NSURL;
  openAppURL = self->_openAppURL;
  double v5 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  double v6 = [(NSString *)openAppURL stringByAddingPercentEncodingWithAllowedCharacters:v5];
  uint64_t v7 = [v3 URLWithString:v6];

  double v8 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[PSUIAppInstallLockupViewCell openButtonAction]";
    __int16 v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s for URL: %@", buf, 0x16u);
  }

  id v9 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __48__PSUIAppInstallLockupViewCell_openButtonAction__block_invoke;
  v17 = &unk_2645E14E8;
  v18 = self;
  id v10 = v7;
  id v19 = v10;
  [v9 openURL:v10 options:MEMORY[0x263EFFA78] completionHandler:&v14];

  analyticsEventForApp = self->_analyticsEventForApp;
  if (analyticsEventForApp)
  {
    v20[0] = 0x26D416960;
    v20[1] = 0x26D416980;
    analyticsEventDetailsCode = self->_analyticsEventDetailsCode;
    v21[0] = @"OpenSupportApp";
    v21[1] = analyticsEventDetailsCode;
    v13 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v14, v15, v16, v17, v18);
    PSAnalyticsSendEvent_0(analyticsEventForApp, v13);
  }
}

void __48__PSUIAppInstallLockupViewCell_openButtonAction__block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_221B17000, v3, OS_LOG_TYPE_ERROR, "Could not open URL: %@!!", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)installButtonAction
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    appId = self->_appId;
    *(_DWORD *)buf = 136315650;
    double v11 = "-[PSUIAppInstallLockupViewCell installButtonAction]";
    __int16 v12 = 2112;
    v13 = appId;
    __int16 v14 = 1024;
    int v15 = installButtonAction_installStarted;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s appId:%@ installStarted=%d", buf, 0x1Cu);
  }

  analyticsEventForApp = self->_analyticsEventForApp;
  if (analyticsEventForApp && (installButtonAction_installStarted & 1) == 0)
  {
    v8[0] = 0x26D416960;
    v8[1] = 0x26D416980;
    analyticsEventDetailsCode = self->_analyticsEventDetailsCode;
    v9[0] = @"InstallSupportApp";
    v9[1] = analyticsEventDetailsCode;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    PSAnalyticsSendEvent_0(analyticsEventForApp, v7);
  }
  installButtonAction_installStarted = 1;
}

- (void)lockupViewFailed:(id)a3
{
  id v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE60]);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleLockupViewFailure:v4];
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[PSUIAppInstallLockupViewCell lockupViewDidBeginRequest:]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[PSUIAppInstallLockupViewCell lockupViewDidFinishRequest:]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[PSUIAppInstallLockupViewCell lockupView:didFailRequestWithError:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s with error: %@", (uint8_t *)&v7, 0x16u);
  }

  [(PSUIAppInstallLockupViewCell *)self lockupViewFailed:v5];
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[PSUIAppInstallLockupViewCell lockupView:appStateDidChange:]";
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if (([v7 isEqual:*MEMORY[0x263F252C8]] & 1) != 0
    || [v7 isEqual:*MEMORY[0x263F252D0]])
  {
    __int16 v9 = (void *)MEMORY[0x263F25398];
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"OPEN" value:&stru_26D410CA0 table:@"AppInstallCell"];
    __int16 v12 = [v9 textMetadataWithTitle:v11 subtitle:0];

    id v13 = objc_alloc(MEMORY[0x263F25368]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__PSUIAppInstallLockupViewCell_lockupView_appStateDidChange___block_invoke;
    v17[3] = &unk_2645E0B88;
    v17[4] = self;
    __int16 v14 = (void *)[v13 initWithMetadata:v12 action:v17];
    int v15 = [v6 lockup];
    uint64_t v16 = [v15 lockupWithOffer:v14];
    [v6 setLockup:v16];
  }
  else if ([v7 isEqual:*MEMORY[0x263F252C0]])
  {
    [(PSUIAppInstallLockupViewCell *)self installButtonAction];
  }
}

uint64_t __61__PSUIAppInstallLockupViewCell_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openButtonAction];
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = [(PSUIAppInstallLockupViewCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[PSUIAppInstallLockupViewCell presentingViewControllerForLockupView:]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstall"];
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_analyticsEventDetailsCode, 0);
  objc_storeStrong((id *)&self->_analyticsEventForApp, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_openAppURL, 0);
}

@end