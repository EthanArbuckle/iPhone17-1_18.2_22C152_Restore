@interface MFOSXServerIMAPAccount
+ (BOOL)primaryDeliveryAccountIsDynamic;
+ (id)_authSchemeForAuthenticationMethod:(id)a3;
+ (id)accountTypeIdentifier;
+ (id)displayedAccountTypeString;
+ (id)newChildAccountWithParentAccount:(id)a3 error:(id *)a4;
- (BOOL)derivesDeliveryAccountInfoFromMailAccount;
- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4;
- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3;
- (id)displayName;
@end

@implementation MFOSXServerIMAPAccount

+ (id)accountTypeIdentifier
{
  return (id)*MEMORY[0x1E4F177F0];
}

+ (id)displayedAccountTypeString
{
  return @"OS X Server";
}

+ (BOOL)primaryDeliveryAccountIsDynamic
{
  return 1;
}

- (id)displayName
{
  v3 = [(MFAccount *)self parentAccount];

  if (v3)
  {
    v4 = [(MFAccount *)self parentAccount];
    v5 = [v4 accountDescription];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MFOSXServerIMAPAccount;
    v5 = [(MailAccount *)&v7 displayName];
  }
  return v5;
}

- (id)_credentialCreateIfNecessary:(BOOL)a3 error:(id *)a4
{
  v5 = [(MFAccount *)self parentAccount];
  v6 = [v5 credentialWithError:a4];

  return v6;
}

+ (id)newChildAccountWithParentAccount:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = v6;
  if (v6)
  {
    id v42 = a1;
    uint64_t v8 = *MEMORY[0x1E4F17AD8];
    v44 = [v6 propertiesForDataclass:*MEMORY[0x1E4F17AD8]];
    v43 = [MEMORY[0x1E4F1CA60] dictionary];
    if (([v7 isProvisionedForDataclass:v8] & 1) != 0
      || (+[MFError errorWithDomain:@"OSXServerIMAPErrorDomain" code:2 localizedDescription:0], (v9 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v10 = [v7 childAccounts];
      v9 = (void *)[v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v9)
      {
        uint64_t v11 = *(void *)v46;
        uint64_t v12 = *MEMORY[0x1E4F177F0];
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v46 != v11) {
              objc_enumerationMutation(v10);
            }
            v14 = [*(id *)(*((void *)&v45 + 1) + 8 * i) accountType];
            v15 = [v14 identifier];
            int v16 = [v15 isEqualToString:v12];

            if (v16)
            {
              v9 = +[MFError errorWithDomain:@"OSXServerIMAPErrorDomain" code:1 localizedDescription:0];
              goto LABEL_15;
            }
          }
          v9 = (void *)[v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    v18 = [v44 objectForKeyedSubscript:@"EmailAccountName"];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [v7 username];
    }
    v21 = v20;

    v22 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F176B0]];
    if (v9)
    {
      v17 = 0;
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      [v43 setObject:v21 forKeyedSubscript:@"Username"];
      v23 = [v44 objectForKeyedSubscript:@"EmailAddresses"];
      if (v23)
      {
        [v43 setObject:v23 forKeyedSubscript:@"EmailAddresses"];
      }
      else
      {
        v24 = [v44 objectForKeyedSubscript:@"EmailAddress"];
        if (!v24)
        {
          uint64_t v25 = [v44 objectForKeyedSubscript:@"EmailDomain"];
          v26 = (void *)v25;
          if (v25) {
            v27 = (void *)v25;
          }
          else {
            v27 = v22;
          }
          id v28 = v27;

          v24 = [NSString stringWithFormat:@"%@@%@", v21, v28];
        }
        v49 = v24;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        [v43 setObject:v29 forKeyedSubscript:@"EmailAddresses"];
      }
      v30 = [v7 accountDescription];
      [v43 setObject:v30 forKeyedSubscript:@"DisplayName"];

      [v43 setObject:v22 forKeyedSubscript:@"Hostname"];
      v31 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F176B8]];
      [v43 setObject:v31 forKeyedSubscript:@"PortNumber"];

      uint64_t v32 = *MEMORY[0x1E4F176C0];
      v33 = [v44 objectForKeyedSubscript:*MEMORY[0x1E4F176C0]];
      [v43 setObject:v33 forKeyedSubscript:@"SSLEnabled"];

      v34 = [v7 userFullName];

      if (v34)
      {
        v35 = [v7 userFullName];
        [v43 setObject:v35 forKeyedSubscript:@"FullUserName"];
      }
      v36 = [v44 objectForKeyedSubscript:@"IncomingMailServerAuthentication"];
      v37 = [v42 _authSchemeForAuthenticationMethod:v36];
      [v43 setObject:v37 forKeyedSubscript:@"AuthenticationScheme"];

      v17 = [(id)objc_opt_class() accountWithProperties:v43];
      v38 = [v17 defaultPath];
      [v17 setPath:v38];

      v39 = [v44 objectForKeyedSubscript:v32];
      objc_msgSend(v17, "setUsesSSL:", objc_msgSend(v39, "BOOLValue"));

      v40 = [v17 persistentAccount];
      [v40 setParentAccount:v7];
      [v40 setAuthenticationType:*MEMORY[0x1E4F17A58]];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_authSchemeForAuthenticationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EmailAuthCRAMMD5"])
  {
    v4 = (id *)MEMORY[0x1E4F605F0];
LABEL_7:
    v5 = (__CFString *)*v4;
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"EmailAuthNTLM"])
  {
    v4 = (id *)MEMORY[0x1E4F60600];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"EmailAuthHTTPMD5"])
  {
    v4 = (id *)MEMORY[0x1E4F605F8];
    goto LABEL_7;
  }
  v5 = &stru_1EFF11268;
LABEL_8:

  return v5;
}

- (BOOL)derivesDeliveryAccountInfoFromMailAccount
{
  return 1;
}

- (id)_deliveryAccountCreateIfNeeded:(BOOL)a3
{
  deliveryAccount = self->_deliveryAccount;
  if (deliveryAccount) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    id v6 = objc_alloc_init(MFOSXServerSMTPAccount);
    [(MFOSXServerSMTPAccount *)v6 setMailAccount:self];
    objc_super v7 = self->_deliveryAccount;
    self->_deliveryAccount = &v6->super.super;

    deliveryAccount = self->_deliveryAccount;
  }
  return deliveryAccount;
}

- (void).cxx_destruct
{
}

@end