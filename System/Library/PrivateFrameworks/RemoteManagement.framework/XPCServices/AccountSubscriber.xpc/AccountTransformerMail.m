@interface AccountTransformerMail
- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4;
- (id)_authSchemeForAuthenticationMethod:(id)a3;
- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation AccountTransformerMail

- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100010900;
  v17[3] = &unk_10001CCA0;
  id v21 = a5;
  id v22 = a6;
  id v18 = v10;
  v19 = self;
  id v20 = v11;
  v16.receiver = self;
  v16.super_class = (Class)AccountTransformerMail;
  id v12 = v21;
  id v13 = v11;
  id v14 = v22;
  id v15 = v10;
  [(AccountTransformer *)&v16 accountPropertiesFromConfiguration:v15 account:v13 accountStore:v12 completionHandler:v17];
}

- (id)_authSchemeForAuthenticationMethod:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"EmailAuthCRAMMD5"])
  {
    v4 = @"CRAM-MD5";
  }
  else if ([v3 isEqualToString:@"EmailAuthNTLM"])
  {
    v4 = @"NTLM";
  }
  else if ([v3 isEqualToString:@"EmailAuthHTTPMD5"])
  {
    v4 = @"DIGEST-MD5";
  }
  else
  {
    v4 = (__CFString *)ACAuthenticationSchemeAnyPlainText;
  }

  return v4;
}

- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v59 = (void (**)(id, void))a6;
  uint64_t v10 = [v9 objectForKeyedSubscript:@"RemoteManagementSecondaryAccountIdentifier"];
  id v11 = +[RMLog accountTransformerMail];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (!v10)
  {
    if (v12) {
      sub_100015404(v11);
    }

    goto LABEL_9;
  }
  if (v12) {
    sub_100015448();
  }

  id v13 = +[SMTPAccount accountWithIdentifier:v10];
  if (!v13)
  {
LABEL_9:
    id v14 = +[RMLog accountTransformerMail];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1000153C0(v14);
    }

    id v13 = objc_opt_new();
  }
  v58 = (void *)v10;
  id v15 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_100015358();
  }

  objc_super v16 = [v13 persistentAccount];
  [v16 setAuthenticated:1];

  v17 = [v8 objectForKeyedSubscript:@"RemoteManagementAccountType"];
  [v17 isEqualToString:ACAccountTypeIdentifierIMAP];
  id v18 = (objc_class *)objc_opt_class();

  id v19 = [[v18 alloc] initWithPersistentAccount:v9];
  id v20 = NSStringFromClass(v18);
  [v19 setAccountProperty:v20 forKey:MFMailAccountClass];

  [v9 setAuthenticated:1];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_100011F7C;
  v77[3] = &unk_10001CCC8;
  id v21 = v19;
  id v78 = v21;
  id v57 = v9;
  id v79 = v57;
  id v22 = v8;
  id v80 = v22;
  [v22 enumerateKeysAndObjectsUsingBlock:v77];
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1000126B8;
  v75[3] = &unk_10001CDE0;
  id v23 = v13;
  id v76 = v23;
  [v22 enumerateKeysAndObjectsUsingBlock:v75];
  [v21 setDeliveryAccount:v23];
  v24 = [v23 identifier];
  [v21 setAccountProperty:v24 forKey:@"RemoteManagementSecondaryAccountIdentifier"];

  v25 = [v21 identifier];
  [v23 setAccountProperty:v25 forKey:@"RemoteManagementPrimaryAccountIdentifier"];

  +[MailAccount reloadAccounts];
  v26 = +[MailAccount mailAccounts];
  id v27 = [v26 mutableCopy];

  [v27 addObject:v21];
  v28 = [v22 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier];
  v29 = +[RMLog accountTransformerMail];
  v30 = &NSStringFromClass_ptr;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_1000152F0();
  }

  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  v71[2] = sub_100012984;
  v71[3] = &unk_10001CE08;
  id v31 = v28;
  id v72 = v31;
  id v56 = v27;
  id v73 = v56;
  id v32 = v21;
  id v74 = v32;
  id v33 = +[DMCPersonaHelper performBlockUnderPersona:v31 block:v71];
  v34 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    sub_100015288();
  }

  +[DeliveryAccount addDeliveryAccount:v23];
  v35 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
    sub_100015220();
  }

  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000129F0;
  v68[3] = &unk_10001CD78;
  id v36 = v31;
  id v69 = v36;
  id v55 = v23;
  id v70 = v55;
  id v37 = +[DMCPersonaHelper performBlockUnderPersona:v36 block:v68];
  v38 = [v22 objectForKeyedSubscript:@"_remotemanagement_smimeSigningIdentity"];

  if (v38)
  {
    v39 = [v32 accountPropertyForKey:MailAccountEmailAddresses];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v40 = [v39 countByEnumeratingWithState:&v64 objects:v82 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v65;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v65 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          v45 = [v22 objectForKeyedSubscript:@"_remotemanagement_smimeSigningIdentity"];
          [v32 setSigningIdentityPersistentReference:v45 forAddress:v44];
        }
        id v41 = [v39 countByEnumeratingWithState:&v64 objects:v82 count:16];
      }
      while (v41);
    }

    v30 = &NSStringFromClass_ptr;
  }
  v46 = [v22 objectForKeyedSubscript:@"_remotemanagement_smimeEncryptionIdentity"];

  if (v46)
  {
    v47 = [v32 accountPropertyForKey:MailAccountEmailAddresses];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v48 = [v47 countByEnumeratingWithState:&v60 objects:v81 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v61;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v61 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
          v53 = [v22 objectForKeyedSubscript:@"_remotemanagement_smimeEncryptionIdentity"];
          [v32 setEncryptionIdentityPersistentReference:v53 forAddress:v52];
        }
        id v49 = [v47 countByEnumeratingWithState:&v60 objects:v81 count:16];
      }
      while (v49);
    }

    v30 = &NSStringFromClass_ptr;
  }
  v54 = [v30[127] accountTransformerMail];
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
    sub_1000151B8();
  }

  v59[2](v59, 0);
}

- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v8 = [v6 objectForKeyedSubscript:@"RemoteManagementAccountType"];
    [v8 isEqualToString:ACAccountTypeIdentifierIMAP];
    id v9 = (objc_class *)objc_opt_class();

    id v10 = [[v9 alloc] initWithPersistentAccount:v5];
    id v11 = [v10 username];
    BOOL v12 = [v7 objectForKeyedSubscript:@"_remotemanagement_username"];
    unsigned __int8 v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v14 = [v10 hostname];
      id v15 = [v7 objectForKeyedSubscript:@"_remotemanagement_hostname"];
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if (v16)
      {
        v17 = [v7 objectForKeyedSubscript:@"_remotemanagement_port"];
        if (v17
          && (unsigned int v18 = [v10 portNumber],
              v18 != [v17 unsignedIntValue]))
        {
          id v22 = +[RMLog accountTransformerMail];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v45 = 0;
            v35 = "Configuration change to inbound mail port number requires account to be recreated";
            id v36 = v45;
            goto LABEL_25;
          }
        }
        else
        {
          id v19 = NSStringFromClass(v9);
          id v20 = [v5 objectForKeyedSubscript:MFMailAccountClass];
          unsigned __int8 v21 = [v19 isEqualToString:v20];

          if (v21)
          {
            id v22 = [v5 objectForKeyedSubscript:@"RemoteManagementSecondaryAccountIdentifier"];
            if (!v22)
            {
LABEL_13:
              BOOL v32 = 0;
LABEL_33:

              goto LABEL_34;
            }
            id v23 = +[SMTPAccount accountWithIdentifier:v22];
            v24 = [v23 username];
            v25 = [v7 objectForKeyedSubscript:@"_remotemanagement_usernameSecondary"];
            unsigned __int8 v26 = [v24 isEqualToString:v25];

            if (v26)
            {
              id v27 = [v23 hostname];
              v28 = [v7 objectForKeyedSubscript:@"_remotemanagement_hostnameSecondary"];
              unsigned __int8 v29 = [v27 isEqualToString:v28];

              if (v29)
              {
                v30 = [v7 objectForKeyedSubscript:@"_remotemanagement_portSecondary"];
                if (!v30
                  || (unsigned int v31 = [v23 portNumber],
                      v31 == [v30 unsignedIntValue]))
                {

                  goto LABEL_13;
                }
                id v40 = +[RMLog accountTransformerMail];
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)id v41 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Configuration change to outbound mail port number requires account to be recreated", v41, 2u);
                }

                goto LABEL_31;
              }
              v30 = +[RMLog accountTransformerMail];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)uint64_t v42 = 0;
                id v37 = "Configuration change to outbound mail hostname requires account to be recreated";
                v38 = v42;
                goto LABEL_30;
              }
            }
            else
            {
              v30 = +[RMLog accountTransformerMail];
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v43 = 0;
                id v37 = "Configuration change to outbound mail username requires account to be recreated.";
                v38 = (uint8_t *)&v43;
LABEL_30:
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v37, v38, 2u);
              }
            }
