@interface FCModifyHistoryCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyHistoryCommand)initWithHistoryItems:(id)a3 merge:(BOOL)a4;
- (NSArray)historyItems;
- (NSArray)recordItems;
- (id)recordZoneName;
@end

@implementation FCModifyHistoryCommand

- (FCModifyHistoryCommand)initWithHistoryItems:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__FCModifyHistoryCommand_initWithHistoryItems_merge___block_invoke;
  aBlock[3] = &unk_1E5B505B0;
  id v13 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  v11.receiver = self;
  v11.super_class = (Class)FCModifyHistoryCommand;
  v9 = [(FCModifyRecordsCommand *)&v11 initWithLocalRecordsGenerator:v8 merge:v4];

  return v9;
}

id __53__FCModifyHistoryCommand_initWithHistoryItems_merge___block_invoke(uint64_t a1)
{
  v1 = _FCPruneHistoryForUpload(*(void **)(a1 + 32), &__block_literal_global_105, &__block_literal_global_11_2);
  v2 = objc_msgSend(v1, "fc_arrayByTransformingWithBlock:", &__block_literal_global_69);

  return v2;
}

uint64_t __53__FCModifyHistoryCommand_initWithHistoryItems_merge___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (id)recordZoneName
{
  return @"ReadingHistory";
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"lastVisited"];
  v65 = [v6 objectForKeyedSubscript:@"lastVisited"];
  v66 = v7;
  uint64_t v8 = [v7 compare:v65];
  BOOL v9 = v8 == 1;
  if (v8 == 1)
  {
    v10 = [v5 objectForKeyedSubscript:@"lastVisited"];
    [v6 setObject:v10 forKeyedSubscript:@"lastVisited"];
  }
  objc_super v11 = [v5 objectForKeyedSubscript:@"lastListened"];
  v63 = [v6 objectForKeyedSubscript:@"lastListened"];
  v64 = v11;
  if ([v11 compare:v63] == 1)
  {
    v12 = [v5 objectForKeyedSubscript:@"lastListened"];
    [v6 setObject:v12 forKeyedSubscript:@"lastListened"];

    BOOL v9 = 1;
  }
  id v13 = [v5 objectForKeyedSubscript:@"readingPositionLastSaved"];
  v14 = [v6 objectForKeyedSubscript:@"readingPositionLastSaved"];
  if ([v13 compare:v14] == 1)
  {
    v15 = [v5 objectForKeyedSubscript:@"readingPositionLastSaved"];
    [v6 setObject:v15 forKeyedSubscript:@"readingPositionLastSaved"];

    v16 = [v5 objectForKeyedSubscript:@"readingPosition"];
    [v6 setObject:v16 forKeyedSubscript:@"readingPosition"];

    BOOL v9 = 1;
  }
  v17 = [v5 objectForKeyedSubscript:@"listeningProgressLastSaved"];
  v18 = [v6 objectForKeyedSubscript:@"listeningProgressLastSaved"];
  if ([v17 compare:v18] == 1)
  {
    v19 = [v5 objectForKeyedSubscript:@"listeningProgressLastSaved"];
    [v6 setObject:v19 forKeyedSubscript:@"listeningProgressLastSaved"];

    v20 = [v5 objectForKeyedSubscript:@"listeningProgress"];
    [v6 setObject:v20 forKeyedSubscript:@"listeningProgress"];

    BOOL v9 = 1;
  }
  v21 = [v5 objectForKeyedSubscript:@"articleRead"];
  int v22 = [v21 BOOLValue];

  if (v22 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"articleRead"))
  {
    v23 = [v5 objectForKeyedSubscript:@"articleRead"];
    [v6 setObject:v23 forKeyedSubscript:@"articleRead"];

    BOOL v9 = 1;
  }
  v24 = [v5 objectForKeyedSubscript:@"articleSeen"];
  int v25 = [v24 BOOLValue];

  if (v25 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"articleSeen"))
  {
    v26 = [v5 objectForKeyedSubscript:@"articleSeen"];
    [v6 setObject:v26 forKeyedSubscript:@"articleSeen"];

    BOOL v9 = 1;
  }
  v27 = [v5 objectForKeyedSubscript:@"completedListening"];
  int v28 = [v27 BOOLValue];

  if (v28 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"completedListening"))
  {
    v29 = [v5 objectForKeyedSubscript:@"completedListening"];
    [v6 setObject:v29 forKeyedSubscript:@"completedListening"];

    BOOL v9 = 1;
  }
  v30 = [v5 objectForKeyedSubscript:@"completedReading"];
  int v31 = [v30 BOOLValue];

  if (v31 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"completedReading"))
  {
    v32 = [v5 objectForKeyedSubscript:@"completedReading"];
    [v6 setObject:v32 forKeyedSubscript:@"completedReading"];

    BOOL v9 = 1;
  }
  v33 = [v5 objectForKeyedSubscript:@"articleConsumed"];
  int v34 = [v33 BOOLValue];

  if (v34 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"articleConsumed"))
  {
    v35 = [v5 objectForKeyedSubscript:@"articleConsumed"];
    [v6 setObject:v35 forKeyedSubscript:@"articleConsumed"];

    uint64_t v36 = [v5 objectForKeyedSubscript:@"sourceChannelTagID"];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [v6 objectForKeyedSubscript:@"sourceChannelTagID"];

      if (!v38)
      {
        v39 = [v5 objectForKeyedSubscript:@"sourceChannelTagID"];
        [v6 setObject:v39 forKeyedSubscript:@"sourceChannelTagID"];

        v40 = [v5 objectForKeyedSubscript:@"deviceID"];
        [v6 setObject:v40 forKeyedSubscript:@"deviceID"];
      }
    }
    BOOL v9 = 1;
  }
  v41 = [v5 objectForKeyedSubscript:@"offensive"];
  int v42 = [v41 BOOLValue];

  if (v42 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"offensive"))
  {
    v43 = [v5 objectForKeyedSubscript:@"offensive"];
    [v6 setObject:v43 forKeyedSubscript:@"offensive"];

    BOOL v9 = 1;
  }
  v44 = [v5 objectForKeyedSubscript:@"liked"];
  int v45 = [v44 BOOLValue];

  if (v45 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"liked"))
  {
    v46 = [v5 objectForKeyedSubscript:@"liked"];
    [v6 setObject:v46 forKeyedSubscript:@"liked"];

    BOOL v9 = 1;
  }
  v47 = [v5 objectForKeyedSubscript:@"disliked"];
  int v48 = [v47 BOOLValue];

  if (v48 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"disliked"))
  {
    v49 = [v5 objectForKeyedSubscript:@"disliked"];
    [v6 setObject:v49 forKeyedSubscript:@"disliked"];

    BOOL v9 = 1;
  }
  v50 = [v5 objectForKeyedSubscript:@"listenedCount"];
  int v51 = [v50 intValue];

  if (v51 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"listenedCount"))
  {
    v52 = [v5 objectForKeyedSubscript:@"listenedCount"];
    [v6 setObject:v52 forKeyedSubscript:@"listenedCount"];

    BOOL v9 = 1;
  }
  v53 = [v5 objectForKeyedSubscript:@"readCount"];
  int v54 = [v53 intValue];

  if (v54 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"readCount"))
  {
    v55 = [v5 objectForKeyedSubscript:@"readCount"];
    [v6 setObject:v55 forKeyedSubscript:@"readCount"];

    BOOL v9 = 1;
  }
  v56 = [v5 objectForKeyedSubscript:@"removedFromAudio"];
  int v57 = [v56 BOOLValue];

  if (v57 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"removedFromAudio"))
  {
    v58 = [v5 objectForKeyedSubscript:@"removedFromAudio"];
    [v6 setObject:v58 forKeyedSubscript:@"removedFromAudio"];

    BOOL v9 = 1;
  }
  v59 = [v5 objectForKeyedSubscript:@"pruningDisabled"];
  int v60 = [v59 BOOLValue];

  if (v60 && objc_msgSend(v5, "fc_isDifferentFromRecord:forKey:", v6, @"pruningDisabled"))
  {
    v61 = [v5 objectForKeyedSubscript:@"pruningDisabled"];
    [v6 setObject:v61 forKeyedSubscript:@"pruningDisabled"];

    BOOL v9 = 1;
  }

  return v9;
}

- (NSArray)historyItems
{
  return self->_historyItems;
}

- (NSArray)recordItems
{
  return self->_recordItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordItems, 0);
  objc_storeStrong((id *)&self->_historyItems, 0);
}

@end