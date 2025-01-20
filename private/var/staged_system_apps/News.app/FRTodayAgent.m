@interface FRTodayAgent
- (BOOL)_mayWidgetsBeVisible;
- (BOOL)isEnabled;
- (FCBoostableOperationThrottler)operationThrottler;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCFeedPersonalizing)feedPersonalizer;
- (FCFileCoordinatedTodayDropbox)fileCoordinatedTodayDropbox;
- (FCFileCoordinatedTodayPrivateDataTransactionQueue)fileCoordinatedTodayPrivateDataTransactionQueue;
- (FCPrivateDataContext)privateDataContext;
- (FCPurchaseController)purchaseController;
- (FCSubscriptionController)subscriptionController;
- (FRLimitedPersonalizationDataGeneratorType)personalizationDataGenerator;
- (FRTodayAgent)init;
- (FRTodayAgent)initWithFeedPersonalizer:(id)a3 purchaseController:(id)a4 subscriptionController:(id)a5 localNewsChannelService:(id)a6 bundleSubscriptionManager:(id)a7 personalizationDataGenerator:(id)a8 privateDataContext:(id)a9 userEmbeddingGenerator:(id)a10;
- (NPUserEmbeddingGeneratorType)userEmbeddingGenerator;
- (NSMutableArray)seenArticlesTransactions;
- (OS_dispatch_group)transactionProcessingGroup;
- (TSWidgetLocalNewsChannelServiceType)localNewsChannelService;
- (void)_didBecomeActive;
- (void)_didEnterBackground;
- (void)_historyDidClear;
- (void)_markDirtyWithFlags:(unint64_t)a3;
- (void)_markDirtyWithFlags:(unint64_t)a3 qualityOfService:(int64_t)a4;
- (void)_markPurchasesDirty;
- (void)_updateSuspensionState;
- (void)_willResignActive;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)dealloc;
- (void)enable;
- (void)operationThrottler:(id)a3 performAsyncOperationWithQualityOfService:(int64_t)a4 completion:(id)a5;
- (void)privateDataControllerDidBecomeClean:(id)a3;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingHistoryDidClear:(id)a3;
- (void)readingHistoryLikelyClearedRemotely:(id)a3;
- (void)serviceWidgetIfNeededWithCompletion:(id)a3;
- (void)setBundleSubscriptionManager:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFeedPersonalizer:(id)a3;
- (void)setFileCoordinatedTodayDropbox:(id)a3;
- (void)setFileCoordinatedTodayPrivateDataTransactionQueue:(id)a3;
- (void)setLocalNewsChannelService:(id)a3;
- (void)setOperationThrottler:(id)a3;
- (void)setPersonalizationDataGenerator:(id)a3;
- (void)setPrivateDataContext:(id)a3;
- (void)setPurchaseController:(id)a3;
- (void)setSubscriptionController:(id)a3;
- (void)setTransactionProcessingGroup:(id)a3;
- (void)setUserEmbeddingGenerator:(id)a3;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
- (void)userInfoDidChangeOnboardingStatus:(id)a3;
@end

@implementation FRTodayAgent

- (void)_didBecomeActive
{
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = [(FRTodayAgent *)self fileCoordinatedTodayPrivateDataTransactionQueue];
  [(FRTodayAgent *)self privateDataContext];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_10000A0C8;
  v10 = &unk_1000C9610;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  v5 = v3;
  id v6 = v11;
  [v4 dequeueTransactionsWithCompletion:&v7];
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 32, v7, v8, v9, v10);
  [(FRTodayAgent *)self _markPurchasesDirty];
  [(FRTodayAgent *)self _updateSuspensionState];
}

- (void)_markDirtyWithFlags:(unint64_t)a3 qualityOfService:(int64_t)a4
{
  id v6 = [(FRTodayAgent *)self operationThrottler];
  [v6 tickleWithQualityOfService:a4 data:a3 completion:0];
}

- (void)_markDirtyWithFlags:(unint64_t)a3
{
}

