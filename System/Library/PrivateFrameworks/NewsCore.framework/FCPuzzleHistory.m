@interface FCPuzzleHistory
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
- (BOOL)allowLowerProgressOnCompletedPuzzles;
- (BOOL)canHelpRestoreZoneName:(id)a3;
- (BOOL)hasPuzzleBeenCompleted:(id)a3;
- (BOOL)hasPuzzleEverBeenCompleted:(id)a3;
- (BOOL)isPuzzleHistoryEmpty;
- (BOOL)isPuzzleInPuzzleHistory:(id)a3;
- (FCPuzzleHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (id)_allItemsInPuzzleHistory;
- (id)_allSortedItemsInPuzzleHistory;
- (id)_puzzleHistoryItemForPuzzleID:(id *)a1;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)allSortedPuzzleIDsSinceLastPlayedDate:(id)a3;
- (id)datePuzzleWasLastPlayed:(id)a3;
- (id)puzzleHistoryItemForPuzzleID:(id)a3;
- (id)recordsForRestoringZoneName:(id)a3;
- (id)sortedPuzzleIDsForPuzzleTypeID:(id)a3 sinceLastPlayedDate:(id)a4;
- (void)_addedPuzzleIDs:(void *)a3 modifiedPuzzleIDs:(void *)a4 removedPuzzleIDs:;
- (void)_updatePuzzle:(void *)a3 puzzleTypeID:(void *)a4 progressData:(void *)a5 progressLevel:(void *)a6 score:(void *)a7 rankID:(unsigned int)a8 usedReveal:(void *)a9 playDuration:(void *)a10 lastPlayedDate:(void *)a11 completedDate:(void *)a12 difficulty:(void *)a13 publishDate:(void *)a14 behaviorFlags:;
- (void)addObserver:(id)a3;
- (void)addPuzzleToPuzzleHistory:(id)a3 puzzleTypeID:(id)a4;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)removeObserver:(id)a3;
- (void)removePuzzleFromPuzzleHistory:(id)a3;
- (void)setAllowLowerProgressOnCompletedPuzzles:(BOOL)a3;
- (void)setFirstCompletedDate:(id)a3 forPuzzleID:(id)a4 puzzleTypeID:(id)a5;
- (void)updatePuzzle:(id)a3 difficulty:(id)a4 publishDate:(id)a5 behaviorFlags:(id)a6;
- (void)updatePuzzle:(id)a3 puzzleTypeID:(id)a4 progressData:(id)a5 progressLevel:(int64_t)a6 score:(id)a7 rankID:(id)a8 usedReveal:(BOOL)a9 playDuration:(int64_t)a10 isSolved:(BOOL)a11 difficulty:(id)a12 publishDate:(id)a13 behaviorFlags:(id)a14;
@end

@implementation FCPuzzleHistory

void __43__FCPuzzleHistory__allItemsInPuzzleHistory__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v2 = (void *)v2[13];
  }
  v3 = v2;
  id v7 = [v3 allValues];
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    objc_storeStrong((id *)(v3 + 104), v2);
  }

  uint64_t v4 = [*(id *)(a1 + 32) localStore];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v10] & 1) == 0)
        {
          objc_opt_class();
          v11 = [v4 objectForKey:v10];
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              v12 = v11;
            }
            else {
              v12 = 0;
            }
          }
          else
          {
            v12 = 0;
          }
          id v13 = v12;

          if (v13)
          {
            id v14 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v10, v13);
            if (v14)
            {
              v15 = *(void **)(a1 + 32);
              if (v15) {
                v15 = (void *)v15[13];
              }
              v16 = v15;
              v17 = [v14 puzzleID];
              [v16 setObject:v14 forKey:v17];
            }
            else
            {
              v22 = FCPuzzleLog;
              if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v29 = v13;
                _os_log_error_impl(&dword_1A460D000, v22, OS_LOG_TYPE_ERROR, "FCPuzzleHistory: Failed to load item from cache for %{public}@", buf, 0xCu);
              }
            }
          }
          else
          {
            v18 = (void *)FCPuzzleLog;
            if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              v21 = NSStringFromClass(v20);
              *(_DWORD *)buf = 138412546;
              id v29 = v21;
              __int16 v30 = 2114;
              v31 = v10;
              _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %@ is not dictionary for key %{public}@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke_33;
  v23[3] = &unk_1E5B4C018;
  v23[4] = *(void *)(a1 + 32);
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v23];
}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return @"puzzle-history";
}

+ (id)commandStoreFileName
{
  return @"puzzle-history-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 2;
}

- (void)loadLocalCachesFromStore
{
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E5B4C018;
  v3[4] = self;
  [(FCMTWriterLock *)itemsLock performWriteSync:v3];
}

- (id)sortedPuzzleIDsForPuzzleTypeID:(id)a3 sinceLastPlayedDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[FCPuzzleHistory _allSortedItemsInPuzzleHistory]((id *)&self->super.super.isa);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__FCPuzzleHistory_sortedPuzzleIDsForPuzzleTypeID_sinceLastPlayedDate___block_invoke;
  v13[3] = &unk_1E5B5BFA8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v13);

  return v11;
}

- (id)_allSortedItemsInPuzzleHistory
{
  if (a1)
  {
    v1 = -[FCPuzzleHistory _allItemsInPuzzleHistory](a1);
    v2 = [v1 sortedArrayUsingComparator:&__block_literal_global_51_4];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_allItemsInPuzzleHistory
{
  v1 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    uint64_t v8 = __Block_byref_object_copy__85;
    id v9 = __Block_byref_object_dispose__85;
    id v10 = 0;
    id v2 = a1[15];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__FCPuzzleHistory__allItemsInPuzzleHistory__block_invoke;
    v4[3] = &unk_1E5B4C258;
    v4[4] = v1;
    v4[5] = &v5;
    [v2 performReadSync:v4];

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

- (BOOL)isPuzzleHistoryEmpty
{
  return [(NSMutableDictionary *)self->_itemsByPuzzleID count] == 0;
}

- (void)setAllowLowerProgressOnCompletedPuzzles:(BOOL)a3
{
  self->_allowLowerProgressOnCompletedPuzzles = a3;
}

- (FCPuzzleHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FCPuzzleHistory;
  id v10 = [(FCPrivateDataController *)&v17 initWithContext:v9 pushNotificationCenter:a4 storeDirectory:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cloudContext, a3);
    v12 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v11->_itemsLock;
    v11->_itemsLock = v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    itemsByPuzzleID = v11->_itemsByPuzzleID;
    v11->_itemsByPuzzleID = (NSMutableDictionary *)v14;
  }
  return v11;
}

- (void)addObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCPuzzleHistory;
  [(FCPrivateDataController *)&v3 addObserver:a3];
}

uint64_t __43__FCPuzzleHistory_loadLocalCachesFromStore__block_invoke_33(uint64_t a1)
{
  id v2 = FCPuzzleLog;
  if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "FCPuzzleHistory: Forcing CK sync", v4, 2u);
  }
  return [*(id *)(a1 + 32) forceSyncWithCompletion:0];
}

