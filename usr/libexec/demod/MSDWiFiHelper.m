@interface MSDWiFiHelper
+ (id)sharedInstance;
- (BOOL)configureWiFi:(id)a3 password:(id)a4;
- (BOOL)connectTo:(id)a3 password:(id)a4;
- (BOOL)enableWiFi:(BOOL)a3;
- (BOOL)isValidWiFiSettings:(id)a3;
- (BOOL)saveWiFiSettingsToPreferences:(id)a3;
- (CWFInterface)wifiInterface;
- (MSDTargetDevice)device;
- (MSDWiFiHelper)init;
- (id)getCurrentWiFiSettings:(BOOL)a3;
- (id)getCurrentWiFiSsid;
- (id)getPersistentWiFiSsid;
- (id)lastJoinedWiFiNetworksProfile;
- (id)loadWiFiSettingsFromPreferences;
- (int64_t)getCurrentWiFiSignalStrength;
- (void)configureWiFiWithPersistentSettings;
- (void)disassociateAndForgetWiFi;
- (void)forgetAllKnownWiFiNetworksExcept:(id)a3;
- (void)saveCurrentWiFiSettings;
- (void)setDevice:(id)a3;
- (void)setWifiInterface:(id)a3;
- (void)waitForWiFiInterface;
@end

@implementation MSDWiFiHelper

+ (id)sharedInstance
{
  if (qword_100189D08 != -1) {
    dispatch_once(&qword_100189D08, &stru_100154060);
  }
  v2 = (void *)qword_100189D00;

  return v2;
}

- (MSDWiFiHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDWiFiHelper;
  v2 = [(MSDWiFiHelper *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)CWFInterface);
    [(MSDWiFiHelper *)v2 setWifiInterface:v3];

    v4 = [(MSDWiFiHelper *)v2 wifiInterface];
    [v4 activate];

    v5 = +[MSDTargetDevice sharedInstance];
    [(MSDWiFiHelper *)v2 setDevice:v5];

    v6 = v2;
  }

  return v2;
}

- (BOOL)enableWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  [(MSDWiFiHelper *)self waitForWiFiInterface];
  v5 = [(MSDWiFiHelper *)self wifiInterface];
  id v13 = 0;
  unsigned int v6 = [v5 setPower:v3 error:&v13];
  id v7 = v13;

  if ((v6 & 1) == 0)
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000DCC98();
    }
  }
  objc_super v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = "Failed";
    if (v6) {
      v9 = "Succeeded";
    }
    v10 = "Enable";
    if (!v3) {
      v10 = "Disable";
    }
    *(_DWORD *)buf = 136446466;
    v15 = v9;
    __int16 v16 = 2082;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enableWiFi - Operation %{public}s: %{public}s", buf, 0x16u);
  }

  return v6;
}

- (BOOL)configureWiFi:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (![(MSDWiFiHelper *)self enableWiFi:1])
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000DCD68();
    }
    goto LABEL_21;
  }
  if (![(MSDWiFiHelper *)self connectTo:v6 password:v7])
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000DCD34();
    }
    goto LABEL_21;
  }
  [(MSDWiFiHelper *)self forgetAllKnownWiFiNetworksExcept:v6];
  objc_super v8 = [(MSDWiFiHelper *)self device];
  unsigned int v9 = [v8 isContentFrozen];

  if (!v9)
  {
    BOOL v15 = 1;
    goto LABEL_13;
  }
  v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving wifi ssid and password to demo volume.", buf, 2u);
  }

  v11 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v6, @"SSID", 0];
  if (!v7 || (v12 = [(__CFString *)v7 length], id v13 = v7, !v12)) {
    id v13 = &stru_100155450;
  }
  v14 = [(__CFString *)v13 dataUsingEncoding:4];
  [v11 setObject:v14 forKey:@"Password"];

  if (![(MSDWiFiHelper *)self saveWiFiSettingsToPreferences:v11])
  {
    v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000DCD00();
    }

LABEL_21:
    BOOL v15 = 0;
    goto LABEL_11;
  }
  BOOL v15 = 1;
LABEL_11:

LABEL_13:
  return v15;
}

