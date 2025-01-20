@interface _PSInteractionPredictor
+ (BOOL)cloneAdaptableModelURL:(id)a3 toFilePathURL:(id)a4;
+ (BOOL)removeMlmodelcFolderAtPath:(id)a3;
+ (id)clustersArchiveFileForDate:(id)a3 modelName:(id)a4;
+ (id)defaultClustersArchiveDirectory;
+ (id)getIntermediateModelURLForModelName:(id)a3;
+ (id)getModelURLfromName:(id)a3;
+ (id)loadModelFromUrl:(id)a3;
+ (void)deleteArchiveFileAtDate:(id)a3 modelName:(id)a4;
+ (void)deleteArchiveFiles;
- (NSDate)currentArchiveDate;
- (NSDictionary)currentClusterDictionary;
- (NSMutableDictionary)conversationIDMap;
- (NSURL)compiledModelURL;
- (_CDInteractionStore)interactionStore;
- (_PSInteractionPredictor)initWithInteractionStore:(id)a3 atDate:(id)a4 withModelName:(id)a5 modelConfiguration:(id)a6;
- (_PSKNNModelConfiguration)modelConfiguration;
- (double)getMinDistanceForPt:(id)a3 toClusters:(id)a4;
- (double)timeSinceLastContactTo:(id)a3 FromDate:(id)a4 inTrainArray:(id)a5;
- (id)convertLogToClusterPointArray:(id)a3;
- (id)createMLArrayProviderFromTrainArray:(id)a3;
- (id)findLatestArchiveDateBefore:(id)a3 modelName:(id)a4;
- (id)getClusterDictionaryFromTrainArray:(id)a3 usingDBSCANParamsMinPts:(int)a4 andEps:(double)a5;
- (id)getClusteringResultsForPoint:(id)a3 usingClusterDictionary:(id)a4;
- (id)getConversationIDFromInteraction:(id)a3;
- (id)getConversationIDLogFromTrainArray:(id)a3;
- (id)getDateNumDays:(int)a3 AfterDate:(id)a4;
- (id)getDictionaryFromClustersArchiveAtPath:(id)a3;
- (id)getLastContactedDictionaryFromTrainArray:(id)a3;
- (id)getOrMakeClusterDictionaryAtDate:(id)a3;
- (id)getRecencyResultsShowingNumValues:(int)a3 fromTrainArray:(id)a4;
- (id)getTrainArrayToDate:(id)a3 withStartDateAnchor:(id)a4;
- (id)predictAtDate:(id)a3 usingModelAtURL:(id)a4 showNumSuggestions:(int)a5;
- (id)rankedZkwSuggestionsFromPredictionArray:(id)a3 forBundleID:(id)a4;
- (void)printModelWeights:(id)a3;
- (void)setCompiledModelURL:(id)a3;
- (void)setConversationIDMap:(id)a3;
- (void)setCurrentArchiveDate:(id)a3;
- (void)setCurrentClusterDictionary:(id)a3;
- (void)setInteractionStore:(id)a3;
- (void)setModelConfiguration:(id)a3;
- (void)trainAtDate:(id)a3 usingCompiledModelURL:(id)a4 andSaveToURL:(id)a5;
- (void)writeArchive:(id)a3 toFilePath:(id)a4;
- (void)writeClusterArchiveFromClusterDict:(id)a3 withDate:(id)a4;
@end

@implementation _PSInteractionPredictor

+ (id)defaultClustersArchiveDirectory
{
  v2 = [MEMORY[0x1E4F5B420] modelDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"InteractionModelClusters/"];

  return v3;
}

+ (id)clustersArchiveFileForDate:(id)a3 modelName:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F28C10];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setDateFormat:@"MM-dd-yyyy"];
  v9 = [v8 stringFromDate:v7];

  if (v9)
  {
    v10 = [MEMORY[0x1E4F28E78] stringWithString:v9];
    v11 = v10;
    if (v5)
    {
      [v10 appendString:@"_"];
      [v11 appendString:v5];
    }
    [v11 appendString:@".archive"];
    v12 = +[_PSInteractionPredictor defaultClustersArchiveDirectory];
    v13 = [v12 stringByAppendingPathComponent:v11];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)getModelURLfromName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"mlmodelc"];

  return v6;
}

+ (id)getIntermediateModelURLForModelName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [@"/var/tmp/" stringByAppendingString:a3];
  id v5 = [v4 stringByAppendingString:@".mlmodelc/"];
  v6 = [v3 fileURLWithPath:v5];

  return v6;
}

+ (id)loadModelFromUrl:(id)a3
{
  id v3 = a3;
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[_PSInteractionPredictor loadModelFromUrl:](v3, v4);
  }

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v5 = (void *)getMLModelClass_softClass;
  uint64_t v18 = getMLModelClass_softClass;
  if (!getMLModelClass_softClass)
  {
    v13[1] = (id)MEMORY[0x1E4F143A8];
    v13[2] = (id)3221225472;
    v13[3] = __getMLModelClass_block_invoke;
    v13[4] = &unk_1E5ADE858;
    v14 = &v15;
    CoreMLLibraryCore();
    v16[3] = (uint64_t)objc_getClass("MLModel");
    getMLModelClass_softClass = *(void *)(v14[1] + 24);
    id v5 = (void *)v16[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v15, 8);
  v13[0] = 0;
  id v7 = [v6 modelWithContentsOfURL:v3 error:v13];
  id v8 = v13[0];
  v9 = +[_PSLogging generalChannel];
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionPredictor loadModelFromUrl:v10];
    }

    id v11 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      +[_PSInteractionPredictor loadModelFromUrl:]();
    }

    id v11 = v7;
  }

  return v11;
}

