@interface PCTimerActivity
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (PCTimerActivity)initWithActivity:(id)a3;
- (double)timeLeft;
- (id)bundleIdentifier;
- (id)description;
- (id)displayTitle;
- (id)fireDate;
- (id)image;
- (id)initFromTimer:(id)a3;
- (unint64_t)pcactivityType;
@end

@implementation PCTimerActivity

- (id)initFromTimer:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PCTimerActivity;
  v5 = [(PCTimerActivity *)&v13 initWithActivityType:@"com.apple.ProximityControl.activity.timer"];
  v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    v7 = [v4 displayTitle];
    if ([@"TIMER_DEFAULT_TITLE" isEqualToString:v7])
    {
      uint64_t v8 = +[PCLocalizedString localizedStringForKey:8];

      v7 = (void *)v8;
    }
    [(PCTimerActivity *)v6 setTitle:v7];
    v9 = (void *)MEMORY[0x263EFF910];
    [v4 remainingTime];
    v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceNow:");
    v14[0] = @"fireDate";
    v14[1] = @"displayTitle";
    v15[0] = v10;
    v15[1] = v7;
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    [(PCTimerActivity *)v6 setUserInfo:v11];
  }
  return v6;
}

- (PCTimerActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  int v6 = [@"com.apple.ProximityControl.activity.timer" isEqualToString:v5];

  if (v6)
  {
    v7 = [v4 activityType];
    v13.receiver = self;
    v13.super_class = (Class)PCTimerActivity;
    uint64_t v8 = [(PCTimerActivity *)&v13 initWithActivityType:v7];

    if (v8)
    {
      localizeActivityIfNeeded(v4, 8);
      makeIneligibleForProcessing(v8);
      v9 = [v4 userInfo];
      [(PCTimerActivity *)v8 setUserInfo:v9];

      v10 = [v4 title];
      [(PCTimerActivity *)v8 setTitle:v10];
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
  [(PCTimerActivity *)self timeLeft];
  double v4 = v3;
  v5 = [(PCTimerActivity *)self displayTitle];
  if (!v5 || v4 == 0.0 || v4 < 0.0)
  {
    v7 = +[PCLocalizedString localizedStringForKey:8];
  }
  else
  {
    int v6 = +[PCActivityUtility formattedDurationFor:v4];
    v7 = [NSString stringWithFormat:@"%@ - %@", v5, v6];
  }
  return v7;
}

- (BOOL)isValid
{
  v2 = [(PCTimerActivity *)self userInfo];
  double v3 = [v2 allKeys];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (double)timeLeft
{
  v2 = [(PCTimerActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"fireDate"];

  if (v3)
  {
    [v3 timeIntervalSinceNow];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (id)fireDate
{
  v2 = [(PCTimerActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"fireDate"];

  return v3;
}

- (id)displayTitle
{
  v2 = [(PCTimerActivity *)self userInfo];
  double v3 = [v2 objectForKeyedSubscript:@"displayTitle"];

  return v3;
}

- (unint64_t)pcactivityType
{
  return 4;
}

- (id)bundleIdentifier
{
  return @"com.apple.mobiletimer";
}

- (id)image
{
  v2 = [(PCTimerActivity *)self bundleIdentifier];
  double v3 = +[PCActivityUtility iconForBundleIdentifier:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pcactivityType];
  if (v5 == [(PCTimerActivity *)self pcactivityType])
  {
    char v6 = 0;
  }
  else
  {
    v7 = [(PCTimerActivity *)self description];
    uint64_t v8 = [v4 description];
    char v6 = [v7 isEqualToString:v8];
  }
  return v6;
}

@end