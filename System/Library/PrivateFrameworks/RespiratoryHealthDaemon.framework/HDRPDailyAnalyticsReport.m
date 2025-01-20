@interface HDRPDailyAnalyticsReport
- (BOOL)_hasCompatiblePairedAppleWatch;
- (BOOL)isHealthDataCollectionAllowed;
- (HDProfile)profile;
- (HDRPDailyAnalyticsReport)initWithDate:(id)a3 profile:(id)a4 pairedDeviceRegistry:(id)a5 featureAvailabilityProvider:(id)a6 oxygenSaturationSettings:(id)a7 controlCenterUserDefaults:(id)a8 healthDataCollectionAllowed:(BOOL)a9;
- (HKFeatureAvailabilityProviding)featureAvailabilityProvider;
- (HKRPOxygenSaturationSettings)oxygenSaturationSettings;
- (NRPairedDeviceRegistry)pairedDeviceRegistry;
- (NSCalendar)calendar;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSUserDefaults)controlCenterUserDefaults;
- (id)_activePairedWatchBuild;
- (id)_dateIntervalForPreviousDays:(unint64_t)a3;
- (id)_gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:(id)a3 wasWorn:(id)a4 error:(id *)a5;
- (id)_gatherImproveHealthAndActivityReportFromBackgroundOxygenSaturationSamplesInPreviousDay:(id)a3 oxygenSaturationSamplesInPreviousDay:(id)a4 oxygenSaturationSamplesInPrevious30Days:(id)a5 error:(id *)a6;
- (id)_numberOfEveningSamplesFromSamples:(id)a3;
- (id)_numberOfForegroundSamplesFromSamples:(id)a3;
- (id)_numberOfSamplesByTruncatedOxygenSaturationValueFromSamples:(id)a3 keyPrefix:(id)a4;
- (id)_numberOfSamplesWithExerciseMinute5MinutesPriorInPreviousDayAndReturnError:(id *)a3;
- (id)_numberOfSamplesWithHeartRateGreaterThan100BPMFromSamples:(id)a3;
- (id)_numberOfSamplesWithHighElevationTakeFromSamples:(id)a3;
- (id)_numberOfWeeksSinceOnboardedAndReturnError:(id *)a3;
- (id)_queryForBackgroundOxygenSaturationSamplesInPreviousDayAndReturnError:(id *)a3;
- (id)_queryForHasWornWatchInPreviousDayAndReturnError:(id *)a3;
- (id)_queryForOxygenSaturationSamplesInPreviousDays:(unint64_t)a3 error:(id *)a4;
- (id)generatePayloadAndReturnError:(id *)a3;
@end

@implementation HDRPDailyAnalyticsReport

- (HDRPDailyAnalyticsReport)initWithDate:(id)a3 profile:(id)a4 pairedDeviceRegistry:(id)a5 featureAvailabilityProvider:(id)a6 oxygenSaturationSettings:(id)a7 controlCenterUserDefaults:(id)a8 healthDataCollectionAllowed:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v29 = a7;
  id v28 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HDRPDailyAnalyticsReport;
  v19 = [(HDRPDailyAnalyticsReport *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_profile, a4);
    objc_storeStrong((id *)&v20->_pairedDeviceRegistry, a5);
    objc_storeStrong((id *)&v20->_featureAvailabilityProvider, a6);
    objc_storeStrong((id *)&v20->_oxygenSaturationSettings, a7);
    objc_storeStrong((id *)&v20->_controlCenterUserDefaults, a8);
    v20->_healthDataCollectionAllowed = a9;
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendarWithLocalTimeZone");
    calendar = v20->_calendar;
    v20->_calendar = (NSCalendar *)v21;

    uint64_t v23 = [(NSCalendar *)v20->_calendar startOfDayForDate:v15];
    endTime = v20->_endTime;
    v20->_endTime = (NSDate *)v23;

    uint64_t v25 = [(NSCalendar *)v20->_calendar hk_startOfDateBySubtractingDays:1 fromDate:v20->_endTime];
    startTime = v20->_startTime;
    v20->_startTime = (NSDate *)v25;
  }
  return v20;
}

