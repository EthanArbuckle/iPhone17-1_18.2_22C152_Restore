@interface BADownloadQueue
+ (BOOL)supportsSecureCoding;
+ (id)classesForSerialization;
- (BADownloadQueue)initWithApplicationIdentifier:(id)a3 delegate:(id)a4;
- (BADownloadQueue)initWithCoder:(id)a3;
- (BADownloadQueueDelegate)delegate;
- (BAManifestDownload)activeManifestDownload;
- (BOOL)cancelDownload:(id)a3 error:(id *)a4;
- (BOOL)essentialAssetsWaitingOnContentRequest;
- (BOOL)frozen;
- (BOOL)startNextDownload;
- (NSArray)allDownloads;
- (NSDate)lastDownloadStartDate;
- (NSMutableDictionary)identifiersToDownloads;
- (NSMutableDictionary)uniqueIdentifiersToDownloads;
- (NSMutableOrderedSet)downloads;
- (NSMutableSet)activeDownloads;
- (NSMutableSet)essentialAssetIdentifiersMonitored;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)stagingDirectory;
- (id)_downloadWithIdentifier:(id)a3;
- (id)_downloadWithUniqueIdentifier:(id)a3;
- (id)downloadWithUniqueIdentifier:(id)a3;
- (int64_t)_essentialAssetState;
- (int64_t)essentialAssetsBytesDownloaded;
- (int64_t)essentialAssetsStateWithSizeDownloaded:(int64_t *)a3 totalDownloadSize:(int64_t *)a4;
- (int64_t)numberOfActiveDownloads;
- (int64_t)numberOfWaitingDownloads;
- (unint64_t)essentialAssetsBytesTotal;
- (void)_addDownload:(id)a3;
- (void)_cancelAllDownloadsSilently:(BOOL)a3;
- (void)_removeDownload:(id)a3;
- (void)_reportEssentialAssetStateAndProgress;
- (void)cancelAllDownloads;
- (void)cancelAllDownloadsSilently;
- (void)demoteAllForegroundDownloads;
- (void)download:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)download:(id)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5;
- (void)download:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)download:(id)a3 failedWithError:(id)a4;
- (void)download:(id)a3 finishedWithFileURL:(id)a4;
- (void)downloadDidBegin:(id)a3;
- (void)downloadDidPause:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)freeze;
- (void)pauseAllDownloads;
- (void)scheduleContentRequest:(int64_t)a3 downloads:(id)a4 applicationInfo:(id)a5 completionHandler:(id)a6;
- (void)scheduleContentRequestAborted;
- (void)scheduleDownload:(id)a3 completionHandler:(id)a4;
- (void)setActiveDownloads:(id)a3;
- (void)setActiveManifestDownload:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloads:(id)a3;
- (void)setEssentialAssetIdentifiersMonitored:(id)a3;
- (void)setEssentialAssetsBytesDownloaded:(int64_t)a3;
- (void)setEssentialAssetsBytesTotal:(unint64_t)a3;
- (void)setEssentialAssetsWaitingOnContentRequest:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setIdentifiersToDownloads:(id)a3;
- (void)setLastDownloadStartDate:(id)a3;
- (void)setUniqueIdentifiersToDownloads:(id)a3;
- (void)startForegroundDownload:(id)a3 completionHandler:(id)a4;
- (void)thaw;
@end

@implementation BADownloadQueue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classesForSerialization
{
  if (qword_100069570 != -1) {
    dispatch_once(&qword_100069570, &stru_10005CEB8);
  }
  v2 = (void *)qword_100069568;

  return v2;
}

- (BADownloadQueue)initWithApplicationIdentifier:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)BADownloadQueue;
  v9 = [(BADownloadQueue *)&v31 init];
  if (v9)
  {
    v10 = [v7 _baassets_validUTI];
    if (![v10 isEqualToString:v7])
    {

      v27 = 0;
      goto LABEL_6;
    }
    v9->_stateLock = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = +[NSDate distantPast];
    [(BADownloadQueue *)v9 setLastDownloadStartDate:v11];

    [(BADownloadQueue *)v9 setFrozen:0];
    id v12 = objc_alloc_init((Class)NSMutableOrderedSet);
    [(BADownloadQueue *)v9 setDownloads:v12];

    id v13 = objc_alloc_init((Class)NSMutableSet);
    [(BADownloadQueue *)v9 setActiveDownloads:v13];

    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    [(BADownloadQueue *)v9 setUniqueIdentifiersToDownloads:v14];

    id v15 = objc_alloc_init((Class)NSMutableDictionary);
    [(BADownloadQueue *)v9 setIdentifiersToDownloads:v15];

    [(BADownloadQueue *)v9 setActiveManifestDownload:0];
    [(BADownloadQueue *)v9 setDelegate:v8];
    [(BADownloadQueue *)v9 setEssentialAssetsWaitingOnContentRequest:0];
    [(BADownloadQueue *)v9 setEssentialAssetsBytesDownloaded:0];
    [(BADownloadQueue *)v9 setEssentialAssetsBytesTotal:0];
    v16 = +[NSMutableSet set];
    [(BADownloadQueue *)v9 setEssentialAssetIdentifiersMonitored:v16];

    v17 = +[NSString stringWithFormat:@"DownloadStaging/%@", v10];
    v18 = sub_1000196F4();
    uint64_t v19 = [v18 stringByAppendingPathComponent:v17];
    stagingDirectory = v9->_stagingDirectory;
    v9->_stagingDirectory = (NSString *)v19;

    v21 = +[NSFileManager defaultManager];
    v22 = [(BADownloadQueue *)v9 stagingDirectory];
    id v30 = 0;
    [v21 removeItemAtPath:v22 error:&v30];
    id v23 = v30;

    v24 = +[NSFileManager defaultManager];
    v25 = [(BADownloadQueue *)v9 stagingDirectory];
    id v29 = v23;
    [v24 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v26 = v29;
  }
  v27 = v9;
LABEL_6:

  return v27;
}

