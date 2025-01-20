@interface PrepareDownloadResponse
- (BOOL)_isMediaSelectionOptionSDHSubtitle:(id)a3;
- (BOOL)has4K;
- (BOOL)hasHDR;
- (BOOL)ignoresDownloadHandler;
- (BOOL)infersDiscretionary;
- (BOOL)isCellularAllowed;
- (BOOL)isDiscretionary;
- (BOOL)isHLS;
- (BOOL)isLegacyClient;
- (BOOL)isPerDeviceVPP;
- (BOOL)isRestore;
- (BOOL)requiresDownloadHandler;
- (BOOL)requiresPowerPluggedIn;
- (DownloadDataConsumer)dataConsumer;
- (DownloadHandle)downloadHandle;
- (NSArray)backgroundOperations;
- (NSDictionary)AVAssetDownloadSessionOptions;
- (NSError)error;
- (NSNumber)downloadRestoreState;
- (NSNumber)loadingPriority;
- (NSNumber)taskIdentifier;
- (NSString)URLSessionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)clientIdentifier;
- (NSString)clientSecondaryIdentifier;
- (NSString)destinationPath;
- (NSString)kind;
- (NSString)title;
- (NSURLRequest)URLRequest;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (double)transferProgressFraction;
- (id)_getExistingTaskInSession:(id)a3;
- (id)_hlsDownloadTaskOptionsForMediaSelections:(id)a3;
- (id)_mediaSelectionsForHLSDownloadFromLoadedAVAsset:(id)a3 outNumAudioSelectionsToBeDownloaded:(unint64_t *)a4 outNumSubtitleSelectionsToBeDownloaded:(unint64_t *)a5;
- (id)_reuseExistingTaskInSession:(id)a3;
- (id)sessionConfiguration;
- (id)sessionTaskWithSession:(id)a3 error:(id *)a4;
- (int64_t)automaticType;
- (int64_t)bytesPerSecondLimit;
- (int64_t)downloadIdentifier;
- (int64_t)mediaAssetIdentifier;
- (int64_t)mediaAssetSize;
- (int64_t)rentalIdentifier;
- (int64_t)result;
- (int64_t)storeItemIdentifier;
- (int64_t)taskPriority;
- (unint64_t)numAudioSelectionsToBeDownloaded;
- (unint64_t)numSubtitleSelectionsToBeDownloaded;
- (void)_addMediaSelectionOptionsIfNotAlreadyAdded:(id)a3 toMediaSelections:(id)a4 forMediaSelectionGroup:(id)a5 baseMediaSelection:(id)a6;
- (void)setAVAssetDownloadSessionOptions:(id)a3;
- (void)setAutomaticType:(int64_t)a3;
- (void)setBackgroundOperations:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBytesPerSecondLimit:(int64_t)a3;
- (void)setCellularAllowed:(BOOL)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setClientSecondaryIdentifier:(id)a3;
- (void)setDataConsumer:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadHandle:(id)a3;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setDownloadRestoreState:(id)a3;
- (void)setError:(id)a3;
- (void)setHLS:(BOOL)a3;
- (void)setHas4K:(BOOL)a3;
- (void)setHasHDR:(BOOL)a3;
- (void)setIgnoresDownloadHandler:(BOOL)a3;
- (void)setInfersDiscretionary:(BOOL)a3;
- (void)setIsPerDeviceVPP:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setLegacyClient:(BOOL)a3;
- (void)setLoadingPriority:(id)a3;
- (void)setMediaAssetIdentifier:(int64_t)a3;
- (void)setMediaAssetSize:(int64_t)a3;
- (void)setNumAudioSelectionsToBeDownloaded:(unint64_t)a3;
- (void)setNumSubtitleSelectionsToBeDownloaded:(unint64_t)a3;
- (void)setRentalIdentifier:(int64_t)a3;
- (void)setRequiresDownloadHandler:(BOOL)a3;
- (void)setRequiresPowerPluggedIn:(BOOL)a3;
- (void)setRestore:(BOOL)a3;
- (void)setResult:(int64_t)a3;
- (void)setStoreItemIdentifier:(int64_t)a3;
- (void)setTaskIdentifier:(id)a3;
- (void)setTaskPriority:(int64_t)a3;
- (void)setTimeoutIntervalForRequest:(double)a3;
- (void)setTimeoutIntervalForResource:(double)a3;
- (void)setTitle:(id)a3;
- (void)setTransferProgressFraction:(double)a3;
- (void)setURLRequest:(id)a3;
@end

@implementation PrepareDownloadResponse

- (id)sessionConfiguration
{
  AVAssetDownloadSessionOptions = self->_AVAssetDownloadSessionOptions;
  v4 = [(PrepareDownloadResponse *)self URLSessionIdentifier];
  if (AVAssetDownloadSessionOptions) {
    +[NSURLSessionConfiguration _AVBackgroundSessionConfigurationWithIdentifier:v4];
  }
  else {
  v5 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v4];
  }

  objc_msgSend(v5, "setAllowsCellularAccess:", -[NSURLRequest allowsCellularAccess](self->_URLRequest, "allowsCellularAccess"));
  objc_msgSend(v5, "setAllowsExpensiveNetworkAccess:", -[NSURLRequest allowsExpensiveNetworkAccess](self->_URLRequest, "allowsExpensiveNetworkAccess"));
  [v5 setHTTPCookieAcceptPolicy:1];
  [v5 setHTTPShouldSetCookies:0];
  [v5 setHTTPShouldUsePipelining:1];
  [v5 setRequestCachePolicy:1];
  [v5 setSessionSendsLaunchEvents:1];
  objc_msgSend(v5, "set_allowsRetryForBackgroundDataTasks:", 1);
  objc_msgSend(v5, "set_requiresPowerPluggedIn:", self->_requiresPowerPluggedIn);
  objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", self->_clientIdentifier);
  objc_msgSend(v5, "set_sourceApplicationSecondaryIdentifier:", self->_clientSecondaryIdentifier);
  if ([(PrepareDownloadResponse *)self infersDiscretionary])
  {
    [v5 setDiscretionary:0];
    objc_msgSend(v5, "set_infersDiscretionaryFromOriginatingClient:", 1);
  }
  else
  {
    [v5 setDiscretionary:self->_discretionary];
  }
  [v5 setTimeoutIntervalForRequest:self->_timeoutIntervalForRequest];
  [v5 setTimeoutIntervalForResource:self->_timeoutIntervalForResource];

  return v5;
}

