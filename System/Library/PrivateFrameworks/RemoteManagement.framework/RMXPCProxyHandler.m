@interface RMXPCProxyHandler
+ (BOOL)_doesConnection:(id)a3 haveEntitlement:(id)a4;
+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4;
+ (id)_activeConfigurationsByTypeForTypes:(id)a3 persistentContainer:(id)a4 error:(id *)a5;
+ (id)_managementChannelWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)hasAccountChangesEntitlement;
- (BOOL)hasCommandLineEntitlement;
- (BOOL)hasConfigurationSubscriberEntitlement;
- (BOOL)hasEnrollmentEntitlement;
- (NSPersistentContainer)persistentContainer;
- (RMXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4;
- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3;
- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4;
- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7;
- (void)fetchConfigurationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4;
- (void)periodicSyncWithCompletionHandler:(id)a3;
- (void)queryForStatusAndErrorsWithKeyPaths:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)reportPluginDetailsWithCompletionHandler:(id)a3;
- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendStatusForKeyPaths:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5;
- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation RMXPCProxyHandler

- (RMXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMXPCProxyHandler;
  v8 = [(RMXPCProxyHandler *)&v12 init];
  if (v8)
  {
    unsigned int v9 = [(id)objc_opt_class() _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement"];
    objc_storeStrong((id *)v8 + 2, a4);
    v8[8] = v9;
    if (v9)
    {
      *(_WORD *)(v8 + 9) = 257;
      unsigned __int8 v10 = 1;
    }
    else
    {
      v8[10] = [(id)objc_opt_class() _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement.configuration-subscriber"];
      v8[9] = [(id)objc_opt_class() _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement.account-changes"];
      unsigned __int8 v10 = [(id)objc_opt_class() _doesConnection:v6 haveEntitlement:@"com.apple.private.remotemanagement.enrollment"];
    }
    v8[11] = v10;
  }

  return (RMXPCProxyHandler *)v8;
}

+ (BOOL)_doesConnection:(id)a3 haveEntitlement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 valueForEntitlement:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v9 = [v8 BOOLValue];

    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  if ([v7 isEqualToString:@"com.apple.private.remotemanagement.account-changes"])
  {
    CFStringRef v10 = @"AAACCOUNTS.com.apple.accountsd";
LABEL_12:
    unsigned __int8 v11 = [a1 _isConnection:v6 fromApplicationIdentifier:v10];
    goto LABEL_13;
  }
  if (![v7 isEqualToString:@"com.apple.private.remotemanagement.enrollment"])
  {
    unsigned __int8 v11 = 0;
    goto LABEL_13;
  }
  if (([a1 _isConnection:v6 fromApplicationIdentifier:@"com.apple.purplebuddy"] & 1) == 0)
  {
    CFStringRef v10 = @"com.apple.Preferences";
    goto LABEL_12;
  }
LABEL_9:
  unsigned __int8 v11 = 1;
LABEL_13:

  return v11;
}

+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [a3 valueForEntitlement:@"application-identifier"];
  id v7 = +[RMLog XPCListenerDelegate];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10008D284();
  }

  unsigned __int8 v8 = [v5 isEqualToString:v6];
  return v8;
}

- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Enrolling from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    unsigned __int8 v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enrolling with %{public}@...", buf, 0xCu);
    }

    CFStringRef v10 = +[RMClientController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100089320;
    v12[3] = &unk_1000C7218;
    id v13 = v6;
    id v14 = v7;
    [v10 enrollDeviceChannelWithURI:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    unsigned __int8 v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Enrolling user channel from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    unsigned __int8 v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Enrolling with account %{public}@...", buf, 0xCu);
    }

    CFStringRef v10 = +[RMClientController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100089648;
    v12[3] = &unk_1000C7218;
    id v13 = v6;
    id v14 = v7;
    [v10 enrollUserChannelWithAccountIdentifier:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    unsigned __int8 v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    v16 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Enrolling DDM from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v16, &state);
    id v17 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Enrolling DDM with %{public}@...", buf, 0xCu);
    }

    v18 = +[RMClientController sharedController];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000899A4;
    v20[3] = &unk_1000C7218;
    id v21 = v12;
    id v22 = v15;
    [v18 enrollViaMDMWithEnrollmentType:a3 uri:v21 accountIdentifier:v13 personaIdentifier:v14 completionHandler:v20];

    os_activity_scope_leave(&state);
  }
  else
  {
    v19 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v19);
  }
}

- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Unenrolling from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    unsigned __int8 v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unenrolling %{public}@...", buf, 0xCu);
    }

    CFStringRef v10 = +[RMClientController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100089CCC;
    v12[3] = &unk_1000C4FB8;
    id v13 = v6;
    id v14 = v7;
    [v10 unenrollWithIdentifier:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    unsigned __int8 v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Syncing from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    unsigned __int8 v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Syncing %{public}@...", buf, 0xCu);
    }

    CFStringRef v10 = +[RMClientController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008A008;
    v12[3] = &unk_1000C4F40;
    id v13 = v6;
    id v14 = v7;
    [v10 syncWithIdentifier:v13 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    unsigned __int8 v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)periodicSyncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    id v5 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Periodic sync from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    id v6 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Periodic sync...", buf, 2u);
    }

    id v7 = +[RMClientController sharedController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10008A298;
    v8[3] = &unk_1000C6B58;
    id v9 = v4;
    [v7 syncAllManagementSourcesWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v5 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, NSObject *))v4 + 2))(v4, v5);
  }
}

- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    unsigned __int8 v11 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Updating from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating %{public}@ with push message...", buf, 0xCu);
    }

    id v13 = +[RMClientController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008A570;
    v15[3] = &unk_1000C4F40;
    id v16 = v8;
    id v17 = v10;
    [v13 updateWithIdentifier:v16 pushMessage:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    unsigned __int8 v11 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Updating from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating %{public}@ with sync tokens response..", buf, 0xCu);
    }

    id v13 = +[RMClientController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008A888;
    v15[3] = &unk_1000C4F40;
    id v16 = v8;
    id v17 = v10;
    [v13 updateWithIdentifier:v16 tokensResponse:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    id v5 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Checking device enrollment from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    id v6 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checking device enrollment", buf, 2u);
    }

    id v7 = +[RMClientController sharedController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10008AB1C;
    v8[3] = &unk_1000C7240;
    id v9 = v4;
    [v7 deviceChannelEnrollmentExistsWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v5 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v5);
  }
}

- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Finding management channel from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finding management channel", buf, 2u);
    }

    id v10 = +[RMClientController sharedController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008ADB0;
    v11[3] = &unk_1000C7268;
    id v12 = v7;
    [v10 managementChannelWithAccountIdentifier:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v8 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v8);
  }
}

- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMXPCProxyHandler *)self hasEnrollmentEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Finding management channel from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finding management channel", buf, 2u);
    }

    id v10 = +[RMClientController sharedController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008B060;
    v11[3] = &unk_1000C7268;
    id v12 = v7;
    [v10 managementChannelWithEnrollmentURL:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v8 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, NSObject *))v7 + 2))(v7, 0, v8);
  }
}

- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMXPCProxyHandler *)self hasCommandLineEntitlement])
  {
    unsigned __int8 v11 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Sending status data from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sending status data to %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMClientController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008B380;
    v15[3] = &unk_1000C4F40;
    id v16 = v9;
    id v17 = v10;
    [v13 sendStatusData:v8 toManagementSourceWithIdentifier:v16 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

+ (id)_managementChannelWithIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10008B660;
  v28 = sub_10008B670;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10008B660;
  id v22 = sub_10008B670;
  id v23 = 0;
  id v6 = +[RMPersistentController sharedController];
  id v7 = [v6 persistentContainer];
  id v8 = [v7 newBackgroundContext];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008B678;
  v14[3] = &unk_1000C5798;
  id v9 = v5;
  id v15 = v9;
  id v16 = &v18;
  id v17 = &v24;
  [v8 performBlockAndWait:v14];
  id v10 = (void *)v25[5];
  if (v10)
  {
    id v11 = v10;
  }
  else if (a4)
  {
    id v13 = (void *)v19[5];
    if (v13) {
      *a4 = v13;
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

- (void)queryForStatusAndErrorsWithKeyPaths:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void *, void))a5;
  if ([(RMXPCProxyHandler *)self hasCommandLineEntitlement])
  {
    id v11 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Querying for status and errors from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      id v14 = [v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      id v15 = [v14 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543618;
      id v29 = v15;
      __int16 v30 = 2114;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Querying for status and errors with key paths %{public}@ from %{public}@...", buf, 0x16u);
    }
    id v26 = 0;
    id v16 = [(id)objc_opt_class() _managementChannelWithIdentifier:v9 error:&v26];
    id v17 = v26;
    if (v16)
    {
      uint64_t v18 = +[RMExternalStatusPublisher sharedPublisher];
      v19 = +[NSSet setWithArray:v8];
      [v18 publishStatusKeys:v19 storeIdentifier:v9];

      uint64_t v20 = objc_opt_new();
      id v21 = +[NSSet setWithArray:v8];
      id v22 = [v20 queryForStatusWithKeyPaths:v21 onBehalfOfManagementChannel:v16];

      id v23 = [v22 statusByKeyPath];
      uint64_t v24 = [v22 errorByKeyPath];
      v10[2](v10, v23, v24, 0);
    }
    else
    {
      ((void (**)(id, void *, void *, id))v10)[2](v10, 0, 0, v17);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    id v25 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    ((void (**)(id, void *, void *, void *))v10)[2](v10, 0, 0, v25);
  }
}

- (void)sendStatusForKeyPaths:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMXPCProxyHandler *)self hasCommandLineEntitlement])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v38 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Querying and sending status of specific type from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v38, &state);
    id v11 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v8;
      id v13 = [v12 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      id v14 = [v13 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543618;
      v47 = v14;
      __int16 v48 = 2114;
      id v49 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Querying and sending status with key paths %{public}@ to %{public}@...", buf, 0x16u);
    }
    id v44 = 0;
    id v15 = [(id)objc_opt_class() _managementChannelWithIdentifier:v9 error:&v44];
    id v16 = v44;
    id v17 = v16;
    if (v15)
    {
      uint64_t v18 = objc_opt_new();
      v19 = +[NSSet setWithArray:v8];
      uint64_t v20 = [v18 queryForStatusWithKeyPaths:v19 onBehalfOfManagementChannel:v15];

      id v21 = [v20 protocolStatusReportWithFullReport:0];
      id v43 = v17;
      id v22 = [v21 serializeAsDataWithType:1 error:&v43];
      id v23 = v43;

      if (v22)
      {
        id v37 = v23;
        uint64_t v24 = +[RMClientController sharedController];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_10008BE94;
        v39[3] = &unk_1000C4F90;
        id v40 = v8;
        id v25 = v9;
        id v26 = v21;
        id v27 = v9;
        id v28 = v8;
        id v29 = v20;
        __int16 v30 = v18;
        id v31 = v25;
        id v41 = v25;
        id v42 = v10;
        id v32 = v31;
        v33 = v30;
        v34 = v29;
        id v8 = v28;
        id v9 = v27;
        v35 = v26;
        [v24 sendStatusData:v22 toManagementSourceWithIdentifier:v32 completionHandler:v39];

        id v23 = v37;
LABEL_11:

        os_activity_scope_leave(&state);
        goto LABEL_12;
      }
    }
    else
    {
      id v23 = v16;
    }
    (*((void (**)(id, id))v10 + 2))(v10, v23);
    goto LABEL_11;
  }
  v36 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
  (*((void (**)(id, void *))v10 + 2))(v10, v36);

LABEL_12:
}

- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMXPCProxyHandler *)self hasCommandLineEntitlement])
  {
    id v11 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Querying for status subscriptions from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      id v14 = [v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      id v15 = [v14 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v15;
      __int16 v25 = 2114;
      id v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Querying for status subscriptions with identifiers %{public}@ from %{public}@...", buf, 0x16u);
    }
    id v16 = +[RMClientController sharedController];
    id v17 = +[NSSet setWithArray:v8];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10008C278;
    v19[3] = &unk_1000C7290;
    id v20 = v9;
    id v21 = v10;
    [v16 queryForStatusSubscriptionsWithIdentifiers:v17 fromManagementSourceWithIdentifier:v20 completionHandler:v19];

    os_activity_scope_leave(&state);
  }
  else
  {
    uint64_t v18 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v18);
  }
}

- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMXPCProxyHandler *)self hasCommandLineEntitlement])
  {
    id v11 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Querying and sending status subscriptions from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v8;
      id v14 = [v13 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      id v15 = [v14 componentsJoinedByString:@", "];

      *(_DWORD *)buf = 138543618;
      __int16 v25 = v15;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Querying and sending status subscriptions with identifiers %{public}@ to %{public}@...", buf, 0x16u);
    }
    id v16 = +[RMClientController sharedController];
    id v17 = +[NSSet setWithArray:v8];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10008C628;
    v19[3] = &unk_1000C4F90;
    id v20 = v8;
    id v21 = v9;
    id v22 = v10;
    [v16 sendStatusForSubscriptionsWithIdentifiers:v17 toManagementSourceWithIdentifier:v21 completionHandler:v19];

    os_activity_scope_leave(&state);
  }
  else
  {
    uint64_t v18 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    (*((void (**)(id, void *))v10 + 2))(v10, v18);
  }
}

