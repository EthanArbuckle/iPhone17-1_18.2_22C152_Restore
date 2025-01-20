@interface PSGCustomResponseHarvester
+ (void)clearCustomResponsesCheckpointForTesting;
+ (void)runHarvestSkipMessageCollection:(BOOL)a3 clearCheckpoint:(BOOL)a4 reportMetrics:(BOOL)a5 modelConfigPath:(id)a6 modelVocabPath:(id)a7 modelFilePath:(id)a8 storeDirectory:(id)a9 evalFraction:(id)a10;
- (BOOL)deferAfterWriteCheckpointForActivity:(id)a3;
- (BOOL)isSupportedLanguage:(id)a3;
- (NSMutableDictionary)modelExistsForLanguage;
- (PSGCustomResponseHarvester)initWithActivityManager:(id)a3;
- (PSGCustomResponseHarvester)initWithActivityManager:(id)a3 modelConfigPath:(id)a4 modelVocabPath:(id)a5 modelFilePath:(id)a6 storeDirectory:(id)a7;
- (id)_customResponseParametersWithConfigPath:(id)a3;
- (id)_customResponseParametersWithExperiment:(id)a3;
- (id)_getCustomResponseParameters;
- (id)getCustomResponsesLatestProcessedDateForTesting;
- (id)modelForLanguage:(id)a3;
- (int)getCustomResponsesStepForTesting;
- (unint64_t)activityStateAfterFilterWithStore:(id)a3 forActivity:(id)a4 andCustomResponseParameters:(id)a5;
- (void)harvestWithActivity:(id)a3;
- (void)loadCustomResponsesCheckpoint;
- (void)setCustomResponsesLatestProcessedDateForTesting:(id)a3;
- (void)setCustomResponsesStepForTesting:(int)a3;
- (void)setPet2TrackerForTesting:(id)a3;
- (void)writeCheckpoint;
@end

@implementation PSGCustomResponseHarvester

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelExistsForLanguage, 0);
  objc_storeStrong((id *)&self->_storeDirectory, 0);
  objc_storeStrong((id *)&self->_modelVocabPath, 0);
  objc_storeStrong((id *)&self->_modelConfigPath, 0);
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  objc_storeStrong((id *)&self->_latestProcessedDate, 0);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_checkpointFullPath, 0);
  objc_storeStrong((id *)&self->_fManager, 0);
  objc_storeStrong((id *)&self->_pet2tracker, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
}

- (NSMutableDictionary)modelExistsForLanguage
{
  return self->_modelExistsForLanguage;
}

- (id)getCustomResponsesLatestProcessedDateForTesting
{
  return self->_latestProcessedDate;
}

- (void)setCustomResponsesLatestProcessedDateForTesting:(id)a3
{
}

- (int)getCustomResponsesStepForTesting
{
  return self->_customResponsesStep;
}

- (void)setCustomResponsesStepForTesting:(int)a3
{
  self->_customResponsesStep = a3;
}

- (void)setPet2TrackerForTesting:(id)a3
{
}

- (BOOL)deferAfterWriteCheckpointForActivity:(id)a3
{
  id v4 = a3;
  [(PSGCustomResponseHarvester *)self writeCheckpoint];
  int v5 = [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4];
  if (v5) {
    [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:3];
  }

  return v5;
}

