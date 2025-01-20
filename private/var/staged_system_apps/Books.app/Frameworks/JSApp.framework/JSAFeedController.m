@interface JSAFeedController
- (BOOL)abandoned;
- (BOOL)executeBehaviorNamed:(id)a3 forEntry:(id)a4 withArguments:(id)a5;
- (BOOL)feedBridged;
- (BOOL)hasPresentingFeed;
- (BOOL)isRootFeed;
- (BSUIDynamicValue)currentStackName;
- (JSAFeedController)initWithOptions:(id)a3 completion:(id)a4;
- (JSAFeedControllerDataSource)dataSource;
- (JSAFeedControllerDelegate)delegate;
- (JSAFeedMetadata)metadata;
- (JSValue)bridgeCompletion;
- (JSValue)feed;
- (NSArray)entries;
- (NSDictionary)metrics;
- (NSDictionary)options;
- (OS_dispatch_queue)access;
- (UIViewController)viewController;
- (id)analyticsTracker;
- (id)requestEntriesCompletionBlock;
- (int64_t)viewState;
- (void)_convertOrCreateViewController:(id)a3 completion:(id)a4;
- (void)addAlphaOverrideToItem:(id)a3 :(double)a4 :(BOOL)a5 :(double)a6;
- (void)addWeakTriggerObserver:(id)a3 :(id)a4;
- (void)allContentReady;
- (void)appendToPresentedCards:(id)a3 :(id)a4;
- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsWithCompletion:(id)a4;
- (void)collectStatsWithCompletion:(id)a3;
- (void)collectVisibleImpressionsWithCompletion:(id)a3;
- (void)dealloc;
- (void)didLoadCardResource:(id)a3;
- (void)dismissKeyboard;
- (void)dismissViewController:(BOOL)a3 :(id)a4;
- (void)hideLoadingView;
- (void)hotReloadControllerDidReloadScript:(id)a3 completion:(id)a4;
- (void)hotReloadControllerWillReloadScript:(id)a3 completion:(id)a4;
- (void)notifyAnalyticsVisibilityDidAppear;
- (void)notifyAnalyticsVisibilityWillDisappear;
- (void)notifyDidAppear;
- (void)notifyInitialContentReady;
- (void)notifyOnAppear;
- (void)notifyOnDisappear;
- (void)notifyOnMessageActionTriggered:(id)a3;
- (void)notifyParentCardWillDismissWithReason:(id)a3 targetFeed:(id)a4;
- (void)notifyScrollViewReachedTheBottom;
- (void)performRawActionModel:(id)a3 shouldReportFigaro:(BOOL)a4;
- (void)performRawFlowAction:(id)a3 shouldReportFigaro:(BOOL)a4;
- (void)popToRootViewController:(BOOL)a3 :(id)a4;
- (void)popViewController:(BOOL)a3 :(id)a4;
- (void)presentCards:(id)a3 :(unint64_t)a4 :(BOOL)a5 :(id)a6 :(id)a7;
- (void)presentCardsWithOptions:(id)a3 :(unint64_t)a4 :(id)a5 :(BOOL)a6 :(id)a7 :(id)a8;
- (void)presentFeedViewControllerInPopover:(id)a3 :(id)a4;
- (void)presentScreenshotViewController:(id)a3;
- (void)presentViewController:(id)a3 :(BOOL)a4 :(id)a5;
- (void)pushViewController:(id)a3 :(BOOL)a4;
- (void)reload;
- (void)removeAlphaOverrideFromItem:(id)a3 :(BOOL)a4 :(double)a5;
- (void)renderSharableImage:(id)a3 :(id)a4;
- (void)replaceCurrentFeedViewController:(id)a3 :(BOOL)a4;
- (void)requestCompleteDataForEntry:(id)a3 completion:(id)a4;
- (void)requestEntriesWithCompletion:(id)a3;
- (void)requestToSetNavigationBarHidden:(BOOL)a3 :(BOOL)a4;
- (void)resetImpressions;
- (void)scrollToItem:(id)a3 :(BOOL)a4 :(BOOL)a5;
- (void)setAbandoned:(BOOL)a3;
- (void)setAccess:(id)a3;
- (void)setBridgeCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeed:(id)a3;
- (void)setFeedBridged:(BOOL)a3;
- (void)setFeedDataRequestPriority:(float)a3;
- (void)setMetadata:(id)a3;
- (void)setRequestEntriesCompletionBlock:(id)a3;
- (void)showLoadingView;
- (void)slideInFeedViewController:(id)a3;
- (void)tearDownWithCompletion:(id)a3;
- (void)updateContentWithData:(id)a3;
- (void)viewStateDidUpdate:(id)a3;
@end

