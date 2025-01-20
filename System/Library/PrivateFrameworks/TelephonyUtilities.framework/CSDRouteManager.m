@interface CSDRouteManager
+ (CSDRouteManager)sharedInstance;
- (AADeviceManager)aaDeviceManager;
- (BOOL)_isAnyAudioDevicePreferred;
- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch;
- (BOOL)hasInEarRouteInTipiWithCompanionWatch;
- (BOOL)isAnyBluetoothHeadphoneRouteAvailableForAnyCall;
- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3 forCall:(id)a4;
- (BOOL)isAnyVehicleRouteAvailableForAnyCall;
- (BOOL)isAnyVehicleRouteAvailableForCall:(id)a3;
- (BOOL)isCarModeActive;
- (BOOL)isCarPlayDeviceConnected;
- (BOOL)isCarPlayRouteAvailable;
- (BOOL)isEligibleRouteAvailable;
- (BOOL)isEligibleRouteAvailableForCall:(id)a3;
- (CARAutomaticDNDStatus)automaticCarDNDStatus;
- (CSDRouteManager)init;
- (NSDictionary)audioRouteCollections;
- (OS_dispatch_queue)queue;
- (id)_audioRouteCollectionForCall:(id)a3;
- (id)preferredAndActiveRouteForCall:(id)a3;
- (id)preferredRouteForCall:(id)a3;
- (void)_initializeAudioRouteCollections;
- (void)_initializeAutomaticCarDNDStatusIfNecessary;
- (void)_postNotificationName:(id)a3;
- (void)_updateCarPlayDeviceConnected;
- (void)_updatePickableRoutes;
- (void)aaDevicesDidChange;
- (void)audioDeviceControllerDeviceListChanged:(id)a3;
- (void)carPlayIsConnectedChanged:(id)a3;
- (void)dealloc;
- (void)mediaServicesWereResetNotification:(id)a3;
- (void)pickableRoutesDidChangeNotification:(id)a3;
- (void)preferredExternalRouteDidChangeNotification:(id)a3;
- (void)setAudioRouteCollections:(id)a3;
- (void)setAutomaticCarDNDStatus:(id)a3;
- (void)setCarModeActive:(BOOL)a3;
- (void)setCarPlayDeviceConnected:(BOOL)a3;
@end

@implementation CSDRouteManager

+ (CSDRouteManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED994;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C428 != -1) {
    dispatch_once(&qword_10058C428, block);
  }
  v2 = (void *)qword_10058C420;

  return (CSDRouteManager *)v2;
}

- (CSDRouteManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)CSDRouteManager;
  v2 = [(CSDRouteManager *)&v17 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.routemanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = +[TUCallCenter sharedInstance];
    v6 = [v5 audioDeviceController];
    [v6 addDelegate:v2];

    objc_initWeak(&location, v2);
    v7 = (AADeviceManager *)objc_alloc_init((Class)AADeviceManager);
    aaDeviceManager = v2->_aaDeviceManager;
    v2->_aaDeviceManager = v7;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000EDBBC;
    v14[3] = &unk_100507528;
    objc_copyWeak(&v15, &location);
    [(AADeviceManager *)v2->_aaDeviceManager setDeviceFoundHandler:v14];
    v9 = [(AADeviceManager *)v2->_aaDeviceManager deviceFoundHandler];
    [(AADeviceManager *)v2->_aaDeviceManager setDeviceLostHandler:v9];

    [(AADeviceManager *)v2->_aaDeviceManager activateWithCompletion:&stru_100507568];
    v10 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EDC54;
    block[3] = &unk_100504EC0;
    v13 = v2;
    dispatch_async(v10, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDRouteManager;
  [(CSDRouteManager *)&v4 dealloc];
}

- (BOOL)isAnyRouteAvailableWithUniqueIdentifier:(id)a3 forCall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  objc_super v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v8 = [(CSDRouteManager *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EE044;
  v12[3] = &unk_100507590;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (id)preferredRouteForCall:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1000EE20C;
  objc_super v17 = sub_1000EE21C;
  id v18 = 0;
  v5 = [v4 provider];
  unsigned __int8 v6 = [v5 isTinCanProvider];

  if ((v6 & 1) == 0)
  {
    id v7 = [(CSDRouteManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EE224;
    block[3] = &unk_100507368;
    v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)isEligibleRouteAvailable
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EE368;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasInEarRouteInTipiWithAndSmartRoutedToCompanionWatch
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EE584;
  v5[3] = &unk_100506E98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)hasInEarRouteInTipiWithCompanionWatch
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EE77C;
  v5[3] = &unk_100506E98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isEligibleRouteAvailableForCall:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE99C;
  block[3] = &unk_100507368;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)preferredAndActiveRouteForCall:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1000EE20C;
  objc_super v17 = sub_1000EE21C;
  id v18 = 0;
  v5 = [v4 provider];
  unsigned __int8 v6 = [v5 isTinCanProvider];

  if ((v6 & 1) == 0)
  {
    id v7 = [(CSDRouteManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EEBD8;
    block[3] = &unk_100507368;
    v12 = &v13;
    void block[4] = self;
    id v11 = v4;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)isAnyVehicleRouteAvailableForCall:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EED44;
  block[3] = &unk_100505DC0;
  void block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)isAnyBluetoothHeadphoneRouteAvailableForAnyCall
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EEE98;
  v5[3] = &unk_100506E98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isCarPlayRouteAvailable
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EF094;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isAnyVehicleRouteAvailableForAnyCall
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EF1A0;
  v5[3] = &unk_100506E98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)isCarModeActive
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EF39C;
  v5[3] = &unk_100506E98;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)aaDevicesDidChange
{
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF45C;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)pickableRoutesDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  id v7 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF5A0;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)preferredExternalRouteDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  id v7 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF6E4;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)carPlayIsConnectedChanged:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  id v7 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF864;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)mediaServicesWereResetNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }
  id v7 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF9E4;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)audioDeviceControllerDeviceListChanged:(id)a3
{
  id v4 = [(CSDRouteManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EFAB8;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)_postNotificationName:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:v4 object:0];
}

