@interface CloudPushNotificationController
- (AMSPushHandler)amsPushHandler;
- (APSConnection)connection;
- (BOOL)_isSupportedJaliscoMediaKind:(id)a3;
- (BOOL)sagaEnabledOnDevice;
- (CloudPushNotificationController)initWithAccountManager:(id)a3;
- (CloudUserNotificationControllerProtocol)userNotificationController;
- (ICDAccountManaging)accountManager;
- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer;
- (ICPlaybackPositionService)playbackPositionServer;
- (NSString)pushEnvironment;
- (id)_supportedJaliscoMediaKinds;
- (id)_supportedJaliscoMediaKindsWithSagaEnabled;
- (void)_activeConfigurationsWithCompletion:(id)a3;
- (void)_createAPNSConnectionWithCompletion:(id)a3;
- (void)_handleITunesStorePushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleInAppMessagesUpdatedPushMessage:(id)a3;
- (void)_handleJaliscoPushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleSagaPushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleStoreBookkeeperPushMessage:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_registerAPNSToken:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5;
- (void)_registerMediaKinds:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5;
- (void)_updatePushNotificationsRegistration;
- (void)_updateRegistrationForConfiguration:(id)a3 completion:(id)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4;
- (void)setAccountManager:(id)a3;
- (void)setAmsPushHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setMediaUserStateCenterServer:(id)a3;
- (void)setPlaybackPositionServer:(id)a3;
- (void)setPushEnvironment:(id)a3;
- (void)setSagaEnabledOnDevice:(BOOL)a3;
- (void)setUserNotificationController:(id)a3;
@end

@implementation CloudPushNotificationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsPushHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
  objc_destroyWeak((id *)&self->_accountManager);
  objc_destroyWeak((id *)&self->_userNotificationController);
  objc_destroyWeak((id *)&self->_playbackPositionServer);
  objc_destroyWeak((id *)&self->_mediaUserStateCenterServer);
  objc_storeStrong((id *)&self->_currentRegistrationState, 0);
  objc_storeStrong((id *)&self->_currentAPNSToken, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setAmsPushHandler:(id)a3
{
}

- (AMSPushHandler)amsPushHandler
{
  return self->_amsPushHandler;
}

- (void)setConnection:(id)a3
{
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setPushEnvironment:(id)a3
{
}

- (NSString)pushEnvironment
{
  return self->_pushEnvironment;
}

- (void)setSagaEnabledOnDevice:(BOOL)a3
{
  self->_sagaEnabledOnDevice = a3;
}

- (BOOL)sagaEnabledOnDevice
{
  return self->_sagaEnabledOnDevice;
}

- (void)setAccountManager:(id)a3
{
}

- (ICDAccountManaging)accountManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountManager);

  return (ICDAccountManaging *)WeakRetained;
}

- (void)setUserNotificationController:(id)a3
{
}

- (CloudUserNotificationControllerProtocol)userNotificationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userNotificationController);

  return (CloudUserNotificationControllerProtocol *)WeakRetained;
}

- (void)setPlaybackPositionServer:(id)a3
{
}

- (ICPlaybackPositionService)playbackPositionServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackPositionServer);

  return (ICPlaybackPositionService *)WeakRetained;
}

- (void)setMediaUserStateCenterServer:(id)a3
{
}

- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaUserStateCenterServer);

  return (ICMediaUserStateCenterServerProtocol *)WeakRetained;
}

- (void)pushPayload:(id)a3 withBadgeRequest:(id)a4
{
  id v5 = a4;
  v6 = [(CloudPushNotificationController *)self userNotificationController];
  if (!v6)
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      v10 = "Received a badge request but no user notification center to badge.";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v7 = [v5 badgeIdentifier];
  unsigned int v8 = [v7 isEqualToString:@"appIcon"];

  if (!v8)
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = 0;
      v10 = "Received a badge request with an unrecognized badgeIdentifier.";
      v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  [v6 badgeAppWithRequest:v5];
LABEL_10:
}

- (id)_supportedJaliscoMediaKindsWithSagaEnabled
{
  if (qword_1001F3A30 != -1) {
    dispatch_once(&qword_1001F3A30, &stru_1001BE200);
  }
  v2 = (void *)qword_1001F3A28;

  return v2;
}

- (id)_supportedJaliscoMediaKinds
{
  if (qword_1001F3A20 != -1) {
    dispatch_once(&qword_1001F3A20, &stru_1001BE1E0);
  }
  v2 = (void *)qword_1001F3A18;

  return v2;
}

