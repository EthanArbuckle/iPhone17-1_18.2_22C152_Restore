@interface FMDFMIPAccount
- (BOOL)isActive;
- (BOOL)lowBatteryLocateEnabled;
- (NSDate)lastIdentityTime;
- (NSString)accessoryPairingURL;
- (NSString)adsid;
- (NSString)appleAccountIdentifier;
- (NSString)dsid;
- (NSString)extAccessoryConfigURL;
- (NSString)fmipAuthToken;
- (NSString)iCloudAuthToken;
- (NSString)lastLoggedInDsid;
- (id)authToken;
- (unint64_t)fmipDisableContext;
- (unint64_t)fmipEnableContext;
- (void)applyPropertiesFromACAccount:(id)a3;
- (void)copyInfoFromAccount:(id)a3;
- (void)setAccessoryPairingURL:(id)a3;
- (void)setAdsid:(id)a3;
- (void)setAppleAccountIdentifier:(id)a3;
- (void)setDsid:(id)a3;
- (void)setExtAccessoryConfigURL:(id)a3;
- (void)setFmipAuthToken:(id)a3;
- (void)setFmipDisableContext:(unint64_t)a3;
- (void)setFmipEnableContext:(unint64_t)a3;
- (void)setICloudAuthToken:(id)a3;
- (void)setLastIdentityTime:(id)a3;
- (void)setLastLoggedInDsid:(id)a3;
- (void)setLowBatteryLocateEnabled:(BOOL)a3;
@end

@implementation FMDFMIPAccount

- (void)applyPropertiesFromACAccount:(id)a3
{
  id v48 = [a3 fmipAccountInfoWithTokens:1];
  v4 = [(FMDAccount *)self username];
  v5 = [v48 objectForKeyedSubscript:off_10031D4C8];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [v48 objectForKeyedSubscript:off_10031D4C8];
    [(FMDAccount *)self setUsername:v7];
  }
  v8 = [(FMDFMIPAccount *)self dsid];
  v9 = [v48 objectForKeyedSubscript:off_10031D4D0];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    v11 = [v48 objectForKeyedSubscript:off_10031D4D0];
    [(FMDFMIPAccount *)self setDsid:v11];
  }
  v12 = [(FMDFMIPAccount *)self adsid];
  v13 = [v48 objectForKeyedSubscript:off_10031D4D8];
  unsigned __int8 v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
    v15 = [v48 objectForKeyedSubscript:off_10031D4D8];
    [(FMDFMIPAccount *)self setAdsid:v15];
  }
  v16 = [(FMDFMIPAccount *)self fmipAuthToken];
  v17 = [v48 objectForKeyedSubscript:off_10031D4E0];
  unsigned __int8 v18 = [v16 isEqualToString:v17];

  if ((v18 & 1) == 0)
  {
    v19 = [v48 objectForKeyedSubscript:off_10031D4E0];
    [(FMDFMIPAccount *)self setFmipAuthToken:v19];
  }
  v20 = [(FMDFMIPAccount *)self iCloudAuthToken];
  v21 = [v48 objectForKeyedSubscript:off_10031D4E8];
  unsigned __int8 v22 = [v20 isEqualToString:v21];

  if ((v22 & 1) == 0)
  {
    v23 = [v48 objectForKeyedSubscript:off_10031D4E8];
    [(FMDFMIPAccount *)self setICloudAuthToken:v23];
  }
  v24 = [(FMDFMIPAccount *)self appleAccountIdentifier];
  v25 = [v48 objectForKeyedSubscript:off_10031D4F0];
  unsigned __int8 v26 = [v24 isEqualToString:v25];

  if ((v26 & 1) == 0)
  {
    v27 = [v48 objectForKeyedSubscript:off_10031D4F0];
    [(FMDFMIPAccount *)self setAppleAccountIdentifier:v27];
  }
  v28 = [(FMDAccount *)self serverHost];
  v29 = [v48 objectForKeyedSubscript:off_10031D4F8];
  unsigned __int8 v30 = [v28 isEqualToString:v29];

  if ((v30 & 1) == 0)
  {
    v31 = [v48 objectForKeyedSubscript:off_10031D4F8];
    [(FMDAccount *)self setServerHost:v31];
  }
  v32 = [(FMDAccount *)self serverProtocolScheme];
  v33 = [v48 objectForKeyedSubscript:off_10031D500];
  unsigned __int8 v34 = [v32 isEqualToString:v33];

  if ((v34 & 1) == 0)
  {
    v35 = [v48 objectForKeyedSubscript:off_10031D500];
    [(FMDAccount *)self setServerProtocolScheme:v35];
  }
  v36 = [(FMDAccount *)self apsEnvironment];
  v37 = [v48 objectForKeyedSubscript:off_10031D508];
  unsigned __int8 v38 = [v36 isEqualToString:v37];

  if ((v38 & 1) == 0)
  {
    v39 = [v48 objectForKeyedSubscript:off_10031D508];
    [(FMDAccount *)self setApsEnvironment:v39];
  }
  v40 = [(FMDFMIPAccount *)self extAccessoryConfigURL];
  v41 = [v48 objectForKeyedSubscript:off_10031D510];
  unsigned __int8 v42 = [v40 isEqualToString:v41];

  if ((v42 & 1) == 0)
  {
    v43 = [v48 objectForKeyedSubscript:off_10031D510];
    [(FMDFMIPAccount *)self setExtAccessoryConfigURL:v43];
  }
  v44 = [(FMDFMIPAccount *)self accessoryPairingURL];
  v45 = [v48 objectForKeyedSubscript:off_10031D518];
  unsigned __int8 v46 = [v44 isEqualToString:v45];

  if ((v46 & 1) == 0)
  {
    v47 = [v48 objectForKeyedSubscript:off_10031D518];
    [(FMDFMIPAccount *)self setAccessoryPairingURL:v47];
  }
}

