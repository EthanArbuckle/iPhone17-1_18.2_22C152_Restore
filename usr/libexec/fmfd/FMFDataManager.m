@interface FMFDataManager
+ (id)sharedInstance;
- (BOOL)blockFMFChannel;
- (BOOL)canAddFollower;
- (BOOL)canAddFriend;
- (BOOL)followersFullyInited;
- (BOOL)followersInfoReceived;
- (BOOL)followingFullyInited;
- (BOOL)followingInfoReceived;
- (BOOL)hasPendingOfferToHandle:(id)a3 withGroupId:(id)a4;
- (BOOL)isActiveAutoMeDevice;
- (BOOL)isAllowFriendRequestsEnabled;
- (BOOL)isThisDeviceRegistered;
- (BOOL)locationHidden;
- (BOOL)sendOnlyFMFChannel;
- (BOOL)showAirDropImportAlert;
- (BOOL)showAirDropImportUseFMFAppAlert;
- (BOOL)showAirDropImportViewOniCloudAlert;
- (BOOL)storedConfigLoaded;
- (BOOL)transcriptDelegateStartEnabled;
- (BOOL)transcriptDelegateStopEnabled;
- (FMFDStoreController)storeController;
- (FMFDevice)_meDevice;
- (FMFFavoritesSequencer)favoritesSequencer;
- (FMFFenceManager)fenceManager;
- (FMFFenceSequencer)fenceSequencer;
- (NSArray)cachedTapMessages;
- (NSDictionary)_configFromServer;
- (NSDictionary)_features;
- (NSDictionary)_followerHandleMapWithIdentifier;
- (NSDictionary)_followerHandleMapWithServerId;
- (NSDictionary)_followingHandleMapWithIdentifier;
- (NSDictionary)_followingHandleMapWithServerId;
- (NSDictionary)_futureFollowerRequestMapWithIdentifier;
- (NSDictionary)_myInfo;
- (NSDictionary)_preferences;
- (NSMutableDictionary)_locationDictionary;
- (NSMutableDictionary)changesToBeNotified;
- (NSSet)_devices;
- (NSSet)_followerHandlesInternal;
- (NSSet)_followingHandlesInternal;
- (NSSet)_futureFollowerRequestsInternal;
- (NSSet)_futureFollowingRequestsInternal;
- (NSSet)followerHandles;
- (NSSet)followingHandles;
- (NSSet)pendingOfferHandles;
- (NSString)lastLoggedInPrsIdInternal;
- (NSString)modelVersion;
- (NSTimer)sanitizeLocationsCacheTimer;
- (double)graceInterval401InSec;
- (double)graceInterval5XXInSec;
- (double)heartbeatIntervalInSec;
- (double)lazyInitTimeoutInSec;
- (double)locationTTL;
- (double)maxLocatingInterval;
- (double)maxWaitTimeForRegisterMS;
- (double)minCallbackInterval;
- (double)systemInactivityTimeoutInSec;
- (double)upsellTimeoutInSeconds;
- (double)userLocateWaitIntervalInMS;
- (id)allDevices;
- (id)allLocations;
- (id)companionDeviceId;
- (id)deviceSharingLocation;
- (id)followedHandleForFence:(id)a3;
- (id)followerHandleForFence:(id)a3;
- (id)followerHandleForIdentifier:(id)a3;
- (id)followerHandleForServerId:(id)a3;
- (id)followingHandleForIdentifier:(id)a3;
- (id)followingHandleForServerId:(id)a3;
- (id)friendshipRequestForIdentifier:(id)a3;
- (id)futureFollowerRequests;
- (id)futureFollowingRequests;
- (id)getAccountEmailAddress;
- (id)lastLoggedInPrsId;
- (id)locationForHandle:(id)a3;
- (id)locationsForHandles:(id)a3;
- (id)maxLocationRefreshTimeout;
- (id)maxTriesToRegisterDevice;
- (id)offerExpireDateForHandle:(id)a3 withGroupId:(id)a4;
- (id)tapMessagesFromDefaults;
- (id)thisDeviceId;
- (void)accountWasRemoved;
- (void)cleanupCachedPendingOfferHandles;
- (void)cleanupCaches;
- (void)cleanupOldModel;
- (void)clearTapMessagesCache;
- (void)dealloc;
- (void)deltasFromExisting:(id)a3 usingLatest:(id)a4 forKey:(id)a5;
- (void)determineNewMeDevice;
- (void)digestCommand:(id)a3;
- (void)donateFollowingsChangeEventsForAddedFollowings:(id)a3 removedFollowings:(id)a4;
- (void)getHandlesSharingLocationsWithMe:(id)a3;
- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4;
- (void)getHandlesSharingMyLocation:(id)a3;
- (void)getHandlesSharingMyLocationWithGroupId:(id)a3 completion:(id)a4;
- (void)getHandlesWithPendingOffers:(id)a3;
- (void)getPendingFriendshipRequestsWithCompletion:(id)a3;
- (void)notifyClientOfUpdates:(id)a3;
- (void)removeFutureFollowerRequest:(id)a3;
- (void)sanitizeLocationsCache:(id)a3;
- (void)setCachedTapMessages:(id)a3;
- (void)setChangesToBeNotified:(id)a3;
- (void)setFavoritesSequencer:(id)a3;
- (void)setFenceManager:(id)a3;
- (void)setFenceSequencer:(id)a3;
- (void)setFollowerHandles:(id)a3;
- (void)setFollowersFullyInited:(BOOL)a3;
- (void)setFollowersInfoReceived:(BOOL)a3;
- (void)setFollowingFullyInited:(BOOL)a3;
- (void)setFollowingHandles:(id)a3;
- (void)setFollowingInfoReceived:(BOOL)a3;
- (void)setFutureFollowerRequests:(id)a3;
- (void)setLastLoggedInPrsIdInternal:(id)a3;
- (void)setLocationsFromData:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setPendingOfferHandles:(id)a3;
- (void)setSanitizeLocationsCacheTimer:(id)a3;
- (void)setStoreController:(id)a3;
- (void)setStoredConfigLoaded:(BOOL)a3;
- (void)set_configFromServer:(id)a3;
- (void)set_devices:(id)a3;
- (void)set_features:(id)a3;
- (void)set_followerHandleMapWithIdentifier:(id)a3;
- (void)set_followerHandleMapWithServerId:(id)a3;
- (void)set_followerHandlesInternal:(id)a3;
- (void)set_followingHandleMapWithIdentifier:(id)a3;
- (void)set_followingHandleMapWithServerId:(id)a3;
- (void)set_followingHandlesInternal:(id)a3;
- (void)set_futureFollowerRequestMapWithIdentifier:(id)a3;
- (void)set_futureFollowerRequestsInternal:(id)a3;
- (void)set_futureFollowingRequestsInternal:(id)a3;
- (void)set_locationDictionary:(id)a3;
- (void)set_meDevice:(id)a3;
- (void)set_myInfo:(id)a3;
- (void)set_preferences:(id)a3;
- (void)storeTapMessagesToDefaults;
- (void)updateClientsWithLocallyStoredModelCache;
- (void)updateInited;
- (void)updateLastLoggedInPrsId:(id)a3;
- (void)updateSessionCaches:(id)a3 forSessions:(id)a4 pushAllData:(BOOL)a5;
- (void)updateTapMessagesCache:(id)a3;
@end

@implementation FMFDataManager

+ (id)sharedInstance
{
  if (qword_1000BB7E8 != -1) {
    dispatch_once(&qword_1000BB7E8, &stru_1000A2688);
  }
  v2 = (void *)qword_1000BB7E0;

  return v2;
}

- (void)updateSessionCaches:(id)a3 forSessions:(id)a4 pushAllData:(BOOL)a5
{
  BOOL v66 = a5;
  id v64 = a3;
  id v58 = a4;
  v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v64 allKeys];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = v66;
    *(_WORD *)&v73[4] = 2112;
    *(void *)&v73[6] = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating session caches allData?: %d updates: %@", buf, 0x12u);
  }
  id v9 = [v58 copy];
  int v62 = _os_feature_enabled_impl();
  v65 = self;
  objc_sync_enter(v65);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = v9;
  id v10 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v10)
  {
    uint64_t v61 = *(void *)v68;
    do
    {
      id v63 = v10;
      for (i = 0; i != v63; i = (char *)i + 1)
      {
        if (*(void *)v68 != v61) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        v13 = [(FMFDataManager *)v65 followerHandles];
        if (!v66)
        {
          v14 = [v64 objectForKeyedSubscript:@"followers"];
          if (v14
            || ([v64 objectForKeyedSubscript:@"pendingOffers"],
                (v14 = objc_claimAutoreleasedReturnValue()) != 0))
          {
          }
          else
          {
            v56 = [v64 objectForKeyedSubscript:@"futureFollower"];
            BOOL v57 = v56 == 0;

            if (v57) {
              goto LABEL_15;
            }
          }
        }
        v15 = sub_100005560();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v73 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating follower handles in session caches: %@", buf, 0xCu);
        }

        v16 = [v12 clientProxy];
        [v16 didUpdateFollowers:v13];

LABEL_15:
        v17 = [(FMFDataManager *)v65 followingHandles];
        if (!v66)
        {
          v18 = [v64 objectForKeyedSubscript:@"following"];
          if (v18)
          {
          }
          else
          {
            v19 = [v64 objectForKeyedSubscript:@"favorites"];
            BOOL v20 = v19 == 0;

            if (v20) {
              goto LABEL_22;
            }
          }
        }
        v21 = sub_100005560();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v73 = v17;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Updating following handles in session caches: %@", buf, 0xCu);
        }

        v22 = [v12 clientProxy];
        [v22 didUpdateFollowing:v17];

LABEL_22:
        v23 = [(FMFDataManager *)v65 fenceSequencer];
        v24 = [v23 fences];

        if (v66)
        {
          BOOL v25 = 1;
        }
        else
        {
          v26 = [v64 objectForKeyedSubscript:@"updatedFences"];
          BOOL v25 = v26 != 0;
        }
        if (((!v25 | v62) & 1) == 0)
        {
          v27 = sub_100005560();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v73 = v24;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating fences in session caches: %@", buf, 0xCu);
          }

          v28 = [v12 clientProxy];
          [v28 didUpdateFences:v24];
        }
        if (!v66)
        {
          v29 = [v64 objectForKeyedSubscript:@"changedLocations"];
          if (v29)
          {
          }
          else
          {
            v30 = [v64 objectForKeyedSubscript:@"following"];
            v31 = [v30 objectForKeyedSubscript:@"removed"];
            BOOL v32 = v31 == 0;

            if (v32) {
              goto LABEL_42;
            }
          }
        }
        v33 = [(FMFDataManager *)v65 allLocations];
        id v34 = [v33 copy];

        unint64_t v35 = (unint64_t)[v17 count];
        unint64_t v36 = (unint64_t)[v34 count];
        unint64_t v37 = v36;
        if (v35 && v36 || (BOOL v38 = v35 != 0, !(v35 | v36)))
        {
          v39 = +[NSSet setWithArray:v34];
          v40 = sub_100005560();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v73 = v39;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Updating locations in session caches: %@", buf, 0xCu);
          }

          v41 = [v12 clientProxy];
          [v41 didUpdateLocations:v39];
        }
        else
        {
          v39 = sub_100005560();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v73 = v38;
            *(_WORD *)&v73[4] = 1024;
            *(_DWORD *)&v73[6] = v37 != 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Skipping locations update in session caches. hasFollowingHandles %i, hasLocations %i", buf, 0xEu);
          }
        }

