@interface FCFDBConnection
- (FCFDBConnection)initWithPath:(id)a3;
- (id)selectAllFeedItemIDsWithFeedLookupIDs:(id)a3 feedRange:(id)a4;
- (id)selectFeedItemIDsWithFeedLookupIDs:(id)a3 feedRange:(id)a4 feature:(id)a5 maxCount:(unint64_t)a6;
- (id)selectFeedItemsWithIDs:(id)a3;
- (id)selectFeedsWithFeedIDs:(id)a3;
- (int64_t)selectMaxFeedLookupID;
- (void)_prepareForUse;
- (void)beginTransaction;
- (void)commitTransaction;
- (void)dealloc;
- (void)deleteFeedItemIndexesFromFeedLookupID:(id)a3 feedRange:(id)a4;
- (void)deleteFeedItemsWithIDs:(id)a3;
- (void)incrementalVacuum;
- (void)insertFeatureIndexesForFeedItems:(id)a3 knownFeedsByID:(id)a4;
- (void)insertFeedItems:(id)a3 knownFeedsByID:(id)a4;
- (void)insertFeeds:(id)a3;
- (void)insertIndexesForFeedItems:(id)a3 knownFeedsByID:(id)a4;
@end

@implementation FCFDBConnection

- (FCFDBConnection)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FCFDBConnection;
  v5 = [(FCFDBConnection *)&v10 init];
  if (v5)
  {
    if (FCFDBInvokeOpen((const char *)[v4 cStringUsingEncoding:4], &v5->_db))
    {
      v6 = v5;
      db = v5->_db;
      v8 = v6;
      if (db)
      {
        sqlite3_close(db);
        v8 = v5;
      }

      v5 = 0;
    }
    else
    {
      [(FCFDBConnection *)v5 _prepareForUse];
    }
  }

  return v5;
}

uint64_t __32__FCFDBConnection_initWithPath___block_invoke(uint64_t a1)
{
  v1 = *(sqlite3 **)(*(void *)(a1 + 32) + 8);
  if (v1) {
    sqlite3_close(v1);
  }
  return 0;
}

- (void)dealloc
{
  FCFDBInvokeClose(self->_db);
  v3.receiver = self;
  v3.super_class = (Class)FCFDBConnection;
  [(FCFDBConnection *)&v3 dealloc];
}

- (int64_t)selectMaxFeedLookupID
{
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, @"SELECT MAX(lookup_id) FROM feed;", &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  sqlite3_int64 v3 = sqlite3_column_int64(pStmt, 0);
  FCFDBInvokeFinalize(self->_db, pStmt);
  return v3;
}

- (id)selectFeedsWithFeedIDs:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT * FROM feed WHERE feed_id IN (");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__FCFDBConnection_selectFeedsWithFeedIDs___block_invoke;
  v17[3] = &unk_1E5B4DAA0;
  id v7 = v6;
  id v18 = v7;
  [v4 enumerateObjectsUsingBlock:v17];
  [v7 appendString:@";"]);
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v7, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    v8 = sqlite3_column_text(pStmt, 0);
    sqlite3_int64 v9 = sqlite3_column_int64(pStmt, 1);
    sqlite3_int64 v10 = sqlite3_column_int64(pStmt, 2);
    sqlite3_int64 v11 = sqlite3_column_int64(pStmt, 3);
    v12 = sqlite3_column_blob(pStmt, 4);
    id v13 = [[FCFDBFeed alloc] initFromSQLWithFeedID:v8 feedLookupID:v9 refreshedFromOrder:v10 refreshedToOrder:v11 fetchedRangesBytes:v12 fetchedRangesLength:sqlite3_column_bytes(pStmt, 4)];
    v14 = [v13 feedID];
    [v5 setObject:v13 forKey:v14];
  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v5;
}

void __42__FCFDBConnection_selectFeedsWithFeedIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendFormat:@","];
  }
  [*(id *)(a1 + 32) appendFormat:@"'%@'", v5];
}

