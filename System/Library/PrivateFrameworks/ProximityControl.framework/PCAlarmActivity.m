@interface PCAlarmActivity
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (PCAlarmActivity)initWithActivity:(id)a3;
- (id)bundleIdentifier;
- (id)description;
- (id)fireDate;
- (id)image;
- (id)initFromAlarm:(id)a3;
- (id)title;
- (unint64_t)pcactivityType;
@end

@implementation PCAlarmActivity

- (id)initFromAlarm:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PCAlarmActivity;
  v5 = [(PCAlarmActivity *)&v12 initWithActivityType:@"com.apple.ProximityControl.activity.alarm"];
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    v7 = [v4 displayTitle];
    if ([@"ALARM_DEFAULT_TITLE" isEqualToString:v7])
    {
      uint64_t v8 = +[PCLocalizedString localizedStringForKey:0];

      v7 = (void *)v8;
    }
    [(PCAlarmActivity *)v6 setTitle:v7];
    v13[0] = @"fireDate";
    v9 = [v4 nextFireDate];
    v13[1] = @"displayTitle";
    v14[0] = v9;
    v14[1] = v7;
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [(PCAlarmActivity *)v6 setUserInfo:v10];
  }
  return v6;
}

- (PCAlarmActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  int v6 = [@"com.apple.ProximityControl.activity.alarm" isEqualToString:v5];

  if (v6)
  {
    v7 = [v4 activityType];
    v13.receiver = self;
    v13.super_class = (Class)PCAlarmActivity;
    uint64_t v8 = [(PCAlarmActivity *)&v13 initWithActivityType:v7];

    if (v8)
    {
      localizeActivityIfNeeded(v4, 0);
      makeIneligibleForProcessing(v8);
      v9 = [v4 userInfo];
      [(PCAlarmActivity *)v8 setUserInfo:v9];

      v10 = [v4 title];
      [(PCAlarmActivity *)v8 setTitle:v10];
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = [(PCAlarmActivity *)self fireDate];
  uint64_t v4 = [(PCAlarmActivity *)self title];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08790]);
    [v6 setTimeStyle:1];
    [v6 setDateStyle:0];
    v7 = [v6 stringFromDate:v3];
    uint64_t v8 = [NSString stringWithFormat:@"%@ %@", v7, v5];
  }
  else
  {
    uint64_t v8 = +[PCLocalizedString localizedStringForKey:0];
  }

  return v8;
}

- (BOOL)isValid
{
  v2 = [(PCAlarmActivity *)self userInfo];
  v3 = [v2 allKeys];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)fireDate
{
  v2 = [(PCAlarmActivity *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"fireDate"];

  return v3;
}

- (id)title
{
  v2 = [(PCAlarmActivity *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"displayTitle"];

  return v3;
}

- (unint64_t)pcactivityType
{
  return 3;
}

- (id)bundleIdentifier
{
  return @"com.apple.mobiletimer";
}

- (id)image
{
  v2 = [(PCAlarmActivity *)self bundleIdentifier];
  v3 = +[PCActivityUtility iconForBundleIdentifier:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pcactivityType];
  if (v5 == [(PCAlarmActivity *)self pcactivityType])
  {
    id v6 = [v4 description];
    v7 = [(PCAlarmActivity *)self description];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

@end