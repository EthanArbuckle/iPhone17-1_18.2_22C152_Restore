@interface FMDSupportedAccessoryTypesRequest
- (BOOL)canReplace:(id)a3;
- (FMDExtConfigurationRegistry)registry;
- (FMDSupportedAccessoryTypesRequest)initWithAccount:(id)a3 registry:(id)a4;
- (NSString)baseURL;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setBaseURL:(id)a3;
- (void)setRegistry:(id)a3;
@end

@implementation FMDSupportedAccessoryTypesRequest

- (FMDSupportedAccessoryTypesRequest)initWithAccount:(id)a3 registry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FMDSupportedAccessoryTypesRequest;
  v8 = [(FMDRequest *)&v14 initWithAccount:v6];
  if (!v8) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v6 extAccessoryConfigURL];
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSString *)v9;

    objc_storeStrong((id *)&v8->_registry, a4);
LABEL_4:
    v11 = v8;
    goto LABEL_8;
  }
  v12 = sub_100059878();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10023B9F0((uint64_t)v6, v12);
  }

  v11 = 0;
LABEL_8:

  return v11;
}

- (id)requestHeaders
{
  v6.receiver = self;
  v6.super_class = (Class)FMDSupportedAccessoryTypesRequest;
  v2 = [(FMDRequest *)&v6 requestHeaders];
  v3 = +[FMDServerConfig sharedInstance];
  v4 = [v3 mmeClientInfo];
  [v2 fm_safelyMapKey:@"X-MMe-Client-Info" toObject:v4];

  return v2;
}

- (id)requestUrl
{
  v2 = [(FMDSupportedAccessoryTypesRequest *)self baseURL];
  v3 = +[NSString stringWithFormat:@"%@/supportedAccessoryTypes", v2];

  v4 = +[NSURL URLWithString:v3];

  return v4;
}

- (id)requestBody
{
  v7.receiver = self;
  v7.super_class = (Class)FMDSupportedAccessoryTypesRequest;
  v3 = [(FMDRequest *)&v7 requestBody];
  v4 = [(FMDSupportedAccessoryTypesRequest *)self registry];
  v5 = [v4 version];
  [v3 fm_safelyMapKey:@"cachedVersion" toObject:v5];

  return v3;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (FMDExtConfigurationRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_registry, 0);
}

@end