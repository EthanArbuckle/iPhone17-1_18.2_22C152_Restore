@interface _PSTrialClient
- (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4;
- (BOOL)shouldActivatePSR;
- (BOOL)shouldComputePhotoBasedFeatures;
- (BOOL)shouldEnableDataCollection;
- (BOOL)userDefaultBoolValueForKey:(id)a3 defaultToValue:(BOOL)a4;
- (_PSTrialClient)init;
- (double)doubleForKey:(id)a3 withDefaultValue:(double)a4;
- (double)maxComputationTime;
- (double)userDefaultDoubleValueForKey:(id)a3 defaultToValue:(double)a4;
- (id)additionalFeaturesToCompute;
- (id)arrayForKey:(id)a3 withDefaultValue:(id)a4;
- (id)arrayOfArraysForKey:(id)a3 withDefaultValue:(id)a4;
- (id)configWithAnchorDate:(id)a3;
- (id)getTrialExperiment;
- (id)loadCoreMLModel:(id)a3 config:(id)a4;
- (id)mutableDictionaryForKey:(id)a3 withDefaultValue:(id)a4;
- (id)objectForKey:(id)a3;
- (id)rankingModel;
- (id)recipe;
- (id)stringForKey:(id)a3 withDefaultValue:(id)a4;
- (id)suggestionProxyOrder;
- (id)userDefaultArrayValueForKey:(id)a3 defaultToValue:(id)a4;
- (id)userDefaultMutableDictionaryForKey:(id)a3 defaultToValue:(id)a4;
- (id)userDefaultStringValueForKey:(id)a3 defaultToValue:(id)a4;
- (int)dataCollectionTimeToWaitInSeconds;
- (unint64_t)integerForKey:(id)a3 withDefaultValue:(unint64_t)a4;
- (unint64_t)userDefaultIntegerValueForKey:(id)a3 defaultToValue:(unint64_t)a4;
- (void)updateFactors;
@end

@implementation _PSTrialClient

- (_PSTrialClient)init
{
  v22.receiver = self;
  v22.super_class = (Class)_PSTrialClient;
  v2 = [(_PSTrialClient *)&v22 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
    v6 = objc_opt_new();
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v7 = (void *)getTRIClientClass_softClass_0;
    uint64_t v27 = getTRIClientClass_softClass_0;
    if (!getTRIClientClass_softClass_0)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getTRIClientClass_block_invoke_0;
      location[3] = &unk_1E5ADE858;
      location[4] = &v24;
      __getTRIClientClass_block_invoke_0((uint64_t)location);
      v7 = (void *)v25[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v24, 8);
    uint64_t v9 = [v8 clientWithIdentifier:210];
    v10 = (void *)v6[1];
    v6[1] = v9;

    objc_initWeak(location, v2);
    v11 = (void *)v6[1];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __22___PSTrialClient_init__block_invoke;
    v20 = &unk_1E5ADED80;
    objc_copyWeak(&v21, location);
    uint64_t v12 = [v11 addUpdateHandlerForNamespaceName:@"COREML_SYSTEMS_PEOPLE_SUGGESTER" usingBlock:&v17];
    v13 = (void *)v6[5];
    v6[5] = v12;

    objc_destroyWeak(&v21);
    objc_destroyWeak(location);
    uint64_t v14 = objc_msgSend(v5, "initWithGuardedData:", v6, v17, v18, v19, v20);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v14;

    [(_PSTrialClient *)v2 updateFactors];
  }
  return v2;
}

- (void)updateFactors
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31___PSTrialClient_updateFactors__block_invoke;
  v3[3] = &unk_1E5ADF598;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

- (id)rankingModel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30___PSTrialClient_rankingModel__block_invoke;
  v5[3] = &unk_1E5ADF5C0;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)recipe
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24___PSTrialClient_recipe__block_invoke;
  v5[3] = &unk_1E5ADF5E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)shouldActivatePSR
{
  return [(_PSTrialClient *)self BOOLForKey:@"shouldActivePSR" withDefaultValue:1];
}

