@interface SBDPushNotificationController
- (APSConnection)connection;
- (BOOL)isEnabledForDomain:(id)a3;
- (NSMutableDictionary)pendingAccountRequests;
- (NSMutableDictionary)registeredAccountsForDomains;
- (NSMutableDictionary)weakDomainDelegates;
- (NSSet)enabledDomains;
- (OS_dispatch_queue)queue;
- (SBDPushNotificationController)init;
- (id)_portNameForEnvironmentName:(id)a3;
- (id)_registeredAccountIDs;
- (void)_loadURLBagWithCompletionHandler:(id)a3;
- (void)_onQueue_updateConnectionTopicsAndStoreRegistrations;
- (void)_onQueue_updateStoreBookkeeperNotificationRegistration:(id)a3;
- (void)_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 withCompletionHandler:(id)a6;
- (void)_startServiceConnectionsWithCompletionHandler:(id)a3;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3 forBookkeeperDomain:(id)a4;
- (void)setEnabledDomains:(id)a3;
- (void)updateNotificationRegistrationsWithCompletionBlock:(id)a3;
- (void)updateStoreBookkeeperNotificationRegistration:(id)a3;
@end

@implementation SBDPushNotificationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredAccountsForDomains, 0);
  objc_storeStrong((id *)&self->_pendingAccountRequests, 0);
  objc_storeStrong((id *)&self->_weakDomainDelegates, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_fakeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_enabledDomains, 0);
  objc_storeStrong((id *)&self->_typeRegistrationURL, 0);
  objc_storeStrong((id *)&self->_temporaryConnectionsByEnvironment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (NSMutableDictionary)registeredAccountsForDomains
{
  return self->_registeredAccountsForDomains;
}

- (NSMutableDictionary)pendingAccountRequests
{
  return self->_pendingAccountRequests;
}

- (NSMutableDictionary)weakDomainDelegates
{
  return self->_weakDomainDelegates;
}

- (APSConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_onQueue_updateStoreBookkeeperNotificationRegistration:(id)a3
{
  id v40 = a3;
  if (v40) {
    dispatch_group_t v4 = dispatch_group_create();
  }
  else {
    dispatch_group_t v4 = 0;
  }
  id v47 = [(NSMutableDictionary *)self->_registeredAccountsForDomains copy];
  id v43 = [(NSSet *)self->_enabledDomains copy];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10000E86C;
  v76[3] = &unk_1000210C8;
  v39 = v4;
  v77 = v39;
  v78 = self;
  v45 = objc_retainBlock(v76);
  v5 = SBKStoreAccountIdentifiers();
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v6 = [(SBDPushNotificationController *)self _registeredAccountIDs];
  id v7 = [v6 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v73;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v73 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v72 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v11, v39) & 1) == 0)
        {
          v12 = +[NSMutableArray array];
          v13 = [(NSMutableDictionary *)self->_pendingAccountRequests objectForKeyedSubscript:v11];
          v70[0] = _NSConcreteStackBlock;
          v70[1] = 3221225472;
          v70[2] = sub_10000E944;
          v70[3] = &unk_1000210F0;
          v70[4] = v11;
          id v71 = v12;
          id v14 = v12;
          [v13 enumerateKeysAndObjectsUsingBlock:v70];

          v15 = [(NSMutableDictionary *)self->_pendingAccountRequests objectForKeyedSubscript:v11];
          v16 = [v14 valueForKey:@"domain"];
          [v15 removeObjectsForKeys:v16];

          [v14 makeObjectsPerformSelector:"cancel"];
          v68[0] = _NSConcreteStackBlock;
          v68[1] = 3221225472;
          v68[2] = sub_10000E9C8;
          v68[3] = &unk_100021140;
          v68[4] = v11;
          v69 = v45;
          [v47 enumerateKeysAndObjectsUsingBlock:v68];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v72 objects:v82 count:16];
    }
    while (v8);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v5;
  id v44 = [obj countByEnumeratingWithState:&v64 objects:v81 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v65;
    v17 = v45 + 2;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v65 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v18;
        v19 = *(void **)(*((void *)&v64 + 1) + 8 * v18);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10000EA38;
        v60[3] = &unk_100021118;
        id v20 = v43;
        id v61 = v20;
        v21 = v45;
        v62 = v19;
        v63 = v21;
        [v47 enumerateKeysAndObjectsUsingBlock:v60];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v22 = v20;
        id v23 = [v22 countByEnumeratingWithState:&v56 objects:v80 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v57;
          do
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v57 != v25) {
                objc_enumerationMutation(v22);
              }
              if (v19)
              {
                uint64_t v27 = *(void *)(*((void *)&v56 + 1) + 8 * (void)j);
                if ((sub_10000EAA4(v19) & 1) == 0)
                {
                  v28 = [v47 objectForKeyedSubscript:v27];
                  unsigned __int8 v29 = [v28 containsObject:v19];

                  if ((v29 & 1) == 0) {
                    (*v17)(v21, v27, 1, v19);
                  }
                }
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v56 objects:v80 count:16];
          }
          while (v24);
        }

        if (sub_10000EAA4(v19))
        {
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_10000EC04;
          v54[3] = &unk_100021140;
          v30 = v21;
          v54[4] = v19;
          v55 = v30;
          [v47 enumerateKeysAndObjectsUsingBlock:v54];
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v31 = v22;
          id v32 = [v31 countByEnumeratingWithState:&v50 objects:v79 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v51;
            do
            {
              for (k = 0; k != v33; k = (char *)k + 1)
              {
                if (*(void *)v51 != v34) {
                  objc_enumerationMutation(v31);
                }
                (*v17)(v30, *(void *)(*((void *)&v50 + 1) + 8 * (void)k), 0, v19);
              }
              id v33 = [v31 countByEnumeratingWithState:&v50 objects:v79 count:16];
            }
            while (v33);
          }
        }
        uint64_t v18 = v46 + 1;
      }
      while ((id)(v46 + 1) != v44);
      id v44 = [obj countByEnumeratingWithState:&v64 objects:v81 count:16];
    }
    while (v44);
  }

  if (v39)
  {
    id v36 = [v40 copy];

    v37 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EC1C;
    block[3] = &unk_100021078;
    id v38 = v36;
    id v49 = v38;
    dispatch_group_notify(v39, v37, block);
  }
  else
  {
    id v38 = v40;
  }
}