- (id)allSortedPuzzleIDsSinceLastPlayedDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[FCPuzzleHistory _allSortedItemsInPuzzleHistory]((id *)&self->super.super.isa);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__FCPuzzleHistory_allSortedPuzzleIDsSinceLastPlayedDate___block_invoke;
  v9[3] = &unk_1E5B5BF80;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v9);

  return v7;
}

- (BOOL)isPuzzleInPuzzleHistory:(id)a3
{
  objc_super v3 = -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_puzzleHistoryItemForPuzzleID:(id *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__85;
    id v15 = __Block_byref_object_dispose__85;
    id v16 = 0;
    if (v3)
    {
      id v5 = a1[15];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __49__FCPuzzleHistory__puzzleHistoryItemForPuzzleID___block_invoke;
      v8[3] = &unk_1E5B4C230;
      id v10 = &v11;
      v8[4] = a1;
      id v9 = v4;
      [v5 performReadSync:v8];

      id v6 = (void *)v12[5];
    }
    else
    {
      id v6 = 0;
    }
    a1 = v6;
    _Block_object_dispose(&v11, 8);
  }
  return a1;
}

- (id)puzzleHistoryItemForPuzzleID:(id)a3
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
}

- (void)addPuzzleToPuzzleHistory:(id)a3 puzzleTypeID:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  -[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]((uint64_t)self, v8, v7, 0, 0, 0, 0, 0, 0, v9, 0, 0, 0, 0);
}

- (void)_updatePuzzle:(void *)a3 puzzleTypeID:(void *)a4 progressData:(void *)a5 progressLevel:(void *)a6 score:(void *)a7 rankID:(unsigned int)a8 usedReveal:(void *)a9 playDuration:(void *)a10 lastPlayedDate:(void *)a11 completedDate:(void *)a12 difficulty:(void *)a13 publishDate:(void *)a14 behaviorFlags:
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  id v117 = a3;
  id v116 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  long long v24 = v21;
  id v115 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a13;
  id v114 = a14;
  v112 = (void *)a1;
  if (!a1) {
    goto LABEL_76;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if (v20)
  {
    id v29 = [*(id *)(a1 + 104) objectForKey:v20];
    __int16 v30 = v29;
    if (v117)
    {
      id v31 = v117;
    }
    else
    {
      id v31 = [v29 puzzleTypeID];
    }
    v108 = v31;
    if (v116)
    {
      id v35 = v116;
    }
    else
    {
      id v35 = [v30 progressData];
    }
    v107 = v35;
    id v98 = v28;
    if (v24)
    {
      id v106 = v24;
      if (v22)
      {
LABEL_13:
        id v36 = v22;
        goto LABEL_18;
      }
    }
    else
    {
      id v37 = v25;
      id v38 = v23;
      uint64_t v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v30, "progressLevel"));
      v40 = (void *)v39;
      v41 = &unk_1EF8D87C0;
      if (v39) {
        v41 = (void *)v39;
      }
      id v106 = v41;

      id v23 = v38;
      id v25 = v37;
      if (v22) {
        goto LABEL_13;
      }
    }
    id v36 = [v30 score];
