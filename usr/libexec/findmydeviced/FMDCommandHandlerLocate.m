@interface FMDCommandHandlerLocate
- (FMDAccessoryIdentifier)accessoryIdentifier;
- (NSNumber)lastPublishedAccuracy;
- (id)createLocatorWithParams:(id)a3;
- (id)locationPublisherWithParams:(id)a3;
- (void)_notifyAboutLocatingState;
- (void)_sendAccessoryCurrentLocationsForCmd:(id)a3 reason:(int64_t)a4 locator:(id)a5 accessoryIdentifier:(id)a6;
- (void)_sendCurrentLocation:(id)a3 isFinished:(BOOL)a4 forCmd:(id)a5 withReason:(int64_t)a6 andAccuracyChange:(double)a7;
- (void)_sendTrackedLocations;
- (void)_showAlertAfterUnlock:(id)a3;
- (void)handleCommand;
- (void)sendAckWithCompletion:(id)a3;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setLastPublishedAccuracy:(id)a3;
@end

@implementation FMDCommandHandlerLocate

- (void)handleCommand
{
  uint64_t v2 = qword_10031CBC8;
  v101 = [(FMDCommandHandler *)self provider];
  v3 = +[FMDSystemConfig sharedInstance];
  unsigned int v4 = [v3 isLocationServicesCapable];

  v5 = +[FMDSystemConfig sharedInstance];
  unsigned int v6 = [v5 canHandleLocates];

  uint64_t v7 = qword_10031CBD8;
  CFStringRef v8 = @"Ignored Request - Location Services Not Enabled";
  if (v6)
  {
    CFStringRef v8 = 0;
    uint64_t v7 = v2;
  }
  BOOL v9 = v4 == 0;
  if (v4) {
    CFStringRef v10 = v8;
  }
  else {
    CFStringRef v10 = @"Ignored Request - Device Not Capable of Location Services";
  }
  if (v9) {
    uint64_t v7 = qword_10031CBD0;
  }
  uint64_t v99 = v7;
  if (v7 == qword_10031CBC8)
  {
    v11 = [(FMDCommandHandler *)self commandParams];
    id val = [(FMDCommandHandlerLocate *)self createLocatorWithParams:v11];

    v12 = [v101 standardLocator];
    if (v12)
    {
      v13 = [v101 standardLocator];
      unsigned int v14 = [v13 locatorRunning];

      if (v14)
      {
        v15 = [v101 standardLocator];
        [v15 desiredAccuracy];
        double v17 = v16;
        [val desiredAccuracy];
        BOOL v19 = v17 > v18;

        oslog = sub_100004238();
        BOOL v20 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        if (!v19)
        {
          if (v20)
          {
            v62 = [v101 standardLocator];
            [v62 desiredAccuracy];
            uint64_t v64 = v63;
            [val desiredAccuracy];
            *(_DWORD *)buf = 134218240;
            *(void *)&buf[4] = v64;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v65;
            _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Current locate command is already looking for the same/better accuracy. Ignoring new locate - current=%fm,new=%fm", buf, 0x16u);
          }
          goto LABEL_49;
        }
        if (v20)
        {
          v21 = [v101 standardLocator];
          [v21 desiredAccuracy];
          uint64_t v23 = v22;
          [val desiredAccuracy];
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v23;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v24;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "New locate command asks for a better accuracy than the current locate. Stopping current locate - current=%fm,new=%fm", buf, 0x16u);
        }
      }
    }
    v25 = [v101 standardLocator];

    if (v25)
    {
      v26 = [v101 standardLocator];
      [v26 stopLocator];

      [v101 setStandardLocator:0];
    }
    if (+[FMDPreferencesMgr simulateLocateNotification])
    {
      v27 = sub_100004238();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Simulating locate notification...", buf, 2u);
      }

      v28 = [(FMDCommandHandler *)self commandParams];
      id v29 = [v28 mutableCopy];

      [v29 setObject:@"Find My iPhone" forKeyedSubscript:@"title"];
      [v29 setObject:@"This device's location was accessed using Find My iPhone" forKeyedSubscript:@"text"];
      [v29 setObject:@"OK" forKeyedSubscript:@"okButtonTitle"];
      id v30 = [v29 copy];
      [(FMDCommandHandler *)self setCommandParams:v30];
    }
    v31 = [(FMDCommandHandler *)self commandParams];
    v93 = [v31 objectForKeyedSubscript:@"text"];

    if (v93
      && +[FMDPreferencesMgr locateNotificationsEnabled])
    {
      os_log_t osloga = (os_log_t)objc_alloc_init((Class)FMAlert);
      [osloga setCategory:3];
      [osloga setMsgText:v93];
      v32 = [(FMDCommandHandler *)self commandParams];
      v33 = [v32 objectForKeyedSubscript:@"title"];
      [osloga setMsgTitle:v33];

      [osloga setShowMsgInLockScreen:1];
      [osloga setDismissMsgOnUnlock:0];
      [osloga setDismissMsgOnLock:0];
      v34 = [(FMDCommandHandler *)self commandParams];
      v35 = [v34 objectForKeyedSubscript:@"okButtonTitle"];
      [osloga setDefaultButtonTitle:v35];
    }
    else
    {
      os_log_t osloga = 0;
    }
    CFStringRef v127 = @"id";
    v36 = [(FMDCommandHandler *)self commandID];
    v128 = v36;
    v91 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];

    v37 = [(FMDCommandHandler *)self commandParams];
    v38 = [v37 objectForKey:@"udid"];
    v95 = [v38 fm_nullToNil];

    if (v95)
    {
      id v39 = [objc_alloc((Class)FMDAccessoryIdentifier) initWithString:v95];
      [(FMDCommandHandlerLocate *)self setAccessoryIdentifier:v39];
    }
    v40 = sub_100004238();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "CommandHandlerLocate Will send accessory locations.", buf, 2u);
    }

    v41 = [(FMDCommandHandler *)self commandParams];
    v96 = [(FMDCommandHandlerLocate *)self createLocatorWithParams:v41];

    v42 = [(FMDCommandHandler *)self commandParams];
    v90 = [(FMDCommandHandlerLocate *)self locationPublisherWithParams:v42];

    [v96 setLocatorPublisher:v90];
    v43 = [(FMDCommandHandlerLocate *)self accessoryIdentifier];
    [(FMDCommandHandlerLocate *)self _sendAccessoryCurrentLocationsForCmd:v91 reason:1 locator:v96 accessoryIdentifier:v43];

    v44 = [(FMDCommandHandler *)self commandParams];
    v94 = [v44 objectForKey:@"scanDurationInSeconds"];

    v45 = [v101 accessoryRegistry];
    v46 = [(FMDCommandHandlerLocate *)self accessoryIdentifier];
    v47 = [v45 accessoryForIdentifier:v46];

    v48 = [v47 accessoryIdentifier];
    v49 = [v48 stringValue];

    [v94 doubleValue];
    if (v50 <= 0.0)
    {
      id v59 = 0;
    }
    else
    {
      if ([v47 category] == (id)3)
      {
        id v51 = v47;
        if (v51 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v52 = +[FMDExtConfigurationRegistry sharedInstance];
          v53 = [v51 accessoryType];
          v54 = [v52 configForAccessoryType:v53];

          v89 = [v54 flavorForFeature:@"availability"];
          v55 = [v101 accessoryRegistry];
          v56 = +[FMDExtExtensionHelper getAccessoryControllerForFeature:@"availability" flavor:v89 withDelegate:v55];

          v57 = [v54 infoForFeature:@"availability"];
          [v94 doubleValue];
          [v56 startDiscoveryForAccessory:v49 duration:v57 info:&stru_1002DC7F8 withCompletion:];

          if (v56)
          {
            v58 = +[NSDate date];
LABEL_47:

            id v59 = 0;
            goto LABEL_48;
          }
        }
        else
        {
          v57 = 0;
          v56 = 0;
          v89 = 0;
        }
        v58 = 0;
        goto LABEL_47;
      }
      v60 = sub_100004238();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "FMDCommandHandlerLocate starting BLE discovery.", buf, 2u);
      }

      v61 = [v101 bluetoothManager];
      id v59 = [v61 newDiscovery];

      [v94 doubleValue];
      [v59 startDiscoveryForDuration:];
      if (v59)
      {
        v58 = +[NSDate date];
        goto LABEL_42;
      }
    }
    v58 = 0;