- (unint64_t)activityStateAfterFilterWithStore:(id)a3 forActivity:(id)a4 andCustomResponseParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  char v87 = 0;
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = __104__PSGCustomResponseHarvester_activityStateAfterFilterWithStore_forActivity_andCustomResponseParameters___block_invoke;
  v81[3] = &unk_265037E00;
  v81[4] = self;
  id v12 = v10;
  id v82 = v12;
  v83 = &v84;
  v70 = (void *)MEMORY[0x23ED0AD60](v81);
  int v13 = 0;
  while (self->_customResponsesStep >= 2u)
  {
    v14 = (void *)MEMORY[0x23ED0AB80]();
    switch(self->_customResponsesStep)
    {
      case 2:
        v15 = pre_signpost_handle();
        int ptr = 7;
        os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, &ptr);

        v17 = pre_signpost_handle();
        v18 = v17;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SGCustomResponses-DesignateFilteringBatch", "Start", buf, 2u);
        }

        unint64_t v19 = objc_msgSend(v9, "designateFilteringBatch:", objc_msgSend(v11, "filterBatchSize"));
        if (v19) {
          int v13 = 3;
        }
        else {
          int v13 = 0;
        }
        self->_batchSize = v19;
        v20 = pre_signpost_handle();
        v21 = v20;
        if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v20)) {
          goto LABEL_76;
        }
        *(_WORD *)buf = 0;
        v22 = v21;
        os_signpost_id_t v23 = v16;
        v24 = "SGCustomResponses-DesignateFilteringBatch";
        break;
      case 3:
        v25 = pre_signpost_handle();
        int v78 = 7;
        os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, &v78);

        v27 = pre_signpost_handle();
        v28 = v27;
        if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "SGCustomResponses-RecordKnownCustomResponses", "Start", buf, 2u);
        }

        objc_msgSend(v9, "recordKnownCustomResponsesInBatchWithEmbedder:compatibilityVersion:", v70, objc_msgSend(v11, "compatibilityVersion"));
        if (*((unsigned char *)v85 + 24)) {
          int v13 = 3;
        }
        else {
          int v13 = 4;
        }
        v29 = pre_signpost_handle();
        v21 = v29;
        if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v29)) {
          goto LABEL_76;
        }
        *(_WORD *)buf = 0;
        v22 = v21;
        os_signpost_id_t v23 = v26;
        v24 = "SGCustomResponses-RecordKnownCustomResponses";
        break;
      case 4:
        v30 = pre_signpost_handle();
        int v77 = 7;
        os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, &v77);

        v32 = pre_signpost_handle();
        v33 = v32;
        if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "SGCustomResponses-PruningAllCustomResponses", "Start", buf, 2u);
        }

        [v11 minDecayedCountForPruning];
        unint64_t v34 = objc_msgSend(v9, "countCustomResponsesAfterPruningWithMinimumCountThreshold:");
        if (v34 >= [v11 maxStoredCustomResponses]) {
          int v13 = 7;
        }
        else {
          int v13 = 5;
        }
        v35 = pre_signpost_handle();
        v21 = v35;
        if (v31 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35)) {
          goto LABEL_76;
        }
        *(_WORD *)buf = 0;
        v22 = v21;
        os_signpost_id_t v23 = v31;
        v24 = "SGCustomResponses-PruningAllCustomResponses";
        break;
      case 5:
        v36 = pre_signpost_handle();
        int v76 = 7;
        os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v36, &v76);

        v38 = pre_signpost_handle();
        v39 = v38;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "SGCustomResponses-FilterBatch", "Start", buf, 2u);
        }

        objc_msgSend(v9, "filterBatchWithMinimumDistinctRecipients:minimumReplyOccurences:", objc_msgSend(v11, "minimumDistinctRecipients"), objc_msgSend(v11, "minimumReplyOccurences"));
        v40 = pre_signpost_handle();
        v21 = v40;
        if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v21, OS_SIGNPOST_INTERVAL_END, v37, "SGCustomResponses-FilterBatch", "Completed", buf, 2u);
        }
        int v13 = 6;
        goto LABEL_76;
      case 6:
        v41 = pre_signpost_handle();
        int v75 = 7;
        os_signpost_id_t v42 = os_signpost_id_make_with_pointer(v41, &v75);

        v43 = pre_signpost_handle();
        v44 = v43;
        if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v42, "SGCustomResponses-RecordAllRemainingMessagesAsCustomResponses", "Start", buf, 2u);
        }

        objc_msgSend(v9, "recordMessagesInBatchAsCustomResponsesWithEmbedder:compatibilityVersion:", v70, objc_msgSend(v11, "compatibilityVersion"));
        if (*((unsigned char *)v85 + 24)) {
          int v13 = 6;
        }
        else {
          int v13 = 7;
        }
        v45 = pre_signpost_handle();
        v21 = v45;
        if (v42 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v45)) {
          goto LABEL_76;
        }
        *(_WORD *)buf = 0;
        v22 = v21;
        os_signpost_id_t v23 = v42;
        v24 = "SGCustomResponses-RecordAllRemainingMessagesAsCustomResponses";
        break;
      case 7:
        v46 = pre_signpost_handle();
        int v74 = 7;
        os_signpost_id_t v47 = os_signpost_id_make_with_pointer(v46, &v74);

        v48 = pre_signpost_handle();
        v49 = v48;
        if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "SGCustomResponses-DecayAllCustomResponses", "Start", buf, 2u);
        }

        [v11 timeDecayFactor];
        objc_msgSend(v9, "decayAllCustomResponsesWithDecayFactor:filteringBatchSize:", self->_batchSize);
        v50 = pre_signpost_handle();
        v21 = v50;
        if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v21, OS_SIGNPOST_INTERVAL_END, v47, "SGCustomResponses-DecayAllCustomResponses", "Completed", buf, 2u);
        }
        int v13 = 8;
        goto LABEL_76;
      case 8:
        v51 = pre_signpost_handle();
        int v73 = 7;
        os_signpost_id_t v52 = os_signpost_id_make_with_pointer(v51, &v73);

        v53 = pre_signpost_handle();
        v54 = v53;
        if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SGCustomResponses-TruncateCustomResponsesTable", "Start", buf, 2u);
        }

        uint64_t v55 = objc_msgSend(v9, "countCustomResponsesAfterTruncatingTable:", objc_msgSend(v11, "maxStoredCustomResponses"));
        v21 = objc_opt_new();
        [v21 setCustomResponsesAfterPruning:v55];
        [(PETEventTracker2 *)self->_pet2tracker trackScalarForMessage:v21];
        v56 = pre_signpost_handle();
        v57 = v56;
        if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v57, OS_SIGNPOST_INTERVAL_END, v52, "SGCustomResponses-TruncateCustomResponsesTable", "Completed", buf, 2u);
        }

        int v13 = 9;
        goto LABEL_76;
      case 9:
        v58 = pre_signpost_handle();
        int v72 = 7;
        os_signpost_id_t v59 = os_signpost_id_make_with_pointer(v58, &v72);

        v60 = pre_signpost_handle();
        v61 = v60;
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v59, "SGCustomResponses-PrunePerRecipientTable", "Start", buf, 2u);
        }

        objc_msgSend(v9, "prunePerRecipientTableWithMaxRows:", objc_msgSend(v11, "maxRowsInPerRecipientTable"));
        v62 = pre_signpost_handle();
        v21 = v62;
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v21, OS_SIGNPOST_INTERVAL_END, v59, "SGCustomResponses-PrunePerRecipientTable", "Completed", buf, 2u);
        }
        int v13 = 10;
        goto LABEL_76;
      case 0xA:
        v63 = pre_signpost_handle();
        int v71 = 7;
        os_signpost_id_t v64 = os_signpost_id_make_with_pointer(v63, &v71);

        v65 = pre_signpost_handle();
        v66 = v65;
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v66, OS_SIGNPOST_INTERVAL_BEGIN, v64, "SGCustomResponses-CalculateUsageSpreads", "Start", buf, 2u);
        }

        [v9 calculateUsageSpreads];
        v67 = pre_signpost_handle();
        v21 = v67;
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EAA9000, v21, OS_SIGNPOST_INTERVAL_END, v64, "SGCustomResponses-CalculateUsageSpreads", "Completed", buf, 2u);
        }
        int v13 = 0;
        goto LABEL_76;
      default:
        goto LABEL_77;
    }
    _os_signpost_emit_with_name_impl(&dword_23EAA9000, v22, OS_SIGNPOST_INTERVAL_END, v23, v24, "Completed", buf, 2u);
