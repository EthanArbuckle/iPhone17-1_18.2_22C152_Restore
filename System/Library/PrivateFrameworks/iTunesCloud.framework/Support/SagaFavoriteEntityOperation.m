@interface SagaFavoriteEntityOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)_recomputeInUsersLibraryForTrackPids:(id)a3 resetFavoriteState:(BOOL)a4 usingConnection:(id)a5;
- (BOOL)isPersistent;
- (SagaFavoriteEntityOperation)initWithCoder:(id)a3;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 albumCloudLibraryID:(id)a6 time:(id)a7;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 artistCloudLibraryID:(id)a6 time:(id)a7;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 globalPlaylistID:(id)a6 time:(id)a7;
- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 entityType:(int64_t)a7 time:(id)a8;
- (id)_containerPidsMatchingRequestGlobalPlaylistID;
- (id)_initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 globalPlaylistID:(id)a7 albumCloudLibraryID:(id)a8 artistCloudLibraryID:(id)a9 entityType:(int64_t)a10 time:(id)a11;
- (id)description;
- (unsigned)_currentDatabaseRevision;
- (void)_canRunOperationWithCompletionHandler:(id)a3;
- (void)_revertFavoritingEntityTypeAlbum;
- (void)_revertFavoritingEntityTypeArtist;
- (void)_revertFavoritingEntityTypePlaylist;
- (void)_revertFavoritingEntityTypeTrack;
- (void)_revertPendingFavoriteEntityForPermanentlyFailedOperation;
- (void)_setCloudIDsFromResponse:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaFavoriteEntityOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStamp, 0);
  objc_storeStrong((id *)&self->_artistCloudLibraryID, 0);
  objc_storeStrong((id *)&self->_albumCloudLibraryID, 0);

  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
}

- (void)_canRunOperationWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [CloudPendingChangesCoordinator alloc];
  v6 = [(CloudLibraryOperation *)self configuration];
  v7 = [(CloudPendingChangesCoordinator *)v5 initWithConfiguration:v6 prefix:@"Saga" loggable:objc_opt_class()];

  v8 = +[ICUserIdentityStore defaultIdentityStore];
  v9 = [(CloudLibraryOperation *)self userIdentity];
  id v25 = 0;
  v10 = [v8 getPropertiesForUserIdentity:v9 error:&v25];
  id v11 = v25;

  if (!v10 || v11)
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [(CloudLibraryOperation *)self userIdentity];
      *(_DWORD *)buf = 138543874;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v15;
      __int16 v33 = 2114;
      id v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ loading account properties for %{public}@ failed with error: %{public}@", buf, 0x20u);
    }
    [(CloudPendingChangesCoordinator *)v7 addPendingChange:self];
    if (!v4) {
      goto LABEL_9;
    }
LABEL_8:
    v4[2](v4, 0);
    goto LABEL_9;
  }
  if ([v10 isActiveLocker])
  {
    v12 = +[ICMusicSubscriptionStatusController sharedStatusController];
    v13 = [(CloudLibraryOperation *)self userIdentity];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100048D50;
    v21[3] = &unk_1001BA738;
    v22 = v7;
    v23 = self;
    v24 = v4;
    [v12 getSubscriptionStatusForUserIdentity:v13 withCompletionHandler:v21];

    goto LABEL_9;
  }
  v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@ Cannot run operation as iCloud Music Library is not enabled", buf, 0xCu);
  }

  uint64_t v17 = MSVAutoBugCaptureDomainMusicLibrary;
  CFStringRef v26 = @"FavoriteChangeOperation";
  v18 = [(SagaFavoriteEntityOperation *)self description];
  v27 = v18;
  v19 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  v28 = v19;
  v20 = +[NSArray arrayWithObjects:&v28 count:1];
  +[MSVAutoBugCapture snapshotWithDomain:v17 type:@"Bug" subType:@"OFT-FavoriteEntityWithCloudLibraryOff" context:@"Unsupported API call" triggerThresholdValues:0 events:v20 completion:0];

  [(SagaFavoriteEntityOperation *)self _revertPendingFavoriteEntityForPermanentlyFailedOperation];
  if (v4) {
    goto LABEL_8;
  }