- (BOOL)_isSupportedJaliscoMediaKind:(id)a3
{
  id v4 = a3;
  id v5 = [(CloudPushNotificationController *)self _supportedJaliscoMediaKinds];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_handleInAppMessagesUpdatedPushMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 apsPayload];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    unint64_t v7 = (int)objc_msgSend(v5, "ic_intValueForKey:", @"payloadVersion");
    if (v7 >= 2)
    {
      if (v7 == 2)
      {
        v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v15 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Received inApp messages push - syncing now", buf, 0xCu);
        }

        unsigned int v8 = +[ICInAppMessageManager sharedManager];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1000FC604;
        v13[3] = &unk_1001BE408;
        v13[4] = self;
        [v8 syncMessagesWithCompletion:v13];
      }
      else
      {
        unsigned int v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = [v4 userInfo];
          *(_DWORD *)buf = 138543618;
          v15 = self;
          __int16 v16 = 2114;
          v17 = v9;
          v10 = "%{public}@Received unsupported in-app sync payload version - ignoring push %{public}@";
          goto LABEL_14;
        }
      }
    }
    else
    {
      unsigned int v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v4 userInfo];
        *(_DWORD *)buf = 138543618;
        v15 = self;
        __int16 v16 = 2114;
        v17 = v9;
        v10 = "%{public}@Received legacy banner sync payload version - ignoring push %{public}@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 0x16u);
      }
    }
  }
  else
  {
    unsigned int v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 userInfo];
      *(_DWORD *)buf = 138543618;
      v15 = self;
      __int16 v16 = 2114;
      v17 = v9;
      v10 = "%{public}@ No aps payload - ignoring push %{public}@";
      goto LABEL_14;
    }
  }
}

- (void)_handleStoreBookkeeperPushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void *))a4;
  unsigned int v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 userInfo];
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ _handleStoreBookkeeperPushMessage: %{private}@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackPositionServer);
  v11 = WeakRetained;
  if (WeakRetained
    && [WeakRetained conformsToProtocol:&OBJC_PROTOCOL___ICPlaybackPositionService])
  {
    __int16 v12 = [v6 userInfo];
    __int16 v13 = [v12 objectForKeyedSubscript:@"3"];

    v14 = [v6 userInfo];
    v15 = [v14 objectForKeyedSubscript:@"1"];

    if (!v13 || !v15)
    {
      v25 = os_log_create("com.apple.amp.itunescloudd", "Push");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v6;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@ Received invalid Playback Position message %{public}@", buf, 0x16u);
      }

      v24 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:0];
      goto LABEL_34;
    }
    __int16 v16 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 accountDSID]);
    id v17 = +[ICUserIdentity specificAccountWithDSID:v16];

    if (v17)
    {
      if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
      {
        id v18 = +[ICUserIdentity activeAccount];
        if (v17 == v18)
        {
        }
        else
        {
          v19 = v18;
          unsigned __int8 v20 = [v17 isEqual:v18];

          if ((v20 & 1) == 0)
          {
            v21 = sub_1000EFD7C();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 accountDSID]);
              *(_DWORD *)buf = 138543619;
              *(void *)&uint8_t buf[4] = self;
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@ _handleStoreBookkeeperPushMessage: Ignoring update for non-active dsid=%{private}@", buf, 0x16u);
            }
            uint64_t v23 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:0];
LABEL_21:
            v24 = (void *)v23;
LABEL_33:

LABEL_34:
            goto LABEL_35;
          }
        }
      }
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x2050000000;
      v28 = (void *)qword_1001F3A38;
      uint64_t v36 = qword_1001F3A38;
      if (!qword_1001F3A38)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1000FCCBC;
        v38 = &unk_1001BE9E8;
        v39 = &v33;
        sub_1000FCCBC((uint64_t)buf);
        v28 = (void *)v34[3];
      }
      id v29 = v28;
      _Block_object_dispose(&v33, 8);
      v30 = objc_msgSend(v29, "musicLibraryForUserAccount:", v17, v33);
      if (v30)
      {
        if (![v13 intValue])
        {
          v31 = [v30 libraryUID];
          [v11 synchronizePlaybackPositionsForLibraryWithIdentifier:v31 forDomain:v15 isCheckpoint:1];
        }
        v24 = 0;
      }
      else
      {
        v32 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v6;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}@ Failed to find user library for message %{public}@", buf, 0x16u);
        }

        v24 = +[NSError errorWithDomain:ICErrorDomain code:0 userInfo:0];
      }

      goto LABEL_33;
    }
    v26 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 accountDSID]);
      *(_DWORD *)buf = 138543619;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}@ _handleStoreBookkeeperPushMessage: Could not find userIdentity with dsid=%{private}@", buf, 0x16u);
    }
    uint64_t v23 = +[NSError errorWithDomain:ICErrorDomain code:-7401 userInfo:0];
    goto LABEL_21;
  }
  v24 = 0;