- (BOOL)shouldComputePhotoBasedFeatures
{
  uint64_t v3 = _os_feature_enabled_impl();

  return [(_PSTrialClient *)self BOOLForKey:@"shouldComputePhotoBasedFeatures" withDefaultValue:v3];
}

- (int)dataCollectionTimeToWaitInSeconds
{
  return [(_PSTrialClient *)self integerForKey:@"dataCollectionTimeToWaitInSeconds" withDefaultValue:15];
}

- (double)maxComputationTime
{
  [(_PSTrialClient *)self doubleForKey:@"maxComputationTime" withDefaultValue:0.2];
  return result;
}

- (BOOL)shouldEnableDataCollection
{
  return [(_PSTrialClient *)self BOOLForKey:@"shouldEnableDataCollection" withDefaultValue:1];
}

- (id)getTrialExperiment
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36___PSTrialClient_getTrialExperiment__block_invoke;
  v5[3] = &unk_1E5ADF5E8;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)additionalFeaturesToCompute
{
  v49[19] = *MEMORY[0x1E4F143B8];
  v48[0] = @"copy:to:";
  v48[1] = @"numberOfEngagedSuggestionsOfTopDomainURLWithConversation";
  v48[2] = @"count1";
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  v49[0] = v28;
  v47[0] = @"impute:withConstant:";
  v47[1] = @"count1";
  v47[2] = &unk_1EF674EE0;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];
  v49[1] = v27;
  v46[0] = @"laplaceProbability:withAlpha:";
  v46[1] = @"count1";
  v46[2] = &unk_1EF674EF8;
  v46[3] = @"P1";
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
  v49[2] = v25;
  v45[0] = @"log:withBase:";
  v45[1] = @"P1";
  v45[2] = &unk_1EF674F10;
  v45[3] = @"log_P1";
  uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  v49[3] = v24;
  v44[0] = @"copy:to:";
  v44[1] = @"numberOfEngagedSuggestionsFromCurrentAppWithConversation";
  v44[2] = @"count2";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v49[4] = v23;
  v43[0] = @"impute:withConstant:";
  v43[1] = @"count2";
  v43[2] = &unk_1EF674EE0;
  objc_super v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  v49[5] = v22;
  v42[0] = @"laplaceProbability:withAlpha:";
  v42[1] = @"count2";
  v42[2] = &unk_1EF674EF8;
  v42[3] = @"P2";
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:4];
  v49[6] = v21;
  v41[0] = @"log:withBase:";
  v41[1] = @"P2";
  v41[2] = &unk_1EF674F10;
  v41[3] = @"log_P2";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
  v49[7] = v20;
  v40[0] = @"copy:to:";
  v40[1] = @"numberOfSharesOfTopDomainURLWithConversation";
  v40[2] = @"count3";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
  v49[8] = v19;
  v39[0] = @"impute:withConstant:";
  v39[1] = @"count3";
  v39[2] = &unk_1EF674EE0;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
  v49[9] = v18;
  v38[0] = @"laplaceProbability:withAlpha:";
  v38[1] = @"count3";
  v38[2] = &unk_1EF674EF8;
  v38[3] = @"P3";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:4];
  v49[10] = v17;
  v37[0] = @"log:withBase:";
  v37[1] = @"P3";
  v37[2] = &unk_1EF674F10;
  v37[3] = @"log_P3";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  v49[11] = v16;
  v36[0] = @"copy:to:";
  v36[1] = @"numberOfSharesFromCurrentAppWithConversation";
  v36[2] = @"count4";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  v49[12] = v15;
  v35[0] = @"impute:withConstant:";
  v35[1] = @"count4";
  v35[2] = &unk_1EF674EE0;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  v49[13] = v2;
  v34[0] = @"laplaceProbability:withAlpha:";
  v34[1] = @"count4";
  v34[2] = &unk_1EF674EF8;
  v34[3] = @"P4";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  v49[14] = v3;
  v33[0] = @"log:withBase:";
  v33[1] = @"P4";
  v33[2] = &unk_1EF674F10;
  v33[3] = @"log_P4";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
  v49[15] = v4;
  v32[0] = @"sum:with:";
  v32[1] = @"log_P1";
  v32[2] = @"log_P2";
  v32[3] = @"partialSum1";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  v49[16] = v5;
  v31[0] = @"sum:with:";
  v31[1] = @"log_P3";
  v31[2] = @"log_P4";
  v31[3] = @"partialSum2";
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
  v49[17] = v6;
  v30[0] = @"sum:with:";
  v30[1] = @"partialSum1";
  v30[2] = @"partialSum2";
  v30[3] = @"logJointProbability";
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v49[18] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:19];

  uint64_t v9 = [(_PSTrialClient *)self arrayOfArraysForKey:@"additionalFeaturesToCompute" withDefaultValue:v8];
  v10 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"additionalFeaturesToCompute"];
  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v10];
    if (v11)
    {
      uint64_t v29 = 0;
      uint64_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v29];

      uint64_t v9 = (void *)v12;
    }
  }
  v13 = [(_PSTrialClient *)self arrayOfArraysForKey:@"additionalFeaturesToCompute" withDefaultValue:v9];

  return v13;
}