@implementation JSAFeedController

- (JSAFeedController)initWithOptions:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)JSAFeedController;
  v9 = [(JSAFeedController *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    v10->_didNotifyInitialContentReady = 0;
    v10->_didNotifyInitialContentReadyLock._os_unfair_lock_opaque = 0;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    v13 = dispatch_queue_attr_make_initially_inactive(v12);
    dispatch_queue_t v14 = dispatch_queue_create("JSAFeedViewController.access", v13);
    access = v10->_access;
    v10->_access = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v10->_bridgeCompletion, a4);
    objc_opt_class();
    v16 = [v7 objectForKeyedSubscript:@"isRootFeed"];
    v17 = BUDynamicCast();
    v10->_isRootFeed = [v17 BOOLValue];

    v18 = [v7 objectForKeyedSubscript:@"metadata"];
    sub_194F8((uint64_t)v10, v18);

    sub_19574((uint64_t)v10, 0);
    if (+[JSADevice isInternalBuild])
    {
      v19 = +[JSAHotReloadController sharedController];
      [v19 subscribe:v10];
    }
  }

  return v10;
}

- (void)dealloc
{
  if (+[JSADevice isInternalBuild])
  {
    v3 = +[JSAHotReloadController sharedController];
    [v3 unsubscribe:self];
  }
  dispatch_activate((dispatch_object_t)self->_access);
  v4.receiver = self;
  v4.super_class = (Class)JSAFeedController;
  [(JSAFeedController *)&v4 dealloc];
}

- (void)requestEntriesWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v30 = "-[JSAFeedController requestEntriesWithCompletion:]";
    __int16 v31 = 2048;
    v32 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p: start", buf, 0x16u);
  }

  v6 = JSASignpostFeedController();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  id v8 = JSASignpostFeedController();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Request Entries", "", buf, 2u);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_19A68;
  v26[3] = &unk_B2C30;
  os_signpost_id_t v28 = v7;
  id v10 = v4;
  id v27 = v10;
  v11 = objc_retainBlock(v26);
  objc_initWeak((id *)buf, self);
  v12 = self->_access;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_19B2C;
  v22[3] = &unk_B2C80;
  v22[4] = self;
  objc_copyWeak(&v25, (id *)buf);
  v13 = v12;
  v23 = v13;
  dispatch_queue_t v14 = v11;
  id v24 = v14;
  v15 = objc_retainBlock(v22);
  v16 = +[JSABridge sharedInstance];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_19E34;
  v19[3] = &unk_B2CA8;
  v19[4] = self;
  v17 = v15;
  id v20 = v17;
  v18 = v14;
  id v21 = v18;
  [v16 enqueueBlock:v19 file:@"JSAFeedController.m" line:166];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)requestCompleteDataForEntry:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[JSABridge sharedInstance];
  v9 = [(JSAFeedController *)self feed];
  v12[0] = v7;
  id v10 = objc_retainBlock(v6);

  v12[1] = v10;
  v11 = +[NSArray arrayWithObjects:v12 count:2];

  [v8 enqueueValueInvocation:v9 method:@"requestEntryCompleteData" arguments:v11 file:@"JSAFeedController.m" line:171];
}

