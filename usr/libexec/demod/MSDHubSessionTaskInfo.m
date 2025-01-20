@interface MSDHubSessionTaskInfo
- (BOOL)addAuthHeader;
- (BOOL)isValid;
- (NSString)deviceUDID;
- (NSString)endpoint;
- (NSString)hmacKey;
- (NSString)port;
- (NSString)server;
- (id)getRequestForTimeout:(double)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setHmacKey:(id)a3;
- (void)setPort:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation MSDHubSessionTaskInfo

- (BOOL)isValid
{
  v7.receiver = self;
  v7.super_class = (Class)MSDHubSessionTaskInfo;
  if (![(MSDSessionTaskInfo *)&v7 isValid]) {
    return 0;
  }
  v3 = [(MSDHubSessionTaskInfo *)self hmacKey];
  if (v3)
  {
    v4 = [(MSDHubSessionTaskInfo *)self deviceUDID];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getRequestForTimeout:(double)a3
{
  BOOL v5 = [(MSDHubSessionTaskInfo *)self deviceUDID];

  if (v5)
  {
    v6 = [(MSDHubSessionTaskInfo *)self server];
    objc_super v7 = [(MSDHubSessionTaskInfo *)self port];
    v8 = [(MSDHubSessionTaskInfo *)self endpoint];
    v9 = +[NSString stringWithFormat:@"https://%@:%@%@", v6, v7, v8];
    v10 = +[NSURL URLWithString:v9];

    id v11 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v10 cachePolicy:1 timeoutInterval:a3];
    [(MSDSessionTaskInfo *)self setRequest:v11];

    v12 = [(MSDSessionTaskInfo *)self postData];

    v13 = [(MSDSessionTaskInfo *)self request];
    v14 = v13;
    if (v12)
    {
      [v13 setHTTPMethod:@"POST"];

      v14 = [(MSDSessionTaskInfo *)self request];
      [v14 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    else
    {
      [v13 setHTTPMethod:@"GET"];
    }

    v15 = [(MSDSessionTaskInfo *)self request];
    [v15 setValue:@"13" forHTTPHeaderField:@"X-Protocol-Version"];

    v16 = [(MSDHubSessionTaskInfo *)self deviceUDID];

    if (v16)
    {
      v17 = [(MSDSessionTaskInfo *)self request];
      v18 = [(MSDHubSessionTaskInfo *)self deviceUDID];
      [v17 setValue:v18 forHTTPHeaderField:@"X-Apple-OTA-UDID"];

      if ([(MSDHubSessionTaskInfo *)self addAuthHeader])
      {
        v19 = [(MSDSessionTaskInfo *)self request];
        goto LABEL_8;
      }
    }
    else
    {
      v22 = sub_100068600();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000CDC38();
      }
    }
  }
  else
  {
    v21 = sub_100068600();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000CDC38();
    }

    v10 = 0;
  }
  v19 = 0;
LABEL_8:

  return v19;
}

- (BOOL)addAuthHeader
{
  v3 = [(MSDHubSessionTaskInfo *)self hmacKey];

  if (!v3)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000CDC6C();
    }
    goto LABEL_10;
  }
  v4 = [AluminiumAuthenticator alloc];
  BOOL v5 = [(MSDHubSessionTaskInfo *)self hmacKey];
  v6 = [(AluminiumAuthenticator *)v4 initWithASCIIEncodedKey:v5];

  if (!v6)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000CDCA0();
    }
LABEL_10:
    v6 = 0;
    id v11 = 0;
    objc_super v7 = 0;
LABEL_13:

    BOOL v12 = 0;
    goto LABEL_5;
  }
  objc_super v7 = +[NSSet setWithObjects:@"X-Apple-OTA-UDID", @"X-Apple-HMAC-Sent-Timestamp", @"Host", 0];
  v8 = [(MSDSessionTaskInfo *)self request];
  v9 = [(MSDSessionTaskInfo *)self postData];
  id v15 = 0;
  unsigned __int8 v10 = [(AluminiumAuthenticator *)v6 addAuthenticationHeadersToRequest:v8 includedHeaders:v7 body:v9 algorithm:0 error:&v15];
  id v11 = v15;

  if ((v10 & 1) == 0)
  {
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000CDCD4(v11);
    }
    goto LABEL_13;
  }
  BOOL v12 = 1;
LABEL_5:

  return v12;
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServer:(id)a3
{
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPort:(id)a3
{
}

- (NSString)endpoint
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpoint:(id)a3
{
}

- (NSString)hmacKey
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHmacKey:(id)a3
{
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceUDID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_hmacKey, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_port, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

@end