LABEL_9:
}

- (id)_containerPidsMatchingRequestGlobalPlaylistID
{
  v3 = [(CloudLibraryOperation *)self musicLibrary];
  v4 = +[NSMutableSet set];
  v5 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID equalToInt64:0];
  v14[0] = v5;
  v6 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyCloudGlobalID equalToValue:self->_globalPlaylistID];
  v14[1] = v6;
  v7 = +[NSArray arrayWithObjects:v14 count:2];
  v8 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v7];

  v9 = +[ML3Container queryWithLibrary:v3 predicate:v8 usingSections:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100049118;
  v12[3] = &unk_1001BE4C8;
  id v10 = v4;
  id v13 = v10;
  [v9 enumeratePersistentIDsUsingBlock:v12];

  return v10;
}

- (BOOL)_recomputeInUsersLibraryForTrackPids:(id)a3 resetFavoriteState:(BOOL)a4 usingConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v32 = 0;
  __int16 v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  if ([v8 count])
  {
    id v10 = [(CloudLibraryOperation *)self configuration];
    unsigned int v11 = sub_10012A49C(v10);

    v12 = [(CloudLibraryOperation *)self musicLibrary];
    id v13 = [v12 sagaCloudFavoriteSongAddToLibraryBehavior];

    v14 = [(CloudLibraryOperation *)self musicLibrary];
    v15 = [v14 currentDeviceFavoriteSongsPlaylist];

    if (v15)
    {
      v16 = [v15 valueForProperty:ML3ContainerPropertyKeepLocal];
      signed int v17 = [v16 intValue];

      BOOL v18 = v17 > 0;
    }
    else
    {
      BOOL v18 = 0;
    }
    if (v13 == (id)1) {
      unsigned int v19 = v11;
    }
    else {
      unsigned int v19 = 0;
    }
    int v20 = v18 | v19;
    v21 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v37 = self;
      __int16 v38 = 1024;
      unsigned int v39 = v11;
      __int16 v40 = 1024;
      BOOL v41 = v13 == (id)1;
      __int16 v42 = 1024;
      BOOL v43 = v18;
      __int16 v44 = 1024;
      int v45 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ _recomputeInUsersLibraryForTrackPids isAutomaticDownloadsEnabled=%{BOOL}u, addToLibraryBehaviorWhenFavoriting=%d, isFSPPinned=%{BOOL}u, shouldDownloadTrack=%{BOOL}u", buf, 0x24u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100049480;
    v26[3] = &unk_1001BA710;
    BOOL v30 = a4;
    v29 = &v32;
    id v22 = v9;
    id v27 = v22;
    v28 = self;
    char v31 = v20;
    [v8 enumerateObjectsUsingBlock:v26];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004986C;
    v25[3] = &unk_1001BDC58;
    v25[4] = self;
    [v22 enqueueBlockForTransactionCommit:v25];
  }
  BOOL v23 = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(&v32, 8);

  return v23;
}

- (void)_revertFavoritingEntityTypeArtist
{
  v3 = [(CloudLibraryOperation *)self musicLibrary];
  v4 = v3;
  if (self->_adamID)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100049AD4;
    v12[3] = &unk_1001BE540;
    void v12[4] = self;
    id v13 = v3;
    [v13 performDatabaseTransactionWithBlock:v12];
    id v5 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (self->_artistCloudLibraryID)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100049D08;
    v10[3] = &unk_1001BE540;
    v10[4] = self;
    id v11 = v3;
    [v11 performDatabaseTransactionWithBlock:v10];
    id v5 = v11;
    goto LABEL_5;
  }
  v6 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromICFavoriteMediaEntityType();
    int64_t adamID = self->_adamID;
    artistCloudLibraryID = self->_artistCloudLibraryID;
    *(_DWORD *)buf = 138544130;
    v15 = self;
    __int16 v16 = 2114;
    signed int v17 = v7;
    __int16 v18 = 2048;
    int64_t v19 = adamID;
    __int16 v20 = 2114;
    v21 = artistCloudLibraryID;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, cloudUniversalLibraryID=%{public}@", buf, 0x2Au);
  }
LABEL_6:
}

