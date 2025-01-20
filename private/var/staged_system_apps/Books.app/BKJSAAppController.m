@interface BKJSAAppController
- (BKAppSceneManager)sceneManager;
- (BKJSAAppController)initWithSceneManager:(id)a3 jetActionHandler:(id)a4;
- (BKRootBarCoordinating)rootBarCoordinator;
- (BSUIJetActionHandling)jetActionHandler;
- (id)_sceneControllerForTransaction:(id)a3;
- (unint64_t)signpostBeginWithMetadata:(id)a3;
- (void)appendFeedsInCards:(id)a3 options:(id)a4;
- (void)appendFeedsInCards:(id)a3 optionsValue:(id)a4;
- (void)dismissCardsForSelectedTab:(BOOL)a3 completion:(id)a4;
- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)performRawActionModelOnRootBarCurrentViewController:(id)a3 withParentTracker:(id)a4 shouldReportFigaro:(BOOL)a5;
- (void)performRawFlowActionOnRootBarCurrentViewController:(id)a3 withParentTracker:(id)a4 shouldReportFigaro:(BOOL)a5;
- (void)presentFeedsInCards:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 options:(id)a6;
- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 animatedValue:(id)a5 optionsValue:(id)a6;
- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 titleValue:(id)a5 animatedValue:(id)a6 optionsValue:(id)a7;
- (void)pushViewControllerOnSelectedNavigationController:(id)a3 animated:(BOOL)a4;
- (void)reloadStandardItemsWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)requestPrimaryAnalyticsControllerWithCompletionValue:(id)a3;
- (void)requestPrimarySceneWithCompletionValue:(id)a3;
- (void)requestRootBarAnalyticsTrackerWithCompletionValue:(id)a3;
- (void)requestRootBarControllerWithCompletionValue:(id)a3;
- (void)selectTabWithIdentifier:(id)a3 isUserAction:(BOOL)a4;
- (void)setJetActionHandler:(id)a3;
- (void)setSceneManager:(id)a3;
- (void)setScriptDataSource:(id)a3 completion:(id)a4;
- (void)signpostEndWithSignpostID:(unint64_t)a3 metadata:(id)a4;
- (void)signpostEventWithMetadata:(id)a3;
- (void)topViewControllerInSelectedTab:(id)a3;
@end

@implementation BKJSAAppController

- (void)signpostEndWithSignpostID:(unint64_t)a3 metadata:(id)a4
{
  id v5 = a4;
  v6 = +[JSAProcessEnvironment currentEnvironment];
  id v7 = [v6 variant];

  v8 = JSASignpostJS();
  v9 = v8;
  unint64_t v10 = a3 - 1;
  if (v7 == (id)1)
  {
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v12 = 138543362;
      id v13 = v5;
      v11 = "%{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, a3, "JS", v11, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v12 = 138412290;
    id v13 = v5;
    v11 = "%@";
    goto LABEL_8;
  }
}

- (unint64_t)signpostBeginWithMetadata:(id)a3
{
  id v3 = a3;
  v4 = JSASignpostJS();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  v6 = +[JSAProcessEnvironment currentEnvironment];
  id v7 = [v6 variant];

  v8 = JSASignpostJS();
  v9 = v8;
  unint64_t v10 = v5 - 1;
  if (v7 == (id)1)
  {
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v13 = 138543362;
      id v14 = v3;
      v11 = "%{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "JS", v11, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v13 = 138412290;
    id v14 = v3;
    v11 = "%@";
    goto LABEL_8;
  }

  return v5;
}

- (void)setScriptDataSource:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v14 = "-[BKJSAAppController setScriptDataSource:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v9 = [(BKJSAAppController *)self sceneManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018C0C;
  v11[3] = &unk_100A43D60;
  id v12 = v6;
  id v10 = v6;
  [v9 setScriptDataSource:v7 completion:v11];
}

- (BKAppSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)requestRootBarAnalyticsTrackerWithCompletionValue:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v14 = "-[BKJSAAppController requestRootBarAnalyticsTrackerWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000F7E0;
  v11[3] = &unk_100A43DD8;
  void v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = objc_retainBlock(v11);
  v8 = objc_retainBlock(v7);
  if (v8)
  {
    if (+[NSThread isMainThread])
    {
      v8[2](v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10007854C;
      block[3] = &unk_100A442B8;
      id v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)requestPrimaryAnalyticsControllerWithCompletionValue:(id)a3
{
  id v3 = a3;
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v12 = "-[BKJSAAppController requestPrimaryAnalyticsControllerWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022D50;
  v9[3] = &unk_100A43D60;
  id v5 = v3;
  id v10 = v5;
  id v6 = objc_retainBlock(v9);
  if (v6)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v6[2])(v6);
    }
    else
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10007853C;
      v7[3] = &unk_100A442B8;
      v8 = v6;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
    }
  }
}

