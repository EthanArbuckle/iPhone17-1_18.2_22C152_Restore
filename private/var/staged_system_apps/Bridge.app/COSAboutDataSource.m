@interface COSAboutDataSource
+ (BOOL)useConnectedDevice;
- (BOOL)deviceHasCellularCapability;
- (BOOL)displayNetworkProgressIndicator;
- (BOOL)errorOccurredFetchingAboutInfo;
- (BOOL)errorOccurredFetchingRemoteBundleInfo;
- (BOOL)errorOccurredFetchingUsageData;
- (BOOL)hasFetchedAboutInfo;
- (BOOL)hasFetchedRemoteBundleInfo;
- (BOOL)hasFetchedUsageData;
- (BOOL)hasReceivedCellularPlanUpdate;
- (BOOL)hasStartedFetchingInfo;
- (BOOL)shouldQueryWatchForDetails;
- (BOOL)showMarketingBehaviorDescription;
- (BOOL)showRegulatoryModelNumber;
- (COSAboutDataSource)init;
- (NDOACController)ndoController;
- (NRDevice)device;
- (NSArray)simICCIDs;
- (NSNumber)numberOfApps;
- (NSNumber)numberOfPhotos;
- (NSNumber)numberOfSongs;
- (NSSManager)nssManager;
- (NSString)carrierName;
- (NSString)carrierVersion;
- (OS_dispatch_queue)ctQueue;
- (__CTServerConnection)ctConnection;
- (id)dash;
- (id)getBTAddress:(id)a3;
- (id)getCarrierInfo:(id)a3;
- (id)getDeviceDetail:(id)a3;
- (id)getDeviceModel:(id)a3;
- (id)getDeviceName:(id)a3;
- (id)getICCID:(id)a3;
- (id)getIMEI:(id)a3;
- (id)getLocalizedArtworkDeviceDescription:(id)a3;
- (id)getNumberOfApps:(id)a3;
- (id)getNumberOfPhotos:(id)a3;
- (id)getNumberOfSongs:(id)a3;
- (id)getSerialNumber:(id)a3;
- (id)getStorageAvailable:(id)a3;
- (id)getStorageCapacity:(id)a3;
- (id)getSystemVersion:(id)a3;
- (id)getWiFiAddress:(id)a3;
- (id)guardedUint64StringValue:(unint64_t)a3;
- (id)specifiersForSpecifier:(id)a3 observer:(id)a4;
- (unint64_t)iccidDisplayIndex;
- (unint64_t)storageAvailable;
- (unint64_t)storageCapacity;
- (void)cellularPlanInfoDidChange:(id)a3;
- (void)checkDeviceHasCellularCapability;
- (void)dealloc;
- (void)displayNetworkActivityIndicator:(BOOL)a3;
- (void)handleAboutInfo:(id)a3 error:(id)a4;
- (void)handleRemoteBundleInfo:(id)a3 success:(BOOL)a4;
- (void)handleRetrievedICCIDs:(id)a3;
- (void)handleUsageData:(id)a3 error:(id)a4;
- (void)hideNetworkActivityIndicatorOnceRemoteQueriesHaveCompleted;
- (void)loadSpecifiers;
- (void)queryDevice;
- (void)setCarrierName:(id)a3;
- (void)setCarrierVersion:(id)a3;
- (void)setCtConnection:(__CTServerConnection *)a3;
- (void)setCtQueue:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceHasCellularCapability:(BOOL)a3;
- (void)setDeviceName:(id)a3 specifier:(id)a4;
- (void)setDisplayNetworkProgressIndicator:(BOOL)a3;
- (void)setErrorOccurredFetchingAboutInfo:(BOOL)a3;
- (void)setErrorOccurredFetchingRemoteBundleInfo:(BOOL)a3;
- (void)setErrorOccurredFetchingUsageData:(BOOL)a3;
- (void)setHasFetchedAboutInfo:(BOOL)a3;
- (void)setHasFetchedRemoteBundleInfo:(BOOL)a3;
- (void)setHasFetchedUsageData:(BOOL)a3;
- (void)setHasReceivedCellularPlanUpdate:(BOOL)a3;
- (void)setHasStartedFetchingInfo:(BOOL)a3;
- (void)setIccidDisplayIndex:(unint64_t)a3;
- (void)setNdoController:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setNumberOfApps:(id)a3;
- (void)setNumberOfPhotos:(id)a3;
- (void)setNumberOfSongs:(id)a3;
- (void)setShowMarketingBehaviorDescription:(BOOL)a3;
- (void)setShowRegulatoryModelNumber:(BOOL)a3;
- (void)setSimICCIDs:(id)a3;
- (void)setStorageAvailable:(unint64_t)a3;
- (void)setStorageCapacity:(unint64_t)a3;
- (void)showUserManual:(id)a3;
- (void)tappedAppleLegalLink;
- (void)updateDeviceDetailSpecifier:(id)a3;
- (void)updateICCIDSpecifier:(id)a3;
- (void)updateModelSpecifier:(id)a3;
@end

@implementation COSAboutDataSource

