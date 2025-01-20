@interface RERelevanceEngineHeartUtilities
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumOperatingSystemVersion;
+ (id)_contentWithHeaderText:(id)a3 largeTextProvider:(id)a4;
+ (id)_newContent;
+ (id)_recoveryActionForRecoveryStatistics:(id)a3 workoutStatistics:(id)a4;
+ (id)_recoveryContentFromRecoveryStatistics:(id)a3 workoutIsIndoor:(BOOL)a4;
+ (id)_recoveryContentWithZeroMinuteBPM:(id)a3 twoMinuteBPM:(id)a4 activityType:(id)a5;
+ (id)_recoveryImageWithActivityType:(id)a3;
+ (id)_recoveryStatisticsFromSummary:(id)a3;
+ (id)_restingAction;
+ (id)_restingContentFromSummary:(id)a3;
+ (id)_sampleContent;
+ (id)_walkingAction;
+ (id)_walkingContentFromSample:(id)a3;
+ (id)_workoutStatisticsFromRecoveryStatistics:(id)a3 inSummary:(id)a4;
+ (id)applicationIdentifier;
+ (id)bundleIdentifier;
+ (id)heartLogoImage;
+ (id)heartRateHeader;
+ (id)recoveryElementFromSummary:(id)a3 isIndoor:(BOOL)a4;
+ (id)restingElementFromSummary:(id)a3;
+ (id)sampleElement;
+ (id)sampleRestingContent;
+ (id)walkingElementFromSample:(id)a3;
+ (id)workoutPredicateForSummary:(id)a3;
@end

@implementation RERelevanceEngineHeartUtilities

+ (id)bundleIdentifier
{
  return @"com.apple.HeartRate.summary";
}

+ (id)applicationIdentifier
{
  return @"com.apple.HeartRate";
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumOperatingSystemVersion
{
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 5;
  return result;
}

+ (id)heartRateHeader
{
  return REHeartRateLocalizedString(@"HEART_RATE_HEADER_TEXT");
}

+ (id)heartLogoImage
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = +[REImage imageNamed:@"HeartBuddyIcon" inBundle:v2];

  return v3;
}

+ (id)sampleElement
{
  v2 = [a1 _sampleContent];
  v3 = REUISampleRelevanceProviderForSamplePosition();
  v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  id v5 = [objc_alloc((Class)REElement) initWithIdentifier:@"com.apple.heart.summary" content:v2 action:0 relevanceProviders:v4 privacyBehavior:1];

  return v5;
}

+ (id)workoutPredicateForSummary:(id)a3
{
  v3 = [a1 _recoveryStatisticsFromSummary:a3];
  v4 = [v3 sessionUUID];

  if (v4)
  {
    id v5 = +[NSPredicate predicateWithFormat:@"UUID = %@", v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)restingElementFromSummary:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(a1, "_restingContentFromSummary:");
    if (v4)
    {
      id v5 = [a1 _restingAction];
      if (qword_C698 != -1) {
        dispatch_once(&qword_C698, &stru_82C0);
      }
      if (byte_C690) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 1;
      }
      id v7 = [objc_alloc((Class)REDailyRoutineRelevanceProvider) initWithDailyRoutineType:v6];
      id v8 = objc_alloc((Class)REElement);
      id v13 = v7;
      v9 = +[NSArray arrayWithObjects:&v13 count:1];
      id v10 = [v8 initWithIdentifier:@"com.apple.heart.summary.resting" content:v4 action:v5 relevanceProviders:v9 privacyBehavior:1];
    }
    else
    {
      id v5 = RELogForDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "HeartRate: Not enough information to show resting summary…", v12, 2u);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)recoveryElementFromSummary:(id)a3 isIndoor:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = [a1 _recoveryStatisticsFromSummary:v6];
    if (!v7)
    {
      id v8 = RELogForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "HeartRate: Recovery summary not found…", buf, 2u);
      }
      id v11 = 0;
      goto LABEL_26;
    }
    id v8 = [a1 _workoutStatisticsFromRecoveryStatistics:v7 inSummary:v6];
    if (v8)
    {
      v9 = [a1 _recoveryContentFromRecoveryStatistics:v7 workoutIsIndoor:v4];
      if (!v9)
      {
        id v10 = RELogForDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "HeartRate: Not enough info to make content from recovery summary…", buf, 2u);
        }
        id v11 = 0;
        goto LABEL_23;
      }
      if (qword_C6A8 != -1) {
        dispatch_once(&qword_C6A8, &stru_82E0);
      }
      if (byte_C6A0)
      {
        id v10 = [objc_alloc((Class)REDailyRoutineRelevanceProvider) initWithDailyRoutineType:2];
LABEL_22:
        v15 = [a1 _recoveryActionForRecoveryStatistics:v7 workoutStatistics:v8];
        id v16 = objc_alloc((Class)REElement);
        v19 = v10;
        v17 = +[NSArray arrayWithObjects:&v19 count:1];
        id v11 = [v16 initWithIdentifier:@"com.apple.heart.summary.recovery" content:v9 action:v15 relevanceProviders:v17 privacyBehavior:1];

LABEL_23:
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      id v13 = [v7 dateInterval];
      v14 = [v13 startDate];

      if (v14)
      {
        id v10 = [objc_alloc((Class)REDateRelevanceProvider) initWithEventDate:v14 duration:900.0];

        goto LABEL_22;
      }
    }
    else
    {
      v9 = RELogForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v7 sessionUUID];
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "HeartRate: Matching workout statistics for session %@ not found…", buf, 0xCu);
      }
    }
    id v11 = 0;
    goto LABEL_25;
  }
  id v7 = RELogForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "HeartRate: No summary so no recovery summary…", buf, 2u);
  }
  id v11 = 0;