LABEL_42:
    v89 = 0;
    v56 = 0;
    v57 = 0;
LABEL_48:
    id v66 = v101;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v126 = 0;
    v67 = [(FMDCommandHandler *)self commandParams];
    v68 = [(FMDCommandHandlerLocate *)self locationPublisherWithParams:v67];

    objc_initWeak(&location, val);
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_10009B500;
    v112[3] = &unk_1002DC848;
    v88 = self;
    v112[4] = v88;
    id v69 = v58;
    id v113 = v69;
    id v86 = v91;
    id v114 = v86;
    id v70 = v47;
    id v115 = v70;
    id v71 = v56;
    id v116 = v71;
    id v72 = v49;
    id v117 = v72;
    id v73 = v57;
    id v118 = v73;
    id v74 = v59;
    id v119 = v74;
    id v75 = v66;
    id v120 = v75;
    objc_copyWeak(&v123, &location);
    v122 = buf;
    oslog = osloga;
    v121 = oslog;
    [v68 startPublishingWithBlock:v112];
    [val setLocatorPublisher:v68];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_10009BAAC;
    v103[3] = &unk_1002DC870;
    id v76 = v75;
    id v104 = v76;
    id v87 = v69;
    id v105 = v87;
    id v92 = v70;
    id v106 = v92;
    id v77 = v71;
    id v107 = v77;
    id v78 = v72;
    id v108 = v78;
    id v79 = v73;
    id v109 = v79;
    id v80 = v74;
    id v110 = v80;
    id v81 = v68;
    id v111 = v81;
    [val setStoppedLocatorBlock:v103];
    [v76 setStandardLocator:val];
    [val startLocator];

    objc_destroyWeak(&v123);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