+ (BOOL)useConnectedDevice
{
  return 1;
}

- (BOOL)shouldQueryWatchForDetails
{
  return 1;
}

- (COSAboutDataSource)init
{
  v18.receiver = self;
  v18.super_class = (Class)COSAboutDataSource;
  v2 = [(COSAboutDataSource *)&v18 init];
  if (v2 && [(id)objc_opt_class() useConnectedDevice])
  {
    uint64_t v3 = sub_10000DCF4();
    device = v2->_device;
    v2->_device = (NRDevice *)v3;

    if (_os_feature_enabled_impl())
    {
      v5 = [(NRDevice *)v2->_device valueForProperty:NRDevicePropertySerialNumber];
      if (v5)
      {
        v6 = (NDOACController *)[objc_alloc((Class)NDOACController) initWithSerialNumber:v5];
        ndoController = v2->_ndoController;
        v2->_ndoController = v6;
      }
    }
    [(COSAboutDataSource *)v2 checkDeviceHasCellularCapability];
    if (v2->_deviceHasCellularCapability)
    {
      v8 = +[NSNotificationCenter defaultCenter];
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      v9 = (id *)qword_10029B018;
      uint64_t v27 = qword_10029B018;
      if (!qword_10029B018)
      {
        v19 = _NSConcreteStackBlock;
        uint64_t v20 = 3221225472;
        v21 = sub_10005B878;
        v22 = &unk_1002436A8;
        v23 = &v24;
        v10 = (void *)sub_100016154();
        v11 = dlsym(v10, "NPHCellularPlanInfoDidChangeNotification");
        *(void *)(v23[1] + 24) = v11;
        qword_10029B018 = *(void *)(v23[1] + 24);
        v9 = (id *)v25[3];
      }
      _Block_object_dispose(&v24, 8);
      if (!v9)
      {
        v17 = (_Unwind_Exception *)sub_100171A7C();
        _Block_object_dispose(&v24, 8);
        _Unwind_Resume(v17);
      }
      id v12 = *v9;
      v13 = [sub_10000636C() sharedInstance];
      [v8 addObserver:v2 selector:"cellularPlanInfoDidChange:" name:v12 object:v13];
    }
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.Bridge.CoreTelephony", 0);
    ctQueue = v2->_ctQueue;
    v2->_ctQueue = (OS_dispatch_queue *)v14;
  }
  return v2;
}

- (void)dealloc
{
  [(COSAboutDataSource *)self displayNetworkActivityIndicator:0];
  ctConnection = self->_ctConnection;
  if (ctConnection)
  {
    CFRelease(ctConnection);
    self->_ctConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)COSAboutDataSource;
  [(COSAboutDataSource *)&v4 dealloc];
}

- (void)checkDeviceHasCellularCapability
{
  self->_deviceHasCellularCapability = BPSDeviceHasCellularDataCapability();
}

- (id)specifiersForSpecifier:(id)a3 observer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 observerType] == (id)1)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100058490;
    block[3] = &unk_1002439E0;
    objc_copyWeak(&v12, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v10.receiver = self;
  v10.super_class = (Class)COSAboutDataSource;
  v8 = [(COSAboutDataSource *)&v10 specifiersForSpecifier:v6 observer:v7];

  return v8;
}

