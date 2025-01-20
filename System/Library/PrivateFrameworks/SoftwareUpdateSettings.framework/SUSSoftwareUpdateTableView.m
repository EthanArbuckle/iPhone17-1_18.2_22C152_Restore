@interface SUSSoftwareUpdateTableView
+ (id)stringForState:(int)a3;
- (BOOL)disableScanUI;
- (BOOL)suPathsRestricted;
- (BOOL)updatesDeferred;
- (NSDate)lastScannedDate;
- (NSString)currentVersion;
- (SUSSoftwareUpdateTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIActivityIndicatorView)checkingForUpdateSpinner;
- (UILabel)checkingStatusLabel;
- (UILabel)subtitleLabel;
- (id)upToDateManagedText;
- (id)upToDateText;
- (id)upToDateWithAlternate;
- (int)state;
- (void)layoutSubviews;
- (void)preferredContentSizeChanged:(id)a3;
- (void)setCheckingForUpdateSpinner:(id)a3;
- (void)setCheckingStatusLabel:(id)a3;
- (void)setCurrentVersion:(id)a3;
- (void)setDisableScanUI:(BOOL)a3;
- (void)setLastScannedDate:(id)a3;
- (void)setState:(int)a3;
- (void)setSuPathsRestricted:(BOOL)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setUpdatesDeferred:(BOOL)a3;
@end

@implementation SUSSoftwareUpdateTableView

- (SUSSoftwareUpdateTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  CGRect v32 = a3;
  SEL v30 = a2;
  int64_t v29 = a4;
  v31 = 0;
  v28.receiver = self;
  v28.super_class = (Class)SUSSoftwareUpdateTableView;
  v31 = -[SUSSoftwareUpdateTableView initWithFrame:style:](&v28, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v31, v31);
  if (v31)
  {
    v31->_disableScanUI = 0;
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    checkingStatusLabel = v31->_checkingStatusLabel;
    v31->_checkingStatusLabel = v4;

    -[UILabel setTextAlignment:](v31->_checkingStatusLabel, "setTextAlignment:");
    v13 = v31->_checkingStatusLabel;
    id v14 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    -[UILabel setFont:](v13, "setFont:");

    v15 = v31->_checkingStatusLabel;
    id v16 = (id)[MEMORY[0x263F825C8] clearColor];
    -[UILabel setBackgroundColor:](v15, "setBackgroundColor:");

    v17 = v31->_checkingStatusLabel;
    id v18 = (id)[MEMORY[0x263F825C8] systemDarkGrayColor];
    -[UILabel setTextColor:](v17, "setTextColor:");

    [(UILabel *)v31->_checkingStatusLabel setNumberOfLines:0];
    [(UILabel *)v31->_checkingStatusLabel setLineBreakMode:0];
    [(UILabel *)v31->_checkingStatusLabel setAdjustsFontForContentSizeCategory:1];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    subtitleLabel = v31->_subtitleLabel;
    v31->_subtitleLabel = v6;

    v19 = v31->_subtitleLabel;
    id v20 = [(SUSSoftwareUpdateTableView *)v31 upToDateText];
    -[UILabel setText:](v19, "setText:");

    [(UILabel *)v31->_subtitleLabel setTextAlignment:1];
    v21 = v31->_subtitleLabel;
    id v22 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    -[UILabel setFont:](v21, "setFont:");

    v23 = v31->_subtitleLabel;
    id v24 = (id)[MEMORY[0x263F825C8] clearColor];
    -[UILabel setBackgroundColor:](v23, "setBackgroundColor:");

    v25 = v31->_subtitleLabel;
    id v26 = (id)[MEMORY[0x263F825C8] systemDarkGrayColor];
    -[UILabel setTextColor:](v25, "setTextColor:");

    [(UILabel *)v31->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v31->_subtitleLabel setLineBreakMode:0];
    [(UILabel *)v31->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    uint64_t v8 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    checkingForUpdateSpinner = v31->_checkingForUpdateSpinner;
    v31->_checkingForUpdateSpinner = (UIActivityIndicatorView *)v8;

    [(UIActivityIndicatorView *)v31->_checkingForUpdateSpinner sizeToFit];
    id v27 = (id)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v27, "addObserver:selector:name:object:", v31, sel_preferredContentSizeChanged_, *MEMORY[0x263F83428]);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v31, (CFNotificationCallback)_settingDidChangeFontSize, (CFStringRef)kSUSUIApplePreferredContentSizeCategoryNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v12 = v31;
  objc_storeStrong((id *)&v31, 0);
  return v12;
}

- (void)preferredContentSizeChanged:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  refreshPadding = 1;
  objc_storeStrong(location, 0);
}

