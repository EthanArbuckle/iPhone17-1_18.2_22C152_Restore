@interface FMFClientSession
+ (id)_decryptPayload:(id)a3 withToken:(id)a4 withSession:(id)a5;
+ (id)sharedHandleTransactionQueue;
+ (void)internalDataForPayload:(id)a3 completion:(id)a4;
- (BOOL)blockingDialogs;
- (FMFClientSession)initWithConnection:(id)a3;
- (NSMutableSet)_handlesInternal;
- (NSNumber)clientPid;
- (NSSet)handles;
- (NSString)_debugContext;
- (NSString)clientBundleId;
- (NSString)description;
- (NSXPCProxyCreating)clientProxy;
- (OS_dispatch_queue)handlesQueue;
- (double)_alertTimeoutInterval;
- (id)_encryptPayload:(id)a3;
- (void)_refreshLocationsForHandles:(id)a3;
- (void)addFavorite:(id)a3 completion:(id)a4;
- (void)addFence:(id)a3 completion:(id)a4;
- (void)addFriendHandles:(id)a3;
- (void)allDevices:(id)a3;
- (void)approveFriendshipRequest:(id)a3 completion:(id)a4;
- (void)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)canOfferToHandles:(id)a3 completion:(id)a4;
- (void)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)contactForPayload:(id)a3 completion:(id)a4;
- (void)crashDaemon;
- (void)dataForPayload:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)declineFriendshipRequest:(id)a3 completion:(id)a4;
- (void)decryptPayload:(id)a3 withToken:(id)a4 completion:(id)a5;
- (void)deleteFence:(id)a3 completion:(id)a4;
- (void)deviceSharingLocation:(id)a3;
- (void)dispayOfferAlertDialogsWithoutRepeatForError:(id)a3;
- (void)dumpStateWithCompletion:(id)a3;
- (void)encryptPayload:(id)a3 completion:(id)a4;
- (void)exit5XXGracePeriod;
- (void)extendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)favoritesForMaxCount:(id)a3 completion:(id)a4;
- (void)fencesForHandles:(id)a3 completion:(id)a4;
- (void)fetchLocationForHandle:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6;
- (void)fetchLocationForHandles:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6;
- (void)forceRefresh;
- (void)forceRefreshWithCompletion:(id)a3;
- (void)getAccountEmailAddress:(id)a3;
- (void)getAllLocations:(id)a3;
- (void)getCurrentTrackedHandles:(id)a3;
- (void)getDataForPerformanceRequest:(id)a3;
- (void)getFavoritesWithCompletion:(id)a3;
- (void)getFences:(id)a3;
- (void)getHandlesSharingLocationsWithMe:(id)a3;
- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4;
- (void)getHandlesSharingMyLocation:(id)a3;
- (void)getHandlesSharingMyLocationWithGroupId:(id)a3 completion:(id)a4;
- (void)getHandlesWithPendingOffers:(id)a3;
- (void)getMaxLocatingInterval:(id)a3;
- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)getPendingFriendshipRequestsWithCompletion:(id)a3;
- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 completion:(id)a5;
- (void)getPrettyNameForHandle:(id)a3 completion:(id)a4;
- (void)getRecordIdForHandle:(id)a3 completion:(id)a4;
- (void)handleAndLocationForPayload:(id)a3 completion:(id)a4;
- (void)iCloudAccountNameWithCompletion:(id)a3;
- (void)importMappingPacket:(id)a3 completion:(id)a4;
- (void)includeDeviceInAutomations:(id)a3;
- (void)invalidateMappingPackets:(id)a3 completion:(id)a4;
- (void)isAllowFriendRequestsEnabled:(id)a3;
- (void)isIn5XXGracePeriodWithCompletion:(id)a3;
- (void)isMyLocationEnabled:(id)a3;
- (void)isNetworkReachable:(id)a3;
- (void)locationForHandle:(id)a3 completion:(id)a4;
- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5;
- (void)nearbyLocationsWithCompletion:(id)a3;
- (void)notLoggedIntoiCloudAlert;
- (void)removeAllFriendHandles;
- (void)removeDevice:(id)a3 completion:(id)a4;
- (void)removeFavorite:(id)a3 completion:(id)a4;
- (void)removeFriendHandles:(id)a3;
- (void)sendFMFIDSPacket:(id)a3 toHandle:(id)a4;
- (void)sendFMFIDSPacketsForHandleIdToMappingIdentifiers:(id)a3;
- (void)sendFriendshipInviteToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)sendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)sendIDSMessage:(id)a3 toIdentifier:(id)a4 completion:(id)a5;
- (void)sendNotNowToHandle:(id)a3 callerId:(id)a4 completion:(id)a5;
- (void)sessionHandleReport:(id)a3;
- (void)sessionWasCreatedRefresh;
- (void)setActiveDevice:(id)a3 completion:(id)a4;
- (void)setAllowFriendRequestsEnabled:(BOOL)a3 completion:(id)a4;
- (void)setBlockingDialogs:(BOOL)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientPid:(id)a3;
- (void)setDebugContext:(id)a3;
- (void)setExpiredInitTimestamp;
- (void)setHandlesQueue:(id)a3;
- (void)setHideMyLocationEnabled:(BOOL)a3 completion:(id)a4;
- (void)set_debugContext:(id)a3;
- (void)set_handlesInternal:(id)a3;
- (void)show5XXDuringStartOfferAlert;
- (void)show5XXDuringStopOfferAlert;
- (void)showActiveDeviceChangedAlert;
- (void)showAirDropImportAlertForId:(id)a3;
- (void)showAirDropImportErrorAlert;
- (void)showForbiddenRegionAlert;
- (void)showGenericErrorAlert;
- (void)showLocationServicesSwitchOffAlert;
- (void)showMaxFollowersLimitReachedAlert;
- (void)showMeDeviceAlert;
- (void)showNetworkOfflineDuringOfferAlert;
- (void)showNetworkOfflineDuringStopOfferAlert;
- (void)showRestrictedAlert;
- (void)showShareMyLocationSystemServiceOffAlert;
- (void)showShareMyLocationiCloudSettingsOffAlert;
- (void)showSwitchMeDeviceAlertUsingCurrentMeDeviceName:(id)a3 completion:(id)a4;
- (void)stopSharingMyLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)stopSharingMyLocationWithHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7;
- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8;
- (void)upselliCloudAlert;
- (void)upselliCloudIfNeeded;
@end

@implementation FMFClientSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__debugContext, 0);
  objc_storeStrong((id *)&self->_handlesQueue, 0);
  objc_storeStrong((id *)&self->__handlesInternal, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);

  objc_storeStrong((id *)&self->_clientPid, 0);
}

- (void)dealloc
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "📩 %@: deinit", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FMFClientSession;
  [(ClientSession *)&v4 dealloc];
}

- (NSMutableSet)_handlesInternal
{
  return self->__handlesInternal;
}

