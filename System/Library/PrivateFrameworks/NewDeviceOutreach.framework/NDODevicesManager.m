@interface NDODevicesManager
- (NDODevicesManager)initWithNanoRegistry:(id)a3;
- (id)_pairedWatches;
- (id)allFUPEligibleDevices;
- (id)appleIDDevices;
- (id)defaultDevice;
- (id)pairedBTDevices;
- (id)pairedBTPioneerDevices;
- (id)pairedWatches;
- (id)primaryFUPEligibleDevices;
- (void)setAppleIDDeviceList:(id)a3;
@end

@implementation NDODevicesManager

- (NDODevicesManager)initWithNanoRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDODevicesManager;
  v6 = [(NDODevicesManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_nanoRegistry, a3);
  }

  return v7;
}

- (id)defaultDevice
{
  if (!+[NDOUtilities isInternal]) {
    goto LABEL_5;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"SerialNumber"];

  v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138477827;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "default device SerialNumber Override = %{private}@", (uint8_t *)&v14, 0xCu);
  }

  if (!v3)
  {
LABEL_5:
    v3 = (void *)MGCopyAnswer();
    id v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138477827;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "default device SerialNumber: '%{private}@'", (uint8_t *)&v14, 0xCu);
    }
  }
  v6 = (void *)MGCopyAnswer();
  v7 = (void *)MGCopyAnswer();
  v8 = (void *)MGCopyAnswer();
  objc_super v9 = +[NSUserDefaults standardUserDefaults];
  v10 = [v9 objectForKey:@"DefaultDeviceActivationDate"];

  if (!v10)
  {
    v10 = +[NSDate date];
    v11 = +[NSUserDefaults standardUserDefaults];
    [v11 setObject:v10 forKey:@"DefaultDeviceActivationDate"];
  }
  v12 = +[NDODevice deviceWithName:v6 serialNumber:v3 activationDate:v10 deviceType:0 productID:v7 productName:v8];

  return v12;
}

