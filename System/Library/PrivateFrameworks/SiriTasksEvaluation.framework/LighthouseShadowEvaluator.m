@interface LighthouseShadowEvaluator
- (BOOL)evaluateTaskSuccess:(id)a3 finalInteraction:(id)a4;
- (BOOL)findInteraction:(id)a3;
- (BOOL)isPSEBasedCandidateModel:(id)a3;
- (BOOL)isSuccess:(id)a3 intentType:(id)a4 intentResultType:(id)a5;
- (BOOL)performSiriEvaluationTaskWithTaskName:(id)a3 bmStreamIdentifier:(id)a4 outError:(id *)a5;
- (LighthouseShadowEvaluator)init;
- (NSMutableArray)evaluationResults;
- (NSMutableDictionary)jsonSELFResults;
- (id)evaluateAbandonedSiriTasks:(id)a3;
- (id)evaluateAppLaunchedTasks:(id)a3 startTime:(id)a4;
- (id)evaluateWithModel:(id)a3;
- (id)evaluateWithPSEBasedModel:(id)a3;
- (id)fetchSiriIntentEvents:(id)a3;
- (id)generateCandidateModels:(id)a3;
- (id)getDateString:(id)a3;
- (id)getLastEvaluationTime:(id)a3;
- (id)getTaskConfigurationFromInteractionID:(id)a3;
- (id)personalizeModel:(id)a3;
- (int64_t)getIntentEventType:(id)a3;
- (void)setEvaluationResults:(id)a3;
- (void)setJsonSELFResults:(id)a3;
@end

@implementation LighthouseShadowEvaluator

- (LighthouseShadowEvaluator)init
{
  v6.receiver = self;
  v6.super_class = (Class)LighthouseShadowEvaluator;
  v2 = [(LighthouseShadowEvaluator *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(LighthouseShadowEvaluator *)v2 setEvaluationResults:v3];

    v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(LighthouseShadowEvaluator *)v2 setJsonSELFResults:v4];
  }
  return v2;
}

- (BOOL)performSiriEvaluationTaskWithTaskName:(id)a3 bmStreamIdentifier:(id)a4 outError:(id *)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  NSLog(&cfstr_Lighthouseshad.isa);
  v9 = (void *)[objc_alloc(MEMORY[0x263F5B5C8]) initWithMaximumNumberOfDays:28 maximumNumberOfEvents:28];
  if (v7)
  {
    v10 = [@"com.apple.SiriTasksEvaluation" stringByAppendingString:@"-"];
    v11 = [v10 stringByAppendingString:v7];
  }
  else
  {
    v11 = @"com.apple.SiriTasksEvaluation";
  }
  id v26 = 0;
  v12 = (void *)[objc_alloc(MEMORY[0x263F5B5D0]) initWithBundleIdentifier:v11 dataProviderInstance:self evaluationInstance:self personalizationInstance:self pruningPolicy:v9 error:&v26];
  id v13 = v26;
  if (v13)
  {
    v14 = v13;
    NSLog(&cfstr_Lighthouseshad_0.isa, v13);
    BOOL v15 = 0;
  }
  else
  {
    if (!v8)
    {
      id v8 = [MEMORY[0x263F29E88] streamIdentifierForStream:35];
    }
    id v24 = v8;
    uint64_t v16 = [(LighthouseShadowEvaluator *)self generateCandidateModels:v8];
    v17 = (void *)[objc_alloc(MEMORY[0x263F5B5D8]) initWithMetricName:@"taskSuccessMetric" percentageIncrease:0.05];
    v27[0] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];

    v19 = (void *)[objc_alloc(MEMORY[0x263F5B5E0]) initWithModelSelectionParameters:v18 minimumNumberOfEvaluations:&unk_26CFA1948 minimumNumberOfSamples:0];
    v20 = (void *)[objc_alloc(MEMORY[0x263F5B5E8]) initWithModelSelectionParameters:v18 minimumNumberOfSamplesForPersonalization:&unk_26CFA1960 minimumNumberOfSamplesForPersonalizationSelection:&unk_26CFA1948];
    id v25 = 0;
    v21 = (void *)v16;
    [v12 trainAndEvaluateModelsWithCandidateModels:v16 personalizationPolicy:v20 selectionPolicy:v19 error:&v25];
    id v22 = v25;
    v14 = v22;
    BOOL v15 = v22 == 0;
    if (v22) {
      NSLog(&cfstr_Lighthouseshad_1.isa, v22);
    }

    id v8 = v24;
  }

  return v15;
}