- (void)removeAllFriendHandles
{
  v3 = [(FMFClientSession *)self handlesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003FC0;
  block[3] = &unk_1000A14E8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)handlesQueue
{
  return self->_handlesQueue;
}

- (void)deviceSharingLocation:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100007618;
  v25 = sub_1000075D0;
  v5 = +[FMFAccountManager sharedInstance];
  if ([v5 hasCredentials])
  {
    v6 = 0;
  }
  else
  {
    v6 = +[NSError errorWithDomain:FMFErrorDomain code:1000 userInfo:0];
  }
  id v26 = v6;

  if (v22[5])
  {
    v7 = sub_100005560();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Device sharing location called, but account is not yet initialized or there's no account.", buf, 0xCu);
    }
  }
  v8 = +[FMFCommandManager sharedInstance];
  unsigned __int8 v9 = [v8 hasModelInitialized];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100004A48;
  v17[3] = &unk_1000A2088;
  v19 = &v21;
  v17[4] = self;
  id v10 = v4;
  id v18 = v10;
  unsigned __int8 v20 = v9;
  v11 = objc_retainBlock(v17);
  v12 = v11;
  if (v22[5]) {
    char v13 = 1;
  }
  else {
    char v13 = v9;
  }
  if (v13)
  {
    ((void (*)(void *))v11[2])(v11);
  }
  else
  {
    v14 = +[FMFCommandManager sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001D3C4;
    v15[3] = &unk_1000A20B0;
    v15[4] = self;
    id v16 = v12;
    [v14 refreshForSession:self withReason:11 withCompletion:v15];
  }
  _Block_object_dispose(&v21, 8);
}

- (NSXPCProxyCreating)clientProxy
{
  v4.receiver = self;
  v4.super_class = (Class)FMFClientSession;
  v2 = [(ClientSession *)&v4 clientProxy];

  return (NSXPCProxyCreating *)v2;
}

- (void)sessionWasCreatedRefresh
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    char v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: sessionWasCreatedRefresh", (uint8_t *)&v12, 0xCu);
  }

  objc_super v4 = +[FMFCommandManager sharedInstance];
  unsigned int v5 = [v4 hasModelInitialized];

  int v6 = _os_feature_enabled_impl();
  v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    char v13 = self;
    __int16 v14 = 1024;
    int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: networkScalingImprovementsFeatureEnabled: %i", (uint8_t *)&v12, 0x12u);
  }

  if ((v6 & v5) == 1)
  {
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      char v13 = self;
      unsigned __int8 v9 = "%@: Skipping init and refresh due to model already being initialized";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    id v10 = +[FMFCommandManager sharedInstance];
    unsigned __int8 v11 = [v10 sendInitWithLazyCheckForSession:self withReason:14 completion:&stru_1000A2060];

    if (v11) {
      return;
    }
    v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      char v13 = self;
      unsigned __int8 v9 = "%@: Skipping init and refresh due to lazy init controller preventing init";
      goto LABEL_11;
    }
  }
}

- (FMFClientSession)initWithConnection:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FMFClientSession;
  v3 = [(ClientSession *)&v8 initWithConnection:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("FMFClientSession-HandlesQueue", 0);
    [(FMFClientSession *)v3 setHandlesQueue:v4];

    id v5 = objc_alloc_init((Class)NSMutableSet);
    [(FMFClientSession *)v3 set_handlesInternal:v5];

    int v6 = sub_100005560();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "📩 %@: init", buf, 0xCu);
    }
  }
  return v3;
}

- (void)set_handlesInternal:(id)a3
{
}

- (void)setHandlesQueue:(id)a3
{
}

- (void)setClientPid:(id)a3
{
}

- (void)setClientBundleId:(id)a3
{
}

+ (id)sharedHandleTransactionQueue
{
  if (qword_1000BB738 != -1) {
    dispatch_once(&qword_1000BB738, &stru_1000A1F28);
  }
  v2 = (void *)qword_1000BB730;

  return v2;
}

- (NSString)description
{
  v3 = [(ClientSession *)self connection];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = getpid();
  if ([v3 processIdentifier])
  {
    int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> {pid = %d, cpid = %d}", v4, self, v5, [v3 processIdentifier]);
  }
  else
  {
    v7 = [(FMFClientSession *)self clientPid];
    int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p> {pid = %d, cpid = %d}", v4, self, v5, [v7 intValue]);
  }

  return (NSString *)v6;
}

- (void)invalidateMappingPackets:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[FMFCommandManager sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A270;
  v9[3] = &unk_1000A1950;
  id v10 = v5;
  id v8 = v5;
  [v7 invalidateMappingPackets:v6 completion:v9];
}

- (void)importMappingPacket:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[FMFCommandManager sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A364;
  v11[3] = &unk_1000A1F50;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 importMappingPacket:v10 forSession:self completion:v11];
}

- (void)upselliCloudIfNeeded
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v10 = [v3 objectForKey:@"lastAlertDate"];

  [(FMFClientSession *)self _alertTimeoutInterval];
  double v5 = -v4;
  id v6 = +[NSDate date];
  id v7 = [v6 dateByAddingTimeInterval:v5];

  if (!v10 || [v10 compare:v7] == (id)-1)
  {
    +[FMFDUserNotification upselliCloudAlert];
    id v8 = +[NSUserDefaults standardUserDefaults];
    id v9 = +[NSDate date];
    [v8 setObject:v9 forKey:@"lastAlertDate"];
  }
}

- (double)_alertTimeoutInterval
{
  v2 = +[FMFDataManager sharedInstance];
  [v2 upsellTimeoutInSeconds];
  double v4 = v3;

  double result = 604800.0;
  if (v4 > 0.0) {
    return v4;
  }
  return result;
}

- (NSSet)handles
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100007618;
  unsigned __int8 v11 = sub_1000075D0;
  id v12 = 0;
  double v3 = [(FMFClientSession *)self handlesQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001A7B8;
  v6[3] = &unk_1000A1F78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (void)addFriendHandles:(id)a3
{
  id v4 = a3;
  double v5 = +[FMFClientSession sharedHandleTransactionQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A8D4;
  v7[3] = &unk_1000A1468;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeFriendHandles:(id)a3
{
  id v4 = a3;
  double v5 = [(FMFClientSession *)self handlesQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001AD70;
  v7[3] = &unk_1000A1468;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setDebugContext:(id)a3
{
}

- (void)getCurrentTrackedHandles:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(FMFClientSession *)self handlesQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AF38;
  block[3] = &unk_1000A1FA0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)sendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = +[NSSet setWithObject:a3];
  [(FMFClientSession *)self sendFriendshipOfferToHandles:v16 groupId:v15 callerId:v14 endDate:v13 completion:v12];
}

- (void)sendFriendshipOfferToHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = +[FMFFriendshipRequest friendshipRequestToHandles:a3 fromHandle:v13 withType:0 groupId:a4 withEndDate:a6];
  id v15 = +[FMFCommandManager sharedInstance];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001B1A8;
  v17[3] = &unk_1000A1FC8;
  v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 sendFriendshipOfferRequest:v14 forSession:self callerId:v13 completion:v17];
}

- (void)dispayOfferAlertDialogsWithoutRepeatForError:(id)a3
{
  id v4 = a3;
  if (![(FMFClientSession *)self blockingDialogs])
  {
    [(FMFClientSession *)self setBlockingDialogs:1];
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001B308;
    v6[3] = &unk_1000A1468;
    id v7 = v4;
    id v8 = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)extendFriendshipOfferToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = +[NSSet setWithObject:a3];
  v17 = +[FMFFriendshipRequest friendshipRequestToHandles:v16 fromHandle:v14 withType:0 groupId:v15 withEndDate:v13];

  id v18 = +[FMFCommandManager sharedInstance];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001B590;
  v20[3] = &unk_1000A1FC8;
  v20[4] = self;
  id v21 = v12;
  id v19 = v12;
  [v18 extendFriendshipOfferRequest:v17 forSession:self callerId:v14 completion:v20];
}

- (void)sendFriendshipInviteToHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = +[NSSet setWithObject:a3];
  v17 = +[FMFFriendshipRequest friendshipRequestToHandles:v16 fromHandle:v14 withType:1 groupId:v15 withEndDate:v13];

  id v18 = +[FMFCommandManager sharedInstance];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001B764;
  v20[3] = &unk_1000A1FC8;
  v20[4] = self;
  id v21 = v12;
  id v19 = v12;
  [v18 sendFriendshipInviteRequest:v17 forSession:self callerId:v14 completion:v20];
}