LABEL_76:

LABEL_77:
    self->_customResponsesStep = v13;
    [(PSGCustomResponseHarvester *)self writeCheckpoint];
    if (*((unsigned char *)v85 + 24)
      || ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v12] & 1) != 0)
    {
      unint64_t v5 = 0;
      char v68 = 0;
    }
    else if (v13 || self->_batchSize)
    {
      char v68 = 1;
    }
    else
    {
      char v68 = 0;
      unint64_t v5 = 2;
    }
    if ((v68 & 1) == 0) {
      goto LABEL_87;
    }
  }
  unint64_t v5 = 1;
LABEL_87:

  _Block_object_dispose(&v84, 8);
  return v5;
}

id __104__PSGCustomResponseHarvester_activityStateAfterFilterWithStore_forActivity_andCustomResponseParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 8) shouldDefer:*(void *)(a1 + 40)])
  {
    id v7 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_15;
  }
  v8 = [*(id *)(a1 + 32) modelForLanguage:v6];
  id v9 = [v8 featuresOf:v5];
  id v10 = [v8 predict:v9];
  id v11 = [v8 config];
  id v12 = [v11 customResponsesParameters];
  if ([v12 useNonNegativeClassesOnly])
  {
    int v13 = [v8 config];
    v14 = [v13 predictionParams];
    int v15 = [v14 hasNegativeClass];

    if (v15)
    {
      double v16 = 0.0;
      if ((unint64_t)[v10 count] >= 2)
      {
        unint64_t v17 = 1;
        do
        {
          v18 = [v10 objectAtIndexedSubscript:v17];
          [v18 doubleValue];
          double v16 = v16 + v19;

          ++v17;
        }
        while ([v10 count] > v17);
      }
      v20 = objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
      id v7 = (id)[v20 mutableCopy];

      if ([v7 count])
      {
        unint64_t v21 = 0;
        do
        {
          v22 = NSNumber;
          os_signpost_id_t v23 = [v7 objectAtIndexedSubscript:v21];
          [v23 doubleValue];
          v25 = [v22 numberWithDouble:v24 / v16];
          [v7 setObject:v25 atIndexedSubscript:v21];

          ++v21;
        }
        while ([v7 count] > v21);
      }
      goto LABEL_14;
    }
  }
  else
  {
  }
  id v7 = v10;