- (id)sessionTaskWithSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  v7 = [(PrepareDownloadResponse *)self _reuseExistingTaskInSession:v6];
  if (!v7)
  {
    if (self->_isHLS)
    {
      id v67 = v6;
      v8 = +[NSMutableDictionary dictionary];
      [v8 setObject:&__kCFBooleanTrue forKey:AVURLAssetInheritURIQueryComponentFromReferencingURIKey];
      v9 = +[NSNumber numberWithBool:[(NSURLRequest *)self->_URLRequest allowsCellularAccess]];
      [v8 setObject:v9 forKey:AVURLAssetAllowsCellularAccessKey];

      v10 = +[SSDevice currentDevice];
      uint64_t v11 = [v10 userAgent];

      if (v11)
      {
        CFStringRef v76 = @"User-Agent";
        uint64_t v77 = v11;
        v12 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
        [v8 setObject:v12 forKey:AVURLAssetHTTPHeaderFieldsKey];
      }
      v66 = (void *)v11;
      v13 = +[SSAccountStore defaultStore];
      v14 = [v13 activeAccount];
      uint64_t v15 = [v14 uniqueIdentifier];

      if (v15)
      {
        v16 = +[SSVCookieStorage sharedStorage];
        v17 = [v16 allCookiesForUserIdentifier:v15];

        if (v17) {
          [v8 setObject:v17 forKey:AVURLAssetHTTPCookiesKey];
        }
      }
      v65 = (void *)v15;
      v18 = [(PrepareDownloadResponse *)self kind];
      int IsVideosAppKind = SSDownloadKindIsVideosAppKind();

      if (!IsVideosAppKind)
      {
LABEL_40:
        id v28 = objc_alloc((Class)AVURLAsset);
        v29 = [(NSURLRequest *)self->_URLRequest URL];
        id v30 = [v28 initWithURL:v29 options:v8];

        title = (__CFString *)self->_title;
        if (!title) {
          title = &stru_1003B9B00;
        }
        v64 = title;
        v32 = +[SSLogConfig sharedDaemonConfig];
        if (!v32)
        {
          v32 = +[SSLogConfig sharedConfig];
        }
        unsigned int v33 = [v32 shouldLog];
        if ([v32 shouldLogToDisk]) {
          int v34 = v33 | 2;
        }
        else {
          int v34 = v33;
        }
        v35 = [v32 OSLogObject];
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
          int v36 = v34;
        }
        else {
          int v36 = v34 & 2;
        }
        if (v36)
        {
          LOWORD(v74) = 0;
          LODWORD(v63) = 2;
          v61 = &v74;
          v37 = (void *)_os_log_send_and_compose_impl();

          if (!v37) {
            goto LABEL_54;
          }
          v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v74, v63);
          free(v37);
          v61 = (int *)v35;
          SSFileLog();
        }

LABEL_54:
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_100157290;
        v72[3] = &unk_1003A3140;
        v38 = dispatch_semaphore_create(0);
        v73 = v38;
        [v30 loadValuesAsynchronouslyForKeys:&off_1003C9F80 completionHandler:v72];
        dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
        id v71 = 0;
        id v39 = [v30 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:&v71];
        id v68 = v71;
        uint64_t v40 = +[SSLogConfig sharedDaemonConfig];
        v41 = (void *)v40;
        if (v39 == (id)2)
        {
          if (!v40)
          {
            v41 = +[SSLogConfig sharedConfig];
          }
          unsigned int v42 = objc_msgSend(v41, "shouldLog", v61);
          if ([v41 shouldLogToDisk]) {
            v42 |= 2u;
          }
          v43 = [v41 OSLogObject];
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
            int v44 = v42;
          }
          else {
            int v44 = v42 & 2;
          }
          if (v44)
          {
            LOWORD(v74) = 0;
            LODWORD(v63) = 2;
            v62 = &v74;
            v45 = (void *)_os_log_send_and_compose_impl();

            if (!v45) {
              goto LABEL_66;
            }
            v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v45, 4, &v74, v63);
            free(v45);
            v62 = (int *)v43;
            SSFileLog();
          }

LABEL_66:
          unint64_t v69 = 0;
          unint64_t v70 = 0;
          v46 = [(PrepareDownloadResponse *)self _mediaSelectionsForHLSDownloadFromLoadedAVAsset:v30 outNumAudioSelectionsToBeDownloaded:&v70 outNumSubtitleSelectionsToBeDownloaded:&v69];
          unint64_t v47 = v69;
          self->_numAudioSelectionsToBeDownloaded = v70;
          self->_numSubtitleSelectionsToBeDownloaded = v47;
          v48 = [(PrepareDownloadResponse *)self _hlsDownloadTaskOptionsForMediaSelections:v46];
          v49 = +[SSLogConfig sharedDaemonConfig];
          if (!v49)
          {
            v49 = +[SSLogConfig sharedConfig];
          }
          unsigned int v50 = objc_msgSend(v49, "shouldLog", v62);
          if ([v49 shouldLogToDisk]) {
            v50 |= 2u;
          }
          v51 = [v49 OSLogObject];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT)) {
            int v52 = v50;
          }
          else {
            int v52 = v50 & 2;
          }
          if (v52)
          {
            int v74 = 138412290;
            id v75 = v48;
            LODWORD(v63) = 12;
            v61 = &v74;
            v53 = (void *)_os_log_send_and_compose_impl();

            if (!v53)
            {
LABEL_77:

              v26 = v67;
              v54 = v64;
              v7 = [v67 aggregateAssetDownloadTaskWithURLAsset:v30 mediaSelections:v46 assetTitle:v64 assetArtworkData:0 options:v48];

LABEL_93:
              goto LABEL_94;
            }
            v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v53, 4, &v74, v63);
            free(v53);
            v61 = (int *)v51;
            SSFileLog();
          }

          goto LABEL_77;
        }
        if (!v40)
        {
          v41 = +[SSLogConfig sharedConfig];
        }
        unsigned int v55 = objc_msgSend(v41, "shouldLog", v61);
        if ([v41 shouldLogToDisk]) {
          v55 |= 2u;
        }
        v56 = [v41 OSLogObject];
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          int v57 = v55;
        }
        else {
          int v57 = v55 & 2;
        }
        if (v57)
        {
          int v74 = 138412290;
          id v75 = v68;
          LODWORD(v63) = 12;
          v61 = &v74;
          v58 = (void *)_os_log_send_and_compose_impl();

          v54 = v64;
          if (!v58)
          {
LABEL_90:

            v7 = 0;
            if (a4) {
              *a4 = v68;
            }
            v26 = v67;
            goto LABEL_93;
          }
          v56 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v58, 4, &v74, v63);
          free(v58);
          v61 = (int *)v56;
          SSFileLog();
        }
        else
        {
          v54 = v64;
        }

        goto LABEL_90;
      }
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      v21 = [(PrepareDownloadResponse *)self storeItemIdentifier];
      int64_t v22 = [(PrepareDownloadResponse *)self rentalIdentifier];
      v23 = [(PrepareDownloadResponse *)self kind];
      if ([v23 isEqualToString:SSDownloadKindMovie])
      {
        if (v22) {
          v24 = @"com.apple.videos.movies.rental";
        }
        else {
          v24 = @"com.apple.videos.movies.purchase";
        }
        v25 = @"movie";
        if (!v21) {
          goto LABEL_33;
        }
      }
      else
      {
        unsigned int v27 = [v23 isEqualToString:SSDownloadKindTelevisionEpisode];
        if (v27) {
          v24 = @"com.apple.videos.tvshows.purchase";
        }
        else {
          v24 = 0;
        }
        if (v27) {
          v25 = @"episode";
        }
        else {
          v25 = 0;
        }
        if (!v21) {
          goto LABEL_33;
        }
      }
      if ([@"tvs.sbd.9001" length] && -[__CFString length](v25, "length"))
      {
        v21 = +[NSString stringWithFormat:@"a=%lld:s=%@:e=%@", v21, @"tvs.sbd.9001", v25];
      }
      else
      {
        v21 = 0;
      }
LABEL_33:
      if ([(__CFString *)v24 length]) {
        [v20 setObject:v24 forKey:AVURLAssetAlternativeConfigurationServiceIdentifierKey];
      }
      if ([v21 length]) {
        [v20 setObject:v21 forKey:AVURLAssetAlternativeConfigurationMediaIdentifierKey];
      }
      if ([@"tvs.sbd.9001" length]) {
        [v20 setObject:@"tvs.sbd.9001" forKey:AVURLAssetAlternativeConfigurationContentProviderKey];
      }
      [v20 setObject:&__kCFBooleanTrue forKey:AVURLAssetAlternativeConfigurationiTunesServiceMonitoringKey];
      [v8 setObject:v20 forKey:AVURLAssetAlternativeConfigurationOptionsKey];

      goto LABEL_40;
    }
    if (self->_AVAssetDownloadSessionOptions)
    {
      v26 = [(NSURLRequest *)self->_URLRequest URL];
      v8 = +[NSURL fileURLWithPath:self->_destinationPath];
      v7 = [v6 _AVAssetDownloadTaskWithURL:v26 destinationURL:v8 options:self->_AVAssetDownloadSessionOptions];
LABEL_94:

      goto LABEL_95;
    }
    if (self->_URLRequest)
    {
      v7 = objc_msgSend(v6, "dataTaskWithRequest:");
    }
    else
    {
      v7 = 0;
    }
  }