- (id)getDateString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDateFormat:@"EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss Z"];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA18]) initWithName:@"UTC"];
  [v4 setTimeZone:v5];

  objc_super v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v4 setLocale:v6];

  id v7 = [v4 stringFromDate:v3];

  return v7;
}

- (BOOL)isSuccess:(id)a3 intentType:(id)a4 intentResultType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    v10 = [v7 type];
    if ([v10 isEqualToString:@"INStartCallIntent"])
    {
      [v7 duration];
      int v12 = (int)v11;
      uint64_t v13 = minCallDurationInSeconds;

      if (v13 > v12) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    char v14 = 1;
    goto LABEL_10;
  }
LABEL_4:
  if (([v8 isEqualToString:@"INStartCal]lIntent"] & 1) != 0
    || ([v8 isEqualToString:@"INSendMessageIntent"] & 1) != 0)
  {
    char v14 = 0;
  }
  else
  {
    char v14 = [v9 isEqualToString:@"failed"];
  }
LABEL_10:

  return v14;
}

- (BOOL)findInteraction:(id)a3
{
  id v3 = a3;
  if ([v3 eventType] == 1) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 30;
  }
  v5 = [v3 createdAt];

  objc_super v6 = [v5 dateByAddingTimeInterval:(double)v4];
  id v7 = objc_opt_new();
  id v8 = +[BiomeUtils getEventsFromStream:v7 startingAt:v5 until:v6];
  BOOL v9 = [v8 count] != 0;

  return v9;
}

- (BOOL)evaluateTaskSuccess:(id)a3 finalInteraction:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    BOOL v9 = 0;
    goto LABEL_6;
  }
  id v8 = [v6 lastObject];
  BOOL v9 = v8;
  if (!v8)
  {
LABEL_6:
    v10 = &stru_26CFA0AD0;
    goto LABEL_7;
  }
  if ([v8 eventType])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v9, "eventType"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    NSLog(&cfstr_Lighthouseshad_2.isa, v10);

    BOOL v11 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = (void *)MEMORY[0x263F08900];
  char v14 = [v9 eventData];
  id v34 = 0;
  BOOL v15 = [v13 JSONObjectWithData:v14 options:0 error:&v34];
  id v16 = v34;

  if (v16)
  {
    BOOL v11 = 0;
  }
  else
  {
    v17 = [v15 objectForKey:@"intentType"];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v6;
    v19 = (void *)[v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v19)
    {
      v27 = v17;
      v28 = v15;
      uint64_t v20 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ([v22 eventType] == 1)
          {
            v23 = (void *)MEMORY[0x263F08900];
            id v24 = [v22 eventData];
            uint64_t v29 = 0;
            id v25 = [v23 JSONObjectWithData:v24 options:0 error:&v29];
            uint64_t v26 = v29;

            v19 = 0;
            if (!v26)
            {
              v19 = [v25 objectForKey:@"type"];
            }

            goto LABEL_23;
          }
        }
        v19 = (void *)[v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v19) {
          continue;
        }
        break;
      }
LABEL_23:
      v17 = v27;
      BOOL v15 = v28;
    }

    BOOL v11 = [(LighthouseShadowEvaluator *)self isSuccess:v7 intentType:v17 intentResultType:v19];
  }

LABEL_8:
  return v11;
}

