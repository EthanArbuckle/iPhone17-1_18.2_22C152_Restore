@interface FCModifyPuzzleHistoryCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyPuzzleHistoryCommand)initWithPuzzleHistoryItems:(id)a3 merge:(BOOL)a4;
@end

@implementation FCModifyPuzzleHistoryCommand

- (FCModifyPuzzleHistoryCommand)initWithPuzzleHistoryItems:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_106);
  v7 = [(FCModifyRecordsCommand *)self initWithLocalRecords:v6 merge:v4];

  return v7;
}

uint64_t __65__FCModifyPuzzleHistoryCommand_initWithPuzzleHistoryItems_merge___block_invoke(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"lastPlayedDate"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"lastPlayedDate"];
  uint64_t v9 = [v7 compare:v8];
  BOOL v10 = v9 == 1;
  if (v9 == 1)
  {
    v11 = [v5 objectForKeyedSubscript:@"puzzleID"];
    [v6 setObject:v11 forKeyedSubscript:@"puzzleID"];

    v12 = [v5 objectForKeyedSubscript:@"puzzleTypeID"];
    [v6 setObject:v12 forKeyedSubscript:@"puzzleTypeID"];

    v13 = [v5 objectForKeyedSubscript:@"behaviorFlags"];
    [v6 setObject:v13 forKeyedSubscript:@"behaviorFlags"];

    v14 = [v5 objectForKeyedSubscript:@"progressData"];
    [v6 setObject:v14 forKeyedSubscript:@"progressData"];

    v15 = [v5 objectForKeyedSubscript:@"progressLevel"];
    [v6 setObject:v15 forKeyedSubscript:@"progressLevel"];

    v16 = [v5 objectForKeyedSubscript:@"score"];
    [v6 setObject:v16 forKeyedSubscript:@"score"];

    v17 = [v5 objectForKeyedSubscript:@"rankID"];
    [v6 setObject:v17 forKeyedSubscript:@"rankID"];

    v18 = [v5 objectForKeyedSubscript:@"usedReveal"];
    [v6 setObject:v18 forKeyedSubscript:@"usedReveal"];

    v19 = [v5 objectForKeyedSubscript:@"playDuration"];
    [v6 setObject:v19 forKeyedSubscript:@"playDuration"];

    v20 = [v5 objectForKeyedSubscript:@"lastPlayedDate"];
    [v6 setObject:v20 forKeyedSubscript:@"lastPlayedDate"];

    v21 = [v5 objectForKeyedSubscript:@"completedDate"];
    [v6 setObject:v21 forKeyedSubscript:@"completedDate"];
  }
  v22 = [v5 objectForKeyedSubscript:@"firstCompletedDate"];
  uint64_t v23 = [v6 objectForKeyedSubscript:@"firstCompletedDate"];
  v24 = (void *)v23;
  v42 = (void *)v8;
  v43 = v7;
  v41 = v22;
  if (v22 && (!v23 || [v22 compare:v23] == -1))
  {
    [v6 setObject:v22 forKeyedSubscript:@"firstCompletedDate"];
    char v25 = 0;
    BOOL v10 = 1;
  }
  else
  {
    char v25 = 1;
  }
  uint64_t v26 = [v5 objectForKeyedSubscript:@"firstPlayDuration"];
  uint64_t v38 = [v6 objectForKeyedSubscript:@"firstPlayDuration"];
  if (v38) {
    char v27 = v25;
  }
  else {
    char v27 = 0;
  }
  if (v26 && (v27 & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, @"firstPlayDuration", v38);
    BOOL v10 = 1;
  }
  v28 = objc_msgSend(v5, "objectForKeyedSubscript:", @"bestScore", v38);
  uint64_t v29 = [v6 objectForKeyedSubscript:@"bestScore"];
  v30 = (void *)v29;
  v40 = (void *)v26;
  if (v28 && (!v29 || [v28 compare:v29] == 1))
  {
    [v6 setObject:v28 forKeyedSubscript:@"bestScore"];
    BOOL v10 = 1;
  }
  v31 = [v5 objectForKeyedSubscript:@"difficulty"];
  uint64_t v32 = [v6 objectForKeyedSubscript:@"difficulty"];
  v33 = (void *)v32;
  if (v31 && !v32)
  {
    [v6 setObject:v31 forKeyedSubscript:@"difficulty"];
    BOOL v10 = 1;
  }
  v34 = [v5 objectForKeyedSubscript:@"publishDate"];
  uint64_t v35 = [v6 objectForKeyedSubscript:@"publishDate"];
  v36 = (void *)v35;
  if (v34 && !v35)
  {
    [v6 setObject:v34 forKeyedSubscript:@"publishDate"];
    BOOL v10 = 1;
  }

  return v10;
}

@end