- (void)updateStoreBookkeeperNotificationRegistration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000ECDC;
  v7[3] = &unk_100021000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)_onQueue_updateStoreBookkeeperNotificationRegistrationForDomain:(id)a3 optIn:(BOOL)a4 accountID:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  v10 = (__CFString *)a3;
  uint64_t v11 = (__CFString *)a5;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10000F5D0;
  v43[3] = &unk_100021078;
  id v12 = a6;
  id v44 = v12;
  v13 = objc_retainBlock(v43);
  if (!self->_bagLoaded)
  {
    id v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v15 = +[NSNumber numberWithBool:v8];
    *(_DWORD *)buf = 138412802;
    CFStringRef v46 = v15;
    __int16 v47 = 2112;
    v48 = v10;
    __int16 v49 = 2112;
    long long v50 = v11;
    v16 = "Unable to update push notification registration to %@ for domain '%@' (accountID %@): reason = 'URL bag has not been loaded'.";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x20u);

    goto LABEL_22;
  }
  if (!self->_typeRegistrationURL)
  {
    id v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v15 = +[NSNumber numberWithBool:v8];
    *(_DWORD *)buf = 138412802;
    CFStringRef v46 = v15;
    __int16 v47 = 2112;
    v48 = v10;
    __int16 v49 = 2112;
    long long v50 = v11;
    v16 = "Unable to update push notification registration to %@ for domain '%@' (accountID %@): reason = 'type registrat"
          "ion URL not found in URL bag'.";
    goto LABEL_21;
  }
  if (!self->_pushEnabled && v8)
  {
    id v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v46 = v10;
      __int16 v47 = 2112;
      v48 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping opt-in push notification registration attempt for domain '%@' (accountID %@).  reason = 'push is not enabled at the moment'.", buf, 0x16u);
    }
    goto LABEL_22;
  }
  if (!v11)
  {
    id v14 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = +[NSNumber numberWithBool:v8];
      *(_DWORD *)buf = 138412802;
      CFStringRef v46 = v15;
      __int16 v47 = 2112;
      v48 = v10;
      __int16 v49 = 2112;
      long long v50 = 0;
      v16 = "Unable to update push notification registration to %@ for domain '%@' (accountID %@): reason = 'account ID m"
            "issing, not set, or unspecified'.";
      goto LABEL_21;
    }
LABEL_22:

