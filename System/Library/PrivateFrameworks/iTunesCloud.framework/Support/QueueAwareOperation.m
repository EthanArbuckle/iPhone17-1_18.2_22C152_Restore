@interface QueueAwareOperation
- (BOOL)shouldProcessSpecificArtists;
- (CloudArtworkImporter)artworkImporter;
- (ICUserIdentity)userIdentity;
- (ML3MusicLibrary)musicLibrary;
- (NSArray)albumArtistPersistentIDsToUpdate;
- (NSArray)artistPersistentIDsToUpdate;
- (NSOperationQueue)operationQueue;
- (OS_tcc_identity)clientIdentity;
- (QueueAwareOperation)initWithArtworkImporter:(id)a3 clientIdentity:(id)a4 operationQueue:(id)a5 artistPersistentIDsToUpdate:(id)a6 albumArtistPersistentIDsToUpdate:(id)a7;
- (void)setAlbumArtistPersistentIDsToUpdate:(id)a3;
- (void)setArtistPersistentIDsToUpdate:(id)a3;
@end

@implementation QueueAwareOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumArtistPersistentIDsToUpdate, 0);
  objc_storeStrong((id *)&self->_artistPersistentIDsToUpdate, 0);
  objc_destroyWeak((id *)&self->_operationQueue);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_artworkImporter, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);

  objc_storeStrong((id *)&self->_clientIdentity, 0);
}

- (void)setAlbumArtistPersistentIDsToUpdate:(id)a3
{
}

- (NSArray)albumArtistPersistentIDsToUpdate
{
  return self->_albumArtistPersistentIDsToUpdate;
}

- (void)setArtistPersistentIDsToUpdate:(id)a3
{
}

- (NSArray)artistPersistentIDsToUpdate
{
  return self->_artistPersistentIDsToUpdate;
}

- (BOOL)shouldProcessSpecificArtists
{
  return self->_shouldProcessSpecificArtists;
}

- (NSOperationQueue)operationQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operationQueue);

  return (NSOperationQueue *)WeakRetained;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (CloudArtworkImporter)artworkImporter
{
  return self->_artworkImporter;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (QueueAwareOperation)initWithArtworkImporter:(id)a3 clientIdentity:(id)a4 operationQueue:(id)a5 artistPersistentIDsToUpdate:(id)a6 albumArtistPersistentIDsToUpdate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)QueueAwareOperation;
  v16 = [(QueueAwareOperation *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 musicLibrary];
    musicLibrary = v16->_musicLibrary;
    v16->_musicLibrary = (ML3MusicLibrary *)v17;

    v19 = [v12 configuration];
    uint64_t v20 = [v19 userIdentity];
    userIdentity = v16->_userIdentity;
    v16->_userIdentity = (ICUserIdentity *)v20;

    objc_storeStrong((id *)&v16->_artworkImporter, a3);
    objc_storeWeak((id *)&v16->_operationQueue, v13);
    id v22 = [v14 count];
    v16->_shouldProcessSpecificArtists = (char *)[v15 count] + (void)v22 != 0;
    objc_storeStrong((id *)&v16->_artistPersistentIDsToUpdate, a6);
    objc_storeStrong((id *)&v16->_albumArtistPersistentIDsToUpdate, a7);
  }

  return v16;
}

@end