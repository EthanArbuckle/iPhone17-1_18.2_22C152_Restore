@interface MRNotificationServiceClient
- (BOOL)_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport;
- (MRNotificationServiceClient)initWithServiceClient:(id)a3;
- (void)_handleActiveApplicationDidChangeNotification:(id)a3;
- (void)_handleActiveGroupSessionInfoDidChangeNotification:(id)a3;
- (void)_handleActiveOriginDidChangeNotification:(id)a3;
- (void)_handleActivePlayerDidChangeNotification:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleApplicationClientStateDidChangeNotification:(id)a3;
- (void)_handleApplicationDidForegroundNotification:(id)a3;
- (void)_handleApplicationDidRegisterNotification:(id)a3;
- (void)_handleApplicationDidUnregisterNotification:(id)a3;
- (void)_handleApplicationDisplayNameDidChangeNotification:(id)a3;
- (void)_handleDeviceInfoDidChangeNotification:(id)a3;
- (void)_handleLocalGroupSessionEligibilityDidChangeNotification:(id)a3;
- (void)_handleLocalUserIdentityDidChangeNotification:(id)a3;
- (void)_handleOriginDidRegisterNotification:(id)a3;
- (void)_handleOriginDidUnregisterNotification:(id)a3;
- (void)_handlePlayerContentItemArtworkDidChangeNotification:(id)a3;
- (void)_handlePlayerContentItemsDidChangeNotification:(id)a3;
- (void)_handlePlayerDidRegisterNotification:(id)a3;
- (void)_handlePlayerDidUnregisterNotification:(id)a3;
- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3;
- (void)_handlePlayerNowPlayingInfoDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3;
- (void)_handlePlayerPlaybackStateDidChangeNotification:(id)a3;
- (void)_handlePlayerStateDidChangeNotification:(id)a3;
- (void)_handlePlayerSupportedCommandsDidChangeNotification:(id)a3;
- (void)_handleVolumeControlCapabilitiesDidChangeNotification:(id)a3;
- (void)_handleVolumeDidChangeNotification:(id)a3;
- (void)_maybePostPlaybackQueueNowPlayingItemChangedNotificationFromPlaybackQueueChangedNotification:(id)a3;
- (void)_notificationFired:(id)a3 clientNotification:(id)a4 originNotification:(id)a5 nowPlayingNotification:(id)a6;
- (void)_notificationFired:(id)a3 originNotification:(id)a4 nowPlayingNotification:(id)a5;
- (void)_notificationFired:(id)a3 playerPathNotifcation:(id)a4 originNotification:(id)a5 nowPlayingNotification:(id)a6;
- (void)_postDefaultAppilicationNotifications:(id)a3;
- (void)_postDefaultOriginNotifications:(id)a3;
- (void)_postDefaultPlayerNotificationsWithUserInfo:(id)a3 object:(id)a4;
- (void)_processActiveApplicationInvalidationHandlersForNotification:(id)a3;
- (void)_processActiveOriginInvalidationHandlersForNotification:(id)a3;
- (void)_processActivePlayerInvalidationHandlersForNotification:(id)a3;
- (void)_processApplicationInvalidationHandlersForNotification:(id)a3;
- (void)_processOriginInvalidationHandlersForNotification:(id)a3;
- (void)_processPlayerInvalidationHandlersForNotification:(id)a3;
- (void)registerCallbacks;
@end

@implementation MRNotificationServiceClient

- (void)_handleApplicationDidRegisterNotification:(id)a3
{
  serviceClient = self->_serviceClient;
  id v8 = a3;
  v5 = [(MRMediaRemoteServiceClient *)serviceClient notificationClient];
  v6 = [v8 userInfo];
  v7 = [v8 object];
  [v5 postNotification:@"kMRMediaRemoteNowPlayingApplicationDidRegister" userInfo:v6 object:v7];

  [(MRNotificationServiceClient *)self _processApplicationInvalidationHandlersForNotification:v8];
}

- (void)_handleApplicationClientStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  MRGetPlayerPathFromUserInfo(v5, v6);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v9 = [v8 BOOLValue];

  v10 = +[MRNowPlayingOriginClientManager sharedManager];
  v11 = [v10 existingClientRequestsForPlayerPath:v17];

  v12 = [v17 client];
  [v11 setClientProperties:v12];

  if (v9) {
    v13 = 0;
  }
  else {
    v13 = @"kMRMediaRemoteApplicationClientStateDidChange";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v4 clientNotification:v13 originNotification:@"kMRMediaRemoteOriginNowPlayingApplicationClientStateDidChange" nowPlayingNotification:@"kMRMediaRemoteNowPlayingApplicationClientStateDidChange"];
  v14 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  v15 = [v4 userInfo];
  v16 = [v4 object];

  [v14 postNotification:@"_MRMediaRemoteApplicationDisplayNameDidChangeNotification" userInfo:v15 object:v16];
}

- (void)_postDefaultPlayerNotificationsWithUserInfo:(id)a3 object:(id)a4
{
  id v6 = a4;
  id v13 = (id)[a3 mutableCopy];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  [v13 setObject:v7 forKeyedSubscript:@"_MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey"];
  id v8 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  [v8 postNotification:@"_MRMediaRemotePlayerPlaybackStateDidChangeNotification" userInfo:v13 object:v6];

  int v9 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  [v9 postNotification:@"_MRMediaRemotePlayerIsPlayingDidChangeNotification" userInfo:v13 object:v6];

  v10 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  [v10 postNotification:@"_kMRNowPlayingPlaybackQueueChangedNotification" userInfo:v13 object:v6];

  v11 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  [v11 postNotification:@"_MRMediaRemotePlayerSupportedCommandsDidChangeNotification" userInfo:v13 object:v6];

  v12 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  [v12 postNotification:@"_MRMediaRemotePlayerStateDidChange" userInfo:v13 object:v6];
}

