@interface FCReadingHistoryMigrator
- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4;
- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6;
@end

@implementation FCReadingHistoryMigrator

- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4
{
  return a4 == 8;
}

- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6
{
  id v7 = a4;
  BOOL v8 = +[FCPrivateDataController isLocalStoreKeyInternal:a5];
  id v9 = v7;
  if (!v8)
  {
    id v10 = v7;
    id v9 = objc_alloc_init(MEMORY[0x1E4F82B88]);
    v11 = [v10 objectForKeyedSubscript:@"articleID"];
    [v9 setArticleID:v11];

    v12 = [v10 objectForKeyedSubscript:@"sourceChannelTagID"];
    [v9 setSourceChannelTagID:v12];

    v13 = [v10 objectForKeyedSubscript:@"deviceID"];
    [v9 setDeviceID:v13];

    v14 = [v10 objectForKeyedSubscript:@"lastVisited"];
    [v9 setLastVisitedAt:v14];

    v15 = [v10 objectForKeyedSubscript:@"articleRead"];
    objc_msgSend(v9, "setHasArticleBeenRead:", objc_msgSend(v15, "BOOLValue"));

    v16 = [v10 objectForKeyedSubscript:@"articleSeen"];
    objc_msgSend(v9, "setHasArticleBeenSeen:", objc_msgSend(v16, "BOOLValue"));

    v17 = [v10 objectForKeyedSubscript:@"completedListening"];
    objc_msgSend(v9, "setHasArticleCompletedListening:", objc_msgSend(v17, "BOOLValue"));

    v18 = [v10 objectForKeyedSubscript:@"completedReading"];
    objc_msgSend(v9, "setHasArticleCompletedReading:", objc_msgSend(v18, "BOOLValue"));

    v19 = [v10 objectForKeyedSubscript:@"articleConsumed"];
    objc_msgSend(v9, "setHasArticleBeenConsumed:", objc_msgSend(v19, "BOOLValue"));

    v20 = [v10 objectForKeyedSubscript:@"offensive"];
    objc_msgSend(v9, "setHasArticleBeenMarkedOffensive:", objc_msgSend(v20, "BOOLValue"));

    v21 = [v10 objectForKeyedSubscript:@"removedFromAudio"];
    objc_msgSend(v9, "setHasArticleBeenRemovedFromAudio:", objc_msgSend(v21, "BOOLValue"));

    v22 = [v10 objectForKeyedSubscript:@"listenedCount"];
    objc_msgSend(v9, "setListenedCount:", (int)objc_msgSend(v22, "intValue"));

    v23 = [v10 objectForKeyedSubscript:@"listeningProgress"];
    [v23 doubleValue];
    objc_msgSend(v9, "setListeningProgress:");

    v24 = [v10 objectForKeyedSubscript:@"listeningProgressLastSaved"];
    [v9 setListeningProgressSavedAt:v24];

    v25 = [v10 objectForKeyedSubscript:@"lastListened"];
    [v9 setLastListenedAt:v25];

    v26 = [v10 objectForKeyedSubscript:@"readingPosition"];
    [v9 setReadingPosition:v26];

    v27 = [v10 objectForKeyedSubscript:@"readingPositionLastSaved"];
    [v9 setReadingPositionSavedAt:v27];

    v28 = [v10 objectForKeyedSubscript:@"readCount"];
    objc_msgSend(v9, "setReadCount:", (int)objc_msgSend(v28, "intValue"));

    v29 = [v10 objectForKeyedSubscript:@"pruningDisabled"];
    objc_msgSend(v9, "setPruningDisabled:", objc_msgSend(v29, "BOOLValue"));

    v30 = [v10 objectForKeyedSubscript:@"liked"];
    char v31 = [v30 BOOLValue];

    if (v31)
    {
      uint64_t v32 = 1;
    }
    else
    {
      v33 = [v10 objectForKeyedSubscript:@"disliked"];
      int v34 = [v33 BOOLValue];

      if (!v34)
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v32 = 2;
    }
    [v9 setArticleLikingStatus:v32];
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

@end