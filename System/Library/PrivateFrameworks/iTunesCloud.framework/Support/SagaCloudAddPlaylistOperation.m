@interface SagaCloudAddPlaylistOperation
+ (BOOL)supportsSecureCoding;
- (NSDictionary)globalIDToSagaIDMap;
- (SagaCloudAddPlaylistOperation)initWithClientIdentity:(id)a3 playlistGlobalID:(id)a4;
- (SagaCloudAddPlaylistOperation)initWithCoder:(id)a3;
- (SagaCloudAddPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistGlobalID:(id)a5;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logCloudAddRequestDescription;
- (void)processAddedItems:(id)a3;
- (void)removePendingAddedItemsForPermanentlyFailedOperation;
- (void)setGlobalIDToSagaIDMap:(id)a3;
@end

@implementation SagaCloudAddPlaylistOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_playlistGlobalID + 1), 0);

  objc_storeStrong((id *)(&self->super._updateRequired + 1), 0);
}

- (void)setGlobalIDToSagaIDMap:(id)a3
{
}

- (NSDictionary)globalIDToSagaIDMap
{
  return *(NSDictionary **)((char *)&self->_playlistGlobalID + 1);
}

- (void)removePendingAddedItemsForPermanentlyFailedOperation
{
  v3 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID equalToInt64:0];
  v20[0] = v3;
  v4 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyCloudGlobalID equalToValue:*(void *)(&self->super._updateRequired + 1)];
  v20[1] = v4;
  v5 = +[NSArray arrayWithObjects:v20 count:2];
  v6 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v5];

  v7 = [(CloudLibraryOperation *)self musicLibrary];
  v8 = +[ML3Container anyInLibrary:v7 predicate:v6];

  if (v8)
  {
    unsigned int v9 = [v8 deleteFromLibrary];
    v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(&self->super._updateRequired + 1);
        int v18 = 138543362;
        uint64_t v19 = v12;
        v13 = "Deleted pending playlist with global id: %{public}@";
LABEL_7:
        v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v15, v16, v13, (uint8_t *)&v18, 0xCu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(&self->super._updateRequired + 1);
      int v18 = 138543362;
      uint64_t v19 = v17;
      v13 = "Failed to delete pending playlist with global id: %{public}@";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(&self->super._updateRequired + 1);
      int v18 = 138543362;
      uint64_t v19 = v14;
      v13 = "Could not find a pending playlist to delete with global id: %{public}@";
      goto LABEL_7;
    }
  }
}

- (void)processAddedItems:(id)a3
{
  id v4 = a3;
  [(SagaCloudAddPlaylistOperation *)self setGlobalIDToSagaIDMap:v4];
  if ([v4 count])
  {
    v5 = [(CloudLibraryOperation *)self musicLibrary];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F58C0;
    v6[3] = &unk_1001BE540;
    v6[4] = self;
    id v7 = v4;
    [v5 performDatabaseTransactionWithBlock:v6];
  }
}

- (void)logCloudAddRequestDescription
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(&self->super._updateRequired + 1);
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cloud-add request for playlist global ID = %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(SagaCloudAddOperation *)self currentDatabaseRevision];
  uint64_t v6 = *(void *)(&self->super._updateRequired + 1);

  return +[ICAddToLibraryRequest requestWithDatabaseID:v3 databaseRevision:v5 playlistGlobalID:v6];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCloudAddPlaylistOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", *(void *)(&self->super._updateRequired + 1), @"SagaCloudAddPlaylistOperationPlaylistGlobalIDKey", v5.receiver, v5.super_class);
}

- (SagaCloudAddPlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SagaCloudAddPlaylistOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaCloudAddPlaylistOperationPlaylistGlobalIDKey"];
    id v7 = *(void **)(v5 + 89);
    *(void *)(v5 + 89) = v6;
  }
  return (SagaCloudAddPlaylistOperation *)v5;
}

- (SagaCloudAddPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistGlobalID:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SagaCloudAddPlaylistOperation;
  v10 = [(CloudLibraryOperation *)&v13 initWithConfiguration:a3 clientIdentity:a4];
  v11 = (SagaCloudAddPlaylistOperation *)v10;
  if (v10) {
    objc_storeStrong((id *)(v10 + 89), a5);
  }

  return v11;
}

- (SagaCloudAddPlaylistOperation)initWithClientIdentity:(id)a3 playlistGlobalID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  id v9 = [(SagaCloudAddPlaylistOperation *)self initWithConfiguration:v8 clientIdentity:v7 playlistGlobalID:v6];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end