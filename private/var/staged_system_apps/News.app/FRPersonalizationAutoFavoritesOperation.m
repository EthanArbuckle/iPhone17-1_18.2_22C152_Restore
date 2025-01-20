@interface FRPersonalizationAutoFavoritesOperation
- (BOOL)disregardCache;
- (BOOL)shouldAcceptAggregate:(id)a3 withCtr:(double)a4 minEvents:(double)a5 minClicks:(double)a6 minRate:(double)a7 baseRate:(double)a8 multiplier:(double)a9;
- (BOOL)shouldRejectTagID:(id)a3 withAggregate:(id)a4 baseline:(id)a5 currentDate:(id)a6 addedDate:(id)a7 maxIdleTime:(double)a8 minEvents:(double)a9 minRate:(double)a10 baseRate:(double)a11 multiplier:(double)a12;
- (BOOL)validateOperation;
- (FCLocalAreasManager)localAreasManager;
- (FCNewsAppConfiguration)appConfiguration;
- (FCPersonalizationBundleIDMapping)bundleIDMapping;
- (FCPersonalizationFavorabilityScores)favorabilityScores;
- (FCPersonalizationTreatment)configurableValues;
- (FCPersonalizationURLMapping)urlMapping;
- (FCPersonalizationWhitelist)whitelist;
- (FCReadonlyPersonalizationAggregateStore)aggregateStore;
- (FCSubscriptionController)subscriptionController;
- (FCTagController)tagController;
- (FCTagRanking)tagRanker;
- (FCUserInfo)userInfo;
- (FRPersonalizationAutoFavorites)resultAutoFavorites;
- (FRPersonalizationAutoFavoritesCursor)cursor;
- (FRPersonalizationAutoFavoritesCursor)resultCursor;
- (TSLocationDetectionManagerType)locationManager;
- (double)ctrForTagID:(id)a3 withAggregate:(id)a4 baselineAggregate:(id)a5;
- (double)metricMultiplierForTagID:(id)a3 withPriorFactorExponent:(double)a4 tagFavorabilityExponent:(double)a5;
- (double)signalProcessingTimeInterval;
- (id)auditCandidates:(id)a3 autoSubscriptionAddedDateByTagId:(id)a4 multiplierProvider:(id)a5;
- (id)autoFavoritesCompletionHandler;
- (id)maybeConsiderPortrait;
- (id)processExternalAppUsageSignals:(id)a3;
- (id)processSafariSignals:(id)a3;
- (void)_considerExternalSignals:(id)a3;
- (void)_considerInternalAppUsage:(id)a3;
- (void)_considerInternalSignals:(id)a3;
- (void)_findValidAutoFavoritesWithCandidates:(id)a3 channelsAllowedProvider:(id)a4 topicsAllowedProvider:(id)a5 completion:(id)a6;
- (void)_processSignals:(id)a3;
- (void)considerBiome:(id)a3;
- (void)considerLocation:(id)a3;
- (void)operationWillFinishWithError:(id)a3;
- (void)performOperation;
- (void)prepareOperation;
- (void)processAppSignals:(id)a3 safariSignals:(id)a4 completion:(id)a5;
- (void)setAggregateStore:(id)a3;
- (void)setAppConfiguration:(id)a3;
- (void)setAutoFavoritesCompletionHandler:(id)a3;
- (void)setBundleIDMapping:(id)a3;
- (void)setConfigurableValues:(id)a3;
- (void)setCursor:(id)a3;
- (void)setDisregardCache:(BOOL)a3;
- (void)setFavorabilityScores:(id)a3;
- (void)setLocalAreasManager:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setResultAutoFavorites:(id)a3;
- (void)setResultCursor:(id)a3;
- (void)setSignalProcessingTimeInterval:(double)a3;
- (void)setSubscriptionController:(id)a3;
- (void)setTagController:(id)a3;
- (void)setTagRanker:(id)a3;
- (void)setUrlMapping:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setWhitelist:(id)a3;
@end

@implementation FRPersonalizationAutoFavoritesOperation

- (void)setWhitelist:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (void)setUrlMapping:(id)a3
{
}

- (void)setTagRanker:(id)a3
{
}

- (void)setTagController:(id)a3
{
}

- (void)setSubscriptionController:(id)a3
{
}

- (void)setSignalProcessingTimeInterval:(double)a3
{
  self->_signalProcessingTimeInterval = a3;
}

- (void)setLocationManager:(id)a3
{
}

- (void)setLocalAreasManager:(id)a3
{
}

- (void)setFavorabilityScores:(id)a3
{
}

- (void)setDisregardCache:(BOOL)a3
{
  self->_disregardCache = a3;
}

