@interface MTFeedUpdateBackgroundTask
+ (BOOL)isEnabled;
+ (double)_backgroundFetchInterval;
+ (double)earliestBeginTime;
+ (id)identifier;
- (double)feedUpdateBeginTime;
- (id)pendingCompletion;
- (int64_t)initialFeedUpdateCount;
- (void)cancel;
- (void)didFinishUpdatingAllFeedsNotification:(id)a3;
- (void)performWithCompletion:(id)a3;
- (void)setFeedUpdateBeginTime:(double)a3;
- (void)setInitialFeedUpdateCount:(int64_t)a3;
- (void)setPendingCompletion:(id)a3;
@end

@implementation MTFeedUpdateBackgroundTask

+ (id)identifier
{
  return @"com.apple.podcasts.feed-update";
}

+ (BOOL)isEnabled
{
  [a1 _backgroundFetchInterval];
  return v2 > 0.0;
}

+ (double)_backgroundFetchInterval
{
  double v2 = +[IMURLBag sharedInstance];
  v3 = [v2 syncValueForKey:kBackgroundFetchInterval];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (double)earliestBeginTime
{
  [a1 _backgroundFetchInterval];
  return fmax(v2, 3600.0);
}

- (void)performWithCompletion:(id)a3
{
  double v4 = (void (**)(id, void))a3;
  double v5 = _MTLogCategoryFeedUpdate();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  v7 = _MTLogCategoryFeedUpdate();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "BACKGROUND_FEED_UPDATE", "", buf, 2u);
  }

  if ((+[MTLibraryMigrationUtil needsCoreDataMigration](MTLibraryMigrationUtil, "needsCoreDataMigration") & 1) != 0|| +[MTLibraryMigrationUtil needsDataMigration])
  {
    v9 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Skipping background task feed update because a CoreData migration is required", buf, 2u);
    }

    v10 = _MTLogCategoryFeedUpdate();
    v11 = v10;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v6, "BACKGROUND_FEED_UPDATE", "MIGRATION_REQUIRED", buf, 2u);
    }

    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    self->_signpostID = v6;
    v12 = +[MTFeedUpdateMetricsDataKey backgroundTask];
    +[IMMetrics startTimer:v12];

    v13 = +[MTProcessorManager sharedInstance];
    [v13 startProcessorsForFeedUpdates];

    v14 = +[MTFeedUpdateManager sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100115910;
    v15[3] = &unk_100552038;
    v15[4] = self;
    v16 = v4;
    [v14 updateAllPodcastsInBackgroundWithSource:0 started:v15];
  }
}

- (void)cancel
{
  v3 = [(MTFeedUpdateBackgroundTask *)self pendingCompletion];

  if (v3) {
    [(MTFeedUpdateBackgroundTask *)self setPendingCompletion:0];
  }
  double v4 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Background task feed update was cancelled", buf, 2u);
  }

  double v5 = _MTLogCategoryFeedUpdate();
  os_signpost_id_t v6 = v5;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, signpostID, "BACKGROUND_FEED_UPDATE", "CANCELLED", v8, 2u);
  }
}

- (void)didFinishUpdatingAllFeedsNotification:(id)a3
{
  double v4 = +[MTFeedUpdateMetricsDataKey backgroundTask];
  +[IMMetrics endTimer:v4];

  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(MTFeedUpdateBackgroundTask *)self feedUpdateBeginTime];
  double v8 = v7;
  v9 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218240;
    int64_t v16 = [(MTFeedUpdateBackgroundTask *)self initialFeedUpdateCount];
    __int16 v17 = 2048;
    double v18 = v6 - v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Did finish updating %lld feeds for background task in %f", (uint8_t *)&v15, 0x16u);
  }

  v10 = [(MTFeedUpdateBackgroundTask *)self pendingCompletion];

  if (v10)
  {
    v11 = [(MTFeedUpdateBackgroundTask *)self pendingCompletion];
    v11[2](v11, 1);

    [(MTFeedUpdateBackgroundTask *)self setPendingCompletion:0];
  }
  v12 = _MTLogCategoryFeedUpdate();
  v13 = v12;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, signpostID, "BACKGROUND_FEED_UPDATE", "SUCCESS", (uint8_t *)&v15, 2u);
  }
}

- (int64_t)initialFeedUpdateCount
{
  return self->_initialFeedUpdateCount;
}

- (void)setInitialFeedUpdateCount:(int64_t)a3
{
  self->_initialFeedUpdateCount = a3;
}

- (double)feedUpdateBeginTime
{
  return self->_feedUpdateBeginTime;
}

- (void)setFeedUpdateBeginTime:(double)a3
{
  self->_feedUpdateBeginTime = a3;
}

- (id)pendingCompletion
{
  return self->_pendingCompletion;
}

- (void)setPendingCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end