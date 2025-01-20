@interface PLPersistentHistoryStats
+ (BOOL)fetchEarliestTransactionDateFromDatabase:(id)a3 intoStats:(id)a4;
+ (BOOL)fetchPageCountsOfPersistentHistoryTablesFromDatabase:(id)a3 intoStats:(id)a4;
+ (BOOL)fetchTotalPageCountFromDatabase:(id)a3 intoStats:(id)a4;
+ (BOOL)fetchTransactionCountFromDatabase:(id)a3 intoStats:(id)a4;
+ (BOOL)fetchUnusedPageCountFromDatabase:(id)a3 intoStats:(id)a4;
+ (id)statsFromDatabase:(id)a3;
- (NSDate)earliestTransactionDate;
- (double)_pageCountAsPercentOfFile:(int64_t)a3;
- (double)_pageCountAsPercentOfPayload:(int64_t)a3;
- (double)changesPageCountPercent;
- (double)changesPageCountPercentOfPayload;
- (double)persistentHistoryPageCountPercent;
- (double)persistentHistoryPageCountPercentOfPayload;
- (double)transactionStringsPageCountPercent;
- (double)transactionStringsPageCountPercentOfPayload;
- (double)transactionsPageCountPercent;
- (double)transactionsPageCountPercentOfPayload;
- (int64_t)changesPageCount;
- (int64_t)daysSinceEarliestTransaction;
- (int64_t)filePageCount;
- (int64_t)payloadPageCount;
- (int64_t)persistentHistoryPageCount;
- (int64_t)transactionCount;
- (int64_t)transactionStringsPageCount;
- (int64_t)transactionsPageCount;
- (int64_t)unusedPageCount;
- (void)setChangesPageCount:(int64_t)a3;
- (void)setEarliestTransactionDate:(id)a3;
- (void)setFilePageCount:(int64_t)a3;
- (void)setTransactionCount:(int64_t)a3;
- (void)setTransactionStringsPageCount:(int64_t)a3;
- (void)setTransactionsPageCount:(int64_t)a3;
- (void)setUnusedPageCount:(int64_t)a3;
@end

@implementation PLPersistentHistoryStats

- (void).cxx_destruct
{
}

- (void)setEarliestTransactionDate:(id)a3
{
}

- (NSDate)earliestTransactionDate
{
  return self->_earliestTransactionDate;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setChangesPageCount:(int64_t)a3
{
  self->_changesPageCount = a3;
}

- (int64_t)changesPageCount
{
  return self->_changesPageCount;
}

- (void)setTransactionStringsPageCount:(int64_t)a3
{
  self->_transactionStringsPageCount = a3;
}

- (int64_t)transactionStringsPageCount
{
  return self->_transactionStringsPageCount;
}

- (void)setTransactionsPageCount:(int64_t)a3
{
  self->_transactionsPageCount = a3;
}

- (int64_t)transactionsPageCount
{
  return self->_transactionsPageCount;
}

- (void)setUnusedPageCount:(int64_t)a3
{
  self->_unusedPageCount = a3;
}

- (int64_t)unusedPageCount
{
  return self->_unusedPageCount;
}

- (void)setFilePageCount:(int64_t)a3
{
  self->_filePageCount = a3;
}

- (int64_t)filePageCount
{
  return self->_filePageCount;
}

- (double)_pageCountAsPercentOfPayload:(int64_t)a3
{
  return (double)a3 / (double)[(PLPersistentHistoryStats *)self payloadPageCount] * 100.0;
}

- (double)persistentHistoryPageCountPercentOfPayload
{
  int64_t v3 = [(PLPersistentHistoryStats *)self persistentHistoryPageCount];
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfPayload:v3];
  return result;
}

- (double)changesPageCountPercentOfPayload
{
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfPayload:self->_changesPageCount];
  return result;
}

- (double)transactionStringsPageCountPercentOfPayload
{
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfPayload:self->_transactionStringsPageCount];
  return result;
}

- (double)transactionsPageCountPercentOfPayload
{
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfPayload:self->_transactionsPageCount];
  return result;
}

- (double)_pageCountAsPercentOfFile:(int64_t)a3
{
  return (double)a3 / (double)self->_filePageCount * 100.0;
}

- (double)persistentHistoryPageCountPercent
{
  int64_t v3 = [(PLPersistentHistoryStats *)self persistentHistoryPageCount];
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfFile:v3];
  return result;
}

- (double)changesPageCountPercent
{
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfFile:self->_changesPageCount];
  return result;
}

- (double)transactionStringsPageCountPercent
{
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfFile:self->_transactionStringsPageCount];
  return result;
}