LABEL_27:

  return v11;
}

+ (id)walkingElementFromSample:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = 0;
    goto LABEL_14;
  }
  id v5 = v4;
  id v6 = [a1 _walkingContentFromSample:v5];
  if (!v6) {
    goto LABEL_12;
  }
  if (qword_C6B8 != -1) {
    dispatch_once(&qword_C6B8, &stru_8300);
  }
  if (!byte_C6B0)
  {
    uint64_t v9 = [v5 startDate];
    if (v9)
    {
      id v10 = (void *)v9;
      id v7 = [objc_alloc((Class)REDateRelevanceProvider) initWithEventDate:v9 duration:600.0];

      goto LABEL_11;
    }
LABEL_12:
    id v8 = 0;
    goto LABEL_13;
  }
  id v7 = [objc_alloc((Class)REDailyRoutineRelevanceProvider) initWithDailyRoutineType:2];
LABEL_11:
  id v11 = [a1 _walkingAction];
  id v12 = objc_alloc((Class)REElement);
  id v15 = v7;
  id v13 = +[NSArray arrayWithObjects:&v15 count:1];
  id v8 = [v12 initWithIdentifier:@"com.apple.heart.summary.walking" content:v6 action:v11 relevanceProviders:v13 privacyBehavior:1];

LABEL_13:
LABEL_14:

  return v8;
}

+ (id)_sampleContent
{
  v3 = REHeartRateLocalizedString(@"HEART_RATE_BPM");
  id v4 = +[CLKSimpleTextProvider textProviderWithText:v3];
  [v4 setUseLowercaseSmallCaps:1];
  id v5 = REHeartRateLocalizedString(@"HEART_RATE_BPM_FORMAT");
  id v6 = +[NSNumberFormatter localizedStringFromNumber:&off_8788 numberStyle:0];
  id v7 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v5, v6, v4);

  id v8 = REHeartRateLocalizedString(@"HEART_RATE_REST_HEADER");
  uint64_t v9 = [a1 _contentWithHeaderText:v8 largeTextProvider:v7];

  return v9;
}

+ (id)_restingContentFromSummary:(id)a3
{
  id v4 = [a3 restingHeartRate];
  if (v4)
  {
    id v5 = REHeartRateLocalizedString(@"HEART_RATE_BPM");
    id v6 = +[HKUnit unitFromString:@"count/min"];
    id v7 = +[CLKSimpleTextProvider textProviderWithText:v5];
    [v7 setUseLowercaseSmallCaps:1];
    [v4 doubleValueForUnit:v6];
    id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    uint64_t v9 = +[NSNumberFormatter localizedStringFromNumber:v8 numberStyle:0];

    id v10 = REHeartRateLocalizedString(@"HEART_RATE_BPM_FORMAT");
    id v11 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v10, v9, v7);
    id v12 = REHeartRateLocalizedString(@"HEART_RATE_REST_HEADER");
    id v13 = [a1 _contentWithHeaderText:v12 largeTextProvider:v11];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_walkingContentFromSample:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    id v10 = 0;
    goto LABEL_11;
  }
  if (qword_C6B8 != -1) {
    dispatch_once(&qword_C6B8, &stru_8300);
  }
  if (!byte_C6B0)
  {
    id v5 = [v4 startDate];
    id v6 = [v5 dateByAddingTimeInterval:600.0];
    [v6 timeIntervalSinceNow];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      uint64_t v9 = RELogForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v22 = v4;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Walking Average sample %p was too stale to show", buf, 0xCu);
      }

      goto LABEL_9;
    }
  }
  id v11 = [v4 quantity];
  id v12 = +[HKUnit unitFromString:@"count/min"];
  id v13 = REHeartRateLocalizedString(@"HEART_RATE_BPM");
  v14 = +[CLKSimpleTextProvider textProviderWithText:v13];
  [v14 setUseLowercaseSmallCaps:1];
  [v11 doubleValueForUnit:v12];
  id v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v16 = +[NSNumberFormatter localizedStringFromNumber:v15 numberStyle:0];

  v17 = REHeartRateLocalizedString(@"HEART_RATE_BPM_FORMAT");
  v18 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v17, v16, v14);
  v19 = REHeartRateLocalizedString(@"HEART_RATE_WALK_HEADER");
  id v10 = [a1 _contentWithHeaderText:v19 largeTextProvider:v18];

