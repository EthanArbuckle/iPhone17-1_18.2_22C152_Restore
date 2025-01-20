@interface NSProgress
+ (id)crl_progressWithCRLProgress:(id)a3 totalUnitCount:(int64_t)a4;
+ (id)crl_progressWithChildren:(id)a3;
- (int64_t)crl_pendingUnitCountForIncompleteProgress:(int64_t)a3;
- (void)crl_stopObservingCRLProgress;
@end

@implementation NSProgress

+ (id)crl_progressWithCRLProgress:(id)a3 totalUnitCount:(int64_t)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
  [v6 setTotalUnitCount:a4];
  [v5 maxValue];
  double v8 = v7;
  if (([v5 isIndeterminate] & 1) == 0 && v8 > 0.0)
  {
    [v5 value];
    [v6 setCompletedUnitCount:(uint64_t)(v9 / v8 * (double)(uint64_t)[v6 totalUnitCount])];
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
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_1002E82CC;
  v25 = &unk_1014EB940;
  objc_copyWeak(&v26, &location);
  objc_copyWeak(v27, &from);
  v27[1] = (id)a4;
  v13 = [v5 addProgressObserverWithValueInterval:&_dispatch_main_q queue:&v22 handler:v11];

  if (!v13)
  {
    int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB960);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109B214(v14, v15);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EB980);
    }
    v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      v17 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v17, buf, v14, (os_log_t)v16);
    }

    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSProgress(NSProgress_CRLAdditions) crl_progressWithCRLProgress:totalUnitCount:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSProgress_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 70, 0, "invalid nil value for '%{public}s'", "progressObserver", v22, v23, v24, v25);
  }
  v20 = objc_alloc_init(CRLProgressUserInfoObject);
  [(CRLProgressUserInfoObject *)v20 setProgress:v5];
  [(CRLProgressUserInfoObject *)v20 setProgressObserver:v13];
  [v6 setUserInfoObject:v20 forKey:@"CRLProgressUserInfoKey"];

  objc_destroyWeak(v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

+ (id)crl_progressWithChildren:(id)a3
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
        [v12 addChild:*(*(void *)(*((void *)&v19 + 1) + 8 * (void)j) totalUnitCount:v19]];
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

- (void)crl_stopObservingCRLProgress
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(NSProgress *)self userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"CRLProgressUserInfoKey"];
  sub_1002469D0(v3, v5);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v8 progress];
  uint64_t v7 = [v8 progressObserver];
  [v6 removeProgressObserver:v7];
}

- (int64_t)crl_pendingUnitCountForIncompleteProgress:(int64_t)a3
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