LABEL_14:

LABEL_15:
  return v7;
}

- (id)modelForLanguage:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F382D0] modelForLanguage:v4 mode:1 chunkPath:self->_modelFilePath plistPath:self->_modelConfigPath vocabPath:self->_modelVocabPath];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
LABEL_8:
    id v9 = v7;
    goto LABEL_9;
  }
  if (![v4 isEqualToString:self->_preferredLanguage])
  {
    id v7 = [(PSGCustomResponseHarvester *)self modelForLanguage:self->_preferredLanguage];
    goto LABEL_8;
  }
  v8 = psg_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    preferredLanguage = self->_preferredLanguage;
    int v12 = 138412290;
    int v13 = preferredLanguage;
    _os_log_fault_impl(&dword_23EAA9000, v8, OS_LOG_TYPE_FAULT, "Model missing for preferred language %@", (uint8_t *)&v12, 0xCu);
  }

  id v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)isSupportedLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_modelExistsForLanguage objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = [MEMORY[0x263F382B8] configWithLanguage:v4 mode:1 plistPath:self->_modelConfigPath vocabPath:self->_modelVocabPath];
    id v5 = [NSNumber numberWithInt:v6 != 0];
    [(NSMutableDictionary *)self->_modelExistsForLanguage setObject:v5 forKeyedSubscript:v4];
  }
  char v7 = [v5 BOOLValue];

  return v7;
}

- (void)writeCheckpoint
{
  v12[3] = *MEMORY[0x263EF8340];
  [(NSDate *)self->_latestProcessedDate timeIntervalSinceReferenceDate];
  v3 = objc_msgSend(NSNumber, "numberWithDouble:");
  v12[0] = v3;
  id v4 = [NSNumber numberWithUnsignedInt:self->_customResponsesStep];
  v12[1] = v4;
  id v5 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  v12[2] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];

  id v9 = 0;
  char v7 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:0 error:&v9];
  id v8 = v9;
  if (v8 || !v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_fault_impl(&dword_23EAA9000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Error serializing CustomResponses checkpoint: %@", buf, 0xCu);
    }
  }
  else
  {
    [(NSFileManager *)self->_fManager createFileAtPath:self->_checkpointFullPath contents:v7 attributes:0];
  }
}

- (void)loadCustomResponsesCheckpoint
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(NSFileManager *)self->_fManager fileExistsAtPath:self->_checkpointFullPath])
  {
    v3 = [(NSFileManager *)self->_fManager contentsAtPath:self->_checkpointFullPath];
    if (v3)
    {
      id v13 = 0;
      id v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:0 error:&v13];
      id v5 = v13;
      if ((v5 || !v4) && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v5;
        _os_log_fault_impl(&dword_23EAA9000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Error deserializing CustomResponses checkpoint: %@", buf, 0xCu);
      }
      id v6 = [v4 objectAtIndexedSubscript:0];
      [v6 doubleValue];
      double v8 = v7;

      id v9 = [v4 objectAtIndexedSubscript:1];
      self->_customResponsesStep = [v9 unsignedIntegerValue];

      if (v8 == 0.0)
      {
        latestProcessedDate = self->_latestProcessedDate;
        self->_latestProcessedDate = 0;
      }
      else
      {
        id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v8];
        latestProcessedDate = self->_latestProcessedDate;
        self->_latestProcessedDate = v11;
      }

      if ((unint64_t)[v4 count] < 3 || self->_customResponsesStep < 3u)
      {
        self->_batchSize = 0;
      }
      else
      {
        int v12 = [v4 objectAtIndexedSubscript:2];
        self->_batchSize = [v12 integerValue];
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_23EAA9000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Unable to read CustomResponses data", buf, 2u);
    }
  }
}