- (id)evaluateAbandonedSiriTasks:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(LighthouseShadowEvaluator *)self fetchSiriIntentEvents:v4];
  if ([v6 count])
  {
    id v7 = [v6 firstObject];
    id v8 = [v7 intentId];
    if (![(LighthouseShadowEvaluator *)self findInteraction:v7])
    {
      NSLog(&cfstr_Lighthouseshad_4.isa, v8);
      BOOL v9 = [[SiriTasksEvaluationResult alloc] initWithTaskId:v8 isEffectiveTask:1 isSuccessfulTask:0];
      [v5 addObject:v9];
    }
  }
  else
  {
    id v7 = [(LighthouseShadowEvaluator *)self getDateString:v4];
    NSLog(&cfstr_Lighthouseshad_3.isa, v7);
  }

  return v5;
}

- (id)evaluateAppLaunchedTasks:(id)a3 startTime:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
  v52 = objc_opt_new();
  v53 = v6;
  v54 = v5;
  id v7 = +[BiomeUtils getEventsFromStream:startingAt:until:](BiomeUtils, "getEventsFromStream:startingAt:until:");
  NSLog(&cfstr_Lighthouseshad_5.isa, [v7 count]);
  id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v63;
    uint64_t v57 = *(void *)v63;
    do
    {
      uint64_t v11 = 0;
      uint64_t v59 = v9;
      do
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v62 + 1) + 8 * v11);
        uint64_t v13 = (void *)MEMORY[0x223C2FFF0]();
        char v14 = [v12 eventBody];
        BOOL v15 = [v14 intentClass];
        char v16 = [v15 isEqualToString:@"INStartCallIntent"];

        if (v16)
        {
          v17 = (void *)MEMORY[0x263F08928];
          uint64_t v18 = objc_opt_class();
          v19 = [v14 interaction];
          uint64_t v61 = 0;
          uint64_t v20 = [v17 unarchivedObjectOfClass:v18 fromData:v19 error:&v61];

          v21 = [NSString stringWithFormat:@"%@", v20];
          NSLog(&cfstr_Lighthouseshad_7.isa, v21);
          id v22 = [v20 intent];
          v23 = [v22 _className];

          id v24 = [v20 intent];
          id v25 = [v24 identifier];

          uint64_t v26 = [v20 dateInterval];
          v27 = [v26 startDate];
          v28 = v27;
          if (v27)
          {
            id v29 = v27;
          }
          else
          {
            id v29 = [MEMORY[0x263EFF910] date];
          }
          long long v30 = v29;

          long long v31 = [v20 dateInterval];
          [v31 duration];
          if (v32 == 0.0) {
            double v33 = 0.0;
          }
          else {
            double v33 = v32;
          }

          uint64_t v34 = [v20 _donatedBySiri];
          v35 = [v20 dateInterval];
          NSLog(&cfstr_Lighthouseshad_8.isa, v35, v25, v34);

          uint64_t v36 = [[StitchableInteraction alloc] initWithType:v23 identifier:v25 startDate:v30 duration:v34 isDonatedBySiri:v33];
          [v58 addObject:v36];

          uint64_t v9 = v59;
          uint64_t v10 = v57;
        }
        else
        {
          NSLog(&cfstr_Lighthouseshad_6.isa);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v9);
  }

  v37 = v58;
  id v38 = (id)[v58 sortedArrayUsingComparator:&__block_literal_global_0];
  if ((unint64_t)[v58 count] >= 2)
  {
    uint64_t v39 = 1;
    do
    {
      v40 = (void *)MEMORY[0x223C2FFF0]();
      v41 = [v37 objectAtIndex:v39];
      uint64_t v42 = v39 - 1;
      v43 = [v37 objectAtIndex:v39 - 1];
      if (([v41 isDonatedBySiri] & 1) == 0 && objc_msgSend(v43, "isDonatedBySiri"))
      {
        v44 = [v41 startDate];
        v45 = [(LighthouseShadowEvaluator *)self fetchSiriIntentEvents:v44];
        if ([v45 count])
        {
          v46 = [v45 firstObject];
          v47 = [v46 intentId];

          v48 = [(LighthouseShadowEvaluator *)self getTaskConfigurationFromInteractionID:v47];
          v49 = v48;
          if (v48) {
            minCallDurationInSeconds = [v48 minDurationInSeconds];
          }
          else {
            NSLog(&cfstr_Lighthouseshad_10.isa, v47);
          }
          v50 = [[SiriTasksEvaluationResult alloc] initWithTaskId:v47 isEffectiveTask:1 isSuccessfulTask:[(LighthouseShadowEvaluator *)self evaluateTaskSuccess:v45 finalInteraction:v41]];
          [v55 addObject:v50];
        }
        else
        {
          v47 = [(LighthouseShadowEvaluator *)self getDateString:v44];
          NSLog(&cfstr_Lighthouseshad_9.isa, v47);
        }

        v37 = v58;
      }

      uint64_t v39 = v42 + 2;
    }
    while (v42 + 2 < (unint64_t)[v37 count]);
  }

  return v55;
}