- (id)selectFeedItemIDsWithFeedLookupIDs:(id)a3 feedRange:(id)a4 feature:(id)a5 maxCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  v14 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT feed_lookup_id, feed_item_order FROM feed_item_lookup WHERE feed_lookup_id IN (");
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__FCFDBConnection_selectFeedItemIDsWithFeedLookupIDs_feedRange_feature_maxCount___block_invoke;
  v23[3] = &unk_1E5B4DAC8;
  id v15 = v14;
  id v24 = v15;
  [v10 enumerateObjectsUsingBlock:v23];
  v16 = [v11 top];
  uint64_t v17 = [v16 order];
  id v18 = [v11 bottom];
  [v15 appendFormat:@" AND feed_item_order <= %llu AND feed_item_order > %llu"], v17, objc_msgSend(v18, "order"));

  objc_msgSend(v15, "appendFormat:", @" AND feature = %lld", objc_msgSend(v12, "hash"));
  if (a6 - 1 <= 0xFFFFFFFFFFFFFFFDLL) {
    objc_msgSend(v15, "appendFormat:", @" ORDER BY feed_item_order DESC LIMIT %lu", a6);
  }
  [v15 appendString:@";"];
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v15, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    sqlite3_int64 v19 = sqlite3_column_int64(pStmt, 0);
    v20 = objc_msgSend(NSNumber, "numberWithLongLong:", v19 | (sqlite3_column_int64(pStmt, 1) << 20));
    [v13 addObject:v20];
  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v13;
}

void __81__FCFDBConnection_selectFeedItemIDsWithFeedLookupIDs_feedRange_feature_maxCount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendFormat:@","];
  }
  [*(id *)(a1 + 32) appendFormat:@"'%@'", v5];
}

- (id)selectAllFeedItemIDsWithFeedLookupIDs:(id)a3 feedRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  sqlite3_int64 v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT feed_lookup_id, feed_item_order FROM feed_item_lookup WHERE feed_lookup_id IN (");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__FCFDBConnection_selectAllFeedItemIDsWithFeedLookupIDs_feedRange___block_invoke;
  v18[3] = &unk_1E5B4DAC8;
  id v10 = v9;
  id v19 = v10;
  [v6 enumerateObjectsUsingBlock:v18];
  id v11 = [v7 top];
  uint64_t v12 = [v11 order];
  id v13 = [v7 bottom];
  [v10 appendFormat:@" AND feed_item_order <= %llu AND feed_item_order > %llu"], v12, objc_msgSend(v13, "order"));

  [v10 appendString:@";"];
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v10, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    sqlite3_int64 v14 = sqlite3_column_int64(pStmt, 0);
    id v15 = objc_msgSend(NSNumber, "numberWithLongLong:", v14 | (sqlite3_column_int64(pStmt, 1) << 20));
    [v8 addObject:v15];
  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v8;
}

void __67__FCFDBConnection_selectAllFeedItemIDsWithFeedLookupIDs_feedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendFormat:@","];
  }
  [*(id *)(a1 + 32) appendFormat:@"'%@'", v5];
}

- (id)selectFeedItemsWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"SELECT * FROM feed_item WHERE id IN (");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__FCFDBConnection_selectFeedItemsWithIDs___block_invoke;
  v16[3] = &unk_1E5B4DAC8;
  id v7 = v6;
  id v17 = v7;
  [v4 enumerateObjectsUsingBlock:v16];
  [v7 appendString:@";"]);
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v7, &pStmt);
  while (FCFDBInvokeStep(self->_db, pStmt) == 100)
  {
    v8 = (void *)MEMORY[0x1A6260FD0]();
    sqlite3_int64 v9 = sqlite3_column_int64(pStmt, 0);
    id v10 = sqlite3_column_blob(pStmt, 1);
    id v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v10, sqlite3_column_bytes(pStmt, 1), 0);
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F82A50]) initWithData:v11];
    if (v12)
    {
      id v13 = [NSNumber numberWithLongLong:v9];
      [v5 setObject:v12 forKey:v13];
    }
  }
  FCFDBInvokeFinalize(self->_db, pStmt);

  return v5;
}

void __42__FCFDBConnection_selectFeedItemsWithIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendFormat:@","];
  }
  [*(id *)(a1 + 32) appendFormat:@"'%@'", v5];
}

