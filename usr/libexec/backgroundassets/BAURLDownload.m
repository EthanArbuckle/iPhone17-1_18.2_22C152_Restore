@interface BAURLDownload
+ (BOOL)_cellularNetworkProhibitsDownloadUsingError:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BAURLDownload)init;
- (BAURLDownload)initWithCoder:(id)a3;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request essential:(BOOL)essential fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority;
- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier;
- (BOOL)_startDownloadWithDelegate:(id)a3 error:(id *)a4;
- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4;
- (NSError)bailError;
- (NSURLRequest)request;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)stopRequest;
- (unint64_t)amountDownloaded;
- (void)_cancelDownload:(BOOL)a3;
- (void)_handleChallenge:(id)a3 authenticationHandler:(id)a4;
- (void)_handleDownloadCompletionWithFileLocation:(id)a3 response:(id)a4;
- (void)_handleDownloadFailureWithError:(id)a3 resumeData:(id)a4 response:(id)a5;
- (void)_handleProgressWithBytesReceived:(unint64_t)a3 totalBytesRecieved:(unint64_t)a4 totalDownloadSize:(int64_t)a5 resuming:(BOOL)a6;
- (void)_informDelegateOfFailedDownloadWithError:(id)a3;
- (void)_informDelegateOfFailedDownloadWithError:(id)a3 silentFailure:(BOOL)a4;
- (void)_informDelegateOfPausedDownloadWithWillImmediatelyResume:(BOOL)a3;
- (void)cancelDownload;
- (void)cancelDownloadSilently;
- (void)dealloc;
- (void)demoteToBackground;
- (void)encodeWithCoder:(id)a3;
- (void)pauseDownload;
- (void)promoteToForeground;
- (void)setAmountDownloaded:(unint64_t)a3;
- (void)setBailError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStopRequest:(int64_t)a3;
@end

@implementation BAURLDownload

- (void)dealloc
{
  v3 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v3);
  [(BADownload *)self _removeActivityAndPowerAssertion];
  os_unfair_lock_unlock(v3);
  v4.receiver = self;
  v4.super_class = (Class)BAURLDownload;
  [(BAURLDownload *)&v4 dealloc];
}

- (BOOL)startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v7);
  LOBYTE(a4) = [(BAURLDownload *)self _startDownloadWithDelegate:v6 error:a4];
  os_unfair_lock_unlock(v7);

  return (char)a4;
}

- (BOOL)_startDownloadWithDelegate:(id)a3 error:(id *)a4
{
  id v5 = a3;
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  v71 = v5;
  [(BADownload *)self setDelegate:v5];
  sub_100032D34(self, 2);
  [(BADownload *)self setDownloadError:0];
  [(BAURLDownload *)self setBailError:0];
  unsigned int v6 = [(BADownload *)self isForegroundDownload];
  if ((id)[(BAURLDownload *)self stopRequest] == (id)6)
  {
    v7 = sub_100013C84();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v88 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Download timed out awaiting connectivity. Restarting Download: %{public}@", buf, 0xCu);
    }

    unsigned int v70 = 0;
  }
  else
  {
    unsigned int v70 = v6;
  }
  [(BAURLDownload *)self setStopRequest:0];
  v8 = [(BAURLDownload *)self request];
  id v9 = [v8 mutableCopy];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_27;
  }
  v10 = [v9 URL];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_27;
  }
  v11 = [v9 URL];
  v12 = [v11 scheme];
  BOOL v13 = [v12 caseInsensitiveCompare:@"https"] == 0;

  if (!v13)
  {
LABEL_27:
    if (!a4)
    {
LABEL_59:
      BOOL v32 = 0;
      goto LABEL_60;
    }
    sub_100029C00(-205);
    BOOL v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_60;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v15 = [(BADownload *)self applicationInfo];

  unsigned int v67 = isKindOfClass & 1;
  if (v15)
  {
    v16 = sub_100013C84();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v88 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Download %{public}@ is restricted, validating.", buf, 0xCu);
    }

    uint64_t v17 = [(BAURLDownload *)self request];
    v18 = [(id)v17 URL];
    v66 = [v18 host];

    v19 = [(BADownload *)self applicationInfo];
    v20 = [v19 allowedDownloadDomains];
    LOBYTE(v17) = [v20 containsObject:v66];

    if ((v17 & 1) == 0)
    {
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      v21 = [(BADownload *)self applicationInfo];
      id obj = [v21 allowedDownloadDomainWildcards];

      id v22 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v83;
        while (2)
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v83 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = [*(id *)(*((void *)&v82 + 1) + 8 * i) substringFromIndex:1 withString:v66];
            v26 = [(BAURLDownload *)self request];
            v27 = [v26 URL];
            v28 = [v27 host];
            unsigned int v29 = [v28 hasSuffix:v25];

            if (v29)
            {

              goto LABEL_30;
            }
          }
          id v22 = [obj countByEnumeratingWithState:&v82 objects:v86 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }

      if ((v67 & 1) == 0)
      {
        v30 = sub_100013C84();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_100038558((uint64_t)self, v30);
        }

        if (!a4) {
          goto LABEL_58;
        }
        uint64_t v31 = 202;
LABEL_57:
        sub_100029C00(v31);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

        goto LABEL_59;
      }
    }
