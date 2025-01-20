@interface MSDBackgroundDownload
+ (id)sharedInstance;
- (BOOL)freezeBackgroundDownload;
- (BOOL)isBackgroundDownloadQueueEmpty;
- (MSDBundleProgressTracker)bundleDownloadInProgress;
- (MSDComponentManager)componentManager;
- (MSDTargetDevice)device;
- (NSString)bgDownloadPauseReason;
- (id)initiateBackgroundDownload;
- (int64_t)bgDownloadPauseStartTime;
- (void)_abortBackgroundDownload;
- (void)_pauseBackgroundDownloadForReason:(id)a3;
- (void)_resumeBackgroundDownload;
- (void)_sendDownloadStatusUpdateNotification;
- (void)didReceiveNewPauseStatus:(BOOL)a3 forReason:(id)a4;
- (void)kickOffBackgroundDownload;
- (void)quitBackgroundDownload;
- (void)setBgDownloadPauseReason:(id)a3;
- (void)setBgDownloadPauseStartTime:(int64_t)a3;
- (void)setBundleDownloadInProgress:(id)a3;
- (void)setComponentManager:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFreezeBackgroundDownload:(BOOL)a3;
- (void)setIsBackgroundDownloadQueueEmpty:(BOOL)a3;
@end

@implementation MSDBackgroundDownload

+ (id)sharedInstance
{
  if (qword_100189B68 != -1) {
    dispatch_once(&qword_100189B68, &stru_100153468);
  }
  v2 = (void *)qword_100189B60;

  return v2;
}

- (void)kickOffBackgroundDownload
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(MSDBackgroundDownload *)v2 isBackgroundDownloadQueueEmpty])
  {
    [(MSDBackgroundDownload *)v2 setIsBackgroundDownloadQueueEmpty:0];
    v3 = +[MSDWorkQueueSet sharedInstance];
    v4 = [v3 backgroundDownloadQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007D860;
    block[3] = &unk_100151AF0;
    block[4] = v2;
    dispatch_async(v4, block);
  }
  else
  {
    v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Background download is already scheduled, skipping call to schedule background donwload", buf, 2u);
    }
  }

  objc_sync_exit(v2);
}

- (id)initiateBackgroundDownload
{
  v3 = [(MSDBackgroundDownload *)self device];
  v4 = [v3 retrieveSignedManifest];

  if (v4)
  {
    uint64_t v5 = [(MSDBackgroundDownload *)self bundleDownloadInProgress];
    if (!v5
      || (v6 = (void *)v5,
          [(MSDBackgroundDownload *)self bundleDownloadInProgress],
          v7 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v8 = +[MSDBundleProgressTracker isBundleInstance:v7 identicalWithNewBundle:v4], v7, v6, (v8 & 1) == 0))
    {
      v9 = [(MSDBackgroundDownload *)self device];
      [v9 cleanUpBackgroundState:1];

      v10 = +[MSDProgressUpdater sharedInstance];
      [v10 startBundleUpdateMonitor:v4 inMode:1];

      v11 = +[MSDProgressUpdater sharedInstance];
      v12 = [v11 backgroundBundle];
      [(MSDBackgroundDownload *)self setBundleDownloadInProgress:v12];

      v13 = [(MSDBackgroundDownload *)self device];
      [v13 setBackgroundDownloadActive:1];
    }
    v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "signedManifest in background download: %{public}@", (uint8_t *)&v17, 0xCu);
    }

    id v15 = v4;
  }

  return v4;
}

- (void)quitBackgroundDownload
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000D4428(self, v3);
  }

  [(MSDBackgroundDownload *)self _abortBackgroundDownload];
  v4 = [(MSDBackgroundDownload *)self bundleDownloadInProgress];
  [v4 stopBundleUpdateTimer];
}

- (void)_abortBackgroundDownload
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MSDBackgroundDownload *)v2 device];
  id v4 = [v3 backgroundDownloadState];

  if (v4 == (id)1)
  {
    uint64_t v5 = [(MSDBackgroundDownload *)v2 device];
    [v5 setBackgroundDownloadState:2];

    v6 = [(MSDBackgroundDownload *)v2 device];
    [v6 setBackgroundDownloadActive:0];

    v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Aborting background download...", v10, 2u);
    }

    if ([(MSDBackgroundDownload *)v2 freezeBackgroundDownload])
    {
      unsigned __int8 v8 = [(MSDBackgroundDownload *)v2 componentManager];
      [v8 resumeProcessing];
    }
    v9 = [(MSDBackgroundDownload *)v2 componentManager];
    [v9 abortProcessing];
  }
  objc_sync_exit(v2);
}

- (void)_pauseBackgroundDownloadForReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (![(MSDBackgroundDownload *)v5 freezeBackgroundDownload])
  {
    v6 = [(MSDBackgroundDownload *)v5 bundleDownloadInProgress];
    unsigned int v7 = [v6 bundleState];

    if (v7 == 1)
    {
      [(MSDBackgroundDownload *)v5 setFreezeBackgroundDownload:1];
      unsigned __int8 v8 = sub_100068600();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Pausing background download for reason: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      [(MSDBackgroundDownload *)v5 setBgDownloadPauseReason:v4];
      v9 = +[NSDate now];
      [v9 timeIntervalSince1970];
      [(MSDBackgroundDownload *)v5 setBgDownloadPauseStartTime:(uint64_t)v10];

      v11 = [(MSDBackgroundDownload *)v5 bundleDownloadInProgress];
      [v11 stopBundleUpdateTimer];

      [(MSDBackgroundDownload *)v5 _sendDownloadStatusUpdateNotification];
      v12 = [(MSDBackgroundDownload *)v5 componentManager];
      [v12 pauseProcessing];
    }
  }
  objc_sync_exit(v5);
}

- (void)_resumeBackgroundDownload
{
  v2 = self;
  objc_sync_enter(v2);
  if ([(MSDBackgroundDownload *)v2 freezeBackgroundDownload])
  {
    v3 = [(MSDBackgroundDownload *)v2 bundleDownloadInProgress];
    unsigned int v4 = [v3 bundleState];

    if (v4 == 1)
    {
      [(MSDBackgroundDownload *)v2 setFreezeBackgroundDownload:0];
      uint64_t v5 = sub_100068600();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resuming background download...", v14, 2u);
      }

      v6 = +[NSDate dateWithTimeIntervalSince1970:(double)[(MSDBackgroundDownload *)v2 bgDownloadPauseStartTime]];
      unsigned int v7 = +[NSDate now];
      [v7 timeIntervalSinceDate:v6];
      double v9 = v8;

      double v10 = +[MSDAnalyticsEventHandler sharedInstance];
      v11 = [(MSDBackgroundDownload *)v2 bgDownloadPauseReason];
      [v10 sendBgDownloadPausedEvent:(uint64_t)v9 forReason:v11];

      v12 = [(MSDBackgroundDownload *)v2 bundleDownloadInProgress];
      [v12 startBundleUpdateTimer];

      [(MSDBackgroundDownload *)v2 _sendDownloadStatusUpdateNotification];
      int v13 = [(MSDBackgroundDownload *)v2 componentManager];
      [v13 resumeProcessing];
    }
  }
  objc_sync_exit(v2);
}

- (void)_sendDownloadStatusUpdateNotification
{
  id v5 = +[NSNotificationCenter defaultCenter];
  v3 = +[NSNumber numberWithBool:[(MSDBackgroundDownload *)self freezeBackgroundDownload]];
  unsigned int v4 = +[NSDictionary dictionaryWithObjectsAndKeys:v3, @"kMSDDownloadPausedKey", 0];

  [v5 postNotificationName:@"MSDNotificationPauseDownload" object:0 userInfo:v4];
}

- (void)didReceiveNewPauseStatus:(BOOL)a3 forReason:(id)a4
{
  if (a3) {
    [(MSDBackgroundDownload *)self _pauseBackgroundDownloadForReason:a4];
  }
  else {
    [(MSDBackgroundDownload *)self _resumeBackgroundDownload];
  }
}

- (MSDTargetDevice)device
{
  return (MSDTargetDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevice:(id)a3
{
}

- (BOOL)freezeBackgroundDownload
{
  return self->_freezeBackgroundDownload;
}

- (void)setFreezeBackgroundDownload:(BOOL)a3
{
  self->_freezeBackgroundDownload = a3;
}

- (BOOL)isBackgroundDownloadQueueEmpty
{
  return self->_isBackgroundDownloadQueueEmpty;
}

- (void)setIsBackgroundDownloadQueueEmpty:(BOOL)a3
{
  self->_isBackgroundDownloadQueueEmpty = a3;
}

- (MSDBundleProgressTracker)bundleDownloadInProgress
{
  return (MSDBundleProgressTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleDownloadInProgress:(id)a3
{
}

- (int64_t)bgDownloadPauseStartTime
{
  return self->_bgDownloadPauseStartTime;
}

- (void)setBgDownloadPauseStartTime:(int64_t)a3
{
  self->_bgDownloadPauseStartTime = a3;
}

- (NSString)bgDownloadPauseReason
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBgDownloadPauseReason:(id)a3
{
}

- (MSDComponentManager)componentManager
{
  return (MSDComponentManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setComponentManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentManager, 0);
  objc_storeStrong((id *)&self->_bgDownloadPauseReason, 0);
  objc_storeStrong((id *)&self->_bundleDownloadInProgress, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end