- (void)_updateSuspensionState
{
  if ([(FRTodayAgent *)self isEnabled]) {
    uint64_t v3 = [(FRTodayAgent *)self _mayWidgetsBeVisible] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = [(FRTodayAgent *)self operationThrottler];
  [v4 setSuspended:v3];
}

- (FCBoostableOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (FRTodayAgent)initWithFeedPersonalizer:(id)a3 purchaseController:(id)a4 subscriptionController:(id)a5 localNewsChannelService:(id)a6 bundleSubscriptionManager:(id)a7 personalizationDataGenerator:(id)a8 privateDataContext:(id)a9 userEmbeddingGenerator:(id)a10
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v48 = a5;
  id v19 = a5;
  id v49 = a6;
  id v20 = a6;
  id v50 = a7;
  id v52 = a7;
  id v54 = a8;
  id v21 = a9;
  id v53 = a10;
  if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100078A60();
  }
  v51 = v18;
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007899C();
  }
  v22 = v19;
  if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000788D8();
  }
  v23 = v20;
  if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100078814();
  }
  if (!v54 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100078750();
    if (v21) {
      goto LABEL_18;
    }
  }
  else if (v21)
  {
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007868C();
  }
LABEL_18:
  if (!v53 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000785C8();
  }
  v55.receiver = self;
  v55.super_class = (Class)FRTodayAgent;
  v24 = [(FRTodayAgent *)&v55 init];
  v25 = v24;
  if (v24)
  {
    id v46 = v17;
    objc_storeStrong((id *)&v24->_feedPersonalizer, a3);
    dispatch_group_t v26 = dispatch_group_create();
    transactionProcessingGroup = v25->_transactionProcessingGroup;
    v25->_transactionProcessingGroup = (OS_dispatch_group *)v26;

    id v28 = objc_alloc((Class)FCFileCoordinatedTodayPrivateDataTransactionQueue);
    v29 = FCURLForTodayPrivateDataTransactionQueue();
    v30 = (FCFileCoordinatedTodayPrivateDataTransactionQueue *)[v28 initWithFileURL:v29];
    fileCoordinatedTodayPrivateDataTransactionQueue = v25->_fileCoordinatedTodayPrivateDataTransactionQueue;
    v25->_fileCoordinatedTodayPrivateDataTransactionQueue = v30;

    id v32 = objc_alloc((Class)FCFileCoordinatedTodayDropbox);
    v33 = FCURLForTodayDropbox();
    v34 = (FCFileCoordinatedTodayDropbox *)[v32 initWithFileURL:v33];
    fileCoordinatedTodayDropbox = v25->_fileCoordinatedTodayDropbox;
    v25->_fileCoordinatedTodayDropbox = v34;

    objc_storeStrong((id *)&v25->_personalizationDataGenerator, a8);
    v36 = [v21 personalizationData];
    [v36 addStateObserver:v25];
    objc_storeStrong((id *)&v25->_purchaseController, obj);
    v37 = +[NSNotificationCenter defaultCenter];
    [v37 addObserver:v25 selector:"_markPurchasesDirty" name:FCPurchaseListChangedNotificationName object:0];
    v38 = [v21 readingHistory];
    [v38 addObserver:v25];
    [v38 addStateObserver:v25];
    objc_storeStrong((id *)&v25->_subscriptionController, v48);
    [v22 addObserver:v25];
    objc_storeStrong((id *)&v25->_localNewsChannelService, v49);
    objc_storeStrong((id *)&v25->_bundleSubscriptionManager, v50);
    [v52 addObserver:v25];
    objc_storeStrong((id *)&v25->_privateDataContext, a9);
    v39 = [v21 userInfo];
    [v39 addObserver:v25];

    objc_storeStrong((id *)&v25->_userEmbeddingGenerator, a10);
    [v37 addObserver:v25 selector:"_didBecomeActive" name:UIApplicationDidBecomeActiveNotification object:0];
    [v37 addObserver:v25 selector:"_willResignActive" name:UIApplicationWillResignActiveNotification object:0];
    [v37 addObserver:v25 selector:"_didEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
    v40 = +[FCFileCoordinatedTodayDropboxTransaction transactionOfIdentity];
    if (v40) {
      +[NSMutableArray arrayWithObject:v40];
    }
    else {
    uint64_t v41 = +[NSMutableArray array];
    }
    seenArticlesTransactions = v25->_seenArticlesTransactions;
    v25->_seenArticlesTransactions = (NSMutableArray *)v41;

    v43 = (FCBoostableOperationThrottler *)[objc_alloc((Class)FCBoostableOperationThrottler) initWithDelegate:v25];
    operationThrottler = v25->_operationThrottler;
    v25->_operationThrottler = v43;

    [(FRTodayAgent *)v25 _updateSuspensionState];
    [(FRTodayAgent *)v25 _markDirtyWithFlags:72];

    id v17 = v46;
  }

  return v25;
}

