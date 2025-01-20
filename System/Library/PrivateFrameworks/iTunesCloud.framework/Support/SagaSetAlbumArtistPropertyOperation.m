@interface SagaSetAlbumArtistPropertyOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaSetAlbumArtistPropertyOperation)initWithCoder:(id)a3;
- (SagaSetAlbumArtistPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 properties:(id)a6;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaSetAlbumArtistPropertyOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumArtistProperties, 0);

  objc_storeStrong((id *)&self->_albumArtistCloudLibraryID, 0);
}

- (void)main
{
  if ([(NSString *)self->_albumArtistCloudLibraryID length])
  {
    v4 = self->_albumArtistProperties;
    uint64_t v5 = ML3AlbumArtistPropertyLikedState;
    v6 = [(NSDictionary *)v4 objectForKeyedSubscript:ML3AlbumArtistPropertyLikedState];
    if (v6)
    {
      v7 = +[NSMutableDictionary dictionary];
      [v7 setObject:v6 forKeyedSubscript:v5];
      uint64_t v8 = ML3AlbumArtistPropertyLikedStateChangedDate;
      v9 = [(NSDictionary *)v4 objectForKeyedSubscript:ML3AlbumArtistPropertyLikedStateChangedDate];
      if (v9) {
        [v7 setObject:v9 forKeyedSubscript:v8];
      }
    }
    else
    {
      v7 = 0;
    }

    if ([v7 count])
    {
      v33 = v3;
      int64_t albumArtistPersistentID = self->_albumArtistPersistentID;
      v14 = [(CloudLibraryOperation *)self musicLibrary];
      id v15 = +[ML3AlbumArtist newWithPersistentID:albumArtistPersistentID inLibrary:v14];

      if (([v15 existsInLibrary] & 1) == 0)
      {
        v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int64_t v17 = self->_albumArtistPersistentID;
          albumArtistCloudLibraryID = self->_albumArtistCloudLibraryID;
          *(_DWORD *)buf = 134218242;
          int64_t v39 = v17;
          __int16 v40 = 2114;
          v41 = (NSDictionary *)albumArtistCloudLibraryID;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Album Artist with pid = %lld, cloudLibraryID = %{public}@ does not exist locally", buf, 0x16u);
        }
      }
      v19 = +[NSString stringWithFormat:@"SagaSetAlbumArtistPropertyOperation - (album_artist_persistent_id = %lld)", self->_albumArtistPersistentID];
      id v20 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v19];
      [v20 beginTransaction];
      v21 = [(CloudLibraryOperation *)self musicLibrary];
      v22 = [(CloudLibraryOperation *)self clientIdentity];
      [v21 setClientIdentity:v22];

      v23 = [(CloudLibraryOperation *)self connection];
      id v24 = [v23 databaseID];
      v37 = self->_albumArtistCloudLibraryID;
      v25 = +[NSArray arrayWithObjects:&v37 count:1];
      v36 = v7;
      v26 = +[NSArray arrayWithObjects:&v36 count:1];
      v27 = +[ICBulkSetItemPropertyRequest requestWithDatabaseID:v24 albumArtistCloudLibraryIDs:v25 properties:v26];

      [v27 setVerificationInteractionLevel:2];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100031DCC;
      v34[3] = &unk_1001BEEC0;
      v34[4] = self;
      dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
      v28 = v35;
      [v23 sendRequest:v27 withResponseHandler:v34];
      dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      v29 = [(CloudLibraryOperation *)self musicLibrary];
      v30 = MSVTCCIdentityForCurrentProcess();
      [v29 setClientIdentity:v30];

      [v20 endTransaction];
      v3 = v33;
    }
    else
    {
      v31 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        albumArtistProperties = self->_albumArtistProperties;
        *(_DWORD *)buf = 138543362;
        int64_t v39 = (int64_t)albumArtistProperties;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No valid album artist properties to set, skipping updates to cloud library. properties=%{public}@", buf, 0xCu);
      }

      [(CloudLibraryOperation *)self setStatus:1];
    }
  }
  else
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v11 = self->_albumArtistPersistentID;
      v12 = self->_albumArtistProperties;
      *(_DWORD *)buf = 134218242;
      int64_t v39 = v11;
      __int16 v40 = 2114;
      v41 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Album Artist with persistentID=%lld does not have a cloud library id. Not setting properties=%{public}@", buf, 0x16u);
    }

    [(CloudLibraryOperation *)self setStatus:1];
  }
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaSetAlbumArtistPropertyOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_albumArtistPersistentID, @"SagaSetAlbumArtistItemPropertyOperationAlbumArtistPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_albumArtistProperties forKey:@"SagaSetAlbumArtistItemPropertyOperationAlbumArtistPropertiesKey"];
}

- (SagaSetAlbumArtistPropertyOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SagaSetAlbumArtistPropertyOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v15 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t albumArtistPersistentID = (int64_t)[v4 decodeInt64ForKey:@"SagaSetAlbumArtistItemPropertyOperationAlbumArtistPersistentIDKey"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"SagaSetAlbumArtistItemPropertyOperationAlbumArtistPropertiesKey"];
    albumArtistProperties = v5->_albumArtistProperties;
    v5->_albumArtistProperties = (NSDictionary *)v10;

    uint64_t v12 = [(NSDictionary *)v5->_albumArtistProperties objectForKey:ML3AlbumArtistPropertyCloudUniversalLibraryID];
    albumArtistCloudLibraryID = v5->_albumArtistCloudLibraryID;
    v5->_albumArtistCloudLibraryID = (NSString *)v12;
  }
  return v5;
}

- (SagaSetAlbumArtistPropertyOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 persistentID:(int64_t)a5 properties:(id)a6
{
  id v10 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SagaSetAlbumArtistPropertyOperation;
  int64_t v11 = [(CloudLibraryOperation *)&v18 initWithConfiguration:a3 clientIdentity:a4];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_int64_t albumArtistPersistentID = a5;
    v13 = (NSDictionary *)[v10 copy];
    albumArtistProperties = v12->_albumArtistProperties;
    v12->_albumArtistProperties = v13;

    uint64_t v15 = [(NSDictionary *)v12->_albumArtistProperties objectForKey:ML3AlbumArtistPropertyCloudUniversalLibraryID];
    albumArtistCloudLibraryID = v12->_albumArtistCloudLibraryID;
    v12->_albumArtistCloudLibraryID = (NSString *)v15;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end