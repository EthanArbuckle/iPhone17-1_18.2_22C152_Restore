@interface SagaLoadLyricsOperation
- (SagaLoadLyricsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaIDs:(id)a5;
- (void)main;
@end

@implementation SagaLoadLyricsOperation

- (void).cxx_destruct
{
}

- (void)main
{
  v2 = +[ICCloudAvailabilityController sharedController];
  unsigned __int8 v3 = [v2 shouldProhibitMusicActionForCurrentNetworkConditions];

  if ((v3 & 1) == 0)
  {
    v45 = [(CloudLibraryOperation *)self musicLibrary];
    v43 = [(CloudLibraryOperation *)self connection];
    NSUInteger v4 = [(NSArray *)self->_sagaIDs count];
    v36 = +[NSString stringWithFormat:@"SagaLoadLyricsOperation-bulk (item count = %llu)", v4];
    id v35 = [objc_alloc((Class)MSVXPCTransaction) initWithName:v36];
    [v35 beginTransaction];
    v5 = [(CloudLibraryOperation *)self musicLibrary];
    v6 = [(CloudLibraryOperation *)self clientIdentity];
    [v5 setClientIdentity:v6];

    v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Taking power assertion: com.apple.itunescloudd.SagaLoadLyricsOperation", buf, 2u);
    }

    CPSetPowerAssertionWithIdentifier();
    v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 100;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Fetching lyrics for %ld tracks (batch size = %u)", buf, 0x12u);
    }

    [(NSArray *)self->_sagaIDs subarraysOfSize:100];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v39 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v62;
      uint64_t v44 = ML3TrackPropertyStoreSagaID;
      uint64_t v40 = ML3TrackPropertyLyrics;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v62 != v38)
          {
            uint64_t v10 = v9;
            objc_enumerationMutation(obj);
            uint64_t v9 = v10;
          }
          uint64_t v41 = v9;
          v47 = +[ICBulkLyricsInfoRequest requestWithDatabaseID:itemIDs:useLongIDs:](ICBulkLyricsInfoRequest, "requestWithDatabaseID:itemIDs:useLongIDs:", [v43 databaseID], *(void *)(*((void *)&v61 + 1) + 8 * v9), 0);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v71 = sub_1000B2978;
          v72 = sub_1000B2988;
          id v73 = 0;
          dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_1000B2990;
          v58[3] = &unk_1001BEF30;
          v60 = buf;
          v12 = v11;
          v59 = v12;
          [v43 sendRequest:v47 withResponseHandler:v58];
          dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
          v42 = v12;
          if ([(SagaLoadLyricsOperation *)self isCancelled])
          {

            _Block_object_dispose(buf, 8);
            goto LABEL_42;
          }
          v46 = [*(id *)(*(void *)&buf[8] + 40) lyricsInfoDictionaries];
          if (v46)
          {
            v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              id v14 = [v46 count];
              *(_DWORD *)v65 = 134217984;
              id v66 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Bulk] Received %lu lyrics info dictionaries", v65, 0xCu);
            }

            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v48 = v46;
            id v15 = [v48 countByEnumeratingWithState:&v54 objects:v69 count:16];
            if (v15)
            {
              uint64_t v50 = *(void *)v55;
LABEL_17:
              uint64_t v16 = 0;
              id v51 = v15;
              while (1)
              {
                if (*(void *)v55 != v50) {
                  objc_enumerationMutation(v48);
                }
                v17 = *(void **)(*((void *)&v54 + 1) + 8 * v16);
                unsigned __int8 v19 = [(SagaLoadLyricsOperation *)self isCancelled];
                if ((v19 & 1) == 0)
                {
                  v20 = [v17 objectForKey:@"dmap.itemid"];
                  id v21 = [v20 longLongValue];

                  v49 = [v17 objectForKey:@"dmap.dictionary"];
                  v22 = [v49 objectForKey:@"text-url"];
                  v23 = +[NSURL URLWithString:v22];
                  v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v65 = 138543362;
                    id v66 = v23;
                    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Bulk] Loading lyrics from URL '%{public}@'...", v65, 0xCu);
                  }

                  id v53 = 0;
                  v25 = +[NSString stringWithContentsOfURL:v23 encoding:4 error:&v53];
                  id v26 = v53;
                  if (v26)
                  {
                    v27 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v65 = 138543618;
                      id v66 = v23;
                      __int16 v67 = 2114;
                      id v68 = v26;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[Bulk] Error getting lyrics from %{public}@: %{public}@", v65, 0x16u);
                    }
                  }
                  else
                  {
                    v28 = +[ML3ComparisonPredicate predicateWithProperty:v44 equalToInt64:v21];
                    v27 = +[ML3Track anyInLibrary:v45 predicate:v28];

                    v29 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                    v30 = v29;
                    if (v27)
                    {
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                      {
                        id v31 = [v25 length];
                        *(_DWORD *)v65 = 134218240;
                        id v66 = v31;
                        __int16 v67 = 2048;
                        id v68 = v21;
                        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[Bulk] Setting lyrics of length: %lu on track with saga ID %lld", v65, 0x16u);
                      }

                      [v27 setValue:v25 forProperty:v40];
                    }
                    else
                    {
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v65 = 134217984;
                        id v66 = v21;
                        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[Bulk] No track found for saga ID %lld when attempting to set lyrics.", v65, 0xCu);
                      }

                      v27 = 0;
                    }
                  }
                }
                if (v19) {
                  break;
                }
                if (v51 == (id)++v16)
                {
                  id v15 = [v48 countByEnumeratingWithState:&v54 objects:v69 count:16];
                  if (v15) {
                    goto LABEL_17;
                  }
                  break;
                }
              }
            }
          }
          _Block_object_dispose(buf, 8);

          uint64_t v9 = v41 + 1;
        }
        while ((id)(v41 + 1) != v39);
        id v39 = [obj countByEnumeratingWithState:&v61 objects:v74 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }
LABEL_42:

    v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Releasing power assertion: com.apple.itunescloudd.SagaLoadLyricsOperation", buf, 2u);
    }

    CPSetPowerAssertionWithIdentifier();
    v33 = [(CloudLibraryOperation *)self musicLibrary];
    v34 = MSVTCCIdentityForCurrentProcess();
    [v33 setClientIdentity:v34];

    [(CloudLibraryOperation *)self setStatus:1];
    [v35 endTransaction];
  }
}

- (SagaLoadLyricsOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaIDs:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SagaLoadLyricsOperation;
  uint64_t v10 = [(CloudLibraryOperation *)&v13 initWithConfiguration:a3 clientIdentity:a4];
  dispatch_semaphore_t v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_sagaIDs, a5);
  }

  return v11;
}

@end