- (void)layoutSubviews
{
  v44 = self;
  SEL v43 = a2;
  v42.receiver = self;
  v42.super_class = (Class)SUSSoftwareUpdateTableView;
  [(SUSSoftwareUpdateTableView *)&v42 layoutSubviews];
  if (refreshPadding)
  {
    statusMessageTopAfterScanningMargin = -1.0;
    refreshPadding = 0;
  }
  if (*(double *)&layoutSubviews_statusMessageTopMargin < 0.0)
  {
    PSRoundToPixel();
    layoutSubviews_statusMessageTopMargin = v2;
  }
  if (*(double *)&statusMessageTopAfterScanningMargin < 0.0)
  {
    id location = (id)objc_msgSend((id)*MEMORY[0x263F83300], "preferredContentSizeCategory", *(double *)&statusMessageTopAfterScanningMargin);
    UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)location, (UIContentSizeCategory)*MEMORY[0x263F83420]);
    PSRoundToPixel();
    statusMessageTopAfterScanningMargin = v3;
    objc_storeStrong(&location, 0);
  }
  [(SUSSoftwareUpdateTableView *)v44 bounds];
  double v39 = v4;
  double v40 = v5;
  if (v44->_state < 2u || v44->_state == 3 || v44->_state == 4)
  {
    id v27 = [(UILabel *)v44->_checkingStatusLabel text];
    id v26 = [(UILabel *)v44->_checkingStatusLabel font];
    CGSizeMake();
    -[NSString _legacy_sizeWithFont:constrainedToSize:](v27, "_legacy_sizeWithFont:constrainedToSize:", v26, v6, v7);
    double v36 = v8;
    double v37 = v9;

    float v10 = v36;
    v38.size.width = ceilf(v10);
    float v11 = v37;
    v38.size.height = ceilf(v11);
    float v12 = (v39 - v38.size.width) / 2.0;
    v38.origin.x = floorf(v12);
    float v13 = v40 / 2.0 - (double)kLabelOffset;
    v38.origin.y = floorf(v13);
    -[UILabel setFrame:](v44->_checkingStatusLabel, "setFrame:", *(_OWORD *)&v38.origin, *(_OWORD *)&v38.size);
    int64_t v29 = [(UILabel *)v44->_subtitleLabel text];
    objc_super v28 = [(UILabel *)v44->_subtitleLabel font];
    CGSizeMake();
    -[NSString _legacy_sizeWithFont:constrainedToSize:](v29, "_legacy_sizeWithFont:constrainedToSize:", v28, v14, v15);
    double v31 = v16;
    double v32 = v17;

    float v18 = v31;
    double v34 = ceilf(v18);
    float v19 = v32;
    double v35 = ceilf(v19);
    float v20 = (v39 - v34) / 2.0;
    double v33 = floorf(v20);
    float v21 = CGRectGetMaxY(v38) + (double)kSublabelOffset;
    -[UILabel setFrame:](v44->_subtitleLabel, "setFrame:", v33, floorf(v21), v34, v35);
    [(UIActivityIndicatorView *)v44->_checkingForUpdateSpinner frame];
    float v23 = (v39 - v22) / 2.0;
    double v30 = floorf(v23);
    float v24 = v38.origin.y - v38.size.height - 12.0;
    -[UIActivityIndicatorView setFrame:](v44->_checkingForUpdateSpinner, "setFrame:", v30, floorf(v24), v22, v25);
  }
}