- (void)setCursor:(id)a3
{
}

- (void)setConfigurableValues:(id)a3
{
}

- (void)setBundleIDMapping:(id)a3
{
}

- (void)setAutoFavoritesCompletionHandler:(id)a3
{
}

- (void)setAppConfiguration:(id)a3
{
}

- (void)setAggregateStore:(id)a3
{
}

- (BOOL)validateOperation
{
  v3 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];

  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000705EC();
  }
  v4 = [(FRPersonalizationAutoFavoritesOperation *)self subscriptionController];

  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100070530();
  }
  v5 = [(FRPersonalizationAutoFavoritesOperation *)self tagController];

  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100070474();
  }
  v6 = [(FRPersonalizationAutoFavoritesOperation *)self userInfo];

  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000703B8();
  }
  v7 = [(FRPersonalizationAutoFavoritesOperation *)self tagRanker];

  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000702FC();
  }
  v8 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];

  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100070240();
  }
  if (v3) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  return !v9 && v5 != 0 && v6 != 0 && v7 != 0 && v8 != 0;
}

- (void)prepareOperation
{
  id v5 = [(FRPersonalizationAutoFavoritesOperation *)self cursor];
  id v3 = [v5 copy];
  if (v3)
  {
    [(FRPersonalizationAutoFavoritesOperation *)self setResultCursor:v3];
  }
  else
  {
    v4 = objc_opt_new();
    [(FRPersonalizationAutoFavoritesOperation *)self setResultCursor:v4];
  }
}

- (void)performOperation
{
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = [(FRPersonalizationAutoFavoritesOperation *)self tagRanker];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001F938;
  v13[3] = &unk_1000C5680;
  id v5 = v3;
  v14 = v5;
  [v4 prepareForUseWithCompletionHandler:v13];

  dispatch_group_enter(v5);
  v6 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001F940;
  v11[3] = &unk_1000C5680;
  v7 = v5;
  v12 = v7;
  [v6 prepareAggregatesForUseWithCompletionHandler:v11];

  if (FCDispatchGroupIsEmpty())
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001F948;
    v10[3] = &unk_1000C5680;
    v10[4] = self;
    sub_10001F948((uint64_t)v10);
  }
  else
  {
    [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
    v8 = FCDispatchQueueForQualityOfService();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001F9C4;
    v9[3] = &unk_1000C5680;
    v9[4] = self;
    dispatch_group_notify(v7, v8, v9);
  }
}

- (void)operationWillFinishWithError:(id)a3
{
  id v8 = a3;
  v4 = [(FRPersonalizationAutoFavoritesOperation *)self autoFavoritesCompletionHandler];

  if (v4)
  {
    id v5 = [(FRPersonalizationAutoFavoritesOperation *)self autoFavoritesCompletionHandler];
    v6 = [(FRPersonalizationAutoFavoritesOperation *)self resultAutoFavorites];
    v7 = [(FRPersonalizationAutoFavoritesOperation *)self resultCursor];
    ((void (**)(void, void *, void *, id))v5)[2](v5, v6, v7, v8);
  }
}

- (void)_processSignals:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100070768();
  }
  id v5 = [(FRPersonalizationAutoFavoritesOperation *)self whitelist];
  BOOL v6 = v5 == 0;

  if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000706A8();
  }
  v7 = [(FRPersonalizationAutoFavoritesOperation *)self whitelist];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1000201D0;
    v53[3] = &unk_1000C5988;
    v53[4] = self;
    id v54 = v4;
    sub_1000201D0((uint64_t)v53);
  }
  else
  {
    BOOL v9 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = sub_100018A50;
    v51[4] = sub_1000189B0;
    id v52 = +[NSSet set];
    v49[0] = 0;
    v49[1] = v49;
    v49[2] = 0x3032000000;
    v49[3] = sub_100018A50;
    v49[4] = sub_1000189B0;
    id v50 = +[NSSet set];
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = sub_100018A50;
    v47[4] = sub_1000189B0;
    id v48 = +[NSSet set];
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_100018A50;
    v45[4] = sub_1000189B0;
    id v46 = +[NSSet set];
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_100018A50;
    v43[4] = sub_1000189B0;
    id v44 = +[NSSet set];
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = sub_100018A50;
    v41[4] = sub_1000189B0;
    id v42 = +[NSSet set];
    v10 = dispatch_group_create();
    v11 = FCOperationLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      v56 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider external signals", buf, 0xCu);
    }
    dispatch_group_enter(v10);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100020230;
    v34[3] = &unk_1000C59B0;
    v37 = v47;
    v38 = v45;
    v39 = v43;
    v40 = v41;
    v13 = v10;
    v35 = v13;
    v36 = self;
    [(FRPersonalizationAutoFavoritesOperation *)self _considerExternalSignals:v34];
    v14 = FCOperationLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
      *(_DWORD *)buf = 138543362;
      v56 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider internal signals", buf, 0xCu);
    }
    dispatch_group_enter(v13);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000203B0;
    v29[3] = &unk_1000C59D8;
    v32 = v51;
    v33 = v49;
    v16 = v13;
    v30 = v16;
    v31 = self;
    [(FRPersonalizationAutoFavoritesOperation *)self _considerInternalSignals:v29];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000204D8;
    v20[3] = &unk_1000C5BA8;
    v20[4] = self;
    id v17 = v9;
    id v21 = v17;
    v23 = v51;
    v24 = v49;
    v25 = v47;
    v26 = v45;
    v27 = v43;
    v28 = v41;
    id v22 = v4;
    v18 = objc_retainBlock(v20);
    if (FCDispatchGroupIsEmpty())
    {
      ((void (*)(void *))v18[2])(v18);
    }
    else
    {
      [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
      v19 = FCDispatchQueueForQualityOfService();
      dispatch_group_notify(v16, v19, v18);
    }
    _Block_object_dispose(v41, 8);

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);

    _Block_object_dispose(v47, 8);
    _Block_object_dispose(v49, 8);

    _Block_object_dispose(v51, 8);
  }
}

