@interface MRNetServiceTransport
+ (id)createDeviceInfoFromNetService:(id)a3;
+ (id)createDeviceInfoFromTXTRecord:(id)a3;
- (BOOL)getInputStream:(id *)a3 outputStream:(id *)a4 userInfo:(id)a5;
- (BOOL)requiresCustomPairing;
- (BOOL)shouldUseSystemAuthenticationPrompt;
- (MRNetServiceTransport)initWithNetService:(id)a3;
- (NSNetService)netService;
- (id)createConnectionWithUserInfo:(id)a3;
- (id)description;
- (id)deviceInfo;
- (id)error;
- (id)hostname;
- (id)name;
- (int64_t)connectionType;
- (int64_t)port;
- (void)dealloc;
- (void)setNetService:(id)a3;
- (void)setRequiresCustomPairing:(BOOL)a3;
- (void)updateDeviceInfoWithTXTRecord:(id)a3;
@end

@implementation MRNetServiceTransport

- (MRNetServiceTransport)initWithNetService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNetServiceTransport;
  v6 = [(MRNetServiceTransport *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_netService, a3);
    v7->_requiresCustomPairing = 1;
  }

  return v7;
}

- (void)dealloc
{
  [(MRNetServiceTransport *)self resetWithError:0];
  v3.receiver = self;
  v3.super_class = (Class)MRNetServiceTransport;
  [(MRNetServiceTransport *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p netService = %@>", objc_opt_class(), self, self->_netService];
}

- (void)setNetService:(id)a3
{
  v11 = (NSNetService *)a3;
  if (self->_netService != v11)
  {
    objc_storeStrong((id *)&self->_netService, a3);
    id v5 = (void *)MEMORY[0x1E4F18D60];
    v6 = [(NSNetService *)v11 TXTRecordData];
    v7 = [v5 dictionaryFromTXTRecordData:v6];
    v8 = (void *)[v7 mutableCopy];

    objc_super v9 = [(NSNetService *)v11 name];
    v10 = [v9 dataUsingEncoding:4];
    [v8 setObject:v10 forKey:@"Name"];

    [(MRNetServiceTransport *)self updateDeviceInfoWithTXTRecord:v8];
  }
}

+ (id)createDeviceInfoFromNetService:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F18D60];
  id v4 = a3;
  id v5 = [v4 TXTRecordData];
  v6 = [v3 dictionaryFromTXTRecordData:v5];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v4 name];

  objc_super v9 = [v8 dataUsingEncoding:4];
  [v7 setObject:v9 forKey:@"Name"];

  v10 = [(id)objc_opt_class() createDeviceInfoFromTXTRecord:v7];

  return v10;
}