- (void)_handlePlayerPlaybackQueueDidChangeNotification:(id)a3
{
  id v23 = a3;
  id v4 = [v23 userInfo];
  id v6 = MRGetPlayerPathFromUserInfo(v4, v5);

  if ([v6 isLocal])
  {
    int v7 = 1;
  }
  else
  {
    id v8 = [v23 userInfo];
    int v9 = [v8 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
    int v7 = [v9 BOOLValue];
  }
  v10 = [v23 userInfo];
  v11 = [v10 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
  int v12 = [v11 BOOLValue];

  id v13 = +[MRNowPlayingOriginClientManager sharedManager];
  v14 = [v13 existingPlayerClientRequestsForPlayerPath:v6];

  if (v14)
  {
    v15 = [v14 subscriptionController];
    [v15 invalidate];

    v16 = objc_msgSend(v23, "mr_playbackQueue");
    [v14 setPlaybackQueue:v16];
  }
  if (v7) {
    id v17 = 0;
  }
  else {
    id v17 = @"kMRPlayerPlaybackQueueChangedNotification";
  }
  if (v12) {
    v18 = 0;
  }
  else {
    v18 = @"kMROriginNowPlayingPlaybackQueueChangedNotification";
  }
  if (v12) {
    v19 = 0;
  }
  else {
    v19 = @"kMRNowPlayingPlaybackQueueChangedNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v23 playerPathNotifcation:v17 originNotification:v18 nowPlayingNotification:v19];
  [(MRNotificationServiceClient *)self _maybePostPlaybackQueueNowPlayingItemChangedNotificationFromPlaybackQueueChangedNotification:v23];
  v20 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  v21 = [v23 userInfo];
  v22 = [v23 object];
  [v20 postNotification:@"_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification" userInfo:v21 object:v22];
}

- (void)_handlePlayerPlaybackStateDidChangeNotification:(id)a3
{
  id v22 = a3;
  v5 = [v22 userInfo];
  int v7 = MRGetPlayerPathFromUserInfo(v5, v6);

  id v8 = [v22 userInfo];
  int v9 = [v8 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v10 = [v9 BOOLValue];

  v11 = [v22 userInfo];
  int v12 = [v11 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
  int v13 = [v12 BOOLValue];

  v14 = [v22 userInfo];
  v15 = [v14 objectForKeyedSubscript:@"kMRMediaRemotePlaybackStateUserInfoKey"];

  if (!v15)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MRNotificationServiceClient.m", 602, @"playbackState UserInfoKey not present in notification %@", v22 object file lineNumber description];
  }
  v16 = +[MRNowPlayingOriginClientManager sharedManager];
  id v17 = [v16 existingPlayerClientRequestsForPlayerPath:v7];

  objc_msgSend(v17, "setPlaybackState:", objc_msgSend(v15, "intValue"));
  if (v10) {
    v18 = 0;
  }
  else {
    v18 = @"_kMRMediaRemotePlayerPlaybackStateDidChangeNotification";
  }
  if (v13) {
    v19 = 0;
  }
  else {
    v19 = @"kMRMediaRemoteOriginNowPlayingApplicationPlaybackStateDidChangeNotification";
  }
  if (v13) {
    v20 = 0;
  }
  else {
    v20 = @"kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v22 playerPathNotifcation:v18 originNotification:v19 nowPlayingNotification:v20];
}

- (void)_handlePlayerSupportedCommandsDidChangeNotification:(id)a3
{
  id v20 = a3;
  id v4 = [v20 userInfo];
  id v6 = MRGetPlayerPathFromUserInfo(v4, v5);

  if ([v6 isLocal])
  {
    int v7 = 1;
  }
  else
  {
    id v8 = [v20 userInfo];
    int v9 = [v8 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
    int v7 = [v9 BOOLValue];
  }
  int v10 = [v20 userInfo];
  v11 = [v10 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
  int v12 = [v11 BOOLValue];

  int v13 = +[MRNowPlayingOriginClientManager sharedManager];
  v14 = [v13 existingPlayerClientRequestsForPlayerPath:v6];

  if (v14)
  {
    v15 = [v20 userInfo];
    v16 = [v15 objectForKeyedSubscript:@"kMRSupportedCommandsUserInfoKey"];
    [v14 setSupportedCommands:v16];
  }
  if (v7) {
    id v17 = 0;
  }
  else {
    id v17 = @"kMRMediaRemotePlayerSupportedCommandsDidChangeNotification";
  }
  if (v12) {
    v18 = 0;
  }
  else {
    v18 = @"kMRMediaRemoteOriginSupportedCommandsDidChangeNotification";
  }
  if (v12) {
    v19 = 0;
  }
  else {
    v19 = @"kMRMediaRemoteSupportedCommandsDidChangeNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v20 playerPathNotifcation:v17 originNotification:v18 nowPlayingNotification:v19];
}

- (void)_notificationFired:(id)a3 clientNotification:(id)a4 originNotification:(id)a5 nowPlayingNotification:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v28 = a5;
  id v11 = a6;
  id v12 = a4;
  int v13 = [v10 userInfo];
  v14 = [v13 objectForKey:@"kMRNowPlayingPlayerPathUserInfoKey"];
  v15 = (void *)[v14 copy];

  [v15 setPlayer:0];
  v16 = [v13 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];
  id v17 = (void *)[v16 copy];

  [v17 setPlayer:0];
  v18 = [v13 objectForKey:@"kMROriginActiveNowPlayingPlayerPathUserInfoKey"];
  v19 = (void *)[v18 copy];

  [v19 setPlayer:0];
  id v20 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  v21 = [v10 object];
  [v20 postNotification:v12 userInfo:v13 object:v21];

  if (([v15 isEqual:v19] & 1) != 0
    || [(MRNotificationServiceClient *)self _shouldPostNotifications])
  {
    id v22 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v23 = [v10 object];
    [v22 postNotification:v28 userInfo:v13 object:v23];
  }
  if (([v15 isEqual:v17] & 1) != 0
    || [(MRNotificationServiceClient *)self _shouldPostNotifications])
  {
    v24 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    v25 = [v10 object];
    int v26 = [v24 postNotification:v11 userInfo:v13 object:v25];

    if (v26)
    {
      if (MRProcessIsMediaRemoteDaemon())
      {
        v27 = _MRLogForCategory(0);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v30 = v11;
          __int16 v31 = 2114;
          v32 = v15;
          _os_log_impl(&dword_194F3C000, v27, OS_LOG_TYPE_DEFAULT, "Posted Active Now Playing Notification %{public}@ for path %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_notificationFired:(id)a3 playerPathNotifcation:(id)a4 originNotification:(id)a5 nowPlayingNotification:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v25 = a6;
  id v12 = a4;
  int v13 = [v10 userInfo];
  v14 = [v13 objectForKey:@"kMRNowPlayingPlayerPathUserInfoKey"];
  v15 = [v13 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];
  v16 = [v13 objectForKey:@"kMROriginActiveNowPlayingPlayerPathUserInfoKey"];
  id v17 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  v18 = [v10 object];
  [v17 postNotification:v12 userInfo:v13 object:v18];

  if (([v14 isEqual:v16] & 1) != 0
    || [(MRNotificationServiceClient *)self _shouldPostNotifications])
  {
    v19 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v20 = [v10 object];
    [v19 postNotification:v11 userInfo:v13 object:v20];
  }
  if (([v14 isEqual:v15] & 1) != 0
    || [(MRNotificationServiceClient *)self _shouldPostNotifications])
  {
    v21 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v22 = [v10 object];
    int v23 = [v21 postNotification:v25 userInfo:v13 object:v22];

    if (v23)
    {
      if (MRProcessIsMediaRemoteDaemon())
      {
        v24 = _MRLogForCategory(0);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v27 = v25;
          __int16 v28 = 2114;
          v29 = v14;
          _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, "Posted Active Now Playing Notification %{public}@ for path %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (BOOL)_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport
{
  if (_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_onceToken != -1) {
    dispatch_once(&_processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_onceToken, &__block_literal_global_10_3);
  }
  return _processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_allowed;
}

- (void)_maybePostPlaybackQueueNowPlayingItemChangedNotificationFromPlaybackQueueChangedNotification:(id)a3
{
  id v16 = a3;
  id v4 = [v16 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"_MRPlayerPlaybackQueueNowPlayingItemDidChangeUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    int v7 = [v16 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
    int v9 = [v8 BOOLValue];

    id v10 = [v16 userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
    int v12 = [v11 BOOLValue];

    if (v9) {
      int v13 = 0;
    }
    else {
      int v13 = @"MRPlayerPlaybackQueueNowPlayingItemChangedNotification";
    }
    if (v12) {
      v14 = 0;
    }
    else {
      v14 = @"MROriginNowPlayingPlaybackQueueNowPlayingItemChangedNotification";
    }
    if (v12) {
      v15 = 0;
    }
    else {
      v15 = @"MRNowPlayingPlaybackQueueNowPlayingItemChangedNotification";
    }
    [(MRNotificationServiceClient *)self _notificationFired:v16 playerPathNotifcation:v13 originNotification:v14 nowPlayingNotification:v15];
  }
}

- (void)_handleActivePlayerDidChangeNotification:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    int v7 = 0;
  }
  else {
    int v7 = @"kMRMediaRemoteActivePlayerDidChange";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v10 playerPathNotifcation:v7 originNotification:@"kMRMediaRemoteOriginNowPlayingPlayerDidChange" nowPlayingNotification:@"kMRMediaRemoteNowPlayingPlayerDidChange"];
  id v8 = [v10 userInfo];
  int v9 = [v10 object];
  [(MRNotificationServiceClient *)self _postDefaultPlayerNotificationsWithUserInfo:v8 object:v9];

  [(MRNotificationServiceClient *)self _processActivePlayerInvalidationHandlersForNotification:v10];
}

- (void)_handlePlayerDidRegisterNotification:(id)a3
{
  serviceClient = self->_serviceClient;
  id v8 = a3;
  v5 = [(MRMediaRemoteServiceClient *)serviceClient notificationClient];
  int v6 = [v8 userInfo];
  int v7 = [v8 object];
  [v5 postNotification:@"kMRMediaRemoteNowPlayingPlayerDidRegister" userInfo:v6 object:v7];

  [(MRNotificationServiceClient *)self _processPlayerInvalidationHandlersForNotification:v8];
}

- (void)_processApplicationInvalidationHandlersForNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  int v6 = MRGetOriginFromUserInfo(v5);

  int v7 = [v4 userInfo];
  id v8 = MRGetClientFromUserInfo(v7);

  int v9 = [v4 userInfo];

  id v10 = [v9 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];

  serviceClient = self->_serviceClient;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__MRNotificationServiceClient__processApplicationInvalidationHandlersForNotification___block_invoke;
  v15[3] = &unk_1E57D5A80;
  id v16 = v10;
  id v17 = v6;
  id v18 = v8;
  id v12 = v8;
  id v13 = v6;
  id v14 = v10;
  [(MRMediaRemoteServiceClient *)serviceClient processPlayerPathInvalidationHandlersWithBlock:v15];
}

- (void)_processActivePlayerInvalidationHandlersForNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 userInfo];
    int v9 = MRGetOriginFromUserInfo(v8);

    id v10 = [v4 userInfo];
    id v11 = MRGetClientFromUserInfo(v10);

    id v12 = [v4 userInfo];
    id v13 = [v12 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];

    id v14 = [v4 userInfo];
    v15 = [v14 objectForKey:@"kMROriginActiveNowPlayingPlayerPathUserInfoKey"];

    serviceClient = self->_serviceClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__MRNotificationServiceClient__processActivePlayerInvalidationHandlersForNotification___block_invoke;
    v21[3] = &unk_1E57D5A58;
    id v22 = v13;
    id v23 = v9;
    id v24 = v15;
    id v25 = v11;
    id v17 = v11;
    id v18 = v15;
    id v19 = v9;
    id v20 = v13;
    [(MRMediaRemoteServiceClient *)serviceClient processPlayerPathInvalidationHandlersWithBlock:v21];
  }
}

- (void)_processPlayerInvalidationHandlersForNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  int v6 = MRGetOriginFromUserInfo(v5);

  char v7 = [v4 userInfo];
  id v8 = MRGetClientFromUserInfo(v7);

  int v9 = [v4 userInfo];
  id v10 = MRGetPlayerFromUserInfo(v9);

  id v11 = [v4 userInfo];
  id v12 = [v11 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];

  id v13 = [v4 userInfo];

  id v14 = [v13 objectForKey:@"kMROriginActiveNowPlayingPlayerPathUserInfoKey"];

  serviceClient = self->_serviceClient;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__MRNotificationServiceClient__processPlayerInvalidationHandlersForNotification___block_invoke;
  v21[3] = &unk_1E57D5AA8;
  id v22 = v12;
  id v23 = v6;
  id v24 = v14;
  id v25 = v8;
  id v26 = v10;
  id v16 = v10;
  id v17 = v8;
  id v18 = v14;
  id v19 = v6;
  id v20 = v12;
  [(MRMediaRemoteServiceClient *)serviceClient processPlayerPathInvalidationHandlersWithBlock:v21];
}

BOOL __87__MRNotificationServiceClient__processActivePlayerInvalidationHandlersForNotification___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 isResolved])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v3 origin];
    if (!v5)
    {
      v5 = [a1[4] origin];
    }
    if ([a1[5] isEqual:v5])
    {
      int v6 = [v3 client];
      if (!v6)
      {
        int v6 = [a1[6] client];
      }
      char v7 = +[MRNowPlayingOriginClientManager sharedManager];
      id v8 = [v7 existingOriginClientRequestsForPlayerPath:v3];

      int v9 = [v8 deviceInfo];
      [v6 resolvePlaceholdersForDeviceInfo:v9];

      if ([a1[7] isEqual:v6])
      {
        id v10 = [v3 player];
        BOOL v4 = v10 == 0;
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

uint64_t __86__MRNotificationServiceClient__processApplicationInvalidationHandlersForNotification___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 origin];
  if (!v4)
  {
    BOOL v4 = [a1[4] origin];
  }
  if (![a1[5] isEqual:v4]) {
    goto LABEL_6;
  }
  v5 = [v3 client];
  int v6 = +[MRNowPlayingOriginClientManager sharedManager];
  char v7 = [v6 existingOriginClientRequestsForPlayerPath:v3];

  id v8 = [v7 deviceInfo];
  [v5 resolvePlaceholdersForDeviceInfo:v8];

  char v9 = [a1[6] isEqual:v5];
  if (v9) {
    uint64_t v10 = 1;
  }
  else {
LABEL_6:
  }
    uint64_t v10 = 0;

  return v10;
}

uint64_t __81__MRNotificationServiceClient__processPlayerInvalidationHandlersForNotification___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 origin];
  if (!v4)
  {
    BOOL v4 = [a1[4] origin];
  }
  if ([a1[5] isEqual:v4])
  {
    v5 = [v3 client];
    if (!v5)
    {
      v5 = [a1[6] client];
    }
    int v6 = +[MRNowPlayingOriginClientManager sharedManager];
    char v7 = [v6 existingOriginClientRequestsForPlayerPath:v3];

    id v8 = [v7 deviceInfo];
    [v5 resolvePlaceholdersForDeviceInfo:v8];

    if ([a1[7] isEqual:v5])
    {
      char v9 = [v3 player];
      uint64_t v10 = [a1[8] isEqual:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_handleApplicationDisplayNameDidChangeNotification:(id)a3
{
  id v8 = a3;
  BOOL v4 = [v8 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = @"kMRMediaRemoteApplicationDisplayNameDidChangeNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v8 clientNotification:v7 originNotification:@"kMRMediaRemoteOriginNowPlayingApplicationDisplayNameDidChangeNotification" nowPlayingNotification:@"kMRMediaRemoteNowPlayingApplicationDisplayNameDidChangeNotification"];
}

- (void)_handlePlayerStateDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  MRGetPlayerPathFromUserInfo(v5, v6);
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  char v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  LODWORD(v5) = [v8 BOOLValue];

  char v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
  int v11 = [v10 BOOLValue];

  id v12 = +[MRNowPlayingOriginClientManager sharedManager];
  id v13 = [v12 existingPlayerClientRequestsForPlayerPath:v18];

  id v14 = [v18 player];
  [v13 setPlayerProperties:v14];

  if (v5) {
    v15 = 0;
  }
  else {
    v15 = @"kMRMediaRemotePlayerStateDidChange";
  }
  if (v11) {
    id v16 = 0;
  }
  else {
    id v16 = @"kMRMediaRemoteOriginNowPlayingPlayerStateDidChange";
  }
  if (v11) {
    id v17 = 0;
  }
  else {
    id v17 = @"kMRMediaRemoteNowPlayingPlayerStateDidChange";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v4 playerPathNotifcation:v15 originNotification:v16 nowPlayingNotification:v17];
}

void __106__MRNotificationServiceClient__processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport__block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EE66F3A8];
  int v3 = [v2 containsObject:v1];
  _processNeedsNonPlayerPathBasedNotificationsForBackwardCompatabilitySupport_allowed = v3;
  if (v3)
  {
    id v4 = _MRLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "Allowing Process for non-playerPath based notifications", v5, 2u);
    }
  }
}

- (void)_handlePlayerNowPlayingInfoDidChangeNotification:(id)a3
{
  id v8 = a3;
  id v4 = [v8 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = @"kMRMediaRemotePlayerNowPlayingInfoDidChangeNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v8 playerPathNotifcation:v7 originNotification:@"kMRMediaRemoteOriginNowPlayingInfoDidChangeNotification" nowPlayingNotification:@"kMRMediaRemoteNowPlayingInfoDidChangeNotification"];
}

- (MRNotificationServiceClient)initWithServiceClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNotificationServiceClient;
  int v6 = [(MRNotificationServiceClient *)&v9 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    [(MRNotificationServiceClient *)v7 registerCallbacks];
  }

  return v7;
}

- (void)registerCallbacks
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleActiveOriginDidChangeNotification_ name:@"_MRMediaRemoteActiveOriginDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleOriginDidRegisterNotification_ name:@"_MRMediaRemoteOriginDidRegisterNotification" object:0];
  [v3 addObserver:self selector:sel__handleOriginDidUnregisterNotification_ name:@"_MRMediaRemoteOriginDidUnregisterNotification" object:0];
  [v3 addObserver:self selector:sel__handleVolumeControlCapabilitiesDidChangeNotification_ name:@"_MPMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleVolumeDidChangeNotification_ name:@"_MPMediaRemotePickedRouteVolumeDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleDeviceInfoDidChangeNotification_ name:@"_MRDeviceInfoDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleActiveApplicationDidChangeNotification_ name:@"_MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidRegisterNotification_ name:@"_MRMediaRemoteNowPlayingApplicationDidRegister" object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidUnregisterNotification_ name:@"_MRMediaRemoteNowPlayingApplicationDidUnregister" object:0];
  [v3 addObserver:self selector:sel__handleApplicationClientStateDidChangeNotification_ name:@"_MRMediaRemoteApplicationClientStateDidChange" object:0];
  [v3 addObserver:self selector:sel__handleApplicationDisplayNameDidChangeNotification_ name:@"_MRMediaRemoteApplicationDisplayNameDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleApplicationDidForegroundNotification_ name:@"_MRMediaRemoteApplicationDidForegroundNotification" object:0];
  [v3 addObserver:self selector:sel__handleActivePlayerDidChangeNotification_ name:@"_MRMediaRemoteActivePlayerDidChange" object:0];
  [v3 addObserver:self selector:sel__handlePlayerDidRegisterNotification_ name:@"_MRMediaRemoteNowPlayingPlayerDidRegister" object:0];
  [v3 addObserver:self selector:sel__handlePlayerDidUnregisterNotification_ name:@"_MRMediaRemoteNowPlayingPlayerDidUnregister" object:0];
  [v3 addObserver:self selector:sel__handlePlayerPlaybackQueueDidChangeNotification_ name:@"_kMRNowPlayingPlaybackQueueChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerContentItemsDidChangeNotification_ name:@"_MRPlayerPlaybackQueueContentItemsChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerContentItemArtworkDidChangeNotification_ name:@"_MRPlayerPlaybackQueueContentItemArtworkChangedNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerSupportedCommandsDidChangeNotification_ name:@"_MRMediaRemotePlayerSupportedCommandsDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerNowPlayingInfoDidChangeNotification_ name:@"_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerPlaybackStateDidChangeNotification_ name:@"_MRMediaRemotePlayerPlaybackStateDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerIsPlayingDidChangeNotification_ name:@"_MRMediaRemotePlayerIsPlayingDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handlePlayerStateDidChangeNotification_ name:@"_MRMediaRemotePlayerStateDidChange" object:0];
  [v3 addObserver:self selector:sel__handleActiveSystemEndpointDidChangeNotification_ name:@"_kMRMediaRemoteActiveSystemEndpointDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleActiveGroupSessionInfoDidChangeNotification_ name:@"_MRGroupSessionInfoDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleLocalUserIdentityDidChangeNotification_ name:@"_MRUserIdentityDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__handleLocalGroupSessionEligibilityDidChangeNotification_ name:@"_MRGroupSessionEligibilityDidChangeNotification" object:0];
}

- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3
{
  id v26 = a3;
  id v5 = [v26 userInfo];
  char v7 = MRGetPlayerPathFromUserInfo(v5, v6);

  id v8 = [v26 userInfo];
  objc_super v9 = [v8 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v10 = [v9 BOOLValue];

  int v11 = [v26 userInfo];
  id v12 = [v11 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
  int v13 = [v12 BOOLValue];

  id v14 = [v26 userInfo];
  v15 = [v14 objectForKeyedSubscript:@"kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey"];

  if (!v15)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"MRNotificationServiceClient.m", 622, @"IsPlaying UserInfoKey not present in notification %@", v26 object file lineNumber description];
  }
  id v16 = [v26 userInfo];
  id v17 = [v16 objectForKeyedSubscript:@"_MRMediaRemoteOriginLastPlayingTimestampUserInfoKey"];

  if (v17)
  {
    id v18 = +[MRNowPlayingOriginClientManager sharedManager];
    id v19 = [v18 existingOriginClientRequestsForPlayerPath:v7];

    id v20 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v17 doubleValue];
    v21 = objc_msgSend(v20, "initWithTimeIntervalSinceReferenceDate:");
    [v19 setLastPlayingDate:v21];
  }
  if (v10) {
    id v22 = 0;
  }
  else {
    id v22 = @"kMRMediaRemotePlayerIsPlayingDidChangeNotification";
  }
  if (v13) {
    id v23 = 0;
  }
  else {
    id v23 = @"kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification";
  }
  if (v13) {
    id v24 = 0;
  }
  else {
    id v24 = @"kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v26 playerPathNotifcation:v22 originNotification:v23 nowPlayingNotification:v24];
}

- (void)_handlePlayerContentItemsDidChangeNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  char v7 = MRGetPlayerPathFromUserInfo(v5, v6);

  id v8 = +[MRNowPlayingOriginClientManager sharedManager];
  objc_super v9 = [v8 existingPlayerClientRequestsForPlayerPath:v7];

  int v10 = [v4 userInfo];
  int v11 = [v10 objectForKey:@"kMRMediaRemoteUpdatedContentItemsUserInfoKey"];

  [v9 updateContentItems:v11];
  id v26 = v7;
  if ([v7 isLocal]) {
    id v12 = 0;
  }
  else {
    id v12 = @"kMRPlayerPlaybackQueueContentItemsChangedNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v4, v12, @"kMROriginPlaybackQueueContentItemsChangedNotification", @"kMRPlaybackQueueContentItemsChangedNotification", self playerPathNotifcation originNotification nowPlayingNotification];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        CFTypeRef RequestIdentifier = MRContentItemGetRequestIdentifier(v19);
        v21 = [v9 subscriptionController];
        LOBYTE(RequestIdentifier) = [v21 hasRequest:RequestIdentifier];

        if ((RequestIdentifier & 1) == 0) {
          [v13 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  if ([v13 count])
  {
    id v22 = [*(id *)(v25 + 8) notificationClient];
    id v23 = [v4 userInfo];
    id v24 = [v4 object];
    [v22 postNotification:@"_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification" userInfo:v23 object:v24];
  }
}

- (void)_handleLocalGroupSessionEligibilityDidChangeNotification:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"MRGroupSessionEligibilityStatusUserInfoKey"];

  int v6 = +[MRGroupSessionRequestManager sharedManager];
  int v7 = [v6 updateGroupSessionEligibility:v5];

  if (v7)
  {
    id v8 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    objc_super v9 = [v10 userInfo];
    [v8 postNotification:@"MRGroupSessionEligibilityDidChangeNotification" userInfo:v9 object:0];
  }
}

- (void)_handleActiveGroupSessionInfoDidChangeNotification:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:@"MRActiveGroupSessionInfoUserInfoKey"];

  int v7 = +[MRGroupSessionRequestManager sharedManager];
  [v7 updateGroupSessionInfo:v6];

  id v8 = [v4 userInfo];
  objc_super v9 = (void *)[v8 mutableCopy];

  id v10 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  int v11 = [v4 object];

  [v10 postNotification:@"MRActiveGroupSessionInfoDidChangeNotification" userInfo:v9 object:v11];
  id v12 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v14 = @"kMRMediaRemoteActiveEndpointTypeUserInfoKey";
  v15[0] = &unk_1EE66F090;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v12 postNotification:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" userInfo:v13 object:0];
}

- (void)_handleDeviceInfoDidChangeNotification:(id)a3
{
  id v16 = a3;
  id v4 = [v16 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0 && (MRProcessIsMediaRemoteDaemon() & 1) == 0)
  {
    int v7 = [v16 userInfo];
    objc_super v9 = MRGetPlayerPathFromUserInfo(v7, v8);

    id v10 = +[MRNowPlayingOriginClientManager sharedManager];
    int v11 = [v10 existingOriginClientRequestsForPlayerPath:v9];

    id v12 = [v16 userInfo];
    id v14 = MRGetDeviceInfoFromUserInfo(v12, v13);
    [v11 setDeviceInfo:v14];
  }
  if (v6) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = @"kMRDeviceInfoDidChangeNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v16 originNotification:v15 nowPlayingNotification:@"kMRActiveDeviceInfoDidChangeNotification"];
}

- (void)_handlePlayerDidUnregisterNotification:(id)a3
{
  id v25 = a3;
  id v4 = [v25 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"kMRMediaRemotePlaybackStateUserInfoKey"];
  int v6 = [v5 intValue];

  int v7 = [v25 userInfo];
  id v8 = (void *)[v7 mutableCopy];

  [v8 setObject:&unk_1EE66F078 forKeyedSubscript:@"kMRMediaRemotePlaybackStateUserInfoKey"];
  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MRMediaRemoteIsImplicitPlayerNotificationUserInfoKey"];
  if (MRMediaRemotePlaybackStateIsAdvancing(v6))
  {
    objc_super v9 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v10 = MRCreateDecodedUserInfo(v8);
    int v11 = [v25 object];
    [v9 postNotification:@"_MRMediaRemotePlayerPlaybackStateDidChangeNotification" userInfo:v10 object:v11];

    id v12 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v13 = _MRMediaRemotePlayerIsPlayingDidChangeNotification;
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v12 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v13 = _MRMediaRemotePlayerPlaybackStateDidChangeNotification;
  }
  id v14 = *v13;
  uint64_t v15 = MRCreateDecodedUserInfo(v8);
  id v16 = [v25 object];
  [v12 postNotification:v14 userInfo:v15 object:v16];

LABEL_6:
  uint64_t v17 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v18 = [v25 userInfo];
  id v19 = [v25 object];
  [v17 postNotification:@"kMRMediaRemoteNowPlayingPlayerDidUnregister" userInfo:v18 object:v19];

  [(MRNotificationServiceClient *)self _processPlayerInvalidationHandlersForNotification:v25];
  id v20 = [v25 userInfo];
  id v22 = MRGetPlayerPathFromUserInfo(v20, v21);

  id v23 = +[MRNowPlayingOriginClientManager sharedManager];
  id v24 = [v23 existingClientRequestsForPlayerPath:v22];

  [v24 removePlayer:v22];
}

- (void)_handleVolumeDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  MRGetPlayerPathFromUserInfo(v5, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  int v7 = +[MRNowPlayingOriginClientManager sharedManager];
  id v8 = [v7 existingOriginClientRequestsForPlayerPath:v14];

  objc_super v9 = [v4 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"kMRMediaRemotePickedRouteVolumeUserInfoKey"];
  [v8 setVolume:v10];

  int v11 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v12 = [v4 userInfo];
  id v13 = [v4 object];

  [v11 postNotification:@"kMRMediaRemotePickedRouteVolumeDidChangeNotification" userInfo:v12 object:v13];
}

- (void)_handleLocalUserIdentityDidChangeNotification:(id)a3
{
  id v3 = [a3 userInfo];
  id v6 = [v3 objectForKeyedSubscript:@"_MRUserIdentityDataUserInfoKey"];

  id v4 = [[MRUserIdentity alloc] initWithProtobufData:v6];
  id v5 = +[MRGroupSessionRequestManager sharedManager];
  [v5 updateLocalIdentity:v4];
}

- (void)_processActiveOriginInvalidationHandlersForNotification:(id)a3
{
}

BOOL __87__MRNotificationServiceClient__processActiveOriginInvalidationHandlersForNotification___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 origin];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_processActiveApplicationInvalidationHandlersForNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  char v7 = [v6 BOOLValue];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 userInfo];
    objc_super v9 = MRGetOriginFromUserInfo(v8);

    id v10 = [v4 userInfo];
    int v11 = [v10 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];

    serviceClient = self->_serviceClient;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __92__MRNotificationServiceClient__processActiveApplicationInvalidationHandlersForNotification___block_invoke;
    v15[3] = &unk_1E57D5A30;
    id v16 = v11;
    id v17 = v9;
    id v13 = v9;
    id v14 = v11;
    [(MRMediaRemoteServiceClient *)serviceClient processPlayerPathInvalidationHandlersWithBlock:v15];
  }
}