LABEL_30:
    v33 = [(BADownload *)self applicationInfo];
    BOOL v34 = [[v33 remainingDownloadAllowanceWithNecessity:-[BADownload necessity](self, "necessity") isManifest:v67] == 0;

    if (v34)
    {
      v64 = sub_100013C84();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        sub_1000384E0((uint64_t)self, v64);
      }

      if (!a4) {
        goto LABEL_58;
      }
      uint64_t v31 = 203;
      goto LABEL_57;
    }
  }
  if ([(BADownload *)self isForegroundDownload])
  {
    id obja = +[NSURLSessionConfiguration defaultSessionConfiguration];
    [obja setAllowsExpensiveNetworkAccess:1];
    [obja setTimeoutIntervalForRequest:60.0];
    [obja setWaitsForConnectivity:v70];
    v35 = [(BADownload *)self applicationInfo];
    if (v35)
    {
      unsigned int v36 = [(BADownload *)self permitInitialCellularDownload];

      if (v36) {
        [obja setAllowsCellularAccess:1];
      }
    }
    uint64_t v37 = 7;
  }
  else
  {
    v38 = [(BADownload *)self uniqueIdentifier];
    id obja = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v38];

    [obja setAllowsCellularAccess:0];
    [obja setAllowsExpensiveNetworkAccess:0];
    [obja set_allowsRetryForBackgroundDataTasks:0];
    [v9 setAllowsCellularAccess:[obja allowsCellularAccess]];
    [v9 setAllowsExpensiveNetworkAccess:[obja allowsExpensiveNetworkAccess]];
    [v9 setNetworkServiceType:3];
    uint64_t v37 = 3;
  }
  sub_100032D34(self, v37);
  v39 = [(BADownload *)self applicationIdentifier];
  [obja set_sourceApplicationBundleIdentifier:v39];

  id v40 = [v9 copy];
  [(BAURLDownload *)self setRequest:v40];

  objc_initWeak((id *)buf, self);
  v41 = [(BADownload *)self resumeData];

  v42 = [BAURLSession alloc];
  if (v41)
  {
    v43 = [(BADownload *)self resumeData];
    v44 = [(BADownload *)self downloadCachePath];
    v45 = +[NSURL fileURLWithPath:v44 isDirectory:1];
    unsigned int v46 = [(BADownload *)self isForegroundDownload];
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472;
    v80[2] = sub_10000677C;
    v80[3] = &unk_10005C970;
    v47 = &v81;
    objc_copyWeak(&v81, (id *)buf);
    v48 = [(BAURLSession *)v42 initWithResumeData:v43 withDestinationDirectory:v45 inBackground:v46 ^ 1 withAuthenticationHandler:v80 withRedirectResponseHandler:0];
    [(BADownload *)self setSession:v48];
  }
  else
  {
    v43 = [(BAURLDownload *)self request];
    v44 = [(BADownload *)self downloadCachePath];
    v45 = +[NSURL fileURLWithPath:v44 isDirectory:1];
    unsigned int v49 = [(BADownload *)self isForegroundDownload];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000067F4;
    v78[3] = &unk_10005C970;
    v47 = &v79;
    objc_copyWeak(&v79, (id *)buf);
    v48 = [(BAURLSession *)v42 initWithURLRequest:v43 withDestinationDirectory:v45 inBackground:v49 ^ 1 withAuthenticationHandler:v78];
    [(BADownload *)self setSession:v48];
  }

  objc_destroyWeak(v47);
  v50 = [(BADownload *)self session];
  BOOL v32 = v50 != 0;

  if (v32)
  {
    v51 = +[NSDate now];
    [(BADownload *)self setDownloadStartDate:v51];

    v52 = [(BADownload *)self uniqueIdentifier];
    [(BADownload *)self _addActivityWithIdentifier:v52 takePowerAssertion:[(BADownload *)self isForegroundDownload]];

    v53 = [(BADownload *)self delegate];
    if (v53)
    {
      v54 = [(BADownload *)self delegate];
      char v55 = objc_opt_respondsToSelector();

      if (v55)
      {
        v56 = [(BADownload *)self responseQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000686C;
        block[3] = &unk_10005C998;
        block[4] = self;
        dispatch_async(v56, block);
      }
    }
    v57 = [(BADownload *)self session];
    [v57 setUseUniqueFileName:1];

    if (v70)
    {
      int64_t v58 = [(BADownload *)self necessity];
      v59 = [(BADownload *)self session];
      v60 = v59;
      double v61 = 60.0;
      if (v58 == 1) {
        double v61 = 10.0;
      }
      [v59 setInitialConnectivityTimeout:v61];
    }
    v62 = [(BADownload *)self session];
    v63 = [(BADownload *)self responseQueue];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1000068C0;
    v75[3] = &unk_10005C9C0;
    objc_copyWeak(&v76, (id *)buf);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100006930;
    v73[3] = &unk_10005C9E8;
    v73[4] = self;
    char v74 = v67;
    [v62 startAsyncDownloadNotifyingOnQueue:v63 sessionConfiguration:obja bytesReceivedHandler:v75 completionHandler:v73];

    objc_destroyWeak(&v76);
  }
  else if (a4)
  {
    sub_100029C00(-200);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_destroyWeak((id *)buf);

LABEL_60:
  return v32;
}

- (void)_handleDownloadFailureWithError:(id)a3 resumeData:(id)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v11);
  v12 = [(BADownload *)self session];
  [v12 invalidate];

  [(BADownload *)self setSession:0];
  BOOL v13 = [(BAURLDownload *)self bailError];

  if (v13)
  {
    v14 = [(BAURLDownload *)self bailError];
    v15 = [v14 userInfo];
    id v16 = [v15 mutableCopy];

    [v16 setObject:v8 forKey:NSUnderlyingErrorKey];
    uint64_t v17 = [(BAURLDownload *)self bailError];
    v18 = [v17 domain];
    v19 = [(BAURLDownload *)self bailError];
    uint64_t v20 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, [v19 code], v16);

    id v8 = (id)v20;
  }
  int64_t v21 = [(BAURLDownload *)self stopRequest];
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  switch(v21)
  {
    case 1:
      goto LABEL_13;
    case 2:
      uint64_t v22 = 1;
      goto LABEL_13;
    case 3:
      goto LABEL_6;
    case 4:
      uint64_t v23 = 1;
      goto LABEL_8;
    case 5:
LABEL_8:
      -[BADownload setIsForegroundDownload:](self, "setIsForegroundDownload:", v23, 0);
      goto LABEL_9;
    case 6:
LABEL_9:
      -[BADownload setResumeData:](self, "setResumeData:", v9, v22);
      [(BAURLDownload *)self _informDelegateOfPausedDownloadWithWillImmediatelyResume:1];
      v25 = [(BADownload *)self delegate];
      id v28 = 0;
      unsigned __int8 v26 = [(BAURLDownload *)self _startDownloadWithDelegate:v25 error:&v28];
      id v27 = v28;

      if ((v26 & 1) == 0) {
        [(BAURLDownload *)self _informDelegateOfFailedDownloadWithError:v27 silentFailure:0];
      }

      break;
    default:
      if ([(id)objc_opt_class() _cellularNetworkProhibitsDownloadUsingError:v8])
      {
LABEL_6:
        -[BADownload setResumeData:](self, "setResumeData:", v9, v22);
        [(BAURLDownload *)self _informDelegateOfPausedDownloadWithWillImmediatelyResume:0];
      }
      else
      {
        uint64_t v22 = 0;
LABEL_13:
        [(BAURLDownload *)self _informDelegateOfFailedDownloadWithError:v8 silentFailure:v22];
      }
      [(BADownload *)self _removeActivityAndPowerAssertion];
      break;
  }
  os_unfair_lock_unlock(v11);
}

