@interface SBActivationInfoViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)mobileEquipmentInfo;
- (SBActivationInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)regulatoryInfoButton;
- (_UILegibilitySettings)legibilitySettings;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_activationInfoCell;
- (id)_backgroundViewForHeaderView:(id)a3;
- (id)_formattedEID:(id)a3;
- (id)_formattedICCID:(id)a3;
- (id)_formattedIMEI:(id)a3;
- (id)_formattedString:(id)a3 withSpaceAfterDigits:(unint64_t)a4;
- (id)_processDeviceInfo;
- (id)_processMobileEquipmentInfo:(id)a3;
- (id)_processMobileSubscriptionInfo;
- (id)_titleForHeaderInSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_telephonyStateChanged;
- (void)_updateMobileEquipmentInfo;
- (void)dealloc;
- (void)loadView;
- (void)mobileEquipmentInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)setLegibilitySettings:(id)a3;
- (void)setMobileEquipmentInfo:(id)a3;
- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBActivationInfoViewController

- (SBActivationInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBActivationInfoViewController;
  v4 = [(SBActivationInfoViewController *)&v10 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [(id)SBApp telephonyStateProvider];
    [v5 addObserver:v4];

    uint64_t v6 = MGCopyAnswer();
    serial = v4->_serial;
    if (v6) {
      v8 = (NSString *)v6;
    }
    else {
      v8 = 0;
    }
    v4->_serial = v8;

    [(SBActivationInfoViewController *)v4 _updateMobileEquipmentInfo];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(id)SBApp telephonyStateProvider];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBActivationInfoViewController;
  [(SBActivationInfoViewController *)&v4 dealloc];
}

- (void)loadView
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  objc_super v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  activationInfoTableView = self->_activationInfoTableView;
  self->_activationInfoTableView = v4;

  uint64_t v6 = self->_activationInfoTableView;
  v7 = [MEMORY[0x1E4F428B8] clearColor];
  [(UITableView *)v6 setBackgroundColor:v7];

  [(UITableView *)self->_activationInfoTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITableView *)self->_activationInfoTableView setBounces:0];
  [(UITableView *)self->_activationInfoTableView setSectionFooterHeight:0.0];
  v8 = self->_activationInfoTableView;
  v9 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [(UITableView *)v8 setSeparatorColor:v9];

  [(UITableView *)self->_activationInfoTableView setDataSource:self];
  [(UITableView *)self->_activationInfoTableView setDelegate:self];
  [(UITableView *)self->_activationInfoTableView reloadData];
  [(UITableView *)self->_activationInfoTableView sizeToFit];
  objc_super v10 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  regulatoryInfoButton = self->_regulatoryInfoButton;
  self->_regulatoryInfoButton = v10;

  [(UIButton *)self->_regulatoryInfoButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = self->_regulatoryInfoButton;
  v13 = [MEMORY[0x1E4F28B50] mainBundle];
  v14 = [v13 localizedStringForKey:@"REGULATORY_INFO_BUTTON_LABEL" value:@"Regulatory" table:@"SpringBoard"];
  [(UIButton *)v12 setTitle:v14 forState:0];

  if (_os_feature_enabled_impl())
  {
    v15 = self->_regulatoryInfoButton;
    v16 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
    [(UIButton *)v15 setTintColor:v16];
  }
  [(UIButton *)self->_regulatoryInfoButton sizeToFit];
  id v17 = objc_alloc(MEMORY[0x1E4F42E20]);
  v18 = self->_regulatoryInfoButton;
  v38[0] = self->_activationInfoTableView;
  v38[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  v20 = (void *)[v17 initWithArrangedSubviews:v19];

  [v20 setAxis:1];
  [v20 setAlignment:3];
  [v20 setDistribution:3];
  [v20 setSpacing:24.0];
  objc_storeStrong((id *)&self->_containerView, v20);
  -[UIView systemLayoutSizeFittingSize:](self->_containerView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  double v22 = v21;
  v23 = [(UITableView *)self->_activationInfoTableView heightAnchor];
  [(UITableView *)self->_activationInfoTableView contentSize];
  v25 = [v23 constraintEqualToConstant:v22 + v24];

  LODWORD(v26) = 1132068864;
  [v25 setPriority:v26];
  objc_storeStrong((id *)&self->_activationInfoTableViewHeight, v25);
  v27 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v29 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v29 readableWidth];
    double v31 = v30;
  }
  else
  {
    v29 = [MEMORY[0x1E4F42D90] mainScreen];
    [v29 bounds];
    double v31 = v32;
  }

  v33 = [(UITableView *)self->_activationInfoTableView widthAnchor];
  v34 = [v33 constraintEqualToConstant:v31];

  [(SBActivationInfoViewController *)self setView:self->_containerView];
  v35 = (void *)MEMORY[0x1E4F28DC8];
  v37[0] = v34;
  v37[1] = v25;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  [v35 activateConstraints:v36];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBActivationInfoViewController;
  [(SBActivationInfoViewController *)&v4 viewWillAppear:a3];
  [(UITableView *)self->_activationInfoTableView reloadData];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBActivationInfoViewController;
  [(SBActivationInfoViewController *)&v5 viewDidLayoutSubviews];
  activationInfoTableViewHeight = self->_activationInfoTableViewHeight;
  [(UITableView *)self->_activationInfoTableView contentSize];
  [(NSLayoutConstraint *)activationInfoTableViewHeight setConstant:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)subscriptionInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__SBActivationInfoViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __81__SBActivationInfoViewController_subscriptionInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telephonyStateChanged];
}