BOOL __92__MRNotificationServiceClient__processActiveApplicationInvalidationHandlersForNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isResolved])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 origin];
    if (!v5)
    {
      id v5 = [*(id *)(a1 + 32) origin];
    }
    if ([*(id *)(a1 + 40) isEqual:v5])
    {
      id v6 = [v3 client];
      if (v6)
      {
        char v7 = [v3 client];
        id v8 = [v7 bundleIdentifier];
        if (v8)
        {
          BOOL v4 = 0;
        }
        else
        {
          objc_super v9 = [v3 client];
          BOOL v4 = [v9 processIdentifier] == 0;
        }
      }
      else
      {
        BOOL v4 = 1;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)_processOriginInvalidationHandlersForNotification:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v5 = MRGetOriginFromUserInfo(v4);

  serviceClient = self->_serviceClient;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__MRNotificationServiceClient__processOriginInvalidationHandlersForNotification___block_invoke;
  v8[3] = &unk_1E57D5360;
  id v9 = v5;
  id v7 = v5;
  [(MRMediaRemoteServiceClient *)serviceClient processPlayerPathInvalidationHandlersWithBlock:v8];
}

uint64_t __81__MRNotificationServiceClient__processOriginInvalidationHandlersForNotification___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 origin];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (void)_postDefaultAppilicationNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v10 = (id)[v5 mutableCopy];

  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  id v6 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v7 = [v4 object];
  [v6 postNotification:@"_MRMediaRemoteApplicationClientStateDidChange" userInfo:v10 object:v7];

  id v8 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v9 = [v4 object];

  [v8 postNotification:@"_MRMediaRemoteActivePlayerDidChange" userInfo:v10 object:v9];
}