LABEL_42:
        v42 = [v64 objectForKeyedSubscript:@"hideLocation"];
        v43 = [v64 objectForKeyedSubscript:@"allowFriendRequests"];
        uint64_t v44 = [v64 objectForKeyedSubscript:@"primaryEmail"];
        v45 = (void *)v44;
        if (v66 || v42 || v43 || v44)
        {
          v46 = objc_opt_new();
          if (v42)
          {
            v47 = [v42 objectForKeyedSubscript:@"updatedStatus"];
            [v46 setObject:v47 forKeyedSubscript:@"hideLocation"];
          }
          if (v43)
          {
            v48 = [v43 objectForKeyedSubscript:@"updatedStatus"];
            [v46 setObject:v48 forKeyedSubscript:@"allowFriendRequests"];
          }
          if (v45)
          {
            v49 = [v45 objectForKeyedSubscript:@"updatedStatus"];
            [v46 setObject:v49 forKeyedSubscript:@"primaryEmailUpdates"];
          }
          v50 = sub_100005560();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v73 = v46;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Updating preferences in session caches: %@", buf, 0xCu);
          }

          v51 = [v12 clientProxy];
          [v51 didUpdatePreferences:v46];
        }
        if (v66)
        {
          v52 = [v12 clientProxy];
          v53 = [(FMFDataManager *)v65 _meDevice];
          v54 = +[NSNull null];
          if (v53 == v54)
          {
            v55 = 0;
          }
          else
          {
            v60 = [(FMFDataManager *)v65 _meDevice];
            v55 = v60;
          }
          [v52 didChangeActiveLocationSharingDevice:v55];
          if (v53 != v54) {
        }
          }
      }
      id v10 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v65);
}

- (FMFDevice)_meDevice
{
  return self->__meDevice;
}

- (NSSet)followingHandles
{
  return [(FMFDataManager *)self _followingHandlesInternal];
}

- (NSSet)followerHandles
{
  return [(FMFDataManager *)self _followerHandlesInternal];
}

- (FMFFenceSequencer)fenceSequencer
{
  return self->_fenceSequencer;
}

- (id)deviceSharingLocation
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(FMFDataManager *)v2 _meDevice];
  objc_sync_exit(v2);

  return v3;
}

- (id)allLocations
{
  [(FMFDataManager *)self sanitizeLocationsCache:0];
  v3 = [(FMFDataManager *)self _locationDictionary];
  v4 = [v3 allValues];

  return v4;
}

- (NSMutableDictionary)_locationDictionary
{
  return self->__locationDictionary;
}

- (void)sanitizeLocationsCache:(id)a3
{
  id v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(FMFDataManager *)v4 _locationDictionary];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = [(FMFDataManager *)v4 _locationDictionary];
    id v8 = [v7 copy];

    id v9 = [v8 keysOfEntriesPassingTest:&stru_1000A26F0];
    id v10 = [(FMFDataManager *)v4 _locationDictionary];
    v11 = [v9 allObjects];
    [v10 removeObjectsForKeys:v11];
  }
  objc_sync_exit(v4);
}

- (NSSet)_followingHandlesInternal
{
  return self->__followingHandlesInternal;
}

- (NSSet)_followerHandlesInternal
{
  return self->__followerHandlesInternal;
}

- (id)followerHandleForFence:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [v4 followerIds];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(FMFDataManager *)self followingHandleForServerId:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        if (v10)
        {
          v16 = (void *)v10;
          goto LABEL_19;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [v4 recipients];
  id v11 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_11:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v5);
      }
      v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) identifier];
      v16 = [(FMFDataManager *)self followingHandleForServerId:v15];

      if (v16) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    v16 = 0;
  }
LABEL_19:

  return v16;
}

- (id)followedHandleForFence:(id)a3
{
  id v4 = [a3 friendIdentifier];
  v5 = [(FMFDataManager *)self followingHandleForServerId:v4];

  return v5;
}

- (void)cleanupCaches
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up caches", buf, 2u);
  }

  [(FMFDataManager *)v2 setModelVersion:0];
  [(FMFDataManager *)v2 setFollowingHandles:0];
  [(FMFDataManager *)v2 setFollowerHandles:0];
  [(FMFDataManager *)v2 set_configFromServer:0];
  [(FMFDataManager *)v2 set_devices:0];
  [(FMFDataManager *)v2 set_meDevice:0];
  [(FMFDataManager *)v2 set_features:0];
  [(FMFDataManager *)v2 set_preferences:0];
  [(FMFDataManager *)v2 set_myInfo:0];
  [(FMFDataManager *)v2 set_followingHandleMapWithIdentifier:0];
  [(FMFDataManager *)v2 set_followingHandleMapWithServerId:0];
  [(FMFDataManager *)v2 set_followerHandleMapWithIdentifier:0];
  [(FMFDataManager *)v2 set_followerHandleMapWithServerId:0];
  [(FMFDataManager *)v2 set_followingHandlesInternal:0];
  [(FMFDataManager *)v2 set_followerHandlesInternal:0];
  [(FMFDataManager *)v2 set_futureFollowingRequestsInternal:0];
  [(FMFDataManager *)v2 set_futureFollowerRequestsInternal:0];
  [(FMFDataManager *)v2 set_futureFollowerRequestMapWithIdentifier:0];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [(FMFDataManager *)v2 set_locationDictionary:v4];

  [(FMFDataManager *)v2 setPendingOfferHandles:0];
  [(FMFDataManager *)v2 setFollowersInfoReceived:0];
  [(FMFDataManager *)v2 setFollowingInfoReceived:0];
  [(FMFDataManager *)v2 setFollowersFullyInited:0];
  [(FMFDataManager *)v2 setFollowingFullyInited:0];
  v5 = [(FMFDataManager *)v2 storeController];
  [v5 cleanupOldModel];

  id v6 = [(FMFDataManager *)v2 fenceSequencer];
  [v6 reset];

  id v7 = [(FMFDataManager *)v2 favoritesSequencer];
  [v7 reset];

  uint64_t v8 = +[NSUserDefaults standardUserDefaults];
  [v8 removeObjectForKey:@"storedConfigKey"];

  id v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cleaning up session caches", v13, 2u);
  }

  uint64_t v10 = +[FMFXPCSessionManager sharedInstance];
  id v11 = [v10 clientSessions];
  [(FMFDataManager *)v2 updateSessionCaches:0 forSessions:v11 pushAllData:1];

  id v12 = +[FMFCommandManager sharedInstance];
  [v12 resetModelToUninitialized];

  objc_sync_exit(v2);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(FMFDataManager *)self sanitizeLocationsCacheTimer];
  [v4 invalidate];

  [(FMFDataManager *)self setSanitizeLocationsCacheTimer:0];
  v5.receiver = self;
  v5.super_class = (Class)FMFDataManager;
  [(FMFDataManager *)&v5 dealloc];
}

- (void)cleanupOldModel
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cleaning up old model due to ModelIsOldNotification", v4, 2u);
  }

  [(FMFDataManager *)self cleanupCaches];
}

- (void)accountWasRemoved
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "accountWasRemoved due to FMFAccountWasRemovedNotification", v4, 2u);
  }

  [(FMFDataManager *)self cleanupCaches];
}

- (void)determineNewMeDevice
{
  v2 = self;
  objc_sync_enter(v2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(FMFDataManager *)v2 _devices];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v7 isActiveDevice])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v8 = [(FMFDataManager *)v2 _meDevice];
  unsigned __int8 v9 = [v8 isEqual:v4];

  if ((v9 & 1) == 0)
  {
    [(FMFDataManager *)v2 set_meDevice:v4];
    uint64_t v10 = [(FMFDataManager *)v2 changesToBeNotified];
    id v11 = [(FMFDataManager *)v2 _meDevice];
    id v12 = v11;
    if (!v11)
    {
      id v12 = +[NSNull null];
    }
    [v10 setObject:v12 forKey:@"meDevice"];
    if (!v11) {
  }
    }
  objc_sync_exit(v2);
}

- (NSDictionary)_configFromServer
{
  if (![(FMFDataManager *)self storedConfigLoaded])
  {
    [(FMFDataManager *)self setStoredConfigLoaded:1];
    v3 = +[NSUserDefaults standardUserDefaults];
    id v4 = [v3 objectForKey:@"storedConfigKey"];
    [(FMFDataManager *)self set_configFromServer:v4];
  }
  configFromServer = self->__configFromServer;

  return configFromServer;
}

- (void)set_configFromServer:(id)a3
{
  objc_storeStrong((id *)&self->__configFromServer, a3);
  id v5 = a3;
  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setObject:self->__configFromServer forKey:@"storedConfigKey"];

  id v7 = +[NSUserDefaults standardUserDefaults];

  [v7 synchronize];
}

- (id)lastLoggedInPrsId
{
  lastLoggedInPrsIdInternal = self->_lastLoggedInPrsIdInternal;
  if (!lastLoggedInPrsIdInternal)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 valueForKey:@"kFMFDlastLoggedInPrsId"];
    id v6 = self->_lastLoggedInPrsIdInternal;
    self->_lastLoggedInPrsIdInternal = v5;

    lastLoggedInPrsIdInternal = self->_lastLoggedInPrsIdInternal;
  }

  return lastLoggedInPrsIdInternal;
}

- (void)updateLastLoggedInPrsId:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      lastLoggedInPrsIdInternal = self->_lastLoggedInPrsIdInternal;
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      long long v13 = lastLoggedInPrsIdInternal;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating last logged in prs id to: %@, current value: %@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setObject:v4 forKey:@"kFMFDlastLoggedInPrsId"];

    uint64_t v8 = +[NSUserDefaults standardUserDefaults];
    [v8 synchronize];

    unsigned __int8 v9 = self->_lastLoggedInPrsIdInternal;
    self->_lastLoggedInPrsIdInternal = 0;
  }
}

