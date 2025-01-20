@interface MZUniversalPlaybackPositionStore
+ (id)keyValueStoreItemIdentifierForItem:(id)a3;
- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive;
- (BOOL)_automaticallySynchronizeOnBecomeActive;
- (BOOL)_timerIsStopped;
- (BOOL)canRequestStoreSignIn;
- (BOOL)hasLocalChangesToSync;
- (BOOL)initialAutosyncNeeded;
- (BOOL)isActive;
- (BOOL)refreshTimerActive;
- (MZAsynchronousTask)bagLookupTask;
- (MZUPPAsynchronousTask)synchronizeTask;
- (MZUniversalPlaybackPositionDataSource)dataSource;
- (MZUniversalPlaybackPositionStore)init;
- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3;
- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3 isActive:(BOOL)a4;
- (MZUniversalPlaybackPositionSyncHandler)syncHandler;
- (NSDate)dateToFireNextTimer;
- (NSTimer)timer;
- (OS_dispatch_queue)queue;
- (double)_effectiveAutorefreshRate;
- (double)autorefreshRate;
- (double)bagSpecifiedPollingInterval;
- (id)_accountForSyncing;
- (id)prefsObserver;
- (unint64_t)automaticSynchronizeOptions;
- (void)_grabBagWithCompletionBlock:(id)a3;
- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3;
- (void)_onQueueResumeTimer;
- (void)_onQueueScheduleTimer;
- (void)_onQueueSetHasLocalChangesToSync:(BOOL)a3;
- (void)_onQueueStartNewTimer;
- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3;
- (void)_onQueueStopTimer;
- (void)_onQueueSuspendTimer;
- (void)_onQueueSynchronizeImmediatelyWithCompletionBlock:(id)a3;
- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)_onQueueUpdateTimerForActiveChanges;
- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges;
- (void)_timerFired:(id)a3;
- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3;
- (void)_updateForStoreAccountsChange;
- (void)_updateSettingsFromLoadedBagContext:(id)a3;
- (void)becomeActive;
- (void)checkForAvailabilityWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)resignActive;
- (void)setAutomaticSynchronizeOptions:(unint64_t)a3;
- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3;
- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3;
- (void)setAutorefreshRate:(double)a3;
- (void)setBagLookupTask:(id)a3;
- (void)setBagSpecifiedPollingInterval:(double)a3;
- (void)setCanRequestStoreSignIn:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDateToFireNextTimer:(id)a3;
- (void)setHasLocalChangesToSync:(BOOL)a3;
- (void)setInitialAutosyncNeeded:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setPrefsObserver:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRefreshTimerActive:(BOOL)a3;
- (void)setSyncHandler:(id)a3;
- (void)setSynchronizeTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)startUPPSyncTimer;
- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3;
@end

@implementation MZUniversalPlaybackPositionStore

