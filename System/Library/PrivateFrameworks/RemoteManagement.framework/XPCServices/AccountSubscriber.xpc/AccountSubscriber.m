void sub_100002D08(id a1)
{
  uint64_t vars8;

  qword_100022228 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountAdapter");

  _objc_release_x1();
}

void sub_1000031DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectForKeyedSubscript:@"RemoteManagementConfigurationIdentifier"];

  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"RemoteManagementPrimaryAccountIdentifier"];

    v6 = +[RMLog accountAdapter];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        sub_100014544(v3);
      }

      [*(id *)(a1 + 48) addObject:v3];
    }
    else
    {
      if (v7) {
        sub_100014490(v3);
      }

      v8 = *(void **)(a1 + 32);
      id v9 = v3;
      v10 = [v9 objectForKeyedSubscript:@"RemoteManagementSourceIdentifier"];
      v11 = [v9 objectForKeyedSubscript:@"RemoteManagementConfigurationIdentifier"];

      v12 = +[NSString stringWithFormat:@"%@-%@", v10, v11];

      [v8 setObject:v9 forKeyedSubscript:v12];
      v13 = *(void **)(a1 + 40);
      v14 = [v9 identifier];
      [v13 addObject:v14];
    }
  }
}

void sub_1000037A4(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      [*(id *)(a1 + 40) _unassignAssetReference:v5 scope:*(void *)(a1 + 56) error:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100003D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003D84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003D94(uint64_t a1)
{
}

void sub_100003D9C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) complete];
}

void sub_100003E34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100003EA8(id a1)
{
  qword_100022238 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountApplicator");

  _objc_release_x1();
}

void sub_100004A4C(_Unwind_Exception *a1)
{
}

void sub_100004A7C(uint64_t a1)
{
}

uint64_t sub_100004A84(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004A94(uint64_t a1)
{
}

void sub_100004A9C(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    id v9 = +[RMLog accountApplicator];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100014794(a1, (uint64_t)v8, v9);
    }

    uint64_t v10 = *(void **)(a1 + 40);
    v11 = [*(id *)(a1 + 32) declaration];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100004D6C;
    v33[3] = &unk_10001C690;
    v12 = &v34;
    id v34 = *(id *)(a1 + 48);
    [v10 configurationFailedToApply:v11 error:v8 completionHandler:v33];
  }
  else
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (a3 && v13)
    {
      v14 = +[RMLog accountApplicator];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100014728();
      }

      v15 = [*(id *)(a1 + 72) adapter];
      uint64_t v16 = *(void *)(a1 + 88);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100004D74;
      v24[3] = &unk_10001C6E0;
      v12 = (id *)&v25;
      uint64_t v25 = 0;
      id v26 = *(id *)(a1 + 56);
      id v18 = *(id *)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 72);
      id v27 = v18;
      uint64_t v28 = v19;
      uint64_t v29 = *(void *)(a1 + 32);
      id v30 = v7;
      id v31 = *(id *)(a1 + 48);
      id v32 = *(id *)(a1 + 40);
      [v15 removeAccount:v17 scope:v16 completionHandler:v24];
    }
    else
    {
      v20 = *(void **)(a1 + 72);
      uint64_t v21 = *(void *)(a1 + 32);
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100004F24;
      v22[3] = &unk_10001C6B8;
      v12 = &v23;
      id v23 = *(id *)(a1 + 48);
      [v20 _createAccountIfNeededAndApplyProperties:v13 configuration:v21 properties:v7 completionHandler:v22];
    }
  }
}

void sub_100004D6C(uint64_t a1)
{
}

void sub_100004D74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = +[RMLog accountApplicator];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000148C4();
    }

    id v7 = *(void **)(a1 + 88);
    id v8 = [*(id *)(a1 + 64) declaration];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004F1C;
    v13[3] = &unk_10001C690;
    id v9 = &v14;
    id v14 = *(id *)(a1 + 80);
    [v7 configurationFailedToApply:v8 error:v3 completionHandler:v13];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100014858();
    }

    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100004F14;
    v15[3] = &unk_10001C6B8;
    id v9 = &v16;
    uint64_t v12 = *(void *)(a1 + 72);
    id v16 = *(id *)(a1 + 80);
    [v10 _createAccountIfNeededAndApplyProperties:0 configuration:v11 properties:v12 completionHandler:v15];
  }
}

void sub_100004F14(uint64_t a1)
{
}

void sub_100004F1C(uint64_t a1)
{
}

void sub_100004F24(uint64_t a1)
{
}

void sub_100004F2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RMLog accountApplicator];
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001499C();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_100014930();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_100004FC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000052C8(uint64_t a1)
{
}

uint64_t sub_1000052D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000054CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) store];
  uint64_t v5 = +[RMLog accountApplicator];
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100014C3C(a1, (uint64_t)v3, v6);
    }

    id v7 = [*(id *)(a1 + 32) declaration];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000568C;
    v9[3] = &unk_10001C780;
    id v8 = &v10;
    id v10 = *(id *)(a1 + 48);
    [v4 configurationFailedToApply:v7 error:v3 completionHandler:v9];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100014BC0(a1, v6);
    }

    id v7 = [*(id *)(a1 + 32) declaration];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000567C;
    v11[3] = &unk_10001C780;
    id v8 = &v12;
    id v12 = *(id *)(a1 + 48);
    [v4 configurationSuccessfullyApplied:v7 completionHandler:v11];
  }
}

uint64_t sub_10000567C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000568C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000056E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100005704(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100005778(id a1)
{
  qword_100022248 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatus");

  _objc_release_x1();
}

void sub_100005CD0(id a1)
{
  qword_100022258 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusAdapter");

  _objc_release_x1();
}

void sub_100005E80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"RemoteManagementSourceIdentifier"];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = +[RMLog accountStatusAdapter];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100014D40(v3, v5);
    }

    [*(id *)(a1 + 40) addObject:v3];
  }
}

void sub_1000060FC(id a1)
{
  qword_100022268 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandler");

  _objc_release_x1();
}

void sub_1000061C8(id a1)
{
  v1 = +[RMModelAccountCalDAVDeclaration registeredIdentifier];
  v10[0] = v1;
  v11[0] = objc_opt_class();
  v2 = +[RMModelAccountCardDAVDeclaration registeredIdentifier];
  v10[1] = v2;
  v11[1] = objc_opt_class();
  id v3 = +[RMModelAccountExchangeDeclaration registeredIdentifier];
  v10[2] = v3;
  v11[2] = objc_opt_class();
  uint64_t v4 = +[RMModelAccountGoogleDeclaration registeredIdentifier];
  v10[3] = v4;
  v11[3] = objc_opt_class();
  uint64_t v5 = +[RMModelAccountLDAPDeclaration registeredIdentifier];
  v10[4] = v5;
  void v11[4] = objc_opt_class();
  id v6 = +[RMModelAccountMailDeclaration registeredIdentifier];
  v10[5] = v6;
  v11[5] = objc_opt_class();
  id v7 = +[RMModelAccountSubscribedCalendarDeclaration registeredIdentifier];
  v10[6] = v7;
  v11[6] = objc_opt_class();
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
  uint64_t v9 = (void *)qword_100022278;
  qword_100022278 = v8;
}

void sub_10000652C(id a1)
{
  qword_100022288 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerCalDAV");

  _objc_release_x1();
}

void sub_1000067B4(id a1)
{
  qword_100022298 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerCardDAV");

  _objc_release_x1();
}

void sub_1000069BC(id a1)
{
  qword_1000222A8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerExchange");

  _objc_release_x1();
}

void sub_100006CF8(id a1)
{
  qword_1000222B8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerGoogle");

  _objc_release_x1();
}

void sub_100006F8C(id a1)
{
  qword_1000222C8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerLDAP");

  _objc_release_x1();
}

void sub_1000071D8(id a1)
{
  qword_1000222D8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerMail");

  _objc_release_x1();
}

void sub_100007694(id a1)
{
  qword_1000222E8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerSubscribedCalendar");

  _objc_release_x1();
}

void sub_1000078C4(id a1)
{
  qword_1000222F8 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformer");

  _objc_release_x1();
}

void sub_100007984(id a1)
{
  v1 = +[RMModelAccountCalDAVDeclaration registeredIdentifier];
  v10[0] = v1;
  v11[0] = objc_opt_class();
  v2 = +[RMModelAccountCardDAVDeclaration registeredIdentifier];
  v10[1] = v2;
  v11[1] = objc_opt_class();
  id v3 = +[RMModelAccountExchangeDeclaration registeredIdentifier];
  v10[2] = v3;
  v11[2] = objc_opt_class();
  uint64_t v4 = +[RMModelAccountGoogleDeclaration registeredIdentifier];
  v10[3] = v4;
  v11[3] = objc_opt_class();
  uint64_t v5 = +[RMModelAccountLDAPDeclaration registeredIdentifier];
  v10[4] = v5;
  void v11[4] = objc_opt_class();
  id v6 = +[RMModelAccountMailDeclaration registeredIdentifier];
  v10[5] = v6;
  v11[5] = objc_opt_class();
  id v7 = +[RMModelAccountSubscribedCalendarDeclaration registeredIdentifier];
  v10[6] = v7;
  v11[6] = objc_opt_class();
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
  uint64_t v9 = (void *)qword_100022308;
  qword_100022308 = v8;
}

void sub_100008148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008160(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008170(uint64_t a1)
{
}

void sub_100008178(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = +[RMLog accountTransformer];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100014E8C(a1, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100014F08(a1, (uint64_t)v5, v7);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v5;
    id v7 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }

  [*(id *)(a1 + 40) complete];
}

void sub_100008454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000846C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_active"])
  {
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
    {
      [*(id *)(a1 + 32) setAccountDescription:v6];
      goto LABEL_49;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
    {
      id v7 = *(void **)(a1 + 32);
      CFStringRef v8 = @"RemoteManagementDefaultDescription";
LABEL_47:
      id v23 = v6;
LABEL_48:
      [v7 setObject:v23 forKeyedSubscript:v8];
      goto LABEL_49;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_authenticationScheme"])
    {
      id v7 = *(void **)(a1 + 32);
      id v9 = (const __CFString **)&ACAccountPropertyAuthenticationScheme;
    }
    else
    {
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_credential"])
      {
        [*(id *)(a1 + 32) setCredential:v6];
        goto LABEL_49;
      }
      if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_emailAddress"])
      {
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
        {
          id v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
          id v11 = [v10 mutableCopy];

          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
          id v13 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v38;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v38 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                [*(id *)(a1 + 32) setEnabled:1 forDataclass:v17];
                [v11 removeObject:v17];
              }
              id v14 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
            }
            while (v14);
          }

          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v18 = v11;
          id v19 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v34;
            do
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v34 != v21) {
                  objc_enumerationMutation(v18);
                }
                [*(id *)(a1 + 32) setEnabled:0 forDataclass:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
              }
              id v20 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
            }
            while (v20);
          }
        }
        else
        {
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableCalendarsUserOverridable"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&kMCAccountEnableCalendarsUserOverridableKey;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableContactsUserOverridable"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&kMCAccountEnableContactsUserOverridableKey;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableMailUserOverridable"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&kMCAccountEnableMailUserOverridableKey;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableNotesUserOverridable"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&kMCAccountEnableNotesUserOverridableKey;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableRemindersUserOverridable"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&kMCAccountEnableRemindersUserOverridableKey;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_fullUserName"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&ACAccountPropertyFullName;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_hostname"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&ACAccountPropertyHostname;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_imapServerPathPrefixKey"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&ACAccountPropertyServerPath;
            goto LABEL_46;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
          {
            [*(id *)(a1 + 32) setManagingOwnerIdentifier:v6];
            goto LABEL_49;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
          {
            [*(id *)(a1 + 32) setManagingSourceName:v6];
            goto LABEL_49;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
          {
            id v7 = *(void **)(a1 + 32);
            CFStringRef v8 = @"MCAccountIsManaged";
            goto LABEL_47;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
          {
            v24 = +[ACAccountCredential credentialWithPassword:v6];
            [*(id *)(a1 + 32) setCredential:v24];

            [*(id *)(a1 + 32) setCredentialType:ACCredentialTypePassword];
            goto LABEL_49;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_port"])
          {
            id v7 = *(void **)(a1 + 32);
            id v9 = (const __CFString **)&ACAccountPropertyPortNumber;
            goto LABEL_46;
          }
          if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
          {
            if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
            {
              id v7 = *(void **)(a1 + 32);
              id v9 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
            }
            else
            {
              if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
              {
                [*(id *)(a1 + 32) setUsername:v6];
                goto LABEL_49;
              }
              if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
              {
                if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
                  goto LABEL_49;
                }
                id v7 = *(void **)(a1 + 32);
                id v23 = v6;
                CFStringRef v8 = v5;
                goto LABEL_48;
              }
              id v7 = *(void **)(a1 + 32);
              id v9 = (const __CFString **)&ACAccountPropertySSLEnabled;
            }
            goto LABEL_46;
          }
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"_remotemanagement_provisionedDataclasses", 0);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          id v25 = [v18 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v25)
          {
            id v26 = v25;
            uint64_t v27 = *(void *)v30;
            do
            {
              for (k = 0; k != v26; k = (char *)k + 1)
              {
                if (*(void *)v30 != v27) {
                  objc_enumerationMutation(v18);
                }
                [*(id *)(a1 + 32) setProvisioned:1 forDataclass:*(void *)(*((void *)&v29 + 1) + 8 * (void)k)];
              }
              id v26 = [v18 countByEnumeratingWithState:&v29 objects:v41 count:16];
            }
            while (v26);
          }
        }

        goto LABEL_49;
      }
      id v7 = *(void **)(a1 + 32);
      id v9 = (const __CFString **)&ACAccountPropertyIdentityEmailAddress;
    }
