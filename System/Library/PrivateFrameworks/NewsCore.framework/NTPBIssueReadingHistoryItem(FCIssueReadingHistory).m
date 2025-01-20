@interface NTPBIssueReadingHistoryItem(FCIssueReadingHistory)
+ (id)issueReadingHistoryItemWithCKRecord:()FCIssueReadingHistory;
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()FCIssueReadingHistory;
- (id)asCKRecord;
- (id)lastBadgedDate;
- (id)lastEngagedDate;
- (id)lastRemovedFromMyMagazinesDate;
- (id)lastSeenDate;
- (id)lastVisitedDate;
- (void)setLastBadgedDate:()FCIssueReadingHistory;
- (void)setLastEngagedDate:()FCIssueReadingHistory;
- (void)setLastRemovedFromMyMagazinesDate:()FCIssueReadingHistory;
- (void)setLastSeenDate:()FCIssueReadingHistory;
- (void)setLastVisitedDate:()FCIssueReadingHistory;
- (void)writeToKeyValuePair:()FCIssueReadingHistory;
@end

@implementation NTPBIssueReadingHistoryItem(FCIssueReadingHistory)

+ (uint64_t)keyValuePairType
{
  return 14;
}

+ (id)issueReadingHistoryItemWithCKRecord:()FCIssueReadingHistory
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "record != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "+[NTPBIssueReadingHistoryItem(FCIssueReadingHistory) issueReadingHistoryItemWithCKRecord:]";
    __int16 v19 = 2080;
    v20 = "NTPBIssueReadingHistoryItem+FCIssueReadingHistory.m";
    __int16 v21 = 1024;
    int v22 = 18;
    __int16 v23 = 2114;
    v24 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v4 = objc_opt_new();
  v5 = [v3 recordID];
  v6 = [v5 recordName];
  [v4 setIdentifier:v6];

  v7 = [v3 objectForKeyedSubscript:@"issueID"];
  [v4 setIssueID:v7];

  v8 = [v3 objectForKeyedSubscript:@"lastVisited"];
  [v4 setLastVisitedDate:v8];

  v9 = [v3 objectForKeyedSubscript:@"lastBadged"];
  [v4 setLastBadgedDate:v9];

  v10 = [v3 objectForKeyedSubscript:@"lastEngaged"];
  [v4 setLastEngagedDate:v10];

  v11 = [v3 objectForKeyedSubscript:@"lastSeen"];
  [v4 setLastSeenDate:v11];

  v12 = [v3 objectForKeyedSubscript:@"lastRemovedFromMyMagazines"];
  [v4 setLastRemovedFromMyMagazinesDate:v12];

  v13 = [v3 objectForKeyedSubscript:@"lastVisitedArticleID"];
  [v4 setLastVisitedArticleID:v13];

  v14 = [v3 objectForKeyedSubscript:@"lastVisitedPageID"];
  [v4 setLastVisitedPageID:v14];

  return v4;
}

- (void)setLastVisitedDate:()FCIssueReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastVisitedPBDate:v4];
}

- (id)lastVisitedDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastVisitedPBDate];
  id v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setLastBadgedDate:()FCIssueReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastBadgedPBDate:v4];
}

- (id)lastBadgedDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastBadgedPBDate];
  id v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setLastEngagedDate:()FCIssueReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastEngagedPBDate:v4];
}

- (id)lastEngagedDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastEngagedPBDate];
  id v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setLastSeenDate:()FCIssueReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastSeenPBDate:v4];
}

- (id)lastSeenDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastSeenPBDate];
  id v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setLastRemovedFromMyMagazinesDate:()FCIssueReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastRemovedFromMyMagazinesPBDate:v4];
}

- (id)lastRemovedFromMyMagazinesDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastRemovedFromMyMagazinesPBDate];
  id v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (id)asCKRecord
{
  if (qword_1EB5D1A20 != -1) {
    dispatch_once(&qword_1EB5D1A20, &__block_literal_global_153);
  }
  id v2 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  id v3 = [a1 identifier];
  id v4 = (void *)[v2 initWithRecordName:v3 zoneID:_MergedGlobals_207];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"IssueReadingHistoryItem" recordID:v4];
  v6 = [a1 issueID];
  [v5 setObject:v6 forKeyedSubscript:@"issueID"];

  v7 = [a1 lastVisitedDate];
  [v5 setObject:v7 forKeyedSubscript:@"lastVisited"];

  v8 = [a1 lastBadgedDate];
  [v5 setObject:v8 forKeyedSubscript:@"lastBadged"];

  v9 = [a1 lastEngagedDate];
  [v5 setObject:v9 forKeyedSubscript:@"lastEngaged"];

  v10 = [a1 lastSeenDate];
  [v5 setObject:v10 forKeyedSubscript:@"lastSeen"];

  v11 = [a1 lastRemovedFromMyMagazinesDate];
  [v5 setObject:v11 forKeyedSubscript:@"lastRemovedFromMyMagazines"];

  v12 = [a1 lastVisitedArticleID];
  [v5 setObject:v12 forKeyedSubscript:@"lastVisitedArticleID"];

  v13 = [a1 lastVisitedPageID];
  [v5 setObject:v13 forKeyedSubscript:@"lastVisitedPageID"];

  return v5;
}

+ (uint64_t)readValueFromKeyValuePair:()FCIssueReadingHistory
{
  return [a3 issueReadingHistoryItem];
}

- (void)writeToKeyValuePair:()FCIssueReadingHistory
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setIssueReadingHistoryItem:a1];
}

@end