- (void)sendNotNowToHandle:(id)a3 callerId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = +[NSSet setWithObject:v8];
  id v12 = +[FMFNotNowRequest notNowRequestToHandles:v11 fromHandle:v9];
  id v13 = sub_100005560();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v8 identifier];
    id v15 = [v9 identifier];
    *(_DWORD *)buf = 138412802;
    id v21 = self;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "📩 %@: sending NotNow request (%@,%@)...", buf, 0x20u);
  }
  id v16 = +[FMFCommandManager sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001B9CC;
  v18[3] = &unk_1000A1FC8;
  v18[4] = self;
  id v19 = v10;
  id v17 = v10;
  [v16 sendNotNowRequest:v12 forSession:self callerId:v9 completion:v18];
}

- (void)approveFriendshipRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FMFCommandManager sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BB9C;
  v10[3] = &unk_1000A1950;
  id v11 = v6;
  id v9 = v6;
  [v8 approveFriendshipRequest:v7 forSession:self completion:v10];
}

- (void)declineFriendshipRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FMFCommandManager sharedInstance];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001BC80;
  v10[3] = &unk_1000A1950;
  id v11 = v6;
  id v9 = v6;
  [v8 declineFriendshipRequest:v7 forSession:self completion:v10];
}

- (void)stopSharingMyLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[FMFCommandManager sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001BDC0;
  v19[3] = &unk_1000A2018;
  id v23 = v12;
  id v24 = v13;
  id v20 = v10;
  id v21 = self;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  [v14 refreshForSession:0 withReason:3 withCompletion:v19];
}

- (void)stopSharingMyLocationWithHandles:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[FMFCommandManager sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001C0F4;
  v19[3] = &unk_1000A2040;
  id v20 = v10;
  id v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 refreshForSession:0 withReason:3 withCompletion:v19];
}

- (void)getPendingFriendshipRequestsWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[FMFDataManager sharedInstance];
  [v4 getPendingFriendshipRequestsWithCompletion:v3];
}

- (void)getOfferExpirationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v15 = a4;
  id v8 = (void (**)(id, void *, void))a6;
  id v9 = a3;
  id v10 = +[FMFDataManager sharedInstance];
  id v11 = [v9 identifier];

  id v12 = [v10 followerHandleForIdentifier:v11];

  if (v12)
  {
    id v13 = +[FMFDataManager sharedInstance];
    id v14 = [v13 offerExpireDateForHandle:v12 withGroupId:v15];

    v8[2](v8, v14, 0);
  }
  else
  {
    id v14 = +[NSError errorWithDomain:FMFErrorDomain code:102 userInfo:0];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v14);
  }
}

- (void)getHandlesWithPendingOffers:(id)a3
{
  id v3 = a3;
  id v4 = +[FMFDataManager sharedInstance];
  [v4 getHandlesWithPendingOffers:v3];
}

- (void)fetchLocationForHandle:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v10)
  {
    id v13 = +[FMFCommandManager sharedInstance];
    id v14 = [objc_alloc((Class)NSSet) initWithObjects:v10];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001C6A8;
    v18[3] = &unk_1000A1950;
    id v19 = v12;
    [v13 fetchLocationForHandles:v14 forSession:self callerId:v11 priority:a5 completionBlock:v18];

    id v15 = v19;
  }
  else
  {
    uint64_t v16 = FMFErrorDomain;
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"No handle was passed";
    id v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v17 = +[NSError errorWithDomain:v16 code:101 userInfo:v15];
    (*((void (**)(id, void *, void))v12 + 2))(v12, v17, 0);
  }
}

- (void)fetchLocationForHandles:(id)a3 callerId:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 count])
  {
    id v13 = +[FMFCommandManager sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001C878;
    v17[3] = &unk_1000A1950;
    id v18 = v12;
    [v13 fetchLocationForHandles:v10 forSession:self callerId:v11 priority:a5 completionBlock:v17];

    id v14 = v18;
LABEL_5:

    goto LABEL_6;
  }
  if (v12)
  {
    uint64_t v15 = FMFErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"No handle was passed";
    id v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v16 = +[NSError errorWithDomain:v15 code:101 userInfo:v14];
    (*((void (**)(id, void *, void))v12 + 2))(v12, v16, 0);

    goto LABEL_5;
  }
LABEL_6:
}

- (void)locationForHandle:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  id v6 = +[FMFDataManager sharedInstance];
  id v7 = [v6 locationForHandle:v5];

  if (v8) {
    (*((void (**)(id, void *, void, void))v8 + 2))(v8, v7, 0, 0);
  }
}

- (void)getHandlesSharingLocationsWithMe:(id)a3
{
  id v3 = a3;
  id v4 = +[FMFDataManager sharedInstance];
  [v4 getHandlesSharingLocationsWithMe:v3];
}

- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMFDataManager sharedInstance];
  [v7 getHandlesSharingLocationsWithMeWithGroupId:v6 completion:v5];
}

- (void)getHandlesSharingMyLocation:(id)a3
{
  id v3 = a3;
  id v4 = +[FMFDataManager sharedInstance];
  [v4 getHandlesSharingMyLocation:v3];
}

- (void)getHandlesSharingMyLocationWithGroupId:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMFDataManager sharedInstance];
  [v7 getHandlesSharingMyLocationWithGroupId:v6 completion:v5];
}

- (void)canGetLocationForHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v14 = a4;
  id v8 = a6;
  id v9 = a3;
  id v10 = +[FMFDataManager sharedInstance];
  id v11 = [v9 identifier];

  id v12 = [v10 followingHandleForIdentifier:v11];

  if (v12)
  {
    if (v14) {
      uint64_t v13 = (uint64_t)[v12 isSharingThroughGroupId:v14];
    }
    else {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, v13, 0, 0);
}

- (void)canShareLocationWithHandle:(id)a3 groupId:(id)a4 callerId:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a6;
  id v10 = +[FMFDataManager sharedInstance];
  id v11 = [v15 identifier];
  id v12 = [v10 followerHandleForIdentifier:v11];

  if (v12 && (!v8 || ([v12 isSharingThroughGroupId:v8] & 1) != 0))
  {
    uint64_t v13 = 1;
  }
  else
  {
    id v14 = +[FMFDataManager sharedInstance];
    uint64_t v13 = (uint64_t)[v14 hasPendingOfferToHandle:v15 withGroupId:v8];
  }
  (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, v13, 0, 0);
}

- (void)setHideMyLocationEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[FMFCommandManager sharedInstance];
  [v7 setHideMyLocationEnabled:v4 forSession:self completion:v6];
}

- (void)isMyLocationEnabled:(id)a3
{
  id v4 = a3;
  id v5 = +[FMFDataManager sharedInstance];
  (*((void (**)(id, void, void))a3 + 2))(v4, [v5 locationHidden] ^ 1, 0);
}

