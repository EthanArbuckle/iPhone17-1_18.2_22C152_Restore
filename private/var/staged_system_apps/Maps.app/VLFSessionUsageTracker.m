@interface VLFSessionUsageTracker
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (VLFSessionUsageTracker)sharedInstance;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)hasUserEnteredVLF;
- (BOOL)hasUserSeenVLFCallout;
- (BOOL)hasVLFEverLocalized;
- (BOOL)isVLFCalloutEnabled;
- (VLFSessionUsageTracker)init;
- (double)timeSinceLastVLFInteraction;
- (id)allCalloutDismissalDates;
- (id)allCalloutTapDates;
- (int64_t)numberOfTimesVLFLocalized;
- (unint64_t)numberOfCalloutDismissals;
- (unint64_t)numberOfCalloutInteractions;
- (unint64_t)numberOfCalloutTaps;
- (void)clearAll;
- (void)clearDismissals;
- (void)clearSuccessfulVLFLocalizations;
- (void)clearTaps;
- (void)clearUserEnteredVLFFlag;
- (void)clearUserWasShownVLFCalloutFlag;
- (void)dealloc;
- (void)registerLocalizationSuccess;
- (void)registerUserDismissedCallout;
- (void)registerUserEnteredVLF;
- (void)registerUserTappedCallout;
- (void)registerUserWasShownCallout;
- (void)setNumberOfTimesVLFLocalized:(int64_t)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation VLFSessionUsageTracker

- (int64_t)numberOfTimesVLFLocalized
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"kVLFSessionUsageLocalizationSuccessCountKey"];

  return (int64_t)v3;
}

- (VLFSessionUsageTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)VLFSessionUsageTracker;
  v2 = [(VLFSessionUsageTracker *)&v7 init];
  if (v2)
  {
    _GEOConfigAddDelegateListenerForKey();
    id v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"kVLFSessionUsageLocalizationSuccessKey"];

    if (v4)
    {
      v5 = +[NSUserDefaults standardUserDefaults];
      [v5 removeObjectForKey:@"kVLFSessionUsageLocalizationSuccessKey"];

      [(VLFSessionUsageTracker *)v2 setNumberOfTimesVLFLocalized:(char *)[(VLFSessionUsageTracker *)v2 numberOfTimesVLFLocalized] + 1];
    }
  }
  return v2;
}

+ (VLFSessionUsageTracker)sharedInstance
{
  if (qword_101610B98 != -1) {
    dispatch_once(&qword_101610B98, &stru_10131C080);
  }
  v2 = (void *)qword_101610B90;

  return (VLFSessionUsageTracker *)v2;
}

- (unint64_t)numberOfCalloutInteractions
{
  unint64_t v3 = [(VLFSessionUsageTracker *)self numberOfCalloutTaps];
  return [(VLFSessionUsageTracker *)self numberOfCalloutDismissals] + v3;
}

- (unint64_t)numberOfCalloutTaps
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"kVLFSessionUsageCalloutTapsKey"];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (unint64_t)numberOfCalloutDismissals
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"kVLFSessionUsageCalloutDismissalsKey"];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector("numberOfCalloutDismissals");
  if ([v4 isEqualToString:v5]) {
    goto LABEL_8;
  }
  v6 = NSStringFromSelector("numberOfCalloutTaps");
  if ([v4 isEqualToString:v6])
  {
LABEL_7:

LABEL_8:
LABEL_9:
    unsigned __int8 v9 = 0;
    goto LABEL_10;
  }
  objc_super v7 = NSStringFromSelector("numberOfTimesVLFLocalized");
  if ([v4 isEqualToString:v7])
  {
LABEL_6:

    goto LABEL_7;
  }
  v8 = NSStringFromSelector("hasUserSeenVLFCallout");
  if ([v4 isEqualToString:v8])
  {

    goto LABEL_6;
  }
  v11 = NSStringFromSelector("isVLFCalloutEnabled");
  unsigned __int8 v12 = [v4 isEqualToString:v11];

  if (v12) {
    goto LABEL_9;
  }
  v13 = NSStringFromSelector("hasVLFEverLocalized");
  unsigned __int8 v14 = [v4 isEqualToString:v13];

  if (v14)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___VLFSessionUsageTracker;
    unsigned __int8 v9 = [v15 automaticallyNotifiesObserversForKey:v4];
  }
LABEL_10:

  return v9;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector("numberOfCalloutInteractions");
  if ([v4 isEqualToString:v5])
  {

LABEL_4:
    v8 = NSStringFromSelector("numberOfCalloutDismissals");
    unsigned __int8 v9 = NSStringFromSelector("numberOfCalloutTaps");
    v10 = NSStringFromSelector("hasUserEnteredVLF");
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, 0);

