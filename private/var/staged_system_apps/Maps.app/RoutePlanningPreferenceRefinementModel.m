@interface RoutePlanningPreferenceRefinementModel
- (BOOL)shouldShowChevron;
- (BOOL)shouldShowHighlighted;
- (id)titleText;
- (int)buttonPressUsageAction;
- (void)_assertValidValue;
@end

@implementation RoutePlanningPreferenceRefinementModel

- (id)titleText
{
  v3 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(RoutePlanningRefinementModel *)self value];
  v6 = v5;
  if (isKindOfClass)
  {
    if (![v5 avoidTolls]
      || ![v6 avoidHighways])
    {
      if ([v6 avoidTolls])
      {
        v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"[Preferences Picker] Avoid Tolls";
LABEL_53:
        v30 = [v7 localizedStringForKey:v9 value:@"localized string not found" table:0];
LABEL_54:

        goto LABEL_57;
      }
      if ([v6 avoidHighways])
      {
        v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"[Preferences Picker] Avoid Highways";
        goto LABEL_53;
      }
      goto LABEL_55;
    }
LABEL_52:
    v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"[Preferences Picker] Avoid 2";
    goto LABEL_53;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  v11 = [(RoutePlanningRefinementModel *)self value];
  v6 = v11;
  if (v10)
  {
    if ([v11 avoidHills]
      && [v6 avoidBusyRoads])
    {
      goto LABEL_52;
    }
    if ([v6 avoidHills]) {
      goto LABEL_10;
    }
    if ([v6 avoidBusyRoads]) {
      goto LABEL_29;
    }
    goto LABEL_55;
  }
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  v6 = [(RoutePlanningRefinementModel *)self value];
  if ((v12 & 1) == 0)
  {
    objc_opt_class();
    char v14 = objc_opt_isKindOfClass();

    if ((v14 & 1) == 0)
    {
      v25 = sub_1005762E4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "-[RoutePlanningPreferenceRefinementModel titleText]";
        __int16 v42 = 2080;
        v43 = "RoutePlanningPreferenceRefinementModel.m";
        __int16 v44 = 1024;
        int v45 = 84;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (!sub_100BB36BC()) {
        goto LABEL_56;
      }
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v26 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v41 = v26;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      goto LABEL_55;
    }
    v6 = [(RoutePlanningRefinementModel *)self value];
    if (![v6 disabledModes])
    {
      v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Preferences Picker] Prefer";
      goto LABEL_53;
    }
    unsigned __int8 v15 = [v6 disabledModes];
    unint64_t v16 = v15 & 0xF ^ 0xFLL;
    if ((v15 & 0xF) == 0)
    {
      v36 = sub_1005762E4();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = +[NSString stringWithFormat:@"Ended up with all transit modes preferred, even though we expected some disabled"];
        *(_DWORD *)buf = 136316162;
        v41 = "-[RoutePlanningPreferenceRefinementModel titleText]";
        __int16 v42 = 2080;
        v43 = "RoutePlanningPreferenceRefinementModel.m";
        __int16 v44 = 1024;
        int v45 = 61;
        __int16 v46 = 2080;
        v47 = "preferredModes != TransitModeAll";
        __int16 v48 = 2112;
        v49 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v38 = sub_1005762E4();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v41 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
    id v17 = objc_alloc_init((Class)NSMutableArray);
    v18 = v17;
    if (v16)
    {
      [v17 addObject:&off_1013A8248];
      if ((v16 & 2) == 0)
      {
LABEL_21:
        if ((v16 & 4) == 0)
        {
LABEL_23:
          if (v16 >= 8) {
            [v18 addObject:&off_1013A8290];
          }
          id v8 = [v18 copy];

          id v19 = [v8 count];
          if (v19 == (id)1)
          {
            v20 = [v8 lastObject];
            switch((unint64_t)[v20 integerValue])
            {
              case 1uLL:
                v21 = +[NSBundle mainBundle];
                v22 = v21;
                CFStringRef v23 = @"[Preferences Picker] Bus";
                break;
              case 2uLL:
                v21 = +[NSBundle mainBundle];
                v22 = v21;
                CFStringRef v23 = @"[Preferences Picker] Subway/Light Rail";
                break;
              case 4uLL:
                v21 = +[NSBundle mainBundle];
                v22 = v21;
                CFStringRef v23 = @"[Preferences Picker] Rail";
                break;
              case 8uLL:
                v21 = +[NSBundle mainBundle];
                v22 = v21;
                CFStringRef v23 = @"[Preferences Picker] Ferry";
                break;
              default:
                v33 = sub_1005762E4();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v41 = "-[RoutePlanningPreferenceRefinementModel titleText]";
                  __int16 v42 = 2080;
                  v43 = "RoutePlanningPreferenceRefinementModel.m";
                  __int16 v44 = 1024;
                  int v45 = 76;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
                }

                if (sub_100BB36BC())
                {
                  v34 = sub_1005762E4();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    v35 = +[NSThread callStackSymbols];
                    *(_DWORD *)buf = 138412290;
                    v41 = v35;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }
                }

                goto LABEL_75;
            }
            uint64_t v32 = [v21 localizedStringForKey:v23 value:@"localized string not found" table:0];
          }
          else
          {
LABEL_75:
            v20 = +[NSBundle mainBundle];
            v22 = [v20 localizedStringForKey:@"[Preferences Picker] Prefer #" value:@"localized string not found" table:0];
            uint64_t v32 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v22, v19);
          }
          v30 = (void *)v32;

          goto LABEL_54;
        }
LABEL_22:
        [v18 addObject:&off_1013A8278];
        goto LABEL_23;
      }
    }
    else if ((v16 & 2) == 0)
    {
      goto LABEL_21;
    }
    [v18 addObject:&off_1013A8260];
    if ((v16 & 4) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (sub_100CD3150()) {
    unsigned int v13 = [v6 avoidHills];
  }
  else {
    unsigned int v13 = 0;
  }
  if (sub_100CD3150()) {
    unsigned int v24 = [v6 avoidBusyRoads];
  }
  else {
    unsigned int v24 = 0;
  }
  if (sub_100CD31B0())
  {
    unsigned int v27 = [v6 avoidStairs];
    int v28 = v24 ^ 1;
    int v29 = v27 ^ 1;
    if (((v13 ^ 1) & 1) == 0 && (v28 & 1) == 0 && (v29 & 1) == 0)
    {
      v7 = +[NSBundle mainBundle];
      id v8 = v7;
      CFStringRef v9 = @"[Preferences Picker] Avoid 3";
      goto LABEL_53;
    }
    if ((v13 ^ 1 | v28 & v29) != 1 || ((v28 | v29) & 1) == 0) {
      goto LABEL_52;
    }
  }
  else
  {
    if (v13 & v24) {
      goto LABEL_52;
    }
    unsigned int v27 = 0;
  }
  if (v13)
  {
LABEL_10:
    v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"[Preferences Picker] Avoid Hills";
    goto LABEL_53;
  }
  if (v24)
  {
LABEL_29:
    v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"[Preferences Picker] Avoid Busy Roads";
    goto LABEL_53;
  }
  if (v27)
  {
    v7 = +[NSBundle mainBundle];
    id v8 = v7;
    CFStringRef v9 = @"[Preferences Picker] Avoid Stairs";
    goto LABEL_53;
  }
LABEL_55:

LABEL_56:
  v6 = +[NSBundle mainBundle];
  v30 = [v6 localizedStringForKey:@"[Preferences Picker] Avoid" value:@"localized string not found" table:0];
LABEL_57:

  return v30;
}