LABEL_95:
  if (!self->_AVAssetDownloadSessionOptions) {
    [v7 setITunesStoreDataConsumer:self->_dataConsumer];
  }
  objc_msgSend(v7, "set_priority:", self->_taskPriority, v61);
  objc_msgSend(v7, "set_bytesPerSecondLimit:", self->_bytesPerSecondLimit);
  loadingPriority = self->_loadingPriority;
  if (loadingPriority)
  {
    [(NSNumber *)loadingPriority doubleValue];
    objc_msgSend(v7, "set_loadingPriority:");
  }

  return v7;
}

- (NSString)URLSessionIdentifier
{
  v3 = +[NSMutableString stringWithString:@"com.apple.itunesstored."];
  v4 = v3;
  if (self->_clientIdentifier)
  {
    objc_msgSend(v3, "appendString:");
    [v4 appendString:@"."];
  }
  if (self->_clientSecondaryIdentifier)
  {
    objc_msgSend(v4, "appendString:");
    [v4 appendString:@"."];
  }
  if (self->_discretionary) {
    [v4 appendString:@"discretionary."];
  }
  if ([(PrepareDownloadResponse *)self infersDiscretionary]) {
    [v4 appendString:@"infersdiscretionary."];
  }
  if (self->_requiresPowerPluggedIn) {
    [v4 appendString:@"powered."];
  }
  if (![(NSURLRequest *)self->_URLRequest allowsCellularAccess]) {
    [v4 appendString:@"wifi."];
  }
  if (![(NSURLRequest *)self->_URLRequest allowsExpensiveNetworkAccess]) {
    [v4 appendString:@"inexpensive."];
  }
  if (self->_timeoutIntervalForResource > 0.0)
  {
    v5 = +[NSString stringWithFormat:@"resource_timeout_%f.", *(void *)&self->_timeoutIntervalForResource];
    [v4 appendString:v5];
  }
  if (self->_timeoutIntervalForRequest > 0.0)
  {
    id v6 = +[NSString stringWithFormat:@"timeout_%f.", *(void *)&self->_timeoutIntervalForRequest];
    [v4 appendString:v6];
  }
  if (self->_isHLS)
  {
    CFStringRef v7 = @"hls";
  }
  else if (self->_AVAssetDownloadSessionOptions)
  {
    CFStringRef v7 = @"av";
  }
  else
  {
    CFStringRef v7 = @"default";
  }
  [v4 appendString:v7];

  return (NSString *)v4;
}

- (id)_getExistingTaskInSession:(id)a3
{
  id v4 = a3;
  uint64_t v32 = 0;
  unsigned int v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100157898;
  int v36 = sub_1001578A8;
  id v37 = 0;
  NSUInteger v5 = [(NSNumber *)self->_taskIdentifier unsignedIntegerValue];
  if (v5)
  {
    id v6 = +[SSLogConfig sharedConfig];
    unsigned int v7 = [v6 shouldLog];
    unsigned int v8 = [v6 shouldLogToDisk];
    v9 = [v6 OSLogObject];
    v10 = v9;
    if (v8) {
      v7 |= 2u;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      int v11 = v7;
    }
    else {
      int v11 = v7 & 2;
    }
    if (v11)
    {
      int64_t downloadIdentifier = self->_downloadIdentifier;
      v13 = [(PrepareDownloadResponse *)self URLSessionIdentifier];
      int v38 = 134218498;
      NSUInteger v39 = v5;
      __int16 v40 = 2048;
      int64_t v41 = downloadIdentifier;
      __int16 v42 = 2114;
      v43 = v13;
      LODWORD(v27) = 32;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14) {
        goto LABEL_11;
      }
      v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v38, v27);
      free(v14);
      SSFileLog();
    }

LABEL_11:
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001578B0;
    v28[3] = &unk_1003A7EF0;
    id v30 = &v32;
    NSUInteger v31 = v5;
    uint64_t v15 = dispatch_semaphore_create(0);
    v29 = v15;
    [v4 getAllTasksWithCompletionHandler:v28];
    dispatch_time_t v16 = dispatch_time(0, 60000000000);
    if (!dispatch_semaphore_wait(v15, v16))
    {
LABEL_21:

      goto LABEL_22;
    }
    v17 = +[SSLogConfig sharedConfig];
    unsigned int v18 = [v17 shouldLog];
    unsigned int v19 = [v17 shouldLogToDisk];
    id v20 = [v17 OSLogObject];
    v21 = v20;
    if (v19) {
      v18 |= 2u;
    }
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int64_t v22 = self->_downloadIdentifier;
      v23 = [(PrepareDownloadResponse *)self URLSessionIdentifier];
      int v38 = 134218498;
      NSUInteger v39 = v5;
      __int16 v40 = 2048;
      int64_t v41 = v22;
      __int16 v42 = 2114;
      v43 = v23;
      LODWORD(v27) = 32;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_20:

        goto LABEL_21;
      }
      v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, &v38, v27);
      free(v24);
      SSFileLog();
    }

    goto LABEL_20;
  }
LABEL_22:
  id v25 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v25;
}

- (id)_reuseExistingTaskInSession:(id)a3
{
  id v4 = a3;
  if (!self->_taskIdentifier)
  {
    NSUInteger v5 = 0;
    goto LABEL_61;
  }
  NSUInteger v5 = [(PrepareDownloadResponse *)self _getExistingTaskInSession:v4];
  if (!v5) {
    goto LABEL_61;
  }
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (v8)
  {
    int v43 = 134217984;
    id v44 = [v5 taskIdentifier];
    LODWORD(v42) = 12;
    __int16 v40 = &v43;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10) {
      goto LABEL_14;
    }
    v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v43, v42);
    free(v10);
    __int16 v40 = (int *)v9;
    SSFileLog();
  }

LABEL_14:
  unsigned int v11 = [v5 conformsToProtocol:&OBJC_PROTOCOL___AVAssetDownloadDelegate];
  v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12)
  {
    v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = objc_msgSend(v12, "shouldLog", v40);
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  uint64_t v15 = [v12 OSLogObject];
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    v14 &= 2u;
  }
  if (v14)
  {
    id v16 = [v5 taskIdentifier];
    int v43 = 134218240;
    id v44 = v16;
    __int16 v45 = 1024;
    LODWORD(v46) = v11;
    LODWORD(v42) = 18;
    int64_t v41 = &v43;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_25;
    }
    uint64_t v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v43, v42);
    free(v17);
    int64_t v41 = (int *)v15;
    SSFileLog();
  }