- (void)setAllowFriendRequestsEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = +[FMFCommandManager sharedInstance];
  [v7 setAllowFriendRequestsEnabled:v4 forSession:self completion:v6];
}

- (void)isAllowFriendRequestsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = +[FMFDataManager sharedInstance];
  (*((void (**)(id, id, void))a3 + 2))(v4, [v5 isAllowFriendRequestsEnabled], 0);
}

- (void)getAccountEmailAddress:(id)a3
{
  id v4 = a3;
  id v6 = +[FMFDataManager sharedInstance];
  id v5 = [v6 getAccountEmailAddress];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
}

- (void)getAllLocations:(id)a3
{
  id v3 = a3;
  id v4 = +[FMFCommandManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001D048;
  v6[3] = &unk_1000A1950;
  id v7 = v3;
  id v5 = v3;
  [v4 refreshForSession:0 withReason:3 withCompletion:v6];
}

- (void)forceRefresh
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001D158;
  v2[3] = &unk_1000A1708;
  v2[4] = self;
  [(FMFClientSession *)self forceRefreshWithCompletion:v2];
}

- (void)forceRefreshWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Force refreshing", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[FMFCommandManager sharedInstance];
  [v6 refreshForSession:self withReason:1 withCompletion:v4];
}

- (void)setExpiredInitTimestamp
{
  id v2 = +[FMFLazyInitController sharedInstance];
  [v2 expireInitTimestamp];
}

- (void)getPendingMappingPacketsForHandle:(id)a3 groupId:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[FMFCommandManager sharedInstance];
  [v11 getPendingMappingPacketsForHandle:v10 groupId:v9 forSession:self completion:v8];
}

- (void)allDevices:(id)a3
{
  id v4 = a3;
  id v6 = +[FMFDataManager sharedInstance];
  id v5 = [v6 allDevices];
  (*((void (**)(id, void *, void))a3 + 2))(v4, v5, 0);
}

- (void)getMaxLocatingInterval:(id)a3
{
  id v4 = a3;
  id v5 = +[FMFDataManager sharedInstance];
  [v5 maxLocatingInterval];
  (*((void (**)(id, void))a3 + 2))(v4, 0);
}

- (void)isNetworkReachable:(id)a3
{
  id v6 = (void (**)(id, id, void *))a3;
  id v3 = +[FMFNetworkObserver sharedInstance];
  id v4 = [v3 isNetworkReachable];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSError errorWithDomain:FMFErrorDomain code:1009 userInfo:0];
  }
  if (v6) {
    v6[2](v6, v4, v5);
  }
}

- (void)canOfferToHandles:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FMFCommandManager sharedInstance];
  [v8 canOfferToHandles:v7 forSession:self completion:v6];
}

- (void)getPrettyNameForHandle:(id)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void *, void))a4;
  id v5 = a3;
  id v6 = +[FMFAddressBook sharedAddressBook];
  id v7 = [v6 prettyNameForHandle:v5];

  if (v8) {
    v8[2](v8, v7, 0);
  }
}

- (void)getRecordIdForHandle:(id)a3 completion:(id)a4
{
  if (a4)
  {
    id v5 = (void (**)(id, id, void))a4;
    id v6 = a3;
    id v7 = +[FMFContactUtility sharedInstance];
    id v8 = [v7 getContactForHandle:v6];

    id v9 = [v8 identifier];

    v5[2](v5, v9, 0);
  }
}

- (void)setActiveDevice:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMFCommandManager sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D940;
  v9[3] = &unk_1000A1950;
  id v10 = v5;
  id v8 = v5;
  [v7 setActiveDevice:v6 forSession:0 completion:v9];
}

- (void)removeDevice:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[FMFCommandManager sharedInstance];
  [v7 removeDevice:v6 forSession:0 completion:v5];
}

- (void)iCloudAccountNameWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[FMFSystemInfo sharedInstance];
  id v5 = [v4 iCloudAccountName];

  v3[2](v3, v5);
}

- (void)crashDaemon
{
  id v3 = +[Daemon sharedInstance];
  unsigned int v4 = [v3 isInternalBuild];

  if (v4)
  {
    id v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: crashDaemon called!", (uint8_t *)&v6, 0xCu);
    }

    exit(1);
  }
}

- (void)exit5XXGracePeriod
{
  id v2 = +[Daemon sharedInstance];
  unsigned int v3 = [v2 isInternalBuild];

  if (v3)
  {
    id v4 = +[FMFCommandManager sharedInstance];
    [v4 exit5XXGracePeriod];
  }
}

- (void)isIn5XXGracePeriodWithCompletion:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  unsigned int v3 = +[FMFCommandManager sharedInstance];
  id v4 = [v3 isIn5XXGracePeriod];

  v5[2](v5, v4);
}

- (void)sendIDSMessage:(id)a3 toIdentifier:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[FMFIDSMessageController sharedInstance];
  id v12 = 0;
  [v10 sendMessage:v9 toIdentifier:v8 error:&v12];

  id v11 = v12;
  if (v7) {
    v7[2](v7, v11);
  }
}

- (void)dumpStateWithCompletion:(id)a3
{
  id v24 = (void (**)(id, void *))a3;
  unsigned int v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "\n################GATHERING STATE INFO FOR CLIENT######################\n", buf, 2u);
  }

  id v23 = +[NSMutableDictionary dictionary];
  id v4 = +[FMFXPCSessionManager sharedInstance];
  id v5 = [v4 clientSessions];

  int v6 = +[NSMutableSet set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v12 = [v11 handles];
        uint64_t v13 = [v12 valueForKey:@"identifier"];
        id v14 = [v13 allObjects];

        id v15 = [v14 componentsJoinedByString:@","];
        uint64_t v16 = [v11 clientPid];
        id v17 = [v11 clientBundleId];
        id v18 = +[NSString stringWithFormat:@"FMFClientSession(0x%lX), clientPid: %@, clientBundleId: %@, handles(%@)", v11, v16, v17, v15];
        [v6 addObject:v18];
      }
      id v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  NSErrorUserInfoKey v19 = [v6 allObjects];
  [v23 setObject:v19 forKeyedSubscript:@"clientSessions"];

  CFStringRef v20 = +[FMFDStoreController sharedInstance];
  CFStringRef v21 = [v20 modelCache];

  [v23 setObject:v21 forKeyedSubscript:@"modelCache"];
  id v22 = sub_100005560();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "\n################SENDING STATE INFO TO CLIENT######################\n", buf, 2u);
  }

  v24[2](v24, v23);
}

- (void)sessionHandleReport:(id)a3
{
  uint64_t v16 = (void (**)(id, void *))a3;
  unsigned int v3 = +[NSMutableDictionary dictionary];
  id v4 = +[FMFXPCSessionManager sharedInstance];
  id v5 = [v4 clientSessions];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v5;
  id v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        uint64_t v9 = [v7 connection];
        id v10 = [v9 processIdentifier];
        id v11 = [v7 clientPid];
        id v12 = [v7 clientBundleId];
        uint64_t v13 = +[NSString stringWithFormat:@"%@: %d – %@, %@", v8, v10, v11, v12];

        id v14 = [v7 handles];
        id v15 = +[NSString stringWithFormat:@"%@", v14];

        [v3 setObject:v15 forKey:v13];
      }
      id v19 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v19);
  }

  if (v16) {
    v16[2](v16, v3);
  }
}

