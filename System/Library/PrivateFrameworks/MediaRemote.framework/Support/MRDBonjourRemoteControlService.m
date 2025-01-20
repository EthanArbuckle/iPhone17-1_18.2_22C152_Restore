@interface MRDBonjourRemoteControlService
+ (id)_netServiceTXTRecordDataWithDeviceInfo:(id)a3;
- (MRDBonjourRemoteControlService)initWithNetServiceType:(id)a3;
- (MRDBonjourRemoteControlServiceDelegate)delegate;
- (NSData)lastKnownBluetoothAddress;
- (NSString)description;
- (NSString)netServiceType;
- (void)_handleDeviceInfoChangedNotification:(id)a3;
- (void)_handleRestrictionChangedNotification:(id)a3;
- (void)_initializeBonjourServiceWithDeviceInfo:(id)a3;
- (void)_txtDataChanged;
- (void)_txtDataChangedWithDeviceInfo:(id)a3;
- (void)_txtDataChangedWithUserInfo:(id)a3;
- (void)dealloc;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastKnownBluetoothAddress:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MRDBonjourRemoteControlService

- (MRDBonjourRemoteControlService)initWithNetServiceType:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRDBonjourRemoteControlService;
  v5 = [(MRDBonjourRemoteControlService *)&v19 init];
  if (v5)
  {
    objc_initWeak(&location, v5);
    v6 = (NSString *)[v4 copy];
    netServiceType = v5->_netServiceType;
    v5->_netServiceType = v6;

    v8 = (CUBluetoothClient *)objc_alloc_init((Class)MSVWeakLinkClass());
    bluetoothClient = v5->_bluetoothClient;
    v5->_bluetoothClient = v8;

    id v10 = &_dispatch_main_q;
    [(CUBluetoothClient *)v5->_bluetoothClient setDispatchQueue:&_dispatch_main_q];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004BBCC;
    v16[3] = &unk_100417828;
    objc_copyWeak(&v17, &location);
    [(CUBluetoothClient *)v5->_bluetoothClient setBluetoothAddressChangedHandler:v16];
    v11 = +[MROrigin localOrigin];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10004BCA8;
    v14[3] = &unk_100417850;
    objc_copyWeak(&v15, &location);
    +[MRDeviceInfoRequest deviceInfoForOrigin:v11 queue:&_dispatch_main_q completion:v14];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v5 selector:"_handleDeviceInfoChangedNotification:" name:kMRDeviceInfoDidChangeNotification object:0];
    [v12 addObserver:v5 selector:"_handleRestrictionChangedNotification:" name:MCRestrictionChangedNotification object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MRDBonjourRemoteControlService *)self stop];
  v4.receiver = self;
  v4.super_class = (Class)MRDBonjourRemoteControlService;
  [(MRDBonjourRemoteControlService *)&v4 dealloc];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p \"%@\">", v4, self, self->_netServiceType];

  return (NSString *)v5;
}

- (void)start
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    networkService = self->_networkService;
    netServiceType = self->_netServiceType;
    int v6 = 138543618;
    v7 = networkService;
    __int16 v8 = 2114;
    v9 = netServiceType;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Starting network service: %{public}@ for type %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(CUBluetoothClient *)self->_bluetoothClient activate];
  [(NSNetService *)self->_networkService publishWithOptions:2];
  self->_started = 1;
}

- (void)stop
{
  v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    networkService = self->_networkService;
    netServiceType = self->_netServiceType;
    int v6 = 138543618;
    v7 = networkService;
    __int16 v8 = 2114;
    v9 = netServiceType;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Stopping network service %{public}@ for type %{public}@", (uint8_t *)&v6, 0x16u);
  }

  [(CUBluetoothClient *)self->_bluetoothClient invalidate];
  [(NSNetService *)self->_networkService stop];
  self->_started = 0;
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    netServiceType = self->_netServiceType;
    int v17 = 138544130;
    id v18 = v8;
    __int16 v19 = 2114;
    v20 = netServiceType;
    __int16 v21 = 2114;
    id v22 = v9;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Did accept connection with service: %{public}@ using type: %{public}@ input: %{public}@ output: %{public}@", (uint8_t *)&v17, 0x2Au);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [objc_alloc((Class)MRStreamTransportConnection) initWithInputStream:v9 outputStream:v10];
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 bonjourRemoteControlService:self didAcceptConnection:v15];
  }
}

- (void)netServiceDidPublish:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    netServiceType = self->_netServiceType;
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    id v10 = netServiceType;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Remote server advertisement success with service: %{public}@ using type: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Remote server advertisement failed with service: %{public}@ error: %{public}@", buf, 0x16u);
  }

  __int16 v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Retrying after 30s...", buf, 2u);
  }

  networkService = self->_networkService;
  if (networkService)
  {
    [(NSNetService *)networkService stop];
    v11 = self->_networkService;
    self->_networkService = 0;
  }
  v12 = +[MROrigin localOrigin];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004C398;
  v13[3] = &unk_100417878;
  v13[4] = self;
  +[MRDeviceInfoRequest deviceInfoForOrigin:v12 queue:&_dispatch_main_q completion:v13];
}

- (void)_handleDeviceInfoChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Updating txtData because deviceInfo changed...", v9, 2u);
  }

  id v6 = [v4 userInfo];
  id v7 = MRGetOriginFromUserInfo();

  if ([v7 isLocal])
  {
    id v8 = [v4 userInfo];
    [(MRDBonjourRemoteControlService *)self _txtDataChangedWithUserInfo:v8];
  }
}

- (void)_handleRestrictionChangedNotification:(id)a3
{
  id v4 = _MRLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Updating txtData because device restrictions changed...", v5, 2u);
  }

  [(MRDBonjourRemoteControlService *)self _txtDataChanged];
}