LABEL_25:
  if (objc_opt_respondsToSelector())
  {
    unsigned int v18 = [v5 URL];
    if (v11) {
      goto LABEL_36;
    }
LABEL_33:
    id v20 = [(NSURLRequest *)self->_URLRequest URL];
    v21 = v20;
    if (v20 && v18)
    {
      int64_t v22 = [(NSURLRequest *)self->_URLRequest URL];
      unsigned int v23 = [v22 isEqual:v18];

      if (v23) {
        goto LABEL_36;
      }
    }
    else
    {
    }
    uint64_t v27 = +[SSLogConfig sharedDaemonConfig];
    if (!v27)
    {
      uint64_t v27 = +[SSLogConfig sharedConfig];
    }
    unsigned int v32 = [v27 shouldLog];
    if ([v27 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    uint64_t v34 = [v27 OSLogObject];
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      v33 &= 2u;
    }
    if (v33)
    {
      id v35 = [v5 taskIdentifier];
      int64_t downloadIdentifier = self->_downloadIdentifier;
      id v37 = [(PrepareDownloadResponse *)self URLSessionIdentifier];
      int v43 = 134218498;
      id v44 = v35;
      __int16 v45 = 2048;
      int64_t v46 = downloadIdentifier;
      __int16 v47 = 2114;
      v48 = v37;
      LODWORD(v42) = 32;
      int v38 = (void *)_os_log_send_and_compose_impl();

      if (!v38)
      {
LABEL_58:
        v24 = v5;
        NSUInteger v5 = 0;
        goto LABEL_59;
      }
      uint64_t v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v38, 4, &v43, v42);
      free(v38);
      SSFileLog();
    }

    goto LABEL_58;
  }
  if (!(v11 & 1 | ((objc_opt_respondsToSelector() & 1) == 0)))
  {
    unsigned int v19 = [v5 originalRequest];
    unsigned int v18 = [v19 URL];

    if (v11) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  unsigned int v18 = 0;
  if ((v11 & 1) == 0) {
    goto LABEL_33;
  }
LABEL_36:
  v24 = +[SSLogConfig sharedDaemonConfig];
  if (!v24)
  {
    v24 = +[SSLogConfig sharedConfig];
  }
  unsigned int v25 = [v24 shouldLog];
  if ([v24 shouldLogToDisk]) {
    int v26 = v25 | 2;
  }
  else {
    int v26 = v25;
  }
  uint64_t v27 = [v24 OSLogObject];
  if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
    v26 &= 2u;
  }
  if (!v26) {
    goto LABEL_59;
  }
  id v28 = [v5 taskIdentifier];
  int64_t v29 = self->_downloadIdentifier;
  id v30 = [(PrepareDownloadResponse *)self URLSessionIdentifier];
  int v43 = 134218498;
  id v44 = v28;
  __int16 v45 = 2048;
  int64_t v46 = v29;
  __int16 v47 = 2114;
  v48 = v30;
  LODWORD(v42) = 32;
  NSUInteger v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    uint64_t v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, &v43, v42);
    free(v31);
    SSFileLog();
LABEL_59:
  }
LABEL_61:

  return v5;
}

- (id)_hlsDownloadTaskOptionsForMediaSelections:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(PrepareDownloadResponse *)self kind];
  int IsVideosAppKind = SSDownloadKindIsVideosAppKind();

  unsigned int v7 = +[NSURL fileURLWithPath:self->_destinationPath];
  if (IsVideosAppKind)
  {
    int v8 = +[ISNetworkObserver sharedInstance];
    id v9 = [v8 networkType];

    if (v9 == (id)1000) {
      CFStringRef v10 = @"DownloadQualityWifi";
    }
    else {
      CFStringRef v10 = @"DownloadQualityCellular";
    }
    unsigned int v11 = (void *)CFPreferencesCopyAppValue(v10, @"com.apple.videos-preferences");
    unsigned int v12 = [v11 isEqualToString:@"BestQualityDownload"];

    unsigned int v13 = +[SSDevice deviceIsiPad];
    if (v12)
    {
      if (v13) {
        goto LABEL_7;
      }
      int v26 = MGGetSInt32Answer();
      if (v26 > 8)
      {
        if (v26 == 9)
        {
          char v14 = 0;
          *(void *)&long long v36 = 0x409C700000000000;
          uint64_t v15 = &off_1003C9408;
          goto LABEL_8;
        }
        if (v26 == 19)
        {
          id v16 = 0;
          uint64_t v15 = &off_1003C9438;
          *(void *)&long long v36 = 0x4092700000000000;
          char v14 = 1;
          double v17 = 1180.0;
          double v18 = 620.0;
          goto LABEL_30;
        }
LABEL_7:
        char v14 = 0;
        *(void *)&long long v36 = 0x409C700000000000;
        uint64_t v15 = &off_1003C9420;
LABEL_8:
        id v16 = &off_1003C93F0;
        double v17 = 1820.0;
        double v18 = 980.0;
LABEL_30:
        id v28 = +[NSMutableDictionary dictionary];
        unsigned int v25 = v28;
        if ((v14 & 1) == 0) {
          [v28 setObject:v16 forKey:AVAssetDownloadTaskMinimumRequiredMediaBitrateKey];
        }
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"DownloadsCompatibleWithAVAdapter", @"com.apple.videos-preferences", 0);
        if (AppBooleanValue) {
          [v25 setObject:&__kCFBooleanTrue forKey:AVAssetDownloadTaskPrefersMostCompatibleRenditionKey];
        }
        [v25 setObject:v15 forKey:AVAssetDownloadTaskMinimumRequiredMediaBitrateForHEVCKey];
        uint64_t v30 = [v4 firstObject];
        if (!v30) {
          sub_1002E9B94();
        }
        NSUInteger v31 = (void *)v30;
        uint64_t v39 = v30;
        unsigned int v32 = +[NSArray arrayWithObjects:&v39 count:1];
        [v25 setObject:v32 forKey:AVAssetDownloadTaskMediaSelectionsForMultichannelKey];

        [v25 setObject:v7 forKey:AVAssetDownloadTaskDestinationURLKey];
        int v33 = +[NSNumber numberWithBool:AppBooleanValue == 0];
        [v25 setObject:v33 forKey:AVAssetDownloadTaskAllowHighDynamicRangeKey];

        if (v17 != CGSizeZero.width || v18 != CGSizeZero.height)
        {
          uint64_t v34 = +[NSValue value:&v36 withObjCType:"{CGSize=dd}"];
          [v25 setObject:v34 forKey:AVAssetDownloadTaskMinimumRequiredPresentationSizeKey];
        }
        goto LABEL_39;
      }
      if (v26 != 5)
      {
        if (v26 != 8) {
          goto LABEL_7;
        }
LABEL_26:
        id v16 = 0;
        uint64_t v15 = &off_1003C9438;
        *(void *)&long long v36 = 0x4089A00000000000;
        char v14 = 1;
        double v17 = 820.0;
        double v18 = 420.0;
        goto LABEL_30;
      }
    }
    else
    {
      if (v13)
      {
        id v16 = 0;
        uint64_t v15 = &off_1003C9438;
        *(void *)&long long v36 = 0x408CE00000000000;
        char v14 = 1;
        double v17 = 924.0;
        double v18 = 476.0;
        goto LABEL_30;
      }
      int v27 = MGGetSInt32Answer();
      if (v27 != 8)
      {
        if (v27 == 5)
        {
          id v16 = 0;
          uint64_t v15 = &off_1003C9438;
          *(void *)&long long v36 = 0x4084A00000000000;
          char v14 = 1;
          double v17 = 660.0;
          double v18 = 250.0;
          goto LABEL_30;
        }
        goto LABEL_26;
      }
    }
    id v16 = 0;
    uint64_t v15 = &off_1003C9438;
    *(void *)&long long v36 = 0x4087700000000000;
    char v14 = 1;
    double v17 = 750.0;
    double v18 = 350.0;
    goto LABEL_30;
  }
  uint64_t v19 = SSDeviceSupportsHDRDownload();
  long long v36 = 0uLL;
  if (SSIsiPhoneWithExpandedScreen())
  {
    uint64_t v20 = 0x4086D00000000000;
    uint64_t v21 = 0x4097600000000000;
  }
  else
  {
    unsigned int v22 = +[SSDevice deviceIsiPad];
    uint64_t v21 = 0x4090280000000000;
    if (v22) {
      uint64_t v21 = 0x4097600000000000;
    }
    uint64_t v20 = 0x4082080000000000;
    if (v22) {
      uint64_t v20 = 0x4086D00000000000;
    }
  }
  *(void *)&long long v36 = v21;
  *((void *)&v36 + 1) = v20;
  unsigned int v23 = +[NSValue value:&v36 withObjCType:"{CGSize=dd}"];
  v38[0] = v7;
  v37[0] = AVAssetDownloadTaskDestinationURLKey;
  v37[1] = AVAssetDownloadTaskAllowHighDynamicRangeKey;
  v24 = +[NSNumber numberWithBool:v19];
  v37[2] = AVAssetDownloadTaskMinimumRequiredPresentationSizeKey;
  v38[1] = v24;
  v38[2] = v23;
  unsigned int v25 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];

