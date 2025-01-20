@interface NDAVAssetDownloadSessionWrapper
- (AVAssetDownloadSession)downloadSession;
- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads;
- (BOOL)progressTimerRunning;
- (NDAVAssetDownloadSessionWrapper)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7;
- (NDAVAssetDownloadSessionWrapper)initWithURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7;
- (NDAVAssetDownloadSessionWrapperDelegate)delegate;
- (NSDictionary)options;
- (NSURL)URL;
- (NSURL)destinationURL;
- (OS_dispatch_queue)delegateQueue;
- (unint64_t)countOfBytesExpectedToWrite;
- (unint64_t)countOfBytesWritten;
- (unint64_t)downloadToken;
- (unint64_t)taskIdentifier;
- (void)assetDownloadSession:(id)a3 didFailWithError:(id)a4;
- (void)assetDownloadSession:(id)a3 didFinishDownloadForMediaSelection:(id)a4;
- (void)assetDownloadSession:(id)a3 didLoadTimeRange:(id *)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id *)a6 forMediaSelection:(id)a7;
- (void)assetDownloadSession:(id)a3 didResolveMediaSelection:(id)a4;
- (void)assetDownloadSession:(id)a3 didUpdateProgressWithExpectedBytes:(unint64_t)a4 bytesDownloaded:(unint64_t)a5;
- (void)assetDownloadSession:(id)a3 willDownloadVariants:(id)a4;
- (void)assetDownloadSessionDidFinishDownload:(id)a3;
- (void)cancel;
- (void)cancelAndDeliverError:(id)a3;
- (void)disavowSession;
- (void)releasePowerAssertion;
- (void)resume;
- (void)setCountOfBytesExpectedToWrite:(unint64_t)a3;
- (void)setCountOfBytesWritten:(unint64_t)a3;
- (void)setDownloadSession:(id)a3;
- (void)setProgressTimerRunning:(BOOL)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)startLoadingMetadata;
- (void)suspend;
- (void)takePowerAssertion;
@end

@implementation NDAVAssetDownloadSessionWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_downloadSession, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setProgressTimerRunning:(BOOL)a3
{
  self->_progressTimerRunning = a3;
}

- (BOOL)progressTimerRunning
{
  return self->_progressTimerRunning;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setCountOfBytesExpectedToWrite:(unint64_t)a3
{
  self->_countOfBytesExpectedToWrite = a3;
}

- (unint64_t)countOfBytesExpectedToWrite
{
  return self->_countOfBytesExpectedToWrite;
}

- (void)setCountOfBytesWritten:(unint64_t)a3
{
  self->_countOfBytesWritten = a3;
}

- (unint64_t)countOfBytesWritten
{
  return self->_countOfBytesWritten;
}

- (unint64_t)downloadToken
{
  return self->_downloadToken;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 72, 1);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (NDAVAssetDownloadSessionWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDAVAssetDownloadSessionWrapperDelegate *)WeakRetained;
}

- (void)setDownloadSession:(id)a3
{
}

