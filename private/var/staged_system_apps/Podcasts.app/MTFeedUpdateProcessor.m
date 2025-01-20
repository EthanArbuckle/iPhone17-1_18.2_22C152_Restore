@interface MTFeedUpdateProcessor
- (BOOL)_isLPMEnabled;
- (BOOL)start;
- (double)_feedUpdateInterval;
- (double)updatePredicateDuration;
- (id)entityName;
- (id)predicate;
- (void)_fetchBatchFetchEnabled;
- (void)_lpmDidChange;
- (void)_reCheck;
- (void)checkAutoDownloadsForUuids:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)startIfNeeded;
- (void)stop;
@end

@implementation MTFeedUpdateProcessor

- (id)predicate
{
  if (os_feature_enabled_batch_feed_fetch() && self->_isBatchFetchEnabledBagValue)
  {
    v3 = +[MTPodcast predicateForNotHiddenPodcasts];
    v4 = +[MTPodcast predicateForPeriodicallyUpdatablePodcasts];
    v5 = [v3 AND:v4];
    v6 = +[MTPodcast predicateForAreMediaAPI:0];
    v7 = [v5 AND:v6];
  }
  else
  {
    v3 = +[MTPodcast predicateForNotHiddenPodcasts];
    v4 = +[MTPodcast predicateForPeriodicallyUpdatablePodcasts];
    v7 = [v3 AND:v4];
  }

  return v7;
}

- (void)_fetchBatchFetchEnabled
{
  objc_initWeak(&location, self);
  v3 = +[IMURLBag sharedInstance];
  v4 = [v3 batchFeedFetchIsEnabled];
  v5 = [(MTBaseProcessor *)self workQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100126D1C;
  v6[3] = &unk_100552520;
  objc_copyWeak(&v7, &location);
  [v4 asyncValueOnQueue:v5 withCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)start
{
  v7.receiver = self;
  v7.super_class = (Class)MTFeedUpdateProcessor;
  BOOL v3 = [(MTBaseProcessor *)&v7 start];
  if (v3)
  {
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:"_lpmDidChange" name:NSProcessInfoPowerStateDidChangeNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_fetchBatchFetchEnabled" name:AMSBagChangedNotification object:0];

    self->_isBatchFetchEnabledBagValue = 0;
    [(MTFeedUpdateProcessor *)self _fetchBatchFetchEnabled];
  }
  return v3;
}

- (void)startIfNeeded
{
  if (![(MTBaseProcessor *)self isRunning])
  {
    [(MTFeedUpdateProcessor *)self start];
  }
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)MTFeedUpdateProcessor;
  [(MTBaseProcessor *)&v4 stop];
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (double)updatePredicateDuration
{
  [(MTFeedUpdateProcessor *)self _feedUpdateInterval];
  return result;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
}

- (void)checkAutoDownloadsForUuids:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ([(MTFeedUpdateProcessor *)self _isLPMEnabled])
    {
      v5 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v11 = [v4 count];
        v6 = "Skipping feed update for %lu podcasts because of Low Power Mode";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      }
    }
    else
    {
      [(MTFeedUpdateProcessor *)self updatePredicateDuration];
      if (v7 != 0.0)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_100126988;
        v8[3] = &unk_10054D570;
        v9 = v4;
        [(MTBaseProcessor *)self enqueueWorkBlock:v8];
        v5 = v9;
        goto LABEL_10;
      }
      v5 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v11 = [v4 count];
        v6 = "Skipping feed update for %lu podcasts because the feed update interval is 0.";
        goto LABEL_8;
      }
    }
LABEL_10:
  }
}

- (double)_feedUpdateInterval
{
  v2 = +[IMURLBag sharedInstance];
  BOOL v3 = [v2 syncValueForKey:kBagKeyFeedUpdateProcessorInterval];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)_isLPMEnabled
{
  v2 = +[NSProcessInfo processInfo];
  unsigned __int8 v3 = [v2 isLowPowerModeEnabled];

  return v3;
}

- (void)_reCheck
{
  if ([(MTFeedUpdateProcessor *)self _isLPMEnabled])
  {
    unsigned __int8 v3 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Skipping _reCheck because of Low Power Mode", buf, 2u);
    }
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100126BD4;
    v4[3] = &unk_10054D570;
    v4[4] = self;
    [(MTBaseProcessor *)self enqueueWorkBlock:v4];
  }
}

- (void)_lpmDidChange
{
  unsigned __int8 v3 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Low Power Mode did change. Checking for feed updates", v4, 2u);
  }

  [(MTFeedUpdateProcessor *)self _reCheck];
}

@end