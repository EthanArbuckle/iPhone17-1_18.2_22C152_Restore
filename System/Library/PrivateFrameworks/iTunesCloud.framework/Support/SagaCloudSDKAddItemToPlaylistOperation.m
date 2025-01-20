@interface SagaCloudSDKAddItemToPlaylistOperation
- (SagaCloudSDKAddItemToPlaylistOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5 playlistPersistentID:(int64_t)a6;
- (SagaCloudSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6 playlistPersistentID:(int64_t)a7;
- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6;
@end

@implementation SagaCloudSDKAddItemToPlaylistOperation

- (id)requestWithDatabaseID:(int)a3 databaseRevision:(int)a4 opaqueID:(id)a5 bundleID:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  unint64_t playlistPersistentID = self->_playlistPersistentID;
  v13 = [(CloudLibraryOperation *)self musicLibrary];
  id v14 = +[ML3Container newWithPersistentID:playlistPersistentID inLibrary:v13];

  v15 = [v14 valueForProperty:ML3ContainerPropertyStoreCloudID];
  id v16 = [v15 unsignedIntValue];

  v17 = os_log_create("com.apple.amp.itunescloudd", "SDK");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = [(SagaCloudSDKAddOperation *)self opaqueID];
    unint64_t v19 = self->_playlistPersistentID;
    *(_DWORD *)buf = 138543874;
    unint64_t v37 = (unint64_t)v18;
    __int16 v38 = 2048;
    *(void *)v39 = v19;
    *(_WORD *)&v39[8] = 1024;
    v40[0] = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Adding opaqueID %{public}@ to playlist with persistent id %lld (cloud-id %u)", buf, 0x1Cu);
  }
  if (v16)
  {
    v20 = +[ICSDKAddToPlaylistRequest requestWithDatabaseID:v8 databaseRevision:v7 opaqueID:v10 bundleID:v11 containerID:v16];
  }
  else
  {
    id v35 = v10;
    uint64_t v21 = ML3ContainerPropertyDateCreated;
    uint64_t v22 = ML3ContainerPropertyIsSourceRemote;
    v41[0] = ML3ContainerPropertyDateCreated;
    v41[1] = ML3ContainerPropertyIsSourceRemote;
    uint64_t v23 = ML3ContainerPropertyDistinguishedKind;
    v41[2] = ML3ContainerPropertyDistinguishedKind;
    v24 = +[NSArray arrayWithObjects:v41 count:3];
    v25 = [v14 getValuesForProperties:v24];

    v26 = [v25 objectForKey:v21];
    [v26 doubleValue];
    v27 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    v28 = [v25 objectForKey:v22];
    unsigned int v29 = [v28 intValue];

    v30 = [v25 objectForKey:v23];
    unsigned int v31 = [v30 intValue];

    v32 = os_log_create("com.apple.amp.itunescloudd", "SDK");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v33 = self->_playlistPersistentID;
      *(_DWORD *)buf = 134218754;
      unint64_t v37 = v33;
      __int16 v38 = 1024;
      *(_DWORD *)v39 = v29;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v31;
      LOWORD(v40[0]) = 2114;
      *(void *)((char *)v40 + 2) = v27;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Playlist pid %lld: is_src_remote %d, distinguished_kind %d, created %{public}@", buf, 0x22u);
    }

    v20 = 0;
    id v10 = v35;
  }

  return v20;
}

- (SagaCloudSDKAddItemToPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 opaqueID:(id)a5 bundleID:(id)a6 playlistPersistentID:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)SagaCloudSDKAddItemToPlaylistOperation;
  result = [(SagaCloudSDKAddOperation *)&v9 initWithConfiguration:a3 clientIdentity:a4 opaqueID:a5 bundleID:a6];
  if (result) {
    result->_unint64_t playlistPersistentID = a7;
  }
  return result;
}

- (SagaCloudSDKAddItemToPlaylistOperation)initWithClientIdentity:(id)a3 opaqueID:(id)a4 bundleID:(id)a5 playlistPersistentID:(int64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = objc_opt_new();
  id v14 = [(SagaCloudSDKAddItemToPlaylistOperation *)self initWithConfiguration:v13 clientIdentity:v12 opaqueID:v11 bundleID:v10 playlistPersistentID:a6];

  return v14;
}

@end