- (AVAssetDownloadSession)downloadSession
{
  return (AVAssetDownloadSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)assetDownloadSession:(id)a3 willDownloadVariants:(id)a4
{
  id v5 = a4;
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022564;
  v8[3] = &unk_1000B63D0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(delegateQueue, v8);
}

- (void)assetDownloadSession:(id)a3 didUpdateProgressWithExpectedBytes:(unint64_t)a4 bytesDownloaded:(unint64_t)a5
{
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022644;
  block[3] = &unk_1000B5128;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  dispatch_async(delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 didResolveMediaSelection:(id)a4
{
  id v5 = a4;
  delegateQueue = self->_delegateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002279C;
  v8[3] = &unk_1000B63D0;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(delegateQueue, v8);
}

- (void)assetDownloadSession:(id)a3 didFinishDownloadForMediaSelection:(id)a4
{
  id v5 = a4;
  v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AVAssetDownloadSession download finished for media selection", buf, 2u);
  }
  delegateQueue = self->_delegateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022928;
  v9[3] = &unk_1000B63D0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(delegateQueue, v9);
}

- (void)assetDownloadSession:(id)a3 didLoadTimeRange:(id *)a4 totalTimeRangesLoaded:(id)a5 timeRangeExpectedToLoad:(id *)a6 forMediaSelection:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  long long v14 = *(_OWORD *)&a4->var0.var3;
  long long v23 = *(_OWORD *)&a4->var0.var0;
  long long v24 = v14;
  long long v15 = *(_OWORD *)&a6->var0.var0;
  long long v16 = *(_OWORD *)&a6->var0.var3;
  long long v25 = *(_OWORD *)&a4->var1.var1;
  long long v26 = v15;
  block[2] = sub_100022AA8;
  block[3] = &unk_1000B5100;
  long long v17 = *(_OWORD *)&a6->var1.var1;
  long long v27 = v16;
  long long v28 = v17;
  block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(delegateQueue, block);
}

- (void)assetDownloadSession:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AVAssetDownloadSession download failed", buf, 2u);
  }
  delegateQueue = self->_delegateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022C98;
  v9[3] = &unk_1000B63D0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(delegateQueue, v9);
}

- (void)assetDownloadSessionDidFinishDownload:(id)a3
{
  v4 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AVAssetDownloadSession download complete", buf, 2u);
  }
  delegateQueue = self->_delegateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022DC4;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)startLoadingMetadata
{
  id v2 = [(NDAVAssetDownloadSessionWrapper *)self downloadSession];
  [v2 startLoadingMetadata];
}

- (void)cancelAndDeliverError:(id)a3
{
  id v5 = a3;
  [(NDAVAssetDownloadSessionWrapper *)self cancel];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained NDAVAssetDownloadSessionWrapper:self didCompleteWithError:v5];
}

- (void)cancel
{
  v3 = [(NDAVAssetDownloadSessionWrapper *)self downloadSession];
  [v3 stop];

  [(NDAVAssetDownloadSessionWrapper *)self disavowSession];
}

- (void)suspend
{
  v3 = [(NDAVAssetDownloadSessionWrapper *)self downloadSession];
  [v3 pause];

  [(NDAVAssetDownloadSessionWrapper *)self releasePowerAssertion];
}

- (void)resume
{
  [(NDAVAssetDownloadSessionWrapper *)self takePowerAssertion];
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting AVAssetDownloadSession", v5, 2u);
  }
  v4 = [(NDAVAssetDownloadSessionWrapper *)self downloadSession];
  [v4 start];
}

- (void)releasePowerAssertion
{
  id v2 = self;
  objc_sync_enter(v2);
  IOPMAssertionID powerAssertion = v2->_powerAssertion;
  if (powerAssertion)
  {
    v4 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t downloadToken = v2->_downloadToken;
      unint64_t taskIdentifier = v2->_taskIdentifier;
      int v7 = 134218240;
      unint64_t v8 = downloadToken;
      __int16 v9 = 2048;
      unint64_t v10 = taskIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Releasing power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu", (uint8_t *)&v7, 0x16u);
      IOPMAssertionID powerAssertion = v2->_powerAssertion;
    }
    IOPMAssertionRelease(powerAssertion);
    v2->_IOPMAssertionID powerAssertion = 0;
  }
  objc_sync_exit(v2);
}