- (void)_onQueueScheduleTimer
{
  if (+[MTPrivacyUtil privacyAcknowledgementNeeded])
  {
    v3 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Cannot schedule UPPSync timer. Privacy acknowledgement needed.", buf, 2u);
    }
  }
  else if (!self->_refreshTimerActive)
  {
    self->_refreshTimerActive = 1;
    v4 = [(MZUniversalPlaybackPositionStore *)self dateToFireNextTimer];
    [v4 timeIntervalSinceNow];
    uint64_t v6 = v5;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009D754;
    v7[3] = &unk_10054EB68;
    v7[5] = v6;
    v7[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (double)_effectiveAutorefreshRate
{
  +[MZUPPBagContext defaultPollingInterval];
  double v4 = v3 / 60.0;
  uint64_t v5 = +[MZPreferences storeBookkeeperPreferences];
  uint64_t v6 = +[NSNumber numberWithDouble:v4];
  v7 = [v5 objectForKey:@"AutoSyncRateInMinutes" withDefaultValue:v6];
  [v7 floatValue];
  float v9 = v8;

  if (v4 != v9) {
    return (float)(v9 * 60.0);
  }
  double result = self->_bagSpecifiedPollingInterval;
  if (result <= 0.00000011920929) {
    return (float)(v9 * 60.0);
  }
  return result;
}

- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3 isActive:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)MZUniversalPlaybackPositionStore;
  id v6 = [(MZUniversalPlaybackPositionStore *)&v22 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("MZUniversalPlaybackPositionStore.queue", 0);
    float v8 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v7;

    *((unsigned char *)v6 + 11) = a4;
    *((void *)v6 + 3) = 3;
    [v6 _updateAutorefreshRateSettingAndRestartTimer:0];
    +[MZUPPBagContext defaultPollingInterval];
    *((void *)v6 + 12) = v9;
    if (a3 <= 0.0) {
      a3 = *((double *)v6 + 11);
    }
    *((unsigned char *)v6 + 12) = a3 > 0.0;
    v10 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    [v6 setDateToFireNextTimer:v10];

    v11 = *((void *)v6 + 9);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100058C14;
    block[3] = &unk_10054D570;
    v12 = v6;
    id v21 = v12;
    dispatch_sync(v11, block);
    v13 = +[NSNotificationCenter defaultCenter];
    objc_initWeak(&location, v12);
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v12 selector:"_updateForStoreAccountsChange" name:ACDAccountStoreDidChangeNotification object:0];

    v15 = +[NSOperationQueue mainQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10009B4B4;
    v17[3] = &unk_10054E628;
    objc_copyWeak(&v18, &location);
    v12[10] = [v13 addObserverForName:@"MZPreferencesDidChangeNotification" object:0 queue:v15 usingBlock:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return (MZUniversalPlaybackPositionStore *)v6;
}

- (void)setDateToFireNextTimer:(id)a3
{
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (MZUniversalPlaybackPositionDataSource *)a3;
}

- (void)setAutorefreshRate:(double)a3
{
  self->_autorefreshRate = a3;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (MZUniversalPlaybackPositionStore)init
{
  return [(MZUniversalPlaybackPositionStore *)self initWithInitialUpdateDelay:1 isActive:-1.0];
}

- (void)_updateAutorefreshRateSettingAndRestartTimer:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058B70;
  v4[3] = &unk_10054D960;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (MZUniversalPlaybackPositionStore)initWithInitialUpdateDelay:(double)a3
{
  return [(MZUniversalPlaybackPositionStore *)self initWithInitialUpdateDelay:1 isActive:a3];
}

- (void)dealloc
{
  [(MZUniversalPlaybackPositionStore *)self setSyncHandler:0];
  double v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self->_prefsObserver];

  BOOL v5 = [(MZUniversalPlaybackPositionStore *)self bagLookupTask];
  [v5 invalidate];

  [(MZUniversalPlaybackPositionStore *)self setBagLookupTask:0];
  id v6 = [(MZUniversalPlaybackPositionStore *)self synchronizeTask];
  [v6 invalidate];

  [(MZUniversalPlaybackPositionStore *)self setSynchronizeTask:0];
  [(MZUniversalPlaybackPositionStore *)self setDateToFireNextTimer:0];
  dispatch_queue_t v7 = [(MZUniversalPlaybackPositionStore *)self timer];
  [v7 invalidate];

  [(MZUniversalPlaybackPositionStore *)self setTimer:0];
  [(MZUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
  v8.receiver = self;
  v8.super_class = (Class)MZUniversalPlaybackPositionStore;
  [(MZUniversalPlaybackPositionStore *)&v8 dealloc];
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  return +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:a3];
}

- (void)_onQueueUpdateTimerForActiveChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 1) != 0)
  {
    if ([(MZUniversalPlaybackPositionStore *)self _automaticallySynchronizeOnBecomeActive])
    {
      -[MZUniversalPlaybackPositionStore _onQueueStartNewTimerWithTimeIntervalSinceNow:](self, "_onQueueStartNewTimerWithTimeIntervalSinceNow:");
    }
    else
    {
      [(MZUniversalPlaybackPositionStore *)self _onQueueResumeTimer];
    }
  }
  else
  {
    [(MZUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
  }
}

- (void)_onQueueUpdateTimerForAutomaticSyncOptionChanges
{
  if (self->_isActive && (self->_automaticSynchronizeOptions & 1) != 0) {
    [(MZUniversalPlaybackPositionStore *)self _onQueueResumeTimer];
  }
  else {
    [(MZUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
  }
}

- (void)becomeActive
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B73C;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)resignActive
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B808;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setAutomaticSynchronizeOptions:(unint64_t)a3
{
  if (self->_automaticSynchronizeOptions != a3) {
    self->_automaticSynchronizeOptions = a3;
  }
}

- (void)_onQueueSetHasLocalChangesToSync:(BOOL)a3
{
  self->_hasLocalChangesToSync = a3;
}

- (void)setHasLocalChangesToSync:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009B9BC;
  v4[3] = &unk_10054D960;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)setAutomaticallySynchronizeLocalChangesOnResignActive:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(MZUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v6 = 2;
  if (!v3) {
    uint64_t v6 = 0;
  }

  [(MZUniversalPlaybackPositionStore *)self setAutomaticSynchronizeOptions:v5 | v6];
}

- (BOOL)_automaticallySynchronizeLocalChangesOnResignActive
{
  return ([(MZUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] >> 1) & 1;
}

- (void)setAutomaticallySynchronizeOnBecomeActive:(BOOL)a3
{
  unint64_t v4 = [(MZUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(MZUniversalPlaybackPositionStore *)self setAutomaticSynchronizeOptions:v4];
}

- (BOOL)_automaticallySynchronizeOnBecomeActive
{
  return [(MZUniversalPlaybackPositionStore *)self automaticSynchronizeOptions] & 1;
}

- (void)synchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009BB3C;
  v7[3] = &unk_10054D738;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)checkForAvailabilityWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009BCDC;
    v7[3] = &unk_10054D738;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
}

- (void)_onQueueSynchronizeWithAutosynchronizeMask:(unint64_t)a3 withCompletionBlock:(id)a4
{
  self->_initialAutosyncNeeded = 0;
  [(MZUniversalPlaybackPositionStore *)self _onQueueSynchronizeImmediatelyWithCompletionBlock:a4];
}

- (void)_onQueueSynchronizeImmediatelyWithCompletionBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MZUniversalPlaybackPositionStore *)self _accountForSyncing];

  if (v5)
  {
    synchronizeTask = self->_synchronizeTask;
    dispatch_queue_t v7 = _MTLogCategoryUPPSync();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (synchronizeTask)
    {
      if (v8)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_onQueueSync - UPP synchronize already in progress.  pending our completion block to be notified when it completes.", (uint8_t *)&buf, 2u);
      }

      [(MZAsynchronousTask *)self->_synchronizeTask addTaskCompletionBlock:v4];
    }
    else
    {
      if (v8)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_onQueueSync - UPP synchronize beginning sync operation...", (uint8_t *)&buf, 2u);
      }

      objc_initWeak(&buf, self);
      [(MZUniversalPlaybackPositionStore *)self _onQueueStopTimer];
      v11 = [MZUPPAsynchronousTask alloc];
      v12 = [(MZUPPAsynchronousTask *)v11 initWithHandlerQueue:self->_queue taskTimeout:@"MZUPPStore Synchronize" assertionTimeout:0 debugDescription:20.0 reportMetrics:*(double *)&qword_10061A940];
      v13 = self->_synchronizeTask;
      self->_synchronizeTask = v12;

      v14 = self->_synchronizeTask;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10009C1B8;
      v23[3] = &unk_10054E8E0;
      objc_copyWeak(&v24, &buf);
      [(MZAsynchronousTask *)v14 setExpirationHandler:v23];
      v15 = self->_synchronizeTask;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10009C28C;
      v21[3] = &unk_10054E8E0;
      objc_copyWeak(&v22, &buf);
      [(MZAsynchronousTask *)v15 setFinishedHandler:v21];
      [(MZAsynchronousTask *)self->_synchronizeTask addTaskCompletionBlock:v4];
      kdebug_trace();
      +[NSDate timeIntervalSinceReferenceDate];
      double v17 = v16;
      id v18 = [(MZUPPAsynchronousTask *)self->_synchronizeTask metrics];
      [v18 setBagLookupStartTime:v17];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10009C450;
      v19[3] = &unk_10054F540;
      objc_copyWeak(&v20, &buf);
      [(MZUniversalPlaybackPositionStore *)self _onQueueLoadBagContextWithCompletionHandler:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    uint64_t v9 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_onQueueSynchronizeImmediatelyWithCompletionBlock - short circuiting. No Active Account!", (uint8_t *)&buf, 2u);
    }

    v10 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009C1A0;
    block[3] = &unk_10054D6E8;
    id v27 = v4;
    dispatch_async(v10, block);
  }
}