- (void)fetchConfigurationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([(RMXPCProxyHandler *)self hasConfigurationSubscriberEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Fetching configurations", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching configurations for: %{public}@", buf, 0xCu);
    }

    id v10 = objc_opt_class();
    id v11 = [(RMXPCProxyHandler *)self persistentContainer];
    id v23 = 0;
    id v12 = [v10 _activeConfigurationsByTypeForTypes:v6 persistentContainer:v11 error:&v23];
    id v13 = v23;

    if (v12)
    {
      id v14 = +[RMLog XPCListenerDelegate];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v6;
        id v16 = [v15 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
        id v17 = [v16 componentsJoinedByString:@", "];

        *(_DWORD *)buf = 138543618;
        id v26 = v17;
        __int16 v27 = 2114;
        id v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetched configurations of types %{public}@: %{public}@", buf, 0x16u);
      }
      v7[2](v7, v12, 0);
    }
    else
    {
      v19 = +[RMLog XPCListenerDelegate];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = v6;
        id v21 = [v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
        id v22 = [v21 componentsJoinedByString:@", "];

        *(_DWORD *)buf = 138543618;
        id v26 = v22;
        __int16 v27 = 2114;
        id v28 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Could not fetch configurations of types %{public}@: %{public}@", buf, 0x16u);
      }
      ((void (**)(id, void *, id))v7)[2](v7, 0, v13);
    }

    os_activity_scope_leave(&state);
  }
  else
  {
    uint64_t v18 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.configuration-subscriber"];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v18);
  }
}

+ (id)_activeConfigurationsByTypeForTypes:(id)a3 persistentContainer:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[RMConfigurationQuerier alloc] initWithPersistentContainer:v7];

  id v10 = [(RMConfigurationQuerier *)v9 activeConfigurationsByTypeForTypes:v8 error:a5];

  return v10;
}

- (void)reportPluginDetailsWithCompletionHandler:(id)a3
{
  v35 = (void (**)(id, void *, void))a3;
  if ([(RMXPCProxyHandler *)self hasCommandLineEntitlement])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v33 = _os_activity_create((void *)&_mh_execute_header, "XPCProxyHandler: Query plugins", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v33, &state);
    id v4 = +[RMLog XPCListenerDelegate];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Query plugins", buf, 2u);
    }

    v36 = objc_opt_new();
    id v5 = +[RMConfigurationPublisher reportDetails];
    id v6 = +[RMExternalStatusPublisher sharedPublisher];
    id v7 = [v6 reportDetails];

    id v8 = objc_opt_new();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v43;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v13 = objc_msgSend(v12, "mutableCopy", v33);
          id v14 = [v12 objectForKeyedSubscript:@"Identifier"];
          [v8 setObject:v13 forKeyedSubscript:v14];
        }
        id v9 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
      }
      while (v9);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v15 = v7;
    id v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v39;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
          id v20 = objc_msgSend(v19, "objectForKeyedSubscript:", @"Identifier", v33);
          id v21 = [v8 objectForKeyedSubscript:v20];
          if (v21)
          {
            id v22 = [v19 objectForKeyedSubscript:@"StatusItems"];
            [v21 setObject:v22 forKeyedSubscript:@"StatusItems"];
          }
          else
          {
            id v22 = [v19 mutableCopy];
            [v8 setObject:v22 forKeyedSubscript:v20];
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
      }
      while (v16);
    }

    id v23 = [v8 allValues];
    uint64_t v24 = [v23 sortedArrayUsingComparator:&stru_1000C72D0];
    [v36 setObject:v24 forKeyedSubscript:@"Plugins"];

    __int16 v25 = +[RMModelConfigurationSchema schemas];
    id v26 = [v25 allKeys];

    if ([v26 count])
    {
      __int16 v27 = [v26 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      [v36 setObject:v27 forKeyedSubscript:@"Dynamic Configurations"];
    }
    id v28 = +[RMModelStatusSchema schemas];
    id v29 = [v28 allKeys];

    if ([v29 count])
    {
      __int16 v30 = [v29 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
      [v36 setObject:v30 forKeyedSubscript:@"Dynamic Status"];
    }
    v35[2](v35, v36, 0);

    os_activity_scope_leave(&state);
    id v31 = v35;
  }
  else
  {
    id v32 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement"];
    id v31 = v35;
    ((void (**)(id, void *, void *))v35)[2](v35, 0, v32);
  }
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (BOOL)hasCommandLineEntitlement
{
  return self->_hasCommandLineEntitlement;
}

- (BOOL)hasAccountChangesEntitlement
{
  return self->_hasAccountChangesEntitlement;
}

- (BOOL)hasConfigurationSubscriberEntitlement
{
  return self->_hasConfigurationSubscriberEntitlement;
}

- (BOOL)hasEnrollmentEntitlement
{
  return self->_hasEnrollmentEntitlement;
}

- (void).cxx_destruct
{
}

@end