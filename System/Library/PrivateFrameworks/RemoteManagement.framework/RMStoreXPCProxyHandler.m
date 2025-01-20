@interface RMStoreXPCProxyHandler
+ (BOOL)_doesConnection:(id)a3 haveEntitlements:(id)a4;
+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4;
+ (id)_applicationIdentifierFromConnection:(id)a3;
- (BOOL)hasAnyStoreEntitlement;
- (BOOL)hasCommandLineEntitlement;
- (BOOL)hasObserverEntitlement;
- (BOOL)hasProviderEntitlement;
- (BOOL)hasSubscriberEntitlement;
- (NSPersistentContainer)persistentContainer;
- (RMStoreXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4;
- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7;
- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4;
- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)observerStoresWithCompletionHandler:(id)a3;
- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)providerStoresWithCompletionHandler:(id)a3;
- (void)publishStatusWithStoreIdentifier:(id)a3 status:(id)a4 completionHandler:(id)a5;
- (void)removeStatusWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 completionHandler:(id)a7;
- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8;
- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6;
- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6;
- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5;
- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)subscriberStoresWithCompletionHandler:(id)a3;
- (void)unassignAssets:(id)a3 completionHandler:(id)a4;
- (void)writeStatusWithStoreIdentifier:(id)a3 declarationType:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 sourceIdentifier:(id)a7 validity:(BOOL)a8 reasons:(id)a9 completionHandler:(id)a10;
@end

@implementation RMStoreXPCProxyHandler

- (RMStoreXPCProxyHandler)initWithXPCConnection:(id)a3 persistentContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)RMStoreXPCProxyHandler;
  v8 = [(RMStoreXPCProxyHandler *)&v19 init];
  if (v8)
  {
    v9 = objc_opt_class();
    CFStringRef v23 = @"com.apple.private.remotemanagement";
    v10 = +[NSArray arrayWithObjects:&v23 count:1];
    LODWORD(v9) = [v9 _doesConnection:v6 haveEntitlements:v10];

    objc_storeStrong((id *)v8 + 2, a4);
    v8[8] = (char)v9;
    if (v9)
    {
      *(_WORD *)(v8 + 9) = 257;
      v8[11] = 1;
      BOOL v11 = 1;
    }
    else
    {
      v12 = objc_opt_class();
      v22[0] = @"com.apple.private.remotemanagement.observer";
      v22[1] = @"com.apple.private.remotemanagement.provider";
      v22[2] = @"com.apple.private.remotemanagement.subscriber";
      v13 = +[NSArray arrayWithObjects:v22 count:3];
      v8[9] = [v12 _doesConnection:v6 haveEntitlements:v13];

      v14 = objc_opt_class();
      CFStringRef v21 = @"com.apple.private.remotemanagement.provider";
      BOOL v11 = 1;
      v15 = +[NSArray arrayWithObjects:&v21 count:1];
      v8[10] = [v14 _doesConnection:v6 haveEntitlements:v15];

      v16 = objc_opt_class();
      CFStringRef v20 = @"com.apple.private.remotemanagement.subscriber";
      v17 = +[NSArray arrayWithObjects:&v20 count:1];
      v8[11] = [v16 _doesConnection:v6 haveEntitlements:v17];

      if (!v8[10])
      {
        if (v8[9]) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = v8[11] != 0;
        }
      }
    }
    v8[12] = v11;
  }

  return (RMStoreXPCProxyHandler *)v8;
}

+ (BOOL)_doesConnection:(id)a3 haveEntitlements:(id)a4
{
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v12 = [v5 valueForEntitlement:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned __int8 v13 = [v12 BOOLValue];

          if (v13) {
            goto LABEL_15;
          }
        }
        else
        {
        }
        if ([v11 isEqualToString:@"com.apple.private.remotemanagement.observer"]
          && ([a1 _isConnection:v5 fromApplicationIdentifier:@"com.apple.Preferences"] & 1) != 0)
        {
LABEL_15:
          BOOL v14 = 1;
          goto LABEL_16;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_16:

  return v14;
}

+ (id)_applicationIdentifierFromConnection:(id)a3
{
  return [a3 valueForEntitlement:@"application-identifier"];
}

+ (BOOL)_isConnection:(id)a3 fromApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _applicationIdentifierFromConnection:a3];
  id v8 = +[RMLog StoreXPCListenerDelegate];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000851B4();
  }

  unsigned __int8 v9 = [v6 isEqualToString:v7];
  return v9;
}