- (BOOL)executeBehaviorNamed:(id)a3 forEntry:(id)a4 withArguments:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  if ([v8 isEqualToString:@"MORE"])
  {
    id v11 = objc_loadWeakRetained(&location);
    v12 = [v11 feed];
    sub_1A2F8(v12, v8, v9, v10);
  }
  else
  {
    v13 = +[JSABridge sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1A450;
    v15[3] = &unk_B2CD0;
    objc_copyWeak(&v19, &location);
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    [v13 enqueueBlock:v15 file:@"JSAFeedController.m" line:200];

    objc_destroyWeak(&v19);
  }
  objc_destroyWeak(&location);

  return 1;
}

- (void)reload
{
}

- (void)updateContentWithData:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[JSAFeedController updateContentWithData:]";
    __int16 v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p:", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B268;
  v7[3] = &unk_B2BE0;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)viewStateDidUpdate:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v10 = "-[JSAFeedController viewStateDidUpdate:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p: to %@", buf, 0x20u);
  }

  viewState = (void *)self->_viewState;
  self->_viewState = (int64_t)sub_1B43C(self, v4);
  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1B4D0;
  v7[3] = &unk_B2D70;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = viewState;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

- (void)setFeedDataRequestPriority:(float)a3
{
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v13 = "-[JSAFeedController setFeedDataRequestPriority:]";
    __int16 v14 = 2048;
    v15 = self;
    __int16 v16 = 2048;
    double v17 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p: => %0.1f", buf, 0x20u);
  }

  id v6 = +[JSABridge sharedInstance];
  id v7 = [(JSAFeedController *)self feed];
  *(float *)&double v8 = a3;
  id v9 = +[NSNumber numberWithFloat:v8];
  __int16 v11 = v9;
  id v10 = +[NSArray arrayWithObjects:&v11 count:1];
  [v6 enqueueValueInvocation:v7 method:@"setRequestsPriority" arguments:v10 file:@"JSAFeedController.m" line:292];
}

