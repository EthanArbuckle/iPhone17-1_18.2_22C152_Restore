@interface FMDRequestWatchUnregister
- (BOOL)canReplace:(id)a3;
- (BOOL)canRequestBeRetriedNow;
- (BOOL)showAuthFailedMessage;
- (FMDRequestWatchUnregister)initWithDeviceUDID:(id)a3 unregisterToken:(id)a4;
- (NSString)token;
- (NSString)udid;
- (id)authToken;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setToken:(id)a3;
- (void)setUdid:(id)a3;
@end

@implementation FMDRequestWatchUnregister

- (FMDRequestWatchUnregister)initWithDeviceUDID:(id)a3 unregisterToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDRequestWatchUnregister;
  v8 = [(FMDRequest *)&v11 initWithAccount:0];
  v9 = v8;
  if (v8)
  {
    [(FMDRequestWatchUnregister *)v8 setUdid:v6];
    [(FMDRequestWatchUnregister *)v9 setToken:v7];
  }

  return v9;
}

- (id)requestHeaders
{
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestWatchUnregister;
  v3 = [(FMDRequest *)&v6 requestHeaders];
  v4 = [(FMDRequestWatchUnregister *)self token];
  [v3 fm_safelyMapKey:@"X-Apple-Migration-Unregister-Token" toObject:v4];

  return v3;
}

- (id)authToken
{
  return 0;
}

- (id)requestUrl
{
  v2 = objc_alloc_init(RequestTemplateURL);
  v3 = [(RequestTemplateURL *)v2 unauthenticatedURLFromTemplate:@"${scheme}://${hostname}/${service}/token/migrationUnregister"];

  return v3;
}

- (id)requestBody
{
  v6.receiver = self;
  v6.super_class = (Class)FMDRequestWatchUnregister;
  v3 = [(FMDRequest *)&v6 requestBody];
  v4 = [(FMDRequestWatchUnregister *)self udid];
  [v3 fm_safelyMapKey:@"udid" toObject:v4];

  return v3;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)canReplace:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 udid];
    objc_super v6 = [(FMDRequestWatchUnregister *)self udid];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)showAuthFailedMessage
{
  return 0;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_udid, 0);
}

@end