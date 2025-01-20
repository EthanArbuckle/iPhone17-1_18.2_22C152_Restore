@interface COSProfileTargetDeviceListViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (COSProfileInstallDeviceSwitchTracker)tracker;
- (COSProfileTargetDeviceListViewController)initWithActiveDevice:(id)a3 otherDevices:(id)a4;
- (NRDevice)currentActiveDevice;
- (NSArray)otherDevices;
- (PSBarButtonSpinnerView)spinner;
- (UIBarButtonItem)cancelButton;
- (id)_lastActiveTraditionallyPairedDevices;
- (id)completionBlock;
- (id)specifierForDevice:(id)a3;
- (id)specifiers;
- (void)cancelDeviceSelection:(id)a3;
- (void)presentConnectFailedAlert:(id)a3;
- (void)removeSpinner;
- (void)setCancelButton:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentActiveDevice:(id)a3;
- (void)setOtherDevices:(id)a3;
- (void)setSpinner:(id)a3;
- (void)setTracker:(id)a3;
- (void)switchToDevice:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSProfileTargetDeviceListViewController

- (COSProfileTargetDeviceListViewController)initWithActiveDevice:(id)a3 otherDevices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COSProfileTargetDeviceListViewController;
  v9 = [(COSProfileTargetDeviceListViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currentActiveDevice, a3);
    objc_storeStrong((id *)&v10->_otherDevices, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)COSProfileTargetDeviceListViewController;
  [(COSProfileTargetDeviceListViewController *)&v13 viewWillAppear:a3];
  v4 = [(COSProfileTargetDeviceListViewController *)self navigationItem];
  [v4 setHidesBackButton:1 animated:0];

  if (!self->_cancelButton)
  {
    id v5 = objc_alloc((Class)UIBarButtonItem);
    v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_100249230 table:@"Localizable"];
    id v8 = (UIBarButtonItem *)[v5 initWithTitle:v7 style:0 target:self action:"cancelDeviceSelection:"];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v8;

    v10 = [(COSProfileTargetDeviceListViewController *)self navigationItem];
    [v10 setRightBarButtonItem:self->_cancelButton animated:0];
  }
  v11 = +[NSBundle mainBundle];
  objc_super v12 = [v11 localizedStringForKey:@"SELECT_WATCH" value:&stru_100249230 table:@"Localizable-tinker"];
  [(COSProfileTargetDeviceListViewController *)self setTitle:v12];
}

- (void)cancelDeviceSelection:(id)a3
{
  v4 = pbb_setup_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = "-[COSProfileTargetDeviceListViewController cancelDeviceSelection:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  tracker = self->_tracker;
  if (tracker) {
    [(COSProfileInstallDeviceSwitchTracker *)tracker rollback];
  }
  v6 = [(COSProfileTargetDeviceListViewController *)self completionBlock];
  v6[2](v6, 0);
}

- (id)specifierForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NRDevicePropertyName;
  v6 = [v4 valueForProperty:NRDevicePropertyName];
  int v7 = v6;
  if (v4 && [v6 length])
  {
    id v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding %@", buf, 0xCu);
    }

    v9 = [v4 valueForProperty:v5];
    v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:objc_opt_class() cell:-1 edit:0];

    [v10 setProperty:v4 forKey:@"COSAssociatedDevice"];
    [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v10 setProperty:&__kCFBooleanTrue forKey:@"COSPairedDeviceListTableCellEnabled"];
    v11 = +[NSNumber numberWithDouble:UITableViewAutomaticDimension];
    [v10 setProperty:v11 forKey:PSTableCellHeightKey];

    [v10 setProperty:&off_10025C2F8 forKey:@"COSDeviceState"];
  }
  else
  {
    objc_super v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[COSProfileTargetDeviceListViewController specifierForDevice:]";
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Device is not valid. (%@)", buf, 0x16u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_lastActiveTraditionallyPairedDevices
{
  v2 = sub_100005DC4();
  v3 = [v2 sortedArrayUsingComparator:&stru_1002474D0];

  id v4 = [v3 lastObject];

  return v4;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  id v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    v6 = [(COSProfileTargetDeviceListViewController *)self _lastActiveTraditionallyPairedDevices];
    currentActiveDevice = self->_currentActiveDevice;
    self->_currentActiveDevice = v6;

    id v8 = sub_100033778();
    v9 = [(COSProfileTargetDeviceListViewController *)self specifierForDevice:self->_currentActiveDevice];
    if (v9)
    {
      v10 = pbb_bridge_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding controller for default paired device.", buf, 2u);
      }

      v11 = +[PSSpecifier groupSpecifierWithID:@"DeviceListGroup"];
      [v5 addObject:v11];

      [v5 addObject:v9];
    }
    if ([(NSArray *)self->_otherDevices count])
    {
      objc_super v12 = +[NSBundle mainBundle];
      objc_super v13 = [v12 localizedStringForKey:@"SATELLITE_PAIRED_GROUP_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
      v14 = +[PSSpecifier groupSpecifierWithName:v13];

      [v5 addObject:v14];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v23 = v8;
      id v15 = v8;
      id v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v25;
        do
        {
          v19 = 0;
          v20 = v9;
          do
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v15);
            }
            v9 = [(COSProfileTargetDeviceListViewController *)self specifierForDevice:*(void *)(*((void *)&v24 + 1) + 8 * (void)v19)];

            if (v9) {
              [v5 addObject:v9];
            }
            v19 = (char *)v19 + 1;
            v20 = v9;
          }
          while (v17 != v19);
          id v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v17);
      }

      id v8 = v23;
    }
    v21 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    id v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)COSProfileTargetDeviceListViewController;
  id v6 = a4;
  [(COSProfileTargetDeviceListViewController *)&v12 tableView:a3 didSelectRowAtIndexPath:v6];
  int v7 = -[COSProfileTargetDeviceListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v12.receiver, v12.super_class);

  id v8 = [v7 propertyForKey:@"COSAssociatedDevice"];
  [(COSProfileTargetDeviceListViewController *)self switchToDevice:v8];
  v9 = (PSBarButtonSpinnerView *)objc_alloc_init((Class)PSBarButtonSpinnerView);
  spinner = self->_spinner;
  self->_spinner = v9;

  v11 = [(COSProfileTargetDeviceListViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:self->_spinner animated:0];

  [(PSBarButtonSpinnerView *)self->_spinner startAnimating];
}

