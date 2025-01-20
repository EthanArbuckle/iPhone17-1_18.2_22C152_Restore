@interface NanoAlarmDataSource
+ (id)_alarmContentWithFireDate:(id)a3 isSnoozing:(BOOL)a4 isWakeUp:(BOOL)a5;
+ (id)_alarmElementWithFireDate:(id)a3 isSnoozing:(BOOL)a4 isWakeUp:(BOOL)a5 identifier:(id)a6;
+ (id)bundleIdentifier;
+ (id)relevanceProviderForDate:(id)a3;
- (id)supportedSections;
- (id)todaysAlarms;
- (id)tomorrowAlarms;
- (void)_setAlarmElements:(id)a3 withHandler:(id)a4;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NanoAlarmDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoAlarm";
}

- (id)supportedSections
{
  v4[0] = REDefaultSectionIdentifier;
  v4[1] = RETomorrowSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_alarmContentWithFireDate:(id)a3 isSnoozing:(BOOL)a4 isWakeUp:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  if (v6)
  {
    v9 = +[CLKRelativeDateTextProvider textProviderWithDate:v7 style:2 units:224];

    [v8 setDescription1TextProvider:v9];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"UP_NEXT_ALARMS_SNOOZING_TITLE" value:&stru_83A8 table:0];
    v12 = +[CLKSimpleTextProvider textProviderWithText:v11];
    [v8 setHeaderTextProvider:v12];
  }
  else
  {
    v13 = +[CLKTimeTextProvider textProviderWithDate:v7];

    [v8 setDescription1TextProvider:v13];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = v14;
    if (v5)
    {
      CFStringRef v16 = @"UP_NEXT_WAKEUP_TITLE";
      CFStringRef v17 = @"Localizable_Eucalyptus";
    }
    else
    {
      CFStringRef v16 = @"UP_NEXT_ALARMS_TITLE";
      CFStringRef v17 = 0;
    }
    v9 = [v14 localizedStringForKey:v16 value:&stru_83A8 table:v17];

    v10 = +[CLKSimpleTextProvider textProviderWithText:v9];
    [v8 setHeaderTextProvider:v10];
  }

  v18 = +[UIImageSymbolConfiguration configurationWithScale:1];
  v19 = +[UIImage systemImageNamed:@"alarm.waves.left.and.right.fill" withConfiguration:v18];
  v20 = +[UIColor systemOrangeColor];
  v21 = [v19 imageWithTintColor:v20 renderingMode:1];

  [v8 setOverrideHeaderImage:v21];
  [v8 setStyle:1];

  return v8;
}

+ (id)relevanceProviderForDate:(id)a3
{
  return 0;
}

+ (id)_alarmElementWithFireDate:(id)a3 isSnoozing:(BOOL)a4 isWakeUp:(BOOL)a5 identifier:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  v12 = [a1 relevanceProviderForDate:v11];
  v13 = [(id)objc_opt_class() _alarmContentWithFireDate:v11 isSnoozing:v7 isWakeUp:v6];

  CFStringRef v14 = @"list";
  if (v6) {
    CFStringRef v14 = @"sleepAlarm";
  }
  v15 = +[NSString stringWithFormat:@"nanoalarm://%@/%@", v14, v10];
  id v16 = objc_alloc((Class)REElementOpenAction);
  CFStringRef v17 = +[NSURL URLWithString:v15];
  id v18 = [v16 initWithURL:v17 applicationID:@"com.apple.NanoAlarm"];

  id v19 = objc_alloc((Class)REElement);
  v20 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.NanoAlarm", v10];

  v24 = v12;
  v21 = +[NSArray arrayWithObjects:&v24 count:1];
  id v22 = [v19 initWithIdentifier:v20 content:v13 action:v18 relevanceProviders:v21];

  return v22;
}

- (id)todaysAlarms
{
  return 0;
}

- (id)tomorrowAlarms
{
  return 0;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  id v9 = a3;
  BOOL v6 = (void (**)(id, void *))a4;
  if ([v9 isEqualToString:REDefaultSectionIdentifier])
  {
    uint64_t v7 = [(NanoAlarmDataSource *)self todaysAlarms];
LABEL_5:
    v8 = (void *)v7;
    [(NanoAlarmDataSource *)self _setAlarmElements:v7 withHandler:v6];

    goto LABEL_7;
  }
  if ([v9 isEqualToString:RETomorrowSectionIdentifier])
  {
    uint64_t v7 = [(NanoAlarmDataSource *)self tomorrowAlarms];
    goto LABEL_5;
  }
  v6[2](v6, &__NSArray0__struct);
LABEL_7:
}

- (void)_setAlarmElements:(id)a3 withHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5250;
  v7[3] = &unk_82B0;
  v7[4] = self;
  id v8 = a4;
  id v5 = v8;
  id v6 = [a3 addCompletionBlock:v7];
}

@end