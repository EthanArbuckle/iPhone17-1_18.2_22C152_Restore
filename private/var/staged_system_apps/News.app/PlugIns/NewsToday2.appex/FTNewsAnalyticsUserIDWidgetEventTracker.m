@interface FTNewsAnalyticsUserIDWidgetEventTracker
- (FTNewsAnalyticsUserIDWidgetEventTracker)init;
- (NSString)userID;
- (void)setUserID:(id)a3;
- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6;
@end

@implementation FTNewsAnalyticsUserIDWidgetEventTracker

- (FTNewsAnalyticsUserIDWidgetEventTracker)init
{
  v3.receiver = self;
  v3.super_class = (Class)FTNewsAnalyticsUserIDWidgetEventTracker;
  return [(FTNewsAnalyticsUserIDWidgetEventTracker *)&v3 init];
}

- (void)widgetPerformedUpdateWithTodayResults:(id)a3 fetchInfo:(id)a4 error:(id)a5 updateFetchDuration:(double)a6
{
  [a4 userID:a3, a6];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(FTNewsAnalyticsUserIDWidgetEventTracker *)self setUserID:v7];
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end