- (id)getConversationIDFromInteraction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  id v6 = [v4 bundleId];
  id v7 = +[_PSConstants mobileFacetimeBundleId];
  if ([v6 isEqualToString:v7])
  {

    goto LABEL_5;
  }
  id v8 = [v5 bundleId];
  v9 = +[_PSConstants macFacetimeBundleId];
  int v10 = [v8 isEqualToString:v9];

  if (!v10)
  {
    uint64_t v17 = [v5 bundleId];
    uint64_t v18 = +[_PSConstants mobileMessagesBundleId];
    if ([v17 isEqualToString:v18])
    {

      goto LABEL_11;
    }
    v19 = [v5 bundleId];
    v20 = +[_PSConstants macMessagesBundleId];
    int v21 = [v19 isEqualToString:v20];

    if (v21)
    {
LABEL_11:
      v13 = [v5 domainIdentifier];
      if (!v13) {
        goto LABEL_15;
      }
      goto LABEL_6;
    }
    v22 = [v5 bundleId];
    v23 = +[_PSConstants mobilePhoneBundleId];
    int v24 = [v22 isEqualToString:v23];

    if (v24) {
      goto LABEL_5;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
LABEL_5:
  id v11 = (void *)MEMORY[0x1E4F5B3D8];
  v12 = [v5 recipients];
  v13 = [v11 generateConversationIdFromInteractionRecipients:v12];

  if (!v13) {
    goto LABEL_15;
  }
LABEL_6:
  v14 = [(_PSInteractionPredictor *)self conversationIDMap];
  uint64_t v15 = [v14 objectForKeyedSubscript:v13];

  if (!v15)
  {
    v16 = [(_PSInteractionPredictor *)self conversationIDMap];
    [v16 setObject:v5 forKeyedSubscript:v13];
  }
LABEL_15:

  return v13;
}

- (id)findLatestArchiveDateBefore:(id)a3 modelName:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = +[_PSInteractionPredictor defaultClustersArchiveDirectory];
  v9 = [v7 enumeratorAtPath:v8];

  int v10 = [MEMORY[0x1E4F28E78] stringWithString:@"MM-dd-yyyy"];
  id v11 = v10;
  if (v6)
  {
    [v10 appendString:@"_"];
    [v11 appendString:v6];
  }
  objc_msgSend(v11, "appendString:", @".archive", v6);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = 0;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        unint64_t v18 = [v17 length];
        unint64_t v19 = [v11 length];
        if (v18 >= v19)
        {
          int v21 = @"_";
        }
        else
        {
          v20 = [MEMORY[0x1E4F28E78] stringWithString:@"MM-dd-yyyy.archive"];

          unint64_t v19 = [v20 length];
          int v21 = @".";
          id v11 = v20;
        }
        v22 = [v17 substringFromIndex:v18 - v19];
        v23 = [v22 componentsSeparatedByString:v21];
        int v24 = [v23 objectAtIndex:0];

        id v25 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        [v25 setDateFormat:@"MM-dd-yyyy"];
        v26 = [v25 dateFromString:v24];
        [v5 timeIntervalSinceDate:v26];
        if (v27 >= 0.0)
        {
          if (v14)
          {
            [v14 timeIntervalSinceDate:v26];
            if (v28 < 0.0)
            {
              id v29 = v26;

              id v14 = v29;
            }
          }
          else
          {
            id v14 = v26;
          }
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (_PSInteractionPredictor)initWithInteractionStore:(id)a3 atDate:(id)a4 withModelName:(id)a5 modelConfiguration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_PSInteractionPredictor;
  uint64_t v15 = [(_PSInteractionPredictor *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_interactionStore, a3);
    objc_storeStrong((id *)&v16->_modelConfiguration, a6);
    uint64_t v17 = [(_PSKNNModelConfiguration *)v16->_modelConfiguration modelName];
    unint64_t v18 = [(_PSInteractionPredictor *)v16 findLatestArchiveDateBefore:v12 modelName:v17];

    if (v18) {
      id v19 = v18;
    }
    else {
      id v19 = v12;
    }
    uint64_t v20 = [(_PSInteractionPredictor *)v16 getOrMakeClusterDictionaryAtDate:v19];
    currentClusterDictionary = v16->_currentClusterDictionary;
    v16->_currentClusterDictionary = (NSDictionary *)v20;

    uint64_t v22 = +[_PSInteractionPredictor getModelURLfromName:v13];
    compiledModelURL = v16->_compiledModelURL;
    v16->_compiledModelURL = (NSURL *)v22;

    int v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    conversationIDMap = v16->_conversationIDMap;
    v16->_conversationIDMap = v24;
  }
  return v16;
}

- (id)getDateNumDays:(int)a3 AfterDate:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  [v7 setDay:a3];
  id v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [v8 dateByAddingComponents:v7 toDate:v6 options:0];

  return v9;
}

- (id)getTrainArrayToDate:(id)a3 withStartDateAnchor:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v40 = a4;
  id v6 = objc_opt_new();
  id v7 = [(_PSInteractionPredictor *)self modelConfiguration];
  id v8 = [v7 shouldExcludeInteractionBlock];

  v9 = [(_PSInteractionPredictor *)self modelConfiguration];
  int v10 = [v9 interactionMechanisms];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = MEMORY[0x1A6243860]();
      id v14 = [(_PSInteractionPredictor *)self modelConfiguration];
      uint64_t v15 = [v14 interactionHistoryRelativeStartDates];
      v16 = [v15 objectAtIndexedSubscript:v12];
      uint64_t v17 = [v16 intValue];

      context = (void *)v13;
      if (v17)
      {
        v52 = [(_PSInteractionPredictor *)self getDateNumDays:v17 AfterDate:v40];
      }
      else
      {
        v52 = 0;
      }
      v44 = [(_PSInteractionPredictor *)self interactionStore];
      v49 = [(_PSInteractionPredictor *)self modelConfiguration];
      v48 = [v49 interactionMechanisms];
      v43 = [v48 objectAtIndexedSubscript:v12];
      v47 = [(_PSInteractionPredictor *)self modelConfiguration];
      v45 = [v47 bundleIds];
      unint64_t v18 = [v45 objectAtIndexedSubscript:v12];
      v42 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF675E10];
      id v19 = [(_PSInteractionPredictor *)self modelConfiguration];
      uint64_t v20 = [v19 interactionCountMaxDepths];
      uint64_t v51 = v12;
      int v21 = [v20 objectAtIndexedSubscript:v12];
      LOBYTE(v39) = 0;
      v46 = +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v44, v52, v41, v43, 0, v18, 0, v42, v39, (int)[v21 intValue]);

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v22 = v46;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v60 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            if (v8 && v8[2](v8, *(void *)(*((void *)&v53 + 1) + 8 * i)))
            {
              double v28 = +[_PSLogging generalChannel];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v59 = v27;
              }
            }
            else
            {
              double v28 = [(_PSInteractionPredictor *)self getConversationIDFromInteraction:v27];
              if (v28) {
                [v6 addObject:v27];
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v60 count:16];
        }
        while (v24);
      }

      uint64_t v12 = v51 + 1;
      id v29 = [(_PSInteractionPredictor *)self modelConfiguration];
      v30 = [v29 interactionMechanisms];
      unint64_t v31 = [v30 count];
    }
    while (v31 > v51 + 1);
  }
  v32 = [(_PSInteractionPredictor *)self modelConfiguration];
  long long v33 = [v32 interactionMechanisms];
  unint64_t v34 = [v33 count];

  if (v34 <= 1)
  {
    id v37 = v6;
  }
  else
  {
    long long v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v57 = v35;
    long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    id v37 = [v6 sortedArrayUsingDescriptors:v36];
  }

  return v37;
}