- (void)digestCommand:(id)a3
{
  id v190 = a3;
  v196 = [v190 jsonResponseDictionary];
  id v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v225 = (char *)v190;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Digest Command: %@", buf, 0xCu);
  }

  id v5 = self;
  objc_sync_enter(v5);
  val = v5;
  id v6 = +[NSMutableDictionary dictionary];
  [(FMFDataManager *)v5 setChangesToBeNotified:v6];

  id v7 = [v196 objectForKeyedSubscript:@"modelVersion"];
  uint64_t v8 = +[NSNull null];
  if (v7 == v8)
  {

    id v9 = 0;
  }
  else
  {
    id v9 = [v196 objectForKeyedSubscript:@"modelVersion"];

    if (v9) {
      [(FMFDataManager *)val setModelVersion:v9];
    }
  }
  v189 = v9;
  int v10 = +[Unmarshaller sharedInstance];
  id v11 = [v10 friendRequestsFromData:v196 forType:2];

  if (v11)
  {
    __int16 v12 = [(FMFDataManager *)val _futureFollowerRequestsInternal];
    [(FMFDataManager *)val deltasFromExisting:v12 usingLatest:v11 forKey:@"futureFollower"];

    [(FMFDataManager *)val setFutureFollowerRequests:v11];
    long long v13 = sub_100005560();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Future follower updates received.", buf, 2u);
    }
  }
  long long v14 = +[Unmarshaller sharedInstance];
  v195 = [v14 friendRequestsFromData:v196 forType:3];

  if (v195)
  {
    long long v15 = [(FMFDataManager *)val _futureFollowingRequestsInternal];
    [(FMFDataManager *)val deltasFromExisting:v15 usingLatest:v195 forKey:@"futureFollowing"];

    [(FMFDataManager *)val set_futureFollowingRequestsInternal:v195];
    long long v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Future following updates received.", buf, 2u);
    }
  }
  v17 = +[Unmarshaller sharedInstance];
  long long v18 = [v17 followersUsingData:v196];

  BOOL v191 = v18 != 0;
  if (v18)
  {
    long long v19 = [(FMFDataManager *)val followerHandles];
    [(FMFDataManager *)val deltasFromExisting:v19 usingLatest:v18 forKey:@"followers"];

    [(FMFDataManager *)val setFollowerHandles:v18];
    long long v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Followers updates received.", buf, 2u);
    }

    [(FMFDataManager *)val setFollowersInfoReceived:1];
  }
  long long v21 = +[Unmarshaller sharedInstance];
  long long v22 = [v21 handlesFromData:v196 forType:1];

  if (v22)
  {
    long long v23 = [(FMFDataManager *)val followingHandles];
    [(FMFDataManager *)val deltasFromExisting:v23 usingLatest:v22 forKey:@"following"];

    [(FMFDataManager *)val setFollowingHandles:v22];
    long long v24 = [(FMFDataManager *)val favoritesSequencer];
    long long v25 = [(FMFDataManager *)val _followingHandleMapWithServerId];
    [v24 updateHandlesWithFavorites:v25];

    v26 = sub_100005560();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Following updates received.", buf, 2u);
    }

    BOOL v191 = 1;
    [(FMFDataManager *)val setFollowingInfoReceived:1];
  }
  v27 = +[Unmarshaller sharedInstance];
  v193 = [v27 handlesFromData:v196 forType:4];

  if (v193)
  {
    [(FMFDataManager *)val setPendingOfferHandles:v193];
    v28 = [(FMFDataManager *)val changesToBeNotified];
    v29 = [(FMFDataManager *)val pendingOfferHandles];
    [v28 setObject:v29 forKey:@"pendingOffers"];

    v30 = sub_100005560();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Pending offer updates received.", buf, 2u);
    }
  }
  v31 = [v196 objectForKeyedSubscript:@"config"];
  BOOL v32 = +[NSNull null];
  if (v31 == v32)
  {

    id v33 = 0;
  }
  else
  {
    id v33 = [v196 objectForKeyedSubscript:@"config"];

    if (v33)
    {
      [(FMFDataManager *)val set_configFromServer:v33];
      [(FMFDataManager *)val lazyInitTimeoutInSec];
    }
  }
  id v34 = [v196 objectForKeyedSubscript:@"features"];
  unint64_t v35 = +[NSNull null];
  if (v34 == v35)
  {

    unint64_t v36 = 0;
  }
  else
  {
    unint64_t v36 = [v196 objectForKeyedSubscript:@"features"];

    if (v36) {
      [(FMFDataManager *)val set_features:v36];
    }
  }
  unint64_t v37 = [v196 objectForKeyedSubscript:@"prefs"];
  BOOL v38 = +[NSNull null];
  if (v37 == v38)
  {
    id v39 = 0;
    id v58 = v37;
  }
  else
  {
    id v39 = [v196 objectForKeyedSubscript:@"prefs"];

    if (!v39) {
      goto LABEL_47;
    }
    v40 = [(FMFDataManager *)val _preferences];
    v41 = [v40 objectForKeyedSubscript:@"hideLocation"];
    unsigned int v42 = [v41 BOOLValue];
    v43 = [v39 objectForKeyedSubscript:@"hideLocation"];
    unsigned int v44 = [v43 BOOLValue];

    if (v42 != v44)
    {
      v45 = [v39 objectForKeyedSubscript:@"hideLocation"];
      v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v45 BOOLValue]);
      v47 = +[NSDictionary dictionaryWithObject:v46 forKey:@"updatedStatus"];

      v48 = [(FMFDataManager *)val changesToBeNotified];
      [v48 setObject:v47 forKey:@"hideLocation"];
    }
    v49 = [(FMFDataManager *)val _preferences];
    v50 = [v49 objectForKeyedSubscript:@"allowFriendRequests"];
    unsigned int v51 = [v50 BOOLValue];

    v52 = [v39 objectForKeyedSubscript:@"allowFriendRequests"];
    id v53 = [v52 BOOLValue];

    if (v51 != v53)
    {
      v54 = +[NSNumber numberWithBool:v53];
      v55 = +[NSDictionary dictionaryWithObject:v54 forKey:@"updatedStatus"];

      v56 = [(FMFDataManager *)val changesToBeNotified];
      [v56 setObject:v55 forKey:@"allowFriendRequests"];
    }
    BOOL v57 = [(FMFDataManager *)val _preferences];
    id v58 = [v57 objectForKeyedSubscript:@"primaryEmail"];

    unint64_t v37 = [v39 objectForKeyedSubscript:@"primaryEmail"];
    if (([v58 isEqualToString:v37] & 1) == 0)
    {
      v59 = +[NSDictionary dictionaryWithObject:v37 forKey:@"updatedStatus"];
      v60 = [(FMFDataManager *)val changesToBeNotified];
      [v60 setObject:v59 forKey:@"primaryEmail"];
    }
    [(FMFDataManager *)val set_preferences:v39];
    unint64_t v36 = sub_100005560();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Prefs updates received.", buf, 2u);
    }
  }

LABEL_47:
  uint64_t v61 = [v196 objectForKeyedSubscript:@"myInfo"];
  int v62 = +[NSNull null];
  if (v61 == v62)
  {

    id v194 = 0;
LABEL_71:

    goto LABEL_73;
  }
  id v194 = [v196 objectForKeyedSubscript:@"myInfo"];

  if (v194)
  {
    unsigned int v63 = [(FMFDataManager *)val isActiveAutoMeDevice];
    [(FMFDataManager *)val set_myInfo:v194];
    if (v63 != [(FMFDataManager *)val isActiveAutoMeDevice])
    {
      id v64 = sub_100005560();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "digestCommand: Posting Auto Me Device changed notification", buf, 2u);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, FMFHomeKitAutomationDeviceChangedNotification, 0, 0, 1u);
    }
    long long v222 = 0u;
    long long v223 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    BOOL v66 = [(FMFDataManager *)val _devices];
    id v67 = [v66 countByEnumeratingWithState:&v220 objects:v233 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v221;
      id obj = v66;
      do
      {
        for (i = 0; i != v67; i = (char *)i + 1)
        {
          if (*(void *)v221 != v68) {
            objc_enumerationMutation(obj);
          }
          long long v70 = *(void **)(*((void *)&v220 + 1) + 8 * i);
          v71 = [(FMFDataManager *)val _myInfo];
          v72 = [v71 objectForKeyedSubscript:@"meDeviceId"];
          v73 = +[NSNull null];
          if (v72 == v73)
          {
            id v75 = 0;
          }
          else
          {
            v74 = [(FMFDataManager *)val _myInfo];
            id v75 = [v74 objectForKeyedSubscript:@"meDeviceId"];
          }
          v76 = [(FMFDataManager *)val _myInfo];
          v77 = [v76 objectForKeyedSubscript:@"deviceId"];
          v78 = +[NSNull null];
          if (v77 == v78)
          {
            id v80 = 0;
          }
          else
          {
            v79 = [(FMFDataManager *)val _myInfo];
            id v80 = [v79 objectForKeyedSubscript:@"deviceId"];
          }
          v81 = [v70 deviceId];
          id v82 = [v75 isEqualToString:v81];

          v83 = [v70 deviceId];
          id v84 = [v80 isEqualToString:v83];

          [v70 updateIsActive:v82 isThisDevice:v84];
          [(FMFDataManager *)val determineNewMeDevice];
        }
        BOOL v66 = obj;
        id v67 = [obj countByEnumeratingWithState:&v220 objects:v233 count:16];
      }
      while (v67);
    }

    v85 = [(FMFDataManager *)val _devices];

    if (v85)
    {
      v86 = [(FMFDataManager *)val changesToBeNotified];
      v87 = [(FMFDataManager *)val _devices];
      [v86 setObject:v87 forKey:@"devices"];
    }
    uint64_t v61 = sub_100005560();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "MyInfo update received.", buf, 2u);
    }
    goto LABEL_71;
  }
  id v194 = 0;
LABEL_73:
  id v88 = [v196 objectForKeyedSubscript:@"devices"];
  id v89 = +[NSNull null];
  if (v88 == v89)
  {
    id v192 = 0;
    id v94 = v88;
  }
  else
  {
    id v192 = [v196 objectForKeyedSubscript:@"devices"];

    if (!v192)
    {
      id v192 = 0;
      goto LABEL_87;
    }
    v90 = [(FMFDataManager *)val _myInfo];
    v91 = [v90 objectForKeyedSubscript:@"meDeviceId"];
    v92 = +[NSNull null];
    if (v91 == v92)
    {
      id v94 = 0;
    }
    else
    {
      v93 = [(FMFDataManager *)val _myInfo];
      id v94 = [v93 objectForKeyedSubscript:@"meDeviceId"];
    }
    v95 = [(FMFDataManager *)val _myInfo];
    v96 = [v95 objectForKeyedSubscript:@"deviceId"];
    v97 = +[NSNull null];
    if (v96 == v97)
    {
      id v88 = 0;
    }
    else
    {
      v98 = [(FMFDataManager *)val _myInfo];
      id v88 = [v98 objectForKeyedSubscript:@"deviceId"];
    }
    v99 = [(FMFDataManager *)val companionDeviceId];
    v100 = +[Unmarshaller sharedInstance];
    v101 = [v100 devicesFromData:v192 meDeviceId:v94 thisDeviceId:v88 companionDeviceId:v99];
    [(FMFDataManager *)val set_devices:v101];

    [(FMFDataManager *)val determineNewMeDevice];
    v102 = [(FMFDataManager *)val changesToBeNotified];
    v103 = [(FMFDataManager *)val _devices];
    [v102 setObject:v103 forKey:@"devices"];

    v104 = sub_100005560();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "Devices update received.", buf, 2u);
    }
  }