- (id)generatePayloadAndReturnError:(id *)a3
{
  id v31 = 0;
  v5 = [(HDRPDailyAnalyticsReport *)self _queryForBackgroundOxygenSaturationSamplesInPreviousDayAndReturnError:&v31];
  id v6 = v31;
  id v7 = v6;
  if (!v5)
  {
    id v12 = v6;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:]();
    }
    goto LABEL_48;
  }
  BOOL v8 = [(HDRPDailyAnalyticsReport *)self isHealthDataCollectionAllowed];
  if (v8)
  {
    id v30 = v7;
    v9 = [(HDRPDailyAnalyticsReport *)self _queryForOxygenSaturationSamplesInPreviousDays:1 error:&v30];
    id v10 = v30;

    if (!v9)
    {
      id v12 = v10;
      if (v12)
      {
        if (a3) {
          *a3 = v12;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
        -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:]();
      }
      goto LABEL_48;
    }
    id v29 = v10;
    v11 = [(HDRPDailyAnalyticsReport *)self _queryForOxygenSaturationSamplesInPreviousDays:30 error:&v29];
    id v7 = v29;

    if (!v11)
    {
      id v12 = v7;
      if (v12)
      {
        if (a3) {
          *a3 = v12;
        }
        else {
          _HKLogDroppedError();
        }
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
        -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:]();
      }

LABEL_48:
      id v23 = 0;
      goto LABEL_55;
    }
  }
  else
  {
    v11 = 0;
    v9 = 0;
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14 = [NSNumber numberWithBool:v8];
  [v13 setObject:v14 forKeyedSubscript:@"isImproveHealthAndActivityAllowed"];

  id v28 = v7;
  id v15 = [(HDRPDailyAnalyticsReport *)self _queryForHasWornWatchInPreviousDayAndReturnError:&v28];
  id v16 = v28;

  if (!v15)
  {
    id v12 = v16;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.4();
    }
    id v23 = 0;
    goto LABEL_54;
  }
  uint64_t v25 = v13;
  id v17 = v9;
  id v18 = v11;
  id v27 = v16;
  uint64_t v19 = [(HDRPDailyAnalyticsReport *)self _gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:v5 wasWorn:v15 error:&v27];
  id v20 = v27;

  uint64_t v21 = (void *)v19;
  if (!v19)
  {
    id v12 = v20;
    v11 = v18;
    v9 = v17;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.5();
    }
    goto LABEL_52;
  }
  id v13 = v25;
  [v25 addEntriesFromDictionary:v21];
  if (!v8)
  {
    id v12 = v20;
    v11 = v18;
    v9 = v17;
    goto LABEL_30;
  }
  uint64_t v19 = (uint64_t)v21;
  id v26 = v20;
  v22 = [(HDRPDailyAnalyticsReport *)self _gatherImproveHealthAndActivityReportFromBackgroundOxygenSaturationSamplesInPreviousDay:v5 oxygenSaturationSamplesInPreviousDay:v17 oxygenSaturationSamplesInPrevious30Days:v18 error:&v26];
  id v12 = v26;

  if (!v22)
  {
    id v12 = v12;
    v11 = v18;
    v9 = v17;
    if (v12)
    {
      if (a3) {
        *a3 = v12;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_ERROR)) {
      -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.6();
    }
LABEL_52:
    id v23 = 0;
    uint64_t v21 = (void *)v19;
    id v13 = v25;
    goto LABEL_53;
  }
  [v25 addEntriesFromDictionary:v22];

  v11 = v18;
  v9 = v17;
  uint64_t v21 = (void *)v19;
  id v13 = v25;
LABEL_30:
  id v23 = v13;
LABEL_53:

LABEL_54:
LABEL_55:

  return v23;
}

