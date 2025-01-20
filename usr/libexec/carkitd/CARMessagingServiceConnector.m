@interface CARMessagingServiceConnector
- (ACCConnectionInfo)coreAccessoriesManager;
- (BOOL)unpairWithBluetoothLEIdentifier:(id)a3;
- (CARCarPlayServiceConnector)serviceConnector;
- (CARMessagingServiceConnector)initWithVehicleStore:(id)a3;
- (CARMessagingServiceConnectorDelegate)delegate;
- (CRVehicleAccessoryManager)accessoryManager;
- (NSSet)connectedVehicles;
- (id)_usbSerialNumber;
- (id)vehicleAccessoryForCertificateSerial:(id)a3;
- (id)vehicleAccessoryForiAPConnectionIdentifier:(unint64_t)a3;
- (void)_updateCarKeyInformationForVehicleAccessory:(id)a3;
- (void)accessoryManager:(id)a3 didConnectUnsupportedAccessoryWithBluetoothAddress:(id)a4;
- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4;
- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4;
- (void)accessoryManager:(id)a3 didUpdateVehicleAccessory:(id)a4;
- (void)beginWiredBluetoothPairingWithVehicle:(id)a3 completion:(id)a4;
- (void)connectWithBluetoothLEIdentifier:(id)a3;
- (void)pairWithBluetoothLEIdentifier:(id)a3 deviceName:(id)a4;
- (void)requestWiFiCredentialsFromVehicle:(id)a3;
- (void)sendDeviceTransportIdentifiersToVehicle:(id)a3;
- (void)sendWiredCarPlayAvailable:(id)a3 wirelessCarPlayAvailable:(id)a4 themeAssetsAvailable:(id)a5 toVehicle:(id)a6;
- (void)serviceConnector:(id)a3 completedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5;
- (void)serviceConnector:(id)a3 didConnectVehicle:(id)a4;
- (void)serviceConnector:(id)a3 didDisconnectVehicle:(id)a4;
- (void)serviceConnector:(id)a3 failedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5 error:(id)a6;
- (void)serviceConnector:(id)a3 requestsPairingConfirmationForBluetoothLEIdentifier:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7;
- (void)serviceVehicle:(id)a3 receivedStartSessionMessage:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CARMessagingServiceConnector

- (CARMessagingServiceConnector)initWithVehicleStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CARMessagingServiceConnector;
  v5 = [(CARMessagingServiceConnector *)&v13 init];
  if (v5)
  {
    uint64_t v6 = +[CRVehicleAccessoryManager sharedInstance];
    accessoryManager = v5->_accessoryManager;
    v5->_accessoryManager = (CRVehicleAccessoryManager *)v6;

    [(CRVehicleAccessoryManager *)v5->_accessoryManager addObserver:v5];
    v8 = (ACCConnectionInfo *)objc_alloc_init((Class)ACCConnectionInfo);
    coreAccessoriesManager = v5->_coreAccessoriesManager;
    v5->_coreAccessoriesManager = v8;

    [(ACCConnectionInfo *)v5->_coreAccessoriesManager registerDelegate:v5];
    v10 = [[CARCarPlayServiceConnector alloc] initWithVehicleStore:v4];
    serviceConnector = v5->_serviceConnector;
    v5->_serviceConnector = v10;

    [(CARCarPlayServiceConnector *)v5->_serviceConnector setDelegate:v5];
  }

  return v5;
}

- (NSSet)connectedVehicles
{
  v3 = [(CARMessagingServiceConnector *)self accessoryManager];
  id v4 = [v3 connectedVehicleAccessories];

  v5 = [(CARMessagingServiceConnector *)self serviceConnector];
  uint64_t v6 = [v5 connectedVehicles];

  if ([v4 count] && objc_msgSend(v6, "count"))
  {
    id v7 = [v4 setByAddingObjectsFromSet:v6];
  }
  else if ([v4 count])
  {
    id v7 = v4;
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return (NSSet *)v8;
}

- (void)pairWithBluetoothLEIdentifier:(id)a3 deviceName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CARMessagingServiceConnector *)self serviceConnector];
  [v8 pairWithBluetoothLEIdentifier:v7 deviceName:v6];
}

