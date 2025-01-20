@interface CARCarPlayServiceVehicle
- (BOOL)supportsBluetoothLE;
- (BOOL)supportsCarPlayConnectionRequest;
- (BOOL)supportsEnhancedIntegration;
- (BOOL)supportsThemeAssets;
- (BOOL)supportsUSBCarPlay;
- (BOOL)supportsWiredBluetoothPairing;
- (BOOL)supportsWirelessCarPlay;
- (CARBluetoothCarPlayService)service;
- (CARCarPlayServiceVehicleDelegate)delegate;
- (NSArray)accessoryProtocols;
- (NSData)certificateSerialNumber;
- (NSDictionary)analyticsDescription;
- (NSDictionary)digitalCarKeyInformation;
- (NSDictionary)vehicleAccessoryInfoKeys;
- (NSString)PPID;
- (NSString)bluetoothAddress;
- (NSString)description;
- (NSString)vehicleModelName;
- (NSString)vehicleName;
- (id)initFromBluetoothIdentifier:(id)a3 service:(id)a4 identificationMessage:(id)a5;
- (int64_t)transportType;
- (void)_handleStartSessionMessage:(id)a3;
- (void)sendCarPlayAvailability:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CARCarPlayServiceVehicle

- (id)initFromBluetoothIdentifier:(id)a3 service:(id)a4 identificationMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CARCarPlayServiceVehicle;
  v11 = [(CARCarPlayServiceVehicle *)&v26 init];
  v12 = v11;
  if (v11)
  {
    v11->_transportType = 4;
    uint64_t v13 = [v8 UUIDString];
    bluetoothAddress = v12->_bluetoothAddress;
    v12->_bluetoothAddress = (NSString *)v13;

    objc_storeWeak((id *)&v12->_service, v9);
    uint64_t v15 = [v10 displayName];
    vehicleName = v12->_vehicleName;
    v12->_vehicleName = (NSString *)v15;

    uint64_t v17 = [v10 modelName];
    vehicleModelName = v12->_vehicleModelName;
    v12->_vehicleModelName = (NSString *)v17;

    uint64_t v19 = [v10 PPID];
    PPID = v12->_PPID;
    v12->_PPID = (NSString *)v19;

    uint64_t v21 = [v10 accessoryProtocols];
    accessoryProtocols = v12->_accessoryProtocols;
    v12->_accessoryProtocols = (NSArray *)v21;

    uint64_t v23 = [v10 authenticationSerialNumber];
    certificateSerialNumber = v12->_certificateSerialNumber;
    v12->_certificateSerialNumber = (NSData *)v23;

    v12->_supportsUSBCarPlay = [v10 supportsWiredCarPlay];
    *(_WORD *)&v12->_supportsWirelessCarPlay = 257;
    v12->_supportsWiredBluetoothPairing = [v10 supportsWiredToWirelessPairing];
    v12->_supportsCarPlayConnectionRequest = 1;
    v12->_supportsEnhancedIntegration = [v10 supportsEnhancedIntegration];
    v12->_supportsThemeAssets = [v10 supportsThemeAssets];
  }

  return v12;
}