LABEL_39:

  return v25;
}

- (void)_addMediaSelectionOptionsIfNotAlreadyAdded:(id)a3 toMediaSelections:(id)a4 forMediaSelectionGroup:(id)a5 baseMediaSelection:(id)a6
{
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  id v23 = a6;
  id obj = v9;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v25 = *(void *)v32;
    do
    {
      unsigned int v13 = 0;
      do
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(obj);
        }
        char v14 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v13);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v15 = v26;
        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v28;
LABEL_8:
          uint64_t v19 = 0;
          while (1)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = [*(id *)(*((void *)&v27 + 1) + 8 * v19) selectedMediaOptionInMediaSelectionGroup:v10];
            unsigned __int8 v21 = [v14 isEqual:v20];

            if (v21) {
              break;
            }
            if (v17 == (id)++v19)
            {
              id v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v17) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
        }
        else
        {
LABEL_14:

          id v22 = [v23 mutableCopy];
          [v22 selectMediaOption:v14 inMediaSelectionGroup:v10];
          [v15 addObject:v22];
          id v15 = v22;
        }

        unsigned int v13 = (char *)v13 + 1;
      }
      while (v13 != v12);
      id v12 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }
}

- (id)_mediaSelectionsForHLSDownloadFromLoadedAVAsset:(id)a3 outNumAudioSelectionsToBeDownloaded:(unint64_t *)a4 outNumSubtitleSelectionsToBeDownloaded:(unint64_t *)a5
{
  id v8 = a3;
  if ([v8 statusOfValueForKey:@"availableMediaCharacteristicsWithMediaSelectionOptions" error:0] == (id)2)
  {
    v188 = self;
    id v9 = [(PrepareDownloadResponse *)self kind];
    int IsVideosAppKind = SSDownloadKindIsVideosAppKind();

    if (IsVideosAppKind)
    {
      id v11 = (void *)CFPreferencesCopyAppValue(@"PreferredAudioLanguages", @"com.apple.videos-preferences");
      id v12 = [v11 mutableCopy];

      v179 = a4;
      if ([v12 count])
      {
        unsigned int v13 = [v12 containsObject:@"DEFAULT_LANGUAGE"];
        if (v13) {
          [v12 removeObject:@"DEFAULT_LANGUAGE"];
        }
        int v14 = v13;
        if ([v12 containsObject:@"ORIGINAL_AUDIO_LANGUAGE"])
        {
          [v12 removeObject:@"ORIGINAL_AUDIO_LANGUAGE"];
          int v14 = 1;
        }
        if ([v12 containsObject:@"DEVICE_AUDIO_LANGUAGE"])
        {
          [v12 removeObject:@"DEVICE_AUDIO_LANGUAGE"];
          unsigned int v13 = 1;
        }
      }
      else
      {
        unsigned int v13 = 1;
        int v14 = 1;
      }
      long long v27 = [v8 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicAudible];
      long long v28 = [v8 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible];
      uint64_t v29 = [v27 options];
      v263[0] = AVMediaCharacteristicIsMainProgramContent;
      v263[1] = AVMediaCharacteristicIsOriginalContent;
      long long v30 = +[NSArray arrayWithObjects:v263 count:2];
      v176 = (void *)v29;
      v178 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v29 withMediaCharacteristics:v30];

      v186 = [v8 preferredMediaSelection];
      id v187 = objc_alloc_init((Class)NSMutableArray);
      v174 = a5;
      id v175 = v8;
      v193 = v27;
      v185 = v28;
      if (v186)
      {
        long long v31 = &syslog_ptr;
        if (v14)
        {
          AVMediaCharacteristic v262 = AVMediaCharacteristicDescribesVideoForAccessibility;
          long long v32 = +[NSArray arrayWithObjects:&v262 count:1];
          long long v33 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v178 withoutMediaCharacteristics:v32];

          [(PrepareDownloadResponse *)v188 _addMediaSelectionOptionsIfNotAlreadyAdded:v33 toMediaSelections:v187 forMediaSelectionGroup:v27 baseMediaSelection:v186];
        }
        if (v13)
        {
          long long v34 = +[NSLocale preferredLanguages];
          id v35 = [v34 firstObject];

          if (v35)
          {
            if (!v12) {
              id v12 = objc_alloc_init((Class)NSMutableArray);
            }
            if (([v12 containsObject:v35] & 1) == 0) {
              [v12 insertObject:v35 atIndex:0];
            }
          }
        }
        id v177 = v12;
        if ([v12 count])
        {
          AVMediaCharacteristic v261 = AVMediaCharacteristicIsMainProgramContent;
          long long v36 = +[NSArray arrayWithObjects:&v261 count:1];
          id v37 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v29 withMediaCharacteristics:v36];

          long long v240 = 0u;
          long long v241 = 0u;
          long long v238 = 0u;
          long long v239 = 0u;
          id obj = v12;
          id v38 = [obj countByEnumeratingWithState:&v238 objects:v260 count:16];
          if (v38)
          {
            id v39 = v38;
            uint64_t v40 = *(void *)v239;
            do
            {
              for (i = 0; i != v39; i = (char *)i + 1)
              {
                if (*(void *)v239 != v40) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v259 = *(void *)(*((void *)&v238 + 1) + 8 * i);
                uint64_t v42 = [v31[290] arrayWithObjects:&v259 count:1];
                int v43 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v37 filteredAndSortedAccordingToPreferredLanguages:v42];

                AVMediaCharacteristic v258 = AVMediaCharacteristicDescribesVideoForAccessibility;
                [v31[290] arrayWithObjects:&v258 count:1];
                v45 = id v44 = v31;
                int64_t v46 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v43 withoutMediaCharacteristics:v45];

                uint64_t v47 = [v46 firstObject];
                v48 = (void *)v47;
                if (v47)
                {
                  uint64_t v257 = v47;
                  v49 = [v44[290] arrayWithObjects:&v257 count:1];
                  [(PrepareDownloadResponse *)v188 _addMediaSelectionOptionsIfNotAlreadyAdded:v49 toMediaSelections:v187 forMediaSelectionGroup:v193 baseMediaSelection:v186];
                }
                long long v31 = v44;
              }
              id v39 = [obj countByEnumeratingWithState:&v238 objects:v260 count:16];
            }
            while (v39);
          }

          long long v27 = v193;
          long long v28 = v185;
        }
        if (![v187 count]) {
          [v187 addObject:v186];
        }
        unsigned int v50 = (uint64_t (*)(void))ISWeakLinkedSymbolForString();
        if (v50) {
          v51 = (void *)v50();
        }
        else {
          v51 = 0;
        }
        uint64_t v170 = ISWeakLinkedStringConstantForString();
        v171 = v51;
        if (objc_msgSend(v51, "containsObject:"))
        {
          id v57 = objc_alloc_init((Class)NSMutableSet);
          long long v234 = 0u;
          long long v235 = 0u;
          long long v236 = 0u;
          long long v237 = 0u;
          id v58 = v187;
          id v59 = [v58 countByEnumeratingWithState:&v234 objects:v256 count:16];
          if (v59)
          {
            id v60 = v59;
            uint64_t v61 = *(void *)v235;
            do
            {
              for (j = 0; j != v60; j = (char *)j + 1)
              {
                if (*(void *)v235 != v61) {
                  objc_enumerationMutation(v58);
                }
                uint64_t v63 = [*(id *)(*((void *)&v234 + 1) + 8 * (void)j) selectedMediaOptionInMediaSelectionGroup:v27];
                v64 = [v63 extendedLanguageTag];

                if (v64) {
                  [v57 addObject:v64];
                }
              }
              id v60 = [v58 countByEnumeratingWithState:&v234 objects:v256 count:16];
            }
            while (v60);
          }

          AVMediaCharacteristic v255 = AVMediaCharacteristicIsMainProgramContent;
          v65 = +[NSArray arrayWithObjects:&v255 count:1];
          uint64_t v66 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v176 withMediaCharacteristics:v65];

          id v67 = [v57 allObjects];
          obja = (void *)v66;
          id v68 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v66 filteredAndSortedAccordingToPreferredLanguages:v67];

          AVMediaCharacteristic v254 = AVMediaCharacteristicDescribesVideoForAccessibility;
          unint64_t v69 = +[NSArray arrayWithObjects:&v254 count:1];
          unint64_t v70 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v68 withMediaCharacteristics:v69];

          long long v232 = 0u;
          long long v233 = 0u;
          long long v230 = 0u;
          long long v231 = 0u;
          id v71 = v70;
          id v72 = [v71 countByEnumeratingWithState:&v230 objects:v253 count:16];
          if (v72)
          {
            id v73 = v72;
            uint64_t v74 = *(void *)v231;
            do
            {
              for (k = 0; k != v73; k = (char *)k + 1)
              {
                if (*(void *)v231 != v74) {
                  objc_enumerationMutation(v71);
                }
                uint64_t v76 = *(void *)(*((void *)&v230 + 1) + 8 * (void)k);
                uint64_t v77 = [v58 firstObject];
                id v78 = [v77 mutableCopy];

                [v78 selectMediaOption:v76 inMediaSelectionGroup:v193];
                [v58 addObject:v78];
              }
              id v73 = [v71 countByEnumeratingWithState:&v230 objects:v253 count:16];
            }
            while (v73);
          }

          id v12 = v177;
          long long v27 = v193;
          long long v28 = v185;
          long long v31 = &syslog_ptr;
        }
        v169 = (char *)[v187 count];
        v79 = [v28 options];
        id v173 = objc_alloc_init((Class)NSMutableSet);
        id v194 = objc_alloc_init((Class)NSMutableSet);
        AVMediaCharacteristic v252 = AVMediaCharacteristicContainsOnlyForcedSubtitles;
        v80 = [v31[290] arrayWithObjects:&v252 count:1];
        v172 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v79 withoutMediaCharacteristics:v80];

        long long v228 = 0u;
        long long v229 = 0u;
        long long v226 = 0u;
        long long v227 = 0u;
        id v190 = v79;
        id v81 = [v190 countByEnumeratingWithState:&v226 objects:v251 count:16];
        if (v81)
        {
          id v82 = v81;
          uint64_t v83 = *(void *)v227;
          do
          {
            for (m = 0; m != v82; m = (char *)m + 1)
            {
              if (*(void *)v227 != v83) {
                objc_enumerationMutation(v190);
              }
              v85 = *(void **)(*((void *)&v226 + 1) + 8 * (void)m);
              v86 = [v85 mediaType];
              unsigned int v87 = [v86 isEqualToString:AVMediaTypeClosedCaption];

              if (v87) {
                [v194 addObject:v85];
              }
            }
            id v82 = [v190 countByEnumeratingWithState:&v226 objects:v251 count:16];
          }
          while (v82);
        }

        long long v224 = 0u;
        long long v225 = 0u;
        long long v222 = 0u;
        long long v223 = 0u;
        id v192 = v187;
        id v88 = [v192 countByEnumeratingWithState:&v222 objects:v250 count:16];
        if (v88)
        {
          id v89 = v88;
          uint64_t v90 = *(void *)v223;
          do
          {
            for (n = 0; n != v89; n = (char *)n + 1)
            {
              if (*(void *)v223 != v90) {
                objc_enumerationMutation(v192);
              }
              v92 = [*(id *)(*((void *)&v222 + 1) + 8 * (void)n) selectedMediaOptionInMediaSelectionGroup:v27];
              v93 = [v92 associatedMediaSelectionOptionInMediaSelectionGroup:v28];
              if (v93) {
                [v194 addObject:v93];
              }
              v94 = [v92 extendedLanguageTag];
              if (v94) {
                [v173 addObject:v94];
              }
            }
            id v89 = [v192 countByEnumeratingWithState:&v222 objects:v250 count:16];
          }
          while (v89);
        }

        if ([v12 count]) {
          [v173 addObjectsFromArray:v12];
        }
        id v95 = objc_alloc_init((Class)NSMutableSet);
        long long v218 = 0u;
        long long v219 = 0u;
        long long v220 = 0u;
        long long v221 = 0u;
        id v96 = v178;
        id v97 = [v96 countByEnumeratingWithState:&v218 objects:v249 count:16];
        v98 = v192;
        if (v97)
        {
          id v99 = v97;
          uint64_t v100 = *(void *)v219;
          do
          {
            for (ii = 0; ii != v99; ii = (char *)ii + 1)
            {
              if (*(void *)v219 != v100) {
                objc_enumerationMutation(v96);
              }
              v102 = [*(id *)(*((void *)&v218 + 1) + 8 * (void)ii) extendedLanguageTag];
              if (v102) {
                [v95 addObject:v102];
              }
            }
            id v99 = [v96 countByEnumeratingWithState:&v218 objects:v249 count:16];
          }
          while (v99);
        }

        v103 = [v95 allObjects];
        [v173 addObjectsFromArray:v103];

        uint64_t v104 = +[NSLocale preferredLanguages];
        if (v104) {
          [v173 addObjectsFromArray:v104];
        }
        keyExistsAndHasValidFormat[0] = 0;
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseDefaultSubtitleLanguages", @"com.apple.videos-preferences", keyExistsAndHasValidFormat);
        if (keyExistsAndHasValidFormat[0])
        {
          if (!AppBooleanValue)
          {
            CFPropertyListRef v106 = CFPreferencesCopyAppValue(@"PreferredSubtitleLanguages", @"com.apple.videos-preferences");
            if (v106)
            {
              v107 = (void *)v106;
              [v173 addObjectsFromArray:v106];
            }
          }
        }
        if ([v173 containsObject:@"yue"]) {
          [v173 addObject:@"yue-Hant"];
        }
        uint64_t v108 = ISWeakLinkedStringConstantForString();
        uint64_t v109 = ISWeakLinkedStringConstantForString();
        v110 = (uint64_t (*)(uint64_t))ISWeakLinkedSymbolForString();
        if (v110) {
          v111 = (void *)v110(1);
        }
        else {
          v111 = 0;
        }
        v167 = (void *)v104;
        v168 = v95;
        v165 = (void *)v109;
        v166 = (void *)v108;
        v164 = v111;
        if ([v111 containsObject:v108]) {
          unsigned int v181 = 1;
        }
        else {
          unsigned int v181 = [v111 containsObject:v109];
        }
        v112 = [v173 allObjects];
        v113 = +[AVMediaSelectionGroup mediaSelectionOptionsFromArray:v172 filteredAndSortedAccordingToPreferredLanguages:v112];

        id v114 = objc_alloc_init((Class)NSMutableSet);
        long long v214 = 0u;
        long long v215 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        id v115 = v113;
        id v116 = [v115 countByEnumeratingWithState:&v214 objects:v248 count:16];
        v183 = v115;
        v184 = v114;
        if (v116)
        {
          id v117 = v116;
          uint64_t v118 = *(void *)v215;
          uint64_t v182 = *(void *)v215;
          do
          {
            v119 = 0;
            id v189 = v117;
            do
            {
              if (*(void *)v215 != v118) {
                objc_enumerationMutation(v115);
              }
              v120 = *(void **)(*((void *)&v214 + 1) + 8 * (void)v119);
              v121 = [v120 extendedLanguageTag];
              if (!v121) {
                goto LABEL_165;
              }
              objb = v121;
              unsigned __int8 v122 = [v114 containsObject:v121];
              v121 = objb;
              if (v122) {
                goto LABEL_165;
              }
              v123 = [v120 mediaType];
              unsigned int v124 = [v123 isEqualToString:AVMediaTypeSubtitle];

              v121 = objb;
              id v117 = v189;
              if (!v124) {
                goto LABEL_165;
              }
              long long v212 = 0u;
              long long v213 = 0u;
              long long v210 = 0u;
              long long v211 = 0u;
              id v125 = v115;
              id v126 = [v125 countByEnumeratingWithState:&v210 objects:v247 count:16];
              if (!v126)
              {
LABEL_145:

LABEL_161:
                [v194 addObject:v120];
                long long v28 = v185;
                v98 = v192;
                uint64_t v118 = v182;
                goto LABEL_164;
              }
              id v127 = v126;
              uint64_t v128 = *(void *)v211;
LABEL_135:
              uint64_t v129 = 0;
              while (1)
              {
                if (*(void *)v211 != v128) {
                  objc_enumerationMutation(v125);
                }
                v130 = *(void **)(*((void *)&v210 + 1) + 8 * v129);
                if (v130 != v120)
                {
                  v131 = [*(id *)(*((void *)&v210 + 1) + 8 * v129) mediaType];
                  unsigned int v132 = [v131 isEqualToString:AVMediaTypeSubtitle];

                  if (v132) {
                    break;
                  }
                }
LABEL_143:
                if (v127 == (id)++v129)
                {
                  id v127 = [v125 countByEnumeratingWithState:&v210 objects:v247 count:16];
                  if (!v127) {
                    goto LABEL_145;
                  }
                  goto LABEL_135;
                }
              }
              v133 = [v130 extendedLanguageTag];
              v134 = v133;
              if (!v133 || ([v133 isEqualToString:objb] & 1) == 0)
              {

                goto LABEL_143;
              }
              id v135 = v130;

              if (!v135) {
                goto LABEL_161;
              }
              long long v28 = v185;
              v98 = v192;
              uint64_t v118 = v182;
              if ([(PrepareDownloadResponse *)v188 _isMediaSelectionOptionSDHSubtitle:v120]&& [(PrepareDownloadResponse *)v188 _isMediaSelectionOptionSDHSubtitle:v135]|| ![(PrepareDownloadResponse *)v188 _isMediaSelectionOptionSDHSubtitle:v120]&& ![(PrepareDownloadResponse *)v188 _isMediaSelectionOptionSDHSubtitle:v135])
              {
                [v194 addObject:v120];
                [v194 addObject:v135];
              }
              else
              {
                if ([(PrepareDownloadResponse *)v188 _isMediaSelectionOptionSDHSubtitle:v120])
                {
                  v136 = v120;
                }
                else
                {
                  v136 = v135;
                }
                id v137 = v136;
                if ([(PrepareDownloadResponse *)v188 _isMediaSelectionOptionSDHSubtitle:v120])
                {
                  v138 = v135;
                }
                else
                {
                  v138 = v120;
                }
                id v139 = v138;
                v140 = v139;
                if (v181) {
                  id v141 = v137;
                }
                else {
                  id v141 = v139;
                }
                [v194 addObject:v141];
              }
LABEL_164:
              id v114 = v184;
              [v184 addObject:objb];
              v121 = objb;
              id v115 = v183;
              id v117 = v189;
LABEL_165:

              v119 = (char *)v119 + 1;
            }
            while (v119 != v117);
            id v117 = [v115 countByEnumeratingWithState:&v214 objects:v248 count:16];
          }
          while (v117);
        }
        id v191 = v169 + 1;

        [v194 allObjects];
        long long v206 = 0u;
        long long v207 = 0u;
        long long v208 = 0u;
        long long v209 = 0u;
        id v142 = (id)objc_claimAutoreleasedReturnValue();
        id v143 = [v142 countByEnumeratingWithState:&v206 objects:v246 count:16];
        if (v143)
        {
          id v144 = v143;
          unint64_t v15 = 0;
          uint64_t v145 = *(void *)v207;
          do
          {
            for (jj = 0; jj != v144; jj = (char *)jj + 1)
            {
              if (*(void *)v207 != v145) {
                objc_enumerationMutation(v142);
              }
              uint64_t v147 = *(void *)(*((void *)&v206 + 1) + 8 * (void)jj);
              v148 = [v98 firstObject];
              id v149 = [v148 mutableCopy];

              [v149 selectMediaOption:v147 inMediaSelectionGroup:v28];
              [v98 addObject:v149];
            }
            v15 += (unint64_t)v144;
            id v144 = [v142 countByEnumeratingWithState:&v206 objects:v246 count:16];
          }
          while (v144);
        }
        else
        {
          unint64_t v15 = 0;
        }

        id v56 = v98;
        v54 = v170;
        int v52 = v171;
      }
      else
      {
        int v52 = +[SSLogConfig sharedDaemonConfig];
        if (!v52)
        {
          int v52 = +[SSLogConfig sharedConfig];
        }
        unsigned int v53 = [v52 shouldLog];
        if ([v52 shouldLogToDisk]) {
          v53 |= 2u;
        }
        v54 = [v52 OSLogObject];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          int v55 = v53;
        }
        else {
          int v55 = v53 & 2;
        }
        id v177 = v12;
        if (v55)
        {
          *(_WORD *)keyExistsAndHasValidFormat = 0;
          LODWORD(v163) = 2;
          v162 = keyExistsAndHasValidFormat;
          id v56 = (id)_os_log_send_and_compose_impl();

          if (!v56)
          {
            unint64_t v15 = 0;
            id v191 = 0;
            goto LABEL_178;
          }
          v54 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, keyExistsAndHasValidFormat, v163);
          free(v56);
          v162 = (Boolean *)v54;
          SSFileLog();
        }
        unint64_t v15 = 0;
        id v191 = 0;
        id v56 = 0;
      }