LABEL_49:

    CFStringRef v10 = @"OK";
  }
  v82 = [(FMDCommandHandler *)self commandParams];
  v83 = [v82 objectForKeyedSubscript:@"includeTrackingInfo"];

  if (v83 && [v83 BOOLValue]) {
    [(FMDCommandHandlerLocate *)self _sendTrackedLocations];
  }
  [(FMDCommandHandlerLocate *)self _notifyAboutLocatingState];
  v84 = +[NSMutableDictionary dictionary];
  v85 = +[NSNumber numberWithInteger:v99];
  [v84 setObject:v85 forKeyedSubscript:@"status"];

  if (v10) {
    [v84 setObject:v10 forKeyedSubscript:@"message"];
  }
  [(FMDCommandHandler *)self didHandleCommandWithAckData:v84];
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(FMDCommandHandler *)self ackDataForCommand];
  unsigned int v6 = [v5 objectForKeyedSubscript:@"status"];
  signed int v7 = [v6 intValue];

  CFStringRef v8 = [v5 objectForKeyedSubscript:@"message"];
  BOOL v9 = [(FMDCommandHandler *)self commandParams];
  CFStringRef v10 = [v9 objectForKeyedSubscript:@"ackURL"];

  v11 = [(FMDCommandHandler *)self provider];
  if (v10)
  {
    uint64_t v25 = v7;
    uint64_t v24 = +[NSURL URLWithString:v10];
    v12 = [FMDActingRequestDecorator alloc];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10009BFBC;
    v31[3] = &unk_1002D9458;
    v31[4] = self;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10009C064;
    v29[3] = &unk_1002D9DF8;
    v29[4] = self;
    id v13 = v11;
    id v30 = v13;
    unsigned int v14 = [(FMDActingRequestDecorator *)v12 initWithDeviceContextGenerator:v31 deviceInfoGenerator:v29 serverContextGenerator:0 requestHeaderGenerator:0];
    v15 = v8;
    double v16 = [FMDRequestAckLocate alloc];
    [v13 account];
    double v17 = v10;
    double v18 = v5;
    v20 = BOOL v19 = v11;
    v21 = [(FMDCommandHandler *)self commandParams];
    uint64_t v22 = [(FMDRequestAckLocate *)v16 initWithAccount:v20 locateCommand:v21 ackURL:v24 cmdStatusCode:v25 cmdStatusMessage:v15];

    v11 = v19;
    v5 = v18;
    CFStringRef v10 = v17;
    [(FMDRequest *)v22 setDecorator:v14];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10009C178;
    v27[3] = &unk_1002D9180;
    id v28 = v4;
    [(FMDRequest *)v22 setCompletionHandler:v27];
    [v13 enqueueRequest:v22];

    CFStringRef v8 = v15;
    uint64_t v23 = v24;
  }
  else
  {
    uint64_t v23 = sub_100004238();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not acking the locate command because there is no ack URL", buf, 2u);
    }
  }
}