uint64_t __64__LighthouseShadowEvaluator_evaluateAppLaunchedTasks_startTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  id v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)fetchSiriIntentEvents:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v33 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = v3;
  id v5 = [v4 dateByAddingTimeInterval:-60.0];
  id v6 = objc_opt_new();
  uint64_t v7 = +[BiomeUtils getEventsFromStream:v6 startingAt:v5 until:v4];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
  NSLog(&cfstr_Lighthouseshad_11.isa, v8);

  if ([v7 count])
  {
    id v29 = v6;
    long long v30 = v5;
    id v31 = v4;
    v27 = [v7 firstObject];
    uint64_t v26 = [v27 eventBody];
    uint64_t v36 = [v26 intentId];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v28 = v7;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v34 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v34) {
            objc_enumerationMutation(obj);
          }
          int v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v13 = [v12 eventBody];
          char v14 = [v13 intentId];
          int v15 = [v14 isEqualToString:v36];

          if (!v15)
          {

            goto LABEL_14;
          }
          char v16 = [v13 intentId];
          v17 = [v13 eventType];
          uint64_t v18 = [v13 eventData];
          v19 = (void *)MEMORY[0x263EFF910];
          [v12 timestamp];
          uint64_t v20 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
          v21 = [NSString stringWithFormat:@"%@", v12];
          NSLog(&cfstr_Lighthouseshad_13.isa, v21);
          unint64_t v22 = [(LighthouseShadowEvaluator *)self getIntentEventType:v17];
          v23 = [[SiriIntentEvent alloc] initWithIntentId:v16 eventType:v22 eventData:v18 createdAt:v20];
          if (v22 <= 5) {
            [v33 addObject:v23];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    id v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
    NSLog(&cfstr_Lighthouseshad_14.isa, v36, v24);

    id v5 = v30;
    id v4 = v31;
    uint64_t v7 = v28;
    id v6 = v29;
  }
  else
  {
    NSLog(&cfstr_Lighthouseshad_12.isa);
  }

  return v33;
}

- (id)getLastEvaluationTime:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 BMModelDataStream];

  if (v5)
  {
    v23 = self;
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = [v4 BMModelDataStream];
    uint64_t v8 = [v7 publisher];

    uint64_t v9 = [v4 bmReceiveInputBlock];
    uint64_t v10 = [v8 filterWithIsIncluded:v9];

    uint64_t v11 = +[BiomeUtils getEventsFromPublisher:v10];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = (void *)MEMORY[0x263EFF910];
          [*(id *)(*((void *)&v24 + 1) + 8 * i) timestamp];
          v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
          [v6 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
    if ([v6 count])
    {
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:0 ascending:1];
      v19 = [MEMORY[0x263EFF8C0] arrayWithObject:v18];
      [v6 sortUsingDescriptors:v19];

      uint64_t v20 = [v6 firstObject];
      v21 = [(LighthouseShadowEvaluator *)v23 getDateString:v20];
      NSLog(&cfstr_Lighthouseshad_15.isa, v21);
    }
    else
    {
      uint64_t v20 = [MEMORY[0x263EFF910] distantPast];
    }
  }
  else
  {
    uint64_t v20 = [MEMORY[0x263EFF910] distantPast];
  }

  return v20;
}