- (void)mobileEquipmentInfoDidChangeForStateProvider:(id)a3 slot:(int64_t)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SBActivationInfoViewController_mobileEquipmentInfoDidChangeForStateProvider_slot___block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__SBActivationInfoViewController_mobileEquipmentInfoDidChangeForStateProvider_slot___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _telephonyStateChanged];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4 = [(NSArray *)self->_mobileEquipmentInfo objectAtIndexedSubscript:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"ACTIVATION_INFO_CELL_ID"];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(SBActivationInfoViewController *)self _activationInfoCell];
  }
  objc_super v10 = v9;

  uint64_t v11 = [v6 section];
  uint64_t v12 = [v6 row];

  v13 = [(NSArray *)self->_mobileEquipmentInfo objectAtIndexedSubscript:v11];
  v14 = [v13 allKeys];
  v15 = [v14 objectAtIndexedSubscript:v12];
  v16 = [v13 objectForKeyedSubscript:v15];
  id v17 = [v10 textLabel];
  v18 = [v15 stringByReplacingOccurrencesOfString:@":" withString:&stru_1F3084718];
  [v17 setText:v18];

  v19 = [v10 detailTextLabel];
  [v19 setAdjustsFontSizeToFitWidth:1];

  v20 = [v10 detailTextLabel];
  [v20 setMinimumScaleFactor:0.5];

  double v21 = [v10 detailTextLabel];
  [v21 setText:v16];

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_mobileEquipmentInfo count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.22507386e-308;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = [a3 dequeueReusableHeaderFooterViewWithIdentifier:@"ACTIVATION_INFO_HEADER_ID"];
  if (!v6)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F42EB8]) initWithReuseIdentifier:@"ACTIVATION_INFO_HEADER_ID"];
    v7 = [(SBActivationInfoViewController *)self _backgroundViewForHeaderView:v6];
    [v6 setBackgroundView:v7];
  }
  v8 = [v6 textLabel];
  id v9 = [(SBActivationInfoViewController *)self _titleForHeaderInSection:a4];
  [v8 setText:v9];

  return v6;
}

- (void)_telephonyStateChanged
{
  [(SBActivationInfoViewController *)self _updateMobileEquipmentInfo];
  activationInfoTableView = self->_activationInfoTableView;
  [(UITableView *)activationInfoTableView reloadData];
}

