@interface MediaLibraryAccessRevocationController
+ (MediaLibraryAccessRevocationController)sharedController;
+ (id)_identifiersOfApplicationsWithGrantedAccessToMediaLibrary;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_identifiersOfApplicationsWithExpiredAccessToMediaLibrary;
- (id)_init;
- (id)_storeRequestContextWithIdentity:(id)a3 applicationIdentifier:(id)a4;
- (id)_storeRequestContextWithIdentity:(id)a3 clientInfo:(id)a4;
- (void)_checkForRecentRevocations;
- (void)_displayNotificationForBuilder:(id)a3 withReplyBlock:(id)a4;
- (void)_registerFailureToRevokeMusicUserTokensForApplicationIdentifier:(id)a3 error:(id)a4;
- (void)_registerFailureToRevokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3 error:(id)a4;
- (void)_revokeMusicUserTokensForApplicationWithIdentifier:(id)a3 andUserIdentity:(id)a4 withCompletion:(id)a5;
- (void)_revokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3;
- (void)_startObservingRevocations;
- (void)_stopObservingRevocations;
- (void)dealloc;
- (void)revokeMusicKitUserTokensForUserIdentity:(id)a3 withCompletion:(id)a4;
- (void)startObservingRevocations;
- (void)stopObservingRevocations;
- (void)validateExpirationForBundleIdentifier:(id)a3 withReplyBlock:(id)a4;
@end

@implementation MediaLibraryAccessRevocationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyBlocksForPID, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (id)_storeRequestContextWithIdentity:(id)a3 clientInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)ICStoreRequestContext);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D0948;
  v12[3] = &unk_1001BEB38;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 initWithBlock:v12];

  return v10;
}

- (void)_stopObservingRevocations
{
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  if (self->_isObservingTCCAccessChangedNotification)
  {
    notify_cancel(self->_tccAccessChangedNotificationToken);
    self->_tccAccessChangedNotificationToken = 0;
    self->_isObservingTCCAccessChangedNotification = 0;
    identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates;
    self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = 0;
  }
}

- (void)_startObservingRevocations
{
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  if (!self->_isObservingTCCAccessChangedNotification)
  {
    objc_initWeak(&location, self);
    v3 = dispatch_get_global_queue(0, 0);
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_1000D0BB0;
    id v8 = &unk_1001BD128;
    objc_copyWeak(&v9, &location);
    uint32_t v4 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccAccessChangedNotificationToken, v3, &v5);

    self->_isObservingTCCAccessChangedNotification = v4 == 0;
    if (!v4) {
      [(MediaLibraryAccessRevocationController *)self _checkForRecentRevocations];
    }
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_registerFailureToRevokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to revoke Music User Tokens for applications %{public}@ with error %{public}@.", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_registerFailureToRevokeMusicUserTokensForApplicationIdentifier:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to revoke Music User Tokens for application %{public}@ with error %{public}@.", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_storeRequestContextWithIdentity:(id)a3 applicationIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc((Class)ICStoreRequestContext);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D0EE0;
  v12[3] = &unk_1001BEB38;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 initWithBlock:v12];

  return v10;
}

- (void)_revokeMusicUserTokensForApplicationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = +[ICUserIdentity activeAccount];
  id v6 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v4;
    __int16 v19 = 2114;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Revoking Music User Tokens for applications %{public}@ using identity %{public}@.", buf, 0x16u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[MediaLibraryAccessRevocationController _revokeMusicUserTokensForApplicationWithIdentifier:andUserIdentity:withCompletion:](self, "_revokeMusicUserTokensForApplicationWithIdentifier:andUserIdentity:withCompletion:", _NSConcreteStackBlock, 3221225472, sub_1000D1204, &unk_1001BF198, self, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_revokeMusicUserTokensForApplicationWithIdentifier:(id)a3 andUserIdentity:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = self;
    __int16 v25 = 2114;
    id v26 = v8;
    __int16 v27 = 2114;
    id v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Revoking music kit user tokens for application '%{public}@' and user identity %{public}@", buf, 0x20u);
  }

  long long v12 = [(MediaLibraryAccessRevocationController *)self _storeRequestContextWithIdentity:v9 applicationIdentifier:v8];
  long long v13 = +[ICURLBagProvider sharedBagProvider];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000D145C;
  v18[3] = &unk_1001BD100;
  v18[4] = self;
  id v19 = v8;
  id v21 = v9;
  id v22 = v10;
  id v20 = v12;
  id v14 = v9;
  id v15 = v12;
  id v16 = v10;
  id v17 = v8;
  [v13 getBagForRequestContext:v15 withCompletionHandler:v18];
}