LABEL_46:
    CFStringRef v8 = *v9;
    goto LABEL_47;
  }
  objc_msgSend(*(id *)(a1 + 32), "setActive:", objc_msgSend(v6, "BOOLValue"));
LABEL_49:
}

void sub_100008AAC(uint64_t a1)
{
  v2 = +[RMLog accountTransformer];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014F94(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) saveAccount:*(void *)(a1 + 48) accountStore:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100009134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100009158(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  [*(id *)(a1 + 32) complete];
}

void sub_1000093AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000093D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  [*(id *)(a1 + 32) complete];
}

void sub_10000962C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100009650(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  [*(id *)(a1 + 32) complete];
}

void sub_100009744(id a1)
{
  qword_100022318 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerCalDAV");

  _objc_release_x1();
}

void sub_1000098BC(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 payloadAuthenticationCredentialsAssetReference];
    uint64_t v6 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009A7C;
    v11[3] = &unk_10001CC78;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v7;
    void v11[4] = v8;
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v14 = v4;
    id v15 = *(id *)(a1 + 56);
    +[RMAssetResolverController resolveUserNameAndPasswordAsset:v6 assetIdentifier:v5 completionHandler:v11];
  }
  else
  {
    uint64_t v9 = +[RMLog accountTransformerCalDAV];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100015010((uint64_t)v4, v9);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    id v5 = +[RMErrorUtilities createInternalError];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v5);
  }
}

void sub_100009A7C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v24 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v6 = [v5 payloadUserName];
    id v7 = [v24 payloadPassword];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 56) payloadVisibleName];
    if (v11)
    {
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v11];
    }
    else
    {
      id v12 = [*(id *)(a1 + 56) payloadHostName];
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v12];
    }
    [*(id *)(a1 + 40) setObject:ACAccountTypeIdentifierCalDAV forKeyedSubscript:@"RemoteManagementAccountType"];
    id v13 = [*(id *)(a1 + 56) payloadHostName];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"_remotemanagement_hostname"];

    if (v7)
    {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"_remotemanagement_password"];
      [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentials"];
    }
    id v14 = [*(id *)(a1 + 56) payloadPort];
    if (v14) {
      [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:@"_remotemanagement_port"];
    }
    id v15 = [*(id *)(a1 + 56) payloadPath];
    if (v15)
    {
      uint64_t v16 = +[NSURL URLWithString:v15];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"_remotemanagement_principalURL"];
      }
    }
    id v18 = *(void **)(a1 + 64);
    id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RemoteManagementAccountType"];
    id v20 = [v18 accountTypeWithAccountTypeIdentifier:v19];
    uint64_t v21 = [v20 supportedDataclasses];
    [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];

    v22 = *(void **)(a1 + 48);
    if (v22) {
      [v22 enabledDataclasses];
    }
    else {
    id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    }
    [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"_remotemanagement_username"];
    [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
    (*(void (**)(void, void, id, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 40), [*(id *)(a1 + 32) changesRequireRecreation:*(void *)(a1 + 48) properties:*(void *)(a1 + 40)], 0);
  }
}

void sub_100009FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A008(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&RMAccountPropertyKeyDefaultDescription;
LABEL_5:
      CFStringRef v9 = *v8;
LABEL_6:
      id v10 = v6;
LABEL_7:
      [v7 setObject:v10 forKeyedSubscript:v9];
      goto LABEL_39;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
    {
      id v11 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
      id v12 = [v11 mutableCopy];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
      id v14 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v38;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            [a1[5] setEnabled:1 forDataclass:v18];
            [v12 removeObject:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v15);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v19 = v12;
      id v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            [a1[5] setEnabled:0 forDataclass:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
          }
          id v21 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v21);
      }
    }
    else
    {
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_hostname"])
      {
        [a1[4] setHost:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
      {
        id v7 = a1[5];
        CFStringRef v9 = @"MCAccountIsManaged";
        goto LABEL_6;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
      {
        [a1[5] setManagingOwnerIdentifier:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
      {
        [a1[5] setManagingSourceName:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
      {
        [a1[4] setPassword:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_port"])
      {
        objc_msgSend(a1[4], "setPort:", objc_msgSend(v6, "integerValue"));
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_principalURL"])
      {
        [a1[4] setPrincipalURL:v6];
        goto LABEL_39;
      }
      if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
      {
        if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
        {
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
          {
            [a1[4] setUsername:v6];
            goto LABEL_39;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
          {
            [a1[4] setUseSSL:v6 != 0];
            goto LABEL_39;
          }
          if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
            goto LABEL_39;
          }
          uint64_t v28 = ACAccountPropertyPersonaIdentifier;
          if ([(__CFString *)v5 isEqualToString:ACAccountPropertyPersonaIdentifier])
          {
            [a1[4] setAccountProperty:v6 forKey:v28];
            goto LABEL_39;
          }
          id v7 = a1[5];
          id v10 = v6;
          CFStringRef v9 = v5;
          goto LABEL_7;
        }
        id v7 = a1[5];
        uint64_t v8 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
        goto LABEL_5;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      objc_msgSend(a1[6], "objectForKeyedSubscript:", @"_remotemanagement_provisionedDataclasses", 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v30;
        do
        {
          for (k = 0; k != v25; k = (char *)k + 1)
          {
            if (*(void *)v30 != v26) {
              objc_enumerationMutation(v19);
            }
            [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v29 + 1) + 8 * (void)k)];
          }
          id v25 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
        }
        while (v25);
      }
    }

    goto LABEL_39;
  }
  [a1[4] setAccountDescription:v6];
LABEL_39:
}

uint64_t sub_10000A524(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A534(uint64_t a1)
{
}

void sub_10000A53C(uint64_t a1)
{
  v2 = +[RMLog accountTransformerCalDAV];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014F94(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) saveAccount:*(void *)(a1 + 48) accountStore:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000AAA8(id a1)
{
  qword_100022328 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerCardDAV");

  _objc_release_x1();
}

void sub_10000AC20(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 payloadAuthenticationCredentialsAssetReference];
    uint64_t v6 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000ADE0;
    v11[3] = &unk_10001CC78;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v7;
    void v11[4] = v8;
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v14 = v4;
    id v15 = *(id *)(a1 + 56);
    +[RMAssetResolverController resolveUserNameAndPasswordAsset:v6 assetIdentifier:v5 completionHandler:v11];
  }
  else
  {
    CFStringRef v9 = +[RMLog accountTransformerCardDAV];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100015010((uint64_t)v4, v9);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    id v5 = +[RMErrorUtilities createInternalError];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v5);
  }
}

void sub_10000ADE0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v24 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v6 = [v5 payloadUserName];
    id v7 = [v24 payloadPassword];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 56) payloadVisibleName];
    if (v11)
    {
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v11];
    }
    else
    {
      id v12 = [*(id *)(a1 + 56) payloadHostName];
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v12];
    }
    [*(id *)(a1 + 40) setObject:ACAccountTypeIdentifierCardDAV forKeyedSubscript:@"RemoteManagementAccountType"];
    id v13 = [*(id *)(a1 + 56) payloadHostName];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"_remotemanagement_hostname"];

    if (v7)
    {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"_remotemanagement_password"];
      [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentials"];
    }
    id v14 = [*(id *)(a1 + 56) payloadPort];
    if (v14) {
      [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:@"_remotemanagement_port"];
    }
    id v15 = [*(id *)(a1 + 56) payloadPath];
    if (v15)
    {
      uint64_t v16 = +[NSURL URLWithString:v15];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"_remotemanagement_principalURL"];
      }
    }
    uint64_t v18 = *(void **)(a1 + 64);
    id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RemoteManagementAccountType"];
    id v20 = [v18 accountTypeWithAccountTypeIdentifier:v19];
    id v21 = [v20 supportedDataclasses];
    [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];

    uint64_t v22 = *(void **)(a1 + 48);
    if (v22) {
      [v22 enabledDataclasses];
    }
    else {
    id v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    }
    [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"_remotemanagement_username"];
    [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
    (*(void (**)(void, void, id, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 40), [*(id *)(a1 + 32) changesRequireRecreation:*(void *)(a1 + 48) properties:*(void *)(a1 + 40)], 0);
  }
}

void sub_10000B354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B36C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&RMAccountPropertyKeyDefaultDescription;
LABEL_5:
      CFStringRef v9 = *v8;
LABEL_6:
      id v10 = v6;
