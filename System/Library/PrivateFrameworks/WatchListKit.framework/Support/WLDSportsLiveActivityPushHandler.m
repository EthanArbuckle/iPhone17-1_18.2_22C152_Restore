@interface WLDSportsLiveActivityPushHandler
+ (BOOL)shouldSuppressNotification:(id)a3;
- (BOOL)shouldHandleNotification:(id)a3;
- (id)connection;
- (void)createLiveActivityForCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5;
- (void)handleNotification:(id)a3 completion:(id)a4;
@end

@implementation WLDSportsLiveActivityPushHandler

- (BOOL)shouldHandleNotification:(id)a3
{
  v3 = objc_msgSend(a3, "wlk_dictionaryForKey:", @"payload");
  if (_os_feature_enabled_impl()) {
    CFStringRef v4 = @"sportsLAAEnabled";
  }
  else {
    CFStringRef v4 = @"liveActivityAutostartEnabled";
  }
  LOBYTE(v5) = 0;
  if (objc_msgSend(v3, "wlk_BOOLForKey:defaultValue:", v4, 0))
  {
    if (_os_feature_enabled_impl())
    {
      v6 = objc_msgSend(v3, "wlk_stringForKey:", @"trigger");
      unsigned __int8 v7 = [v6 isEqualToString:@"UpNext"];

      if (v7)
      {
        LOBYTE(v5) = 0;
        goto LABEL_13;
      }
    }
    else
    {
      v8 = +[WLKSystemPreferencesStore sharedPreferences];
      unsigned int v5 = [v8 sportsScoreSpoilersAllowed];

      if (!v5) {
        goto LABEL_13;
      }
    }
    v9 = objc_msgSend(v3, "wlk_stringForKey:", WLKNotificationsKeyType);
    if ([v9 isEqualToString:@"gameStartWithFollow"]) {
      LOBYTE(v5) = 1;
    }
    else {
      LOBYTE(v5) = [v9 isEqualToString:@"gameStartWithScore"];
    }
  }
LABEL_13:

  return v5;
}

- (void)handleNotification:(id)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = objc_msgSend(a3, "wlk_dictionaryForKey:", @"payload");
  v8 = objc_msgSend(v7, "wlk_stringForKey:", @"entityId");
  v9 = objc_opt_new();
  v10 = objc_msgSend(v7, "wlk_dictionaryForKey:", @"liveActivityAutostart");
  if (v10) {
    [v9 setObject:v10 forKeyedSubscript:@"liveActivityAutostart"];
  }
  id v11 = v7;
  v12 = objc_msgSend(v11, "wlk_dictionaryForKey:", @"liveActivityAutostart");
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "wlk_stringForKey:", @"actionId");
    if (v14)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v15 = objc_msgSend(v11, "wlk_arrayForKey:", @"actions");
      id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16)
      {
        id v21 = v11;
        v22 = v10;
        v23 = v9;
        v24 = v8;
        v25 = self;
        id v26 = v6;
        uint64_t v17 = *(void *)v28;
        while (2)
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v15);
            }
            v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = objc_msgSend(v19, "wlk_stringForKey:", @"id");
              if ([v20 isEqualToString:v14])
              {
                id v16 = v19;

                goto LABEL_19;
              }
            }
          }
          id v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v16) {
            continue;
          }
          break;
        }
LABEL_19:
        id v6 = v26;
        v9 = v23;
        v8 = v24;
        v10 = v22;
      }
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  if (v16) {
    [v9 setObject:v16 forKeyedSubscript:@"liveActivityAutostartAction"];
  }
  -[WLDSportsLiveActivityPushHandler createLiveActivityForCanonicalId:supplementaryData:completion:](self, "createLiveActivityForCanonicalId:supplementaryData:completion:", v8, v9, v6, v21, v22, v23, v24, v25, v26);
}

+ (BOOL)shouldSuppressNotification:(id)a3
{
  v3 = objc_msgSend(a3, "wlk_stringForKey:", @"entityId");
  CFStringRef v4 = +[WLKSettingsStore sharedSettings];
  unsigned int v5 = [v4 suppressedSportsEventIDs];
  unsigned __int8 v6 = [v5 containsObject:v3];

  return v6;
}

- (void)createLiveActivityForCanonicalId:(id)a3 supplementaryData:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WLDSportsLiveActivityPushHandler *)self connection];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke;
  v17[3] = &unk_100045D40;
  id v12 = v8;
  id v18 = v12;
  v13 = [v11 remoteObjectProxyWithErrorHandler:v17];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke_2;
  v15[3] = &unk_100045D40;
  id v16 = v12;
  id v14 = v12;
  [v13 createActivityWithCanonicalId:v10 supplementaryData:v9 completion:v15];
}

uint64_t __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __98__WLDSportsLiveActivityPushHandler_createLiveActivityForCanonicalId_supplementaryData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)connection
{
  connection = self->_connection;
  if (!connection)
  {
    CFStringRef v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.sportsd.session.xpc" options:0];
    unsigned int v5 = self->_connection;
    self->_connection = v4;

    unsigned __int8 v6 = self->_connection;
    unsigned __int8 v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___WLKSportsCommunicationsProtocol];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_14];
    objc_initWeak(&location, self);
    id v8 = self->_connection;
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = __46__WLDSportsLiveActivityPushHandler_connection__block_invoke_59;
    v13 = &unk_100044AE0;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v8 setInvalidationHandler:&v10];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __46__WLDSportsLiveActivityPushHandler_connection__block_invoke(id a1)
{
  v1 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "WLDSportsLiveActivityPushHandler - Connection interrupted.", v2, 2u);
  }
}

void __46__WLDSportsLiveActivityPushHandler_connection__block_invoke_59(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WLDSportsLiveActivityPushHandler - Connection invalidated.", v4, 2u);
  }

  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (void).cxx_destruct
{
}

@end