LABEL_18:
    id v99 = v36;
    id v95 = v23;
    if (v23)
    {
      id v42 = v23;
    }
    else
    {
      id v42 = [v30 rankID];
    }
    v105 = v42;
    v43 = [v30 usedReveal];
    if ([v43 BOOLValue]) {
      [v30 usedReveal];
    }
    else {
    v101 = [NSNumber numberWithBool:a8];
    }

    if (v115)
    {
      id v44 = v115;
      if (v25) {
        goto LABEL_26;
      }
    }
    else
    {
      uint64_t v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v30, "playDuration"));
      v47 = (void *)v46;
      v48 = &unk_1EF8D87C0;
      if (v46) {
        v48 = (void *)v46;
      }
      id v44 = v48;

      if (v25)
      {
LABEL_26:
        id v100 = v25;
        if (v27)
        {
LABEL_27:
          id v45 = v27;
          goto LABEL_36;
        }
LABEL_35:
        id v45 = [v30 difficulty];
LABEL_36:
        v104 = v45;
        if (v28)
        {
          id v52 = v28;
        }
        else
        {
          id v52 = [v30 publishDate];
        }
        v103 = v52;
        if (v114)
        {
          id v53 = v114;
        }
        else
        {
          id v53 = [v30 behaviorFlags];
        }
        v102 = v53;
        v111 = v44;
        id v92 = v27;
        if (v26)
        {
          uint64_t v54 = [v30 completedDate];
          v55 = (void *)v54;
          if (v54) {
            v56 = (void *)v54;
          }
          else {
            v56 = v26;
          }
          id v57 = v56;
        }
        else
        {
          id v57 = 0;
        }
        int v58 = [v101 BOOLValue];
        uint64_t v59 = [v30 firstCompletedDate];
        v60 = (void *)v59;
        id v96 = v22;
        v97 = v24;
        if (v58)
        {
          v113 = [v30 firstPlayDuration];
          goto LABEL_63;
        }
        if (v59) {
          v61 = (void *)v59;
        }
        else {
          v61 = v57;
        }
        id v62 = v61;

        v113 = [v30 firstPlayDuration];
        if (v62 && v57 && [v62 isEqualToDate:v57])
        {
          v63 = [v30 firstPlayDuration];

          if (v63)
          {
            id v64 = [v30 firstPlayDuration];
LABEL_60:
            id v65 = v64;

            v60 = v62;
            v113 = v65;
            goto LABEL_63;
          }
          if ([v111 integerValue] >= 1)
          {
            id v64 = v111;
            goto LABEL_60;
          }

          v113 = 0;
        }
        v60 = v62;
LABEL_63:
        v109 = v57;
        id v66 = v20;
        id v93 = v26;
        id v94 = v25;
        v67 = [v30 bestScore];
        v68 = v67;
        v69 = v99;
        v70 = v99;
        if (v67)
        {
          v70 = v67;
          if (v99)
          {
            if ([v67 compare:v99] == 1) {
              v70 = v68;
            }
            else {
              v70 = v99;
            }
          }
        }
        id v71 = v70;
        v72 = [FCPuzzleHistoryItem alloc];
        v73 = [NSString stringWithFormat:@"ph-%@", v66];
        id v89 = v71;
        v91 = v71;
        id v20 = v66;
        v74 = -[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:](v72, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v73, v66, v108, v107, (int)[v106 intValue], v99, v105, v101, (int)objc_msgSend(v111, "intValue"), v100, v57, v60, v113, v89, v104, v103,
                v102);

        if (v74)
        {
          v75 = -[FCPuzzleHistoryItem dictionaryRepresentation](v74);
          v76 = (void *)v112[15];
          v118[0] = MEMORY[0x1E4F143A8];
          v118[1] = 3221225472;
          v118[2] = __176__FCPuzzleHistory__updatePuzzle_puzzleTypeID_progressData_progressLevel_score_rankID_usedReveal_playDuration_lastPlayedDate_completedDate_difficulty_publishDate_behaviorFlags___block_invoke;
          v118[3] = &unk_1E5B4C738;
          v118[4] = v112;
          v77 = v74;
          v119 = v77;
          id v90 = v20;
          id v78 = v20;
          id v120 = v78;
          [v76 performWriteSync:v118];
          v79 = [v112 localStore];
          v80 = [(FCPuzzleHistoryItem *)v77 identifier];
          [v79 setObject:v75 forKey:v80];

          if (v30)
          {
            id v123 = v78;
            v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
            v82 = (void *)MEMORY[0x1E4F1CBF0];
            v83 = v112;
            v84 = v81;
          }
          else
          {
            id v122 = v78;
            v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
            v84 = (void *)MEMORY[0x1E4F1CBF0];
            v83 = v112;
            v82 = v81;
          }
          -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](v83, v82, v84, MEMORY[0x1E4F1CBF0]);

          v86 = [FCModifyPuzzleHistoryCommand alloc];
          v121 = v77;
          v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
          v88 = [(FCModifyPuzzleHistoryCommand *)v86 initWithPuzzleHistoryItems:v87 merge:0];

          [v112 addCommandToCommandQueue:v88];
          id v20 = v90;
          v69 = v99;
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v85 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "updatedItem");
          *(_DWORD *)buf = 136315906;
          v125 = "-[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDur"
                 "ation:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]";
          __int16 v126 = 2080;
          v127 = "FCPuzzleHistory.m";
          __int16 v128 = 1024;
          int v129 = 398;
          __int16 v130 = 2114;
          v131 = v85;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        id v22 = v96;
        long long v24 = v97;
        id v25 = v94;
        id v23 = v95;
        id v27 = v92;
        id v26 = v93;
        id v28 = v98;
        goto LABEL_76;
      }
    }
    v49 = [v30 lastPlayedDate];
    v50 = v49;
    if (v49)
    {
      id v51 = v49;
    }
    else
    {
      id v51 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v100 = v51;

    if (v27) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v32 = v25;
    id v33 = v23;
    v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    v125 = "-[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:"
           "lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]";
    __int16 v126 = 2080;
    v127 = "FCPuzzleHistory.m";
    __int16 v128 = 1024;
    int v129 = 311;
    __int16 v130 = 2114;
    v131 = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    id v23 = v33;
    id v25 = v32;
  }
LABEL_76:
}

- (void)updatePuzzle:(id)a3 puzzleTypeID:(id)a4 progressData:(id)a5 progressLevel:(int64_t)a6 score:(id)a7 rankID:(id)a8 usedReveal:(BOOL)a9 playDuration:(int64_t)a10 isSolved:(BOOL)a11 difficulty:(id)a12 publishDate:(id)a13 behaviorFlags:(id)a14
{
  id v32 = a3;
  id v31 = a4;
  id v19 = a5;
  id v20 = a7;
  id v21 = a8;
  id v22 = a12;
  id v23 = a13;
  id v24 = a14;
  id v25 = [NSNumber numberWithInteger:a6];
  id v26 = [NSNumber numberWithInteger:a10];
  id v27 = [MEMORY[0x1E4F1C9C8] date];
  id v28 = v27;
  if (a11)
  {
    id v29 = [MEMORY[0x1E4F1C9C8] date];
    -[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]((uint64_t)self, v32, v31, v19, v25, v20, v21, a9, v26, v28, v29, v22, v23, v24);
  }
  else
  {
    -[FCPuzzleHistory _updatePuzzle:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:difficulty:publishDate:behaviorFlags:]((uint64_t)self, v32, v31, v19, v25, v20, v21, a9, v26, v27, 0, v22, v23, v24);
  }
}

