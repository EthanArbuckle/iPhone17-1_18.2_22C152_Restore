@interface INStorageByAppRequest
+ (Class)responseClass;
- (INStorageByAppRequest)init;
- (INStorageByAppRequest)initWithAccount:(id)a3 bundleId:(id)a4;
- (id)urlRequest;
- (id)urlString;
@end

@implementation INStorageByAppRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (INStorageByAppRequest)initWithAccount:(id)a3 bundleId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INStorageByAppRequest;
  v9 = [(INStorageByAppRequest *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bundleId, a4);
  }

  return v10;
}

- (INStorageByAppRequest)init
{
  return 0;
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    v4 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    v5 = [v4 objectForKey:@"settingsAppStorageDetailsURL"];

    if (v5)
    {
      v6 = [(ACAccount *)self->_account aa_personID];
      id v7 = +[AADeviceInfo udid];
      id v8 = +[INHelperFunctions urlStringFromFormat:v5 dsid:v6 udid:v7];

      if (v8)
      {
        v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"appBundleId" value:self->_bundleId];
        id v10 = [objc_alloc((Class)NSURLComponents) initWithString:v8];
        v14 = v9;
        v11 = +[NSArray arrayWithObjects:&v14 count:1];
        [v10 setQueryItems:v11];

        objc_super v12 = [v10 string];
      }
      else
      {
        v9 = _INLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10002AE64((uint64_t)v5, v9);
        }
        objc_super v12 = 0;
      }
    }
    else
    {
      id v8 = _INLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10002ADE0(v8);
      }
      objc_super v12 = 0;
    }
  }
  else
  {
    v5 = _INLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000261AC(v5);
    }
    objc_super v12 = 0;
  }

  return v12;
}

- (id)urlRequest
{
  v7.receiver = self;
  v7.super_class = (Class)INStorageByAppRequest;
  v3 = [(INStorageByAppRequest *)&v7 urlRequest];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "ind_addQuotaHeadersForAccount:", self->_account);
  id v5 = [v4 copy];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end