- (BADownloadQueue)initWithCoder:(id)a3
{
  id v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)BADownloadQueue;
  v5 = [(BADownloadQueue *)&v73 init];
  v6 = v5;
  if (v5)
  {
    v5->_stateLock = 0;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastDownloadStartDate"];
    [(BADownloadQueue *)v6 setLastDownloadStartDate:v9];

    v10 = [(BADownloadQueue *)v6 lastDownloadStartDate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v12 = +[NSDate distantPast];
      [(BADownloadQueue *)v6 setLastDownloadStartDate:v12];
    }
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"downloads"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(BADownloadQueue *)v6 setDownloads:v19];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        +[NSMutableOrderedSet orderedSetWithArray:v19];
      }
      else {
      v20 = +[NSMutableOrderedSet orderedSet];
      }
      [(BADownloadQueue *)v6 setDownloads:v20];
    }
    if ([v4 containsValueForKey:@"activeManifestDownload"])
    {
      v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeManifestDownload"];
      [(BADownloadQueue *)v6 setActiveManifestDownload:v21];
    }
    [(BADownloadQueue *)v6 setEssentialAssetsWaitingOnContentRequest:0];
    if ([v4 containsValueForKey:@"essentialAssetsBytesTotal"]) {
      -[BADownloadQueue setEssentialAssetsBytesTotal:](v6, "setEssentialAssetsBytesTotal:", [v4 decodeIntegerForKey:@"essentialAssetsBytesTotal"]);
    }
    if ([v4 containsValueForKey:@"essentialAssetsBytesDownloaded"]) {
      -[BADownloadQueue setEssentialAssetsBytesDownloaded:](v6, "setEssentialAssetsBytesDownloaded:", [v4 decodeIntegerForKey:@"essentialAssetsBytesDownloaded"]);
    }
    v64 = (void *)v19;
    if ([v4 containsValueForKey:@"essentialAssetIdentifiersMonitored"])
    {
      uint64_t v22 = objc_opt_class();
      id v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, objc_opt_class(), 0);
      v24 = [v4 decodeObjectOfClasses:v23 forKey:@"essentialAssetIdentifiersMonitored"];
      [(BADownloadQueue *)v6 setEssentialAssetIdentifiersMonitored:v24];
    }
    if ([v4 containsValueForKey:@"frozen"]) {
      -[BADownloadQueue setFrozen:](v6, "setFrozen:", [v4 decodeBoolForKey:@"frozen"]);
    }
    v25 = [(BADownloadQueue *)v6 identifier];
    uint64_t v26 = [v25 _baassets_validUTI];

    v63 = (void *)v26;
    uint64_t v27 = +[NSString stringWithFormat:@"DownloadStaging/%@", v26];
    v28 = sub_1000196F4();
    v62 = (void *)v27;
    uint64_t v29 = [v28 stringByAppendingPathComponent:v27];
    stagingDirectory = v6->_stagingDirectory;
    v6->_stagingDirectory = (NSString *)v29;

    objc_super v31 = +[NSFileManager defaultManager];
    v32 = [(BADownloadQueue *)v6 stagingDirectory];
    [v31 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:0 error:0];

    v33 = +[NSMutableSet set];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    v34 = [(BADownloadQueue *)v6 downloads];
    id v35 = [v34 countByEnumeratingWithState:&v69 objects:v75 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v70;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v70 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || [v39 state] == (id)-1) {
            [v33 addObject:v39];
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v69 objects:v75 count:16];
      }
      while (v36);
    }

    id v40 = objc_alloc_init((Class)NSMutableSet);
    [(BADownloadQueue *)v6 setActiveDownloads:v40];

    v41 = +[NSMutableDictionary dictionary];
    [(BADownloadQueue *)v6 setUniqueIdentifiersToDownloads:v41];

    v42 = +[NSMutableDictionary dictionary];
    [(BADownloadQueue *)v6 setIdentifiersToDownloads:v42];

    v43 = [(BADownloadQueue *)v6 downloads];
    [v43 minusSet:v33];

    v44 = [(BADownloadQueue *)v6 activeManifestDownload];

    v45 = [(BADownloadQueue *)v6 downloads];
    v46 = [v45 set];
    if (v44)
    {
      v47 = [(BADownloadQueue *)v6 activeManifestDownload];
      uint64_t v48 = [v46 setByAddingObject:v47];

      v46 = (void *)v48;
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v49 = v46;
    id v50 = [v49 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = *(void *)v66;
      do
      {
        for (j = 0; j != v51; j = (char *)j + 1)
        {
          if (*(void *)v66 != v52) {
            objc_enumerationMutation(v49);
          }
          v54 = *(void **)(*((void *)&v65 + 1) + 8 * (void)j);
          v55 = [(BADownloadQueue *)v6 identifier];
          [v54 setApplicationIdentifier:v55];

          v56 = [(BADownloadQueue *)v6 stagingDirectory];
          [v54 setDownloadCachePath:v56];

          if ([v54 state] == (id)2 || objc_msgSend(v54, "state") == (id)3) {
            sub_100032D34(v54, 1);
          }
          v57 = [(BADownloadQueue *)v6 uniqueIdentifiersToDownloads];
          v58 = [v54 uniqueIdentifier];
          [v57 setObject:v54 forKey:v58];

          v59 = [(BADownloadQueue *)v6 identifiersToDownloads];
          v60 = [v54 identifier];
          [v59 setObject:v54 forKey:v60];
        }
        id v51 = [v49 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v51);
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(BADownloadQueue *)self identifier];
  [v10 encodeObject:v4 forKey:@"identifier"];

  os_unfair_recursive_lock_lock_with_options();
  v5 = [(BADownloadQueue *)self lastDownloadStartDate];
  [v10 encodeObject:v5 forKey:@"lastDownloadStartDate"];

  [v10 encodeBool:-[BADownloadQueue frozen](self, "frozen") forKey:@"frozen"];
  v6 = [(BADownloadQueue *)self downloads];
  [v10 encodeObject:v6 forKey:@"downloads"];

  uint64_t v7 = [(BADownloadQueue *)self activeManifestDownload];

  if (v7)
  {
    id v8 = [(BADownloadQueue *)self activeManifestDownload];
    [v10 encodeObject:v8 forKey:@"activeManifestDownload"];
  }
  [v10 encodeInteger:-[BADownloadQueue essentialAssetsBytesTotal](self, "essentialAssetsBytesTotal") forKey:@"essentialAssetsBytesTotal"];
  [v10 encodeInteger:-[BADownloadQueue essentialAssetsBytesDownloaded](self, "essentialAssetsBytesDownloaded") forKey:@"essentialAssetsBytesDownloaded"];
  v9 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
  [v10 encodeObject:v9 forKey:@"essentialAssetIdentifiersMonitored"];

  os_unfair_recursive_lock_unlock();
}

- (void)_addDownload:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
    id v7 = [v6 copy];

    if ([v7 count])
    {
      id v8 = sub_100013B54();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(BADownloadQueue *)self identifier];
        *(_DWORD *)buf = 138543618;
        v33 = v9;
        __int16 v34 = 2048;
        id v35 = [v7 count];
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "New manifest being enqueued for %{public}@, canceling existing essential downloads. (Count: %ld)", buf, 0x16u);
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = v7;
      id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v28;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v28 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = -[BADownloadQueue _downloadWithIdentifier:](self, "_downloadWithIdentifier:", *(void *)(*((void *)&v27 + 1) + 8 * (void)v14), (void)v27);
            uint64_t v16 = v15;
            if (v15)
            {
              [v15 cancelDownload];
              [(BADownloadQueue *)self _removeDownload:v16];
            }

            uint64_t v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v12);
      }
    }
    -[BADownloadQueue setActiveManifestDownload:](self, "setActiveManifestDownload:", v5, (void)v27);
    [(BADownloadQueue *)self setEssentialAssetsBytesTotal:0];
    [(BADownloadQueue *)self setEssentialAssetsBytesDownloaded:0];
    if ((unint64_t)(sub_10000C064((uint64_t)v5) - 1) > 1)
    {
      uint64_t v17 = +[NSMutableSet set];
      [(BADownloadQueue *)self setEssentialAssetIdentifiersMonitored:v17];
    }
    else
    {
      uint64_t v17 = [v5 identifier];
      v18 = +[NSMutableSet setWithObject:v17];
      [(BADownloadQueue *)self setEssentialAssetIdentifiersMonitored:v18];
    }
    [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
  }
  uint64_t v19 = [(BADownloadQueue *)self downloads];
  v20 = [(BADownloadQueue *)self downloads];
  id v21 = [v19 indexOfObject:v4 inSortedRange:0 options:1024 usingComparator:&stru_10005CEF8];

  uint64_t v22 = [(BADownloadQueue *)self downloads];
  [v22 insertObject:v4 atIndex:v21];

  id v23 = [(BADownloadQueue *)self uniqueIdentifiersToDownloads];
  v24 = [v4 uniqueIdentifier];
  [v23 setObject:v4 forKey:v24];

  v25 = [(BADownloadQueue *)self identifiersToDownloads];
  uint64_t v26 = [v4 identifier];
  [v25 setObject:v4 forKey:v26];
}

