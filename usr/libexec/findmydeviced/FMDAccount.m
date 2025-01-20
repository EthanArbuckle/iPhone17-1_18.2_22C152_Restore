@interface FMDAccount
- (NSArray)versionHistory;
- (NSDate)accountAddTime;
- (NSDate)lastUnregisterFailedTime;
- (NSString)apsEnvironment;
- (NSString)apsEnvironmentConstant;
- (NSString)authId;
- (NSString)authToken;
- (NSString)oneTimeRemoveAuthToken;
- (NSString)serverHost;
- (NSString)serverProtocolScheme;
- (NSString)username;
- (unint64_t)unregisterState;
- (unsigned)activityState;
- (void)copyInfoFromAccount:(id)a3;
- (void)setAccountAddTime:(id)a3;
- (void)setActivityState:(unsigned __int8)a3;
- (void)setApsEnvironment:(id)a3;
- (void)setLastUnregisterFailedTime:(id)a3;
- (void)setOneTimeRemoveAuthToken:(id)a3;
- (void)setServerHost:(id)a3;
- (void)setServerProtocolScheme:(id)a3;
- (void)setUnregisterState:(unint64_t)a3;
- (void)setUsername:(id)a3;
- (void)setVersionHistory:(id)a3;
@end

@implementation FMDAccount

- (NSString)authId
{
  return 0;
}

- (NSString)authToken
{
  return 0;
}

- (void)setApsEnvironment:(id)a3
{
  id v5 = a3;
  p_apsEnvironment = &self->_apsEnvironment;
  objc_storeStrong((id *)p_apsEnvironment, a3);
  v7 = +[FMSystemInfo sharedInstance];
  unsigned int v8 = [v7 isInternalBuild];

  if (v8)
  {
    v9 = +[FMPreferencesUtil stringForKey:@"ApsEnvOverride" inDomain:kFMDNotBackedUpPrefDomain];
    if (v9)
    {
      v10 = sub_100004238();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Overriding aps environment to %@", (uint8_t *)&v11, 0xCu);
      }

      objc_storeStrong((id *)p_apsEnvironment, v9);
    }
  }
}

- (NSString)apsEnvironmentConstant
{
  v2 = [(FMDAccount *)self apsEnvironment];
  v3 = +[FMAPSHandler constantForEnvironmentString:v2];

  return (NSString *)v3;
}

- (void)copyInfoFromAccount:(id)a3
{
  id v10 = a3;
  if ([v10 isMemberOfClass:objc_opt_class()])
  {
    v4 = [v10 username];
    [(FMDAccount *)self setUsername:v4];

    id v5 = [v10 serverHost];
    [(FMDAccount *)self setServerHost:v5];

    v6 = [v10 serverProtocolScheme];
    [(FMDAccount *)self setServerProtocolScheme:v6];

    v7 = [v10 apsEnvironment];
    [(FMDAccount *)self setApsEnvironment:v7];

    unsigned int v8 = [v10 versionHistory];
    [(FMDAccount *)self setVersionHistory:v8];

    v9 = [v10 accountAddTime];
    [(FMDAccount *)self setAccountAddTime:v9];
  }
}

- (NSString)oneTimeRemoveAuthToken
{
  return self->_oneTimeRemoveAuthToken;
}

- (void)setOneTimeRemoveAuthToken:(id)a3
{
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUsername:(id)a3
{
}

- (NSString)serverHost
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerHost:(id)a3
{
}

- (NSString)serverProtocolScheme
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setServerProtocolScheme:(id)a3
{
}

- (NSString)apsEnvironment
{
  return self->_apsEnvironment;
}

- (unint64_t)unregisterState
{
  return self->_unregisterState;
}

- (void)setUnregisterState:(unint64_t)a3
{
  self->_unregisterState = a3;
}

- (NSDate)lastUnregisterFailedTime
{
  return self->_lastUnregisterFailedTime;
}

- (void)setLastUnregisterFailedTime:(id)a3
{
}

- (NSArray)versionHistory
{
  return self->_versionHistory;
}

- (void)setVersionHistory:(id)a3
{
}

- (NSDate)accountAddTime
{
  return self->_accountAddTime;
}

- (void)setAccountAddTime:(id)a3
{
}

- (unsigned)activityState
{
  return self->_activityState;
}

- (void)setActivityState:(unsigned __int8)a3
{
  self->_activityState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAddTime, 0);
  objc_storeStrong((id *)&self->_versionHistory, 0);
  objc_storeStrong((id *)&self->_lastUnregisterFailedTime, 0);
  objc_storeStrong((id *)&self->_apsEnvironment, 0);
  objc_storeStrong((id *)&self->_serverProtocolScheme, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_oneTimeRemoveAuthToken, 0);
}

@end