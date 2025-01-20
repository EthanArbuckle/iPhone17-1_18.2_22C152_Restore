@interface MCAirPlaySecurityPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_setAccessType:(id)a3 securityType:(id)a4 password:(id)a5;
- (void)_setAirPlaySecurityConfiguration;
- (void)_unsetAirPlaySecurityConfiguration;
- (void)remove;
- (void)setAside;
@end

@implementation MCAirPlaySecurityPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return 1;
}

- (void)setAside
{
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCAirPlaySecurityPayloadHandler *)self _unsetAirPlaySecurityConfiguration];
  }
}

- (void)_setAirPlaySecurityConfiguration
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 profile];
  v5 = [v4 identifier];
  v6 = [(MCNewPayloadHandler *)self profileHandler];
  v7 = [v6 profile];
  v8 = [v7 UUID];
  id v14 = +[NSString stringWithFormat:@"%@-%@", v5, v8];

  v9 = +[MCRestrictionManagerWriter sharedManager];
  [v9 setBoolValue:0 forSetting:MCFeatureAirPlaySecuritySettingsUIAllowed sender:v14];

  v10 = [(MCNewPayloadHandler *)self payload];
  v11 = [v10 accessType];
  v12 = [v10 securityType];
  v13 = [v10 password];
  [(MCAirPlaySecurityPayloadHandler *)self _setAccessType:v11 securityType:v12 password:v13];
}

- (void)_unsetAirPlaySecurityConfiguration
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 profile];
  v5 = [v4 identifier];
  v6 = [(MCNewPayloadHandler *)self profileHandler];
  v7 = [v6 profile];
  v8 = [v7 UUID];
  id v10 = +[NSString stringWithFormat:@"%@-%@", v5, v8];

  v9 = +[MCRestrictionManagerWriter sharedManager];
  [v9 removeBoolSetting:MCFeatureAirPlaySecuritySettingsUIAllowed sender:v10];

  [(MCAirPlaySecurityPayloadHandler *)self _setAccessType:0 securityType:0 password:0];
}

- (void)_setAccessType:(id)a3 securityType:(id)a4 password:(id)a5
{
  v5 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AirPlay Security payload can only be installed on tvOS", v6, 2u);
  }
}

@end