- (void)_removeDownload:(id)a3
{
  id v14 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  id v4 = [(BADownloadQueue *)self activeDownloads];
  [v4 removeObject:v14];

  id v5 = [(BADownloadQueue *)self downloads];
  [v5 removeObject:v14];

  v6 = [(BADownloadQueue *)self uniqueIdentifiersToDownloads];
  id v7 = [v14 uniqueIdentifier];
  [v6 removeObjectForKey:v7];

  id v8 = [(BADownloadQueue *)self identifiersToDownloads];
  v9 = [v14 identifier];
  [v8 removeObjectForKey:v9];

  id v10 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
  id v11 = [v14 identifier];
  [v10 removeObject:v11];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [(BADownloadQueue *)self activeManifestDownload];
    unsigned int v13 = [v12 isEqual:v14];

    if (v13) {
      [(BADownloadQueue *)self setActiveManifestDownload:0];
    }
  }
}

- (id)_downloadWithUniqueIdentifier:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)p_stateLock);
  v6 = [(BADownloadQueue *)self uniqueIdentifiersToDownloads];
  id v7 = [v6 objectForKey:v5];

  return v7;
}

- (id)_downloadWithIdentifier:(id)a3
{
  p_stateLock = &self->_stateLock;
  id v5 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)p_stateLock);
  v6 = [(BADownloadQueue *)self identifiersToDownloads];
  id v7 = [v6 objectForKey:v5];

  return v7;
}

- (id)downloadWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  id v5 = [(BADownloadQueue *)self _downloadWithUniqueIdentifier:v4];

  os_unfair_recursive_lock_unlock();

  return v5;
}

- (int64_t)essentialAssetsStateWithSizeDownloaded:(int64_t *)a3 totalDownloadSize:(int64_t *)a4
{
  os_unfair_recursive_lock_lock_with_options();
  int64_t v7 = [(BADownloadQueue *)self _essentialAssetState];
  if (a3) {
    *a3 = [(BADownloadQueue *)self essentialAssetsBytesDownloaded];
  }
  if (a4) {
    *a4 = [(BADownloadQueue *)self essentialAssetsBytesTotal];
  }
  os_unfair_recursive_lock_unlock();
  return v7;
}