- (void)removePuzzleFromPuzzleHistory:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    if (self) {
      itemsByPuzzleID = self->_itemsByPuzzleID;
    }
    else {
      itemsByPuzzleID = 0;
    }
    id v6 = itemsByPuzzleID;
    id v7 = [(NSMutableDictionary *)v6 objectForKey:v4];

    if (v7)
    {
      if (self) {
        itemsLock = self->_itemsLock;
      }
      else {
        itemsLock = 0;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __49__FCPuzzleHistory_removePuzzleFromPuzzleHistory___block_invoke;
      v28[3] = &unk_1E5B4BE70;
      v28[4] = self;
      id v23 = v4;
      id v29 = v4;
      [(FCMTWriterLock *)itemsLock performWriteSync:v28];
      uint64_t v9 = [v7 identifier];
      id v10 = [(FCPrivateDataController *)self localStore];
      [v10 removeObjectForKey:v9];

      id v22 = (void *)v9;
      id v21 = [[FCRemoveFromPuzzleHistoryCommand alloc] initWithEntryID:v9];
      -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:");
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v11 = [(FCPrivateDataController *)self observers];
      v12 = (void *)[v11 copy];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v25;
        uint64_t v16 = MEMORY[0x1E4F1CBF0];
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v25 != v15) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * v17);
            __int16 v30 = v7;
            id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
            [v18 puzzleHistory:self didAddPuzzleItems:v16 modifiedPuzzleItems:v16 removedPuzzleItems:v19];

            ++v17;
          }
          while (v14 != v17);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v14);
      }

      id v4 = v23;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "item");
      *(_DWORD *)buf = 136315906;
      id v33 = "-[FCPuzzleHistory removePuzzleFromPuzzleHistory:]";
      __int16 v34 = 2080;
      id v35 = "FCPuzzleHistory.m";
      __int16 v36 = 1024;
      int v37 = 151;
      __int16 v38 = 2114;
      uint64_t v39 = v20;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    id v33 = "-[FCPuzzleHistory removePuzzleFromPuzzleHistory:]";
    __int16 v34 = 2080;
    id v35 = "FCPuzzleHistory.m";
    __int16 v36 = 1024;
    int v37 = 147;
    __int16 v38 = 2114;
    uint64_t v39 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:
  }
}

uint64_t __49__FCPuzzleHistory_removePuzzleFromPuzzleHistory___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[13];
  }
  return [v1 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)setFirstCompletedDate:(id)a3 forPuzzleID:(id)a4 puzzleTypeID:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    int v58 = "-[FCPuzzleHistory setFirstCompletedDate:forPuzzleID:puzzleTypeID:]";
    __int16 v59 = 2080;
    v60 = "FCPuzzleHistory.m";
    __int16 v61 = 1024;
    int v62 = 181;
    __int16 v63 = 2114;
    id v64 = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleTypeID != nil");
    *(_DWORD *)buf = 136315906;
    int v58 = "-[FCPuzzleHistory setFirstCompletedDate:forPuzzleID:puzzleTypeID:]";
    __int16 v59 = 2080;
    v60 = "FCPuzzleHistory.m";
    __int16 v61 = 1024;
    int v62 = 182;
    __int16 v63 = 2114;
    id v64 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v9)
  {
    id v49 = v10;
    id v50 = v8;
    __int16 v36 = self;
    if (self) {
      itemsByPuzzleID = self->_itemsByPuzzleID;
    }
    else {
      itemsByPuzzleID = 0;
    }
    v12 = [(NSMutableDictionary *)itemsByPuzzleID objectForKey:v9];
    uint64_t v46 = [FCPuzzleHistoryItem alloc];
    id v45 = [NSString stringWithFormat:@"ph-%@", v9];
    id v44 = [v12 progressData];
    uint64_t v43 = [v12 progressLevel];
    id v42 = [v12 score];
    v47 = [v12 rankID];
    uint64_t v40 = [v12 usedReveal];
    uint64_t v41 = [v12 playDuration];
    uint64_t v39 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v13 = [v12 completedDate];
    __int16 v38 = [v12 firstPlayDuration];
    uint64_t v14 = [v12 bestScore];
    uint64_t v15 = [v12 difficulty];
    uint64_t v16 = [v12 publishDate];
    int v37 = v12;
    uint64_t v17 = [v12 behaviorFlags];
    v18 = -[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:](v46, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v45, v9, v49, v44, v43, v42, v47, v40, v41, v39, v13, v50, v38, v14, v15, v16,
            v17);

    if (v18)
    {
      id v19 = -[FCPuzzleHistoryItem dictionaryRepresentation](v18);
      if (v36) {
        itemsLock = v36->_itemsLock;
      }
      else {
        itemsLock = 0;
      }
      id v10 = v49;
      id v8 = v50;
      id v21 = v12;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __66__FCPuzzleHistory_setFirstCompletedDate_forPuzzleID_puzzleTypeID___block_invoke;
      v51[3] = &unk_1E5B4C738;
      v51[4] = v36;
      v48 = v18;
      id v22 = v18;
      id v52 = v22;
      id v23 = v9;
      id v53 = v23;
      [(FCMTWriterLock *)itemsLock performWriteSync:v51];
      long long v24 = [(FCPrivateDataController *)v36 localStore];
      long long v25 = [(FCPuzzleHistoryItem *)v22 identifier];
      [v24 setObject:v19 forKey:v25];

      if (v37)
      {
        id v56 = v23;
        long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        long long v27 = (void *)MEMORY[0x1E4F1CBF0];
        id v28 = v36;
        id v29 = v26;
      }
      else
      {
        id v55 = v23;
        long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        id v29 = (void *)MEMORY[0x1E4F1CBF0];
        id v28 = v36;
        long long v27 = v26;
      }
      -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](v28, v27, v29, MEMORY[0x1E4F1CBF0]);

      id v31 = [FCModifyPuzzleHistoryCommand alloc];
      uint64_t v54 = v22;
      id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
      id v33 = [(FCModifyPuzzleHistoryCommand *)v31 initWithPuzzleHistoryItems:v32 merge:0];

      [(FCPrivateDataController *)v36 addCommandToCommandQueue:v33];
      v18 = v48;
    }
    else
    {
      id v10 = v49;
      id v8 = v50;
      id v21 = v12;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "updatedItem");
        *(_DWORD *)buf = 136315906;
        int v58 = "-[FCPuzzleHistory setFirstCompletedDate:forPuzzleID:puzzleTypeID:]";
        __int16 v59 = 2080;
        v60 = "FCPuzzleHistory.m";
        __int16 v61 = 1024;
        int v62 = 207;
        __int16 v63 = 2114;
        id v64 = v30;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
}

uint64_t __66__FCPuzzleHistory_setFirstCompletedDate_forPuzzleID_puzzleTypeID___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[13];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