- (void)pushViewController:(id)a3 :(BOOL)a4
{
  id v6 = a3;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v14 = "-[JSAFeedController pushViewController::]";
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1B848;
  v9[3] = &unk_B2D98;
  objc_copyWeak(&v11, (id *)buf);
  v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  BOOL v12 = a4;
  [(JSAFeedController *)self _convertOrCreateViewController:v8 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)replaceCurrentFeedViewController:(id)a3 :(BOOL)a4
{
  id v6 = a3;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v12 = "-[JSAFeedController replaceCurrentFeedViewController::]";
    __int16 v13 = 2048;
    __int16 v14 = self;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = sub_1BC48;
  v8[3] = &unk_B2DC0;
  objc_copyWeak(&v9, (id *)buf);
  BOOL v10 = a4;
  [(JSAFeedController *)self _convertOrCreateViewController:v6 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)presentViewController:(id)a3 :(BOOL)a4 :(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = JSALog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v17 = "-[JSAFeedController presentViewController:::]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_1BE94;
  v12[3] = &unk_B2DE8;
  objc_copyWeak(&v14, (id *)buf);
  BOOL v15 = a4;
  id v11 = v9;
  id v13 = v11;
  [(JSAFeedController *)self _convertOrCreateViewController:v8 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)presentScreenshotViewController:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v11 = "-[JSAFeedController presentScreenshotViewController:]";
    __int16 v12 = 2048;
    id v13 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C094;
  v7[3] = &unk_B2BE0;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)slideInFeedViewController:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 description];
    *(_DWORD *)buf = 136446722;
    BOOL v10 = "-[JSAFeedController slideInFeedViewController:]";
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C280;
  v7[3] = &unk_B2E10;
  objc_copyWeak(&v8, (id *)buf);
  [(JSAFeedController *)self _convertOrCreateViewController:v4 completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)presentFeedViewControllerInPopover:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 description];
    *(_DWORD *)buf = 136446722;
    BOOL v15 = "-[JSAFeedController presentFeedViewControllerInPopover::]";
    __int16 v16 = 2048;
    __int16 v17 = self;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1C4CC;
  v11[3] = &unk_B2E38;
  objc_copyWeak(&v13, (id *)buf);
  id v10 = v7;
  id v12 = v10;
  [(JSAFeedController *)self _convertOrCreateViewController:v6 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)popViewController:(BOOL)a3 :(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v17 = "-[JSAFeedController popViewController::]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: animated=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_1C78C;
  v12[3] = &unk_B2E60;
  objc_copyWeak(&v14, (id *)buf);
  BOOL v15 = v4;
  id v8 = v6;
  id v13 = v8;
  id v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1C848;
      v10[3] = &unk_B2028;
      __int16 v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)popToRootViewController:(BOOL)a3 :(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v17 = "-[JSAFeedController popToRootViewController::]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: animated=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_1CA7C;
  v12[3] = &unk_B2E60;
  objc_copyWeak(&v14, (id *)buf);
  BOOL v15 = v4;
  id v8 = v6;
  id v13 = v8;
  id v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1CB38;
      v10[3] = &unk_B2028;
      __int16 v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)dismissViewController:(BOOL)a3 :(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v17 = "-[JSAFeedController dismissViewController::]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: animated=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_1CD6C;
  v12[3] = &unk_B2E60;
  objc_copyWeak(&v14, (id *)buf);
  BOOL v15 = v4;
  id v8 = v6;
  id v13 = v8;
  id v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1CE0C;
      v10[3] = &unk_B2028;
      __int16 v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)presentCardsWithOptions:(id)a3 :(unint64_t)a4 :(id)a5 :(BOOL)a6 :(id)a7 :(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  __int16 v18 = JSALog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = +[NSNumber numberWithUnsignedInteger:a4];
    __int16 v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
    *(_DWORD *)buf = 136446978;
    v34 = "-[JSAFeedController presentCardsWithOptions::::::]";
    __int16 v35 = 2048;
    v36 = self;
    __int16 v37 = 2112;
    v38 = v19;
    __int16 v39 = 2112;
    v40 = v20;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@ of %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1D104;
  v27[3] = &unk_B2E88;
  objc_copyWeak(v31, (id *)buf);
  id v21 = v17;
  id v28 = v21;
  id v22 = v14;
  id v29 = v22;
  v31[1] = (id)a4;
  BOOL v32 = a6;
  id v23 = v16;
  id v30 = v23;
  id v24 = objc_retainBlock(v27);
  if (v24)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v24[2])(v24);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1D25C;
      block[3] = &unk_B2028;
      v26 = v24;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(v31);
  objc_destroyWeak((id *)buf);
}

- (void)presentCards:(id)a3 :(unint64_t)a4 :(BOOL)a5 :(id)a6 :(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = JSALog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = +[NSNumber numberWithUnsignedInteger:a4];
    id v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 count]);
    *(_DWORD *)buf = 136446978;
    __int16 v31 = "-[JSAFeedController presentCards:::::]";
    __int16 v32 = 2048;
    v33 = self;
    __int16 v34 = 2112;
    __int16 v35 = v16;
    __int16 v36 = 2112;
    __int16 v37 = v17;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@ of %@", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1D544;
  v24[3] = &unk_B2E88;
  objc_copyWeak(v28, (id *)buf);
  id v18 = v14;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  v28[1] = (id)a4;
  BOOL v29 = a5;
  id v20 = v13;
  id v27 = v20;
  id v21 = objc_retainBlock(v24);
  if (v21)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v21[2])(v21);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1D69C;
      block[3] = &unk_B2028;
      id v23 = v21;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);
}

