@interface PPDKStorage
+ (PPDKStorage)sharedInstance;
- (BOOL)_isFutureCompatibilityVersionAttachedToEvent:(uint64_t)a1;
- (BOOL)deleteAllEventsInEventStream:(id)a3 error:(id *)a4;
- (BOOL)deleteAllEventsInEventStream:(id)a3 matchingPredicate:(id)a4 error:(id *)a5;
- (BOOL)deleteEvents:(id)a3 error:(id *)a4;
- (BOOL)iterEventBatchesMatchingPredicate:(id)a3 streams:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 error:(id *)a7 block:(id)a8;
- (BOOL)iterEventBatchesMatchingPredicate:(id)a3 streams:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 readMetaData:(BOOL)a7 remoteOnly:(BOOL)a8 error:(id *)a9 block:(id)a10;
- (BOOL)saveEvents:(id)a3 stream:(id)a4 maxRetries:(int64_t)a5 retryInterval:(double)a6 shouldContinueBlock:(id)a7;
- (double)entityStreamCooldownTimeRemaining;
- (double)namedEntityWriteBatchInterval;
- (double)topicStreamCooldownTimeRemaining;
- (double)topicWriteBatchInterval;
- (id)_readWriteKnowledgeStore;
- (id)entityStream;
- (id)eventForNamedEntityRecord:(id)a3 sourceDeviceID:(id)a4;
- (id)eventForTopicRecord:(id)a3 sourceDeviceID:(id)a4;
- (id)namedEntityRecordFromEvent:(id)a3;
- (id)registerForNamedEntitiesRemoteAdditionWithBlock:(id)a3;
- (id)registerForNamedEntitiesRemoteDeletionWithBlock:(id)a3;
- (id)registerForTopicsRemoteAdditionWithBlock:(id)a3;
- (id)registerForTopicsRemoteDeletionWithBlock:(id)a3;
- (id)tombstoneStream;
- (id)topicRecordFromEvent:(id)a3;
- (id)topicStream;
- (unsigned)namedEntityWriteBatchSize;
- (unsigned)readBatchSize;
- (unsigned)topicWriteBatchSize;
- (void)removeObserver:(id)a3;
@end

@implementation PPDKStorage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicWriteSem, 0);
  objc_storeStrong((id *)&self->_entityWriteSem, 0);
  objc_storeStrong((id *)&self->_topicLock, 0);
  objc_storeStrong((id *)&self->_entityLock, 0);
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28C40];
    id v4 = a3;
    id v5 = [v3 defaultCenter];
    [v5 removeObserver:v4];
  }
}

- (id)registerForTopicsRemoteDeletionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  v6 = [(PPDKStorage *)self topicStream];
  v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F5B648];
    v9 = [v6 name];
    v10 = [v5 addObserverForName:v8 object:v9 queue:0 usingBlock:v4];
  }
  else
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing topic stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)registerForTopicsRemoteAdditionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  v6 = [(PPDKStorage *)self topicStream];
  v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F5B640];
    v9 = [v6 name];
    v10 = [v5 addObserverForName:v8 object:v9 queue:0 usingBlock:v4];
  }
  else
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing topic stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)registerForNamedEntitiesRemoteDeletionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  v6 = [(PPDKStorage *)self entityStream];
  v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F5B648];
    v9 = [v6 name];
    v10 = [v5 addObserverForName:v8 object:v9 queue:0 usingBlock:v4];
  }
  else
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing entity stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)registerForNamedEntitiesRemoteAdditionWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  v6 = [(PPDKStorage *)self entityStream];
  v7 = [v6 name];

  if (v7)
  {
    uint64_t v8 = *MEMORY[0x1E4F5B640];
    v9 = [v6 name];
    v10 = [v5 addObserverForName:v8 object:v9 queue:0 usingBlock:v4];
  }
  else
  {
    v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_ERROR, "Failed to register CoreDuet notification listener due to missing entity stream name.", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)eventForTopicRecord:(id)a3 sourceDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v8 = [MEMORY[0x1E4F5B440] compatibilityVersion];
  [v7 setObject:&unk_1F2568D98 forKeyedSubscript:v8];

  [v7 setObject:&unk_1F2568D98 forKeyedSubscript:@"compatVersion"];
  v9 = NSNumber;
  [v5 decayRate];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = [MEMORY[0x1E4F5B468] decayRate];
  [v7 setObject:v10 forKeyedSubscript:v11];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "algorithm"));
  v13 = [MEMORY[0x1E4F5B468] algorithm];
  [v7 setObject:v12 forKeyedSubscript:v13];

  v14 = NSNumber;
  [v5 initialScore];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v16 = [MEMORY[0x1E4F5B468] score];
  [v7 setObject:v15 forKeyedSubscript:v16];

  v17 = [v5 extractionOsBuild];

  if (v17)
  {
    v18 = [v5 extractionOsBuild];
    v19 = [MEMORY[0x1E4F5B468] osBuild];
    [v7 setObject:v18 forKeyedSubscript:v19];
  }
  [v5 extractionAssetVersion];
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "extractionAssetVersion"));
  v21 = [MEMORY[0x1E4F5B468] assetVersion];
  [v7 setObject:v20 forKeyedSubscript:v21];

  v22 = [v5 metadata];
  LODWORD(v21) = [v22 exactMatchInSourceText];

  if (v21)
  {
    v23 = NSNumber;
    v24 = [v5 metadata];
    v25 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "exactMatchInSourceText"));
    [v7 setObject:v25 forKeyedSubscript:@"exactMatchInSourceText"];
  }
  v26 = [v5 source];
  v27 = [v26 relevanceDate];

  if (v27)
  {
    v28 = NSNumber;
    v29 = [v5 source];
    v30 = [v29 relevanceDate];
    [v30 timeIntervalSince1970];
    v31 = objc_msgSend(v28, "numberWithDouble:");
    [v7 setObject:v31 forKeyedSubscript:@"sourceRelevanceDate"];
  }
  v32 = [v5 source];
  v33 = [v32 language];

  if (v33)
  {
    v34 = [v5 source];
    v35 = [v34 language];
    [v7 setObject:v35 forKeyedSubscript:@"sourceLanguage"];
  }
  id v36 = objc_alloc(MEMORY[0x1E4F5B5F0]);
  v37 = [v5 source];
  v38 = [v37 bundleId];
  [v5 source];
  v39 = v53 = v7;
  v40 = [v39 documentId];
  v41 = [v5 source];
  v42 = [v41 groupId];
  v43 = (void *)[v36 initWithIdentifier:@"portrait" bundleIdentifier:v38 itemIdentifier:v40 groupIdentifier:v42 deviceIdentifier:v6 userIdentifier:0];

  v44 = (void *)MEMORY[0x1E4F5B510];
  v45 = [(PPDKStorage *)self topicStream];
  v46 = [v5 source];
  v47 = [v46 date];
  v48 = [v5 source];
  v49 = [v48 date];
  v50 = [v5 topic];
  v51 = [v50 topicIdentifier];
  id v55 = [v44 eventWithStream:v45 source:v43 startDate:v47 endDate:v49 identifierStringValue:v51 metadata:v53];

  return v55;
}

