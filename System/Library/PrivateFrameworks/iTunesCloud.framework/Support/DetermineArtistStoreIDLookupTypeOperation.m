@interface DetermineArtistStoreIDLookupTypeOperation
- (void)main;
@end

@implementation DetermineArtistStoreIDLookupTypeOperation

- (void)main
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = sub_10006E8D4;
  v65 = sub_10006E8E4;
  id v66 = 0;
  id v3 = objc_alloc((Class)ICStoreRequestContext);
  v4 = [(QueueAwareOperation *)self userIdentity];
  id v56 = [v3 initWithIdentity:v4];

  v5 = +[ICURLBagProvider sharedBagProvider];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1000707C4;
  v58[3] = &unk_1001BB7C0;
  v60 = &v61;
  dispatch_semaphore_t dsema = v2;
  dispatch_semaphore_t v59 = dsema;
  [v5 getBagForRequestContext:v56 withCompletionHandler:v58];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if ([(DetermineArtistStoreIDLookupTypeOperation *)self isCancelled])
  {
    v6 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Cancelled after loading URL bag";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_61;
    }
    goto LABEL_61;
  }
  v8 = (void *)v62[5];
  if (v8)
  {
    v9 = [v8 dictionaryForBagKey:ICURLBagKeyLibraryMatchRules];
    v53 = v9;
    if (!_NSIsNSDictionary())
    {
      id v15 = 0;
      v50 = 0;
      v51 = 0;
      v52 = 0;
      v54 = 0;
LABEL_47:
      v26 = [(QueueAwareOperation *)self operationQueue];
      if (v26)
      {
        if (v54)
        {
          v27 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v72 = (uint64_t)v52;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating artist store IDs using the bulk artist name lookup service (batch size = %@)", buf, 0xCu);
          }

          v28 = [UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation alloc];
          v29 = [(QueueAwareOperation *)self artworkImporter];
          v30 = [(QueueAwareOperation *)self clientIdentity];
          v31 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
          v32 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
          v33 = [(QueueAwareOperation *)v28 initWithArtworkImporter:v29 clientIdentity:v30 operationQueue:v26 artistPersistentIDsToUpdate:v31 albumArtistPersistentIDsToUpdate:v32];

          [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)v33 setBulkArtistNameLibraryMatchURL:v54];
          [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)v33 setBulkArtistNameLibraryMatchBatchSize:v52];
          [v26 addOperation:v33];
        }
        else
        {
          v34 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
          if (v50)
          {
            if (v35)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Updating artist store IDs using the allArtistImagesMap", buf, 2u);
            }

            v36 = [UpdateArtistStoreIDsByMapOperation alloc];
            v37 = [(QueueAwareOperation *)self artworkImporter];
            v38 = [(QueueAwareOperation *)self clientIdentity];
            v39 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
            v40 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
            v33 = [(QueueAwareOperation *)v36 initWithArtworkImporter:v37 clientIdentity:v38 operationQueue:v26 artistPersistentIDsToUpdate:v39 albumArtistPersistentIDsToUpdate:v40];

            [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)v33 setUpdateIntervalSeconds:v51];
            [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)v33 setAllArtistImagesMapURL:v50];
            [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)v33 setArtistNameLibraryMatchURL:v15];
            [v26 addOperation:v33];
          }
          else
          {
            if (v35)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Updating artist store IDs using the single artist name lookup service", buf, 2u);
            }

            v41 = [UpdateArtistStoreIDsByLibraryMatchLookupOperation alloc];
            v42 = [(QueueAwareOperation *)self artworkImporter];
            v43 = [(QueueAwareOperation *)self clientIdentity];
            v44 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
            v45 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
            v33 = [(QueueAwareOperation *)v41 initWithArtworkImporter:v42 clientIdentity:v43 operationQueue:v26 artistPersistentIDsToUpdate:v44 albumArtistPersistentIDsToUpdate:v45];

            [(UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation *)v33 setArtistNameLibraryMatchURL:v15];
            [v26 addOperation:v33];
          }
        }
      }
      v6 = v54;
      goto LABEL_61;
    }
    v10 = [v9 objectForKeyedSubscript:@"artist-image-match-bulk-url"];
    v47 = v10;
    if (_NSIsNSDictionary())
    {
      v11 = [v10 objectForKeyedSubscript:@"url"];
      if (_NSIsNSString() && [v11 length])
      {
        uint64_t v12 = +[NSURL URLWithString:v11];
        v52 = [v10 objectForKeyedSubscript:@"an-batch-size"];
        v54 = v12;
        v13 = v9;
        if (!v52)
        {
          v14 = sub_1000EFCD4();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v72 = 100;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "'an-batch-size' was not in the bag, defaulting to batches of %lld.", buf, 0xCu);
          }

          v52 = &off_1001CBE40;
        }
      }
      else
      {
        v13 = v9;
        v52 = 0;
        v54 = 0;
      }

      v9 = v13;
    }
    else
    {
      v52 = 0;
      v54 = 0;
    }
    v49 = [v9 objectForKeyedSubscript:@"all-artist-images-map-url"];
    if ([v49 length])
    {
      v50 = +[NSURL URLWithString:v49];
      v51 = [v53 objectForKeyedSubscript:@"update-interval-seconds"];
      if (!v51)
      {
        v16 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v72 = 604800;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "'update-interval-seconds' was not in the bag, defaulting to %lld seconds.", buf, 0xCu);
        }

        v51 = &off_1001CBE58;
      }
    }
    else
    {
      v50 = 0;
      v51 = 0;
    }
    id v46 = v53;
    v48 = [v46 objectForKeyedSubscript:@"artist"];
    if (_NSIsNSArray())
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v17 = v48;
      id v18 = [v17 countByEnumeratingWithState:&v67 objects:buf count:16];
      if (v18)
      {
        v19 = 0;
        uint64_t v20 = *(void *)v68;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v68 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if (_NSIsNSDictionary())
            {
              v23 = [v22 objectForKeyedSubscript:@"required-fields"];
              if (_NSIsNSArray() && [v23 containsObject:@"an"])
              {
                v24 = [v22 objectForKeyedSubscript:@"url"];

                if (_NSIsNSString())
                {
                  v19 = v24;
                }
                else
                {

                  v19 = 0;
                }
              }
            }
          }
          id v18 = [v17 countByEnumeratingWithState:&v67 objects:buf count:16];
        }
        while (v18);

        if (v19)
        {
          v25 = +[NSURL URLWithString:v19];
LABEL_46:
          id v15 = v25;

          goto LABEL_47;
        }
LABEL_45:
        v25 = 0;
        goto LABEL_46;
      }
    }
    v19 = 0;
    goto LABEL_45;
  }
  v6 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v7 = "Failed to load URL bag, skipping artist hero image update";
    goto LABEL_15;
  }
LABEL_61:

  _Block_object_dispose(&v61, 8);
}

@end