LABEL_178:
      long long v204 = 0u;
      long long v205 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      id v17 = v56;
      id v150 = [v17 countByEnumeratingWithState:&v202 objects:v245 count:16];
      if (!v150) {
        goto LABEL_196;
      }
      id v151 = v150;
      uint64_t v152 = *(void *)v203;
      while (1)
      {
        for (kk = 0; kk != v151; kk = (char *)kk + 1)
        {
          if (*(void *)v203 != v152) {
            objc_enumerationMutation(v17);
          }
          uint64_t v154 = *(void *)(*((void *)&v202 + 1) + 8 * (void)kk);
          v155 = +[SSLogConfig sharedDaemonConfig];
          if (!v155)
          {
            v155 = +[SSLogConfig sharedConfig];
          }
          unsigned int v156 = [v155 shouldLog];
          if ([v155 shouldLogToDisk]) {
            v156 |= 2u;
          }
          v157 = [v155 OSLogObject];
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEFAULT)) {
            int v158 = v156;
          }
          else {
            int v158 = v156 & 2;
          }
          if (v158)
          {
            *(_DWORD *)keyExistsAndHasValidFormat = 138412290;
            uint64_t v244 = v154;
            LODWORD(v163) = 12;
            v162 = keyExistsAndHasValidFormat;
            v159 = (void *)_os_log_send_and_compose_impl();

            if (!v159) {
              goto LABEL_194;
            }
            v157 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v159, 4, keyExistsAndHasValidFormat, v163);
            free(v159);
            v162 = (Boolean *)v157;
            SSFileLog();
          }