- (void)_findValidAutoFavoritesWithCandidates:(id)a3 channelsAllowedProvider:(id)a4 topicsAllowedProvider:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  v14 = +[NSMutableSet set];
  v15 = +[NSMutableSet set];
  [(FRPersonalizationAutoFavoritesOperation *)self whitelist];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100022034;
  v42[3] = &unk_1000C5B30;
  v42[4] = self;
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = v28;
  id v16 = v14;
  id v44 = v16;
  id v17 = v15;
  id v45 = v17;
  [v13 enumerateObjectsUsingBlock:v42];

  v18 = dispatch_group_create();
  if ([v17 count])
  {
    dispatch_group_enter(v18);
    [(FRPersonalizationAutoFavoritesOperation *)self tagController];
    v19 = id v29 = v12;
    [v17 allObjects];
    id v21 = v20 = v10;
    id v22 = [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
    [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
    FCDispatchQueueForQualityOfService();
    v24 = v23 = v11;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000221A8;
    v37[3] = &unk_1000C5BD0;
    id v40 = v20;
    id v38 = v16;
    id v41 = v23;
    v39 = v18;
    [v19 fetchTagsForTagIDs:v21 qualityOfService:v22 callbackQueue:v24 completionHandler:v37];

    id v11 = v23;
    id v10 = v20;

    id v12 = v29;
  }
  v30 = v11;
  if (FCDispatchGroupIsEmpty())
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100022358;
    v34[3] = &unk_1000C5BF8;
    v25 = &v36;
    id v36 = v12;
    v26 = &v35;
    id v35 = v16;
    sub_100022358((uint64_t)v34);
  }
  else
  {
    [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
    v27 = FCDispatchQueueForQualityOfService();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022378;
    block[3] = &unk_1000C5BF8;
    v25 = &v33;
    id v33 = v12;
    v26 = &v32;
    id v32 = v16;
    dispatch_group_notify(v18, v27, block);
  }
}

- (void)_considerInternalAppUsage:(id)a3
{
  id v4 = (void (**)(id, id, id))a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100071028();
  }
  id v5 = +[NSMutableSet set];
  BOOL v6 = +[NSMutableSet set];
  v7 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  [v7 autoFavoriteMinEvents];
  uint64_t v9 = v8;
  [v7 autoFavoriteMinClicks];
  uint64_t v11 = v10;
  [v7 autoFavoriteMinRate];
  uint64_t v13 = v12;
  v14 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  v15 = [v14 baselineAggregateWithConfigurableValues:v7];

  [v7 autoFavoriteMinRelativeRate];
  double v17 = v16;
  v18 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  [v18 decayRate];
  [v15 personalizationValueWithBaseline:0];
  double v20 = v17 * v19;

  id v21 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000225C8;
  v28[3] = &unk_1000C5C20;
  id v29 = v7;
  v30 = self;
  id v31 = v15;
  uint64_t v34 = v9;
  uint64_t v35 = v11;
  uint64_t v36 = v13;
  double v37 = v20;
  id v22 = v5;
  id v32 = v22;
  id v23 = v6;
  id v33 = v23;
  id v24 = v15;
  id v25 = v7;
  [v21 enumerateAggregatesUsingBlock:v28];

  if (v4)
  {
    id v26 = [v22 copy];
    id v27 = [v23 copy];
    v4[2](v4, v26, v27);
  }
}

