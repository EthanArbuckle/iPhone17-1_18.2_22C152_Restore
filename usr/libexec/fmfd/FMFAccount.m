@interface FMFAccount
- (NSString)apsEnvironment;
- (NSString)authToken;
- (NSString)dsid;
- (NSString)fmfAppHostName;
- (NSString)fmfAppToken;
- (NSString)fmfHostName;
- (NSString)fmfToken;
- (NSString)iCloudId;
- (NSString)serverHost;
- (NSString)serverProtocolScheme;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)authTokenStatus;
- (void)setApsEnvironment:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setAuthTokenStatus:(int64_t)a3;
- (void)setDsid:(id)a3;
- (void)setFmfAppHostName:(id)a3;
- (void)setFmfAppToken:(id)a3;
- (void)setFmfHostName:(id)a3;
- (void)setFmfToken:(id)a3;
- (void)setICloudId:(id)a3;
- (void)setServerHost:(id)a3;
- (void)setServerProtocolScheme:(id)a3;
@end

@implementation FMFAccount

- (id)description
{
  v3 = [(FMFAccount *)self iCloudId];
  v4 = [(FMFAccount *)self dsid];
  v5 = +[NSString stringWithFormat:@"FMFAccount(0x%lX,%@,%@)", self, v3, v4];

  return v5;
}

- (NSString)authToken
{
  authToken = self->_authToken;
  if (authToken)
  {
    v3 = authToken;
  }
  else
  {
    v4 = +[FMFAccountManager sharedInstance];
    v3 = [v4 authTokenFromKeychain];
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setICloudId:self->_iCloudId];
  [v4 setServerHost:self->_serverHost];
  [v4 setServerProtocolScheme:self->_serverProtocolScheme];
  [v4 setDsid:self->_dsid];
  [v4 setAuthToken:self->_authToken];
  [v4 setAuthTokenStatus:self->_authTokenStatus];
  [v4 setFmfAppToken:self->_fmfAppToken];
  [v4 setFmfToken:self->_fmfToken];
  [v4 setFmfAppHostName:self->_fmfAppHostName];
  [v4 setFmfHostName:self->_fmfHostName];
  [v4 setApsEnvironment:self->_apsEnvironment];
  return v4;
}

- (NSString)iCloudId
{
  return self->_iCloudId;
}

- (void)setICloudId:(id)a3
{
}

- (NSString)serverHost
{
  return self->_serverHost;
}

- (void)setServerHost:(id)a3
{
}

- (NSString)serverProtocolScheme
{
  return self->_serverProtocolScheme;
}

- (void)setServerProtocolScheme:(id)a3
{
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (void)setAuthToken:(id)a3
{
}

- (int64_t)authTokenStatus
{
  return self->_authTokenStatus;
}

- (void)setAuthTokenStatus:(int64_t)a3
{
  self->_authTokenStatus = a3;
}

- (NSString)fmfAppToken
{
  return self->_fmfAppToken;
}

- (void)setFmfAppToken:(id)a3
{
}

- (NSString)fmfToken
{
  return self->_fmfToken;
}

- (void)setFmfToken:(id)a3
{
}

- (NSString)fmfAppHostName
{
  return self->_fmfAppHostName;
}

- (void)setFmfAppHostName:(id)a3
{
}

- (NSString)fmfHostName
{
  return self->_fmfHostName;
}

- (void)setFmfHostName:(id)a3
{
}

- (NSString)apsEnvironment
{
  return self->_apsEnvironment;
}

- (void)setApsEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsEnvironment, 0);
  objc_storeStrong((id *)&self->_fmfHostName, 0);
  objc_storeStrong((id *)&self->_fmfAppHostName, 0);
  objc_storeStrong((id *)&self->_fmfToken, 0);
  objc_storeStrong((id *)&self->_fmfAppToken, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_serverProtocolScheme, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);

  objc_storeStrong((id *)&self->_iCloudId, 0);
}

@end