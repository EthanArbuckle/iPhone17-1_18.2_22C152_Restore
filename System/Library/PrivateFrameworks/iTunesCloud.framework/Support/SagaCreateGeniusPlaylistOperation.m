@interface SagaCreateGeniusPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (SagaCreateGeniusPlaylistOperation)initWithCoder:(id)a3;
- (SagaCreateGeniusPlaylistOperation)initWithConfiguration:(id)a3 geniusPlaylistPersistentID:(int64_t)a4 playlistName:(id)a5 seedItemIDs:(id)a6 itemIDs:(id)a7 clientIdentity:(id)a8;
- (unint64_t)playlistSagaID;
- (void)encodeWithCoder:(id)a3;
- (void)main;
@end

@implementation SagaCreateGeniusPlaylistOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDs, 0);
  objc_storeStrong((id *)&self->_seedItemIDs, 0);

  objc_storeStrong((id *)&self->_playlistName, 0);
}

- (unint64_t)playlistSagaID
{
  return self->_playlistSagaID;
}

- (void)main
{
  v4 = +[NSString stringWithFormat:@"SagaCreateGeniusPlaylistOperation - (playlist_persistent_id  = %lld / playlist_name = %@)", self->_playlistPersistentID, self->_playlistName];
  id v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v4];
  [v5 beginTransaction];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  v7 = [(CloudLibraryOperation *)self clientIdentity];
  [v6 setClientIdentity:v7];

  int64_t playlistPersistentID = self->_playlistPersistentID;
  v9 = [(CloudLibraryOperation *)self musicLibrary];
  id v10 = +[ML3Container newWithPersistentID:playlistPersistentID inLibrary:v9];

  if ([v10 existsInLibrary])
  {
    v11 = [(CloudLibraryOperation *)self connection];
    v12 = +[ICCreateGeniusContainerRequest requestWithDatabaseID:[v11 databaseID] playlistName:self->_playlistName seedItemIDs:self->_seedItemIDs itemIDs:self->_itemIDs];
    [v12 setVerificationInteractionLevel:2];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100061688;
    v18[3] = &unk_1001BEEC0;
    v18[4] = self;
    v13 = dispatch_semaphore_create(0);
    v19 = v13;
    [v11 sendRequest:v12 withResponseHandler:v18];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_playlistSagaID)
    {
      v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
      [v10 setValue:v14 forProperty:ML3ContainerPropertyStoreCloudID];
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int64_t v15 = self->_playlistPersistentID;
      *(_DWORD *)buf = 134217984;
      int64_t v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Playlist with pid = %lld is not in the database, skipping add to cloud library.", buf, 0xCu);
    }
  }

  v16 = [(CloudLibraryOperation *)self musicLibrary];
  v17 = MSVTCCIdentityForCurrentProcess();
  [v16 setClientIdentity:v17];

  [v5 endTransaction];
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCreateGeniusPlaylistOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_playlistPersistentID, @"SagaAddPlaylistOperationPlaylistPersistentIDKey", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_playlistName forKey:@"SagaAddPlaylistOperationPlaylistNameKey"];
  [v4 encodeObject:self->_seedItemIDs forKey:@"SagaAddPlaylistOperationPlaylistSeedItemIDsKey"];
  [v4 encodeObject:self->_itemIDs forKey:@"SagaAddPlaylistOperationPlaylistItemIDsKey"];
}

- (SagaCreateGeniusPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SagaCreateGeniusPlaylistOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v13 initWithCoder:v4];
  if (v5)
  {
    v5->_int64_t playlistPersistentID = (int64_t)[v4 decodeInt64ForKey:@"SagaAddPlaylistOperationPlaylistPersistentIDKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaAddPlaylistOperationPlaylistNameKey"];
    playlistName = v5->_playlistName;
    v5->_playlistName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaAddPlaylistOperationPlaylistSeedItemIDsKey"];
    seedItemIDs = v5->_seedItemIDs;
    v5->_seedItemIDs = (NSArray *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaAddPlaylistOperationPlaylistItemIDsKey"];
    itemIDs = v5->_itemIDs;
    v5->_itemIDs = (NSArray *)v10;
  }
  return v5;
}

- (SagaCreateGeniusPlaylistOperation)initWithConfiguration:(id)a3 geniusPlaylistPersistentID:(int64_t)a4 playlistName:(id)a5 seedItemIDs:(id)a6 itemIDs:(id)a7 clientIdentity:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)SagaCreateGeniusPlaylistOperation;
  v17 = [(CloudLibraryOperation *)&v26 initWithConfiguration:a3 clientIdentity:a8];
  v18 = v17;
  if (v17)
  {
    v17->_int64_t playlistPersistentID = a4;
    v19 = (NSString *)[v14 copy];
    playlistName = v18->_playlistName;
    v18->_playlistName = v19;

    int64_t v21 = (NSArray *)[v15 copy];
    seedItemIDs = v18->_seedItemIDs;
    v18->_seedItemIDs = v21;

    v23 = (NSArray *)[v16 copy];
    itemIDs = v18->_itemIDs;
    v18->_itemIDs = v23;
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end