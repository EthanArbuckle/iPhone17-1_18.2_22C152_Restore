@interface MOEngagementAndSuggestionAnalyticsParams
+ (id)aggregatedEngagementAnalyticsAddressMap;
+ (id)aggregationWindowMap;
+ (id)bundleSubTypeToAnalyticsSuggestionTypeMap;
+ (id)suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap;
+ (id)updateOnboardingStatusDictionaryKeys:(id)a3;
+ (unint64_t)getCharacterCountBin:(float)a3;
@end

@implementation MOEngagementAndSuggestionAnalyticsParams

+ (id)bundleSubTypeToAnalyticsSuggestionTypeMap
{
  v2 = objc_opt_new();
  [v2 setObject:&off_1002F8FC0 forKeyedSubscript:&off_1002F63B0];
  [v2 setObject:&off_1002F8FD8 forKeyedSubscript:&off_1002F63E0];
  [v2 setObject:&off_1002F8FF0 forKeyedSubscript:&off_1002F6458];
  [v2 setObject:&off_1002F9008 forKeyedSubscript:&off_1002F64D0];
  [v2 setObject:&off_1002F9020 forKeyedSubscript:&off_1002F6530];
  [v2 setObject:&off_1002F9038 forKeyedSubscript:&off_1002F65D8];
  [v2 setObject:&off_1002F9050 forKeyedSubscript:&off_1002F6650];
  [v2 setObject:&off_1002F9068 forKeyedSubscript:&off_1002F66B0];
  [v2 setObject:&off_1002F9080 forKeyedSubscript:&off_1002F6860];
  [v2 setObject:&off_1002F9098 forKeyedSubscript:&off_1002F6968];
  [v2 setObject:&off_1002F90B0 forKeyedSubscript:&off_1002F69B0];
  [v2 setObject:&off_1002F90C8 forKeyedSubscript:&off_1002F6AB8];

  return v2;
}

+ (id)updateOnboardingStatusDictionaryKeys:(id)a3
{
  v12[0] = @"onboardingStatus";
  v12[1] = @"onboardingDurationBin";
  v13[0] = @"onboardingCompletion";
  v13[1] = @"onboardingDurationBin";
  v12[2] = @"settingSwitchActivity";
  v12[3] = @"settingSwitchCommunication";
  v13[2] = @"isActivitySettingsSwitchEnabled";
  v13[3] = @"isCommunicationSettingsSwitchEnabled";
  v12[4] = @"settingSwitchLocation";
  v12[5] = @"settingSwitchMedia";
  v13[4] = @"isSignificantLocationSettingsSwitchEnabled";
  v13[5] = @"isMediaSettingsSwitchEnabled";
  v12[6] = @"settingSwitchPeople";
  v12[7] = @"settingSwitchPhoto";
  v13[6] = @"isNearbyPeopleSettingsSwitchEnabled";
  v13[7] = @"isPhotoSettingsSwitchEnabled";
  v12[8] = @"settingSwitchStateOfMind";
  v12[9] = @"settingSwitchReflection";
  v13[8] = @"isStateOfMindSettingsSwitchEnabled";
  v13[9] = @"isReflectionSettingsSwitchEnabled";
  v12[10] = @"settingBroaderSwitchLocation";
  v13[10] = @"isBroadSystemLocationSettingsSwitchEnabled";
  id v3 = a3;
  +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __81__MOEngagementAndSuggestionAnalyticsParams_updateOnboardingStatusDictionaryKeys___block_invoke;
  v9[3] = &unk_1002CFA80;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)objc_opt_new();
  id v11 = v4;
  id v5 = v10;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];

  v6 = v11;
  id v7 = v4;

  return v7;
}

void __81__MOEngagementAndSuggestionAnalyticsParams_updateOnboardingStatusDictionaryKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

+ (id)aggregationWindowMap
{
  v4[0] = &off_1002F6AD0;
  v4[1] = &off_1002F63B0;
  v5[0] = &off_1002F6AE8;
  v5[1] = &off_1002F6B00;
  v4[2] = &off_1002F63E0;
  v5[2] = &off_1002F6B18;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

+ (id)aggregatedEngagementAnalyticsAddressMap
{
  v4[0] = &off_1002F6AD0;
  v4[1] = &off_1002F63B0;
  v5[0] = @"com.apple.Moments.EngagementAggregatedMetricsOneDay";
  v5[1] = @"com.apple.Moments.EngagementAggregatedMetricsSevenDay";
  v4[2] = &off_1002F63E0;
  v5[2] = @"com.apple.Moments.EngagementAggregatedMetricsTwentyEightDay";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

+ (id)suggestionUIVisibilityCategoryToMOEventBundleVisibilityCategoryForUIMap
{
  v2 = objc_opt_new();
  [v2 setObject:&off_1002F90E0 forKeyedSubscript:&off_1002F6AD0];
  [v2 setObject:&off_1002F90F8 forKeyedSubscript:&off_1002F63B0];
  [v2 setObject:&off_1002F9110 forKeyedSubscript:&off_1002F63E0];
  [v2 setObject:&off_1002F9128 forKeyedSubscript:&off_1002F6530];
  [v2 setObject:&off_1002F9140 forKeyedSubscript:&off_1002F6458];
  [v2 setObject:&off_1002F9158 forKeyedSubscript:&off_1002F64D0];

  return v2;
}

+ (unint64_t)getCharacterCountBin:(float)a3
{
  if (a3 == 0.0) {
    return 1;
  }
  if (a3 > 0.0 && a3 <= 10.0) {
    return 2;
  }
  if (a3 <= 10.0 || a3 > 200.0) {
    return 4 * (a3 > 200.0);
  }
  else {
    return 3;
  }
}

@end