- (BKJSAAppController)initWithSceneManager:(id)a3 jetActionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKJSAAppController;
  v9 = [(BKJSAAppController *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneManager, a3);
    objc_storeStrong((id *)&v10->_jetActionHandler, a4);
  }

  return v10;
}

- (id)_sceneControllerForTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(BKJSAAppController *)self sceneManager];
  id v6 = [v5 defaultSceneControllerForTransaction:v4];

  return v6;
}

- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 titleValue:(id)a5 animatedValue:(id)a6 optionsValue:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = JSALog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136446210;
    v22 = "-[BKJSAAppController presentFeedsInCards:focusedIndexValue:titleValue:animatedValue:optionsValue:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v21, 0xCu);
  }

  if ([v11 isArray])
  {
    v16 = [v11 toArray];
  }
  else
  {
    v16 = 0;
  }
  if ([v12 isNumber])
  {
    v17 = [v12 toNumber];
    unint64_t v18 = (unint64_t)[v17 unsignedIntegerValue];
  }
  else
  {
    unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v13 isBoolean]) {
    uint64_t v19 = (uint64_t)[v13 toBool];
  }
  else {
    uint64_t v19 = 1;
  }
  if ([v14 isObject])
  {
    v20 = [v14 toDictionary];
  }
  else
  {
    v20 = 0;
  }
  if ((unint64_t)[v16 count] > v18) {
    [(BKJSAAppController *)self presentFeedsInCards:v16 focusedIndex:v18 animated:v19 options:v20];
  }
}

- (void)presentFeedsInCards:(id)a3 focusedIndexValue:(id)a4 animatedValue:(id)a5 optionsValue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = JSALog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136446210;
    int v21 = "-[BKJSAAppController presentFeedsInCards:focusedIndexValue:animatedValue:optionsValue:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v20, 0xCu);
  }

  if ([v10 isArray])
  {
    v15 = [v10 toArray];
  }
  else
  {
    v15 = 0;
  }
  if ([v11 isNumber])
  {
    v16 = [v11 toNumber];
    unint64_t v17 = (unint64_t)[v16 unsignedIntegerValue];
  }
  else
  {
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([v12 isBoolean]) {
    uint64_t v18 = (uint64_t)[v12 toBool];
  }
  else {
    uint64_t v18 = 1;
  }
  if ([v13 isObject])
  {
    uint64_t v19 = [v13 toDictionary];
  }
  else
  {
    uint64_t v19 = 0;
  }
  if ((unint64_t)[v15 count] > v17) {
    [(BKJSAAppController *)self presentFeedsInCards:v15 focusedIndex:v17 animated:v18 options:v19];
  }
}

- (void)presentFeedsInCards:(id)a3 focusedIndex:(unint64_t)a4 animated:(BOOL)a5 options:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = JSALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446210;
    unint64_t v17 = "-[BKJSAAppController presentFeedsInCards:focusedIndex:animated:options:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v16, 0xCu);
  }

  id v13 = [v10 objectForKeyedSubscript:BCTransactionOptionsTransactionKey];
  id v14 = [(BKJSAAppController *)self _sceneControllerForTransaction:v13];
  v15 = [v14 feedCardPresenting];
  [v15 presentFeedsInCards:v11 focusedIndex:a4 animated:v6 options:v10 completion:0];
}

- (void)appendFeedsInCards:(id)a3 optionsValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446210;
    id v12 = "-[BKJSAAppController appendFeedsInCards:optionsValue:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v11, 0xCu);
  }

  if ([v6 isArray])
  {
    v9 = [v6 toArray];
  }
  else
  {
    v9 = 0;
  }
  if ([v7 isObject])
  {
    id v10 = [v7 toDictionary];
  }
  else
  {
    id v10 = 0;
  }
  if ([v9 count]) {
    [(BKJSAAppController *)self appendFeedsInCards:v9 options:v10];
  }
}

- (void)appendFeedsInCards:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446210;
    id v13 = "-[BKJSAAppController appendFeedsInCards:options:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }

  v9 = [v6 objectForKeyedSubscript:BCTransactionOptionsTransactionKey];
  id v10 = [(BKJSAAppController *)self _sceneControllerForTransaction:v9];
  int v11 = [v10 feedCardPresenting];
  [v11 appendFeedsInCards:v7 options:v6];
}

- (BKRootBarCoordinating)rootBarCoordinator
{
  v2 = [(BKJSAAppController *)self sceneManager];
  id v3 = [v2 primarySceneController];
  id v4 = [v3 rootBarCoordinator];

  return (BKRootBarCoordinating *)v4;
}

