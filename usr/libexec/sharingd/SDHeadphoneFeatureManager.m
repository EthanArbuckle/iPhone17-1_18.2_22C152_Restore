@interface SDHeadphoneFeatureManager
- (BOOL)isProxCardSupportedByProductID:(int)a3;
- (BOOL)shouldShowProxCardForFeature:(int)a3;
- (BluetoothDevice)bluetoothDevice;
- (BluetoothManager)btManager;
- (NSString)bluetoothAddressString;
- (SDHeadphoneFeatureManager)initWithBluetoothAddress:(id)a3 productID:(unsigned int)a4;
- (id)getFeatureName:(int)a3;
- (void)setBluetoothDevice:(id)a3;
- (void)setBtManager:(id)a3;
@end

@implementation SDHeadphoneFeatureManager

- (SDHeadphoneFeatureManager)initWithBluetoothAddress:(id)a3 productID:(unsigned int)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SDHeadphoneFeatureManager;
  v7 = [(SDHeadphoneFeatureManager *)&v26 init];
  v8 = (NSString *)[v6 copy];
  bluetoothAddressString = v7->_bluetoothAddressString;
  v7->_bluetoothAddressString = v8;

  v7->_productID = a4;
  if (dword_100967350 <= 30 && (dword_100967350 != -1 || _LogCategory_Initialize()))
  {
    v21 = v7->_bluetoothAddressString;
    LogPrintF();
  }
  uint64_t v10 = +[BluetoothManager sharedInstance];
  btManager = v7->_btManager;
  v7->_btManager = (BluetoothManager *)v10;

  [(BluetoothManager *)v7->_btManager pairedDevices];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v18 = [v17 address];
        unsigned int v19 = [v18 isEqualToString:v7->_bluetoothAddressString];

        if (v19)
        {
          objc_storeStrong((id *)&v7->_bluetoothDevice, v17);
          if (dword_100967350 <= 30 && (dword_100967350 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          goto LABEL_18;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v7;
}

- (BOOL)shouldShowProxCardForFeature:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!a3)
  {
    uint64_t v5 = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v5 = 2;
LABEL_5:
    unsigned __int8 v6 = [(BluetoothDevice *)self->_bluetoothDevice isProxCardShowedForFeature:v5];
    unsigned __int8 v7 = [(BluetoothDevice *)self->_bluetoothDevice isProxCardSupportedForFeature:v5];
    BOOL v8 = v7 & ~v6 & [(SDHeadphoneFeatureManager *)self isProxCardSupportedByProductID:v3];
    if (dword_100967350 <= 115 && (dword_100967350 != -1 || _LogCategory_Initialize()))
    {
      v9 = [(SDHeadphoneFeatureManager *)self getFeatureName:v3];
      LogPrintF();
    }
    return v8;
  }
  if (dword_100967350 <= 115 && (dword_100967350 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  return 0;
}

- (BOOL)isProxCardSupportedByProductID:(int)a3
{
  if (a3 == 1)
  {
    id v3 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:self->_productID];
    unsigned __int8 v4 = [v3 supportsAdaptiveControlsProx];
  }
  else
  {
    if (a3) {
      return 0;
    }
    id v3 = [objc_alloc((Class)SFHeadphoneProduct) initWithProductID:self->_productID];
    unsigned __int8 v4 = [v3 supportsMuteCallProx];
  }
  BOOL v5 = v4;

  return v5;
}

- (id)getFeatureName:(int)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"Adaptive Controls";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Mute Call";
  }
}

- (NSString)bluetoothAddressString
{
  return self->_bluetoothAddressString;
}

- (BluetoothDevice)bluetoothDevice
{
  return self->_bluetoothDevice;
}

- (void)setBluetoothDevice:(id)a3
{
}

- (BluetoothManager)btManager
{
  return self->_btManager;
}

- (void)setBtManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btManager, 0);
  objc_storeStrong((id *)&self->_bluetoothDevice, 0);

  objc_storeStrong((id *)&self->_bluetoothAddressString, 0);
}

@end