- (void)_handleDownloadCompletionWithFileLocation:(id)a3 response:(id)a4
{
  id v5 = (char *)a3;
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  sub_100032D90(self, v5);

  sub_100032D34(self, 8);
  [(BADownload *)self setDownloadError:0];
  [(BADownload *)self setResumeData:0];
  sub_1000333F4(self, v6);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = +[NSNumber numberWithUnsignedInteger:[(BAURLDownload *)self amountDownloaded]];
  [(BADownload *)self setDownloadedFileSize:v7];

  id v8 = [(BADownload *)self session];
  [v8 invalidate];

  [(BADownload *)self setSession:0];
  [(BADownload *)self _removeActivityAndPowerAssertion];
  os_unfair_lock_unlock([(BADownload *)self downloadLock]);
  id v9 = [(BADownload *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(BADownload *)self delegate];
    [v11 download:self finishedWithFileURL:v12];
  }
}

- (void)_handleProgressWithBytesReceived:(unint64_t)a3 totalBytesRecieved:(unint64_t)a4 totalDownloadSize:(int64_t)a5 resuming:(BOOL)a6
{
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  if (sub_100033364(self) == 3) {
    sub_100032D34(self, 7);
  }
  [(BAURLDownload *)self setAmountDownloaded:a4];
  os_unfair_lock_unlock([(BADownload *)self downloadLock]);
  uint64_t v11 = [(BADownload *)self delegate];
  id v12 = (void *)v11;
  if (a6)
  {
    if (v11)
    {
      BOOL v13 = [(BADownload *)self delegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        v15 = [(BADownload *)self delegate];
        [v15 download:self didResumeAtOffset:a4 expectedTotalBytes:a5];
LABEL_10:
      }
    }
  }
  else if (v11)
  {
    id v16 = [(BADownload *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v15 = [(BADownload *)self delegate];
      [v15 download:self didWriteBytes:a3 totalBytesWritten:a4 totalBytesExpectedToWrite:a5];
      goto LABEL_10;
    }
  }
  os_unfair_lock_lock([(BADownload *)self downloadLock]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a6)
  {
    v19 = [(BADownload *)self applicationInfo];

    if (v19)
    {
      objc_opt_class();
      char v20 = objc_opt_isKindOfClass();
      int64_t v21 = [(BADownload *)self applicationInfo];
      id v22 = [v21 remainingDownloadAllowanceWithNecessity:-[BADownload necessity](self, "necessity") isManifest:v20 & 1];

      uint64_t v23 = [(BADownload *)self applicationInfo];
      unsigned __int8 v24 = [v23 consumeAllowanceShouldStopWithAdditionalBytes:a3 downloadNecessity:-[BADownload necessity](self, "necessity") isManifest:isKindOfClass & 1];

      if ((v24 & 1) != 0 || !v22)
      {
        uint64_t v25 = sub_100029C00(204);
        goto LABEL_24;
      }
    }
  }
  if ((sub_1000333AC(self) || (isKindOfClass & 1) == 0 && (id)[(BADownload *)self necessity] == (id)1)
    && sub_1000333AC(self) < a4)
  {
    uint64_t v25 = sub_100029CFC(@"BAURLDownloadErrorDomain", 101);
LABEL_24:
    id v27 = (void *)v25;
    [(BAURLDownload *)self setBailError:v25];

    os_unfair_lock_unlock([(BADownload *)self downloadLock]);
    [(BAURLDownload *)self cancelDownload];
    return;
  }
  unsigned __int8 v26 = [(BADownload *)self downloadLock];

  os_unfair_lock_unlock(v26);
}

- (void)_handleChallenge:(id)a3 authenticationHandler:(id)a4
{
  id v17 = a3;
  unsigned int v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [(BADownload *)self delegate];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(BADownload *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(BADownload *)self delegate];
      [v11 download:self didReceiveChallenge:v17 completionHandler:v6];
LABEL_7:

      goto LABEL_12;
    }
  }
  id v12 = [v17 protectionSpace];
  BOOL v13 = [v12 authenticationMethod];
  if ([v13 isEqualToString:NSURLAuthenticationMethodServerTrust])
  {
    id v14 = [v17 previousFailureCount];

    if (!v14)
    {
      uint64_t v11 = [v17 protectionSpace];
      v15 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v11 serverTrust]);
      v6[2](v6, 0, v15);

      goto LABEL_7;
    }
  }
  else
  {
  }
  if ([v17 previousFailureCount])
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    id v16 = [v17 proposedCredential];
    v6[2](v6, 0, v16);
  }
