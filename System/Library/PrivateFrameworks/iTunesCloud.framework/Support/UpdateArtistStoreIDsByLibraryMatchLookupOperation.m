@interface UpdateArtistStoreIDsByLibraryMatchLookupOperation
- (NSURL)artistNameLibraryMatchURL;
- (void)main;
- (void)setArtistNameLibraryMatchURL:(id)a3;
@end

@implementation UpdateArtistStoreIDsByLibraryMatchLookupOperation

- (void).cxx_destruct
{
}

- (void)setArtistNameLibraryMatchURL:(id)a3
{
}

- (NSURL)artistNameLibraryMatchURL
{
  return self->_artistNameLibraryMatchURL;
}

- (void)main
{
  v3 = [(UpdateArtistStoreIDsByLibraryMatchLookupOperation *)self artistNameLibraryMatchURL];

  if (v3)
  {
    unsigned int v4 = [(QueueAwareOperation *)self shouldProcessSpecificArtists];
    v5 = [(QueueAwareOperation *)self musicLibrary];
    v6 = v5;
    if (v4)
    {
      v7 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
      v8 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
      v9 = sub_100070B20(v6, v7, v8);
    }
    else
    {
      v9 = sub_100070E24(v5);
    }

    id v10 = objc_alloc((Class)ICStoreRequestContext);
    v11 = [(QueueAwareOperation *)self userIdentity];
    id v12 = [v10 initWithIdentity:v11];

    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100071010;
    v24 = &unk_1001BB888;
    v25 = self;
    id v13 = v12;
    id v26 = v13;
    [v9 enumerateObjectsUsingBlock:&v21];
    if ([(UpdateArtistStoreIDsByLibraryMatchLookupOperation *)self isCancelled])
    {
      v14 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cancelled after looking up artist store ids by name.", buf, 2u);
      }
    }
    else
    {
      v14 = [(QueueAwareOperation *)self operationQueue];
      if (v14)
      {
        v15 = [UpdateArtistArtworkTokensOperation alloc];
        v16 = [(QueueAwareOperation *)self artworkImporter];
        v17 = [(QueueAwareOperation *)self clientIdentity];
        v18 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
        v19 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
        v20 = [(QueueAwareOperation *)v15 initWithArtworkImporter:v16 clientIdentity:v17 operationQueue:v14 artistPersistentIDsToUpdate:v18 albumArtistPersistentIDsToUpdate:v19];

        [v14 addOperation:v20];
      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to resolve an artist name lookup URL from the library match rules bag, skipping artist hero image upate.", buf, 2u);
    }
  }
}

@end