@interface CRBluetoothManager
+ (BOOL)hasPairingSupportingCarPlayWithAddress:(id)a3;
+ (BOOL)hasPairingWithAddress:(id)a3;
+ (id)_sanitizeName:(id)a3;
+ (id)addressStringForData:(id)a3;
- (BOOL)isPowered;
- (BOOL)unpairWithBluetoothAddress:(id)a3;
- (CARObserverHashTable)observers;
- (CRBluetoothManager)init;
- (CRBluetoothManagerPairingDelegate)pairingDelegate;
- (NSString)currentlyPairingAddress;
- (id)_deviceForBluetoothAddress:(id)a3;
- (id)connectedBluetoothAddresses;
- (unint64_t)connectedServicesCountForBluetoothAddress:(id)a3;
- (void)_pairingCompletedForDevice:(id)a3;
- (void)_pairingFailedForDevice:(id)a3 didTimeout:(BOOL)a4;
- (void)_requestConfirmationForDevice:(id)a3 numericCode:(id)a4;
- (void)addObserver:(id)a3;
- (void)bluetoothPowerStateChanged:(id)a3;
- (void)confirmPairingWithBluetoothAddress:(id)a3 numericCode:(id)a4;
- (void)connectWithBluetoothAddress:(id)a3;
- (void)dealloc;
- (void)numericComparisonRequestHandler:(id)a3;
- (void)pairWithBluetoothAddress:(id)a3;
- (void)pairingFailureHandler:(id)a3;
- (void)pairingSuccessHandler:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setContactsSyncEnabled:(BOOL)a3 forBluetoothAddress:(id)a4;
- (void)setCurrentlyPairingAddress:(id)a3;
- (void)setPairingDelegate:(id)a3;
- (void)setPowered:(BOOL)a3;
@end

@implementation CRBluetoothManager

+ (id)addressStringForData:(id)a3
{
  id v3 = a3;
  v4 = v3;
  __int16 v11 = 0;
  int v10 = 0;
  if (!v3 || [v3 length] != (id)6)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  [v4 getBytes:&v10 length:6];
  int v5 = BTDeviceAddressToString();
  if (v5)
  {
    int v6 = v5;
    v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100075C70((uint64_t)v4, v6, v7);
    }

    goto LABEL_7;
  }
  v8 = +[NSString stringWithUTF8String:v12];
LABEL_8:

  return v8;
}

+ (id)_sanitizeName:(id)a3
{
  id v3 = a3;
  v4 = +[NSScanner scannerWithString:v3];
  int v5 = +[NSCharacterSet illegalCharacterSet];
  [v4 setCharactersToBeSkipped:v5];

  int v6 = +[NSMutableString string];
  id v7 = +[NSMutableString string];
  while (1)
  {
    v8 = v7;
    v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v16 = v7;
    unsigned int v10 = [v4 scanUpToCharactersFromSet:v9 intoString:&v16];
    id v7 = v16;

    if (!v10) {
      break;
    }
    [v6 appendString:v7];
    __int16 v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    unsigned int v12 = [v4 scanCharactersFromSet:v11 intoString:0];

    if (v12) {
      [v6 appendString:@" "];
    }
  }
  if ((unint64_t)[v6 length] < 0x33)
  {
    id v13 = v6;
  }
  else
  {
    id v13 = [v6 substringToIndex:50];
  }
  v14 = v13;

  return v14;
}