- (id)getConversationIDLogFromTrainArray:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = [(_PSInteractionPredictor *)self getConversationIDFromInteraction:v11];
        if (v12)
        {
          uint64_t v13 = [v11 startDate];
          id v14 = [v5 objectForKey:v12];

          if (v14)
          {
            uint64_t v15 = [v5 objectForKeyedSubscript:v12];
            [v15 addObject:v13];
          }
          else
          {
            uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithObject:v13];
            [v5 setValue:v15 forKey:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v8);
  }

  v16 = [v5 allKeys];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __62___PSInteractionPredictor_getConversationIDLogFromTrainArray___block_invoke;
  v26[3] = &unk_1E5ADE7A0;
  id v17 = v5;
  id v27 = v17;
  unint64_t v18 = [v16 sortedArrayUsingComparator:v26];
  id v19 = objc_opt_new();
  if ([v18 count])
  {
    unint64_t v20 = 0;
    do
    {
      int v21 = [v18 objectAtIndexedSubscript:v20];
      id v22 = [v17 objectForKeyedSubscript:v21];
      uint64_t v23 = [v18 objectAtIndexedSubscript:v20];
      [v19 setValue:v22 forKey:v23];

      unint64_t v24 = [v18 count];
      if (v20 > 3) {
        break;
      }
      ++v20;
    }
    while (v24 > v20);
  }

  return v19;
}

- (id)convertLogToClusterPointArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [_PSClusterPoint alloc];
        uint64_t v12 = -[_PSClusterPoint initWithDate:](v11, "initWithDate:", v10, (void)v16);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v13 = [v4 allObjects];
  id v14 = (void *)[v13 mutableCopy];

  return v14;
}

- (id)getClusterDictionaryFromTrainArray:(id)a3 usingDBSCANParamsMinPts:(int)a4 andEps:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(_PSInteractionPredictor *)self getConversationIDLogFromTrainArray:a3];
  uint64_t v9 = [[_PSDBSCAN alloc] initWithMinimumPointsForClustering:a4 MaxNeighborDistance:a5];
  uint64_t v10 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        [(_PSDBSCAN *)v9 emptyCollections];
        long long v17 = [v11 objectForKeyedSubscript:v16];
        long long v18 = [(_PSInteractionPredictor *)self convertLogToClusterPointArray:v17];
        [(_PSDBSCAN *)v9 fitData:v18];

        long long v19 = [(_PSDBSCAN *)v9 clusters];
        unint64_t v20 = (void *)[v19 copy];
        [v10 setValue:v20 forKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  return v10;
}

- (double)getMinDistanceForPt:(id)a3 toClusters:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = 14.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) convexHull];
        [v5 distanceToHull:v12];
        double v14 = v13;

        if (v14 < v10) {
          double v10 = v14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 14.0;
  }

  return v10;
}

- (double)timeSinceLastContactTo:(id)a3 FromDate:(id)a4 inTrainArray:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = a5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  double v12 = 4320.0;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v17 = -[_PSInteractionPredictor getConversationIDFromInteraction:](self, "getConversationIDFromInteraction:", v16, (void)v24);
        char v18 = [v17 isEqualToString:v8];

        if (v18)
        {
          long long v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          unint64_t v20 = [v16 startDate];
          uint64_t v21 = [v19 components:192 fromDate:v20 toDate:v9 options:0];

          double v22 = (double)[v21 minute];
          double v12 = (double)[v21 second] / 60.0 + v22;

          goto LABEL_11;
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)getLastContactedDictionaryFromTrainArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 count];
  if (v6 - 1 >= 0)
  {
    uint64_t v7 = v6;
    do
    {
      id v8 = [v4 objectAtIndexedSubscript:--v7];
      id v9 = [(_PSInteractionPredictor *)self getConversationIDFromInteraction:v8];

      if (v9)
      {
        id v10 = [v4 objectAtIndexedSubscript:v7];
        uint64_t v11 = [v10 startDate];

        [v5 setObject:v11 forKeyedSubscript:v9];
      }
    }
    while (v7 > 0);
  }

  return v5;
}

- (void)writeArchive:(id)a3 toFilePath:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 && v5)
  {
    id v16 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v16];
    id v8 = v16;
    if (v8)
    {
      id v9 = v8;
      id v10 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_PSInteractionPredictor writeArchive:toFilePath:]();
      }
    }
    else
    {
      id v10 = [v6 stringByDeletingLastPathComponent];
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = 0;
      [v11 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v9 = v15;

      if (v9)
      {
        double v12 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[_PSInteractionPredictor writeArchive:toFilePath:]();
        }
      }
      else
      {
        id v14 = 0;
        [v7 writeToFile:v6 options:1 error:&v14];
        id v9 = v14;
        uint64_t v13 = +[_PSLogging generalChannel];
        double v12 = v13;
        if (v9)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[_PSInteractionPredictor writeArchive:toFilePath:]();
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            char v18 = v6;
            _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "Successfully persisted dictionary: %@", buf, 0xCu);
          }
          id v9 = 0;
        }
      }
    }
  }
  else
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Empty archive or filePath when trying to persist Cluster Dictionary", buf, 2u);
    }
  }
}

- (void)writeClusterArchiveFromClusterDict:(id)a3 withDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = [[_PSClustersArchive alloc] initWithClustersDictionary:v7 archiveDate:v6];

  id v8 = [(_PSInteractionPredictor *)self modelConfiguration];
  id v9 = [v8 modelName];
  id v10 = +[_PSInteractionPredictor clustersArchiveFileForDate:v6 modelName:v9];

  [(_PSInteractionPredictor *)self writeArchive:v11 toFilePath:v10];
}

- (id)getDictionaryFromClustersArchiveAtPath:(id)a3
{
  id v13 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:a3 options:2 error:&v13];
  id v5 = v13;
  if (v5)
  {
    id v6 = v5;
    id v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_PSInteractionPredictor getDictionaryFromClustersArchiveAtPath:]();
    }
LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v12];
  id v6 = v12;
  if (v6)
  {
    id v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSInteractionPredictor getDictionaryFromClustersArchiveAtPath:]();
    }

    goto LABEL_8;
  }
  uint64_t v11 = [v7 archiveDate];
  [(_PSInteractionPredictor *)self setCurrentArchiveDate:v11];

  id v9 = [v7 clustersDictionary];
LABEL_9:

  return v9;
}

- (id)getOrMakeClusterDictionaryAtDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSInteractionPredictor *)self modelConfiguration];
  id v6 = [v5 modelName];
  id v7 = +[_PSInteractionPredictor clustersArchiveFileForDate:v4 modelName:v6];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  LODWORD(v6) = [v8 fileExistsAtPath:v7];

  if (v6)
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "DBSCAN cluster dictionary read from archive", buf, 2u);
    }

    id v10 = [(_PSInteractionPredictor *)self getDictionaryFromClustersArchiveAtPath:v7];
  }
  else
  {
    uint64_t v11 = [(_PSInteractionPredictor *)self getTrainArrayToDate:v4 withStartDateAnchor:v4];
    id v10 = [(_PSInteractionPredictor *)self getClusterDictionaryFromTrainArray:v11 usingDBSCANParamsMinPts:3 andEps:1.2];
    [(_PSInteractionPredictor *)self writeClusterArchiveFromClusterDict:v10 withDate:v4];
    [(_PSInteractionPredictor *)self setCurrentArchiveDate:v4];
    id v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "DBSCAN cluster dictionary is generated", v14, 2u);
    }
  }

  return v10;
}

