@interface HKSHSleepApneaNotificationsBridgeSettingsFactory
- (BOOL)_areNotificationsOnboarded;
- (BOOL)_isFeatureOnboardedAndAvailableWithIsOnboarded:(BOOL)a3 requirementsEvaluation:(id)a4;
- (HKFeatureStatus)featureStatus;
- (HKSHSleepApneaNotificationsBridgeSettingsFactory)initWithFeatureStatus:(id)a3;
- (id)_genericBridgeSettingFooter;
- (id)_regionGatedBridgeSettingFooter;
- (id)_remoteDisabledBridgeSettingFooter;
- (id)_requirementsEvaluationForIsOnboarded:(BOOL)a3;
- (id)_seedExpiredBridgeSettingFooter;
- (id)_sleepTrackingDisabledBridgeSettingFooter;
- (id)_wristDetectionDisabledBridgeSettingFooter;
- (id)bridgeSettings;
- (void)setFeatureStatus:(id)a3;
@end

@implementation HKSHSleepApneaNotificationsBridgeSettingsFactory

- (HKSHSleepApneaNotificationsBridgeSettingsFactory)initWithFeatureStatus:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKSHSleepApneaNotificationsBridgeSettingsFactory;
  v5 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)v5 setFeatureStatus:v4];
  }

  return v6;
}

- (id)bridgeSettings
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _areNotificationsOnboarded];
  id v4 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _requirementsEvaluationForIsOnboarded:v3];
  if ([(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _isFeatureOnboardedAndAvailableWithIsOnboarded:v3 requirementsEvaluation:v4])
  {
    v5 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
    v6 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _genericBridgeSettingFooter];
    v7 = [(HKSHSleepApneaNotificationsBridgeSettings *)v5 initWithSettingVisible:1 settingEnabled:1 showOnboarding:0 footer:v6];

    goto LABEL_30;
  }
  int v8 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA0]];
  int v9 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB8]];
  char v10 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C58]];
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || (v10 & 1) == 0)
  {
    v7 = +[HKSHSleepApneaNotificationsBridgeSettings hiddenSettings];
    goto LABEL_30;
  }
  v12 = (void **)MEMORY[0x1E4F29C70];
  if (!v3) {
    v12 = (void **)MEMORY[0x1E4F29C80];
  }
  v13 = *v12;
  if (v3) {
    v14 = (id *)MEMORY[0x1E4F29C68];
  }
  else {
    v14 = (id *)MEMORY[0x1E4F29C78];
  }
  id v15 = v13;
  id v16 = *v14;
  int v17 = [v4 isRequirementSatisfiedWithIdentifier:v15];
  char v18 = [v4 isRequirementSatisfiedWithIdentifier:v16];
  char v19 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C88]];
  char v20 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CF8]];
  char v21 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29D08]];
  char v22 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CE8]];
  if (!v17 || (v18 & 1) == 0)
  {
    v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
    uint64_t v25 = v3 ^ 1;
    uint64_t v26 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _regionGatedBridgeSettingFooter];
LABEL_28:
    v27 = (void *)v26;
    v7 = [(HKSHSleepApneaNotificationsBridgeSettings *)v24 initWithSettingVisible:1 settingEnabled:0 showOnboarding:v25 footer:v26];

    goto LABEL_29;
  }
  if ((v19 & 1) == 0)
  {
    v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
    uint64_t v25 = v3 ^ 1;
    uint64_t v26 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _remoteDisabledBridgeSettingFooter];
    goto LABEL_28;
  }
  if ((v20 & 1) == 0)
  {
    v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
    uint64_t v25 = v3 ^ 1;
    uint64_t v26 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _seedExpiredBridgeSettingFooter];
    goto LABEL_28;
  }
  if ((v22 & 1) == 0)
  {
    v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
    uint64_t v25 = v3 ^ 1;
    uint64_t v26 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _sleepTrackingDisabledBridgeSettingFooter];
    goto LABEL_28;
  }
  if ((v21 & 1) == 0)
  {
    v24 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
    uint64_t v25 = v3 ^ 1;
    uint64_t v26 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _wristDetectionDisabledBridgeSettingFooter];
    goto LABEL_28;
  }
  if (v3)
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_INFO)) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (![v4 areAllRequirementsSatisfied])
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_INFO))
    {
LABEL_36:
      v31 = v23;
      *(_DWORD *)v33 = 138412290;
      *(void *)&v33[4] = objc_opt_class();
      id v32 = *(id *)&v33[4];
      _os_log_impl(&dword_1AD834000, v31, OS_LOG_TYPE_INFO, "[%@]: Requested bridge settings for unknown feature state", v33, 0xCu);
    }
LABEL_37:
    v7 = +[HKSHSleepApneaNotificationsBridgeSettings hiddenSettings];
    goto LABEL_29;
  }
  v29 = [HKSHSleepApneaNotificationsBridgeSettings alloc];
  v30 = [(HKSHSleepApneaNotificationsBridgeSettingsFactory *)self _genericBridgeSettingFooter];
  v7 = [(HKSHSleepApneaNotificationsBridgeSettings *)v29 initWithSettingVisible:1 settingEnabled:1 showOnboarding:1 footer:v30];