LABEL_87:
  v105 = +[Unmarshaller sharedInstance];
  v199 = [v105 locationFromRefresh:v196];

  v201 = +[NSMutableSet set];
  if (v199)
  {
    long long v218 = 0u;
    long long v219 = 0u;
    long long v216 = 0u;
    long long v217 = 0u;
    v106 = [v199 allKeys];
    id v107 = [v106 countByEnumeratingWithState:&v216 objects:v232 count:16];
    if (v107)
    {
      id obja = 0;
      v108 = 0;
      uint64_t v198 = *(void *)v217;
      id v197 = v106;
      do
      {
        id v200 = v107;
        for (j = 0; j != v200; j = (char *)j + 1)
        {
          if (*(void *)v217 != v198) {
            objc_enumerationMutation(v197);
          }
          uint64_t v110 = *(void *)(*((void *)&v216 + 1) + 8 * (void)j);
          v111 = [v199 objectForKey:v110];

          v112 = [(FMFDataManager *)val _locationDictionary];
          v113 = [v112 objectForKey:v110];

          id obja = v111;
          v108 = v113;
          if (v113)
          {
            v114 = [v113 location];
            v115 = [v114 timestamp];
            v116 = [v111 location];
            v117 = [v116 timestamp];
            unsigned int v118 = [v115 isEqualToDate:v117];

            int v119 = v118 ^ 1;
          }
          else
          {
            int v119 = 0;
          }
          if (v111) {
            BOOL v120 = v113 == 0;
          }
          else {
            BOOL v120 = 0;
          }
          int v121 = v120;
          v122 = [v113 location];
          if (v122)
          {
            BOOL v123 = 1;
          }
          else
          {
            v124 = [v111 location];
            BOOL v123 = v124 != 0;
          }
          unsigned int v125 = [v111 isMoreRecentThan:v108];
          if (v123)
          {
            v126 = sub_100005560();
            if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
            {
              v128 = [obja timestamp];
              v129 = [v108 timestamp];
              *(_DWORD *)buf = 138412802;
              v225 = v128;
              __int16 v226 = 2112;
              id v227 = v129;
              __int16 v228 = 1024;
              LODWORD(v229) = v125;
              _os_log_debug_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEBUG, "FMFDataManager: digestCommand: new location timestamp: %@, cached location timestamp: %@, new location is more recent?: %d", buf, 0x1Cu);
            }
            if (((v119 | v121) & v125) == 1) {
              [v201 addObject:obja];
            }
          }
          if (v125)
          {
            v127 = [(FMFDataManager *)val _locationDictionary];
            [v127 setObject:obja forKey:v110];
          }
        }
        v106 = v197;
        id v107 = [v197 countByEnumeratingWithState:&v216 objects:v232 count:16];
      }
      while (v107);
    }
    else
    {
      id obja = 0;
      v108 = 0;
    }

    [(FMFDataManager *)val sanitizeLocationsCache:0];
  }
  v130 = [v196 objectForKeyedSubscript:@"locateInProgress"];
  v131 = +[NSNull null];
  if (v130 == v131)
  {
    id v132 = 0;
  }
  else
  {
    id v132 = [v196 objectForKeyedSubscript:@"locateInProgress"];
  }
  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  id objb = v132;
  id v133 = [objb countByEnumeratingWithState:&v212 objects:v231 count:16];
  if (v133)
  {
    uint64_t v134 = *(void *)v213;
    do
    {
      for (k = 0; k != v133; k = (char *)k + 1)
      {
        if (*(void *)v213 != v134) {
          objc_enumerationMutation(objb);
        }
        v136 = *(void **)(*((void *)&v212 + 1) + 8 * (void)k);
        v137 = [v136 objectForKeyedSubscript:@"id"];
        v138 = [v136 objectForKeyedSubscript:@"status"];
        v139 = [(FMFDataManager *)val _locationDictionary];
        v140 = [v139 objectForKeyedSubscript:v137];

        LODWORD(v139) = [v138 isEqualToString:@"none"];
        unsigned int v141 = [v140 isLocatingInProgress];
        uint64_t v142 = v139 ^ 1;
        [v140 setLocatingInProgress:v142];
        if (v141 != v142 && v140 != 0)
        {
          [v201 addObject:v140];
          v144 = [(FMFDataManager *)val _locationDictionary];
          [v144 setObject:v140 forKey:v137];
        }
      }
      id v133 = [objb countByEnumeratingWithState:&v212 objects:v231 count:16];
    }
    while (v133);
  }

  if ([v201 count])
  {
    v145 = [(FMFDataManager *)val changesToBeNotified];
    [v145 setObject:v201 forKey:@"changedLocations"];

    v146 = sub_100005560();
    if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v146, OS_LOG_TYPE_DEFAULT, "Location updates received.", buf, 2u);
    }
  }
  v147 = [(FMFDataManager *)val changesToBeNotified];
  v148 = [v147 objectForKeyedSubscript:@"following"];
  v149 = [v148 objectForKeyedSubscript:@"removed"];

  long long v210 = 0u;
  long long v211 = 0u;
  long long v208 = 0u;
  long long v209 = 0u;
  id v150 = v149;
  id v151 = [v150 countByEnumeratingWithState:&v208 objects:v230 count:16];
  if (v151)
  {
    uint64_t v152 = *(void *)v209;
    do
    {
      for (m = 0; m != v151; m = (char *)m + 1)
      {
        if (*(void *)v209 != v152) {
          objc_enumerationMutation(v150);
        }
        v154 = *(void **)(*((void *)&v208 + 1) + 8 * (void)m);
        v155 = [(FMFDataManager *)val _locationDictionary];
        v156 = [v154 serverId];
        [v155 removeObjectForKey:v156];
      }
      id v151 = [v150 countByEnumeratingWithState:&v208 objects:v230 count:16];
    }
    while (v151);
  }

  if (v191)
  {
    v157 = [(FMFDataManager *)val followerHandles];
    v158 = (char *)[v157 count];
    v159 = [(FMFDataManager *)val followingHandles];
    id v160 = [v159 count];

    v161 = &v158[(void)v160];
    v162 = +[NSNumber numberWithUnsignedInteger:&v158[(void)v160]];
    v163 = sub_100005560();
    if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    {
      v164 = [(FMFDataManager *)val followerHandles];
      id v165 = [v164 count];
      v166 = [(FMFDataManager *)val followingHandles];
      id v167 = [v166 count];
      *(_DWORD *)buf = 134218496;
      v225 = v161;
      __int16 v226 = 2048;
      id v227 = v165;
      __int16 v228 = 2048;
      id v229 = v167;
      _os_log_impl((void *)&_mh_execute_header, v163, OS_LOG_TYPE_DEFAULT, "Updating friends/followers count with total: %lu = followers: %lu + following: %lu", buf, 0x20u);
    }
    v168 = +[FMFLazyInitController sharedInstance];
    [v168 updateFriendsFollowersCount:v162];
  }
  v169 = [v196 objectForKeyedSubscript:@"prefs"];
  v170 = +[NSNull null];
  if (v169 == v170)
  {
    id v171 = 0;
    v172 = v194;
  }
  else
  {
    id v171 = [v196 objectForKeyedSubscript:@"prefs"];

    v172 = v171;
  }

  v173 = [v171 objectForKeyedSubscript:@"favorites"];
  v174 = +[NSNull null];

  v175 = +[NSNull null];
  if (v173 == v175) {
    v176 = 0;
  }
  else {
    v176 = v173;
  }
  v177 = v176;

  if (v177) {
    BOOL v178 = 1;
  }
  else {
    BOOL v178 = v173 == v174;
  }
  if (v178)
  {
    v179 = sub_100005560();
    if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v225 = v177;
      __int16 v226 = 1024;
      LODWORD(v227) = v173 == v174;
      _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "Favorites received: %@. Should clear favorites: %d", buf, 0x12u);
    }

    v180 = [(FMFDataManager *)val favoritesSequencer];
    v181 = [(FMFDataManager *)val _followingHandleMapWithServerId];
    [v180 updateHandles:v181 withFavoriteArray:v177];

    v182 = [(FMFDataManager *)val changesToBeNotified];
    [v182 setObject:&__kCFBooleanTrue forKey:@"favorites"];
  }
  objc_initWeak((id *)buf, val);
  v183 = [(FMFDataManager *)val fenceSequencer];
  v206[0] = _NSConcreteStackBlock;
  v206[1] = 3221225472;
  v206[2] = sub_10002ED68;
  v206[3] = &unk_1000A26B0;
  objc_copyWeak(&v207, (id *)buf);
  [v183 setFencesFromResponseDictionary:v196 withCompletion:v206];

  v184 = [v196 objectForKeyedSubscript:@"alert"];
  v185 = +[NSNull null];
  if (v184 == v185)
  {
    id v186 = 0;
  }
  else
  {
    id v186 = [v196 objectForKeyedSubscript:@"alert"];
  }
  objc_destroyWeak(&v207);
  objc_destroyWeak((id *)buf);

  objc_sync_exit(val);
  if (v186)
  {
    v187 = sub_100005560();
    if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v225 = (char *)v186;
      _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "Posting Server Driven Alert Notification with Alert Info %@", buf, 0xCu);
    }

    v188 = +[NSNotificationCenter defaultCenter];
    [v188 postNotificationName:off_1000BAFD0 object:val userInfo:v186];
  }
}

- (void)deltasFromExisting:(id)a3 usingLatest:(id)a4 forKey:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v18 count] && objc_msgSend(v8, "count"))
  {
    id v10 = [v8 mutableCopy];
    [v10 minusSet:v18];
    if ([v10 count])
    {
      id v11 = +[NSDictionary dictionaryWithObject:v10 forKey:@"added"];
      __int16 v12 = [(FMFDataManager *)self changesToBeNotified];
      [v12 setObject:v11 forKey:v9];
    }
    id v13 = [v18 mutableCopy];
    [v13 minusSet:v8];
    if ([v13 count])
    {
      long long v14 = +[NSDictionary dictionaryWithObject:v13 forKey:@"removed"];
      long long v15 = [(FMFDataManager *)self changesToBeNotified];
      [v15 setObject:v14 forKey:v9];
    }
    goto LABEL_14;
  }
  if ([v18 count] && !objc_msgSend(v8, "count"))
  {
    id v16 = [v18 copy];
    CFStringRef v17 = @"removed";
    goto LABEL_13;
  }
  if (![v18 count] && objc_msgSend(v8, "count"))
  {
    id v16 = [v8 copy];
    CFStringRef v17 = @"added";
LABEL_13:
    id v10 = +[NSDictionary dictionaryWithObject:v16 forKey:v17];

    id v13 = [(FMFDataManager *)self changesToBeNotified];
    [v13 setObject:v10 forKey:v9];
LABEL_14:
  }
}