- (void)_postDefaultOriginNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v10 = (id)[v5 mutableCopy];

  [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  id v6 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v7 = [v4 object];
  [v6 postNotification:@"_MRDeviceInfoDidChangeNotification" userInfo:v10 object:v7];

  id v8 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v9 = [v4 object];

  [v8 postNotification:@"_MRMediaRemoteOriginNowPlayingApplicationDidChangeNotification" userInfo:v10 object:v9];
}

- (void)_notificationFired:(id)a3 originNotification:(id)a4 nowPlayingNotification:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [v8 userInfo];
  id v12 = [v11 objectForKey:@"kMRNowPlayingPlayerPathUserInfoKey"];
  id v13 = [v11 objectForKey:@"kMRActiveNowPlayingPlayerPathUserInfoKey"];
  id v14 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  uint64_t v15 = [v8 object];
  [v14 postNotification:v10 userInfo:v11 object:v15];

  id v16 = [v12 origin];
  id v17 = [v13 origin];
  if (([v16 isEqual:v17] & 1) != 0
    || [(MRNotificationServiceClient *)self _shouldPostNotifications])
  {
    id v18 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    id v19 = [v8 object];
    int v20 = [v18 postNotification:v9 userInfo:v11 object:v19];

    if (v20)
    {
      if (MRProcessIsMediaRemoteDaemon())
      {
        v21 = _MRLogForCategory(0);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138543618;
          id v23 = v9;
          __int16 v24 = 2114;
          id v25 = v12;
          _os_log_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEFAULT, "Posted Active Now Playing Notification %{public}@ for path %{public}@", (uint8_t *)&v22, 0x16u);
        }
      }
    }
  }
}

