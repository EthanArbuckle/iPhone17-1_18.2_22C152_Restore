@interface MTDemographicEventHandler
- (BOOL)mtIncludeBaseFields;
- (id)ageDataForUserId:(id)a3 updateInterval:(double)a4;
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)totalYearsSinceDate:(id)a3 calendar:(id)a4;
- (void)clearUserDefaultsForTopic:(id)a3;
@end

@implementation MTDemographicEventHandler

- (id)ageDataForUserId:(id)a3 updateInterval:(double)a4
{
  v37[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = +[MTFrameworkEnvironment sharedEnvironment];
  v34 = [v7 date];

  v32 = self;
  v8 = [(MTObject *)self metricsKit];
  v9 = [v8 topic];

  v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v11 = [@"MTDemographicDataProviderLastAgeUpdateDate" stringByAppendingString:v9];
  v12 = [@"MTDemographicDataProviderPreviousUserID" stringByAppendingString:v9];
  v33 = [v10 valueForKey:v11];
  v13 = [v10 valueForKey:v12];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v13 isEqualToString:v6]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v34 timeIntervalSinceDate:v33], v14 < a4))
  {
    v15 = 0;
  }
  else
  {
    v16 = +[MTFrameworkEnvironment sharedEnvironment];
    v17 = [v16 dateOfBirthComponents];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263EFF8F0]);
      v19 = [v18 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
      [v17 setCalendar:v19];
      [v17 date];
      v20 = v30 = v17;
      v21 = [(MTDemographicEventHandler *)v32 totalYearsSinceDate:v20 calendar:v19];

      v29 = v21;
      [v21 setCalendar:v19];
      v37[0] = v6;
      v36[0] = @"userId";
      v36[1] = @"ageRange";
      v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v21, "year"));
      v37[1] = v22;
      v36[2] = @"eventTime";
      objc_msgSend(MEMORY[0x263EFF910], "mt_millisecondsSince1970");
      v23 = v31 = v11;
      v37[2] = v23;
      [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
      v24 = v12;
      v25 = v9;
      v27 = id v26 = v6;
      v15 = -[MTEventHandler metricsDataWithFields:](v32, "metricsDataWithFields:", v27, 0);

      id v6 = v26;
      v9 = v25;
      v12 = v24;

      v11 = v31;
      v17 = v30;
      [v10 setValue:v34 forKey:v31];
      [v10 setValue:v6 forKey:v12];
      [v10 synchronize];
    }
    else
    {
      v19 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218211000, v19, OS_LOG_TYPE_INFO, "MetricsKit: Skipping demographics update because date of birth is unavailable.", buf, 2u);
      }
      v15 = 0;
    }
  }

  return v15;
}

- (void)clearUserDefaultsForTopic:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  id v7 = [v3 standardUserDefaults];
  v5 = [@"MTDemographicDataProviderLastAgeUpdateDate" stringByAppendingString:v4];
  [v7 removeObjectForKey:v5];

  id v6 = [@"MTDemographicDataProviderPreviousUserID" stringByAppendingString:v4];

  [v7 removeObjectForKey:v6];
  [v7 synchronize];
}

- (id)totalYearsSinceDate:(id)a3 calendar:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MTFrameworkEnvironment sharedEnvironment];
  v8 = [v7 date];
  v9 = [v5 components:4 fromDate:v6 toDate:v8 options:0];

  return v9;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTDemographicEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  id v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FDF0;
  }
  id v5 = v3;

  return v5;
}

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTDemographicEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"demographic";
  }
  id v4 = v2;

  return v4;
}

- (BOOL)mtIncludeBaseFields
{
  return 0;
}

@end