@interface BCICloudIdentityToken
+ (id)tokenForCurrentIdentityIfICloudDriveEnabled;
- (BCICloudIdentityToken)initWithCurrentIdentity;
- (BCICloudIdentityToken)initWithToken:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)token;
- (id)_hashFor:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromArchive:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation BCICloudIdentityToken

+ (id)tokenForCurrentIdentityIfICloudDriveEnabled
{
  v2 = +[BUAccountsProvider sharedProvider];
  unsigned __int8 v3 = [v2 isUserSignedInToiCloud];

  if ((v3 & 1) == 0)
  {
    v6 = BCUbiquityEnabledLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v13 = 0;
    v7 = "BCICloudIdentityToken: isUserSignedInToiCloud=NO. Returning nil";
    v8 = (uint8_t *)&v13;
LABEL_13:
    _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_14;
  }
  if (!+[BCSyncUserDefaults isICloudDriveSyncOptedIn])
  {
    v6 = BCUbiquityEnabledLog();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    __int16 v12 = 0;
    v7 = "BCICloudIdentityToken: isICloudDriveSyncOptedIn=NO. Returning nil";
    v8 = (uint8_t *)&v12;
    goto LABEL_13;
  }
  if (!+[BCSyncUserDefaults isGlobalICloudDriveSyncOptedIn])
  {
    v6 = BCUbiquityEnabledLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "BCICloudIdentityToken: isGlobalICloudDriveSyncOptedIn=NO. Returning nil";
      v8 = buf;
      goto LABEL_13;
    }
LABEL_14:
    v4 = 0;
    goto LABEL_15;
  }
  v4 = [[BCICloudIdentityToken alloc] initWithCurrentIdentity];
  v5 = BCUbiquityEnabledLog();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_DEFAULT, "BCICloudIdentityToken: new token generated", v10, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1EDB84(v6);
  }
LABEL_15:

  return v4;
}

- (BCICloudIdentityToken)initWithToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)BCICloudIdentityToken;
    v5 = [(BCICloudIdentityToken *)&v10 init];
    if (v5)
    {
      v6 = (NSString *)[v4 copy];
      token = v5->_token;
      v5->_token = v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)initFromArchive:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = BUDynamicCast();

  v6 = [(BCICloudIdentityToken *)self initWithToken:v5];
  return v6;
}

- (BCICloudIdentityToken)initWithCurrentIdentity
{
  unsigned __int8 v3 = +[BUAccountsProvider sharedProvider];
  id v4 = [v3 iCloudIdentity];

  v5 = BCUbiquityEnabledLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 141558274;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2112;
    __int16 v12 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "BCICloudIdentityToken: initWithCurrentIdentity: %{mask.hash}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = [(BCICloudIdentityToken *)self _hashFor:v4];
  v7 = [(BCICloudIdentityToken *)self initWithToken:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  v5 = [(BCICloudIdentityToken *)self token];
  objc_opt_class();
  v6 = BUDynamicCast();

  v7 = [v6 token];
  unsigned __int8 v8 = [v5 isEqualToString:v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(BCICloudIdentityToken *)self token];
  id v6 = [v4 initWithToken:v5];

  return v6;
}

- (id)description
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(BCICloudIdentityToken *)self token];
  id v6 = +[NSString stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return v6;
}

- (id)_hashFor:(id)a3
{
  unsigned __int8 v3 = [a3 dataUsingEncoding:4];
  id v4 = [v3 bu_md5UpperCase];

  return v4;
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
}

@end