- (void)appendToPresentedCards:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
    *(_DWORD *)buf = 136446722;
    id v20 = "-[JSAFeedController appendToPresentedCards::]";
    __int16 v21 = 2048;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: adding %@ cards", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1D91C;
  v15[3] = &unk_B2130;
  objc_copyWeak(&v18, (id *)buf);
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  id v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v12[2])(v12);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1D994;
      v13[3] = &unk_B2028;
      id v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)didLoadCardResource:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v14 = "-[JSAFeedController didLoadCardResource:]";
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p: has loaded card resource: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1DBC0;
  v10[3] = &unk_B2BE0;
  objc_copyWeak(&v12, (id *)buf);
  id v6 = v4;
  id v11 = v6;
  id v7 = objc_retainBlock(v10);
  if (v7)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v7[2])(v7);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1DC38;
      block[3] = &unk_B2028;
      id v9 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)performRawActionModel:(id)a3 shouldReportFigaro:(BOOL)a4
{
  id v6 = a3;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v17 = "-[JSAFeedController performRawActionModel:shouldReportFigaro:]";
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: performing FlowAction: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_1DE6C;
  v12[3] = &unk_B2E60;
  objc_copyWeak(&v14, (id *)buf);
  id v8 = v6;
  id v13 = v8;
  BOOL v15 = a4;
  id v9 = objc_retainBlock(v12);
  if (v9)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v9[2])(v9);
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1DEE8;
      v10[3] = &unk_B2028;
      id v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)performRawFlowAction:(id)a3 shouldReportFigaro:(BOOL)a4
{
}

- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsWithCompletion:(id)a4
{
  id v6 = a4;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[JSAFeedController collectAndFlush:accumulatedImpressionsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  id v8 = [(JSAFeedController *)self delegate];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v21 = sub_1E174;
  id v22 = sub_1E184;
  id v9 = [(JSAFeedController *)self dataSource];
  id v23 = [v9 newAnalyticsSessionExtendingAssertionForFeedController:self];

  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    id v10 = JSALog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_85670();
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1E18C;
  v13[3] = &unk_B2F00;
  objc_copyWeak(&v17, &location);
  BOOL v18 = a3;
  id v14 = v8;
  id v15 = v6;
  id v16 = buf;
  id v11 = v6;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v17);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)collectVisibleImpressionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[JSAFeedController collectVisibleImpressionsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v15 = sub_1E174;
  id v16 = sub_1E184;
  id v6 = [(JSAFeedController *)self dataSource];
  id v17 = [v6 newAnalyticsSessionExtendingAssertionForFeedController:self];

  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    id v7 = JSALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_856E4();
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1E680;
  block[3] = &unk_B2F28;
  objc_copyWeak(&v12, &location);
  void block[4] = self;
  id v10 = v4;
  id v11 = buf;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)resetImpressions
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[JSAFeedController resetImpressions]";
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1EB20;
  v7[3] = &unk_B22D8;
  objc_copyWeak(&v8, (id *)buf);
  id v4 = objc_retainBlock(v7);
  if (v4)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v4[2])(v4);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1EB90;
      v5[3] = &unk_B2028;
      id v6 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)collectStatsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[JSAFeedController collectStatsWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v15 = sub_1E174;
  id v16 = sub_1E184;
  id v6 = [(JSAFeedController *)self dataSource];
  id v17 = [v6 newAnalyticsSessionExtendingAssertionForFeedController:self];

  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    id v7 = JSALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_85758();
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EDDC;
  block[3] = &unk_B2F28;
  objc_copyWeak(&v12, &location);
  void block[4] = self;
  id v10 = v4;
  __int16 v11 = buf;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)dismissKeyboard
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[JSAFeedController dismissKeyboard]";
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1F27C;
  v7[3] = &unk_B22D8;
  objc_copyWeak(&v8, (id *)buf);
  id v4 = objc_retainBlock(v7);
  if (v4)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v4[2])(v4);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1F2F0;
      v5[3] = &unk_B2028;
      id v6 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)scrollToItem:(id)a3 :(BOOL)a4 :(BOOL)a5
{
  id v8 = a3;
  id v9 = JSALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    __int16 v20 = "-[JSAFeedController scrollToItem:::]";
    __int16 v21 = 2048;
    id v22 = self;
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1F534;
  v14[3] = &unk_B2F78;
  objc_copyWeak(&v16, (id *)buf);
  id v10 = v8;
  id v15 = v10;
  BOOL v17 = a4;
  BOOL v18 = a5;
  __int16 v11 = objc_retainBlock(v14);
  if (v11)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_1F5B8;
      v12[3] = &unk_B2028;
      id v13 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)requestToSetNavigationBarHidden:(BOOL)a3 :(BOOL)a4
{
  BOOL v5 = a3;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    id v16 = "-[JSAFeedController requestToSetNavigationBarHidden::]";
    __int16 v17 = 2048;
    BOOL v18 = self;
    __int16 v19 = 1024;
    BOOL v20 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s %p: hidden=%{BOOL}d", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1F7D4;
  v11[3] = &unk_B2FA0;
  objc_copyWeak(&v12, (id *)buf);
  BOOL v13 = v5;
  BOOL v14 = a4;
  id v8 = objc_retainBlock(v11);
  if (v8)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v8[2])(v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1F850;
      block[3] = &unk_B2028;
      id v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)renderSharableImage:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v19 = "-[JSAFeedController renderSharableImage::]";
    __int16 v20 = 2048;
    __int16 v21 = self;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1FA94;
  v14[3] = &unk_B2130;
  objc_copyWeak(&v17, (id *)buf);
  id v9 = v6;
  id v15 = v9;
  id v10 = v7;
  id v16 = v10;
  __int16 v11 = objc_retainBlock(v14);
  if (v11)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_1FB0C;
      v12[3] = &unk_B2028;
      BOOL v13 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)addAlphaOverrideToItem:(id)a3 :(double)a4 :(BOOL)a5 :(double)a6
{
  id v10 = a3;
  __int16 v11 = JSALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v21 = "-[JSAFeedController addAlphaOverrideToItem::::]";
    __int16 v22 = 2048;
    __int16 v23 = self;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    double v27 = a4;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@ alpha=%0.1g", buf, 0x2Au);
  }

  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1FD64;
  v16[3] = &unk_B2FC8;
  objc_copyWeak(v18, (id *)buf);
  id v12 = v10;
  id v17 = v12;
  BOOL v19 = a5;
  v18[1] = *(id *)&a4;
  v18[2] = *(id *)&a6;
  BOOL v13 = objc_retainBlock(v16);
  if (v13)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v13[2])(v13);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1FDE8;
      v14[3] = &unk_B2028;
      id v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    }
  }

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