- (id)configWithAnchorDate:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v45[0] = @"coreMLModelScore";
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  v43[0] = @"timeSinceLastOutgoingInteraction";
  v43[1] = @"timeSinceOutgoingInteractionNumber10";
  v44[0] = &unk_1EF676728;
  v44[1] = &unk_1EF676728;
  v43[2] = @"timeSinceLastIncomingInteraction";
  void v43[3] = @"numberOfSharesWithConversation";
  v44[2] = &unk_1EF676728;
  void v44[3] = &unk_1EF674EE0;
  v43[4] = @"numberOfSharesFromCurrentAppWithConversation";
  v43[5] = @"numberOfSharesOfTopDomainURLWithConversation";
  v44[4] = &unk_1EF674EE0;
  v44[5] = &unk_1EF674EE0;
  v43[6] = @"numberOfSharesOfDetectedPeopleWithConversation";
  v43[7] = @"numberOfSharesOfPeopleInPhotoWithConversation";
  v44[6] = &unk_1EF674EE0;
  v44[7] = &unk_1EF674EE0;
  v43[8] = @"numberOfIncomingInteractionsWithConversation";
  v43[9] = @"numberOfOutgoingInteractionsWithConversation";
  v44[8] = &unk_1EF674EE0;
  v44[9] = &unk_1EF674EE0;
  v43[10] = @"numberOfInteractionsDuringTimePeriodWithConversation";
  v43[11] = @"hasEverSharePlayedWithConversation";
  v44[10] = &unk_1EF674EE0;
  v44[11] = &unk_1EF674EE0;
  v43[12] = @"numberOfEngagedSuggestionsWithConversation";
  v43[13] = @"numberOfEngagedSuggestionsFromCurrentAppWithConversation";
  v44[12] = &unk_1EF674EE0;
  v44[13] = &unk_1EF674EE0;
  v43[14] = @"numberOfEngagedSuggestionsOfTopDomainURLWithConversation";
  v43[15] = @"numberOfEngagedSuggestionsOfDetectedPeopleWithConversation";
  v44[14] = &unk_1EF674EE0;
  v44[15] = &unk_1EF674EE0;
  v43[16] = @"numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation";
  v44[16] = &unk_1EF674EE0;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:17];
  [(_PSTrialClient *)self doubleForKey:@"timeInterval" withDefaultValue:5184000.0];
  double v6 = v5;
  unint64_t v7 = [(_PSTrialClient *)self integerForKey:@"fetchLimit" withDefaultValue:4000];
  uint64_t v8 = [(_PSTrialClient *)self arrayForKey:@"featureNamesToSortWith" withDefaultValue:v31];
  BOOL v9 = [(_PSTrialClient *)self BOOLForKey:@"shouldSortAscending" withDefaultValue:1];
  BOOL v10 = [(_PSTrialClient *)self BOOLForKey:@"shouldUseSuggestionEngaged" withDefaultValue:1];
  id v11 = [(_PSTrialClient *)self mutableDictionaryForKey:@"statsDefaultValues" withDefaultValue:v4];
  [(_PSTrialClient *)self userDefaultDoubleValueForKey:@"timeInterval" defaultToValue:v6];
  double v13 = v12;
  unint64_t v14 = [(_PSTrialClient *)self userDefaultIntegerValueForKey:@"fetchLimit" defaultToValue:v7];
  v15 = [(_PSTrialClient *)self userDefaultArrayValueForKey:@"featureNamesToSortWith" defaultToValue:v8];

  BOOL v16 = [(_PSTrialClient *)self userDefaultBoolValueForKey:@"shouldSortAscending" defaultToValue:v9];
  BOOL v17 = [(_PSTrialClient *)self userDefaultBoolValueForKey:@"shouldUseSuggestionEngaged" defaultToValue:v10];
  uint64_t v18 = [(_PSTrialClient *)self userDefaultMutableDictionaryForKey:@"statsDefaultValues" defaultToValue:v11];

  v19 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [NSNumber numberWithBool:v16];
    id v21 = [NSNumber numberWithBool:v17];
    *(_DWORD *)buf = 134219266;
    *(double *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v37 = v15;
    *(_WORD *)v38 = 2112;
    *(void *)&v38[2] = v20;
    __int16 v39 = 2112;
    v40 = v21;
    __int16 v41 = 2112;
    v42 = v18;
    _os_log_impl(&dword_1A314B000, v19, OS_LOG_TYPE_DEFAULT, "_PSTrialClient: Final configuration is: timeInterval %f, fetchLimit %lu, featureNamesToSortWith %@, shouldSortAscending %@, shouldUseSuggestionEngaged %@, statsDefaultValues %@", buf, 0x3Eu);
  }
  id v22 = v30;
  v23 = [v22 dateByAddingTimeInterval:-v13];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  uint64_t v24 = (void *)get_CDInteractionsStatisticsConfigClass_softClass;
  uint64_t v35 = get_CDInteractionsStatisticsConfigClass_softClass;
  if (!get_CDInteractionsStatisticsConfigClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_CDInteractionsStatisticsConfigClass_block_invoke;
    v37 = &unk_1E5ADE858;
    *(void *)v38 = &v32;
    __get_CDInteractionsStatisticsConfigClass_block_invoke((uint64_t)buf);
    uint64_t v24 = (void *)v33[3];
  }
  v25 = v24;
  _Block_object_dispose(&v32, 8);
  id v26 = [v25 alloc];
  [(_PSTrialClient *)self maxComputationTime];
  LOBYTE(v29) = v17;
  uint64_t v27 = objc_msgSend(v26, "initWithAnchorDate:leftBoundDate:rightBoundDate:fetchLimit:maxComputationTime:featureNamesToSortWith:shouldSortAscending:shouldUseSuggestionEngaged:statsDefaultValues:", v22, v23, v22, v14, v15, v16, v29, v18);

  return v27;
}