- (CRBluetoothManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)CRBluetoothManager;
  v2 = [(CRBluetoothManager *)&v13 init];
  if (v2)
  {
    id v3 = +[BluetoothManager sharedInstance];
    v4 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CRBluetoothManagerObserving];
    observers = v2->_observers;
    v2->_observers = v4;

    int v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"bluetoothPowerStateChanged:" name:BluetoothPowerChangedNotification object:0];

    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"pairingFailureHandler:" name:BluetoothPairingPINResultFailedNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"pairingSuccessHandler:" name:BluetoothPairingPINResultSuccessNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"numericComparisonRequestHandler:" name:BluetoothPairingPassKeyDisplayNotification object:0];

    unsigned int v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"numericComparisonRequestHandler:" name:BluetoothPairingUserConfirmationNotification object:0];

    __int16 v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"numericComparisonRequestHandler:" name:BluetoothPairingUserNumericComparisionNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRBluetoothManager;
  [(CRBluetoothManager *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRBluetoothManager *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRBluetoothManager *)self observers];
  [v5 removeObserver:v4];
}

- (id)connectedBluetoothAddresses
{
  v2 = +[NSMutableSet set];
  id v3 = +[BluetoothManager sharedInstance];
  id v4 = [v3 connectedDevices];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = [*(id *)(*((void *)&v25 + 1) + 8 * i) address];
        if (v10) {
          [v2 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v7);
  }

  __int16 v11 = +[BluetoothManager sharedInstance];
  unsigned int v12 = [v11 connectingDevices];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) address:v21];
        if (v18) {
          [v2 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v15);
  }

  v19 = CarGeneralLogging();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v2;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "connected BT Classic addresses: %@", buf, 0xCu);
  }

  return v2;
}

- (id)_deviceForBluetoothAddress:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[BluetoothManager sharedInstance];
    id v5 = [v4 pairedDevices];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        unsigned int v12 = [v11 address];
        unsigned __int8 v13 = [v3 isEqualToString:v12];

        if (v13) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v11;

      if (v14) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_10:
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = +[BluetoothManager sharedInstance];
    uint64_t v16 = [v15 connectingDevices];

    id v14 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v17 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v16);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v20 = [v19 address];
          unsigned int v21 = [v3 isEqualToString:v20];

          if (v21)
          {
            id v14 = v19;
            goto LABEL_23;
          }
        }
        id v14 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_23:

LABEL_24:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)pairWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  [(CRBluetoothManager *)self setCurrentlyPairingAddress:v4];
  id v5 = +[BluetoothManager sharedInstance];
  id v6 = [v5 deviceFromAddressString:v4];

  id v7 = CarPairingLogging();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 141558275;
      uint64_t v13 = 1752392040;
      __int16 v14 = 2113;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "starting pairing for device address %{private, mask.hash}@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v9 = +[BluetoothManager sharedInstance];
    [v9 setDevicePairingEnabled:1];

    uint64_t v10 = +[BluetoothManager sharedInstance];
    [v10 setConnectable:1];

    __int16 v11 = +[BluetoothManager sharedInstance];
    [v11 connectDevice:v6];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100075CF8();
    }

    __int16 v11 = [(CRBluetoothManager *)self pairingDelegate];
    if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v11 bluetoothManager:self failedPairingForDeviceAddress:v4 name:0 didTimeout:0];
    }
  }
}

- (void)confirmPairingWithBluetoothAddress:(id)a3 numericCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CRBluetoothManager *)self setCurrentlyPairingAddress:v6];
  id v8 = +[BluetoothManager sharedInstance];
  uint64_t v9 = [v8 deviceFromAddressString:v6];

  uint64_t v10 = CarPairingLogging();
  __int16 v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 141558275;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2113;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "confirming pairing for device address %{private, mask.hash}@", (uint8_t *)&v15, 0x16u);
    }

    int v12 = +[BluetoothManager sharedInstance];
    [v12 setDevicePairingEnabled:1];

    uint64_t v13 = +[BluetoothManager sharedInstance];
    [v13 setConnectable:1];

    [(CRBluetoothManager *)self _requestConfirmationForDevice:v9 numericCode:v7];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100075CF8();
    }

    __int16 v14 = [(CRBluetoothManager *)self pairingDelegate];
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v14 bluetoothManager:self failedPairingForDeviceAddress:v6 name:0 didTimeout:0];
    }
  }
}

