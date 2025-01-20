@interface WFProxyKeychainOperation
+ (id)getPasswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5;
+ (id)removePasswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5;
+ (id)savePassswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6;
- (NSString)host;
- (NSString)password;
- (NSString)port;
- (NSString)username;
- (WFProxyKeychainOperation)initWithHost:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6 type:(int64_t)a7;
- (id)_credentialsForProtectionSpace:(id)a3;
- (int64_t)type;
- (void)setHost:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPort:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUsername:(id)a3;
- (void)start;
@end

@implementation WFProxyKeychainOperation

+ (id)removePasswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[WFProxyKeychainOperation alloc] initWithHost:v9 port:v8 username:v7 password:0 type:1];

  return v10;
}

+ (id)getPasswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[WFProxyKeychainOperation alloc] initWithHost:v9 port:v8 username:v7 password:0 type:0];

  return v10;
}

+ (id)savePassswordOperationForHost:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[WFProxyKeychainOperation alloc] initWithHost:v12 port:v11 username:v10 password:v9 type:1];

  return v13;
}

- (WFProxyKeychainOperation)initWithHost:(id)a3 port:(id)a4 username:(id)a5 password:(id)a6 type:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFProxyKeychainOperation;
  v17 = [(WFProxyKeychainOperation *)&v20 init];
  v18 = v17;
  if (v17 && (objc_storeStrong((id *)&v17->_password, a6), v14) && v13 && v15)
  {
    objc_storeStrong((id *)&v18->_host, a3);
    objc_storeStrong((id *)&v18->_username, a5);
    objc_storeStrong((id *)&v18->_port, a4);
    v18->_type = a7;
  }
  else
  {

    v18 = 0;
  }

  return v18;
}

- (void)start
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)WFProxyKeychainOperation;
  [(WFOperation *)&v53 start];
  v3 = WFLogForCategory(0);
  os_log_type_t v4 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v3)
  {
    v5 = v3;
    if (os_log_type_enabled(v5, v4))
    {
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int64_t v8 = [(WFProxyKeychainOperation *)self type];
      *(_DWORD *)buf = 138412546;
      v55 = v7;
      __int16 v56 = 2048;
      int64_t v57 = v8;
      _os_log_impl(&dword_226071000, v5, v4, "Starting %@ with type %lu", buf, 0x16u);
    }
  }

  id v9 = [MEMORY[0x263EFC618] sharedCredentialStorage];
  if (!v9)
  {
    v24 = WFLogForCategory(0);
    os_log_type_t v42 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v24 || !os_log_type_enabled(v24, v42)) {
      goto LABEL_78;
    }
    *(_WORD *)buf = 0;
    v43 = "Failed to create NSURLCredentialStorage";
    goto LABEL_47;
  }
  if (![(WFProxyKeychainOperation *)self type])
  {
    id v20 = objc_alloc(MEMORY[0x263EFC620]);
    v21 = [(WFProxyKeychainOperation *)self host];
    v22 = [(WFProxyKeychainOperation *)self port];
    uint64_t v23 = [v22 integerValue];
    v24 = [v20 initWithProxyHost:v21 port:v23 type:*MEMORY[0x263EFC5B8] realm:0 authenticationMethod:*MEMORY[0x263EFC570]];

    if (v24)
    {
      v25 = [v9 credentialsForProtectionSpace:v24];
      v26 = [(WFProxyKeychainOperation *)self username];
      v27 = [v25 objectForKey:v26];

      if (v27)
      {
        v28 = [v27 password];
        [(WFProxyKeychainOperation *)self setPassword:v28];
LABEL_35:

        goto LABEL_36;
      }
      v44 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wifikit.error" code:0 userInfo:0];
      [(WFOperation *)self setError:v44];

      v28 = WFLogForCategory(0);
      os_log_type_t v45 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v28)
      {
        v46 = v28;
        if (os_log_type_enabled(v46, v45))
        {
          v47 = [(WFProxyKeychainOperation *)self username];
          *(_DWORD *)buf = 138412546;
          v55 = v47;
          __int16 v56 = 2112;
          int64_t v57 = (int64_t)v25;
          _os_log_impl(&dword_226071000, v46, v45, "Unable to find credentials mapping for username %@ in mapping %@", buf, 0x16u);
        }
      }
LABEL_76:

      goto LABEL_77;
    }
    v24 = WFLogForCategory(0);
    os_log_type_t v42 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v24 || !os_log_type_enabled(v24, v42)) {
      goto LABEL_78;
    }
    *(_WORD *)buf = 0;
    v43 = "Failed to create HTTP NSURLProtectionSpace";
LABEL_47:
    _os_log_impl(&dword_226071000, v24, v42, v43, buf, 2u);
