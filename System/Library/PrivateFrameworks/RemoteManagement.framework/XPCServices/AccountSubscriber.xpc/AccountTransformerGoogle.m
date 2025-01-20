@interface AccountTransformerGoogle
- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4;
- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation AccountTransformerGoogle

- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E428;
  v17[3] = &unk_10001CCA0;
  id v21 = a5;
  id v22 = a6;
  id v18 = v10;
  v19 = self;
  id v20 = v11;
  v16.receiver = self;
  v16.super_class = (Class)AccountTransformerGoogle;
  id v12 = v21;
  id v13 = v11;
  id v14 = v22;
  id v15 = v10;
  [(AccountTransformer *)&v16 accountPropertiesFromConfiguration:v15 account:v13 accountStore:v12 completionHandler:v17];
}

- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = ACAccountPropertyPersonaIdentifier;
  id v11 = (void (**)(id, void))a6;
  id v12 = [v8 objectForKeyedSubscript:v10];
  [v9 setAuthenticated:1];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000EA9C;
  v25[3] = &unk_10001CCC8;
  id v13 = [objc_alloc((Class)MailAccount) initWithPersistentAccount:v9];
  id v26 = v13;
  id v14 = v9;
  id v27 = v14;
  id v15 = v8;
  id v28 = v15;
  [v15 enumerateKeysAndObjectsUsingBlock:v25];
  +[MailAccount reloadAccounts];
  objc_super v16 = +[MailAccount mailAccounts];
  id v17 = [v16 mutableCopy];

  [v17 addObject:v13];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000EF44;
  v22[3] = &unk_10001CD78;
  id v18 = v17;
  id v23 = v18;
  id v19 = v13;
  id v24 = v19;
  id v20 = +[DMCPersonaHelper performBlockUnderPersona:v12 block:v22];
  id v21 = +[RMLog accountTransformerGoogle];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000150CC((uint64_t)v19, v21);
  }

  v11[2](v11, 0);
}

- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)MailAccount) initWithPersistentAccount:v6];

  id v8 = [v7 username];
  id v9 = [v5 objectForKeyedSubscript:@"_remotemanagement_username"];

  unsigned __int8 v10 = [v8 isEqualToString:v9];
  if ((v10 & 1) == 0)
  {
    id v11 = +[RMLog accountTransformerGoogle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Configuration change to username requires account to be recreated.", v14, 2u);
    }
  }
  char v12 = v10 ^ 1;

  return v12;
}

- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void *, void))a4;
  id v7 = +[RMLog accountTransformerGoogle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v5 declaration];
    id v9 = [v8 declarationIdentifier];
    *(_DWORD *)buf = 138543362;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Get configuration UI for: %{public}@", buf, 0xCu);
  }
  unsigned __int8 v10 = [v5 declaration];
  id v11 = [v10 payloadVisibleName];
  if (v11) {
    CFStringRef v12 = v11;
  }
  else {
    CFStringRef v12 = @"UI.Description.Google";
  }
  if (v11) {
    CFStringRef v13 = v11;
  }
  else {
    CFStringRef v13 = @"-";
  }
  id v14 = +[RMStoreLocalizable string:v12];
  id v15 = +[RMStoreLocalizable string:@"UI.Description.Google"];
  objc_super v16 = +[RMStoreLocalizable string:@"UI.Key.Name"];
  v20[0] = v16;
  v20[1] = v13;
  id v17 = +[NSArray arrayWithObjects:v20 count:2];
  id v21 = v17;
  id v18 = +[NSArray arrayWithObjects:&v21 count:1];
  id v19 = +[RMConfigurationUIDetails configurationUIWithTitle:v14 description:v15 details:v18];

  v6[2](v6, 1, v19, 0);
}

@end