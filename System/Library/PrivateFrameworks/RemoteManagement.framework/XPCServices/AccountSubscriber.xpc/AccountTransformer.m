@interface AccountTransformer
+ (Class)transformerClassForConfigurationType:(id)a3;
- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4;
- (id)_personaIDForConfiguration:(id)a3 accountStore:(id)a4;
- (id)combinedServerTokensFromConfiguration:(id)a3;
- (id)declarationKeyForConfiguration:(id)a3;
- (id)resolveKeychainAssetReference:(id)a3 assetIdentifier:(id)a4 error:(id *)a5;
- (id)resolveUserIdentityAssetReference:(id)a3 assetIdentifier:(id)a4 error:(id *)a5;
- (id)resolveUserNameAndPasswordAssetReference:(id)a3 assetIdentifier:(id)a4 error:(id *)a5;
- (id)saveAccount:(id)a3 accountStore:(id)a4;
- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)addAccountDescriptionToProperties:(id)a3 account:(id)a4 description:(id)a5;
- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
@end

@implementation AccountTransformer

+ (Class)transformerClassForConfigurationType:(id)a3
{
  uint64_t v3 = qword_100022310;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_100022310, &stru_10001CB40);
  }
  v5 = [(id)qword_100022308 objectForKeyedSubscript:v4];

  return (Class)v5;
}

- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v27 = a5;
  id v26 = a6;
  v28[0] = @"RemoteManagementDeclarationKey";
  v24 = [(AccountTransformer *)self declarationKeyForConfiguration:v9];
  v23 = [v24 key];
  v29[0] = v23;
  v28[1] = @"RemoteManagementSourceIdentifier";
  v10 = [v9 store];
  v11 = [v10 identifier];
  v29[1] = v11;
  v28[2] = @"RemoteManagementConfigurationIdentifier";
  v12 = [v9 declaration];
  v13 = [v12 declarationIdentifier];
  v29[2] = v13;
  v28[3] = @"RemoteManagementConfigurationType";
  v14 = [v9 declaration];
  v15 = [v14 declarationType];
  v29[3] = v15;
  v28[4] = @"RemoteManagementServerTokens";
  v25 = self;
  v16 = [(AccountTransformer *)self combinedServerTokensFromConfiguration:v9];
  v28[5] = @"_remotemanagement_managingOwnerIdentifierKey";
  v29[4] = v16;
  v29[5] = @"RemoteManagement";
  v17 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:6];
  id v18 = [v17 mutableCopy];

  v19 = [v9 store];
  v20 = [v19 accountIdentifier];
  if (v20) {
    [v18 setObject:v20 forKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
  }
  v21 = [(AccountTransformer *)v25 _personaIDForConfiguration:v9 accountStore:v27];
  if (v21) {
    [v18 setObject:v21 forKeyedSubscript:ACAccountPropertyPersonaIdentifier];
  }
  v22 = [v19 name];
  if (v22) {
    [v18 setObject:v22 forKeyedSubscript:@"_remotemanagement_managingSourceNameKey"];
  }
  if ([v19 isManagedStore]) {
    [v18 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_isManagedKey"];
  }
  (*((void (**)(id, id, void, void))v26 + 2))(v26, v18, 0, 0);
}

- (void)addAccountDescriptionToProperties:(id)a3 account:(id)a4 description:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    id v9 = [v7 accountDescription];
    v10 = [v7 objectForKeyedSubscript:@"RemoteManagementDefaultDescription"];
    if ([v10 isEqualToString:v9]) {
      id v11 = v8;
    }
    else {
      id v11 = v9;
    }
    [v12 setObject:v11 forKeyedSubscript:@"_remotemanagement_accountDescription"];
  }
  else
  {
    [v12 setObject:v8 forKeyedSubscript:@"_remotemanagement_accountDescription"];
  }
  [v12 setObject:v8 forKeyedSubscript:@"_remotemanagement_accountDefaultDescription"];
}