- (void)beginTransaction
{
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, @"BEGIN TRANSACTION;", &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)commitTransaction
{
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, @"COMMIT;", &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertFeeds:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, @"INSERT OR REPLACE INTO feed (feed_id, lookup_id, refreshed_from_order, refreshed_to_order, fetched_ranges) VALUES (?, ?, ?, ?, ?);",
    &pStmt);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = pStmt;
        objc_msgSend(v10, "feedID", (void)v16);
        id v12 = objc_claimAutoreleasedReturnValue();
        sqlite3_bind_text(v11, 1, (const char *)[v12 cStringUsingEncoding:4], -1, 0);

        sqlite3_bind_int64(pStmt, 2, [v10 feedLookupID]);
        sqlite3_bind_int64(pStmt, 3, [v10 refreshedFromOrder]);
        sqlite3_bind_int64(pStmt, 4, [v10 refreshedToOrder]);
        id v13 = [v10 fetchedRangesData];
        sqlite3_int64 v14 = pStmt;
        id v15 = v13;
        sqlite3_bind_blob(v14, 5, (const void *)[v15 bytes], objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        FCFDBInvokeStep(self->_db, pStmt);
        sqlite3_reset(pStmt);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertFeedItems:(id)a3 knownFeedsByID:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, @"INSERT OR IGNORE INTO feed_item (id, encoded) VALUES (?, ?);", &pStmt);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v37 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v25;
    *(void *)&long long v10 = 136315906;
    long long v23 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v8);
        }
        sqlite3_int64 v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "feedID", v23, (void)v24);
        long long v16 = [v7 objectForKey:v15];

        if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = (void *)[[NSString alloc] initWithFormat:@"attempting to save feed items for a feed that hasn't been faulted in"];
          *(_DWORD *)buf = v23;
          v30 = "-[FCFDBConnection insertFeedItems:knownFeedsByID:]";
          __int16 v31 = 2080;
          v32 = "FCFDBConnection.m";
          __int16 v33 = 1024;
          int v34 = 269;
          __int16 v35 = 2114;
          v36 = v22;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v17 = [v16 feedLookupID];
        sqlite3_int64 v18 = v17 | ([v14 order] << 20);
        long long v19 = [v14 data];
        sqlite3_bind_int64(pStmt, 1, v18);
        v20 = pStmt;
        id v21 = v19;
        sqlite3_bind_blob(v20, 2, (const void *)[v21 bytes], objc_msgSend(v21, "length"), 0);
        FCFDBInvokeStep(self->_db, pStmt);
        sqlite3_reset(pStmt);
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v24 objects:v37 count:16];
    }
    while (v11);
  }

  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertIndexesForFeedItems:(id)a3 knownFeedsByID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, @"INSERT OR IGNORE INTO feed_item_lookup (feed_lookup_id, feed_item_order, feature) VALUES (?, ?, 0);",
    &pStmt);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v33 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = MEMORY[0x1E4F14500];
    uint64_t v13 = *(void *)v21;
    *(void *)&long long v10 = 136315906;
    long long v19 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v8);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = objc_msgSend(v15, "feedID", v19, (void)v20);
        uint64_t v17 = [v7 objectForKey:v16];

        if (!v17 && os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          sqlite3_int64 v18 = (void *)[[NSString alloc] initWithFormat:@"attempting to save feed items for a feed that hasn't been faulted in"];
          *(_DWORD *)buf = v19;
          long long v26 = "-[FCFDBConnection insertIndexesForFeedItems:knownFeedsByID:]";
          __int16 v27 = 2080;
          v28 = "FCFDBConnection.m";
          __int16 v29 = 1024;
          int v30 = 292;
          __int16 v31 = 2114;
          v32 = v18;
          _os_log_error_impl(&dword_1A460D000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        sqlite3_bind_int64(pStmt, 1, [v17 feedLookupID]);
        sqlite3_bind_int64(pStmt, 2, [v15 order]);
        FCFDBInvokeStep(self->_db, pStmt);
        sqlite3_reset(pStmt);
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v33 count:16];
    }
    while (v11);
  }

  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)insertFeatureIndexesForFeedItems:(id)a3 knownFeedsByID:(id)a4
{
  id v6 = a4;
  sqlite3_int64 v14 = 0;
  db = self->_db;
  id v8 = a3;
  FCFDBInvokePrepare(db, @"INSERT OR IGNORE INTO feed_item_lookup (feed_lookup_id, feed_item_order, feature) VALUES (?, ?, ?);",
    &v14);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke;
  v10[3] = &unk_1E5B4DB18;
  uint64_t v12 = self;
  uint64_t v13 = v14;
  id v11 = v6;
  id v9 = v6;
  [v8 enumerateObjectsUsingBlock:v10];

  FCFDBInvokeFinalize(self->_db, v14);
}