- (FCPrivateDataContext)privateDataContext
{
  return self->_privateDataContext;
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)fileCoordinatedTodayPrivateDataTransactionQueue
{
  return self->_fileCoordinatedTodayPrivateDataTransactionQueue;
}

- (void)_markPurchasesDirty
{
  +[NSThread isMainThread];

  [(FRTodayAgent *)self _markDirtyWithFlags:16];
}

- (FRTodayAgent)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v6 = "-[FRTodayAgent init]";
    __int16 v7 = 2080;
    uint64_t v8 = "FRTodayAgent.m";
    __int16 v9 = 1024;
    int v10 = 58;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRTodayAgent init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)enable
{
  [(FRTodayAgent *)self setEnabled:1];

  [(FRTodayAgent *)self _updateSuspensionState];
}

- (void)serviceWidgetIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(FRTodayAgent *)self operationThrottler];
  [v5 tickleWithCompletion:v4];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationDidBecomeActiveNotification object:0];
  [v3 removeObserver:self name:UIApplicationWillResignActiveNotification object:0];
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  [v3 removeObserver:self name:FCPurchaseListChangedNotificationName object:0];

  v4.receiver = self;
  v4.super_class = (Class)FRTodayAgent;
  [(FRTodayAgent *)&v4 dealloc];
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v14 = a5;
  id v12 = a6;
  id v13 = a7;
  if ([a4 count]
    || [v14 count]
    || [v12 count]
    || [v13 count])
  {
    [(FRTodayAgent *)self _markDirtyWithFlags:4];
  }
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[NSThread isMainThread];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v25 = 0;
  dispatch_group_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 9;
  id v8 = [v7 copy];
  __int16 v9 = objc_opt_new();
  int v10 = objc_opt_new();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100057F0C;
  v19[3] = &unk_1000C95C0;
  v23 = &v29;
  v24 = &v25;
  id v11 = v6;
  id v20 = v11;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  [v8 enumerateKeysAndObjectsUsingBlock:v19];
  if ([v12 count] || objc_msgSend(v13, "count"))
  {
    id v14 = [v11 historyItemsForArticleIDs:v12];
    v15 = +[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:v14 deletedArticleIDs:v13];
    if (v15)
    {
      v16 = [(FRTodayAgent *)self seenArticlesTransactions];
      [v16 addObject:v15];
    }
  }
  if (*((unsigned char *)v30 + 24))
  {
    id v17 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Marking reading history as dirty", v18, 2u);
    }
    [(FRTodayAgent *)self _markDirtyWithFlags:2 qualityOfService:v26[3]];
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)readingHistoryLikelyClearedRemotely:(id)a3
{
}

- (void)readingHistoryDidClear:(id)a3
{
}

- (void)_historyDidClear
{
  +[NSThread isMainThread];
  id v4 = +[FCFileCoordinatedTodayDropboxTransaction transactionToClearSeenArticles];
  if (v4)
  {
    uint64_t v3 = [(FRTodayAgent *)self seenArticlesTransactions];
    [v3 addObject:v4];
  }
  [(FRTodayAgent *)self _markDirtyWithFlags:2];
}

- (void)privateDataControllerDidBecomeClean:(id)a3
{
  id v10 = a3;
  id v4 = [(FRTodayAgent *)self privateDataContext];
  id v5 = [v4 personalizationData];

  if (v5 == v10)
  {
    uint64_t v9 = 32;
  }
  else
  {
    id v6 = [(FRTodayAgent *)self privateDataContext];
    id v7 = [v6 readingHistory];

    id v8 = v10;
    if (v7 != v10) {
      goto LABEL_6;
    }
    uint64_t v9 = 2;
  }
  [(FRTodayAgent *)self _markDirtyWithFlags:v9];
  id v8 = v10;
LABEL_6:
}

