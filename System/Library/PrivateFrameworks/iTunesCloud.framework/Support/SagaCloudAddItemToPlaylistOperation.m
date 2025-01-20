@interface SagaCloudAddItemToPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (SagaCloudAddItemToPlaylistOperation)initWithAdamID:(int64_t)a3 playlistPersistentID:(int64_t)a4 clientIdentity:(id)a5;
- (SagaCloudAddItemToPlaylistOperation)initWithCoder:(id)a3;
- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6;
- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 clientIdentity:(id)a7;
- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralPlaylistGlobalID:(id)a6 clientIdentity:(id)a7;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logCloudAddRequestDescription;
@end

@implementation SagaCloudAddItemToPlaylistOperation

- (void)logCloudAddRequestDescription
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(&self->super.super._updateRequired + 1);
    uint64_t v5 = *(uint64_t *)((char *)&self->super._adamIDToSagaIDMap + 1);
    int v6 = 134218240;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cloud-add request for adam ID = %lld / container_pid = %lld", (uint8_t *)&v6, 0x16u);
  }
}

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = *(uint64_t *)((char *)&self->super._adamIDToSagaIDMap + 1);
  int v6 = [(CloudLibraryOperation *)self musicLibrary];
  id v7 = +[ML3Container newWithPersistentID:v5 inLibrary:v6];

  __int16 v8 = [v7 valueForProperty:ML3ContainerPropertyStoreCloudID];
  id v9 = [v8 unsignedIntValue];

  v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(&self->super.super._updateRequired + 1);
    uint64_t v12 = *(uint64_t *)((char *)&self->super._adamIDToSagaIDMap + 1);
    int v29 = 134218496;
    uint64_t v30 = v11;
    __int16 v31 = 2048;
    *(void *)v32 = v12;
    *(_WORD *)&v32[8] = 1024;
    v33[0] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[SagaCloudAddItemToPlaylistOperation] Adding adam-id %lld to playlist with persistent id %lld (cloud-id %u)", (uint8_t *)&v29, 0x1Cu);
  }

  if (v9)
  {
    v13 = +[ICAddToLibraryRequest requestWithDatabaseID:v3 databaseRevision:[(SagaCloudAddOperation *)self currentDatabaseRevision] adamID:*(void *)(&self->super.super._updateRequired + 1) containerID:v9 referralAlbumAdamID:*(int64_t *)((char *)&self->super._adamID + 1) referralPlaylistGlobalID:*(int64_t *)((char *)&self->super._referralAlbumAdamID + 1)];
  }
  else
  {
    uint64_t v14 = ML3ContainerPropertyDateCreated;
    uint64_t v15 = ML3ContainerPropertyIsSourceRemote;
    v34[0] = ML3ContainerPropertyDateCreated;
    v34[1] = ML3ContainerPropertyIsSourceRemote;
    uint64_t v16 = ML3ContainerPropertyDistinguishedKind;
    v34[2] = ML3ContainerPropertyDistinguishedKind;
    v17 = +[NSArray arrayWithObjects:v34 count:3];
    v18 = [v7 getValuesForProperties:v17];

    v19 = [v18 objectForKey:v14];
    [v19 doubleValue];
    v20 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    v21 = [v18 objectForKey:v15];
    unsigned int v22 = [v21 intValue];

    v23 = [v18 objectForKey:v16];
    unsigned int v24 = [v23 intValue];

    v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = *(uint64_t *)((char *)&self->super._adamIDToSagaIDMap + 1);
      [v20 timeIntervalSince1970];
      int v29 = 134218752;
      uint64_t v30 = v26;
      __int16 v31 = 1024;
      *(_DWORD *)v32 = v22;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v24;
      LOWORD(v33[0]) = 2048;
      *(void *)((char *)v33 + 2) = (uint64_t)v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[SagaCloudAddItemToPlaylistOperation] Playlist pid %lld: is_src_remote %d, distinguished_kind %d, created %{time}zd", (uint8_t *)&v29, 0x22u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCloudAddItemToPlaylistOperation;
  id v4 = a3;
  [(SagaCloudAddItemOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(NSDictionary **)((char *)&self->super._adamIDToSagaIDMap + 1), @"SagaCloudAddItemToPlaylistOperationPlaylistPersistentIDKey", v5.receiver, v5.super_class);
}

- (SagaCloudAddItemToPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SagaCloudAddItemToPlaylistOperation;
  objc_super v5 = [(SagaCloudAddItemOperation *)&v7 initWithCoder:v4];
  if (v5) {
    *(void *)(v5 + 121) = [v4 decodeInt64ForKey:@"SagaCloudAddItemToPlaylistOperationPlaylistPersistentIDKey"];
  }

  return (SagaCloudAddItemToPlaylistOperation *)v5;
}

- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralPlaylistGlobalID:(id)a6 clientIdentity:(id)a7
{
  id v13 = a6;
  uint64_t v14 = [(SagaCloudAddItemToPlaylistOperation *)self initWithConfiguration:a3 adamID:a4 playlistPersistentID:a5 clientIdentity:a7];
  uint64_t v15 = v14;
  if (v14) {
    objc_storeStrong((id *)((char *)&v14->super._referralAlbumAdamID + 1), a6);
  }

  return v15;
}

- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 referralAlbumAdamID:(int64_t)a6 clientIdentity:(id)a7
{
  result = [(SagaCloudAddItemToPlaylistOperation *)self initWithConfiguration:a3 adamID:a4 playlistPersistentID:a5 clientIdentity:a7];
  if (result) {
    *(int64_t *)((char *)&result->super._adamID + 1) = a6;
  }
  return result;
}

- (SagaCloudAddItemToPlaylistOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 playlistPersistentID:(int64_t)a5 clientIdentity:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)SagaCloudAddItemToPlaylistOperation;
  result = [(SagaCloudAddItemOperation *)&v8 initWithConfiguration:a3 adamID:a4 clientIdentity:a6];
  if (result) {
    *(NSDictionary **)((char *)&result->super._adamIDToSagaIDMap + 1) = (NSDictionary *)a5;
  }
  return result;
}

- (SagaCloudAddItemToPlaylistOperation)initWithAdamID:(int64_t)a3 playlistPersistentID:(int64_t)a4 clientIdentity:(id)a5
{
  id v8 = a5;
  id v9 = objc_opt_new();
  v10 = [(SagaCloudAddItemToPlaylistOperation *)self initWithConfiguration:v9 adamID:a3 playlistPersistentID:a4 clientIdentity:v8];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end