- (void)notifyClientOfUpdates:(id)a3
{
  id v4 = (FMFDataManager *)a3;
  [(FMFDataManager *)self updateInited];
  id v5 = +[FMFCommandManager sharedInstance];
  unsigned __int8 v6 = [v5 hasModelInitialized];

  id v7 = sub_100005560();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v174 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "\n    ************************************************************************\n              Updates received %@\n    ************************************************************************", buf, 0xCu);
    }

    id v9 = +[FMFXPCSessionManager sharedInstance];
    id v10 = [v9 clientSessions];
    id v11 = [v10 copy];

    __int16 v12 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"followers"];
    unsigned int v118 = [v12 objectForKeyedSubscript:@"added"];

    id v13 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"followers"];
    v126 = [v13 objectForKeyedSubscript:@"removed"];

    long long v14 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"following"];
    int v119 = [v14 objectForKeyedSubscript:@"added"];

    long long v15 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"following"];
    v127 = [v15 objectForKeyedSubscript:@"removed"];

    id v16 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"futureFollower"];
    unsigned int v125 = [v16 objectForKeyedSubscript:@"added"];

    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id obj = v11;
    id v128 = [obj countByEnumeratingWithState:&v169 objects:v185 count:16];
    if (v128)
    {
      CFStringRef v17 = 0;
      CFStringRef name = (const __CFString *)FMFLocationSharingStatusChanged;
      uint64_t v122 = *(void *)v170;
      BOOL v123 = self;
      v124 = v4;
      while (1)
      {
        uint64_t v18 = 0;
        long long v19 = v17;
        do
        {
          if (*(void *)v170 != v122) {
            objc_enumerationMutation(obj);
          }
          uint64_t v130 = v18;
          long long v20 = *(void **)(*((void *)&v169 + 1) + 8 * v18);
          unsigned int v21 = [(FMFDataManager *)self transcriptDelegateStartEnabled];
          unsigned int v22 = [(FMFDataManager *)self followersFullyInited];
          v135 = v20;
          if (v21)
          {
            if (v22)
            {
              long long v167 = 0u;
              long long v168 = 0u;
              long long v165 = 0u;
              long long v166 = 0u;
              long long v23 = v118;
              id v24 = [v23 countByEnumeratingWithState:&v165 objects:v184 count:16];
              if (v24)
              {
                id v25 = v24;
                uint64_t v26 = *(void *)v166;
                do
                {
                  for (i = 0; i != v25; i = (char *)i + 1)
                  {
                    if (*(void *)v166 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    uint64_t v28 = *(void *)(*((void *)&v165 + 1) + 8 * i);
                    v29 = [v20 clientProxy];
                    [v29 didAddFollowerHandle:v28];

                    long long v20 = v135;
                  }
                  id v25 = [v23 countByEnumeratingWithState:&v165 objects:v184 count:16];
                }
                while (v25);
              }
            }
            else
            {
              long long v23 = sub_100005560();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Skipping sending followers, not fully inited", buf, 2u);
              }
            }
            goto LABEL_24;
          }
          if (v22 && [v118 count])
          {
            long long v23 = [v20 clientProxy];
            [v23 didAddFollowerHandle:0];
LABEL_24:
          }
          if ([(FMFDataManager *)self transcriptDelegateStopEnabled])
          {
            long long v163 = 0u;
            long long v164 = 0u;
            long long v161 = 0u;
            long long v162 = 0u;
            id v30 = v126;
            id v31 = [v30 countByEnumeratingWithState:&v161 objects:v183 count:16];
            if (v31)
            {
              id v32 = v31;
              uint64_t v33 = *(void *)v162;
              do
              {
                for (j = 0; j != v32; j = (char *)j + 1)
                {
                  if (*(void *)v162 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  uint64_t v35 = *(void *)(*((void *)&v161 + 1) + 8 * (void)j);
                  unint64_t v36 = [v20 clientProxy];
                  [v36 didRemoveFollowerHandle:v35];

                  long long v20 = v135;
                }
                id v32 = [v30 countByEnumeratingWithState:&v161 objects:v183 count:16];
              }
              while (v32);
            }
          }
          else
          {
            if (![v126 count]) {
              goto LABEL_37;
            }
            id v30 = [v20 clientProxy];
            [v30 didRemoveFollowerHandle:0];
          }

LABEL_37:
          unsigned int v37 = [(FMFDataManager *)self transcriptDelegateStartEnabled];
          unsigned int v38 = [(FMFDataManager *)self followingFullyInited];
          if (v37)
          {
            if (v38)
            {
              long long v159 = 0u;
              long long v160 = 0u;
              long long v157 = 0u;
              long long v158 = 0u;
              id v39 = v119;
              id v40 = [v39 countByEnumeratingWithState:&v157 objects:v182 count:16];
              if (v40)
              {
                id v41 = v40;
                uint64_t v42 = *(void *)v158;
                do
                {
                  for (k = 0; k != v41; k = (char *)k + 1)
                  {
                    if (*(void *)v158 != v42) {
                      objc_enumerationMutation(v39);
                    }
                    uint64_t v44 = *(void *)(*((void *)&v157 + 1) + 8 * (void)k);
                    v45 = [v20 clientProxy];
                    [v45 didStartFollowingHandle:v44];

                    long long v20 = v135;
                  }
                  id v41 = [v39 countByEnumeratingWithState:&v157 objects:v182 count:16];
                }
                while (v41);
              }
            }
            else
            {
              id v39 = sub_100005560();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Skipping sending following, not fully inited", buf, 2u);
              }
            }
            goto LABEL_52;
          }
          if (v38 && [v119 count])
          {
            id v39 = [v20 clientProxy];
            [v39 didStartFollowingHandle:0];
LABEL_52:
          }
          if ([(FMFDataManager *)self transcriptDelegateStopEnabled])
          {
            long long v155 = 0u;
            long long v156 = 0u;
            long long v153 = 0u;
            long long v154 = 0u;
            id v46 = v127;
            id v47 = [v46 countByEnumeratingWithState:&v153 objects:v181 count:16];
            if (v47)
            {
              id v48 = v47;
              uint64_t v49 = *(void *)v154;
              do
              {
                for (m = 0; m != v48; m = (char *)m + 1)
                {
                  if (*(void *)v154 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  uint64_t v51 = *(void *)(*((void *)&v153 + 1) + 8 * (void)m);
                  v52 = [v20 clientProxy];
                  [v52 didStopFollowingHandle:v51];

                  long long v20 = v135;
                }
                id v48 = [v46 countByEnumeratingWithState:&v153 objects:v181 count:16];
              }
              while (v48);
            }
          }
          else
          {
            if (![v127 count]) {
              goto LABEL_65;
            }
            id v46 = [v20 clientProxy];
            [v46 didStopFollowingHandle:0];
          }

LABEL_65:
          long long v151 = 0u;
          long long v152 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          id v53 = v125;
          id v54 = [v53 countByEnumeratingWithState:&v149 objects:v180 count:16];
          if (v54)
          {
            id v55 = v54;
            uint64_t v56 = *(void *)v150;
            do
            {
              for (n = 0; n != v55; n = (char *)n + 1)
              {
                if (*(void *)v150 != v56) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v58 = *(void *)(*((void *)&v149 + 1) + 8 * (void)n);
                v59 = [v20 clientProxy];
                [v59 didReceiveFriendshipRequest:v58];

                long long v20 = v135;
              }
              id v55 = [v53 countByEnumeratingWithState:&v149 objects:v180 count:16];
            }
            while (v55);
          }

          uint64_t v60 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"pendingOffers"];

          if (v60)
          {
            uint64_t v61 = [v20 clientProxy];
            [v61 didUpdatePendingOffersForHandles:v60];
          }
          v129 = (void *)v60;
          int v62 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"hideLocation"];

          if (v62)
          {
            unsigned int v63 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"hideLocation"];
            id v64 = [v63 objectForKeyedSubscript:@"updatedStatus"];
            id v65 = [v64 BOOLValue];

            BOOL v66 = [v20 clientProxy];
            [v66 didUpdateHideFromFollowersStatus:v65];

            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
          }
          uint64_t v68 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"favorites"];

          if (v68)
          {
            long long v69 = [v20 clientProxy];
            long long v70 = [(FMFDataManager *)self favoritesSequencer];
            v71 = [v70 favorites];
            [v69 didUpdateFavorites:v71];
          }
          id v136 = objc_alloc_init((Class)NSMutableSet);
          long long v145 = 0u;
          long long v146 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          id v131 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"changedLocations"];
          id v133 = [v131 countByEnumeratingWithState:&v145 objects:v179 count:16];
          if (v133)
          {
            uint64_t v132 = *(void *)v146;
            do
            {
              uint64_t v72 = 0;
              do
              {
                if (*(void *)v146 != v132) {
                  objc_enumerationMutation(v131);
                }
                uint64_t v134 = v72;
                v73 = *(void **)(*((void *)&v145 + 1) + 8 * v72);
                v74 = [v20 handles];
                id v75 = [v74 copy];

                long long v143 = 0u;
                long long v144 = 0u;
                long long v141 = 0u;
                long long v142 = 0u;
                id v76 = v75;
                id v77 = [v76 countByEnumeratingWithState:&v141 objects:v178 count:16];
                if (v77)
                {
                  id v78 = v77;
                  uint64_t v79 = *(void *)v142;
                  do
                  {
                    for (ii = 0; ii != v78; ii = (char *)ii + 1)
                    {
                      if (*(void *)v142 != v79) {
                        objc_enumerationMutation(v76);
                      }
                      v81 = *(void **)(*((void *)&v141 + 1) + 8 * (void)ii);
                      id v82 = [v73 handle];
                      if ([v82 isEqual:v81])
                      {
                      }
                      else
                      {
                        v83 = [v81 serverId];
                        id v84 = [v73 handle];
                        v85 = [v84 serverId];
                        unsigned int v86 = [v83 isEqualToString:v85];

                        if (!v86) {
                          continue;
                        }
                      }
                      [v136 addObject:v73];
                    }
                    id v78 = [v76 countByEnumeratingWithState:&v141 objects:v178 count:16];
                  }
                  while (v78);
                }

                uint64_t v72 = v134 + 1;
                long long v20 = v135;
              }
              while ((id)(v134 + 1) != v133);
              id v133 = [v131 countByEnumeratingWithState:&v145 objects:v179 count:16];
            }
            while (v133);
          }

          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          v87 = [v136 allObjects];
          id v88 = [v87 countByEnumeratingWithState:&v137 objects:v177 count:16];
          self = v123;
          id v4 = v124;
          if (v88)
          {
            id v89 = v88;
            uint64_t v90 = *(void *)v138;
            do
            {
              for (jj = 0; jj != v89; jj = (char *)jj + 1)
              {
                if (*(void *)v138 != v90) {
                  objc_enumerationMutation(v87);
                }
                uint64_t v92 = *(void *)(*((void *)&v137 + 1) + 8 * (void)jj);
                v93 = sub_100005560();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v174 = v123;
                  __int16 v175 = 2112;
                  uint64_t v176 = v92;
                  _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%@: ingesting (notify): %@", buf, 0x16u);
                }
              }
              id v89 = [v87 countByEnumeratingWithState:&v137 objects:v177 count:16];
            }
            while (v89);
          }

          id v94 = [v135 clientProxy];
          id v95 = [v136 copy];
          [v94 setLocations:v95];

          v96 = [(FMFDataManager *)v124 objectForKeyedSubscript:@"meDevice"];
          if (v96)
          {
            v97 = [v135 clientProxy];
            v98 = +[NSNull null];
            if (v96 == v98) {
              v99 = 0;
            }
            else {
              v99 = v96;
            }
            [v97 didChangeActiveLocationSharingDevice:v99];
          }
          v100 = [(FMFDataManager *)v124 objectForKeyedSubscript:@"devices"];
          if (v100)
          {
            v101 = [v135 clientProxy];
            [v101 didUpdateActiveDeviceList:v100];
          }
          CFStringRef v17 = v129;
          uint64_t v18 = v130 + 1;
          long long v19 = v129;
        }
        while ((id)(v130 + 1) != v128);
        id v128 = [obj countByEnumeratingWithState:&v169 objects:v185 count:16];
        if (!v128)
        {

          break;
        }
      }
    }

    if ([v118 count] || objc_msgSend(v126, "count"))
    {
      v102 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v102, FMFFollowersChangedNotification, 0, 0, 0);
    }
    if ([v126 count])
    {
      v103 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v103, FMFFollowersRemovedNotification, 0, 0, 1u);
      v104 = sub_100005560();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: secureLocations - posted removedFollowers notification", buf, 2u);
      }
    }
    if ([v127 count])
    {
      v105 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v105, FMFFollowingRemovedNotification, 0, 0, 1u);
      v106 = sub_100005560();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: secureLocations - posted removedFollowings notification", buf, 2u);
      }
    }
    if ([v119 count] || objc_msgSend(v127, "count")) {
      [(FMFDataManager *)self donateFollowingsChangeEventsForAddedFollowings:v119 removedFollowings:v127];
    }
    id v107 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"meDevice"];
    if (v107)
    {
      v108 = sub_100005560();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posting Me Device changed notification", buf, 2u);
      }

      v109 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v109, FMFMeDeviceChangedNotification, 0, 0, 1u);
    }
    uint64_t v110 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"devices"];
    if (v110)
    {
      v111 = sub_100005560();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posting Devices changed notification", buf, 2u);
      }

      v112 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v112, FMFDevicesChangedNotification, 0, 0, 1u);
    }
    v113 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v113, FMFDataUpdateCompleteNotification, 0, 0, 1u);
    v114 = sub_100005560();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posted notification of dataUpdate complete", buf, 2u);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v174 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Skipping notifying delegates as model is not fully initialized for updatas: %@", buf, 0xCu);
    }

    v115 = [(FMFDataManager *)v4 objectForKeyedSubscript:@"devices"];

    if (v115)
    {
      v116 = sub_100005560();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "notifyClientOfUpdates: Posting Devices changed notification", buf, 2u);
      }

      v117 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v117, FMFDevicesChangedNotification, 0, 0, 1u);
    }
  }
}

