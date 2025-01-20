@interface MSDCommandServerRequest
- (BOOL)isValid;
- (NSArray)getQueryItems;
- (NSData)getPostData;
- (NSString)deviceUDID;
- (NSString)hubVersion;
- (NSString)port;
- (NSString)server;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getDataDictFromPayload:(id)a3 error:(id *)a4;
- (void)setDeviceUDID:(id)a3;
- (void)setHubVersion:(id)a3;
- (void)setPort:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation MSDCommandServerRequest

- (BOOL)isValid
{
  v9.receiver = self;
  v9.super_class = (Class)MSDCommandServerRequest;
  if (![(MSDServerRequest *)&v9 isValid]) {
    return 0;
  }
  v3 = [(MSDCommandServerRequest *)self server];
  if (v3)
  {
    v4 = [(MSDCommandServerRequest *)self port];
    if (v4)
    {
      v5 = [(MSDCommandServerRequest *)self deviceUDID];
      if (v5)
      {
        v6 = [(MSDCommandServerRequest *)self hubVersion];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSArray)getQueryItems
{
  return 0;
}

- (NSData)getPostData
{
  return 0;
}

- (id)getDataDictFromPayload:(id)a3 error:(id *)a4
{
  v6 = [a3 objectForKey:@"data"];
  BOOL v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(MSDServerRequest *)self getName];
    int v16 = 138543618;
    v17 = v8;
    __int16 v18 = 2114;
    v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: data from server: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (v6 && [v6 length])
  {
    objc_super v9 = +[NSDictionary dictionaryFromJsonData:v6];
    if (v9) {
      goto LABEL_6;
    }
    v15 = sub_100068600();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000DB0A4(self);
    }

    uint64_t v14 = 3727744512;
    CFStringRef v12 = @"Unexpected server response.";
    v13 = a4;
  }
  else
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000DB01C(self);
    }

    CFStringRef v12 = @"Request rejected by server.";
    v13 = a4;
    uint64_t v14 = 3727740934;
  }
  sub_1000C3140(v13, v14, (uint64_t)v12);
  objc_super v9 = 0;
LABEL_6:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MSDCommandServerRequest;
  id v4 = [(MSDServerRequest *)&v6 copyWithZone:a3];
  [v4 setServer:self->_server];
  [v4 setPort:self->_port];
  [v4 setHubVersion:self->_hubVersion];
  [v4 setDeviceUDID:self->_deviceUDID];
  return v4;
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServer:(id)a3
{
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPort:(id)a3
{
}

- (NSString)hubVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHubVersion:(id)a3
{
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDeviceUDID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_hubVersion, 0);
  objc_storeStrong((id *)&self->_port, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end