- (void)_addedPuzzleIDs:(void *)a3 modifiedPuzzleIDs:(void *)a4 removedPuzzleIDs:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_18;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "addedPuzzleIDs");
    *(_DWORD *)buf = 136315906;
    __int16 v34 = "-[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:]";
    __int16 v35 = 2080;
    __int16 v36 = "FCPuzzleHistory.m";
    __int16 v37 = 1024;
    int v38 = 851;
    __int16 v39 = 2114;
    uint64_t v40 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "modifiedPuzzleIDs");
        *(_DWORD *)buf = 136315906;
        __int16 v34 = "-[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:]";
        __int16 v35 = 2080;
        __int16 v36 = "FCPuzzleHistory.m";
        __int16 v37 = 1024;
        int v38 = 852;
        __int16 v39 = 2114;
        uint64_t v40 = v22;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "removedPuzzleIDs");
    *(_DWORD *)buf = 136315906;
    __int16 v34 = "-[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:]";
    __int16 v35 = 2080;
    __int16 v36 = "FCPuzzleHistory.m";
    __int16 v37 = 1024;
    int v38 = 853;
    __int16 v39 = 2114;
    uint64_t v40 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke;
  v31[3] = &unk_1E5B4DC20;
  v31[4] = a1;
  id v24 = v7;
  id v10 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v31);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_2;
  v30[3] = &unk_1E5B4DC20;
  v30[4] = a1;
  id v11 = v8;
  v12 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", v30);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_3;
  v29[3] = &unk_1E5B4DC20;
  v29[4] = a1;
  id v13 = v9;
  uint64_t v14 = objc_msgSend(v9, "fc_arrayByTransformingWithBlock:", v29);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v15 = [a1 observers];
  uint64_t v16 = (void *)[v15 copy];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v20++) puzzleHistory:a1 didAddPuzzleItems:v10 modifiedPuzzleItems:v12 removedPuzzleItems:v14];
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v18);
  }

  id v7 = v24;
  id v8 = v11;
  id v9 = v13;
LABEL_18:
}