- (void)_updatePickableRoutes
{
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v3);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(CSDRouteManager *)self audioRouteCollections];
  v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    unsigned __int8 v8 = 0;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        if (v8) {
          unsigned __int8 v8 = 1;
        }
        else {
          unsigned __int8 v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) updatePickableRoutes];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);

    if (v8) {
      [(CSDRouteManager *)self _postNotificationName:@"CSDRouteManagerRoutesChangedNotification"];
    }
  }
  else
  {
  }
}

- (id)_audioRouteCollectionForCall:(id)a3
{
  id v4 = a3;
  v5 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc((Class)TUAudioRouteCollectionKey);
  id v7 = [v4 audioCategory];
  unsigned __int8 v8 = [v4 audioMode];
  id v9 = [v6 initWithCategory:v7 mode:v8];

  id v10 = [(CSDRouteManager *)self audioRouteCollections];
  long long v11 = [v10 objectForKeyedSubscript:v9];

  if (!v11)
  {
    long long v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [(CSDRouteManager *)self audioRouteCollections];
      long long v14 = [v4 audioCategory];
      uint64_t v15 = [v4 audioMode];
      int v17 = 138413058;
      id v18 = v13;
      __int16 v19 = 2112;
      v20 = v14;
      __int16 v21 = 2112;
      v22 = v15;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] No audio route collection found in audioRouteCollections: %@ for audio category %@ and audio mode %@ for call %@", (uint8_t *)&v17, 0x2Au);
    }
  }

  return v11;
}

- (BOOL)_isAnyAudioDevicePreferred
{
  v2 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v2);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  dispatch_queue_t v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 audioDeviceController];
  v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = ((char *)i + 1))
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isPreferredDevice])
        {
          id v6 = sub_100008DCC();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v16 = v9;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found preferred AVAudioDevice: %@", buf, 0xCu);
          }

          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (char)v6;
}