- (void)sendFMFIDSPacketsForHandleIdToMappingIdentifiers:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = +[FMFHandle handleWithId:v9];
        id v11 = [v4 objectForKeyedSubscript:v9];
        [(FMFClientSession *)self sendFMFIDSPacket:v11 toHandle:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)sendFMFIDSPacket:(id)a3 toHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 length])
  {
    uint64_t v8 = +[FMFDataManager sharedInstance];
    unsigned __int8 v9 = [v8 blockFMFChannel];

    if ((v9 & 1) == 0)
    {
      id v10 = sub_100005560();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: sending packet over FMF IDS channel", buf, 0xCu);
      }

      id v11 = +[FMFIDSMessageController sharedInstance];
      [v11 sendMappingPacket:v6 toHandle:v7];
    }
    long long v12 = +[FMFDataManager sharedInstance];
    unsigned __int8 v13 = [v12 sendOnlyFMFChannel];

    if ((v13 & 1) == 0)
    {
      long long v14 = sub_100005560();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@: sending packet back to client", buf, 0xCu);
      }

      long long v15 = +[FMFXPCSessionManager sharedInstance];
      uint64_t v16 = [v15 clientSessions];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          long long v21 = 0;
          do
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            long long v22 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v21) clientProxy:v23];
            [v22 sendMappingPacket:v6 toHandle:v7];

            long long v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          id v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v19);
      }
    }
  }
}

- (void)favoritesForMaxCount:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = +[FMFDataManager sharedInstance];
  uint64_t v8 = [v7 favoritesSequencer];
  unsigned __int8 v9 = [v8 favorites];

  if (v13)
  {
    id v10 = [v9 count];
    if (v10 > [v13 unsignedIntegerValue])
    {
      uint64_t v11 = [v9 subarrayWithRange:0, [v13 unsignedIntegerValue]];

      unsigned __int8 v9 = (void *)v11;
    }
  }
  if ([v9 count])
  {
    long long v12 = +[NSSet setWithArray:v9];
    [(FMFClientSession *)self _refreshLocationsForHandles:v12];
  }
  if (v6) {
    v6[2](v6, v9, 0);
  }
}

- (void)nearbyLocationsWithCompletion:(id)a3
{
  unsigned __int8 v9 = (void (**)(id, void *, void))a3;
  id v4 = +[FMFDataManager sharedInstance];
  id v5 = [v4 followingHandles];

  if ([v5 count]) {
    [(FMFClientSession *)self _refreshLocationsForHandles:v5];
  }
  id v6 = +[FMFDataManager sharedInstance];
  id v7 = [v6 allLocations];

  if ([v7 count])
  {
    uint64_t v8 = +[NSSet setWithArray:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v9) {
    v9[2](v9, v8, 0);
  }
}

- (void)_refreshLocationsForHandles:(id)a3
{
  id v4 = a3;
  id v5 = +[FMFAccountManager sharedInstance];
  id v8 = [v5 account];

  id v6 = [v8 iCloudId];
  id v7 = +[FMFHandle handleWithId:v6];

  [(FMFClientSession *)self fetchLocationForHandles:v4 callerId:v7 priority:0 completion:0];
}

- (void)includeDeviceInAutomations:(id)a3
{
  id v4 = a3;
  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: : includeDeviceInAutomations:", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    id v6 = +[FMFDataManager sharedInstance];
    unsigned int v7 = [v6 isActiveAutoMeDevice];

    id v8 = +[FMFDataManager sharedInstance];
    unsigned __int8 v9 = [v8 deviceSharingLocation];
    unsigned int v10 = [v9 isThisDevice];

    uint64_t v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138413058;
      id v13 = self;
      __int16 v14 = 1024;
      unsigned int v15 = v10;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      __int16 v18 = 1024;
      int v19 = v10 | v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: isMeDevice %i : isActiveAutoMeDevice %i : isDeviceIncludedInAutomations %i", (uint8_t *)&v12, 0x1Eu);
    }

    (*((void (**)(id, void, void))v4 + 2))(v4, v10 | v7, 0);
  }
}

- (void)showActiveDeviceChangedAlert
{
}

- (void)showRestrictedAlert
{
  unsigned int v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: : showRestrictedAlert", (uint8_t *)&v4, 0xCu);
  }

  +[FMFDUserNotification showRestrictedAlert];
}

- (void)showMaxFollowersLimitReachedAlert
{
}

- (void)showLocationServicesSwitchOffAlert
{
}

- (void)showShareMyLocationSystemServiceOffAlert
{
}

- (void)showShareMyLocationiCloudSettingsOffAlert
{
}

- (void)showForbiddenRegionAlert
{
}

- (void)show5XXDuringStartOfferAlert
{
}

- (void)show5XXDuringStopOfferAlert
{
}

- (void)showGenericErrorAlert
{
}

- (void)showMeDeviceAlert
{
  unsigned int v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@: : showMeDeviceAlert", buf, 0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001EC88;
  v4[3] = &unk_1000A20D8;
  v4[4] = self;
  +[FMFDUserNotification showSwitchMeDeviceAlertUsingCurrentMeDeviceName:0 completion:v4];
}

- (void)showSwitchMeDeviceAlertUsingCurrentMeDeviceName:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001EDD8;
  v6[3] = &unk_1000A2100;
  id v7 = a4;
  id v5 = v7;
  +[FMFDUserNotification showSwitchMeDeviceAlertUsingCurrentMeDeviceName:a3 completion:v6];
}

- (void)upselliCloudAlert
{
}

- (void)showNetworkOfflineDuringOfferAlert
{
}

- (void)showNetworkOfflineDuringStopOfferAlert
{
}

- (void)notLoggedIntoiCloudAlert
{
}

- (void)showAirDropImportAlertForId:(id)a3
{
}

- (void)showAirDropImportErrorAlert
{
}

- (void)getDataForPerformanceRequest:(id)a3
{
  id v3 = a3;
  int v4 = +[NSURL URLWithString:@"https://statici.icloud.com/fmipmobile/deviceImages-4.0/iPhone/iPhone8,1-e1e4e3-dadcdb/online-nolocation_ipad.png"];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v4 cachePolicy:4 timeoutInterval:60000.0];
    [v5 setHTTPMethod:@"GET"];
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 bundleIdentifier];

    id v8 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:v7];
    unsigned __int8 v9 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [v9 setURLCache:0];
    [v9 setHTTPCookieStorage:0];
    [v9 setHTTPCookieAcceptPolicy:1];
    [v9 setURLCredentialStorage:0];
    [v9 setRequestCachePolicy:1];
    [v9 set_appleIDContext:v8];
    unsigned int v10 = +[NSURLSession sessionWithConfiguration:v9 delegate:0 delegateQueue:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001F034;
    v12[3] = &unk_1000A2128;
    id v13 = v3;
    uint64_t v11 = [v10 dataTaskWithRequest:v5 completionHandler:v12];
    [v11 resume];
  }
  else
  {
    (*((void (**)(id, void, void))v3 + 2))(v3, 0, 0);
  }
}