- (id)topicRecordFromEvent:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 source];
  id v6 = [v5 bundleID];

  v7 = [v4 source];
  uint64_t v8 = [v7 itemID];

  v9 = [v4 value];
  v10 = [v9 stringValue];

  v11 = [v4 startDate];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  if (!v6 || !v8)
  {
    v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v81 = v6;
      __int16 v82 = 2112;
      v83 = v8;
      v18 = "Warning: PPDKStorage failed to create topic record from _DKEvent with missing source field(s). bundleID: %@ documentID: %@";
LABEL_12:
      v19 = v17;
      uint32_t v20 = 22;
LABEL_20:
      _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
  v14 = [v4 startDate];
  if (!v14 || fabs(v13) == INFINITY)
  {

    v17 = pp_default_log_handle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412290;
    v81 = v6;
    v18 = "Warning: PPDKStorage failed to create topic record from _DKEvent with invalid start date. Source: %@";
LABEL_19:
    v19 = v17;
    uint32_t v20 = 12;
    goto LABEL_20;
  }

  v15 = [v4 metadata];

  if (!v15)
  {
    v17 = pp_default_log_handle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 138412290;
    v81 = v6;
    v18 = "Warning: PPDKStorage failed to create named entity record from _DKEvent with metadata==nil. Source: %@";
    goto LABEL_19;
  }
  if (!v10 || ([v10 hasPrefix:@"Q"] & 1) == 0)
  {
    v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      v81 = v10;
      __int16 v82 = 2113;
      v83 = v6;
      v18 = "Warning: PPDKStorage failed to create topic record from _DKEvent due to invalid topic identifier %{sensitive"
            "}@. Source: %{private}@";
      goto LABEL_12;
    }
    goto LABEL_21;
  }
  if (-[PPDKStorage _isFutureCompatibilityVersionAttachedToEvent:]((uint64_t)self, v4))
  {
    v16 = 0;
    goto LABEL_23;
  }
  v22 = [v4 metadata];
  v23 = [MEMORY[0x1E4F5B468] algorithm];
  v17 = [v22 objectForKeyedSubscript:v23];

  v24 = [v4 metadata];
  v25 = [MEMORY[0x1E4F5B468] score];
  v26 = [v24 objectForKeyedSubscript:v25];

  v27 = [v4 metadata];
  v28 = [MEMORY[0x1E4F5B468] decayRate];
  v29 = [v27 objectForKeyedSubscript:v28];

  v30 = [v4 metadata];
  v31 = [MEMORY[0x1E4F5B468] sentimentScore];
  v32 = [v30 objectForKeyedSubscript:v31];
  v33 = v32;
  if (v32)
  {
    id v78 = v32;
  }
  else
  {
    [v4 metadata];
    v71 = v29;
    v35 = v34 = v26;
    id v78 = [v35 objectForKeyedSubscript:@"sentimentScore"];

    v26 = v34;
    v29 = v71;
  }

  id v36 = [v4 metadata];
  v37 = [MEMORY[0x1E4F5B468] osBuild];
  uint64_t v74 = [v36 objectForKeyedSubscript:v37];

  v38 = [v4 metadata];
  v39 = [MEMORY[0x1E4F5B468] assetVersion];
  v77 = [v38 objectForKeyedSubscript:v39];

  v40 = [v4 metadata];
  v73 = [v40 objectForKeyedSubscript:@"exactMatchInSourceText"];

  v41 = [v4 metadata];
  v79 = [v41 objectForKeyedSubscript:@"sourceLanguage"];

  v42 = [v4 metadata];
  v43 = [v42 objectForKeyedSubscript:@"sourceRelevanceDate"];

  uint64_t v44 = [v17 unsignedIntegerValue];
  uint64_t v45 = v44;
  v75 = v43;
  v76 = v26;
  if (v17 && v26 && v29)
  {
    uint64_t v68 = v44;
    [v26 doubleValue];
    if (v46 <= 2.0) {
      double v47 = v46;
    }
    else {
      double v47 = 1.0;
    }
    [v29 doubleValue];
    double v49 = v48;
    [v78 doubleValue];
    double v51 = v50;
    v72 = v29;
    if (v43)
    {
      id v52 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v43 doubleValue];
      uint64_t v53 = objc_msgSend(v52, "initWithTimeIntervalSince1970:");
    }
    else
    {
      uint64_t v53 = 0;
    }
    v70 = (void *)[objc_alloc(MEMORY[0x1E4F89F80]) initWithTopicIdentifier:v10];
    id v58 = objc_alloc(MEMORY[0x1E4F89F40]);
    v59 = [v4 source];
    v60 = [v59 groupID];
    v61 = [v4 startDate];
    v69 = (void *)v53;
    uint64_t v62 = [v58 initWithBundleId:v6 groupId:v60 documentId:v8 date:v61 relevanceDate:v53 contactHandles:0 language:v79 metadata:0];

    v16 = objc_opt_new();
    [v16 setTopic:v70];
    v67 = (void *)v62;
    [v16 setSource:v62];
    [v16 setAlgorithm:v68];
    [v16 setInitialScore:v47];
    [v16 setDecayRate:v49];
    [v16 setSentimentScore:v51];
    v63 = [v4 source];
    v64 = [v63 deviceID];
    [v16 setIsLocal:v64 == 0];

    v56 = (void *)v74;
    [v16 setExtractionOsBuild:v74];
    if (v77) {
      uint64_t v65 = [v77 unsignedLongValue];
    }
    else {
      uint64_t v65 = 0xFFFFFFFFLL;
    }
    v29 = v72;
    [v16 setExtractionAssetVersion:v65];
    v57 = v73;
    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F88]), "initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:", 1, 1, 0, 0, objc_msgSend(v73, "BOOLValue"));
    [v16 setMetadata:v66];
  }
  else
  {
    v54 = pp_default_log_handle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      id v55 = [MEMORY[0x1E4F89F98] describeAlgorithm:v45];
      *(_DWORD *)buf = 138412546;
      v81 = v6;
      __int16 v82 = 2112;
      v83 = v55;
      _os_log_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_DEFAULT, "Warning: PPDKStorage failed to create topic record from _DKEvent with missing metadata field(s). Source: %@ (%@)", buf, 0x16u);
    }
    v16 = 0;
    v57 = v73;
    v56 = (void *)v74;
  }