- (id)_accountForSyncing
{
  v2 = +[MTAccountController sharedInstance];
  BOOL v3 = [v2 activeAccount];

  return v3;
}

- (void)_updateSettingsFromLoadedBagContext:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009CA78;
  v4[3] = &unk_10054D9B0;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_onQueueLoadBagContextWithCompletionHandler:(id)a3
{
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009CEEC;
  v28[3] = &unk_10054F568;
  v28[4] = self;
  id v4 = a3;
  id v29 = v4;
  id v5 = objc_retainBlock(v28);
  id v6 = [(MZUniversalPlaybackPositionStore *)self _accountForSyncing];
  if (v6)
  {

    goto LABEL_4;
  }
  if ([(MZUniversalPlaybackPositionStore *)self canRequestStoreSignIn])
  {
LABEL_4:
    if (self->_bagLookupTask)
    {
      dispatch_queue_t v7 = _MTLogCategoryCloudSync();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_onQueueLoadBag - UPP load bag already in progress.  pending our completion block to be notified when it completes.", (uint8_t *)buf, 2u);
      }

      [(MZAsynchronousTask *)self->_bagLookupTask addTaskCompletionBlock:v5];
    }
    else
    {
      objc_initWeak(buf, self);
      BOOL v8 = [MZAsynchronousTask alloc];
      uint64_t v9 = [(MZAsynchronousTask *)v8 initWithHandlerQueue:self->_queue taskTimeout:@"MZUPPStore Load Bag" assertionTimeout:20.0 debugDescription:*(double *)&qword_10061A940];
      bagLookupTask = self->_bagLookupTask;
      self->_bagLookupTask = v9;

      v11 = self->_bagLookupTask;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10009CF80;
      v22[3] = &unk_10054E8E0;
      objc_copyWeak(&v23, buf);
      [(MZAsynchronousTask *)v11 setExpirationHandler:v22];
      v12 = self->_bagLookupTask;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10009D010;
      v20[3] = &unk_10054E8E0;
      objc_copyWeak(&v21, buf);
      [(MZAsynchronousTask *)v12 setFinishedHandler:v20];
      [(MZAsynchronousTask *)self->_bagLookupTask addTaskCompletionBlock:v5];
      [(MZAsynchronousTask *)self->_bagLookupTask beginTaskOperation];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10009D17C;
      v18[3] = &unk_10054F5B0;
      objc_copyWeak(&v19, buf);
      [(MZUniversalPlaybackPositionStore *)self _grabBagWithCompletionBlock:v18];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(buf);
    }
    goto LABEL_12;
  }
  v13 = _MTLogCategoryCloudSync();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_onQueueLoadBag - UPP skipping bag load: No Active Account!", (uint8_t *)buf, 2u);
  }

  v14 = +[NSError errorWithDomain:@"MZKeyValueStoreErrorDomain" code:-1001 userInfo:0];
  v15 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009CF68;
  block[3] = &unk_10054E398;
  double v16 = v5;
  id v26 = v14;
  id v27 = v16;
  id v17 = v14;
  dispatch_async(v15, block);

