@interface NLPLearnerExtensionWorker
- (BOOL)evaluateModel:(id)a3 sampleLimit:(unint64_t)a4;
- (NLPLearnerExtensionWorker)initWithLocale:(id)a3 experimentName:(id)a4 modelURL:(id)a5 metricParameters:(id)a6;
- (NSDictionary)metricParameters;
- (NSLocale)locale;
- (NSString)experimentName;
- (NSURL)modelURL;
- (id)coreAnalyticsDonationFromEvaluationResults:(id)a3;
- (id)coreAnalyticsEvent;
- (id)coreAnalyticsEventSchema;
- (id)loadTaskData;
- (void)loadTaskData;
- (void)logEvaluationResults:(id)a3;
- (void)setExperimentName:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMetricParameters:(id)a3;
- (void)setModelURL:(id)a3;
@end

@implementation NLPLearnerExtensionWorker

- (NLPLearnerExtensionWorker)initWithLocale:(id)a3 experimentName:(id)a4 modelURL:(id)a5 metricParameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  os_log_t v14 = os_log_create("com.apple.NLPLearner.NLPLearnerExtensionWorker", "NLPLearnerExtensionWorker");
  v15 = (void *)sLog;
  sLog = (uint64_t)v14;

  v19.receiver = self;
  v19.super_class = (Class)NLPLearnerExtensionWorker;
  v16 = [(NLPLearnerExtensionWorker *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(NLPLearnerExtensionWorker *)v16 setLocale:v10];
    [(NLPLearnerExtensionWorker *)v17 setExperimentName:v11];
    [(NLPLearnerExtensionWorker *)v17 setModelURL:v12];
    [(NLPLearnerExtensionWorker *)v17 setMetricParameters:v13];
  }

  return v17;
}

- (BOOL)evaluateModel:(id)a3 sampleLimit:(unint64_t)a4
{
  v6 = [NLPLearnerACTShadowEvaluator alloc];
  v7 = [(NLPLearnerExtensionWorker *)self locale];
  v8 = [(NLPLearnerExtensionWorker *)self metricParameters];
  v9 = [(NLPLearnerACTShadowEvaluator *)v6 initWithLocale:v7 andMetricParameters:v8];

  [(NLPLearnerShadowEvaluator *)v9 setMaxSamples:a4];
  id v10 = [(NLPLearnerExtensionWorker *)self modelURL];
  id v11 = [(NLPLearnerExtensionWorker *)self loadTaskData];
  id v18 = 0;
  id v12 = [(NLPLearnerACTShadowEvaluator *)v9 evaluateModel:v10 onRecords:v11 options:0 completion:0 error:&v18];
  id v13 = v18;

  if (v13)
  {
    os_log_t v14 = (void *)sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[NLPLearnerExtensionWorker evaluateModel:sampleLimit:](v14, self, (uint64_t)v13);
    }
  }
  else
  {
    if (v12)
    {
      [(NLPLearnerExtensionWorker *)self logEvaluationResults:v12];
      BOOL v15 = 1;
      goto LABEL_7;
    }
    v17 = (void *)sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      -[NLPLearnerExtensionWorker evaluateModel:sampleLimit:](v17, self);
    }
  }
  BOOL v15 = 0;
LABEL_7:

  return v15;
}

- (id)loadTaskData
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F35110] startDateSortDescriptorAscending:0];
  v20[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];

  v4 = [MEMORY[0x263F35098] eventStreamWithName:@"/app/intents"];
  objc_super v19 = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];

  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"source.bundleID IN {'com.apple.MobileSMS', 'com.apple.mobilemail'} && structuredMetadata._DKIntentMetadataKey__intentClass IN {'INSendMessageIntent', 'MSSendMailIntent'}", MEMORY[0x263EFFA68] argumentArray];
  v7 = [MEMORY[0x263F35090] eventQueryWithPredicate:v6 eventStreams:v5 offset:0 limit:4000 sortDescriptors:v3];
  v8 = [MEMORY[0x263F350B8] knowledgeStoreWithDirectReadOnlyAccess];
  id v16 = 0;
  v9 = [v8 executeQuery:v7 error:&v16];
  id v10 = v16;
  if (v10)
  {
    id v11 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR)) {
      [(NLPLearnerExtensionWorker *)(uint64_t)v10 loadTaskData];
    }
  }
  id v12 = (void *)sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    id v13 = v12;
    uint64_t v14 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = v14;
    _os_log_impl(&dword_234530000, v13, OS_LOG_TYPE_INFO, "Finished querying CoreDuet, got %lu events", buf, 0xCu);
  }
  return v9;
}

- (void)logEvaluationResults:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_234530000, v5, OS_LOG_TYPE_INFO, "Evaluation results: %@", buf, 0xCu);
  }
  v6 = [(NLPLearnerExtensionWorker *)self coreAnalyticsEvent];
  id v7 = v4;
  AnalyticsSendEventLazy();
}

uint64_t __50__NLPLearnerExtensionWorker_logEvaluationResults___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) coreAnalyticsDonationFromEvaluationResults:*(void *)(a1 + 40)];
}

- (id)coreAnalyticsEvent
{
  return @"com.apple.NLPLearner.NLPLearnerQuickTypeLighthousePlugin.ACTShadowEvaluation";
}