- (id)pairedWatches
{
  v51 = objc_opt_new();
  if (+[NDOUtilities isInternal])
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v49 = [v3 dictionaryForKey:@"PairedWatchesSerialNumbersMap"];
  }
  else
  {
    v49 = 0;
  }
  [(NDODevicesManager *)self _pairedWatches];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = *(id *)v57;
    uint64_t v7 = NRDevicePropertySerialNumber;
    uint64_t v45 = NRDevicePropertyName;
    uint64_t v40 = NRDevicePropertyLocalizedModel;
    uint64_t v44 = NRDevicePropertyPairedDate;
    uint64_t v43 = NRDevicePropertyProductType;
    v8 = &MGCopyAnswer_ptr;
    uint64_t v42 = NRDevicePropertyMarketingProductName;
    uint64_t v41 = NRDevicePropertyIsActive;
    uint64_t v46 = NRDevicePropertySerialNumber;
    id v47 = *(id *)v57;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(id *)v57 != v6) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v11 = [v10 valueForProperty:v7];
        if ([v8[111] isNotEmptyString:v11])
        {
          v12 = [v10 valueForProperty:v45];
          if (([v8[111] isNotEmptyString:v12] & 1) == 0)
          {
            uint64_t v13 = [v10 valueForProperty:v40];

            v12 = v13;
          }
          int v14 = [v49 objectForKey:v11];
          if ([v8[111] isNotEmptyString:v14])
          {
            v15 = _NDOLogSystem();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v62 = "-[NDODevicesManager pairedWatches]";
              __int16 v63 = 2112;
              v64 = v11;
              __int16 v65 = 2112;
              v66 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s: mapping watch serial:%@ to:%@", buf, 0x20u);
            }

            id v16 = v14;
            uint64_t v17 = +[NSString stringWithFormat:@"DBG-MAP:%@", v12];

            v12 = v17;
            v11 = v16;
          }
          v18 = [v10 valueForProperty:v44];
          v19 = [v10 valueForProperty:v43];
          v20 = [v10 valueForProperty:v42];
          v21 = [v10 valueForProperty:v41];
          v22 = +[NDODevice watchDeviceWithName:serialNumber:activationDate:isActive:productID:productName:](NDODevice, "watchDeviceWithName:serialNumber:activationDate:isActive:productID:productName:", v12, v11, v18, [v21 BOOLValue], v19, v20);
          [v51 setObject:v22 forKeyedSubscript:v11];

          uint64_t v7 = v46;
          id v6 = v47;
          v8 = &MGCopyAnswer_ptr;
        }
        else
        {
          v12 = _NDOLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[NDODevicesManager pairedWatches]";
            __int16 v63 = 2112;
            v64 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s -> missing serial number for device: %@", buf, 0x16u);
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    }
    while (v5);
  }
  if (+[NDOUtilities isInternal])
  {
    v23 = +[NSUserDefaults standardUserDefaults];
    v24 = [v23 objectForKey:@"PairedWatchesSerialNumbers"];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v48 = v24;
    id v25 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v53;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v48);
          }
          v29 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          v30 = +[NSUserDefaults standardUserDefaults];
          v31 = [v29 stringByAppendingString:@".activationInterval"];
          [v30 doubleForKey:v31];
          double v33 = v32;

          v34 = +[NSDate dateWithTimeIntervalSinceNow:v33];
          v35 = +[NSString stringWithFormat:@"DBG-ADD:%@", v29];
          v36 = +[NDODevice watchDeviceWithName:v35 serialNumber:v29 activationDate:v34 isActive:1 productID:@"Watch6,4" productName:@"Watch Series 7 Debug"];
          [v51 setObject:v36 forKeyedSubscript:v29];
        }
        id v26 = [v48 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v26);
    }
  }
  v37 = _NDOLogSystem();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "-[NDODevicesManager pairedWatches]";
    __int16 v63 = 2112;
    v64 = v51;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
  }

  id v38 = [v51 copy];
  return v38;
}

- (id)pairedBTDevices
{
  if (!+[NDOUtilities isInternal]) {
    goto LABEL_11;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryForKey:@"PairedBluetoothDevicesSerialNumbers"];

  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000118D8();
  }

  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v5 = [v3 allValues];
  if (!v5)
  {

LABEL_11:
    v10 = +[NSMutableDictionary dictionary];
    id v31 = 0;
    v11 = +[CBDiscovery devicesWithDiscoveryFlags:0x800000 error:&v31];
    id v12 = v31;
    if (v12) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      int v14 = _NDOLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000117E4();
      }
    }
    v15 = _NDOLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100011760(v11);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v11;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v21 deviceFlags])
          {
            v22 = [v21 serialNumber];

            if (v22)
            {
              v23 = +[NDODevice deviceWithCBDevice:v21];
              v24 = [v21 serialNumber];
              [v10 setObject:v23 forKeyedSubscript:v24];
            }
            else
            {
              v23 = _NDOLogSystem();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                v35 = "-[NDODevicesManager pairedBTDevices]";
                __int16 v36 = 2112;
                id v37 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s: No Serial AACP Device: %@ \n", buf, 0x16u);
              }
            }
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v18);
    }

    id v8 = [v10 copy];
    goto LABEL_35;
  }
  id v6 = (void *)v5;
  +[NSMutableDictionary dictionary];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100006128;
  v32[3] = &unk_10001C7B8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v7;
  [v6 enumerateObjectsUsingBlock:v32];
  id v8 = [v7 copy];
  objc_super v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100011864();
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_35:
  id v25 = _NDOLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[NDODevicesManager pairedBTDevices]";
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
  }

  return v8;
}