LABEL_22:
LABEL_23:

  return v16;
}

- (BOOL)_isFutureCompatibilityVersionAttachedToEvent:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1)
  {
    BOOL v14 = 0;
    goto LABEL_12;
  }
  id v5 = [v3 metadata];
  id v6 = [MEMORY[0x1E4F5B440] compatibilityVersion];
  v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v8 = [v4 metadata];
  v9 = v8;
  if (v7)
  {
    v10 = [MEMORY[0x1E4F5B440] compatibilityVersion];
    v11 = [v9 objectForKeyedSubscript:v10];
  }
  else
  {
    double v12 = [v8 objectForKeyedSubscript:@"compatVersion"];

    if (!v12)
    {
      v11 = &unk_1F2568D80;
      goto LABEL_7;
    }
    v9 = [v4 metadata];
    v11 = [v9 objectForKeyedSubscript:@"compatVersion"];
  }

LABEL_7:
  unsigned int v13 = [v11 unsignedIntValue];
  BOOL v14 = v13 > 2;
  if (v13 >= 3)
  {
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v17[0] = 67109120;
      v17[1] = [v11 unsignedIntValue];
      _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "Rejecting _DKEvent with compatibility version %u from THE MYSTERIOUS FUTURE.", (uint8_t *)v17, 8u);
    }
  }
LABEL_12:

  return v14;
}

