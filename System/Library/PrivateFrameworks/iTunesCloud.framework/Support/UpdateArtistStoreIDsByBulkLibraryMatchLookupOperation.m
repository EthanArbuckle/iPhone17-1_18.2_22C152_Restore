@interface UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation
- (NSNumber)bulkArtistNameLibraryMatchBatchSize;
- (NSURL)bulkArtistNameLibraryMatchURL;
- (void)main;
- (void)setBulkArtistNameLibraryMatchBatchSize:(id)a3;
- (void)setBulkArtistNameLibraryMatchURL:(id)a3;
@end

@implementation UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulkArtistNameLibraryMatchBatchSize, 0);

  objc_storeStrong((id *)&self->_bulkArtistNameLibraryMatchURL, 0);
}

- (void)setBulkArtistNameLibraryMatchBatchSize:(id)a3
{
}

- (NSNumber)bulkArtistNameLibraryMatchBatchSize
{
  return self->_bulkArtistNameLibraryMatchBatchSize;
}

- (void)setBulkArtistNameLibraryMatchURL:(id)a3
{
}

- (NSURL)bulkArtistNameLibraryMatchURL
{
  return self->_bulkArtistNameLibraryMatchURL;
}

- (void)main
{
  v3 = [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)self bulkArtistNameLibraryMatchURL];

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

    v13 = +[NSCharacterSet URLQueryAllowedCharacterSet];
    id v14 = [v13 mutableCopy];

    [v14 removeCharactersInString:@"+?"];
    v15 = [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)self bulkArtistNameLibraryMatchBatchSize];
    id v16 = [v15 integerValue];

    v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v33 = [v9 count];
      __int16 v34 = 2048;
      id v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Batching %lu library match requests in to chunks of size %ld.", buf, 0x16u);
    }

    v18 = [v9 allObjects];
    v19 = [v18 subarraysOfSize:v16];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000760F0;
    v29[3] = &unk_1001BB838;
    v29[4] = self;
    id v20 = v14;
    id v30 = v20;
    id v21 = v12;
    id v31 = v21;
    [v19 enumerateObjectsUsingBlock:v29];
    if ([(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)self isCancelled])
    {
      v22 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Cancelled after looking up artist store ids by name.", buf, 2u);
      }
    }
    else
    {
      v22 = [(QueueAwareOperation *)self operationQueue];
      if (v22)
      {
        v23 = [UpdateArtistArtworkTokensOperation alloc];
        v24 = [(QueueAwareOperation *)self artworkImporter];
        v25 = [(QueueAwareOperation *)self clientIdentity];
        v26 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
        v27 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
        v28 = [(QueueAwareOperation *)v23 initWithArtworkImporter:v24 clientIdentity:v25 operationQueue:v22 artistPersistentIDsToUpdate:v26 albumArtistPersistentIDsToUpdate:v27];

        [v22 addOperation:v28];
      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to resolve bulk artist name lookup URL from the library match rules bag, skipping artist hero image upate.", buf, 2u);
    }
  }
}

@end