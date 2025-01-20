@interface VOSBluetoothManager
+ (id)sharedInstance;
- (BOOL)btleDeviceIsPaired:(id)a3;
- (BOOL)isPairedDeviceBrailleDisplay:(id)a3;
- (BOOL)isValidBrailleDevice:(id)a3;
- (BOOL)unpairDevice:(id)a3;
- (NSArray)pairedBrailleDevices;
- (id)alertControllerWithVOSBluetoothResult:(unint64_t)a3 device:(id)a4 buttonHandler:(id)a5;
- (void)_removeDeviceFromBrailleCache:(id)a3;
- (void)unpairBTLEDevice:(id)a3;
@end

@implementation VOSBluetoothManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  }
  if (([(id)_bluetoothManagerSharedInstance available] & 1) == 0) {
    [(id)_bluetoothManagerSharedInstance attach:&unk_26CC93840];
  }
  v2 = (void *)_bluetoothManagerSharedInstance;

  return v2;
}

void __37__VOSBluetoothManager_sharedInstance__block_invoke()
{
  if (!_bluetoothManagerSharedInstance)
  {
    _bluetoothManagerSharedInstance = [objc_allocWithZone((Class)VOSBluetoothManager) init];
    MEMORY[0x270F9A758]();
  }
}

- (BOOL)isValidBrailleDevice:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42 = [v4 name];
  if ([v4 isNameCached])
  {
    if (!self->_brailleDriverDeviceDetectionInfo)
    {
      v5 = [MEMORY[0x263F086E0] brailleDriverDeviceDetectionInfo];
      brailleDriverDeviceDetectionInfo = self->_brailleDriverDeviceDetectionInfo;
      self->_brailleDriverDeviceDetectionInfo = v5;
    }
    v7 = [MEMORY[0x263F087F0] expressionForEvaluatedObject];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v8 = self->_brailleDriverDeviceDetectionInfo;
    uint64_t v9 = [(NSDictionary *)v8 countByEnumeratingWithState:&v47 objects:v58 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v41 = *(void *)v48;
      id v38 = v4;
      v39 = v8;
      v36 = self;
      do
      {
        uint64_t v11 = 0;
        v12 = (void *)MEMORY[0x263F67040];
        uint64_t v37 = v10;
        do
        {
          if (*(void *)v48 != v41) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * v11);
          buf[0] = 0;
          v14 = [(NSDictionary *)self->_brailleDriverDeviceDetectionInfo objectForKey:v13];
          v15 = __UIAccessibilitySafeClass();

          if (buf[0]) {
            abort();
          }
          v16 = [v15 objectForKey:*v12];
          if (v16)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v40 = v16;
              v17 = [v16 objectForKey:*MEMORY[0x263F67038]];
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              id v18 = v17;
              uint64_t v19 = [v18 countByEnumeratingWithState:&v43 objects:v57 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v44;
                while (2)
                {
                  for (uint64_t i = 0; i != v20; ++i)
                  {
                    if (*(void *)v44 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    v23 = (void *)[objc_allocWithZone(MEMORY[0x263F08750]) initWithObject:*(void *)(*((void *)&v43 + 1) + 8 * i)];
                    v24 = v7;
                    v25 = (void *)[objc_allocWithZone(MEMORY[0x263F08720]) initWithLeftExpression:v7 rightExpression:v23 modifier:0 type:6 options:0];
                    int v26 = [v25 evaluateWithObject:v42];

                    if (v26)
                    {

                      BOOL v27 = 1;
                      id v4 = v38;
                      v7 = v24;
                      goto LABEL_30;
                    }
                    v7 = v24;
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v43 objects:v57 count:16];
                  if (v20) {
                    continue;
                  }
                  break;
                }
              }

              self = v36;
              v8 = v39;
              v16 = v40;
              uint64_t v10 = v37;
              v12 = (void *)MEMORY[0x263F67040];
            }
          }

          ++v11;
        }
        while (v11 != v10);
        uint64_t v10 = [(NSDictionary *)v8 countByEnumeratingWithState:&v47 objects:v58 count:16];
        id v4 = v38;
      }
      while (v10);
    }

    [v4 device];
    BTDeviceGetSupportedServices();
    [v4 device];
    BTDeviceGetDeviceType();
    BOOL v27 = 0;
    v28 = AXLogBrailleHW();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [NSNumber numberWithBool:0];
      v30 = [NSNumber numberWithUnsignedInt:0];
      [NSNumber numberWithUnsignedInt:0];
      v32 = v31 = v7;
      *(_DWORD *)buf = 138412802;
      v52 = v29;
      __int16 v53 = 2112;
      v54 = v30;
      __int16 v55 = 2112;
      v56 = v32;
      _os_log_impl(&dword_21C3F9000, v28, OS_LOG_TYPE_DEFAULT, "Check service type: %@ = %@ %@", buf, 0x20u);

      v7 = v31;
    }