- (void)considerLocation:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet set];
  BOOL v6 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    uint64_t v8 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider location", buf, 0xCu);
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100022A74;
  v25[3] = &unk_1000C5C48;
  v25[4] = self;
  id v9 = v4;
  id v26 = v9;
  uint64_t v10 = objc_retainBlock(v25);
  uint64_t v11 = [(FRPersonalizationAutoFavoritesOperation *)self appConfiguration];
  unsigned int v12 = [v11 enableLocationBasedAutofavorites];

  if (v12)
  {
    uint64_t v13 = [(FRPersonalizationAutoFavoritesOperation *)self locationManager];
    v14 = [v13 mostFrequentLocation];

    v15 = (void *)FCOperationLog;
    BOOL v16 = os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        double v17 = v15;
        v18 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
        *(_DWORD *)buf = 138543362;
        id v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ has location; will fetch local areas provider",
          buf,
          0xCu);
      }
      double v19 = [(FRPersonalizationAutoFavoritesOperation *)self localAreasManager];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100022B68;
      v22[3] = &unk_1000C5C70;
      v22[4] = self;
      id v23 = v14;
      id v24 = v10;
      [v19 fetchLocalAreasProvider:v22];
    }
    else
    {
      if (v16)
      {
        double v20 = v15;
        id v21 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
        *(_DWORD *)buf = 138543362;
        id v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ could not get location; returning empty auto-favorites",
          buf,
          0xCu);
      }
      ((void (*)(void *, void *))v10[2])(v10, v5);
    }
  }
  else
  {
    ((void (*)(void *, void *))v10[2])(v10, v5);
  }
}

- (id)maybeConsiderPortrait
{
  id v3 = [(FRPersonalizationAutoFavoritesOperation *)self whitelist];
  id v4 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  [v4 portraitDecayRate];
  double v5 = 0.0;
  if (v6 != 0.0)
  {
    [v4 portraitDecayRate];
    double v5 = 0.693147181 / v7;
  }
  uint64_t v8 = objc_opt_new();
  [v8 setOverrideDecayRate:1];
  [v8 setDecayRate:v5];
  id v9 = +[NSDate distantPast];
  [v8 setFromDate:v9];

  id v10 = [objc_alloc((Class)NSSet) initWithObjects:@"com.apple.news", 0];
  [v8 setExcludingSourceBundleIds:v10];

  uint64_t v11 = +[PPTopicStore defaultStore];
  id v23 = 0;
  unsigned int v12 = [v11 scoresForTopicMapping:@"news-topics" query:v8 error:&v23];
  id v13 = v23;

  v14 = [v3 portraitDisabledTagIDs];
  [v4 portraitGlobalThreshold];
  double v16 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100022E84;
  v20[3] = &unk_1000C5C98;
  id v21 = v4;
  id v22 = self;
  id v17 = v4;
  v18 = +[FRPortraitUtilities candidatePortraitSignalsWithPortraitResults:v12 disbabledTagIDs:v14 globalThreshold:v20 multiplierProvider:&stru_1000C5CD8 logBlock:v16];

  return v18;
}

- (void)considerBiome:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000710EC();
  }
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_100018A50;
  v19[4] = sub_1000189B0;
  id v20 = &__NSArray0__struct;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100018A50;
  v17[4] = sub_1000189B0;
  id v18 = &__NSArray0__struct;
  double v5 = FCOperationLog;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will consider Biome", buf, 0xCu);
  }
  double v7 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  [v7 safariEventBlackoutSeconds];
  double v9 = v8;
  id v10 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  id v11 = [v10 maxExternalSignalEventCount];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023198;
  v13[3] = &unk_1000C5D00;
  double v15 = v19;
  double v16 = v17;
  void v13[4] = self;
  id v12 = v4;
  id v14 = v12;
  +[FCBiomeSignalProvider fetchSignalsFromBiomeWithSafariBlockoutDuration:v11 maxExternalSignalEventCount:v13 resultsBlock:v9];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (void)processAppSignals:(id)a3 safariSignals:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100071534();
    if (v9) {
      goto LABEL_6;
    }
  }
  else if (v9)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100071470();
  }