LABEL_12:
}

- (void)_grabBagWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D4B4;
  block[3] = &unk_10054D6E8;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_updateForStoreAccountsChange
{
  id v3 = [(MZUniversalPlaybackPositionStore *)self _accountForSyncing];

  queue = self->_queue;
  if (v3)
  {
    id v5 = v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v6 = sub_10009D6BC;
  }
  else
  {
    id v5 = v7;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    id v6 = sub_10009D6C4;
  }
  v5[2] = v6;
  v5[3] = &unk_10054D570;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (void)_timerFired:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D740;
  block[3] = &unk_10054D570;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)startUPPSyncTimer
{
}

- (void)_onQueueStopTimer
{
  id v3 = +[NSDate distantFuture];
  [(MZUniversalPlaybackPositionStore *)self setDateToFireNextTimer:v3];

  [(MZUniversalPlaybackPositionStore *)self _onQueueSuspendTimer];
}

- (void)_onQueueStartNewTimerWithTimeIntervalSinceNow:(double)a3
{
  [(MZUniversalPlaybackPositionStore *)self _onQueueStopTimer];
  id v5 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  [(MZUniversalPlaybackPositionStore *)self setDateToFireNextTimer:v5];

  [(MZUniversalPlaybackPositionStore *)self _onQueueResumeTimer];
}