LABEL_35:
  v7[2](v7, v24);
}

- (void)_handleITunesStorePushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void))a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v9 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v10 = [v9 isMac];

  id v11 = [v6 actionType];
  if (!v10)
  {
    switch((unint64_t)v11)
    {
      case 0xCuLL:
        v24 = os_log_create("com.apple.amp.itunescloudd", "Push");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Lease] - Posting darwin notification for lease end'", buf, 2u);
        }

        CFStringRef v25 = @"com.apple.itunesstored.PlaybackLeaseDidEnd";
        goto LABEL_27;
      case 0xDuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x1AuLL:
        goto LABEL_18;
      case 0xEuLL:
        __int16 v12 = +[ICMusicSubscriptionStatusController sharedStatusController];
        [v12 invalidateCachedSubscriptionStatusWithCompletionHandler:&stru_1001BE178];
        __int16 v13 = +[ICUserIdentity activeAccount];
        v14 = &stru_1001BE198;
        goto LABEL_4;
      case 0xFuLL:
        __int16 v12 = +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener];
        [v12 handleContentTasteChangedNotification];
        goto LABEL_5;
      case 0x14uLL:
        id v26 = [v6 moduleIdentifier];
        if (v26 != (id)1)
        {
          int v28 = (int)v26;
          __int16 v12 = os_log_create("com.apple.amp.itunescloudd", "Push");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v31) = v28;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unknown for-you module identifier %d", buf, 8u);
          }
          goto LABEL_5;
        }
        CFStringRef v25 = (const __CFString *)ICRecentlyPlayedDidChangeNotification;
LABEL_27:
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v25, 0, 0, 1u);
        goto LABEL_13;
      case 0x19uLL:
      case 0x1BuLL:
      case 0x1CuLL:
        [(CloudPushNotificationController *)self _handleInAppMessagesUpdatedPushMessage:v6];
        goto LABEL_13;
      default:
        if (v11 == (id)40)
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaUserStateCenterServer);
          v15 = WeakRetained;
          if (WeakRetained
            && [WeakRetained conformsToProtocol:&OBJC_PROTOCOL___ICMediaUserStateCenterServerProtocol])
          {
            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472;
            v29[2] = sub_1000FD440;
            v29[3] = &unk_1001BE1C0;
            v29[4] = self;
            [v15 refreshSocialProfilesWithReply:v29];
            goto LABEL_12;
          }
          __int16 v16 = os_log_create("com.apple.amp.itunescloudd", "Push");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v31 = self;
            id v17 = "%{public}@ Dropping MusicSocialProfileUpdate push notification. _mediaUserStateCenterServer=nil";
            id v18 = v16;
            uint32_t v19 = 12;
            goto LABEL_10;
          }
        }
        else
        {
LABEL_18:
          v15 = [(CloudPushNotificationController *)self amsPushHandler];
          v21 = [v6 userInfo];
          unsigned int v22 = [v15 shouldHandleNotification:v21];

          if (v22)
          {
            uint64_t v23 = [v6 userInfo];
            [v15 handleNotification:v23];

            goto LABEL_12;
          }
          __int16 v16 = os_log_create("com.apple.amp.itunescloudd", "Push");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v27 = [v6 userInfo];
            *(_DWORD *)buf = 138543618;
            v31 = self;
            __int16 v32 = 2114;
            uint64_t v33 = v27;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Received unsupported store push notification - ignoring. userInfo=%{public}@", buf, 0x16u);
          }
        }
        break;
    }
    goto LABEL_11;
  }
  if (v11 != (id)14)
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      goto LABEL_13;
    }
    __int16 v16 = [v6 userInfo];
    *(_DWORD *)buf = 138543618;
    v31 = self;
    __int16 v32 = 2114;
    uint64_t v33 = v16;
    id v17 = "%{public}@ Received unsupported store push notification - ignoring. userInfo=%{public}@";
    id v18 = v15;
    uint32_t v19 = 22;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_11:

    goto LABEL_12;
  }
  __int16 v12 = +[ICMusicSubscriptionStatusController sharedStatusController];
  [v12 invalidateCachedSubscriptionStatusWithCompletionHandler:&stru_1001BE118];
  __int16 v13 = +[ICUserIdentity activeAccount];
  v14 = &stru_1001BE158;