LABEL_11:

  return v10;
}

+ (id)_recoveryStatisticsFromSummary:(id)a3
{
  if (!a3)
  {
    id v10 = 0;
    goto LABEL_15;
  }
  v3 = [a3 workoutRecoveryStatistics];
  id v4 = [v3 sortedArrayUsingComparator:&stru_8340];

  id v5 = [v4 lastObject];
  if (!v5) {
    goto LABEL_13;
  }
  if (qword_C6A8 != -1) {
    dispatch_once(&qword_C6A8, &stru_82E0);
  }
  if (byte_C6A0) {
    goto LABEL_8;
  }
  id v6 = [v5 dateInterval];
  double v7 = [v6 startDate];

  double v8 = [v7 dateByAddingTimeInterval:1800.0];
  [v8 timeIntervalSinceNow];
  if (v9 <= 0.0)
  {
    id v11 = RELogForDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      uint64_t v14 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Workout Recovery %p is beyond 30 minute cutoff", (uint8_t *)&v13, 0xCu);
    }

LABEL_13:
    id v10 = 0;
    goto LABEL_14;
  }

LABEL_8:
  id v10 = v5;
LABEL_14:

LABEL_15:

  return v10;
}

+ (id)_workoutStatisticsFromRecoveryStatistics:(id)a3 inSummary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 sessionUUID];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v7 = objc_msgSend(v5, "workoutStatistics", 0);
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 sessionUUID];
        unsigned int v13 = [v6 isEqual:v12];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)sampleRestingContent
{
  v3 = REHeartRateLocalizedString(@"HEART_RATE_BPM");
  id v4 = +[CLKSimpleTextProvider textProviderWithText:v3];
  [v4 setUseLowercaseSmallCaps:1];
  id v5 = REHeartRateLocalizedString(@"HEART_RATE_BPM_FORMAT");
  id v6 = +[NSNumberFormatter localizedStringFromNumber:&off_87A0 numberStyle:0];
  double v7 = +[CLKTextProvider textProviderWithFormat:](CLKTextProvider, "textProviderWithFormat:", v5, v6, v4);

  id v8 = REHeartRateLocalizedString(@"HEART_RATE_REST_HEADER");
  uint64_t v9 = [a1 _contentWithHeaderText:v8 largeTextProvider:v7];

  return v9;
}

+ (id)_recoveryContentFromRecoveryStatistics:(id)a3 workoutIsIndoor:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = v6;
  if (v6)
  {
    id v8 = [v6 perMinuteReadings];
    uint64_t v9 = [v8 objectForKey:&off_87B8];

    id v10 = [v7 perMinuteReadings];
    id v11 = [v10 objectForKey:&off_87D0];

    id v12 = 0;
    if (v9 && v11)
    {
      unsigned int v13 = [v9 quantity];
      uint64_t v14 = +[HKUnit unitFromString:@"count/min"];
      v24 = v13;
      [v13 doubleValueForUnit:v14];
      v23 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      long long v15 = [v11 quantity];
      long long v16 = v15;
      if (v15)
      {
        [v15 doubleValueForUnit:v14];
        long long v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      }
      else
      {
        long long v17 = 0;
      }
      id v18 = [v7 workoutActivityType];
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2050000000;
      v19 = (void *)qword_C6C0;
      uint64_t v29 = qword_C6C0;
      if (!qword_C6C0)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_5A68;
        v25[3] = &unk_8390;
        v25[4] = &v26;
        sub_5A68((uint64_t)v25);
        v19 = (void *)v27[3];
      }
      id v20 = v19;
      _Block_object_dispose(&v26, 8);
      v21 = [v20 activityTypeWithHKWorkoutActivityTypeIdentifier:v18 isIndoor:v4 metadata:0];
      id v12 = [a1 _recoveryContentWithZeroMinuteBPM:v23 twoMinuteBPM:v17 activityType:v21];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_recoveryContentWithZeroMinuteBPM:(id)a3 twoMinuteBPM:(id)a4 activityType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [a1 _newContent];
  [v11 setStyle:0];
  id v12 = [a1 _recoveryImageWithActivityType:v8];

  [v11 setHeaderImageProvider:0];
  [v11 setOverrideHeaderImage:v12];
  unsigned int v13 = REHeartRateLocalizedString(@"HEART_RATE_RECOVERY_HEADER_TEXT");
  uint64_t v14 = +[CLKSimpleTextProvider textProviderWithText:v13];
  [v11 setHeaderTextProvider:v14];

  long long v15 = +[NSNumberFormatter localizedStringFromNumber:v10 numberStyle:0];

  long long v16 = +[RERecoveryTextProvider workoutEndTextProviderWithLocalizedBPMNumberString:v15];
  [v11 setDescription1TextProvider:v16];

  [v11 setDescription1FontStyle:0];
  long long v17 = +[NSNumberFormatter localizedStringFromNumber:v9 numberStyle:0];

  id v18 = +[RERecoveryTextProvider twoMinuteTextProviderWithLocalizedBPMNumberString:v17];
  [v11 setDescription2TextProvider:v18];

  [v11 setDescription2FontStyle:0];

  return v11;
}