- (void)_updateMobileEquipmentInfo
{
  id v19 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[SBTelephonyManager sharedTelephonyManager];
  int v4 = [v3 hasCellularData];

  if (v4)
  {
    int64_t v5 = +[SBTelephonyManager sharedTelephonyManager];
    id v6 = [v5 _primaryMobileEquipmentInfo];

    v7 = [v6 MEID];
    meid = self->_meid;
    self->_meid = v7;

    if (v6)
    {
      id v9 = [(SBActivationInfoViewController *)self _processMobileEquipmentInfo:v6];
      [v19 addObject:v9];
    }
    objc_super v10 = +[SBTelephonyManager sharedTelephonyManager];
    uint64_t v11 = [v10 _secondaryMobileEquipmentInfo];

    if (v11)
    {
      uint64_t v12 = [(SBActivationInfoViewController *)self _processMobileEquipmentInfo:v11];
      [v19 addObject:v12];
    }
    v13 = [(SBActivationInfoViewController *)self _processMobileSubscriptionInfo];
    mobileSubscriptionInfo = self->_mobileSubscriptionInfo;
    self->_mobileSubscriptionInfo = v13;
  }
  v15 = [(SBActivationInfoViewController *)self _processDeviceInfo];
  v16 = v19;
  if (v15)
  {
    [v19 insertObject:v15 atIndex:0];
    v16 = v19;
  }
  id v17 = (NSArray *)[v16 copy];
  mobileEquipmentInfo = self->_mobileEquipmentInfo;
  self->_mobileEquipmentInfo = v17;
}

- (id)_processMobileSubscriptionInfo
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[SBTelephonyManager sharedTelephonyManager];
  int v4 = [v3 _primarySubscriptionInfo];

  if (v4)
  {
    int64_t v5 = [v4 SIMLabel];
    uint64_t v6 = [v5 uppercaseString];
    v7 = (void *)v6;
    v8 = @"PRIMARY";
    if (v6) {
      v8 = (__CFString *)v6;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = @" ";
  }
  objc_super v10 = +[SBTelephonyManager sharedTelephonyManager];
  uint64_t v11 = [v10 _secondarySubscriptionInfo];

  if (v11)
  {
    uint64_t v12 = [v11 SIMLabel];
    uint64_t v13 = [v12 uppercaseString];
    v14 = (void *)v13;
    v15 = @"SECONDARY";
    if (v13) {
      v15 = (__CFString *)v13;
    }
    v16 = v15;

    [v2 addObject:v9];
    [v2 addObject:v16];
  }
  else
  {

    id v9 = @" ";
    [v2 addObject:@" "];
  }
  id v17 = (void *)[v2 copy];

  return v17;
}

- (id)_processMobileEquipmentInfo:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  uint64_t v6 = [v4 dictionary];
  v7 = [v5 IMEI];
  v8 = [v5 ICCID];
  id v9 = [v5 CSN];
  char v10 = [v5 isOnBootstrap];

  if (v7)
  {
    uint64_t v11 = [(SBActivationInfoViewController *)self _formattedIMEI:v7];
    if (![v11 length])
    {
      uint64_t v12 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"NO_NAME" value:&stru_1F3084718 table:@"SpringBoard"];

      uint64_t v11 = (void *)v13;
    }
    [v6 setObject:v11 forKey:@"IMEI:"];
    v14 = [(SBActivationInfoViewController *)self _formattedEID:v9];
    if (v14) {
      [v6 setObject:v14 forKey:@"EID:"];
    }
    if ((v10 & 1) == 0)
    {
      v15 = [(SBActivationInfoViewController *)self _formattedICCID:v8];
      if (![v15 length])
      {
        v16 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v17 = [v16 localizedStringForKey:@"NO_NAME" value:&stru_1F3084718 table:@"SpringBoard"];

        v15 = (void *)v17;
      }
      [v6 setObject:v15 forKey:@"ICCID:"];
    }
  }
  v18 = (void *)[v6 copy];

  return v18;
}