LABEL_4:
  [v12 getSubscriptionStatusForUserIdentity:v13 bypassingCache:1 withCompletionHandler:v14];

LABEL_5:
LABEL_13:
  v7[2](v7, 0);
}

- (void)_handleJaliscoPushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void))a4;
  id v8 = [v6 accountDSID];
  if (v8)
  {
    v9 = +[NSNumber numberWithLongLong:v8];
    unsigned int v10 = +[ICUserIdentity specificAccountWithDSID:v9];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [v6 userInfo];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v20 = self;
      __int16 v21 = 2114;
      unsigned int v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Received jalisco push notification with no DSID - using active account. userInfo=%{public}@", buf, 0x16u);
    }
    unsigned int v10 = +[ICUserIdentity activeAccount];
  }
  __int16 v13 = +[ICUserIdentityStore defaultIdentityStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FD788;
  v16[3] = &unk_1001BE0D8;
  v16[4] = self;
  id v17 = v6;
  id v18 = v10;
  id v14 = v10;
  id v15 = v6;
  [v13 getPropertiesForUserIdentity:v14 completionHandler:v16];

  v7[2](v7, 0);
}

- (void)_handleSagaPushMessage:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void))a4;
  id v8 = [v6 accountDSID];
  if (v8)
  {
    v9 = +[NSNumber numberWithLongLong:v8];
    unsigned int v10 = +[ICUserIdentity specificAccountWithDSID:v9];
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [v6 userInfo];
      *(_DWORD *)buf = 138543618;
      unsigned __int8 v20 = self;
      __int16 v21 = 2114;
      unsigned int v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Received saga push notification with no DSID - using active account. userInfo=%{public}@", buf, 0x16u);
    }
    unsigned int v10 = +[ICUserIdentity activeAccount];
  }
  __int16 v13 = +[ICUserIdentityStore defaultIdentityStore];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000FDD44;
  v16[3] = &unk_1001BE0D8;
  v16[4] = self;
  id v17 = v6;
  id v18 = v10;
  id v14 = v10;
  id v15 = v6;
  [v13 getPropertiesForUserIdentity:v14 completionHandler:v16];

  v7[2](v7, 0);
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ received accounts changed notification - updating push notifications", (uint8_t *)&v5, 0xCu);
  }

  [(CloudPushNotificationController *)self _updatePushNotificationsRegistration];
}

- (void)_registerMediaKinds:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, void))a5;
  id v11 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v12 = [v11 isMac];

  if (v12)
  {
    v10[2](v10, 0);
  }
  else
  {
    __int16 v13 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unsigned int v22 = self;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering updated media types: %{public}@", buf, 0x16u);
    }

    CFStringRef v19 = @"media-kinds";
    id v20 = v8;
    id v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v15 = objc_alloc((Class)ICPushNotificationsEnableTypesRequest);
    id v16 = [v15 initWithRequestContext:v9 notificationType:ICPushNotificationTypePurchase notificationParameters:v14];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000FE41C;
    v17[3] = &unk_1001BE088;
    v17[4] = self;
    id v18 = v10;
    [v16 performRequestWithResponseHandler:v17];
  }
}

- (void)_registerAPNSToken:(id)a3 usingRequestContext:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering updated push token %{public}@", buf, 0x16u);
  }

  unsigned __int8 v12 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v13 = [v12 isWatch];

  if (v13)
  {
    id v14 = [objc_alloc((Class)ICPushNotificationsRegisterAPNSTokenRequest) initWithRequestContext:v9 token:v8];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FE740;
    v15[3] = &unk_1001BE088;
    v15[4] = self;
    id v16 = v10;
    [v14 performRequestWithResponseHandler:v15];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)_updateRegistrationForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating push registration for configuration %{public}@", buf, 0x16u);
  }

  id v9 = [v6 userIdentityStore];
  id v10 = [v6 userIdentity];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000FEA34;
  v13[3] = &unk_1001BE060;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v9 getPropertiesForUserIdentity:v10 completionHandler:v13];
}

- (void)_createAPNSConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ICStoreRequestContext);
  id v6 = +[ICUserIdentity activeAccount];
  id v7 = [v5 initWithIdentity:v6];

  id v8 = +[ICURLBagProvider sharedBagProvider];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000FF6AC;
  v10[3] = &unk_1001BDFC0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [v8 getBagForRequestContext:v7 withCompletionHandler:v10];
}