+ (id)_recoveryImageWithActivityType:(id)a3
{
  id v3 = a3;
  id v5 = v3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  id v6 = (void (*)(id, uint64_t))off_C6D0;
  v27 = off_C6D0;
  if (!off_C6D0)
  {
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_5C34;
    id v22 = &unk_8390;
    v23 = &v24;
    double v7 = (void *)sub_5AC0();
    v25[3] = (uint64_t)dlsym(v7, "FIUIStaticWorkoutIconImage");
    off_C6D0 = *(_UNKNOWN **)(v23[1] + 24);
    id v6 = (void (*)(id, uint64_t))v25[3];
  }
  _Block_object_dispose(&v24, 8);
  if (!v6) {
    sub_5E3C();
  }
  id v8 = v6(v5, 2);

  double height = CGSizeZero.height;
  id v10 = +[UIGraphicsImageRendererFormat defaultFormat];
  id v11 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v10, CGSizeZero.width, height);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_53F8;
  v15[3] = &unk_8368;
  CGFloat width = CGSizeZero.width;
  double v18 = height;
  id v16 = v8;
  id v12 = v8;
  unsigned int v13 = [v11 imageWithActions:v15];

  return v13;
}

+ (id)_contentWithHeaderText:(id)a3 largeTextProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _newContent];
  [v8 setStyle:1];
  id v9 = +[CLKSimpleTextProvider textProviderWithText:v7];

  [v8 setHeaderTextProvider:v9];
  [v8 setDescription1TextProvider:v6];

  return v8;
}

+ (id)_recoveryActionForRecoveryStatistics:(id)a3 workoutStatistics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 sessionUUID];
  id v9 = [v8 UUIDString];

  id v10 = [v7 workoutActivityType];
  id v11 = +[NSNumber numberWithUnsignedInteger:v10];
  id v12 = [v6 dateInterval];

  unsigned int v13 = [v12 startDate];
  [v13 timeIntervalSinceReferenceDate];
  uint64_t v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  long long v15 = [v12 endDate];
  [v15 timeIntervalSinceReferenceDate];
  id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  long long v17 = +[NSString stringWithFormat:@"HeartRate://workout?workoutUUID=%@&activityType=%@&startDate=%@&endDate=%@&recovery=YES", v9, v11, v14, v16];
  double v18 = +[NSURL URLWithString:v17];
  id v19 = objc_alloc((Class)REElementOpenAction);
  uint64_t v20 = [a1 applicationIdentifier];
  id v21 = [v19 initWithURL:v18 applicationID:v20];

  return v21;
}

+ (id)_restingAction
{
  id v3 = objc_alloc((Class)REElementOpenAction);
  BOOL v4 = +[NSURL URLWithString:@"HeartRate://resting"];
  id v5 = [a1 applicationIdentifier];
  id v6 = [v3 initWithURL:v4 applicationID:v5];

  return v6;
}

+ (id)_walkingAction
{
  id v3 = objc_alloc((Class)REElementOpenAction);
  BOOL v4 = +[NSURL URLWithString:@"HeartRate://walkingAverage"];
  id v5 = [a1 applicationIdentifier];
  id v6 = [v3 initWithURL:v4 applicationID:v5];

  return v6;
}

+ (id)_newContent
{
  id v2 = objc_alloc_init((Class)REContent);
  id v3 = [sub_551C() heartRateColors];
  BOOL v4 = [v3 nonGradientTextColor];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = +[UIImage imageNamed:@"HeartBuddyIcon" inBundle:v5 compatibleWithTraitCollection:0];

  if (v6)
  {
    id v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v6];
    [v2 setHeaderImageProvider:v7];
  }
  [v2 setTintColor:v4];

  return v2;
}

@end