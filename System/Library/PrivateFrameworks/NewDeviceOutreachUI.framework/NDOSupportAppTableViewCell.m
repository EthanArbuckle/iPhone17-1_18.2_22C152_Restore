@interface NDOSupportAppTableViewCell
+ (int64_t)cellStyle;
- (ASCLockupView)lockupView;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NDOSupportAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)parentViewController;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)_setupAppSuportCell;
- (void)dealloc;
- (void)layoutSubviews;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidBeginRequest:(id)a3;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)openButtonAction;
- (void)setLockupView:(id)a3;
- (void)updateConstraints;
@end

@implementation NDOSupportAppTableViewCell

+ (int64_t)cellStyle
{
  return 3;
}

- (NDOSupportAppTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NDOSupportAppTableViewCell;
  v9 = [(PSTableCell *)&v17 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(NDOSupportAppTableViewCell *)v9 _setupAppSuportCell];
    v11 = [v8 propertyForKey:@"NDOWarranty"];
    uint64_t v12 = [v11 supportAppURL];
    v13 = (void *)v12;
    if (v12) {
      v14 = (__CFString *)v12;
    }
    else {
      v14 = @"https://getsupport.apple.com/?caller=prefscoverage";
    }
    objc_storeStrong((id *)&v10->_supportAppURL, v14);

    v15 = _NDOLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[NDOSupportAppTableViewCell initWithStyle:reuseIdentifier:specifier:]((uint64_t *)&v10->_supportAppURL, v15);
    }
  }
  return v10;
}

- (void)layoutSubviews
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 lockupView];
  [v3 frame];
  v4 = NSStringFromRect(v7);
  v5[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_238845000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: lockupView frame: %@", (uint8_t *)v5, 0x16u);
}

- (void)_setupAppSuportCell
{
  v32[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F25380]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(NDOSupportAppTableViewCell *)self setLockupView:v4];

  v5 = [(NDOSupportAppTableViewCell *)self lockupView];
  [v5 setDelegate:self];

  uint64_t v6 = [(NDOSupportAppTableViewCell *)self lockupView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v7 = *MEMORY[0x263F25340];
  id v8 = [(NDOSupportAppTableViewCell *)self lockupView];
  [v8 setSize:v7];

  v9 = [MEMORY[0x263F086E0] mainBundle];
  v10 = [v9 bundleIdentifier];

  if ([v10 isEqualToString:@"com.apple.Bridge"])
  {
    v11 = [MEMORY[0x263F253A0] primaryTheme];
    id v12 = objc_alloc(MEMORY[0x263F253A0]);
    v30 = [v11 titleBackgroundColor];
    [MEMORY[0x263F825C8] orangeColor];
    v13 = v31 = v10;
    v14 = [MEMORY[0x263F825C8] orangeColor];
    v15 = [v14 colorWithAlphaComponent:0.3];
    v16 = [v11 subtitleTextColor];
    objc_super v17 = [MEMORY[0x263F825C8] orangeColor];
    v18 = [v11 progressColor];
    v19 = (void *)[v12 initWithTitleBackgroundColor:v30 titleTextColor:v13 titleTextDisabledColor:v15 subtitleTextColor:v16 iconTintColor:v17 progressColor:v18];
    v20 = [(NDOSupportAppTableViewCell *)self lockupView];
    [v20 setOfferTheme:v19];

    v10 = v31;
  }
  v21 = (void *)[objc_alloc(MEMORY[0x263F25350]) initWithStringValue:@"1130498044"];
  id v22 = objc_alloc(MEMORY[0x263F25378]);
  v23 = (void *)[v22 _initWithID:v21 kind:*MEMORY[0x263F25330] context:*MEMORY[0x263F25320] clientID:@"SupportApp"];
  v24 = [(NDOSupportAppTableViewCell *)self lockupView];
  [v24 setRequest:v23];

  v25 = [(NDOSupportAppTableViewCell *)self contentView];
  v26 = [(NDOSupportAppTableViewCell *)self lockupView];
  [v25 addSubview:v26];

  [(NDOSupportAppTableViewCell *)self layoutSubviews];
  v32[0] = objc_opt_class();
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:1];
  v28 = [(NDOSupportAppTableViewCell *)self registerForTraitChanges:v27 withAction:sel_didChangeTraitPreferredContentSizeCategory];
  traitRegistration = self->_traitRegistration;
  self->_traitRegistration = v28;
}