LABEL_194:
        }
        id v151 = [v17 countByEnumeratingWithState:&v202 objects:v245 count:16];
        if (!v151)
        {
LABEL_196:

          a5 = v174;
          id v8 = v175;
          a4 = v179;
          uint64_t v19 = v177;
          unint64_t v16 = (unint64_t)v191;
          id v20 = v193;
          goto LABEL_197;
        }
      }
    }
    uint64_t v18 = [v8 allMediaSelections];
    uint64_t v19 = [v8 mediaSelectionGroupForMediaCharacteristic:AVMediaCharacteristicLegible];
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    id v20 = v18;
    id v21 = [v20 countByEnumeratingWithState:&v198 objects:v242 count:16];
    if (v21)
    {
      id v22 = v21;
      v180 = a4;
      unint64_t v15 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v199;
      do
      {
        for (mm = 0; mm != v22; mm = (char *)mm + 1)
        {
          if (*(void *)v199 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = [*(id *)(*((void *)&v198 + 1) + 8 * (void)mm) selectedMediaOptionInMediaSelectionGroup:v19];

          if (v26) {
            ++v15;
          }
          else {
            ++v23;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v198 objects:v242 count:16];
      }
      while (v22);
      unint64_t v16 = 2 * v23;
      id v17 = v20;
      a4 = v180;
    }
    else
    {
      unint64_t v15 = 0;
      unint64_t v16 = 0;
      id v17 = v20;
    }
LABEL_197:

    if (a4) {
      goto LABEL_198;
    }
  }
  else
  {
    unint64_t v15 = 0;
    unint64_t v16 = 0;
    id v17 = 0;
    if (a4) {
LABEL_198:
    }
      *a4 = v16;
  }
  if (a5) {
    *a5 = v15;
  }
  id v160 = v17;

  return v160;
}