- (id)_processDeviceInfo
{
  if (self->_serial || self->_meid)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    meid = self->_meid;
    if (meid)
    {
      id v5 = meid;
      if (![(NSString *)v5 length])
      {
        uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v7 = [v6 localizedStringForKey:@"NO_NAME" value:&stru_1F3084718 table:@"SpringBoard"];

        id v5 = (NSString *)v7;
      }
      [v3 setObject:v5 forKey:@"MEID:"];
    }
    serial = self->_serial;
    if (serial)
    {
      id v9 = serial;
      if (![(NSString *)v9 length])
      {
        char v10 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v11 = [v10 localizedStringForKey:@"NO_NAME" value:&stru_1F3084718 table:@"SpringBoard"];

        id v9 = (NSString *)v11;
      }
      [v3 setObject:v9 forKey:@"SN:"];
    }
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  if (a3)
  {
    int v4 = [(NSArray *)self->_mobileSubscriptionInfo objectAtIndexedSubscript:a3 - 1];
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)_activationInfoCell
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:1 reuseIdentifier:@"ACTIVATION_INFO_CELL_ID"];
  int v4 = [MEMORY[0x1E4F428B8] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setSelectionStyle:0];
  id v5 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
  uint64_t v6 = [v3 textLabel];
  [v6 setFont:v5];

  uint64_t v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  v8 = [v3 detailTextLabel];
  [v8 setFont:v7];

  id v9 = [v3 textLabel];
  char v10 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [v9 setTextColor:v10];

  uint64_t v11 = [v3 detailTextLabel];
  uint64_t v12 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  [v11 setTextColor:v12];

  return v3;
}

- (id)_backgroundViewForHeaderView:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v4 = a3;
  id v5 = [v3 alloc];
  [v4 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = objc_msgSend(v5, "initWithFrame:", v7, v9, v11, v13);
  v15 = [MEMORY[0x1E4F428B8] clearColor];
  [v14 setBackgroundColor:v15];

  return v14;
}

- (id)_formattedICCID:(id)a3
{
  return [(SBActivationInfoViewController *)self _formattedString:a3 withSpaceAfterDigits:4];
}

- (id)_formattedIMEI:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  if ((unint64_t)[v3 length] >= 3) {
    [v3 insertString:@" " atIndex:2];
  }
  if ((unint64_t)[v3 length] >= 0xA) {
    [v3 insertString:@" " atIndex:9];
  }
  if ((unint64_t)[v3 length] >= 0x11) {
    [v3 insertString:@" " atIndex:16];
  }
  return v3;
}

- (id)_formattedEID:(id)a3
{
  return [(SBActivationInfoViewController *)self _formattedString:a3 withSpaceAfterDigits:8];
}

- (id)_formattedString:(id)a3 withSpaceAfterDigits:(unint64_t)a4
{
  id v5 = a3;
  double v6 = v5;
  if (v5)
  {
    double v7 = (void *)[v5 mutableCopy];
    if ([v6 length] >= a4)
    {
      unint64_t v8 = [v6 length];
      if (v8 > a4)
      {
        unint64_t v9 = v8;
        unint64_t v10 = a4;
        unint64_t v11 = a4;
        do
        {
          [v7 insertString:@" " atIndex:v10];
          v11 += a4;
          v10 += a4 + 1;
        }
        while (v11 < v9);
      }
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (NSArray)mobileEquipmentInfo
{
  return self->_mobileEquipmentInfo;
}

- (void)setMobileEquipmentInfo:(id)a3
{
}

- (UIButton)regulatoryInfoButton
{
  return self->_regulatoryInfoButton;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_regulatoryInfoButton, 0);
  objc_storeStrong((id *)&self->_activationInfoTableViewHeight, 0);
  objc_storeStrong((id *)&self->_activationInfoTableView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_mobileSubscriptionInfo, 0);
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, 0);
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_meid, 0);
}

@end