- (void)_handleActiveOriginDidChangeNotification:(id)a3
{
  serviceClient = self->_serviceClient;
  id v8 = a3;
  id v5 = [(MRMediaRemoteServiceClient *)serviceClient notificationClient];
  id v6 = [v8 userInfo];
  id v7 = [v8 object];
  [v5 postNotification:@"kMRMediaRemoteActiveOriginDidChangeNotification" userInfo:v6 object:v7];

  [(MRNotificationServiceClient *)self _postDefaultOriginNotifications:v8];
  [(MRNotificationServiceClient *)self _processActiveOriginInvalidationHandlersForNotification:v8];
}

- (void)_handleOriginDidRegisterNotification:(id)a3
{
  serviceClient = self->_serviceClient;
  id v11 = a3;
  id v5 = [(MRMediaRemoteServiceClient *)serviceClient notificationClient];
  id v6 = [v11 userInfo];
  id v7 = [v11 object];
  [v5 postNotification:@"kMRMediaRemoteOriginDidRegisterNotification" userInfo:v6 object:v7];

  id v8 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v9 = [v11 userInfo];
  id v10 = [v11 object];
  [v8 postNotification:@"kMRMediaRemoteAvailableOriginsDidChangeNotification" userInfo:v9 object:v10];

  [(MRNotificationServiceClient *)self _processOriginInvalidationHandlersForNotification:v11];
}

