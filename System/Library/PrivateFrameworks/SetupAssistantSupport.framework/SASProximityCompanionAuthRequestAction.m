@interface SASProximityCompanionAuthRequestAction
+ (unint64_t)actionID;
- (ACAccount)account;
- (AKDevice)companionDevice;
- (BOOL)hasResponse;
- (id)idmsAccountForiCloud;
- (id)responsePayload;
- (void)setAccount:(id)a3;
- (void)setCompanionDevice:(id)a3;
- (void)setResponseFromData:(id)a3;
@end

@implementation SASProximityCompanionAuthRequestAction

+ (unint64_t)actionID
{
  return 4;
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)responsePayload
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [(SASProximityCompanionAuthRequestAction *)self idmsAccountForiCloud];
  v3 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v4 = [v3 transportableAuthKitAccount:v2];

  id v5 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  id v15 = 0;
  v6 = [v5 credentialForAccount:v4 error:&v15];
  id v7 = v15;
  if (v6)
  {
    [v4 setCredential:v6];
    v8 = [MEMORY[0x1E4F4F010] currentDevice];
    [v8 setLinkType:3];
    v16[0] = @"device";
    v16[1] = @"account";
    v17[0] = v8;
    v17[1] = v4;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    id v14 = v7;
    v10 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v14];
    id v11 = v14;

    if (!v10)
    {
      v12 = +[SASLogging facility];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_1DCC71000, v12, OS_LOG_TYPE_DEFAULT, "Failed to archive response: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v8 = +[SASLogging facility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1DCC71000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load credentials for IDMS account: %@ - %@", buf, 0x16u);
    }
    v10 = 0;
    id v11 = v7;
  }

  return v10;
}

- (void)setResponseFromData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v5, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  id v16 = 0;
  id v11 = [v4 unarchivedObjectOfClasses:v10 fromData:v6 error:&v16];

  id v12 = v16;
  if (!v11)
  {
    v13 = +[SASLogging facility];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1DCC71000, v13, OS_LOG_TYPE_DEFAULT, "Failed to unarchive response: %@", buf, 0xCu);
    }
  }
  id v14 = [v11 objectForKeyedSubscript:@"device"];
  [(SASProximityCompanionAuthRequestAction *)self setCompanionDevice:v14];

  id v15 = [v11 objectForKeyedSubscript:@"account"];
  [(SASProximityCompanionAuthRequestAction *)self setAccount:v15];
}

- (id)idmsAccountForiCloud
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");
  __int16 v20 = [v3 username];
  id v21 = objc_msgSend(v3, "aa_altDSID");
  v4 = [v3 accountPropertyForKey:@"DSID"];
  id v5 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177E0]];
  [v2 accountsWithAccountType:v5];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    id v18 = v3;
    id v19 = v2;
    v17 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "aa_altDSID");
        if (v12 && [v21 isEqualToString:v12])
        {
          id v15 = v11;
          goto LABEL_20;
        }
        v13 = [v11 accountPropertyForKey:@"DSID"];
        if (v13 && [v4 isEqualToNumber:v13])
        {
          id v15 = v11;
          goto LABEL_19;
        }
        id v14 = [v11 username];
        if (v14 && ([v20 isEqualToString:v14] & 1) != 0)
        {
          id v15 = v11;

LABEL_19:
LABEL_20:

          v3 = v18;
          id v2 = v19;
          id v5 = v17;
          goto LABEL_21;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      id v15 = 0;
      v3 = v18;
      id v2 = v19;
      id v5 = v17;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_21:

  return v15;
}

- (AKDevice)companionDevice
{
  return (AKDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCompanionDevice:(id)a3
{
}

- (ACAccount)account
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_companionDevice, 0);
}

@end