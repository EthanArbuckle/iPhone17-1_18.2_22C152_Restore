@interface RECalendarSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation RECalendarSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoCalendar";
}

- (id)supportedSections
{
  uint64_t v4 = REDefaultSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, void *))a4;
  v5 = +[NSCalendar currentCalendar];
  v6 = +[NSDate date];
  v7 = [v5 dateBySettingHour:11 minute:30 second:0 ofDate:v6 options:0];

  v18 = [v5 dateByAddingUnit:32 value:1 toDate:v7 options:0];
  v8 = +[UIColor colorWithRed:0.91 green:0.16 blue:0.14 alpha:1.0];
  v9 = RECalendarLocalizedString(@"UP_NEXT_SAMPLE_CALENDAR_TITLE");
  v10 = RECalendarLocalizedString(@"UP_NEXT_SAMPLE_CALENDAR_LOCATION");
  id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 endDate:v18];
  v12 = RECalendarContent(v9, v10, 0, v8, v11, 0, 0);

  id v13 = objc_alloc((Class)REElement);
  v14 = REUISampleRelevanceProviderForSamplePosition();
  v20 = v14;
  v15 = +[NSArray arrayWithObjects:&v20 count:1];
  id v16 = [v13 initWithIdentifier:@"calendar.sample" content:v12 action:0 relevanceProviders:v15];

  id v19 = v16;
  v17 = +[NSArray arrayWithObjects:&v19 count:1];
  v4[2](v4, v17);
}

@end