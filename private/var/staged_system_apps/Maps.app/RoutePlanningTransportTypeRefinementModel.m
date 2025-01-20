@interface RoutePlanningTransportTypeRefinementModel
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (id)iconImage;
- (id)menu;
- (id)titleText;
- (int)menuPressUsageAction;
- (int64_t)_resolvedTransportType;
- (void)_assertValidValue;
@end

@implementation RoutePlanningTransportTypeRefinementModel

- (id)iconImage
{
  uint64_t v2 = [(RoutePlanningTransportTypeRefinementModel *)self _resolvedTransportType];

  return sub_100A30B50(v2);
}

- (id)titleText
{
  uint64_t v2 = [(RoutePlanningTransportTypeRefinementModel *)self _resolvedTransportType];

  return sub_100A30CF4(v2);
}

- (BOOL)shouldShowHighlighted
{
  uint64_t v2 = [(RoutePlanningRefinementModel *)self value];
  BOOL v3 = [v2 integerValue] != 0;

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (int64_t)_resolvedTransportType
{
  uint64_t v2 = [(RoutePlanningRefinementModel *)self value];
  id v3 = [v2 integerValue];

  if (!v3)
  {
    uint64_t v4 = GEOGetUserTransportTypePreference();
    if ((unint64_t)(v4 - 1) < 4) {
      return v4 + 1;
    }
    else {
      return 1;
    }
  }
  return (int64_t)v3;
}

- (id)menu
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithObjects:&off_1013A9FA0, &off_1013A9FB8, &off_1013A9FD0, &off_1013A9FE8, 0];
  BOOL v4 = sub_10008034C();
  v5 = +[MapsOfflineUIHelper sharedHelper];
  unsigned int v6 = [v5 isUsingOfflineMaps];

  if ((v4 & ~v6) == 1) {
    [v3 addObject:&off_1013AA000];
  }
  v22 = objc_opt_new();
  v7 = [(RoutePlanningRefinementModel *)self value];
  id v21 = [v7 integerValue];

  objc_initWeak(&location, self);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v12 = [v11 integerValue];
        v13 = sub_100A30CF4((uint64_t)v12);
        v14 = sub_100A30B50((uint64_t)v12);
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100A31260;
        v23[3] = &unk_1012E6368;
        objc_copyWeak(&v24, &location);
        v23[4] = v11;
        v15 = +[UIAction actionWithTitle:v13 image:v14 identifier:0 handler:v23];

        [v15 setState:v21 == v12];
        CFStringRef v16 = @"Drive";
        if ((unint64_t)v12 <= 5) {
          CFStringRef v16 = *(&off_101314D90 + (void)v12);
        }
        v17 = [@"RefinementButtonType" stringByAppendingString:v16];
        [v15 setAccessibilityIdentifier:v17];

        [v22 addObject:v15];
        objc_destroyWeak(&v24);
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  v18 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:32 children:v22];
  objc_destroyWeak(&location);

  return v18;
}

- (int)menuPressUsageAction
{
  return 314;
}

- (void)_assertValidValue
{
  uint64_t v2 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    BOOL v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = +[NSString stringWithFormat:@"Wrong type"];
      int v8 = 136316162;
      uint64_t v9 = "-[RoutePlanningTransportTypeRefinementModel _assertValidValue]";
      __int16 v10 = 2080;
      v11 = "RoutePlanningTransportTypeRefinementModel.m";
      __int16 v12 = 1024;
      int v13 = 153;
      __int16 v14 = 2080;
      v15 = "[self.value isKindOfClass:[NSNumber class]]";
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v8, 0x30u);
    }
    if (sub_100BB36BC())
    {
      unsigned int v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = +[NSThread callStackSymbols];
        int v8 = 138412290;
        uint64_t v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

@end