- (int)buttonPressUsageAction
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 311;
  }
  else {
    return 313;
  }
}

- (BOOL)shouldShowHighlighted
{
  v2 = [(RoutePlanningRefinementModel *)self value];
  unsigned __int8 v3 = [v2 hasAnyNonStandardPreferences];

  return v3;
}

- (BOOL)shouldShowChevron
{
  return 1;
}

- (void)_assertValidValue
{
  id v8 = [(RoutePlanningRefinementModel *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    unsigned __int8 v3 = [(RoutePlanningRefinementModel *)self value];

    if (v3)
    {
      v4 = sub_1005762E4();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = +[NSString stringWithFormat:@"Wrong type"];
        *(_DWORD *)buf = 136316162;
        char v10 = "-[RoutePlanningPreferenceRefinementModel _assertValidValue]";
        __int16 v11 = 2080;
        char v12 = "RoutePlanningPreferenceRefinementModel.m";
        __int16 v13 = 1024;
        int v14 = 111;
        __int16 v15 = 2080;
        unint64_t v16 = "[self.value isKindOfClass:[WatchSyncedPreferences class]] || !self.value";
        __int16 v17 = 2112;
        v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
      }
      if (sub_100BB36BC())
      {
        v6 = sub_1005762E4();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          char v10 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
}

@end