- (void)observerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ObserverStoreWithIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    unsigned __int8 v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ObserverStoreWithIdentifier with %{public}@...", buf, 0xCu);
    }

    v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007F82C;
    v12[3] = &unk_1000C6FB0;
    id v13 = v7;
    [v10 observerStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)observerStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    id v5 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ObserverStoresWithCompletionHandler from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    id v6 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ObserverStoresWithCompletionHandler...", buf, 2u);
    }

    id v7 = +[RMStoreController sharedController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10007FA74;
    v8[3] = &unk_1000C6FD8;
    id v9 = v4;
    [v7 observerStoresWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v5 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v5);
  }
}

- (void)declarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: DeclarationWithIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DeclarationWithIdentifier with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10007FD30;
    v15[3] = &unk_1000C7000;
    id v16 = v10;
    [v13 declarationWithIdentifier:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)declarationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: DeclarationsForStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DeclarationsForStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10007FFD0;
    v12[3] = &unk_1000C6FD8;
    id v13 = v7;
    [v10 declarationsForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)declarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: DeclarationsWithTypes from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DeclarationsWithTypes with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10008028C;
    v15[3] = &unk_1000C6FD8;
    id v16 = v10;
    [v13 declarationsWithTypes:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)declarationManifestForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: DeclarationManifestForStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DeclarationManifestForStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008052C;
    v12[3] = &unk_1000C7028;
    id v13 = v7;
    [v10 declarationManifestForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)configurationUIsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ConfigurationUIsForStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ConfigurationUIsForStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000807CC;
    v12[3] = &unk_1000C6FD8;
    id v13 = v7;
    [v10 configurationUIsForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)displayableProfileConfigurationsForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: DisplayableProfileConfigurationsForStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DisplayableProfileConfigurationsForStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100080A6C;
    v12[3] = &unk_1000C6FD8;
    id v13 = v7;
    [v10 displayableProfileConfigurationsForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)setShouldInstallConfiguration:(id)a3 shouldInstall:(BOOL)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = (void (**)(id, void *))a6;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    v12 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SetShouldInstallConfiguration from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v17.opaque[0] = 0;
    v17.opaque[1] = 0;
    os_activity_scope_enter(v12, &v17);
    id v13 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [v9 declarationIdentifier];
      *(_DWORD *)buf = 138543362;
      id v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SetShouldInstallConfiguration with %{public}@...", buf, 0xCu);
    }
    v15 = +[RMErrorUtilities createNotImplementedErrorForFeature:@"SetShouldInstallConfiguration"];
    v11[2](v11, v15);

    os_activity_scope_leave(&v17);
  }
  else
  {
    id v16 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.observer"];
    v11[2](v11, v16);
  }
}

- (void)fetchDataAtURL:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasObserverEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: FetchDataForURL from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "FetchDataForURL with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100080EFC;
    v15[3] = &unk_1000C7050;
    id v16 = v10;
    [v13 fetchDataAtURL:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)createStoreWithType:(int64_t)a3 defaultToInteractive:(BOOL)a4 dataSeparated:(BOOL)a5 options:(id)a6 completionHandler:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v12 = a6;
  id v13 = a7;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    BOOL v14 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: CreateStoreWithType from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);
    v15 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CreateStoreWithType...", buf, 2u);
    }

    id v16 = +[RMStoreController sharedController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100081184;
    v18[3] = &unk_1000C7078;
    id v19 = v13;
    [v16 createStoreWithType:a3 defaultToInteractive:v9 dataSeparated:v8 options:v12 completionHandler:v18];

    os_activity_scope_leave(&state);
  }
  else
  {
    os_activity_scope_state_s v17 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v17);
  }
}

- (void)removeStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    BOOL v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: RemoveStoreWithIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    BOOL v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RemoveStoreWithIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100081420;
    v12[3] = &unk_1000C6B58;
    id v13 = v7;
    [v10 removeStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)providerStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    BOOL v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ProviderStoreWithIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    BOOL v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ProviderStoreWithIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000816A8;
    v12[3] = &unk_1000C7078;
    id v13 = v7;
    [v10 providerStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)providerStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    id v5 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ProviderStoresWithCompletionHandler from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    id v6 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ProviderStoresWithCompletionHandler...", buf, 2u);
    }

    id v7 = +[RMStoreController sharedController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000818F0;
    v8[3] = &unk_1000C6FD8;
    id v9 = v4;
    [v7 providerStoresWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v5 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v5);
  }
}