- (id)getRecencyResultsShowingNumValues:(int)a3 fromTrainArray:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  if (a3 >= 1)
  {
    int v8 = 0;
    while (1)
    {
      if ([v6 count] <= (unint64_t)v8) {
        goto LABEL_10;
      }
      id v9 = [v6 objectAtIndexedSubscript:v8];
      id v10 = [(_PSInteractionPredictor *)self getConversationIDFromInteraction:v9];
      if (!v10) {
        goto LABEL_8;
      }
      if (![v7 containsObject:v10]) {
        break;
      }
      ++v8;
LABEL_9:

      if (a3 <= 0) {
        goto LABEL_10;
      }
    }
    [v7 addObject:v10];
LABEL_8:
    --a3;
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (id)getClusteringResultsForPoint:(id)a3 usingClusterDictionary:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v23 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v11 = [[_PSAlter alloc] initWithName:v10];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v12 = [v8 objectForKeyedSubscript:v10];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v25 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "convexHull", v22);
              [v5 distanceToHull:v17];
              double v19 = v18;

              [(_PSAlter *)v11 distanceToCluster];
              if (v20 > v19) {
                [(_PSAlter *)v11 setDistanceToCluster:v19];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v14);
        }

        [v7 addObject:v11];
      }
      uint64_t v23 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  [v7 sortUsingComparator:&__block_literal_global];

  return v7;
}

+ (BOOL)removeMlmodelcFolderAtPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v12 = 0;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v4 fileExistsAtPath:v3 isDirectory:&v12]) {
    BOOL v5 = v12 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v11 = 0;
    [v4 removeItemAtPath:v3 error:&v11];
    id v6 = v11;
    BOOL v7 = v6 == 0;
    id v8 = +[_PSLogging generalChannel];
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionPredictor removeMlmodelcFolderAtPath:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v3;
        _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_INFO, "Remove file succeeded at path:%@", buf, 0xCu);
      }
      id v6 = v9;
    }
  }
  return v7;
}

+ (BOOL)cloneAdaptableModelURL:(id)a3 toFilePathURL:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 path];
  BOOL v8 = +[_PSInteractionPredictor removeMlmodelcFolderAtPath:v7];

  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v15 = 0;
    char v10 = [v9 copyItemAtURL:v5 toURL:v6 error:&v15];
    id v11 = v15;
    if (v11) {
      char v10 = 0;
    }
    char v12 = +[_PSLogging generalChannel];
    uint64_t v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v17 = v5;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_INFO, "copying folder from path:%@ to path:%@ success.", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_error_impl(&dword_1A314B000, v13, OS_LOG_TYPE_ERROR, "While cloning adaptable model, copying folder from path:%@ to path:%@ failed with error：%@", buf, 0x20u);
    }
  }
  else
  {
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionPredictor cloneAdaptableModelURL:toFilePathURL:]();
    }
    char v10 = 0;
  }

  return v10;
}

- (id)createMLArrayProviderFromTrainArray:(id)a3
{
  id v4 = a3;
  v62 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [v4 count];
  if (v5 - 1 >= 0)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    BOOL v8 = 0;
    v73 = 0;
    v74 = 0;
    v75 = 0;
    uint64_t v63 = 0;
    uint64_t v61 = v79;
    id v64 = v4;
    while (1)
    {
      uint64_t v9 = v6 - 1;
      char v10 = objc_msgSend(v4, "objectAtIndexedSubscript:", v6 - 1, v61);
      id v11 = [(_PSInteractionPredictor *)self getConversationIDFromInteraction:v10];
      if (v11) {
        break;
      }
LABEL_41:

      uint64_t v6 = v9;
      if (v9 <= 0) {
        goto LABEL_44;
      }
    }
    uint64_t v76 = v6 - 1;
    char v12 = [v10 startDate];
    uint64_t v13 = [v12 dateByAddingTimeInterval:-1.0];
    uint64_t v14 = [(_PSInteractionPredictor *)self getTrainArrayToDate:v13 withStartDateAnchor:v12];

    v77 = (void *)v14;
    if (v6 == [v4 count])
    {
      uint64_t v71 = [(_PSInteractionPredictor *)self getLastContactedDictionaryFromTrainArray:v14];

      id v15 = [(_PSInteractionPredictor *)self modelConfiguration];
      id v16 = [v15 modelName];
      uint64_t v17 = [(_PSInteractionPredictor *)self findLatestArchiveDateBefore:v12 modelName:v16];

      if (v17) {
        __int16 v18 = (void *)v17;
      }
      else {
        __int16 v18 = v12;
      }
      uint64_t v19 = [(_PSInteractionPredictor *)self getOrMakeClusterDictionaryAtDate:v18];

      __int16 v20 = [v12 dateByAddingTimeInterval:86400.0];
      id v21 = [(_PSInteractionPredictor *)self modelConfiguration];
      uint64_t v22 = [v21 modelName];
      uint64_t v23 = [(_PSInteractionPredictor *)self findLatestArchiveDateBefore:v20 modelName:v22];

      id v4 = v64;
      uint64_t v24 = [(_PSInteractionPredictor *)self getOrMakeClusterDictionaryAtDate:v23];

      v74 = (void *)v24;
      v75 = (void *)v23;
      v73 = (void *)v17;
      BOOL v8 = (void *)v19;
      BOOL v7 = (void *)v71;
    }
    if ([v10 direction] != 1)
    {
      [v7 setObject:v12 forKey:v11];
LABEL_40:

      uint64_t v9 = v76;
      goto LABEL_41;
    }
    v70 = [(_PSInteractionPredictor *)self getRecencyResultsShowingNumValues:5 fromTrainArray:v77];
    int v66 = [v70 containsObject:v11];
    [v12 timeIntervalSinceDate:v75];
    if (v25 >= 0.0)
    {
      long long v27 = [(_PSInteractionPredictor *)self currentArchiveDate];
      [v12 timeIntervalSinceDate:v27];
      double v29 = v28;

      if (v29 >= 0.0)
      {
        id v26 = [(_PSInteractionPredictor *)self currentClusterDictionary];
      }
      else
      {
        id v26 = v74;
      }
    }
    else
    {
      id v26 = v8;
    }
    long long v30 = v26;
    long long v31 = [v26 objectForKey:v11];

    v68 = v30;
    if (v31)
    {
      v32 = [[_PSClusterPoint alloc] initWithDate:v12];
      uint64_t v33 = [v30 objectForKeyedSubscript:v11];
      [(_PSInteractionPredictor *)self getMinDistanceForPt:v32 toClusters:v33];
      double v35 = v34;
    }
    else
    {
      double v35 = 14.0;
    }
    v72 = v8;
    long long v36 = [v7 objectForKey:v11];
    double v37 = 4320.0;
    if (v36)
    {
      uint64_t v38 = [v7 objectForKeyedSubscript:v11];
      [v12 timeIntervalSinceDate:v38];
      double v37 = v39 / 60.0;
    }
    v69 = v7;

    id v40 = objc_alloc((Class)getMLMultiArrayClass());
    v83[0] = 0;
    id v41 = (void *)[v40 initWithShape:&unk_1EF675E28 dataType:65600 error:v83];
    id v65 = v83[0];
    if (v65)
    {
      v42 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[_PSInteractionPredictor createMLArrayProviderFromTrainArray:](&v81, v82);
      }
    }
    v43 = [NSNumber numberWithDouble:v37];
    [v41 setObject:v43 atIndexedSubscript:0];

    v44 = [NSNumber numberWithDouble:v35];
    [v41 setObject:v44 atIndexedSubscript:1];

    v45 = [getMLFeatureValueClass() featureValueWithMultiArray:v41];
    if (v31) {
      char v46 = v66;
    }
    else {
      char v46 = 1;
    }
    if (v46)
    {
      v47 = v68;
      if (v66)
      {
        v48 = [getMLFeatureValueClass() featureValueWithString:@"recency"];
        LODWORD(v63) = v63 + 1;
        if (!v48) {
          goto LABEL_39;
        }
LABEL_33:
        v49 = objc_opt_new();
        v50 = v45;
        uint64_t v51 = v49;
        v67 = v50;
        objc_msgSend(v49, "setObject:forKey:");
        [v51 setObject:v48 forKey:@"classLabel"];
        id v52 = objc_alloc((Class)getMLDictionaryFeatureProviderClass());
        uint64_t v80 = 0;
        long long v53 = (void *)[v52 initWithDictionary:v51 error:&v80];
        if (v80)
        {
          long long v54 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            -[_PSInteractionPredictor createMLArrayProviderFromTrainArray:](&v78, v61);
          }
        }
        [v62 addObject:v53];

        id v4 = v64;
        v45 = v67;
        goto LABEL_39;
      }
      v48 = 0;
    }
    else
    {
      v48 = [getMLFeatureValueClass() featureValueWithString:@"clustering"];
      ++HIDWORD(v63);
      v47 = v68;
      if (v48) {
        goto LABEL_33;
      }
    }
