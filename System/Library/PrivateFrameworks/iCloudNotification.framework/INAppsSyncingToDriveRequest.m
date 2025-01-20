@interface INAppsSyncingToDriveRequest
+ (Class)responseClass;
- (INAppsSyncingToDriveRequest)init;
- (INAppsSyncingToDriveRequest)initWithAccount:(id)a3;
- (id)urlRequest;
- (id)urlString;
@end

@implementation INAppsSyncingToDriveRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (INAppsSyncingToDriveRequest)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INAppsSyncingToDriveRequest;
  v6 = [(INAppsSyncingToDriveRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (id)urlString
{
  v3 = [(ACAccount *)self->_account aa_personID];

  if (v3)
  {
    v4 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    id v5 = [v4 objectForKey:@"appsSyncingToiCloudDrive"];
    v6 = [(ACAccount *)self->_account aa_personID];
    v7 = +[AADeviceInfo udid];
    v8 = +[INHelperFunctions urlStringFromFormat:v5 dsid:v6 udid:v7];
  }
  else
  {
    objc_super v9 = _INLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002907C((uint64_t)self, v9);
    }

    v8 = 0;
  }
  return v8;
}

- (INAppsSyncingToDriveRequest)init
{
  return 0;
}

- (id)urlRequest
{
  v6.receiver = self;
  v6.super_class = (Class)INAppsSyncingToDriveRequest;
  v3 = [(INAppsSyncingToDriveRequest *)&v6 urlRequest];
  id v4 = [v3 mutableCopy];

  objc_msgSend(v4, "ind_addQuotaHeadersForAccount:", self->_account);
  return v4;
}

- (void).cxx_destruct
{
}

@end