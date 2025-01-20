@interface WLDMetricsUtilities
+ (void)sendMetricsEvents:(id)a3 metricsController:(id)a4;
@end

@implementation WLDMetricsUtilities

+ (void)sendMetricsEvents:(id)a3 metricsController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = [objc_alloc((Class)WLKTransactionScope) initWithIdentifier:@"WLDMetricsUtilities.sendMetricsEvents"];
  if ([v5 count])
  {
    v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDMetricsUtilities - Will send events: %@", buf, 0xCu);
    }

    [v6 enqueueEvents:v5];
    v8 = [v6 flush];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __59__WLDMetricsUtilities_sendMetricsEvents_metricsController___block_invoke;
    v10[3] = &unk_100045118;
    v10[4] = &v11;
    [v8 addFinishBlock:v10];
  }
  else
  {
    v9 = WLKSystemLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDMetricsUtilities - No metrics to report.", buf, 2u);
    }

    v8 = (void *)v12[5];
    v12[5] = 0;
  }

  _Block_object_dispose(&v11, 8);
}

void __59__WLDMetricsUtilities_sendMetricsEvents_metricsController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = WLKSystemLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      int v12 = 138412290;
      id v13 = v4;
      v7 = "WLDMetricsUtilities - Error flushing events: %@";
      v8 = v5;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v12) = 0;
    v7 = "WLDMetricsUtilities - Events flushed.";
    v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_6;
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

@end