LABEL_39:
    [v69 setObject:v12 forKey:v11];

    BOOL v7 = v69;
    BOOL v8 = v72;
    goto LABEL_40;
  }
  uint64_t v63 = 0;
  v74 = 0;
  v75 = 0;
  v73 = 0;
  BOOL v8 = 0;
  BOOL v7 = 0;
LABEL_44:
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2050000000;
  long long v55 = (void *)getMLArrayBatchProviderClass_softClass;
  uint64_t v88 = getMLArrayBatchProviderClass_softClass;
  if (!getMLArrayBatchProviderClass_softClass)
  {
    v83[1] = (id)MEMORY[0x1E4F143A8];
    v83[2] = (id)3221225472;
    v83[3] = __getMLArrayBatchProviderClass_block_invoke;
    v83[4] = &unk_1E5ADE858;
    v84 = &v85;
    CoreMLLibraryCore();
    Class Class = objc_getClass("MLArrayBatchProvider");
    *(void *)(v84[1] + 24) = Class;
    getMLArrayBatchProviderClass_softClass Class = *(void *)(v84[1] + 24);
    long long v55 = (void *)v86[3];
  }
  v57 = v55;
  _Block_object_dispose(&v85, 8);
  v58 = (void *)[[v57 alloc] initWithFeatureProviderArray:v62];
  uint64_t v59 = [[_PSMLArrayProvider alloc] initWithProvider:v58 clusteringCount:HIDWORD(v63) recencyCount:v63];

  return v59;
}

- (void)printModelWeights:(id)a3
{
  id v3 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v4 = (void *)getMLParameterKeyClass_softClass;
  uint64_t v17 = getMLParameterKeyClass_softClass;
  if (!getMLParameterKeyClass_softClass)
  {
    v12[1] = (id)MEMORY[0x1E4F143A8];
    v12[2] = (id)3221225472;
    v12[3] = __getMLParameterKeyClass_block_invoke;
    v12[4] = &unk_1E5ADE858;
    uint64_t v13 = &v14;
    CoreMLLibraryCore();
    v15[3] = (uint64_t)objc_getClass("MLParameterKey");
    getMLParameterKeyClass_softClass Class = *(void *)(v13[1] + 24);
    id v4 = (void *)v15[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v14, 8);
  uint64_t v6 = [v5 weights];
  BOOL v7 = [v6 scopedTo:@"dense_1"];

  v12[0] = 0;
  BOOL v8 = [v3 parameterValueForKey:v7 error:v12];
  id v9 = v12[0];
  char v10 = +[_PSLogging generalChannel];
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11) {
      -[_PSInteractionPredictor printModelWeights:]();
    }
  }
  else if (v11)
  {
    -[_PSInteractionPredictor printModelWeights:](v8);
  }
}