- (void)loadSpecifiers
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"About" inBundle:v3 target:self stringsTable:@"About"];
  id v5 = [v4 mutableCopy];

  uint64_t v6 = [v5 specifierForID:@"OS_VERSION_CELL_ID"];
  id v7 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyArtworkTraits];
  v63 = v7;
  if (v7)
  {
    v8 = [v7 valueForKey:@"ArtworkDeviceProductDescription"];
  }
  else
  {
    v8 = 0;
  }
  v9 = [v5 specifierForID:@"DEVICE_DETAIL_CELL_ID"];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = PSCellClassKey;
  v62 = v9;
  [v9 setProperty:v10 forKey:PSCellClassKey];
  id v12 = ASDPurchase_ptr;
  if ([v8 length])
  {
    v13 = pbb_bridge_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found Artwork Device Description: %@", buf, 0xCu);
    }

    dispatch_queue_t v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"DEVICE_MODEL_ART_NAME" value:&stru_100249230 table:@"About"];
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:"getLocalizedArtworkDeviceDescription:" detail:0 cell:4 edit:0];

    [v16 setProperty:objc_opt_class() forKey:v11];
    [v16 setProperty:v8 forKey:@"artworkDeviceDescription"];
    [v16 setIdentifier:@"DEVICE_MARKETING_NAME_CELL_ID"];
    [v16 setProperty:&__kCFBooleanTrue forKey:PSCopyableCellKey];
    [v5 ps_insertObject:v16 afterObject:v6];
  }
  v64 = (void *)v6;
  v17 = [v5 specifierForID:@"DEVICE_WIFI_ADDRESS_CELL_ID"];
  objc_super v18 = +[NSBundle mainBundle];
  v19 = SFLocalizableWAPIStringKeyForKey();
  uint64_t v20 = [v18 localizedStringForKey:v19 value:&stru_100249230 table:@"About"];
  v61 = v17;
  [v17 setName:v20];

  v21 = [v5 specifierForID:@"LEGAL_GROUP_CELL_ID"];
  if ([(id)objc_opt_class() useConnectedDevice])
  {
    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"LEGAL_FOOTER" value:&stru_100249230 table:@"About"];
    id v24 = +[NSString stringWithFormat:v23, @"https://www.apple.com/legal/"];

    v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    [v21 setProperty:v26 forKey:PSFooterCellClassGroupKey];

    [v21 setProperty:v24 forKey:PSFooterHyperlinkViewTitleKey];
    v73.id location = (NSUInteger)[v24 rangeOfString:@"https://www.apple.com/legal/"];
    uint64_t v27 = NSStringFromRange(v73);
    [v21 setProperty:v27 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v28 = +[NSValue valueWithNonretainedObject:self];
    [v21 setProperty:v28 forKey:PSFooterHyperlinkViewTargetKey];

    [v21 setProperty:@"tappedAppleLegalLink" forKey:PSFooterHyperlinkViewActionKey];
  }
  else
  {
    v70[0] = @"ABOUT_GROUP_ID";
    v70[1] = @"DEVICE_STORAGE_GROUP_ID";
    v70[2] = @"SONGS_CELL_ID";
    v70[3] = @"PHOTOS_CELL_ID";
    v70[4] = @"APPLICATIONS_CELL_ID";
    v70[5] = @"STORAGE_CAPACITY_CELL_ID";
    v70[6] = @"STORAGE_AVAILABLE_CELL_ID";
    v70[7] = @"SHOW_MANUAL_GROUP_ID";
    v70[8] = @"SHOW_MANUAL_CELL_ID";
    v70[9] = @"LEGAL_GROUP_CELL_ID";
    v70[10] = @"LEGAL_CELL_ID";
    +[NSArray arrayWithObjects:v70 count:11];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = [v24 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v66;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v66 != v31) {
            objc_enumerationMutation(v24);
          }
          v33 = [v5 specifierForID:*(void *)(*((void *)&v65 + 1) + 8 * i)];
          [v5 removeObject:v33];
        }
        id v30 = [v24 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v30);
    }

    v34 = [v5 specifierForID:@"NAME_CELL_ID"];
    [v34 setDetailControllerClass:0];
    [v34 setCellType:4];
  }
  if (self->_deviceHasCellularCapability)
  {
    v60 = v8;
    v35 = ASDPurchase_ptr;
    if ([(id)objc_opt_class() useConnectedDevice])
    {
      v36 = [v5 specifierForID:@"DEVICE_TECH_DETAILS_GROUP_ID"];
      v37 = +[NSBundle mainBundle];
      v38 = [v37 localizedStringForKey:@"CARRIER_INFO" value:&stru_100249230 table:@"About"];
      v39 = +[PSSpecifier preferenceSpecifierNamed:v38 target:self set:0 get:"getCarrierInfo:" detail:0 cell:4 edit:0];

      [v39 setIdentifier:@"CARRIER_CELL_ID"];
      [v5 ps_insertObject:v39 afterObject:v36];
    }
    v40 = [v5 specifierForID:@"DEVICE_BLUETOOTH_ADDRESS_CELL_ID"];
    v41 = +[NSBundle mainBundle];
    v42 = [v41 localizedStringForKey:@"IMEI" value:&stru_100249230 table:@"About"];
    v43 = +[PSSpecifier preferenceSpecifierNamed:v42 target:self set:0 get:"getIMEI:" detail:0 cell:4 edit:0];

    [v43 setIdentifier:@"IMEI_CELL_ID"];
    uint64_t v44 = PSCopyableCellKey;
    [v43 setProperty:&__kCFBooleanTrue forKey:PSCopyableCellKey];
    uint64_t v45 = PSUseHighLegibilityAlternateKey;
    [v43 setProperty:&__kCFBooleanTrue forKey:PSUseHighLegibilityAlternateKey];
    [v5 ps_insertObject:v43 afterObject:v40];
    if ([(id)objc_opt_class() useConnectedDevice])
    {
      v46 = +[NSBundle mainBundle];
      v47 = [v46 localizedStringForKey:@"ICCID" value:&stru_100249230 table:@"About"];
      id v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:0 get:"getICCID:" detail:0 cell:4 edit:0];

      v35 = ASDPurchase_ptr;
      [v48 setIdentifier:@"ICCID_CELL_ID"];
      [v48 setProperty:&__kCFBooleanTrue forKey:v44];
      id v12 = ASDPurchase_ptr;
      [v48 setProperty:&__kCFBooleanTrue forKey:v45];
      [v5 ps_insertObject:v48 afterObject:v43];
    }
    else
    {
      id v48 = v43;
    }
    v49 = v12[223];
    v50 = [v35[116] mainBundle];
    v51 = [v50 localizedStringForKey:@"EID" value:&stru_100249230 table:@"About"];
    v52 = [v49 preferenceSpecifierNamed:v51 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

    [v52 setIdentifier:@"EID_CELL_ID"];
    [v5 ps_insertObject:v52 afterObject:v48];

    v8 = v60;
  }
  if ([(id)objc_opt_class() useConnectedDevice]
    && _os_feature_enabled_impl())
  {
    v53 = [(COSAboutDataSource *)self ndoController];
    [v53 setSpecifierIDToInsertAfter:@"DEVICE_SERIAL_NUMBER_CELL_ID"];

    v54 = [(COSAboutDataSource *)self ndoController];
    v55 = [v54 specifiers];

    if (v55)
    {
      v56 = [(COSAboutDataSource *)self ndoController];
      v57 = [v56 specifierIDToInsertAfter];
      v58 = [v5 specifierForID:v57];

      [v5 ps_insertObjectsFromArray:v55 afterObject:v58];
    }
  }
  v59 = [(COSAboutDataSource *)self specifiers];
  [v59 addObjectsFromArray:v5];
}