- (void)_revertFavoritingEntityTypeAlbum
{
  v3 = [(CloudLibraryOperation *)self musicLibrary];
  v4 = v3;
  if (self->_adamID)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004A11C;
    v12[3] = &unk_1001BE540;
    void v12[4] = self;
    id v13 = v3;
    [v13 performDatabaseTransactionWithBlock:v12];
    id v5 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (self->_albumCloudLibraryID)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004A428;
    v10[3] = &unk_1001BE540;
    v10[4] = self;
    id v11 = v3;
    [v11 performDatabaseTransactionWithBlock:v10];
    id v5 = v11;
    goto LABEL_5;
  }
  v6 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = NSStringFromICFavoriteMediaEntityType();
    int64_t adamID = self->_adamID;
    albumCloudLibraryID = self->_albumCloudLibraryID;
    *(_DWORD *)buf = 138544130;
    v15 = self;
    __int16 v16 = 2114;
    signed int v17 = v7;
    __int16 v18 = 2048;
    int64_t v19 = adamID;
    __int16 v20 = 2114;
    v21 = albumCloudLibraryID;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, cloudLibraryID=%{public}@", buf, 0x2Au);
  }
LABEL_6:
}

- (void)_revertFavoritingEntityTypePlaylist
{
  if (self->_globalPlaylistID)
  {
    v3 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID equalToInt64:0];
    v32[0] = v3;
    v4 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyCloudGlobalID equalToValue:self->_globalPlaylistID];
    v32[1] = v4;
    id v5 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyContainerPersistentId equalToInt64:self->_persistentID];
    v32[2] = v5;
    v6 = +[NSArray arrayWithObjects:v32 count:3];
    v7 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v6];

    id v8 = [(CloudLibraryOperation *)self musicLibrary];
    id v9 = +[ML3Container anyInLibrary:v8 predicate:v7];

    if (v9)
    {
      unsigned int v10 = [v9 deleteFromLibrary];
      id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      os_log_t v12 = v11;
      if (v10)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          globalPlaylistID = self->_globalPlaylistID;
          int v24 = 138543618;
          id v25 = self;
          __int16 v26 = 2114;
          id v27 = globalPlaylistID;
          v14 = "%{public}@ Deleted playlist with global id: %{public}@";
          v15 = v12;
          os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
          uint32_t v17 = 22;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v24, v17);
        }
LABEL_14:

        goto LABEL_15;
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      id v22 = self->_globalPlaylistID;
      int64_t persistentID = self->_persistentID;
      int v24 = 138543874;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v22;
      __int16 v28 = 2048;
      int64_t v29 = persistentID;
      v14 = "%{public}@ Failed to delete playlist with global id: %{public}@, persistentID=%lld";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      os_log_t v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v20 = self->_globalPlaylistID;
      int64_t v21 = self->_persistentID;
      int v24 = 138543874;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v20;
      __int16 v28 = 2048;
      int64_t v29 = v21;
      v14 = "%{public}@ Could not find a pending playlist to delete with global id: %{public}@, persistentID=%lld";
      v15 = v12;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    }
    uint32_t v17 = 32;
    goto LABEL_13;
  }
  v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = NSStringFromICFavoriteMediaEntityType();
    int64_t adamID = self->_adamID;
    int64_t v19 = self->_globalPlaylistID;
    int v24 = 138544130;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = (NSString *)v9;
    __int16 v28 = 2048;
    int64_t v29 = adamID;
    __int16 v30 = 2114;
    char v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, gobalPlaylistID=%{public}@", (uint8_t *)&v24, 0x2Au);
LABEL_15:
  }
}

- (void)_revertFavoritingEntityTypeTrack
{
  v3 = [(CloudLibraryOperation *)self musicLibrary];
  v4 = v3;
  if (self->_adamID)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004AB98;
    v9[3] = &unk_1001BE608;
    v9[4] = self;
    [v3 performDatabaseTransactionWithBlock:v9];
  }
  else
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromICFavoriteMediaEntityType();
      int64_t adamID = self->_adamID;
      int64_t persistentID = self->_persistentID;
      *(_DWORD *)buf = 138544130;
      id v11 = self;
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2048;
      int64_t v15 = adamID;
      __int16 v16 = 2048;
      int64_t v17 = persistentID;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ Invalid identifier to revert favoriting entityType=%{public}@, adamID=%lld, persistentID=%lld", buf, 0x2Au);
    }
  }
}