- (void)setState:(int)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v30 = self;
  SEL v29 = a2;
  unsigned int v28 = a3;
  if (a3 != self->_state)
  {
    id v27 = _SUSLoggingFacility();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      log = v27;
      os_log_type_t type = v26;
      id v8 = +[SUSSoftwareUpdateTableView stringForState:v28];
      id v25 = v8;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v31, (uint64_t)"-[SUSSoftwareUpdateTableView setState:]", (uint64_t)v25);
      _os_log_impl(&dword_23BAE9000, log, type, "%s: Setting state %@", v31, 0x16u);

      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong(&v27, 0);
    if (v30->_state == 1 && (!v28 || v28 == 3 || v28 == 2)) {
      [(UIActivityIndicatorView *)v30->_checkingForUpdateSpinner setAlpha:0.0];
    }
    BOOL v24 = 0;
    BOOL v5 = 0;
    if (v30->_state == 1) {
      BOOL v5 = v28 == 2;
    }
    BOOL v24 = v5;
    BOOL v23 = 0;
    BOOL v4 = 0;
    if (v30->_state == 4) {
      BOOL v4 = v28 == 2;
    }
    BOOL v23 = v4;
    if (v24 || v23)
    {
      -[UIActivityIndicatorView setAlpha:](v30->_checkingForUpdateSpinner, "setAlpha:");
      [(UILabel *)v30->_checkingStatusLabel setAlpha:0.0];
      [(UILabel *)v30->_subtitleLabel setAlpha:0.0];
    }
    v30->_state = v28;
    if ([(SUSSoftwareUpdateTableView *)v30 disableScanUI])
    {
      [(SUSSoftwareUpdateTableView *)v30 setNeedsLayout];
    }
    else
    {
      uint64_t v3 = (void *)MEMORY[0x263F82E00];
      uint64_t v16 = MEMORY[0x263EF8330];
      int v17 = -1073741824;
      int v18 = 0;
      float v19 = __39__SUSSoftwareUpdateTableView_setState___block_invoke;
      float v20 = &unk_264E073B0;
      unsigned int v22 = v28;
      float v21 = v30;
      uint64_t v9 = MEMORY[0x263EF8330];
      int v10 = -1073741824;
      int v11 = 0;
      float v12 = __39__SUSSoftwareUpdateTableView_setState___block_invoke_2;
      float v13 = &unk_264E073D8;
      double v14 = v30;
      unsigned int v15 = v28;
      [v3 animateWithDuration:&v16 animations:&v9 completion:0.300000012];
      [(SUSSoftwareUpdateTableView *)v30 setNeedsLayout];
      objc_storeStrong((id *)&v14, 0);
      objc_storeStrong((id *)&v21, 0);
    }
  }
}

void __39__SUSSoftwareUpdateTableView_setState___block_invoke(uint64_t a1)
{
  v14[2] = (id)a1;
  v14[1] = (id)a1;
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    id v8 = *(void **)(*(void *)(a1 + 32) + 3264);
    id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = (id)[v10 localizedStringForKey:@"CHECKING_FOR_UPDATES" value:&stru_26EF052F8 table:@"Software Update"];
    objc_msgSend(v8, "setText:");

    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3264)];
    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3280)];
    [*(id *)(*(void *)(a1 + 32) + 3280) startAnimating];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 3264), "setAlpha:");
    int v11 = *(void **)(*(void *)(a1 + 32) + 3280);
    id v12 = (id)[MEMORY[0x263F825C8] systemGrayColor];
    objc_msgSend(v11, "setColor:");

    [*(id *)(*(void *)(a1 + 32) + 3280) setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 3272) setAlpha:0.0];
  }
  else if (*(_DWORD *)(a1 + 40) && *(_DWORD *)(a1 + 40) != 4)
  {
    if (*(_DWORD *)(a1 + 40) == 3)
    {
      id v1 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14[0] = (id)[v1 localizedStringForKey:@"MANAGED_DEVICE_HIDDEN_WITHIN_DELAY" value:&stru_26EF052F8 table:@"Software Update"];

      [*(id *)(*(void *)(a1 + 32) + 3264) setText:*(void *)(*(void *)(a1 + 32) + 3248)];
      [*(id *)(*(void *)(a1 + 32) + 3272) setText:v14[0]];
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3264)];
      [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3272)];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 3264), "setAlpha:");
      [*(id *)(*(void *)(a1 + 32) + 3272) setAlpha:1.0];
      [*(id *)(*(void *)(a1 + 32) + 3280) setAlpha:0.0];
      objc_storeStrong(v14, 0);
    }
    else
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 3264), "setAlpha:");
      [*(id *)(*(void *)(a1 + 32) + 3272) setAlpha:0.0];
      [*(id *)(*(void *)(a1 + 32) + 3280) setAlpha:0.0];
    }
  }
  else
  {
    if (([*(id *)(a1 + 32) updatesDeferred] & 1) != 0
      || ([*(id *)(a1 + 32) suPathsRestricted] & 1) != 0)
    {
      double v6 = *(void **)(*(void *)(a1 + 32) + 3272);
      id v7 = (id)[*(id *)(a1 + 32) upToDateManagedText];
      objc_msgSend(v6, "setText:");
    }
    else if (*(_DWORD *)(a1 + 40) == 4)
    {
      BOOL v4 = *(void **)(*(void *)(a1 + 32) + 3272);
      id v5 = (id)[*(id *)(a1 + 32) upToDateWithAlternate];
      objc_msgSend(v4, "setText:");
    }
    else
    {
      uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 3272);
      id v3 = (id)[*(id *)(a1 + 32) upToDateText];
      objc_msgSend(v2, "setText:");
    }
    [*(id *)(*(void *)(a1 + 32) + 3264) setText:*(void *)(*(void *)(a1 + 32) + 3248)];
    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3264)];
    [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 3272)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 3264), "setAlpha:");
    [*(id *)(*(void *)(a1 + 32) + 3272) setAlpha:1.0];
    [*(id *)(*(void *)(a1 + 32) + 3280) setAlpha:0.0];
  }
}