LABEL_23:
    ((void (*)(void *))v13[2])(v13);
    goto LABEL_24;
  }
  if (!v8)
  {
    v17 = [(NSMutableDictionary *)self->_registeredAccountsForDomains objectForKeyedSubscript:v10];
    if ([v17 containsObject:v11])
    {
      uint64_t v18 = SBKStoreAccountIdentifiers();
      unsigned __int8 v19 = [v18 containsObject:v11];

      if ((v19 & 1) == 0)
      {
        id v20 = sub_100009494();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v46 = v10;
          __int16 v47 = 2112;
          v48 = v11;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Skipping opt-out push notification registration attempt for domain '%@' (accountID %@).  reason = 'itunesstored has already sent an opt-out on our behalf'.", buf, 0x16u);
        }

        v21 = [(NSMutableDictionary *)self->_registeredAccountsForDomains objectForKeyedSubscript:v10];
        [v21 removeObject:v11];

        id v22 = +[SBKPreferences storeBookkeeperPreferences];
        if ([(NSMutableDictionary *)self->_registeredAccountsForDomains count])
        {
          id v23 = +[NSKeyedArchiver archivedDataWithRootObject:self->_registeredAccountsForDomains requiringSecureCoding:1 error:0];
          [v22 setObject:v23 forKey:@"SBKPushNotificationRegisteredDomains"];
        }
        else
        {
          [v22 setObject:0 forKey:@"SBKPushNotificationRegisteredDomains"];
        }

        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  if (sub_10000EAA4(v11))
  {
    id v24 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v11;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Making sure blocked accountID %@ is opted-out for push notifications", buf, 0xCu);
    }

    BOOL v8 = 0;
  }
  uint64_t v25 = [(NSMutableDictionary *)self->_pendingAccountRequests objectForKeyedSubscript:v11];

  if (!v25)
  {
    v26 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_pendingAccountRequests setObject:v26 forKeyedSubscript:v11];
  }
  uint64_t v27 = [(NSMutableDictionary *)self->_pendingAccountRequests objectForKeyedSubscript:v11];
  v28 = [v27 objectForKey:v10];
  unsigned __int8 v29 = +[SBDPushRegistrationRequest requestForDomain:v10 optIn:v8 accountID:v11 typeRegistrationURL:self->_typeRegistrationURL];
  if (([v28 isEqualToRegistrationRequest:v29] & 1) == 0)
  {
    v30 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v31 = @"Opt-out of";
      *(_DWORD *)buf = 138412802;
      if (v8) {
        CFStringRef v31 = @"Opt-in to";
      }
      CFStringRef v46 = v31;
      __int16 v47 = 2112;
      v48 = v10;
      __int16 v49 = 2112;
      long long v50 = v11;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%@ push notification registration for domain '%@' (accountID: %@)", buf, 0x20u);
    }

    [v28 cancel];
    [v27 setObject:v29 forKey:v10];
    id v32 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      +[NSNumber numberWithBool:v8];
      v35 = v28;
      id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v34 = [v29 requestProperties];
      *(_DWORD *)buf = 138413314;
      CFStringRef v46 = v33;
      __int16 v47 = 2112;
      v48 = v10;
      __int16 v49 = 2112;
      long long v50 = v11;
      __int16 v51 = 2112;
      long long v52 = v29;
      __int16 v53 = 2112;
      v54 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "StoreBookkeeper update push notification registration to %@ for domain '%@' (accountID %@) issuing request %@ with properties %@", buf, 0x34u);

      v28 = v35;
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000F5E8;
    v36[3] = &unk_1000210A0;
    id v37 = v27;
    id v38 = v10;
    BOOL v42 = v8;
    v39 = v11;
    id v40 = self;
    v41 = v13;
    [v29 startWithConnectionResponseBlock:v36];
  }
LABEL_24:
}

- (id)_registeredAccountIDs
{
  v3 = +[NSMutableSet set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_registeredAccountsForDomains allValues];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 unionSet:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = [v3 copy];
  return v9;
}

- (id)_portNameForEnvironmentName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:APSEnvironmentProduction])
  {
    CFStringRef v4 = @"com.apple.aps.storebookkeeperd";
  }
  else if ([v3 isEqualToString:APSEnvironmentDevelopment])
  {
    CFStringRef v4 = @"com.apple.aps.storebookkeeperd.dev";
  }
  else if ([v3 isEqualToString:APSEnvironmentDemo])
  {
    CFStringRef v4 = @"com.apple.aps.storebookkeeperd.demo";
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return (id)v4;
}

- (void)_loadURLBagWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[XPCTransactionController sharedInstance];
  id v6 = [v5 beginTransactionWithIdentifier:@"PushNotificationConfiguration-LoadURLBag"];

  id v7 = objc_alloc_init((Class)SSURLBagContext);
  id v8 = [objc_alloc((Class)SSURLBag) initWithURLBagContext:v7];
  id v9 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Loading URL Bag", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000103B0;
  v12[3] = &unk_100021050;
  id v13 = v6;
  id v14 = v4;
  v12[4] = self;
  id v10 = v6;
  id v11 = v4;
  [v8 loadWithCompletionBlock:v12];
}

- (void)_startServiceConnectionsWithCompletionHandler:(id)a3
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010A0C;
  v9[3] = &unk_1000212C0;
  v9[4] = self;
  id v4 = objc_retainBlock(v9);
  id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Beginning APS bringup - creating connections...", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010A80;
  v7[3] = &unk_100021000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SBDPushNotificationController *)self _loadURLBagWithCompletionHandler:v7];
}