void __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 feedID];
  id v6 = [v4 objectForKey:v5];

  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = (void *)[[NSString alloc] initWithFormat:@"attempting to index features for a feed that hasn't been faulted in"];
    *(_DWORD *)buf = 136315906;
    id v15 = "-[FCFDBConnection insertFeatureIndexesForFeedItems:knownFeedsByID:]_block_invoke";
    __int16 v16 = 2080;
    uint64_t v17 = "FCFDBConnection.m";
    __int16 v18 = 1024;
    int v19 = 312;
    __int16 v20 = 2114;
    long long v21 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke_68;
  v10[3] = &unk_1E5B4DAF0;
  id v11 = v6;
  id v12 = v3;
  long long v13 = *(_OWORD *)(a1 + 40);
  id v7 = v3;
  id v8 = v6;
  [v7 enumerateFeaturesWithBlock:v10];
}

uint64_t __67__FCFDBConnection_insertFeatureIndexesForFeedItems_knownFeedsByID___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = *(sqlite3_stmt **)(a1 + 56);
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  sqlite3_bind_int64(v3, 1, [v4 feedLookupID]);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 56), 2, [*(id *)(a1 + 40) order]);
  id v6 = *(sqlite3_stmt **)(a1 + 56);
  sqlite3_int64 v7 = [v5 hash];

  sqlite3_bind_int64(v6, 3, v7);
  FCFDBInvokeStep(*(sqlite3 **)(*(void *)(a1 + 48) + 8), *(sqlite3_stmt **)(a1 + 56));
  id v8 = *(sqlite3_stmt **)(a1 + 56);
  return sqlite3_reset(v8);
}

- (void)deleteFeedItemIndexesFromFeedLookupID:(id)a3 feedRange:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v7 top];
  uint64_t v10 = [v9 order];
  id v11 = [v7 bottom];

  objc_msgSend(v6, "stringWithFormat:", @"DELETE FROM feed_item_lookup WHERE feed_lookup_id = %@ AND feed_item_order <= %llu AND feed_item_order > %llu;",
    v8,
    v10,
  id v12 = [v11 order]);

  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v12, &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);
}

- (void)deleteFeedItemsWithIDs:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28E78];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "stringWithString:", @"DELETE FROM feed_item WHERE id IN (");
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__FCFDBConnection_deleteFeedItemsWithIDs___block_invoke;
  v9[3] = &unk_1E5B4DAC8;
  id v10 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  [v7 appendString:@";"]);
  pStmt = 0;
  FCFDBInvokePrepare(self->_db, v7, &pStmt);
  FCFDBInvokeStep(self->_db, pStmt);
  FCFDBInvokeFinalize(self->_db, pStmt);
}

void __42__FCFDBConnection_deleteFeedItemsWithIDs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendFormat:@","];
  }
  [*(id *)(a1 + 32) appendFormat:@"'%@'", v5];
}

- (void)incrementalVacuum
{
}

- (void)_prepareForUse
{
  sqlite3_busy_timeout(self->_db, 1000);
  FCFDBInvokeExec(self->_db, "PRAGMA journal_mode = WAL;");
  FCFDBInvokeExec(self->_db, "PRAGMA auto_vacuum = incremental");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS metadata (last_feed_lookup_id INTEGER, last_feed_item_id INTEGER);");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS feed (feed_id STRING PRIMARY KEY, lookup_id INTEGER, refreshed_from_order INTEGER, refreshed_to_order INTEGER, fetched_ranges BLOB);");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS feed_item_lookup (feed_lookup_id INTEGER, feed_item_order INTEGER, feature INTEGER);");
  FCFDBInvokeExec(self->_db, "CREATE TABLE IF NOT EXISTS feed_item (id INTEGER PRIMARY KEY, encoded BLOB);");
  db = self->_db;
  FCFDBInvokeExec(db, "CREATE INDEX IF NOT EXISTS index_feed_item_lookup ON feed_item_lookup (feed_lookup_id, feed_item_order, feature);");
}

@end