- (id)eventForNamedEntityRecord:(id)a3 sourceDeviceID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  uint64_t v8 = [MEMORY[0x1E4F5B440] compatibilityVersion];
  [v7 setObject:&unk_1F2568D98 forKeyedSubscript:v8];

  [v7 setObject:&unk_1F2568D98 forKeyedSubscript:@"compatVersion"];
  v9 = NSNumber;
  [v5 decayRate];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = [MEMORY[0x1E4F5B3C0] decayRate];
  [v7 setObject:v10 forKeyedSubscript:v11];

  double v12 = [v5 entity];
  unsigned int v13 = [v12 name];
  BOOL v14 = [MEMORY[0x1E4F5B3C0] name];
  [v7 setObject:v13 forKeyedSubscript:v14];

  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "algorithm"));
  v16 = [MEMORY[0x1E4F5B3C0] algorithm];
  [v7 setObject:v15 forKeyedSubscript:v16];

  v17 = [v5 entity];
  uint64_t v18 = [v17 bestLanguage];
  v19 = [MEMORY[0x1E4F5B3C0] bestLanguage];
  [v7 setObject:v18 forKeyedSubscript:v19];

  uint32_t v20 = NSNumber;
  [v5 initialScore];
  v21 = objc_msgSend(v20, "numberWithDouble:");
  v22 = [MEMORY[0x1E4F5B3C0] score];
  [v7 setObject:v21 forKeyedSubscript:v22];

  v23 = NSNumber;
  [v5 sentimentScore];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v25 = [MEMORY[0x1E4F5B3C0] sentimentScore];
  [v7 setObject:v24 forKeyedSubscript:v25];

  v26 = [v5 extractionOsBuild];

  if (v26)
  {
    v27 = [v5 extractionOsBuild];
    v28 = [MEMORY[0x1E4F5B3C0] osBuild];
    [v7 setObject:v27 forKeyedSubscript:v28];
  }
  [v5 extractionAssetVersion];
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "extractionAssetVersion"));
  v30 = [MEMORY[0x1E4F5B3C0] assetVersion];
  [v7 setObject:v29 forKeyedSubscript:v30];

  v31 = [v5 source];
  v32 = [v31 relevanceDate];

  if (v32)
  {
    v33 = NSNumber;
    v34 = [v5 source];
    v35 = [v34 relevanceDate];
    [v35 timeIntervalSince1970];
    id v36 = objc_msgSend(v33, "numberWithDouble:");
    [v7 setObject:v36 forKeyedSubscript:@"sourceRelevanceDate"];
  }
  v37 = [v5 source];
  v38 = [v37 language];

  if (v38)
  {
    v39 = [v5 source];
    v40 = [v39 language];
    [v7 setObject:v40 forKeyedSubscript:@"sourceLanguage"];
  }
  id v41 = objc_alloc(MEMORY[0x1E4F5B5F0]);
  v42 = [v5 source];
  v43 = [v42 bundleId];
  uint64_t v44 = [v5 source];
  uint64_t v45 = [v44 documentId];
  double v46 = [v5 source];
  double v47 = [v46 groupId];
  double v48 = (void *)[v41 initWithIdentifier:@"portrait" bundleIdentifier:v43 itemIdentifier:v45 groupIdentifier:v47 deviceIdentifier:v6 userIdentifier:0];

  double v49 = (void *)MEMORY[0x1E4F5B510];
  double v50 = [(PPDKStorage *)self entityStream];
  double v51 = [v5 source];
  id v52 = [v51 date];
  uint64_t v53 = [v5 source];
  v54 = [v53 date];
  id v55 = [v5 entity];
  v56 = objc_msgSend(v49, "eventWithStream:source:startDate:endDate:categoryIntegerValue:confidence:metadata:", v50, v48, v52, v54, objc_msgSend(v55, "category"), v7, 1.0);

  return v56;
}

- (id)namedEntityRecordFromEvent:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 source];
  id v6 = [v5 bundleID];

  v7 = [v4 source];
  uint64_t v8 = [v7 itemID];

  v9 = [v4 startDate];
  [v9 timeIntervalSinceReferenceDate];
  double v11 = v10;

  if (!v6 || !v8)
  {
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v82 = v6;
      __int16 v83 = 2112;
      uint64_t v84 = v8;
      v16 = "Warning: PPDKStorage failed to create topic record from _DKEvent with missing source field(s). bundleID: %@ documentID: %@";
      v17 = v15;
      uint32_t v18 = 22;
LABEL_15:
      _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  double v12 = [v4 metadata];

  if (!v12)
  {
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v82 = v6;
      v16 = "Warning: PPDKStorage failed to create named entity record from _DKEvent with metadata==nil. Source: %@";
LABEL_14:
      v17 = v15;
      uint32_t v18 = 12;
      goto LABEL_15;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  unsigned int v13 = [v4 startDate];
  if (!v13 || fabs(v11) == INFINITY)
  {

    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v82 = v6;
      v16 = "Warning: PPDKStorage failed to create named entity record from _DKEvent with invalid start date. Source: %@";
      goto LABEL_14;
    }
    goto LABEL_16;
  }

  if (-[PPDKStorage _isFutureCompatibilityVersionAttachedToEvent:]((uint64_t)self, v4))
  {
    BOOL v14 = 0;
    goto LABEL_18;
  }
  uint32_t v20 = [v4 metadata];
  v21 = [MEMORY[0x1E4F5B3C0] name];
  v15 = [v20 objectForKeyedSubscript:v21];

  v22 = [v4 metadata];
  v23 = [MEMORY[0x1E4F5B3C0] bestLanguage];
  uint64_t v80 = [v22 objectForKeyedSubscript:v23];

  v24 = [v4 metadata];
  v25 = [MEMORY[0x1E4F5B3C0] score];
  uint64_t v26 = [v24 objectForKeyedSubscript:v25];

  v27 = [v4 metadata];
  v28 = [MEMORY[0x1E4F5B3C0] decayRate];
  v29 = [v27 objectForKeyedSubscript:v28];

  v30 = [v4 metadata];
  v31 = [MEMORY[0x1E4F5B3C0] algorithm];
  v32 = [v30 objectForKeyedSubscript:v31];

  v33 = [v4 metadata];
  v34 = [MEMORY[0x1E4F5B3C0] sentimentScore];
  v35 = [v33 objectForKeyedSubscript:v34];
  id v36 = v35;
  v79 = (void *)v26;
  if (v35)
  {
    id v75 = v35;
  }
  else
  {
    v37 = [v4 metadata];
    id v75 = [v37 objectForKeyedSubscript:@"sentimentScore"];
  }
  v38 = [v4 metadata];
  v39 = [MEMORY[0x1E4F5B3C0] osBuild];
  v40 = [v38 objectForKeyedSubscript:v39];

  id v41 = [v4 metadata];
  v42 = [MEMORY[0x1E4F5B3C0] assetVersion];
  id v78 = [v41 objectForKeyedSubscript:v42];

  v43 = [v4 metadata];
  v77 = [v43 objectForKeyedSubscript:@"sourceLanguage"];

  uint64_t v44 = [v4 metadata];
  v76 = [v44 objectForKeyedSubscript:@"sourceRelevanceDate"];

  uint64_t v45 = [v32 unsignedIntegerValue];
  double v47 = v79;
  double v46 = (void *)v80;
  uint64_t v74 = v29;
  if (v15 && v80 && v32 && v79 && v29)
  {
    uint64_t v70 = v45;
    [v79 doubleValue];
    if (v48 <= 2.0) {
      double v49 = v48;
    }
    else {
      double v49 = 1.0;
    }
    [v29 doubleValue];
    double v51 = v50;
    [v75 doubleValue];
    double v53 = v52;
    v71 = v40;
    v73 = v32;
    if (v76)
    {
      id v54 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v76 doubleValue];
      uint64_t v55 = objc_msgSend(v54, "initWithTimeIntervalSince1970:");
    }
    else
    {
      uint64_t v55 = 0;
    }
    v60 = [v4 value];
    uint64_t v61 = [v60 integerValue];

    uint64_t v62 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v15 category:v61 language:v80];
    id v63 = objc_alloc(MEMORY[0x1E4F89F40]);
    v64 = [v4 source];
    uint64_t v65 = [v64 groupID];
    v66 = [v4 startDate];
    v69 = (void *)v55;
    v67 = (void *)[v63 initWithBundleId:v6 groupId:v65 documentId:v8 date:v66 relevanceDate:v55 contactHandles:0 language:v77 metadata:0];

    BOOL v14 = objc_opt_new();
    [v14 setEntity:v62];
    [v14 setSource:v67];
    [v14 setAlgorithm:v70];
    [v14 setInitialScore:v49];
    [v14 setDecayRate:v51];
    [v14 setSentimentScore:v53];
    v40 = v71;
    [v14 setExtractionOsBuild:v71];
    if (v78) {
      uint64_t v68 = [v78 unsignedLongValue];
    }
    else {
      uint64_t v68 = 0xFFFFFFFFLL;
    }
    v59 = v74;
    [v14 setExtractionAssetVersion:v68];

    double v47 = v79;
    double v46 = (void *)v80;
    v32 = v73;
  }
  else
  {
    uint64_t v56 = v45;
    v57 = pp_default_log_handle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x1E4F89EA8] describeAlgorithm:v56];
      id v58 = v72 = v40;
      *(_DWORD *)buf = 138412546;
      __int16 v82 = v6;
      __int16 v83 = 2112;
      uint64_t v84 = v58;
      _os_log_impl(&dword_1CA9A8000, v57, OS_LOG_TYPE_DEFAULT, "Warning: PPDKStorage failed to create named entity record from _DKEvent with missing metadata field(s). Source: %@ (%@)", buf, 0x16u);

      v40 = v72;
    }

    BOOL v14 = 0;
    v59 = v74;
  }