- (BOOL)unpairWithBluetoothAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(CRBluetoothManager *)self _deviceForBluetoothAddress:v4];
  id v6 = +[BluetoothManager sharedInstance];
  [v6 setDevicePairingEnabled:1];

  [v5 unpair];
  id v7 = +[BluetoothManager sharedInstance];
  [v7 setDevicePairingEnabled:0];

  id v8 = CarPairingLogging();
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v5 address];
      int v12 = 141558275;
      uint64_t v13 = 1752392040;
      __int16 v14 = 2113;
      int v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "unpaired device: %{private, mask.hash}@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_100075D60();
  }

  return v5 != 0;
}

- (unint64_t)connectedServicesCountForBluetoothAddress:(id)a3
{
  id v3 = [(CRBluetoothManager *)self _deviceForBluetoothAddress:a3];
  id v4 = v3;
  if (v3) {
    id v5 = [v3 connectedServicesCount];
  }
  else {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (void)setContactsSyncEnabled:(BOOL)a3 forBluetoothAddress:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  id v6 = +[BluetoothManager sharedInstance];
  id v7 = [v6 deviceFromAddressString:v5];

  if (v7)
  {
    unint64_t v8 = (unint64_t)[v7 syncSettings] & 0xFFFF00FF;
    unint64_t v9 = (unint64_t)&_mh_execute_header;
    if (v4) {
      unint64_t v9 = 0x100000100;
    }
    [v7 setSyncSettings:v9 | v8];
    uint64_t v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      int v12 = 138543875;
      if (v4) {
        CFStringRef v11 = @"YES";
      }
      CFStringRef v13 = v11;
      __int16 v14 = 2160;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2113;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "set contacts sync enabled: %{public}@ for device (%{private, mask.hash}@)", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = CarGeneralLogging();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100075DC8();
    }
  }
}

+ (BOOL)hasPairingSupportingCarPlayWithAddress:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[BluetoothManager sharedInstance];
  id v5 = [v4 pairedDevices];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005F5CC;
  v8[3] = &unk_1000BF598;
  id v9 = v3;
  id v6 = v3;
  LOBYTE(v4) = [v5 indexOfObjectPassingTest:v8] != (id)0x7FFFFFFFFFFFFFFFLL;

  return (char)v4;
}

+ (BOOL)hasPairingWithAddress:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[BluetoothManager sharedInstance];
  id v5 = [v4 pairedDevices];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005F70C;
  v8[3] = &unk_1000BF598;
  id v9 = v3;
  id v6 = v3;
  LOBYTE(v4) = [v5 indexOfObjectPassingTest:v8] != (id)0x7FFFFFFFFFFFFFFFLL;

  return (char)v4;
}

- (void)connectWithBluetoothAddress:(id)a3
{
  id v3 = [(CRBluetoothManager *)self _deviceForBluetoothAddress:a3];
  [v3 connect];
}

- (void)setPowered:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[BluetoothManager sharedInstance];
  [v4 setPowered:v3];
}

- (BOOL)isPowered
{
  v2 = +[BluetoothManager sharedInstance];
  unsigned __int8 v3 = [v2 powered];

  return v3;
}

- (void)_requestConfirmationForDevice:(id)a3 numericCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 address];
  id v9 = objc_opt_class();
  uint64_t v10 = [v6 name];
  CFStringRef v11 = [v9 _sanitizeName:v10];

  int v12 = CarPairingLogging();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    uint64_t v18 = 1752392040;
    __int16 v19 = 2113;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "requesting numeric comparison confirmation for device %{private, mask.hash}@", buf, 0x16u);
  }

  CFStringRef v13 = [(CRBluetoothManager *)self pairingDelegate];
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10005FA08;
    v14[3] = &unk_1000BF5C0;
    v14[4] = self;
    id v15 = v6;
    id v16 = v8;
    [v13 bluetoothManager:self requestsConfirmationForDeviceAddress:v16 name:v11 numericCode:v7 responseHandler:v14];
  }
}