- (void)updateConstraints
{
  v21[3] = *MEMORY[0x263EF8340];
  v13 = (void *)MEMORY[0x263F08938];
  v19 = [(NDOSupportAppTableViewCell *)self contentView];
  objc_super v17 = [v19 leadingAnchor];
  v18 = [(NDOSupportAppTableViewCell *)self lockupView];
  v16 = [v18 leadingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v21[0] = v15;
  v14 = [(NDOSupportAppTableViewCell *)self contentView];
  id v12 = [v14 trailingAnchor];
  id v3 = [(NDOSupportAppTableViewCell *)self lockupView];
  v4 = [v3 trailingAnchor];
  v5 = [v12 constraintEqualToAnchor:v4];
  v21[1] = v5;
  uint64_t v6 = [(NDOSupportAppTableViewCell *)self contentView];
  uint64_t v7 = [v6 topAnchor];
  id v8 = [(NDOSupportAppTableViewCell *)self lockupView];
  v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v21[2] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  [v13 activateConstraints:v11];

  v20.receiver = self;
  v20.super_class = (Class)NDOSupportAppTableViewCell;
  [(NDOSupportAppTableViewCell *)&v20 updateConstraints];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(NDOSupportAppTableViewCell *)self lockupView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)dealloc
{
  [(NDOSupportAppTableViewCell *)self unregisterForTraitChanges:self->_traitRegistration];
  v3.receiver = self;
  v3.super_class = (Class)NDOSupportAppTableViewCell;
  [(PSTableCell *)&v3 dealloc];
}

- (void)openButtonAction
{
  v2 = NSURL;
  supportAppURL = self->_supportAppURL;
  v4 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v5 = [(NSString *)supportAppURL stringByAddingPercentEncodingWithAllowedCharacters:v4];
  double v6 = [v2 URLWithString:v5];

  double v7 = [MEMORY[0x263F82438] sharedApplication];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke;
  v9[3] = &unk_264D49538;
  id v10 = v6;
  id v8 = v6;
  [v7 openURL:v8 options:MEMORY[0x263EFFA78] completionHandler:v9];
}

void __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    objc_super v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke_cold_1(a1, v3);
    }
  }
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[NDOSupportAppTableViewCell presentingViewControllerForLockupView:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = [(NDOSupportAppTableViewCell *)self parentViewController];
  return v12;
}

- (void)lockupViewDidBeginRequest:(id)a3
{
  objc_super v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[NDOSupportAppTableViewCell lockupViewDidBeginRequest:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[NDOSupportAppTableViewCell lockupViewDidFinishRequest:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  if (!self->_originalAppOffer)
  {
    v13 = [v4 lockup];
    v14 = [v13 offer];
    originalAppOffer = self->_originalAppOffer;
    self->_originalAppOffer = v14;
  }
  v16 = [MEMORY[0x263F25390] sharedMetrics];
  objc_super v17 = [v4 lockup];
  v18 = [v17 lockupWithOffer:self->_originalAppOffer];
  id v19 = (id)[v16 recordCampaignToken:@"coverage.settings" providerToken:@"2003" withLockup:v18];
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[NDOSupportAppTableViewCell lockupView:didFailRequestWithError:]();
  }
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _NDOLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[NDOSupportAppTableViewCell lockupView:appStateDidChange:]();
  }

  if (([v7 isEqual:*MEMORY[0x263F252C8]] & 1) != 0
    || [v7 isEqual:*MEMORY[0x263F252D0]])
  {
    uint64_t v9 = (void *)MEMORY[0x263F25398];
    uint64_t v10 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"];
    uint64_t v11 = [v10 localizedStringForKey:@"OPEN" value:&stru_26EB85580 table:@"Localizable"];
    uint64_t v12 = [v9 textMetadataWithTitle:v11 subtitle:0];

    id v13 = objc_alloc(MEMORY[0x263F25368]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke;
    v17[3] = &unk_264D49560;
    v17[4] = self;
    v14 = (void *)[v13 initWithMetadata:v12 action:v17];
    v15 = [v6 lockup];
    v16 = [v15 lockupWithOffer:v14];
    [v6 setLockup:v16];
  }
}

uint64_t __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke(uint64_t a1)
{
  v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return [*(id *)(a1 + 32) openButtonAction];
}

- (id)parentViewController
{
  return 0;
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
  objc_storeStrong((id *)&self->_traitRegistration, 0);
  objc_storeStrong((id *)&self->_originalAppOffer, 0);
  objc_storeStrong((id *)&self->_supportAppURL, 0);
}

- (void)initWithStyle:(uint64_t *)a1 reuseIdentifier:(NSObject *)a2 specifier:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136446466;
  uint64_t v4 = "-[NDOSupportAppTableViewCell initWithStyle:reuseIdentifier:specifier:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_238845000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: supportApp url: %@", (uint8_t *)&v3, 0x16u);
}

void __46__NDOSupportAppTableViewCell_openButtonAction__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_238845000, a2, OS_LOG_TYPE_ERROR, "Could not open URL %@", (uint8_t *)&v3, 0xCu);
}

- (void)presentingViewControllerForLockupView:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockupViewDidBeginRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockupViewDidFinishRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockupView:didFailRequestWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_238845000, v0, OS_LOG_TYPE_ERROR, "%{public}s: Failed with error: %@", (uint8_t *)v1, 0x16u);
}

- (void)lockupView:appStateDidChange:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_238845000, v0, OS_LOG_TYPE_DEBUG, "%{public}s: appStateDidChange with state: %@", (uint8_t *)v1, 0x16u);
}

void __59__NDOSupportAppTableViewCell_lockupView_appStateDidChange___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end