LABEL_7:
      [v7 setObject:v10 forKeyedSubscript:v9];
      goto LABEL_39;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
    {
      id v11 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
      id v12 = [v11 mutableCopy];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
      id v14 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v38;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            [a1[5] setEnabled:1 forDataclass:v18];
            [v12 removeObject:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v15);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v19 = v12;
      id v20 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v34;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v19);
            }
            [a1[5] setEnabled:0 forDataclass:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
          }
          id v21 = [v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v21);
      }
    }
    else
    {
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_hostname"])
      {
        [a1[4] setHost:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
      {
        id v7 = a1[5];
        CFStringRef v9 = @"MCAccountIsManaged";
        goto LABEL_6;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
      {
        [a1[5] setManagingOwnerIdentifier:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
      {
        [a1[5] setManagingSourceName:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
      {
        [a1[4] setPassword:v6];
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_port"])
      {
        objc_msgSend(a1[4], "setPort:", objc_msgSend(v6, "integerValue"));
        goto LABEL_39;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_principalURL"])
      {
        [a1[4] setPrincipalURL:v6];
        goto LABEL_39;
      }
      if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
      {
        if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
        {
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
          {
            [a1[4] setUsername:v6];
            goto LABEL_39;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
          {
            [a1[4] setUseSSL:v6 != 0];
            goto LABEL_39;
          }
          if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
            goto LABEL_39;
          }
          uint64_t v28 = ACAccountPropertyPersonaIdentifier;
          if ([(__CFString *)v5 isEqualToString:ACAccountPropertyPersonaIdentifier])
          {
            [a1[4] setAccountProperty:v6 forKey:v28];
            goto LABEL_39;
          }
          id v7 = a1[5];
          id v10 = v6;
          CFStringRef v9 = v5;
          goto LABEL_7;
        }
        id v7 = a1[5];
        uint64_t v8 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
        goto LABEL_5;
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      objc_msgSend(a1[6], "objectForKeyedSubscript:", @"_remotemanagement_provisionedDataclasses", 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v30;
        do
        {
          for (k = 0; k != v25; k = (char *)k + 1)
          {
            if (*(void *)v30 != v26) {
              objc_enumerationMutation(v19);
            }
            [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v29 + 1) + 8 * (void)k)];
          }
          id v25 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
        }
        while (v25);
      }
    }

    goto LABEL_39;
  }
  [a1[4] setAccountDescription:v6];
LABEL_39:
}

uint64_t sub_10000B888(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B898(uint64_t a1)
{
}

void sub_10000B8A0(uint64_t a1)
{
  v2 = +[RMLog accountTransformerCardDAV];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014F94(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) saveAccount:*(void *)(a1 + 48) accountStore:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000BE0C(id a1)
{
  qword_100022338 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerExchange");

  _objc_release_x1();
}

void sub_10000BF84(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 payloadEnabledProtocolTypes];
    unsigned __int8 v6 = [v5 containsObject:@"EAS"];

    if (v6)
    {
      id v7 = [v4 payloadUserIdentityAssetReference];
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void **)(a1 + 40);
      id v187 = 0;
      id v10 = [v8 resolveUserIdentityAssetReference:v9 assetIdentifier:v7 error:&v187];
      id v11 = v187;
      if (v11)
      {
        id v12 = v11;
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_93:

        goto LABEL_94;
      }
      id v15 = [v4 payloadAuthenticationCredentialsAssetReference];
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(a1 + 40);
      id v186 = 0;
      uint64_t v18 = [v16 resolveUserNameAndPasswordAssetReference:v17 assetIdentifier:v15 error:&v186];
      id v19 = v186;
      if (v19)
      {
        id v12 = v19;
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_92:

        goto LABEL_93;
      }
      id v20 = [v18 payloadUserName];
      id v21 = [v18 payloadPassword];
      uint64_t v22 = [v4 payloadAuthenticationIdentityAssetReference];
      uint64_t v24 = *(void *)(a1 + 32);
      id v23 = *(void **)(a1 + 40);
      v185[1] = 0;
      v182 = (void *)v22;
      v183 = objc_msgSend(v23, "resolveKeychainAssetReference:assetIdentifier:error:", v24);
      id v25 = 0;
      if (v25)
      {
        id v12 = v25;
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_91:

        goto LABEL_92;
      }
      v164 = v15;
      uint64_t v26 = v18;
      v181 = v21;
      uint64_t v27 = [v4 payloadSMIME];
      uint64_t v28 = [v27 payloadSigning];
      uint64_t v29 = [v28 payloadIdentityAssetReference];

      uint64_t v31 = *(void *)(a1 + 32);
      long long v30 = *(void **)(a1 + 40);
      v185[0] = 0;
      v179 = (void *)v29;
      v180 = [v30 resolveKeychainAssetReference:v31 assetIdentifier:v29 error:v185];
      id v32 = v185[0];
      if (v32)
      {
        id v12 = v32;
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        id v21 = v181;
        uint64_t v18 = v26;
        id v15 = v164;
LABEL_90:

        goto LABEL_91;
      }
      long long v33 = [v4 payloadSMIME];
      long long v34 = [v33 payloadEncryption];
      uint64_t v35 = [v34 payloadIdentityAssetReference];

      long long v36 = (void *)v35;
      uint64_t v38 = *(void *)(a1 + 32);
      long long v37 = *(void **)(a1 + 40);
      id v184 = 0;
      v163 = [v37 resolveKeychainAssetReference:v38 assetIdentifier:v35 error:&v184];
      id v12 = v184;
      if (v12)
      {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        uint64_t v18 = v26;
        id v15 = v164;
LABEL_89:

        id v21 = v181;
        goto LABEL_90;
      }
      v162 = v20;
      long long v39 = *(void **)(a1 + 40);
      v153 = (void *)v35;
      uint64_t v154 = *(void *)(a1 + 48);
      long long v40 = [v4 payloadVisibleName];
      uint64_t v18 = v26;
      if (v40)
      {
        [v39 addAccountDescriptionToProperties:v3 account:v154 description:v40];
      }
      else
      {
        v41 = [v4 payloadHostName];
        [v39 addAccountDescriptionToProperties:v3 account:v154 description:v41];
      }
      id v15 = v164;

      v42 = [v4 payloadHostName];
      unsigned int v43 = [v42 isEqualToString:@"m.hotmail.com"];
      v44 = &ACAccountTypeIdentifierHotmail;
      if (!v43) {
        v44 = &ACAccountTypeIdentifierExchange;
      }
      [v3 setObject:*v44 forKeyedSubscript:@"RemoteManagementAccountType"];

      v45 = [v10 payloadEmailAddress];
      [v3 setObject:v45 forKeyedSubscript:@"_remotemanagement_emailAddress"];

      v46 = *(void **)(a1 + 56);
      v165 = [v3 objectForKeyedSubscript:@"RemoteManagementAccountType"];
      v47 = [v46 accountTypeWithAccountTypeIdentifier:v165];
      v48 = [v47 supportedDataclasses];
      [v3 setObject:v48 forKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];

      if (!*(void *)(a1 + 48))
      {
        v167 = objc_opt_new();
        v55 = [v4 payloadCalendarServiceActive];
        unsigned int v56 = [v55 BOOLValue];

        if (v56) {
          [v167 addObject:ACAccountDataclassCalendars];
        }
        v57 = [v4 payloadContactsServiceActive];
        unsigned int v58 = [v57 BOOLValue];

        if (v58) {
          [v167 addObject:ACAccountDataclassContacts];
        }
        v59 = [v4 payloadMailServiceActive];
        unsigned int v60 = [v59 BOOLValue];

        if (v60) {
          [v167 addObject:ACAccountDataclassMail];
        }
        v61 = [v4 payloadNotesServiceActive];
        unsigned int v62 = [v61 BOOLValue];

        if (v62) {
          [v167 addObject:ACAccountDataclassNotes];
        }
        v63 = [v4 payloadRemindersServiceActive];
        unsigned int v64 = [v63 BOOLValue];

        id v65 = v167;
        if (v64) {
          [v167 addObject:ACAccountDataclassReminders];
        }
LABEL_66:
        [v3 setObject:v65 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

        v83 = [v4 payloadLockCalendarService];
        v84 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v83 BOOLValue] ^ 1);
        [v3 setObject:v84 forKeyedSubscript:@"_remotemanagement_enableCalendarsUserOverridable"];

        v85 = [v4 payloadLockContactsService];
        v86 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v85 BOOLValue] ^ 1);
        [v3 setObject:v86 forKeyedSubscript:@"_remotemanagement_enableContactsUserOverridable"];

        v87 = [v4 payloadLockMailService];
        v88 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v87 BOOLValue] ^ 1);
        [v3 setObject:v88 forKeyedSubscript:@"_remotemanagement_enableMailUserOverridable"];

        v89 = [v4 payloadLockNotesService];
        v90 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v89 BOOLValue] ^ 1);
        [v3 setObject:v90 forKeyedSubscript:@"_remotemanagement_enableNotesUserOverridable"];

        v91 = [v4 payloadLockRemindersService];
        v92 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v91 BOOLValue] ^ 1);
        [v3 setObject:v92 forKeyedSubscript:@"_remotemanagement_enableRemindersUserOverridable"];

        [v3 setObject:v162 forKeyedSubscript:@"_remotemanagement_username"];
        if (v181) {
          [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentials"];
        }
        [v3 setObject:v183 forKeyedSubscript:@"_remotemanagement_authenticationIdentity"];
        v93 = [v4 payloadHostName];
        [v3 setObject:v93 forKeyedSubscript:@"_remotemanagement_hostname"];

        [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
        v94 = [v4 payloadOAuth];
        v95 = [v94 payloadEnabled];
        unsigned int v168 = [v95 BOOLValue];

        if (v168)
        {
          [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_exchangeEASOAuthSupportedKey"];
          v96 = [v4 payloadOAuth];
          uint64_t v97 = [v96 payloadSignInURL];

          v169 = (void *)v97;
          if (v97)
          {
            [v3 setObject:v97 forKeyedSubscript:@"_remotemanagement_exchangeEASOAuthURIKey"];
            v98 = objc_opt_new();
            [v98 setScheme:@"https"];
            v99 = [v4 payloadHostName];
            [v98 setHost:v99];

            v100 = [v98 string];
            [v3 setObject:v100 forKeyedSubscript:@"_remotemanagement_exchangeEASOEndPointFQDNKey"];
          }
          v101 = [v4 payloadOAuth];
          v102 = [v101 payloadTokenRequestURL];

          if (v102) {
            [v3 setObject:v102 forKeyedSubscript:@"_remotemanagement_exchangeEASOAuthTokenRequestURIKey"];
          }
          id v103 = [objc_alloc((Class)ACAccountCredential) initWithOAuth2Token:&stru_10001CEA8 refreshToken:0 expiryDate:0];
          [v3 setObject:v103 forKeyedSubscript:@"_remotemanagement_credential"];
        }
        else
        {
          [v3 setObject:v181 forKeyedSubscript:@"_remotemanagement_password"];
        }
        v104 = [v4 payloadSMIME];
        v105 = [v104 payloadSigning];

        if (v105)
        {
          v170 = [v4 payloadSMIME];
          v106 = [v170 payloadSigning];
          v107 = [v106 payloadEnabled];
          [v3 setObject:v107 forKeyedSubscript:@"_remotemanagement_smimeSigningEnabled"];

          [v3 setObject:v180 forKeyedSubscript:@"_remotemanagement_smimeSigningIdentity"];
          v171 = [v4 payloadSMIME];
          v108 = [v171 payloadSigning];
          v109 = [v108 payloadUserOverrideable];
          [v3 setObject:v109 forKeyedSubscript:@"_remotemanagement_smimeSigningOverrideable"];

          v172 = [v4 payloadSMIME];
          v110 = [v172 payloadSigning];
          v111 = [v110 payloadIdentityUserOverrideable];
          [v3 setObject:v111 forKeyedSubscript:@"_remotemanagement_smimeSigningIdentityOverrideable"];
        }
        v112 = [v4 payloadSMIME];
        v113 = [v112 payloadEncryption];

        if (v113)
        {
          v173 = [v4 payloadSMIME];
          v114 = [v173 payloadEncryption];
          v115 = [v114 payloadEnabled];
          [v3 setObject:v115 forKeyedSubscript:@"_remotemanagement_smimeEncryptionEnabledByDefault"];

          [v3 setObject:v163 forKeyedSubscript:@"_remotemanagement_smimeEncryptionIdentity"];
          v174 = [v4 payloadSMIME];
          v116 = [v174 payloadEncryption];
          v117 = [v116 payloadUserOverrideable];
          [v3 setObject:v117 forKeyedSubscript:@"_remotemanagement_smimeEncryptionOverrideable"];

          v175 = [v4 payloadSMIME];
          v118 = [v175 payloadEncryption];
          v119 = [v118 payloadIdentityUserOverrideable];
          [v3 setObject:v119 forKeyedSubscript:@"_remotemanagement_smimeEncryptionIdentityOverrideable"];

          v176 = [v4 payloadSMIME];
          v120 = [v176 payloadEncryption];
          v121 = [v120 payloadPerMessageSwitchEnabled];
          [v3 setObject:v121 forKeyedSubscript:@"_remotemanagement_smimeEncryptionEncryptionPerMessage"];
        }
        v122 = [v4 payloadOAuth];
        v177 = [v122 payloadEnabled];
        unsigned int v123 = [v177 BOOLValue];
        if (v123)
        {
          v148 = [v4 payloadOAuth];
          uint64_t v124 = [v148 payloadSignInURL];
          if (!v124)
          {

            goto LABEL_87;
          }
          v143 = (void *)v124;
        }
        v161 = v122;
        v125 = [v4 payloadHostName];

        if (v123)
        {
        }
        if (!v125)
        {
          NSErrorUserInfoKey v188 = NSDebugDescriptionErrorKey;
          v178 = +[NSString stringWithFormat:@"HostName key is required unless OAuth is enabled and SignInURL is not set"];
          v189 = v178;
          v126 = +[NSDictionary dictionaryWithObjects:&v189 forKeys:&v188 count:1];
          v127 = +[NSError errorWithDomain:@"AccountTransformerExchangeErrorDomain" code:0 userInfo:v126];

          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_88:
          id v20 = v162;
          long long v36 = v153;
          goto LABEL_89;
        }
LABEL_87:
        (*(void (**)(void, id, id, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v3, [*(id *)(a1 + 40) changesRequireRecreation:*(void *)(a1 + 48) properties:v3], 0);
        goto LABEL_88;
      }
      if (v162) {
        BOOL v49 = v181 == 0;
      }
      else {
        BOOL v49 = 1;
      }
      int v50 = v49;
      int v166 = v50;
      v155 = objc_opt_new();
      v51 = *(void **)(a1 + 48);
      v52 = (void *)ACAccountDataclassCalendars;
      v149 = [v4 payloadCalendarServiceActive];
      unsigned int v130 = [v149 BOOLValue];
      v144 = [v4 payloadLockCalendarService];
      unsigned int v135 = [v144 BOOLValue];
      id v53 = v51;
      id v54 = v52;
      id v156 = v155;
      if (v135)
      {
        if ((v166 | v130 ^ 1))
        {
LABEL_45:

          v66 = *(void **)(a1 + 48);
          v136 = (void *)ACAccountDataclassContacts;
          v150 = [v4 payloadContactsServiceActive];
          unsigned int v128 = [v150 BOOLValue];
          v145 = [v4 payloadLockContactsService];
          unsigned int v131 = [v145 BOOLValue];
          id v67 = v66;
          id v68 = v136;
          id v157 = v156;
          if (v131)
          {
            if ((v166 | v128 ^ 1))
            {
LABEL_50:

              v69 = *(void **)(a1 + 48);
              v137 = (void *)ACAccountDataclassMail;
              v151 = [v4 payloadMailServiceActive];
              unsigned int v129 = [v151 BOOLValue];
              v146 = [v4 payloadLockMailService];
              unsigned int v132 = [v146 BOOLValue];
              id v70 = v69;
              id v71 = v137;
              id v158 = v157;
              if (v132)
              {
                if ((v166 | v129 ^ 1))
                {
LABEL_55:

                  v72 = *(void **)(a1 + 48);
                  v73 = (void *)ACAccountDataclassNotes;
                  v152 = [v4 payloadNotesServiceActive];
                  unsigned int v133 = [v152 BOOLValue];
                  v147 = [v4 payloadLockNotesService];
                  unsigned int v138 = [v147 BOOLValue];
                  id v74 = v72;
                  id v75 = v73;
                  id v159 = v158;
                  v140 = v74;
                  if (v138)
                  {
                    v76 = v159;
                    if ((v166 | v133 ^ 1))
                    {
LABEL_60:

                      v78 = v76;
                      v79 = *(void **)(a1 + 48);
                      v141 = (void *)ACAccountDataclassReminders;
                      v160 = [v4 payloadRemindersServiceActive];
                      unsigned int v134 = [v160 BOOLValue];
                      v148 = [v4 payloadLockRemindersService];
                      unsigned int v139 = [v148 BOOLValue];
                      id v80 = v79;
                      id v142 = v141;
                      id v65 = v78;
                      v143 = v80;
                      if (v139)
                      {
                        v81 = v142;
                        if ((v166 | v134 ^ 1)) {
                          goto LABEL_65;
                        }
                      }
                      else
                      {
                        v82 = v80;
                        v81 = v142;
                        if (![v82 isEnabledForDataclass:v142])
                        {
LABEL_65:

                          goto LABEL_66;
                        }
                      }
                      [v65 addObject:v81];
                      goto LABEL_65;
                    }
                  }
                  else
                  {
                    unsigned int v77 = [v74 isEnabledForDataclass:v75];
                    v76 = v159;
                    if (!v77) {
                      goto LABEL_60;
                    }
                  }
                  [v76 addObject:v75];
                  goto LABEL_60;
                }
              }
              else if (![v70 isEnabledForDataclass:v71])
              {
                goto LABEL_55;
              }
              [v158 addObject:v71];
              goto LABEL_55;
            }
          }
          else if (![v67 isEnabledForDataclass:v68])
          {
            goto LABEL_50;
          }
          [v157 addObject:v68];
          goto LABEL_50;
        }
      }
      else if (![v53 isEnabledForDataclass:v54])
      {
        goto LABEL_45;
      }
      [v156 addObject:v54];
      goto LABEL_45;
    }
    id v13 = +[RMLog accountTransformerExchange];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100015088(v13);
    }
  }
  else
  {
    id v13 = +[RMLog accountTransformerExchange];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100015010((uint64_t)v4, v13);
    }
  }

  uint64_t v14 = *(void *)(a1 + 64);
  id v7 = +[RMErrorUtilities createInternalError];
  (*(void (**)(uint64_t, void, void, void *))(v14 + 16))(v14, 0, 0, v7);
