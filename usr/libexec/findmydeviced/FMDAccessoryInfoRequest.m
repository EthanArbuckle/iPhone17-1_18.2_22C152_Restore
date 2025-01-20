@interface FMDAccessoryInfoRequest
- (BOOL)canReplace:(id)a3;
- (FMDAccessoryInfoRequest)initWithAccount:(id)a3 registry:(id)a4 accessoryTypes:(id)a5;
- (FMDExtConfigurationRegistry)registry;
- (NSArray)accessoryTypes;
- (NSString)baseURL;
- (id)requestBody;
- (id)requestHeaders;
- (id)requestUrl;
- (unint64_t)type;
- (void)setAccessoryTypes:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setRegistry:(id)a3;
@end

@implementation FMDAccessoryInfoRequest

- (FMDAccessoryInfoRequest)initWithAccount:(id)a3 registry:(id)a4 accessoryTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FMDAccessoryInfoRequest;
  v11 = [(FMDRequest *)&v17 initWithAccount:v8];
  if (!v11) {
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v8 extAccessoryConfigURL];
    baseURL = v11->_baseURL;
    v11->_baseURL = (NSString *)v12;

    objc_storeStrong((id *)&v11->_registry, a4);
    objc_storeStrong((id *)&v11->_accessoryTypes, a5);
LABEL_4:
    v14 = v11;
    goto LABEL_8;
  }
  v15 = sub_100059878();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10023B9F0((uint64_t)v8, v15);
  }

  v14 = 0;
LABEL_8:

  return v14;
}

- (id)requestUrl
{
  v2 = [(FMDAccessoryInfoRequest *)self baseURL];
  v3 = +[NSString stringWithFormat:@"%@/accessoryInfo", v2];

  v4 = +[NSURL URLWithString:v3];
  v5 = sub_100059878();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMDAccessoryInfoRequest requestURL = %@", buf, 0xCu);
  }

  return v4;
}

- (id)requestHeaders
{
  v6.receiver = self;
  v6.super_class = (Class)FMDAccessoryInfoRequest;
  v2 = [(FMDRequest *)&v6 requestHeaders];
  v3 = +[FMDServerConfig sharedInstance];
  v4 = [v3 mmeClientInfo];
  [v2 fm_safelyMapKey:@"X-MMe-Client-Info" toObject:v4];

  return v2;
}

- (id)requestBody
{
  v25.receiver = self;
  v25.super_class = (Class)FMDAccessoryInfoRequest;
  v19 = [(FMDRequest *)&v25 requestBody];
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(FMDAccessoryInfoRequest *)self accessoryTypes];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(FMDAccessoryInfoRequest *)self accessoryTypes];
  id v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = [(FMDAccessoryInfoRequest *)self registry];
        uint64_t v12 = [v11 configForAccessoryType:v10];
        uint64_t v13 = [v12 version];
        v14 = (void *)v13;
        v15 = &stru_1002E7428;
        if (v13) {
          v15 = (__CFString *)v13;
        }
        v16 = v15;

        id v17 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
        [v17 fm_safeSetObject:v10 forKey:@"type"];
        [v17 fm_safeSetObject:v16 forKey:@"cachedVersion"];

        [v5 addObject:v17];
      }
      id v7 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  [v19 fm_safeSetObject:v5 forKey:@"accessoryTypes"];

  return v19;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (NSArray)accessoryTypes
{
  return self->_accessoryTypes;
}

- (void)setAccessoryTypes:(id)a3
{
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (FMDExtConfigurationRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_accessoryTypes, 0);
}

@end