- (double)transactionsPageCountPercent
{
  [(PLPersistentHistoryStats *)self _pageCountAsPercentOfFile:self->_transactionsPageCount];
  return result;
}

- (int64_t)daysSinceEarliestTransaction
{
  int64_t result = (int64_t)self->_earliestTransactionDate;
  if (result)
  {
    [(id)result timeIntervalSinceNow];
    return llround(ceil(fabs(v3 / 86400.0)));
  }
  return result;
}

- (int64_t)persistentHistoryPageCount
{
  return self->_transactionStringsPageCount + self->_transactionsPageCount + self->_changesPageCount;
}

- (int64_t)payloadPageCount
{
  return self->_filePageCount - self->_unusedPageCount;
}

+ (BOOL)fetchEarliestTransactionDateFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__PLPersistentHistoryStats_fetchEarliestTransactionDateFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E586B130;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", @"SELECT ZTIMESTAMP  FROM ATRANSACTION  ORDER BY ZTIMESTAMP ASC  LIMIT 1;",
                 v8);

  return (char)a3;
}

void __79__PLPersistentHistoryStats_fetchEarliestTransactionDateFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a2, 0));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setEarliestTransactionDate:v3];
}

+ (BOOL)fetchTransactionCountFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PLPersistentHistoryStats_fetchTransactionCountFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E586B130;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", @"SELECT COUNT(*) from ATRANSACTION;",
                 v8);

  return (char)a3;
}

uint64_t __72__PLPersistentHistoryStats_fetchTransactionCountFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = sqlite3_column_int(a2, 0);
  v4 = *(void **)(a1 + 32);
  return [v4 setTransactionCount:v3];
}

+ (BOOL)fetchUnusedPageCountFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PLPersistentHistoryStats_fetchUnusedPageCountFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E586B130;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = [a3 prepareStatement:@"PRAGMA freelist_count;" andStepThroughResultsWithBlock:v8];

  return (char)a3;
}

uint64_t __71__PLPersistentHistoryStats_fetchUnusedPageCountFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = sqlite3_column_int(a2, 0);
  v4 = *(void **)(a1 + 32);
  return [v4 setUnusedPageCount:v3];
}

+ (BOOL)fetchTotalPageCountFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PLPersistentHistoryStats_fetchTotalPageCountFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E586B130;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = [a3 prepareStatement:@"PRAGMA page_count;" andStepThroughResultsWithBlock:v8];

  return (char)a3;
}

uint64_t __70__PLPersistentHistoryStats_fetchTotalPageCountFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = sqlite3_column_int(a2, 0);
  v4 = *(void **)(a1 + 32);
  return [v4 setFilePageCount:v3];
}

+ (BOOL)fetchPageCountsOfPersistentHistoryTablesFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PLPersistentHistoryStats_fetchPageCountsOfPersistentHistoryTablesFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E586B130;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", @"SELECT m.tbl_name tbl_name, sum(pageno) page_count  FROM   dbstat d, sqlite_master m  WHERE     d.name = m.name     AND m.tbl_name IN ('ACHANGE', 'ATRANSACTION', 'ATRANSACTIONSTRING')     AND d.aggregate = TRUE  GROUP BY m.tbl_name;",
                 v8);

  return (char)a3;
}

uint64_t __91__PLPersistentHistoryStats_fetchPageCountsOfPersistentHistoryTablesFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = sqlite3_column_text(a2, 0);
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 1);
  if (!strcmp((const char *)v4, "ACHANGE"))
  {
    v7 = *(void **)(a1 + 32);
    return [v7 setChangesPageCount:v5];
  }
  else if (!strcmp((const char *)v4, "ATRANSACTION"))
  {
    v8 = *(void **)(a1 + 32);
    return [v8 setTransactionsPageCount:v5];
  }
  else
  {
    uint64_t result = strcmp((const char *)v4, "ATRANSACTIONSTRING");
    if (!result)
    {
      id v9 = *(void **)(a1 + 32);
      return [v9 setTransactionStringsPageCount:v5];
    }
  }
  return result;
}

+ (id)statsFromDatabase:(id)a3
{
  id v4 = a3;
  sqlite3_int64 v5 = objc_alloc_init(PLPersistentHistoryStats);
  if ([a1 fetchPageCountsOfPersistentHistoryTablesFromDatabase:v4 intoStats:v5]
    && [a1 fetchTotalPageCountFromDatabase:v4 intoStats:v5]
    && [a1 fetchUnusedPageCountFromDatabase:v4 intoStats:v5]
    && [a1 fetchTransactionCountFromDatabase:v4 intoStats:v5]
    && [a1 fetchEarliestTransactionDateFromDatabase:v4 intoStats:v5])
  {
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end