- (void)connectWithBluetoothLEIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CARMessagingServiceConnector *)self serviceConnector];
  [v5 connectWithBluetoothLEIdentifier:v4];
}

- (BOOL)unpairWithBluetoothLEIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CARMessagingServiceConnector *)self serviceConnector];
  unsigned __int8 v6 = [v5 unpairWithBluetoothLEIdentifier:v4];

  return v6;
}

- (void)beginWiredBluetoothPairingWithVehicle:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 beginWiredBluetoothPairing:v6];
  }
  else
  {
    id v7 = sub_10005C6FC(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10006FBE0();
    }
  }
}

- (void)requestWiFiCredentialsFromVehicle:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 requestWiFiCredentials];
  }
  else
  {
    id v4 = sub_10005C6FC(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006FC14();
    }
  }
}

- (void)sendDeviceTransportIdentifiersToVehicle:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 sendDeviceTransportIdentifiers];
  }
  else
  {
    id v4 = sub_10005C6FC(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10006FC48();
    }
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 wirelessCarPlayAvailable:(id)a4 themeAssetsAvailable:(id)a5 toVehicle:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 BOOLValue])
  {
    v14 = [(CARMessagingServiceConnector *)self _usbSerialNumber];
  }
  else
  {
    v14 = 0;
  }
  if ([v11 BOOLValue]) {
    v15 = (void *)MGGetStringAnswer();
  }
  else {
    v15 = 0;
  }
  v16 = CarPairingLogging();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    if (v10)
    {
      if ([v10 BOOLValue]) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
    }
    else
    {
      CFStringRef v18 = @"unset";
    }
    CFStringRef v21 = v18;
    if (v11)
    {
      if ([v11 BOOLValue]) {
        CFStringRef v17 = @"YES";
      }
      if (v12) {
        goto LABEL_17;
      }
    }
    else
    {
      CFStringRef v17 = @"unset";
      if (v12)
      {
LABEL_17:
        if ([v12 BOOLValue]) {
          CFStringRef v19 = @"YES";
        }
        else {
          CFStringRef v19 = @"NO";
        }
        goto LABEL_22;
      }
    }
    CFStringRef v19 = @"unset";
LABEL_22:
    *(_DWORD *)buf = 138544386;
    CFStringRef v23 = v21;
    __int16 v24 = 2112;
    v25 = v14;
    __int16 v26 = 2114;
    CFStringRef v27 = v17;
    __int16 v28 = 2112;
    v29 = v15;
    __int16 v30 = 2114;
    CFStringRef v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sending CarPlayAvailability {wired: %{public}@ USB: %@} {wireless: %{public}@ BT: %@} {assets: %{public}@}", buf, 0x34u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 sendWiredCarPlayAvailable:v10 usbIdentifier:v14 wirelessCarPlayAvailable:v11 bluetoothIdentifier:v15 themeAssetsAvailable:v12];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = [[CARCarPlayServiceMessageAvailability alloc] initWithWirelessAvailable:v11 != 0 wiredAvailable:v10 usbIdentifier:v14 themeAssetsAvailable:v12];
      [v13 sendCarPlayAvailability:v20];
    }
  }
}

- (id)vehicleAccessoryForiAPConnectionIdentifier:(unint64_t)a3
{
  id v4 = [(CARMessagingServiceConnector *)self accessoryManager];
  id v5 = [v4 vehicleAccessoryForiAPConnectionIdentifier:a3];

  return v5;
}

- (id)vehicleAccessoryForCertificateSerial:(id)a3
{
  id v4 = a3;
  id v5 = [(CARMessagingServiceConnector *)self accessoryManager];
  id v6 = [v5 vehicleAccessoryForCertificateSerial:v4];

  return v6;
}

- (id)_usbSerialNumber
{
  CFDictionaryRef v2 = IOServiceMatching("IOUSBDeviceController");
  if (v2 && (io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2)) != 0)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"DeviceDescription", kCFAllocatorDefault, 0);
    id v5 = CFProperty;
    if (CFProperty)
    {
      id v6 = [CFProperty objectForKey:@"serialNumber"];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)serviceConnector:(id)a3 requestsPairingConfirmationForBluetoothLEIdentifier:(id)a4 name:(id)a5 numericCode:(id)a6 responseHandler:(id)a7
{
  id v15 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  v14 = [(CARMessagingServiceConnector *)self delegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 serviceConnector:self requestsPairingConfirmationForBluetoothLEIdentifier:v15 name:v11 numericCode:v12 responseHandler:v13];
  }
}