- (void)userInfoDidChangeOnboardingStatus:(id)a3
{
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
}

- (void)_willResignActive
{
  [(FRTodayAgent *)self setEnabled:1];

  [(FRTodayAgent *)self _updateSuspensionState];
}

- (void)_didEnterBackground
{
  [(FRTodayAgent *)self _updateSuspensionState];
  uint64_t v3 = +[UIApplication sharedApplication];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100058354;
  v10[3] = &unk_1000C8480;
  v10[4] = &v11;
  id v4 = [v3 beginBackgroundTaskWithName:@"TodayAgentUpdate" expirationHandler:v10];
  v12[3] = (uint64_t)v4;
  id v5 = [(FRTodayAgent *)self operationThrottler];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000583B4;
  v7[3] = &unk_1000C9408;
  id v6 = v3;
  id v8 = v6;
  uint64_t v9 = &v11;
  [v5 tickleWithQualityOfService:25 data:0 completion:v7];

  _Block_object_dispose(&v11, 8);
}

- (BOOL)_mayWidgetsBeVisible
{
  id v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 applicationState] != 0;

  return v3;
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7 = (void (**)(void))a5;
  id v8 = [(FRTodayAgent *)self operationThrottler];
  id v9 = [v8 mergedData];

  id v10 = FRTodayAgentLog;
  if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Performing throttler operation with flags %ld", buf, 0xCu);
  }
  if (v9)
  {
    uint64_t v11 = [(FRTodayAgent *)self transactionProcessingGroup];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100058618;
    block[3] = &unk_1000C97E0;
    block[4] = self;
    v15 = v7;
    id v16 = v9;
    int64_t v17 = a4;
    id v12 = v7;
    dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, block);

    uint64_t v13 = v15;
  }
  else
  {
    id v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_100058608;
    id v21 = &unk_1000C6E28;
    id v22 = v7;
    v7[2](v7);
    uint64_t v13 = v7;
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableArray)seenArticlesTransactions
{
  return self->_seenArticlesTransactions;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (void)setPurchaseController:(id)a3
{
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
}

- (TSWidgetLocalNewsChannelServiceType)localNewsChannelService
{
  return self->_localNewsChannelService;
}

- (void)setLocalNewsChannelService:(id)a3
{
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
}

- (FRLimitedPersonalizationDataGeneratorType)personalizationDataGenerator
{
  return self->_personalizationDataGenerator;
}

- (void)setPersonalizationDataGenerator:(id)a3
{
}

- (void)setPrivateDataContext:(id)a3
{
}

- (NPUserEmbeddingGeneratorType)userEmbeddingGenerator
{
  return self->_userEmbeddingGenerator;
}

- (void)setUserEmbeddingGenerator:(id)a3
{
}

- (OS_dispatch_group)transactionProcessingGroup
{
  return self->_transactionProcessingGroup;
}

- (void)setTransactionProcessingGroup:(id)a3
{
}

- (void)setFileCoordinatedTodayPrivateDataTransactionQueue:(id)a3
{
}

- (FCFileCoordinatedTodayDropbox)fileCoordinatedTodayDropbox
{
  return self->_fileCoordinatedTodayDropbox;
}

- (void)setFileCoordinatedTodayDropbox:(id)a3
{
}

- (void)setOperationThrottler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationThrottler, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedTodayDropbox, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedTodayPrivateDataTransactionQueue, 0);
  objc_storeStrong((id *)&self->_transactionProcessingGroup, 0);
  objc_storeStrong((id *)&self->_userEmbeddingGenerator, 0);
  objc_storeStrong((id *)&self->_privateDataContext, 0);
  objc_storeStrong((id *)&self->_personalizationDataGenerator, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_localNewsChannelService, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);

  objc_storeStrong((id *)&self->_seenArticlesTransactions, 0);
}

@end