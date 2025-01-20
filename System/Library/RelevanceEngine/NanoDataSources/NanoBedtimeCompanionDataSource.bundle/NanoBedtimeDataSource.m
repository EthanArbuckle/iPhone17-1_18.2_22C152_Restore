@interface NanoBedtimeDataSource
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion;
+ (id)_contentForEvent:(id)a3;
+ (id)_elementForEvent:(id)a3;
+ (id)_filterEvents:(id)a3 forSection:(id)a4;
+ (id)bundleIdentifier;
+ (id)relevanceProviderForDate:(id)a3;
- (id)supportedSections;
- (id)upcomingEvents;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NanoBedtimeDataSource

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 6;
  return result;
}

+ (id)bundleIdentifier
{
  return HKSPNanoSleepAppBundleIdentifier;
}

- (id)supportedSections
{
  v4[0] = REDefaultSectionIdentifier;
  v4[1] = RETomorrowSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)_contentForEvent:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = objc_opt_new();
  v6 = [v3 dueDate];
  v7 = +[CLKTimeTextProvider textProviderWithDate:v6];
  [v5 setDescription1TextProvider:v7];

  v8 = [v3 identifier];

  unsigned int v9 = [v8 isEqualToString:HKSPSleepEventIdentifierBedtime];
  if (v9) {
    CFStringRef v10 = @"UP_NEXT_BEDTIME_TITLE";
  }
  else {
    CFStringRef v10 = @"UP_NEXT_WINDDOWN_TITLE";
  }
  if (v9) {
    CFStringRef v11 = @"Bedtime";
  }
  else {
    CFStringRef v11 = @"WindDown";
  }
  v12 = [v4 localizedStringForKey:v10 value:&stru_4240 table:0];
  v13 = +[UIImage imageNamed:v11 inBundle:v4 compatibleWithTraitCollection:0];
  v14 = +[CLKSimpleTextProvider textProviderWithText:v12];
  [v5 setHeaderTextProvider:v14];

  v15 = +[UIColor hksp_siriPlatterImageColor];
  [v5 setTintColor:v15];

  [v5 setOverrideHeaderImage:v13];
  [v5 setStyle:1];

  return v5;
}

+ (id)relevanceProviderForDate:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  [v5 handleFailureInMethod:a2 object:a1 file:@"NanoBedtimeDataSource.m" lineNumber:72 description:@"Subclass must implement"];

  return 0;
}

+ (id)_elementForEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 dueDate];
  v6 = [a1 relevanceProviderForDate:v5];

  uint64_t v7 = HKSPNanoSleepAppLaunchURL;
  id v8 = objc_alloc((Class)REElementOpenAction);
  unsigned int v9 = +[NSURL URLWithString:v7];
  id v10 = [v8 initWithURL:v9 applicationID:HKSPNanoSleepAppBundleIdentifier];

  CFStringRef v11 = [(id)objc_opt_class() _contentForEvent:v4];
  id v12 = objc_alloc((Class)REElement);
  v13 = [v4 identifier];

  v17 = v6;
  v14 = +[NSArray arrayWithObjects:&v17 count:1];
  id v15 = [v12 initWithIdentifier:v13 content:v11 action:v10 relevanceProviders:v14];

  return v15;
}

- (id)upcomingEvents
{
  id v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"NanoBedtimeDataSource.m" lineNumber:89 description:@"Subclass must implement"];

  return 0;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HKSPLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = (id)objc_opt_class();
    id v9 = v21;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] getElementsInSection:", buf, 0xCu);
  }
  id v10 = [(NanoBedtimeDataSource *)self supportedSections];
  unsigned int v11 = [v10 containsObject:v6];

  if (v11)
  {
    id v12 = [(NanoBedtimeDataSource *)self upcomingEvents];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_2C20;
    v17[3] = &unk_41D8;
    v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v13 = [v12 addCompletionBlock:v17];
  }
  else
  {
    v14 = HKSPLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      id v21 = v15;
      __int16 v22 = 2114;
      id v23 = v6;
      id v16 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring section %{public}@", buf, 0x16u);
    }
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSArray0__struct);
  }
}

+ (id)_filterEvents:(id)a3 forSection:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[NSCalendar currentCalendar];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2FAC;
  v11[3] = &unk_4200;
  id v12 = v5;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v13;
  id v8 = v5;
  id v9 = objc_msgSend(v6, "na_filter:", v11);

  return v9;
}

@end