LABEL_17:
LABEL_18:

  return v14;
}

- (BOOL)deleteAllEventsInEventStream:(id)a3 matchingPredicate:(id)a4 error:(id *)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F5B5D0];
  double v10 = [a3 name];
  double v11 = [v9 predicateForEventsWithStreamName:v10];

  double v12 = (void *)MEMORY[0x1E4F28BA0];
  v23[0] = v11;
  v23[1] = v8;
  unsigned int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  BOOL v14 = [v12 andPredicateWithSubpredicates:v13];

  if (a5) {
    *a5 = 0;
  }
  v15 = -[PPDKStorage _readWriteKnowledgeStore](self);
  id v20 = 0;
  uint64_t v16 = [v15 deleteAllEventsMatchingPredicate:v14 error:&v20];
  id v17 = v20;

  uint32_t v18 = pp_default_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = v16;
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPDKStorage deleteAllEventsInEventStream:matchingPredicate delete %lu items", buf, 0xCu);
  }

  return v17 == 0;
}

- (id)_readWriteKnowledgeStore
{
  if (a1)
  {
    if (_readWriteKnowledgeStore__pasOnceToken8 != -1) {
      dispatch_once(&_readWriteKnowledgeStore__pasOnceToken8, &__block_literal_global_99);
    }
    a1 = (id)_readWriteKnowledgeStore__pasExprOnceResult;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __39__PPDKStorage__readWriteKnowledgeStore__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [MEMORY[0x1E4F5B560] userKnowledgeStore];
  v2 = (void *)_readWriteKnowledgeStore__pasExprOnceResult;
  _readWriteKnowledgeStore__pasExprOnceResult = v1;
}

- (BOOL)deleteAllEventsInEventStream:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = -[PPDKStorage _readWriteKnowledgeStore](self);
  id v12 = 0;
  uint64_t v8 = [v7 deleteAllEventsInEventStream:v6 error:&v12];

  id v9 = v12;
  if (a4) {
    *a4 = v9;
  }
  double v10 = pp_default_log_handle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPDKStorage deleteAllEventsInEventStream delete %lu items", buf, 0xCu);
  }

  return v9 == 0;
}

- (BOOL)deleteEvents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[PPDKStorage _readWriteKnowledgeStore](self);
  LOBYTE(a4) = [v7 deleteObjects:v6 error:a4];

  return (char)a4;
}

