@interface WFCloudKitSyncEventLogger
+ (id)createInMemorySyncEventLogger;
+ (id)createPersistedSyncEventLogger;
- (BOOL)_applySchema;
- (BOOL)_applySchemaIfNecessary;
- (id)_eventForDatabaseDescriptor:(id)a3 value:(id)a4;
- (id)_eventForRecord:(id)a3;
- (id)_eventForRecordID:(id)a3;
- (id)_eventsWithFilter:(id)a3;
- (id)_initWithFilename:(const char *)a3 flags:(int)a4 postNotifications:(BOOL)a5;
- (id)events;
- (id)eventsWithType:(int)a3;
- (void)_logEventWithType:(int)a3 event:(id)a4;
- (void)clearLogs;
- (void)clearOldLogs;
- (void)dealloc;
- (void)logDatabaseInsert:(id)a3 value:(id)a4;
- (void)logDatabaseModify:(id)a3 value:(id)a4;
- (void)logDatabaseRemove:(id)a3;
- (void)logDeletionFetched:(id)a3;
- (void)logError:(id)a3;
- (void)logEvent:(id)a3;
- (void)logLibraryMerge:(id)a3 remote:(id)a4 after:(id)a5;
- (void)logRecordDeleteFailed:(id)a3 error:(id)a4;
- (void)logRecordDeleted:(id)a3;
- (void)logRecordFetched:(id)a3;
- (void)logRecordPushFailed:(id)a3 error:(id)a4;
- (void)logRecordPushed:(id)a3;
@end

@implementation WFCloudKitSyncEventLogger

- (id)_eventForRecordID:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"id";
  id v3 = a3;
  v4 = [v3 recordName];
  v9[1] = @"zoneID";
  v10[0] = v4;
  v5 = [v3 zoneID];

  v6 = [v5 zoneName];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_eventForRecord:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v11 = [v3 objectForKey:v10];
        v12 = [v11 description];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  v25[0] = @"id";
  v13 = [v3 recordID];
  v14 = [v13 recordName];
  v26[0] = v14;
  v25[1] = @"zoneID";
  v15 = [v3 recordID];
  v16 = [v15 zoneID];
  v17 = [v16 zoneName];
  v26[1] = v17;
  v25[2] = @"type";
  v18 = [v3 recordType];
  v25[3] = @"values";
  v26[2] = v18;
  v26[3] = v4;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v19;
}

- (id)_eventForDatabaseDescriptor:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v6 objectType];
  uint64_t v8 = WFDescriptionForDatabaseObjectType();
  [v7 setObject:v8 forKeyedSubscript:@"type"];

  v9 = [v6 identifier];

  [v7 setObject:v9 forKeyedSubscript:@"id"];
  if ([v5 length]) {
    [v7 setObject:v5 forKeyedSubscript:@"value"];
  }

  return v7;
}

- (void)_logEventWithType:(int)a3 event:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8;
  uint64_t v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:10 error:0];

  v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
  int v12 = sqlite3_bind_int(self->_log_event, 1, a3);
  if (v12)
  {
    int v13 = v12;
    v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      long long v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      __int16 v25 = 2080;
      v26 = sqlite3_errstr(v13);
      v15 = "%s Failed to bind event type value in event log statement: %s";
LABEL_10:
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, 0x16u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  int v16 = sqlite3_bind_double(self->_log_event, 2, v9);
  if (v16)
  {
    int v17 = v16;
    v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      long long v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      __int16 v25 = 2080;
      v26 = sqlite3_errstr(v17);
      v15 = "%s Failed to bind timestamp value in event log statement: %s";
      goto LABEL_10;
    }
LABEL_11:

    sqlite3_reset(self->_log_event);
    goto LABEL_12;
  }
  int v18 = sqlite3_bind_text(self->_log_event, 3, (const char *)[v11 UTF8String], -1, 0);
  if (v18)
  {
    int v19 = v18;
    v14 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      long long v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      __int16 v25 = 2080;
      v26 = sqlite3_errstr(v19);
      v15 = "%s Failed to bind json value in event log statement: %s";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  int v20 = sqlite3_step(self->_log_event);
  if (v20 != 101)
  {
    int v21 = v20;
    long long v22 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315394;
      long long v24 = "-[WFCloudKitSyncEventLogger _logEventWithType:event:]";
      __int16 v25 = 2080;
      v26 = sqlite3_errstr(v21);
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Failed to execute event log statement: %s", (uint8_t *)&v23, 0x16u);
    }
  }
  sqlite3_reset(self->_log_event);
  if (self->_postNotifications) {
    notify_post((const char *)WFCloudKitSyncEventsDidChange);
  }