- (void)queryDevice
{
  if (!self->_hasStartedFetchingInfo)
  {
    self->_hasStartedFetchingInfo = 1;
    if ([(COSAboutDataSource *)self shouldQueryWatchForDetails])
    {
      [(COSAboutDataSource *)self displayNetworkActivityIndicator:1];
      if (!self->_nssManager)
      {
        id v5 = (NSSManager *)[objc_alloc((Class)NSSManager) initWithQueue:&_dispatch_main_q];
        nssManager = self->_nssManager;
        self->_nssManager = v5;
      }
      objc_initWeak((id *)buf, self);
      id v7 = self->_nssManager;
      if (v7)
      {
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100059534;
        v27[3] = &unk_100243F08;
        objc_copyWeak(&v28, (id *)buf);
        [(NSSManager *)v7 getAboutInfo:v27];
        v8 = self->_nssManager;
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000595AC;
        v25[3] = &unk_100244A20;
        objc_copyWeak(&v26, (id *)buf);
        [(NSSManager *)v8 getUsageData:v25];
        objc_destroyWeak(&v26);
        objc_destroyWeak(&v28);
      }
      else
      {
        [(COSAboutDataSource *)self handleAboutInfo:0 error:0];
        [(COSAboutDataSource *)self handleUsageData:0 error:0];
      }
      objc_destroyWeak((id *)buf);
    }
    if (!self->_deviceHasCellularCapability)
    {
      v2 = pbb_bridge_log();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      uint64_t v3 = "Device not cellular capable. Not querying cellular bundle.";
      goto LABEL_4;
    }
    v2 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyPairingID];
    if (v2)
    {
      v9 = self->_ctQueue;
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x2020000000;
      uint64_t v10 = (uint64_t (*)(const CFAllocatorRef, const __CFString *, OS_dispatch_queue *, void))off_10029B030;
      v32 = off_10029B030;
      if (!off_10029B030)
      {
        *(void *)buf = _NSConcreteStackBlock;
        uint64_t v34 = 3221225472;
        v35 = sub_10005B93C;
        v36 = &unk_1002436A8;
        v37 = &v29;
        uint64_t v11 = (void *)sub_10005B98C();
        id v12 = dlsym(v11, "_CTServerConnectionCreateOnTargetQueue");
        *(void *)(v37[1] + 24) = v12;
        off_10029B030 = *(_UNKNOWN **)(v37[1] + 24);
        uint64_t v10 = (uint64_t (*)(const CFAllocatorRef, const __CFString *, OS_dispatch_queue *, void))v30[3];
      }
      _Block_object_dispose(&v29, 8);
      if (!v10) {
        goto LABEL_39;
      }
      v13 = (__CTServerConnection *)v10(kCFAllocatorDefault, @"com.apple.coremedia", v9, 0);

      self->_ctConnection = v13;
      if (v13)
      {
        uint64_t v24 = 0;
        uint64_t v29 = 0;
        id v30 = &v29;
        uint64_t v31 = 0x2020000000;
        dispatch_queue_t v14 = (uint64_t (*)(__CTServerConnection *, uint64_t *))off_10029B040;
        v32 = off_10029B040;
        if (!off_10029B040)
        {
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v34 = 3221225472;
          v35 = sub_10005BB00;
          v36 = &unk_1002436A8;
          v37 = &v29;
          v15 = (void *)sub_10005B98C();
          v16 = dlsym(v15, "_CTServerConnectionGetRemoteBundleInfo");
          *(void *)(v37[1] + 24) = v16;
          off_10029B040 = *(_UNKNOWN **)(v37[1] + 24);
          dispatch_queue_t v14 = (uint64_t (*)(__CTServerConnection *, uint64_t *))v30[3];
        }
        _Block_object_dispose(&v29, 8);
        if (v14)
        {
          unint64_t v17 = v14(v13, &v24);
          int v18 = v17;
          unint64_t v19 = HIDWORD(v17);
          int v20 = HIDWORD(v17) | v17;
          if (v17)
          {
            v21 = pbb_bridge_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v18;
              LOWORD(v34) = 1024;
              *(_DWORD *)((char *)&v34 + 2) = v19;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Error requesting Remote Bundle Info; Domain: (%d); Code: (%d)",
                buf,
                0xEu);
            }
          }
          [(COSAboutDataSource *)self handleRemoteBundleInfo:v24 success:v20 == 0];
          goto LABEL_37;
        }
LABEL_39:
        sub_100171A7C();
        __break(1u);
      }
      v22 = pbb_bridge_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Could not create CTServerConnection. Not querying cellular bundle.", buf, 2u);
      }
    }
    else
    {
      v22 = pbb_bridge_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device does not have pairing ID. Not querying cellular bundle.", buf, 2u);
      }
    }