- (BOOL)saveEvents:(id)a3 stream:(id)a4 maxRetries:(int64_t)a5 retryInterval:(double)a6 shouldContinueBlock:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (![v12 count])
  {
    BOOL v30 = 1;
    goto LABEL_55;
  }
  uint64_t v15 = [(PPDKStorage *)self entityStream];
  int v16 = [v13 isEqual:v15];

  if (v16)
  {
    id v17 = v12;
    uint32_t v18 = (unsigned int (**)(void))v14;
    if (self)
    {
      id v51 = v14;
      id v52 = v13;
      id v53 = v12;
      if (a6 <= 1.0)
      {
        double v49 = [MEMORY[0x1E4F28B00] currentHandler];
        [v49 handleFailureInMethod:sel__saveEntityEvents_maxRetries_retryInterval_shouldContinueBlock_, self, @"PPDKStorage.m", 339, @"Invalid parameter not satisfying: %@", @"retryInterval > 1.0" object file lineNumber description];
      }
      int64_t v19 = 0;
      if ((a5 & 0x8000000000000000) == 0)
      {
LABEL_7:
        if (v19 < a5)
        {
          ++v19;
          goto LABEL_9;
        }
LABEL_41:
        BOOL v30 = 0;
        goto LABEL_52;
      }
      while (1)
      {
LABEL_9:
        id v20 = v17;
        [(PPDKStorage *)self entityStreamCooldownTimeRemaining];
        if (v21 <= 0.0)
        {
          int v27 = [MEMORY[0x1E4F93B18] waitForSemaphore:self->_entityWriteSem timeoutSeconds:0.0];
          v28 = pp_default_log_handle();
          uint64_t v22 = v28;
          if (!v27)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              uint64_t v43 = [v20 count];
              *(_DWORD *)v59 = 134217984;
              uint64_t v60 = v43;
              _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_INFO, "PPDKStorage sending %tu events to named entity stream.", v59, 0xCu);
            }

            uint64_t v44 = -[PPDKStorage _readWriteKnowledgeStore](self);
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            uint64_t v45 = __33__PPDKStorage__saveEntityEvents___block_invoke;
            goto LABEL_51;
          }
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v59 = 0;
            v24 = v22;
            v25 = "PPDKStorage: writing to the named entity stream failed because another write already in progress.";
            uint32_t v26 = 2;
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v22 = pp_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            [(PPDKStorage *)self entityStreamCooldownTimeRemaining];
            *(_DWORD *)v59 = 134217984;
            uint64_t v60 = v23;
            v24 = v22;
            v25 = "PPDKStorage: rate limit blocked write to the named entity stream. %f seconds remaining.";
            uint32_t v26 = 12;
LABEL_20:
            _os_log_debug_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_DEBUG, v25, v59, v26);
          }
        }

        if (!v18[2](v18)) {
          goto LABEL_41;
        }
        v29 = pp_default_log_handle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(double *)((char *)&buf + 4) = a6;
          _os_log_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_INFO, "PPDKStorage: duet write sleeping to stay within rate limits. Retrying in %f seconds.", (uint8_t *)&buf, 0xCu);
        }

        [MEMORY[0x1E4F29060] sleepForTimeInterval:a6];
        if ((a5 & 0x8000000000000000) == 0) {
          goto LABEL_7;
        }
      }
    }
LABEL_56:
    BOOL v30 = 0;
    goto LABEL_53;
  }
  v31 = [(PPDKStorage *)self topicStream];
  int v32 = [v13 isEqual:v31];

  if (!v32)
  {
    id v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_fault_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_FAULT, "PPDKStorage: attempted save to unknown stream: %@", (uint8_t *)&buf, 0xCu);
    }
    BOOL v30 = 0;
    goto LABEL_54;
  }
  id v17 = v12;
  uint32_t v18 = (unsigned int (**)(void))v14;
  if (!self) {
    goto LABEL_56;
  }
  id v51 = v14;
  id v52 = v13;
  id v53 = v12;
  if (a6 <= 1.0)
  {
    double v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:sel__saveTopicEvents_maxRetries_retryInterval_shouldContinueBlock_, self, @"PPDKStorage.m", 292, @"Invalid parameter not satisfying: %@", @"retryInterval > 1.0" object file lineNumber description];
  }
  int64_t v33 = 0;
  if ((a5 & 0x8000000000000000) == 0)
  {
LABEL_27:
    if (v33 < a5)
    {
      ++v33;
      goto LABEL_29;
    }
    goto LABEL_41;
  }
  while (1)
  {
LABEL_29:
    id v20 = v17;
    [(PPDKStorage *)self topicStreamCooldownTimeRemaining];
    if (v34 > 0.0)
    {
      v35 = pp_default_log_handle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        [(PPDKStorage *)self topicStreamCooldownTimeRemaining];
        *(_DWORD *)v59 = 134217984;
        uint64_t v60 = v36;
        v37 = v35;
        v38 = "PPDKStorage: rate limit blocked write to the topic stream. %f seconds remaining.";
        uint32_t v39 = 12;
LABEL_40:
        _os_log_debug_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_DEBUG, v38, v59, v39);
        goto LABEL_34;
      }
      goto LABEL_34;
    }
    int v40 = [MEMORY[0x1E4F93B18] waitForSemaphore:self->_topicWriteSem timeoutSeconds:0.0];
    id v41 = pp_default_log_handle();
    v35 = v41;
    if (!v40) {
      break;
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v59 = 0;
      v37 = v35;
      v38 = "PPDKStorage: writing to the topic stream failed because another write is already in progress.";
      uint32_t v39 = 2;
      goto LABEL_40;
    }