LABEL_12:
}

- (BOOL)_applySchema
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  int v2 = sqlite3_exec(self->_db, "CREATE TABLE events (id INTEGER PRIMARY KEY,type INTEGER NOT NULL,timestamp REAL NOT NULL,event TEXT NOT NULL)", 0, 0, &errmsg);
  if (v2)
  {
    id v3 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v7 = "-[WFCloudKitSyncEventLogger _applySchema]";
      __int16 v8 = 2080;
      double v9 = errmsg;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Failed to set schema: %s", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }
  return v2 == 0;
}

- (BOOL)_applySchemaIfNecessary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  ppStmt = 0;
  errmsg = 0;
  int v3 = sqlite3_prepare_v2(self->_db, "PRAGMA user_version", -1, &ppStmt, 0);
  if (v3)
  {
    int v4 = v3;
    id v5 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = sqlite3_errstr(v4);
      *(_DWORD *)buf = 136315394;
      int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
      __int16 v21 = 2080;
      long long v22 = (char *)v6;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Failed to prepare statement: %s", buf, 0x16u);
    }

    goto LABEL_24;
  }
  if (sqlite3_step(ppStmt) != 100)
  {
    sqlite3_finalize(ppStmt);
LABEL_9:
    int v9 = sqlite3_exec(self->_db, "BEGIN TRANSACTION", 0, 0, &errmsg);
    uint64_t v10 = getWFCloudKitSyncLogObject();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
        __int16 v21 = 2080;
        long long v22 = errmsg;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to start transaction: %s", buf, 0x16u);
      }

      goto LABEL_23;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_INFO, "%s Schema version has changed. Dropping all tables and recreating database.", buf, 0xCu);
    }

    if (sqlite3_exec(self->_db, "PRAGMA foreign_keys = OFF", 0, 0, &errmsg))
    {
      int v12 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
LABEL_17:
        *(_DWORD *)buf = 136315394;
        int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
        __int16 v21 = 2080;
        long long v22 = errmsg;
        int v13 = "%s Failed to disable foreign key constraints: %s";
LABEL_21:
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
      }
    }
    else
    {
      if (!sqlite3_exec(self->_db, "DROP TABLE IF EXISTS events", 0, 0, &errmsg))
      {
        BOOL v8 = [(WFCloudKitSyncEventLogger *)self _applySchema];
        if (!v8) {
          return v8;
        }
        db = self->_db;
        objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %d", 2);
        id v15 = objc_claimAutoreleasedReturnValue();
        LODWORD(db) = sqlite3_exec(db, (const char *)[v15 UTF8String], 0, 0, &errmsg);

        if (db)
        {
          int v12 = getWFCloudKitSyncLogObject();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 136315394;
          int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
          __int16 v21 = 2080;
          long long v22 = errmsg;
          int v13 = "%s SQL error: %s";
          goto LABEL_21;
        }
        if (!sqlite3_exec(self->_db, "PRAGMA foreign_keys = ON", 0, 0, &errmsg))
        {
          if (!sqlite3_exec(self->_db, "COMMIT", 0, 0, &errmsg)) {
            goto LABEL_7;
          }
          int v12 = getWFCloudKitSyncLogObject();
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_22;
          }
          *(_DWORD *)buf = 136315394;
          int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
          __int16 v21 = 2080;
          long long v22 = errmsg;
          int v13 = "%s Failed to start transaction: %s";
          goto LABEL_21;
        }
        int v12 = getWFCloudKitSyncLogObject();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_22;
        }
        goto LABEL_17;
      }
      int v12 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[WFCloudKitSyncEventLogger _applySchemaIfNecessary]";
        __int16 v21 = 2080;
        long long v22 = errmsg;
        int v13 = "%s Unable to drop events table: %s";
        goto LABEL_21;
      }
    }
LABEL_22:

LABEL_23:
    sqlite3_free(errmsg);
LABEL_24:
    LOBYTE(v8) = 0;
    return v8;
  }
  int v7 = sqlite3_column_int(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  if (v7 != 2) {
    goto LABEL_9;
  }
LABEL_7:
  LOBYTE(v8) = 1;
  return v8;
}

