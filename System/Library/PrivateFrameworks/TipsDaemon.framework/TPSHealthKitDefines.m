@interface TPSHealthKitDefines
+ (id)featureAvailabilityContextForStatusType:(int64_t)a3;
+ (id)identifierForFeature:(int64_t)a3;
+ (id)sharedHealthStore;
@end

@implementation TPSHealthKitDefines

+ (id)sharedHealthStore
{
  if (sharedHealthStore_onceToken != -1) {
    dispatch_once(&sharedHealthStore_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedHealthStore_s_healthStore;

  return v2;
}

void __40__TPSHealthKitDefines_sharedHealthStore__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getHKHealthStoreClass_softClass;
  uint64_t v8 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getHKHealthStoreClass_block_invoke;
    v4[3] = &unk_1E6E6AE20;
    v4[4] = &v5;
    __getHKHealthStoreClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  v3 = (void *)sharedHealthStore_s_healthStore;
  sharedHealthStore_s_healthStore = (uint64_t)v2;
}

+ (id)identifierForFeature:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      v3 = (id *)getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr;
      uint64_t v15 = getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr;
      if (!getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr)
      {
        v4 = (void *)HealthKitLibrary();
        v13[3] = (uint64_t)dlsym(v4, "HKFeatureIdentifierIrregularRhythmNotifications");
        getHKFeatureIdentifierIrregularRhythmNotificationsSymbolLoc_ptr = v13[3];
        v3 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (v3) {
        goto LABEL_21;
      }
      -[TPSHeySiriEnabledValidation getCurrentState]();
      goto LABEL_6;
    case 2:
LABEL_6:
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      v3 = (id *)getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr;
      uint64_t v15 = getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr;
      if (!getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr)
      {
        uint64_t v5 = (void *)HealthKitLibrary();
        v13[3] = (uint64_t)dlsym(v5, "HKFeatureIdentifierSleepTracking");
        getHKFeatureIdentifierSleepTrackingSymbolLoc_ptr = v13[3];
        v3 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (v3) {
        goto LABEL_21;
      }
      -[TPSHeySiriEnabledValidation getCurrentState]();
LABEL_10:
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2020000000;
      v3 = (id *)getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr;
      uint64_t v15 = getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr;
      if (!getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr)
      {
        v6 = (void *)HealthKitLibrary();
        v13[3] = (uint64_t)dlsym(v6, "HKFeatureIdentifierAFibBurden");
        getHKFeatureIdentifierAFibBurdenSymbolLoc_ptr = v13[3];
        v3 = (id *)v13[3];
      }
      _Block_object_dispose(&v12, 8);
      if (!v3)
      {
        -[TPSHeySiriEnabledValidation getCurrentState]();
LABEL_14:
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        v3 = (id *)getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr;
        uint64_t v15 = getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr;
        if (!getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr)
        {
          uint64_t v7 = (void *)HealthKitLibrary();
          v13[3] = (uint64_t)dlsym(v7, "HKFeatureIdentifierMenstrualCyclesWristTemperatureInput");
          getHKFeatureIdentifierMenstrualCyclesWristTemperatureInputSymbolLoc_ptr = v13[3];
          v3 = (id *)v13[3];
        }
        _Block_object_dispose(&v12, 8);
        if (!v3)
        {
          -[TPSHeySiriEnabledValidation getCurrentState]();
LABEL_18:
          uint64_t v12 = 0;
          v13 = &v12;
          uint64_t v14 = 0x2020000000;
          v3 = (id *)getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr;
          uint64_t v15 = getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr;
          if (!getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr)
          {
            uint64_t v8 = (void *)HealthKitLibrary();
            v13[3] = (uint64_t)dlsym(v8, "HKFeatureIdentifierSleepingWristTemperatureMeasurements");
            getHKFeatureIdentifierSleepingWristTemperatureMeasurementsSymbolLoc_ptr = v13[3];
            v3 = (id *)v13[3];
          }
          _Block_object_dispose(&v12, 8);
          if (!v3)
          {
            v11 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState]();
            _Block_object_dispose(&v12, 8);
            _Unwind_Resume(v11);
          }
        }
      }
LABEL_21:
      id v9 = *v3;
LABEL_22:
      return v9;
    case 3:
      goto LABEL_10;
    case 4:
      goto LABEL_14;
    case 5:
      goto LABEL_18;
    default:
      id v9 = 0;
      goto LABEL_22;
  }
}

+ (id)featureAvailabilityContextForStatusType:(int64_t)a3
{
  if (a3 == 2) {
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    v3 = (id *)getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr;
    uint64_t v12 = getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr;
    if (!getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr)
    {
      v4 = (void *)HealthKitLibrary();
      v10[3] = (uint64_t)dlsym(v4, "HKFeatureAvailabilityContextTipsAppVisibility");
      getHKFeatureAvailabilityContextTipsAppVisibilitySymbolLoc_ptr = v10[3];
      v3 = (id *)v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (v3) {
      goto LABEL_10;
    }
    -[TPSHeySiriEnabledValidation getCurrentState]();
LABEL_7:
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2020000000;
    v3 = (id *)getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr;
    uint64_t v12 = getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr;
    if (!getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr)
    {
      uint64_t v5 = (void *)HealthKitLibrary();
      v10[3] = (uint64_t)dlsym(v5, "HKFeatureAvailabilityContextTipsAppNotificationEligibility");
      getHKFeatureAvailabilityContextTipsAppNotificationEligibilitySymbolLoc_ptr = v10[3];
      v3 = (id *)v10[3];
    }
    _Block_object_dispose(&v9, 8);
    if (!v3)
    {
      uint64_t v8 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState]();
      _Block_object_dispose(&v9, 8);
      _Unwind_Resume(v8);
    }
LABEL_10:
    id v6 = *v3;
    goto LABEL_12;
  }
  id v6 = 0;
LABEL_12:

  return v6;
}

@end