- (NSString)description
{
  v18.receiver = self;
  v18.super_class = (Class)CARCarPlayServiceVehicle;
  uint64_t v17 = [(CARCarPlayServiceVehicle *)&v18 description];
  int64_t v3 = [(CARCarPlayServiceVehicle *)self transportType];
  if ((unint64_t)(v3 - 1) > 3) {
    CFStringRef v4 = @"unknown";
  }
  else {
    CFStringRef v4 = *(&off_1000BEF10 + v3 - 1);
  }
  CFStringRef v16 = v4;
  uint64_t v15 = [(CARCarPlayServiceVehicle *)self bluetoothAddress];
  v5 = [(CARCarPlayServiceVehicle *)self vehicleName];
  v6 = [(CARCarPlayServiceVehicle *)self vehicleModelName];
  v7 = [(CARCarPlayServiceVehicle *)self PPID];
  id v8 = [(CARCarPlayServiceVehicle *)self certificateSerialNumber];
  if ([(CARCarPlayServiceVehicle *)self supportsUSBCarPlay]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if ([(CARCarPlayServiceVehicle *)self supportsWiredBluetoothPairing]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  if ([(CARCarPlayServiceVehicle *)self supportsEnhancedIntegration]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  if ([(CARCarPlayServiceVehicle *)self supportsThemeAssets]) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  uint64_t v13 = +[NSString stringWithFormat:@"%@ {transport: %@ btID: %@, name: %@, model: %@, PPID: %@, authSerial: %@, wired: %@, oob: %@, enhancedIntegration: %@, assets: %@}", v17, v16, v15, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSDictionary)digitalCarKeyInformation
{
  return 0;
}

- (NSDictionary)analyticsDescription
{
  int64_t v3 = +[NSMutableDictionary dictionary];
  CFStringRef v4 = [(CARCarPlayServiceVehicle *)self vehicleName];

  if (v4)
  {
    v5 = [(CARCarPlayServiceVehicle *)self vehicleName];
    [v3 setObject:v5 forKeyedSubscript:@"name"];
  }
  v6 = [(CARCarPlayServiceVehicle *)self vehicleModelName];

  if (v6)
  {
    v7 = [(CARCarPlayServiceVehicle *)self vehicleModelName];
    [v3 setObject:v7 forKeyedSubscript:@"modelName"];
  }
  id v8 = [v3 copy];

  return (NSDictionary *)v8;
}

- (NSDictionary)vehicleAccessoryInfoKeys
{
  int64_t v3 = +[NSMutableDictionary dictionary];
  CFStringRef v4 = [(CARCarPlayServiceVehicle *)self vehicleName];

  if (v4)
  {
    v5 = [(CARCarPlayServiceVehicle *)self vehicleName];
    [v3 setObject:v5 forKey:@"name"];
  }
  v6 = [(CARCarPlayServiceVehicle *)self vehicleModelName];

  if (v6)
  {
    v7 = [(CARCarPlayServiceVehicle *)self vehicleModelName];
    [v3 setObject:v7 forKey:@"modelName"];
  }
  id v8 = [(CARCarPlayServiceVehicle *)self PPID];

  if (v8)
  {
    CFStringRef v9 = [(CARCarPlayServiceVehicle *)self PPID];
    [v3 setObject:v9 forKey:@"ppid"];
  }
  id v10 = [v3 copy];

  return (NSDictionary *)v10;
}

- (void)sendCarPlayAvailability:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CARCarPlayServiceVehicle *)self service];
    if (v5)
    {
      v6 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412546;
        id v9 = v4;
        __int16 v10 = 2112;
        CFStringRef v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sending CarPlayAvailability: %@ using service: %@", (uint8_t *)&v8, 0x16u);
      }

      v7 = sub_10005C6FC(2uLL);
      if (os_signpost_enabled(v7))
      {
        LOWORD(v8) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SentCarPlayAvailability", (const char *)&unk_1000B1267, (uint8_t *)&v8, 2u);
      }

      [v5 sendMessage:v4];
    }
  }
}

- (void)_handleStartSessionMessage:(id)a3
{
  id v5 = a3;
  id v4 = [(CARCarPlayServiceVehicle *)self delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 serviceVehicle:self receivedStartSessionMessage:v5];
  }
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (NSString)bluetoothAddress
{
  return self->_bluetoothAddress;
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (NSString)vehicleModelName
{
  return self->_vehicleModelName;
}

- (NSData)certificateSerialNumber
{
  return self->_certificateSerialNumber;
}

- (NSString)PPID
{
  return self->_PPID;
}

- (NSArray)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (BOOL)supportsUSBCarPlay
{
  return self->_supportsUSBCarPlay;
}

- (BOOL)supportsWirelessCarPlay
{
  return self->_supportsWirelessCarPlay;
}

- (BOOL)supportsBluetoothLE
{
  return self->_supportsBluetoothLE;
}

- (BOOL)supportsWiredBluetoothPairing
{
  return self->_supportsWiredBluetoothPairing;
}

- (BOOL)supportsCarPlayConnectionRequest
{
  return self->_supportsCarPlayConnectionRequest;
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (BOOL)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (CARCarPlayServiceVehicleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CARCarPlayServiceVehicleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CARBluetoothCarPlayService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (CARBluetoothCarPlayService *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_certificateSerialNumber, 0);
  objc_storeStrong((id *)&self->_vehicleModelName, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);

  objc_storeStrong((id *)&self->_bluetoothAddress, 0);
}

@end