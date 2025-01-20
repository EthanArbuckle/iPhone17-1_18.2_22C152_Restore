@interface RCAccountDevicesService
- (BOOL)_deviceRecordIsCompatible:(id)a3;
- (BOOL)_recordsContainIncompatibleDevice:(id)a3;
- (BOOL)_versionNumber:(id)a3 isGreaterThanOrEqualTo:(id)a4;
- (NSDictionary)deviceTypesToMinimumVersions;
- (RCAccountDevicesService)init;
- (void)fetchDeviceCompatibility:(id)a3;
@end

@implementation RCAccountDevicesService

- (RCAccountDevicesService)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCAccountDevicesService;
  v2 = [(RCAccountDevicesService *)&v6 init];
  if (v2)
  {
    v7[0] = @"OSX";
    v7[1] = @"watchOS";
    v8[0] = @"13.1";
    v8[1] = @"9.2";
    v7[2] = @"iOS";
    v8[2] = @"16.2";
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    deviceTypesToMinimumVersions = v2->_deviceTypesToMinimumVersions;
    v2->_deviceTypesToMinimumVersions = (NSDictionary *)v3;
  }
  return v2;
}

- (void)fetchDeviceCompatibility:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(RCCloudKitService);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021E04;
  void v7[3] = &unk_100039A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(RCCloudKitService *)v5 fetchDeviceRecords:v7];
}

- (BOOL)_recordsContainIncompatibleDevice:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!-[RCAccountDevicesService _deviceRecordIsCompatible:](self, "_deviceRecordIsCompatible:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_deviceRecordIsCompatible:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"DeviceOSType"];
  id v6 = [v4 objectForKeyedSubscript:@"DeviceOSVersionNumber"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    BOOL v9 = [(RCAccountDevicesService *)self deviceTypesToMinimumVersions];
    v10 = [v9 objectForKeyedSubscript:v5];

    if (v10) {
      BOOL v8 = [(RCAccountDevicesService *)self _versionNumber:v6 isGreaterThanOrEqualTo:v10];
    }
    else {
      BOOL v8 = 1;
    }
  }
  return v8;
}

- (BOOL)_versionNumber:(id)a3 isGreaterThanOrEqualTo:(id)a4
{
  id v4 = a4;
  _LSVersionNumberMakeWithString();
  _LSVersionNumberMakeWithString();

  return _LSVersionNumberCompare() != -1;
}

- (NSDictionary)deviceTypesToMinimumVersions
{
  return self->_deviceTypesToMinimumVersions;
}

- (void).cxx_destruct
{
}

@end