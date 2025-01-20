@interface NEKAnalyticsReporter
+ (id)syncReportFilePath;
+ (void)_reportDriftResultsToAnalytics:(id)a3;
+ (void)_reportDuplicationResultsToAnalytics:(id)a3;
+ (void)saveSyncReportForDrift:(id)a3 andDuplication:(id)a4;
+ (void)sendAnalyticsForDrift:(id)a3 andDuplication:(id)a4;
@end

@implementation NEKAnalyticsReporter

+ (id)syncReportFilePath
{
  v2 = +[NEKEnvironment instance];
  v3 = [v2 dbFileManager];
  v4 = [v3 syncStateDBPathFor:@"syncReport.json"];

  return v4;
}

+ (void)saveSyncReportForDrift:(id)a3 andDuplication:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NEKAnalyticsReporter syncReportFilePath];
  id v8 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:10];
  v9 = [v6 syncReport];

  [v8 setObject:v9 forKeyedSubscript:@"Drift"];
  v10 = [v5 syncReport];

  [v8 setObject:v10 forKeyedSubscript:@"Duplicates"];
  id v18 = 0;
  v11 = +[NSJSONSerialization dataWithJSONObject:v8 options:11 error:&v18];
  id v12 = v18;
  if (v12)
  {
    v13 = v12;
    v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10006C73C((uint64_t)v13, v14);
    }
  }
  else
  {
    id v17 = 0;
    [v11 writeToFile:v7 options:1 error:&v17];
    id v15 = v17;
    v16 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v15)
    {
      v13 = v15;
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
        sub_10006C6B4((uint64_t)v13, (uint64_t)v7, v16);
      }
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Wrote analytics report to %@", buf, 0xCu);
      }
      v13 = 0;
    }
  }
}

+ (void)sendAnalyticsForDrift:(id)a3 andDuplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v5 hasDrift];
  id v8 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v7)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006C870(v8, v5);
    }
    +[NEKAnalyticsReporter _reportDriftResultsToAnalytics:v5];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "No drift detected on these devices", buf, 2u);
  }
  unsigned int v9 = [v6 hasDuplicates];
  v10 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (v9)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_ERROR)) {
      sub_10006C7B4(v10, v6);
    }
    +[NEKAnalyticsReporter _reportDuplicationResultsToAnalytics:v6];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "No duplication detected on these devices", v11, 2u);
  }
}

+ (void)_reportDriftResultsToAnalytics:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

+ (void)_reportDuplicationResultsToAnalytics:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

@end