+ (id)createDeviceInfoFromTXTRecord:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 objectForKeyedSubscript:@"UniqueIdentifier"];
  v7 = (void *)[v5 initWithData:v6 encoding:4];

  id v8 = [NSString alloc];
  objc_super v9 = [v4 objectForKeyedSubscript:@"Name"];
  v10 = (void *)[v8 initWithData:v9 encoding:4];

  id v11 = [NSString alloc];
  v12 = [v4 objectForKeyedSubscript:@"ModelName"];
  v13 = (void *)[v11 initWithData:v12 encoding:4];

  id v14 = [NSString alloc];
  v15 = [v4 objectForKeyedSubscript:@"SystemBuildVersion"];
  v16 = (void *)[v14 initWithData:v15 encoding:4];

  id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v18 = [v4 objectForKeyedSubscript:@"BluetoothAddress"];
  v19 = (void *)[v17 initWithData:v18];

  id v20 = [NSString alloc];
  v21 = [v4 objectForKeyedSubscript:@"LocalAirPlayReceiverPairingIdentity"];
  v22 = (void *)[v20 initWithData:v21 encoding:4];

  id v23 = [NSString alloc];
  v24 = [v4 objectForKeyedSubscript:@"macAddress"];
  v25 = (void *)[v23 initWithData:v24 encoding:4];

  id v26 = [NSString alloc];
  v27 = [v4 objectForKeyedSubscript:@"AllowPairing"];

  v28 = (void *)[v26 initWithData:v27 encoding:4];
  if (v7)
  {
    v29 = objc_alloc_init(MRDeviceInfo);
    [(MRDeviceInfo *)v29 setIdentifier:v7];
    [(MRDeviceInfo *)v29 setName:v10];
    [(MRDeviceInfo *)v29 setLocalizedModelName:v13];
    [(MRDeviceInfo *)v29 setBuildVersion:v16];
    [(MRDeviceInfo *)v29 setBluetoothAddress:v19];
    [(MRDeviceInfo *)v29 setDeviceUID:v22];
    [(MRDeviceInfo *)v29 setManagedConfigurationDeviceIdentifier:v25];
    if ([v28 length]) {
      uint64_t v30 = [v28 BOOLValue];
    }
    else {
      uint64_t v30 = 1;
    }
    [(MRDeviceInfo *)v29 setPairingAllowed:v30];
  }
  else
  {
    v29 = 0;
  }
  v31 = _MRLogForCategory(3uLL);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    v34 = v29;
    _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, "decoded txtData: %@", (uint8_t *)&v33, 0xCu);
  }

  return v29;
}

- (void)updateDeviceInfoWithTXTRecord:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v12 = [v4 defaultCenter];
  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = v6;
  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    [v6 setObject:deviceInfo forKey:@"OldDeviceInfo"];
  }
  objc_super v9 = [(id)objc_opt_class() createDeviceInfoFromTXTRecord:v5];

  v10 = self->_deviceInfo;
  self->_deviceInfo = v9;

  id v11 = self->_deviceInfo;
  if (v11) {
    [v7 setObject:v11 forKey:@"NewDeviceInfo"];
  }
  [v12 postNotificationName:@"MRExternalDeviceTransportDeviceInfoDidChangeNotification" object:self userInfo:v7];
}

- (id)deviceInfo
{
  deviceInfo = self->_deviceInfo;
  if (!deviceInfo)
  {
    id v4 = [(id)objc_opt_class() createDeviceInfoFromNetService:self->_netService];
    id v5 = self->_deviceInfo;
    self->_deviceInfo = v4;

    deviceInfo = self->_deviceInfo;
  }

  return deviceInfo;
}

- (id)name
{
  return [(NSNetService *)self->_netService name];
}

- (id)hostname
{
  return [(NSNetService *)self->_netService hostName];
}

- (int64_t)port
{
  return [(NSNetService *)self->_netService port];
}

- (int64_t)connectionType
{
  return 2;
}

- (BOOL)shouldUseSystemAuthenticationPrompt
{
  return 0;
}

- (id)error
{
  return 0;
}

- (id)createConnectionWithUserInfo:(id)a3
{
  id v8 = 0;
  id v9 = 0;
  BOOL v3 = [(MRNetServiceTransport *)self getInputStream:&v9 outputStream:&v8 userInfo:a3];
  id v4 = v9;
  id v5 = v8;
  v6 = 0;
  if (v3) {
    v6 = [[MRStreamTransportConnection alloc] initWithInputStream:v4 outputStream:v5];
  }

  return v6;
}

- (BOOL)getInputStream:(id *)a3 outputStream:(id *)a4 userInfo:(id)a5
{
  id v9 = 0;
  id v10 = 0;
  BOOL v7 = -[NSNetService getInputStream:outputStream:](self->_netService, "getInputStream:outputStream:", &v10, &v9, a5);
  *a3 = v10;
  *a4 = v9;

  return v7;
}

- (BOOL)requiresCustomPairing
{
  return self->_requiresCustomPairing;
}

- (void)setRequiresCustomPairing:(BOOL)a3
{
  self->_requiresCustomPairing = a3;
}

- (NSNetService)netService
{
  return self->_netService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netService, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end