- (void)harvestWithActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(PSGCustomResponseHarvester *)self _getCustomResponseParameters];
  if (!v5)
  {
    xpcActivityManager = self->_xpcActivityManager;
    goto LABEL_6;
  }
  id v6 = [(PSGCustomResponseHarvester *)self modelForLanguage:self->_preferredLanguage];

  xpcActivityManager = self->_xpcActivityManager;
  if (!v6)
  {
LABEL_6:
    id v8 = v4;
    uint64_t v9 = 5;
    goto LABEL_7;
  }
  if ([(SGXPCActivityManagerProtocol *)xpcActivityManager shouldDefer:v4])
  {
    xpcActivityManager = self->_xpcActivityManager;
    id v8 = v4;
    uint64_t v9 = 3;
LABEL_7:
    [(SGXPCActivityManagerProtocol *)xpcActivityManager setState:v8 state:v9];
    goto LABEL_8;
  }
  v48[7] = 0;
  v48[5] = @"com.apple.suggestd.custom-response-harvest";
  v48[6] = mach_absolute_time();
  id v10 = (void *)MEMORY[0x23ED0AB80]();
  if ([(NSString *)self->_storeDirectory length])
  {
    v41 = (void *)[objc_alloc(MEMORY[0x263F382E0]) initInDirectory:self->_storeDirectory inMemory:0 withMigration:1];
  }
  else
  {
    v41 = [MEMORY[0x263F382E0] sharedInstance];
  }
  if (self->_customResponsesStep >= 2u
    && ![(PSGCustomResponseHarvester *)self activityStateAfterFilterWithStore:v41 forActivity:v4 andCustomResponseParameters:v5]|| (self->_customResponsesStep = 1, [(PSGCustomResponseHarvester *)self writeCheckpoint], [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4]))
  {
    [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:3];
    PRERecordMeasurementState();
    int v11 = 1;
    goto LABEL_55;
  }
  v44 = v5;
  v38 = v10;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __50__PSGCustomResponseHarvester_harvestWithActivity___block_invoke;
  v48[3] = &unk_265037DD8;
  v48[4] = self;
  int v12 = 0;
  v39 = (void (**)(void, void))MEMORY[0x23ED0AD60](v48);
  id v45 = v4;
LABEL_17:
  if (([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4] & 1) == 0)
  {
    id v13 = ((void (**)(void, void *))v39)[2](v39, v44);

    if (!v13)
    {
      int v12 = 0;
      goto LABEL_44;
    }
    context = (void *)MEMORY[0x23ED0AB80]();
    while (1)
    {
      if (([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4] & 1) != 0
        || ([v13 isDoneIterating] & 1) != 0)
      {
LABEL_42:
        v33 = [v13 latestProcessedDate];
        latestProcessedDate = self->_latestProcessedDate;
        self->_latestProcessedDate = v33;

        [(PSGCustomResponseHarvester *)self writeCheckpoint];
        int v12 = v13;
        goto LABEL_17;
      }
      uint64_t v14 = (void *)MEMORY[0x23ED0AB80]();
      id v15 = pre_signpost_handle();
      int ptr = 7;
      os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, &ptr);

      unint64_t v17 = pre_signpost_handle();
      v18 = v17;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EAA9000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "SGCustomResponses-NextMessagePair", "Start", buf, 2u);
      }

      double v19 = (void *)MEMORY[0x23ED0AB80]();
      v20 = v13;
      unint64_t v21 = [v13 nextMessagePair];
      v22 = pre_signpost_handle();
      os_signpost_id_t v23 = v22;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EAA9000, v23, OS_SIGNPOST_INTERVAL_END, v16, "SGCustomResponses-NextMessagePair", "Completed", buf, 2u);
      }

      if (v21) {
        break;
      }
      int v32 = 4;
LABEL_39:

      id v13 = v20;
      if (v32 == 5) {
        goto LABEL_42;
      }
    }
    double v24 = (void *)MEMORY[0x263F5D478];
    v25 = [v21 prompt];
    os_signpost_id_t v26 = [v24 detectLanguageFromText:v25];

    if (v26)
    {
      v27 = [MEMORY[0x263F5D478] languageForLocaleIdentifier:v26];
      if (v27)
      {
        if ([(PSGCustomResponseHarvester *)self isSupportedLanguage:v27])
        {
          uint64_t v42 = [v44 filterBatchSize];
          uint64_t v28 = [v44 maxStoredMessages];
          v43 = [v21 reply];
          v29 = [v21 prompt];
          v30 = [v21 handle];
          os_signpost_id_t v31 = [v21 sentAt];
          LOBYTE(v28) = [v41 addingMessageExceedsBatchLimit:v42 tableLimit:v28 message:v43 language:v27 prompt:v29 recipientHandle:v30 sentAt:v31];

          if (v28)
          {
            self->_customResponsesStep = 2;
            [(PSGCustomResponseHarvester *)self writeCheckpoint];
            if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v45])
            {
              int v32 = 5;
            }
            else
            {
              [(PSGCustomResponseHarvester *)self activityStateAfterFilterWithStore:v41 forActivity:v45 andCustomResponseParameters:v44];
              int v32 = 0;
            }
            goto LABEL_38;
          }
        }
      }
    }
    else
    {
      v27 = 0;
    }
    int v32 = 4;
LABEL_38:

    id v4 = v45;
    goto LABEL_39;
  }