- (void)updateNotificationRegistrationsWithCompletionBlock:(id)a3
{
}

- (NSSet)enabledDomains
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100011274;
  id v10 = sub_100011284;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001128C;
  v5[3] = &unk_100020FD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (void)setEnabledDomains:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011370;
  v7[3] = &unk_100020FB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (BOOL)isEnabledForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011498;
  block[3] = &unk_100020F88;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)setDelegate:(id)a3 forBookkeeperDomain:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000115D8;
  block[3] = &unk_100020F60;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_onQueue_updateConnectionTopicsAndStoreRegistrations
{
  if (self->_connection)
  {
    if ([(NSSet *)self->_enabledDomains count])
    {
      CFStringRef v12 = @"com.apple.storebookkeeper";
      id v3 = +[NSArray arrayWithObjects:&v12 count:1];
    }
    else
    {
      id v3 = 0;
    }
    [(APSConnection *)self->_connection setEnabledTopics:v3];
    id v4 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      connection = self->_connection;
      *(_DWORD *)buf = 138412546;
      id v9 = v3;
      __int16 v10 = 2112;
      uint64_t v11 = connection;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Setting APNS connection enabled topics to %@ on connection %@", buf, 0x16u);
    }

    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000117D4;
    block[3] = &unk_1000212C0;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ connectionDidReconnect:%@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412802;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ connection:%@ didChangeConnectedStatus: connected = %d", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138413058;
    BOOL v13 = self;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ connection:%@ didFailToSendOutgoingMessage:%@, error = %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ connection:%@ didSendOutgoingMessage:%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ connection:%@ didReceiveIncomingMessage:%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ connection:%@ didReceiveMessageForTopic:%@ userInfo:%@", buf, 0x2Au);
  }

  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100011DFC;
  v16[3] = &unk_100020F38;
  id v17 = v9;
  id v18 = v10;
  id v19 = self;
  id v20 = v8;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync((dispatch_queue_t)queue, v16);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ connection:%@ didReceivePublicToken:%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)dealloc
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000123B4;
  v7[3] = &unk_1000212C0;
  v7[4] = self;
  id v3 = objc_retainBlock(v7);
  queue = self->_queue;
  if (queue) {
    dispatch_async((dispatch_queue_t)queue, v3);
  }
  else {
    ((void (*)(void *))v3[2])(v3);
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self->_fakeNotificationObserver];

  v6.receiver = self;
  v6.super_class = (Class)SBDPushNotificationController;
  [(SBDPushNotificationController *)&v6 dealloc];
}

- (SBDPushNotificationController)init
{
  v24.receiver = self;
  v24.super_class = (Class)SBDPushNotificationController;
  v2 = [(SBDPushNotificationController *)&v24 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.SBD.push-notification-controller", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSSet set];
    enabledDomains = v2->_enabledDomains;
    v2->_enabledDomains = (NSSet *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    weakDomainDelegates = v2->_weakDomainDelegates;
    v2->_weakDomainDelegates = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableDictionary dictionary];
    pendingAccountRequests = v2->_pendingAccountRequests;
    v2->_pendingAccountRequests = (NSMutableDictionary *)v9;

    __int16 v11 = +[SBKPreferences storeBookkeeperPreferences];
    id v12 = [v11 objectForKey:@"SBKPushNotificationRegisteredDomains" withDefaultValue:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      v29[3] = objc_opt_class();
      __int16 v13 = +[NSArray arrayWithObjects:v29 count:4];
      id v14 = +[NSSet setWithArray:v13];
      id v23 = 0;
      uint64_t v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v14 fromData:v12 error:&v23];
      __int16 v16 = (NSMutableDictionary *)v23;
      registeredAccountsForDomains = v2->_registeredAccountsForDomains;
      v2->_registeredAccountsForDomains = (NSMutableDictionary *)v15;

      if (v16)
      {
        id v18 = os_log_create("com.apple.amp.storebookkeeperd", "Push");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v26 = v12;
          __int16 v27 = 2112;
          id v28 = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error: SBDPushNotificationController init: Error unarchiving _registeredDomains from registeredDomains. registeredDomains=%@ error=%@", buf, 0x16u);
        }

        uint64_t v19 = +[NSMutableDictionary dictionary];
        id v20 = v2->_registeredAccountsForDomains;
        v2->_registeredAccountsForDomains = (NSMutableDictionary *)v19;
      }
    }
    else
    {
      uint64_t v21 = +[NSMutableDictionary dictionary];
      __int16 v16 = v2->_registeredAccountsForDomains;
      v2->_registeredAccountsForDomains = (NSMutableDictionary *)v21;
    }

    [(SBDPushNotificationController *)v2 _startServiceConnectionsWithCompletionHandler:0];
  }
  return v2;
}

@end