- (void)removeAlphaOverrideFromItem:(id)a3 :(BOOL)a4 :(double)a5
{
  id v8 = a3;
  id v9 = JSALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v19 = "-[JSAFeedController removeAlphaOverrideFromItem:::]";
    __int16 v20 = 2048;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_20024;
  v14[3] = &unk_B2FF0;
  objc_copyWeak(v16, (id *)buf);
  id v10 = v8;
  id v15 = v10;
  BOOL v17 = a4;
  v16[1] = *(id *)&a5;
  __int16 v11 = objc_retainBlock(v14);
  if (v11)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v11[2])(v11);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_200A8;
      block[3] = &unk_B2028;
      BOOL v13 = v11;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);
}

- (void)showLoadingView
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[JSAFeedController showLoadingView]";
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_202A0;
  v7[3] = &unk_B22D8;
  objc_copyWeak(&v8, (id *)buf);
  id v4 = objc_retainBlock(v7);
  if (v4)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v4[2])(v4);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_20310;
      v5[3] = &unk_B2028;
      id v6 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)hideLoadingView
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[JSAFeedController hideLoadingView]";
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_20508;
  v7[3] = &unk_B22D8;
  objc_copyWeak(&v8, (id *)buf);
  id v4 = objc_retainBlock(v7);
  if (v4)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v4[2])(v4);
    }
    else
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_20578;
      v5[3] = &unk_B2028;
      id v6 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
    }
  }

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)addWeakTriggerObserver:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    BOOL v19 = "-[JSAFeedController addWeakTriggerObserver::]";
    __int16 v20 = 2048;
    __int16 v21 = self;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s %p: %@", buf, 0x20u);
  }

  id v9 = +[JSManagedValue managedValueWithValue:v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_20798;
  v15[3] = &unk_B2560;
  void v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v12 = objc_retainBlock(v15);
  if (v12)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v12[2])(v12);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_20C48;
      v13[3] = &unk_B2028;
      BOOL v14 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)notifyScrollViewReachedTheBottom
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_20D18;
  v3[3] = &unk_B22D8;
  objc_copyWeak(&v4, &location);
  sub_20DAC(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyOnAppear
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_20FC8;
  v3[3] = &unk_B22D8;
  objc_copyWeak(&v4, &location);
  sub_20DAC(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyDidAppear
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_210C8;
  v3[3] = &unk_B22D8;
  objc_copyWeak(&v4, &location);
  sub_20DAC(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyOnDisappear
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_211C8;
  v3[3] = &unk_B22D8;
  objc_copyWeak(&v4, &location);
  sub_20DAC(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyInitialContentReady
{
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  p_didNotifyInitialContentReadyLock = &self->_didNotifyInitialContentReadyLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v9 = sub_2138C;
  id v10 = &unk_B2430;
  id v11 = self;
  id v12 = &v13;
  id v4 = v8;
  os_unfair_lock_lock_with_options();
  v9((uint64_t)v4);
  os_unfair_lock_unlock(p_didNotifyInitialContentReadyLock);

  if (*((unsigned char *)v14 + 24))
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_213B0;
    v5[3] = &unk_B22D8;
    objc_copyWeak(&v6, &location);
    sub_20DAC(self, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v13, 8);
}

- (void)allContentReady
{
}

- (void)notifyParentCardWillDismissWithReason:(id)a3 targetFeed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_21554;
  v10[3] = &unk_B2130;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v7;
  id v12 = v9;
  sub_20DAC(self, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)notifyAnalyticsVisibilityDidAppear
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2175C;
  v3[3] = &unk_B22D8;
  objc_copyWeak(&v4, &location);
  sub_20DAC(self, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)notifyAnalyticsVisibilityWillDisappear
{
  v3 = [(JSAFeedController *)self dataSource];
  id v4 = [v3 newAnalyticsSessionAssertionForFeedController:self];

  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_21898;
  v6[3] = &unk_B2BE0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  sub_20DAC(self, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)notifyOnMessageActionTriggered:(id)a3
{
  id v4 = a3;
  id v5 = +[JSABridge sharedInstance];
  id v6 = [(JSAFeedController *)self feed];
  id v8 = v4;
  id v7 = +[NSArray arrayWithObjects:&v8 count:1];

  [v5 enqueueValueInvocation:v6 method:@"onMessageActionTriggered" arguments:v7 file:@"JSAFeedController.m" line:901];
}

- (UIViewController)viewController
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = "-[JSAFeedController viewController]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(JSAFeedController *)self dataSource];
  id v5 = [v4 hostViewControllerForFeedController:self];

  return (UIViewController *)v5;
}

- (NSDictionary)metrics
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = "-[JSAFeedController metrics]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(JSAFeedController *)self dataSource];
  id v5 = [v4 metricsForFeedController:self];

  return (NSDictionary *)v5;
}

- (BSUIDynamicValue)currentStackName
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = "-[JSAFeedController currentStackName]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(JSAFeedController *)self dataSource];
  id v5 = [v4 currentStackNameForFeedController:self];

  return (BSUIDynamicValue *)v5;
}

- (BOOL)hasPresentingFeed
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[JSAFeedController hasPresentingFeed]";
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %p", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [(JSAFeedController *)self dataSource];
  unsigned __int8 v5 = [v4 isPresentedForFeedController:self];

  return v5;
}

- (id)analyticsTracker
{
  v3 = JSALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    id v8 = "-[JSAFeedController analyticsTracker]";
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}s %p", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [(JSAFeedController *)self dataSource];
  unsigned __int8 v5 = [v4 analyticsTrackerForFeedController:self];

  return v5;
}