- (int64_t)_essentialAssetState
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  v3 = [(BADownloadQueue *)self activeManifestDownload];

  if (v3)
  {
    id v4 = [(BADownloadQueue *)self activeManifestDownload];
    uint64_t v5 = sub_10000C064((uint64_t)v4);

    if ((unint64_t)(v5 - 1) <= 1)
    {
      v6 = [(BADownloadQueue *)self activeManifestDownload];
      unint64_t v7 = (unint64_t)[v6 state];

      if (v7 < 4) {
        return qword_100046D30[v7];
      }
    }
  }
  else
  {
    if ([(BADownloadQueue *)self essentialAssetsWaitingOnContentRequest]) {
      return 3;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      int v12 = 0;
      int v13 = 0;
      char v14 = 0;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v18 = [(BADownloadQueue *)self identifiersToDownloads];
          uint64_t v19 = [v18 objectForKey:v17];

          if (v19)
          {
            BOOL v20 = [v19 state] == (id)2;
            if (![v19 state] || objc_msgSend(v19, "state") == (id)1) {
              int v13 = 1;
            }
            v12 |= v20;
            if (v12 & v13)
            {

              LOBYTE(v13) = 1;
              LOBYTE(v12) = 1;
LABEL_23:
              if ([(BADownloadQueue *)self frozen]) {
                return 5;
              }
              int64_t v21 = 3;
              if ((v13 & 1) == 0) {
                int64_t v21 = 0;
              }
              if (v12) {
                return 4;
              }
              else {
                return v21;
              }
            }
            char v14 = 1;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v11) {
          continue;
        }
        break;
      }

      if (v14) {
        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  return 0;
}

- (void)_reportEssentialAssetStateAndProgress
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_stateLock);
  int64_t v3 = [(BADownloadQueue *)self _essentialAssetState];
  int64_t v4 = [(BADownloadQueue *)self essentialAssetsBytesDownloaded];
  unint64_t v5 = [(BADownloadQueue *)self essentialAssetsBytesTotal];
  id v6 = [(BADownloadQueue *)self delegate];
  [v6 downloadQueue:self essentialAssetState:v3 bytesWritten:v4 totalBytes:v5];
}

- (void)scheduleDownload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  os_unfair_lock_lock((os_unfair_lock_t)[v6 downloadLock]);
  v9 = [(BADownloadQueue *)self identifier];
  [v6 setApplicationIdentifier:v9];

  id v10 = [(BADownloadQueue *)self stagingDirectory];
  [v6 setDownloadCachePath:v10];

  sub_100032D34(v6, 1);
  id v11 = [v6 necessity];
  uint64_t v37 = v6;
  os_unfair_lock_unlock((os_unfair_lock_t)[v6 downloadLock]);
  qos_class_t v12 = qos_class_self();
  uint64_t v13 = dispatch_get_global_queue(v12, 0);
  char v14 = v13;
  if ((isKindOfClass & 1) != 0 || v11 != (id)1)
  {
    queue = v13;
    id v36 = v7;
    os_unfair_recursive_lock_lock_with_options();
    id v17 = +[NSMutableSet set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v18 = [(BADownloadQueue *)self downloads];
    id v19 = [v18 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v48;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(v18);
          }
          long long v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          if (isKindOfClass & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            [v17 addObject:v23];
          }
          else
          {
            long long v24 = [v23 identifier];
            long long v25 = [v37 identifier];
            unsigned int v26 = [v24 isEqual:v25];

            if (v26)
            {
              v32 = sub_100029C00(100);
              os_unfair_lock_lock((os_unfair_lock_t)[v37 downloadLock]);
              [v37 setDownloadError:v32];
              sub_100032D34(v37, -1);
              os_unfair_lock_unlock((os_unfair_lock_t)[v37 downloadLock]);
              v33 = sub_100013ABC();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_1000390C0(v37);
              }

              v44[0] = _NSConcreteStackBlock;
              v44[1] = 3221225472;
              v44[2] = sub_100016C28;
              v44[3] = &unk_10005CF20;
              id v7 = v36;
              id v45 = v32;
              id v46 = v36;
              id v34 = v32;
              char v14 = queue;
              dispatch_async(queue, v44);
              os_unfair_recursive_lock_unlock();

              goto LABEL_28;
            }
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v17 = v17;
    id v27 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    id v7 = v36;
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v41;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v41 != v29) {
            objc_enumerationMutation(v17);
          }
          objc_super v31 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
          [v31 cancelDownloadSilently];
          [(BADownloadQueue *)self _removeDownload:v31];
        }
        id v28 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v28);
    }

    [(BADownloadQueue *)self _addDownload:v37];
    os_unfair_recursive_lock_unlock();
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100016C3C;
    v38[3] = &unk_10005CF48;
    id v39 = v36;
    char v14 = queue;
    dispatch_async(queue, v38);
    v18 = v39;
  }
  else
  {
    uint64_t v15 = sub_100029C00(109);
    os_unfair_lock_lock((os_unfair_lock_t)[v6 downloadLock]);
    [v6 setDownloadError:v15];
    sub_100032D34(v6, -1);
    os_unfair_lock_unlock((os_unfair_lock_t)[v6 downloadLock]);
    uint64_t v16 = sub_100013ABC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100039178(v6);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016C14;
    block[3] = &unk_10005CF20;
    id v52 = v15;
    id v53 = v7;
    id v17 = v15;
    dispatch_async(v14, block);

    v18 = v53;
  }
LABEL_28:
}

- (void)scheduleContentRequestAborted
{
  os_unfair_recursive_lock_lock_with_options();
  [(BADownloadQueue *)self setEssentialAssetsWaitingOnContentRequest:0];
  [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];

  os_unfair_recursive_lock_unlock();
}