- (void)configureWiFiWithPersistentSettings
{
  BOOL v3 = [(MSDWiFiHelper *)self loadWiFiSettingsFromPreferences];
  v4 = v3;
  if (!v3)
  {
    unsigned int v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DCD9C();
    }
    v5 = 0;
    id v8 = 0;
    id v7 = 0;
    goto LABEL_23;
  }
  v5 = [v3 objectForKey:@"SSID"];
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Enforcing WiFi settings to AP with SSID - %{public}@", (uint8_t *)&v13, 0xCu);
  }

  id v7 = [v4 objectForKey:@"Password"];
  if ([v7 length])
  {
    id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    if (!v8)
    {
      unsigned int v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000DCE38();
      }
      id v8 = 0;
LABEL_23:

      id v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "WiFi settings not enforced.", (uint8_t *)&v13, 2u);
      }
      goto LABEL_14;
    }
  }
  else
  {
    id v8 = 0;
  }
  if (![(MSDWiFiHelper *)self enableWiFi:1])
  {
    unsigned int v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DCE04();
    }
    goto LABEL_23;
  }
  if (![(MSDWiFiHelper *)self connectTo:v5 password:v8])
  {
    unsigned int v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DCDD0();
    }
    goto LABEL_23;
  }
  [(MSDWiFiHelper *)self forgetAllKnownWiFiNetworksExcept:v5];
  v10 = [(MSDWiFiHelper *)self device];
  unsigned __int8 v11 = [v10 isContentFrozen];

  if ((v11 & 1) == 0)
  {
    id v12 = [(MSDWiFiHelper *)self device];
    [v12 setWifiSettings:0];
LABEL_14:
  }
}

- (id)getCurrentWiFiSettings:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(MSDWiFiHelper *)self wifiInterface];
  id v6 = [v5 currentKnownNetworkProfile];

  if (v6) {
    goto LABEL_5;
  }
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get current known network profile, fetching last joined wifi network...", buf, 2u);
  }

  id v6 = [(MSDWiFiHelper *)self lastJoinedWiFiNetworksProfile];
  if (v6)
  {
LABEL_5:
    uint64_t v8 = [v6 networkName];
    if (v8)
    {
      unsigned int v9 = (void *)v8;
      v10 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v8, @"SSID", 0];
      if (!v3)
      {
LABEL_13:
        v17 = +[NSDictionary dictionaryWithDictionary:v10];

        goto LABEL_14;
      }
      unsigned __int8 v11 = [v6 SSID];
      int Password = CWFSecItemQueryPassword();
      int v13 = (__CFString *)0;

      if (Password == -25300 || !Password)
      {
        if (!v13 || (v14 = [(__CFString *)v13 length], BOOL v15 = v13, !v14)) {
          BOOL v15 = &stru_100155450;
        }
        __int16 v16 = [(__CFString *)v15 dataUsingEncoding:4];
        [v10 setObject:v16 forKey:@"Password"];

        goto LABEL_13;
      }
      v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000DCED4(Password, v19);
      }
    }
    else
    {
      v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000DCEA0();
      }
    }
  }
  else
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000DCE6C();
    }
  }
  v17 = 0;
LABEL_14:

  return v17;
}

- (void)saveCurrentWiFiSettings
{
  BOOL v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving current wifi settings.", v6, 2u);
  }

  v4 = [(MSDWiFiHelper *)self getCurrentWiFiSettings:1];
  if (v4 && ![(MSDWiFiHelper *)self saveWiFiSettingsToPreferences:v4])
  {
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000DCF4C();
    }
  }
}

- (id)getPersistentWiFiSsid
{
  v2 = [(MSDWiFiHelper *)self loadWiFiSettingsFromPreferences];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"SSID"];
    if (v4) {
      goto LABEL_3;
    }
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000DCFF8(v6, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000DCF80(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  v4 = 0;
LABEL_3:

  return v4;
}

- (id)getCurrentWiFiSsid
{
  v2 = [(MSDWiFiHelper *)self getCurrentWiFiSettings:0];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 objectForKey:@"SSID"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)getCurrentWiFiSignalStrength
{
  BOOL v3 = [(MSDWiFiHelper *)self wifiInterface];
  v4 = [v3 currentKnownNetworkProfile];

  if (!v4) {
    return -100;
  }
  v5 = [(MSDWiFiHelper *)self wifiInterface];
  id v6 = [v5 RSSI];

  return (int64_t)v6;
}

- (void)disassociateAndForgetWiFi
{
  [(MSDWiFiHelper *)self forgetAllKnownWiFiNetworksExcept:0];
  BOOL v3 = [(MSDWiFiHelper *)self wifiInterface];
  [v3 disassociateWithReason:0];

  id v4 = [(MSDWiFiHelper *)self device];
  [v4 setWifiSettings:0];
}

- (BOOL)connectTo:(id)a3 password:(id)a4
{
  id v5 = a3;
  id v39 = a4;
  id v6 = objc_alloc_init((Class)CWFScanParameters);
  [v6 setIncludeHiddenNetworks:1];
  id v51 = v5;
  uint64_t v7 = +[NSArray arrayWithObjects:&v51 count:1];
  [v6 setSSIDList:v7];

  [v6 setMinimumRSSI:-80];
  uint64_t v8 = +[NSSet setWithArray:&off_100162F80];
  v40 = v6;
  [v6 setIncludeProperties:v8];

  id v9 = 0;
  uint64_t v10 = 3;
  while (1)
  {
    uint64_t v11 = v9;
    uint64_t v12 = [(MSDWiFiHelper *)self wifiInterface];
    id v47 = v9;
    uint64_t v13 = [v12 performScanWithParameters:v40 error:&v47];
    id v9 = v47;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v15) {
      break;
    }
LABEL_11:

LABEL_15:
    sleep(3u);

    if (!--v10)
    {
      v25 = sub_100068600();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_1000DD070(v25);
      }
      BOOL v26 = 0;
      v27 = v39;
      goto LABEL_29;
    }
  }
  id v16 = v15;
  id v17 = 0;
  uint64_t v18 = *(void *)v44;