- (void)_activeConfigurationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(CloudPushNotificationController *)self accountManager];
  id v6 = [v5 supportedConfigurations];

  if (v6)
  {
    v4[2](v4, v6, 0);
  }
  else
  {
    id v7 = objc_alloc((Class)ICConnectionConfiguration);
    id v8 = +[ICUserIdentity activeAccount];
    id v9 = [v7 initWithUserIdentity:v8];

    id v11 = v9;
    id v10 = +[NSArray arrayWithObjects:&v11 count:1];
    v4[2](v4, v10, 0);
  }
}

- (void)_updatePushNotificationsRegistration
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FFE24;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  id v4 = a3;
  if ([v4 isRemoteServerLikelyReachable]
    && [v4 isCurrentNetworkLinkHighQuality])
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "Push");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Network reachability changed to available - updating push registration if needed", (uint8_t *)&v6, 0xCu);
    }

    [(CloudPushNotificationController *)self _updatePushNotificationsRegistration];
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v9;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received push notification on topic \"%{public}@\": %{public}@", buf, 0x16u);
  }

  id v12 = objc_alloc((Class)ICAsyncBlockOperation);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_1001008B0;
  id v20 = &unk_1001BDF48;
  id v21 = v8;
  unsigned int v22 = self;
  id v23 = v9;
  id v24 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = [v12 initWithStartHandler:&v17];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v17, v18, v19, v20);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = (NSData *)a4;
  int v6 = os_log_create("com.apple.amp.itunescloudd", "Push");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ received new token '%{public}@'", (uint8_t *)&v8, 0x16u);
  }

  currentAPNSToken = self->_currentAPNSToken;
  self->_currentAPNSToken = v5;

  [(CloudPushNotificationController *)self _updatePushNotificationsRegistration];
}

- (void)dealloc
{
  v3 = +[ICEnvironmentMonitor sharedMonitor];
  [v3 unregisterObserver:self];

  id v4 = [(CloudPushNotificationController *)self connection];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)CloudPushNotificationController;
  [(CloudPushNotificationController *)&v5 dealloc];
}

- (CloudPushNotificationController)initWithAccountManager:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CloudPushNotificationController;
  objc_super v5 = [(CloudPushNotificationController *)&v26 init];
  int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accountManager, v4);
    id v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v7;

    [(NSOperationQueue *)v6->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v6->_operationQueue setQualityOfService:17];
    [(NSOperationQueue *)v6->_operationQueue setName:@"com.apple.itunescloudd.NSOperationQueue.CloudPushNotificationController.operationQueue"];
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.itunescloudd.NSOperationQueue.CloudPushNotificationController.updatePushNotificationsOperationSyncQueue", 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    id v11 = [ICDCloudPushNotificationRegistrationState alloc];
    id v12 = +[ICDefaults standardDefaults];
    id v13 = [v12 pushNotificationState];
    id v14 = [(ICDCloudPushNotificationRegistrationState *)v11 initWithDictionaryRepresentation:v13];
    currentRegistrationState = v6->_currentRegistrationState;
    v6->_currentRegistrationState = v14;

    id v16 = +[ICEnvironmentMonitor sharedMonitor];
    [v16 registerObserver:v6];

    id v17 = +[ICEnvironmentMonitor sharedMonitor];
    if ([v17 isRemoteServerLikelyReachable])
    {
      uint64_t v18 = +[ICEnvironmentMonitor sharedMonitor];
      unsigned int v19 = [v18 isCurrentNetworkLinkHighQuality];

      if (v19) {
        [(CloudPushNotificationController *)v6 _updatePushNotificationsRegistration];
      }
    }
    else
    {
    }
    id v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v6 selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

    id v21 = objc_alloc_init((Class)AMSPushConfiguration);
    [v21 setUserNotificationExtensionId:@"music-notification-default"];
    [v21 setEngagementPushTopic:@"com.apple.music.engagement"];
    unsigned int v22 = +[AMSBag bagForProfile:@"Music" profileVersion:@"1"];
    id v23 = (AMSPushHandler *)[objc_alloc((Class)AMSPushHandler) initWithConfiguration:v21 bag:v22];
    amsPushHandler = v6->_amsPushHandler;
    v6->_amsPushHandler = v23;

    [(AMSPushHandler *)v6->_amsPushHandler setDelegate:v6];
  }

  return v6;
}

@end