LABEL_12:
}

- (void)_informDelegateOfPausedDownloadWithWillImmediatelyResume:(BOOL)a3
{
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  sub_100032D34(self, 5);
  uint64_t v5 = [(BADownload *)self delegate];
  if (v5)
  {
    unsigned int v6 = (void *)v5;
    uint64_t v7 = [(BADownload *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(BADownload *)self responseQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100007608;
      block[3] = &unk_10005C998;
      block[4] = self;
      dispatch_async(v9, block);
    }
  }
  if (!a3) {
    [(BADownload *)self _removeActivityAndPowerAssertion];
  }
}

- (void)_informDelegateOfFailedDownloadWithError:(id)a3
{
}

- (void)_informDelegateOfFailedDownloadWithError:(id)a3 silentFailure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_assert_owner([(BADownload *)self downloadLock]);
  if (v4) {
    uint64_t v7 = -2;
  }
  else {
    uint64_t v7 = -1;
  }
  sub_100032D34(self, v7);
  [(BADownload *)self setDownloadError:v6];

  uint64_t v8 = [(BADownload *)self delegate];
  if (v8)
  {
    id v9 = (void *)v8;
    char v10 = [(BADownload *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(BADownload *)self responseQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000777C;
      block[3] = &unk_10005C998;
      block[4] = self;
      dispatch_async(v12, block);
    }
  }
  [(BADownload *)self _removeActivityAndPowerAssertion];
}

- (void)cancelDownload
{
}

- (void)cancelDownloadSilently
{
}

- (void)_cancelDownload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v5);
  if (sub_100033364(self) != 8)
  {
    id v6 = [(BADownload *)self session];

    if (v6)
    {
      if (v3) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 1;
      }
      [(BAURLDownload *)self setStopRequest:v7];
      sub_100032D34(self, 6);
      uint64_t v8 = [(BADownload *)self session];
      [v8 cancel];
    }
    else
    {
      uint64_t v8 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:0];
      [(BAURLDownload *)self _informDelegateOfFailedDownloadWithError:v8 silentFailure:v3];
    }
  }

  os_unfair_lock_unlock(v5);
}