- (BOOL)isPSEBasedCandidateModel:(id)a3
{
  id v3 = a3;
  id v4 = [v3 BMModelDataStream];

  if (v4)
  {
    id v4 = [v3 BMModelDataStream];
    id v5 = [v4 identifier];
    NSLog(&cfstr_Lighthouseshad_16.isa, v5);

    id v6 = [v3 BMModelDataStream];
    uint64_t v7 = [v6 identifier];
    LOBYTE(v4) = [v7 isEqualToString:@"Siri.PostSiriEngagement"];
  }
  return (char)v4;
}

- (id)evaluateWithPSEBasedModel:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = BiomeLibrary();
  uint64_t v7 = [v6 Siri];
  uint64_t v8 = [v7 PostSiriEngagement];

  uint64_t v9 = [v8 publisher];
  uint64_t v10 = [v4 bmReceiveInputBlock];

  uint64_t v11 = [v9 filterWithIsIncluded:v10];

  uint64_t v12 = +[BiomeUtils getEventsFromPublisher:v11];
  uint64_t v13 = objc_alloc_init(_TtC19SiriTasksEvaluation26SimpleTaskSuccessEvaluator);
  uint64_t v14 = [(SimpleTaskSuccessEvaluator *)v13 evaluateWithPseEvents:v12];
  [(LighthouseShadowEvaluator *)self setJsonSELFResults:v14];

  int v15 = objc_opt_new();
  [v15 setMetricName:@"taskSuccessMetric"];
  [v15 setMetricValue:0.5];
  [v15 setNumberOfPositiveSamples:5];
  [v15 setNumberOfSamples:10];
  [v5 addModelEvaluationResults:v15];

  return v5;
}

- (id)evaluateWithModel:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 BMModelDataStream];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [v4 bmReceiveInputBlock],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    NSLog(&cfstr_Lighthouseshad_17.isa);
    id v9 = v5;
    goto LABEL_6;
  }
  if ([(LighthouseShadowEvaluator *)self isPSEBasedCandidateModel:v4])
  {
    id v9 = [(LighthouseShadowEvaluator *)self evaluateWithPSEBasedModel:v4];
LABEL_6:
    id v10 = v9;
    goto LABEL_7;
  }
  uint64_t v12 = [MEMORY[0x263EFF910] now];
  uint64_t v13 = [(LighthouseShadowEvaluator *)self getLastEvaluationTime:v4];
  uint64_t v14 = [v4 modelURL];
  int v15 = [v14 absoluteString];
  char v16 = [(LighthouseShadowEvaluator *)self getDateString:v13];
  NSLog(&cfstr_Lighthouseshad_18.isa, v15, v16);

  v17 = [v12 dateByAddingTimeInterval:-10800.0];
  long long v37 = v17;
  if ([v13 compare:v17] == -1)
  {
    id v18 = v17;

    v19 = [(LighthouseShadowEvaluator *)self getDateString:v18];
    NSLog(&cfstr_Lighthouseshad_19.isa, v19);

    uint64_t v13 = v18;
  }
  uint64_t v20 = [(LighthouseShadowEvaluator *)self evaluateAbandonedSiriTasks:v12];
  long long v38 = v12;
  uint64_t v21 = [(LighthouseShadowEvaluator *)self evaluateAppLaunchedTasks:v12 startTime:v13];
  unint64_t v22 = (void *)MEMORY[0x263EFF980];
  v35 = (void *)v21;
  uint64_t v36 = v20;
  v23 = objc_msgSend(v20, "arrayByAddingObjectsFromArray:");
  long long v24 = [v22 arrayWithArray:v23];
  [(LighthouseShadowEvaluator *)self setEvaluationResults:v24];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v25 = [(LighthouseShadowEvaluator *)self evaluationResults];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    LODWORD(v28) = 0;
    LODWORD(v29) = 0;
    uint64_t v30 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v40 != v30) {
          objc_enumerationMutation(v25);
        }
        double v32 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v29 = v29 + [v32 isSuccessfulTask];
        uint64_t v28 = v28 + [v32 isEffectiveTask];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v27);
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }

  id v33 = objc_opt_new();
  [v33 setMetricName:@"taskSuccessMetric"];
  [v33 setMetricValue:(double)v29 * 100.0 / (double)v28];
  [v33 setNumberOfPositiveSamples:v29];
  [v33 setNumberOfSamples:v28];
  uint64_t v34 = [v33 metricName];
  NSLog(&cfstr_Lighthouseshad_20.isa, v34, v29, v28);

  [v5 addModelEvaluationResults:v33];
  id v10 = v5;