LABEL_10:
    goto LABEL_11;
  }
  v6 = NSStringFromSelector("timeSinceLastVLFInteraction");
  unsigned int v7 = [v4 isEqualToString:v6];

  if (v7) {
    goto LABEL_4;
  }
  unsigned __int8 v12 = NSStringFromSelector("hasUserSeenVLFCallout");
  unsigned int v13 = [v4 isEqualToString:v12];

  if (v13)
  {
    unsigned __int8 v14 = "isVLFCalloutEnabled";
LABEL_9:
    v8 = NSStringFromSelector(v14);
    v11 = +[NSSet setWithObject:v8];
    goto LABEL_10;
  }
  objc_super v15 = NSStringFromSelector("hasVLFEverLocalized");
  unsigned int v16 = [v4 isEqualToString:v15];

  if (v16)
  {
    unsigned __int8 v14 = "numberOfTimesVLFLocalized";
    goto LABEL_9;
  }
  v18.receiver = a1;
  v18.super_class = (Class)&OBJC_METACLASS___VLFSessionUsageTracker;
  v11 = [super keyPathsForValuesAffectingValueForKey:v4];
LABEL_11:

  return v11;
}

- (BOOL)hasVLFEverLocalized
{
  return [(VLFSessionUsageTracker *)self numberOfTimesVLFLocalized] > 0;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionUsageTracker;
  [(VLFSessionUsageTracker *)&v3 dealloc];
}

- (BOOL)hasUserEnteredVLF
{
  v2 = +[NSUserDefaults standardUserDefaults];
  objc_super v3 = [v2 objectForKey:@"kVLFSessionUsageVLFWasEnteredKey"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasUserSeenVLFCallout
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  if ([v3 BOOLForKey:@"kVLFSessionUsageCalloutWasShownKey"]) {
    LOBYTE(v4) = 1;
  }
  else {
    unsigned int v4 = ![(VLFSessionUsageTracker *)self isVLFCalloutEnabled];
  }

  return v4;
}

- (void)setNumberOfTimesVLFLocalized:(int64_t)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:a3 forKey:@"kVLFSessionUsageLocalizationSuccessCountKey"];
}

- (double)timeSinceLastVLFInteraction
{
  v2 = +[NSUserDefaults standardUserDefaults];
  objc_super v3 = [v2 objectForKey:@"kVLFSessionUsageCalloutDismissalsKey"];
  id v4 = [v3 lastObject];

  v5 = +[NSUserDefaults standardUserDefaults];
  v6 = [v5 objectForKey:@"kVLFSessionUsageCalloutTapsKey"];
  unsigned int v7 = [v6 lastObject];

  v8 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v9 = [v8 objectForKey:@"kVLFSessionUsageVLFWasEnteredKey"];

  v10 = +[NSMutableArray array];
  v11 = v10;
  if (v4) {
    [v10 addObject:v4];
  }
  if (v7) {
    [v11 addObject:v7];
  }
  if (v9) {
    [v11 addObject:v9];
  }
  if ([v11 count])
  {
    v24 = v7;
    v25 = v4;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = v11;
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      double v16 = 1.79769313e308;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v19 = +[NSDate date];
          [v19 timeIntervalSinceDate:v18];
          if (v16 >= v20)
          {
            v21 = +[NSDate date];
            [v21 timeIntervalSinceDate:v18];
            double v16 = v22;
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v14);
    }
    else
    {
      double v16 = 1.79769313e308;
    }

    unsigned int v7 = v24;
    id v4 = v25;
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

- (void)registerUserEnteredVLF
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136316418;
        uint64_t v15 = "-[VLFSessionUsageTracker registerUserEnteredVLF]";
        __int16 v16 = 2080;
        v17 = "VLFSessionUsageTracker.m";
        __int16 v18 = 1024;
        int v19 = 141;
        __int16 v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        __int16 v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v12 = sub_1005762E4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = +[NSThread callStackSymbols];
          int v14 = 138412290;
          uint64_t v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
  }
  v6 = sub_100C367F0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering user entered VLF", (uint8_t *)&v14, 2u);
  }

  unsigned int v7 = NSStringFromSelector("hasUserEnteredVLF");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v7];

  v8 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v9 = +[NSDate date];
  [v8 setObject:v9 forKey:@"kVLFSessionUsageVLFWasEnteredKey"];

  v10 = NSStringFromSelector("hasUserEnteredVLF");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v10];
}