- (void)trainAtDate:(id)a3 usingCompiledModelURL:(id)a4 andSaveToURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  id v43 = 0;
  uint64_t v36 = 0;
  double v37 = &v36;
  uint64_t v38 = 0x3032000000;
  double v39 = __Block_byref_object_copy_;
  id v40 = __Block_byref_object_dispose_;
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
  BOOL v11 = [(_PSInteractionPredictor *)self getTrainArrayToDate:v8 withStartDateAnchor:v8];
  char v12 = [(_PSInteractionPredictor *)self getClusterDictionaryFromTrainArray:v11 usingDBSCANParamsMinPts:3 andEps:1.2];
  [(_PSInteractionPredictor *)self writeClusterArchiveFromClusterDict:v12 withDate:v8];

  uint64_t v13 = [(_PSInteractionPredictor *)self createMLArrayProviderFromTrainArray:v11];
  double v28 = [v13 MLArrayProvider];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke;
  v35[3] = &unk_1E5ADE7E8;
  v35[4] = self;
  uint64_t v14 = (void *)MEMORY[0x1A6243AD0](v35);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __74___PSInteractionPredictor_trainAtDate_usingCompiledModelURL_andSaveToURL___block_invoke_139;
  v30[3] = &unk_1E5ADE810;
  id v15 = v10;
  id v31 = v15;
  v32 = self;
  uint64_t v33 = v42;
  double v34 = &v36;
  uint64_t v16 = (void *)MEMORY[0x1A6243AD0](v30);
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  uint64_t v17 = (void *)getMLUpdateProgressHandlersClass_softClass;
  uint64_t v52 = getMLUpdateProgressHandlersClass_softClass;
  if (!getMLUpdateProgressHandlersClass_softClass)
  {
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    char v46 = __getMLUpdateProgressHandlersClass_block_invoke;
    v47 = &unk_1E5ADE858;
    v48 = &v49;
    CoreMLLibraryCore();
    Class Class = objc_getClass("MLUpdateProgressHandlers");
    *(void *)(v48[1] + 24) = Class;
    getMLUpdateProgressHandlersClass_softClass Class = *(void *)(v48[1] + 24);
    uint64_t v17 = (void *)v50[3];
  }
  uint64_t v19 = v17;
  _Block_object_dispose(&v49, 8);
  __int16 v20 = (void *)[[v19 alloc] initForEvents:3 progressHandler:v14 completionHandler:v16];
  if (v13 && (int)[v13 clusteringCount] >= 1 && (int)objc_msgSend(v13, "recencyCount") >= 1)
  {
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2050000000;
    id v21 = (void *)getMLUpdateTaskClass_softClass;
    uint64_t v52 = getMLUpdateTaskClass_softClass;
    if (!getMLUpdateTaskClass_softClass)
    {
      uint64_t v44 = MEMORY[0x1E4F143A8];
      uint64_t v45 = 3221225472;
      char v46 = __getMLUpdateTaskClass_block_invoke;
      v47 = &unk_1E5ADE858;
      v48 = &v49;
      CoreMLLibraryCore();
      Class v22 = objc_getClass("MLUpdateTask");
      *(void *)(v48[1] + 24) = v22;
      getMLUpdateTaskClass_softClass Class = *(void *)(v48[1] + 24);
      id v21 = (void *)v50[3];
    }
    id v23 = v21;
    _Block_object_dispose(&v49, 8);
    id v29 = 0;
    uint64_t v24 = [v23 updateTaskForModelAtURL:v9 trainingData:v28 progressHandlers:v20 error:&v29];
    id v25 = v29;
    if (v25)
    {
      id v27 = v9;
      id v26 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_PSInteractionPredictor trainAtDate:usingCompiledModelURL:andSaveToURL:]();
      }

      id v9 = v27;
    }
    [v24 resume];
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)v37[5]);
    id v25 = 0;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)v37[5], 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v42, 8);
}

- (id)predictAtDate:(id)a3 usingModelAtURL:(id)a4 showNumSuggestions:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  BOOL v11 = [MEMORY[0x1E4F1CA48] array];
  v86 = v8;
  char v12 = [(_PSInteractionPredictor *)self getTrainArrayToDate:v8 withStartDateAnchor:v8];
  uint64_t v13 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.6();
  }

  if ([v12 count])
  {
    uint64_t v85 = v12;
    uint64_t v14 = [(_PSInteractionPredictor *)self getRecencyResultsShowingNumValues:v5 fromTrainArray:v12];
    id v15 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.5();
    }

    uint64_t v16 = [(_PSInteractionPredictor *)self modelConfiguration];
    uint64_t v17 = [v16 modelType];

    if (v17 == 1)
    {
      id v18 = v14;
    }
    else
    {
      int v77 = v5;
      v89 = v14;
      id v79 = v9;
      uint64_t v19 = [[_PSClusterPoint alloc] initWithDate:v86];
      __int16 v20 = [(_PSInteractionPredictor *)self currentClusterDictionary];
      char v78 = v19;
      id v21 = [(_PSInteractionPredictor *)self getClusteringResultsForPoint:v19 usingClusterDictionary:v20];

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v109 objects:v122 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v110 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = *(void **)(*((void *)&v109 + 1) + 8 * i);
            double v28 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:].cold.4(v120, v27, &v121, v28);
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v109 objects:v122 count:16];
        }
        while (v24);
      }
      v84 = self;
      uint64_t v80 = v11;
      char v81 = v10;

      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id obj = v22;
      uint64_t v87 = [obj countByEnumeratingWithState:&v105 objects:v119 count:16];
      if (v87)
      {
        uint64_t v88 = 0;
        uint64_t v83 = *(void *)v106;
        id v29 = v85;
        long long v30 = &off_1E5ADE000;
        do
        {
          for (uint64_t j = 0; j != v87; ++j)
          {
            if (*(void *)v106 != v83) {
              objc_enumerationMutation(obj);
            }
            v32 = *(void **)(*((void *)&v105 + 1) + 8 * j);
            context = (void *)MEMORY[0x1A6243860]();
            id v33 = objc_alloc((Class)getMLMultiArrayClass());
            id v104 = 0;
            double v34 = (void *)[v33 initWithShape:&unk_1EF675E40 dataType:65600 error:&v104];
            id v35 = v104;
            if (v35)
            {
              uint64_t v36 = [v30[172] generalChannel];
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:](&v102, v103);
              }
            }
            double v37 = [v89 objectAtIndexedSubscript:0];
            [(_PSInteractionPredictor *)v84 timeSinceLastContactTo:v37 FromDate:v86 inTrainArray:v29];
            double v39 = v38;

            [v32 setTimeSinceLastContact:v39];
            id v40 = [v30[172] generalChannel];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              long long v55 = [NSNumber numberWithDouble:v39];
              long long v56 = [v32 name];
              *(_DWORD *)buf = 138412546;
              v116 = v55;
              __int16 v117 = 2112;
              v118 = v56;
              _os_log_debug_impl(&dword_1A314B000, v40, OS_LOG_TYPE_DEBUG, "Feature to LR: timeSinceContact: %@ for alter %@", buf, 0x16u);

              long long v30 = &off_1E5ADE000;
            }

            dispatch_semaphore_t v41 = [v30[172] generalChannel];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              v57 = NSNumber;
              [v32 distanceToCluster];
              v58 = objc_msgSend(v57, "numberWithDouble:");
              uint64_t v59 = [v32 name];
              *(_DWORD *)buf = 138412546;
              v116 = v58;
              __int16 v117 = 2112;
              v118 = v59;
              _os_log_debug_impl(&dword_1A314B000, v41, OS_LOG_TYPE_DEBUG, "Feature to LR: distanceToCluster: %@ for alter %@", buf, 0x16u);

              long long v30 = &off_1E5ADE000;
            }

            v42 = [NSNumber numberWithDouble:v39];
            [v34 setObject:v42 atIndexedSubscript:0];

            id v43 = NSNumber;
            [v32 distanceToCluster];
            uint64_t v44 = objc_msgSend(v43, "numberWithDouble:");
            [v34 setObject:v44 atIndexedSubscript:1];

            uint64_t v45 = [getMLFeatureValueClass() featureValueWithMultiArray:v34];
            char v46 = objc_opt_new();
            [v46 setObject:v45 forKey:@"input1"];
            id v47 = objc_alloc((Class)getMLDictionaryFeatureProviderClass());
            id v101 = 0;
            v48 = (void *)[v47 initWithDictionary:v46 error:&v101];
            id v49 = v101;
            if (v49)
            {
              v50 = [v30[172] generalChannel];
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
                -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:](&v99, v100);
              }

              long long v30 = &off_1E5ADE000;
            }
            [v32 distanceToCluster];
            if (v51 >= 12.0)
            {
              long long v53 = [v32 name];
              int v54 = [v89 containsObject:v53];

              if (v54)
              {
                [v80 addObject:v32];
                ++v88;
              }
              id v29 = v85;
              long long v30 = &off_1E5ADE000;
            }
            else
            {
              if (v88 < v77 - 1)
              {
                uint64_t v52 = [v32 name];
                [v81 addObject:v52];

                ++v88;
              }
              id v29 = v85;
            }
          }
          uint64_t v87 = [obj countByEnumeratingWithState:&v105 objects:v119 count:16];
        }
        while (v87);
      }
      else
      {
        uint64_t v88 = 0;
      }

      v60 = [(_PSInteractionPredictor *)v84 modelConfiguration];
      uint64_t v61 = [v60 modelType];

      BOOL v11 = v80;
      id v10 = v81;
      uint64_t v14 = v89;
      if (v61 != 2)
      {
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v62 = v89;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v95 objects:v114 count:16];
        uint64_t v64 = v88;
        if (v63)
        {
          uint64_t v65 = v63;
          uint64_t v66 = *(void *)v96;
          do
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v96 != v66) {
                objc_enumerationMutation(v62);
              }
              uint64_t v68 = *(void *)(*((void *)&v95 + 1) + 8 * k);
              if (([v81 containsObject:v68] & 1) == 0
                && ![v80 containsObject:v68]
                || [v80 containsObject:v68])
              {
                [v81 addObject:v68];
              }
            }
            uint64_t v65 = [v62 countByEnumeratingWithState:&v95 objects:v114 count:16];
          }
          while (v65);
        }

        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v69 = v85;
        uint64_t v70 = [v69 countByEnumeratingWithState:&v91 objects:v113 count:16];
        if (v70)
        {
          uint64_t v71 = v70;
          uint64_t v72 = *(void *)v92;
LABEL_60:
          uint64_t v73 = 0;
          while (1)
          {
            if (*(void *)v92 != v72) {
              objc_enumerationMutation(v69);
            }
            if (v64 == v77) {
              break;
            }
            v74 = [(_PSInteractionPredictor *)v84 getConversationIDFromInteraction:*(void *)(*((void *)&v91 + 1) + 8 * v73)];
            if (v74 && ([v81 containsObject:v74] & 1) == 0)
            {
              [v81 addObject:v74];
              ++v64;
            }

            if (v71 == ++v73)
            {
              uint64_t v71 = [v69 countByEnumeratingWithState:&v91 objects:v113 count:16];
              if (v71) {
                goto LABEL_60;
              }
              break;
            }
          }
        }

        v75 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
          -[_PSInteractionPredictor predictAtDate:usingModelAtURL:showNumSuggestions:]();
        }

        uint64_t v14 = v89;
      }
      id v18 = v81;

      id v9 = v79;
    }
    char v12 = v85;
  }
  else
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