- (void)takePowerAssertion
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_powerAssertion)
  {
    v3 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t downloadToken = v2->_downloadToken;
      unint64_t taskIdentifier = v2->_taskIdentifier;
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = downloadToken;
      __int16 v17 = 2048;
      unint64_t v18 = taskIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Taking power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu", buf, 0x16u);
    }
    v6 = [(NSDictionary *)v2->_options objectForKeyedSubscript:AVAssetDownloadSessionClientBundleIdentifierKey];
    v13[0] = @"AssertType";
    v13[1] = @"AssertLevel";
    v14[0] = @"PreventUserIdleSystemSleep";
    v14[1] = &off_1000B8950;
    v13[2] = @"AssertName";
    int v7 = +[NSString stringWithFormat:@"AVAssetDownloadSessionWrapper %llu (%@)", v2->_downloadToken, v6];
    v14[2] = v7;
    v14[3] = &off_1000B8968;
    v13[3] = @"TimeoutSeconds";
    v13[4] = @"TimeoutAction";
    v14[4] = @"TimeoutActionTurnOff";
    CFDictionaryRef v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];

    IOPMAssertionID AssertionID = 0;
    if (IOPMAssertionCreateWithProperties(v8, &AssertionID))
    {
      __int16 v9 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        unint64_t v10 = v2->_downloadToken;
        unint64_t v11 = v2->_taskIdentifier;
        *(_DWORD *)buf = 134218240;
        unint64_t v16 = v10;
        __int16 v17 = 2048;
        unint64_t v18 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to take power assertion for AVAssetDownloadSessionWrapper %llu with taskIdentifier %lu", buf, 0x16u);
      }
    }
    else
    {
      v2->_IOPMAssertionID powerAssertion = AssertionID;
    }
  }
  objc_sync_exit(v2);
}

- (void)disavowSession
{
  [(NDAVAssetDownloadSessionWrapper *)self releasePowerAssertion];
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%p Disavowing AVAssetDownloadSession", (uint8_t *)&v5, 0xCu);
  }
  [(NDAVAssetDownloadSessionWrapper *)self setDownloadSession:0];
  callbackQueue = self->_callbackQueue;
  self->_callbackQueue = 0;
}