- (void)_displayNotificationForBuilder:(id)a3 withReplyBlock:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = (__CFUserNotification *)[a3 createCFUserNotification];
  if (v6)
  {
    id v7 = v6;
    CFOptionFlags responseFlags = 0;
    SInt32 v8 = CFUserNotificationReceiveResponse(v6, 0.0, &responseFlags);
    CFRelease(v7);
    if (v8)
    {
      id v9 = +[NSError errorWithDomain:ICErrorDomain code:v8 userInfo:0];
      v5[2](v5, 0, v9);
    }
    else
    {
      ((void (**)(id, BOOL, void *))v5)[2](v5, responseFlags == 0, 0);
    }
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create a CFUserNotification to renew media library access for TCC expiration", buf, 2u);
    }

    v5[2](v5, 0, 0);
  }
}

- (void)_checkForRecentRevocations
{
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_accessQueue);
  v3 = +[ICDefaults standardDefaults];
  id v4 = v3;
  if (!self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates)
  {
    id v5 = [v3 mediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates];
    identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates;
    self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = v5;
  }
  id v7 = [(id)objc_opt_class() _identifiersOfApplicationsWithGrantedAccessToMediaLibrary];
  if (self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates)
  {
    id v8 = objc_alloc((Class)NSSet);
    id v9 = [(NSDictionary *)self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates allKeys];
    id v10 = [v8 initWithArray:v9];

    if ([v10 isEqualToSet:v7])
    {

      id v11 = 0;
      goto LABEL_18;
    }
    __int16 v25 = v4;
    id v12 = [v10 mutableCopy];
    [v12 minusSet:v7];
    id v11 = [v12 copy];
  }
  else
  {
    __int16 v25 = v4;
    id v11 = 0;
  }
  long long v13 = +[NSDate date];
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v24 = v7;
  id v15 = v7;
  id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates, "objectForKey:", v20, v24);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        if (!v21) {
          id v21 = v13;
        }
        [v14 setObject:v21 forKey:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  id v22 = (NSDictionary *)[v14 copy];
  v23 = self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates;
  self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates = v22;

  id v4 = v25;
  [v25 setMediaLibraryAccessApplicationIdentifiersWithTCCAcceptanceDates:self->_identifiersOfApplicationsWithGrantedAccessToMediaLibraryIncludingTCCAcceptanceDates];

  id v7 = v24;
LABEL_18:
  if (objc_msgSend(v11, "count", v24)) {
    [(MediaLibraryAccessRevocationController *)self _revokeMusicUserTokensForApplicationsWithIdentifiers:v11];
  }
}

- (id)_identifiersOfApplicationsWithExpiredAccessToMediaLibrary
{
  id v17 = kTCCInfoBundle;
  id v2 = kTCCInfoExpiredAt;
  v3 = (void *)TCCExpirationCopyInformationForService();
  id v16 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "objectForKeyedSubscript:", v2, v16);
        id v11 = +[NSDate date];
        id v12 = [v10 earlierDate:v11];

        if (v12 == v10)
        {
          long long v13 = [v9 objectForKeyedSubscript:v17];

          id v14 = CFBundleGetIdentifier((CFBundleRef)v13);
          [v16 addObject:v14];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v16;
}

- (void)revokeMusicKitUserTokensForUserIdentity:(id)a3 withCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D1F3C;
  v7[3] = &unk_1001BD0D8;
  id v8 = a4;
  id v6 = v8;
  [(MediaLibraryAccessRevocationController *)self _revokeMusicUserTokensForApplicationWithIdentifier:0 andUserIdentity:a3 withCompletion:v7];
}