- (void)_sendCurrentLocation:(id)a3 isFinished:(BOOL)a4 forCmd:(id)a5 withReason:(int64_t)a6 andAccuracyChange:(double)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  unsigned int v14 = sub_100004238();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10024226C(v14);
  }

  v15 = sub_100059618();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    double v16 = [v12 horizontalAccuracy];
    double v17 = [v12 longitude];
    double v18 = [v12 latitude];
    *(_DWORD *)buf = 138478339;
    v41 = v16;
    __int16 v42 = 2113;
    v43 = v17;
    __int16 v44 = 2113;
    v45 = v18;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Publishing Location with Accuracy: %{private}@ Longitude: %{private}@ Latitude: %{private}@", buf, 0x20u);
  }
  BOOL v19 = [(FMDCommandHandler *)self provider];
  BOOL v20 = [[FMDLocation alloc] initWithLocation:v12 eventType:0 positionType:255];
  v21 = [v13 objectForKeyedSubscript:@"id"];
  uint64_t v22 = [FMDActingRequestDecorator alloc];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10009C750;
  v38[3] = &unk_1002D9458;
  id v23 = v21;
  id v39 = v23;
  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472;
  v35 = sub_10009C7C4;
  v36 = &unk_1002D9458;
  id v24 = v19;
  id v37 = v24;
  uint64_t v25 = [(FMDActingRequestDecorator *)v22 initWithDeviceContextGenerator:v38 deviceInfoGenerator:&v33 serverContextGenerator:0 requestHeaderGenerator:0];
  v26 = [v13 objectForKeyedSubscript:@"locationValidityDuration" v33, v34, v35, v36];

  v27 = [FMDRequestCurrentLocation alloc];
  id v28 = [v24 account];
  [v26 doubleValue];
  id v30 = [(FMDRequestCurrentLocation *)v27 initWithAccount:v28 location:v20 finalLocation:v10 reason:a6 accuracyChange:a7 cacheValidityDuration:v29];

  [(FMDRequest *)v30 setDecorator:v25];
  [(FMDRequest *)v30 setCompletionHandler:&stru_1002DC890];
  ct_green_tea_logger_create_static();
  v31 = getCTGreenTeaOsLogHandle();
  v32 = v31;
  if (v31 && os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
  }

  [v24 enqueueRequest:v30];
}

- (void)_sendAccessoryCurrentLocationsForCmd:(id)a3 reason:(int64_t)a4 locator:(id)a5 accessoryIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(FMDCommandHandler *)self provider];
  unsigned int v14 = [v10 objectForKeyedSubscript:@"locationValidityDuration"];
  v15 = [v10 objectForKeyedSubscript:@"id"];
  double v16 = [v13 accessoryRegistry];
  double v17 = v16;
  if (!v12)
  {
    id v46 = v10;
    v47 = v15;
    id v45 = v11;
    v26 = [v16 allAccessories];

    uint64_t v25 = +[NSMutableArray array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v26;
    id v27 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v54;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v54 != v29) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v32 = sub_100004238();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v70 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "CommandHandlerLocate fetching historical location for %@.", buf, 0xCu);
          }

          v33 = [v13 accessoryLocationStore];
          uint64_t v34 = [v33 historicalLocationForAccessory:v31];

          if (v34)
          {
            v35 = +[NSMutableDictionary dictionary];
            v36 = [v34 dictionaryValue];
            [v35 addEntriesFromDictionary:v36];

            [v25 addObject:v35];
          }
        }
        id v28 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
      }
      while (v28);
    }

    if ([v25 count])
    {
      id v37 = [FMDActingRequestDecorator alloc];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_10009D5CC;
      v51[3] = &unk_1002D9458;
      id v52 = v47;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10009D640;
      v49[3] = &unk_1002D9458;
      id v38 = v13;
      id v50 = v38;
      id v39 = [(FMDActingRequestDecorator *)v37 initWithDeviceContextGenerator:v51 deviceInfoGenerator:v49 serverContextGenerator:0 requestHeaderGenerator:0];
      v40 = [FMDRequestAccessoryLocations alloc];
      v41 = [v38 account];
      __int16 v42 = [(FMDRequestAccessoryLocations *)v40 initWithAccount:v41 accessoryLocations:v25];

      [(FMDRequest *)v42 setDecorator:v39];
      ct_green_tea_logger_create_static();
      v43 = getCTGreenTeaOsLogHandle();
      __int16 v44 = v43;
      id v12 = 0;
      id v11 = v45;
      if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Transmitting Location.", buf, 2u);
      }

      [v38 enqueueRequest:v42];
      id v10 = v46;
    }
    else
    {
      id v11 = v45;
      id v10 = v46;
      id v12 = 0;
    }
    v15 = v47;
    goto LABEL_24;
  }
  double v18 = [v16 accessoryForIdentifier:v12];

  id obj = v18;
  if ([v18 connectionState] == (id)1)
  {
    BOOL v19 = [FMDActingRequestDecorator alloc];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_10009D0AC;
    v66[3] = &unk_1002D9458;
    id v67 = v15;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10009D120;
    v63[3] = &unk_1002D9DF8;
    id v20 = v13;
    id v64 = v20;
    uint64_t v65 = self;
    v21 = [(FMDActingRequestDecorator *)v19 initWithDeviceContextGenerator:v66 deviceInfoGenerator:v63 serverContextGenerator:0 requestHeaderGenerator:0];
    uint64_t v22 = sub_100004238();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v70 = obj;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CommandHandlerLocate requesting location for %@.", buf, 0xCu);
    }

    id v23 = [v20 accessoryLocationStore];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10009D1E0;
    v57[3] = &unk_1002DC8D8;
    id v58 = v20;
    int64_t v62 = a4;
    id v59 = v14;
    v60 = v21;
    id v61 = v12;
    id v24 = v21;
    [v23 locationForAccessory:obj locator:v11 completion:v57];

    uint64_t v25 = v67;