LABEL_78:

    v52 = [(WFOperation *)self error];

    if (v52) {
      goto LABEL_38;
    }
    v24 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.wifikit.error" code:1 userInfo:0];
    [(WFOperation *)self setError:v24];
    goto LABEL_37;
  }
  if ([(WFProxyKeychainOperation *)self type] == 1)
  {
    id v10 = [(WFProxyKeychainOperation *)self password];

    id v11 = WFLogForCategory(0);
    os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
    BOOL v14 = (unint64_t)WFCurrentLogLevel() > 2 && v11 != 0;
    if (v10)
    {
      if (!v14) {
        goto LABEL_27;
      }
      id v15 = v11;
      if (!os_log_type_enabled(v15, v12)) {
        goto LABEL_26;
      }
      id v16 = [(WFProxyKeychainOperation *)self host];
      v17 = [(WFProxyKeychainOperation *)self port];
      v18 = [(WFProxyKeychainOperation *)self username];
      *(_DWORD *)buf = 138412802;
      v55 = v16;
      __int16 v56 = 2112;
      int64_t v57 = (int64_t)v17;
      __int16 v58 = 2112;
      v59 = v18;
      v19 = "Updating password for host: %@ port: %@ username: %@";
    }
    else
    {
      if (!v14) {
        goto LABEL_27;
      }
      id v15 = v11;
      if (!os_log_type_enabled(v15, v12))
      {
LABEL_26:

LABEL_27:
        id v29 = objc_alloc(MEMORY[0x263EFC620]);
        v30 = [(WFProxyKeychainOperation *)self host];
        v31 = [(WFProxyKeychainOperation *)self port];
        uint64_t v32 = [v31 integerValue];
        uint64_t v33 = *MEMORY[0x263EFC570];
        v24 = [v29 initWithProxyHost:v30 port:v32 type:*MEMORY[0x263EFC5B8] realm:0 authenticationMethod:*MEMORY[0x263EFC570]];

        id v34 = objc_alloc(MEMORY[0x263EFC620]);
        v35 = [(WFProxyKeychainOperation *)self host];
        v36 = [(WFProxyKeychainOperation *)self port];
        uint64_t v37 = [v36 integerValue];
        v25 = (void *)[v34 initWithProxyHost:v35 port:v37 type:*MEMORY[0x263EFC5C0] realm:0 authenticationMethod:v33];

        if (!v24)
        {
          v27 = WFLogForCategory(0);
          os_log_type_t v48 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v48)) {
            goto LABEL_77;
          }
          *(_WORD *)buf = 0;
          v49 = "Failed to create HTTP NSURLProtectionSpace";
          goto LABEL_65;
        }
        if (!v25)
        {
          v27 = WFLogForCategory(0);
          os_log_type_t v48 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v48)) {
            goto LABEL_77;
          }
          *(_WORD *)buf = 0;
          v49 = "Failed to create HTTPS NSURLProtectionSpace";
          goto LABEL_65;
        }
        if (v10)
        {
          v38 = (void *)MEMORY[0x263EFC610];
          v39 = [(WFProxyKeychainOperation *)self username];
          v40 = [(WFProxyKeychainOperation *)self password];
          v27 = [v38 credentialWithUser:v39 password:v40 persistence:2];

          if (v27)
          {
            [v9 setCredential:v27 forProtectionSpace:v24];
            [v9 setCredential:v27 forProtectionSpace:v25];
LABEL_36:

LABEL_37:
            goto LABEL_38;
          }
          v27 = WFLogForCategory(0);
          os_log_type_t v48 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v48)) {
            goto LABEL_77;
          }
          *(_WORD *)buf = 0;
          v49 = "Failed to create HSURLCredentials for proxy";
LABEL_65:
          _os_log_impl(&dword_226071000, v27, v48, v49, buf, 2u);
LABEL_77:

          goto LABEL_78;
        }
        v27 = [(WFProxyKeychainOperation *)self _credentialsForProtectionSpace:v24];
        uint64_t v41 = [(WFProxyKeychainOperation *)self _credentialsForProtectionSpace:v25];
        v28 = (void *)v41;
        if (v27)
        {
          if (v41)
          {
            [v9 removeCredential:v27 forProtectionSpace:v24];
            [v9 removeCredential:v28 forProtectionSpace:v25];
            goto LABEL_35;
          }
          v50 = WFLogForCategory(0);
          os_log_type_t v51 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v50 || !os_log_type_enabled(v50, v51)) {
            goto LABEL_75;
          }
          *(_WORD *)buf = 0;
        }
        else
        {
          v50 = WFLogForCategory(0);
          os_log_type_t v51 = OSLogForWFLogLevel(1uLL);
          if (!WFCurrentLogLevel() || !v50 || !os_log_type_enabled(v50, v51)) {
            goto LABEL_75;
          }
          *(_WORD *)buf = 0;
        }
        _os_log_impl(&dword_226071000, v50, v51, "Failed to create HSURLCredentials for proxy", buf, 2u);
LABEL_75:

        goto LABEL_76;
      }
      id v16 = [(WFProxyKeychainOperation *)self host];
      v17 = [(WFProxyKeychainOperation *)self port];
      v18 = [(WFProxyKeychainOperation *)self username];
      *(_DWORD *)buf = 138412802;
      v55 = v16;
      __int16 v56 = 2112;
      int64_t v57 = (int64_t)v17;
      __int16 v58 = 2112;
      v59 = v18;
      v19 = "Removing password for host: %@ port: %@ username: %@";
    }
    _os_log_impl(&dword_226071000, v15, v12, v19, buf, 0x20u);

    goto LABEL_26;
  }
LABEL_38:
  [(WFOperation *)self finish];
}

- (id)_credentialsForProtectionSpace:(id)a3
{
  os_log_type_t v4 = (void *)MEMORY[0x263EFC618];
  id v5 = a3;
  v6 = [v4 sharedCredentialStorage];
  id v7 = [v6 credentialsForProtectionSpace:v5];

  if (v7)
  {
    int64_t v8 = [(WFProxyKeychainOperation *)self username];
    id v9 = [v7 objectForKey:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)port
{
  return self->_port;
}

- (void)setPort:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end