- (void)validateExpirationForBundleIdentifier:(id)a3 withReplyBlock:(id)a4
{
  id v33 = a3;
  id v5 = a4;
  v31 = +[NSXPCConnection currentConnection];
  id v6 = [(MediaLibraryAccessRevocationController *)self _identifiersOfApplicationsWithExpiredAccessToMediaLibrary];
  if ([v6 containsObject:v33])
  {
    v30 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
    if ([v30 containsObject:kTCCServiceMediaLibrary])
    {
      uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "SDK");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Can not present dialog for renewing applications, parental controls active", buf, 2u);
      }

      (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    }
    else
    {
      unsigned int v8 = [v31 processIdentifier];
      *(void *)buf = 0;
      v48 = buf;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      accessQueue = self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000D2564;
      block[3] = &unk_1001BD060;
      unsigned int v28 = v8;
      unsigned int v46 = v8;
      block[4] = self;
      v45 = buf;
      id v44 = v5;
      dispatch_barrier_sync(accessQueue, block);
      if (v48[24])
      {
        id v29 = objc_alloc_init((Class)ICUserNotificationBuilder);
        if ([v6 count] == (id)1)
        {
          id v10 = +[NSBundle mediaPlayerBundle];
          id v11 = [v10 localizedStringForKey:@"TCC_EXPIRATION_SINGLE_APP_TITLE" value:&stru_1001BF9F0 table:@"MediaPlayer"];

          id v12 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v33 allowPlaceholder:0 error:0];
          long long v13 = [v12 localizedName];

          id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13);
          [v29 setTitle:v14];
        }
        else
        {
          id v15 = +[NSBundle mediaPlayerBundle];
          id v16 = [v15 localizedStringForKey:@"TCC_EXPIRATION_MULTIPLE_APPS_TITLE" value:&stru_1001BF9F0 table:@"MediaPlayer"];
          [v29 setTitle:v16];

          id v11 = +[NSMutableArray array];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v17 = v6;
          id v18 = [v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v40;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(void *)v40 != v19) {
                  objc_enumerationMutation(v17);
                }
                id v21 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:*(void *)(*((void *)&v39 + 1) + 8 * i) allowPlaceholder:0 error:0];
                id v22 = [v21 localizedName];

                if (v22) {
                  [v11 addObject:v22];
                }
              }
              id v18 = [v17 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v18);
          }

          long long v13 = [v11 componentsJoinedByString:@"\n"];
          [v29 setMessage:v13];
        }

        v23 = +[NSBundle mediaPlayerBundle];
        v24 = [v23 localizedStringForKey:@"TCC_EXPIRATION_ACCEPT_BUTTON_TITLE" value:&stru_1001BF9F0 table:@"MediaPlayer"];
        [v29 setDefaultButtonTitle:v24];

        __int16 v25 = +[NSBundle mediaPlayerBundle];
        long long v26 = [v25 localizedStringForKey:@"TCC_EXPIRATION_REJECT_BUTTON_TITLE" value:&stru_1001BF9F0 table:@"MediaPlayer"];
        [v29 setAlternateButtonTitle:v26];

        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000D2658;
        v34[3] = &unk_1001BD4B8;
        v34[4] = self;
        id v35 = v29;
        id v36 = v6;
        id v37 = v33;
        unsigned int v38 = v28;
        id v27 = v29;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v34);
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v5 + 2))(v5, 1, 0);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 1024;
    unsigned int v17 = v6;
    __int16 v18 = 2114;
    CFStringRef v19 = @"com.apple.itunescloudd.tcchelper";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ connection from pid %i beginning for service %{public}@.", buf, 0x1Cu);
  }

  unsigned int v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICMediaLibraryAccessPermissionsHelper];
  [v5 setExportedInterface:v8];
  [v5 setExportedObject:self];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000D2DA8;
  v12[3] = &unk_1001BEE28;
  void v12[4] = self;
  unsigned int v13 = v6;
  [v5 setInterruptionHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000D2E80;
  v10[3] = &unk_1001BEE28;
  v10[4] = self;
  unsigned int v11 = v6;
  [v5 setInvalidationHandler:v10];
  [v5 resume];

  return 1;
}

- (void)stopObservingRevocations
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D2FCC;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)startObservingRevocations
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D3048;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_barrier_async(accessQueue, block);
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D30E8;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_barrier_sync(accessQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)MediaLibraryAccessRevocationController;
  [(MediaLibraryAccessRevocationController *)&v4 dealloc];
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)MediaLibraryAccessRevocationController;
  id v2 = [(MediaLibraryAccessRevocationController *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.MediaLibraryAccessRevocationController.accessQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    id v5 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.itunescloudd.tcchelper"];
    listener = v2->_listener;
    v2->_listener = v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    uint64_t v7 = +[NSMutableDictionary dictionary];
    replyBlocksForPID = v2->_replyBlocksForPID;
    v2->_replyBlocksForPID = (NSMutableDictionary *)v7;
  }
  return v2;
}

+ (id)_identifiersOfApplicationsWithGrantedAccessToMediaLibrary
{
  id v20 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = (id)TCCAccessCopyInformation();
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          id v8 = v7;
          id v9 = (__CFBundle *)[v8 objectForKey:kTCCInfoBundle];
          objc_super v10 = v9;
          if (v9)
          {
            CFTypeID v11 = CFGetTypeID(v9);
            if (v11 != CFBundleGetTypeID()) {
              objc_super v10 = 0;
            }
          }
          CFBooleanRef v12 = (const __CFBoolean *)[v8 objectForKey:kTCCInfoGranted];
          if (v12)
          {
            CFBooleanRef v13 = v12;
            CFTypeID v14 = CFGetTypeID(v12);
            CFTypeID TypeID = CFBooleanGetTypeID();
            if (v10)
            {
              if (v14 == TypeID)
              {
                id v16 = [(__CFString *)(id)CFBundleGetIdentifier(v10) copy];
                int Value = CFBooleanGetValue(v13);
                if (v16 && Value) {
                  [v20 addObject:v16];
                }
              }
            }
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  id v18 = [v20 copy];

  return v18;
}

+ (MediaLibraryAccessRevocationController)sharedController
{
  if (qword_1001F3968 != -1) {
    dispatch_once(&qword_1001F3968, &stru_1001BD038);
  }
  id v2 = (void *)qword_1001F3960;

  return (MediaLibraryAccessRevocationController *)v2;
}

@end