- (void)_revertPendingFavoriteEntityForPermanentlyFailedOperation
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = NSStringFromICFavoriteMediaEntityType();
    int64_t adamID = self->_adamID;
    globalPlaylistID = self->_globalPlaylistID;
    albumCloudLibraryID = self->_albumCloudLibraryID;
    artistCloudLibraryID = self->_artistCloudLibraryID;
    int v9 = 138544642;
    unsigned int v10 = self;
    __int16 v11 = 2114;
    __int16 v12 = v4;
    __int16 v13 = 2048;
    int64_t v14 = adamID;
    __int16 v15 = 2114;
    __int16 v16 = globalPlaylistID;
    __int16 v17 = 2114;
    __int16 v18 = albumCloudLibraryID;
    __int16 v19 = 2114;
    __int16 v20 = artistCloudLibraryID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing failed response for entity type=%{public}@, storeID:%lld, globalPlaylistID:%{public}@, cloudAlbumID=%{public}@, cloudArtistID=%{public}@", (uint8_t *)&v9, 0x3Eu);
  }
  switch(self->_entityType)
  {
    case 0:
      [(SagaFavoriteEntityOperation *)self _revertFavoritingEntityTypeTrack];
      break;
    case 1:
      [(SagaFavoriteEntityOperation *)self _revertFavoritingEntityTypePlaylist];
      break;
    case 2:
      [(SagaFavoriteEntityOperation *)self _revertFavoritingEntityTypeArtist];
      break;
    case 3:
      [(SagaFavoriteEntityOperation *)self _revertFavoritingEntityTypeAlbum];
      break;
    default:
      return;
  }
}

- (void)_setCloudIDsFromResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 addedItems];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromICFavoriteMediaEntityType();
    id v8 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    int64_t adamID = self->_adamID;
    globalPlaylistID = self->_globalPlaylistID;
    albumCloudLibraryID = self->_albumCloudLibraryID;
    artistCloudLibraryID = self->_artistCloudLibraryID;
    *(_DWORD *)buf = 138544898;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2114;
    __int16 v38 = v8;
    *(_WORD *)unsigned int v39 = 2048;
    *(void *)&v39[2] = adamID;
    *(_WORD *)&v39[10] = 2114;
    *(void *)&v39[12] = globalPlaylistID;
    __int16 v40 = 2114;
    BOOL v41 = albumCloudLibraryID;
    __int16 v42 = 2114;
    BOOL v43 = artistCloudLibraryID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Processing success response with addedItems=%{public}@ for entity type=%{public}@, storeID:%lld, globalPlaylistID:%{public}@, cloudAlbumID=%{public}@, cloudArtistID=%{public}@", buf, 0x48u);
  }
  switch(self->_entityType)
  {
    case 0:
      if (self->_adamID)
      {
        __int16 v13 = [(CloudLibraryOperation *)self clientIdentity];
        sub_10012A6EC(v5, v6, v13);

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        __int16 v38 = sub_10004B520;
        *(void *)unsigned int v39 = sub_10004B530;
        *(void *)&v39[8] = +[NSMutableSet set];
        int64_t v14 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertySubscriptionStoreItemID equalToInt64:self->_adamID];
        __int16 v15 = +[ML3Track allItemsQueryWithLibrary:v6 predicate:v14 orderingTerms:&__NSArray0__struct usingSections:0];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_10004B538;
        v36[3] = &unk_1001BAEF0;
        v36[4] = buf;
        [v15 enumeratePersistentIDsUsingBlock:v36];
        if ([*(id *)(*(void *)&buf[8] + 40) count])
        {
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_10004B5A0;
          v35[3] = &unk_1001BED60;
          v35[4] = self;
          v35[5] = buf;
          [v6 performDatabaseTransactionWithBlock:v35];
        }

        _Block_object_dispose(buf, 8);
      }
      break;
    case 1:
      if (self->_globalPlaylistID)
      {
        __int16 v18 = objc_msgSend(v5, "objectForKey:");
        if (_NSIsNSNumber())
        {
          id v19 = [v18 longLongValue];
          __int16 v20 = [(SagaFavoriteEntityOperation *)self _containerPidsMatchingRequestGlobalPlaylistID];
          if ([v20 count])
          {
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            LOBYTE(v38) = 0;
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10004B650;
            v30[3] = &unk_1001BA6E8;
            v30[4] = self;
            __int16 v20 = v20;
            char v31 = v20;
            __int16 v33 = buf;
            id v34 = v19;
            id v32 = v6;
            [v32 performDatabaseTransactionWithBlock:v30];

            _Block_object_dispose(buf, 8);
          }
        }
        else
        {
          __int16 v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            BOOL v23 = self->_globalPlaylistID;
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v23;
            *(_WORD *)&buf[22] = 2114;
            __int16 v38 = (uint64_t (*)(uint64_t, uint64_t))v18;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@ Could not set store_cloud_id for playlist with globalID=%{public}@ as cloudid=%{public}@ is not a number", buf, 0x20u);
          }
        }
      }
      break;
    case 2:
      break;
    case 3:
      if (self->_adamID)
      {
        int64_t v21 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:");
        id v22 = [v5 objectForKey:v21];

        if (_NSIsNSString())
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10004B7B4;
          v27[3] = &unk_1001BEA70;
          v27[4] = self;
          id v28 = v22;
          id v29 = v6;
          [v29 performDatabaseTransactionWithBlock:v27];
        }
        else
        {
          int v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            int64_t v25 = self->_adamID;
            int64_t persistentID = self->_persistentID;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2048;
            __int16 v38 = (uint64_t (*)(uint64_t, uint64_t))persistentID;
            *(_WORD *)unsigned int v39 = 2114;
            *(void *)&v39[2] = v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}@ Could not set cloud_library_id for album with adamID=%lld, persistentID=%lld as cloudid=%{public}@ is not a string", buf, 0x2Au);
          }
        }
      }
      break;
    default:
      __int16 v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int64_t entityType = self->_entityType;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = entityType;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@ EntityType=%d is not supported", buf, 0x12u);
      }

      break;
  }
}

