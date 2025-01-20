@interface AccountTransformerSubscribedCalendar
- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4;
- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6;
- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4;
@end

@implementation AccountTransformerSubscribedCalendar

- (void)accountPropertiesFromConfiguration:(id)a3 account:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000133CC;
  v17[3] = &unk_10001CCA0;
  id v21 = a5;
  id v22 = a6;
  id v18 = v10;
  v19 = self;
  id v20 = v11;
  v16.receiver = self;
  v16.super_class = (Class)AccountTransformerSubscribedCalendar;
  id v12 = v21;
  id v13 = v11;
  id v14 = v22;
  id v15 = v10;
  [(AccountTransformer *)&v16 accountPropertiesFromConfiguration:v15 account:v13 accountStore:v12 completionHandler:v17];
}

- (void)applyProperties:(id)a3 toAccount:(id)a4 accountStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  [v11 setAuthenticated:1];
  +[DAAccount daAccountSubclassWithBackingAccountInfo:v11];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100013A80;
  v33[3] = &unk_10001CCC8;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v34 = v14;
  id v15 = v11;
  id v35 = v15;
  id v16 = v10;
  id v36 = v16;
  [v16 enumerateKeysAndObjectsUsingBlock:v33];
  [v16 objectForKeyedSubscript:ACAccountPropertyPersonaIdentifier];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100013F40;
  v31 = sub_100013F50;
  id v32 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100013F58;
  v21[3] = &unk_10001CBB8;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  v26 = &v27;
  id v22 = v17;
  v23 = self;
  id v18 = v15;
  id v24 = v18;
  id v19 = v12;
  id v25 = v19;
  id v20 = +[DMCPersonaHelper performBlockUnderPersona:v17 block:v21];
  v13[2](v13, v28[5]);

  _Block_object_dispose(&v27, 8);
}

- (BOOL)changesRequireRecreation:(id)a3 properties:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = +[DAAccount daAccountSubclassWithBackingAccountInfo:a3];
    v7 = [v6 username];
    v8 = [v5 objectForKeyedSubscript:@"_remotemanagement_username"];
    unsigned __int8 v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      id v10 = [v6 host];
      id v11 = [v5 objectForKeyedSubscript:@"_remotemanagement_hostname"];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if (v12)
      {
        BOOL v13 = 0;
LABEL_12:

        goto LABEL_13;
      }
      id v14 = +[RMLog accountTransformerSubscribedCalendar];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = 0;
        id v15 = "Configuration change to hostname requires account to be recreated";
        id v16 = (uint8_t *)&v18;
        goto LABEL_10;
      }
    }
    else
    {
      id v14 = +[RMLog accountTransformerSubscribedCalendar];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = 0;
        id v15 = "Configuration change to username requires account to be recreated.";
        id v16 = (uint8_t *)&v19;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
      }
    }

    BOOL v13 = 1;
    goto LABEL_12;
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (void)configurationUIForConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v24 = (void (**)(id, uint64_t, void *, void))a4;
  v6 = +[RMLog accountTransformerSubscribedCalendar];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 declaration];
    v8 = [v7 declarationIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Get configuration UI for: %{public}@", buf, 0xCu);
  }
  v23 = [v5 declaration];
  unsigned __int8 v9 = [v23 payloadVisibleName];
  id v10 = [v23 payloadCalendarURL];
  id v22 = v5;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = v10;
  }
  if (v9) {
    CFStringRef v12 = v9;
  }
  else {
    CFStringRef v12 = @"-";
  }
  BOOL v13 = +[RMStoreLocalizable string:](RMStoreLocalizable, "string:", v11, RMConfigurationUIDetails);
  id v14 = +[RMStoreLocalizable string:@"UI.Description.SubscribedCalendar"];
  id v15 = +[RMStoreLocalizable string:@"UI.Key.Name"];
  v26[0] = v15;
  v26[1] = v12;
  id v16 = +[NSArray arrayWithObjects:v26 count:2];
  v27[0] = v16;
  id v17 = +[RMStoreLocalizable string:@"UI.Key.URL"];
  v25[0] = v17;
  v25[1] = v10;
  __int16 v18 = +[NSArray arrayWithObjects:v25 count:2];
  v27[1] = v18;
  __int16 v19 = +[NSArray arrayWithObjects:v27 count:2];
  id v20 = [v21 configurationUIWithTitle:v13 description:v14 details:v19];

  v24[2](v24, 1, v20, 0);
}

@end