LABEL_7:

  return v10;
}

- (id)personalizeModel:(id)a3
{
  id v3 = [a3 modelURL];
  id v4 = [v3 absoluteString];
  NSLog(&cfstr_Lighthouseshad_21.isa, v4);

  id v5 = objc_opt_new();
  [v5 setIsDefaultModel:0];

  return v5;
}

- (id)generateCandidateModels:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (v3)
  {
    id v5 = (void *)[objc_alloc(NSURL) initWithString:@"test_URL"];
    uint64_t v6 = [MEMORY[0x263F29E88] streamIdentifiers];
    int v7 = [v6 containsObject:v3];

    uint64_t v8 = "false";
    if (v7) {
      uint64_t v8 = "true";
    }
    NSLog(&cfstr_Lighthouseshad_23.isa, v3, v8);
    if (v7)
    {
      uint64_t v9 = [MEMORY[0x263F29E88] streamForStreamIdentifier:v3];
      id v10 = (void *)[objc_alloc(MEMORY[0x263F2A990]) initWithPublicStream:v9];
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F5B5C0]) initWithModelURL:v5 withBiomeStream:v10 andMetadata:0];
    }
    else
    {
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F5B5C0]) initWithModelURL:v5 withBiomeStreamIdentifier:v3 andMetadata:0];
    }
    [v11 setModelTag:@"default_model"];
    [v11 setIsDefaultModel:1];
    [v4 addObject:v11];
  }
  else
  {
    NSLog(&cfstr_Lighthouseshad_22.isa);
  }

  return v4;
}

- (int64_t)getIntentEventType:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "arrayWithObjects:", @"intentStart", @"intentResult", @"disambiguationOffer", @"disambiguationResult", @"confirmationOffer", @"confirmationResult", @"entityRejection", @"customSignal", 0);
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)getTaskConfigurationFromInteractionID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v3 = +[FeatureStoreUtils retrieveFeatureDataWithStreamId:interactionId:](_TtC19SiriTasksEvaluation17FeatureStoreUtils, "retrieveFeatureDataWithStreamId:interactionId:", @"SIRITaskConfiguration");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [[SiriTaskConfiguration alloc] initWithJSONData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        id v10 = v9;
        if (v6)
        {
          uint64_t v11 = [(SiriTaskConfiguration *)v6 eventTime];
          uint64_t v12 = [(SiriTaskConfiguration *)v10 eventTime];
          uint64_t v13 = [v11 compare:v12];

          if (v13 == -1)
          {
            uint64_t v14 = v10;

            int64_t v6 = v14;
          }
        }
        else
        {
          int64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSMutableArray)evaluationResults
{
  return self->_evaluationResults;
}

- (void)setEvaluationResults:(id)a3
{
}

- (NSMutableDictionary)jsonSELFResults
{
  return self->_jsonSELFResults;
}

- (void)setJsonSELFResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonSELFResults, 0);

  objc_storeStrong((id *)&self->_evaluationResults, 0);
}

@end