- (unsigned)_currentDatabaseRevision
{
  v2 = [(CloudLibraryOperation *)self musicLibrary];
  unsigned int v3 = [v2 sagaOnDiskDatabaseRevision];

  if (v3 <= 1) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)main
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004BD1C;
  v4[3] = &unk_1001BDC58;
  v4[4] = self;
  [(SagaFavoriteEntityOperation *)self _canRunOperationWithCompletionHandler:v4];
}

- (id)description
{
  int64_t adamID = self->_adamID;
  globalPlaylistID = self->_globalPlaylistID;
  albumCloudLibraryID = self->_albumCloudLibraryID;
  artistCloudLibraryID = self->_artistCloudLibraryID;
  v7 = NSStringFromICFavoriteMediaEntityType();
  id v8 = +[NSString stringWithFormat:@"<SagaFavoriteEntityOperation=%p, adamID=%lld, globalPlaylistID=%@, albumCloudLibraryID=%@, artistCloudLibraryID=%@, entityType=%@, _persistentID=%lld, timeStamp=%@>", self, adamID, globalPlaylistID, albumCloudLibraryID, artistCloudLibraryID, v7, self->_persistentID, self->_timeStamp];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaFavoriteEntityOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_adamID, @"SagaFavoriteEntityOperationAdamIDKey", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_persistentID forKey:@"SagaFavoriteEntityOperationPersistentIDKey"];
  [v4 encodeObject:self->_timeStamp forKey:@"SagaFavoriteEntityOperationTimeStampKey"];
  [v4 encodeObject:self->_globalPlaylistID forKey:@"SagaFavoriteEntityOperationGlobalPlaylistIDKey"];
  [v4 encodeObject:self->_albumCloudLibraryID forKey:@"SagaFavoriteEntityOperationCloudAlbumIDKey"];
  [v4 encodeObject:self->_artistCloudLibraryID forKey:@"SagaFavoriteEntityOperationCloudArtistIDKey"];
  [v4 encodeInteger:self->_entityType forKey:@"SagaFavoriteEntityOperationTypeKey"];
}