- (void)_handleOriginDidUnregisterNotification:(id)a3
{
  serviceClient = self->_serviceClient;
  id v5 = a3;
  id v6 = [(MRMediaRemoteServiceClient *)serviceClient notificationClient];
  id v7 = [v5 userInfo];
  id v8 = [v5 object];
  [v6 postNotification:@"kMRMediaRemoteOriginDidUnregisterNotification" userInfo:v7 object:v8];

  id v9 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v10 = [v5 userInfo];
  id v11 = [v5 object];
  [v9 postNotification:@"kMRMediaRemoteAvailableOriginsDidChangeNotification" userInfo:v10 object:v11];

  [(MRNotificationServiceClient *)self _processOriginInvalidationHandlersForNotification:v5];
  id v12 = [v5 userInfo];

  MRGetOriginFromUserInfo(v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v13 = +[MRNowPlayingOriginClientManager sharedManager];
  [v13 removeOriginRequests:v14];
}

- (void)_handleActiveApplicationDidChangeNotification:(id)a3
{
  id v4 = a3;
  [(MRNotificationServiceClient *)self _notificationFired:v4 originNotification:@"kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification" nowPlayingNotification:@"kMRMediaRemoteNowPlayingApplicationDidChangeNotification"];
  [(MRNotificationServiceClient *)self _postDefaultAppilicationNotifications:v4];
  [(MRNotificationServiceClient *)self _processActiveApplicationInvalidationHandlersForNotification:v4];
}

- (void)_handleApplicationDidUnregisterNotification:(id)a3
{
  id v30 = a3;
  id v4 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v5 = [v30 userInfo];
  id v6 = [v30 object];
  [v4 postNotification:@"kMRMediaRemoteNowPlayingApplicationDidUnregister" userInfo:v5 object:v6];

  [(MRNotificationServiceClient *)self _processApplicationInvalidationHandlersForNotification:v30];
  id v7 = [v30 userInfo];
  id v9 = MRGetPlayerPathFromUserInfo(v7, v8);

  id v10 = +[MRNowPlayingOriginClientManager sharedManager];
  id v11 = [v10 existingOriginClientRequestsForPlayerPath:v9];

  [v11 removeClient:v9];
  id v12 = [v30 userInfo];
  id v13 = [v12 objectForKeyedSubscript:@"_MRMediaRemoteApplicationHasSupportedCommandsUserInfoKey"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    uint64_t v15 = [v30 userInfo];
    id v16 = (void *)[v15 mutableCopy];

    id v18 = MRGetPlayerPathFromUserInfo(v16, v17);
    id v19 = (void *)[v18 copy];

    int v20 = [MRPlayerPath alloc];
    v21 = [v19 origin];
    int v22 = [MRClient alloc];
    id v23 = [v19 client];
    __int16 v24 = [v23 bundleIdentifier];
    id v25 = [(MRClient *)v22 initWithBundleIdentifier:v24];
    uint64_t v26 = [(MRPlayerPath *)v20 initWithOrigin:v21 client:v25 player:0];
    MRAddPlayerPathToUserInfo(v16, v26);

    long long v27 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
    long long v28 = MRCreateDecodedUserInfo(v16);
    long long v29 = [v30 object];
    [v27 postNotification:@"_MRMediaRemotePlayerSupportedCommandsDidChangeNotification" userInfo:v28 object:v29];
  }
}

- (void)_handleApplicationDidForegroundNotification:(id)a3
{
  id v8 = a3;
  id v4 = [v8 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"_MRMediaRemoteIsImplicitNowPlayingNotificationUserInfoKey"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = @"kMRMediaRemoteApplicationDidForeground";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v8 clientNotification:v7 originNotification:@"kMRMediaRemoteOriginNowPlayingApplicationDidForegroundNotification" nowPlayingNotification:@"kMRMediaRemoteNowPlayingApplicationDidForegroundNotification"];
}

- (void)_handlePlayerContentItemArtworkDidChangeNotification:(id)a3
{
  id v16 = a3;
  id v4 = [v16 userInfo];
  int v6 = MRGetPlayerPathFromUserInfo(v4, v5);

  id v7 = +[MRNowPlayingOriginClientManager sharedManager];
  id v8 = [v7 existingPlayerClientRequestsForPlayerPath:v6];

  if (v8)
  {
    id v9 = [v16 userInfo];
    id v11 = MRGetContentItemsFromUserInfo(v9, v10);

    [v8 updateContentItemArtwork:v11];
  }
  if ([v6 isLocal]) {
    id v12 = 0;
  }
  else {
    id v12 = @"kMRPlayerPlaybackQueueContentItemArtworkChangedNotification";
  }
  [(MRNotificationServiceClient *)self _notificationFired:v16 playerPathNotifcation:v12 originNotification:@"kMROriginPlaybackQueueContentItemArtworkChangedNotification" nowPlayingNotification:@"kMRPlaybackQueueContentItemArtworkChangedNotification"];
  id v13 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  int v14 = [v16 userInfo];
  uint64_t v15 = [v16 object];
  [v13 postNotification:@"_MRMediaRemotePlayerNowPlayingInfoDidChangeNotification" userInfo:v14 object:v15];
}

- (void)_handleVolumeControlCapabilitiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  MRGetPlayerPathFromUserInfo(v5, v6);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = +[MRNowPlayingOriginClientManager sharedManager];
  id v8 = [v7 existingOriginClientRequestsForPlayerPath:v14];

  id v9 = [v4 userInfo];
  id v10 = [v9 objectForKeyedSubscript:@"kMRMediaRemotePickedRouteVolumeControlCapabilitiesUserInfoKey"];
  [v8 setVolumeCapabilities:v10];

  id v11 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v12 = [v4 userInfo];
  id v13 = [v4 object];

  [v11 postNotification:@"kMRMediaRemotePickedRouteVolumeControlAvailabilityDidChangeNotification" userInfo:v12 object:v13];
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:@"kMRAVEndpointOutputDeviceIdentifierUserInfoKey"];

  id v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"kMRMediaRemoteActiveEndpointTypeUserInfoKey"];
  unint64_t v9 = (int)[v8 intValue];

  id v10 = +[MRNowPlayingOriginClientManager sharedManager];
  [v10 updateActiveSystemEndpointOutputDeviceUID:v6 forType:v9];

  id v11 = [v4 userInfo];
  id v12 = [v11 objectForKeyedSubscript:@"_MRMediaRemoteIsRestoringClientStateUserInfoKey"];
  int v13 = [v12 BOOLValue];

  if (v13)
  {
    id v14 = _MRLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(v9);
      int v19 = 138412546;
      int v20 = active;
      __int16 v21 = 2112;
      int v22 = v6;
      _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "Restoring %@SystemEndpoint with UID=%@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v16 = [(MRMediaRemoteServiceClient *)self->_serviceClient notificationClient];
  id v17 = [v4 userInfo];
  id v18 = [v4 object];
  [v16 postNotification:@"kMRMediaRemoteActiveSystemEndpointDidChangeNotification" userInfo:v17 object:v18];
}

- (void).cxx_destruct
{
}

@end