- (void)scheduleContentRequest:(int64_t)a3 downloads:(id)a4 applicationInfo:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v59 = a6;
  qos_class_t v12 = qos_class_self();
  queue = dispatch_get_global_queue(v12, 0);
  uint64_t v13 = [(BADownloadQueue *)self identifier];
  unsigned __int8 v14 = +[BAApplicationInfo applicationForIdentifierAllowsBackgroundActivity:v13];

  p_stateLock = &self->_stateLock;
  os_unfair_recursive_lock_lock_with_options();
  [(BADownloadQueue *)self setEssentialAssetsWaitingOnContentRequest:0];
  v63 = v11;
  uint64_t v15 = (char *)[v11 remainingDownloadAllowanceWithNecessity:1 isManifest:0];
  v61 = v10;
  uint64_t v16 = [v10 allObjects];
  id v17 = [v16 sortedArrayUsingSelector:"compare:"];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v58 = v17;
  id obj = [v17 reverseObjectEnumerator];
  id v18 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v66 = *(void *)v76;
    unint64_t v64 = a3 - 1;
    unsigned __int8 v62 = v14;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v76 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v20);
        os_unfair_lock_lock((os_unfair_lock_t)[v21 downloadLock]);
        long long v22 = [(BADownloadQueue *)self identifier];
        [v21 setApplicationIdentifier:v22];

        long long v23 = [(BADownloadQueue *)self stagingDirectory];
        [v21 setDownloadCachePath:v23];

        sub_100032D34(v21, 1);
        os_unfair_lock_unlock((os_unfair_lock_t)[v21 downloadLock]);
        long long v24 = [v21 identifier];
        long long v25 = [(BADownloadQueue *)self _downloadWithIdentifier:v24];

        if (v25)
        {
          unsigned int v26 = sub_100029C00(100);
          [v21 setDownloadError:v26];
          sub_100032D34(v21, -1);
          id v27 = sub_100013ABC();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            long long v43 = [v21 identifier];
            v44 = [v21 uniqueIdentifier];
            id v45 = [(BADownloadQueue *)self identifier];
            *(_DWORD *)buf = 138543874;
            v80 = v43;
            __int16 v81 = 2114;
            v82 = v44;
            __int16 v83 = 2114;
            v84 = v45;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failing download (%{public}@ , %{public}@) because it is already scheduled. App:(%{public}@).", buf, 0x20u);

            unsigned __int8 v14 = v62;
          }

          id v28 = [v21 responseQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000174D4;
          block[3] = &unk_10005CE30;
          void block[4] = self;
          block[5] = v21;
          v74 = v26;
          id v29 = v26;
          dispatch_async(v28, block);

          long long v30 = v74;
LABEL_24:

          goto LABEL_25;
        }
        id v31 = [v21 necessity];
        if (v31 == (id)1) {
          char v32 = 1;
        }
        else {
          char v32 = v14;
        }
        if ((v32 & 1) == 0)
        {
          v38 = sub_100029C00(111);
          [v21 setDownloadError:v38];
          sub_100032D34(v21, -1);
          id v39 = sub_100013ABC();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            long long v49 = [v21 identifier];
            long long v50 = [v21 uniqueIdentifier];
            id v51 = [(BADownloadQueue *)self identifier];
            *(_DWORD *)buf = 138543874;
            v80 = v49;
            __int16 v81 = 2114;
            v82 = v50;
            __int16 v83 = 2114;
            v84 = v51;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failing download (%{public}@ , %{public}@) because download is optional and background activity is disabled. App:(%{public}@).", buf, 0x20u);

            unsigned __int8 v14 = v62;
          }

          long long v40 = [v21 responseQueue];
          v71[0] = _NSConcreteStackBlock;
          v71[1] = 3221225472;
          v71[2] = sub_1000174E4;
          v71[3] = &unk_10005CE30;
          v71[4] = self;
          v71[5] = v21;
          long long v72 = v38;
          id v29 = v38;
          dispatch_async(v40, v71);

          long long v30 = v72;
          goto LABEL_24;
        }
        if (v64 <= 1 && v31 == (id)1)
        {
          unsigned int v33 = [v63 initialRestrictionsAreEnforced];
          unint64_t v34 = sub_1000333AC(v21);
          if (v33)
          {
            if ((unint64_t)v15 < v34)
            {
              id v35 = sub_100029C00(112);
              [v21 setDownloadError:v35];
              sub_100032D34(v21, -1);
              id v36 = sub_100013ABC();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                id v52 = [v21 identifier];
                id v53 = [v21 uniqueIdentifier];
                v54 = [(BADownloadQueue *)self identifier];
                *(_DWORD *)buf = 138543874;
                v80 = v52;
                __int16 v81 = 2114;
                v82 = v53;
                __int16 v83 = 2114;
                v84 = v54;
                _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failing download (%{public}@ , %{public}@) because enqueueing download would exceed essential download allowance. App:(%{public}@).", buf, 0x20u);

                unsigned __int8 v14 = v62;
              }

              uint64_t v37 = [v21 responseQueue];
              v69[0] = _NSConcreteStackBlock;
              v69[1] = 3221225472;
              v69[2] = sub_1000174F4;
              v69[3] = &unk_10005CE30;
              v69[4] = self;
              v69[5] = v21;
              long long v70 = v35;
              id v29 = v35;
              dispatch_async(v37, v69);

              long long v30 = v70;
              goto LABEL_24;
            }
            [(BADownloadQueue *)self setEssentialAssetsBytesTotal:(char *)[(BADownloadQueue *)self essentialAssetsBytesTotal]+ sub_1000333AC(v21)];
            id v46 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
            long long v47 = [v21 identifier];
            [v46 addObject:v47];

            unint64_t v48 = sub_1000333AC(v21);
            if ((unint64_t)v15 >= v48) {
              v15 -= v48;
            }
            else {
              uint64_t v15 = 0;
            }
          }
          else
          {
            [(BADownloadQueue *)self setEssentialAssetsBytesTotal:(char *)[(BADownloadQueue *)self essentialAssetsBytesTotal] + v34];
            long long v41 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
            long long v42 = [v21 identifier];
            [v41 addObject:v42];
          }
        }
        [(BADownloadQueue *)self _addDownload:v21];
LABEL_25:
        id v20 = (char *)v20 + 1;
      }
      while (v19 != v20);
      id v55 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      id v19 = v55;
    }
    while (v55);
  }

  [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
  os_unfair_recursive_lock_unlock();
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100017504;
  v67[3] = &unk_10005CF48;
  id v68 = v59;
  id v56 = v59;
  dispatch_async(queue, v67);
}