- (void)registerUserWasShownCallout
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v10 = sub_1005762E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136316418;
        int v14 = "-[VLFSessionUsageTracker registerUserWasShownCallout]";
        __int16 v15 = 2080;
        __int16 v16 = "VLFSessionUsageTracker.m";
        __int16 v17 = 1024;
        int v18 = 152;
        __int16 v19 = 2080;
        __int16 v20 = "dispatch_get_main_queue()";
        __int16 v21 = 2080;
        __int16 v22 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v23 = 2080;
        __int16 v24 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v13,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v11 = sub_1005762E4();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = +[NSThread callStackSymbols];
          int v13 = 138412290;
          int v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
  }
  v6 = sub_100C367F0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering user was shown callout", (uint8_t *)&v13, 2u);
  }

  unsigned int v7 = NSStringFromSelector("hasUserSeenVLFCallout");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v7];

  v8 = +[NSUserDefaults standardUserDefaults];
  [v8 setBool:1 forKey:@"kVLFSessionUsageCalloutWasShownKey"];

  unsigned __int8 v9 = NSStringFromSelector("hasUserSeenVLFCallout");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v9];
}

- (void)registerUserDismissedCallout
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      __int16 v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        __int16 v19 = "-[VLFSessionUsageTracker registerUserDismissedCallout]";
        __int16 v20 = 2080;
        __int16 v21 = "VLFSessionUsageTracker.m";
        __int16 v22 = 1024;
        int v23 = 163;
        __int16 v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        long long v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        long long v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          __int16 v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  v6 = sub_100C367F0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering user dismissed callout", (uint8_t *)&v18, 2u);
  }

  unsigned int v7 = +[NSUserDefaults standardUserDefaults];
  v8 = [v7 objectForKey:@"kVLFSessionUsageCalloutDismissalsKey"];

  if (!v8) {
    v8 = objc_opt_new();
  }
  id v9 = [v8 mutableCopy];
  v10 = +[NSDate date];
  [v9 addObject:v10];

  if ([v9 count] == (id)11) {
    [v9 removeObjectAtIndex:0];
  }
  id v11 = [v9 copy];

  id v12 = NSStringFromSelector("numberOfCalloutDismissals");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v12];

  int v13 = +[NSUserDefaults standardUserDefaults];
  [v13 setObject:v11 forKey:@"kVLFSessionUsageCalloutDismissalsKey"];

  int v14 = NSStringFromSelector("numberOfCalloutDismissals");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v14];
}

- (void)registerUserTappedCallout
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      __int16 v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v18 = 136316418;
        __int16 v19 = "-[VLFSessionUsageTracker registerUserTappedCallout]";
        __int16 v20 = 2080;
        __int16 v21 = "VLFSessionUsageTracker.m";
        __int16 v22 = 1024;
        int v23 = 188;
        __int16 v24 = 2080;
        v25 = "dispatch_get_main_queue()";
        __int16 v26 = 2080;
        long long v27 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v28 = 2080;
        long long v29 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v18,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v16 = sub_1005762E4();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = +[NSThread callStackSymbols];
          int v18 = 138412290;
          __int16 v19 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
  }
  v6 = sub_100C367F0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering user tapped callout", (uint8_t *)&v18, 2u);
  }

  unsigned int v7 = +[NSUserDefaults standardUserDefaults];
  v8 = [v7 objectForKey:@"kVLFSessionUsageCalloutTapsKey"];

  if (!v8) {
    v8 = objc_opt_new();
  }
  id v9 = [v8 mutableCopy];
  v10 = +[NSDate date];
  [v9 addObject:v10];

  if ([v9 count] == (id)11) {
    [v9 removeObjectAtIndex:0];
  }
  id v11 = [v9 copy];

  id v12 = NSStringFromSelector("numberOfCalloutTaps");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v12];

  int v13 = +[NSUserDefaults standardUserDefaults];
  [v13 setObject:v11 forKey:@"kVLFSessionUsageCalloutTapsKey"];

  int v14 = NSStringFromSelector("numberOfCalloutTaps");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v14];
}