- (id)_gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:(id)a3 wasWorn:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v30 = 0;
  id v10 = [(HDRPDailyAnalyticsReport *)self _numberOfWeeksSinceOnboardedAndReturnError:&v30];
  id v11 = v30;
  if (v10) {
    goto LABEL_2;
  }
  _HKInitializeLogging();
  uint64_t v25 = (os_log_t *)MEMORY[0x263F09950];
  id v26 = (void *)*MEMORY[0x263F09950];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09950], OS_LOG_TYPE_DEFAULT))
  {
    id v27 = v26;
    id v28 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v32 = v28;
    id v29 = v28;
    _os_log_impl(&dword_226AA6000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of weeks since onboarded is null", buf, 0xCu);
  }
  if (!v11)
  {
LABEL_2:
    id v12 = objc_opt_new();
    [v12 setObject:v10 forKeyedSubscript:@"weeksSinceOnboarded"];
    id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HDRPDailyAnalyticsReport _hasCompatiblePairedAppleWatch](self, "_hasCompatiblePairedAppleWatch"));
    [v12 setObject:v13 forKeyedSubscript:@"hasCompatiblePairedAppleWatch"];

    v14 = [(HDRPDailyAnalyticsReport *)self _activePairedWatchBuild];
    [v12 setObject:v14 forKeyedSubscript:@"activePairedWatchBuild"];

    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    [v12 setObject:v15 forKeyedSubscript:@"totalNumberOfBackgroundSamplesInPrevious1Day"];

    [v12 setObject:v9 forKeyedSubscript:@"wasWatchWorn"];
    id v16 = [(HDRPDailyAnalyticsReport *)self oxygenSaturationSettings];
    id v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "oxygenSaturationDisabled") ^ 1);
    [v12 setObject:v17 forKeyedSubscript:@"settings_bloodOxygenSaturationEnabled"];

    id v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "backgroundRecordingsEnabled"));
    [v12 setObject:v18 forKeyedSubscript:@"settings_backgroundMeasurementsEnabled"];

    uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "backgroundRecordingsDuringSleepMode"));
    [v12 setObject:v19 forKeyedSubscript:@"settings_backgroundMeasurementsDuringSleepMode"];

    id v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "backgroundRecordingsDuringTheaterMode"));
    [v12 setObject:v20 forKeyedSubscript:@"settings_backgroundMeasurementsDuringTheaterMode"];

    uint64_t v21 = NSNumber;
    v22 = [(HDRPDailyAnalyticsReport *)self controlCenterUserDefaults];
    id v23 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "BOOLForKey:", @"hideHunterSensitiveUI"));
    [v12 setObject:v23 forKeyedSubscript:@"settings_hideSensitiveUI"];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v25, OS_LOG_TYPE_ERROR)) {
      -[HDRPDailyAnalyticsReport _gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:wasWorn:error:]();
    }
    if (a5)
    {
      id v12 = 0;
      *a5 = v11;
    }
    else
    {
      _HKLogDroppedError();
      id v12 = 0;
    }
  }

  return v12;
}

- (id)_numberOfWeeksSinceOnboardedAndReturnError:(id *)a3
{
  v5 = [(HDRPDailyAnalyticsReport *)self featureAvailabilityProvider];
  id v6 = [v5 earliestDateLowestOnboardingVersionCompletedWithError:a3];

  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x263EFF8F0], "hk_gregorianCalendar");
    id v8 = [(HDRPDailyAnalyticsReport *)self endTime];
    id v9 = [v7 components:0x2000 fromDate:v6 toDate:v8 options:0];

    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "weekOfYear"));
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_hasCompatiblePairedAppleWatch
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(HDRPDailyAnalyticsReport *)self pairedDeviceRegistry];
  v3 = [v2 getSetupCompletedDevices];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"BD3A4341-7090-4622-9694-2AC0F536C478"];
        LOBYTE(v8) = [v8 supportsCapability:v9];

        if (v8)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)_activePairedWatchBuild
{
  v2 = [(HDRPDailyAnalyticsReport *)self pairedDeviceRegistry];
  v3 = [v2 getActivePairedDevice];

  uint64_t v4 = [v3 valueForProperty:*MEMORY[0x263F57658]];

  return v4;
}

- (id)_gatherImproveHealthAndActivityReportFromBackgroundOxygenSaturationSamplesInPreviousDay:(id)a3 oxygenSaturationSamplesInPreviousDay:(id)a4 oxygenSaturationSamplesInPrevious30Days:(id)a5 error:(id *)a6
{
  id v9 = (objc_class *)MEMORY[0x263EFF9A0];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(v9);
  long long v14 = [(HDRPDailyAnalyticsReport *)self _numberOfSamplesWithHeartRateGreaterThan100BPMFromSamples:v12];
  [v13 setObject:v14 forKeyedSubscript:@"numberOfBackgroundSamplesWithHeartRateGreaterThan100BPMInPrevious1Day"];

  long long v15 = [(HDRPDailyAnalyticsReport *)self _numberOfSamplesWithExerciseMinute5MinutesPriorInPreviousDayAndReturnError:0];
  [v13 setObject:v15 forKeyedSubscript:@"numberOfBackgroundSamplesWithExerciseMinute5MinutesPriorInPrevious1Day"];

  id v16 = [(HDRPDailyAnalyticsReport *)self _numberOfForegroundSamplesFromSamples:v11];

  [v13 setObject:v16 forKeyedSubscript:@"totalNumberOfForegroundSamplesInPrevious1Day"];
  uint64_t v17 = [(HDRPDailyAnalyticsReport *)self _numberOfForegroundSamplesFromSamples:v10];

  [v13 setObject:v17 forKeyedSubscript:@"totalNumberOfForegroundSamplesInPrevious30Days"];
  id v18 = [(HDRPDailyAnalyticsReport *)self _numberOfEveningSamplesFromSamples:v12];
  [v13 setObject:v18 forKeyedSubscript:@"totalNightBackgroundSamplesInPrevious1Day"];

  uint64_t v19 = [(HDRPDailyAnalyticsReport *)self _numberOfSamplesWithHighElevationTakeFromSamples:v12];
  if ([v19 integerValue] <= 0) {
    id v20 = 0;
  }
  else {
    id v20 = v19;
  }
  [v13 setObject:v20 forKeyedSubscript:@"numberOfBackgroundSamplesWithHighElevationTakenInPrevious1Day"];
  uint64_t v21 = [(HDRPDailyAnalyticsReport *)self _numberOfSamplesByTruncatedOxygenSaturationValueFromSamples:v12 keyPrefix:@"numberOfBackgroundSamplesInPrevious1Day"];

  if (v21) {
    [v13 addEntriesFromDictionary:v21];
  }

  return v13;
}