LABEL_6:
  if (!v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000713AC();
  }
  id v11 = (void *)FCOperationLog;
  if (os_log_type_enabled(FCOperationLog, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [(FRPersonalizationAutoFavoritesOperation *)self shortOperationDescription];
    *(_DWORD *)buf = 138543362;
    v78 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ will process app signals", buf, 0xCu);
  }
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100023AF4;
  v75[3] = &unk_1000C5D28;
  v75[4] = self;
  id v14 = v10;
  id v76 = v14;
  double v15 = objc_retainBlock(v75);
  id v16 = [v8 count];
  if ((char *)[v9 count] + (void)v16)
  {
    uint64_t v17 = [(FRPersonalizationAutoFavoritesOperation *)self bundleIDMapping];
    if (v17)
    {
      id v18 = (void *)v17;
      double v19 = [(FRPersonalizationAutoFavoritesOperation *)self urlMapping];

      if (v19)
      {
        uint64_t v20 = [(FRPersonalizationAutoFavoritesOperation *)self urlMapping];
        uint64_t v21 = [(FRPersonalizationAutoFavoritesOperation *)self bundleIDMapping];
        v56 = (void *)v20;
        if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1000712E8();
          if (!v21)
          {
LABEL_17:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_100071224();
            }
          }
        }
        else if (!v21)
        {
          goto LABEL_17;
        }
        v58 = (void *)v21;
        id v22 = +[NSUserDefaults standardUserDefaults];
        unsigned __int8 v23 = [v22 BOOLForKey:FCPersonalizationDisregardTimeForSuggestions];

        id v24 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
        [v24 appUsageSignalWeight];
        double v26 = v25;
        [v24 appUsageTimeDecayMultiplier];
        double v28 = 1.0;
        double v29 = 1.0;
        if ((v23 & 1) == 0)
        {
          long double v30 = v27;
          id v31 = [v8 firstObject];
          id v32 = [v31 date];
          [v32 fc_timeIntervalUntilNow];
          double v29 = pow(v30, v33 / 86400.0);
        }
        id v60 = v14;
        double v34 = v26 * v29;
        [v24 safariSignalWeight];
        double v36 = v35;
        v55 = v24;
        [v24 safariTimeDecayMultiplier];
        if ((v23 & 1) == 0)
        {
          long double v38 = v37;
          v39 = [v9 firstObject];
          id v40 = [v39 date];
          [v40 fc_timeIntervalUntilNow];
          double v28 = pow(v38, v41 / 86400.0);
        }
        id v42 = objc_opt_new();
        id v43 = objc_opt_new();
        id v44 = [(FRPersonalizationAutoFavoritesOperation *)self cursor];
        id v45 = [v44 coreDuetLastQueryDate];

        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_100023D4C;
        v67[3] = &unk_1000C5E58;
        unsigned __int8 v74 = v23;
        id v68 = v58;
        v73 = &stru_1000C5D68;
        id v46 = v43;
        id v69 = v46;
        id v70 = v45;
        id v71 = v56;
        id v47 = v42;
        id v72 = v47;
        id v57 = v56;
        id v54 = v45;
        id v59 = v58;
        id v48 = objc_retainBlock(v67);
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_10002438C;
        v64[3] = &unk_1000C5E80;
        double v66 = v34;
        id v49 = v55;
        id v65 = v49;
        ((void (*)(void *, id, void *))v48[2])(v48, v8, v64);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1000243CC;
        v61[3] = &unk_1000C5E80;
        double v63 = v36 * v28;
        id v62 = v49;
        id v50 = (void (*)(void *, id, void *))v48[2];
        id v51 = v49;
        v50(v48, v9, v61);
        if (v15)
        {
          id v52 = -[FRPersonalizationAutoFavoritesOperation processExternalAppUsageSignals:](self, "processExternalAppUsageSignals:", v46, v54);
          v53 = [(FRPersonalizationAutoFavoritesOperation *)self processSafariSignals:v47];
          ((void (*)(void *, void *, void *))v15[2])(v15, v52, v53);
        }
        id v14 = v60;
        goto LABEL_28;
      }
    }
  }
  if (v15)
  {
    id v47 = +[NSSet set];
    id v46 = +[NSSet set];
    ((void (*)(void *, id, id))v15[2])(v15, v47, v46);
LABEL_28:
  }
}

