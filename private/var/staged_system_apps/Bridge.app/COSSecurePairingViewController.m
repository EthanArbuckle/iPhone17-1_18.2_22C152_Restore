@interface COSSecurePairingViewController
- (BOOL)updateDiscoveredDevices;
- (Class)headerClass;
- (id)_discoveredNRDeviceForAdvertisedName:(id)a3;
- (id)cellNameForRow:(int64_t)a3;
- (id)didSelectRowAtIndexPath:(id)a3;
- (void)beginDiscovery;
- (void)endDiscovery;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation COSSecurePairingViewController

- (Class)headerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)updateDiscoveredDevices
{
  v3 = [(COSManualPairingViewController *)self displayedDeviceNames];
  v4 = +[NSMutableSet setWithArray:v3];

  v5 = +[NRDeviceDiscoveryController sharedInstance];
  v6 = [v5 devices];

  v7 = pbb_setupflow_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Get fresh list of %@ devices from NR", buf, 0xCu);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v12 = v10;
    char v13 = 0;
    uint64_t v14 = *(void *)v23;
    uint64_t v15 = NRDevicePropertyAdvertisedName;
    *(void *)&long long v11 = 138543362;
    long long v21 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v9);
        }
        v17 = [*(id *)(*((void *)&v22 + 1) + 8 * i) valueForProperty:v15 v21];
        if (v17 && ([v4 containsObject:v17] & 1) == 0)
        {
          v18 = pbb_setupflow_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            v28 = v17;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to displayed list", buf, 0xCu);
          }

          v19 = [(COSManualPairingViewController *)self displayedDeviceNames];
          [v19 addObject:v17];

          char v13 = 1;
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

- (void)beginDiscovery
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[[NRDeviceDiscoveryController sharedInstance] begin]", v4, 2u);
  }

  v3 = +[NRDeviceDiscoveryController sharedInstance];
  [v3 begin];
}

- (void)endDiscovery
{
  v2 = pbb_setupflow_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[[NRDeviceDiscoveryController sharedInstance] end]", v4, 2u);
  }

  v3 = +[NRDeviceDiscoveryController sharedInstance];
  [v3 end];
}

- (id)cellNameForRow:(int64_t)a3
{
  v4 = [(COSManualPairingViewController *)self displayedDeviceNames];
  v5 = [v4 objectAtIndex:a3];

  v6 = PBAdvertisingInfoFromPayload();
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"MANUAL_PAIRING_WATCH_DISPLAY_NAME_%@" value:&stru_100249230 table:@"Localizable"];
  id v9 = [v6 objectForKeyedSubscript:PBBridgeAdvertisingNameKey];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);

  return v10;
}

- (id)_discoveredNRDeviceForAdvertisedName:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = +[NRPairedDeviceRegistry sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100127CC4;
    v8[3] = &unk_100246170;
    id v9 = v3;
    v5 = [v4 getAllDevicesWithArchivedDevicesMatching:v8];

    v6 = [v5 firstObject];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)didSelectRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(COSManualPairingViewController *)self displayedDeviceNames];
  id v6 = [v4 row];

  v7 = [v5 objectAtIndex:v6];

  v8 = [(COSSecurePairingViewController *)self _discoveredNRDeviceForAdvertisedName:v7];
  if (v8) {
    id v9 = [[COSSecurePairingPasskeyEntryViewController alloc] initWithDevice:v8];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(COSManualPairingViewController *)self displayedDeviceNames];
  id v9 = [v8 objectAtIndex:[v6 row]];

  id v10 = [(COSSecurePairingViewController *)self _discoveredNRDeviceForAdvertisedName:v9];
  if (v10)
  {
    v11.receiver = self;
    v11.super_class = (Class)COSSecurePairingViewController;
    [(COSManualPairingViewController *)&v11 tableView:v7 didSelectRowAtIndexPath:v6];
  }
  else
  {
    [v7 deselectRowAtIndexPath:v6 animated:0];
  }
}

@end