- (void)contactForPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ((unint64_t)[v6 length] > 0xF)
  {
    unsigned int v10 = +[FMFClientSession _decryptPayload:v6 withToken:0 withSession:self];
    unsigned __int8 v9 = v10;
    if (v10)
    {
      uint64_t v11 = [v10 objectForKey:@"handle"];
      if (v11)
      {
        int v12 = +[FMFHandle handleWithId:v11 serverId:0];
        id v13 = +[FMFContactUtility sharedInstance];
        __int16 v14 = [v13 getContactForHandle:v12];

        if (v14)
        {
          v7[2](v7, v14, 0);
        }
        else
        {
          unsigned int v17 = sub_100005560();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            sub_10006B7C8();
          }

          __int16 v18 = +[NSError errorWithDomain:FMFErrorDomain code:1013 userInfo:0];
          ((void (**)(id, void *, void *))v7)[2](v7, 0, v18);
        }
      }
      else
      {
        __int16 v16 = sub_100005560();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10006B754();
        }

        int v12 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v12);
      }
    }
    else
    {
      unsigned int v15 = sub_100005560();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10006B6EC();
      }

      uint64_t v11 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
      ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
    }
  }
  else
  {
    id v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006B684();
    }

    unsigned __int8 v9 = +[NSError errorWithDomain:FMFErrorDomain code:1014 userInfo:0];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v9);
  }
}

- (void)handleAndLocationForPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] > 0xF)
  {
    unsigned int v10 = +[FMFClientSession _decryptPayload:v6 withToken:0 withSession:self];
    unsigned __int8 v9 = v10;
    if (!v10)
    {
      long long v29 = sub_100005560();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10006B898();
      }

      uint64_t v11 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
      goto LABEL_19;
    }
    uint64_t v11 = [v10 objectForKey:@"handle"];
    uint64_t v12 = [v9 objectForKey:@"location"];
    id v13 = (void *)v12;
    if (v11)
    {
      __int16 v14 = +[FMFHandle handleWithId:v11 serverId:0];
      if (v13) {
        goto LABEL_8;
      }
    }
    else
    {
      __int16 v14 = 0;
      if (v12)
      {
LABEL_8:
        unsigned int v15 = [v13 objectForKey:@"lat"];
        [v15 doubleValue];
        CLLocationDegrees v17 = v16;

        __int16 v18 = [v13 objectForKey:@"lon"];
        [v18 doubleValue];
        CLLocationDegrees v20 = v19;

        long long v21 = [v13 objectForKey:@"hacc"];
        [v21 doubleValue];
        double v23 = v22;

        long long v24 = [v13 objectForKey:@"ts"];
        [v24 doubleValue];
        long long v25 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

        id v26 = objc_alloc((Class)CLLocation);
        CLLocationCoordinate2D v27 = CLLocationCoordinate2DMake(v17, v20);
        id v28 = [v26 initWithCoordinate:v25 altitude:v27.latitude horizontalAccuracy:v27.longitude verticalAccuracy:0.0 timestamp:v23];

        if (v14)
        {
LABEL_9:
          (*((void (**)(id, void *, id, void))v7 + 2))(v7, v14, v28, 0);
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
LABEL_15:
        v30 = sub_100005560();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10006B900();
        }

        v31 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
        (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v31);

        goto LABEL_18;
      }
    }
    id v28 = 0;
    if (v14) {
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10006B830();
  }

  unsigned __int8 v9 = +[NSError errorWithDomain:FMFErrorDomain code:1014 userInfo:0];
  (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
LABEL_20:
}

- (void)decryptPayload:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, void, id))a5;
  if ((unint64_t)[v8 length] > 0xF)
  {
    uint64_t v13 = +[FMFClientSession _decryptPayload:v8 withToken:v9 withSession:self];
    uint64_t v12 = (void *)v13;
    if (v13)
    {
      uint64_t v26 = v13;
      __int16 v14 = +[NSArray arrayWithObjects:&v26 count:1];
      id v21 = 0;
      unsigned int v15 = +[NSJSONSerialization dataWithJSONObject:v14 options:0 error:&v21];
      id v16 = v21;
      CLLocationDegrees v17 = sub_100005560();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        double v23 = self;
        __int16 v24 = 2112;
        long long v25 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@: payloadData %@", buf, 0x16u);
      }

      if (v16)
      {
        __int16 v18 = sub_100005560();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10006BA44();
        }

        id v19 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
        v10[2](v10, 0, v19);
      }
      else
      {
        id v19 = [objc_alloc((Class)NSString) initWithData:v15 encoding:4];
        ((void (**)(id, id, id))v10)[2](v10, v19, 0);
      }
    }
    else
    {
      CLLocationDegrees v20 = sub_100005560();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10006B9DC();
      }

      id v16 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
      v10[2](v10, 0, v16);
    }
  }
  else
  {
    uint64_t v11 = sub_100005560();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10006B974();
    }

    uint64_t v12 = +[NSError errorWithDomain:FMFErrorDomain code:1014 userInfo:0];
    v10[2](v10, 0, v12);
  }
}

+ (void)internalDataForPayload:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 length] > 0xF)
  {
    id v9 = +[FMFClientSession _decryptPayload:v5 withToken:0 withSession:0];
    id v8 = v9;
    if (!v9)
    {
      __int16 v18 = sub_100005560();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10006BB14();
      }

      __int16 v14 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v6 + 2))(v6, 0, 0, 0, v14);
      goto LABEL_20;
    }
    unsigned int v10 = [v9 objectForKey:@"handle"];
    uint64_t v11 = [v10 fm_nullToNil];

    uint64_t v12 = [v8 objectForKey:@"location"];
    uint64_t v13 = [v12 fm_nullToNil];

    if (v11)
    {
      __int16 v14 = +[FMFHandle handleWithId:v11];
      unsigned int v15 = +[FMFContactUtility sharedInstance];
      id v16 = [v15 getContactForHandle:v14];

      if (!v13)
      {
        if (v14)
        {
          id v17 = 0;
LABEL_15:
          (*((void (**)(id, void *, void *, id, void))v6 + 2))(v6, v14, v16, v17, 0);
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
LABEL_16:
        v32 = sub_100005560();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10006BB7C();
        }

        id v17 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
        (*((void (**)(id, void, void, void, id))v6 + 2))(v6, 0, 0, 0, v17);
        __int16 v14 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      __int16 v14 = 0;
      id v16 = 0;
      if (!v13) {
        goto LABEL_16;
      }
    }
    id v19 = [v13 objectForKey:@"lat"];
    [v19 doubleValue];
    CLLocationDegrees v21 = v20;

    double v22 = [v13 objectForKey:@"lon"];
    [v22 doubleValue];
    CLLocationDegrees v24 = v23;

    long long v25 = [v13 objectForKey:@"hacc"];
    [v25 doubleValue];
    double v27 = v26;

    id v28 = [v13 objectForKey:@"ts"];
    [v28 doubleValue];
    long long v29 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

    id v30 = objc_alloc((Class)CLLocation);
    CLLocationCoordinate2D v31 = CLLocationCoordinate2DMake(v21, v24);
    id v17 = [v30 initWithCoordinate:v29 altitude:v31.latitude horizontalAccuracy:v31.longitude verticalAccuracy:0.0 timestamp:v27];

    goto LABEL_15;
  }
  id v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10006BAAC();
  }

  id v8 = +[NSError errorWithDomain:FMFErrorDomain code:1014 userInfo:0];
  (*((void (**)(id, void, void, void, void *))v6 + 2))(v6, 0, 0, 0, v8);
LABEL_21:
}