- (id)processExternalAppUsageSignals:(id)a3
{
  id v4 = a3;
  double v5 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  id v25 = +[NSMutableSet set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
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
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        id v12 = [v6 objectForKeyedSubscript:v11];
        double v13 = (double)(unint64_t)[v12 count];
        [v5 autoFavoriteMinObservationsExtAppUsage];
        if (v14 <= v13)
        {
          [v5 appUsagePriorFactorExponent];
          double v16 = v15;
          [v5 appUsageTagFavorabilityExponent];
          [(FRPersonalizationAutoFavoritesOperation *)self metricMultiplierForTagID:v11 withPriorFactorExponent:v16 tagFavorabilityExponent:v17];
          double v19 = v18;
          uint64_t v20 = [v12 valueForKeyPath:@"@sum.self"];
          [v20 doubleValue];
          double v22 = v19 * v21;

          [v5 autoFavoriteMinScoreExtAppUsage];
          if (v22 >= v23) {
            [v25 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }

  return v25;
}

- (id)processSafariSignals:(id)a3
{
  id v4 = a3;
  double v5 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  uint64_t v33 = [(FRPersonalizationAutoFavoritesOperation *)self favorabilityScores];
  if (!v33)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100071630();
    }
    id v6 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_ERROR)) {
      sub_1000715F8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  id v35 = +[NSMutableSet set];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v37;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v20 = [v14 objectForKeyedSubscript:v19];
        double v21 = (double)(unint64_t)[v20 count];
        [v5 autoFavoriteMinObservationsSafari];
        if (v22 <= v21)
        {
          [v5 safariPriorFactorExponent];
          double v24 = v23;
          [v5 safariTagFavorabilityExponent];
          [(FRPersonalizationAutoFavoritesOperation *)self metricMultiplierForTagID:v19 withPriorFactorExponent:v24 tagFavorabilityExponent:v25];
          double v27 = v26;
          long long v28 = [v20 valueForKeyPath:@"@sum.self"];
          [v28 doubleValue];
          double v30 = v27 * v29;

          [v5 autoFavoriteMinScoreSafari];
          if (v30 >= v31) {
            [v35 addObject:v19];
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v16);
  }

  return v35;
}

- (void)_considerInternalSignals:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000716F4();
  }
  double v5 = dispatch_group_create();
  if ([(FRPersonalizationAutoFavoritesOperation *)self disregardCache])
  {
LABEL_10:
    dispatch_group_enter(v5);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100024AC4;
    v23[3] = &unk_1000C5EA8;
    v23[4] = self;
    double v24 = v5;
    [(FRPersonalizationAutoFavoritesOperation *)self _considerInternalAppUsage:v23];
    id v15 = +[NSDate date];
    id v16 = [(FRPersonalizationAutoFavoritesOperation *)self resultCursor];
    [v16 setLastInternalSignalProcessingDate:v15];

    if (!v4) {
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  id v6 = [(FRPersonalizationAutoFavoritesOperation *)self cursor];
  uint64_t v7 = [v6 lastInternalSignalProcessingDate];
  if (!v7)
  {

    goto LABEL_10;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = [(FRPersonalizationAutoFavoritesOperation *)self cursor];
  uint64_t v10 = [v9 lastInternalSignalProcessingDate];
  [v10 fc_timeIntervalUntilNow];
  double v12 = v11;
  [(FRPersonalizationAutoFavoritesOperation *)self signalProcessingTimeInterval];
  double v14 = v13;

  if (v12 > v14) {
    goto LABEL_10;
  }
  if (!v4) {
    goto LABEL_15;
  }
LABEL_11:
  if (FCDispatchGroupIsEmpty())
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100024B58;
    v21[3] = &unk_1000C5BF8;
    uint64_t v17 = &v22;
    v21[4] = self;
    id v22 = v4;
    sub_100024B58((uint64_t)v21);
  }
  else
  {
    [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
    double v18 = FCDispatchQueueForQualityOfService();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100024BF8;
    v19[3] = &unk_1000C5BF8;
    uint64_t v17 = &v20;
    v19[4] = self;
    id v20 = v4;
    dispatch_group_notify(v5, v18, v19);
  }
LABEL_15:
}

- (void)_considerExternalSignals:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100071874();
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100024FD8;
  v30[3] = &unk_1000C5ED0;
  id v5 = v4;
  id v31 = v5;
  id v6 = objc_retainBlock(v30);
  uint64_t v7 = [(FRPersonalizationAutoFavoritesOperation *)self userInfo];
  id v8 = [v7 progressivePersonalization];

  if (v8)
  {
    if (v8 == (id)1)
    {
      uint64_t v19 = +[NSSet set];
      id v20 = +[NSSet set];
      double v21 = +[NSSet set];
      id v22 = +[NSSet set];
      ((void (*)(void *, void *, void *, void *, void *))v6[2])(v6, v19, v20, v21, v22);
    }
    else if (v8 == (id)2)
    {
      uint64_t v9 = dispatch_group_create();
      if (![(FRPersonalizationAutoFavoritesOperation *)self disregardCache])
      {
        uint64_t v10 = [(FRPersonalizationAutoFavoritesOperation *)self cursor];
        uint64_t v11 = [v10 lastExternalSignalProcessingDate];
        if (v11)
        {
          double v12 = (void *)v11;
          double v13 = [(FRPersonalizationAutoFavoritesOperation *)self cursor];
          double v14 = [v13 lastExternalSignalProcessingDate];
          [v14 fc_timeIntervalUntilNow];
          double v16 = v15;
          [(FRPersonalizationAutoFavoritesOperation *)self signalProcessingTimeInterval];
          double v18 = v17;

          if (v16 <= v18) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      double v23 = [(FRPersonalizationAutoFavoritesOperation *)self maybeConsiderPortrait];
      double v24 = [(FRPersonalizationAutoFavoritesOperation *)self resultCursor];
      [v24 setLastPortraitAutoFavoriteResults:v23];

      dispatch_group_enter(v9);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100025148;
      v28[3] = &unk_1000C5EA8;
      void v28[4] = self;
      double v29 = v9;
      [(FRPersonalizationAutoFavoritesOperation *)self considerBiome:v28];

LABEL_16:
      [(FRPersonalizationAutoFavoritesOperation *)self qualityOfService];
      double v25 = FCDispatchQueueForQualityOfService();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000252A4;
      block[3] = &unk_1000C5BF8;
      void block[4] = self;
      double v27 = v6;
      dispatch_group_notify(v9, v25, block);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000717B8();
  }
}

- (double)metricMultiplierForTagID:(id)a3 withPriorFactorExponent:(double)a4 tagFavorabilityExponent:(double)a5
{
  id v8 = a3;
  uint64_t v9 = [(FRPersonalizationAutoFavoritesOperation *)self whitelist];
  uint64_t v10 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  uint64_t v11 = [v10 defaultScoringConfig];
  [v11 baselineRatePrior];
  FCPersonalizationBaselineClicksMultiplerForTagID();
  long double v13 = v12;

  double v14 = pow(v13, a4);
  double v15 = [(FRPersonalizationAutoFavoritesOperation *)self favorabilityScores];
  double v16 = [v15 scoreForTagID:v8];

  if (v16)
  {
    [v16 doubleValue];
    double v18 = v17;
    double v19 = 0.0;
    if (v18 != 0.0)
    {
      [v16 doubleValue];
      double v19 = pow(v20, a5);
    }
    double v14 = v14 * v19;
    double v21 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG)) {
      sub_1000719B0((uint64_t)v16, (uint64_t)v8, v21);
    }
  }
  else
  {
    id v22 = FCProgressivePersonalizationLog;
    if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG)) {
      sub_100071938((uint64_t)v8, v22);
    }
  }

  return v14;
}