- (id)rankedZkwSuggestionsFromPredictionArray:(id)a3 forBundleID:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v54 = a4;
  long long v53 = [MEMORY[0x1E4F1CA48] array];
  BOOL v7 = [(_PSInteractionPredictor *)self modelConfiguration];
  id v8 = [v7 modelName];

  if (v8)
  {
    id v9 = [(_PSInteractionPredictor *)self modelConfiguration];
    unint64_t v10 = [v9 modelType];

    if (v10 > 2) {
      BOOL v11 = &stru_1EF653EA8;
    }
    else {
      BOOL v11 = off_1E5ADE8B0[v10];
    }
    char v12 = NSString;
    uint64_t v13 = [(_PSInteractionPredictor *)self modelConfiguration];
    uint64_t v14 = [v13 modelName];
    uint64_t v52 = [v12 stringWithFormat:@"%@%@", v14, v11];
  }
  else
  {
    uint64_t v52 = 0;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v6;
  uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v67;
    long long v56 = self;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v67 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v66 + 1) + 8 * v15);
        uint64_t v17 = [(_PSInteractionPredictor *)self conversationIDMap];
        id v18 = [v17 objectForKey:v16];

        if (v18)
        {
          uint64_t v59 = v15;
          uint64_t v19 = [(_PSInteractionPredictor *)self conversationIDMap];
          uint64_t v61 = v16;
          __int16 v20 = [v19 objectForKeyedSubscript:v16];
          id v21 = [v20 recipients];

          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v23 = v21;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v63;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v63 != v26) {
                  objc_enumerationMutation(v23);
                }
                double v28 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                id v29 = [_PSRecipient alloc];
                long long v30 = [v28 identifier];
                id v31 = [v28 handle];
                v32 = [v28 displayName];
                id v33 = [(_PSRecipient *)v29 initWithIdentifier:v30 handle:v31 displayName:v32 contact:0];

                [v22 addObject:v33];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v62 objects:v70 count:16];
            }
            while (v25);
          }

          double v34 = [_PSSuggestion alloc];
          self = v56;
          id v35 = [(_PSInteractionPredictor *)v56 conversationIDMap];
          uint64_t v36 = [v35 objectForKeyedSubscript:v61];
          double v37 = [v36 groupName];
          v58 = [(_PSSuggestion *)v34 initWithBundleID:v54 conversationIdentifier:v61 groupName:v37 recipients:v22 reason:v52 reasonType:0];

          if (rankedZkwSuggestionsFromPredictionArray_forBundleID___pasOnceToken45 != -1) {
            dispatch_once(&rankedZkwSuggestionsFromPredictionArray_forBundleID___pasOnceToken45, &__block_literal_global_166);
          }
          id v38 = (id)rankedZkwSuggestionsFromPredictionArray_forBundleID___pasExprOnceResult;
          double v39 = [(_PSInteractionPredictor *)v56 conversationIDMap];
          id v40 = [v39 objectForKeyedSubscript:v61];
          uint64_t v41 = [v40 bundleId];
          if (v41)
          {
            v42 = (void *)v41;
            id v43 = [(_PSInteractionPredictor *)v56 conversationIDMap];
            uint64_t v44 = [v43 objectForKeyedSubscript:v61];
            [v44 bundleId];
            uint64_t v45 = v60 = v38;
            int v46 = [v60 containsObject:v45];

            id v38 = v60;
            self = v56;

            id v47 = v58;
            uint64_t v15 = v59;
            if (v46)
            {
              double v39 = [(_PSInteractionPredictor *)v56 conversationIDMap];
              id v40 = [v39 objectForKeyedSubscript:v61];
              v48 = [v40 account];
              [(_PSSuggestion *)v58 setMessagesGroupIdentifier:v48];

              id v38 = v60;
              goto LABEL_26;
            }
          }
          else
          {
            id v47 = v58;
            uint64_t v15 = v59;
LABEL_26:
          }
          [v53 addObject:v47];
        }
        ++v15;
      }
      while (v15 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v57);
  }

  id v49 = (void *)[v53 copy];

  return v49;
}

