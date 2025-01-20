@interface SagaSDKCreatePlaylistOperation
- (BOOL)waitForLibraryUpdate;
- (SagaSDKCreatePlaylistOperation)initWithCoder:(id)a3;
- (SagaSDKCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7 clientIdentity:(id)a8;
- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SagaSDKCreatePlaylistOperation

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SagaSDKCreatePlaylistOperation;
  id v4 = a3;
  [(SagaCreatePlaylistOperation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestingBundleID, @"SagaSDKCreatePlaylistOperationRequestingBundleKey", v5.receiver, v5.super_class);
}

- (SagaSDKCreatePlaylistOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SagaSDKCreatePlaylistOperation;
  objc_super v5 = [(SagaCreatePlaylistOperation *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SagaSDKCreatePlaylistOperationRequestingBundleKey"];
    requestingBundleID = v5->_requestingBundleID;
    v5->_requestingBundleID = (NSString *)v6;
  }
  return v5;
}

- (BOOL)waitForLibraryUpdate
{
  return 1;
}

- (id)requestWithDatabaseID:(unsigned int)a3 databaseRevision:(unsigned int)a4 playlistProperties:(id)a5 trackList:(id)a6
{
  return +[ICSDKCreateContainerRequest requestWithDatabaseID:*(void *)&a3 databaseRevision:*(void *)&a4 playlistProperties:a5 trackList:a6 requestingBundleID:self->_requestingBundleID];
}

- (SagaSDKCreatePlaylistOperation)initWithConfiguration:(id)a3 playlistPersistentID:(int64_t)a4 properties:(id)a5 trackList:(id)a6 requestingBundleID:(id)a7 clientIdentity:(id)a8
{
  id v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SagaSDKCreatePlaylistOperation;
  v15 = [(SagaCreatePlaylistOperation *)&v19 initWithConfiguration:a3 playlistPersistentID:a4 properties:a5 trackList:a6 clientIdentity:a8];
  if (v15)
  {
    v16 = (NSString *)[v14 copy];
    requestingBundleID = v15->_requestingBundleID;
    v15->_requestingBundleID = v16;
  }
  return v15;
}

@end