- (void)donateFollowingsChangeEventsForAddedFollowings:(id)a3 removedFollowings:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[BMStreams findMyLocationChangeStream];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      __int16 v12 = 0;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v12);
        id v14 = objc_alloc((Class)BMFindMyLocationChangeEvent);
        long long v15 = [v13 identifier];
        id v16 = [v14 initWithIDSHandle:v15 locationChangeType:1];

        CFStringRef v17 = [v7 source];
        [v17 sendEvent:v16];

        __int16 v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = v6;
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      unsigned int v22 = 0;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v22);
        id v24 = objc_alloc((Class)BMFindMyLocationChangeEvent);
        id v25 = [v23 identifier:v30];
        id v26 = [v24 initWithIDSHandle:v25 locationChangeType:2];

        v27 = [v7 source];
        [v27 sendEvent:v26];

        unsigned int v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v20);
  }

  id v28 = [objc_alloc((Class)CHSTimelineController) initForAvocadoIdentifier:@"com.apple.findmy.FindMyWidgetPeople" inBundleIdentifier:@"com.apple.findmy.FindMyWidgetPeople"];
  id v29 = [v28 reloadTimeline];
}

- (void)updateInited
{
  if ([(FMFDataManager *)self followersInfoReceived]
    && ![(FMFDataManager *)self followersFullyInited])
  {
    v3 = sub_100005560();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fully initing followers", buf, 2u);
    }

    [(FMFDataManager *)self setFollowersFullyInited:1];
  }
  if ([(FMFDataManager *)self followingInfoReceived]
    && ![(FMFDataManager *)self followingFullyInited])
  {
    id v4 = sub_100005560();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fully initing following", v5, 2u);
    }

    [(FMFDataManager *)self setFollowingFullyInited:1];
  }
}

- (id)allDevices
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(FMFDataManager *)v2 _devices];
  objc_sync_exit(v2);

  return v3;
}

- (id)thisDeviceId
{
  v3 = [(FMFDataManager *)self _myInfo];
  id v4 = [v3 objectForKeyedSubscript:@"deviceId"];
  id v5 = +[NSNull null];
  if (v4 == v5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(FMFDataManager *)self _myInfo];
    id v7 = [v6 objectForKeyedSubscript:@"deviceId"];
  }

  return v7;
}

- (id)companionDeviceId
{
  v3 = [(FMFDataManager *)self _myInfo];
  id v4 = [v3 objectForKeyedSubscript:@"companionDeviceId"];
  id v5 = +[NSNull null];
  if (v4 == v5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(FMFDataManager *)self _myInfo];
    id v7 = [v6 objectForKeyedSubscript:@"companionDeviceId"];
  }
  if (v7 && [v7 length]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)maxLocationRefreshTimeout
{
  v2 = +[FMFCommandManager sharedInstance];
  v3 = [v2 commandServerContext];
  id v4 = [v3 objectForKey:@"maxCallbackIntervalInMS"];
  id v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", ((int)[v4 intValue] / 1000));

  return v5;
}

- (void)setFollowingHandles:(id)a3
{
  id v4 = a3;
  id v19 = self;
  [(FMFDataManager *)self set_followingHandlesInternal:v4];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        __int16 v12 = [v11 identifier];
        [v5 setObject:v11 forKey:v12];

        id v13 = [v11 serverId];
        [v6 setObject:v11 forKey:v13];

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v14 = [v11 aliasServerIds];
        id v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v22;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v22 != v17) {
                objc_enumerationMutation(v14);
              }
              [v6 setObject:v11 forKey:*(void *)(*((void *)&v21 + 1) + 8 * (void)j)];
            }
            id v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v16);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  [(FMFDataManager *)v19 set_followingHandleMapWithIdentifier:v5];
  [(FMFDataManager *)v19 set_followingHandleMapWithServerId:v6];
}

- (void)setFollowerHandles:(id)a3
{
  id v4 = a3;
  id v20 = self;
  [(FMFDataManager *)self set_followerHandlesInternal:v4];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        __int16 v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = [v12 identifier];
        if (v13
          && (id v14 = (void *)v13,
              [v12 serverId],
              id v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v14,
              v15))
        {
          id v16 = [v12 identifier];
          [v5 setObject:v12 forKey:v16];

          uint64_t v17 = [v12 serverId];
          [v6 setObject:v12 forKey:v17];
        }
        else
        {
          uint64_t v17 = sub_100005560();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            id v18 = [v12 identifier];
            id v19 = [v12 serverId];
            *(_DWORD *)buf = 138412802;
            long long v26 = v18;
            __int16 v27 = 2112;
            long long v28 = v19;
            __int16 v29 = 2112;
            long long v30 = v12;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Invalid handle identifier(%@) or serverId(%@) for handle(%@)", buf, 0x20u);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  [(FMFDataManager *)v20 set_followerHandleMapWithIdentifier:v5];
  [(FMFDataManager *)v20 set_followerHandleMapWithServerId:v6];
}

- (void)setFutureFollowerRequests:(id)a3
{
  id v4 = a3;
  [(FMFDataManager *)self set_futureFollowerRequestsInternal:v4];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      __int16 v12 = v9;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        id v9 = [v13 fromHandle:v15];

        if (v9)
        {
          id v14 = [v9 identifier];
          [v5 setObject:v13 forKey:v14];
        }
        uint64_t v11 = (char *)v11 + 1;
        __int16 v12 = v9;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  [(FMFDataManager *)self set_futureFollowerRequestMapWithIdentifier:v5];
}

- (void)setLocationsFromData:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = +[Unmarshaller sharedInstance];
  id v7 = [v6 locationFromRefresh:v4];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  __int16 v29 = v7;
  id v8 = [v7 allValues];
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v43 count:16];
  id obj = v8;
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v31 = *(void *)v34;
    do
    {
      id v32 = v9;
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = [(FMFDataManager *)v5 _followerHandleMapWithIdentifier];
        id v14 = [v12 handle];
        long long v15 = [v14 identifier];
        uint64_t v16 = [v13 objectForKey:v15];

        uint64_t v10 = (void *)v16;
        if (v16) {
          goto LABEL_8;
        }
        long long v17 = [(FMFDataManager *)v5 _followingHandleMapWithServerId];
        long long v18 = [v12 handle];
        id v19 = [v18 serverId];
        uint64_t v10 = [v17 objectForKey:v19];

        if (v10)
        {
LABEL_8:
          id v20 = [(FMFDataManager *)v5 _locationDictionary];
          long long v21 = [v10 serverId];
          long long v22 = [v20 objectForKey:v21];

          unsigned int v23 = [v12 isMoreRecentThan:v22];
          long long v24 = sub_100005560();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            __int16 v27 = [v12 timestamp];
            long long v28 = [v22 timestamp];
            *(_DWORD *)buf = 138412802;
            unsigned int v38 = v27;
            __int16 v39 = 2112;
            id v40 = v28;
            __int16 v41 = 1024;
            unsigned int v42 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "FMFDataManager: setLocationsFromData: new location timestamp: %@, cached location timestamp: %@, new location is more recent?: %d", buf, 0x1Cu);
          }
          if (v23)
          {
            long long v25 = [(FMFDataManager *)v5 _locationDictionary];
            long long v26 = [v10 serverId];
            [v25 setObject:v12 forKey:v26];
          }
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v9);
  }
  objc_sync_exit(v5);
}

- (id)futureFollowingRequests
{
  v2 = [(FMFDataManager *)self _futureFollowingRequestsInternal];
  id v3 = [v2 copy];

  return v3;
}

- (id)futureFollowerRequests
{
  v2 = [(FMFDataManager *)self _futureFollowerRequestsInternal];
  id v3 = [v2 copy];

  return v3;
}

