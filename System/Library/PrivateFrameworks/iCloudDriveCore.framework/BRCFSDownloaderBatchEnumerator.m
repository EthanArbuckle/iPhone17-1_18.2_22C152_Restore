@interface BRCFSDownloaderBatchEnumerator
- (BRCFSDownloaderBatchEnumerator)initWithSyncContext:(id)a3 kind:(int)a4 now:(int64_t)a5 retryQueueKick:(int64_t *)a6;
- (BRCSyncContext)syncContext;
- (id)etag;
- (id)nextDocumentItem;
- (id)stageID;
- (int)kind;
- (int64_t)completedUnitCount;
- (int64_t)transferQOS;
- (int64_t)transferSize;
- (void)close;
@end

@implementation BRCFSDownloaderBatchEnumerator

- (BRCFSDownloaderBatchEnumerator)initWithSyncContext:(id)a3 kind:(int)a4 now:(int64_t)a5 retryQueueKick:(int64_t *)a6
{
  uint64_t v8 = *(void *)&a4;
  v10 = (BRCSyncContext *)a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCFSDownloaderBatchEnumerator;
  v11 = [(BRCFSDownloaderBatchEnumerator *)&v21 init];
  v12 = v11;
  if (v11)
  {
    v11->_syncContext = v10;
    v11->_now = a5;
    v11->_retryQueueKick = a6;
    v13 = [(BRCSyncContext *)v10 session];
    v14 = [v13 clientDB];
    v15 = [(BRCSyncContext *)v10 contextIdentifier];
    uint64_t v16 = [v14 fetch:@"  SELECT throttle_id, next_retry_stamp, app_library_rowid, download_etag, transfer_stage, unit_count_completed, transfer_size, download_priority      FROM client_downloads    WHERE throttle_state = 1    AND throttle_state != 0      AND transfer_queue = %@      AND transfer_operation IS NULL      AND download_kind = %d ORDER BY download_priority DESC, download_request_stamp DESC", v15, v8];
    rs = v12->_rs;
    v12->_rs = (PQLResultSet *)v16;

    v12->_kind = v8;
    uint64_t v18 = objc_opt_new();
    enumeratedThrottleIds = v12->_enumeratedThrottleIds;
    v12->_enumeratedThrottleIds = (NSMutableSet *)v18;
  }
  return v12;
}

- (id)nextDocumentItem
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v4 = [(BRCSyncContext *)self->_syncContext session];
  while ([(PQLResultSet *)self->_rs next])
  {
    v5 = (void *)MEMORY[0x2455D97F0]();
    uint64_t v6 = [(PQLResultSet *)self->_rs longLongAtIndex:0];
    uint64_t v7 = [(PQLResultSet *)self->_rs longLongAtIndex:1];
    enumeratedThrottleIds = self->_enumeratedThrottleIds;
    v9 = [NSNumber numberWithLongLong:v6];
    LOBYTE(enumeratedThrottleIds) = [(NSMutableSet *)enumeratedThrottleIds containsObject:v9];

    if (enumeratedThrottleIds)
    {
      v10 = brc_bread_crumbs();
      v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        uint64_t v24 = v6;
        __int16 v25 = 2112;
        v26 = v10;
        _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Throttle ID %lld was already enumerated. Will schedule it for retry to the next batch%@", buf, 0x16u);
      }

      int64_t now = self->_now;
      if (v7 <= now + 1) {
        uint64_t v7 = now + 1;
      }
    }
    else
    {
      int64_t now = self->_now;
    }
    if (v7 > now)
    {
      retryQueueKick = self->_retryQueueKick;
      int64_t v14 = *retryQueueKick;
      if (*retryQueueKick >= v7) {
        int64_t v14 = v7;
      }
      int64_t *retryQueueKick = v14;
      id v15 = [v4 clientDB];
      uint64_t kind = self->_kind;
      v17 = [(PQLResultSet *)self->_rs stringAtIndex:3];
      [v15 execute:@"UPDATE client_downloads    SET transfer_queue = '_retry'  WHERE throttle_id = %lld AND download_uint64_t kind = %u AND download_etag = %@", v6, kind, v17];

LABEL_16:
      char v21 = 1;
      goto LABEL_17;
    }
    uint64_t v18 = [v4 itemByRowID:v6];
    id v15 = [v18 asDocument];

    if (!v15) {
      goto LABEL_16;
    }
    v19 = self->_enumeratedThrottleIds;
    v20 = [NSNumber numberWithLongLong:v6];
    [(NSMutableSet *)v19 addObject:v20];

    id v15 = v15;
    char v21 = 0;
    v2 = v15;
LABEL_17:

    if ((v21 & 1) == 0) {
      goto LABEL_20;
    }
  }
  v2 = 0;
LABEL_20:

  return v2;
}

- (id)etag
{
  return (id)[(PQLResultSet *)self->_rs stringAtIndex:3];
}

- (id)stageID
{
  return (id)[(PQLResultSet *)self->_rs stringAtIndex:4];
}

- (int64_t)completedUnitCount
{
  return [(PQLResultSet *)self->_rs integerAtIndex:5];
}

- (int)kind
{
  return self->_kind;
}

- (int64_t)transferSize
{
  return [(PQLResultSet *)self->_rs longLongAtIndex:6];
}

- (int64_t)transferQOS
{
  return [(PQLResultSet *)self->_rs unsignedLongAtIndex:7];
}

- (void)close
{
}

- (BRCSyncContext)syncContext
{
  return self->_syncContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedThrottleIds, 0);
  objc_storeStrong((id *)&self->_rs, 0);
}

@end