- (void)registerLocalizationSuccess
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  id v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      id v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136316418;
        int v13 = "-[VLFSessionUsageTracker registerLocalizationSuccess]";
        __int16 v14 = 2080;
        __int16 v15 = "VLFSessionUsageTracker.m";
        __int16 v16 = 1024;
        int v17 = 213;
        __int16 v18 = 2080;
        __int16 v19 = "dispatch_get_main_queue()";
        __int16 v20 = 2080;
        __int16 v21 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v22 = 2080;
        int v23 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v12,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = +[NSThread callStackSymbols];
          int v12 = 138412290;
          int v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);
        }
      }
    }
  }
  v6 = sub_100C367F0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registering localization success", (uint8_t *)&v12, 2u);
  }

  unsigned int v7 = NSStringFromSelector("numberOfTimesVLFLocalized");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v7];

  [(VLFSessionUsageTracker *)self setNumberOfTimesVLFLocalized:(char *)[(VLFSessionUsageTracker *)self numberOfTimesVLFLocalized] + 1];
  v8 = NSStringFromSelector("numberOfTimesVLFLocalized");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v8];
}

- (id)allCalloutDismissalDates
{
  v2 = +[NSUserDefaults standardUserDefaults];
  objc_super v3 = [v2 objectForKey:@"kVLFSessionUsageCalloutDismissalsKey"];

  return v3;
}

- (id)allCalloutTapDates
{
  v2 = +[NSUserDefaults standardUserDefaults];
  objc_super v3 = [v2 objectForKey:@"kVLFSessionUsageCalloutTapsKey"];

  return v3;
}

- (void)clearAll
{
  objc_super v3 = sub_100C367F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing all usage counts", v4, 2u);
  }

  [(VLFSessionUsageTracker *)self clearUserEnteredVLFFlag];
  [(VLFSessionUsageTracker *)self clearUserWasShownVLFCalloutFlag];
  [(VLFSessionUsageTracker *)self clearSuccessfulVLFLocalizations];
  [(VLFSessionUsageTracker *)self clearDismissals];
  [(VLFSessionUsageTracker *)self clearTaps];
}

- (void)clearUserEnteredVLFFlag
{
  objc_super v3 = sub_100C367F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing user entered VLF flag", v7, 2u);
  }

  id v4 = NSStringFromSelector("hasUserEnteredVLF");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v4];

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"kVLFSessionUsageVLFWasEnteredKey"];

  v6 = NSStringFromSelector("hasUserEnteredVLF");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v6];
}

- (void)clearUserWasShownVLFCalloutFlag
{
  objc_super v3 = sub_100C367F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing was shown VLF callout flag", v7, 2u);
  }

  id v4 = NSStringFromSelector("hasUserSeenVLFCallout");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v4];

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"kVLFSessionUsageCalloutWasShownKey"];

  v6 = NSStringFromSelector("hasUserSeenVLFCallout");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v6];
}

- (void)clearSuccessfulVLFLocalizations
{
  objc_super v3 = sub_100C367F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing successful VLF localizations", v7, 2u);
  }

  id v4 = NSStringFromSelector("numberOfTimesVLFLocalized");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v4];

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"kVLFSessionUsageLocalizationSuccessCountKey"];

  v6 = NSStringFromSelector("numberOfTimesVLFLocalized");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v6];
}

- (void)clearDismissals
{
  objc_super v3 = sub_100C367F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing dismissals", v7, 2u);
  }

  id v4 = NSStringFromSelector("numberOfCalloutDismissals");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v4];

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"kVLFSessionUsageCalloutDismissalsKey"];

  v6 = NSStringFromSelector("numberOfCalloutDismissals");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v6];
}

- (void)clearTaps
{
  objc_super v3 = sub_100C367F0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Clearing taps", v7, 2u);
  }

  id v4 = NSStringFromSelector("numberOfCalloutTaps");
  [(VLFSessionUsageTracker *)self willChangeValueForKey:v4];

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"kVLFSessionUsageCalloutTapsKey"];

  v6 = NSStringFromSelector("numberOfCalloutTaps");
  [(VLFSessionUsageTracker *)self didChangeValueForKey:v6];
}

- (BOOL)isVLFCalloutEnabled
{
  return GEOConfigGetBOOL();
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_VLFSessionActiveUIEnabled && a3.var1 == off_1015EF6E8)
  {
    v8 = NSStringFromSelector("isVLFCalloutEnabled");
    [(VLFSessionUsageTracker *)self willChangeValueForKey:v8];

    NSStringFromSelector("isVLFCalloutEnabled");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    -[VLFSessionUsageTracker didChangeValueForKey:](self, "didChangeValueForKey:");
  }
  else
  {
    id v4 = sub_1005762E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v11 = "-[VLFSessionUsageTracker valueChangedForGEOConfigKey:]";
      __int16 v12 = 2080;
      int v13 = "VLFSessionUsageTracker.m";
      __int16 v14 = 1024;
      int v15 = 334;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100BB36BC())
    {
      BOOL v5 = sub_1005762E4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
}

@end