- (void)updatePuzzle:(id)a3 difficulty:(id)a4 publishDate:(id)a5 behaviorFlags:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v10)
  {
    if (self) {
      itemsByPuzzleID = self->_itemsByPuzzleID;
    }
    else {
      itemsByPuzzleID = 0;
    }
    uint64_t v15 = [(NSMutableDictionary *)itemsByPuzzleID objectForKey:v10];
    if (v15)
    {
      __int16 v37 = self;
      v48 = [FCPuzzleHistoryItem alloc];
      v47 = [NSString stringWithFormat:@"ph-%@", v10];
      uint64_t v46 = [v15 puzzleTypeID];
      id v45 = [v15 progressData];
      uint64_t v44 = [v15 progressLevel];
      uint64_t v43 = [v15 score];
      uint64_t v40 = [v15 rankID];
      uint64_t v41 = [v15 usedReveal];
      id v16 = v12;
      uint64_t v39 = [v15 playDuration];
      int v38 = [v15 lastPlayedDate];
      [v15 completedDate];
      v18 = uint64_t v17 = v15;
      uint64_t v19 = [v17 firstCompletedDate];
      uint64_t v20 = [v17 firstPlayDuration];
      id v42 = v17;
      id v21 = [v17 bestScore];
      id v49 = v13;
      id v50 = v16;
      id v22 = -[FCPuzzleHistoryItem initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:](v48, "initWithEntryID:puzzleID:puzzleTypeID:progressData:progressLevel:score:rankID:usedReveal:playDuration:lastPlayedDate:completedDate:firstCompletedDate:firstPlayDuration:bestScore:difficulty:publishDate:behaviorFlags:", v47, v10, v46, v45, v44, v43, v40, v41, v39, v38, v18, v19, v20, v21, v11, v16,
              v13);

      id v23 = v22;
      if (v22)
      {
        id v24 = -[FCPuzzleHistoryItem dictionaryRepresentation](v22);
        if (v37) {
          itemsLock = v37->_itemsLock;
        }
        else {
          itemsLock = 0;
        }
        uint64_t v15 = v42;
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __69__FCPuzzleHistory_updatePuzzle_difficulty_publishDate_behaviorFlags___block_invoke;
        v51[3] = &unk_1E5B4C738;
        v51[4] = v37;
        long long v26 = v22;
        id v52 = v26;
        id v27 = v10;
        id v53 = v27;
        [(FCMTWriterLock *)itemsLock performWriteSync:v51];
        long long v28 = [(FCPrivateDataController *)v37 localStore];
        id v29 = [(FCPuzzleHistoryItem *)v26 identifier];
        [v28 setObject:v24 forKey:v29];

        id v55 = v27;
        __int16 v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](v37, MEMORY[0x1E4F1CBF0], v30, MEMORY[0x1E4F1CBF0]);

        id v31 = [FCModifyPuzzleHistoryCommand alloc];
        uint64_t v54 = v26;
        id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
        id v33 = [(FCModifyPuzzleHistoryCommand *)v31 initWithPuzzleHistoryItems:v32 merge:0];

        [(FCPrivateDataController *)v37 addCommandToCommandQueue:v33];
        id v13 = v49;
        id v12 = v50;
      }
      else
      {
        id v12 = v50;
        uint64_t v15 = v42;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          __int16 v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "updatedItem");
          *(_DWORD *)buf = 136315906;
          id v57 = "-[FCPuzzleHistory updatePuzzle:difficulty:publishDate:behaviorFlags:]";
          __int16 v58 = 2080;
          __int16 v59 = "FCPuzzleHistory.m";
          __int16 v60 = 1024;
          int v61 = 270;
          __int16 v62 = 2114;
          __int16 v63 = v36;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
    else
    {
      __int16 v35 = FCPuzzleLog;
      if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v57 = (const char *)v10;
        _os_log_error_impl(&dword_1A460D000, v35, OS_LOG_TYPE_ERROR, "FCPuzzleHistory: Failed to update stats info: history item for %{public}@ not found", buf, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "puzzleID != nil");
    *(_DWORD *)buf = 136315906;
    id v57 = "-[FCPuzzleHistory updatePuzzle:difficulty:publishDate:behaviorFlags:]";
    __int16 v58 = 2080;
    __int16 v59 = "FCPuzzleHistory.m";
    __int16 v60 = 1024;
    int v61 = 239;
    __int16 v62 = 2114;
    __int16 v63 = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

uint64_t __69__FCPuzzleHistory_updatePuzzle_difficulty_publishDate_behaviorFlags___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[13];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

uint64_t __176__FCPuzzleHistory__updatePuzzle_puzzleTypeID_progressData_progressLevel_score_rankID_usedReveal_playDuration_lastPlayedDate_completedDate_difficulty_publishDate_behaviorFlags___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  if (v1) {
    v1 = (void *)v1[13];
  }
  return [v1 setObject:a1[5] forKey:a1[6]];
}

- (id)datePuzzleWasLastPlayed:(id)a3
{
  id v3 = -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  id v4 = [v3 lastPlayedDate];

  return v4;
}

id __57__FCPuzzleHistory_allSortedPuzzleIDsSinceLastPlayedDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 lastPlayedDate];
  LODWORD(a1) = objc_msgSend(v4, "fc_isLaterThan:", *(void *)(a1 + 32));

  if (a1)
  {
    id v5 = [v3 puzzleID];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id __70__FCPuzzleHistory_sortedPuzzleIDsForPuzzleTypeID_sinceLastPlayedDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 puzzleTypeID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 lastPlayedDate];
    int v6 = objc_msgSend(v5, "fc_isLaterThan:", *(void *)(a1 + 40));

    if (v6)
    {
      id v7 = [v3 puzzleID];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

- (BOOL)hasPuzzleBeenCompleted:(id)a3
{
  id v3 = -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  id v4 = [v3 completedDate];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)hasPuzzleEverBeenCompleted:(id)a3
{
  id v3 = -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:]((id *)&self->super.super.isa, a3);
  id v4 = [v3 completedDate];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    int v6 = [v3 firstCompletedDate];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (void)removeObserver:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FCPuzzleHistory;
  [(FCPrivateDataController *)&v3 removeObserver:a3];
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  id v8 = [(FCPrivateDataController *)self localStore];
  id v9 = objc_opt_new();
  id v10 = objc_opt_new();
  id v11 = objc_opt_new();
  id v12 = v11;
  if (self) {
    itemsLock = self->_itemsLock;
  }
  else {
    itemsLock = 0;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__FCPuzzleHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
  v20[3] = &unk_1E5B4CEF0;
  id v21 = v6;
  id v22 = v8;
  id v23 = self;
  id v24 = v9;
  id v25 = v11;
  id v26 = v7;
  id v27 = v10;
  id v14 = v10;
  id v15 = v7;
  id v16 = v12;
  id v17 = v9;
  id v18 = v8;
  id v19 = v6;
  [(FCMTWriterLock *)itemsLock performWriteSync:v20];
  -[FCPuzzleHistory _addedPuzzleIDs:modifiedPuzzleIDs:removedPuzzleIDs:](self, v17, v16, v14);
}

void __67__FCPuzzleHistory_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(id *a1)
{
  v1 = a1;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = a1[4];
  uint64_t v100 = [obj countByEnumeratingWithState:&v120 objects:v134 count:16];
  if (v100)
  {
    uint64_t v99 = *(void *)v121;
    *(void *)&long long v2 = 138543618;
    long long v93 = v2;
    id v98 = v1;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v121 != v99) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v120 + 1) + 8 * v3);
        BOOL v5 = objc_msgSend(v4, "recordID", v93);
        uint64_t v6 = [v5 recordName];

        id v115 = (void *)v6;
        uint64_t v7 = [v1[5] objectForKey:v6];
        id v8 = [v4 objectForKeyedSubscript:@"puzzleID"];
        uint64_t v102 = [v4 objectForKeyedSubscript:@"puzzleTypeID"];
        v112 = [v4 objectForKeyedSubscript:@"progressData"];
        uint64_t v9 = [v4 objectForKeyedSubscript:@"progressLevel"];
        id v10 = (void *)v9;
        if (v9) {
          id v11 = (void *)v9;
        }
        else {
          id v11 = &unk_1EF8D87C0;
        }
        id v111 = v11;

        uint64_t v12 = [v4 objectForKeyedSubscript:@"score"];
        id v13 = (void *)v12;
        if (v12) {
          id v14 = (void *)v12;
        }
        else {
          id v14 = &unk_1EF8D87C0;
        }
        id v110 = v14;

        v109 = [v4 objectForKeyedSubscript:@"rankID"];
        uint64_t v15 = [v4 objectForKeyedSubscript:@"usedReveal"];
        id v16 = (void *)v15;
        if (v15) {
          id v17 = (void *)v15;
        }
        else {
          id v17 = &unk_1EF8D87C0;
        }
        id v108 = v17;

        uint64_t v18 = [v4 objectForKeyedSubscript:@"playDuration"];
        id v19 = (void *)v18;
        if (v18) {
          uint64_t v20 = (void *)v18;
        }
        else {
          uint64_t v20 = &unk_1EF8D87C0;
        }
        id v21 = (void *)v7;
        id v107 = v20;

        id v114 = [v4 objectForKeyedSubscript:@"lastPlayedDate"];
        uint64_t v113 = [v4 objectForKeyedSubscript:@"completedDate"];
        id v106 = [v4 objectForKeyedSubscript:@"firstCompletedDate"];
        v105 = [v4 objectForKeyedSubscript:@"firstPlayDuration"];
        id v22 = [v4 objectForKeyedSubscript:@"bestScore"];
        v104 = [v4 objectForKeyedSubscript:@"difficulty"];
        id v23 = [v4 objectForKeyedSubscript:@"publishDate"];
        v103 = [v4 objectForKeyedSubscript:@"behaviorFlags"];
        if (v21)
        {
          uint64_t v24 = [v21 mutableCopy];
          id v25 = v21;
          id v26 = (void *)v24;
          id v27 = v1[6];
          v101 = v25;
          id v28 = v25;
          id v29 = v4;
          __int16 v30 = v29;
          if (!v27)
          {

            id v31 = (void *)v113;
            goto LABEL_24;
          }
          id v31 = (void *)v113;
          if (([v27 allowLowerProgressOnCompletedPuzzles] & 1) != 0
            || ([v28 objectForKeyedSubscript:@"completedDate"],
                (uint64_t v32 = objc_claimAutoreleasedReturnValue()) == 0))
          {
          }
          else
          {
            id v33 = (void *)v32;
            __int16 v34 = [v28 objectForKeyedSubscript:@"progressLevel"];
            int v95 = [v34 intValue];

            __int16 v35 = [v28 objectForKeyedSubscript:@"score"];
            int v96 = [v35 intValue];

            [v30 objectForKeyedSubscript:@"progressLevel"];
            v37 = __int16 v36 = v8;
            int v94 = [v37 intValue];

            int v38 = [v30 objectForKeyedSubscript:@"score"];
            int v39 = [v38 intValue];

            id v8 = v36;
            BOOL v40 = v39 < v96;
            id v31 = (void *)v113;
            if (v40 || v94 < v95)
            {
LABEL_24:
              uint64_t v41 = FCPuzzleLog;
              if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v127 = v8;
                _os_log_impl(&dword_1A460D000, v41, OS_LOG_TYPE_DEFAULT, "FCPuzzleHistory: Received update with a lower score/progress for %{public}@. Replacing with local record.", buf, 0xCu);
              }
              v1 = v98;
              id v42 = [v98[6] puzzleHistoryItemForPuzzleID:v8];
              if (v42)
              {
                uint64_t v43 = [FCModifyPuzzleHistoryCommand alloc];
                v125 = v42;
                [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
                v45 = uint64_t v44 = v8;
                uint64_t v46 = [(FCModifyPuzzleHistoryCommand *)v43 initWithPuzzleHistoryItems:v45 merge:0];

                id v8 = v44;
                [v98[6] addCommandToCommandQueue:v46];
              }
              v47 = (void *)v102;
LABEL_115:

              goto LABEL_116;
            }
          }
          if (v8) {
            [v26 setObject:v8 forKeyedSubscript:@"puzzleID"];
          }
          if (v102) {
            [v26 setObject:v102 forKeyedSubscript:@"puzzleTypeID"];
          }
          if (v112) {
            [v26 setObject:v112 forKeyedSubscript:@"progressData"];
          }
          if (([v111 intValue] & 0x80000000) == 0) {
            [v26 setObject:v111 forKeyedSubscript:@"progressLevel"];
          }
          id v53 = v8;
          if (([v110 intValue] & 0x80000000) == 0) {
            [v26 setObject:v110 forKeyedSubscript:@"score"];
          }
          if (([v107 intValue] & 0x80000000) == 0) {
            [v26 setObject:v107 forKeyedSubscript:@"playDuration"];
          }
          if (v109) {
            [v26 setObject:v109 forKeyedSubscript:@"rankID"];
          }
          [v26 setObject:v114 forKeyedSubscript:@"lastPlayedDate"];
          [v26 setObject:v31 forKeyedSubscript:@"completedDate"];
          [v26 setObject:v108 forKeyedSubscript:@"usedReveal"];
          if (v106)
          {
            uint64_t v54 = [v26 objectForKeyedSubscript:@"firstCompletedDate"];
            if (v54)
            {
              id v55 = [v106 earlierDate:v54];
              [v26 setObject:v55 forKeyedSubscript:@"firstCompletedDate"];

              id v56 = [v26 objectForKeyedSubscript:@"firstCompletedDate"];
              int v57 = [v54 isEqualToDate:v56] ^ 1;
            }
            else
            {
              [v26 setObject:v106 forKeyedSubscript:@"firstCompletedDate"];
              int v57 = 1;
            }
          }
          else
          {
            int v57 = 0;
          }
          if (v105)
          {
            uint64_t v58 = [v26 objectForKeyedSubscript:@"firstPlayDuration"];
            __int16 v59 = (void *)v58;
            if (v58) {
              int v60 = v57;
            }
            else {
              int v60 = 1;
            }
            if (v60) {
              int v61 = v105;
            }
            else {
              int v61 = (void *)v58;
            }
            [v26 setObject:v61 forKeyedSubscript:@"firstPlayDuration"];
          }
          id v8 = v53;
          if (v22)
          {
            __int16 v62 = [v26 objectForKeyedSubscript:@"bestScore"];
            if (v62)
            {
              uint64_t v63 = [v22 integerValue];
              uint64_t v64 = [v62 integerValue];
              if (v63 <= v64) {
                uint64_t v65 = v64;
              }
              else {
                uint64_t v65 = v63;
              }
              id v66 = [NSNumber numberWithInteger:v65];
              [v26 setObject:v66 forKeyedSubscript:@"bestScore"];
            }
            else
            {
              [v26 setObject:v22 forKeyedSubscript:@"bestScore"];
            }
          }
          if (v104)
          {
            uint64_t v67 = [v26 objectForKeyedSubscript:@"difficulty"];
            v68 = (void *)v67;
            if (v67) {
              v69 = (void *)v67;
            }
            else {
              v69 = v104;
            }
            [v26 setObject:v69 forKeyedSubscript:@"difficulty"];
          }
          if (v23)
          {
            uint64_t v70 = [v26 objectForKeyedSubscript:@"publishDate"];
            id v71 = (void *)v70;
            if (v70) {
              v72 = (void *)v70;
            }
            else {
              v72 = v23;
            }
            [v26 setObject:v72 forKeyedSubscript:@"publishDate"];
          }
          if (v103)
          {
            uint64_t v73 = [v26 objectForKeyedSubscript:@"behaviorFlags"];
            v74 = (void *)v73;
            if (v73) {
              v75 = (void *)v73;
            }
            else {
              v75 = v103;
            }
            [v26 setObject:v75 forKeyedSubscript:@"behaviorFlags"];
          }
          [v98[5] setObject:v26 forKey:v115];
          id v31 = (void *)v113;
          v47 = (void *)v102;
          v1 = v98;
          if (v8)
          {
            id v42 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v115, v26);
            v76 = v98[6];
            if (v76) {
              v77 = (void *)v76[13];
            }
            else {
              v77 = 0;
            }
            [v77 setObject:v42 forKey:v8];
            [v98[8] addObject:v8];
            goto LABEL_115;
          }
