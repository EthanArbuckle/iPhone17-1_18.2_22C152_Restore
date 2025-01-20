@interface NTPBReadingHistoryItem(FCReadingHistory)
+ (uint64_t)keyValuePairType;
+ (uint64_t)readValueFromKeyValuePair:()FCReadingHistory;
- (id)asCKRecord;
- (id)firstSeenAt;
- (id)firstSeenAtOfMaxVersionSeen;
- (id)identifier;
- (id)lastListenedAt;
- (id)lastVisitedAt;
- (id)listeningProgressSavedAt;
- (id)readingPositionSavedAt;
- (uint64_t)articleLikingStatus;
- (uint64_t)hasArticleBeenConsumed;
- (uint64_t)hasArticleBeenMarkedOffensive;
- (uint64_t)hasArticleBeenRead;
- (uint64_t)hasArticleBeenRemovedFromAudio;
- (uint64_t)hasArticleBeenSeen;
- (uint64_t)hasArticleCompletedListening;
- (uint64_t)hasArticleCompletedReading;
- (uint64_t)isPruningDisabled;
- (uint64_t)setArticleLikingStatus:()FCReadingHistory;
- (uint64_t)setHasArticleBeenConsumed:()FCReadingHistory;
- (uint64_t)setHasArticleBeenMarkedOffensive:()FCReadingHistory;
- (uint64_t)setHasArticleBeenRead:()FCReadingHistory;
- (uint64_t)setHasArticleBeenRemovedFromAudio:()FCReadingHistory;
- (uint64_t)setHasArticleBeenSeen:()FCReadingHistory;
- (uint64_t)setHasArticleCompletedListening:()FCReadingHistory;
- (uint64_t)setHasArticleCompletedReading:()FCReadingHistory;
- (uint64_t)setPruningDisabled:()FCReadingHistory;
- (void)setFirstSeenAt:()FCReadingHistory;
- (void)setFirstSeenAtOfMaxVersionSeen:()FCReadingHistory;
- (void)setLastListenedAt:()FCReadingHistory;
- (void)setLastVisitedAt:()FCReadingHistory;
- (void)setListeningProgressSavedAt:()FCReadingHistory;
- (void)setReadingPositionSavedAt:()FCReadingHistory;
- (void)writeToKeyValuePair:()FCReadingHistory;
@end

@implementation NTPBReadingHistoryItem(FCReadingHistory)

+ (uint64_t)keyValuePairType
{
  return 6;
}

- (id)identifier
{
  v1 = [a1 articleID];
  v2 = FCHistoryItemIDFromArticleID((uint64_t)v1);

  return v2;
}

- (id)lastVisitedAt
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastVisitedDate];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setLastVisitedAt:()FCReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastVisitedDate:v4];
}

- (id)lastListenedAt
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 lastListened];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setLastListenedAt:()FCReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setLastListened:v4];
}

- (id)listeningProgressSavedAt
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 listeningProgressSavedDate];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setListeningProgressSavedAt:()FCReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setListeningProgressSavedDate:v4];
}

- (id)readingPositionSavedAt
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 readingPositionSavedDate];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setReadingPositionSavedAt:()FCReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setReadingPositionSavedDate:v4];
}

- (id)firstSeenAt
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 firstSeenDate];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setFirstSeenAt:()FCReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setFirstSeenDate:v4];
}

- (id)firstSeenAtOfMaxVersionSeen
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 firstSeenDateOfMaxVersionSeen];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (void)setFirstSeenAtOfMaxVersionSeen:()FCReadingHistory
{
  id v4 = [a3 pbDate];
  [a1 setFirstSeenDateOfMaxVersionSeen:v4];
}

- (uint64_t)hasArticleBeenRead
{
  return [a1 flags] & 1;
}

- (uint64_t)setHasArticleBeenRead:()FCReadingHistory
{
  uint64_t v4 = [a1 flags] & 0xFFFFFFFE | a3;
  return [a1 setFlags:v4];
}

- (uint64_t)hasArticleBeenSeen
{
  return ([a1 flags] >> 1) & 1;
}

