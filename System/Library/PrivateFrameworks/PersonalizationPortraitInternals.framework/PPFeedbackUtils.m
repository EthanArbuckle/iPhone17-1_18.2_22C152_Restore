@interface PPFeedbackUtils
+ (BOOL)shouldSample:(id)a3;
+ (BOOL)shouldSampleExtraction:(id)a3;
+ (id)_flattenArraylikeToFeatures:(void *)a3 featureName:;
+ (id)featuresForScoreDict:(id)a3;
+ (id)feedbackItemForPPFeedbackItem:(id)a3;
+ (id)feedbackItemsByItemString:(id)a3;
+ (id)feedbackMetadataForBaseFeedback:(id)a3;
+ (id)scoredItemWithFeaturesForFeatureDictionary:(id)a3 score:(float)a4;
+ (void)addBoilerplateToFeedbackLog:(id)a3;
+ (void)recordUniversalSearchSpotlightStatsFromFeedback:(id)a3 clientBundleId:(id)a4 clientIdentifier:(id)a5;
+ (void)recordUserEventsFromFeedback:(id)a3 matchingFeedbackItems:(id)a4 clientBundleId:(id)a5 clientIdentifier:(id)a6 domain:(unsigned __int8)a7;
@end

@implementation PPFeedbackUtils

+ (id)featuresForScoreDict:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v3 featureNames];
  uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v38;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v37 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CB79D060]();
        if ([v9 hasPrefix:@"scalar"])
        {
          id v11 = [v3 featureValueForName:v9];
          id v12 = [v11 multiArrayValue];
          v13 = [v12 objectAtIndexedSubscript:0];
          [v4 setObject:v13 forKeyedSubscript:v9];

          goto LABEL_20;
        }
        if ([v9 hasPrefix:@"array"])
        {
          id v11 = [v3 featureValueForName:v9];
          if (v11)
          {
            v14 = v11;
          }
          else
          {
            v29 = [MEMORY[0x1E4F28B00] currentHandler];
            [v29 handleFailureInMethod:a2 object:a1 file:@"PPFeedbackUtils.m" lineNumber:314 description:@"The value at a listed feature output should be nonnull."];

            v14 = 0;
          }
          +[PPFeedbackUtils _flattenArraylikeToFeatures:featureName:]((uint64_t)PPFeedbackUtils, v14, v9);
          id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
          [v4 addEntriesFromDictionary:v12];
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
        if ([v9 hasPrefix:@"object"])
        {
          id v11 = [v3 featureValueForName:v9];
          switch([v11 type])
          {
            case 1:
              objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v11, "int64Value"));
              id v12 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v15 = [[NSString alloc] initWithFormat:@"%@_int", v9];
              goto LABEL_17;
            case 2:
              v16 = NSNumber;
              [v11 doubleValue];
              objc_msgSend(v16, "numberWithDouble:");
              id v12 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v15 = [[NSString alloc] initWithFormat:@"%@_dbl", v9];
LABEL_17:
              v17 = (void *)v15;
              v18 = v4;
              v19 = v12;
              goto LABEL_19;
            case 3:
              id v20 = [NSString alloc];
              id v12 = [v11 stringValue];
              v17 = (void *)[v20 initWithFormat:@"%@_str_%@", v9, v12];
              v18 = v4;
              v19 = &unk_1F2568BA0;
LABEL_19:
              [v18 setObject:v19 forKeyedSubscript:v17];

              goto LABEL_20;
            case 6:
              id v11 = v11;
              id v21 = v9;
              uint64_t v22 = self;
              if ([v11 type] != 6)
              {
                v30 = [MEMORY[0x1E4F28B00] currentHandler];
                [v30 handleFailureInMethod:sel__flattenDictionarylikeToFeatures_featureName_, v22, @"PPFeedbackUtils.m", 297, @"Invalid parameter not satisfying: %@", @"value.type == MLFeatureTypeDictionary" object file lineNumber description];
              }
              id v23 = objc_alloc(MEMORY[0x1E4F1CA60]);
              v24 = [v11 dictionaryValue];
              v25 = objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

              v26 = [v11 dictionaryValue];
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __64__PPFeedbackUtils__flattenDictionarylikeToFeatures_featureName___block_invoke;
              v41[3] = &unk_1E65D4178;
              id v27 = v25;
              id v42 = v27;
              id v43 = v21;
              id v35 = v21;
              [v26 enumerateKeysAndObjectsUsingBlock:v41];

              v28 = v43;
              id v12 = v27;

              goto LABEL_12;
            default:
              goto LABEL_21;
          }
        }