- (BOOL)_isMediaSelectionOptionSDHSubtitle:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    NSUInteger v5 = [v3 mediaType];
    if ([v5 isEqualToString:AVMediaTypeSubtitle])
    {
      if ([v4 hasMediaCharacteristic:AVMediaCharacteristicDescribesMusicAndSoundForAccessibility])unsigned __int8 v6 = 1; {
      else
      }
        unsigned __int8 v6 = [v4 hasMediaCharacteristic:AVMediaCharacteristicTranscribesSpokenDialogForAccessibility];
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (int64_t)automaticType
{
  return self->_automaticType;
}

- (void)setAutomaticType:(int64_t)a3
{
  self->_automaticType = a3;
}

- (NSDictionary)AVAssetDownloadSessionOptions
{
  return self->_AVAssetDownloadSessionOptions;
}

- (void)setAVAssetDownloadSessionOptions:(id)a3
{
}

- (NSArray)backgroundOperations
{
  return self->_backgroundOperations;
}

- (void)setBackgroundOperations:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int64_t)bytesPerSecondLimit
{
  return self->_bytesPerSecondLimit;
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  self->_bytesPerSecondLimit = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientSecondaryIdentifier
{
  return self->_clientSecondaryIdentifier;
}

- (void)setClientSecondaryIdentifier:(id)a3
{
}

- (DownloadDataConsumer)dataConsumer
{
  return self->_dataConsumer;
}

- (void)setDataConsumer:(id)a3
{
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_int64_t downloadIdentifier = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isHLS
{
  return self->_isHLS;
}

- (void)setHLS:(BOOL)a3
{
  self->_isHLS = a3;
}

- (BOOL)ignoresDownloadHandler
{
  return self->_ignoresDownloadHandler;
}

- (void)setIgnoresDownloadHandler:(BOOL)a3
{
  self->_ignoresDownloadHandler = a3;
}

- (BOOL)infersDiscretionary
{
  return self->_infersDiscretionary;
}

- (void)setInfersDiscretionary:(BOOL)a3
{
  self->_infersDiscretionary = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (BOOL)isLegacyClient
{
  return self->_legacyClient;
}

- (void)setLegacyClient:(BOOL)a3
{
  self->_legacyClient = a3;
}

- (NSNumber)loadingPriority
{
  return self->_loadingPriority;
}

- (void)setLoadingPriority:(id)a3
{
}

- (int64_t)mediaAssetIdentifier
{
  return self->_mediaAssetIdentifier;
}

- (void)setMediaAssetIdentifier:(int64_t)a3
{
  self->_mediaAssetIdentifier = a3;
}

- (int64_t)mediaAssetSize
{
  return self->_mediaAssetSize;
}

- (void)setMediaAssetSize:(int64_t)a3
{
  self->_mediaAssetSize = a3;
}

- (int64_t)rentalIdentifier
{
  return self->rentalIdentifier;
}

- (void)setRentalIdentifier:(int64_t)a3
{
  self->rentalIdentifier = a3;
}

- (BOOL)requiresDownloadHandler
{
  return self->_requiresDownloadHandler;
}

- (void)setRequiresDownloadHandler:(BOOL)a3
{
  self->_requiresDownloadHandler = a3;
}

- (BOOL)requiresPowerPluggedIn
{
  return self->_requiresPowerPluggedIn;
}

- (void)setRequiresPowerPluggedIn:(BOOL)a3
{
  self->_requiresPowerPluggedIn = a3;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (int64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (void)setStoreItemIdentifier:(int64_t)a3
{
  self->_storeItemIdentifier = a3;
}

- (int64_t)taskPriority
{
  return self->_taskPriority;
}

- (void)setTaskPriority:(int64_t)a3
{
  self->_taskPriority = a3;
}

- (NSNumber)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (double)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (void)setTimeoutIntervalForRequest:(double)a3
{
  self->_timeoutIntervalForRequest = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (double)transferProgressFraction
{
  return self->_transferProgressFraction;
}

- (void)setTransferProgressFraction:(double)a3
{
  self->_transferProgressFraction = a3;
}

- (NSURLRequest)URLRequest
{
  return self->_URLRequest;
}

- (void)setURLRequest:(id)a3
{
}

- (unint64_t)numAudioSelectionsToBeDownloaded
{
  return self->_numAudioSelectionsToBeDownloaded;
}

- (void)setNumAudioSelectionsToBeDownloaded:(unint64_t)a3
{
  self->_numAudioSelectionsToBeDownloaded = a3;
}

- (unint64_t)numSubtitleSelectionsToBeDownloaded
{
  return self->_numSubtitleSelectionsToBeDownloaded;
}

- (void)setNumSubtitleSelectionsToBeDownloaded:(unint64_t)a3
{
  self->_numSubtitleSelectionsToBeDownloaded = a3;
}

- (DownloadHandle)downloadHandle
{
  return self->_downloadHandle;
}

- (void)setDownloadHandle:(id)a3
{
}

- (BOOL)isCellularAllowed
{
  return self->_cellularAllowed;
}

- (void)setCellularAllowed:(BOOL)a3
{
  self->_cellularAllowed = a3;
}

- (BOOL)isRestore
{
  return self->_restore;
}

- (void)setRestore:(BOOL)a3
{
  self->_restore = a3;
}

- (NSNumber)downloadRestoreState
{
  return self->_downloadRestoreState;
}

- (void)setDownloadRestoreState:(id)a3
{
}

- (BOOL)isPerDeviceVPP
{
  return self->_isPerDeviceVPP;
}

- (void)setIsPerDeviceVPP:(BOOL)a3
{
  self->_isPerDeviceVPP = a3;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (BOOL)hasHDR
{
  return self->_hasHDR;
}

- (void)setHasHDR:(BOOL)a3
{
  self->_hasHDR = a3;
}

- (BOOL)has4K
{
  return self->_has4K;
}

- (void)setHas4K:(BOOL)a3
{
  self->_has4K = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadRestoreState, 0);
  objc_storeStrong((id *)&self->_downloadHandle, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_loadingPriority, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_dataConsumer, 0);
  objc_storeStrong((id *)&self->_clientSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundOperations, 0);

  objc_storeStrong((id *)&self->_AVAssetDownloadSessionOptions, 0);
}

@end