LABEL_116:

          id v21 = v101;
          goto LABEL_117;
        }
        if (v8)
        {
          v47 = (void *)v102;
          id v31 = (void *)v113;
          if (v114)
          {
            v48 = [MEMORY[0x1E4F1CA60] dictionary];
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v8, @"puzzleID");
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v102, @"puzzleTypeID");
            if (v112) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v112, @"progressData");
            }
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v111, @"progressLevel");
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v110, @"score");
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v108, @"usedReveal");
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v107, @"playDuration");
            objc_msgSend(v48, "fc_safelySetObject:forKey:", v114, @"lastPlayedDate");
            if (v109) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v109, @"rankID");
            }
            if (v113) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v113, @"completedDate");
            }
            if (v106) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v106, @"firstCompletedDate");
            }
            if (v105) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v105, @"firstPlayDuration");
            }
            if (v22) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v22, @"bestScore");
            }
            if (v104) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v104, @"difficulty");
            }
            if (v23) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v23, @"publishDate");
            }
            if (v103) {
              objc_msgSend(v48, "fc_safelySetObject:forKey:", v103, @"behaviorFlags");
            }
            id v49 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v115, v48);
            id v50 = v1[6];
            if (v50) {
              id v51 = (void *)v50[13];
            }
            else {
              id v51 = 0;
            }
            [v51 setObject:v49 forKey:v8];
            [v1[5] setObject:v48 forKey:v115];
            [v1[7] addObject:v8];

            goto LABEL_117;
          }
        }
        else
        {
          v47 = (void *)v102;
          id v31 = (void *)v113;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v78 = (void *)[[NSString alloc] initWithFormat:@"should never have a puzzleHistoryItem without a puzzleID"];
            *(_DWORD *)buf = 136315906;
            v127 = "-[FCPuzzleHistory handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
            __int16 v128 = 2080;
            int v129 = "FCPuzzleHistory.m";
            __int16 v130 = 1024;
            int v131 = 556;
            __int16 v132 = 2114;
            v133 = v78;
            _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          }
          if (v114) {
            goto LABEL_57;
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v79 = (void *)[[NSString alloc] initWithFormat:@"should never have a puzzleHistoryItem without a lastPlayedDate"];
          *(_DWORD *)buf = 136315906;
          v127 = "-[FCPuzzleHistory handleSyncWithChangedRecords:deletedRecordNames:]_block_invoke";
          __int16 v128 = 2080;
          int v129 = "FCPuzzleHistory.m";
          __int16 v130 = 1024;
          int v131 = 557;
          __int16 v132 = 2114;
          v133 = v79;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
LABEL_57:
        id v52 = FCPuzzleLog;
        if (os_log_type_enabled((os_log_t)FCPuzzleLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v93;
          v127 = v8;
          __int16 v128 = 2114;
          int v129 = v114;
          _os_log_error_impl(&dword_1A460D000, v52, OS_LOG_TYPE_ERROR, "FCPuzzleHistory: Received invalid new changed record puzzleID=%{public}@ lastPlayedDate=%{public}@", buf, 0x16u);
        }
LABEL_117:

        ++v3;
      }
      while (v100 != v3);
      uint64_t v80 = [obj countByEnumeratingWithState:&v120 objects:v134 count:16];
      uint64_t v100 = v80;
    }
    while (v80);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v81 = v1[9];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v116 objects:v124 count:16];
  if (v82)
  {
    uint64_t v83 = v82;
    uint64_t v84 = *(void *)v117;
    do
    {
      uint64_t v85 = 0;
      do
      {
        if (*(void *)v117 != v84) {
          objc_enumerationMutation(v81);
        }
        uint64_t v86 = *(void *)(*((void *)&v116 + 1) + 8 * v85);
        v87 = [v1[5] objectForKey:v86];
        v88 = v87;
        if (v87)
        {
          id v89 = [v87 objectForKeyedSubscript:@"puzzleID"];
          id v90 = v1[6];
          if (v90) {
            v91 = (void *)v90[13];
          }
          else {
            v91 = 0;
          }
          [v91 removeObjectForKey:v89];
          [v1[5] removeObjectForKey:v86];
          [v1[10] addObject:v89];
        }
        ++v85;
      }
      while (v83 != v85);
      uint64_t v92 = [v81 countByEnumeratingWithState:&v116 objects:v124 count:16];
      uint64_t v83 = v92;
    }
    while (v92);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    itemsByPuzzleID = self->_itemsByPuzzleID;
  }
  else {
    itemsByPuzzleID = 0;
  }
  BOOL v5 = [(NSMutableDictionary *)itemsByPuzzleID allValues];
  uint64_t v6 = objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", &__block_literal_global_184);

  return v6;
}

