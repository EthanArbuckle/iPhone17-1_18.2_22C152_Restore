@interface TPSAnalyticsCommonDefines
+ (id)displayTypeStringForDisplayType:(unint64_t)a3;
+ (id)experimentCampIDStringForCamp:(int64_t)a3;
+ (id)ineligibleReasonStringForReason:(int64_t)a3;
@end

@implementation TPSAnalyticsCommonDefines

+ (id)displayTypeStringForDisplayType:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unknown";
  }
  else {
    return off_1E5906920[a3];
  }
}

+ (id)ineligibleReasonStringForReason:(int64_t)a3
{
  if (ineligibleReasonStringForReason__onceToken != -1) {
    dispatch_once(&ineligibleReasonStringForReason__onceToken, &__block_literal_global_2);
  }
  v4 = (void *)ineligibleReasonStringForReason__reasonsToStringMapping;
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    v7 = +[TPSLogger analytics];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[TPSAnalyticsCommonDefines ineligibleReasonStringForReason:](a3, v7);
    }

    v6 = @"unspecfied";
  }
  return v6;
}

void __61__TPSAnalyticsCommonDefines_ineligibleReasonStringForReason___block_invoke()
{
  v3[23] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EED9AC60;
  v2[1] = &unk_1EED9AC78;
  v3[0] = @"none";
  v3[1] = @"unspecfied";
  v2[2] = &unk_1EED9AC90;
  v2[3] = &unk_1EED9ACA8;
  v3[2] = @"tipsAppDeleted";
  v3[3] = @"notificationSettingDisabled";
  v2[4] = &unk_1EED9ACC0;
  v2[5] = &unk_1EED9ACD8;
  v3[4] = @"configurationChanged";
  v3[5] = @"displayedOnOtherDevices";
  v2[6] = &unk_1EED9ACF0;
  v2[7] = &unk_1EED9AD08;
  v3[6] = @"performedOutcome";
  v3[7] = @"dismissalEventOccurred";
  v2[8] = &unk_1EED9AD20;
  v2[9] = &unk_1EED9AD38;
  v3[8] = @"restartTrackingDisplayEventOccurred";
  v3[9] = @"preconditionChanged";
  v2[10] = &unk_1EED9AD50;
  v2[11] = &unk_1EED9AD68;
  v3[10] = @"absentEventObserved";
  v3[11] = @"dismissedByUser";
  v2[12] = &unk_1EED9AD80;
  v2[13] = &unk_1EED9AD98;
  v3[12] = @"dismissedByClient";
  v3[13] = @"expired";
  v2[14] = &unk_1EED9ADB0;
  v2[15] = &unk_1EED9ADC8;
  v3[14] = @"deliveryInfoLifetimeExpired";
  v3[15] = @"maxDurationExceeded";
  v2[16] = &unk_1EED9ADE0;
  v2[17] = &unk_1EED9ADF8;
  v3[16] = @"maxDisplayedCountExceeded";
  v3[17] = @"suppressedByHoldoutCamp";
  v2[18] = &unk_1EED9AE10;
  v2[19] = &unk_1EED9AE28;
  v3[18] = @"userLanguageChanged";
  v3[19] = @"userKnew";
  v2[20] = &unk_1EED9AE40;
  v2[21] = &unk_1EED9AE58;
  v3[20] = @"personalizationFailed";
  v3[21] = @"languageCodeMismatched";
  v2[22] = &unk_1EED9AE70;
  v3[22] = @"invalidConfiguration";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:23];
  v1 = (void *)ineligibleReasonStringForReason__reasonsToStringMapping;
  ineligibleReasonStringForReason__reasonsToStringMapping = v0;
}

+ (id)experimentCampIDStringForCamp:(int64_t)a3
{
  v3 = @"unspecified";
  if (a3 == 1) {
    v3 = @"allContent";
  }
  if (a3 == 2) {
    return @"holdout";
  }
  else {
    return v3;
  }
}

+ (void)ineligibleReasonStringForReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Unknown ineligible reason: %ld", (uint8_t *)&v2, 0xCu);
}

@end