LABEL_24:
  }
}

- (void)_sendTrackedLocations
{
  uint64_t v2 = [(FMDCommandHandler *)self provider];
  v3 = [v2 locationTracker];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009D764;
  v5[3] = &unk_1002DC900;
  id v6 = v2;
  id v4 = v2;
  [v3 actOnTrackedLocationsUsingBlock:v5];
}

- (void)_showAlertAfterUnlock:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDCommandHandler *)self provider];
  [v5 setPendingLocateAlert:v4];
}

- (id)createLocatorWithParams:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDCommandHandler *)self provider];
  id v6 = [FMDLocator alloc];
  id v7 = [v5 newLocationManager];
  CFStringRef v8 = [(FMDLocator *)v6 initWithLocationManager:v7];

  BOOL v9 = sub_100004238();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(FMDCommandHandler *)self fm_logID];
    id v11 = [v5 serviceName];
    int v18 = 138412546;
    BOOL v19 = v10;
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created %@ for service %@", (uint8_t *)&v18, 0x16u);
  }
  id v13 = [v4 objectForKeyedSubscript:@"locationTimeout"];
  unsigned int v14 = v13;
  if (v13)
  {
    [v13 doubleValue];
    -[FMDLocator setDuration:](v8, "setDuration:");
  }
  v15 = [v4 objectForKeyedSubscript:@"desiredAccuracy"];

  if (v15)
  {
    [v15 doubleValue];
    -[FMDLocator setDesiredAccuracy:](v8, "setDesiredAccuracy:");
  }

  double v16 = v8;

  return v16;
}

- (id)locationPublisherWithParams:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(FMDConservativeLocatorPublisher);
  id v5 = [[FMCompareLocatorPublisher alloc] initWithPrimaryPublisher:v4 compareToPublishers:&__NSArray0__struct];
  id v6 = [v3 objectForKeyedSubscript:@"startThreshold"];
  if (v6) {
    [(FMCompareLocatorPublisher *)v5 setStartThreshold:v6];
  }
  id v7 = [v3 objectForKeyedSubscript:@"endThreshold"];

  if (v7) {
    [(FMCompareLocatorPublisher *)v5 setEndThreshold:v7];
  }
  CFStringRef v8 = [v3 objectForKeyedSubscript:@"decayFactor"];

  if (v8) {
    [(FMCompareLocatorPublisher *)v5 setDecayFactor:v8];
  }
  BOOL v9 = [v3 objectForKeyedSubscript:@"locationValidityDuration"];

  if (v9) {
    [(FMCompareLocatorPublisher *)v5 setCachedLocationValidityTimeInterval:v9];
  }

  return v5;
}

- (void)_notifyAboutLocatingState
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)kFMIPLocatableStateReportedNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
}

- (FMDAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
}

- (NSNumber)lastPublishedAccuracy
{
  return self->_lastPublishedAccuracy;
}

- (void)setLastPublishedAccuracy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPublishedAccuracy, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end