uint64_t __61__FCPuzzleHistory_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v3 = (void *)[v2 initWithZoneName:@"PuzzleHistory" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([a1 isLocalStoreKeyInternal:v12] & 1) == 0)
        {
          id v13 = [v5 objectForKey:v12];
          id v14 = -[FCPuzzleHistoryItem initWithEntryID:dictionaryRepresentation:]([FCPuzzleHistoryItem alloc], v12, v13);
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }

  uint64_t v15 = [[FCModifyPuzzleHistoryCommand alloc] initWithPuzzleHistoryItems:v6 merge:1];
  id v22 = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];

  return v16;
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return [a3 isEqualToString:@"PuzzleHistory"];
}

- (id)recordsForRestoringZoneName:(id)a3
{
  uint64_t v3 = -[FCPuzzleHistory _allItemsInPuzzleHistory]((id *)&self->super.super.isa);
  id v4 = objc_msgSend(v3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_44_1);

  return v4;
}

uint64_t __47__FCPuzzleHistory_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

id *__70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke(uint64_t a1, void *a2)
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:](*(id **)(a1 + 32), a2);
}

id *__70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:](*(id **)(a1 + 32), a2);
}

id *__70__FCPuzzleHistory__addedPuzzleIDs_modifiedPuzzleIDs_removedPuzzleIDs___block_invoke_3(uint64_t a1, void *a2)
{
  return -[FCPuzzleHistory _puzzleHistoryItemForPuzzleID:](*(id **)(a1 + 32), a2);
}

void __49__FCPuzzleHistory__puzzleHistoryItemForPuzzleID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    id v2 = (void *)v2[13];
  }
  uint64_t v3 = a1[5];
  uint64_t v7 = v2;
  uint64_t v4 = [v7 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __49__FCPuzzleHistory__allSortedItemsInPuzzleHistory__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 lastPlayedDate];
  uint64_t v6 = [v4 lastPlayedDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)allowLowerProgressOnCompletedPuzzles
{
  return self->_allowLowerProgressOnCompletedPuzzles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_itemsByPuzzleID, 0);
}

@end