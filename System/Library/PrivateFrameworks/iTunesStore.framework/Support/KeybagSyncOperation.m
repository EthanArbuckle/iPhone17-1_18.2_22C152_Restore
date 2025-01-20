@interface KeybagSyncOperation
- (KeybagSyncOperation)initWithKeybagSyncRequest:(id)a3;
- (id)_newBodyDataWithBodyPlist:(id)a3 error:(id *)a4;
- (id)_newRequestPropertiesWithBodyData:(id)a3;
- (void)run;
@end

@implementation KeybagSyncOperation

- (KeybagSyncOperation)initWithKeybagSyncRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KeybagSyncOperation;
  v5 = [(KeybagSyncOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 accountIdentifier];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSNumber *)v6;
  }
  return v5;
}

- (void)run
{
  v3 = self->_accountIdentifier;
  if (v3) {
    goto LABEL_43;
  }
  id v4 = +[SSAccountStore defaultStore];
  v5 = [v4 activeAccount];
  v3 = [v5 uniqueIdentifier];

  if (v3)
  {
LABEL_43:
    CFDataRef v6 = sub_10002D24C([(NSNumber *)v3 unsignedLongLongValue], 11);
    if (v6)
    {
      CFDataRef v7 = v6;
      id v8 = objc_alloc_init((Class)NSMutableDictionary);
      [v8 setObject:v7 forKey:@"kbsync"];
      [v8 setObject:@"familyChange" forKey:@"reason"];
      objc_super v9 = +[ISDevice sharedInstance];
      v10 = [v9 guid];

      if ([v10 length]) {
        [v8 setObject:v10 forKey:@"guid"];
      }
      id v47 = 0;
      id v11 = [(KeybagSyncOperation *)self _newBodyDataWithBodyPlist:v8 error:&v47];
      id v12 = v47;
      if (!v11)
      {
        id v27 = 0;
LABEL_39:

        goto LABEL_40;
      }
      id v13 = objc_alloc_init((Class)ISStoreURLOperation);
      v14 = +[DaemonProtocolDataProvider provider];
      [v14 setShouldProcessProtocol:0];
      v45 = v14;
      [v13 setDataProvider:v14];
      id v15 = [(KeybagSyncOperation *)self _newRequestPropertiesWithBodyData:v11];
      [v15 setURLBagKey:@"view-software-updates"];
      v42 = v15;
      [v13 setRequestProperties:v15];
      id v44 = v13;
      id v41 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:v3];
      objc_msgSend(v13, "setAuthenticationContext:");
      v16 = +[SSLogConfig sharedDaemonConfig];
      if (!v16)
      {
        v16 = +[SSLogConfig sharedConfig];
      }
      v43 = v3;
      unsigned int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        v17 |= 2u;
      }
      v18 = [v16 OSLogObject];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        v17 &= 2u;
      }
      if (v17)
      {
        v19 = objc_opt_class();
        int v48 = 138412290;
        id v49 = v19;
        id v20 = v8;
        CFDataRef v21 = v7;
        id v22 = v11;
        v23 = v10;
        id v24 = v19;
        LODWORD(v39) = 12;
        v38 = &v48;
        v25 = (void *)_os_log_send_and_compose_impl();

        v10 = v23;
        id v11 = v22;
        CFDataRef v7 = v21;
        id v8 = v20;

        if (!v25)
        {
LABEL_17:

          id v46 = v12;
          v26 = v44;
          id v27 = [(KeybagSyncOperation *)self runSubOperation:v44 returningError:&v46];
          id v28 = v46;

          v3 = v43;
          if (v27)
          {
            v29 = [v45 output];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v40 = v28;
              v30 = [v29 objectForKey:@"keybag"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v31 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v30 options:0];

                v30 = v31;
                v26 = v44;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                sub_10002E31C(v30);
              }

              id v28 = v40;
            }
          }
          id v12 = v28;
          goto LABEL_39;
        }
        v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v48, v39);
        free(v25);
        v38 = (int *)v18;
        SSFileLog();
      }

      goto LABEL_17;
    }
  }
  v32 = +[SSLogConfig sharedDaemonConfig];
  if (!v32)
  {
    v32 = +[SSLogConfig sharedConfig];
  }
  unsigned int v33 = [v32 shouldLog];
  if ([v32 shouldLogToDisk]) {
    int v34 = v33 | 2;
  }
  else {
    int v34 = v33;
  }
  v35 = [v32 OSLogObject];
  if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    v34 &= 2u;
  }
  if (!v34) {
    goto LABEL_36;
  }
  int v48 = 138412290;
  id v49 = (id)objc_opt_class();
  id v36 = v49;
  LODWORD(v39) = 12;
  v38 = &v48;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v48, v39);
    free(v37);
    v38 = (int *)v35;
    SSFileLog();
LABEL_36:
  }
  SSError();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = 0;
LABEL_40:
  -[KeybagSyncOperation setError:](self, "setError:", v12, v38);
  [(KeybagSyncOperation *)self setSuccess:v27];
}

- (id)_newBodyDataWithBodyPlist:(id)a3 error:(id *)a4
{
  id v9 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:100 options:0 error:&v9];
  id v6 = v9;
  if (v5)
  {
    CFDataRef v7 = (void *)ISCopyGzippedDataForData();
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    CFDataRef v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v7) {
    *a4 = v6;
  }
LABEL_7:

  return v7;
}

- (id)_newRequestPropertiesWithBodyData:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v4 setAllowedRetryCount:0];
  [v4 setHTTPBody:v3];

  [v4 setHTTPMethod:@"POST"];
  [v4 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
  [v4 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  v5 = +[SSDevice currentDevice];
  id v6 = [v5 userAgentWithClientName:@"AppStore" version:@"2.0"];

  if (v6) {
    [v4 setValue:v6 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end