- (void)switchToDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v24 = "-[COSProfileTargetDeviceListViewController switchToDevice:]";
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  id v6 = [v4 valueForProperty:NRDevicePropertyIsActive];
  unsigned int v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 pairingID];
      *(_DWORD *)buf = 138412290;
      long long v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User selected active watch (%@). No need to switch.", buf, 0xCu);
    }
    id v10 = objc_loadWeakRetained(&location);
    v11 = [v10 completionBlock];
    v11[2](v11, 1);
  }
  else
  {
    objc_super v12 = pbb_bridge_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v13 = [v4 pairingID];
      *(_DWORD *)buf = 138412290;
      long long v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User selected inactive watch (%@). Starting switch.", buf, 0xCu);
    }
    id v14 = objc_loadWeakRetained(&location);
    id v15 = [v14 currentActiveDevice];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10010C14C;
    v19[3] = &unk_100245550;
    objc_copyWeak(&v21, &location);
    id v20 = v4;
    uint64_t v16 = +[COSProfileInstallDeviceSwitchTracker selectDevice:v20 currentDevice:v15 completionBlock:v19];
    p_tracker = (id *)&self->_tracker;
    id v18 = *p_tracker;
    id *p_tracker = (id)v16;

    [*p_tracker connectToDevice];
    objc_destroyWeak(&v21);
  }
  objc_destroyWeak(&location);
}

- (void)removeSpinner
{
  [(COSProfileTargetDeviceListViewController *)self setSpinner:0];
  id v3 = [(COSProfileTargetDeviceListViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0 animated:0];
}

- (void)presentConnectFailedAlert:(id)a3
{
  id v4 = (char *)a3;
  uint64_t v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[COSProfileTargetDeviceListViewController presentConnectFailedAlert:]";
    __int16 v21 = 2112;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: %@", buf, 0x16u);
  }

  id v6 = pbb_bridge_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Displaying alert for connection failed to %@.", buf, 0xCu);
  }

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"TINKER_SWITCH_TIMEOUT_TITLE" value:&stru_100249230 table:@"Localizable-tinker"];
  v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"TINKER_SWITCH_TIMEOUT_MESSAGE_%@" value:&stru_100249230 table:@"Localizable-tinker"];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v4);
  objc_super v12 = +[UIAlertController alertControllerWithTitle:v8 message:v11 preferredStyle:1];

  objc_super v13 = +[NSBundle mainBundle];
  id v14 = [v13 localizedStringForKey:@"OK" value:&stru_100249230 table:@"Localizable"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10010C704;
  v17[3] = &unk_100247320;
  v17[4] = self;
  id v18 = v4;
  id v15 = v4;
  uint64_t v16 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v17];
  [v12 addAction:v16];

  [(COSProfileTargetDeviceListViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (NRDevice)currentActiveDevice
{
  return (NRDevice *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCurrentActiveDevice:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (NSArray)otherDevices
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setOtherDevices:(id)a3
{
}

- (COSProfileInstallDeviceSwitchTracker)tracker
{
  return (COSProfileInstallDeviceSwitchTracker *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTracker:(id)a3
{
}

- (PSBarButtonSpinnerView)spinner
{
  return (PSBarButtonSpinnerView *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_otherDevices, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_currentActiveDevice, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end