LABEL_44:
  if ([(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4]) {
    goto LABEL_53;
  }
  unint64_t v35 = 1;
  do
  {
    if (v35 != 1) {
      break;
    }
    v36 = (void *)MEMORY[0x23ED0AB80]();
    self->_customResponsesStep = 2;
    [(PSGCustomResponseHarvester *)self writeCheckpoint];
    int v37 = [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager shouldDefer:v4];
    unint64_t v35 = (v37 & 1) != 0
        ? 0
        : [(PSGCustomResponseHarvester *)self activityStateAfterFilterWithStore:v41 forActivity:v4 andCustomResponseParameters:v44];
  }
  while (!v37);
  if (!v35)
  {
LABEL_53:
    [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:3];
    PRERecordMeasurementState();
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }

  id v10 = v38;
  id v5 = v44;
LABEL_55:

  if (!v11)
  {
    [(SGXPCActivityManagerProtocol *)self->_xpcActivityManager setState:v4 state:5];
    PRERecordMeasurementState();
  }
  PRERecordMeasurementState();
LABEL_8:
}

id __50__PSGCustomResponseHarvester_harvestWithActivity___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F382A8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t v7 = [v4 knowledgeStoreQueryLimit];
  uint64_t v8 = [v4 maxReplyLength];
  [v4 maxReplyGapSecs];
  double v10 = v9;

  int v11 = (void *)[v5 initWithStartDate:v6 maxBatchSize:v7 maxReplyLength:v8 maxReplyGap:v10];
  return v11;
}

- (id)_getCustomResponseParameters
{
  if ([(NSString *)self->_modelConfigPath length]
    && [(NSFileManager *)self->_fManager isReadableFileAtPath:self->_modelConfigPath])
  {
    v3 = [(PSGCustomResponseHarvester *)self _customResponseParametersWithConfigPath:self->_modelConfigPath];
  }
  else
  {
    id v4 = +[PSGExperimentResolver sharedInstance];
    id v5 = [v4 getResponseSuggestionsExperimentConfig:self->_preferredLanguage shouldDownloadAssets:1];

    v3 = [(PSGCustomResponseHarvester *)self _customResponseParametersWithExperiment:v5];
  }
  return v3;
}

- (id)_customResponseParametersWithConfigPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (NSString *)a3;
  id v5 = [MEMORY[0x263F382B8] configWithLanguage:self->_preferredLanguage mode:1 plistPath:v4 vocabPath:0];
  uint64_t v6 = [v5 customResponsesParameters];
  if ([v6 isCustomResponsesEnabled])
  {
    if ([(NSString *)self->_modelFilePath length]
      && [(NSFileManager *)self->_fManager isReadableFileAtPath:self->_modelFilePath])
    {
      id v7 = v6;
      goto LABEL_12;
    }
    double v9 = psg_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      modelFilePath = self->_modelFilePath;
      int v13 = 138412290;
      uint64_t v14 = modelFilePath;
      _os_log_fault_impl(&dword_23EAA9000, v9, OS_LOG_TYPE_FAULT, "[CRH] Model file path invalid: %@", (uint8_t *)&v13, 0xCu);
    }

    double v10 = self->_modelFilePath;
    self->_modelFilePath = 0;
  }
  else
  {
    uint64_t v8 = psg_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      uint64_t v14 = v4;
      _os_log_debug_impl(&dword_23EAA9000, v8, OS_LOG_TYPE_DEBUG, "[CRH] Custom responses not enabled in this config: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

- (id)_customResponseParametersWithExperiment:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 isMLModelEnabled] & 1) == 0)
  {
    double v9 = psg_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      preferredLanguage = self->_preferredLanguage;
      int v33 = 138412290;
      unint64_t v34 = preferredLanguage;
      _os_log_debug_impl(&dword_23EAA9000, v9, OS_LOG_TYPE_DEBUG, "[CRH] ML is not enabled for custom response harvesting (preferred language: %@).", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_11;
  }
  id v5 = [v4 inferenceModelConfigPath];
  modelConfigPath = self->_modelConfigPath;
  self->_modelConfigPath = v5;

  if (![(NSString *)self->_modelConfigPath length]
    || ![(NSFileManager *)self->_fManager isReadableFileAtPath:self->_modelConfigPath])
  {
    uint64_t v15 = self->_modelConfigPath;
    self->_modelConfigPath = 0;

    double v9 = psg_default_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v27 = [v4 treatmentName];
      uint64_t v28 = [v4 experimentIdentifiers];
      v29 = [v28 experimentId];
      v30 = [v4 experimentIdentifiers];
      os_signpost_id_t v31 = [v30 treatmentId];
      int v33 = 138412802;
      unint64_t v34 = v27;
      __int16 v35 = 2112;
      v36 = v29;
      __int16 v37 = 2112;
      v38 = v31;
      _os_log_fault_impl(&dword_23EAA9000, v9, OS_LOG_TYPE_FAULT, "[CRH] Config file invalid while ML is enabled. Name: %@, Exp: %@; Trt: %@",
        (uint8_t *)&v33,
        0x20u);
    }
LABEL_11:
    id v16 = 0;
    goto LABEL_12;
  }
  id v7 = [v4 vocabFilePath];
  modelVocabPath = self->_modelVocabPath;
  self->_modelVocabPath = v7;

  double v9 = [MEMORY[0x263F382B8] configWithLanguage:self->_preferredLanguage mode:1 plistPath:self->_modelConfigPath vocabPath:self->_modelVocabPath];
  double v10 = [v9 customResponsesParameters];
  if (([v10 isCustomResponsesEnabled] & 1) == 0)
  {
    int v12 = psg_default_log_handle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
LABEL_26:
      id v16 = 0;
      goto LABEL_27;
    }
    v18 = [v4 treatmentName];
    int v33 = 138412290;
    unint64_t v34 = v18;
    _os_log_debug_impl(&dword_23EAA9000, v12, OS_LOG_TYPE_DEBUG, "[CRH] Custom responses not enabled in this treatment (name: %@).", (uint8_t *)&v33, 0xCu);
    goto LABEL_25;
  }
  int v11 = [v9 predictionParams];
  int v12 = [v11 modelTypeName];

  if ([v12 isEqualToString:@"quickResponsesBinaryLogisticMultiLabel"])
  {
    int v13 = [v4 inferenceModelFilePath];
  }
  else
  {
    if (![v12 isEqualToString:@"quickResponsesEspressoClassifierMultiLabel"])
    {
      modelFilePath = self->_modelFilePath;
      self->_modelFilePath = 0;

      v18 = psg_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        unint64_t v21 = [v4 treatmentName];
        v22 = [v4 experimentIdentifiers];
        os_signpost_id_t v23 = [v22 experimentId];
        double v24 = [v4 experimentIdentifiers];
        v25 = [v24 treatmentId];
        int v33 = 138413058;
        unint64_t v34 = v12;
        __int16 v35 = 2112;
        v36 = v21;
        __int16 v37 = 2112;
        v38 = v23;
        __int16 v39 = 2112;
        v40 = v25;
        os_signpost_id_t v26 = "[CRH] Unexpected model type %@, and experiment (Name: %@, Exp: %@ Trt: %@).";
        goto LABEL_29;
      }
LABEL_25:

      goto LABEL_26;
    }
    int v13 = [v4 espressoBinFilePath];
  }
  double v19 = self->_modelFilePath;
  self->_modelFilePath = v13;

  if (![(NSString *)self->_modelFilePath length]
    || ![(NSFileManager *)self->_fManager isReadableFileAtPath:self->_modelFilePath])
  {
    v20 = self->_modelFilePath;
    self->_modelFilePath = 0;

    v18 = psg_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      unint64_t v21 = [v4 treatmentName];
      v22 = [v4 experimentIdentifiers];
      os_signpost_id_t v23 = [v22 experimentId];
      double v24 = [v4 experimentIdentifiers];
      v25 = [v24 treatmentId];
      int v33 = 138413058;
      unint64_t v34 = v12;
      __int16 v35 = 2112;
      v36 = v21;
      __int16 v37 = 2112;
      v38 = v23;
      __int16 v39 = 2112;
      v40 = v25;
      os_signpost_id_t v26 = "[CRH] Model file invalid for ModelType: %@ and Experiment (Name: %@, Exp: %@ Trt: %@).";
LABEL_29:
      _os_log_fault_impl(&dword_23EAA9000, v18, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v33, 0x2Au);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  id v16 = v10;
LABEL_27:

LABEL_12:
  return v16;
}