uint64_t __39__SUSSoftwareUpdateTableView_setState___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(_DWORD *)(*(void *)(result + 32) + 3244) == *(_DWORD *)(result + 40))
  {
    if (*(_DWORD *)(result + 40) == 1)
    {
      return [*(id *)(*(void *)(result + 32) + 3272) removeFromSuperview];
    }
    else if (!*(_DWORD *)(result + 40) || *(_DWORD *)(result + 40) == 3 || *(_DWORD *)(result + 40) == 4)
    {
      [*(id *)(*(void *)(result + 32) + 3280) stopAnimating];
      return [*(id *)(*(void *)(v1 + 32) + 3280) removeFromSuperview];
    }
    else
    {
      [*(id *)(*(void *)(result + 32) + 3264) removeFromSuperview];
      [*(id *)(*(void *)(v1 + 32) + 3272) removeFromSuperview];
      [*(id *)(*(void *)(v1 + 32) + 3280) stopAnimating];
      return [*(id *)(*(void *)(v1 + 32) + 3280) removeFromSuperview];
    }
  }
  return result;
}

- (id)upToDateText
{
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UP_TO_DATE"];
  id v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

- (id)upToDateWithAlternate
{
  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = 0;
  id v11 = (id)[MEMORY[0x263F82670] currentDevice];
  id location = (id)[v11 systemVersion];

  if (location)
  {
    id v10 = (id)[location componentsSeparatedByString:@"."];
    id v2 = (id)[v10 firstObject];
    id v3 = v13[0];
    v13[0] = v2;
  }
  id v5 = NSString;
  id v8 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"UP_TO_DATE_WITH_ALTERNATE"];
  id v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:");
  id v9 = (id)[v5 stringWithFormat:v13[0]];

  objc_storeStrong(&location, 0);
  objc_storeStrong(v13, 0);
  return v9;
}

- (id)upToDateManagedText
{
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = (id)[MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"MANAGED_DEVICE_DELAY_EXPIRED_UNAVAILABLE"];
  id v5 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:");

  return v5;
}

+ (id)stringForState:(int)a3
{
  if (a3)
  {
    uint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if (v3)
  {
    id v6 = @"Unknown";
  }
  else
  {
    switch(v4)
    {
      case 0:
        id v6 = @"SUSSoftwareUpdateTableViewStateIdle";
        break;
      case 1:
        id v6 = @"SUSSoftwareUpdateTableViewStateScanning";
        break;
      case 2:
        id v6 = @"SUSSoftwareUpdateTableViewStateShowingUpdate";
        break;
      case 3:
        id v6 = @"SUSSoftwareUpdateTableViewStateDelayingUpdate";
        break;
      case 4:
        id v6 = @"SUSSoftwareUpdateTableViewStateUpToDateWithAlternate";
        break;
      case 5:
        id v6 = @"SUSSoftwareUpdateTableViewStateAlternateUserInitiatedDownload";
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v6;
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
}

- (NSDate)lastScannedDate
{
  return self->_lastScannedDate;
}

- (void)setLastScannedDate:(id)a3
{
}

- (BOOL)updatesDeferred
{
  return self->_updatesDeferred;
}

- (void)setUpdatesDeferred:(BOOL)a3
{
  self->_updatesDeferred = a3;
}

- (BOOL)suPathsRestricted
{
  return self->_suPathsRestricted;
}

- (void)setSuPathsRestricted:(BOOL)a3
{
  self->_suPathsRestricted = a3;
}

- (UILabel)checkingStatusLabel
{
  return self->_checkingStatusLabel;
}

- (void)setCheckingStatusLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIActivityIndicatorView)checkingForUpdateSpinner
{
  return self->_checkingForUpdateSpinner;
}

- (void)setCheckingForUpdateSpinner:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (BOOL)disableScanUI
{
  return self->_disableScanUI;
}

- (void)setDisableScanUI:(BOOL)a3
{
  self->_disableScanUI = a3;
}

- (void).cxx_destruct
{
}

@end