- (void)saveDeclaration:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SaveDeclaration from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 declarationIdentifier];
      *(_DWORD *)buf = 138543362;
      long long v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SaveDeclaration with %{public}@...", buf, 0xCu);
    }
    BOOL v14 = +[RMStoreController sharedController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100081BC0;
    v16[3] = &unk_1000C6B58;
    id v17 = v10;
    [v14 saveDeclaration:v8 storeIdentifier:v9 completionHandler:v16];

    os_activity_scope_leave(&state);
  }
  else
  {
    v15 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)deleteDeclarationWithIdentifier:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: DeleteDeclarationWithIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DeleteDeclarationWithIdentifier with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100081E60;
    v15[3] = &unk_1000C6B58;
    id v16 = v10;
    [v13 deleteDeclarationWithIdentifier:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)applyChangesForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ApplyChangesForStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "ApplyChangesForStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000820E4;
    v12[3] = &unk_1000C6B58;
    id v13 = v7;
    [v10 applyChangesForStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)subscriberStoreWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SubscriberStoreWithIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SubscriberStoreWithIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10008236C;
    v12[3] = &unk_1000C70A0;
    id v13 = v7;
    [v10 subscriberStoreWithIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)subscriberStoresWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v5 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SubscriberStoresWithCompletionHandler from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    id v6 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SubscriberStoresWithCompletionHandler...", buf, 2u);
    }

    id v7 = +[RMStoreController sharedController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000825B4;
    v8[3] = &unk_1000C6FD8;
    id v9 = v4;
    [v7 subscriberStoresWithCompletionHandler:v8];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v5 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, NSObject *))v4 + 2))(v4, 0, v5);
  }
}

- (void)subscribedStoreDeclarationsWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SubscribedStoreDeclarationsWithTypes from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SubscribedStoreDeclarationsWithTypes...", buf, 2u);
    }

    id v10 = +[RMStoreController sharedController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100082814;
    v11[3] = &unk_1000C70C8;
    id v12 = v7;
    [v10 subscribedStoreDeclarationsWithTypes:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v8 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void, NSObject *))v7 + 2))(v7, 0, 0, v8);
  }
}

- (void)subscribedDeclarationsWithTypes:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SubscribedDeclarationsWithTypes from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SubscribedDeclarationsWithTypes with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100082AEC;
    v15[3] = &unk_1000C6FD8;
    id v16 = v10;
    [v13 subscribedDeclarationsWithTypes:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)subscribedStoreConfigurationsVisibleUIWithTypes:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SubscribedStoreConfigurationsVisibleUIWithTypes from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SubscribedStoreConfigurationsVisibleUIWithTypes...", buf, 2u);
    }

    id v10 = +[RMStoreController sharedController];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100082D4C;
    v11[3] = &unk_1000C70C8;
    id v12 = v7;
    [v10 subscribedStoreConfigurationsVisibleUIWithTypes:v6 completionHandler:v11];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v8 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void, NSObject *))v7 + 2))(v7, 0, 0, v8);
  }
}

- (void)resolveAsset:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: ResolveAsset from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 assetIdentifier];
      *(_DWORD *)buf = 138543362;
      long long v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ResolveAsset with %{public}@...", buf, 0xCu);
    }
    BOOL v14 = +[RMStoreController sharedController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008303C;
    v16[3] = &unk_1000C6A50;
    id v17 = v10;
    [v14 resolveAsset:v8 storeIdentifier:v9 completionHandler:v16];

    os_activity_scope_leave(&state);
  }
  else
  {
    v15 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
  }
}