- (uint64_t)setHasArticleBeenSeen:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFFFDLL;
  if (a3) {
    int v6 = 2;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (uint64_t)hasArticleBeenMarkedOffensive
{
  return ([a1 flags] >> 2) & 1;
}

- (uint64_t)setHasArticleBeenMarkedOffensive:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFFFBLL;
  if (a3) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (uint64_t)hasArticleBeenConsumed
{
  return ([a1 flags] >> 5) & 1;
}

- (uint64_t)setHasArticleBeenConsumed:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFFDFLL;
  if (a3) {
    int v6 = 32;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (uint64_t)hasArticleCompletedListening
{
  return ([a1 flags] >> 6) & 1;
}

- (uint64_t)setHasArticleCompletedListening:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFFBFLL;
  if (a3) {
    int v6 = 64;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (uint64_t)hasArticleCompletedReading
{
  return ([a1 flags] >> 8) & 1;
}

- (uint64_t)setHasArticleCompletedReading:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFEFFLL;
  if (a3) {
    int v6 = 256;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (uint64_t)hasArticleBeenRemovedFromAudio
{
  return ([a1 flags] >> 9) & 1;
}

- (uint64_t)setHasArticleBeenRemovedFromAudio:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFDFFLL;
  if (a3) {
    int v6 = 512;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (uint64_t)articleLikingStatus
{
  if (([a1 flags] & 8) != 0) {
    return 1;
  }
  else {
    return ([a1 flags] >> 3) & 2;
  }
}

- (uint64_t)setArticleLikingStatus:()FCReadingHistory
{
  if (a3 == 2)
  {
    uint64_t v4 = [a1 flags] & 0xFFFFFFE7 | 0x10;
  }
  else if (a3 == 1)
  {
    uint64_t v4 = [a1 flags] & 0xFFFFFFE7 | 8;
  }
  else
  {
    uint64_t v4 = [a1 flags] & 0xFFFFFFE7;
  }
  return [a1 setFlags:v4];
}

- (uint64_t)isPruningDisabled
{
  return ([a1 flags] >> 7) & 1;
}

- (uint64_t)setPruningDisabled:()FCReadingHistory
{
  uint64_t v5 = [a1 flags] & 0xFFFFFF7FLL;
  if (a3) {
    int v6 = 128;
  }
  else {
    int v6 = 0;
  }
  return [a1 setFlags:v5 | v6];
}

- (id)asCKRecord
{
  if (qword_1E96597B8 != -1) {
    dispatch_once(&qword_1E96597B8, &__block_literal_global_328);
  }
  id v2 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  v3 = [a1 identifier];
  uint64_t v4 = (void *)[v2 initWithRecordName:v3 zoneID:_MergedGlobals_14];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"ReadingHistoryItem" recordID:v4];
  int v6 = [a1 articleID];
  [v5 setObject:v6 forKeyedSubscript:@"articleID"];

  v7 = [a1 sourceChannelTagID];
  [v5 setObject:v7 forKeyedSubscript:@"sourceChannelTagID"];

  v8 = [a1 deviceID];
  [v5 setObject:v8 forKeyedSubscript:@"deviceID"];

  v9 = [a1 lastVisitedAt];
  [v5 setObject:v9 forKeyedSubscript:@"lastVisited"];

  v10 = [a1 lastListenedAt];
  [v5 setObject:v10 forKeyedSubscript:@"lastListened"];

  v11 = [a1 listeningProgressSavedAt];
  [v5 setObject:v11 forKeyedSubscript:@"listeningProgressLastSaved"];

  v12 = [a1 readingPositionSavedAt];
  [v5 setObject:v12 forKeyedSubscript:@"readingPositionLastSaved"];

  v13 = [a1 readingPosition];
  [v5 setObject:v13 forKeyedSubscript:@"readingPosition"];

  if ([a1 hasArticleBeenRead])
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "hasArticleBeenRead"));
    [v5 setObject:v14 forKeyedSubscript:@"articleRead"];
  }
  if ([a1 hasArticleBeenSeen])
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "hasArticleBeenSeen"));
    [v5 setObject:v15 forKeyedSubscript:@"articleSeen"];
  }
  if ([a1 hasArticleCompletedListening])
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "hasArticleCompletedListening"));
    [v5 setObject:v16 forKeyedSubscript:@"completedListening"];
  }
  if ([a1 hasArticleCompletedReading])
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "hasArticleCompletedReading"));
    [v5 setObject:v17 forKeyedSubscript:@"completedReading"];
  }
  if ([a1 hasArticleBeenConsumed])
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "hasArticleBeenConsumed"));
    [v5 setObject:v18 forKeyedSubscript:@"articleConsumed"];
  }
  if ([a1 articleLikingStatus])
  {
    v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "articleLikingStatus") == 1);
    [v5 setObject:v19 forKeyedSubscript:@"liked"];

    v20 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "articleLikingStatus") == 2);
    [v5 setObject:v20 forKeyedSubscript:@"disliked"];
  }
  if ([a1 hasArticleBeenMarkedOffensive])
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "hasArticleBeenMarkedOffensive"));
    [v5 setObject:v21 forKeyedSubscript:@"offensive"];
  }
  if ([a1 listenedCount])
  {
    v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1, "listenedCount"));
    [v5 setObject:v22 forKeyedSubscript:@"listenedCount"];
  }
  [a1 listeningProgress];
  if (v23 > 0.0)
  {
    v24 = NSNumber;
    [a1 listeningProgress];
    v25 = objc_msgSend(v24, "numberWithDouble:");
    [v5 setObject:v25 forKeyedSubscript:@"listeningProgress"];
  }
  if ([a1 readCount])
  {
    v26 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1, "readCount"));
    [v5 setObject:v26 forKeyedSubscript:@"readCount"];
  }
  if ([a1 isPruningDisabled]) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"pruningDisabled"];
  }

  return v5;
}

+ (uint64_t)readValueFromKeyValuePair:()FCReadingHistory
{
  return [a3 readingHistoryItem];
}

- (void)writeToKeyValuePair:()FCReadingHistory
{
  id v4 = a3;
  objc_msgSend(v4, "setValueType:", objc_msgSend((id)objc_opt_class(), "keyValuePairType"));
  [v4 setReadingHistoryItem:a1];
}

@end