LABEL_22:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
      uint64_t v6 = v31;
    }
    while (v31);
  }

  return v4;
}

+ (id)_flattenArraylikeToFeatures:(void *)a3 featureName:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if ([v4 type] != 5)
  {
    if ([v4 type] != 7
      || ([v4 sequenceValue],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 type],
          v7,
          v8 != 1))
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel__flattenArraylikeToFeatures_featureName_, v6, @"PPFeedbackUtils.m", 275, @"Invalid parameter not satisfying: %@", @"value.type == MLFeatureTypeMultiArray || (value.type == MLFeatureTypeSequence && value.sequenceValue.type == MLFeatureTypeInt64)" object file lineNumber description];
    }
  }
  if ([v4 type] == 7)
  {
    v10 = [v4 sequenceValue];
    id v11 = [v10 int64Values];
  }
  else
  {
    v10 = [v4 multiArrayValue];
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    if ([v10 count])
    {
      unint64_t v12 = 0;
      do
      {
        v13 = [v10 objectAtIndexedSubscript:v12];
        [v11 setObject:v13 atIndexedSubscript:v12];

        ++v12;
      }
      while (v12 < [v10 count]);
    }
  }

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
  if ([v11 count])
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [v11 objectAtIndexedSubscript:v15];
      v17 = (void *)[[NSString alloc] initWithFormat:@"%@_%lu", v5, v15];
      [v14 setObject:v16 forKeyedSubscript:v17];

      ++v15;
    }
    while (v15 < [v11 count]);
  }

  return v14;
}

void __64__PPFeedbackUtils__flattenDictionarylikeToFeatures_featureName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = a2;
  id v9 = (id)[[v6 alloc] initWithFormat:@"%@_dict_%@", *(void *)(a1 + 40), v8];

  [v5 setObject:v7 forKeyedSubscript:v9];
}

+ (void)recordUniversalSearchSpotlightStatsFromFeedback:(id)a3 clientBundleId:(id)a4 clientIdentifier:(id)a5
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v19 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1CB79D060]();
  v20[0] = *MEMORY[0x1E4F89D80];
  id v10 = [NSString alloc];
  id v11 = +[PPMetricsUtils stringifyDomain:7];
  unint64_t v12 = (void *)[v10 initWithFormat:@"%@%@", @"Portrait", v11];
  v21[0] = v12;
  v20[1] = *MEMORY[0x1E4F89D98];
  v13 = +[PPTrialWrapper sharedInstance];
  v14 = [v13 concatenatedTreatmentNames];
  v21[1] = v14;
  v20[2] = *MEMORY[0x1E4F89D90];
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "offeredCSSICount"));
  v21[2] = v15;
  v20[3] = *MEMORY[0x1E4F89D70];
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "engagedCSSICount"));
  v21[3] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  v18 = [MEMORY[0x1E4F89D68] sharedInstance];
  [v18 logMessage:v17 messageName:*MEMORY[0x1E4F89D78]];
}