- (id)suggestionProxyOrder
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"SuggestionProxyTypeInCall";
  v9[1] = @"SuggestionProxyTypeReturnToSender";
  v9[2] = @"SuggestionProxyTypeHyperRecencyRewrite";
  v9[3] = @"SuggestionProxyTypeFromStats";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];
  v4 = [(_PSTrialClient *)self arrayForKey:@"suggestionProxyOrder" withDefaultValue:v3];
  double v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "Heuristic order used: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (id)loadCoreMLModel:(id)a3 config:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[v6 copy];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2050000000;
    BOOL v10 = (void *)getMLModelConfigurationClass_softClass;
    uint64_t v34 = getMLModelConfigurationClass_softClass;
    if (!getMLModelConfigurationClass_softClass)
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __getMLModelConfigurationClass_block_invoke;
      uint64_t v29 = &unk_1E5ADE858;
      id v30 = &v31;
      CoreMLLibraryCore_0();
      v32[3] = (uint64_t)objc_getClass("MLModelConfiguration");
      getMLModelConfigurationClass_softClass = *(void *)(v30[1] + 24);
      BOOL v10 = (void *)v32[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v31, 8);
    id v9 = (id)objc_opt_new();
  }
  double v12 = v9;

  [v12 setComputeUnits:0];
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2050000000;
  double v13 = (void *)getMLModelClass_softClass_1;
  uint64_t v34 = getMLModelClass_softClass_1;
  if (!getMLModelClass_softClass_1)
  {
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __getMLModelClass_block_invoke_1;
    uint64_t v29 = &unk_1E5ADE858;
    id v30 = &v31;
    CoreMLLibraryCore_0();
    v32[3] = (uint64_t)objc_getClass("MLModel");
    getMLModelClass_softClass_1 = *(void *)(v30[1] + 24);
    double v13 = (void *)v32[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v31, 8);
  id v25 = 0;
  v15 = [v14 modelWithContentsOfURL:v5 configuration:v12 error:&v25];
  id v16 = v25;
  if (v16)
  {
    BOOL v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_PSTrialClient loadCoreMLModel:config:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  return v15;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31___PSTrialClient_objectForKey___block_invoke;
  v9[3] = &unk_1E5ADF5C0;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (double)doubleForKey:(id)a3 withDefaultValue:(double)a4
{
  id v5 = [(_PSTrialClient *)self objectForKey:a3];
  id v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    a4 = v7;
  }

  return a4;
}

- (unint64_t)integerForKey:(id)a3 withDefaultValue:(unint64_t)a4
{
  id v5 = [(_PSTrialClient *)self objectForKey:a3];
  id v6 = v5;
  if (v5) {
    a4 = [v5 integerValue];
  }

  return a4;
}

- (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  id v5 = [(_PSTrialClient *)self objectForKey:a3];
  id v6 = v5;
  if (v5) {
    a4 = [v5 BOOLValue];
  }

  return a4;
}

- (id)stringForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_PSTrialClient *)self objectForKey:a3];
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)mutableDictionaryForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_PSTrialClient *)self objectForKey:a3];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)[v6 mutableCopy];
  }
  id v10 = v9;

  return v10;
}