- (void)unassignAssets:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: UnassignAssets from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "UnassignAssets with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000832D8;
    v12[3] = &unk_1000C6B58;
    id v13 = v7;
    [v10 unassignAssets:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)writeStatusWithStoreIdentifier:(id)a3 declarationType:(id)a4 declarationIdentifier:(id)a5 declarationServerToken:(id)a6 sourceIdentifier:(id)a7 validity:(BOOL)a8 reasons:(id)a9 completionHandler:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v29 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  CFStringRef v21 = (void (**)(id, void))a10;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v28 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: WriteStatusWithStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v28, &state);
    v22 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "WriteStatusWithStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v30 = 0;
    unsigned int v23 = +[RMConfigurationStatusArchiver persistStatusForStoreIdentifier:v16 declarationIdentifier:v17 declarationServerToken:v18 sourceIdentifier:v19 validity:v10 reasons:v20 error:&v30];
    id v24 = v30;
    if (v23)
    {
      v25 = +[RMLog StoreXPCListenerDelegate];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        sub_100085F84();
      }
      id v26 = 0;
    }
    else
    {
      v25 = +[RMLog StoreXPCListenerDelegate];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100085FB8();
      }
      id v26 = v24;
    }

    ((void (**)(id, id))v21)[2](v21, v26);
    os_activity_scope_leave(&state);
  }
  else
  {
    v27 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    ((void (**)(id, void *))v21)[2](v21, v27);
  }
}

- (void)removeStatusWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 sourceIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void))a7;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v17 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: RemoveStatusWithStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v17, &state);
    id v18 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "RemoveStatusWithStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v24 = 0;
    unsigned int v19 = +[RMConfigurationStatusArchiver removeStatusForStoreIdentifier:v12 declarationIdentifier:v13 declarationServerToken:v14 sourceIdentifier:v15 error:&v24];
    id v20 = v24;
    if (v19)
    {
      CFStringRef v21 = +[RMLog StoreXPCListenerDelegate];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100086020();
      }
      id v22 = 0;
    }
    else
    {
      CFStringRef v21 = +[RMLog StoreXPCListenerDelegate];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100086054();
      }
      id v22 = v20;
    }

    ((void (**)(id, id))v16)[2](v16, v22);
    os_activity_scope_leave(&state);
  }
  else
  {
    unsigned int v23 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    ((void (**)(id, void *))v16)[2](v16, v23);
  }
}

- (void)setConfigurationUIWithStoreIdentifier:(id)a3 declarationIdentifier:(id)a4 declarationServerToken:(id)a5 visible:(BOOL)a6 ui:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    unsigned int v19 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SetConfigurationUI from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v19, &state);
    id v20 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SetConfigurationUI...", buf, 2u);
    }

    CFStringRef v21 = +[RMStoreController sharedController];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100083A74;
    v23[3] = &unk_1000C6B58;
    id v24 = v18;
    [v21 setConfigurationUIWithStoreIdentifier:v14 declarationIdentifier:v15 declarationServerToken:v16 visible:v10 ui:v17 completionHandler:v23];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v22 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void *))v18 + 2))(v18, v22);
  }
}

- (void)publishStatusWithStoreIdentifier:(id)a3 status:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    BOOL v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: PublishStatusWithStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PublishStatusWithStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMExternalStatusPublisher sharedPublisher];
    id v19 = 0;
    unsigned int v14 = [v13 persistStatusWithStoreIdentifier:v8 status:v9 error:&v19];
    id v15 = v19;

    if (v14)
    {
      id v16 = +[RMLog StoreXPCListenerDelegate];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_100085F84();
      }
      id v17 = 0;
    }
    else
    {
      id v16 = +[RMLog StoreXPCListenerDelegate];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100085FB8();
      }
      id v17 = v15;
    }

    ((void (**)(id, id))v10)[2](v10, v17);
    os_activity_scope_leave(&state);
  }
  else
  {
    id v18 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    ((void (**)(id, void *))v10)[2](v10, v18);
  }
}

- (void)setTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v13 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SetTrustForCertificateRef from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v13, &state);
    unsigned int v14 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v11 storeIdentifier];
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SetTrustForCertificateRef with %{public}@...", buf, 0xCu);
    }
    id v16 = +[RMStoreController sharedController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100083F84;
    v18[3] = &unk_1000C6B58;
    id v19 = v12;
    [v16 setTrustForCertificateRef:v10 configurationKey:v11 fullTrust:v7 completionHandler:v18];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v17 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void *))v12 + 2))(v12, v17);
  }
}