- (PSGCustomResponseHarvester)initWithActivityManager:(id)a3 modelConfigPath:(id)a4 modelVocabPath:(id)a5 modelFilePath:(id)a6 storeDirectory:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v42 = a7;
  v44.receiver = self;
  v44.super_class = (Class)PSGCustomResponseHarvester;
  unint64_t v17 = [(PSGCustomResponseHarvester *)&v44 init];
  v18 = v17;
  if (!v17)
  {
LABEL_16:
    int v32 = v18;
    goto LABEL_17;
  }
  objc_storeStrong((id *)&v17->_xpcActivityManager, a3);
  uint64_t v19 = [MEMORY[0x263F61890] sharedInstance];
  pet2tracker = v18->_pet2tracker;
  v18->_pet2tracker = (PETEventTracker2 *)v19;

  uint64_t v21 = [MEMORY[0x263F08850] defaultManager];
  fManager = v18->_fManager;
  v18->_fManager = (NSFileManager *)v21;

  uint64_t v23 = [MEMORY[0x263F5D480] suggestionsDirectory];
  if (v23)
  {
    double v24 = (NSString *)v23;
    id v40 = v16;
    id v41 = v15;
    id v25 = v14;
    id v26 = v13;
    v27 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v28 = [v27 firstObject];

    if (v28)
    {
      uint64_t v29 = [MEMORY[0x263F5D478] languageForLocaleIdentifier:v28];
      preferredLanguage = v18->_preferredLanguage;
      v18->_preferredLanguage = (NSString *)v29;
    }
    id v13 = v26;
    if (v18->_preferredLanguage)
    {
      objc_storeStrong((id *)&v18->_modelConfigPath, a4);
      objc_storeStrong((id *)&v18->_modelVocabPath, a5);
      objc_storeStrong((id *)&v18->_modelFilePath, a6);
      objc_storeStrong((id *)&v18->_storeDirectory, a7);
      id v14 = v25;
      if ([(NSString *)v18->_storeDirectory length]) {
        storeDirectory = v18->_storeDirectory;
      }
      else {
        storeDirectory = v24;
      }
      uint64_t v34 = [(NSString *)storeDirectory stringByAppendingPathComponent:@"custom-response-ckpt"];
      checkpointFullPath = v18->_checkpointFullPath;
      v18->_checkpointFullPath = (NSString *)v34;
      id v15 = v41;

      v18->_customResponsesStep = 0;
      latestProcessedDate = v18->_latestProcessedDate;
      v18->_latestProcessedDate = 0;

      v18->_batchSize = 0;
      [(PSGCustomResponseHarvester *)v18 loadCustomResponsesCheckpoint];
      uint64_t v37 = objc_opt_new();
      modelExistsForLanguage = v18->_modelExistsForLanguage;
      v18->_modelExistsForLanguage = (NSMutableDictionary *)v37;

      id v16 = v40;
      goto LABEL_16;
    }
    int v33 = psg_default_log_handle();
    id v14 = v25;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_23EAA9000, v33, OS_LOG_TYPE_DEBUG, "SGCustomResponseHarvester: No preferred language is set.", buf, 2u);
    }

    int v32 = 0;
    id v16 = v40;
    id v15 = v41;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_23EAA9000, &_os_log_internal, OS_LOG_TYPE_FAULT, "SGDManagerForCTS: Unable to create directory for custom responses checkpoint.", buf, 2u);
    }
    int v32 = 0;
  }
LABEL_17:

  return v32;
}

- (PSGCustomResponseHarvester)initWithActivityManager:(id)a3
{
  return [(PSGCustomResponseHarvester *)self initWithActivityManager:a3 modelConfigPath:0 modelVocabPath:0 modelFilePath:0 storeDirectory:0];
}

+ (void)runHarvestSkipMessageCollection:(BOOL)a3 clearCheckpoint:(BOOL)a4 reportMetrics:(BOOL)a5 modelConfigPath:(id)a6 modelVocabPath:(id)a7 modelFilePath:(id)a8 storeDirectory:(id)a9 evalFraction:(id)a10
{
  BOOL v13 = a4;
  BOOL v14 = a3;
  id v25 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  if (v13)
  {
    if ([v17 length])
    {
      uint64_t v19 = [MEMORY[0x263F08850] defaultManager];
      v20 = [v17 stringByAppendingPathComponent:@"custom-response-ckpt"];
      [v19 removeItemAtPath:v20 error:0];
    }
    else
    {
      +[PSGCustomResponseHarvester clearCustomResponsesCheckpointForTesting];
    }
  }
  uint64_t v21 = [[PSGCustomResponseHarvester alloc] initWithActivityManager:0 modelConfigPath:v25 modelVocabPath:v15 modelFilePath:v16 storeDirectory:v17];
  v22 = v21;
  if (!a5) {
    [(PSGCustomResponseHarvester *)v21 setPet2TrackerForTesting:0];
  }
  if (v14) {
    [(PSGCustomResponseHarvester *)v22 setCustomResponsesStepForTesting:2];
  }
  [(PSGCustomResponseHarvester *)v22 harvestWithActivity:0];
  if (v18)
  {
    [v18 doubleValue];
    if (v23 > 0.0)
    {
      double v24 = (void *)[objc_alloc(MEMORY[0x263F382E0]) initInDirectory:v17 inMemory:0 withMigration:1];
      [v24 resetCustomResponsesForEval:v18];
    }
  }
  [(PSGCustomResponseHarvester *)v22 harvestWithActivity:0];
}

+ (void)clearCustomResponsesCheckpointForTesting
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  v2 = [MEMORY[0x263F5D480] suggestionsDirectoryFile:@"custom-response-ckpt"];
  [v3 removeItemAtPath:v2 error:0];
}

@end