- (id)_queryForBackgroundOxygenSaturationSamplesInPreviousDayAndReturnError:(id *)a3
{
  v21[3] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDRPDailyAnalyticsReport *)self _dateIntervalForPreviousDays:1];
  uint64_t v6 = objc_msgSend(MEMORY[0x263F0A6E8], "hkrp_oxygenSaturationType");
  id v7 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
  id v8 = [(HDRPDailyAnalyticsReport *)self profile];
  id v9 = [v8 metadataManager];
  uint64_t v10 = *MEMORY[0x263F0AAC8];
  id v11 = [MEMORY[0x263EFFA08] setWithObject:&unk_26DA9BCA0];
  id v12 = [v9 predicateWithMetadataKey:v10 allowedValues:v11];

  id v13 = HDSampleEntityPredicateForDateInterval();
  long long v14 = (void *)MEMORY[0x263F434A8];
  v21[0] = v7;
  v21[1] = v12;
  v21[2] = v13;
  long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v16 = [v14 predicateMatchingAllPredicates:v15];

  uint64_t v17 = (void *)MEMORY[0x263F43318];
  id v18 = [(HDRPDailyAnalyticsReport *)self profile];
  uint64_t v19 = [v17 samplesWithType:v6 profile:v18 encodingOptions:0 predicate:v16 limit:0 anchor:0 error:a3];

  return v19;
}

- (id)_queryForOxygenSaturationSamplesInPreviousDays:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6 = [(HDRPDailyAnalyticsReport *)self _dateIntervalForPreviousDays:a3];
  id v7 = objc_msgSend(MEMORY[0x263F0A6E8], "hkrp_oxygenSaturationType");
  id v8 = HDSampleEntityPredicateForDateInterval();
  id v9 = (void *)MEMORY[0x263F43318];
  uint64_t v10 = [(HDRPDailyAnalyticsReport *)self profile];
  id v11 = [v9 samplesWithType:v7 profile:v10 encodingOptions:0 predicate:v8 limit:0 anchor:0 error:a4];

  return v11;
}

- (id)_queryForHasWornWatchInPreviousDayAndReturnError:(id *)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(HDRPDailyAnalyticsReport *)self _dateIntervalForPreviousDays:1];
  uint64_t v6 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09E38]];
  id v7 = HDDataEntityPredicateForObjectsFromAppleWatchSources();
  id v8 = HDSampleEntityPredicateForDateInterval();
  id v9 = (void *)MEMORY[0x263F434A8];
  v17[0] = v7;
  v17[1] = v8;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
  id v11 = [v9 predicateMatchingAllPredicates:v10];

  id v12 = (void *)MEMORY[0x263F43318];
  id v13 = [(HDRPDailyAnalyticsReport *)self profile];
  long long v14 = [v12 samplesWithType:v6 profile:v13 encodingOptions:0 predicate:v11 limit:3 anchor:0 error:a3];

  if (v14)
  {
    long long v15 = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(v14, "count") > 2);
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (id)_dateIntervalForPreviousDays:(unint64_t)a3
{
  uint64_t v5 = [(HDRPDailyAnalyticsReport *)self endTime];
  uint64_t v6 = [(NSCalendar *)self->_calendar hk_startOfDateBySubtractingDays:a3 fromDate:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v6 endDate:v5];

  return v7;
}

- (id)_numberOfSamplesWithExerciseMinute5MinutesPriorInPreviousDayAndReturnError:(id *)a3
{
  return 0;
}