- (void)dataForPayload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 length] > 0xF)
  {
    unsigned int v10 = +[FMFClientSession _decryptPayload:v6 withToken:0 withSession:self];
    id v9 = v10;
    if (!v10)
    {
      id v19 = sub_100005560();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10006BB14();
      }

      unsigned int v15 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v15);
      goto LABEL_20;
    }
    uint64_t v11 = [v10 objectForKey:@"handle"];
    uint64_t v12 = [v11 fm_nullToNil];

    uint64_t v13 = [v9 objectForKey:@"location"];
    __int16 v14 = [v13 fm_nullToNil];

    if (v12)
    {
      unsigned int v15 = +[FMFHandle handleWithId:v12];
      id v16 = +[FMFContactUtility sharedInstance];
      id v17 = [v16 getContactForHandle:v15];

      if (!v14)
      {
        if (v15)
        {
          id v18 = 0;
LABEL_15:
          (*((void (**)(id, void *, void *, id, void))v7 + 2))(v7, v15, v17, v18, 0);
LABEL_19:

LABEL_20:
          goto LABEL_21;
        }
LABEL_16:
        v33 = sub_100005560();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10006BB7C();
        }

        id v18 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
        (*((void (**)(id, void, void, void, id))v7 + 2))(v7, 0, 0, 0, v18);
        unsigned int v15 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      unsigned int v15 = 0;
      id v17 = 0;
      if (!v14) {
        goto LABEL_16;
      }
    }
    double v20 = [v14 objectForKey:@"lat"];
    [v20 doubleValue];
    CLLocationDegrees v22 = v21;

    double v23 = [v14 objectForKey:@"lon"];
    [v23 doubleValue];
    CLLocationDegrees v25 = v24;

    double v26 = [v14 objectForKey:@"hacc"];
    [v26 doubleValue];
    double v28 = v27;

    long long v29 = [v14 objectForKey:@"ts"];
    [v29 doubleValue];
    id v30 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");

    id v31 = objc_alloc((Class)CLLocation);
    CLLocationCoordinate2D v32 = CLLocationCoordinate2DMake(v22, v25);
    id v18 = [v31 initWithCoordinate:v30 altitude:v32.latitude horizontalAccuracy:v32.longitude verticalAccuracy:0.0 timestamp:v28];

    goto LABEL_15;
  }
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10006BAAC();
  }

  id v9 = +[NSError errorWithDomain:FMFErrorDomain code:1014 userInfo:0];
  (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v9);
LABEL_21:
}

+ (id)_decryptPayload:(id)a3 withToken:(id)a4 withSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = +[NSUserDefaults standardUserDefaults];
  uint64_t v11 = [v10 objectForKey:off_1000BB018];

  if (v8)
  {
    uint64_t v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006BBF0();
    }

    id v48 = v8;
    uint64_t v13 = +[NSArray arrayWithObjects:&v48 count:1];

    uint64_t v11 = (void *)v13;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v14)
  {
    id v32 = v9;
    id v33 = v8;
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    uint64_t v36 = *(void *)v40;
    id v17 = obj;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v17);
        }
        uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * i);

        id v20 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v19 options:0];
        id v21 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v7 options:0];
        id v38 = 0;
        CLLocationDegrees v22 = [v21 decryptWithKey:v20 error:&v38];
        unint64_t v16 = (unint64_t)v38;
        if (v16)
        {
          double v23 = sub_100005560();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v44 = a1;
            __int16 v45 = 2112;
            unint64_t v46 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@: Error decrypting data error: %@", buf, 0x16u);
          }
        }
        else
        {

          id v37 = 0;
          double v23 = +[NSJSONSerialization JSONObjectWithData:v22 options:0 error:&v37];
          id v24 = v37;
          if (!v24)
          {
            id v14 = [v23 firstObject];
            double v27 = sub_100005560();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v44 = a1;
              __int16 v45 = 2112;
              unint64_t v46 = (unint64_t)v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@: Unencrypted payload %@", buf, 0x16u);
            }

            unint64_t v15 = 0;
            unint64_t v16 = 0;
            goto LABEL_23;
          }
          unint64_t v15 = (unint64_t)v24;
          id v25 = v7;
          double v26 = sub_100005560();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v44 = a1;
            __int16 v45 = 2112;
            unint64_t v46 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@: Error serializing payload data error: %@", buf, 0x16u);
          }

          id v7 = v25;
          id v17 = obj;
        }
      }
      id v14 = [v17 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v14) {
        continue;
      }
      break;
    }
LABEL_23:
    id v9 = v32;
    id v8 = v33;
  }
  else
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
  }
  double v28 = obj;

  if (v16 | v15 || ![obj count])
  {
    long long v29 = sub_100005560();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = a1;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@: Sending refresh client to get new token", buf, 0xCu);
    }

    id v30 = +[FMFCommandManager sharedInstance];
    [v30 refreshForSession:v9 withReason:10 withCompletion:0];

    double v28 = obj;
  }

  return v14;
}

- (void)encryptPayload:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  id v9 = [v7 length];
  unsigned int v10 = sub_100005560();
  uint64_t v11 = v10;
  if ((unint64_t)v9 > 0xF)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      int v16 = 138412546;
      id v17 = v13;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v12 = [(FMFClientSession *)self _encryptPayload:v7];
    if (v12)
    {
      v8[2](v8, v12, 0);
    }
    else
    {
      id v14 = sub_100005560();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10006BCC0();
      }

      unint64_t v15 = +[NSError errorWithDomain:FMFErrorDomain code:1012 userInfo:0];
      ((void (**)(id, void *, void *))v8)[2](v8, 0, v15);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006BC58();
    }

    uint64_t v12 = +[NSError errorWithDomain:FMFErrorDomain code:1014 userInfo:0];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v12);
  }
}

- (id)_encryptPayload:(id)a3
{
  id v26 = a3;
  id v3 = +[NSUserDefaults standardUserDefaults];
  int v4 = [v3 objectForKey:off_1000BB018];

  id v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = self;
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: notificationTokens %@", buf, 0x16u);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    id v8 = v7;
    double v28 = 0;
    id v9 = 0;
    uint64_t v10 = *(void *)v31;
    uint64_t v11 = v26;
    id obj = v6;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);

        id v14 = [v11 dataUsingEncoding:4];
        id v15 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v13 options:0];
        id v29 = 0;
        int v16 = [v14 encryptWithKey:v15 error:&v29];
        id v9 = v29;
        id v17 = [v16 base64EncodedStringWithOptions:0];
        __int16 v18 = v17;
        if (v9)
        {
          id v19 = sub_100005560();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = self;
            __int16 v37 = 2112;
            id v38 = v9;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@: Error encrypting data error: %@", buf, 0x16u);
          }
        }
        else
        {
          id v20 = v17;

          id v19 = sub_100005560();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = self;
            __int16 v37 = 2112;
            id v38 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@: Encrypted payload %@", buf, 0x16u);
          }
          double v28 = v20;
          uint64_t v11 = v26;
        }

        if (!v9)
        {
          id v6 = obj;
          id v21 = v28;
          goto LABEL_20;
        }
      }
      id v6 = obj;
      id v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    id v21 = v28;
    goto LABEL_21;
  }
  id v21 = 0;
  uint64_t v11 = v26;
LABEL_20:

  id v9 = 0;
  if (![v6 count])
  {
LABEL_21:
    CLLocationDegrees v22 = sub_100005560();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10006BD28();
    }

    double v23 = +[FMFCommandManager sharedInstance];
    [v23 refreshForSession:self withReason:10 withCompletion:0];
  }

  return v21;
}