- (void)setFeedBridged:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v14 = "-[JSAFeedController setFeedBridged:]";
    __int16 v15 = 2048;
    char v16 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  if (self->_feedBridged != v3)
  {
    self->_feedBridged = v3;
    if (v3)
    {
      dispatch_activate((dispatch_object_t)self->_access);
      id v6 = +[JSABridge sharedInstance];
      int v7 = [(JSAFeedController *)self bridgeCompletion];
      unsigned int v8 = [(JSAFeedController *)self feedBridged];
      if (v8)
      {
        self = [(JSAFeedController *)self feed];
        id v9 = [(JSAFeedController *)self isObject];
      }
      else
      {
        id v9 = 0;
      }
      id v10 = +[NSNumber numberWithInt:v9];
      id v12 = v10;
      id v11 = +[NSArray arrayWithObjects:&v12 count:1];
      [v6 enqueueValueCall:v7 arguments:v11 file:@"JSAFeedController.m" line:951];

      if (v8) {
    }
      }
  }
}

- (void)hotReloadControllerWillReloadScript:(id)a3 completion:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22288;
  v5[3] = &unk_B2650;
  void v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)hotReloadControllerDidReloadScript:(id)a3 completion:(id)a4
{
}

- (void)tearDownWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[JSAFeedController tearDownWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s %p", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v17 = sub_1E174;
  BOOL v18 = sub_1E184;
  BOOL v19 = self->_feed;
  bridgeCompletion = self->_bridgeCompletion;
  self->_bridgeCompletion = 0;

  feed = self->_feed;
  self->_feed = 0;

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    objc_initWeak(&location, self);
    unsigned int v8 = dispatch_get_global_queue(0, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_22E74;
    v11[3] = &unk_B3178;
    id v13 = buf;
    objc_copyWeak(&v14, &location);
    id v12 = v4;
    dispatch_async(v8, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = objc_retainBlock(v4);
    id v10 = v9;
    if (v9) {
      (*((void (**)(id))v9 + 2))(v9);
    }
  }
  _Block_object_dispose(buf, 8);
}

- (void)_convertOrCreateViewController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  unsigned int v8 = BUDynamicCast();
  id v9 = v8;
  if (v8)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2339C;
    block[3] = &unk_B2988;
    id v23 = v7;
    id v22 = v8;
    id v10 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    objc_opt_class();
    id v11 = BUDynamicCast();
    if (!v11)
    {
      id v12 = JSALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_857CC((uint64_t)v6, v12);
      }
    }
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_233F8;
    v15[3] = &unk_B31F0;
    objc_copyWeak(&v19, &location);
    void v15[4] = self;
    id v16 = v11;
    id v17 = v6;
    id v18 = v7;
    id v13 = v7;
    id v14 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSArray)entries
{
  return self->_entries;
}

- (JSAFeedControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (JSAFeedControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (JSAFeedControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (JSAFeedControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isRootFeed
{
  return self->_isRootFeed;
}

- (JSAFeedMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (BOOL)abandoned
{
  return self->_abandoned;
}

- (void)setAbandoned:(BOOL)a3
{
  self->_abandoned = a3;
}

- (id)requestEntriesCompletionBlock
{
  return self->_requestEntriesCompletionBlock;
}

- (void)setRequestEntriesCompletionBlock:(id)a3
{
}

- (BOOL)feedBridged
{
  return self->_feedBridged;
}

- (OS_dispatch_queue)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

- (JSValue)bridgeCompletion
{
  return self->_bridgeCompletion;
}

- (void)setBridgeCompletion:(id)a3
{
}

- (JSValue)feed
{
  return self->_feed;
}

- (void)setFeed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feed, 0);
  objc_storeStrong((id *)&self->_bridgeCompletion, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong(&self->_requestEntriesCompletionBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end