- (id)arrayOfArraysForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_PSTrialClient *)self objectForKey:a3];
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)arrayForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(_PSTrialClient *)self objectForKey:a3];
  uint64_t v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (double)userDefaultDoubleValueForKey:(id)a3 defaultToValue:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v7)
  {
    [(NSUserDefaults *)self->_userDefaults doubleForKey:v6];
    a4 = v8;
  }

  return a4;
}

- (unint64_t)userDefaultIntegerValueForKey:(id)a3 defaultToValue:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v7) {
    a4 = [(NSUserDefaults *)self->_userDefaults integerForKey:v6];
  }

  return a4;
}

- (BOOL)userDefaultBoolValueForKey:(id)a3 defaultToValue:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v7) {
    a4 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:v6];
  }

  return a4;
}

- (id)userDefaultStringValueForKey:(id)a3 defaultToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v8)
  {
    id v9 = [(NSUserDefaults *)self->_userDefaults stringForKey:v6];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (id)userDefaultArrayValueForKey:(id)a3 defaultToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v8)
  {
    id v9 = [(NSUserDefaults *)self->_userDefaults arrayForKey:v6];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (id)userDefaultMutableDictionaryForKey:(id)a3 defaultToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];

  if (v8)
  {
    uint64_t v9 = [(NSUserDefaults *)self->_userDefaults objectForKey:v6];
  }
  else
  {
    uint64_t v9 = [v7 mutableCopy];
  }
  id v10 = (void *)v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)loadCoreMLModel:(uint64_t)a3 config:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end