- (void)clearOldLogs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = NSString;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  id v5 = objc_msgSend(v3, "stringWithFormat:", @"DELETE FROM events WHERE (timestamp < %lf)", v4 + -86400.0);
  errmsg = 0;
  db = self->_db;
  id v7 = v5;
  if (sqlite3_exec(db, (const char *)[v7 UTF8String], 0, 0, &errmsg))
  {
    BOOL v8 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[WFCloudKitSyncEventLogger clearOldLogs]";
      __int16 v12 = 2080;
      int v13 = errmsg;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to delete events: %s", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }
  if (self->_postNotifications) {
    notify_post((const char *)WFCloudKitSyncEventsDidChange);
  }
}

- (void)clearLogs
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  errmsg = 0;
  if (sqlite3_exec(self->_db, "DELETE FROM events", 0, 0, &errmsg))
  {
    int v3 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v6 = "-[WFCloudKitSyncEventLogger clearLogs]";
      __int16 v7 = 2080;
      BOOL v8 = errmsg;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Failed to delete events: %s", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }
  if (self->_postNotifications) {
    notify_post((const char *)WFCloudKitSyncEventsDidChange);
  }
}

- (id)_eventsWithFilter:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = 0x1E4F29000uLL;
  if (v4)
  {
    id v6 = [NSString stringWithFormat:@"WHERE %@", v4];
  }
  else
  {
    id v6 = &stru_1F229A4D8;
  }
  __int16 v7 = [NSString stringWithFormat:@"SELECT id, type, timestamp, event FROM events %@ ORDER BY timestamp DESC", v6];
  ppStmt = 0;
  db = self->_db;
  id v9 = v7;
  int v10 = sqlite3_prepare_v2(db, (const char *)[v9 UTF8String], -1, &ppStmt, 0);
  if (v10)
  {
    int v11 = v10;
    __int16 v12 = getWFCloudKitSyncLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = sqlite3_errstr(v11);
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = "-[WFCloudKitSyncEventLogger _eventsWithFilter:]";
      __int16 v29 = 2080;
      v30 = v13;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Failed to prepare events statement: %s", buf, 0x16u);
    }

    uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v25 = v9;
    uint64_t v14 = objc_opt_new();
    while (sqlite3_step(ppStmt) == 100)
    {
      uint64_t v15 = sqlite3_column_int(ppStmt, 0);
      uint64_t v16 = sqlite3_column_int(ppStmt, 1);
      int v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(ppStmt, 2));
      unint64_t v18 = v5;
      int v19 = objc_msgSend(*(id *)(v5 + 24), "stringWithUTF8String:", sqlite3_column_text(ppStmt, 3));
      int v20 = (void *)MEMORY[0x1E4F28D90];
      __int16 v21 = [v19 dataUsingEncoding:4];
      long long v22 = [v20 JSONObjectWithData:v21 options:0 error:0];

      uint64_t v23 = [[WFCloudKitSyncEvent alloc] initWithIdentifier:v15 eventType:v16 date:v17 content:v22];
      [v14 addObject:v23];

      unint64_t v5 = v18;
    }
    sqlite3_finalize(ppStmt);
    id v9 = v25;
  }

  return v14;
}

- (id)eventsWithType:(int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"type == %i", *(void *)&a3);
  unint64_t v5 = [(WFCloudKitSyncEventLogger *)self _eventsWithFilter:v4];

  return v5;
}

- (id)events
{
  return [(WFCloudKitSyncEventLogger *)self _eventsWithFilter:0];
}

- (void)logError:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  __int16 v7 = @"error";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(WFCloudKitSyncEventLogger *)self _logEventWithType:11 event:v6];
}

- (void)logEvent:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  __int16 v7 = @"event";
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [(WFCloudKitSyncEventLogger *)self _logEventWithType:10 event:v6];
}

- (void)logLibraryMerge:(id)a3 remote:(id)a4 after:(id)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"local";
  v13[1] = @"remote";
  v14[0] = a3;
  v14[1] = a4;
  v13[2] = @"after";
  v14[2] = a5;
  BOOL v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  __int16 v12 = [v8 dictionaryWithObjects:v14 forKeys:v13 count:3];

  [(WFCloudKitSyncEventLogger *)self _logEventWithType:9 event:v12];
}

- (void)logDatabaseRemove:(id)a3
{
  id v4 = [(WFCloudKitSyncEventLogger *)self _eventForDatabaseDescriptor:a3 value:0];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:8 event:v4];
}

- (void)logDatabaseInsert:(id)a3 value:(id)a4
{
  id v5 = [(WFCloudKitSyncEventLogger *)self _eventForDatabaseDescriptor:a3 value:a4];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:7 event:v5];
}