- (void)serviceConnector:(id)a3 failedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5 error:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = [(CARMessagingServiceConnector *)self delegate];
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v11 serviceConnector:self failedPairingForBluetoothLEIdentifier:v12 name:v9 error:v10];
  }
}

- (void)serviceConnector:(id)a3 completedPairingForBluetoothLEIdentifier:(id)a4 name:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(CARMessagingServiceConnector *)self delegate];
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v8 serviceConnector:self completedPairingForBluetoothLEIdentifier:v9 name:v7];
  }
}

- (void)serviceConnector:(id)a3 didConnectVehicle:(id)a4
{
  id v6 = a4;
  [v6 setDelegate:self];
  id v5 = [(CARMessagingServiceConnector *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 serviceConnector:self didConnectVehicle:v6];
  }
}

- (void)serviceConnector:(id)a3 didDisconnectVehicle:(id)a4
{
  id v6 = a4;
  id v5 = [(CARMessagingServiceConnector *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 serviceConnector:self didDisconnectVehicle:v6];
  }
}

- (void)serviceVehicle:(id)a3 receivedStartSessionMessage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(CARMessagingServiceConnector *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 serviceConnector:self receivedStartSessionMessage:v6 fromVehicle:v8];
  }
}

- (void)accessoryManager:(id)a3 didConnectVehicleAccessory:(id)a4
{
  id v6 = a4;
  -[CARMessagingServiceConnector _updateCarKeyInformationForVehicleAccessory:](self, "_updateCarKeyInformationForVehicleAccessory:");
  id v5 = [(CARMessagingServiceConnector *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 serviceConnector:self didConnectVehicle:v6];
  }
}

- (void)accessoryManager:(id)a3 didUpdateVehicleAccessory:(id)a4
{
  id v6 = a4;
  id v5 = [(CARMessagingServiceConnector *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 serviceConnector:self didUpdateVehicle:v6];
  }
}

- (void)accessoryManager:(id)a3 didDisconnectVehicleAccessory:(id)a4
{
  id v6 = a4;
  id v5 = [(CARMessagingServiceConnector *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 serviceConnector:self didDisconnectVehicle:v6];
  }
}

- (void)accessoryManager:(id)a3 didConnectUnsupportedAccessoryWithBluetoothAddress:(id)a4
{
  id v6 = a4;
  id v5 = [(CARMessagingServiceConnector *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 serviceConnector:self didConnectUnsupportedAccessoryWithBluetoothAddress:v6];
  }
}

- (void)_updateCarKeyInformationForVehicleAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 coreAccessoriesEndpointUUID];
  id v6 = sub_10005C6FC(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "fetching digital car info for endpoint: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000105E8;
  __int16 v26 = sub_1000105F8;
  id v27 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CARMessagingServiceConnector *)self coreAccessoriesManager];
  uint64_t v9 = kACCProperties_Endpoint_DigitalCarKey_Group;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  CFStringRef v17 = sub_100010600;
  CFStringRef v18 = &unk_1000BD3F8;
  p_long long buf = &buf;
  id v10 = v7;
  CFStringRef v19 = v10;
  [v8 accessoryProperty:v9 forEndpoint:v5 connection:&stru_1000C0798 withReply:&v15];

  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    id v12 = sub_10005C6FC(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006FC7C();
    }
  }
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    id v13 = sub_10005C6FC(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)CFStringRef v21 = 138477827;
      uint64_t v22 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "vehicle declared digital car key support: %{private}@", v21, 0xCu);
    }

    [v4 setDigitalCarKeyInformation:*(void *)(*((void *)&buf + 1) + 40), v15, v16, v17, v18];
  }

  _Block_object_dispose(&buf, 8);
}

- (CARMessagingServiceConnectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CARMessagingServiceConnectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ACCConnectionInfo)coreAccessoriesManager
{
  return self->_coreAccessoriesManager;
}

- (CRVehicleAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (CARCarPlayServiceConnector)serviceConnector
{
  return self->_serviceConnector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnector, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_coreAccessoriesManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end