LABEL_30:
    v33 = AXLogBrailleHW();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = [NSNumber numberWithBool:v27];
      *(_DWORD *)buf = 138412546;
      v52 = v34;
      __int16 v53 = 2112;
      v54 = v42;
      _os_log_impl(&dword_21C3F9000, v33, OS_LOG_TYPE_DEFAULT, "Valid braille device %@ %@", buf, 0x16u);
    }
  }
  else
  {
    v7 = AXLogBrailleHW();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C3F9000, v7, OS_LOG_TYPE_DEFAULT, "Not valid braille device: no name cache", buf, 2u);
    }
    LOBYTE(v27) = 0;
  }

  return v27;
}

- (BOOL)isPairedDeviceBrailleDisplay:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", 0);
  v5 = [v4 voiceOverBrailleDisplays];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = (void *)MEMORY[0x263F67030];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) objectForKey:*v9];
        v12 = [v3 address];
        char v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          BOOL v15 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v5 = VOTLogBraille();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = [v3 address];
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_21C3F9000, v5, OS_LOG_TYPE_INFO, "Skipping paired device %@ because did not match paired Braille devices", buf, 0xCu);
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (void)unpairBTLEDevice:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VOSBluetoothManager;
  id v4 = a3;
  [(AXUIBluetoothHelper *)&v5 unpairBTLEDevice:v4];
  -[VOSBluetoothManager _removeDeviceFromBrailleCache:](self, "_removeDeviceFromBrailleCache:", v4, v5.receiver, v5.super_class);
}

- (BOOL)unpairDevice:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VOSBluetoothManager;
  BOOL v5 = [(AXUIBluetoothHelper *)&v7 unpairDevice:v4];
  if (v5) {
    [(VOSBluetoothManager *)self _removeDeviceFromBrailleCache:v4];
  }

  return v5;
}

- (NSArray)pairedBrailleDevices
{
  id v3 = [(AXUIBluetoothHelper *)self pairedDevices];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__VOSBluetoothManager_pairedBrailleDevices__block_invoke;
  v6[3] = &unk_2643FDAD8;
  v6[4] = self;
  id v4 = [v3 axFilterObjectsUsingBlock:v6];

  return (NSArray *)v4;
}

uint64_t __43__VOSBluetoothManager_pairedBrailleDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isValidBrailleDevice:a2];
}

- (BOOL)btleDeviceIsPaired:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VOSBluetoothManager;
  if ([(AXUIBluetoothHelper *)&v14 btleDeviceIsPaired:v4]
    || ([v4 address],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay(),
        char v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v10 = [v9 voiceOverBrailleDisplays];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __42__VOSBluetoothManager_btleDeviceIsPaired___block_invoke;
    v12[3] = &unk_2643FDB00;
    id v13 = v4;
    char v8 = objc_msgSend(v10, "ax_containsObjectUsingBlock:", v12);
  }
  return v8;
}

