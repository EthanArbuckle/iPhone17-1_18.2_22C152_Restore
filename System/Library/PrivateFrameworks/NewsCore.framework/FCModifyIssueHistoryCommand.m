@interface FCModifyIssueHistoryCommand
- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4;
- (FCModifyIssueHistoryCommand)initWithIssueHistoryItems:(id)a3 merge:(BOOL)a4;
- (id)recordZoneName;
@end

@implementation FCModifyIssueHistoryCommand

- (FCModifyIssueHistoryCommand)initWithIssueHistoryItems:(id)a3 merge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "historyItems != nil");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCModifyIssueHistoryCommand initWithIssueHistoryItems:merge:]";
    __int16 v17 = 2080;
    v18 = "FCModifyIssueHistoryCommand.m";
    __int16 v19 = 1024;
    int v20 = 23;
    __int16 v21 = 2114;
    v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__FCModifyIssueHistoryCommand_initWithIssueHistoryItems_merge___block_invoke;
  aBlock[3] = &unk_1E5B505B0;
  id v14 = v6;
  id v7 = v6;
  v8 = _Block_copy(aBlock);
  v12.receiver = self;
  v12.super_class = (Class)FCModifyIssueHistoryCommand;
  v9 = [(FCModifyRecordsCommand *)&v12 initWithLocalRecordsGenerator:v8 merge:v4];

  return v9;
}

uint64_t __63__FCModifyIssueHistoryCommand_initWithIssueHistoryItems_merge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_arrayByTransformingWithBlock:", &__block_literal_global_158);
}

uint64_t __63__FCModifyIssueHistoryCommand_initWithIssueHistoryItems_merge___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 asCKRecord];
}

- (id)recordZoneName
{
  return @"IssueReadingHistory";
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:@"lastVisited"];
  v30 = [v6 objectForKeyedSubscript:@"lastVisited"];
  v31 = v7;
  uint64_t v8 = [v7 compare:v30];
  BOOL v9 = v8 == 1;
  if (v8 == 1)
  {
    v10 = [v5 objectForKeyedSubscript:@"lastVisited"];
    [v6 setObject:v10 forKeyedSubscript:@"lastVisited"];

    v11 = [v5 objectForKeyedSubscript:@"lastVisitedPageID"];
    [v6 setObject:v11 forKeyedSubscript:@"lastVisitedPageID"];

    objc_super v12 = [v5 objectForKeyedSubscript:@"lastVisitedArticleID"];
    [v6 setObject:v12 forKeyedSubscript:@"lastVisitedArticleID"];
  }
  v13 = [v5 objectForKeyedSubscript:@"lastBadged"];
  v28 = [v6 objectForKeyedSubscript:@"lastBadged"];
  v29 = v13;
  if ([v13 compare:v28] == 1)
  {
    id v14 = [v5 objectForKeyedSubscript:@"lastBadged"];
    [v6 setObject:v14 forKeyedSubscript:@"lastBadged"];

    BOOL v9 = 1;
  }
  v15 = [v5 objectForKeyedSubscript:@"lastEngaged"];
  uint64_t v16 = [v6 objectForKeyedSubscript:@"lastEngaged"];
  __int16 v17 = (void *)v16;
  if (v15 && (!v16 || [v15 compare:v16] == 1))
  {
    v18 = [v5 objectForKeyedSubscript:@"lastEngaged"];
    [v6 setObject:v18 forKeyedSubscript:@"lastEngaged"];

    BOOL v9 = 1;
  }
  __int16 v19 = [v5 objectForKeyedSubscript:@"lastSeen"];
  uint64_t v20 = [v6 objectForKeyedSubscript:@"lastSeen"];
  __int16 v21 = (void *)v20;
  if (v19 && (!v20 || [v19 compare:v20] == 1))
  {
    v22 = [v5 objectForKeyedSubscript:@"lastSeen"];
    [v6 setObject:v22 forKeyedSubscript:@"lastSeen"];

    BOOL v9 = 1;
  }
  uint64_t v23 = [v5 objectForKeyedSubscript:@"lastRemovedFromMyMagazines"];
  uint64_t v24 = [v6 objectForKeyedSubscript:@"lastRemovedFromMyMagazines"];
  v25 = (void *)v24;
  if (v23 && (!v24 || [v23 compare:v24] == 1))
  {
    v26 = [v5 objectForKeyedSubscript:@"lastRemovedFromMyMagazines"];
    [v6 setObject:v26 forKeyedSubscript:@"lastRemovedFromMyMagazines"];

    BOOL v9 = 1;
  }

  return v9;
}

@end