- (id)_personaIDForConfiguration:(id)a3 accountStore:(id)a4
{
  id v5 = a4;
  v6 = [a3 store];
  if ([v6 dataSeparated])
  {
    id v7 = [v6 accountIdentifier];
    if (!v7
      || ([v5 accountWithIdentifier:v7],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v9))
    {
      id v9 = [v6 personaIdentifier];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)saveAccount:(id)a3 accountStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100008160;
  v20 = sub_100008170;
  id v21 = 0;
  id v7 = objc_opt_new();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008178;
  v12[3] = &unk_10001CB68;
  id v8 = v5;
  id v13 = v8;
  v15 = &v16;
  id v9 = v7;
  id v14 = v9;
  [v6 saveVerifiedAccount:v8 withCompletionHandler:v12];
  [v9 waitForCompletion];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  [v11 setAuthenticated:1];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000846C;
  v32[3] = &unk_10001CB90;
  id v14 = v11;
  id v33 = v14;
  id v15 = v10;
  id v34 = v15;
  [v15 enumerateKeysAndObjectsUsingBlock:v32];
  [v15 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100008160;
  v30 = sub_100008170;
  id v31 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008AAC;
  v20[3] = &unk_10001CBB8;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v25 = &v26;
  id v21 = v16;
  v22 = self;
  id v17 = v14;
  id v23 = v17;
  id v18 = v12;
  id v24 = v18;
  id v19 = +[DMCPersonaHelper performBlockUnderPersona:v16 block:v20];
  v13[2](v13, v27[5]);

  _Block_object_dispose(&v26, 8);
}

- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 username];
    id v8 = [v6 objectForKeyedSubscript:@"_remotemanagement_username"];
    unsigned __int8 v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      id v10 = [v5 objectForKeyedSubscript:ACAccountPropertyHostname];
      id v11 = [v6 objectForKeyedSubscript:@"_remotemanagement_hostname"];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        id v13 = [v6 objectForKeyedSubscript:@"_remotemanagement_port"];
        if (!v13
          || ([v5 objectForKeyedSubscript:ACAccountPropertyPortNumber],
              id v14 = objc_claimAutoreleasedReturnValue(),
              v14,
              v14 == v13))
        {
          BOOL v16 = 0;
          goto LABEL_16;
        }
        id v15 = +[RMLog accountTransformer];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Configuration change to port number requires account to be recreated", v20, 2u);
        }

LABEL_15:
        BOOL v16 = 1;
LABEL_16:

        goto LABEL_17;
      }
      id v13 = +[RMLog accountTransformer];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_WORD *)buf = 0;
      id v17 = "Configuration change to hostname requires account to be recreated";
      id v18 = buf;
    }
    else
    {
      id v13 = +[RMLog accountTransformer];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      __int16 v22 = 0;
      id v17 = "Configuration change to username requires account to be recreated.";
      id v18 = (uint8_t *)&v22;
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    goto LABEL_15;
  }
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (id)combinedServerTokensFromConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = +[NSSortDescriptor sortDescriptorWithKey:@"declarationIdentifier" ascending:1];
  id v5 = [v3 assets];
  id v24 = v4;
  id v6 = +[NSArray arrayWithObjects:&v24 count:1];
  id v7 = [v5 sortedArrayUsingDescriptors:v6];

  id v8 = objc_opt_new();
  unsigned __int8 v9 = [v3 declaration];
  id v10 = [v9 declarationServerToken];
  [v8 addObject:v10];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "declarationServerToken", (void)v19);
        [v8 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v8 componentsJoinedByString:@", "];

  return v17;
}

- (id)declarationKeyForConfiguration:(id)a3
{
  id v3 = +[RMStoreDeclarationKey newDeclarationKeyWithSubscriberIdentifier:@"com.apple.RemoteManagement.AccountSubscriber" reference:a3];

  return v3;
}

- (id)resolveUserIdentityAssetReference:(id)a3 assetIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100008160;
  id v27 = sub_100008170;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100008160;
  long long v21 = sub_100008170;
  id v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009158;
  v13[3] = &unk_10001CBE0;
  id v15 = &v17;
  BOOL v16 = &v23;
  id v9 = (id)objc_opt_new();
  id v14 = v9;
  +[RMAssetResolverController extractUserIdentityAsset:v7 assetIdentifier:v8 completionHandler:v13];
  [v9 waitForCompletion];
  if (a5)
  {
    id v10 = (void *)v24[5];
    if (v10) {
      *a5 = v10;
    }
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)resolveUserNameAndPasswordAssetReference:(id)a3 assetIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100008160;
  id v27 = sub_100008170;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100008160;
  long long v21 = sub_100008170;
  id v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000093D0;
  v13[3] = &unk_10001CC08;
  id v15 = &v17;
  BOOL v16 = &v23;
  id v9 = (id)objc_opt_new();
  id v14 = v9;
  +[RMAssetResolverController resolveUserNameAndPasswordAsset:v7 assetIdentifier:v8 completionHandler:v13];
  [v9 waitForCompletion];
  if (a5)
  {
    id v10 = (void *)v24[5];
    if (v10) {
      *a5 = v10;
    }
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (id)resolveKeychainAssetReference:(id)a3 assetIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100008160;
  id v27 = sub_100008170;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100008160;
  long long v21 = sub_100008170;
  id v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009650;
  v13[3] = &unk_10001CC30;
  id v15 = &v17;
  BOOL v16 = &v23;
  id v9 = (id)objc_opt_new();
  id v14 = v9;
  +[RMAssetResolverController resolveKeychainAsset:v7 assetIdentifier:v8 accessGroup:@"com.apple.managed.account.identities" completionHandler:v13];
  [v9 waitForCompletion];
  if (a5)
  {
    id v10 = (void *)v24[5];
    if (v10) {
      *a5 = v10;
    }
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

@end