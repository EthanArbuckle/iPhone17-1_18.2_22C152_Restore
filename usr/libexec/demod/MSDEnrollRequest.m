@interface MSDEnrollRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSArray)getRegistrationInfoKeys;
- (NSDictionary)registrationInfo;
- (NSString)deviceName;
- (NSString)pairingCredentials;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setDeviceName:(id)a3;
- (void)setPairingCredentials:(id)a3;
- (void)setRegistrationInfo:(id)a3;
@end

@implementation MSDEnrollRequest

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDEnrollRequest;
  if ([(MSDCommandServerRequest *)&v6 isValid])
  {
    v3 = [(MSDEnrollRequest *)self registrationInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)getPostData
{
  if ([(MSDEnrollRequest *)self isValid])
  {
    v3 = [(MSDEnrollRequest *)self registrationInfo];
    id v4 = [v3 mutableCopy];

    v5 = +[NSTimeZone defaultTimeZone];
    objc_super v6 = [v5 name];
    [v4 setObject:v6 forKey:@"MSDTimeZone"];

    v7 = [(MSDEnrollRequest *)self deviceName];

    if (v7)
    {
      v8 = [(MSDEnrollRequest *)self deviceName];
      [v4 setObject:v8 forKey:@"DeviceName"];
    }
    v9 = [(MSDEnrollRequest *)self pairingCredentials];

    if (v9)
    {
      v10 = [(MSDEnrollRequest *)self pairingCredentials];
      [v4 setObject:v10 forKey:@"PairingCredential"];
    }
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000DABC0((uint64_t)v4, v11);
    }

    v12 = [v4 convertToNSData];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MSDEnrollRequest;
  v8 = [(MSDServerRequest *)&v25 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    v10 = 0;
    v12 = 0;
    goto LABEL_27;
  }
  id v24 = v6;
  v10 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v24];
  id v11 = v24;

  if (!v10)
  {
    v12 = 0;
LABEL_26:
    id v6 = v11;
LABEL_27:
    v21 = [v8 error];

    if (v21)
    {
      id v11 = v6;
    }
    else
    {
      id v22 = v6;
      sub_1000C3140(&v22, 3727744512, @"Unexpected server response.");
      id v11 = v22;

      [v8 setError:v11];
    }
    goto LABEL_14;
  }
  v12 = [v10 objectForKey:@"Credential"];
  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000DACC8(self);
    }

    v18 = [v10 objectForKey:@"Error"];
    if (v18)
    {
      v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000DAC38(self);
      }

      id v23 = v11;
      sub_1000C3140(&v23, 3727744512, (uint64_t)v18);
      id v20 = v23;

      id v11 = v20;
    }

    goto LABEL_26;
  }
  [v8 setCredential:v12];
  v13 = [v10 objectForKey:@"Settings"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setSettingsDict:v13];
    }
  }
  v14 = [v7 objectForKey:@"protocolVersion"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setHubProtocolVersion:v14];
    }
  }
  v15 = sub_100068600();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Enroll succeeded with response: %{public}@", buf, 0xCu);
  }

LABEL_14:

  return v8;
}

- (NSArray)getRegistrationInfoKeys
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"UniqueDeviceID", @"SerialNumber", @"ProductVersion", @"BuildVersion", @"ProductType", @"InternationalMobileEquipmentIdentity", @"xRyzf9zFE/ycr/wJPweZvQ", @"MobileEquipmentIdentifier", @"BatteryCurrentCapacity", @"MSDDemoAcceptUATContent", @"MSDDemoNANDSize", @"MSDDemoSystemLanguage", @"MSDDemoSystemRegion", @"MSDNetworkInterfacesEnabled", @"MSDCurrentWiFiSSID", @"MSDPersistentWiFiSSID", @"MSDCellularConfiguration",
           @"MSDDemoProductDescription",
           @"PartNumber",
           0);
}

- (NSDictionary)registrationInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRegistrationInfo:(id)a3
{
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)pairingCredentials
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPairingCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingCredentials, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_registrationInfo, 0);
}

@end