- (void)_pairingFailedForDevice:(id)a3 didTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 address];
  unint64_t v8 = objc_opt_class();
  id v9 = [v6 name];

  uint64_t v10 = [v8 _sanitizeName:v9];

  CFStringRef v11 = CarPairingLogging();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 141558275;
    uint64_t v16 = 1752392040;
    __int16 v17 = 2113;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "pairing failed for device %{private, mask.hash}@", (uint8_t *)&v15, 0x16u);
  }

  int v12 = +[BluetoothManager sharedInstance];
  [v12 setDevicePairingEnabled:0];

  CFStringRef v13 = +[BluetoothManager sharedInstance];
  [v13 setConnectable:0];

  __int16 v14 = [(CRBluetoothManager *)self pairingDelegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 bluetoothManager:self failedPairingForDeviceAddress:v7 name:v10 didTimeout:v4];
  }
}

- (void)_pairingCompletedForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 address];
  id v6 = objc_opt_class();
  id v7 = [v4 name];

  unint64_t v8 = [v6 _sanitizeName:v7];

  id v9 = CarPairingLogging();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 141558275;
    uint64_t v14 = 1752392040;
    __int16 v15 = 2113;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "pairing completed for device %{private, mask.hash}@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v10 = +[BluetoothManager sharedInstance];
  [v10 setDevicePairingEnabled:0];

  CFStringRef v11 = +[BluetoothManager sharedInstance];
  [v11 setConnectable:0];

  int v12 = [(CRBluetoothManager *)self pairingDelegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 bluetoothManager:self completedPairingForDeviceAddress:v5 deviceName:v8];
  }
}

- (void)bluetoothPowerStateChanged:(id)a3
{
  BOOL v4 = [(CRBluetoothManager *)self isPowered];
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v4];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BT power state changed: %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(CRBluetoothManager *)self observers];
  [v7 bluetoothManager:self didChangePowerState:v4];
}

- (void)pairingFailureHandler:(id)a3
{
  id v4 = a3;
  id v8 = [v4 object];
  id v5 = [v4 userInfo];

  id v6 = [v5 objectForKey:BluetoothErrorKey];

  BOOL v7 = v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [v6 intValue] == 316;
  [(CRBluetoothManager *)self _pairingFailedForDevice:v8 didTimeout:v7];
}

- (void)pairingSuccessHandler:(id)a3
{
  id v4 = [a3 object];
  [(CRBluetoothManager *)self _pairingCompletedForDevice:v4];
}

- (void)numericComparisonRequestHandler:(id)a3
{
  id v4 = a3;
  id v5 = CarPairingLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 name];
    BOOL v7 = [v4 object];
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "numericComparisonRequestHandler received %@ for %@", buf, 0x16u);
  }
  id v8 = [v4 name];
  unsigned int v9 = [v8 isEqualToString:BluetoothPairingUserNumericComparisionNotification];

  if (v9)
  {
    uint64_t v10 = [v4 object];
    CFStringRef v11 = [v10 valueForKey:@"device"];

    int v12 = [v4 object];
    int v13 = [v12 valueForKey:@"value"];

    uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%06u", [v13 unsignedIntValue]);
    [(CRBluetoothManager *)self _requestConfirmationForDevice:v11 numericCode:v14];
  }
  else
  {
    CFStringRef v11 = CarPairingLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100075EA8(v4, v11);
    }
  }
}

- (CRBluetoothManagerPairingDelegate)pairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);

  return (CRBluetoothManagerPairingDelegate *)WeakRetained;
}

- (void)setPairingDelegate:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (NSString)currentlyPairingAddress
{
  return self->_currentlyPairingAddress;
}

- (void)setCurrentlyPairingAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPairingAddress, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_pairingDelegate);
}

@end