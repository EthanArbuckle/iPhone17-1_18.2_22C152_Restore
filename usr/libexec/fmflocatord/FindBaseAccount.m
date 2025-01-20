@interface FindBaseAccount
- (BOOL)hasSameRelevantInfoAs:(id)a3;
- (BOOL)isValid;
- (NSArray)versionHistory;
- (NSDate)accountAddTime;
- (NSString)apsEnvironment;
- (NSString)apsEnvironmentConstant;
- (NSString)authId;
- (NSString)authToken;
- (NSString)authTokenType;
- (NSString)serverHost;
- (NSString)serverProtocolScheme;
- (NSString)username;
- (void)copyInfoFromAccount:(id)a3;
- (void)setAccountAddTime:(id)a3;
- (void)setApsEnvironment:(id)a3;
- (void)setServerHost:(id)a3;
- (void)setServerProtocolScheme:(id)a3;
- (void)setUsername:(id)a3;
- (void)setVersionHistory:(id)a3;
@end

@implementation FindBaseAccount

- (NSString)authId
{
  return 0;
}

- (NSString)authToken
{
  return 0;
}

- (NSString)authTokenType
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
    v9 = +[FMPreferencesUtil stringForKey:@"ApsEnvOverride" inDomain:@"com.apple.icloud.fmflocatord.notbackedup"];
    if (v9)
    {
      v10 = sub_10001B6D4();
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
  v2 = [(FindBaseAccount *)self apsEnvironment];
  v3 = +[FMAPSHandler constantForEnvironmentString:v2];

  return (NSString *)v3;
}

- (BOOL)isValid
{
  v3 = [(FindBaseAccount *)self authId];
  if (v3)
  {
    v4 = [(FindBaseAccount *)self authToken];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasSameRelevantInfoAs:(id)a3
{
  id v7 = a3;
  v47.receiver = self;
  v47.super_class = (Class)FindBaseAccount;
  if (![(Account *)&v47 hasSameRelevantInfoAs:v7])
  {
    unsigned __int8 v10 = 0;
    goto LABEL_57;
  }
  id v8 = v7;
  v9 = [v8 authId];
  if (v9 || ([(FindBaseAccount *)self authId], (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [v8 authId];
    v4 = [(FindBaseAccount *)self authId];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {

      unsigned __int8 v10 = 0;
      goto LABEL_54;
    }
    int v46 = 1;
  }
  else
  {
    int v46 = 0;
  }
  int v11 = [v8 authToken];
  if (!v11)
  {
    v44 = [(FindBaseAccount *)self authToken];
    if (!v44)
    {
      v44 = 0;
      int v45 = 0;
      goto LABEL_19;
    }
  }
  v12 = v5;
  v13 = [v8 authToken];
  v14 = [(FindBaseAccount *)self authToken];
  if ([v13 isEqualToString:v14])
  {
    v40 = v13;
    int v45 = 1;
    BOOL v5 = v12;
    v39 = v14;
LABEL_19:
    v15 = [v8 serverHost];
    if (v15
      || ([(FindBaseAccount *)self serverHost], (v35 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = v5;
      v17 = v11;
      v18 = v4;
      v19 = v3;
      v20 = [v8 serverHost];
      uint64_t v41 = [(FindBaseAccount *)self serverHost];
      v42 = v20;
      if (!objc_msgSend(v20, "isEqualToString:"))
      {
        unsigned __int8 v10 = 0;
        v3 = v19;
        v4 = v18;
        int v11 = v17;
        BOOL v5 = v16;
        v21 = (void *)v41;
        goto LABEL_45;
      }
      int v38 = 1;
      v3 = v19;
      v4 = v18;
      int v11 = v17;
      BOOL v5 = v16;
    }
    else
    {
      v35 = 0;
      int v38 = 0;
    }
    uint64_t v43 = [v8 serverProtocolScheme];
    if (v43
      || ([(FindBaseAccount *)self serverProtocolScheme],
          (v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v22 = [v8 serverProtocolScheme];
      v36 = [(FindBaseAccount *)self serverProtocolScheme];
      v37 = v22;
      if (!objc_msgSend(v22, "isEqualToString:"))
      {
        unsigned __int8 v10 = 0;
LABEL_40:

        goto LABEL_41;
      }
      v34 = v15;
      int v33 = 1;
    }
    else
    {
      v34 = v15;
      v31 = 0;
      int v33 = 0;
    }
    v23 = [v8 apsEnvironment];
    if (v23
      || ([(FindBaseAccount *)self apsEnvironment], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v32 = v5;
      v24 = [v8 apsEnvironment:v29 environment:v31];
      v25 = [(FindBaseAccount *)self apsEnvironment];
      unsigned __int8 v10 = [v24 isEqualToString:v25];

      if (v23)
      {

        if (v33)
        {
          BOOL v5 = v32;
          v15 = v34;
          goto LABEL_40;
        }
        BOOL v5 = v32;
        v15 = v34;
LABEL_41:
        v27 = (void *)v43;
        if (!v43)
        {

          v27 = 0;
        }

        if (!v38)
        {
LABEL_46:
          if (!v15) {

          }
          if (v45)
          {
          }
          if (!v11) {

          }
          if (!v46) {
            goto LABEL_54;
          }
          goto LABEL_53;
        }
        v21 = (void *)v41;
LABEL_45:

        goto LABEL_46;
      }
      BOOL v5 = v32;
      v26 = v30;
    }
    else
    {
      v26 = 0;
      unsigned __int8 v10 = 1;
    }

    v15 = v34;
    if (v33) {
      goto LABEL_40;
    }
    goto LABEL_41;
  }

  if (v11) {
  else
  }

  unsigned __int8 v10 = 0;
  BOOL v5 = v12;
  if (v46)
  {
LABEL_53:
  }
LABEL_54:
  if (!v9) {

  }
LABEL_57:
  return v10;
}

- (void)copyInfoFromAccount:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FindBaseAccount;
  [(Account *)&v12 copyInfoFromAccount:v4];
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v6 = [v5 username];
    [(FindBaseAccount *)self setUsername:v6];

    id v7 = [v5 serverHost];
    [(FindBaseAccount *)self setServerHost:v7];

    id v8 = [v5 serverProtocolScheme];
    [(FindBaseAccount *)self setServerProtocolScheme:v8];

    v9 = [v5 apsEnvironment];
    [(FindBaseAccount *)self setApsEnvironment:v9];

    unsigned __int8 v10 = [v5 versionHistory];
    [(FindBaseAccount *)self setVersionHistory:v10];

    int v11 = [v5 accountAddTime];

    [(FindBaseAccount *)self setAccountAddTime:v11];
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAddTime, 0);
  objc_storeStrong((id *)&self->_versionHistory, 0);
  objc_storeStrong((id *)&self->_apsEnvironment, 0);
  objc_storeStrong((id *)&self->_serverProtocolScheme, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end