- (void)_initializeAudioRouteCollections
{
  v2 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v2);

  dispatch_queue_t v3 = +[NSMutableArray array];
  if (!qword_10058C438)
  {
    id v4 = (void **)CUTWeakLinkSymbol();
    if (v4) {
      v5 = *v4;
    }
    else {
      v5 = 0;
    }
    objc_storeStrong((id *)&qword_10058C438, v5);
  }
  if (!qword_10058C440)
  {
    id v6 = (void **)CUTWeakLinkSymbol();
    if (v6) {
      uint64_t v7 = *v6;
    }
    else {
      uint64_t v7 = 0;
    }
    objc_storeStrong((id *)&qword_10058C440, v7);
  }
  id v8 = objc_alloc((Class)TUAudioRouteCollectionKey);
  id v9 = [v8 initWithCategory:qword_10058C438 mode:qword_10058C440];
  [v3 addObject:v9];

  if (+[TUCallCapabilities supportsPrimaryCalling])
  {
    id v10 = [objc_alloc((Class)TUAudioRouteCollectionKey) initWithCategory:@"PhoneCall" mode:0];
    [v3 addObject:v10];
  }
  if (+[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls])
  {
    if (!qword_10058C448)
    {
      long long v11 = (void **)CUTWeakLinkSymbol();
      if (v11) {
        long long v12 = *v11;
      }
      else {
        long long v12 = 0;
      }
      objc_storeStrong((id *)&qword_10058C448, v12);
    }
    id v13 = objc_alloc((Class)TUAudioRouteCollectionKey);
    id v14 = [v13 initWithCategory:qword_10058C438 mode:qword_10058C448];
    [v3 addObject:v14];
  }
  if (+[TUCallCapabilities supportsDisplayingFaceTimeVideoCalls])
  {
    if (!qword_10058C450)
    {
      uint64_t v15 = (void **)CUTWeakLinkSymbol();
      if (v15) {
        uint64_t v16 = *v15;
      }
      else {
        uint64_t v16 = 0;
      }
      objc_storeStrong((id *)&qword_10058C450, v16);
    }
    id v17 = objc_alloc((Class)TUAudioRouteCollectionKey);
    id v18 = [v17 initWithCategory:qword_10058C438 mode:qword_10058C450];
    [v3 addObject:v18];
  }
  __int16 v19 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v20 = v3;
  id v21 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v32;
    do
    {
      id v24 = 0;
      do
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v24);
        v26 = [CSDAudioRouteCollection alloc];
        v27 = [v25 category];
        v28 = [v25 mode];
        v29 = [(CSDAudioRouteCollection *)v26 initWithCategory:v27 mode:v28 routeManager:self];

        [v19 setObject:v29 forKeyedSubscript:v25];
        id v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v22 = [v20 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v22);
  }

  [(CSDRouteManager *)self setAudioRouteCollections:v19];
}

- (void)_initializeAutomaticCarDNDStatusIfNecessary
{
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDRouteManager *)self automaticCarDNDStatus];
  if (v4)
  {
  }
  else if (MGGetBoolAnswer())
  {
    v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting initial state of CarKit's DND assertion", buf, 2u);
    }

    *(void *)buf = 0;
    id v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = objc_alloc_init((Class)CARAutomaticDNDStatus);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000F0688;
    v13[3] = &unk_1005075B8;
    uint64_t v15 = buf;
    id v8 = v6;
    id v14 = v8;
    [v7 fetchAutomaticDNDAssertionWithReply:v13];
    if (dispatch_semaphore_wait(v8, 0x12A05F200uLL))
    {
      id v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Timeout occured fetching CarPlay do not disturb status.", (uint8_t *)v12, 2u);
      }
    }
    else
    {
      objc_initWeak(v12, self);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000F0780;
      v10[3] = &unk_1005075E0;
      objc_copyWeak(&v11, v12);
      [v7 setStatusChangeObserver:v10];
      [(CSDRouteManager *)self setAutomaticCarDNDStatus:v7];
      [(CSDRouteManager *)self setCarModeActive:v17[24]];
      objc_destroyWeak(&v11);
      objc_destroyWeak(v12);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)_updateCarPlayDeviceConnected
{
  dispatch_queue_t v3 = [(CSDRouteManager *)self queue];
  dispatch_assert_queue_V2(v3);

  if (MGGetBoolAnswer())
  {
    id v4 = +[AVSystemController sharedAVSystemController];
    v5 = [v4 attributeForKey:AVSystemController_CarPlayIsConnectedAttribute];
    id v6 = [v5 BOOLValue];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating isCarPlayDeviceConnected to %d", (uint8_t *)v8, 8u);
  }

  [(CSDRouteManager *)self setCarPlayDeviceConnected:v6];
}

- (AADeviceManager)aaDeviceManager
{
  return self->_aaDeviceManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDictionary)audioRouteCollections
{
  return self->_audioRouteCollections;
}

- (void)setAudioRouteCollections:(id)a3
{
}

- (BOOL)isCarPlayDeviceConnected
{
  return self->_carPlayDeviceConnected;
}

- (void)setCarPlayDeviceConnected:(BOOL)a3
{
  self->_carPlayDeviceConnected = a3;
}

- (CARAutomaticDNDStatus)automaticCarDNDStatus
{
  return self->_automaticCarDNDStatus;
}

- (void)setAutomaticCarDNDStatus:(id)a3
{
}

- (void)setCarModeActive:(BOOL)a3
{
  self->_carModeActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticCarDNDStatus, 0);
  objc_storeStrong((id *)&self->_audioRouteCollections, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_aaDeviceManager, 0);
}

@end