- (id)_numberOfSamplesWithHeartRateGreaterThan100BPMFromSamples:(id)a3
{
  return 0;
}

- (id)_numberOfForegroundSamplesFromSamples:(id)a3
{
  v3 = objc_msgSend(a3, "hk_filter:", &__block_literal_global);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));

  return v4;
}

uint64_t __66__HDRPDailyAnalyticsReport__numberOfForegroundSamplesFromSamples___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 sourceRevision];
  v3 = [v2 source];
  uint64_t v4 = [v3 bundleIdentifier];
  uint64_t v5 = [v4 isEqualToString:*MEMORY[0x263F641E0]];

  return v5;
}

- (id)_numberOfEveningSamplesFromSamples:(id)a3
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HDRPDailyAnalyticsReport__numberOfEveningSamplesFromSamples___block_invoke;
  v6[3] = &unk_2647C6948;
  v6[4] = self;
  v3 = objc_msgSend(a3, "hk_filter:", v6);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));

  return v4;
}

BOOL __63__HDRPDailyAnalyticsReport__numberOfEveningSamplesFromSamples___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = [a2 startDate];
  uint64_t v4 = [v2 component:32 fromDate:v3];

  return (unint64_t)(v4 - 20) < 0xFFFFFFFFFFFFFFF4;
}

- (id)_numberOfSamplesWithHighElevationTakeFromSamples:(id)a3
{
  id v3 = a3;
  uint64_t v4 = HKOxygenSaturationLowBarometricPressureThresholdQuantity();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__HDRPDailyAnalyticsReport__numberOfSamplesWithHighElevationTakeFromSamples___block_invoke;
  v9[3] = &unk_2647C6948;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = objc_msgSend(v3, "hk_filter:", v9);

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));

  return v7;
}

uint64_t __77__HDRPDailyAnalyticsReport__numberOfSamplesWithHighElevationTakeFromSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 metadata];
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F09A48]];

  if (v4) {
    uint64_t v5 = objc_msgSend(v4, "hk_isLessThanQuantity:", *(void *)(a1 + 32));
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_numberOfSamplesByTruncatedOxygenSaturationValueFromSamples:(id)a3 keyPrefix:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) quantity];
        [v12 _value];
        int v14 = (int)(v13 * 100.0);

        if (v14 >= 100) {
          LODWORD(v15) = 100;
        }
        else {
          LODWORD(v15) = v14;
        }
        if (v14 >= 70) {
          uint64_t v15 = v15;
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = [NSString stringWithFormat:@"%@_%d", v6, v15];
        uint64_t v17 = [v7 objectForKeyedSubscript:v16];
        id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
        [v7 setObject:v18 forKeyedSubscript:v16];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  return v7;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProvider
{
  return self->_featureAvailabilityProvider;
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (HKRPOxygenSaturationSettings)oxygenSaturationSettings
{
  return self->_oxygenSaturationSettings;
}

- (NSUserDefaults)controlCenterUserDefaults
{
  return self->_controlCenterUserDefaults;
}

- (BOOL)isHealthDataCollectionAllowed
{
  return self->_healthDataCollectionAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCenterUserDefaults, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationSettings, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)generatePayloadAndReturnError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not fetch backgroundOxygenSaturationSamplesInPreviousDay: %{public}@", v7, v8, v9, v10, v11);
}

- (void)generatePayloadAndReturnError:.cold.2()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not fetch oxygenSaturationSamplesInPreviousDay: %{public}@", v7, v8, v9, v10, v11);
}

- (void)generatePayloadAndReturnError:.cold.3()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not fetch oxygenSaturationSamplesInPrevious30Days: %{public}@", v7, v8, v9, v10, v11);
}

- (void)generatePayloadAndReturnError:.cold.4()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not fetch hasWornWatchInPreviousDay: %{public}@", v7, v8, v9, v10, v11);
}

- (void)generatePayloadAndReturnError:.cold.5()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not gather diagnosticAndUsageReport: %{public}@", v7, v8, v9, v10, v11);
}

- (void)generatePayloadAndReturnError:.cold.6()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not gather improveHealthAndActivityReport: %{public}@", v7, v8, v9, v10, v11);
}

- (void)_gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:wasWorn:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  id v2 = v1;
  id v3 = (void *)OUTLINED_FUNCTION_3();
  id v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_226AA6000, v5, v6, "[%{public}@] Could not read number of weeks since onboarded: %{public}@", v7, v8, v9, v10, v11);
}

@end