+ (void)deleteArchiveFileAtDate:(id)a3 modelName:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultManager];
  id v9 = +[_PSInteractionPredictor clustersArchiveFileForDate:v7 modelName:v6];

  if ([v8 fileExistsAtPath:v9])
  {
    id v13 = 0;
    [v8 removeItemAtPath:v9 error:&v13];
    unint64_t v10 = v13;
    BOOL v11 = +[_PSLogging generalChannel];
    char v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionPredictor deleteArchiveFileAtDate:modelName:]();
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      +[_PSInteractionPredictor deleteArchiveFileAtDate:modelName:]();
    }
  }
  else
  {
    unint64_t v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionPredictor deleteArchiveFileAtDate:modelName:]();
    }
  }
}

+ (void)deleteArchiveFiles
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = +[_PSInteractionPredictor defaultClustersArchiveDirectory];
  id v4 = [v2 contentsOfDirectoryAtPath:v3 error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        BOOL v11 = objc_msgSend(v3, "stringByAppendingPathComponent:", v10, v15);
        id v16 = 0;
        [v2 removeItemAtPath:v11 error:&v16];
        id v12 = v16;

        id v13 = +[_PSLogging generalChannel];
        uint64_t v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v22 = v10;
            __int16 v23 = 2112;
            id v24 = v12;
            _os_log_error_impl(&dword_1A314B000, v14, OS_LOG_TYPE_ERROR, "error in deleting file %@: %@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v15;
          uint64_t v22 = v10;
          _os_log_debug_impl(&dword_1A314B000, v14, OS_LOG_TYPE_DEBUG, "file deleted: %@", buf, 0xCu);
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v7);
  }
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
}

- (NSDictionary)currentClusterDictionary
{
  return self->_currentClusterDictionary;
}

- (void)setCurrentClusterDictionary:(id)a3
{
}

- (NSDate)currentArchiveDate
{
  return self->_currentArchiveDate;
}

- (void)setCurrentArchiveDate:(id)a3
{
}

- (NSMutableDictionary)conversationIDMap
{
  return self->_conversationIDMap;
}

- (void)setConversationIDMap:(id)a3
{
}

- (_PSKNNModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)setModelConfiguration:(id)a3
{
}

- (NSURL)compiledModelURL
{
  return self->_compiledModelURL;
}

- (void)setCompiledModelURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledModelURL, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_conversationIDMap, 0);
  objc_storeStrong((id *)&self->_currentArchiveDate, 0);
  objc_storeStrong((id *)&self->_currentClusterDictionary, 0);

  objc_storeStrong((id *)&self->_interactionStore, 0);
}

+ (void)loadModelFromUrl:.cold.1()
{
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1A314B000, v0, OS_LOG_TYPE_DEBUG, "model loaded", v1, 2u);
}

+ (void)loadModelFromUrl:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 absoluteString];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A314B000, a3, OS_LOG_TYPE_ERROR, "Error loading compiled CoreML Model from path %@ : %@", (uint8_t *)&v6, 0x16u);
}

+ (void)loadModelFromUrl:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 absoluteString];
  int v5 = 138412546;
  int v6 = a1;
  __int16 v7 = 2112;
  __int16 v8 = v4;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "compiledURL %@ : %@", (uint8_t *)&v5, 0x16u);
}

- (void)writeArchive:toFilePath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error when trying to persist dictionary: %@", v2, v3, v4, v5, v6);
}

- (void)writeArchive:toFilePath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "error in creating subdirectory at path: %@ with error: %@");
}

- (void)writeArchive:toFilePath:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "error in archiving.", v2, v3, v4, v5, v6);
}

- (void)getDictionaryFromClustersArchiveAtPath:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Error with unarchiving clustersArchive data.", v2, v3, v4, v5, v6);
}

- (void)getDictionaryFromClustersArchiveAtPath:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Error with reading from Archive for Cluster Dictionary.", v2, v3, v4, v5, v6);
}

+ (void)removeMlmodelcFolderAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "Remove file failed at path:%@, with error：%@");
}

+ (void)cloneAdaptableModelURL:toFilePathURL:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "While cloning adaptable model, removing existing file failed", v2, v3, v4, v5, v6);
}

- (void)createMLArrayProviderFromTrainArray:(unsigned char *)a1 .cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1A314B000, v2, (uint64_t)v2, "error converting dictionary to MLDictionaryFeatureProvider.", v3);
}

- (void)createMLArrayProviderFromTrainArray:(unsigned char *)a1 .cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1A314B000, v2, (uint64_t)v2, "error intializing MLMultiArray.", v3);
}

- (void)printModelWeights:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 numberArray];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_1A314B000, v2, v3, "weights are %@", v4, v5, v6, v7, v8);
}

- (void)printModelWeights:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "error in printing weights, %@", v2, v3, v4, v5, v6);
}

- (void)trainAtDate:usingCompiledModelURL:andSaveToURL:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error for update task: %@", v2, v3, v4, v5, v6);
}

- (void)predictAtDate:usingModelAtURL:showNumSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "results %@", v2, v3, v4, v5, v6);
}

- (void)predictAtDate:(unsigned char *)a1 usingModelAtURL:(unsigned char *)a2 showNumSuggestions:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1A314B000, v2, (uint64_t)v2, "input error converting dictionary to MLDictionaryFeatureProvider", v3);
}

- (void)predictAtDate:(unsigned char *)a1 usingModelAtURL:(unsigned char *)a2 showNumSuggestions:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1A314B000, v2, (uint64_t)v2, "error intializing MLMultiArray", v3);
}

- (void)predictAtDate:(void *)a3 usingModelAtURL:(NSObject *)a4 showNumSuggestions:.cold.4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 name];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A314B000, a4, OS_LOG_TYPE_DEBUG, "clusteringPredictions %@", a1, 0xCu);
}

- (void)predictAtDate:usingModelAtURL:showNumSuggestions:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "recencyPredictions %@", v2, v3, v4, v5, v6);
}

- (void)predictAtDate:usingModelAtURL:showNumSuggestions:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "trainArray %{sensitive}@", v2, v3, v4, v5, v6);
}

+ (void)deleteArchiveFileAtDate:modelName:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_1A314B000, v0, v1, "file deleted: %@", v2, v3, v4, v5, v6);
}

+ (void)deleteArchiveFileAtDate:modelName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A314B000, v0, v1, "error in deleting file %@: %@");
}

+ (void)deleteArchiveFileAtDate:modelName:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "path does not exist", v2, v3, v4, v5, v6);
}

@end