LABEL_29:
LABEL_30:

  return v7;
}

- (BOOL)_areNotificationsOnboarded
{
  if (![(HKFeatureStatus *)self->_featureStatus isOnboardingRecordPresent]) {
    return 0;
  }
  BOOL v3 = [(HKFeatureStatus *)self->_featureStatus onboardingRecord];
  BOOL v4 = [v3 onboardingState] != 1;

  return v4;
}

- (id)_requirementsEvaluationForIsOnboarded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(HKFeatureStatus *)self->_featureStatus requirementsEvaluationByContext];
  v5 = v4;
  v6 = (void *)MEMORY[0x1E4F29C20];
  if (!v3) {
    v6 = (void *)MEMORY[0x1E4F29BC0];
  }
  v7 = [v4 objectForKeyedSubscript:*v6];

  return v7;
}

- (BOOL)_isFeatureOnboardedAndAvailableWithIsOnboarded:(BOOL)a3 requirementsEvaluation:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v4 = [a4 unsatisfiedRequirementIdentifiers];
  if ([v4 count])
  {
    v8[0] = *MEMORY[0x1E4F29C90];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    char v6 = [v4 isEqualToArray:v5];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (id)_genericBridgeSettingFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SLEEP_APNEA_ENABLED_FOOTER_LINK_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];

  BOOL v4 = NSString;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"SLEEP_APNEA_FOOTER_FORMAT_STRING" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"SLEEP_APNEA_ENABLED_FOOTER_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  int v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);

  char v10 = [HKSHSleepApneaNotificationsFooter alloc];
  BOOL v11 = HKSPSleepURL();
  v12 = [v11 absoluteString];
  v13 = [(HKSHSleepApneaNotificationsFooter *)v10 initWithText:v9 link:v3 url:v12];

  return v13;
}

- (id)_regionGatedBridgeSettingFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SLEEP_APNEA_DISABLED_FOOTER_LINK_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];

  BOOL v4 = NSString;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"SLEEP_APNEA_FOOTER_FORMAT_STRING" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"SLEEP_APNEA_FEATURE_REGION_GATED_FOOTER_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  int v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);

  char v10 = [HKSHSleepApneaNotificationsFooter alloc];
  BOOL v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"SLEEP_APNEA_NOTIFICATIONS_REGION_GATED_URL" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v13 = [(HKSHSleepApneaNotificationsFooter *)v10 initWithText:v9 link:v3 url:v12];

  return v13;
}

- (id)_remoteDisabledBridgeSettingFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SLEEP_APNEA_DISABLED_FOOTER_LINK_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];

  BOOL v4 = NSString;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"SLEEP_APNEA_FOOTER_FORMAT_STRING" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"SLEEP_APNEA_FEATURE_REGION_GATED_FOOTER_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  int v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);

  char v10 = [HKSHSleepApneaNotificationsFooter alloc];
  BOOL v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"SLEEP_APNEA_NOTIFICATIONS_REGION_GATED_URL" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v13 = [(HKSHSleepApneaNotificationsFooter *)v10 initWithText:v9 link:v3 url:v12];

  return v13;
}

- (id)_seedExpiredBridgeSettingFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"SLEEP_APNEA_DISABLED_FOOTER_LINK_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];

  BOOL v4 = NSString;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"SLEEP_APNEA_FOOTER_FORMAT_STRING" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"SLEEP_APNEA_SEED_EXPIRED_FOOTER_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  int v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);

  char v10 = [HKSHSleepApneaNotificationsFooter alloc];
  BOOL v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"SLEEP_APNEA_NOTIFICATIONS_SEED_EXPIRED_URL" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v13 = [(HKSHSleepApneaNotificationsFooter *)v10 initWithText:v9 link:v3 url:v12];

  return v13;
}

- (id)_sleepTrackingDisabledBridgeSettingFooter
{
  v2 = [HKSHSleepApneaNotificationsFooter alloc];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"SLEEP_APNEA_SLEEP_TRACKING_DISABLED_FOOTER_TEXT" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v5 = [(HKSHSleepApneaNotificationsFooter *)v2 initWithText:v4 link:0 url:0];

  return v5;
}

- (id)_wristDetectionDisabledBridgeSettingFooter
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"PASSCODE_SETTINGS" value:&stru_1F0473C40 table:@"Localizable-Nebula"];

  BOOL v4 = NSString;
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  char v6 = [v5 localizedStringForKey:@"SLEEP_APNEA_WRIST_DETECTION_DISABLED_DESCRIPTION_FOOTER_TEXT_%@" value:&stru_1F0473C40 table:@"Localizable-Nebula"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, v3);

  int v8 = [[HKSHSleepApneaNotificationsFooter alloc] initWithText:v7 link:v3 url:@"bridge:root=PASSCODE_ID"];
  return v8;
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end