- (SagaFavoriteEntityOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SagaFavoriteEntityOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t adamID = (int64_t)[v4 decodeInt64ForKey:@"SagaFavoriteEntityOperationAdamIDKey"];
    v5->_int64_t persistentID = (int64_t)[v4 decodeInt64ForKey:@"SagaFavoriteEntityOperationPersistentIDKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaFavoriteEntityOperationGlobalPlaylistIDKey"];
    globalPlaylistID = v5->_globalPlaylistID;
    v5->_globalPlaylistID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaFavoriteEntityOperationCloudAlbumIDKey"];
    albumCloudLibraryID = v5->_albumCloudLibraryID;
    v5->_albumCloudLibraryID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaFavoriteEntityOperationCloudArtistIDKey"];
    artistCloudLibraryID = v5->_artistCloudLibraryID;
    v5->_artistCloudLibraryID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaFavoriteEntityOperationTimeStampKey"];
    timeStamp = v5->_timeStamp;
    v5->_timeStamp = (NSDate *)v12;

    v5->_int64_t entityType = (int64_t)[v4 decodeIntegerForKey:@"SagaFavoriteEntityOperationTypeKey"];
  }

  return v5;
}

- (BOOL)isPersistent
{
  return 1;
}

- (id)_initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 globalPlaylistID:(id)a7 albumCloudLibraryID:(id)a8 artistCloudLibraryID:(id)a9 entityType:(int64_t)a10 time:(id)a11
{
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a11;
  v32.receiver = self;
  v32.super_class = (Class)SagaFavoriteEntityOperation;
  int64_t v21 = [(CloudLibraryOperation *)&v32 initWithConfiguration:a3 clientIdentity:a4];
  id v22 = v21;
  if (v21)
  {
    v21->_int64_t adamID = a6;
    v21->_int64_t persistentID = a5;
    BOOL v23 = (NSDate *)[v20 copy];
    timeStamp = v22->_timeStamp;
    v22->_timeStamp = v23;

    int64_t v25 = (NSString *)[v17 copy];
    globalPlaylistID = v22->_globalPlaylistID;
    v22->_globalPlaylistID = v25;

    id v27 = (NSString *)[v18 copy];
    albumCloudLibraryID = v22->_albumCloudLibraryID;
    v22->_albumCloudLibraryID = v27;

    id v29 = (NSString *)[v19 copy];
    artistCloudLibraryID = v22->_artistCloudLibraryID;
    v22->_artistCloudLibraryID = v29;

    v22->_int64_t entityType = a10;
  }

  return v22;
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 artistCloudLibraryID:(id)a6 time:(id)a7
{
  return (SagaFavoriteEntityOperation *)[(SagaFavoriteEntityOperation *)self _initWithConfiguration:a3 clientIdentity:a4 persistentID:a5 storeID:0 globalPlaylistID:0 albumCloudLibraryID:0 artistCloudLibraryID:a6 entityType:2 time:a7];
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 albumCloudLibraryID:(id)a6 time:(id)a7
{
  return (SagaFavoriteEntityOperation *)[(SagaFavoriteEntityOperation *)self _initWithConfiguration:a3 clientIdentity:a4 persistentID:a5 storeID:0 globalPlaylistID:0 albumCloudLibraryID:a6 artistCloudLibraryID:0 entityType:3 time:a7];
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 globalPlaylistID:(id)a6 time:(id)a7
{
  return (SagaFavoriteEntityOperation *)[(SagaFavoriteEntityOperation *)self _initWithConfiguration:a3 clientIdentity:a4 persistentID:a5 storeID:0 globalPlaylistID:a6 albumCloudLibraryID:0 artistCloudLibraryID:0 entityType:1 time:a7];
}

- (SagaFavoriteEntityOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 storeID:(int64_t)a6 entityType:(int64_t)a7 time:(id)a8
{
  return (SagaFavoriteEntityOperation *)[(SagaFavoriteEntityOperation *)self _initWithConfiguration:a3 clientIdentity:a4 persistentID:a5 storeID:a6 globalPlaylistID:0 albumCloudLibraryID:0 artistCloudLibraryID:0 entityType:a7 time:a8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end