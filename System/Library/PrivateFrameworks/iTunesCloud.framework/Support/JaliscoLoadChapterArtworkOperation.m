@interface JaliscoLoadChapterArtworkOperation
- (JaliscoLoadChapterArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 dictionary:(id)a5;
- (JaliscoLoadChapterArtworkOperation)initWithDictionary:(id)a3;
- (void)cancel;
- (void)main;
@end

@implementation JaliscoLoadChapterArtworkOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkDownloadOperationQueue, 0);
  objc_storeStrong((id *)&self->_artworkDownloadSession, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);

  objc_storeStrong((id *)&self->_chapterArtworkToLoad, 0);
}

- (void)cancel
{
  [(NSOperationQueue *)self->_artworkDownloadOperationQueue cancelAllOperations];
  v3.receiver = self;
  v3.super_class = (Class)JaliscoLoadChapterArtworkOperation;
  [(JaliscoLoadChapterArtworkOperation *)&v3 cancel];
}

- (void)main
{
  objc_super v3 = +[ICCloudAvailabilityController sharedController];
  unsigned __int8 v4 = [v3 shouldProhibitVideosActionForCurrentNetworkConditions];

  if ((v4 & 1) == 0)
  {
    v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      powerAssertionIdentifier = self->_powerAssertionIdentifier;
      *(_DWORD *)buf = 138543362;
      v61 = powerAssertionIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading Chapter Artwork with power assertion: %{public}@", buf, 0xCu);
    }

    CPSetPowerAssertionWithIdentifier();
    v7 = [(CloudLibraryOperation *)self musicLibrary];
    v8 = [(CloudLibraryOperation *)self clientIdentity];
    [v7 setClientIdentity:v8];

    group = dispatch_group_create();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = [(NSDictionary *)self->_chapterArtworkToLoad allKeys];
    id v39 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v57;
      uint64_t v45 = ML3TrackPropertyPurchaseHistoryID;
      uint64_t v41 = ML3TrackPropertyMediaType;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v57 != v38) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v56 + 1) + 8 * v9);
        if ([(JaliscoLoadChapterArtworkOperation *)self isCancelled]) {
          break;
        }
        uint64_t v40 = v9;
        v11 = [(NSDictionary *)self->_chapterArtworkToLoad objectForKeyedSubscript:v10];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v44 = v11;
        id v43 = [v11 allKeys];
        id v47 = [v43 countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v47)
        {
          uint64_t v46 = *(void *)v53;
LABEL_12:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v53 != v46) {
              objc_enumerationMutation(v43);
            }
            v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
            if ([(JaliscoLoadChapterArtworkOperation *)self isCancelled]) {
              break;
            }
            v14 = [(CloudLibraryOperation *)self musicLibrary];
            v15 = +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:](ML3ComparisonPredicate, "predicateWithProperty:equalToInt64:", v45, [v10 longLongValue]);
            v16 = +[ML3Track anyInLibrary:v14 predicate:v15 options:3];

            if (v16)
            {
              uint64_t v17 = [v44 objectForKeyedSubscript:v13];
              v18 = [v16 valueForProperty:v41];
              unsigned int v48 = [v18 unsignedIntValue];

              id v19 = [v16 persistentID];
              [v13 doubleValue];
              v49 = +[ML3MusicLibrary artworkTokenForChapterWithItemPID:v19 retrievalTime:v20 / 1000.0];
              v21 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (NSString *)[v10 longLongValue];
                id v23 = [v13 longLongValue];
                *(_DWORD *)buf = 134218498;
                v61 = v22;
                __int16 v62 = 2048;
                id v63 = v23;
                __int16 v64 = 2114;
                uint64_t v65 = v17;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Fetching chapter artwork (purchase history ID = %lld, chapter time = %lld): %{public}@", buf, 0x20u);
              }

              v24 = [CloudArtworkImportOperation alloc];
              artworkDownloadSession = self->_artworkDownloadSession;
              [(CloudLibraryOperation *)self configuration];
              v26 = (void *)v17;
              v28 = v27 = self;
              id v29 = [v10 unsignedLongLongValue];
              v30 = [(CloudLibraryOperation *)v27 clientIdentity];
              v31 = [(CloudArtworkImportOperation *)v24 initWithURLSession:artworkDownloadSession configuration:v28 cloudID:v29 artworkToken:v49 artworkType:3 sourceType:400 clientIdentity:v30];

              self = v27;
              [(CloudArtworkImportOperation *)v31 setMediaType:v48];
              [(CloudArtworkImportOperation *)v31 setAssetURL:v26];
              v50[0] = _NSConcreteStackBlock;
              v50[1] = 3221225472;
              v50[2] = sub_100034108;
              v50[3] = &unk_1001BEC20;
              v32 = group;
              v51 = v32;
              [(CloudArtworkImportOperation *)v31 setCompletionBlock:v50];
              [(CloudArtworkImportOperation *)v31 setQualityOfService:25];
              dispatch_group_enter(v32);
              [(NSOperationQueue *)v27->_artworkDownloadOperationQueue addOperation:v31];
            }
            if (v47 == (id)++v12)
            {
              id v47 = [v43 countByEnumeratingWithState:&v52 objects:v66 count:16];
              if (v47) {
                goto LABEL_12;
              }
              break;
            }
          }
        }

        uint64_t v9 = v40 + 1;
        if ((id)(v40 + 1) == v39)
        {
          id v39 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
          if (v39) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
    v33 = [(CloudLibraryOperation *)self musicLibrary];
    v34 = MSVTCCIdentityForCurrentProcess();
    [v33 setClientIdentity:v34];

    v35 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = self->_powerAssertionIdentifier;
      *(_DWORD *)buf = 138543362;
      v61 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Loading Chapter Artwork Complete, releasing power assertion: %{public}@", buf, 0xCu);
    }

    CPSetPowerAssertionWithIdentifier();
    [(CloudLibraryOperation *)self setStatus:1];
  }
}

- (JaliscoLoadChapterArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 dictionary:(id)a5
{
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)JaliscoLoadChapterArtworkOperation;
  v10 = [(CloudLibraryOperation *)&v21 initWithConfiguration:a3 clientIdentity:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_chapterArtworkToLoad, a5);
    uint64_t v12 = +[NSString stringWithFormat:@"com.apple.itunescloudd.%@", objc_opt_class()];
    powerAssertionIdentifier = v11->_powerAssertionIdentifier;
    v11->_powerAssertionIdentifier = (NSString *)v12;

    v14 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v14 setHTTPShouldUsePipelining:1];
    v15 = +[ICCloudAvailabilityController sharedController];
    objc_msgSend(v14, "setAllowsCellularAccess:", objc_msgSend(v15, "isCellularDataRestrictedForVideos") ^ 1);

    v16 = (ICURLSession *)[objc_alloc((Class)ICURLSession) initWithConfiguration:v14 maxConcurrentRequests:5 qualityOfService:17];
    artworkDownloadSession = v11->_artworkDownloadSession;
    v11->_artworkDownloadSession = v16;

    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    artworkDownloadOperationQueue = v11->_artworkDownloadOperationQueue;
    v11->_artworkDownloadOperationQueue = v18;

    [(NSOperationQueue *)v11->_artworkDownloadOperationQueue setMaxConcurrentOperationCount:5];
  }

  return v11;
}

- (JaliscoLoadChapterArtworkOperation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = MSVTCCIdentityForCurrentProcess();
  v7 = [(JaliscoLoadChapterArtworkOperation *)self initWithConfiguration:v5 clientIdentity:v6 dictionary:v4];

  return v7;
}

@end