LABEL_34:

    if (!v18[2](v18)) {
      goto LABEL_41;
    }
    v42 = pp_default_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = a6;
      _os_log_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_INFO, "PPDKStorage: duet write sleeping to stay within rate limits. Retrying in %f seconds.", (uint8_t *)&buf, 0xCu);
    }

    [MEMORY[0x1E4F29060] sleepForTimeInterval:a6];
    if ((a5 & 0x8000000000000000) == 0) {
      goto LABEL_27;
    }
  }
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    uint64_t v46 = [v20 count];
    *(_DWORD *)v59 = 134217984;
    uint64_t v60 = v46;
    _os_log_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_INFO, "PPDKStorage sending %tu events to topic stream", v59, 0xCu);
  }

  uint64_t v44 = -[PPDKStorage _readWriteKnowledgeStore](self);
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  uint64_t v45 = __32__PPDKStorage__saveTopicEvents___block_invoke;
LABEL_51:
  uint64_t v55 = v45;
  uint64_t v56 = &unk_1E65D6478;
  double v47 = v20;
  v57 = v47;
  id v58 = self;
  [v44 saveObjects:v47 responseQueue:0 withCompletion:&buf];

  BOOL v30 = 1;
LABEL_52:
  id v13 = v52;
  id v12 = v53;
  id v14 = v51;
LABEL_53:

LABEL_54:
LABEL_55:

  return v30;
}

void __32__PPDKStorage__saveTopicEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "_DKKnowledgeStore finished writing %tu events to the topic stream", (uint8_t *)&v9, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    uint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = (uint64_t)v5;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "_DKKnowledgeStore failed to save topic events with error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 16) runWithLockAcquired:&__block_literal_global_121];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 32));
}

void __32__PPDKStorage__saveTopicEvents___block_invoke_119(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (id)v2[1];
  v2[1] = v3;
}

void __33__PPDKStorage__saveEntityEvents___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_INFO, "_DKKnowledgeStore finished writing %tu events to the named entity stream.", (uint8_t *)&v9, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    uint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      uint64_t v10 = (uint64_t)v5;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "_DKKnowledgeStore failed to save named entity events with error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 8) runWithLockAcquired:&__block_literal_global_127];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 24));
}

void __33__PPDKStorage__saveEntityEvents___block_invoke_125(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (id)v2[1];
  v2[1] = v3;
}

- (BOOL)iterEventBatchesMatchingPredicate:(id)a3 streams:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 readMetaData:(BOOL)a7 remoteOnly:(BOOL)a8 error:(id *)a9 block:(id)a10
{
  BOOL v33 = a7;
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v13 = (void (**)(id, void *, unsigned char *))a10;
  id v14 = 0;
  uint64_t v15 = 0;
  BOOL v16 = 0;
  if (a6 <= 1) {
    unint64_t v17 = 1;
  }
  else {
    unint64_t v17 = a6;
  }
  unint64_t v18 = 0x1E4F5B000uLL;
  while (1)
  {
    if (v16)
    {
      char v32 = 1;
      id v25 = v14;
      goto LABEL_22;
    }
    int64_t v19 = (void *)MEMORY[0x1CB79D060]();
    id v20 = [*(id *)(v18 + 1304) eventQueryWithPredicate:v38 eventStreams:v37 offset:v15 limit:v17 sortDescriptors:v36];
    [v20 setReadMetadata:v33];
    if (!v20)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"PPDKStorage.m" lineNumber:238 description:@"unexpectedly nil query"];
    }
    double v21 = *(void **)(v18 + 1304);
    if (a8) {
      [v21 onlyRemoteDevice];
    }
    else {
    uint64_t v22 = [v21 allDevices];
    }
    [v20 setDeviceIDs:v22];

    uint64_t v23 = -[PPDKStorage _readWriteKnowledgeStore](self);
    id v40 = v14;
    v24 = [v23 executeQuery:v20 error:&v40];
    id v25 = v40;

    if (!v24) {
      break;
    }
    uint32_t v26 = objc_msgSend(v24, "_pas_filteredArrayWithTest:", &__block_literal_global_107);

    char v39 = 0;
    v13[2](v13, v26, &v39);
    if (!v39)
    {
      v15 += [v26 count];
      int v28 = 0;
      BOOL v16 = [v26 count] < v17;
      goto LABEL_18;
    }
    BOOL v16 = 0;
    char v32 = 1;
LABEL_16:
    int v28 = 1;
LABEL_18:

    id v14 = v25;
    unint64_t v18 = 0x1E4F5B000;
    if (v28) {
      goto LABEL_22;
    }
  }
  if (a9)
  {
    id v27 = v25;
    char v32 = 0;
    BOOL v16 = 0;
    uint32_t v26 = *a9;
    *a9 = v27;
    goto LABEL_16;
  }

  char v32 = 0;
LABEL_22:

  return v32 & 1;
}

uint64_t __119__PPDKStorage_iterEventBatchesMatchingPredicate_streams_sortDescriptors_batchSize_readMetaData_remoteOnly_error_block___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[PPSettings sharedInstance];
  id v4 = [v2 source];

  id v5 = [v4 bundleID];
  uint64_t v6 = [v3 bundleIdentifierIsEnabledForDonation:v5];

  return v6;
}

- (BOOL)iterEventBatchesMatchingPredicate:(id)a3 streams:(id)a4 sortDescriptors:(id)a5 batchSize:(unint64_t)a6 error:(id *)a7 block:(id)a8
{
  return [(PPDKStorage *)self iterEventBatchesMatchingPredicate:a3 streams:a4 sortDescriptors:a5 batchSize:a6 readMetaData:1 remoteOnly:0 error:a7 block:a8];
}

- (double)entityStreamCooldownTimeRemaining
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6511;
  id v14 = __Block_byref_object_dispose__6512;
  id v15 = 0;
  entityLock = self->_entityLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__PPDKStorage_entityStreamCooldownTimeRemaining__block_invoke;
  v9[3] = &unk_1E65D6410;
  v9[4] = &v10;
  [(_PASLock *)entityLock runWithLockAcquired:v9];
  id v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  [v4 timeIntervalSinceNow];
  double v6 = v5;

  [(PPDKStorage *)self namedEntityWriteBatchInterval];
  double result = v6 + v7;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