LABEL_37:
    self->_hasReceivedCellularPlanUpdate = 0;
    v23 = [sub_10000636C() sharedInstance];
    [v23 updateCellularPlansWithFetch:1];

    goto LABEL_38;
  }
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v3 = "Already fetching info from device.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
  }
LABEL_38:
}

- (void)cellularPlanInfoDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000596EC;
  block[3] = &unk_100243D28;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)displayNetworkActivityIndicator:(BOOL)a3
{
  if (a3)
  {
    self->_displayNetworkProgressIndicator = 1;
    uint64_t v3 = +[UIApplication sharedApplication];
    id v5 = v3;
    uint64_t v4 = 1;
  }
  else
  {
    if (!self->_displayNetworkProgressIndicator) {
      return;
    }
    self->_displayNetworkProgressIndicator = 0;
    uint64_t v3 = +[UIApplication sharedApplication];
    id v5 = v3;
    uint64_t v4 = 0;
  }
  [v3 setNetworkActivityIndicatorVisible:v4];
}

- (void)hideNetworkActivityIndicatorOnceRemoteQueriesHaveCompleted
{
  BOOL hasFetchedAboutInfo = self->_hasFetchedAboutInfo;
  if (self->_hasFetchedAboutInfo)
  {
    BOOL hasFetchedAboutInfo = self->_hasFetchedUsageData && !self->_deviceHasCellularCapability;
    if (self->_deviceHasCellularCapability && self->_hasFetchedUsageData)
    {
      BOOL hasFetchedAboutInfo = self->_hasFetchedRemoteBundleInfo;
      if (self->_hasFetchedRemoteBundleInfo) {
        BOOL hasFetchedAboutInfo = self->_hasReceivedCellularPlanUpdate;
      }
    }
  }
  [(COSAboutDataSource *)self displayNetworkActivityIndicator:!hasFetchedAboutInfo];
}

- (void)handleAboutInfo:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_BOOL hasFetchedAboutInfo = 1;
  [(COSAboutDataSource *)self hideNetworkActivityIndicatorOnceRemoteQueriesHaveCompleted];
  if (!v6 || v7)
  {
    if (v7)
    {
      self->_errorOccurredFetchingAboutInfo = 1;
      v15 = pbb_bridge_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error occurred retrieving the About info: %@", (uint8_t *)&v16, 0xCu);
      }

      BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
    }
  }
  else
  {
    id v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "About info: (%@)", (uint8_t *)&v16, 0xCu);
    }

    v9 = [v6 objectForKeyedSubscript:kNSSAboutAppsKey];
    numberOfApps = self->_numberOfApps;
    self->_numberOfApps = v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:kNSSAboutSongsKey];
    numberOfSongs = self->_numberOfSongs;
    self->_numberOfSongs = v11;

    v13 = [v6 objectForKeyedSubscript:kNSSAboutPhotosKey];
    numberOfPhotos = self->_numberOfPhotos;
    self->_numberOfPhotos = v13;

    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:&stru_100244A60];
  }
}

- (void)handleUsageData:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_hasFetchedUsageData = 1;
  [(COSAboutDataSource *)self hideNetworkActivityIndicatorOnceRemoteQueriesHaveCompleted];
  if (!v6 || v7)
  {
    if (v7)
    {
      self->_errorOccurredFetchingUsageData = 1;
      v9 = pbb_bridge_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error occurred retrieving the usage data: %@", (uint8_t *)&v10, 0xCu);
      }

      BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
    }
  }
  else
  {
    id v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Usage data: (%@)", (uint8_t *)&v10, 0xCu);
    }

    self->_storageAvailable = (unint64_t)[v6 availableStorageInBytes];
    self->_storageCapacity = (unint64_t)[v6 capacityInBytes];
    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:&stru_100244A80];
  }
}

- (void)handleRemoteBundleInfo:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_hasFetchedRemoteBundleInfo = 1;
  [(COSAboutDataSource *)self hideNetworkActivityIndicatorOnceRemoteQueriesHaveCompleted];
  if (v4)
  {
    id v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Remote Bundle Info: (%@)", (uint8_t *)&v13, 0xCu);
    }

    id v8 = [v6 objectForKeyedSubscript:@"kCarrier"];
    v9 = [v8 objectForKeyedSubscript:@"CarrierName"];
    carrierName = self->_carrierName;
    self->_carrierName = v9;

    id v11 = [v8 objectForKeyedSubscript:@"BundleVersion"];
    carrierVersion = self->_carrierVersion;
    self->_carrierVersion = v11;

    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:&stru_100244AA0];
  }
  else
  {
    self->_errorOccurredFetchingRemoteBundleInfo = 1;
    id v8 = pbb_bridge_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error occured fetching Remote Bundle Info", (uint8_t *)&v13, 2u);
    }
  }
}

