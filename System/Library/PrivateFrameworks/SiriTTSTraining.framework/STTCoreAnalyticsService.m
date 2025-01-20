@interface STTCoreAnalyticsService
+ (STTCoreAnalyticsService)sharedInstance;
- (void)reportRequest:(id)a3;
- (void)reportTask:(id)a3;
@end

@implementation STTCoreAnalyticsService

+ (STTCoreAnalyticsService)sharedInstance
{
  if (qword_10001D7F8 != -1) {
    dispatch_once(&qword_10001D7F8, &stru_100018990);
  }
  v2 = (void *)qword_10001D7F0;

  return (STTCoreAnalyticsService *)v2;
}

- (void)reportRequest:(id)a3
{
  if (a3)
  {
    v18[0] = @"app_id";
    uint64_t v5 = [a3 appId];
    v6 = (void *)v5;
    if (v5) {
      CFStringRef v7 = (const __CFString *)v5;
    }
    else {
      CFStringRef v7 = @"null";
    }
    v19[0] = v7;
    v18[1] = @"language";
    uint64_t v8 = [a3 assetLanguage];
    v9 = (void *)v8;
    if (v8) {
      CFStringRef v10 = (const __CFString *)v8;
    }
    else {
      CFStringRef v10 = @"null";
    }
    v19[1] = v10;
    v18[2] = @"name";
    uint64_t v11 = [a3 assetName];
    v12 = (void *)v11;
    if (v11) {
      CFStringRef v13 = (const __CFString *)v11;
    }
    else {
      CFStringRef v13 = @"null";
    }
    v19[2] = v13;
    v18[3] = @"error_code";
    v14 = [a3 error];
    v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 code]);
    v19[3] = v15;
    v18[4] = @"task_mode";
    v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 taskMode]);
    v19[4] = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:5];

    sub_100005944((uint64_t)self, @"com.apple.SiriTTSTrainingAgent.metrics.request", v17);
  }
  else
  {
    id v17 = 0;
    sub_100005944((uint64_t)self, @"com.apple.SiriTTSTrainingAgent.metrics.request", 0);
  }
}

- (void)reportTask:(id)a3
{
  if (a3)
  {
    v28[0] = @"app_id";
    uint64_t v4 = [a3 appId];
    v25 = (void *)v4;
    if (v4) {
      CFStringRef v5 = (const __CFString *)v4;
    }
    else {
      CFStringRef v5 = @"null";
    }
    v29[0] = v5;
    v28[1] = @"error_code";
    v24 = [a3 error];
    v23 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 code]);
    v29[1] = v23;
    v28[2] = @"language";
    uint64_t v6 = [a3 assetLanguage];
    CFStringRef v7 = (void *)v6;
    if (v6) {
      CFStringRef v8 = (const __CFString *)v6;
    }
    else {
      CFStringRef v8 = @"null";
    }
    v29[2] = v8;
    v28[3] = @"name";
    uint64_t v9 = [a3 assetName];
    CFStringRef v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = @"null";
    }
    v29[3] = v11;
    v28[4] = @"task_mode";
    v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 taskMode]);
    v29[4] = v22;
    v28[5] = @"task_status";
    v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 taskStatus]);
    v29[5] = v12;
    v28[6] = @"training_status";
    CFStringRef v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 trainingStatus]);
    v29[6] = v13;
    v28[7] = @"training_time";
    [a3 timeIntervalSinceTrainingStart];
    v15 = +[NSNumber numberWithInteger:(uint64_t)v14];
    v29[7] = v15;
    v28[8] = @"time_since_request";
    [a3 timeIntervalSinceSubmission];
    id v17 = +[NSNumber numberWithInteger:(uint64_t)v16];
    v29[8] = v17;
    v28[9] = @"total_training_time";
    [a3 totalTrainingTime];
    v19 = +[NSNumber numberWithInteger:(uint64_t)v18];
    v29[9] = v19;
    v28[10] = @"task_current_progress";
    v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 currentTaskStatusProgressValue]);
    v29[10] = v20;
    v28[11] = @"task_total_progress";
    v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 totalTaskStatusProgressValue]);
    v29[11] = v21;
    id v27 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:12];

    sub_100005944((uint64_t)self, @"com.apple.SiriTTSTrainingAgent.metrics.task", v27);
  }
  else
  {
    id v27 = 0;
    sub_100005944((uint64_t)self, @"com.apple.SiriTTSTrainingAgent.metrics.task", 0);
  }
}

@end