- (void)startForegroundDownload:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];
  v9 = [(BADownloadQueue *)self downloadWithUniqueIdentifier:v8];

  if (v9)
  {
    if ([v6 necessity] == (id)1)
    {
      id v10 = sub_100013ABC();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000392CC();
      }

      qos_class_t v11 = qos_class_self();
      qos_class_t v12 = dispatch_get_global_queue(v11, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017A4C;
      block[3] = &unk_10005CF48;
      id v39 = v7;
      dispatch_async(v12, block);

      id v13 = v39;
      goto LABEL_38;
    }
    if ([v9 necessity] == (id)1 && !objc_msgSend(v6, "necessity"))
    {
      id v17 = sub_100013ABC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100039404();
      }
    }
    os_unfair_recursive_lock_lock_with_options();
    unsigned int v18 = [(BADownloadQueue *)self frozen];
    os_unfair_recursive_lock_unlock();
    if (v18)
    {
      id v19 = sub_100013ABC();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100039368();
      }

      qos_class_t v20 = qos_class_self();
      uint64_t v21 = dispatch_get_global_queue(v20, 0);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100017AAC;
      v36[3] = &unk_10005CF48;
      id v37 = v7;
      dispatch_async(v21, v36);

      id v13 = v37;
      goto LABEL_38;
    }
    os_unfair_lock_lock((os_unfair_lock_t)[v9 downloadLock]);
    if ([v9 isForegroundDownload])
    {
      int v22 = 0;
    }
    else
    {
      id v23 = [v9 state];
      if (v23 == (id)2)
      {
        int v22 = 0;
        id v24 = 0;
        int v25 = 1;
        goto LABEL_26;
      }
      if (v23 == (id)-1)
      {
        sub_100029C00(103);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        int v22 = 0;
        int v25 = 0;
        goto LABEL_26;
      }
      int v22 = 1;
      [v9 setIsForegroundDownload:1];
    }
    int v25 = 0;
    id v24 = 0;
LABEL_26:
    os_unfair_lock_unlock((os_unfair_lock_t)[v9 downloadLock]);
    if (!v24)
    {
      if (v25)
      {
        [v9 promoteToForeground];
      }
      else if (v22)
      {
        os_unfair_recursive_lock_lock_with_options();
        id v35 = 0;
        unsigned __int8 v26 = [v9 startDownloadWithDelegate:self error:&v35];
        id v27 = v35;
        id v28 = v27;
        if (v26)
        {
          id v29 = [(BADownloadQueue *)self activeDownloads];
          [v29 addObject:v9];

          id v24 = 0;
        }
        else
        {
          if (!v27)
          {
            id v28 = sub_100029C00(102);
          }
          id v24 = v28;
          id v28 = v24;
        }
        os_unfair_recursive_lock_unlock();

        goto LABEL_37;
      }
      id v24 = 0;
    }
LABEL_37:
    qos_class_t v30 = qos_class_self();
    id v31 = dispatch_get_global_queue(v30, 0);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100017B0C;
    v32[3] = &unk_10005CF20;
    id v33 = v24;
    id v34 = v7;
    id v13 = v24;
    dispatch_async(v31, v32);

    goto LABEL_38;
  }
  unsigned __int8 v14 = sub_100013ABC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100039230();
  }

  qos_class_t v15 = qos_class_self();
  uint64_t v16 = dispatch_get_global_queue(v15, 0);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000179EC;
  v40[3] = &unk_10005CF48;
  id v41 = v7;
  dispatch_async(v16, v40);

  id v13 = v41;
LABEL_38:
}

- (BOOL)cancelDownload:(id)a3 error:(id *)a4
{
  id v6 = [a3 uniqueIdentifier];
  id v7 = [(BADownloadQueue *)self downloadWithUniqueIdentifier:v6];

  if (v7)
  {
    [v7 cancelDownload];
  }
  else if (a4)
  {
    sub_100029C00(101);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

- (void)cancelAllDownloads
{
}

- (void)cancelAllDownloadsSilently
{
}

- (void)_cancelAllDownloadsSilently:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_recursive_lock_lock_with_options();
  unint64_t v5 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [(BADownloadQueue *)self downloads];
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        qos_class_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        qos_class_t v12 = [(BADownloadQueue *)self activeDownloads];
        unsigned int v13 = [v12 containsObject:v11];

        if (v13)
        {
          if (v3) {
            [v11 cancelDownloadSilently];
          }
          else {
            [v11 cancelDownload];
          }
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v5;
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    if (v3) {
      uint64_t v18 = -2;
    }
    else {
      uint64_t v18 = -1;
    }
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        qos_class_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        uint64_t v21 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:0];
        sub_100032D34(v20, v18);
        [(BADownloadQueue *)self download:v20 failedWithError:v21];
      }
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  os_unfair_recursive_lock_unlock();
}

- (void)demoteAllForegroundDownloads
{
  os_unfair_recursive_lock_lock_with_options();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(BADownloadQueue *)self downloads];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        uint64_t v9 = [(BADownloadQueue *)self activeDownloads];
        unsigned int v10 = [v9 containsObject:v8];

        if (v10)
        {
          [v8 demoteToBackground];
        }
        else
        {
          os_unfair_lock_lock((os_unfair_lock_t)[v8 downloadLock]);
          [v8 setIsForegroundDownload:0];
          os_unfair_lock_unlock((os_unfair_lock_t)[v8 downloadLock]);
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  os_unfair_recursive_lock_unlock();
}