- (void)handleRetrievedICCIDs:(id)a3
{
  objc_storeStrong((id *)&self->_simICCIDs, a3);

  [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:&stru_100244AC0];
}

- (id)dash
{
  return +[NSString stringWithFormat:@"%C", 8212];
}

- (id)guardedUint64StringValue:(unint64_t)a3
{
  if (self->_hasFetchedAboutInfo && !self->_errorOccurredFetchingAboutInfo)
  {
    BOOL v4 = +[NSNumber numberWithUnsignedLongLong:a3];
    uint64_t v3 = +[NSNumberFormatter localizedStringFromNumber:v4 numberStyle:1];
  }
  else
  {
    uint64_t v3 = [(COSAboutDataSource *)self dash];
  }

  return v3;
}

- (id)getNumberOfSongs:(id)a3
{
  numberOfSongs = self->_numberOfSongs;
  if (numberOfSongs) {
    [(COSAboutDataSource *)self guardedUint64StringValue:[(NSNumber *)numberOfSongs unsignedLongLongValue]];
  }
  else {
  id v5 = [(COSAboutDataSource *)self dash];
  }

  return v5;
}

- (id)getNumberOfPhotos:(id)a3
{
  numberOfPhotos = self->_numberOfPhotos;
  if (numberOfPhotos) {
    [(COSAboutDataSource *)self guardedUint64StringValue:[(NSNumber *)numberOfPhotos unsignedLongLongValue]];
  }
  else {
  id v5 = [(COSAboutDataSource *)self dash];
  }

  return v5;
}

- (id)getNumberOfApps:(id)a3
{
  numberOfApps = self->_numberOfApps;
  if (numberOfApps) {
    [(COSAboutDataSource *)self guardedUint64StringValue:[(NSNumber *)numberOfApps unsignedLongLongValue]];
  }
  else {
  id v5 = [(COSAboutDataSource *)self dash];
  }

  return v5;
}

- (id)getStorageAvailable:(id)a3
{
  if (self->_hasFetchedUsageData && !self->_errorOccurredFetchingUsageData)
  {
    uint64_t v3 = NSLocalizedFileSizeDescription();
  }
  else
  {
    uint64_t v3 = [(COSAboutDataSource *)self dash];
  }

  return v3;
}

- (id)getStorageCapacity:(id)a3
{
  if (self->_hasFetchedUsageData && !self->_errorOccurredFetchingUsageData)
  {
    uint64_t v3 = NSLocalizedFileSizeDescription();
  }
  else
  {
    uint64_t v3 = [(COSAboutDataSource *)self dash];
  }

  return v3;
}

- (id)getDeviceName:(id)a3
{
  BOOL v4 = [UIApp cachedNameForDevice:self->_device];
  id v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyName];
    int v8 = 136315650;
    v9 = "-[COSAboutDataSource getDeviceName:]";
    __int16 v10 = 2112;
    id v11 = v4;
    __int16 v12 = 2112;
    int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@ / %@", (uint8_t *)&v8, 0x20u);
  }

  return v4;
}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    [(NSSManager *)self->_nssManager setDeviceName:v5];
    id v6 = (void *)UIApp;
    id v7 = [v5 copy];
    [v6 setCachedName:v7 forDevice:self->_device];

    int v8 = pbb_setup_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      id v11 = "-[COSAboutDataSource setDeviceName:specifier:]";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
    }

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"COSAboutControllerUserDidChangeDeviceNameNotification" object:0];

    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:&stru_100244AE0];
  }
}

- (id)getSystemVersion:(id)a3
{
  BOOL v4 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyMarketingVersion];
  if (!v4)
  {
    BOOL v4 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertySystemVersion];
  }
  id v5 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertySystemBuildVersion];
  id v6 = +[NSString stringWithFormat:@"%@ (%@)", v4, v5];

  return v6;
}

- (id)getDeviceModel:(id)a3
{
  id v4 = a3;
  if (self->_showRegulatoryModelNumber)
  {
    id v5 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyRegulatoryModelNumber];
    id v6 = v5;
    if (v5 && ![v5 isEqualToString:@"Unknown"]) {
      goto LABEL_11;
    }
  }
  id v6 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyModelNumber];
  id v7 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyRegionInfo];
  if (v7)
  {
    if ([v6 length])
    {
      uint64_t v8 = +[NSString stringWithFormat:@"%@%@", v6, v7];
    }
    else
    {
      v9 = +[NSBundle mainBundle];
      uint64_t v8 = [v9 localizedStringForKey:@"N/A" value:&stru_100249230 table:@"About"];

      id v6 = v9;
    }

    id v6 = (void *)v8;
  }

LABEL_11:

  return v6;
}

- (void)updateModelSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    self->_showRegulatoryModelNumber ^= 1u;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005AAA8;
    v6[3] = &unk_100244B08;
    id v7 = v4;
    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:v6];
  }
}