- (void)pauseDownload
{
  BOOL v3 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v3);
  BOOL v4 = [(BADownload *)self session];

  if (v4)
  {
    [(BAURLDownload *)self setStopRequest:3];
    sub_100032D34(self, 4);
    uint64_t v5 = [(BADownload *)self session];
    [v5 cancel];
  }

  os_unfair_lock_unlock(v3);
}

- (void)promoteToForeground
{
  BOOL v3 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v3);
  if (![(BADownload *)self isForegroundDownload])
  {
    BOOL v4 = [(BADownload *)self session];

    if (v4)
    {
      [(BAURLDownload *)self setStopRequest:4];
      sub_100032D34(self, 4);
      uint64_t v5 = [(BADownload *)self session];
      [v5 cancel];
    }
  }

  os_unfair_lock_unlock(v3);
}

- (void)demoteToBackground
{
  BOOL v3 = [(BADownload *)self downloadLock];
  os_unfair_lock_lock(v3);
  if ([(BADownload *)self isForegroundDownload])
  {
    BOOL v4 = [(BADownload *)self session];

    if (v4)
    {
      [(BAURLDownload *)self setStopRequest:5];
      sub_100032D34(self, 4);
      uint64_t v5 = [(BADownload *)self session];
      [v5 cancel];
    }
  }

  os_unfair_lock_unlock(v3);
}

+ (BOOL)_cellularNetworkProhibitsDownloadUsingError:(id)a3
{
  BOOL v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:NSURLErrorNetworkUnavailableReasonKey];

  if (v5)
  {
    unsigned int v6 = [v5 intValue];
    if (v6 == 1)
    {
      uint64_t v7 = sub_100013C84();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = a1;
        uint64_t v8 = "Pausing download %{public}@ because our network is expensive.";
        goto LABEL_9;
      }
LABEL_10:

      BOOL v9 = 1;
      goto LABEL_11;
    }
    if (!v6)
    {
      uint64_t v7 = sub_100013C84();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543362;
        id v12 = a1;
        uint64_t v8 = "Pausing download %{public}@ because we are on cellular.";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (int64_t)stopRequest
{
  v2 = objc_getAssociatedObject(self, "stopRequest");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setStopRequest:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, "stopRequest", v4, (void *)1);
}

