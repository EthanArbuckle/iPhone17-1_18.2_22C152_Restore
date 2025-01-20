@interface NSProgress
+ (id)tsu_progressWithChildren:(id)a3;
+ (id)tsu_progressWithTSUProgress:(id)a3 totalUnitCount:(int64_t)a4;
- (int64_t)tsu_pendingUnitCountForIncompleteProgress:(int64_t)a3;
- (void)tsu_stopObservingTSUProgress;
@end

@implementation NSProgress

+ (id)tsu_progressWithTSUProgress:(id)a3 totalUnitCount:(int64_t)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
  [v6 setTotalUnitCount:a4];
  [v5 maxValue];
  double v8 = v7;
  if (([v5 isIndeterminate] & 1) == 0 && v8 > 0.0)
  {
    [v5 value];
    objc_msgSend(v6, "setCompletedUnitCount:", (uint64_t)(v9 / v8 * (double)(uint64_t)objc_msgSend(v6, "totalUnitCount")));
  }
  int64_t v10 = 10;
  if (a4 > 10) {
    int64_t v10 = a4;
  }
  if (v8 > 0.0) {
    double v11 = v8 / (double)v10;
  }
  else {
    double v11 = (double)v10;
  }
  objc_initWeak(&location, v5);
  objc_initWeak(&from, v6);
  id v12 = &_dispatch_main_q;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_100084290;
  v23 = &unk_1001CC308;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(v25, &from);
  v25[1] = (id)a4;
  v13 = [v5 addProgressObserverWithValueInterval:&_dispatch_main_q queue:&v20 handler:v11];

  if (!v13)
  {
    int v14 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CC328);
    }
    v15 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100164F18(v14, v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSProgress(NSProgress_TSUAdditions) tsu_progressWithTSUProgress:totalUnitCount:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSProgress_TSUAdditions.m"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 66, 0, "invalid nil value for '%{public}s'", "progressObserver", v20, v21, v22, v23);

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v18 = objc_alloc_init(TSUProgressUserInfoObject);
  [(TSUProgressUserInfoObject *)v18 setProgress:v5];
  [(TSUProgressUserInfoObject *)v18 setProgressObserver:v13];
  [v6 setUserInfoObject:v18 forKey:@"TSUProgressUserInfoKey"];

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

+ (id)tsu_progressWithChildren:(id)a3
{
  id v3 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v24;
    int v8 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        int64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v6 += (uint64_t)[v10 totalUnitCount];
        NSProgressKind v11 = [v10 kind];
        LODWORD(v10) = v11 == NSProgressKindFile;

        v8 &= v10;
      }
      id v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    int v8 = 1;
  }
  id v12 = +[NSProgress discreteProgressWithTotalUnitCount:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v3;
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v12, "addChild:withPendingUnitCount:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j), objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)j), "totalUnitCount", (void)v19));
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  if (v8) {
    [v12 setKind:NSProgressKindFile];
  }

  return v12;
}

- (void)tsu_stopObservingTSUProgress
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(NSProgress *)self userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"TSUProgressUserInfoKey"];
  TSUDynamicCast(v3, (uint64_t)v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v8 progress];
  uint64_t v7 = [v8 progressObserver];
  [v6 removeProgressObserver:v7];
}

- (int64_t)tsu_pendingUnitCountForIncompleteProgress:(int64_t)a3
{
  int64_t v5 = [(NSProgress *)self totalUnitCount];
  int64_t v6 = [(NSProgress *)self completedUnitCount];
  int64_t v7 = v5 - v6;
  if (v5 - v6 < 0) {
    int64_t v7 = v6 - v5;
  }
  int64_t v8 = (unint64_t)v7 >> 1;
  if (v7 > a3) {
    int64_t v8 = a3;
  }
  if ((unint64_t)v7 < 2 && v7 < a3) {
    return 0;
  }
  else {
    return v8;
  }
}

@end