LABEL_31:

            goto LABEL_32;
          }
          id v22 = +[RMLog accountTransformerMail];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v44 = 0;
            v35 = "Configuration change to inbound mail type requires account to be recreated";
            id v36 = (uint8_t *)&v44;
LABEL_25:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v35, v36, 2u);
          }
        }
LABEL_32:
        BOOL v32 = 1;
        goto LABEL_33;
      }
      v17 = +[RMLog accountTransformerMail];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v33 = "Configuration change to inbound mail hostname requires account to be recreated";
        v34 = buf;
        goto LABEL_19;
      }
    }
    else
    {
      v17 = +[RMLog accountTransformerMail];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v47 = 0;
        id v33 = "Configuration change to inbound mail username requires account to be recreated.";
        v34 = (uint8_t *)&v47;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v33, v34, 2u);
      }
    }
    BOOL v32 = 1;
LABEL_34:

    goto LABEL_35;
  }
  BOOL v32 = 0;
LABEL_35:

  return v32;
}

- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v25 = (void (**)(id, uint64_t, void *, void))a4;
  id v6 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 declaration];
    id v8 = [v7 declarationIdentifier];
    *(_DWORD *)buf = 138543362;
    v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Get configuration UI for: %{public}@", buf, 0xCu);
  }
  v24 = [v5 declaration];
  id v9 = [v24 payloadVisibleName];
  id v10 = [v24 payloadIncomingServer];
  id v11 = [v10 payloadHostName];

  id v23 = v5;
  if (v9) {
    BOOL v12 = v9;
  }
  else {
    BOOL v12 = v11;
  }
  if (v9) {
    CFStringRef v13 = v9;
  }
  else {
    CFStringRef v13 = @"-";
  }
  id v14 = +[RMStoreLocalizable string:](RMStoreLocalizable, "string:", v12, RMConfigurationUIDetails);
  id v15 = +[RMStoreLocalizable string:@"UI.Description.Mail"];
  unsigned __int8 v16 = +[RMStoreLocalizable string:@"UI.Key.Name"];
  v27[0] = v16;
  v27[1] = v13;
  v17 = +[NSArray arrayWithObjects:v27 count:2];
  v28[0] = v17;
  unsigned int v18 = +[RMStoreLocalizable string:@"UI.Key.Server"];
  v26[0] = v18;
  v26[1] = v11;
  id v19 = +[NSArray arrayWithObjects:v26 count:2];
  v28[1] = v19;
  id v20 = +[NSArray arrayWithObjects:v28 count:2];
  unsigned __int8 v21 = [v22 configurationUIWithTitle:v14 description:v15 details:v20];

  v25[2](v25, 1, v21, 0);
}

@end