- (id)getSerialNumber:(id)a3
{
  uint64_t v3 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertySerialNumber];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v5 = +[NSBundle mainBundle];
    id v4 = [v5 localizedStringForKey:@"N/A" value:&stru_100249230 table:@"About"];
  }

  return v4;
}

- (id)getWiFiAddress:(id)a3
{
  uint64_t v3 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyWIFIMACAddress];
  id v4 = [v3 uppercaseString];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = +[NSBundle mainBundle];
    id v5 = [v6 localizedStringForKey:@"N/A" value:&stru_100249230 table:@"About"];
  }

  return v5;
}

- (id)getBTAddress:(id)a3
{
  uint64_t v3 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyBluetoothMACAddress];
  id v4 = [v3 uppercaseString];

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v6 = +[NSBundle mainBundle];
    id v5 = [v6 localizedStringForKey:@"N/A" value:&stru_100249230 table:@"About"];
  }

  return v5;
}

- (id)getCarrierInfo:(id)a3
{
  carrierName = self->_carrierName;
  if (carrierName && (carrierVersion = self->_carrierVersion) != 0)
  {
    id v5 = +[NSString stringWithFormat:@"%@ %@", carrierName, carrierVersion];
  }
  else
  {
    id v5 = [(COSAboutDataSource *)self dash];
  }

  return v5;
}

- (id)getIMEI:(id)a3
{
  sub_1000341B8(@"Reading IMEI from NRDevice", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v13);
  v9 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyIMEI];
  if ([v9 length])
  {
    int v10 = sub_100057FD4(v9);
  }
  else
  {
    id v11 = +[NSBundle mainBundle];
    int v10 = [v11 localizedStringForKey:@"N/A" value:&stru_100249230 table:@"About"];
  }

  return v10;
}

- (id)getLocalizedArtworkDeviceDescription:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"artworkDeviceDescription"];
  uint64_t v4 = PBLocalizedAppleWatchModelStringForDeviceDescription();
  uint64_t v5 = pbb_setup_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    uint64_t v8 = "-[COSAboutDataSource getLocalizedArtworkDeviceDescription:]";
    __int16 v9 = 2112;
    int v10 = v3;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ~ Artwork Description: %@ (Localized: %@)", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

- (void)updateDeviceDetailSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    self->_showMarketingBehaviorDescription ^= 1u;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005AFD8;
    v6[3] = &unk_100244B08;
    id v7 = v4;
    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:v6];
  }
}

- (id)getDeviceDetail:(id)a3
{
  id v4 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyDeviceBrand];
  [v4 integerValue];
  uint64_t v5 = BPSLocalizedShortEdition();
  if ([v5 length] && self->_showMarketingBehaviorDescription)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [(NRDevice *)self->_device valueForProperty:NRDevicePropertyProductType];
    uint64_t v8 = BPSLocalizedVariantSizeForProductType();

    +[PBBridgeWatchAttributeController materialFromDevice:self->_device];
    __int16 v9 = BPSLocalizedNameForMaterial();
    int v10 = +[NSBundle mainBundle];
    __int16 v11 = [v10 localizedStringForKey:@"GIZMO_DESCRIPTION_FORMAT_%@_%@" value:&stru_100249230 table:@"Pairing"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v8, v9);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)getICCID:(id)a3
{
  if ([(NSArray *)self->_simICCIDs count])
  {
    id v4 = [(NSArray *)self->_simICCIDs objectAtIndexedSubscript:self->_iccidDisplayIndex];
    uint64_t v5 = sub_100057EC4(v4, 4uLL);
  }
  else
  {
    uint64_t v5 = [(COSAboutDataSource *)self dash];
  }

  return v5;
}

- (void)updateICCIDSpecifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(NSArray *)self->_simICCIDs count])
    {
      unint64_t v5 = self->_iccidDisplayIndex + 1;
      unint64_t v6 = v5 % [(NSArray *)self->_simICCIDs count];
    }
    else
    {
      unint64_t v6 = 0;
    }
    self->_iccidDisplayIndex = v6;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005B2CC;
    v7[3] = &unk_100244B08;
    id v8 = v4;
    [(COSAboutDataSource *)self performUpdatesAnimated:0 usingBlock:v7];
  }
}

- (void)tappedAppleLegalLink
{
  id v2 = +[NSURL URLWithString:@"https://www.apple.com/legal/"];
  BPSOpenSensitiveURLAsync();
}

- (void)showUserManual:(id)a3
{
  uint64_t v3 = [(COSAboutDataSource *)self observersOfClass:objc_opt_class()];
  id v8 = [v3 anyObject];

  id v4 = objc_alloc_init((Class)BCUserGuide);
  unint64_t v5 = +[NSBundle mainBundle];
  unint64_t v6 = [v5 localizedStringForKey:@"USER_GUIDE_TITLE" value:&stru_100249230 table:@"About"];
  id v7 = [v4 getUserGuideViewWithTitle:v6];
  [v8 presentViewController:v7 animated:1 completion:0];
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)hasStartedFetchingInfo
{
  return self->_hasStartedFetchingInfo;
}