- (void)logDatabaseModify:(id)a3 value:(id)a4
{
  id v5 = [(WFCloudKitSyncEventLogger *)self _eventForDatabaseDescriptor:a3 value:a4];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:6 event:v5];
}

- (void)logRecordDeleteFailed:(id)a3 error:(id)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"record";
  id v6 = a4;
  __int16 v7 = [(WFCloudKitSyncEventLogger *)self _eventForRecordID:a3];
  v9[1] = @"error";
  v10[0] = v7;
  v10[1] = v6;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(WFCloudKitSyncEventLogger *)self _logEventWithType:5 event:v8];
}

- (void)logRecordDeleted:(id)a3
{
  id v4 = [(WFCloudKitSyncEventLogger *)self _eventForRecordID:a3];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:3 event:v4];
}

- (void)logRecordPushFailed:(id)a3 error:(id)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"record";
  id v6 = a4;
  __int16 v7 = [(WFCloudKitSyncEventLogger *)self _eventForRecord:a3];
  v9[1] = @"error";
  v10[0] = v7;
  v10[1] = v6;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(WFCloudKitSyncEventLogger *)self _logEventWithType:4 event:v8];
}

- (void)logRecordPushed:(id)a3
{
  id v4 = [(WFCloudKitSyncEventLogger *)self _eventForRecord:a3];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:2 event:v4];
}

- (void)logDeletionFetched:(id)a3
{
  id v4 = [(WFCloudKitSyncEventLogger *)self _eventForRecordID:a3];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:1 event:v4];
}

- (void)logRecordFetched:(id)a3
{
  id v4 = [(WFCloudKitSyncEventLogger *)self _eventForRecord:a3];
  [(WFCloudKitSyncEventLogger *)self _logEventWithType:0 event:v4];
}

- (void)dealloc
{
  sqlite3_finalize(self->_log_event);
  sqlite3_close_v2(self->_db);
  v3.receiver = self;
  v3.super_class = (Class)WFCloudKitSyncEventLogger;
  [(WFCloudKitSyncEventLogger *)&v3 dealloc];
}

- (id)_initWithFilename:(const char *)a3 flags:(int)a4 postNotifications:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)WFCloudKitSyncEventLogger;
  BOOL v8 = [(WFCloudKitSyncEventLogger *)&v21 init];
  if (v8)
  {
    int v9 = sqlite3_open_v2(a3, &v8->_db, a4, 0);
    if (v9)
    {
      int v10 = v9;
      id v11 = getWFCloudKitSyncLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = sqlite3_errstr(v10);
        *(_DWORD *)buf = 136315394;
        uint64_t v23 = "-[WFCloudKitSyncEventLogger _initWithFilename:flags:postNotifications:]";
        __int16 v24 = 2080;
        id v25 = v12;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to set up sync logger: %s", buf, 0x16u);
      }
    }
    else
    {
      BOOL v13 = [(WFCloudKitSyncEventLogger *)v8 _applySchemaIfNecessary];
      db = v8->_db;
      if (v13)
      {
        int v15 = sqlite3_prepare_v2(db, "INSERT INTO events (type, timestamp, event) VALUES (?,?,?)", -1, &v8->_log_event, 0);
        if (!v15)
        {
          v8->_postNotifications = a5;
          [(WFCloudKitSyncEventLogger *)v8 clearOldLogs];
          int v19 = v8;
          goto LABEL_13;
        }
        int v16 = v15;
        int v17 = getWFCloudKitSyncLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          unint64_t v18 = sqlite3_errstr(v16);
          *(_DWORD *)buf = 136315394;
          uint64_t v23 = "-[WFCloudKitSyncEventLogger _initWithFilename:flags:postNotifications:]";
          __int16 v24 = 2080;
          id v25 = v18;
          _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to prepare log_event statement: %s", buf, 0x16u);
        }

        db = v8->_db;
      }
      sqlite3_close_v2(db);
    }
  }
  int v19 = 0;
LABEL_13:

  return v19;
}

+ (id)createInMemorySyncEventLogger
{
  int v2 = (void *)[objc_alloc((Class)a1) _initWithFilename:"" flags:65666 postNotifications:0];
  return v2;
}

+ (id)createPersistedSyncEventLogger
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_shortcutsDirectoryURL");
  id v4 = [v3 URLByAppendingPathComponent:@"synclog.db"];

  id v5 = objc_alloc((Class)a1);
  id v6 = v4;
  __int16 v7 = objc_msgSend(v5, "_initWithFilename:flags:postNotifications:", objc_msgSend(v6, "fileSystemRepresentation"), 65542, 1);

  return v7;
}

@end