- (NDAVAssetDownloadSessionWrapper)initWithURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v52 = a4;
  id v14 = a5;
  id v53 = a6;
  id v51 = a7;
  v63.receiver = self;
  v63.super_class = (Class)NDAVAssetDownloadSessionWrapper;
  long long v15 = [(NDAVAssetDownloadSessionWrapper *)&v63 init];
  v54 = v15;
  if (!v15) {
    goto LABEL_34;
  }
  objc_storeStrong((id *)&v15->_asset, a3);
  objc_storeStrong((id *)&v54->_destinationURL, a4);
  if (v14)
  {
    unint64_t v16 = [v14 objectForKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionArrayKey"];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v19 = 0;
    }
    else
    {
      v49 = [v14 objectForKey:@"AVAssetDownloadSessionMediaSelectionArrayKey"];
      id v18 = [v14 mutableCopy];
      id v19 = +[NSMutableArray array];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v20 = v49;
      id v21 = [v20 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v60;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v60 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = [objc_alloc((Class)AVMediaSelection) initWithAsset:v13 propertyList:*(void *)(*((void *)&v59 + 1) + 8 * i)];
            if (v24) {
              [v19 addObject:v24];
            }
          }
          id v21 = [v20 countByEnumeratingWithState:&v59 objects:v65 count:16];
        }
        while (v21);
      }

      [v18 setObject:v19 forKeyedSubscript:@"AVAssetDownloadSessionMediaSelectionArrayKey"];
      if (!v18) {
        goto LABEL_30;
      }
      id v14 = v18;
    }
    long long v25 = [v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
    BOOL v26 = v25 == 0;

    if (v26) {
      goto LABEL_28;
    }
    v48 = [v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
    id v50 = [v14 mutableCopy];
    long long v27 = +[NSMutableArray array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v28 = v48;
    id v29 = [v28 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v56;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v28);
          }
          id v32 = [objc_alloc((Class)AVMediaSelection) initWithAsset:v13 propertyList:*(void *)(*((void *)&v55 + 1) + 8 * (void)j)];
          if (v32) {
            [v27 addObject:v32];
          }
        }
        id v29 = [v28 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v29);
    }

    [v50 setObject:v27 forKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionsForMultichannelKey"];
    id v14 = v50;
    if (v50)
    {
LABEL_28:
      v33 = [v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"];
      BOOL v34 = v33 == 0;

      if (v34)
      {
        id v36 = v14;
      }
      else
      {
        v35 = [v14 objectForKeyedSubscript:@"AVAssetDownloadTaskMediaSelectionKey"];
        id v36 = [v14 mutableCopy];
        id v37 = [objc_alloc((Class)AVMediaSelection) initWithAsset:v13 propertyList:v35];
        [v36 setObject:v37 forKeyedSubscript:AVAssetDownloadSessionMediaSelectionKey];
        [v36 removeObjectForKey:@"AVAssetDownloadTaskMediaSelectionKey"];
      }
      goto LABEL_31;
    }
  }
  else
  {
    id v19 = 0;
  }
LABEL_30:
  id v36 = 0;
LABEL_31:
  id v38 = [v36 mutableCopy];
  v39 = [v38 objectForKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"];
  BOOL v40 = v39 == 0;

  if (!v40)
  {
    v41 = [v38 objectForKeyedSubscript:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"];
    [v38 setObject:v41 forKeyedSubscript:AVAssetDownloadSessionMinimumRequiredMediaBitrateKey];

    [v38 removeObjectForKey:@"AVAssetDownloadTaskMinimumRequiredMediaBitrateKey"];
  }
  id v14 = v38;

  objc_storeStrong((id *)&v54->_options, v38);
  objc_storeWeak((id *)&v54->_delegate, v53);
  objc_storeStrong((id *)&v54->_delegateQueue, a7);
  uint64_t v42 = +[AVAssetDownloadSession assetDownloadSessionWithAsset:v13 mediaSelections:v19 destinationURL:v52 options:v14];
  downloadSession = v54->_downloadSession;
  v54->_downloadSession = (AVAssetDownloadSession *)v42;

  v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v45 = dispatch_queue_create("com.apple.nsurlsessionf.avassetdownloadersessionwrappercallback", v44);
  callbackQueue = v54->_callbackQueue;
  v54->_callbackQueue = (OS_dispatch_queue *)v45;

  [(AVAssetDownloadSession *)v54->_downloadSession setDelegate:v54 queue:v54->_callbackQueue];
  v54->_unint64_t downloadToken = (unint64_t)[(AVAssetDownloadSession *)v54->_downloadSession downloadToken];

LABEL_34:
  return v54;
}

- (NDAVAssetDownloadSessionWrapper)initWithURL:(id)a3 destinationURL:(id)a4 options:(id)a5 delegate:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v25 = a7;
  v26.receiver = self;
  v26.super_class = (Class)NDAVAssetDownloadSessionWrapper;
  BOOL v17 = [(NDAVAssetDownloadSessionWrapper *)&v26 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_URL, a3);
    objc_storeStrong((id *)&v18->_destinationURL, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeWeak((id *)&v18->_delegate, v16);
    objc_storeStrong((id *)&v18->_delegateQueue, a7);
    uint64_t v19 = +[AVAssetDownloadSession assetDownloadSessionWithURL:v13 destinationURL:v14 options:v15];
    downloadSession = v18->_downloadSession;
    v18->_downloadSession = (AVAssetDownloadSession *)v19;

    if (v18->_downloadSession)
    {
      id v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v22 = dispatch_queue_create("com.apple.nsurlsessionf.avassetdownloadersessionwrappercallback", v21);
      callbackQueue = v18->_callbackQueue;
      v18->_callbackQueue = (OS_dispatch_queue *)v22;

      [(AVAssetDownloadSession *)v18->_downloadSession setDelegate:v18 queue:v18->_callbackQueue];
      v18->_unint64_t downloadToken = (unint64_t)[(AVAssetDownloadSession *)v18->_downloadSession downloadToken];
    }
    else
    {

      id v18 = 0;
    }
  }

  return v18;
}

- (BOOL)doesAVAssetDownloadSessionSupportMultipleDownloads
{
  return objc_opt_respondsToSelector() & 1;
}

@end