- (id)followingHandleForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFDataManager *)self _followingHandleMapWithIdentifier];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)followerHandleForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFDataManager *)self _followerHandleMapWithIdentifier];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)locationForHandle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 identifier];
  id v7 = [(FMFDataManager *)v5 followingHandleForIdentifier:v6];

  id v8 = [(FMFDataManager *)v5 _locationDictionary];
  id v9 = [v7 serverId];
  uint64_t v10 = [v8 objectForKey:v9];

  [(FMFDataManager *)v5 locationTTL];
  double v12 = v11;
  uint64_t v13 = +[NSDate date];
  id v14 = [v10 timestamp];
  [v13 timeIntervalSinceDate:v14];
  uint64_t v16 = v15;

  if (!v10)
  {
LABEL_9:
    id v19 = 0;
    goto LABEL_10;
  }
  if (([v10 isValid] & 1) == 0)
  {
    id v20 = sub_100005560();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412802;
      __int16 v29 = v10;
      __int16 v30 = 2048;
      uint64_t v31 = v16;
      __int16 v32 = 2048;
      uint64_t v33 = (uint64_t)v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Cleaning up old location, location %@, locationAge: %f, locationTTL: %ld", (uint8_t *)&v28, 0x20u);
    }

    long long v21 = [v7 serverId];

    if (v21)
    {
      long long v22 = [(FMFDataManager *)v5 _locationDictionary];
      unsigned int v23 = [v7 serverId];
      [v22 removeObjectForKey:v23];
    }
    goto LABEL_9;
  }
  long long v17 = [v10 handle];
  unsigned __int8 v18 = [v17 isEqual:v4];

  if (v18)
  {
    id v19 = v10;
  }
  else
  {
    id v19 = [v10 copy];

    long long v25 = [v4 serverId];

    if (!v25)
    {
      long long v26 = [v19 handle];
      __int16 v27 = [v26 serverId];
      [v4 setServerId:v27];
    }
    [v19 updateHandle:v4];
  }
LABEL_10:

  objc_sync_exit(v5);

  return v19;
}

- (BOOL)locationHidden
{
  id v3 = [(FMFDataManager *)self _preferences];
  id v4 = [v3 objectForKeyedSubscript:@"hideLocation"];
  id v5 = +[NSNull null];
  if (v4 == v5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(FMFDataManager *)self _preferences];
    id v7 = [v6 objectForKeyedSubscript:@"hideLocation"];
  }
  unsigned __int8 v8 = [v7 isEqualToString:@"Yes"];

  return v8;
}

- (BOOL)isAllowFriendRequestsEnabled
{
  id v3 = [(FMFDataManager *)self _preferences];
  id v4 = [v3 objectForKeyedSubscript:@"allowFriendRequests"];
  id v5 = +[NSNull null];
  if (v4 == v5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(FMFDataManager *)self _preferences];
    id v7 = [v6 objectForKeyedSubscript:@"allowFriendRequests"];
  }
  unsigned __int8 v8 = [v7 isEqualToString:@"Yes"];

  return v8;
}

- (id)getAccountEmailAddress
{
  id v3 = [(FMFDataManager *)self _preferences];
  id v4 = [v3 objectForKeyedSubscript:@"primaryEmail"];
  id v5 = +[NSNull null];
  if (v4 == v5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = [(FMFDataManager *)self _preferences];
    id v7 = [v6 objectForKeyedSubscript:@"primaryEmail"];
  }

  return v7;
}

- (id)locationsForHandles:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      double v11 = 0;
      double v12 = v9;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v9 = -[FMFDataManager locationForHandle:](self, "locationForHandle:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v11), (void)v14);

        if (v9) {
          [v5 addObject:v9];
        }
        double v11 = (char *)v11 + 1;
        double v12 = v9;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)friendshipRequestForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFDataManager *)self _futureFollowerRequestMapWithIdentifier];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)followingHandleForServerId:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFDataManager *)self _followingHandleMapWithServerId];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)followerHandleForServerId:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFDataManager *)self _followerHandleMapWithServerId];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)getHandlesSharingLocationsWithMe:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = [(FMFDataManager *)self followingHandles];
  v4[2](v4, v5, 0);
}

- (void)getHandlesSharingLocationsWithMeWithGroupId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(FMFDataManager *)self followingHandles];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100031E94;
  v12[3] = &unk_1000A2718;
  id v13 = v6;
  id v9 = v6;
  uint64_t v10 = +[NSPredicate predicateWithBlock:v12];
  double v11 = [v8 filteredSetUsingPredicate:v10];

  v7[2](v7, v11, 0);
}

- (void)getHandlesSharingMyLocation:(id)a3
{
  id v5 = a3;
  id v6 = [(FMFDataManager *)self followerHandles];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)getHandlesSharingMyLocationWithGroupId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(FMFDataManager *)self followerHandles];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032028;
  v12[3] = &unk_1000A2718;
  id v13 = v6;
  id v9 = v6;
  uint64_t v10 = +[NSPredicate predicateWithBlock:v12];
  double v11 = [v8 filteredSetUsingPredicate:v10];

  v7[2](v7, v11, 0);
}

- (void)getPendingFriendshipRequestsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[FMFCommandManager sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000320F4;
  v7[3] = &unk_1000A1A68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 refreshForSession:0 withReason:3 withCompletion:v7];
}

- (void)getHandlesWithPendingOffers:(id)a3
{
  id v5 = a3;
  id v6 = [(FMFDataManager *)self getHandlesWithPendingOffersSync];
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)removeFutureFollowerRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(FMFDataManager *)self _futureFollowerRequestMapWithIdentifier];
  id v6 = [v4 fromHandle];

  id v7 = [v6 identifier];
  id v11 = [v5 objectForKey:v7];

  id v8 = objc_alloc((Class)NSMutableSet);
  id v9 = [(FMFDataManager *)self _futureFollowerRequestsInternal];
  id v10 = [v8 initWithSet:v9];

  if (v11) {
    [v10 removeObject:v11];
  }
  [(FMFDataManager *)self setFutureFollowerRequests:v10];
}

- (id)offerExpireDateForHandle:(id)a3 withGroupId:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!v5) {
    id v6 = FMFGroupIdOneToOne;
  }
  id v7 = v5;
  id v8 = [a3 expiresByGroupId];
  id v9 = [v8 objectForKeyedSubscript:v6];

  [v9 doubleValue];
  id v11 = +[NSDate dateWithTimeIntervalSince1970:v10 / 1000.0];

  return v11;
}

- (BOOL)sendOnlyFMFChannel
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"sendOnlyFMFChannel"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)blockFMFChannel
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"blockFMFChannel"];

  LOBYTE(v2) = [v3 BOOLValue];
  return (char)v2;
}

- (BOOL)showAirDropImportAlert
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"showAirDropImportAlert"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)showAirDropImportUseFMFAppAlert
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"showAirDropImportUseFMFAppAlert"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (BOOL)showAirDropImportViewOniCloudAlert
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"showAirDropImportViewOniCloudAlert"];

  if (v3) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)canAddFollower
{
  id v3 = [(FMFDataManager *)self _configFromServer];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"maxFollowers"];
  id v5 = [v4 unsignedIntegerValue];
  id v6 = [(FMFDataManager *)self followerHandles];
  LOBYTE(v5) = v5 > [v6 count];

  return (char)v5;
}

- (BOOL)canAddFriend
{
  id v3 = [(FMFDataManager *)self _configFromServer];
  unsigned __int8 v4 = [v3 objectForKeyedSubscript:@"maxFriends"];
  id v5 = [v4 unsignedIntegerValue];
  id v6 = [(FMFDataManager *)self followingHandles];
  LOBYTE(v5) = v5 > [v6 count];

  return (char)v5;
}

- (BOOL)transcriptDelegateStartEnabled
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"transcriptDelegateStartEnabled"];

  unsigned __int8 v4 = [v3 BOOLValue];
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)transcriptDelegateStopEnabled
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"transcriptDelegateStopEnabled"];

  unsigned __int8 v4 = [v3 BOOLValue];
  if (v3) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

- (double)minCallbackInterval
{
  v2 = +[FMFCommandManager sharedInstance];
  id v3 = [v2 commandServerContext];
  uint64_t v4 = [v3 objectForKey:@"minCallbackIntervalInMS"];

  if (v4) {
    BOOL v5 = (_UNKNOWN **)v4;
  }
  else {
    BOOL v5 = &off_1000A9298;
  }
  double v6 = (double)((int)[v5 intValue] / 1000);

  return v6;
}

- (double)heartbeatIntervalInSec
{
  v2 = +[FMFCommandManager sharedInstance];
  id v3 = [v2 commandServerContext];
  uint64_t v4 = [v3 objectForKey:@"heartbeatIntervalInSec"];
  double v5 = (double)(unint64_t)[v4 unsignedIntegerValue];

  return v5;
}

- (double)maxLocatingInterval
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"maxLocatingIntervalInMS"];
  double v4 = (double)((unint64_t)[v3 unsignedIntegerValue] / 0x3E8);

  return v4;
}

- (double)locationTTL
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"locationTTL"];
  double v4 = (double)((unint64_t)[v3 unsignedIntegerValue] / 0x3E8);

  return v4;
}

- (double)userLocateWaitIntervalInMS
{
  v2 = +[FMFCommandManager sharedInstance];
  id v3 = [v2 commandServerContext];
  double v4 = [v3 objectForKey:@"userLocateWaitIntervalInMS"];
  double v5 = (double)(int)[v4 intValue];

  return v5;
}

- (double)upsellTimeoutInSeconds
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"upsellTimeoutInSec"];
  double v4 = (double)(unint64_t)[v3 unsignedIntegerValue];

  return v4;
}

- (double)systemInactivityTimeoutInSec
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"systemInactivityTimeoutInSec"];
  double v4 = (double)(unint64_t)[v3 unsignedIntegerValue];

  return v4;
}

- (double)maxWaitTimeForRegisterMS
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"maxWaitTimeForRegisterMS"];
  double v4 = (double)(unint64_t)[v3 unsignedIntegerValue];

  return v4;
}

- (id)maxTriesToRegisterDevice
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"maxTriesToRegisterDevice"];

  return v3;
}

- (double)graceInterval401InSec
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"graceInterval401InSec"];
  double v4 = (double)(unint64_t)[v3 unsignedIntegerValue];

  return v4;
}

- (double)graceInterval5XXInSec
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"graceInterval5XXInSec"];
  double v4 = (double)(unint64_t)[v3 unsignedIntegerValue];

  return v4;
}

- (double)lazyInitTimeoutInSec
{
  v2 = [(FMFDataManager *)self _configFromServer];
  id v3 = [v2 objectForKeyedSubscript:@"lazyInitTimeoutInSec"];

  if (!v3)
  {
    id v3 = +[NSNumber numberWithInteger:86400];
  }
  double v4 = +[FMFLazyInitController sharedInstance];
  [v3 doubleValue];
  [v4 updateLazyInitTimeoutInSecStoredValue:];

  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)hasPendingOfferToHandle:(id)a3 withGroupId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    id v7 = FMFGroupIdOneToOne;
  }
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = [(FMFDataManager *)self pendingOfferHandles];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100032DB8;
  v12[3] = &unk_1000A2740;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  long long v15 = &v16;
  [v8 enumerateObjectsUsingBlock:v12];

  LOBYTE(v8) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

- (void)cleanupCachedPendingOfferHandles
{
  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up kFMFCachedOffers", v5, 2u);
  }

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setObject:0 forKey:@"kFMFCachedOffers"];

  double v4 = +[NSUserDefaults standardUserDefaults];
  [v4 synchronize];
}