- (void)addFence:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = +[FindMyLocateShims shared];
    [v8 addFence:v6 completion:v7];

    goto LABEL_14;
  }
  id v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = self;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: addFence %@", buf, 0x16u);
  }

  uint64_t v10 = [v6 type];
  if (v10 != (void *)FMFFenceTypeNotifyMe) {
    goto LABEL_10;
  }
  uint64_t v11 = [v6 recipients];
  id v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = +[FMFDataManager sharedInstance];
    id v14 = [v6 recipients];
    id v15 = [v14 objectAtIndexedSubscript:0];
    int v16 = [v15 identifier];
    uint64_t v10 = [v13 followingHandleForIdentifier:v16];

    id v17 = [v10 serverId];
    [v6 setFriendIdentifier:v17];

    __int16 v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v6 identifier];
      id v20 = [v10 serverId];
      *(_DWORD *)buf = 138412802;
      v34 = self;
      __int16 v35 = 2112;
      id v36 = v19;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: matching fence for friend identifier: %@, handle: %@", buf, 0x20u);
    }
LABEL_10:
  }
  id v21 = [v6 friendIdentifier];
  CLLocationDegrees v22 = +[FMFHandle handleWithId:v21];

  double v23 = +[FMFDataManager sharedInstance];
  id v24 = [v23 fenceSequencer];
  id v25 = +[NSSet setWithObject:v22];
  id v26 = [v24 recurringAndScheduledFencesForHandles:v25];

  double v27 = [v26 anyObject];
  if ([v27 isMuted])
  {
    double v28 = [v27 muteEndDate];
    [v6 setMuteEndDate:v28];
  }
  id v29 = +[FMFDataManager sharedInstance];
  long long v30 = [v29 fenceSequencer];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10002102C;
  v31[3] = &unk_1000A2150;
  v31[4] = self;
  id v32 = v7;
  [v30 addFence:v6 clientSession:self completion:v31];

LABEL_14:
}

- (void)deleteFence:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (_os_feature_enabled_impl())
  {
    id v8 = +[FindMyLocateShims shared];
    [v8 deleteFence:v7 completion:v6];
  }
  else
  {
    id v9 = +[FMFDataManager sharedInstance];
    uint64_t v10 = [v9 fenceSequencer];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100021288;
    v11[3] = &unk_1000A2150;
    v11[4] = self;
    id v12 = v6;
    [v10 removeFence:v7 clientSession:self completion:v11];
  }
}

- (void)getFences:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v9 = +[FindMyLocateShims shared];
    [v9 getFences:v4];
  }
  else
  {
    id v5 = +[FMFDataManager sharedInstance];
    id v6 = [v5 fenceSequencer];
    id v7 = [v6 fences];

    id v8 = sub_100005560();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: getFences %@", buf, 0x16u);
    }

    (*((void (**)(id, void *, void))v4 + 2))(v4, v7, 0);
  }
}

- (void)fencesForHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v8 = +[FindMyLocateShims shared];
    id v9 = [v6 allObjects];
    [v8 fencesForHandles:v9 completion:v7];
  }
  else
  {
    uint64_t v10 = sub_100005560();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@: fencesForHandles %@", (uint8_t *)&v12, 0x16u);
    }

    id v8 = +[FMFDataManager sharedInstance];
    id v9 = [v8 fenceSequencer];
    uint64_t v11 = [v9 fencesForHandles:v6];
    (*((void (**)(id, void *, void))v7 + 2))(v7, v11, 0);
  }
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (_os_feature_enabled_impl())
  {
    id v17 = +[FindMyLocateShims shared];
    [v17 triggerWithUUID:v12 forFenceWithID:v13 withStatus:v14 forDate:v15 completion:v16];
  }
  else
  {
    __int16 v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      double v23 = self;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@: uuid: %@ fenceID: %@ status: %@ date: %@", buf, 0x34u);
    }

    id v19 = +[FMFDataManager sharedInstance];
    id v20 = [v19 fenceSequencer];
    id v21 = [v20 fenceManager];
    [v21 triggerWithUUID:v12 forFenceWithID:v13 withStatus:v14 atDate:v15 triggerLocation:0 clientSession:self completion:v16];
  }
}

- (void)triggerWithUUID:(id)a3 forFenceWithID:(id)a4 withStatus:(id)a5 forDate:(id)a6 triggerLocation:(id)a7 completion:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  if (_os_feature_enabled_impl())
  {
    id v22 = +[FindMyLocateShims shared];
    [v22 triggerWithUUID:v19 forFenceWithID:v18 withStatus:v17 forDate:v16 triggerLocation:v15 completion:v14];
  }
  else
  {
    id v22 = +[FMFDataManager sharedInstance];
    id v20 = [v22 fenceSequencer];
    id v21 = [v20 fenceManager];
    [v21 triggerWithUUID:v19 forFenceWithID:v18 withStatus:v17 atDate:v16 triggerLocation:v15 clientSession:self completion:v14];

    id v14 = v16;
    id v15 = v17;
    id v16 = v18;
    id v17 = v19;
    id v18 = v21;
    id v19 = v20;
  }
}

- (void)muteFencesForHandle:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    id v11 = +[FindMyLocateShims shared];
    [v11 muteFencesForHandle:v8 untilDate:v9 completion:v10];
  }
  else
  {
    id v12 = sub_100005560();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v24 = self;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: handle: %@ date: %@", buf, 0x20u);
    }

    id v13 = +[FMFDataManager sharedInstance];
    id v14 = [v13 fenceSequencer];
    id v15 = +[NSSet setWithObject:v8];
    id v16 = [v14 recurringAndScheduledFencesForHandles:v15];

    id v17 = +[FMFDataManager sharedInstance];
    id v18 = [v17 fenceSequencer];
    id v19 = [v18 fenceManager];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100021C6C;
    v20[3] = &unk_1000A21A0;
    v20[4] = self;
    id v21 = v16;
    id v22 = v10;
    id v11 = v16;
    [v19 muteFences:v11 withEndDate:v9 completion:v20];
  }
}

- (void)addFavorite:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: addFavorite: %@", buf, 0x16u);
  }

  id v9 = +[FMFDataManager sharedInstance];
  id v10 = [v6 identifier];
  id v11 = [v9 followingHandleForIdentifier:v10];

  id v12 = +[FMFDataManager sharedInstance];
  id v13 = [v12 favoritesSequencer];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000221D8;
  v15[3] = &unk_1000A20B0;
  v15[4] = self;
  id v16 = v7;
  id v14 = v7;
  [v13 addFavorite:v11 clientSession:self completion:v15];
}

- (void)removeFavorite:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FMFDataManager sharedInstance];
  id v9 = [v7 identifier];

  id v10 = [v8 followingHandleForIdentifier:v9];

  id v11 = +[FMFDataManager sharedInstance];
  id v12 = [v11 favoritesSequencer];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000223E4;
  v14[3] = &unk_1000A20B0;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [v12 removeFavorite:v10 clientSession:self completion:v14];
}

- (void)getFavoritesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = +[FMFDataManager sharedInstance];
  id v6 = [v5 favoritesSequencer];
  id v7 = [v6 favorites];

  id v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: getFavoritesWithCompletion %@", (uint8_t *)&v9, 0x16u);
  }

  v4[2](v4, v7, 0);
}

- (NSNumber)clientPid
{
  return self->_clientPid;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (BOOL)blockingDialogs
{
  return self->_blockingDialogs;
}

- (void)setBlockingDialogs:(BOOL)a3
{
  self->_blockingDialogs = a3;
}

- (NSString)_debugContext
{
  return self->__debugContext;
}

- (void)set_debugContext:(id)a3
{
}

@end