- (id)pairedBTPioneerDevices
{
  if (!+[NDOUtilities isInternal]) {
    goto LABEL_11;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 dictionaryForKey:@"PairedBluetoothPioneerDevicesSerialNumbers"];

  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100011AC4();
  }

  if (!v3) {
    goto LABEL_11;
  }
  uint64_t v5 = [v3 allValues];
  if (!v5)
  {

LABEL_11:
    v10 = +[NSMutableDictionary dictionary];
    id v31 = 0;
    v11 = +[CBDiscovery devicesWithDiscoveryFlags:0x800000 error:&v31];
    id v12 = v31;
    if (v12) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 0;
    }
    if (v13)
    {
      int v14 = _NDOLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000119D0();
      }
    }
    v15 = _NDOLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_10001194C(v11);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v11;
    id v17 = [v16 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v21 proximityPairingSubType] == 3)
          {
            v22 = [v21 serialNumber];

            if (v22)
            {
              v23 = +[NDODevice deviceWithCBDevice:v21 isVisibleInCC:0];
              v24 = [v21 serialNumber];
              [v10 setObject:v23 forKeyedSubscript:v24];
            }
            else
            {
              v23 = _NDOLogSystem();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136446466;
                v35 = "-[NDODevicesManager pairedBTPioneerDevices]";
                __int16 v36 = 2112;
                id v37 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s: No Serial Pencil Device: %@ \n", buf, 0x16u);
              }
            }
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v18);
    }

    id v8 = [v10 copy];
    goto LABEL_35;
  }
  id v6 = (void *)v5;
  +[NSMutableDictionary dictionary];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000066A8;
  v32[3] = &unk_10001C7B8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v33 = v7;
  [v6 enumerateObjectsUsingBlock:v32];
  id v8 = [v7 copy];
  objc_super v9 = _NDOLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100011A50();
  }

  if (!v8) {
    goto LABEL_11;
  }
LABEL_35:
  id v25 = _NDOLogSystem();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[NDODevicesManager pairedBTPioneerDevices]";
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s - %@", buf, 0x16u);
  }

  return v8;
}

- (id)primaryFUPEligibleDevices
{
  v3 = [(NDODevicesManager *)self defaultDevice];
  id v4 = [v3 serialNumber];
  v11 = v4;
  uint64_t v5 = [(NDODevicesManager *)self defaultDevice];
  id v12 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v7 = [v6 mutableCopy];

  id v8 = [(NDODevicesManager *)self pairedWatches];
  [v7 addEntriesFromDictionary:v8];

  objc_super v9 = +[NSDictionary dictionaryWithDictionary:v7];

  return v9;
}

- (id)allFUPEligibleDevices
{
  v3 = [(NDODevicesManager *)self defaultDevice];
  id v4 = [v3 serialNumber];
  id v12 = v4;
  uint64_t v5 = [(NDODevicesManager *)self defaultDevice];
  BOOL v13 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  id v7 = [v6 mutableCopy];

  id v8 = [(NDODevicesManager *)self pairedWatches];
  [v7 addEntriesFromDictionary:v8];

  objc_super v9 = [(NDODevicesManager *)self pairedBTDevices];
  [v7 addEntriesFromDictionary:v9];

  v10 = +[NSDictionary dictionaryWithDictionary:v7];

  return v10;
}

- (void)setAppleIDDeviceList:(id)a3
{
}

- (id)appleIDDevices
{
  v3 = +[NSMutableDictionary dictionaryWithCapacity:[(NSArray *)self->_appleIDDeviceList count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_appleIDDeviceList;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "serialNumber", (void)v12);
        [v3 setObject:v9 forKeyedSubscript:v10];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_pairedWatches
{
  v2 = [(NDONanoRegistry *)self->_nanoRegistry getAllDevicesWithArchivedAltAccountDevicesMatching:&stru_10001C7F8];
  v3 = _NDOLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[NDODevicesManager _pairedWatches]";
    __int16 v9 = 2112;
    v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -> pairedWatches: %@", (uint8_t *)&v7, 0x16u);
  }

  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = &__NSArray0__struct;
  }
  id v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDDeviceList, 0);
  objc_storeStrong((id *)&self->_nanoRegistry, 0);
}

@end