- (double)ctrForTagID:(id)a3 withAggregate:(id)a4 baselineAggregate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  double v12 = [(FRPersonalizationAutoFavoritesOperation *)self whitelist];
  long double v13 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  double v14 = [v13 defaultScoringConfig];
  [v14 baselineRatePrior];
  FCPersonalizationBaselineClicksMultiplerForTagID();

  double v15 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  [v15 decayRate];
  [v9 personalizationValueWithBaseline:v8];
  double v17 = v16;

  return v17;
}

- (BOOL)shouldAcceptAggregate:(id)a3 withCtr:(double)a4 minEvents:(double)a5 minClicks:(double)a6 minRate:(double)a7 baseRate:(double)a8 multiplier:(double)a9
{
  id v15 = a3;
  double v16 = (double)(unint64_t)[v15 eventCount];
  [v15 clicks];
  double v18 = v17;

  double v19 = a4 * a9;
  BOOL v20 = v16 * a9 >= a5;
  if (v18 * a9 < a6) {
    BOOL v20 = 0;
  }
  BOOL v21 = v19 >= a7;
  if (v19 < a8) {
    BOOL v21 = 0;
  }
  return v21 && v20;
}

- (BOOL)shouldRejectTagID:(id)a3 withAggregate:(id)a4 baseline:(id)a5 currentDate:(id)a6 addedDate:(id)a7 maxIdleTime:(double)a8 minEvents:(double)a9 minRate:(double)a10 baseRate:(double)a11 multiplier:(double)a12
{
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v26 = a7;
  double v27 = v26;
  if (v22)
  {
    if (v23)
    {
      double v28 = (double)(unint64_t)[v23 eventCount];
      [(FRPersonalizationAutoFavoritesOperation *)self ctrForTagID:v22 withAggregate:v23 baselineAggregate:v24];
      if (a9 * a12 <= v28)
      {
        double v32 = v29 * a12;
        LOBYTE(v31) = v32 < a11 || v32 < a10;
      }
      else
      {
        id v31 = [v23 lastModified];
        unsigned __int8 v30 = [v25 fc_isWithinTimeInterval:v31 ofDate:a8];

        LOBYTE(v31) = v30 ^ 1;
      }
    }
    else if (v26)
    {
      LODWORD(v31) = [v25 fc_isWithinTimeInterval:v26 ofDate:a8] ^ 1;
    }
    else
    {
      LOBYTE(v31) = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100071A38();
    }
    LOBYTE(v31) = 1;
  }

  return (char)v31;
}