LABEL_94:
}

void sub_10000D47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D494(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&RMAccountPropertyKeyDefaultDescription;
LABEL_5:
      CFStringRef v9 = *v8;
LABEL_6:
      id v10 = v6;
LABEL_7:
      [v7 setObject:v10 forKeyedSubscript:v9];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_authenticationIdentity"])
    {
      [a1[4] setIdentityCertificatePersistentID:v6 managedByProfile:1];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_emailAddress"])
    {
      [a1[4] setEmailAddress:v6];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_credential"])
    {
      [a1[5] setCredential:v6];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableCalendarsUserOverridable"])
    {
      id v7 = a1[4];
      uint64_t v8 = (const __CFString **)&kMCAccountEnableCalendarsUserOverridableKey;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableContactsUserOverridable"])
    {
      id v7 = a1[4];
      uint64_t v8 = (const __CFString **)&kMCAccountEnableContactsUserOverridableKey;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableMailUserOverridable"])
    {
      id v7 = a1[4];
      uint64_t v8 = (const __CFString **)&kMCAccountEnableMailUserOverridableKey;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableNotesUserOverridable"])
    {
      id v7 = a1[4];
      uint64_t v8 = (const __CFString **)&kMCAccountEnableNotesUserOverridableKey;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enableRemindersUserOverridable"])
    {
      id v7 = a1[4];
      uint64_t v8 = (const __CFString **)&kMCAccountEnableRemindersUserOverridableKey;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
    {
      id v11 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
      id v12 = [v11 mutableCopy];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v13 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
      id v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v41;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v41 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            [a1[5] setEnabled:1 forDataclass:v18];
            [v12 removeObject:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v15);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v19 = v12;
      id v20 = [v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v37;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            [a1[5] setEnabled:0 forDataclass:*(void *)(*((void *)&v36 + 1) + 8 * (void)j)];
          }
          id v21 = [v19 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v21);
      }

      goto LABEL_41;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_exchangeEASOAuthSupportedKey"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&kDAExchangeOAuthSupportedKey;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_exchangeEASOAuthURIKey"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&kDAExchangeOAuthURI;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_exchangeEASOEndPointFQDNKey"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&kDAEASEndPointFQDN;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_exchangeEASOAuthTokenRequestURIKey"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&kDAExchangeTokenRequestURI;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_hostname"])
    {
      [a1[4] setHost:v6];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
    {
      id v7 = a1[5];
      CFStringRef v9 = @"MCAccountIsManaged";
      goto LABEL_6;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
    {
      [a1[5] setManagingOwnerIdentifier:v6];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
    {
      [a1[5] setManagingSourceName:v6];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
    {
      [a1[4] setPassword:v6];
      goto LABEL_14;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      objc_msgSend(a1[6], "objectForKeyedSubscript:", @"_remotemanagement_provisionedDataclasses", 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      id v24 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v33;
        do
        {
          for (k = 0; k != v25; k = (char *)k + 1)
          {
            if (*(void *)v33 != v26) {
              objc_enumerationMutation(v19);
            }
            [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v32 + 1) + 8 * (void)k)];
          }
          id v25 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v25);
      }
      goto LABEL_41;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionEnabledByDefault"])
    {
      id v28 = a1[4];
      uint64_t v29 = &MFMailAccountEncryptionEnabled;
    }
    else
    {
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionIdentity"])
      {
        [a1[4] setEncryptionIdentityPersistentReference:v6];
        goto LABEL_14;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionOverrideable"])
      {
        id v28 = a1[4];
        uint64_t v29 = &MFMailAccountEncryptByDefaultUserOverrideable;
      }
      else if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionIdentityOverrideable"])
      {
        id v28 = a1[4];
        uint64_t v29 = &MFMailAccountEncryptionIdentityUserOverrideable;
      }
      else if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionEncryptionPerMessage"])
      {
        id v28 = a1[4];
        uint64_t v29 = &MFMailAccountPerMessageEncryptionEnabled;
      }
      else if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningEnabled"])
      {
        id v28 = a1[4];
        uint64_t v29 = &MFMailAccountSigningEnabled;
      }
      else
      {
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningIdentity"])
        {
          [a1[4] setSigningIdentityPersistentReference:v6];
          goto LABEL_14;
        }
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningOverrideable"])
        {
          id v28 = a1[4];
          uint64_t v29 = &MFMailAccountSigningUserOverrideable;
        }
        else
        {
          if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningIdentityOverrideable"])
          {
            if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
            {
              [a1[4] setUsername:v6];
              goto LABEL_14;
            }
            if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
            {
              [a1[4] setUseSSL:v6 != 0];
              goto LABEL_14;
            }
            if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
              goto LABEL_14;
            }
            uint64_t v30 = ACAccountPropertyPersonaIdentifier;
            if (![(__CFString *)v5 isEqualToString:ACAccountPropertyPersonaIdentifier])
            {
              id v7 = a1[5];
              id v10 = v6;
              CFStringRef v9 = v5;
              goto LABEL_7;
            }
            [a1[4] setAccountProperty:v6 forKey:v30];
            id v19 = +[MDMConfiguration sharedConfiguration];
            [v19 refreshDetailsFromDisk];
            uint64_t v31 = [v19 easEnrollmentID];
            [a1[5] setObject:v31 forKeyedSubscript:kESExchangeDeviceID];

            [a1[5] setObject:&__kCFBooleanTrue forKeyedSubscript:kESExchangeAccountWipeOnly];
            [a1[5] setObject:&__kCFBooleanTrue forKeyedSubscript:kESExchangeUserEnrollmentMode];
LABEL_41:

            goto LABEL_14;
          }
          id v28 = a1[4];
          uint64_t v29 = &MFMailAccountSigningIdentityUserOverrideable;
        }
      }
    }
    [v28 setAccountProperty:v6 forKey:*v29];
    goto LABEL_14;
  }
  [a1[4] setAccountDescription:v6];
LABEL_14:
}

uint64_t sub_10000DD2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DD3C(uint64_t a1)
{
}

void sub_10000DD44(uint64_t a1)
{
  v2 = +[RMLog accountTransformerExchange];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014F94(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) saveAccount:*(void *)(a1 + 48) accountStore:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000E2B0(id a1)
{
  qword_100022348 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerGoogle");

  _objc_release_x1();
}

void sub_10000E428(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 payloadUserIdentityAssetReference];
    uint64_t v6 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000E5E8;
    v11[3] = &unk_10001CD50;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v7;
    void v11[4] = v8;
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v14 = v4;
    id v15 = *(id *)(a1 + 56);
    +[RMAssetResolverController extractUserIdentityAsset:v6 assetIdentifier:v5 completionHandler:v11];
  }
  else
  {
    CFStringRef v9 = +[RMLog accountTransformerGoogle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100015010((uint64_t)v4, v9);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    id v5 = +[RMErrorUtilities createInternalError];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v5);
  }
}

void sub_10000E5E8(uint64_t a1, void *a2, uint64_t a3)
{
  id v22 = a2;
  if (a3)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    CFStringRef v9 = [*(id *)(a1 + 56) payloadVisibleName];
    if (v9)
    {
      [v6 addAccountDescriptionToProperties:v7 account:v8 description:v9];
    }
    else
    {
      uint64_t v10 = [v22 payloadEmailAddress];
      [v6 addAccountDescriptionToProperties:v7 account:v8 description:v10];
    }
    [*(id *)(a1 + 40) setObject:ACAccountTypeIdentifierGmail forKeyedSubscript:@"RemoteManagementAccountType"];
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"_remotemanagement_mailAccountClassKey"];

    id v13 = [v22 payloadFullName];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"_remotemanagement_fullUserName"];

    id v14 = *(void **)(a1 + 64);
    id v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RemoteManagementAccountType"];
    id v16 = [v14 accountTypeWithAccountTypeIdentifier:v15];
    uint64_t v17 = [v16 supportedDataclasses];
    [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];

    uint64_t v18 = *(void **)(a1 + 48);
    if (v18) {
      [v18 enabledDataclasses];
    }
    else {
    id v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    }
    [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

    id v20 = [v22 payloadEmailAddress];
    [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:@"_remotemanagement_username"];

    [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
    uint64_t v21 = *(void *)(a1 + 72);
    [*(id *)(a1 + 32) changesRequireRecreation:*(void *)(a1 + 48) properties:*(void *)(a1 + 40)];
    id v5 = *(void (**)(void))(v21 + 16);
  }
  v5();
}

void sub_10000EA9C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    if ([v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
    {
      id v11 = a1[5];
      CFStringRef v12 = @"RemoteManagementDefaultDescription";
LABEL_7:
      [v11 setObject:v6 forKeyedSubscript:v12];
      goto LABEL_25;
    }
    if ([v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
    {
      id v13 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
      id v14 = [v13 mutableCopy];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
      id v16 = [v15 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v41;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v41 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            [a1[5] setEnabled:1 forDataclass:v20];
            [v14 removeObject:v20];
          }
          id v17 = [v15 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v17);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v21 = v14;
      id v22 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v37;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v37 != v24) {
              objc_enumerationMutation(v21);
            }
            [a1[5] setEnabled:0 forDataclass:*(void *)(*((void *)&v36 + 1) + 8 * (void)j)];
          }
          id v23 = [v21 countByEnumeratingWithState:&v36 objects:v45 count:16];
        }
        while (v23);
      }
    }
    else
    {
      if ([v5 isEqualToString:@"_remotemanagement_fullUserName"])
      {
        id v7 = a1[4];
        uint64_t v8 = (id *)&MailAccountFullUserName;
        goto LABEL_3;
      }
      if ([v5 isEqualToString:@"_remotemanagement_isManagedKey"])
      {
        id v11 = a1[5];
        CFStringRef v12 = @"MCAccountIsManaged";
        goto LABEL_7;
      }
      if ([v5 isEqualToString:@"_remotemanagement_mailAccountClassKey"])
      {
        id v7 = a1[4];
        uint64_t v8 = (id *)&MFMailAccountClass;
        goto LABEL_3;
      }
      if ([v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
      {
        [a1[5] setManagingOwnerIdentifier:v6];
        goto LABEL_25;
      }
      if ([v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
      {
        [a1[5] setManagingSourceName:v6];
        goto LABEL_25;
      }
      if (![v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
      {
        if ([v5 isEqualToString:@"_remotemanagement_username"])
        {
          [a1[4] setUsername:v6];
          goto LABEL_25;
        }
        if ([v5 isEqualToString:@"_remotemanagement_usessl"])
        {
          objc_msgSend(a1[4], "setUsesSSL:", objc_msgSend(v6, "BOOLValue"));
          goto LABEL_25;
        }
        if ([v5 hasPrefix:@"_remotemanagement_"]) {
          goto LABEL_25;
        }
        uint64_t v30 = (void *)ACAccountPropertyPersonaIdentifier;
        unsigned int v31 = [v5 isEqualToString:ACAccountPropertyPersonaIdentifier];
        id v7 = a1[4];
        id v10 = v6;
        if (v31) {
          id v9 = v30;
        }
        else {
          id v9 = v5;
        }
        goto LABEL_4;
      }
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      objc_msgSend(a1[6], "objectForKeyedSubscript:", @"_remotemanagement_provisionedDataclasses", 0);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = [v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v33;
        do
        {
          for (k = 0; k != v27; k = (char *)k + 1)
          {
            if (*(void *)v33 != v28) {
              objc_enumerationMutation(v21);
            }
            [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v32 + 1) + 8 * (void)k)];
          }
          id v27 = [v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
        }
        while (v27);
      }
    }

    goto LABEL_25;
  }
  id v7 = a1[4];
  uint64_t v8 = (id *)&MFMailAccountDescription;
LABEL_3:
  id v9 = *v8;
  id v10 = v6;
LABEL_4:
  [v7 setAccountProperty:v10 forKey:v9];
LABEL_25:
}

id sub_10000EF44(uint64_t a1)
{
  +[MailAccount setMailAccounts:*(void *)(a1 + 32)];
  v2 = *(void **)(a1 + 40);

  return [v2 savePersistentAccount];
}

void sub_10000F314(id a1)
{
  qword_100022358 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerLDAP");

  _objc_release_x1();
}

void sub_10000F48C(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 payloadAuthenticationCredentialsAssetReference];
    uint64_t v6 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000F64C;
    v11[3] = &unk_10001CC78;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v7;
    void v11[4] = v8;
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v14 = v4;
    id v15 = *(id *)(a1 + 56);
    +[RMAssetResolverController resolveUserNameAndPasswordAsset:v6 assetIdentifier:v5 completionHandler:v11];
  }
  else
  {
    id v9 = +[RMLog accountTransformerLDAP];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100015010((uint64_t)v4, v9);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    id v5 = +[RMErrorUtilities createInternalError];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v5);
  }
}

void sub_10000F64C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v21 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v6 = [v5 payloadUserName];
    id v7 = [v21 payloadPassword];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 56) payloadVisibleName];
    if (v11)
    {
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v11];
    }
    else
    {
      id v12 = [*(id *)(a1 + 56) payloadHostName];
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v12];
    }
    [*(id *)(a1 + 40) setObject:ACAccountTypeIdentifierLDAP forKeyedSubscript:@"RemoteManagementAccountType"];
    id v13 = *(void **)(a1 + 64);
    id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RemoteManagementAccountType"];
    id v15 = [v13 accountTypeWithAccountTypeIdentifier:v14];
    id v16 = [v15 supportedDataclasses];
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];

    id v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

    uint64_t v18 = [*(id *)(a1 + 56) payloadHostName];
    [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:@"_remotemanagement_hostname"];

    if (v7)
    {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"_remotemanagement_password"];
      [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentials"];
    }
    id v19 = [*(id *)(a1 + 56) payloadPort];
    if (v19) {
      [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:@"_remotemanagement_port"];
    }
    if (v6) {
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"_remotemanagement_username"];
    }
    [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
    uint64_t v20 = [*(id *)(a1 + 56) payloadSearchSettings];
    if (v20) {
      [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:@"_remotemanagement_ldapSearchSettings"];
    }
    (*(void (**)(void, void, id, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 40), [*(id *)(a1 + 32) changesRequireRecreation:*(void *)(a1 + 48) properties:*(void *)(a1 + 40)], 0);
  }
}

void sub_10000FB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FBA0(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    [a1[4] setAccountDescription:v6];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
  {
    id v7 = a1[5];
    uint64_t v8 = (const __CFString **)&RMAccountPropertyKeyDefaultDescription;
LABEL_5:
    CFStringRef v9 = *v8;
LABEL_6:
    id v10 = v6;
LABEL_7:
    [v7 setObject:v10 forKeyedSubscript:v9];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v11 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    id v12 = [v11 countByEnumeratingWithState:&v54 objects:v61 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v54 + 1) + 8 * i)];
        }
        id v13 = [v11 countByEnumeratingWithState:&v54 objects:v61 count:16];
      }
      while (v13);
    }