- (BOOL)startNextDownload
{
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_10001839C;
  id v34 = sub_1000183AC;
  id v35 = 0;
  BOOL v3 = [(BADownloadQueue *)self delegate];
  unsigned __int8 v4 = [v3 downloadQueue:self permittedToStartDownloadsWithNecessity:1];

  id v5 = [(BADownloadQueue *)self delegate];
  unsigned __int8 v6 = [v5 downloadQueue:self permittedToStartDownloadsWithNecessity:0];

  os_unfair_recursive_lock_lock_with_options();
  if ([(BADownloadQueue *)self frozen]) {
    goto LABEL_5;
  }
  id v7 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
  id v8 = [v7 count];

  uint64_t v9 = [(BADownloadQueue *)self downloads];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000183B4;
  v26[3] = &unk_10005CF70;
  unsigned __int8 v27 = v4;
  unsigned __int8 v28 = v6;
  BOOL v29 = v8 != 0;
  v26[4] = &v30;
  [v9 enumerateObjectsWithOptions:2 usingBlock:v26];

  unsigned int v10 = (void *)v31[5];
  if (!v10)
  {
LABEL_5:
    unsigned __int8 v11 = 0;
  }
  else
  {
    id v25 = 0;
    unsigned __int8 v11 = [v10 startDownloadWithDelegate:self error:&v25];
    id v12 = v25;
    if (v11)
    {
      long long v13 = [(id)v31[5] downloadStartDate];
      [(BADownloadQueue *)self setLastDownloadStartDate:v13];

      id v14 = [(BADownloadQueue *)self activeDownloads];
      [v14 addObject:v31[5]];
    }
    else
    {
      id v15 = sub_100013B54();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v19 = [(BADownloadQueue *)self identifier];
        qos_class_t v20 = [(id)v31[5] identifier];
        *(_DWORD *)buf = 138543874;
        id v37 = v19;
        __int16 v38 = 2114;
        id v39 = v20;
        __int16 v40 = 2114;
        id v41 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to start the next download in the queue. (Client Identifier: %{public}@) (Download Identifier: %{public}@) Error:%{public}@", buf, 0x20u);
      }
      if (!v12)
      {
        sub_100029C00(102);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      os_unfair_lock_lock((os_unfair_lock_t)[(id)v31[5] downloadLock]);
      sub_100032D34((void *)v31[5], -1);
      [(id)v31[5] setDownloadError:v12];
      os_unfair_lock_unlock((os_unfair_lock_t)[(id)v31[5] downloadLock]);
      id v16 = (void *)os_transaction_create();
      uint64_t v17 = [(id)v31[5] responseQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001848C;
      block[3] = &unk_10005CF98;
      void block[4] = self;
      long long v24 = &v30;
      id v12 = v12;
      id v22 = v12;
      id v23 = v16;
      id v14 = v16;
      dispatch_async(v17, block);
    }
  }
  os_unfair_recursive_lock_unlock();
  _Block_object_dispose(&v30, 8);

  return v11;
}

- (void)pauseAllDownloads
{
  os_unfair_recursive_lock_lock_with_options();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  BOOL v3 = [(BADownloadQueue *)self downloads];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 state] == (id)2) {
          [v8 pauseDownload];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  os_unfair_recursive_lock_unlock();
}

- (void)freeze
{
  os_unfair_recursive_lock_lock_with_options();
  if (![(BADownloadQueue *)self frozen])
  {
    [(BADownloadQueue *)self setFrozen:1];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v3 = [(BADownloadQueue *)self downloads];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v8 state] == (id)2) {
            [v8 pauseDownload];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v5);
    }

    long long v9 = sub_100013ABC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [(BADownloadQueue *)self identifier];
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Download queue (%{public}@) has been frozen.", buf, 0xCu);
    }
    [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
  }
  os_unfair_recursive_lock_unlock();
}

- (void)thaw
{
  os_unfair_recursive_lock_lock_with_options();
  if ([(BADownloadQueue *)self frozen])
  {
    [(BADownloadQueue *)self setFrozen:0];
    BOOL v3 = sub_100013ABC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(BADownloadQueue *)self identifier];
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Download queue (%{public}@) has been thawed.", (uint8_t *)&v5, 0xCu);
    }
  }
  os_unfair_recursive_lock_unlock();
}

- (int64_t)numberOfActiveDownloads
{
  os_unfair_recursive_lock_lock_with_options();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(BADownloadQueue *)self downloads];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) state] == (id)2) {
          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (int64_t)numberOfWaitingDownloads
{
  os_unfair_recursive_lock_lock_with_options();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(BADownloadQueue *)self downloads];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) state] == (id)1) {
          ++v6;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  os_unfair_recursive_lock_unlock();
  return v6;
}

- (NSArray)allDownloads
{
  os_unfair_recursive_lock_lock_with_options();
  BOOL v3 = [(BADownloadQueue *)self downloads];
  id v4 = [v3 array];
  id v5 = [v4 copy];

  os_unfair_recursive_lock_unlock();

  return (NSArray *)v5;
}

- (NSString)description
{
  BOOL v3 = [(BADownloadQueue *)self allDownloads];
  id v4 = objc_alloc((Class)NSMutableString);
  id v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  id v7 = [v4 initWithFormat:@"%@ (%p) - %lu Downloads {\n", v6, self, [v3 count]];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 appendFormat:@"%@\n", *(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [v7 appendString:@"}"];

  return (NSString *)v7;
}

- (NSString)debugDescription
{
  BOOL v3 = [(BADownloadQueue *)self allDownloads];
  id v4 = objc_alloc((Class)NSMutableString);
  id v5 = (objc_class *)objc_opt_class();
  int64_t v6 = NSStringFromClass(v5);
  id v7 = [(BADownloadQueue *)self identifier];
  id v8 = [v4 initWithFormat:@"%@ (%p)\nApplication Identifier: %@\nDownloads (%lu): {\n", v6, self, v7, [v3 count]];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) debugDescription];
        [v8 appendFormat:@"%@\n", v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [v8 appendString:@"}"];

  return (NSString *)v8;
}

- (void)downloadDidBegin:(id)a3
{
  id v6 = a3;
  id v4 = [(BADownloadQueue *)self delegate];

  if (v4)
  {
    id v5 = [(BADownloadQueue *)self delegate];
    [v5 downloadDidBegin:v6];
  }
}

- (void)downloadDidPause:(id)a3
{
  id v6 = a3;
  id v4 = [(BADownloadQueue *)self delegate];

  if (v4)
  {
    id v5 = [(BADownloadQueue *)self delegate];
    [v5 downloadDidPause:v6];
  }
}