- (BOOL)isThisDeviceRegistered
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking if this device is registered", buf, 2u);
  }

  double v4 = [(FMFDataManager *)self _myInfo];
  double v5 = [v4 objectForKeyedSubscript:@"deviceId"];
  id v6 = +[NSNull null];
  if (v5 == v6)
  {
    id v8 = 0;
  }
  else
  {
    id v7 = [(FMFDataManager *)self _myInfo];
    id v8 = [v7 objectForKeyedSubscript:@"deviceId"];
  }
  id v9 = [(FMFDataManager *)self _devices];
  id v10 = +[NSPredicate predicateWithFormat:@"deviceId == %@", v8];
  id v11 = [v9 filteredSetUsingPredicate:v10];

  LOBYTE(v9) = [v11 count] != 0;
  return (char)v9;
}

- (BOOL)isActiveAutoMeDevice
{
  v2 = [(FMFDataManager *)self _myInfo];
  id v3 = [v2 objectForKeyedSubscript:@"eligibleAutoMe"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSArray)cachedTapMessages
{
  cachedTapMessages = self->_cachedTapMessages;
  if (!cachedTapMessages)
  {
    unsigned __int8 v4 = [(FMFDataManager *)self tapMessagesFromDefaults];
    [(FMFDataManager *)self setCachedTapMessages:v4];

    cachedTapMessages = self->_cachedTapMessages;
  }

  return cachedTapMessages;
}

- (void)setCachedTapMessages:(id)a3
{
}

- (void)updateTapMessagesCache:(id)a3
{
  id v4 = a3;
  double v5 = [(FMFDataManager *)self cachedTapMessages];
  id v6 = [v5 mutableCopy];

  [v6 addObjectsFromArray:v4];
  if ((unint64_t)[v6 count] >= 6) {
    [v6 removeObjectsInRange:0, (char *)[v6 count] - 5];
  }
  [(FMFDataManager *)self setCachedTapMessages:v6];
  [(FMFDataManager *)self storeTapMessagesToDefaults];
}

- (id)tapMessagesFromDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 valueForKey:@"kFMFTapMessages"];

  if ([v3 count])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSArray array];
  }
  double v5 = v4;

  return v5;
}

- (void)storeTapMessagesToDefaults
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setObject:self->_cachedTapMessages forKey:@"kFMFTapMessages"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 synchronize];
}

- (void)clearTapMessagesCache
{
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up cached tap messages", v5, 2u);
  }

  id v4 = +[NSArray array];
  [(FMFDataManager *)self setCachedTapMessages:v4];

  [(FMFDataManager *)self storeTapMessagesToDefaults];
}

- (void)updateClientsWithLocallyStoredModelCache
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Querying for any locally stored model cache", buf, 2u);
  }

  id v4 = +[FMFDStoreController sharedInstance];
  double v5 = [v4 modelCache];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:off_1000BAC68[0]];
    id v7 = +[NSNull null];
    if (v6 == v7)
    {
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v31 = [v5 objectForKeyedSubscript:off_1000BAC68[0]];
    }

    id v8 = [v5 objectForKeyedSubscript:off_1000BAC70[0]];
    id v9 = +[NSNull null];
    if (v8 == v9)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [v5 objectForKeyedSubscript:off_1000BAC70[0]];
    }

    id v11 = [v5 objectForKeyedSubscript:off_1000BAC78[0]];
    double v12 = +[NSNull null];
    if (v11 == v12)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [v5 objectForKeyedSubscript:off_1000BAC78[0]];
    }

    id v14 = [v5 objectForKeyedSubscript:off_1000BAC80[0]];
    long long v15 = +[NSNull null];
    if (v14 == v15)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = [v5 objectForKeyedSubscript:off_1000BAC80[0]];
    }

    long long v17 = [v5 objectForKeyedSubscript:off_1000BAC88[0]];
    uint64_t v18 = +[NSNull null];
    if (v17 == v18)
    {
      char v19 = 0;
    }
    else
    {
      char v19 = [v5 objectForKeyedSubscript:off_1000BAC88[0]];
    }

    id v20 = [v5 objectForKeyedSubscript:off_1000BAC90[0]];
    long long v21 = +[NSNull null];
    if (v20 == v21)
    {
      long long v22 = 0;
    }
    else
    {
      long long v22 = [v5 objectForKeyedSubscript:off_1000BAC90[0]];
    }

    [(FMFDataManager *)v2 setFollowerHandles:v31];
    [(FMFDataManager *)v2 setFollowingHandles:v10];
    [(FMFDataManager *)v2 set_meDevice:v13];
    [(FMFDataManager *)v2 set_devices:v16];
    [(FMFDataManager *)v2 setModelVersion:v22];
    unsigned int v23 = [(FMFDataManager *)v2 favoritesSequencer];
    [v23 updateWithCachedHandles:v10];

    long long v24 = [(FMFDataManager *)v2 fenceSequencer];
    [v24 setFences:v19];

    v33[0] = @"followers";
    long long v25 = v31;
    if (!v31)
    {
      long long v25 = +[NSNull null];
    }
    v33[1] = @"following";
    v34[0] = v25;
    long long v26 = v10;
    if (!v10)
    {
      long long v26 = +[NSNull null];
    }
    v34[1] = v26;
    __int16 v27 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    if (!v10) {

    }
    if (!v31) {
    int v28 = sub_100005560();
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Updating clients with locally stored model cache", buf, 2u);
    }

    __int16 v29 = +[FMFXPCSessionManager sharedInstance];
    __int16 v30 = [v29 clientSessions];
    [(FMFDataManager *)v2 updateSessionCaches:v27 forSessions:v30 pushAllData:1];
  }
  objc_sync_exit(v2);
}

- (void)setFenceSequencer:(id)a3
{
}

- (FMFFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
}

- (FMFFavoritesSequencer)favoritesSequencer
{
  return self->_favoritesSequencer;
}

- (void)setFavoritesSequencer:(id)a3
{
}

- (NSSet)pendingOfferHandles
{
  return self->_pendingOfferHandles;
}

- (void)setPendingOfferHandles:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSSet)_devices
{
  return self->__devices;
}

- (void)set_devices:(id)a3
{
}

- (void)set_meDevice:(id)a3
{
}

- (NSDictionary)_features
{
  return self->__features;
}

- (void)set_features:(id)a3
{
}

- (NSDictionary)_preferences
{
  return self->__preferences;
}

- (void)set_preferences:(id)a3
{
}

- (NSDictionary)_myInfo
{
  return self->__myInfo;
}

- (void)set_myInfo:(id)a3
{
}

- (NSDictionary)_followingHandleMapWithIdentifier
{
  return self->__followingHandleMapWithIdentifier;
}

- (void)set_followingHandleMapWithIdentifier:(id)a3
{
}

- (NSDictionary)_followingHandleMapWithServerId
{
  return self->__followingHandleMapWithServerId;
}

- (void)set_followingHandleMapWithServerId:(id)a3
{
}

- (NSDictionary)_followerHandleMapWithIdentifier
{
  return self->__followerHandleMapWithIdentifier;
}

- (void)set_followerHandleMapWithIdentifier:(id)a3
{
}

- (NSDictionary)_followerHandleMapWithServerId
{
  return self->__followerHandleMapWithServerId;
}

- (void)set_followerHandleMapWithServerId:(id)a3
{
}

- (void)set_followingHandlesInternal:(id)a3
{
}

- (void)set_followerHandlesInternal:(id)a3
{
}

- (NSSet)_futureFollowingRequestsInternal
{
  return self->__futureFollowingRequestsInternal;
}

- (void)set_futureFollowingRequestsInternal:(id)a3
{
}

- (NSSet)_futureFollowerRequestsInternal
{
  return self->__futureFollowerRequestsInternal;
}

- (void)set_futureFollowerRequestsInternal:(id)a3
{
}

- (NSDictionary)_futureFollowerRequestMapWithIdentifier
{
  return self->__futureFollowerRequestMapWithIdentifier;
}

- (void)set_futureFollowerRequestMapWithIdentifier:(id)a3
{
}

- (void)set_locationDictionary:(id)a3
{
}

- (NSMutableDictionary)changesToBeNotified
{
  return self->_changesToBeNotified;
}

- (void)setChangesToBeNotified:(id)a3
{
}

- (NSTimer)sanitizeLocationsCacheTimer
{
  return self->_sanitizeLocationsCacheTimer;
}

- (void)setSanitizeLocationsCacheTimer:(id)a3
{
}

- (BOOL)followersInfoReceived
{
  return self->_followersInfoReceived;
}

- (void)setFollowersInfoReceived:(BOOL)a3
{
  self->_followersInfoReceived = a3;
}

- (BOOL)followersFullyInited
{
  return self->_followersFullyInited;
}

- (void)setFollowersFullyInited:(BOOL)a3
{
  self->_followersFullyInited = a3;
}

- (BOOL)followingInfoReceived
{
  return self->_followingInfoReceived;
}

- (void)setFollowingInfoReceived:(BOOL)a3
{
  self->_followingInfoReceived = a3;
}

- (BOOL)followingFullyInited
{
  return self->_followingFullyInited;
}

- (void)setFollowingFullyInited:(BOOL)a3
{
  self->_followingFullyInited = a3;
}

- (BOOL)storedConfigLoaded
{
  return self->_storedConfigLoaded;
}

- (void)setStoredConfigLoaded:(BOOL)a3
{
  self->_storedConfigLoaded = a3;
}

- (FMFDStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
}

- (NSString)lastLoggedInPrsIdInternal
{
  return self->_lastLoggedInPrsIdInternal;
}

- (void)setLastLoggedInPrsIdInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLoggedInPrsIdInternal, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_sanitizeLocationsCacheTimer, 0);
  objc_storeStrong((id *)&self->_changesToBeNotified, 0);
  objc_storeStrong((id *)&self->__locationDictionary, 0);
  objc_storeStrong((id *)&self->__futureFollowerRequestMapWithIdentifier, 0);
  objc_storeStrong((id *)&self->__futureFollowerRequestsInternal, 0);
  objc_storeStrong((id *)&self->__futureFollowingRequestsInternal, 0);
  objc_storeStrong((id *)&self->__followerHandlesInternal, 0);
  objc_storeStrong((id *)&self->__followingHandlesInternal, 0);
  objc_storeStrong((id *)&self->__followerHandleMapWithServerId, 0);
  objc_storeStrong((id *)&self->__followerHandleMapWithIdentifier, 0);
  objc_storeStrong((id *)&self->__followingHandleMapWithServerId, 0);
  objc_storeStrong((id *)&self->__followingHandleMapWithIdentifier, 0);
  objc_storeStrong((id *)&self->__myInfo, 0);
  objc_storeStrong((id *)&self->__preferences, 0);
  objc_storeStrong((id *)&self->__features, 0);
  objc_storeStrong((id *)&self->__meDevice, 0);
  objc_storeStrong((id *)&self->__devices, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_pendingOfferHandles, 0);
  objc_storeStrong((id *)&self->_favoritesSequencer, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
  objc_storeStrong((id *)&self->_fenceSequencer, 0);
  objc_storeStrong((id *)&self->__configFromServer, 0);

  objc_storeStrong((id *)&self->_cachedTapMessages, 0);
}

@end