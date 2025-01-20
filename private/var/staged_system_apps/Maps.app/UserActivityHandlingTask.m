@interface UserActivityHandlingTask
+ (id)taskForUserActivity:(id)a3 atColdLaunch:(BOOL)a4;
- (NSUserActivity)userActivity;
- (UserActivityHandlingTask)initWithUserActivity:(id)a3;
- (void)_useMapsUserSessionEntity;
- (void)setUserActivity:(id)a3;
- (void)taskFinished:(id)a3;
@end

@implementation UserActivityHandlingTask

+ (id)taskForUserActivity:(id)a3 atColdLaunch:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v12 = 0;
    goto LABEL_19;
  }
  v7 = [v5 activityType];
  if ([v7 isEqual:@"com.apple.Maps"])
  {
    v8 = [v6 userInfo];
    v9 = [v8 objectForKey:WGWidgetUserInfoKeyKind];
    unsigned int v10 = [v9 isEqualToString:@"com.apple.Maps"];

    if (v10) {
      v11 = _WidgetActivityHandlingTask;
    }
    else {
      v11 = _HandoffActivityHandlingTask;
    }
LABEL_17:
    v12 = (_MapsActivityRestoreHandlingTask *)[[v11 alloc] initWithUserActivity:v6];
    goto LABEL_18;
  }
  if (![v7 isEqual:@"com.apple.Maps.Restore"])
  {
    if ([v7 isEqual:@"com.apple.Maps.NewWindow"])
    {
      v11 = _NewWindowActivityHandlingTask;
    }
    else if ([v7 isEqualToString:CSQueryContinuationActionType])
    {
      v11 = _CoreSpotlightActivityHandlingTask;
    }
    else if ([v7 isEqualToString:@"MKPlaceBrandUserActivity"])
    {
      v11 = _PlaceBrandActivityHandlingTask;
    }
    else
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      unsigned int v15 = [v7 isEqualToString:v14];

      if (!v15)
      {
        v17 = sub_1000A930C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138412290;
          v19 = v7;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "UserActivityHandlingTask no handling task for %@", (uint8_t *)&v18, 0xCu);
        }

        v12 = 0;
        goto LABEL_18;
      }
      v11 = _ReportIncidentIntentHandlingTask;
    }
    goto LABEL_17;
  }
  v12 = [(UserActivityHandlingTask *)[_MapsActivityRestoreHandlingTask alloc] initWithUserActivity:v6];
  [(_MapsActivityRestoreHandlingTask *)v12 setColdLaunch:v4];
LABEL_18:

LABEL_19:

  return v12;
}

- (void)_useMapsUserSessionEntity
{
  v2 = [(UserActivityHandlingTask *)self userActivity];
  v3 = [v2 userInfo];
  BOOL v4 = [v3 objectForKeyedSubscript:_MKUserActivitySharedSessionEntityStringKey];

  if (v4)
  {
    id v5 = [v4 componentsSeparatedByString:@"="];
    id v8 = [v5 lastObject];

    id v6 = [objc_alloc((Class)GEOUserSessionEntity) initWithSessionEntityString:v8];
    v7 = +[GEOUserSession sharedInstance];
    [v7 setMapsUserSessionEntity:v6];
  }
}

- (UserActivityHandlingTask)initWithUserActivity:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UserActivityHandlingTask;
  id v5 = [(UserActivityHandlingTask *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(UserActivityHandlingTask *)v5 setUserActivity:v4];
    [(UserActivityHandlingTask *)v6 _useMapsUserSessionEntity];
  }

  return v6;
}

- (void)taskFinished:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UserActivityHandlingTask;
  [(RichMapsActivityCreatingTaskImpl *)&v4 taskFinished:a3];
  [(UserActivityHandlingTask *)self _sendAnalytics];
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end