- (id)auditCandidates:(id)a3 autoSubscriptionAddedDateByTagId:(id)a4 multiplierProvider:(id)a5
{
  id v38 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(FRPersonalizationAutoFavoritesOperation *)self configurableValues];
  uint64_t v11 = +[NSDate date];
  [v10 autoFavoriteMaxIdleTime];
  uint64_t v13 = v12;
  [v10 autoFavoriteMinEvents];
  uint64_t v15 = v14;
  [v10 autoFavoriteMinRate];
  uint64_t v17 = v16;
  double v18 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  double v19 = [v18 baselineAggregateWithConfigurableValues:v10];

  BOOL v20 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  [v20 decayRate];
  double v22 = v21;

  [v10 autoFavoriteMinRelativeRate];
  double v24 = v23;
  [v19 personalizationValueWithBaseline:0 decayRate:v22];
  double v26 = v24 * v25;
  double v27 = [(FRPersonalizationAutoFavoritesOperation *)self aggregateStore];
  double v28 = [v9 allObjects];
  double v29 = +[FCTagIDFeature featuresFromTagIDs:v28];
  unsigned __int8 v30 = [v27 aggregatesForFeatures:v29];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100025B50;
  v39[3] = &unk_1000C5F20;
  v39[4] = self;
  id v40 = v30;
  id v41 = v19;
  id v42 = v11;
  uint64_t v45 = v13;
  uint64_t v46 = v15;
  uint64_t v47 = v17;
  double v48 = v26;
  id v43 = v38;
  id v44 = v8;
  id v31 = v8;
  id v32 = v38;
  id v33 = v11;
  id v34 = v19;
  id v35 = v30;
  long long v36 = [v9 fc_setByTransformingWithBlock:v39];

  return v36;
}

- (FRPersonalizationAutoFavoritesCursor)cursor
{
  return self->_cursor;
}

- (FCPersonalizationTreatment)configurableValues
{
  return self->_configurableValues;
}

- (FCPersonalizationURLMapping)urlMapping
{
  return self->_urlMapping;
}

- (FCPersonalizationBundleIDMapping)bundleIDMapping
{
  return self->_bundleIDMapping;
}

- (FCPersonalizationWhitelist)whitelist
{
  return self->_whitelist;
}

- (FCPersonalizationFavorabilityScores)favorabilityScores
{
  return self->_favorabilityScores;
}

- (double)signalProcessingTimeInterval
{
  return self->_signalProcessingTimeInterval;
}

- (BOOL)disregardCache
{
  return self->_disregardCache;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (FCTagController)tagController
{
  return self->_tagController;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (FCTagRanking)tagRanker
{
  return self->_tagRanker;
}

- (FCReadonlyPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (TSLocationDetectionManagerType)locationManager
{
  return self->_locationManager;
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (FCLocalAreasManager)localAreasManager
{
  return self->_localAreasManager;
}

- (id)autoFavoritesCompletionHandler
{
  return self->_autoFavoritesCompletionHandler;
}

- (FRPersonalizationAutoFavorites)resultAutoFavorites
{
  return self->_resultAutoFavorites;
}

- (void)setResultAutoFavorites:(id)a3
{
}

- (FRPersonalizationAutoFavoritesCursor)resultCursor
{
  return self->_resultCursor;
}

- (void)setResultCursor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultCursor, 0);
  objc_storeStrong((id *)&self->_resultAutoFavorites, 0);
  objc_storeStrong(&self->_autoFavoritesCompletionHandler, 0);
  objc_storeStrong((id *)&self->_localAreasManager, 0);
  objc_storeStrong((id *)&self->_appConfiguration, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_aggregateStore, 0);
  objc_storeStrong((id *)&self->_tagRanker, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_tagController, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_favorabilityScores, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
  objc_storeStrong((id *)&self->_bundleIDMapping, 0);
  objc_storeStrong((id *)&self->_urlMapping, 0);
  objc_storeStrong((id *)&self->_configurableValues, 0);

  objc_storeStrong((id *)&self->_cursor, 0);
}

@end