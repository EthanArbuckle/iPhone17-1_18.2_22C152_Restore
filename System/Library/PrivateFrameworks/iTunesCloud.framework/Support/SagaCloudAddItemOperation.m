@interface SagaCloudAddItemOperation
+ (BOOL)supportsSecureCoding;
- (NSDictionary)adamIDToSagaIDMap;
- (SagaCloudAddItemOperation)initWithCoder:(id)a3;
- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 clientIdentity:(id)a5;
- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralAlbumAdamID:(int64_t)a5 clientIdentity:(id)a6;
- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralPlaylistGlobalID:(id)a5 clientIdentity:(id)a6;
- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3;
- (void)encodeWithCoder:(id)a3;
- (void)logCloudAddRequestDescription;
- (void)processAddedItems:(id)a3;
- (void)removePendingAddedItemsForPermanentlyFailedOperation;
- (void)setAdamIDToSagaIDMap:(id)a3;
@end

@implementation SagaCloudAddItemOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_referralPlaylistGlobalID + 1), 0);

  objc_storeStrong((id *)((char *)&self->_referralAlbumAdamID + 1), 0);
}

- (void)setAdamIDToSagaIDMap:(id)a3
{
}

- (NSDictionary)adamIDToSagaIDMap
{
  return *(NSDictionary **)((char *)&self->_referralPlaylistGlobalID + 1);
}

- (void)removePendingAddedItemsForPermanentlyFailedOperation
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating in_my_library for cloud-add failure.", v8, 2u);
  }

  v4 = [(CloudLibraryOperation *)self configuration];
  v5 = [(CloudLibraryOperation *)self clientIdentity];
  v6 = [(CloudLibraryOperation *)self musicLibrary];
  uint64_t v7 = objc_opt_class();
  sub_1000F47E0(v4, v5, v6, v7, *(void *)(&self->super._updateRequired + 1));
}

- (void)processAddedItems:(id)a3
{
  id v4 = a3;
  [(SagaCloudAddItemOperation *)self setAdamIDToSagaIDMap:v4];
  v5 = [(CloudLibraryOperation *)self musicLibrary];
  v6 = [(CloudLibraryOperation *)self clientIdentity];
  sub_10012A6EC(v4, v5, v6);

  uint64_t v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updating in_my_library for cloud-add success.", v12, 2u);
  }

  v8 = [(CloudLibraryOperation *)self configuration];
  v9 = [(CloudLibraryOperation *)self clientIdentity];
  v10 = [(CloudLibraryOperation *)self musicLibrary];
  uint64_t v11 = objc_opt_class();
  sub_1000F47E0(v8, v9, v10, v11, *(void *)(&self->super._updateRequired + 1));
}

- (void)logCloudAddRequestDescription
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(&self->super._updateRequired + 1);
    int v5 = 134217984;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cloud-add request for adam ID = %lld", (uint8_t *)&v5, 0xCu);
  }
}

- (id)cloudAddRequestWithDatabaseID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(SagaCloudAddOperation *)self currentDatabaseRevision];
  uint64_t v6 = *(void *)(&self->super._updateRequired + 1);
  uint64_t v7 = *(int64_t *)((char *)&self->_adamID + 1);
  uint64_t v8 = *(int64_t *)((char *)&self->_referralAlbumAdamID + 1);

  return +[ICAddToLibraryRequest requestWithDatabaseID:v3 databaseRevision:v5 adamID:v6 referralAlbumAdamID:v7 referralPlaylistGlobalID:v8];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaCloudAddItemOperation;
  id v4 = a3;
  [(CloudLibraryOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", *(void *)(&self->super._updateRequired + 1), @"SagaCloudAddItemOperationAdamIDKey", v5.receiver, v5.super_class);
}

- (SagaCloudAddItemOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SagaCloudAddItemOperation;
  objc_super v5 = [(CloudLibraryOperation *)&v7 initWithCoder:v4];
  if (v5) {
    *(void *)(v5 + 89) = [v4 decodeInt64ForKey:@"SagaCloudAddItemOperationAdamIDKey"];
  }

  return (SagaCloudAddItemOperation *)v5;
}

- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralPlaylistGlobalID:(id)a5 clientIdentity:(id)a6
{
  id v11 = a5;
  v12 = [(SagaCloudAddItemOperation *)self initWithConfiguration:a3 adamID:a4 clientIdentity:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)((char *)&v12->_referralAlbumAdamID + 1), a5);
  }

  return v13;
}

- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 referralAlbumAdamID:(int64_t)a5 clientIdentity:(id)a6
{
  result = [(SagaCloudAddItemOperation *)self initWithConfiguration:a3 adamID:a4 clientIdentity:a6];
  if (result) {
    *(int64_t *)((char *)&result->_adamID + 1) = a5;
  }
  return result;
}

- (SagaCloudAddItemOperation)initWithConfiguration:(id)a3 adamID:(int64_t)a4 clientIdentity:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)SagaCloudAddItemOperation;
  result = [(CloudLibraryOperation *)&v7 initWithConfiguration:a3 clientIdentity:a5];
  if (result) {
    *(void *)(&result->super._updateRequired + 1) = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end