+ (void)recordUserEventsFromFeedback:(id)a3 matchingFeedbackItems:(id)a4 clientBundleId:(id)a5 clientIdentifier:(id)a6 domain:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v96 = v12;
  if (![v14 isEqualToString:@"ICLex"])
  {
    v47 = objc_msgSend(v13, "_pas_stringBackedByUTF8CString");

    uint64_t v104 = objc_msgSend(v14, "_pas_stringBackedByUTF8CString");

    v48 = [v11 feedbackItems];
    uint64_t v92 = [v48 count];

    unsigned int v94 = v7;
    uint64_t v49 = +[PPMetricsUtils stringifyDomain:v7];
    v50 = (void *)MEMORY[0x1CB79D060]();
    v101 = (void *)v49;
    contexta = (void *)[[NSString alloc] initWithFormat:@"%@_%@", v49, v47];
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v51 = [v11 feedbackItems];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v105 objects:v119 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      uint64_t v56 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v106 != v56) {
            objc_enumerationMutation(v51);
          }
          v58 = *(void **)(*((void *)&v105 + 1) + 8 * i);
          if ([v58 itemFeedbackType] == 3)
          {
            uint64_t v54 = (v54 + 1);
          }
          else if ([v58 itemFeedbackType] == 1 {
                 || [v58 itemFeedbackType] == 2)
          }
          {
            uint64_t v55 = (v55 + 1);
          }
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v105 objects:v119 count:16];
      }
      while (v53);
    }
    else
    {
      uint64_t v54 = 0;
      uint64_t v55 = 0;
    }

    v59 = (void *)MEMORY[0x1CB79D060]();
    v117[0] = @"clientId";
    v117[1] = @"bundleId";
    v60 = (void *)v104;
    v118[0] = v104;
    v118[1] = v47;
    v117[2] = @"domain";
    v61 = +[PPMetricsUtils stringifyDomain:v94];
    v118[2] = v61;
    v117[3] = @"eventCount";
    v62 = [NSNumber numberWithUnsignedInt:v55];
    v118[3] = v62;
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:4];

    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.PositivePersonalizationEvent" payload:v63 inBackground:1];

    v64 = (void *)MEMORY[0x1CB79D060]();
    v115[0] = @"clientId";
    v115[1] = @"bundleId";
    v116[0] = v104;
    v116[1] = v47;
    v115[2] = @"domain";
    v65 = +[PPMetricsUtils stringifyDomain:v94];
    v116[2] = v65;
    v115[3] = @"eventCount";
    v66 = [NSNumber numberWithUnsignedInt:v54];
    v116[3] = v66;
    v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:4];

    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FrustrationEvent" payload:v67 inBackground:1];

    v68 = (void *)MEMORY[0x1CB79D060]();
    uint64_t v69 = *MEMORY[0x1E4F89D80];
    v114[0] = contexta;
    uint64_t v70 = *MEMORY[0x1E4F89D98];
    v113[0] = v69;
    v113[1] = v70;
    v71 = +[PPTrialWrapper sharedInstance];
    v72 = [v71 concatenatedTreatmentNames];
    v114[1] = v72;
    v113[2] = *MEMORY[0x1E4F89D88];
    v73 = [NSNumber numberWithUnsignedInt:v54];
    v114[2] = v73;
    v113[3] = *MEMORY[0x1E4F89D70];
    v74 = [NSNumber numberWithUnsignedInt:v55];
    v114[3] = v74;
    v113[4] = *MEMORY[0x1E4F89D90];
    v75 = [NSNumber numberWithUnsignedInt:v92];
    v114[4] = v75;
    v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:5];

    v77 = [MEMORY[0x1E4F89D68] sharedInstance];
    [v77 logMessage:v76 messageName:*MEMORY[0x1E4F89D78]];

    goto LABEL_45;
  }
  id v89 = v14;
  id v15 = v12;
  id v16 = v13;
  self;
  objc_msgSend(v16, "_pas_stringBackedByUTF8CString");
  v91 = id v90 = v16;

  uint64_t v17 = [v15 count];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v109 objects:v126 count:16];
  v100 = v18;
  if (!v19)
  {
    uint64_t v44 = 0;
    unsigned int v103 = 0;
    uint64_t v22 = 0;
    v46 = v18;
LABEL_40:

    goto LABEL_44;
  }
  uint64_t v88 = v17;
  unsigned int v93 = v7;
  id v95 = v11;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  id v23 = *(void **)v110;
  uint64_t v24 = v19;
  context = *(void **)v110;
  do
  {
    uint64_t v25 = 0;
    uint64_t v102 = v24;
    do
    {
      v26 = v22;
      if (*(void **)v110 != v23) {
        objc_enumerationMutation(v18);
      }
      id v27 = *(void **)(*((void *)&v109 + 1) + 8 * v25);
      if (v26)
      {
        v28 = [*(id *)(*((void *)&v109 + 1) + 8 * v25) itemString];
        if ([v28 isEqualToString:v26])
        {
          int v29 = [v27 itemFeedbackType];

          if (v29 == 2)
          {
            uint64_t v21 = (v21 + 1);
            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      else if ((unint64_t)[v18 count] >= 2)
      {
        uint64_t v30 = v20;
        uint64_t v31 = v21;
        v32 = [v18 firstObject];
        v33 = [v32 itemString];
        v34 = [v18 objectAtIndexedSubscript:1];
        id v35 = [v34 itemString];
        int v36 = [v33 isEqual:v35];

        if (v36)
        {
          uint64_t v21 = (v31 + 1);
          id v18 = v100;
          uint64_t v20 = v30;
        }
        else
        {
          uint64_t v20 = (v30 + 1);
          id v18 = v100;
          uint64_t v21 = v31;
        }
        id v23 = context;
        uint64_t v24 = v102;
        goto LABEL_20;
      }
      if ([v27 itemFeedbackType] == 2
        || [v27 itemFeedbackType] == 1)
      {
        uint64_t v20 = (v20 + 1);
      }
LABEL_20:
      uint64_t v22 = [v27 itemString];

      ++v25;
    }
    while (v24 != v25);
    uint64_t v24 = [v18 countByEnumeratingWithState:&v109 objects:v126 count:16];
  }
  while (v24);

  if (v21)
  {
    long long v37 = (void *)MEMORY[0x1CB79D060]();
    v124[0] = @"clientId";
    v124[1] = @"bundleId";
    v125[0] = @"ICLex";
    v125[1] = v91;
    v124[2] = @"domain";
    long long v38 = +[PPMetricsUtils stringifyDomain:v93];
    v125[2] = v38;
    v124[3] = @"eventCount";
    long long v39 = [NSNumber numberWithUnsignedInt:v21];
    v125[3] = v39;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:4];
    v41 = uint64_t v40 = v20;

    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.FrustrationEvent" payload:v41 inBackground:1];

    uint64_t v20 = v40;
  }
  unsigned int v103 = v21;
  id v11 = v95;
  uint64_t v17 = v88;
  if (v20)
  {
    id v42 = (void *)MEMORY[0x1CB79D060]();
    v122[0] = @"clientId";
    v122[1] = @"bundleId";
    v123[0] = @"ICLex";
    v123[1] = v91;
    v122[2] = @"domain";
    id v43 = +[PPMetricsUtils stringifyDomain:v93];
    v123[2] = v43;
    v122[3] = @"eventCount";
    uint64_t v44 = v20;
    uint64_t v45 = [NSNumber numberWithUnsignedInt:v20];
    v123[3] = v45;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:4];

    +[PPMetricsDispatcher logPayloadForEvent:@"com.apple.proactive.PersonalizationPortrait.PositivePersonalizationEvent" payload:v46 inBackground:1];
    goto LABEL_40;
  }
  uint64_t v44 = 0;
LABEL_44:
  contextb = (void *)MEMORY[0x1CB79D060]();
  v120[0] = *MEMORY[0x1E4F89D80];
  id v78 = [NSString alloc];
  v79 = +[PPMetricsUtils stringifyDomain:1];
  v80 = (void *)[v78 initWithFormat:@"%@%@", @"Portrait", v79];
  v121[0] = v80;
  v120[1] = *MEMORY[0x1E4F89D98];
  v81 = +[PPTrialWrapper sharedInstance];
  v82 = [v81 concatenatedTreatmentNames];
  v121[1] = v82;
  v120[2] = *MEMORY[0x1E4F89D90];
  v83 = [NSNumber numberWithUnsignedInt:v17];
  v121[2] = v83;
  v120[3] = *MEMORY[0x1E4F89D70];
  v84 = [NSNumber numberWithUnsignedInt:v44];
  v121[3] = v84;
  v120[4] = *MEMORY[0x1E4F89D88];
  v85 = [NSNumber numberWithUnsignedInt:v103];
  v121[4] = v85;
  v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:5];

  v87 = [MEMORY[0x1E4F89D68] sharedInstance];
  [v87 logMessage:v86 messageName:*MEMORY[0x1E4F89D78]];

  v60 = v89;
  v47 = v90;