void __48__PPDKStorage_entityStreamCooldownTimeRemaining__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (double)topicStreamCooldownTimeRemaining
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__6511;
  id v14 = __Block_byref_object_dispose__6512;
  id v15 = 0;
  topicLock = self->_topicLock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__PPDKStorage_topicStreamCooldownTimeRemaining__block_invoke;
  v9[3] = &unk_1E65D6410;
  v9[4] = &v10;
  [(_PASLock *)topicLock runWithLockAcquired:v9];
  id v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  [v4 timeIntervalSinceNow];
  double v6 = v5;

  [(PPDKStorage *)self topicWriteBatchInterval];
  double result = v6 + v7;
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

void __47__PPDKStorage_topicStreamCooldownTimeRemaining__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)tombstoneStream
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __30__PPDKStorage_tombstoneStream__block_invoke;
  v3[3] = &unk_1E65DA8A8;
  v3[4] = self;
  v3[5] = a2;
  if (tombstoneStream__pasOnceToken5 != -1) {
    dispatch_once(&tombstoneStream__pasOnceToken5, v3);
  }
  return (id)tombstoneStream__pasExprOnceResult;
}

void __30__PPDKStorage_tombstoneStream__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v3 = [MEMORY[0x1E4F5B5F8] tombstoneStream];
  if (!v3)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPDKStorage.m" lineNumber:177 description:@"Unable to resolve _DKEventStream /event/tombstone"];
  }
  id v4 = (void *)tombstoneStream__pasExprOnceResult;
  tombstoneStream__pasExprOnceResult = v3;
}

- (id)topicStream
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__PPDKStorage_topicStream__block_invoke;
  v3[3] = &unk_1E65DA8A8;
  v3[4] = self;
  v3[5] = a2;
  if (topicStream__pasOnceToken4 != -1) {
    dispatch_once(&topicStream__pasOnceToken4, v3);
  }
  return (id)topicStream__pasExprOnceResult;
}

void __26__PPDKStorage_topicStream__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v3 = [MEMORY[0x1E4F5B448] topicStream];
  if (!v3)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPDKStorage.m" lineNumber:168 description:@"Unable to resolve _DKEventStream /portrait/topic"];
  }
  id v4 = (void *)topicStream__pasExprOnceResult;
  topicStream__pasExprOnceResult = v3;
}

- (id)entityStream
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__PPDKStorage_entityStream__block_invoke;
  v3[3] = &unk_1E65DA8A8;
  v3[4] = self;
  v3[5] = a2;
  if (entityStream__pasOnceToken3 != -1) {
    dispatch_once(&entityStream__pasOnceToken3, v3);
  }
  return (id)entityStream__pasExprOnceResult;
}

void __27__PPDKStorage_entityStream__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v3 = [MEMORY[0x1E4F5B448] entityStream];
  if (!v3)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PPDKStorage.m" lineNumber:159 description:@"Unable to resolve _DKEventStream /portrait/entity"];
  }
  id v4 = (void *)entityStream__pasExprOnceResult;
  entityStream__pasExprOnceResult = v3;
}

- (double)namedEntityWriteBatchInterval
{
  return 30.0;
}

- (unsigned)namedEntityWriteBatchSize
{
  return 25;
}

- (double)topicWriteBatchInterval
{
  return 30.0;
}

- (unsigned)topicWriteBatchSize
{
  return 15;
}

- (unsigned)readBatchSize
{
  return 50;
}

+ (PPDKStorage)sharedInstance
{
  if (sharedInstance__pasOnceToken2_6525 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_6525, &__block_literal_global_6526);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_6527;
  return (PPDKStorage *)v2;
}

void __29__PPDKStorage_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = [PPDKStorage alloc];
  if (v1
    && (v23.receiver = v1,
        v23.super_class = (Class)PPDKStorage,
        (id v2 = objc_msgSendSuper2(&v23, sel_init)) != 0))
  {
    uint64_t v3 = v2;
    id v4 = objc_opt_new();
    uint64_t v5 = objc_opt_new();
    double v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v4];
    uint64_t v8 = (void *)v3[1];
    v3[1] = v7;

    int v9 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = (void *)v9[1];
    v9[1] = v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v9];
    id v13 = (void *)v3[2];
    v3[2] = v12;

    dispatch_semaphore_t v14 = dispatch_semaphore_create(1);
    id v15 = (void *)v3[3];
    v3[3] = v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(1);
    unint64_t v17 = (void *)v3[4];
    v3[4] = v16;

    id v18 = (id)[v3 registerForNamedEntitiesRemoteAdditionWithBlock:&__block_literal_global_155];
    id v19 = (id)[v3 registerForNamedEntitiesRemoteDeletionWithBlock:&__block_literal_global_158];
    id v20 = (id)[v3 registerForTopicsRemoteAdditionWithBlock:&__block_literal_global_160];
    id v21 = (id)[v3 registerForTopicsRemoteDeletionWithBlock:&__block_literal_global_163];
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v22 = (void *)sharedInstance__pasExprOnceResult_6527;
  sharedInstance__pasExprOnceResult_6527 = (uint64_t)v3;
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke_4()
{
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke_3()
{
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke_2()
{
}

void __44__PPDKStorage__registerForSyncNotifications__block_invoke()
{
}

@end