- (id)coreAnalyticsEventSchema
{
  v10[29] = *MEMORY[0x263EF8340];
  v3 = [&unk_26E74D6A8 stringValue];
  v9[0] = @"actTestName";
  v9[1] = @"actTestVersion";
  v10[0] = &stru_26E74AEB0;
  v10[1] = &stru_26E74AEB0;
  v9[2] = @"actVersion";
  v9[3] = @"isAutocorrectionEnabled";
  v10[2] = &stru_26E74AEB0;
  v10[3] = v3;
  v9[4] = @"candidate1ConfigName";
  v9[5] = @"candidate1CharacterCount";
  v10[4] = &stru_26E74AEB0;
  v10[5] = v3;
  v9[6] = @"candidate1InsertedCharacterCount";
  v9[7] = @"candidate1SeparatorCount";
  v10[6] = v3;
  v10[7] = v3;
  v9[8] = @"candidate1WordCount";
  v9[9] = @"candidate1WordErrorCount";
  v10[8] = v3;
  v10[9] = v3;
  v9[10] = @"candidate1AverageJoannaWordErrorCount";
  v9[11] = @"candidate1CorrectedAwayWordErrorCount";
  v10[10] = v3;
  v10[11] = v3;
  v9[12] = @"candidate1TouchErrorRecoveryWordErrorCount";
  v9[13] = @"candidate1KnownWordCount";
  v10[12] = v3;
  v10[13] = v3;
  v9[14] = @"candidate2ConfigName";
  v9[15] = @"candidate2CharacterCount";
  v10[14] = &stru_26E74AEB0;
  v10[15] = v3;
  v9[16] = @"candidate2InsertedCharacterCount";
  v9[17] = @"candidate2SeparatorCount";
  v10[16] = v3;
  v10[17] = v3;
  v9[18] = @"candidate2WordCount";
  v9[19] = @"candidate2WordErrorCount";
  v10[18] = v3;
  v10[19] = v3;
  v9[20] = @"candidate2AverageJoannaWordErrorCount";
  v9[21] = @"candidate2CorrectedAwayWordErrorCount";
  v10[20] = v3;
  v10[21] = v3;
  v9[22] = @"candidate2TouchErrorRecoveryWordErrorCount";
  v9[23] = @"candidate2KnownWordCount";
  v10[22] = v3;
  v10[23] = v3;
  v10[24] = v3;
  v9[24] = @"numberOfSamples";
  v9[25] = @"keyboardLanguage";
  id v4 = [(NLPLearnerExtensionWorker *)self locale];
  v5 = [v4 localeIdentifier];
  v10[25] = v5;
  v10[26] = v3;
  v9[26] = @"deploymentID";
  v9[27] = @"experimentID";
  v9[28] = @"treatmentID";
  v10[27] = @"fail";
  v10[28] = @"fail";
  v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:29];
  id v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (id)coreAnalyticsDonationFromEvaluationResults:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(NLPLearnerExtensionWorker *)self coreAnalyticsEventSchema];
  v6 = [(NLPLearnerExtensionWorker *)self experimentName];
  [v5 setObject:v6 forKeyedSubscript:@"candidate1ConfigName"];

  id v7 = [v4 objectForKeyedSubscript:@"Samples"];
  v8 = [v7 stringValue];
  id v9 = v5;
  [v5 setObject:v8 forKeyedSubscript:@"numberOfSamples"];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        BOOL v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v16 = [v10 objectForKeyedSubscript:v15];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 isEqualToString:@"Samples"] & 1) == 0)
        {
          v17 = [v16 stringValue];
          uint64_t v18 = [NSString stringWithFormat:@"candidate1%@", v15];
          [v9 setObject:v17 forKeyedSubscript:v18];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }

  [v9 setObject:&unk_26E74D6C0 forKeyedSubscript:@"deploymentID"];
  [v9 setObject:@"MLHost" forKeyedSubscript:@"experimentID"];
  objc_super v19 = [(NLPLearnerExtensionWorker *)self experimentName];
  [v9 setObject:v19 forKeyedSubscript:@"treatmentID"];

  v20 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_234530000, v20, OS_LOG_TYPE_INFO, "Donate to CoreAnalytics: %@", buf, 0xCu);
  }

  return v9;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)experimentName
{
  return self->_experimentName;
}

- (void)setExperimentName:(id)a3
{
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
}

- (NSDictionary)metricParameters
{
  return self->_metricParameters;
}

- (void)setMetricParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricParameters, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_experimentName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)evaluateModel:(void *)a1 sampleLimit:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 modelURL];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_234530000, v3, OS_LOG_TYPE_ERROR, "Empty evaluation results for model: %@", (uint8_t *)&v5, 0xCu);
}

- (void)evaluateModel:(uint64_t)a3 sampleLimit:.cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = a1;
  v6 = [a2 modelURL];
  int v7 = 138412546;
  v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_234530000, v5, OS_LOG_TYPE_ERROR, "Failed evaluation for model: %@, Error: %@", (uint8_t *)&v7, 0x16u);
}

- (void)loadTaskData
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234530000, a2, OS_LOG_TYPE_ERROR, "Failed to query CoreDuet storage with error %@", (uint8_t *)&v2, 0xCu);
}

@end