- (void)setHasStartedFetchingInfo:(BOOL)a3
{
  self->_hasStartedFetchingInfo = a3;
}

- (BOOL)hasFetchedAboutInfo
{
  return self->_hasFetchedAboutInfo;
}

- (void)setHasFetchedAboutInfo:(BOOL)a3
{
  self->_BOOL hasFetchedAboutInfo = a3;
}

- (BOOL)hasFetchedUsageData
{
  return self->_hasFetchedUsageData;
}

- (void)setHasFetchedUsageData:(BOOL)a3
{
  self->_hasFetchedUsageData = a3;
}

- (BOOL)errorOccurredFetchingAboutInfo
{
  return self->_errorOccurredFetchingAboutInfo;
}

- (void)setErrorOccurredFetchingAboutInfo:(BOOL)a3
{
  self->_errorOccurredFetchingAboutInfo = a3;
}

- (BOOL)errorOccurredFetchingUsageData
{
  return self->_errorOccurredFetchingUsageData;
}

- (void)setErrorOccurredFetchingUsageData:(BOOL)a3
{
  self->_errorOccurredFetchingUsageData = a3;
}

- (BOOL)displayNetworkProgressIndicator
{
  return self->_displayNetworkProgressIndicator;
}

- (void)setDisplayNetworkProgressIndicator:(BOOL)a3
{
  self->_displayNetworkProgressIndicator = a3;
}

- (NSNumber)numberOfApps
{
  return self->_numberOfApps;
}

- (void)setNumberOfApps:(id)a3
{
}

- (NSNumber)numberOfSongs
{
  return self->_numberOfSongs;
}

- (void)setNumberOfSongs:(id)a3
{
}

- (NSNumber)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (void)setNumberOfPhotos:(id)a3
{
}

- (unint64_t)storageAvailable
{
  return self->_storageAvailable;
}

- (void)setStorageAvailable:(unint64_t)a3
{
  self->_storageAvailable = a3;
}

- (unint64_t)storageCapacity
{
  return self->_storageCapacity;
}

- (void)setStorageCapacity:(unint64_t)a3
{
  self->_storageCapacity = a3;
}

- (BOOL)showRegulatoryModelNumber
{
  return self->_showRegulatoryModelNumber;
}

- (void)setShowRegulatoryModelNumber:(BOOL)a3
{
  self->_showRegulatoryModelNumber = a3;
}

- (BOOL)showMarketingBehaviorDescription
{
  return self->_showMarketingBehaviorDescription;
}

- (void)setShowMarketingBehaviorDescription:(BOOL)a3
{
  self->_showMarketingBehaviorDescription = a3;
}

- (BOOL)deviceHasCellularCapability
{
  return self->_deviceHasCellularCapability;
}

- (void)setDeviceHasCellularCapability:(BOOL)a3
{
  self->_deviceHasCellularCapability = a3;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)carrierVersion
{
  return self->_carrierVersion;
}

- (void)setCarrierVersion:(id)a3
{
}

- (NSArray)simICCIDs
{
  return self->_simICCIDs;
}

- (void)setSimICCIDs:(id)a3
{
}

- (unint64_t)iccidDisplayIndex
{
  return self->_iccidDisplayIndex;
}

- (void)setIccidDisplayIndex:(unint64_t)a3
{
  self->_iccidDisplayIndex = a3;
}

- (BOOL)hasFetchedRemoteBundleInfo
{
  return self->_hasFetchedRemoteBundleInfo;
}

- (void)setHasFetchedRemoteBundleInfo:(BOOL)a3
{
  self->_hasFetchedRemoteBundleInfo = a3;
}

- (BOOL)errorOccurredFetchingRemoteBundleInfo
{
  return self->_errorOccurredFetchingRemoteBundleInfo;
}

- (void)setErrorOccurredFetchingRemoteBundleInfo:(BOOL)a3
{
  self->_errorOccurredFetchingRemoteBundleInfo = a3;
}

- (BOOL)hasReceivedCellularPlanUpdate
{
  return self->_hasReceivedCellularPlanUpdate;
}

- (void)setHasReceivedCellularPlanUpdate:(BOOL)a3
{
  self->_hasReceivedCellularPlanUpdate = a3;
}

- (__CTServerConnection)ctConnection
{
  return self->_ctConnection;
}

- (void)setCtConnection:(__CTServerConnection *)a3
{
  self->_ctConnection = a3;
}

- (NDOACController)ndoController
{
  return self->_ndoController;
}

- (void)setNdoController:(id)a3
{
}

- (OS_dispatch_queue)ctQueue
{
  return self->_ctQueue;
}

- (void)setCtQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctQueue, 0);
  objc_storeStrong((id *)&self->_ndoController, 0);
  objc_storeStrong((id *)&self->_simICCIDs, 0);
  objc_storeStrong((id *)&self->_carrierVersion, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_numberOfPhotos, 0);
  objc_storeStrong((id *)&self->_numberOfSongs, 0);
  objc_storeStrong((id *)&self->_numberOfApps, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_nssManager, 0);
}

@end