- (void)removeTrustForCertificateRef:(id)a3 configurationKey:(id)a4 fullTrust:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v13 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: RemoveTrustForCertificateRef from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v13, &state);
    unsigned int v14 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v11 storeIdentifier];
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "RemoveTrustForCertificateRef with %{public}@...", buf, 0xCu);
    }
    id v16 = +[RMStoreController sharedController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008424C;
    v18[3] = &unk_1000C6B58;
    id v19 = v12;
    [v16 removeTrustForCertificateRef:v10 configurationKey:v11 fullTrust:v7 completionHandler:v18];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v17 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void *))v12 + 2))(v12, v17);
  }
}

- (void)certificatePersistentRefForAssetKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: CertificatePersistentRefForAssetKey from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CertificatePersistentRefForAssetKey with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000844F0;
    v15[3] = &unk_1000C7050;
    id v16 = v10;
    [v13 certificatePersistentRefForAssetKey:v8 storeIdentifier:v9 completionHandler:v15];

    os_activity_scope_leave(&state);
  }
  else
  {
    unsigned int v14 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v14);
  }
}

- (void)certificateStatusWithStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasSubscriberEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: CertificateStatusWithStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CertificateStatusWithStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100084790;
    v12[3] = &unk_1000C6E88;
    id v13 = v7;
    [v10 certificateStatusWithStoreIdentifier:v6 completionHandler:v12];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v11 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.subscriber"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)metadataForStoreIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(RMStoreXPCProxyHandler *)self hasAnyStoreEntitlement])
  {
    id v8 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: MetadataForStoreIdentifier from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    id v9 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MetadataForStoreIdentifier with %{public}@...", buf, 0xCu);
    }

    id v10 = +[RMStoreController sharedController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100084A70;
    v13[3] = &unk_1000C6E88;
    id v14 = v7;
    [v10 metadataForStoreIdentifier:v6 completionHandler:v13];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v11 = +[NSString stringWithFormat:@"%@, %@, %@", @"com.apple.private.remotemanagement.provider", @"com.apple.private.remotemanagement.observer", @"com.apple.private.remotemanagement.subscriber"];
    id v12 = +[RMErrorUtilities createConnectionNotEntitledWithName:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

- (void)metadataValueForKey:(id)a3 storeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(RMStoreXPCProxyHandler *)self hasAnyStoreEntitlement])
  {
    id v11 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: MetadataValueForKey from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    id v12 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "MetadataValueForKey with %{public}@...", buf, 0xCu);
    }

    id v13 = +[RMStoreController sharedController];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100084D80;
    v16[3] = &unk_1000C70F0;
    id v17 = v8;
    id v18 = v10;
    [v13 metadataValueForKey:v17 storeIdentifier:v9 completionHandler:v16];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v14 = +[NSString stringWithFormat:@"%@, %@, %@", @"com.apple.private.remotemanagement.provider", @"com.apple.private.remotemanagement.observer", @"com.apple.private.remotemanagement.subscriber"];
    id v15 = +[RMErrorUtilities createConnectionNotEntitledWithName:v14];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v15);
  }
}

- (void)setMetadataValue:(id)a3 forKey:(id)a4 storeIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(RMStoreXPCProxyHandler *)self hasProviderEntitlement])
  {
    id v14 = _os_activity_create((void *)&_mh_execute_header, "StoreXPCListenerDelegate: SetMetadataValue from proxy handler", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v14, &state);
    id v15 = +[RMLog StoreXPCListenerDelegate];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SetMetadataValue with %{public}@...", buf, 0xCu);
    }

    id v16 = +[RMStoreController sharedController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100085070;
    v18[3] = &unk_1000C4F40;
    id v19 = v11;
    id v20 = v13;
    [v16 setMetadataValue:v10 forKey:v19 storeIdentifier:v12 completionHandler:v18];

    os_activity_scope_leave(&state);
  }
  else
  {
    id v17 = +[RMErrorUtilities createConnectionNotEntitledWithName:@"com.apple.private.remotemanagement.provider"];
    (*((void (**)(id, void *))v13 + 2))(v13, v17);
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

- (BOOL)hasObserverEntitlement
{
  return self->_hasObserverEntitlement;
}

- (BOOL)hasProviderEntitlement
{
  return self->_hasProviderEntitlement;
}

- (BOOL)hasSubscriberEntitlement
{
  return self->_hasSubscriberEntitlement;
}

- (BOOL)hasAnyStoreEntitlement
{
  return self->_hasAnyStoreEntitlement;
}

- (void).cxx_destruct
{
}

@end