- (void)requestRootBarControllerWithCompletionValue:(id)a3
{
  id v4 = a3;
  id v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v14 = "-[BKJSAAppController requestRootBarControllerWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012EEB4;
  v11[3] = &unk_100A43DD8;
  void v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = objc_retainBlock(v11);
  id v8 = objc_retainBlock(v7);
  if (v8)
  {
    if (+[NSThread isMainThread])
    {
      v8[2](v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10012F0E4;
      block[3] = &unk_100A442B8;
      id v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)requestPrimarySceneWithCompletionValue:(id)a3
{
  id v4 = a3;
  id v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v14 = "-[BKJSAAppController requestPrimarySceneWithCompletionValue:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012F2B8;
  v11[3] = &unk_100A43DD8;
  void v11[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v7 = objc_retainBlock(v11);
  id v8 = objc_retainBlock(v7);
  if (v8)
  {
    if (+[NSThread isMainThread])
    {
      v8[2](v8);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10012F4D8;
      block[3] = &unk_100A442B8;
      id v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)reloadStandardItemsWithAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 136446466;
    unint64_t v17 = "-[BKJSAAppController reloadStandardItemsWithAnimated:completion:]";
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s animated=%@", buf, 0x16u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012F6D8;
  v13[3] = &unk_100A44818;
  v13[4] = self;
  BOOL v15 = v4;
  id v9 = v6;
  id v14 = v9;
  id v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10012F890;
      v11[3] = &unk_100A442B8;
      id v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
  }
}

- (void)dismissCardsForSelectedTab:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 136446466;
    __int16 v18 = "-[BKJSAAppController dismissCardsForSelectedTab:completion:]";
    __int16 v19 = 2112;
    int v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s animated=%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012FADC;
  v13[3] = &unk_100A47A00;
  objc_copyWeak(&v15, (id *)buf);
  BOOL v16 = v4;
  id v9 = v6;
  id v14 = v9;
  id v10 = objc_retainBlock(v13);
  if (v10)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v10[2])(v10);
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10012FEE4;
      v11[3] = &unk_100A442B8;
      id v12 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    }
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100130074;
  v11[3] = &unk_100A47A00;
  objc_copyWeak(&v13, &location);
  BOOL v14 = a3;
  id v7 = v6;
  id v12 = v7;
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
      block[2] = sub_100130574;
      block[3] = &unk_100A442B8;
      id v10 = v8;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)pushViewControllerOnSelectedNavigationController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    unint64_t v17 = "-[BKJSAAppController pushViewControllerOnSelectedNavigationController:animated:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100130790;
  v12[3] = &unk_100A47A28;
  id v8 = v6;
  id v13 = v8;
  objc_copyWeak(&v14, (id *)buf);
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
      v10[2] = sub_10013082C;
      v10[3] = &unk_100A442B8;
      int v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)selectTabWithIdentifier:(id)a3 isUserAction:(BOOL)a4
{
  id v6 = a3;
  id v7 = JSALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    unint64_t v17 = "-[BKJSAAppController selectTabWithIdentifier:isUserAction:]";
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s identifier=%{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100130A54;
  v12[3] = &unk_100A47A00;
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
      v10[2] = sub_100130AB8;
      v10[3] = &unk_100A442B8;
      int v11 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)topViewControllerInSelectedTab:(id)a3
{
  id v4 = a3;
  id v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v14 = "-[BKJSAAppController topViewControllerInSelectedTab:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100130CCC;
  v10[3] = &unk_100A47A50;
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
      block[2] = sub_100130E3C;
      block[3] = &unk_100A442B8;
      id v9 = v7;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)signpostEventWithMetadata:(id)a3
{
  id v3 = a3;
  id v4 = JSASignpostJS();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  id v6 = +[JSAProcessEnvironment currentEnvironment];
  id v7 = [v6 variant];

  id v8 = JSASignpostJS();
  id v9 = v8;
  unint64_t v10 = v5 - 1;
  if (v7 == (id)1)
  {
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v12 = 138543362;
      id v13 = v3;
      id v11 = "%{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, v5, "JS", v11, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v12 = 138412290;
    id v13 = v3;
    id v11 = "%@";
    goto LABEL_8;
  }
}

- (void)performRawActionModelOnRootBarCurrentViewController:(id)a3 withParentTracker:(id)a4 shouldReportFigaro:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  unint64_t v10 = JSALog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v22 = "-[BKJSAAppController performRawActionModelOnRootBarCurrentViewController:withParentTracker:shouldReportFigaro:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001311D4;
  v16[3] = &unk_100A47A98;
  objc_copyWeak(&v19, (id *)buf);
  v16[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  BOOL v20 = a5;
  id v13 = objc_retainBlock(v16);
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
      v14[2] = sub_1001312B8;
      v14[3] = &unk_100A442B8;
      BOOL v15 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
    }
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)performRawFlowActionOnRootBarCurrentViewController:(id)a3 withParentTracker:(id)a4 shouldReportFigaro:(BOOL)a5
{
}

- (void)setSceneManager:(id)a3
{
}

- (BSUIJetActionHandling)jetActionHandler
{
  return self->_jetActionHandler;
}

- (void)setJetActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jetActionHandler, 0);

  objc_storeStrong((id *)&self->_sceneManager, 0);
}

@end