LABEL_45:
}

+ (id)scoredItemWithFeaturesForFeatureDictionary:(id)a3 score:(float)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", @"score", (void)v18))
        {
          id v13 = [v7 objectForKeyedSubscript:v12];
          [v13 floatValue];
          a4 = v14;
        }
        else
        {
          id v13 = objc_opt_new();
          [v13 setFeatureId:v12];
          id v15 = [v7 objectForKeyedSubscript:v12];
          [v15 floatValue];
          objc_msgSend(v13, "setValue:");

          [v6 addFeatures:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  *(float *)&double v16 = a4;
  [v6 setScore:v16];

  return v6;
}

+ (id)feedbackMetadataForBaseFeedback:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 clientBundleId];
  [v4 setClientBundleId:v5];

  uint64_t v6 = [v3 clientIdentifier];
  [v4 setClientIdentifier:v6];

  uint64_t v7 = [v3 isMapped];
  [v4 setIsMapped:v7];
  return v4;
}

+ (id)feedbackItemForPPFeedbackItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setFeedbackType:0];
  uint64_t v5 = [v3 itemFeedbackType];

  if (v5 <= 5) {
    [v4 setFeedbackType:v5];
  }
  return v4;
}

+ (void)addBoilerplateToFeedbackLog:(id)a3
{
  id v19 = a3;
  id v3 = objc_opt_new();
  id v4 = +[PPTrialWrapper sharedInstance];
  uint64_t v5 = [v4 concatenatedTreatmentNames];
  [v3 setAbGroupIdentifier:v5];

  [v19 addExperimentalGroups:v3];
  uint64_t v6 = +[PPConfiguration sharedInstance];
  int v7 = [v6 feedbackSessionLogsGeohashLength];

  if (v7 >= 1)
  {
    uint64_t v8 = +[PPSettings sharedInstance];
    int v9 = [v8 isAuthorizedToLogLocation];

    if (v9)
    {
      uint64_t v10 = +[PPRoutineSupport fetchLocationOfInterestByType:0];
      id v11 = v10;
      if (v10)
      {
        id v12 = (void *)MEMORY[0x1E4F89FC8];
        id v13 = [v10 location];
        [v13 latitude];
        double v15 = v14;
        double v16 = [v11 location];
        [v16 longitude];
        long long v18 = [v12 coordinatesToGeoHashWithLength:v7 latitude:v15 longitude:v17];
        [v19 setHomeLocationGeohash:v18];
      }
    }
  }
}