- (BOOL)isActive
{
  return (id)[(FMDAccount *)self unregisterState] != (id)2
      && (id)[(FMDAccount *)self unregisterState] != (id)3;
}

- (id)authToken
{
  v3 = [(FMDFMIPAccount *)self fmipAuthToken];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(FMDFMIPAccount *)self iCloudAuthToken];
  }
  unsigned __int8 v6 = v5;

  return v6;
}

- (void)copyInfoFromAccount:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMDFMIPAccount;
  [(FMDAccount *)&v11 copyInfoFromAccount:v4];
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unsigned __int8 v6 = [v5 dsid];
    [(FMDFMIPAccount *)self setDsid:v6];

    v7 = [v5 appleAccountIdentifier];
    [(FMDFMIPAccount *)self setAppleAccountIdentifier:v7];

    v8 = [v5 iCloudAuthToken];
    [(FMDFMIPAccount *)self setICloudAuthToken:v8];

    v9 = [v5 fmipAuthToken];
    [(FMDFMIPAccount *)self setFmipAuthToken:v9];

    if ([v5 fmipEnableContext]) {
      -[FMDFMIPAccount setFmipEnableContext:](self, "setFmipEnableContext:", [v5 fmipEnableContext]);
    }
    unsigned __int8 v10 = [v5 lastLoggedInDsid];
    [(FMDFMIPAccount *)self setLastLoggedInDsid:v10];

    -[FMDFMIPAccount setLowBatteryLocateEnabled:](self, "setLowBatteryLocateEnabled:", [v5 lowBatteryLocateEnabled]);
  }
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)adsid
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdsid:(id)a3
{
}

- (NSString)appleAccountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAppleAccountIdentifier:(id)a3
{
}

- (NSString)iCloudAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setICloudAuthToken:(id)a3
{
}

- (NSString)fmipAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFmipAuthToken:(id)a3
{
}

- (NSString)extAccessoryConfigURL
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setExtAccessoryConfigURL:(id)a3
{
}

- (NSString)accessoryPairingURL
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAccessoryPairingURL:(id)a3
{
}

- (NSString)lastLoggedInDsid
{
  return self->_lastLoggedInDsid;
}

- (void)setLastLoggedInDsid:(id)a3
{
}

- (NSDate)lastIdentityTime
{
  return self->_lastIdentityTime;
}

- (void)setLastIdentityTime:(id)a3
{
}

- (unint64_t)fmipEnableContext
{
  return self->_fmipEnableContext;
}

- (void)setFmipEnableContext:(unint64_t)a3
{
  self->_fmipEnableContext = a3;
}

- (unint64_t)fmipDisableContext
{
  return self->_fmipDisableContext;
}

- (void)setFmipDisableContext:(unint64_t)a3
{
  self->_fmipDisableContext = a3;
}

- (BOOL)lowBatteryLocateEnabled
{
  return self->_lowBatteryLocateEnabled;
}

- (void)setLowBatteryLocateEnabled:(BOOL)a3
{
  self->_lowBatteryLocateEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastIdentityTime, 0);
  objc_storeStrong((id *)&self->_lastLoggedInDsid, 0);
  objc_storeStrong((id *)&self->_accessoryPairingURL, 0);
  objc_storeStrong((id *)&self->_extAccessoryConfigURL, 0);
  objc_storeStrong((id *)&self->_fmipAuthToken, 0);
  objc_storeStrong((id *)&self->_iCloudAuthToken, 0);
  objc_storeStrong((id *)&self->_appleAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_adsid, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end