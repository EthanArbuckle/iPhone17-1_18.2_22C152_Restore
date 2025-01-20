@interface COSSecurePairingPasskeyEntryViewController
- (COSSecurePairingPasskeyEntryViewController)initWithDevice:(id)a3;
- (NRDevice)device;
- (void)enteredPasskey:(id)a3;
- (void)gotPinAndDevice:(id)a3;
- (void)pressedCancel:(id)a3;
- (void)setDevice:(id)a3;
@end

@implementation COSSecurePairingPasskeyEntryViewController

- (COSSecurePairingPasskeyEntryViewController)initWithDevice:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)COSSecurePairingPasskeyEntryViewController;
  v6 = [(COSPasskeyEntryViewController *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"gotPinAndDevice:" name:NRPairedDeviceRegistryDeviceNeedsPasscode object:0];

    v9 = [UIApp bridgeController];
    v10 = +[NRPairedDeviceRegistry sharedInstance];
    uint64_t v19 = NRPairOptionIsAltAccountGizmo;
    v11 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 isTinkerPairing]);
    v20 = v11;
    v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [v10 companionPasscodePairWithDevice:v5 withOptions:v12 operationHasBegun:&stru_1002468B8];

    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v7 action:"pressedCancel:"];
    v14 = [(COSSecurePairingPasskeyEntryViewController *)v7 navigationItem];
    [v14 setHidesBackButton:1];
    [v14 setRightBarButtonItem:v13];
    id v15 = [objc_alloc((Class)BRRTCPairingReportManager) initWithPairingBeginsType:1];
    v16 = [UIApp setupController];
    [v16 setPairingReportManager:v15];
  }
  return v7;
}

- (void)enteredPasskey:(id)a3
{
  id v4 = a3;
  id v5 = +[NRPairedDeviceRegistry sharedInstance];
  v6 = [(COSSecurePairingPasskeyEntryViewController *)self device];
  v7 = [v6 valueForProperty:NRDevicePropertyAdvertisedName];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CD7A4;
  v9[3] = &unk_100246900;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v5 waitForWatchPairingExtendedMetadataForAdvertisedName:v7 completion:v9];
}

- (void)pressedCancel:(id)a3
{
  v3 = pbb_setupflow_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 91;
    __int16 v7 = 2080;
    id v8 = "-[COSSecurePairingPasskeyEntryViewController pressedCancel:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(NEW UHP) %d %s", (uint8_t *)v6, 0x12u);
  }

  id v4 = [UIApp setupController];
  id v5 = [v4 pairingReportManager];

  [v5 addPairingTimeEventToPairingReportPlist:72 withValue:&off_10025C220 withError:0];
  [v5 completePairingMetricWithSuccess:0];
  [UIApp resetSetupFlowAnimated:1 forEvent:43];
}

- (void)gotPinAndDevice:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NRPairedDeviceRegistryDeviceNeedsPasscode object:0];

  v6 = [v4 userInfo];

  __int16 v7 = [v6 objectForKey:NRPairedDeviceRegistryPasscodeKey];
  id v8 = [v6 objectForKey:NRPairedDeviceRegistryDevice];
  v9 = [v8 valueForProperty:NRDevicePropertyAdvertisedName];
  id v10 = pbb_setupflow_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    v20 = v7;
    __int16 v21 = 2112;
    v22 = v8;
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(NEW UHP) Setting paired device (%@ -- %@ -- %@)", (uint8_t *)&v19, 0x20u);
  }

  v11 = PBAdvertisingInfoFromPayload();
  if (v11)
  {
    v12 = +[PBBridgeWatchAttributeController sharedDeviceController];
    id v13 = [v11 objectForKey:PBBridgeAdvertisingMaterialKey];
    [v12 setMaterial:[v13 integerValue]];

    v14 = +[PBBridgeWatchAttributeController sharedDeviceController];
    id v15 = [v11 objectForKey:PBBridgeAdvertisingSizeKey];
    [v14 setInternalSize:[v15 integerValue]];

    v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = +[PBBridgeWatchAttributeController sharedDeviceController];
      objc_super v18 = [v17 attributesDescription];
      int v19 = 138412290;
      v20 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Attempt to pair with: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    v16 = pbb_setupflow_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100174268(v16);
    }
  }

  [UIApp updateActiveWatch:v8];
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end