@interface APMetricPurposeRegistry
+ (id)metricRouteForPurpose:(int64_t)a3;
+ (void)setMetricPurpose:(id)a3;
@end

@implementation APMetricPurposeRegistry

+ (id)metricRouteForPurpose:(int64_t)a3
{
  v3 = +[NSNumber numberWithInteger:a3];
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  v5 = [(id)qword_100289C48 objectForKey:v3];
  objc_sync_exit(v4);

  return v5;
}

+ (void)setMetricPurpose:(id)a3
{
  id v6 = a3;
  id v3 = [v6 purpose];
  if (qword_100289C50 != -1) {
    dispatch_once(&qword_100289C50, &stru_100236948);
  }
  v4 = +[NSNumber numberWithInteger:v3];
  v5 = objc_opt_class();
  objc_sync_enter(v5);
  [(id)qword_100289C48 setObject:v6 forKey:v4];
  objc_sync_exit(v5);
}

@end