LABEL_4:
  uint64_t v19 = 0;
  uint64_t v20 = v17;
  while (1)
  {
    if (*(void *)v44 != v18) {
      objc_enumerationMutation(v14);
    }
    id v17 = *(id *)(*((void *)&v43 + 1) + 8 * (void)v19);

    v21 = [v17 networkName];
    unsigned int v22 = [v21 isEqualToString:v5];

    if (v22) {
      break;
    }
    uint64_t v19 = (char *)v19 + 1;
    uint64_t v20 = v17;
    if (v16 == v19)
    {
      id v16 = [v14 countByEnumeratingWithState:&v43 objects:v50 count:16];
      if (v16) {
        goto LABEL_4;
      }

      goto LABEL_11;
    }
  }
  v23 = sub_100068600();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v17 networkName];
    *(_DWORD *)buf = 138543362;
    v49 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found the wifi with ssid '%{public}@'", buf, 0xCu);
  }
  v25 = v17;

  if (!v25) {
    goto LABEL_15;
  }

  id v28 = objc_alloc_init((Class)CWFAssocParameters);
  [v28 setScanResult:v25];
  [v28 setRememberUponSuccessfulAssociation:1];
  v27 = v39;
  [v28 setPassword:v39];
  id v29 = objc_alloc_init((Class)CWFNetworkProfile);
  [v28 setKnownNetworkProfile:v29];

  v30 = [v28 knownNetworkProfile];
  [v30 setHiddenState:1];

  uint64_t v31 = -3;
  while (1)
  {
    v32 = v9;
    v33 = [(MSDWiFiHelper *)self wifiInterface];
    id v42 = v9;
    unsigned __int8 v34 = [v33 associateWithParameters:v28 error:&v42];
    id v9 = v42;

    if (v34) {
      break;
    }
    sleep(3u);
    if (__CFADD__(v31++, 1))
    {
      v36 = sub_100068600();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1000DD0F0();
      }

      BOOL v26 = 0;
      goto LABEL_29;
    }
  }
  v37 = sub_100068600();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Connected to wifi.", buf, 2u);
  }

  BOOL v26 = 1;
LABEL_29:

  return v26;
}

- (void)waitForWiFiInterface
{
  id v3 = objc_alloc_init((Class)NSCondition);
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:5.0];
  id v5 = [(MSDWiFiHelper *)self wifiInterface];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000B7048;
  v17[3] = &unk_100154088;
  id v6 = v3;
  id v18 = v6;
  [v5 setEventHandler:v17];

  uint64_t v7 = [(MSDWiFiHelper *)self wifiInterface];
  id v16 = 0;
  unsigned __int8 v8 = [v7 startMonitoringEventType:10 error:&v16];
  id v9 = v16;

  if (v8)
  {
    [v6 lock];
    while (1)
    {
      uint64_t v10 = [(MSDWiFiHelper *)self wifiInterface];
      uint64_t v11 = [v10 interfaceName];

      if (v11) {
        break;
      }
      uint64_t v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Wifi interface is not intialized, waiting for  CWFEventTypeInterfaceAdded event.", v15, 2u);
      }

      if (([v6 waitUntilDate:v4] & 1) == 0)
      {
        uint64_t v13 = sub_100068600();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Wait for wifi interface initialization timed out after 5 seconds", v15, 2u);
        }

        break;
      }
    }
    [v6 unlock];
    id v14 = [(MSDWiFiHelper *)self wifiInterface];
    [v14 stopMonitoringEventType:10];
  }
  else
  {
    id v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000DD158();
    }
  }
}