- (void)download:(id)a3 didWriteBytes:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v15 = a3;
  id v10 = [(BADownloadQueue *)self delegate];

  if (v10)
  {
    if ([v15 necessity] == (id)1)
    {
      os_unfair_recursive_lock_lock_with_options();
      id v11 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
      uint64_t v12 = [v15 identifier];
      unsigned int v13 = [v11 containsObject:v12];

      if (v13)
      {
        [(BADownloadQueue *)self setEssentialAssetsBytesDownloaded:(char *)[(BADownloadQueue *)self essentialAssetsBytesDownloaded] + a4];
        [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
      }
      os_unfair_recursive_lock_unlock();
    }
    long long v14 = [(BADownloadQueue *)self delegate];
    [v14 download:v15 didWriteBytes:a4 totalBytesWritten:a5 totalBytesExpectedToWrite:a6];
  }
}

- (void)download:(id)a3 didResumeAtOffset:(int64_t)a4 expectedTotalBytes:(int64_t)a5
{
  id v10 = a3;
  id v8 = [(BADownloadQueue *)self delegate];

  if (v8)
  {
    id v9 = [(BADownloadQueue *)self delegate];
    [v9 download:v10 didResumeAtOffset:a4 expectedTotalBytes:a5];
  }
}

- (void)download:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BADownloadQueue *)self delegate];

  if (v10)
  {
    id v11 = [(BADownloadQueue *)self delegate];
    [v11 download:v12 didReceiveChallenge:v8 completionHandler:v9];
  }
}

- (void)download:(id)a3 failedWithError:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  os_unfair_recursive_lock_lock_with_options();
  id v7 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
  id v8 = [v7 count];

  [(BADownloadQueue *)self _removeDownload:v17];
  id v9 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
  id v10 = [v9 count];

  if (v8 && !v10) {
    [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
  }
  os_unfair_recursive_lock_unlock();
  if (sub_100033364(v17) == -2)
  {
    id v12 = sub_1000333F4(v17, v11);

    if (!v12) {
      goto LABEL_10;
    }
    unsigned int v13 = +[NSFileManager defaultManager];
    id v15 = sub_1000333F4(v17, v14);
    [v13 removeItemAtURL:v15 error:0];
  }
  else
  {
    long long v16 = [(BADownloadQueue *)self delegate];

    if (!v16) {
      goto LABEL_10;
    }
    unsigned int v13 = [(BADownloadQueue *)self delegate];
    [v13 download:v17 failedWithError:v6];
  }

LABEL_10:
}

- (void)download:(id)a3 finishedWithFileURL:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v13;
    os_unfair_recursive_lock_lock_with_options();
    if ((unint64_t)(sub_10000C064((uint64_t)v7) - 1) <= 1)
    {
      [(BADownloadQueue *)self setEssentialAssetsWaitingOnContentRequest:1];
      [(BADownloadQueue *)self setEssentialAssetsBytesTotal:[(BADownloadQueue *)self essentialAssetsBytesDownloaded]];
    }
    [(BADownloadQueue *)self _removeDownload:v7];
    [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
    os_unfair_recursive_lock_unlock();
    id v8 = [(BADownloadQueue *)self delegate];
    [v8 downloadQueue:self manifest:v7 finishedWithFileURL:v6];

    id v6 = v8;
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    id v9 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
    id v10 = [v9 count];

    [(BADownloadQueue *)self _removeDownload:v13];
    id v11 = [(BADownloadQueue *)self essentialAssetIdentifiersMonitored];
    id v12 = [v11 count];

    if (v10 && !v12) {
      [(BADownloadQueue *)self _reportEssentialAssetStateAndProgress];
    }
    os_unfair_recursive_lock_unlock();
    id v7 = [(BADownloadQueue *)self delegate];
    [v7 download:v13 finishedWithFileURL:v6];
  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)lastDownloadStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastDownloadStartDate:(id)a3
{
}

- (BADownloadQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BADownloadQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BAManifestDownload)activeManifestDownload
{
  return (BAManifestDownload *)objc_getProperty(self, a2, 48, 1);
}

- (void)setActiveManifestDownload:(id)a3
{
}

- (NSMutableOrderedSet)downloads
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDownloads:(id)a3
{
}

- (NSMutableSet)activeDownloads
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActiveDownloads:(id)a3
{
}

- (NSMutableDictionary)uniqueIdentifiersToDownloads
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUniqueIdentifiersToDownloads:(id)a3
{
}

- (NSMutableDictionary)identifiersToDownloads
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIdentifiersToDownloads:(id)a3
{
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (NSString)stagingDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)essentialAssetsWaitingOnContentRequest
{
  return self->_essentialAssetsWaitingOnContentRequest;
}

- (void)setEssentialAssetsWaitingOnContentRequest:(BOOL)a3
{
  self->_essentialAssetsWaitingOnContentRequest = a3;
}

- (NSMutableSet)essentialAssetIdentifiersMonitored
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEssentialAssetIdentifiersMonitored:(id)a3
{
}

- (int64_t)essentialAssetsBytesDownloaded
{
  return self->_essentialAssetsBytesDownloaded;
}

- (void)setEssentialAssetsBytesDownloaded:(int64_t)a3
{
  self->_essentialAssetsBytesDownloaded = a3;
}

- (unint64_t)essentialAssetsBytesTotal
{
  return self->_essentialAssetsBytesTotal;
}

- (void)setEssentialAssetsBytesTotal:(unint64_t)a3
{
  self->_essentialAssetsBytesTotal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_essentialAssetIdentifiersMonitored, 0);
  objc_storeStrong((id *)&self->_stagingDirectory, 0);
  objc_storeStrong((id *)&self->_identifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifiersToDownloads, 0);
  objc_storeStrong((id *)&self->_activeDownloads, 0);
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_activeManifestDownload, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastDownloadStartDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end