uint64_t __42__VOSBluetoothManager_btleDeviceIsPaired___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:*MEMORY[0x263F67030]];
  id v4 = [*(id *)(a1 + 32) address];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_removeDeviceFromBrailleCache:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F22978] sharedInstance];
  char v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    char v7 = [MEMORY[0x263F22978] identifier];
    char v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = AXColorizeFormatLog();
      id v33 = v4;
      uint64_t v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v11;
        _os_log_impl(&dword_21C3F9000, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  v12 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", v33);
  uint64_t v13 = [v12 voiceOverBrailleDisplays];
  objc_super v14 = (void *)[(id)v13 mutableCopy];

  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  uint64_t v37 = __53__VOSBluetoothManager__removeDeviceFromBrailleCache___block_invoke;
  id v38 = &unk_2643FDB28;
  id v15 = v4;
  id v39 = v15;
  objc_msgSend(v14, "ax_removeObjectsFromArrayUsingBlock:", &v35);
  v16 = [MEMORY[0x263F22978] sharedInstance];
  LOBYTE(v13) = [v16 ignoreLogging];

  if ((v13 & 1) == 0)
  {
    long long v17 = [MEMORY[0x263F22978] identifier];
    long long v18 = AXLoggerForFacility();

    os_log_type_t v19 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v19))
    {
      long long v20 = AXColorizeFormatLog();
      v34 = v14;
      uint64_t v21 = _AXStringForArgs();
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v21;
        _os_log_impl(&dword_21C3F9000, v18, v19, "%{public}@", buf, 0xCu);
      }
    }
  }
  v22 = objc_msgSend(MEMORY[0x263F22938], "sharedInstance", v34, v35, v36, v37, v38);
  [v22 setVoiceOverBrailleDisplays:v14];

  v23 = [v15 address];
  uint64_t v24 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay();
  int v25 = [v23 isEqualToString:v24];

  if (v25)
  {
    _AXSVoiceOverTouchSetTactileGraphicsDisplay();
    int v26 = [MEMORY[0x263F22978] sharedInstance];
    char v27 = [v26 ignoreLogging];

    if ((v27 & 1) == 0)
    {
      v28 = [MEMORY[0x263F22978] identifier];
      v29 = AXLoggerForFacility();

      os_log_type_t v30 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = AXColorizeFormatLog();
        v32 = _AXStringForArgs();
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v41 = v32;
          _os_log_impl(&dword_21C3F9000, v29, v30, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
  [(AXUIBluetoothHelper *)self postNotificationName:*MEMORY[0x263F22A40] object:v15];
}

uint64_t __53__VOSBluetoothManager__removeDeviceFromBrailleCache___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:*MEMORY[0x263F67030]];
  id v4 = [*(id *)(a1 + 32) address];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)alertControllerWithVOSBluetoothResult:(unint64_t)a3 device:(id)a4 buttonHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (*MEMORY[0x263F22A38] == a3)
  {
    os_log_type_t v9 = NSString;
    uint64_t v10 = VOSLocString(@"ERROR_UNSUPPORTED_DEVICE");
    uint64_t v11 = [v7 name];
    v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);

    if ([v7 paired]) {
      uint64_t v13 = @"FORGET_DEVICE";
    }
    else {
      uint64_t v13 = @"OK";
    }
    goto LABEL_17;
  }
  if (*MEMORY[0x263F22A30] == a3)
  {
    objc_super v14 = NSString;
    id v15 = @"ERROR_INCORRECT_PIN";
  }
  else if (*MEMORY[0x263F22A20] == a3)
  {
    objc_super v14 = NSString;
    id v15 = @"LOADING_FAILURE";
  }
  else
  {
    if (*MEMORY[0x263F22A28] == a3)
    {
      if ([v7 paired])
      {
        v16 = 0;
        v12 = 0;
        goto LABEL_18;
      }
      os_log_type_t v30 = NSString;
      long long v17 = VOSLocString(@"ERROR_PAIRING_TIMEOUT");
      v31 = NSString;
      v32 = VOSLocString(@"ERROR_GEN_PAIRING_FAILURE");
      id v33 = [v7 name];
      v34 = objc_msgSend(v31, "stringWithFormat:", v32, v33);
      v12 = [v30 stringWithFormat:@"%@ %@", v17, v34];

      goto LABEL_16;
    }
    objc_super v14 = NSString;
    if ([v7 paired]) {
      id v15 = @"ERROR_GEN_CONNECTION_FAILURE";
    }
    else {
      id v15 = @"ERROR_GEN_PAIRING_FAILURE";
    }
  }
  long long v17 = VOSLocString(v15);
  long long v18 = [v7 name];
  v12 = objc_msgSend(v14, "stringWithFormat:", v17, v18);

LABEL_16:
  uint64_t v13 = @"OK";
LABEL_17:
  v16 = VOSLocString(v13);
LABEL_18:
  uint64_t v43 = 0;
  long long v44 = &v43;
  uint64_t v45 = 0x2050000000;
  os_log_type_t v19 = (void *)getUIAlertControllerClass_softClass;
  uint64_t v46 = getUIAlertControllerClass_softClass;
  if (!getUIAlertControllerClass_softClass)
  {
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __getUIAlertControllerClass_block_invoke;
    uint64_t v41 = &unk_2643FD9C0;
    uint64_t v42 = &v43;
    __getUIAlertControllerClass_block_invoke((uint64_t)&v38);
    os_log_type_t v19 = (void *)v44[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v43, 8);
  if ([v7 paired]) {
    uint64_t v21 = @"CONNECTION_FAILED_TITLE";
  }
  else {
    uint64_t v21 = @"PAIRING_FAILED_TITLE";
  }
  v22 = VOSLocString(v21);
  v23 = [v20 alertControllerWithTitle:v22 message:v12 preferredStyle:1];

  uint64_t v43 = 0;
  long long v44 = &v43;
  uint64_t v45 = 0x2050000000;
  uint64_t v24 = (void *)getUIAlertActionClass_softClass;
  uint64_t v46 = getUIAlertActionClass_softClass;
  if (!getUIAlertActionClass_softClass)
  {
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __getUIAlertActionClass_block_invoke;
    uint64_t v41 = &unk_2643FD9C0;
    uint64_t v42 = &v43;
    __getUIAlertActionClass_block_invoke((uint64_t)&v38);
    uint64_t v24 = (void *)v44[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v43, 8);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __82__VOSBluetoothManager_alertControllerWithVOSBluetoothResult_device_buttonHandler___block_invoke;
  v35[3] = &unk_2643FDB50;
  id v36 = v7;
  id v37 = v8;
  id v26 = v8;
  id v27 = v7;
  v28 = [v25 actionWithTitle:v16 style:0 handler:v35];
  [v23 addAction:v28];

  return v23;
}

uint64_t __82__VOSBluetoothManager_alertControllerWithVOSBluetoothResult_device_buttonHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 title];
  id v4 = VOSLocString(@"FORGET_DEVICE");
  int v5 = [v3 isEqualToString:v4];

  if (v5) {
    [*(id *)(a1 + 32) unpair];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end