- (void)forgetAllKnownWiFiNetworksExcept:(id)a3
{
  id v4 = a3;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forgetting all known WiFi networks except: '%{public}@'...", buf, 0xCu);
  }

  id v6 = [(MSDWiFiHelper *)self wifiInterface];
  uint64_t v7 = [v6 knownNetworkProfilesWithProperties:0];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v4
          && ([*(id *)(*((void *)&v22 + 1) + 8 * i) networkName],
              id v14 = objc_claimAutoreleasedReturnValue(),
              unsigned int v15 = [v14 isEqualToString:v4],
              v14,
              v15))
        {
          id v16 = sub_100068600();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Found known WiFi network with matching ssid!", buf, 2u);
          }
        }
        else
        {
          id v17 = [(MSDWiFiHelper *)self wifiInterface];
          id v21 = 0;
          unsigned __int8 v18 = [v17 removeKnownNetworkProfile:v13 reason:0 error:&v21];
          id v16 = v21;

          if ((v18 & 1) == 0)
          {
            uint64_t v20 = sub_100068600();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_1000DD1C0(v16, v20);
            }

            goto LABEL_20;
          }
          uint64_t v19 = [v13 SSID];
          CWFSecItemSetPassword();
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_20:
}

- (id)lastJoinedWiFiNetworksProfile
{
  v2 = [(MSDWiFiHelper *)self wifiInterface];
  id v3 = [v2 knownNetworkProfilesWithProperties:0];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (v7
          || (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "lastJoinedAt", (void)v19),
              unsigned int v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {
          uint64_t v11 = [v10 lastJoinedAt];
          uint64_t v12 = [v7 lastJoinedAt];
          id v13 = [v11 compare:v12];

          if (v13 == (id)1)
          {
            id v14 = v10;

            id v7 = v14;
          }
        }
        else
        {
          id v7 = v10;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }

  id v16 = sub_100068600();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v7 networkName];
    *(_DWORD *)buf = 138543362;
    long long v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Last joined WiFi network SSID: %{public}@", buf, 0xCu);
  }

  return v7;
}

- (BOOL)isValidWiFiSettings:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No WiFi settings found.", v11, 2u);
    }
    id v6 = 0;
    goto LABEL_9;
  }
  id v5 = [v3 objectForKey:@"SSID"];
  id v6 = v5;
  if (!v5
    || ![v5 length]
    || ([v4 objectForKey:@"Password"], (id v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000DD254();
    }
LABEL_9:

    id v7 = 0;
    BOOL v8 = 0;
    goto LABEL_10;
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (id)loadWiFiSettingsFromPreferences
{
  id v3 = [(MSDWiFiHelper *)self device];
  id v4 = [v3 wifiSettings];
  id v5 = [v4 mutableCopy];

  if (v5)
  {
    if (![(MSDWiFiHelper *)self isValidWiFiSettings:v5]) {
      goto LABEL_9;
    }
    id v6 = [v5 objectForKey:@"Password"];
    id v7 = +[MSDCryptoHandler sharedInstance];
    BOOL v8 = [v7 performCryptoWithSecretKeyOnData:v6 isDecipher:1];

    if (v8)
    {
      [v5 setObject:v8 forKey:@"Password"];
      id v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WiFi settings successfully loaded.", v11, 2u);
      }
    }
    else
    {
      BOOL v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000DD288();
      }
    }
  }
  else
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persistent WiFi settings does not exist", buf, 2u);
    }
  }

LABEL_9:

  return v5;
}

- (BOOL)saveWiFiSettingsToPreferences:(id)a3
{
  id v4 = a3;
  if ([(MSDWiFiHelper *)self isValidWiFiSettings:v4])
  {
    id v5 = +[MSDCryptoHandler sharedInstance];
    id v6 = [v4 objectForKey:@"Password"];
    id v7 = [v5 performCryptoWithSecretKeyOnData:v6 isDecipher:0];

    BOOL v8 = v7 != 0;
    if (v7)
    {
      id v9 = [v4 mutableCopy];
      [v9 setObject:v7 forKey:@"Password"];
      id v10 = [(MSDWiFiHelper *)self device];
      [v10 setWifiSettings:v9];

      uint64_t v11 = [(MSDWiFiHelper *)self device];
      unsigned int v12 = [v11 isContentFrozen];

      if (v12)
      {
        id v13 = [(MSDWiFiHelper *)self device];
        [v13 setShouldForgetKnownNetworkUponUnlock:0];
      }
      id v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WiFi settings successfully saved.", v16, 2u);
      }
    }
    else
    {
      id v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000DD2BC();
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CWFInterface)wifiInterface
{
  return self->_wifiInterface;
}

- (void)setWifiInterface:(id)a3
{
}

- (MSDTargetDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_wifiInterface, 0);
}

@end