- (void)_onQueueStartNewTimer
{
}

- (void)_onQueueSuspendTimer
{
  if (self->_refreshTimerActive)
  {
    id v3 = _MTLogCategoryCloudSync();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "suspending update timer", v4, 2u);
    }

    [(NSTimer *)self->_timer invalidate];
    [(MZUniversalPlaybackPositionStore *)self setTimer:0];
    self->_refreshTimerActive = 0;
  }
}

- (BOOL)_timerIsStopped
{
  v2 = [(MZUniversalPlaybackPositionStore *)self dateToFireNextTimer];
  id v3 = +[NSDate distantFuture];
  unsigned __int8 v4 = [v2 isEqualToDate:v3];

  return v4;
}

- (void)_onQueueResumeTimer
{
  if ([(MZUniversalPlaybackPositionStore *)self isActive]
    && !self->_refreshTimerActive
    && ![(MZUniversalPlaybackPositionStore *)self _timerIsStopped])
  {
    [(MZUniversalPlaybackPositionStore *)self _onQueueScheduleTimer];
  }
}

- (MZUniversalPlaybackPositionDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)automaticSynchronizeOptions
{
  return self->_automaticSynchronizeOptions;
}

- (BOOL)hasLocalChangesToSync
{
  return self->_hasLocalChangesToSync;
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  self->_canRequestStoreSignIn = a3;
}

- (MZUPPAsynchronousTask)synchronizeTask
{
  return self->_synchronizeTask;
}

- (void)setSynchronizeTask:(id)a3
{
}

- (MZAsynchronousTask)bagLookupTask
{
  return self->_bagLookupTask;
}

- (void)setBagLookupTask:(id)a3
{
}

- (MZUniversalPlaybackPositionSyncHandler)syncHandler
{
  return self->_syncHandler;
}

- (void)setSyncHandler:(id)a3
{
}

- (NSDate)dateToFireNextTimer
{
  return self->_dateToFireNextTimer;
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)refreshTimerActive
{
  return self->_refreshTimerActive;
}

- (void)setRefreshTimerActive:(BOOL)a3
{
  self->_refreshTimerActive = a3;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)initialAutosyncNeeded
{
  return self->_initialAutosyncNeeded;
}

- (void)setInitialAutosyncNeeded:(BOOL)a3
{
  self->_initialAutosyncNeeded = a3;
}

- (id)prefsObserver
{
  return self->_prefsObserver;
}

- (void)setPrefsObserver:(id)a3
{
  self->_prefsObserver = a3;
}

- (double)autorefreshRate
{
  return self->_autorefreshRate;
}

- (double)bagSpecifiedPollingInterval
{
  return self->_bagSpecifiedPollingInterval;
}

- (void)setBagSpecifiedPollingInterval:(double)a3
{
  self->_bagSpecifiedPollingInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_dateToFireNextTimer, 0);
  objc_storeStrong((id *)&self->_syncHandler, 0);
  objc_storeStrong((id *)&self->_bagLookupTask, 0);

  objc_storeStrong((id *)&self->_synchronizeTask, 0);
}

@end