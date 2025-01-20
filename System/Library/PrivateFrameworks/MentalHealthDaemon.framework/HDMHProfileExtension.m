@interface HDMHProfileExtension
- (HDMHAssessmentsNotificationManager)assessmentsNotificationManager;
- (HDMHProfileExtension)initWithProfile:(id)a3;
- (HDMHProfileExtension)initWithProfile:(id)a3 typicalDayProvider:(id)a4;
- (HDMHSOMNotificationManager)somNotificationManager;
- (HDPrimaryProfile)profile;
- (HKMHSettingsManager)settingsManager;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
@end

@implementation HDMHProfileExtension

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F09800]])
  {
    uint64_t v5 = 8;
LABEL_9:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_10;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F09738]])
  {
    uint64_t v5 = 16;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F097C0]])
  {
    uint64_t v5 = 32;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F09808]])
  {
    uint64_t v5 = 48;
    goto LABEL_9;
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

- (HDMHProfileExtension)initWithProfile:(id)a3
{
  return [(HDMHProfileExtension *)self initWithProfile:a3 typicalDayProvider:0];
}

- (HDMHProfileExtension)initWithProfile:(id)a3 typicalDayProvider:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)HDMHProfileExtension;
  v8 = [(HDMHProfileExtension *)&v64 init];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_profile, v6);
    v11 = (void *)MEMORY[0x263F431E8];
    id v12 = v10;
    uint64_t v13 = objc_msgSend(v11, "hdmh_stateOfMindLoggingAvailabilityManagerWithProfile:", v6);
    stateOfMindLoggingFeatureAvailabilityManager = v9->_stateOfMindLoggingFeatureAvailabilityManager;
    v9->_stateOfMindLoggingFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v13;

    v15 = (void *)MEMORY[0x263F431E8];
    id WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v17 = objc_msgSend(v15, "hdmh_depressionAndAnxietyAssessmentsAvailabilityManagerWithProfile:", WeakRetained);
    depressionAndAnxietyAssessmentsFeatureAvailabilityManager = v9->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager;
    v9->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v17;

    id v19 = objc_alloc(MEMORY[0x263F43178]);
    id v20 = objc_loadWeakRetained((id *)&v9->_profile);
    v21 = (os_log_t *)MEMORY[0x263F09938];
    uint64_t v22 = [v19 initWithProfile:v20 featureAvailabilityExtension:v9->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager loggingCategory:*MEMORY[0x263F09938]];
    depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager = v9->_depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager;
    v9->_depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v22;

    v24 = (void *)MEMORY[0x263F431E8];
    id v25 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v26 = objc_msgSend(v24, "hdmh_periodicDepressionAndAnxietyAssessmentPromptsAvailabilityManagerWithProfile:", v25);
    periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager = v9->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager;
    v9->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v26;

    id v28 = objc_alloc(MEMORY[0x263F43178]);
    id v29 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v30 = [v28 initWithProfile:v29 featureAvailabilityExtension:v9->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager loggingCategory:*v21];
    periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager = v9->_periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager;
    v9->_periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v30;

    v32 = (void *)MEMORY[0x263F431E8];
    id v33 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v34 = objc_msgSend(v32, "hdmh_stateOfMindLoggingPatternEscalationsAvailabilityManagerWithProfile:", v33);
    stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager = v9->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager;
    v9->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager = (HDFeatureAvailabilityManager *)v34;

    id v36 = objc_alloc(MEMORY[0x263F43178]);
    id v37 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v38 = [v36 initWithProfile:v37 featureAvailabilityExtension:v9->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager loggingCategory:*v21];
    stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager = v9->_stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager;
    v9->_stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager = (HDBackgroundFeatureDeliveryManager *)v38;

    v40 = (HKMHSettingsManager *)objc_alloc_init(MEMORY[0x263F55050]);
    settingsManager = v9->_settingsManager;
    v9->_settingsManager = v40;

    id v42 = objc_loadWeakRetained((id *)&v9->_profile);
    uint64_t v43 = [v42 profileType];

    if (v43 == 1)
    {
      v44 = [[HDMHSOMNotificationManager alloc] initWithProfile:v6 settingsManager:v9->_settingsManager typicalDayProvider:v7];
      somNotificationManager = v9->_somNotificationManager;
      v9->_somNotificationManager = v44;

      v46 = [[HDMHAssessmentsNotificationManager alloc] initWithProfile:v6 settingsManager:v9->_settingsManager];
      assessmentsNotificationManager = v9->_assessmentsNotificationManager;
      v9->_assessmentsNotificationManager = v46;

      v48 = [MEMORY[0x263F0A980] sharedBehavior];
      char v49 = [v48 isAppleWatch];

      if ((v49 & 1) == 0)
      {
        v50 = (void *)[objc_alloc(MEMORY[0x263F0A0C0]) initWithLoggingCategory:*v21 healthDataSource:v6];
        v51 = v9->_settingsManager;
        id v52 = objc_alloc(MEMORY[0x263F43158]);
        os_log_t v53 = *v21;
        v62[0] = MEMORY[0x263EF8330];
        v62[1] = 3221225472;
        v62[2] = __59__HDMHProfileExtension_initWithProfile_typicalDayProvider___block_invoke;
        v62[3] = &unk_2653F0508;
        v63 = v51;
        v54 = v51;
        uint64_t v55 = [v52 initWithProfile:v6 eventSubmissionManager:v50 logCategory:v53 eventConstructor:v62];
        mentalHealthDailyEventManager = v9->_mentalHealthDailyEventManager;
        v9->_mentalHealthDailyEventManager = (HDAnalyticsDailyEventManager *)v55;
      }
    }
    _HKInitializeLogging();
    os_log_t v57 = *v21;
    if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      v59 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v66 = v59;
      id v60 = v59;
      _os_log_impl(&dword_255F2E000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] Plugin loaded", buf, 0xCu);
    }
  }

  return v9;
}

HDMHMentalHealthDailyAnalyticsEvent *__59__HDMHProfileExtension_initWithProfile_typicalDayProvider___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263EFFA40];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x263F0ACE8]];
  id v7 = [[HDMHMentalHealthDailyAnalyticsEvent alloc] initWithProfile:v4 settingsManager:*(void *)(a1 + 32) userDefaults:v6];

  return v7;
}

- (HDPrimaryProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HDPrimaryProfile *)WeakRetained;
}

- (HKMHSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (HDMHSOMNotificationManager)somNotificationManager
{
  return self->_somNotificationManager;
}

- (HDMHAssessmentsNotificationManager)assessmentsNotificationManager
{
  return self->_assessmentsNotificationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assessmentsNotificationManager, 0);
  objc_storeStrong((id *)&self->_somNotificationManager, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_mentalHealthDailyEventManager, 0);
  objc_storeStrong((id *)&self->_stateOfMindLoggingPatternEscalationsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_stateOfMindLoggingPatternEscalationsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_periodicDepressionAndAnxietyAssessmentPromptsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_periodicDepressionAndAnxietyAssessmentPromptsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_depressionAndAnxietyAssessmentsBackgroundFeatureDeliveryManager, 0);
  objc_storeStrong((id *)&self->_depressionAndAnxietyAssessmentsFeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_stateOfMindLoggingFeatureAvailabilityManager, 0);
}

@end