- (void)_txtDataChangedWithUserInfo:(id)a3
{
  MRGetDeviceInfoFromUserInfo();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MRDBonjourRemoteControlService *)self _txtDataChangedWithDeviceInfo:v4];
}

- (void)_txtDataChanged
{
  v3 = +[MROrigin localOrigin];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004C6BC;
  v4[3] = &unk_100417878;
  v4[4] = self;
  +[MRDeviceInfoRequest deviceInfoForOrigin:v3 queue:&_dispatch_main_q completion:v4];
}

- (void)_txtDataChangedWithDeviceInfo:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Updating txtData: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (v4)
  {
    id v6 = [(MRDBonjourRemoteControlService *)self lastKnownBluetoothAddress];
    MRPairedDeviceSetBluetoothAddress();

    id v7 = [(id)objc_opt_class() _netServiceTXTRecordDataWithDeviceInfo:v4];
    [(NSNetService *)self->_networkService setTXTRecordData:v7];
  }
}

+ (id)_netServiceTXTRecordDataWithDeviceInfo:(id)a3
{
  v29[0] = kMRExternalDeviceUniqueIdentifierTXTRecordKey;
  id v3 = a3;
  uint64_t v4 = [v3 identifier];
  v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_10042ACB0;
  }
  v30[0] = v6;
  v29[1] = kMRExternalDeviceNameTXTRecordKey;
  uint64_t v7 = [v3 name];
  int v8 = (void *)v7;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  else {
    CFStringRef v9 = &stru_10042ACB0;
  }
  v30[1] = v9;
  v29[2] = kMRExternalDeviceModelNameTXTRecordKey;
  uint64_t v10 = [v3 localizedModelName];
  v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = &stru_10042ACB0;
  }
  v30[2] = v12;
  v29[3] = kMRExternalDeviceSystemBuildVersionTXTRecordKey;
  uint64_t v13 = [v3 buildVersion];
  char v14 = (void *)v13;
  if (v13) {
    CFStringRef v15 = (const __CFString *)v13;
  }
  else {
    CFStringRef v15 = &stru_10042ACB0;
  }
  v30[3] = v15;
  v29[4] = kMRExternalDeviceAllowPairingTXTRecordKey;
  unsigned int v16 = [v3 isPairingAllowed];
  CFStringRef v17 = @"NO";
  if (v16) {
    CFStringRef v17 = @"YES";
  }
  v30[4] = v17;
  v29[5] = kMRExternalDeviceBluetoothAddressTXTRecordKey;
  uint64_t v18 = [v3 bluetoothAddress];
  __int16 v19 = (void *)v18;
  if (v18) {
    CFStringRef v20 = (const __CFString *)v18;
  }
  else {
    CFStringRef v20 = &stru_10042ACB0;
  }
  v30[5] = v20;
  v29[6] = kMRExternalDeviceLocalAirPlayReceiverPairingIdentityKey;
  uint64_t v21 = [v3 deviceUID];
  id v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_10042ACB0;
  }
  v30[6] = v23;
  v29[7] = kMRExternalManagedConfigDeviceIDKey;
  id v24 = [v3 managedConfigurationDeviceIdentifier];

  if (v24) {
    CFStringRef v25 = v24;
  }
  else {
    CFStringRef v25 = &stru_10042ACB0;
  }
  v30[7] = v25;
  v26 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:8];

  v27 = +[NSNetService dataFromTXTRecordDictionary:v26];

  return v27;
}

- (void)_initializeBonjourServiceWithDeviceInfo:(id)a3
{
  id v4 = a3;
  if (self->_networkService)
  {
    v5 = _MRLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      CFStringRef v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Stopping bonjour service %{public}@", (uint8_t *)&v16, 0xCu);
    }

    [(NSNetService *)self->_networkService stop];
    networkService = self->_networkService;
    self->_networkService = 0;
  }
  uint64_t v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    netServiceType = self->_netServiceType;
    int v16 = 138543362;
    CFStringRef v17 = (MRDBonjourRemoteControlService *)netServiceType;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlNetworkService] Initializing bonjour service for type %{public}@", (uint8_t *)&v16, 0xCu);
  }

  CFStringRef v9 = (NSNetService *)[objc_alloc((Class)NSNetService) initWithDomain:@"local." type:self->_netServiceType name:&stru_10042ACB0];
  uint64_t v10 = self->_networkService;
  self->_networkService = v9;

  [(NSNetService *)self->_networkService setDelegate:self];
  v11 = [(id)objc_opt_class() _netServiceTXTRecordDataWithDeviceInfo:v4];
  [(NSNetService *)self->_networkService setTXTRecordData:v11];

  CFStringRef v12 = +[MRUserSettings currentSettings];
  id v13 = [v12 usePeerToPeerExternalDeviceConnections];

  char v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v15 = "NO";
    if (v13) {
      CFStringRef v15 = "YES";
    }
    int v16 = 136315138;
    CFStringRef v17 = (MRDBonjourRemoteControlService *)v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Configuring remote control network service with includesPeerToPeer = %s", (uint8_t *)&v16, 0xCu);
  }

  [(NSNetService *)self->_networkService setIncludesPeerToPeer:v13];
  if (self->_started) {
    [(MRDBonjourRemoteControlService *)self start];
  }
}

- (MRDBonjourRemoteControlServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDBonjourRemoteControlServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)netServiceType
{
  return self->_netServiceType;
}

- (NSData)lastKnownBluetoothAddress
{
  return self->_lastKnownBluetoothAddress;
}

- (void)setLastKnownBluetoothAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownBluetoothAddress, 0);
  objc_storeStrong((id *)&self->_netServiceType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_networkService, 0);

  objc_storeStrong((id *)&self->_bluetoothClient, 0);
}

@end