+ (BOOL)shouldSampleExtraction:(id)a3
{
  if (![MEMORY[0x1E4F89FC8] isFirstPartyApp:a3]) {
    return 0;
  }
  id v3 = +[PPConfiguration sharedInstance];
  [v3 feedbackSessionLogsExtractionsSamplingRate];
  double v5 = v4;
  self;
  BOOL v6 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < v5;

  return v6;
}

+ (BOOL)shouldSample:(id)a3
{
  id v3 = a3;
  float v4 = +[PPConfiguration sharedInstance];
  double v5 = [v4 feedbackSessionLogsSamplingRateOverrides];

  BOOL v6 = [v5 allKeys];
  int v7 = [v6 containsObject:v3];

  if (v7)
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:v3];
    [v8 doubleValue];
    double v10 = v9;
    self;
    BOOL v11 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < v10;
  }
  else
  {
    id v12 = +[PPConfiguration sharedInstance];
    [v12 feedbackSessionLogsSamplingRate];
    double v14 = v13;

    self;
    BOOL v11 = (double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0 < v14;
  }

  return v11;
}

+ (id)feedbackItemsByItemString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  float v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        BOOL v11 = (void *)MEMORY[0x1CB79D060](v6);
        id v12 = objc_msgSend(v10, "itemString", (void)v17);
        float v13 = [v4 objectForKeyedSubscript:v12];

        if (!v13)
        {
          double v14 = objc_opt_new();
          [v4 setObject:v14 forKeyedSubscript:v12];
        }
        double v15 = [v4 objectForKeyedSubscript:v12];
        [v15 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }

  return v4;
}

@end