- (NSError)bailError
{
  return (NSError *)objc_getAssociatedObject(self, "bailError");
}

- (void)setBailError:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAURLDownload)init
{
  result = (BAURLDownload *)os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
  if (result)
  {
    int v3 = 136315138;
    id v4 = "BAURLDownload cannot be constructed using -init.";
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v3, 0xCu);
  }
  qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: BAURLDownload cannot be constructed using -init.";
  __break(1u);
  return result;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return [(BAURLDownload *)self initWithIdentifier:identifier request:request essential:0 fileSize:fileSize applicationGroupIdentifier:applicationGroupIdentifier priority:0];
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request essential:(BOOL)essential fileSize:(NSUInteger)fileSize applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  BOOL v11 = essential;
  id v14 = identifier;
  v15 = request;
  id v16 = applicationGroupIdentifier;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    CFStringRef v23 = @"request must be a URLRequest.";
    goto LABEL_7;
  }
  id v17 = [(NSURLRequest *)v15 URL];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    CFStringRef v23 = @"request must have a valid URL.";
    goto LABEL_7;
  }
  v19 = [(NSURLRequest *)v15 URL];
  char v20 = [v19 scheme];
  id v21 = [v20 caseInsensitiveCompare:@"https"];

  if (v21)
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    CFStringRef v23 = @"request can only download over HTTPS.";
LABEL_7:
    unsigned __int8 v24 = +[NSException exceptionWithName:v22 reason:v23 userInfo:0];
    [v24 raise];

    uint64_t v25 = 0;
    goto LABEL_8;
  }
  if (([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
  {
    NSExceptionName v22 = NSInvalidArgumentException;
    CFStringRef v23 = @"request must be secure coding compliant.";
    goto LABEL_7;
  }
  if (!v14)
  {
    id v27 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"identifier can not be nil" userInfo:0];
    [v27 raise];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"identifier must be a string." userInfo:0];
    [v28 raise];
  }
  v31.receiver = self;
  v31.super_class = (Class)BAURLDownload;
  id v29 = [(BADownload *)&v31 initPrivatelyWithApplicationGroupIdentifier:v16];
  v30 = v29;
  if (v29)
  {
    [v29 setRequest:v15];
    [v30 setIdentifier:v14];
    [v30 setNecessity:v11];
    [v30 setPriority:priority];
    sub_100032DA4(v30, fileSize);
  }
  self = v30;
  uint64_t v25 = self;
LABEL_8:

  return v25;
}

- (BAURLDownload)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BAURLDownload;
  uint64_t v5 = [(BADownload *)&v8 initWithCoder:v4];
  if (v5)
  {
    unsigned int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
    [(BAURLDownload *)v5 setRequest:v6];
  }
  return v5;
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier
{
  return [(BAURLDownload *)self initWithIdentifier:identifier request:request essential:0 fileSize:0 applicationGroupIdentifier:applicationGroupIdentifier priority:0];
}

- (BAURLDownload)initWithIdentifier:(NSString *)identifier request:(NSURLRequest *)request applicationGroupIdentifier:(NSString *)applicationGroupIdentifier priority:(BADownloaderPriority)priority
{
  return [(BAURLDownload *)self initWithIdentifier:identifier request:request essential:0 fileSize:0 applicationGroupIdentifier:applicationGroupIdentifier priority:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BAURLDownload;
  id v4 = [(BADownload *)&v7 copyWithZone:a3];
  uint64_t v5 = [(BAURLDownload *)self request];
  [v4 setRequest:v5];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BAURLDownload *)self request];
  [v4 encodeObject:v5 forKey:@"request"];

  v6.receiver = self;
  v6.super_class = (Class)BAURLDownload;
  [(BADownload *)&v6 encodeWithCoder:v4];
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)BAURLDownload;
  int v3 = [(BADownload *)&v8 debugDescription];
  id v4 = [v3 mutableCopy];

  uint64_t v5 = [(BAURLDownload *)self request];
  objc_super v6 = [v5 URL];
  [v4 appendFormat:@"URL: %@\n", v6];

  return v4;
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequest:(id)a3
{
}

- (unint64_t)amountDownloaded
{
  return self->_amountDownloaded;
}

- (void)setAmountDownloaded:(unint64_t)a3
{
  self->_amountDownloaded = a3;
}

- (void).cxx_destruct
{
}

@end