LABEL_33:

    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
  {
    id v16 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    id v17 = [v16 mutableCopy];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v18 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
    id v19 = [v18 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * (void)j);
          [a1[5] setEnabled:1 forDataclass:v23];
          [v17 removeObject:v23];
        }
        id v20 = [v18 countByEnumeratingWithState:&v50 objects:v60 count:16];
      }
      while (v20);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v11 = v17;
    id v24 = [v11 countByEnumeratingWithState:&v46 objects:v59 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v47;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v47 != v26) {
            objc_enumerationMutation(v11);
          }
          [a1[5] setEnabled:0 forDataclass:*(void *)(*((void *)&v46 + 1) + 8 * (void)k)];
        }
        id v25 = [v11 countByEnumeratingWithState:&v46 objects:v59 count:16];
      }
      while (v25);
    }

    goto LABEL_33;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_hostname"])
  {
    [a1[4] setHost:v6];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
  {
    id v7 = a1[5];
    CFStringRef v9 = @"MCAccountIsManaged";
    goto LABEL_6;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
  {
    [a1[5] setManagingOwnerIdentifier:v6];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
  {
    [a1[5] setManagingSourceName:v6];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
  {
    [a1[4] setPassword:v6];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_port"])
  {
    objc_msgSend(a1[4], "setPort:", objc_msgSend(v6, "integerValue"));
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
  {
    id v7 = a1[5];
    uint64_t v8 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
    goto LABEL_5;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
  {
    [a1[4] setUsername:v6];
    goto LABEL_34;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
  {
    [a1[4] setUseSSL:v6 != 0];
    goto LABEL_34;
  }
  if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_ldapSearchSettings"])
  {
    if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
      goto LABEL_34;
    }
    uint64_t v37 = ACAccountPropertyPersonaIdentifier;
    if ([(__CFString *)v5 isEqualToString:ACAccountPropertyPersonaIdentifier])
    {
      [a1[4] setAccountProperty:v6 forKey:v37];
      goto LABEL_34;
    }
    id v7 = a1[5];
    id v10 = v6;
    CFStringRef v9 = v5;
    goto LABEL_7;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  id v28 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v41 = *(void *)v43;
    uint64_t v40 = RMModelAccountLDAPDeclaration_SearchSettingsItem_Scope_base;
    uint64_t v38 = RMModelAccountLDAPDeclaration_SearchSettingsItem_Scope_oneLevel;
    do
    {
      for (m = 0; m != v29; m = (char *)m + 1)
      {
        if (*(void *)v43 != v41) {
          objc_enumerationMutation(obj);
        }
        unsigned int v31 = *(void **)(*((void *)&v42 + 1) + 8 * (void)m);
        long long v32 = objc_msgSend(v31, "payloadScope", v38);
        if ([v32 isEqualToString:v40])
        {
          uint64_t v33 = 0;
        }
        else if ([v32 isEqualToString:v38])
        {
          uint64_t v33 = 1;
        }
        else
        {
          uint64_t v33 = 2;
        }
        long long v34 = objc_opt_new();
        long long v35 = [v31 payloadVisibleDescription];
        [v34 setSearchDescription:v35];

        long long v36 = [v31 payloadSearchBase];
        [v34 setSearchBase:v36];

        [v34 setScope:v33];
        [a1[4] addSearchSettings:v34];
      }
      id v29 = [obj countByEnumeratingWithState:&v42 objects:v58 count:16];
    }
    while (v29);
  }

LABEL_34:
}

uint64_t sub_100010204(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010214(uint64_t a1)
{
}

void sub_10001021C(uint64_t a1)
{
  v2 = +[RMLog accountTransformerLDAP];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014F94(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) saveAccount:*(void *)(a1 + 48) accountStore:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100010788(id a1)
{
  qword_100022368 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerMail");

  _objc_release_x1();
}

void sub_100010900(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 payloadUserIdentityAssetReference];
    uint64_t v7 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v137 = 0;
    uint64_t v8 = [v6 resolveUserIdentityAssetReference:v7 assetIdentifier:v5 error:&v137];
    id v9 = v137;
    if (v9)
    {
      id v10 = v9;
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_62:

      goto LABEL_63;
    }
    id v13 = [v4 payloadOutgoingServer];
    uint64_t v14 = [v13 payloadAuthenticationCredentialsAssetReference];

    uint64_t v16 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    id v136 = 0;
    id v17 = [v15 resolveUserNameAndPasswordAssetReference:v16 assetIdentifier:v14 error:&v136];
    id v18 = v136;
    if (v18)
    {
      id v10 = v18;
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_61:

      goto LABEL_62;
    }
    unsigned int v130 = v14;
    id v19 = [v17 payloadUserName];
    id v20 = v17;
    uint64_t v132 = [v17 payloadPassword];
    uint64_t v21 = [v4 payloadIncomingServer];
    uint64_t v22 = [v21 payloadAuthenticationCredentialsAssetReference];

    uint64_t v23 = (void *)v22;
    uint64_t v25 = *(void *)(a1 + 32);
    id v24 = *(void **)(a1 + 40);
    id v135 = 0;
    uint64_t v26 = [v24 resolveUserNameAndPasswordAssetReference:v25 assetIdentifier:v22 error:&v135];
    id v27 = v135;
    unsigned int v131 = v26;
    if (v27)
    {
      id v10 = v27;
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v28 = (void *)v132;
      id v17 = v20;
      uint64_t v14 = v130;
LABEL_60:

      goto LABEL_61;
    }
    v126 = (void *)v22;
    unsigned int v129 = [v26 payloadUserName];
    unsigned int v128 = [v26 payloadPassword];
    id v29 = [v4 payloadSMIME];
    uint64_t v30 = [v29 payloadSigning];
    uint64_t v31 = [v30 payloadIdentityAssetReference];

    uint64_t v33 = *(void *)(a1 + 32);
    long long v32 = *(void **)(a1 + 40);
    id v134 = 0;
    v125 = (void *)v31;
    v127 = [v32 resolveKeychainAssetReference:v33 assetIdentifier:v31 error:&v134];
    id v34 = v134;
    if (v34)
    {
      id v10 = v34;
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v28 = (void *)v132;
      uint64_t v23 = v126;
      id v17 = v20;
      uint64_t v14 = v130;
LABEL_59:

      goto LABEL_60;
    }
    long long v35 = [v4 payloadSMIME];
    long long v36 = [v35 payloadEncryption];
    uint64_t v37 = [v36 payloadIdentityAssetReference];

    uint64_t v39 = *(void *)(a1 + 32);
    uint64_t v38 = *(void **)(a1 + 40);
    id v133 = 0;
    unsigned int v123 = (void *)v37;
    uint64_t v124 = [v38 resolveKeychainAssetReference:v39 assetIdentifier:v37 error:&v133];
    id v10 = v133;
    id v17 = v20;
    if (v10)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v28 = (void *)v132;
      uint64_t v23 = v126;
      uint64_t v14 = v130;
LABEL_58:

      goto LABEL_59;
    }
    v117 = *(void **)(a1 + 40);
    uint64_t v119 = *(void *)(a1 + 48);
    uint64_t v40 = [v4 payloadVisibleName];
    v122 = v19;
    uint64_t v14 = v130;
    if (v40)
    {
      [v117 addAccountDescriptionToProperties:v3 account:v119 description:v40];
    }
    else
    {
      uint64_t v41 = [v4 payloadIncomingServer];
      v113 = [v41 payloadHostName];
      [v117 addAccountDescriptionToProperties:v3 account:v119 description:v113];
    }
    long long v42 = [v4 payloadIncomingServer];
    long long v43 = [v42 payloadServerType];
    unsigned int v44 = [v43 isEqualToString:RMModelAccountMailDeclaration_IncomingServer_ServerType_IMAP];
    long long v45 = &ACAccountTypeIdentifierIMAP;
    if (!v44) {
      long long v45 = &ACAccountTypeIdentifierPOP;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *v45);

    long long v46 = *(void **)(a1 + 40);
    v120 = [v4 payloadIncomingServer];
    long long v47 = [v120 payloadAuthenticationMethod];
    long long v48 = [v46 _authSchemeForAuthenticationMethod:v47];
    [v3 setObject:v48 forKeyedSubscript:@"_remotemanagement_authenticationScheme"];

    long long v49 = [v8 payloadEmailAddress];

    if (v49)
    {
      long long v50 = [v8 payloadEmailAddress];
      [v3 setObject:v50 forKeyedSubscript:@"_remotemanagement_emailAddress"];
    }
    long long v51 = [v8 payloadFullName];

    if (v51)
    {
      long long v52 = [v8 payloadFullName];
      [v3 setObject:v52 forKeyedSubscript:@"_remotemanagement_fullUserName"];
    }
    long long v53 = [v4 payloadIncomingServer];
    long long v54 = [v53 payloadHostName];
    [v3 setObject:v54 forKeyedSubscript:@"_remotemanagement_hostname"];

    long long v55 = [v4 payloadIncomingServer];
    uint64_t v56 = [v55 payloadIMAPPathPrefix];

    if (v56)
    {
      uint64_t v140 = v56;
      long long v57 = +[NSArray arrayWithObjects:&v140 count:1];
      [v3 setObject:v57 forKeyedSubscript:@"_remotemanagement_imapServerPathPrefixKey"];
    }
    if (v128)
    {
      [v3 setObject:v128 forKeyedSubscript:@"_remotemanagement_password"];
      [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentials"];
    }
    v121 = (void *)v56;
    unsigned int v58 = [v4 payloadIncomingServer];
    uint64_t v59 = [v58 payloadPort];

    if (v59) {
      [v3 setObject:v59 forKeyedSubscript:@"_remotemanagement_port"];
    }
    v118 = (void *)v59;
    unsigned int v60 = *(void **)(a1 + 56);
    v114 = [v3 objectForKeyedSubscript:@"RemoteManagementAccountType"];
    v61 = [v60 accountTypeWithAccountTypeIdentifier:v114];
    unsigned int v62 = [v61 supportedDataclasses];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62);

    v63 = *(void **)(a1 + 48);
    if (v63) {
      [v63 enabledDataclasses];
    }
    else {
    unsigned int v64 = [v3 objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    }
    [v3 setObject:v64 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

    if (v129) {
      [v3 setObject:v129 forKeyedSubscript:@"_remotemanagement_username"];
    }
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
    id v65 = *(void **)(a1 + 40);
    v115 = [v4 payloadOutgoingServer];
    v66 = [v115 payloadAuthenticationMethod];
    id v67 = [v65 _authSchemeForAuthenticationMethod:v66];
    [v3 setObject:v67 forKeyedSubscript:@"_remotemanagement_authenticationSchemeSecondary"];

    id v68 = [v4 payloadOutgoingServer];
    v69 = [v68 payloadHostName];
    [v3 setObject:v69 forKeyedSubscript:@"_remotemanagement_hostnameSecondary"];

    if (v132)
    {
      [v3 setObject:v132 forKeyedSubscript:@"_remotemanagement_passwordSecondary"];
      [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentialsSecondary"];
    }
    id v70 = [v4 payloadOutgoingServer];
    uint64_t v71 = [v70 payloadPort];

    if (v71) {
      [v3 setObject:v71 forKeyedSubscript:@"_remotemanagement_portSecondary"];
    }
    v116 = (void *)v71;
    if (v122) {
      [v3 setObject:v122 forKeyedSubscript:@"_remotemanagement_usernameSecondary"];
    }
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usesslSecondary"];
    v72 = [v4 payloadSMIME];
    v73 = [v72 payloadSigning];

    if (v73)
    {
      v104 = [v4 payloadSMIME];
      id v74 = [v104 payloadSigning];
      id v75 = [v74 payloadEnabled];
      [v3 setObject:v75 forKeyedSubscript:@"_remotemanagement_smimeSigningEnabled"];

      [v3 setObject:v127 forKeyedSubscript:@"_remotemanagement_smimeSigningIdentity"];
      v105 = [v4 payloadSMIME];
      v76 = [v105 payloadSigning];
      unsigned int v77 = [v76 payloadUserOverrideable];
      [v3 setObject:v77 forKeyedSubscript:@"_remotemanagement_smimeSigningOverrideable"];

      v106 = [v4 payloadSMIME];
      v78 = [v106 payloadSigning];
      v79 = [v78 payloadIdentityUserOverrideable];
      [v3 setObject:v79 forKeyedSubscript:@"_remotemanagement_smimeSigningIdentityOverrideable"];
    }
    id v80 = [v4 payloadSMIME];
    v81 = [v80 payloadEncryption];

    if (v81)
    {
      v107 = [v4 payloadSMIME];
      v82 = [v107 payloadEncryption];
      v83 = [v82 payloadEnabled];
      [v3 setObject:v83 forKeyedSubscript:@"_remotemanagement_smimeEncryptionEnabledByDefault"];

      [v3 setObject:v124 forKeyedSubscript:@"_remotemanagement_smimeEncryptionIdentity"];
      v108 = [v4 payloadSMIME];
      v84 = [v108 payloadEncryption];
      v85 = [v84 payloadUserOverrideable];
      [v3 setObject:v85 forKeyedSubscript:@"_remotemanagement_smimeEncryptionOverrideable"];

      v109 = [v4 payloadSMIME];
      v86 = [v109 payloadEncryption];
      v87 = [v86 payloadIdentityUserOverrideable];
      [v3 setObject:v87 forKeyedSubscript:@"_remotemanagement_smimeEncryptionIdentityOverrideable"];

      v110 = [v4 payloadSMIME];
      v88 = [v110 payloadEncryption];
      v89 = [v88 payloadPerMessageSwitchEnabled];
      [v3 setObject:v89 forKeyedSubscript:@"_remotemanagement_smimeEncryptionEncryptionPerMessage"];
    }
    v111 = [v4 payloadIncomingServer];
    v90 = [v111 payloadAuthenticationMethod];
    uint64_t v91 = RMModelAccountMailDeclaration_IncomingServer_AuthenticationMethod_none;
    unsigned int v102 = [v90 isEqualToString:RMModelAccountMailDeclaration_IncomingServer_AuthenticationMethod_none];
    id v103 = v90;
    if (v102)
    {
      v92 = [v4 payloadIncomingServer];
      v93 = [v92 payloadAuthenticationCredentialsAssetReference];
      if (v93)
      {

        goto LABEL_55;
      }
      v98 = v92;
    }
    v101 = [v4 payloadOutgoingServer];
    v99 = [v101 payloadAuthenticationMethod];
    if ([v99 isEqualToString:v91])
    {
      v94 = [v4 payloadOutgoingServer];
      v95 = [v94 payloadAuthenticationCredentialsAssetReference];
      BOOL v100 = v95 != 0;
    }
    else
    {
      BOOL v100 = 0;
    }

    if (v102) {
    if (!v100)
    }
    {
      (*(void (**)(void, id, id, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v3, [*(id *)(a1 + 40) changesRequireRecreation:*(void *)(a1 + 48) properties:v3], 0);
      goto LABEL_57;
    }
LABEL_55:
    NSErrorUserInfoKey v138 = NSDebugDescriptionErrorKey;
    v112 = +[NSString stringWithFormat:@"AuthenticationMethod key set to None while AuthenticationCredentialsAssetReference key is present"];
    unsigned int v139 = v112;
    v96 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
    uint64_t v97 = +[NSError errorWithDomain:@"AccountTransformerMailErrorDomain" code:0 userInfo:v96];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_57:
    id v19 = v122;

    id v28 = (void *)v132;
    uint64_t v23 = v126;
    goto LABEL_58;
  }
  id v11 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100015144();
  }

  uint64_t v12 = *(void *)(a1 + 64);
  id v5 = +[RMErrorUtilities createInternalError];
  (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v5);
LABEL_63:
}

void sub_100011F7C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    id v7 = a1[4];
    uint64_t v8 = (const __CFString **)&MFMailAccountDescription;
    goto LABEL_3;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
  {
    id v11 = a1[5];
    CFStringRef v12 = @"RemoteManagementDefaultDescription";
LABEL_8:
    [v11 setObject:v6 forKeyedSubscript:v12];
    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_authenticationScheme"])
  {
    id v7 = a1[4];
    uint64_t v8 = (const __CFString **)&MFMailAccountAuthenticationScheme;
    goto LABEL_3;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_emailAddress"])
  {
    id v13 = a1[4];
    id v48 = v6;
    id v14 = +[NSArray arrayWithObjects:&v48 count:1];
    [v13 setAccountProperty:v14 forKey:MailAccountEmailAddresses];
LABEL_29:

    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
  {
    id v15 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    id v16 = [v15 mutableCopy];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v17 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
    id v18 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          [a1[5] setEnabled:1 forDataclass:v22];
          [v16 removeObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v19);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v16;
    id v23 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v38;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(v14);
          }
          [a1[5] setEnabled:0 forDataclass:*(void *)(*((void *)&v37 + 1) + 8 * (void)j)];
        }
        id v24 = [v14 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v24);
    }

    goto LABEL_29;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_fullUserName"])
  {
    id v7 = a1[4];
    uint64_t v8 = (const __CFString **)&MailAccountFullUserName;
    goto LABEL_3;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_hostname"])
  {
    [a1[4] setHostname:v6];
    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_imapServerPathPrefixKey"])
  {
    id v7 = a1[4];
    uint64_t v8 = (const __CFString **)&IMAPServerPathPrefix;
    goto LABEL_3;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
  {
    [a1[5] setManagingOwnerIdentifier:v6];
    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
  {
    [a1[5] setManagingSourceName:v6];
    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
  {
    id v11 = a1[5];
    CFStringRef v12 = @"MCAccountIsManaged";
    goto LABEL_8;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
  {
    [a1[4] setPassword:v6];
    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_port"])
  {
    objc_msgSend(a1[4], "setPortNumber:", objc_msgSend(v6, "unsignedIntValue"));
    goto LABEL_30;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    objc_msgSend(a1[6], "objectForKeyedSubscript:", @"_remotemanagement_provisionedDataclasses", 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v27 = [v14 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        for (k = 0; k != v28; k = (char *)k + 1)
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v14);
          }
          [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v33 + 1) + 8 * (void)k)];
        }
        id v28 = [v14 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v28);
    }
    goto LABEL_29;
  }
  if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
  {
    id v7 = a1[4];
    uint64_t v8 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
  }
  else
  {
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
    {
      [a1[4] setUsername:v6];
      goto LABEL_30;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionEnabledByDefault"])
    {
      id v7 = a1[4];
      uint64_t v8 = (const __CFString **)&MFMailAccountEncryptionEnabled;
    }
    else
    {
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionIdentity"])
      {
        id v7 = a1[4];
        CFStringRef v9 = @"MCSMIMEEncryptionIdentityPersistentID";
        goto LABEL_4;
      }
      if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionOverrideable"])
      {
        id v7 = a1[4];
        uint64_t v8 = (const __CFString **)&MFMailAccountEncryptByDefaultUserOverrideable;
      }
      else if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionIdentityOverrideable"])
      {
        id v7 = a1[4];
        uint64_t v8 = (const __CFString **)&MFMailAccountEncryptionIdentityUserOverrideable;
      }
      else if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeEncryptionEncryptionPerMessage"])
      {
        id v7 = a1[4];
        uint64_t v8 = (const __CFString **)&MFMailAccountPerMessageEncryptionEnabled;
      }
      else if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningEnabled"])
      {
        id v7 = a1[4];
        uint64_t v8 = (const __CFString **)&MFMailAccountSigningEnabled;
      }
      else
      {
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningIdentity"])
        {
          id v7 = a1[4];
          CFStringRef v9 = @"MCSMIMESigningIdentityPersistentID";
          goto LABEL_4;
        }
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningOverrideable"])
        {
          id v7 = a1[4];
          uint64_t v8 = (const __CFString **)&MFMailAccountSigningUserOverrideable;
        }
        else
        {
          if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_smimeSigningIdentityOverrideable"])
          {
            if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
            {
              objc_msgSend(a1[4], "setUsesSSL:", objc_msgSend(v6, "BOOLValue"));
              goto LABEL_30;
            }
            if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
              goto LABEL_30;
            }
            CFStringRef v31 = (const __CFString *)ACAccountPropertyPersonaIdentifier;
            unsigned int v32 = [(__CFString *)v5 isEqualToString:ACAccountPropertyPersonaIdentifier];
            id v7 = a1[4];
            id v10 = v6;
            if (v32) {
              CFStringRef v9 = v31;
            }
            else {
              CFStringRef v9 = v5;
            }
            goto LABEL_5;
          }
          id v7 = a1[4];
          uint64_t v8 = (const __CFString **)&MFMailAccountSigningIdentityUserOverrideable;
        }
      }
    }
  }
LABEL_3:
  CFStringRef v9 = *v8;
LABEL_4:
  id v10 = v6;
LABEL_5:
  [v7 setAccountProperty:v10 forKey:v9];
LABEL_30:
}

void sub_1000126B8(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ([v13 isEqualToString:@"_remotemanagement_authenticationSchemeSecondary"])
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = (id *)&MFMailAccountAuthenticationScheme;
LABEL_3:
    id v8 = *v7;
    id v9 = v5;
LABEL_4:
    [v6 setAccountProperty:v9 forKey:v8];
    goto LABEL_14;
  }
  if ([v13 isEqualToString:@"_remotemanagement_hostnameSecondary"])
  {
    [*(id *)(a1 + 32) setHostname:v5];
    goto LABEL_14;
  }
  if ([v13 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
  {
    id v10 = [*(id *)(a1 + 32) persistentAccount];
    [v10 setManagingOwnerIdentifier:v5];
LABEL_13:

    goto LABEL_14;
  }
  if ([v13 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
  {
    id v10 = [*(id *)(a1 + 32) persistentAccount];
    [v10 setManagingSourceName:v5];
    goto LABEL_13;
  }
  if ([v13 isEqualToString:@"_remotemanagement_isManagedKey"])
  {
    id v10 = [*(id *)(a1 + 32) persistentAccount];
    [v10 setAccountProperty:v5 forKey:@"MCAccountIsManaged"];
    goto LABEL_13;
  }
  if ([v13 isEqualToString:@"_remotemanagement_passwordSecondary"])
  {
    [*(id *)(a1 + 32) setPassword:v5];
  }
  else if ([v13 isEqualToString:@"_remotemanagement_portSecondary"])
  {
    objc_msgSend(*(id *)(a1 + 32), "setPortNumber:", objc_msgSend(v5, "unsignedIntValue"));
  }
  else
  {
    if ([v13 isEqualToString:@"_remotemanagement_smimeEncryptionEncryptionPerMessage"])
    {
      id v6 = *(void **)(a1 + 32);
      id v7 = (id *)&MFMailAccountPerMessageEncryptionEnabled;
      goto LABEL_3;
    }
    if ([v13 isEqualToString:@"_remotemanagement_usernameSecondary"])
    {
      [*(id *)(a1 + 32) setUsername:v5];
    }
    else if ([v13 isEqualToString:@"_remotemanagement_usesslSecondary"])
    {
      objc_msgSend(*(id *)(a1 + 32), "setUsesSSL:", objc_msgSend(v5, "BOOLValue"));
    }
    else if (([v13 isEqualToString:@"RemoteManagementAccountType"] & 1) == 0)
    {
      if ([v13 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentialsSecondary"])
      {
        id v6 = *(void **)(a1 + 32);
        id v7 = (id *)&ACAccountPropertyShouldNeverUseSyncableCredential;
        goto LABEL_3;
      }
      if (([v13 hasPrefix:@"_remotemanagement_"] & 1) == 0)
      {
        id v11 = (void *)ACAccountPropertyPersonaIdentifier;
        unsigned int v12 = [v13 isEqualToString:ACAccountPropertyPersonaIdentifier];
        id v6 = *(void **)(a1 + 32);
        id v9 = v5;
        if (v12) {
          id v8 = v11;
        }
        else {
          id v8 = v13;
        }
        goto LABEL_4;
      }
    }
  }
LABEL_14:
}

id sub_100012984(uint64_t a1)
{
  v2 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000154B0(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  +[MailAccount setMailAccounts:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 48) savePersistentAccount];
}

id sub_1000129F0(uint64_t a1)
{
  v2 = +[RMLog accountTransformerMail];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100015520(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(a1 + 40) savePersistentAccount];
}

void sub_1000131D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100013254(id a1)
{
  qword_100022378 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountTransformerSubscribedCalendar");

  _objc_release_x1();
}

void sub_1000133CC(uint64_t a1, void *a2)
{
  id v3 = [a2 mutableCopy];
  uint64_t v4 = [*(id *)(a1 + 32) declaration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 payloadAuthenticationCredentialsAssetReference];
    uint64_t v6 = *(void *)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001358C;
    v11[3] = &unk_10001CC78;
    id v7 = *(id *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 40);
    id v16 = v7;
    void v11[4] = v8;
    id v12 = v3;
    id v13 = *(id *)(a1 + 48);
    id v14 = v4;
    id v15 = *(id *)(a1 + 56);
    +[RMAssetResolverController resolveUserNameAndPasswordAsset:v6 assetIdentifier:v5 completionHandler:v11];
  }
  else
  {
    uint64_t v9 = +[RMLog accountTransformerSubscribedCalendar];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100015010((uint64_t)v4, v9);
    }

    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v5 = +[RMErrorUtilities createInternalError];
    (*(void (**)(uint64_t, void, void, void *))(v10 + 16))(v10, 0, 0, v5);
  }
}

void sub_10001358C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v19 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    uint64_t v6 = [v5 payloadUserName];
    id v7 = [v19 payloadPassword];
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [*(id *)(a1 + 56) payloadVisibleName];
    if (v11)
    {
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v11];
    }
    else
    {
      id v12 = [*(id *)(a1 + 56) payloadCalendarURL];
      [v8 addAccountDescriptionToProperties:v9 account:v10 description:v12];
    }
    [*(id *)(a1 + 40) setObject:ACAccountTypeIdentifierSubscribedCalendar forKeyedSubscript:@"RemoteManagementAccountType"];
    id v13 = *(void **)(a1 + 64);
    id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RemoteManagementAccountType"];
    id v15 = [v13 accountTypeWithAccountTypeIdentifier:v14];
    id v16 = [v15 supportedDataclasses];
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];

    id v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
    [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:@"_remotemanagement_enabledDataclasses"];

    id v18 = [*(id *)(a1 + 56) payloadCalendarURL];
    [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:@"_remotemanagement_subscribed_calendar_url"];

    if (v7)
    {
      [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:@"_remotemanagement_password"];
      [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_shouldNeverUseSyncableCredentials"];
    }
    if (v6) {
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"_remotemanagement_username"];
    }
    [*(id *)(a1 + 40) setObject:&__kCFBooleanTrue forKeyedSubscript:@"_remotemanagement_usessl"];
    (*(void (**)(void, void, id, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), *(void *)(a1 + 40), [*(id *)(a1 + 32) changesRequireRecreation:*(void *)(a1 + 48) properties:*(void *)(a1 + 40)], 0);
  }
}

void sub_100013A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013A80(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDescription"])
  {
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_accountDefaultDescription"])
    {
      id v7 = a1[5];
      uint64_t v8 = (const __CFString **)&RMAccountPropertyKeyDefaultDescription;
      goto LABEL_5;
    }
    if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_provisionedDataclasses"])
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v11 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
      id v12 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v38;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v38 != v14) {
              objc_enumerationMutation(v11);
            }
            [a1[5] setProvisioned:1 forDataclass:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          }
          id v13 = [v11 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v13);
      }
    }
    else
    {
      if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_enabledDataclasses"])
      {
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_isManagedKey"])
        {
          id v7 = a1[5];
          CFStringRef v9 = @"MCAccountIsManaged";
          goto LABEL_6;
        }
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingOwnerIdentifierKey"])
        {
          [a1[5] setManagingOwnerIdentifier:v6];
          goto LABEL_34;
        }
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_managingSourceNameKey"])
        {
          [a1[5] setManagingSourceName:v6];
          goto LABEL_34;
        }
        if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_password"])
        {
          [a1[4] setPassword:v6];
          goto LABEL_34;
        }
        if (![(__CFString *)v5 isEqualToString:@"_remotemanagement_shouldNeverUseSyncableCredentials"])
        {
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_subscribed_calendar_url"])
          {
            [a1[4] setHost:v6];
            goto LABEL_34;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_username"])
          {
            [a1[4] setUsername:v6];
            goto LABEL_34;
          }
          if ([(__CFString *)v5 isEqualToString:@"_remotemanagement_usessl"])
          {
            objc_msgSend(a1[4], "setUseSSL:", objc_msgSend(v6, "BOOLValue"));
            goto LABEL_34;
          }
          if ([(__CFString *)v5 hasPrefix:@"_remotemanagement_"]) {
            goto LABEL_34;
          }
          uint64_t v28 = ACAccountPropertyPersonaIdentifier;
          if ([(__CFString *)v5 isEqualToString:ACAccountPropertyPersonaIdentifier])
          {
            [a1[4] setAccountProperty:v6 forKey:v28];
            goto LABEL_34;
          }
          id v7 = a1[5];
          id v10 = v6;
          CFStringRef v9 = v5;
          goto LABEL_7;
        }
        id v7 = a1[4];
        uint64_t v8 = (const __CFString **)&ACAccountPropertyShouldNeverUseSyncableCredential;
LABEL_5:
        CFStringRef v9 = *v8;
LABEL_6:
        id v10 = v6;
LABEL_7:
        [v7 setObject:v10 forKeyedSubscript:v9];
        goto LABEL_34;
      }
      id v16 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_provisionedDataclasses"];
      id v17 = [v16 mutableCopy];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v18 = [a1[6] objectForKeyedSubscript:@"_remotemanagement_enabledDataclasses"];
      id v19 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v34;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * (void)j);
            [a1[5] setEnabled:1 forDataclass:v23];
            [v17 removeObject:v23];
          }
          id v20 = [v18 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v20);
      }

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = v17;
      id v24 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v30;
        do
        {
          for (k = 0; k != v25; k = (char *)k + 1)
          {
            if (*(void *)v30 != v26) {
              objc_enumerationMutation(v11);
            }
            objc_msgSend(a1[5], "setEnabled:forDataclass:", 0, *(void *)(*((void *)&v29 + 1) + 8 * (void)k), (void)v29);
          }
          id v25 = [v11 countByEnumeratingWithState:&v29 objects:v41 count:16];
        }
        while (v25);
      }
    }
    goto LABEL_34;
  }
  [a1[4] setAccountDescription:v6];
LABEL_34:
}

uint64_t sub_100013F40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013F50(uint64_t a1)
{
}

void sub_100013F58(uint64_t a1)
{
  v2 = +[RMLog accountTransformerSubscribedCalendar];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100014F94(a1, v2);
  }

  uint64_t v3 = [*(id *)(a1 + 40) saveAccount:*(void *)(a1 + 48) accountStore:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v6 = objc_opt_class();
  uint64_t v3 = +[NSArray arrayWithObjects:&v6 count:1];
  int v4 = +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:v3 publisherClass:objc_opt_class()];

  return v4;
}

void sub_100014490(void *a1)
{
  v2 = [a1 identifier];
  uint64_t v3 = [a1 accountType];
  int v4 = [v3 description];
  sub_100003E1C();
  sub_100003E34((void *)&_mh_execute_header, v5, v6, "Accounts adapter found existing remotely managed account: %{public}@ of type %{public}@", v7, v8, v9, v10, v11);
}

void sub_100014544(void *a1)
{
  v2 = [a1 identifier];
  uint64_t v3 = [a1 accountType];
  int v4 = [v3 description];
  sub_100003E1C();
  sub_100003E34((void *)&_mh_execute_header, v5, v6, "Accounts adapter found existing remotely managed secondary account: %{public}@ of type %{public}@", v7, v8, v9, v10, v11);
}

void sub_1000145F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No transformer for %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014670(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "ACAccountStore returned the following actions for removal: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000146E8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Account configurations are only supported over the user channel", buf, 2u);
}

void sub_100014728()
{
  sub_1000056B0();
  sub_1000056E8((void *)&_mh_execute_header, v0, v1, "Removing account being updated: %{public}@ of type %{public}@", v2, v3, v4, v5, v6);
}

void sub_100014794(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) declaration];
  uint8_t v6 = [v5 declarationIdentifier];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to process configuration: %{public}@ %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100014858()
{
  sub_1000056B0();
  sub_1000056E8((void *)&_mh_execute_header, v0, v1, "Removed account %{public}@ of type %{public}@ before recreating it", v2, v3, v4, v5, v6);
}

void sub_1000148C4()
{
  sub_1000056C8();
  sub_100005704((void *)&_mh_execute_header, v0, v1, "Failed to remove account %{public}@ of type %{public}@ before recreating it: %{public}@");
}

void sub_100014930()
{
  sub_1000056B0();
  sub_1000056E8((void *)&_mh_execute_header, v0, v1, "Removed account: %{public}@ of type %{public}@", v2, v3, v4, v5, v6);
}

void sub_10001499C()
{
  sub_1000056C8();
  sub_100005704((void *)&_mh_execute_header, v0, v1, "Failed to remove account: %{public}@ of type %{public}@ %{public}@");
}

void sub_100014A08(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Account configurations are not supported in this scope", v1, 2u);
}

void sub_100014A4C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 declaration];
  uint8_t v6 = [v5 declarationType];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Applying properties to account %{public}@ of type: %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100014B10(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 declaration];
  uint64_t v4 = [v3 declarationType];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Creating account of type: %{public}@", (uint8_t *)&v5, 0xCu);
}

void sub_100014BC0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saved account: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100014C3C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to save account: %{public}@ %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100014CC8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Querying account status for key paths: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014D40(void *a1, NSObject *a2)
{
  int v4 = [a1 identifier];
  uint64_t v5 = [a1 accountType];
  __int16 v6 = [v5 description];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Accounts adapter found existing remotely managed account: %{public}@ of type %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100014E14(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No handler for %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100014E8C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saved account: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100014F08(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to save account: %{public}@ %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100014F94(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saving account under persona %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100015010(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Incorrect declaration class: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100015088(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Only EAS is supported on iOS", v1, 2u);
}

void sub_1000150CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Saved Google account: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100015144()
{
  sub_1000131F4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Incorrect declaration class: %@", v1, 0xCu);
}

void sub_1000151B8()
{
  sub_1000131F4();
  sub_1000131D8((void *)&_mh_execute_header, v0, v1, "Saved outgoing mail account: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100015220()
{
  sub_1000131F4();
  sub_1000131D8((void *)&_mh_execute_header, v0, v1, "Attempting to use persona %{public}@ to save outgoing mail account", v2, v3, v4, v5, v6);
}

void sub_100015288()
{
  sub_1000131F4();
  sub_1000131D8((void *)&_mh_execute_header, v0, v1, "Saved incoming mail account: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000152F0()
{
  sub_1000131F4();
  sub_1000131D8((void *)&_mh_execute_header, v0, v1, "Attempting to use persona %{public}@ to save incoming mail account", v2, v3, v4, v5, v6);
}

void sub_100015358()
{
  sub_1000131F4();
  sub_1000131D8((void *)&_mh_execute_header, v0, v1, "Paired SMTP account: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000153C0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating paired SMTP account", v1, 2u);
}

void sub_100015404(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No paired SMTP account assigned yet", v1, 2u);
}

void sub_100015448()
{
  sub_1000131F4();
  sub_1000131D8((void *)&_mh_execute_header, v0, v1, "Looking for paired SMTP account: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000154B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015520(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountAdapter(void *a1, const char *a2, ...)
{
  return [a1 accountAdapter];
}

id objc_msgSend_accountApplicator(void *a1, const char *a2, ...)
{
  return [a1 accountApplicator];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_accountStatusAdapter(void *a1, const char *a2, ...)
{
  return [a1 accountStatusAdapter];
}

id objc_msgSend_accountStatusHandler(void *a1, const char *a2, ...)
{
  return [a1 accountStatusHandler];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountTransformer(void *a1, const char *a2, ...)
{
  return [a1 accountTransformer];
}

id objc_msgSend_accountTransformerCalDAV(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerCalDAV];
}

id objc_msgSend_accountTransformerCardDAV(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerCardDAV];
}

id objc_msgSend_accountTransformerExchange(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerExchange];
}

id objc_msgSend_accountTransformerGoogle(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerGoogle];
}

id objc_msgSend_accountTransformerLDAP(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerLDAP];
}

id objc_msgSend_accountTransformerMail(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerMail];
}

id objc_msgSend_accountTransformerSubscribedCalendar(void *a1, const char *a2, ...)
{
  return [a1 accountTransformerSubscribedCalendar];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accountTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 accountTypeDescription];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_adapter(void *a1, const char *a2, ...)
{
  return [a1 adapter];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_assets(void *a1, const char *a2, ...)
{
  return [a1 assets];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return [a1 complete];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createInternalError(void *a1, const char *a2, ...)
{
  return [a1 createInternalError];
}

id objc_msgSend_currentManagedDevice(void *a1, const char *a2, ...)
{
  return [a1 currentManagedDevice];
}

id objc_msgSend_dataSeparated(void *a1, const char *a2, ...)
{
  return [a1 dataSeparated];
}

id objc_msgSend_declaration(void *a1, const char *a2, ...)
{
  return [a1 declaration];
}

id objc_msgSend_declarationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 declarationIdentifier];
}

id objc_msgSend_declarationServerToken(void *a1, const char *a2, ...)
{
  return [a1 declarationServerToken];
}

id objc_msgSend_declarationType(void *a1, const char *a2, ...)
{
  return [a1 declarationType];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_easEnrollmentID(void *a1, const char *a2, ...)
{
  return [a1 easEnrollmentID];
}

id objc_msgSend_enabledDataclasses(void *a1, const char *a2, ...)
{
  return [a1 enabledDataclasses];
}

id objc_msgSend_getRemotelyManagedAccounts(void *a1, const char *a2, ...)
{
  return [a1 getRemotelyManagedAccounts];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isDestructive(void *a1, const char *a2, ...)
{
  return [a1 isDestructive];
}

id objc_msgSend_isManagedStore(void *a1, const char *a2, ...)
{
  return [a1 isManagedStore];
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return [a1 isSharediPad];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_mailAccounts(void *a1, const char *a2, ...)
{
  return [a1 mailAccounts];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_payloadAuthenticationCredentialsAssetReference(void *a1, const char *a2, ...)
{
  return [a1 payloadAuthenticationCredentialsAssetReference];
}

id objc_msgSend_payloadAuthenticationIdentityAssetReference(void *a1, const char *a2, ...)
{
  return [a1 payloadAuthenticationIdentityAssetReference];
}

id objc_msgSend_payloadAuthenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 payloadAuthenticationMethod];
}

id objc_msgSend_payloadCalendarServiceActive(void *a1, const char *a2, ...)
{
  return [a1 payloadCalendarServiceActive];
}

id objc_msgSend_payloadCalendarURL(void *a1, const char *a2, ...)
{
  return [a1 payloadCalendarURL];
}

id objc_msgSend_payloadContactsServiceActive(void *a1, const char *a2, ...)
{
  return [a1 payloadContactsServiceActive];
}

id objc_msgSend_payloadEmailAddress(void *a1, const char *a2, ...)
{
  return [a1 payloadEmailAddress];
}

id objc_msgSend_payloadEnabled(void *a1, const char *a2, ...)
{
  return [a1 payloadEnabled];
}

id objc_msgSend_payloadEnabledProtocolTypes(void *a1, const char *a2, ...)
{
  return [a1 payloadEnabledProtocolTypes];
}

id objc_msgSend_payloadEncryption(void *a1, const char *a2, ...)
{
  return [a1 payloadEncryption];
}

id objc_msgSend_payloadFullName(void *a1, const char *a2, ...)
{
  return [a1 payloadFullName];
}

id objc_msgSend_payloadHostName(void *a1, const char *a2, ...)
{
  return [a1 payloadHostName];
}

id objc_msgSend_payloadIMAPPathPrefix(void *a1, const char *a2, ...)
{
  return [a1 payloadIMAPPathPrefix];
}

id objc_msgSend_payloadIdentityAssetReference(void *a1, const char *a2, ...)
{
  return [a1 payloadIdentityAssetReference];
}

id objc_msgSend_payloadIdentityUserOverrideable(void *a1, const char *a2, ...)
{
  return [a1 payloadIdentityUserOverrideable];
}

id objc_msgSend_payloadIncomingServer(void *a1, const char *a2, ...)
{
  return [a1 payloadIncomingServer];
}

id objc_msgSend_payloadLockCalendarService(void *a1, const char *a2, ...)
{
  return [a1 payloadLockCalendarService];
}

id objc_msgSend_payloadLockContactsService(void *a1, const char *a2, ...)
{
  return [a1 payloadLockContactsService];
}

id objc_msgSend_payloadLockMailService(void *a1, const char *a2, ...)
{
  return [a1 payloadLockMailService];
}

id objc_msgSend_payloadLockNotesService(void *a1, const char *a2, ...)
{
  return [a1 payloadLockNotesService];
}

id objc_msgSend_payloadLockRemindersService(void *a1, const char *a2, ...)
{
  return [a1 payloadLockRemindersService];
}

id objc_msgSend_payloadMailServiceActive(void *a1, const char *a2, ...)
{
  return [a1 payloadMailServiceActive];
}

id objc_msgSend_payloadNotesServiceActive(void *a1, const char *a2, ...)
{
  return [a1 payloadNotesServiceActive];
}

id objc_msgSend_payloadOAuth(void *a1, const char *a2, ...)
{
  return [a1 payloadOAuth];
}

id objc_msgSend_payloadOutgoingServer(void *a1, const char *a2, ...)
{
  return [a1 payloadOutgoingServer];
}

id objc_msgSend_payloadPassword(void *a1, const char *a2, ...)
{
  return [a1 payloadPassword];
}

id objc_msgSend_payloadPath(void *a1, const char *a2, ...)
{
  return [a1 payloadPath];
}

id objc_msgSend_payloadPerMessageSwitchEnabled(void *a1, const char *a2, ...)
{
  return [a1 payloadPerMessageSwitchEnabled];
}

id objc_msgSend_payloadPort(void *a1, const char *a2, ...)
{
  return [a1 payloadPort];
}

id objc_msgSend_payloadRemindersServiceActive(void *a1, const char *a2, ...)
{
  return [a1 payloadRemindersServiceActive];
}

id objc_msgSend_payloadSMIME(void *a1, const char *a2, ...)
{
  return [a1 payloadSMIME];
}

id objc_msgSend_payloadScope(void *a1, const char *a2, ...)
{
  return [a1 payloadScope];
}

id objc_msgSend_payloadSearchBase(void *a1, const char *a2, ...)
{
  return [a1 payloadSearchBase];
}

id objc_msgSend_payloadSearchSettings(void *a1, const char *a2, ...)
{
  return [a1 payloadSearchSettings];
}

id objc_msgSend_payloadServerType(void *a1, const char *a2, ...)
{
  return [a1 payloadServerType];
}

id objc_msgSend_payloadSignInURL(void *a1, const char *a2, ...)
{
  return [a1 payloadSignInURL];
}

id objc_msgSend_payloadSigning(void *a1, const char *a2, ...)
{
  return [a1 payloadSigning];
}

id objc_msgSend_payloadTokenRequestURL(void *a1, const char *a2, ...)
{
  return [a1 payloadTokenRequestURL];
}

id objc_msgSend_payloadUserIdentityAssetReference(void *a1, const char *a2, ...)
{
  return [a1 payloadUserIdentityAssetReference];
}

id objc_msgSend_payloadUserName(void *a1, const char *a2, ...)
{
  return [a1 payloadUserName];
}

id objc_msgSend_payloadUserOverrideable(void *a1, const char *a2, ...)
{
  return [a1 payloadUserOverrideable];
}

id objc_msgSend_payloadVisibleDescription(void *a1, const char *a2, ...)
{
  return [a1 payloadVisibleDescription];
}

id objc_msgSend_payloadVisibleName(void *a1, const char *a2, ...)
{
  return [a1 payloadVisibleName];
}

id objc_msgSend_persistentAccount(void *a1, const char *a2, ...)
{
  return [a1 persistentAccount];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_portNumber(void *a1, const char *a2, ...)
{
  return [a1 portNumber];
}

id objc_msgSend_refreshDetailsFromDisk(void *a1, const char *a2, ...)
{
  return [a1 refreshDetailsFromDisk];
}

id objc_msgSend_registeredIdentifier(void *a1, const char *a2, ...)
{
  return [a1 registeredIdentifier];
}

id objc_msgSend_reloadAccounts(void *a1, const char *a2, ...)
{
  return [a1 reloadAccounts];
}

id objc_msgSend_savePersistentAccount(void *a1, const char *a2, ...)
{
  return [a1 savePersistentAccount];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return [a1 scope];
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 sharedConfiguration];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_subscriptionURL(void *a1, const char *a2, ...)
{
  return [a1 subscriptionURL];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_waitForCompletion(void *a1, const char *a2, ...)
{
  return [a1 waitForCompletion];
}