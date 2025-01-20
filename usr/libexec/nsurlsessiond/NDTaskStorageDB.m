@interface NDTaskStorageDB
- (BOOL)_createDBSchemaForPath:(id)a3;
- (BOOL)_onqueue_initDB;
- (BOOL)handleSchemaVersionChange;
- (BOOL)migrateSchemaToLatestVersion:(int64_t)a3;
- (id)_getAllSessionIDsForBundle:(id)a3;
- (id)_getAllTasksFromDBForSession:(id)a3 sessionUUID:(id)a4;
- (id)_initDB:(id)a3;
- (id)_onqueue_convertSqlRowToTaskInfoEntry:(sqlite3_stmt *)a3;
- (id)_sqlBlobHelper:(sqlite3_stmt *)a3 forColumn:(int)a4;
- (void)_beginSqliteTransaction;
- (void)_cleanupDB;
- (void)_commitSqliteTransaction;
- (void)_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4;
- (void)_deleteAllTaskEntriesInDB;
- (void)_deleteTaskEntriesWithIdentifiers:(id)a3 forSession:(id)a4 sessionUUID:(id)a5;
- (void)_onqueue_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_deleteEntryForTask:(unint64_t)a3 forSession:(id)a4 sessionUUID:(id)a5;
- (void)_onqueue_garbageCollect;
- (void)_onqueue_insertOrUpdateAllEntriesForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateBytesPerSecondLimitForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateCurrentRequestForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateDownloadFileURLForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateExpectedProgressTargetForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateLoadingPriorityForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateResponseForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateResumableUploadDataForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateSetPriorityEntriesForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateShouldCancelOnDisconnectForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateSuspendPathEntriesForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateTLSSupportedProtocolVersionForTask:(id)a3 sessionUUID:(id)a4;
- (void)_onqueue_updateTaskDescriptionForTask:(id)a3 sessionUUID:(id)a4;
- (void)_updateDBEntriesForTasksInSession:(id)a3 taskInfos:(id)a4 updates:(id)a5;
- (void)_updateDBEntryForTask:(id)a3 updateType:(unint64_t)a4 sessionUUID:(id)a5;
@end

@implementation NDTaskStorageDB

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_dbDir, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_deleteTaskEntriesWithIdentifiers:(id)a3 forSession:(id)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "_deleteEntriesWithIdentifiers for session %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000167C8;
  v16[3] = &unk_1000B53F0;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync(workQueue, v16);
}

- (void)_updateDBEntriesForTasksInSession:(id)a3 taskInfos:(id)a4 updates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "_updateDBEntriesForTasks for session %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100016A70;
  v16[3] = &unk_1000B53F0;
  v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  id v13 = v8;
  id v14 = v9;
  id v15 = v10;
  dispatch_sync(workQueue, v16);
}

- (void)_commitSqliteTransaction
{
  errmsg = 0;
  if (sqlite3_exec(self->_dbConnection, "COMMIT TRANSACTION", 0, 0, &errmsg))
  {
    v2 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Error committing sqlite transaction: %s", buf, 0xCu);
    }
  }
}

- (void)_beginSqliteTransaction
{
  errmsg = 0;
  if (sqlite3_exec(self->_dbConnection, "BEGIN TRANSACTION", 0, 0, &errmsg))
  {
    v2 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Error beginning sqlite transaction: %s", buf, 0xCu);
    }
  }
}

- (id)_getAllSessionIDsForBundle:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016F38;
  block[3] = &unk_1000B60C0;
  id v13 = v4;
  id v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  dispatch_sync(workQueue, block);
  id v9 = v15;
  id v10 = v7;

  return v10;
}

- (void)_cleanupDB
{
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    id v8 = path;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_cleanupDB at path: %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001730C;
  block[3] = &unk_1000B6380;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_deleteAllTaskEntriesInDB
{
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    id v8 = path;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_deleteAllTaskEntriesInDB at path: %@", buf, 0xCu);
  }
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017578;
  block[3] = &unk_1000B6380;
  void block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017644;
  block[3] = &unk_1000B60C0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(workQueue, block);
}

- (id)_getAllTasksFromDBForSession:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableArray array];
  workQueue = self->_workQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100017768;
  v16[3] = &unk_1000B53F0;
  id v17 = v7;
  id v18 = self;
  id v19 = v6;
  id v10 = v8;
  id v20 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(workQueue, v16);
  id v13 = v20;
  id v14 = v10;

  return v14;
}

- (void)_updateDBEntryForTask:(id)a3 updateType:(unint64_t)a4 sessionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (id)qword_1000CB148;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134218498;
    id v15 = [v8 identifier];
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "_updateDBEntryForTask: %lu type %lu session: %@", (uint8_t *)&v14, 0x20u);
  }

  switch(a4)
  {
    case 0uLL:
      [(NDTaskStorageDB *)self _onqueue_updateTaskDescriptionForTask:v8 sessionUUID:v9];
      break;
    case 1uLL:
      [(NDTaskStorageDB *)self _onqueue_updateResponseForTask:v8 sessionUUID:v9];
      break;
    case 2uLL:
      [(NDTaskStorageDB *)self _onqueue_updateResumableUploadDataForTask:v8 sessionUUID:v9];
      break;
    case 3uLL:
      [(NDTaskStorageDB *)self _onqueue_updateDownloadFileURLForTask:v8 sessionUUID:v9];
      break;
    case 4uLL:
      [(NDTaskStorageDB *)self _onqueue_updateLoadingPriorityForTask:v8 sessionUUID:v9];
      break;
    case 5uLL:
      [(NDTaskStorageDB *)self _onqueue_updateBytesPerSecondLimitForTask:v8 sessionUUID:v9];
      break;
    case 6uLL:
      [(NDTaskStorageDB *)self _onqueue_updateExpectedProgressTargetForTask:v8 sessionUUID:v9];
      break;
    case 7uLL:
      [(NDTaskStorageDB *)self _onqueue_updateTLSSupportedProtocolVersionForTask:v8 sessionUUID:v9];
      break;
    case 8uLL:
      [(NDTaskStorageDB *)self _onqueue_updateCurrentRequestForTask:v8 sessionUUID:v9];
      break;
    case 9uLL:
      [(NDTaskStorageDB *)self _onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:v8 sessionUUID:v9];
      break;
    case 0xAuLL:
      [(NDTaskStorageDB *)self _onqueue_updateShouldCancelOnDisconnectForTask:v8 sessionUUID:v9];
      break;
    case 0xBuLL:
      [(NDTaskStorageDB *)self _onqueue_updateSuspendPathEntriesForTask:v8 sessionUUID:v9];
      break;
    case 0xCuLL:
      [(NDTaskStorageDB *)self _onqueue_updateSetPriorityEntriesForTask:v8 sessionUUID:v9];
      break;
    case 0xDuLL:
      id v12 = [v8 identifier];
      id v13 = [v8 sessionID];
      [(NDTaskStorageDB *)self _onqueue_deleteEntryForTask:v12 forSession:v13 sessionUUID:v9];

      break;
    case 0xEuLL:
      [(NDTaskStorageDB *)self _onqueue_insertOrUpdateAllEntriesForTask:v8 sessionUUID:v9];
      break;
    default:
      id v11 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        int v14 = 134217984;
        id v15 = (id)a4;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid update type %lu", (uint8_t *)&v14, 0xCu);
      }
      break;
  }
}

- (id)_initDB:(id)a3
{
  id v5 = a3;
  id v6 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "_initDB at dir: %@", (uint8_t *)&buf, 0xCu);
  }
  v21.receiver = self;
  v21.super_class = (Class)NDTaskStorageDB;
  id v7 = [(NDTaskStorageDB *)&v21 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_dbDir, a3);
    v8->_dbConnection = 0;
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nsurlsessiond.session-archive-queue", v10);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v11;

    *(_WORD *)&v8->_dbInitialized = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    id v13 = v8->_workQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100017FD0;
    v18[3] = &unk_1000B5B10;
    p_long long buf = &buf;
    int v14 = v8;
    id v19 = v14;
    dispatch_sync(v13, v18);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      id v15 = v14;

      _Block_object_dispose(&buf, 8);
      goto LABEL_10;
    }

    _Block_object_dispose(&buf, 8);
  }
  __int16 v16 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "_initDB failed", (uint8_t *)&buf, 2u);
  }
  id v15 = 0;
LABEL_10:

  return v15;
}

- (void)_onqueue_updateSetPriorityEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134218242;
    id v26 = [v6 identifier];
    __int16 v27 = 2112;
    v28 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateSetPriorityEntriesForTask: %lu for session: %@", (uint8_t *)&v25, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateSetPriorityEntriesForTaskStmt = &self->_updateSetPriorityEntriesForTaskStmt;
    updateSetPriorityEntriesForTaskStmt = self->_updateSetPriorityEntriesForTaskStmt;
    if (!updateSetPriorityEntriesForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET discretionary = ?, base_priority = ?, base_priority_set_explicitly = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateSetPriorityEntriesForTaskStmt, 0))
      {
        int v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateSetPriorityEntriesForTaskStmt for session_tasks", (uint8_t *)&v25, 2u);
        }
        goto LABEL_37;
      }
      updateSetPriorityEntriesForTaskStmt = *p_updateSetPriorityEntriesForTaskStmt;
    }
    if (sqlite3_bind_int(updateSetPriorityEntriesForTaskStmt, 1, (int)[v6 isDiscretionary]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v17 = [v6 isDiscretionary];
        int v25 = 134217984;
        id v26 = (id)v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind discretionary (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
LABEL_31:

      goto LABEL_37;
    }
    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 2, (int)[v6 basePriority]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 basePriority];
        int v25 = 134217984;
        id v26 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind basePriority (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 3, (int)[v6 basePrioritySetExplicitly]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v20 = [v6 basePrioritySetExplicitly];
        int v25 = 134217984;
        id v26 = (id)v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind basePrioritySetExplicitly (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    id v15 = *p_updateSetPriorityEntriesForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 4, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_super v21 = [v6 sessionID];
        int v25 = 138412290;
        id v26 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    if (sqlite3_bind_int(*p_updateSetPriorityEntriesForTaskStmt, 5, (int)[v6 identifier]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v6 identifier];
        int v25 = 134217984;
        id v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_31;
    }
    if (sqlite3_step(*p_updateSetPriorityEntriesForTaskStmt) != 101)
    {
      id v19 = (id)qword_1000CB148;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v6 identifier];
        char v24 = sqlite3_errmsg(self->_dbConnection);
        int v25 = 134218242;
        id v26 = v23;
        __int16 v27 = 2080;
        v28 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update setPriority related entries for task %lu into db. Error= %s", (uint8_t *)&v25, 0x16u);
      }
    }
    sqlite3_reset(*p_updateSetPriorityEntriesForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v25, 2u);
    }
  }
LABEL_37:
}

- (void)_onqueue_updateSuspendPathEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218242;
    id v25 = [v6 identifier];
    __int16 v26 = 2112;
    __int16 v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateSuspendPathEntriesForTask: %lu for session %@", (uint8_t *)&v24, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateSuspendPathEntriesForTaskStmt = &self->_updateSuspendPathEntriesForTaskStmt;
    updateSuspendPathEntriesForTaskStmt = self->_updateSuspendPathEntriesForTaskStmt;
    if (!updateSuspendPathEntriesForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET state = ?, suspend_count = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateSuspendPathEntriesForTaskStmt, 0))
      {
        int v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateSuspendPathEntriesForTaskStmt for session_tasks", (uint8_t *)&v24, 2u);
        }
        goto LABEL_33;
      }
      updateSuspendPathEntriesForTaskStmt = *p_updateSuspendPathEntriesForTaskStmt;
    }
    if (sqlite3_bind_int64(updateSuspendPathEntriesForTaskStmt, 1, (sqlite3_int64)[v6 state]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v17 = [v6 state];
        int v24 = 134217984;
        id v25 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind state (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
LABEL_27:

      goto LABEL_33;
    }
    if (sqlite3_bind_int64(*p_updateSuspendPathEntriesForTaskStmt, 2, (sqlite3_int64)[v6 suspendCount]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v6 suspendCount];
        int v24 = 134217984;
        id v25 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind suspendCount (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    id v15 = *p_updateSuspendPathEntriesForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 3, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v20 = [v6 sessionID];
        int v24 = 138412290;
        id v25 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    if (sqlite3_bind_int(*p_updateSuspendPathEntriesForTaskStmt, 4, (int)[v6 identifier]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        int v24 = 134217984;
        id v25 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    if (sqlite3_step(*p_updateSuspendPathEntriesForTaskStmt) != 101)
    {
      id v18 = (id)qword_1000CB148;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v6 identifier];
        id v23 = sqlite3_errmsg(self->_dbConnection);
        int v24 = 134218242;
        id v25 = v22;
        __int16 v26 = 2080;
        __int16 v27 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to update suspend related entries for task %lu into db. Error= %s", (uint8_t *)&v24, 0x16u);
      }
    }
    sqlite3_reset(*p_updateSuspendPathEntriesForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v24, 2u);
    }
  }
LABEL_33:
}

- (void)_onqueue_updateDownloadFileURLForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134218242;
    id v27 = [v6 identifier];
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateDownloadFileURLForTask: %lu for session: %@", (uint8_t *)&v26, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateDownloadFileURLForTaskStmt = &self->_updateDownloadFileURLForTaskStmt;
    if (!self->_updateDownloadFileURLForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET download_file_url = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateDownloadFileURLForTaskStmt, 0))
    {
      id v18 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to init _updateDownloadFileURLForTaskStmt for session_tasks", (uint8_t *)&v26, 2u);
      }
      goto LABEL_22;
    }
    dispatch_queue_t v11 = [v6 downloadFileURL];
    id v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

    id v13 = *p_updateDownloadFileURLForTaskStmt;
    id v14 = v12;
    if (sqlite3_bind_blob(v13, 1, [v14 bytes], (int)objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      id v15 = (id)qword_1000CB148;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = [v6 downloadFileURL];
        int v26 = 138412290;
        id v27 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind downloadFileURL (%@) to the select statement", (uint8_t *)&v26, 0xCu);
      }
    }
    else
    {
      id v19 = *p_updateDownloadFileURLForTaskStmt;
      id v20 = [v6 sessionID];
      LOBYTE(v19) = sqlite3_bind_text(v19, 2, (const char *)[v20 UTF8String], -1, 0) == 0;

      if (v19)
      {
        if (!sqlite3_bind_int(*p_updateDownloadFileURLForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateDownloadFileURLForTaskStmt) != 101)
          {
            id v22 = (id)qword_1000CB148;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v6 identifier];
              id v25 = sqlite3_errmsg(self->_dbConnection);
              int v26 = 134218242;
              id v27 = v24;
              __int16 v28 = 2080;
              v29 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to update downloadFileURL for task %lu into db. Error= %s", (uint8_t *)&v26, 0x16u);
            }
          }
          sqlite3_reset(*p_updateDownloadFileURLForTaskStmt);
          goto LABEL_21;
        }
        id v15 = (id)qword_1000CB148;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v6 identifier];
          int v26 = 134217984;
          id v27 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        id v15 = (id)qword_1000CB148;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v21 = [v6 sessionID];
          int v26 = 138412290;
          id v27 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
    }

LABEL_21:
    goto LABEL_22;
  }
  id v17 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v26, 2u);
  }
LABEL_22:
}

- (void)_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    int v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateRespondedToWillBeginDelayedRequestCallbackForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = &self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    if (!updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET responded_to_will_begin_delayed_request_callback = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt, 0))
      {
        id v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt = *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    }
    if (sqlite3_bind_int(updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt, 1, (int)[v6 respondedToWillBeginDelayedRequestCallback]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v18 = [v6 respondedToWillBeginDelayedRequestCallback];
        int v23 = 134217984;
        id v24 = (id)v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    id v15 = *p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v6 sessionID];
        int v23 = 138412290;
        id v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt, 3, (int)[v6 identifier]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 identifier];
        int v23 = 134217984;
        id v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt) != 101)
    {
      id v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        id v22 = sqlite3_errmsg(self->_dbConnection);
        int v23 = 134218242;
        id v24 = v21;
        __int16 v25 = 2080;
        int v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update respondedToWillBeginDelayedRequestCallback for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }
    }
    sqlite3_reset(*p_updateRespondedToWillBeginDelayedRequestCallbackForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:
}

- (void)_onqueue_deleteAllTaskEntriesForSession:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_deleteAllTaskEntriesForSession session: %@", buf, 0xCu);
  }
  dbConnection = self->_dbConnection;
  if (!dbConnection || !self->_dbInitialized)
  {
    id v14 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
    }
    goto LABEL_23;
  }
  p_deleteEntriesForSessionStmt = &self->_deleteEntriesForSessionStmt;
  deleteEntriesForSessionStmt = self->_deleteEntriesForSessionStmt;
  if (!deleteEntriesForSessionStmt)
  {
    if (sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks WHERE session_id = ?", -1, &self->_deleteEntriesForSessionStmt, 0))
    {
      uint64_t v15 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        id v13 = "Failed to init _deleteEntriesForSessionStmt for session_tasks";
        id v16 = v15;
        uint32_t v17 = 2;
LABEL_22:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v13, buf, v17);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    deleteEntriesForSessionStmt = *p_deleteEntriesForSessionStmt;
  }
  if (sqlite3_bind_text(deleteEntriesForSessionStmt, 1, (const char *)[v6 UTF8String], -1, 0))
  {
    uint64_t v12 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v7;
      id v13 = "Failed to bind sessionID (%@) to the select statement";
LABEL_21:
      id v16 = v12;
      uint32_t v17 = 12;
      goto LABEL_22;
    }
  }
  else
  {
    if (sqlite3_step(*p_deleteEntriesForSessionStmt) != 101)
    {
      unsigned int v18 = (id)qword_1000CB148;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = sqlite3_errmsg(self->_dbConnection);
        *(_DWORD *)long long buf = 136315138;
        id v22 = (char *)v19;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to delete tasks from db. Error= %s", buf, 0xCu);
      }
    }
    sqlite3_reset(*p_deleteEntriesForSessionStmt);
    errmsg = 0;
    if (sqlite3_exec(self->_dbConnection, "PRAGMA incremental_vacuum(10);", 0, 0, &errmsg))
    {
      uint64_t v12 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v22 = errmsg;
        id v13 = "Failed to auto vacuum when garbage collecting: %s";
        goto LABEL_21;
      }
    }
  }
LABEL_23:
}

- (void)_onqueue_deleteEntryForTask:(unint64_t)a3 forSession:(id)a4 sessionUUID:(id)a5
{
  id v8 = a4;
  id v9 = (char *)a5;
  id v10 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    unint64_t v24 = a3;
    __int16 v25 = 2112;
    int v26 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "_onqueue_deleteEntryForTaskWithIdentifier: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }
  dbConnection = self->_dbConnection;
  if (!dbConnection || !self->_dbInitialized)
  {
    uint32_t v17 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
    goto LABEL_25;
  }
  p_deleteEntryForTaskStmt = &self->_deleteEntryForTaskStmt;
  deleteEntryForTaskStmt = self->_deleteEntryForTaskStmt;
  if (!deleteEntryForTaskStmt)
  {
    if (sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks WHERE session_id = ? AND identifier = ?", -1, &self->_deleteEntryForTaskStmt, 0))
    {
      uint64_t v18 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v23) = 0;
        uint64_t v15 = "Failed to init _deleteEntryForTaskStmt for session_tasks";
        id v16 = v18;
        uint32_t v19 = 2;
LABEL_18:
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v19);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    deleteEntryForTaskStmt = *p_deleteEntryForTaskStmt;
  }
  if (sqlite3_bind_text(deleteEntryForTaskStmt, 1, (const char *)[v8 UTF8String], -1, 0))
  {
    uint64_t v14 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      unint64_t v24 = (unint64_t)v9;
      uint64_t v15 = "Failed to bind sessionID (%@) to the select statement";
      id v16 = v14;
LABEL_17:
      uint32_t v19 = 12;
      goto LABEL_18;
    }
  }
  else if (sqlite3_bind_int(*p_deleteEntryForTaskStmt, 2, a3))
  {
    uint64_t v20 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
    {
      int v23 = 134217984;
      unint64_t v24 = a3;
      uint64_t v15 = "Failed to bind identifier (%lu) to the delete statement";
      id v16 = v20;
      goto LABEL_17;
    }
  }
  else
  {
    if (sqlite3_step(*p_deleteEntryForTaskStmt) != 101)
    {
      id v21 = (id)qword_1000CB148;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = sqlite3_errmsg(self->_dbConnection);
        int v23 = 134218242;
        unint64_t v24 = a3;
        __int16 v25 = 2080;
        int v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to delete task with identifier %lu from db. Error= %s", (uint8_t *)&v23, 0x16u);
      }
    }
    sqlite3_reset(*p_deleteEntryForTaskStmt);
  }
LABEL_25:
}

- (void)_onqueue_updateExpectedProgressTargetForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    int v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateExpectedProgressTargetForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateExpectedProgressTargetForTaskStmt = &self->_updateExpectedProgressTargetForTaskStmt;
    updateExpectedProgressTargetForTaskStmt = self->_updateExpectedProgressTargetForTaskStmt;
    if (!updateExpectedProgressTargetForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET expected_progress_target = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateExpectedProgressTargetForTaskStmt, 0))
      {
        uint64_t v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateExpectedProgressTargetForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateExpectedProgressTargetForTaskStmt = *p_updateExpectedProgressTargetForTaskStmt;
    }
    if (sqlite3_bind_int64(updateExpectedProgressTargetForTaskStmt, 1, (int)[v6 expectedProgressTarget]))
    {
      uint64_t v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 expectedProgressTarget];
        int v23 = 134217984;
        id v24 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind expectedProgressTarget (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    uint64_t v15 = *p_updateExpectedProgressTargetForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      uint64_t v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint32_t v19 = [v6 sessionID];
        int v23 = 138412290;
        id v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateExpectedProgressTargetForTaskStmt, 3, (int)[v6 identifier]))
    {
      uint64_t v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 identifier];
        int v23 = 134217984;
        id v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateExpectedProgressTargetForTaskStmt) != 101)
    {
      uint32_t v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        id v22 = sqlite3_errmsg(self->_dbConnection);
        int v23 = 134218242;
        id v24 = v21;
        __int16 v25 = 2080;
        int v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update expectedProgressTarget for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }
    }
    sqlite3_reset(*p_updateExpectedProgressTargetForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:
}

- (void)_onqueue_updateLoadingPriorityForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218242;
    id v25 = [v6 identifier];
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateLoadingPriorityForTask: %lu for session: %@", (uint8_t *)&v24, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateLoadingPriorityForTaskStmt = &self->_updateLoadingPriorityForTaskStmt;
    updateLoadingPriorityForTaskStmt = self->_updateLoadingPriorityForTaskStmt;
    if (!updateLoadingPriorityForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET loading_priority = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateLoadingPriorityForTaskStmt, 0))
      {
        uint64_t v15 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to init _updateLoadingPriorityForTaskStmt for session_tasks", (uint8_t *)&v24, 2u);
        }
        goto LABEL_29;
      }
      updateLoadingPriorityForTaskStmt = *p_updateLoadingPriorityForTaskStmt;
    }
    [v6 loadingPriority];
    if (sqlite3_bind_double(updateLoadingPriorityForTaskStmt, 1, v12))
    {
      id v13 = (id)qword_1000CB148;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [v6 loadingPriority];
        int v24 = 134217984;
        id v25 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to bind loadingPriority (%f) to the select statement", (uint8_t *)&v24, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    id v16 = *p_updateLoadingPriorityForTaskStmt;
    id v17 = [v6 sessionID];
    LOBYTE(v16) = sqlite3_bind_text(v16, 2, (const char *)[v17 UTF8String], -1, 0) == 0;

    if ((v16 & 1) == 0)
    {
      id v13 = (id)qword_1000CB148;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 sessionID];
        int v24 = 138412290;
        id v25 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateLoadingPriorityForTaskStmt, 3, (int)[v6 identifier]))
    {
      id v13 = (id)qword_1000CB148;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        int v24 = 134217984;
        id v25 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateLoadingPriorityForTaskStmt) != 101)
    {
      id v18 = (id)qword_1000CB148;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v6 identifier];
        int v23 = sqlite3_errmsg(self->_dbConnection);
        int v24 = 134218242;
        id v25 = v22;
        __int16 v26 = 2080;
        id v27 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to update loadingPriority for task %lu into db. Error= %s", (uint8_t *)&v24, 0x16u);
      }
    }
    sqlite3_reset(*p_updateLoadingPriorityForTaskStmt);
  }
  else
  {
    uint64_t v14 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v24, 2u);
    }
  }
LABEL_29:
}

- (void)_onqueue_updateBytesPerSecondLimitForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    __int16 v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateBytesPerSecondLimitForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateBytesPerSecondLimitForTaskStmt = &self->_updateBytesPerSecondLimitForTaskStmt;
    updateBytesPerSecondLimitForTaskStmt = self->_updateBytesPerSecondLimitForTaskStmt;
    if (!updateBytesPerSecondLimitForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET bytes_per_second_limit = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateBytesPerSecondLimitForTaskStmt, 0))
      {
        uint64_t v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateBytesPerSecondLimitForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateBytesPerSecondLimitForTaskStmt = *p_updateBytesPerSecondLimitForTaskStmt;
    }
    if (sqlite3_bind_int64(updateBytesPerSecondLimitForTaskStmt, 1, (sqlite3_int64)[v6 bytesPerSecondLimit]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = [v6 bytesPerSecondLimit];
        int v23 = 134217984;
        id v24 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind bytesPerSecondLimit (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    uint64_t v15 = *p_updateBytesPerSecondLimitForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint32_t v19 = [v6 sessionID];
        int v23 = 138412290;
        id v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateBytesPerSecondLimitForTaskStmt, 3, (int)[v6 identifier]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 identifier];
        int v23 = 134217984;
        id v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateBytesPerSecondLimitForTaskStmt) != 101)
    {
      id v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        id v22 = sqlite3_errmsg(self->_dbConnection);
        int v23 = 134218242;
        id v24 = v21;
        __int16 v25 = 2080;
        __int16 v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update bytesPerSecondLimit for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }
    }
    sqlite3_reset(*p_updateBytesPerSecondLimitForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:
}

- (void)_onqueue_updateTLSSupportedProtocolVersionForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 134218242;
    id v25 = [v6 identifier];
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateTLSSupportedProtocolVersionForTask: %lu, for session: %@", (uint8_t *)&v24, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateTLSSupportedProtocolVersionForTaskStmt = &self->_updateTLSSupportedProtocolVersionForTaskStmt;
    updateTLSSupportedProtocolVersionForTaskStmt = self->_updateTLSSupportedProtocolVersionForTaskStmt;
    if (!updateTLSSupportedProtocolVersionForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET tls_minimum_supported_protocol_version = ?, tls_maximum_supported_protocol_version = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateTLSSupportedProtocolVersionForTaskStmt, 0))
      {
        uint64_t v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v24) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateTLSSupportedProtocolVersionForTaskStmt for session_tasks", (uint8_t *)&v24, 2u);
        }
        goto LABEL_33;
      }
      updateTLSSupportedProtocolVersionForTaskStmt = *p_updateTLSSupportedProtocolVersionForTaskStmt;
    }
    if (sqlite3_bind_int(updateTLSSupportedProtocolVersionForTaskStmt, 1, (int)[v6 _TLSMinimumSupportedProtocolVersion]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v17 = [v6 _TLSMinimumSupportedProtocolVersion];
        int v24 = 134217984;
        id v25 = (id)v17;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMinimumSupportedProtocolVersion (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
LABEL_27:

      goto LABEL_33;
    }
    if (sqlite3_bind_int(*p_updateTLSSupportedProtocolVersionForTaskStmt, 2, (int)[v6 _TLSMaximumSupportedProtocolVersion]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = [v6 _TLSMaximumSupportedProtocolVersion];
        int v24 = 134217984;
        id v25 = (id)v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMaximumSupportedProtocolVersion (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    uint64_t v15 = *p_updateTLSSupportedProtocolVersionForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 3, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 sessionID];
        int v24 = 138412290;
        id v25 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    if (sqlite3_bind_int(*p_updateTLSSupportedProtocolVersionForTaskStmt, 4, (int)[v6 identifier]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        int v24 = 134217984;
        id v25 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_27;
    }
    if (sqlite3_step(*p_updateTLSSupportedProtocolVersionForTaskStmt) != 101)
    {
      id v18 = (id)qword_1000CB148;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v6 identifier];
        int v23 = sqlite3_errmsg(self->_dbConnection);
        int v24 = 134218242;
        id v25 = v22;
        __int16 v26 = 2080;
        id v27 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to update TLSSupportedProtocolVersions for task %lu into db. Error= %s", (uint8_t *)&v24, 0x16u);
      }
    }
    sqlite3_reset(*p_updateTLSSupportedProtocolVersionForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v24, 2u);
    }
  }
LABEL_33:
}

- (void)_onqueue_updateCurrentRequestForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134218242;
    id v27 = [v6 identifier];
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateCurrentRequestForTask: %lu for session: %@", (uint8_t *)&v26, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateCurrentRequestForTaskStmt = &self->_updateCurrentRequestForTaskStmt;
    if (!self->_updateCurrentRequestForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET current_request = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateCurrentRequestForTaskStmt, 0))
    {
      unsigned int v17 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to init _updateCurrentRequestForTaskStmt for session_tasks", (uint8_t *)&v26, 2u);
      }
      goto LABEL_28;
    }
    dispatch_queue_t v11 = [v6 currentRequest];
    double v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

    id v13 = *p_updateCurrentRequestForTaskStmt;
    id v14 = v12;
    if (sqlite3_bind_blob(v13, 1, [v14 bytes], (int)objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v15 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind currentRequestData to the select statement", (uint8_t *)&v26, 2u);
      }
    }
    else
    {
      id v18 = *p_updateCurrentRequestForTaskStmt;
      id v19 = [v6 sessionID];
      LOBYTE(v18) = sqlite3_bind_text(v18, 2, (const char *)[v19 UTF8String], -1, 0) == 0;

      if (v18)
      {
        if (!sqlite3_bind_int(*p_updateCurrentRequestForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateCurrentRequestForTaskStmt) != 101)
          {
            id v21 = (id)qword_1000CB148;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v6 identifier];
              id v25 = sqlite3_errmsg(self->_dbConnection);
              int v26 = 134218242;
              id v27 = v24;
              __int16 v28 = 2080;
              v29 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to update currentRequest for task %lu into db. Error= %s", (uint8_t *)&v26, 0x16u);
            }
          }
          sqlite3_reset(*p_updateCurrentRequestForTaskStmt);
          goto LABEL_27;
        }
        id v20 = (id)qword_1000CB148;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v6 identifier];
          int v26 = 134217984;
          id v27 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        id v20 = (id)qword_1000CB148;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v6 sessionID];
          int v26 = 138412290;
          id v27 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  id v16 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v26, 2u);
  }
LABEL_28:
}

- (void)_onqueue_updateShouldCancelOnDisconnectForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v23 = 134218242;
    id v24 = [v6 identifier];
    __int16 v25 = 2112;
    int v26 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateShouldCancelOnDisconnectForTask: %lu for session: %@", (uint8_t *)&v23, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateShouldCancelOnDisconnectForTaskStmt = &self->_updateShouldCancelOnDisconnectForTaskStmt;
    updateShouldCancelOnDisconnectForTaskStmt = self->_updateShouldCancelOnDisconnectForTaskStmt;
    if (!updateShouldCancelOnDisconnectForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET should_cancel_on_disconnect = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateShouldCancelOnDisconnectForTaskStmt, 0))
      {
        id v14 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to init _updateShouldCancelOnDisconnectForTaskStmt for session_tasks", (uint8_t *)&v23, 2u);
        }
        goto LABEL_29;
      }
      updateShouldCancelOnDisconnectForTaskStmt = *p_updateShouldCancelOnDisconnectForTaskStmt;
    }
    if (sqlite3_bind_int(updateShouldCancelOnDisconnectForTaskStmt, 1, (int)[v6 shouldCancelOnDisconnect]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unsigned int v18 = [v6 shouldCancelOnDisconnect];
        int v23 = 134217984;
        id v24 = (id)v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind shouldCancelOnDisconnect (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    uint64_t v15 = *p_updateShouldCancelOnDisconnectForTaskStmt;
    id v16 = [v6 sessionID];
    LOBYTE(v15) = sqlite3_bind_text(v15, 2, (const char *)[v16 UTF8String], -1, 0) == 0;

    if ((v15 & 1) == 0)
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v6 sessionID];
        int v23 = 138412290;
        id v24 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateShouldCancelOnDisconnectForTaskStmt, 3, (int)[v6 identifier]))
    {
      double v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 identifier];
        int v23 = 134217984;
        id v24 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v23, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateShouldCancelOnDisconnectForTaskStmt) != 101)
    {
      unsigned int v17 = (id)qword_1000CB148;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 identifier];
        id v22 = sqlite3_errmsg(self->_dbConnection);
        int v23 = 134218242;
        id v24 = v21;
        __int16 v25 = 2080;
        int v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update shouldCancelOnDisconnect for task %lu into db. Error= %s", (uint8_t *)&v23, 0x16u);
      }
    }
    sqlite3_reset(*p_updateShouldCancelOnDisconnectForTaskStmt);
  }
  else
  {
    id v13 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v23, 2u);
    }
  }
LABEL_29:
}

- (void)_onqueue_updateTaskDescriptionForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134218242;
    id v26 = [v6 identifier];
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateTaskDescriptionForTask: %lu for session: %@", (uint8_t *)&v25, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateTaskDescriptionForTaskStmt = &self->_updateTaskDescriptionForTaskStmt;
    updateTaskDescriptionForTaskStmt = self->_updateTaskDescriptionForTaskStmt;
    if (!updateTaskDescriptionForTaskStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET task_description = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateTaskDescriptionForTaskStmt, 0))
      {
        id v16 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to init _updateTaskDescriptionForTaskStmt for session_tasks", (uint8_t *)&v25, 2u);
        }
        goto LABEL_29;
      }
      updateTaskDescriptionForTaskStmt = *p_updateTaskDescriptionForTaskStmt;
    }
    id v12 = [v6 taskDescription];
    BOOL v13 = sqlite3_bind_text(updateTaskDescriptionForTaskStmt, 1, (const char *)[v12 UTF8String], -1, 0) == 0;

    if (!v13)
    {
      id v14 = (id)qword_1000CB148;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v20 = [v6 taskDescription];
        int v25 = 138412290;
        id v26 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind taskDescription (%@) to the select statement", (uint8_t *)&v25, 0xCu);
      }
LABEL_23:

      goto LABEL_29;
    }
    unsigned int v17 = *p_updateTaskDescriptionForTaskStmt;
    id v18 = [v6 sessionID];
    LOBYTE(v17) = sqlite3_bind_text(v17, 2, (const char *)[v18 UTF8String], -1, 0) == 0;

    if ((v17 & 1) == 0)
    {
      id v14 = (id)qword_1000CB148;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v6 sessionID];
        int v25 = 138412290;
        id v26 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_bind_int(*p_updateTaskDescriptionForTaskStmt, 3, (int)[v6 identifier]))
    {
      id v14 = (id)qword_1000CB148;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v6 identifier];
        int v25 = 134217984;
        id v26 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_23;
    }
    if (sqlite3_step(*p_updateTaskDescriptionForTaskStmt) != 101)
    {
      id v19 = (id)qword_1000CB148;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v6 identifier];
        id v24 = sqlite3_errmsg(self->_dbConnection);
        int v25 = 134218242;
        id v26 = v23;
        __int16 v27 = 2080;
        __int16 v28 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to update task description for task %lu into db. Error= %s", (uint8_t *)&v25, 0x16u);
      }
    }
    sqlite3_reset(*p_updateTaskDescriptionForTaskStmt);
  }
  else
  {
    uint64_t v15 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v25, 2u);
    }
  }
LABEL_29:
}

- (void)_onqueue_updateResumableUploadDataForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 134218242;
    id v26 = [v6 identifier];
    __int16 v27 = 2112;
    __int16 v28 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateResumableUploadDataForTask: %lu for session: %@", (uint8_t *)&v25, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateResumableUploadDataForTaskStmt = &self->_updateResumableUploadDataForTaskStmt;
    if (!self->_updateResumableUploadDataForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET resumable_upload_data = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateResumableUploadDataForTaskStmt, 0))
    {
      id v16 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to init _updateResumableUploadDataForTaskStmt for session_tasks", (uint8_t *)&v25, 2u);
      }
      goto LABEL_28;
    }
    dispatch_queue_t v11 = [v6 resumableUploadData];
    id v12 = *p_updateResumableUploadDataForTaskStmt;
    id v13 = v11;
    if (sqlite3_bind_blob(v12, 1, [v13 bytes], (int)objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      id v14 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to bind resumableUploadData to the select statement", (uint8_t *)&v25, 2u);
      }
    }
    else
    {
      unsigned int v17 = *p_updateResumableUploadDataForTaskStmt;
      id v18 = [v6 sessionID];
      LOBYTE(v17) = sqlite3_bind_text(v17, 2, (const char *)[v18 UTF8String], -1, 0) == 0;

      if (v17)
      {
        if (!sqlite3_bind_int(*p_updateResumableUploadDataForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateResumableUploadDataForTaskStmt) != 101)
          {
            id v20 = (id)qword_1000CB148;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v23 = [v6 identifier];
              id v24 = sqlite3_errmsg(self->_dbConnection);
              int v25 = 134218242;
              id v26 = v23;
              __int16 v27 = 2080;
              __int16 v28 = v24;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to update resumableUploadData for task %lu into db. Error= %s", (uint8_t *)&v25, 0x16u);
            }
          }
          sqlite3_reset(*p_updateResumableUploadDataForTaskStmt);
          goto LABEL_27;
        }
        id v19 = (id)qword_1000CB148;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v6 identifier];
          int v25 = 134217984;
          id v26 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v25, 0xCu);
        }
      }
      else
      {
        id v19 = (id)qword_1000CB148;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          id v21 = [v6 sessionID];
          int v25 = 138412290;
          id v26 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v25, 0xCu);
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v15 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v25, 2u);
  }
LABEL_28:
}

- (void)_onqueue_updateResponseForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 134218242;
    id v27 = [v6 identifier];
    __int16 v28 = 2112;
    v29 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_updateResponseForTask: %lu for session: %@", (uint8_t *)&v26, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_updateResponseForTaskStmt = &self->_updateResponseForTaskStmt;
    if (!self->_updateResponseForTaskStmt
      && sqlite3_prepare_v2(dbConnection, "UPDATE session_tasks SET response = ? WHERE session_id = ? AND identifier = ?", -1, &self->_updateResponseForTaskStmt, 0))
    {
      unsigned int v17 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to init _updateResponseForTaskStmt for session_tasks", (uint8_t *)&v26, 2u);
      }
      goto LABEL_28;
    }
    dispatch_queue_t v11 = [v6 response];
    id v12 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];

    id v13 = *p_updateResponseForTaskStmt;
    id v14 = v12;
    if (sqlite3_bind_blob(v13, 1, [v14 bytes], (int)objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v15 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v26) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to bind responseData to the select statement", (uint8_t *)&v26, 2u);
      }
    }
    else
    {
      id v18 = *p_updateResponseForTaskStmt;
      id v19 = [v6 sessionID];
      LOBYTE(v18) = sqlite3_bind_text(v18, 2, (const char *)[v19 UTF8String], -1, 0) == 0;

      if (v18)
      {
        if (!sqlite3_bind_int(*p_updateResponseForTaskStmt, 3, (int)[v6 identifier]))
        {
          if (sqlite3_step(*p_updateResponseForTaskStmt) != 101)
          {
            id v21 = (id)qword_1000CB148;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              id v24 = [v6 identifier];
              int v25 = sqlite3_errmsg(self->_dbConnection);
              int v26 = 134218242;
              id v27 = v24;
              __int16 v28 = 2080;
              v29 = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to update response for task %lu into db. Error= %s", (uint8_t *)&v26, 0x16u);
            }
          }
          sqlite3_reset(*p_updateResponseForTaskStmt);
          goto LABEL_27;
        }
        id v20 = (id)qword_1000CB148;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v23 = [v6 identifier];
          int v26 = 134217984;
          id v27 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
      else
      {
        id v20 = (id)qword_1000CB148;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v22 = [v6 sessionID];
          int v26 = 138412290;
          id v27 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", (uint8_t *)&v26, 0xCu);
        }
      }
    }
LABEL_27:

    goto LABEL_28;
  }
  id v16 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", (uint8_t *)&v26, 2u);
  }
LABEL_28:
}

- (void)_onqueue_insertOrUpdateAllEntriesForTask:(id)a3 sessionUUID:(id)a4
{
  id v6 = a3;
  id v7 = (char *)a4;
  id v8 = (id)qword_1000CB148;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218242;
    v236 = (const char *)[v6 identifier];
    __int16 v237 = 2112;
    v238 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "_onqueue_insertOrUpdateAllEntriesForTask: %lu for session: %@", buf, 0x16u);
  }

  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    p_insertOrUpdateAllEntriesStmt = &self->_insertOrUpdateAllEntriesStmt;
    insertOrUpdateAllEntriesStmt = self->_insertOrUpdateAllEntriesStmt;
    if (!insertOrUpdateAllEntriesStmt)
    {
      if (sqlite3_prepare_v2(dbConnection, "INSERT OR REPLACE INTO session_tasks(\tidentifier, task_kind, creation_time, state, suspend_count, task_description, original_request, current_request, response, earliest_begin_date,\tresponded_to_will_begin_delayed_request_callback, error, retry_error, file_url, download_file_url, bundle_id, session_id, has_started, should_cancel_on_disconnect,\tbase_priority, base_priority_set_explicitly, discretionary, discretionary_override, unique_identifier, storage_partition_identifier, count_of_bytes_client_expects_to_send,\tcount_of_bytes_client_expects_to_receive, count_of_bytes_received, count_of_bytes_sent, count_of_bytes_expected_to_send, count_of_bytes_expected_to_receive,\tbytes_per_second_limit, persona_unique_string, expected_progress_target, may_be_demoted_to_discretionary, tls_minimum_supported_protocol_version,\ttls_maximum_supported_protocol_version, has_sz_extractor, does_sz_extractor_consume_extracted_data, updated_streaming_zip_modification_date, started_user_initiated,\tadditional_properties, path_to_download_task_file, retry_count, loading_priority, qos, background_trailers, task_metrics,\tav_url, av_destination_url, av_options, av_initialized_with_av_asset, av_temporary_destination_url, av_asset_title, av_asset_artwork_data, av_asset_url, av_asset_download_token,\tav_asset_download_child_download_session_identifier, av_enable_spi_delegate_callbacks, av_download_config, av_asset_options_plist, resumable_upload_data, rowid) \tvalues (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,\t\t\t(SELECT max(rowid) FROM session_tasks)+1)", -1, &self->_insertOrUpdateAllEntriesStmt,
             0))
      {
        id v12 = (id)qword_1000CB148;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          unsigned int v17 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)long long buf = 136315138;
          v236 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed init the insert statement for session_tasks db. Error = %s", buf, 0xCu);
        }
        goto LABEL_36;
      }
      insertOrUpdateAllEntriesStmt = *p_insertOrUpdateAllEntriesStmt;
    }
    if (sqlite3_bind_int(insertOrUpdateAllEntriesStmt, 1, (int)[v6 identifier]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v16 = (const char *)[v6 identifier];
        *(_DWORD *)long long buf = 134217984;
        v236 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_205;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 2, (sqlite3_int64)[v6 taskKind]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v18 = (const char *)[v6 taskKind];
        *(_DWORD *)long long buf = 134217984;
        v236 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind taskKind (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    id v14 = *p_insertOrUpdateAllEntriesStmt;
    [v6 creationTime];
    if (sqlite3_bind_double(v14, 3, v15))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [v6 creationTime];
        *(_DWORD *)long long buf = 134217984;
        v236 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind creationTime (%f) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 4, (sqlite3_int64)[v6 state]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v26 = (const char *)[v6 state];
        *(_DWORD *)long long buf = 134217984;
        v236 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind state (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 5, (sqlite3_int64)[v6 suspendCount]))
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v34 = (const char *)[v6 suspendCount];
        *(_DWORD *)long long buf = 134217984;
        v236 = v34;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind suspendCount (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    id v19 = *p_insertOrUpdateAllEntriesStmt;
    id v20 = [v6 taskDescription];
    LOBYTE(v19) = sqlite3_bind_text(v19, 6, (const char *)[v20 UTF8String], -1, 0) == 0;

    if ((v19 & 1) == 0)
    {
      id v12 = (id)qword_1000CB148;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v42 = [v6 taskDescription];
        *(_DWORD *)long long buf = 138412290;
        v236 = v42;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to bind taskDescription (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_36;
    }
    id v22 = [v6 originalRequest];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      int v25 = 0;
    }
    else
    {
      id v24 = [v6 originalRequest];
      int v25 = +[NSKeyedArchiver archivedDataWithRootObject:v24 requiringSecureCoding:1 error:0];
    }
    id v27 = *p_insertOrUpdateAllEntriesStmt;
    id v28 = v25;
    if (sqlite3_bind_blob(v27, 7, [v28 bytes], (int)objc_msgSend(v28, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v29 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to bind originalRequest to the select statement", buf, 2u);
      }
      goto LABEL_204;
    }
    v30 = [v6 currentRequest];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      v33 = 0;
    }
    else
    {
      v32 = [v6 currentRequest];
      v33 = +[NSKeyedArchiver archivedDataWithRootObject:v32 requiringSecureCoding:1 error:0];
    }
    v35 = *p_insertOrUpdateAllEntriesStmt;
    id v36 = v33;
    if (sqlite3_bind_blob(v35, 8, [v36 bytes], (int)objc_msgSend(v36, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v37 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Failed to bind currentRequestData to the select statement", buf, 2u);
      }
      goto LABEL_203;
    }
    v38 = [v6 response];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      v41 = 0;
    }
    else
    {
      v40 = [v6 response];
      v41 = +[NSKeyedArchiver archivedDataWithRootObject:v40 requiringSecureCoding:1 error:0];
    }
    v43 = *p_insertOrUpdateAllEntriesStmt;
    id v233 = v41;
    v44 = v233;
    if (sqlite3_bind_blob(v43, 9, [v233 bytes], (int)objc_msgSend(v233, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v45 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to bind responseData to the select statement", buf, 2u);
      }
      goto LABEL_202;
    }
    v46 = *p_insertOrUpdateAllEntriesStmt;
    v47 = [v6 earliestBeginDate];
    [v47 timeIntervalSince1970];
    LOBYTE(v46) = sqlite3_bind_double(v46, 10, v48) == 0;

    if ((v46 & 1) == 0)
    {
      v49 = (id)qword_1000CB148;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v67 = [v6 earliestBeginDate];
        [v67 timeIntervalSince1970];
        *(_DWORD *)long long buf = 134217984;
        v236 = v68;
        _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Failed to bind earlierBeginDate (%f) to the select statement", buf, 0xCu);
      }
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 11, (int)[v6 respondedToWillBeginDelayedRequestCallback]))
    {
      v50 = (id)qword_1000CB148;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        unsigned int v69 = [v6 respondedToWillBeginDelayedRequestCallback];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v69;
        _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Failed to bind identifier (%lu) to the select statement", buf, 0xCu);
      }

      goto LABEL_201;
    }
    v51 = [v6 error];
    BOOL v52 = v51 == 0;

    if (v52)
    {
      v54 = 0;
    }
    else
    {
      v53 = [v6 error];
      v54 = +[NSKeyedArchiver archivedDataWithRootObject:v53 requiringSecureCoding:1 error:0];
    }
    v55 = *p_insertOrUpdateAllEntriesStmt;
    id v232 = v54;
    if (sqlite3_bind_blob(v55, 12, [v232 bytes], (int)objc_msgSend(v232, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v56 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to bind errorData to the select statement", buf, 2u);
      }
      goto LABEL_200;
    }
    v57 = [v6 retryError];
    BOOL v58 = v57 == 0;

    if (v58)
    {
      v60 = 0;
    }
    else
    {
      v59 = [v6 retryError];
      v60 = +[NSKeyedArchiver archivedDataWithRootObject:v59 requiringSecureCoding:1 error:0];
    }
    v61 = *p_insertOrUpdateAllEntriesStmt;
    id v231 = v60;
    if (sqlite3_bind_blob(v61, 13, [v231 bytes], (int)objc_msgSend(v231, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v62 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "Failed to bind retryErrorData to the select statement", buf, 2u);
      }
      goto LABEL_199;
    }
    v63 = [v6 fileURL];
    BOOL v64 = v63 == 0;

    if (v64)
    {
      v66 = 0;
    }
    else
    {
      v65 = [v6 fileURL];
      v66 = +[NSKeyedArchiver archivedDataWithRootObject:v65 requiringSecureCoding:1 error:0];
    }
    v70 = *p_insertOrUpdateAllEntriesStmt;
    id v230 = v66;
    if (sqlite3_bind_blob(v70, 14, [v230 bytes], (int)objc_msgSend(v230, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      log = (id)qword_1000CB148;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v71 = [v6 fileURL];
        *(_DWORD *)long long buf = 138412290;
        v236 = v71;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to bind fileURL (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_198;
    }
    v72 = [v6 downloadFileURL];
    BOOL v73 = v72 == 0;

    if (v73)
    {
      v75 = 0;
    }
    else
    {
      v74 = [v6 downloadFileURL];
      v75 = +[NSKeyedArchiver archivedDataWithRootObject:v74 requiringSecureCoding:1 error:0];
    }
    v76 = *p_insertOrUpdateAllEntriesStmt;
    log = v75;
    if (sqlite3_bind_blob(v76, 15, [log bytes], (int)[log length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v84 = [v6 downloadFileURL];
        *(_DWORD *)long long buf = 138412290;
        v236 = v84;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind downloadFileURL (%@) to the select statement", buf, 0xCu);
      }
LABEL_119:

LABEL_198:
LABEL_199:

LABEL_200:
LABEL_201:
      v44 = v233;
LABEL_202:

LABEL_203:
LABEL_204:

      goto LABEL_205;
    }
    v78 = *p_insertOrUpdateAllEntriesStmt;
    id v79 = [v6 bundleID];
    BOOL v80 = sqlite3_bind_text(v78, 16, (const char *)[v79 UTF8String], -1, 0) == 0;

    if (!v80)
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v85 = [v6 bundleID];
        *(_DWORD *)long long buf = 138412290;
        v236 = v85;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind bundleID (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    v81 = *p_insertOrUpdateAllEntriesStmt;
    id v82 = [v6 sessionID];
    BOOL v83 = sqlite3_bind_text(v81, 17, (const char *)[v82 UTF8String], -1, 0) == 0;

    if (!v83)
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v86 = [v6 sessionID];
        *(_DWORD *)long long buf = 138412290;
        v236 = v86;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind sessionID (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 18, (int)[v6 hasStarted]))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        unsigned int v87 = [v6 hasStarted];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v87;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind creationTime (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 19, (int)[v6 shouldCancelOnDisconnect]))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        unsigned int v88 = [v6 shouldCancelOnDisconnect];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v88;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind shouldCancelOnDisconnect (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 20, (int)[v6 basePriority]))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v89 = (const char *)[v6 basePriority];
        *(_DWORD *)long long buf = 134217984;
        v236 = v89;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind basePriority (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 21, (int)[v6 basePrioritySetExplicitly]))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        unsigned int v92 = [v6 basePrioritySetExplicitly];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v92;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind basePrioritySetExplicitly (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 22, (int)[v6 isDiscretionary]))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        unsigned int v97 = [v6 isDiscretionary];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v97;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind discretionary (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 23, (int)[v6 discretionaryOverride]))
    {
      v77 = (id)qword_1000CB148;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        v98 = (const char *)[v6 discretionaryOverride];
        *(_DWORD *)long long buf = 134217984;
        v236 = v98;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to bind discretionaryOverride (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_119;
    }
    v90 = [v6 uniqueIdentifier];
    [v90 getUUIDBytes:v234];

    if (sqlite3_bind_blob(*p_insertOrUpdateAllEntriesStmt, 24, v234, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v91 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "Failed to bind uniqueIdentifier to the select statement", buf, 2u);
      }
      goto LABEL_198;
    }
    v93 = *p_insertOrUpdateAllEntriesStmt;
    id v94 = [v6 storagePartitionIdentifier];
    BOOL v95 = sqlite3_bind_text(v93, 25, (const char *)[v94 UTF8String], -1, 0) == 0;

    if (!v95)
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v99 = [v6 storagePartitionIdentifier];
        *(_DWORD *)long long buf = 138412290;
        v236 = v99;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind storagePartitionIdentifier (%@) to the select statement", buf, 0xCu);
      }
LABEL_190:

      goto LABEL_198;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 26, (sqlite3_int64)[v6 countOfBytesClientExpectsToSend]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v100 = (const char *)[v6 countOfBytesClientExpectsToSend];
        *(_DWORD *)long long buf = 134217984;
        v236 = v100;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesClientExpectsToSend (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 27, (sqlite3_int64)[v6 countOfBytesClientExpectsToReceive]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v101 = (const char *)[v6 countOfBytesClientExpectsToReceive];
        *(_DWORD *)long long buf = 134217984;
        v236 = v101;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesClientExpectsToReceive (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 28, (sqlite3_int64)[v6 countOfBytesReceived]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v102 = (const char *)[v6 countOfBytesReceived];
        *(_DWORD *)long long buf = 134217984;
        v236 = v102;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesReceived (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 29, (sqlite3_int64)[v6 countOfBytesSent]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v103 = (const char *)[v6 countOfBytesSent];
        *(_DWORD *)long long buf = 134217984;
        v236 = v103;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesSent (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 30, (sqlite3_int64)[v6 countOfBytesExpectedToSend]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v107 = (const char *)[v6 countOfBytesExpectedToSend];
        *(_DWORD *)long long buf = 134217984;
        v236 = v107;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesExpectedToSend (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 31, (sqlite3_int64)[v6 countOfBytesExpectedToReceive]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v108 = (const char *)[v6 countOfBytesExpectedToReceive];
        *(_DWORD *)long long buf = 134217984;
        v236 = v108;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind countOfBytesExpectedToReceive (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 32, (sqlite3_int64)[v6 bytesPerSecondLimit]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v109 = (const char *)[v6 bytesPerSecondLimit];
        *(_DWORD *)long long buf = 134217984;
        v236 = v109;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind bytesPerSecondLimit (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    v104 = *p_insertOrUpdateAllEntriesStmt;
    id v105 = [v6 personaUniqueString];
    BOOL v106 = sqlite3_bind_text(v104, 33, (const char *)[v105 UTF8String], -1, 0) == 0;

    if (!v106)
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v110 = [v6 personaUniqueString];
        *(_DWORD *)long long buf = 138412290;
        v236 = v110;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind personaUniqueString (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 34, (int)[v6 expectedProgressTarget]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v111 = (const char *)[v6 expectedProgressTarget];
        *(_DWORD *)long long buf = 134217984;
        v236 = v111;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind expectedProgressTarget (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 35, (int)[v6 mayBeDemotedToDiscretionary]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v112 = [v6 mayBeDemotedToDiscretionary];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v112;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind mayBeDemotedToDiscretionary (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 36, (int)[v6 _TLSMinimumSupportedProtocolVersion]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v113 = [v6 _TLSMinimumSupportedProtocolVersion];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v113;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMinimumSupportedProtocolVersion (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 37, (int)[v6 _TLSMaximumSupportedProtocolVersion]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v114 = [v6 _TLSMaximumSupportedProtocolVersion];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v114;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _TLSMaximumSupportedProtocolVersion (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 38, (int)[v6 _hasSZExtractor]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v115 = [v6 _hasSZExtractor];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v115;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _hasSZExtractor (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 39, (int)[v6 _doesSZExtractorConsumeExtractedData]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v120 = [v6 _doesSZExtractorConsumeExtractedData];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v120;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _doesSZExtractorConsumeExtractedData (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 40, (int)[v6 _updatedStreamingZipModificationDate]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v128 = [v6 _updatedStreamingZipModificationDate];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v128;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind _updatedStreamingZipModificationDate (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 41, (int)[v6 startedUserInitiated]))
    {
      v96 = (id)qword_1000CB148;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        unsigned int v129 = [v6 startedUserInitiated];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v129;
        _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "Failed to bind startedUserInitiated (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_190;
    }
    v116 = [v6 additionalProperties];
    BOOL v117 = v116 == 0;

    if (v117)
    {
      v119 = 0;
    }
    else
    {
      v118 = [v6 additionalProperties];
      v119 = +[NSKeyedArchiver archivedDataWithRootObject:v118 requiringSecureCoding:1 error:0];
    }
    v121 = *p_insertOrUpdateAllEntriesStmt;
    id v228 = v119;
    if (sqlite3_bind_blob(v121, 42, [v228 bytes], (int)objc_msgSend(v228, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v122 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_ERROR, "Failed to bind additionalProperties to the select statement", buf, 2u);
      }
      goto LABEL_197;
    }
    v123 = *p_insertOrUpdateAllEntriesStmt;
    id v124 = [v6 pathToDownloadTaskFile];
    BOOL v125 = sqlite3_bind_text(v123, 43, (const char *)[v124 UTF8String], -1, 0) == 0;

    if (!v125)
    {
      v126 = (id)qword_1000CB148;
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
      {
        v134 = [v6 pathToDownloadTaskFile];
        *(_DWORD *)long long buf = 138412290;
        v236 = v134;
        _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "Failed to bind pathToDownloadTaskFile (%@) to the select statement", buf, 0xCu);
      }
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 44, (int)[v6 retryCount]))
    {
      v127 = (id)qword_1000CB148;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        v135 = (const char *)[v6 retryCount];
        *(_DWORD *)long long buf = 134217984;
        v236 = v135;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to bind retryCount (%lu) to the select statement", buf, 0xCu);
      }
LABEL_221:

LABEL_197:
      goto LABEL_198;
    }
    v130 = *p_insertOrUpdateAllEntriesStmt;
    [v6 loadingPriority];
    if (sqlite3_bind_double(v130, 45, v131))
    {
      v127 = (id)qword_1000CB148;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        [v6 loadingPriority];
        *(_DWORD *)long long buf = 134217984;
        v236 = v132;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to bind loadingPriority (%f) to the select statement", buf, 0xCu);
      }
      goto LABEL_221;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 46, [v6 qos]))
    {
      v127 = (id)qword_1000CB148;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
      {
        unsigned int v133 = [v6 qos];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v133;
        _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to bind qos (%lu) to the select statement", buf, 0xCu);
      }
      goto LABEL_221;
    }
    v136 = [v6 _backgroundTrailers];
    BOOL v137 = v136 == 0;

    if (v137)
    {
      v139 = 0;
    }
    else
    {
      v138 = [v6 _backgroundTrailers];
      v139 = +[NSKeyedArchiver archivedDataWithRootObject:v138 requiringSecureCoding:1 error:0];
    }
    v140 = *p_insertOrUpdateAllEntriesStmt;
    id v219 = v139;
    if (sqlite3_bind_blob(v140, 47, [v219 bytes], (int)objc_msgSend(v219, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v141 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "Failed to bind backgroundTrailersData to the select statement", buf, 2u);
      }
      goto LABEL_315;
    }
    v142 = [v6 taskMetrics];
    BOOL v143 = v142 == 0;

    if (v143)
    {
      v145 = 0;
    }
    else
    {
      v144 = [v6 taskMetrics];
      v145 = +[NSKeyedArchiver archivedDataWithRootObject:v144 requiringSecureCoding:1 error:0];
    }
    v146 = *p_insertOrUpdateAllEntriesStmt;
    id v218 = v145;
    if (sqlite3_bind_blob(v146, 48, [v218 bytes], (int)objc_msgSend(v218, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v147 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_ERROR, "Failed to bind taskMetricsData to the select statement", buf, 2u);
      }
      goto LABEL_314;
    }
    v148 = [v6 URL];
    BOOL v149 = v148 == 0;

    if (v149)
    {
      v151 = 0;
    }
    else
    {
      v150 = [v6 URL];
      v151 = +[NSKeyedArchiver archivedDataWithRootObject:v150 requiringSecureCoding:1 error:0];
    }
    v152 = *p_insertOrUpdateAllEntriesStmt;
    id v220 = v151;
    if (sqlite3_bind_blob(v152, 49, [v220 bytes], (int)objc_msgSend(v220, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v224 = (id)qword_1000CB148;
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
      {
        v153 = [v6 URL];
        *(_DWORD *)long long buf = 138412290;
        v236 = v153;
        _os_log_error_impl((void *)&_mh_execute_header, v224, OS_LOG_TYPE_ERROR, "Failed to bind URL (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_313;
    }
    v154 = [v6 destinationURL];
    BOOL v155 = v154 == 0;

    if (v155)
    {
      v157 = 0;
    }
    else
    {
      v156 = [v6 destinationURL];
      v157 = +[NSKeyedArchiver archivedDataWithRootObject:v156 requiringSecureCoding:1 error:0];
    }
    v158 = *p_insertOrUpdateAllEntriesStmt;
    v224 = v157;
    if (sqlite3_bind_blob(v158, 50, [v224 bytes], (int)[v224 length], 0))
    {
      v223 = (id)qword_1000CB148;
      if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
      {
        v159 = [v6 destinationURL];
        *(_DWORD *)long long buf = 138412290;
        v236 = v159;
        _os_log_error_impl((void *)&_mh_execute_header, v223, OS_LOG_TYPE_ERROR, "Failed to bind destinationURL (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_312;
    }
    v160 = [v6 options];
    BOOL v161 = v160 == 0;

    if (v161)
    {
      v163 = 0;
    }
    else
    {
      v162 = [v6 options];
      v163 = +[NSPropertyListSerialization dataWithPropertyList:v162 format:200 options:0 error:0];
    }
    v164 = *p_insertOrUpdateAllEntriesStmt;
    v223 = v163;
    if (sqlite3_bind_blob(v164, 51, [v223 bytes], (int)[v223 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v165 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_ERROR, "Failed to bind optionsData to the select statement", buf, 2u);
      }
      goto LABEL_312;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 52, (int)[v6 initializedWithAVAsset]))
    {
      v166 = (id)qword_1000CB148;
      if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
      {
        unsigned int v167 = [v6 initializedWithAVAsset];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v167;
        _os_log_error_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_ERROR, "Failed to bind initializedWithAVAsset (%lu) to the select statement", buf, 0xCu);
      }

      goto LABEL_312;
    }
    v168 = [v6 temporaryDestinationURL];
    BOOL v169 = v168 == 0;

    if (v169)
    {
      v171 = 0;
    }
    else
    {
      v170 = [v6 temporaryDestinationURL];
      v171 = +[NSKeyedArchiver archivedDataWithRootObject:v170 requiringSecureCoding:1 error:0];
    }
    v172 = *p_insertOrUpdateAllEntriesStmt;
    id v222 = v171;
    if (sqlite3_bind_blob(v172, 53, [v222 bytes], (int)objc_msgSend(v222, "length"), 0))
    {
      v173 = (id)qword_1000CB148;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        v174 = [v6 temporaryDestinationURL];
        *(_DWORD *)long long buf = 138412290;
        v236 = v174;
        _os_log_error_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "Failed to bind temporaryDestinationURL (%@) to the select statement", buf, 0xCu);
      }
LABEL_262:

LABEL_311:
LABEL_312:

LABEL_313:
LABEL_314:

LABEL_315:
      goto LABEL_197;
    }
    v175 = *p_insertOrUpdateAllEntriesStmt;
    id v176 = [v6 assetTitle];
    BOOL v177 = sqlite3_bind_text(v175, 54, (const char *)[v176 UTF8String], -1, 0) == 0;

    if (!v177)
    {
      v173 = (id)qword_1000CB148;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR))
      {
        v178 = [v6 assetTitle];
        *(_DWORD *)long long buf = 138412290;
        v236 = v178;
        _os_log_error_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_ERROR, "Failed to bind assetTitle (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_262;
    }
    v179 = *p_insertOrUpdateAllEntriesStmt;
    id v180 = [v6 assetArtworkData];
    id v181 = [v180 bytes];
    os_log_t v226 = [v6 assetArtworkData];
    LOBYTE(v179) = sqlite3_bind_blob(v179, 55, v181, (int)[v226 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL) == 0;

    if ((v179 & 1) == 0)
    {
      v182 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v182, OS_LOG_TYPE_ERROR, "Failed to bind assetArtworkDataData to the select statement", buf, 2u);
      }
      goto LABEL_311;
    }
    v183 = [v6 AVAssetURL];
    BOOL v184 = v183 == 0;

    if (v184)
    {
      v186 = 0;
    }
    else
    {
      v185 = [v6 AVAssetURL];
      v186 = +[NSKeyedArchiver archivedDataWithRootObject:v185 requiringSecureCoding:1 error:0];
    }
    v187 = *p_insertOrUpdateAllEntriesStmt;
    id v225 = v186;
    if (sqlite3_bind_blob(v187, 56, [v225 bytes], (int)objc_msgSend(v225, "length"), 0))
    {
      v227 = (id)qword_1000CB148;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v188 = [v6 AVAssetURL];
        *(_DWORD *)long long buf = 138412290;
        v236 = v188;
        _os_log_error_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_ERROR, "Failed to bind AVAssetURL (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_310;
    }
    if (sqlite3_bind_int64(*p_insertOrUpdateAllEntriesStmt, 57, (int)[v6 AVAssetDownloadToken]))
    {
      v227 = (id)qword_1000CB148;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v189 = (const char *)[v6 AVAssetDownloadToken];
        *(_DWORD *)long long buf = 134217984;
        v236 = v189;
        v190 = "Failed to bind AVAssetDownloadToken (%lu) to the select statement";
LABEL_285:
        v196 = v227;
        uint32_t v197 = 12;
LABEL_292:
        _os_log_error_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_ERROR, v190, buf, v197);
        goto LABEL_310;
      }
      goto LABEL_310;
    }
    v191 = *p_insertOrUpdateAllEntriesStmt;
    id v192 = [v6 avAssetDownloadChildDownloadSessionIdentifier];
    BOOL v193 = sqlite3_bind_text(v191, 58, (const char *)[v192 UTF8String], -1, 0) == 0;

    if (!v193)
    {
      v227 = (id)qword_1000CB148;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        v194 = [v6 avAssetDownloadChildDownloadSessionIdentifier];
        *(_DWORD *)long long buf = 138412290;
        v236 = v194;
        _os_log_error_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_ERROR, "Failed to bind avAssetDownloadChildDownloadSessionIdentifier (%@) to the select statement", buf, 0xCu);
      }
      goto LABEL_310;
    }
    if (sqlite3_bind_int(*p_insertOrUpdateAllEntriesStmt, 59, (int)[v6 enableSPIDelegateCallbacks]))
    {
      v227 = (id)qword_1000CB148;
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        unsigned int v195 = [v6 enableSPIDelegateCallbacks];
        *(_DWORD *)long long buf = 134217984;
        v236 = (const char *)v195;
        v190 = "Failed to bind enableSPIDelegateCallbacks (%lu) to the select statement";
        goto LABEL_285;
      }
LABEL_310:

      goto LABEL_311;
    }
    v198 = [v6 downloadConfig];
    BOOL v199 = v198 == 0;

    if (v199)
    {
      v201 = 0;
    }
    else
    {
      v200 = [v6 downloadConfig];
      v201 = +[NSKeyedArchiver archivedDataWithRootObject:v200 requiringSecureCoding:1 error:0];
    }
    v202 = *p_insertOrUpdateAllEntriesStmt;
    v227 = v201;
    if (sqlite3_bind_blob(v202, 60, [v227 bytes], (int)[v227 length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      uint64_t v203 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        v190 = "Failed to bind downloadConfigData to the select statement";
        v196 = v203;
        uint32_t v197 = 2;
        goto LABEL_292;
      }
      goto LABEL_310;
    }
    v204 = [v6 assetOptionsPlist];
    BOOL v205 = v204 == 0;

    if (v205
      || ([v6 assetOptionsPlist],
          v206 = objc_claimAutoreleasedReturnValue(),
          +[NSPropertyListSerialization dataWithPropertyList:v206 format:200 options:0 error:0], v207 = objc_claimAutoreleasedReturnValue(), v206, !v207))
    {
      id v221 = 0;
      int v210 = 61;
    }
    else
    {
      v208 = *p_insertOrUpdateAllEntriesStmt;
      id v221 = v207;
      if (sqlite3_bind_blob(v208, 61, [v221 bytes], (int)objc_msgSend(v221, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
      {
        v209 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v209, OS_LOG_TYPE_ERROR, "Failed to bind assetOptionsData to the select statement", buf, 2u);
        }
LABEL_309:

        goto LABEL_310;
      }
      int v210 = 62;
    }
    v211 = [v6 resumableUploadData];
    v212 = *p_insertOrUpdateAllEntriesStmt;
    id v217 = v211;
    if (sqlite3_bind_blob(v212, v210, [v217 bytes], (int)objc_msgSend(v217, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v213 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v213, OS_LOG_TYPE_ERROR, "Failed to bind resumableUploadData to the select statement", buf, 2u);
      }
    }
    else
    {
      if (sqlite3_step(*p_insertOrUpdateAllEntriesStmt) != 101)
      {
        v214 = (id)qword_1000CB148;
        if (os_log_type_enabled(v214, OS_LOG_TYPE_ERROR))
        {
          v215 = (const char *)[v6 identifier];
          v216 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)long long buf = 134218242;
          v236 = v215;
          __int16 v237 = 2080;
          v238 = v216;
          _os_log_error_impl((void *)&_mh_execute_header, v214, OS_LOG_TYPE_ERROR, "Failed to insert task %lu into db. Error= %s", buf, 0x16u);
        }
      }
      sqlite3_reset(*p_insertOrUpdateAllEntriesStmt);
    }

    goto LABEL_309;
  }
  id v13 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
  }
LABEL_205:
}

- (id)_onqueue_convertSqlRowToTaskInfoEntry:(sqlite3_stmt *)a3
{
  if (!a3)
  {
    id v5 = 0;
LABEL_65:
    id v5 = v5;
    v63 = v5;
    goto LABEL_69;
  }
  id v5 = objc_alloc_init((Class)__NSCFURLSessionTaskInfo);
  [v5 setIdentifier:sqlite3_column_int(a3, 0)];
  [v5 setTaskKind:sqlite3_column_int64(a3, 1)];
  [v5 setCreationTime:sqlite3_column_double(a3, 2)];
  [v5 setState:sqlite3_column_int64(a3, 3)];
  [v5 setSuspendCount:sqlite3_column_int64(a3, 4)];
  id v6 = sqlite3_column_text(a3, 5);
  if (v6)
  {
    id v7 = +[NSString stringWithUTF8String:v6];
    [v5 setTaskDescription:v7];
  }
  v78 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:6];
  if ((unint64_t)[v78 length] <= 0x20000)
  {
    if (v78)
    {
      id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v78 error:0];
      [v5 setOriginalRequest:v8];

      id v9 = [v5 originalRequest];
      id v10 = [v9 _allProtocolProperties];
      unint64_t v11 = estimatedPropertyListSize();

      if (v11 > 0x4000)
      {
        id v12 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Dropping oversized protocol properties on request", buf, 2u);
        }
        id v13 = [v5 originalRequest];
        id v14 = [v13 mutableCopy];

        [v14 _removeAllProtocolProperties];
        [v5 setOriginalRequest:v14];
      }
    }
    v77 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:7];
    if (v77)
    {
      double v15 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v77 error:0];
      [v5 setCurrentRequest:v15];

      id v16 = [v5 currentRequest];
      unsigned int v17 = [v16 _allProtocolProperties];
      unint64_t v18 = estimatedPropertyListSize();

      if (v18 > 0x4000)
      {
        id v19 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v79 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Dropping oversized protocol properties on request", v79, 2u);
        }
        id v20 = [v5 currentRequest];
        id v21 = [v20 mutableCopy];

        [v21 _removeAllProtocolProperties];
        [v5 setCurrentRequest:v21];
      }
    }
    uint64_t v22 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:8];
    uint64_t v66 = v22;
    if (v22)
    {
      BOOL v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v22, 0, v22);
      [v5 setResponse:v23];
    }
    if (sqlite3_column_double(a3, 9) != 0.0)
    {
      id v24 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
      [v5 setEarliestBeginDate:v24];
    }
    [v5 setRespondedToWillBeginDelayedRequestCallback:sqlite3_column_int(a3, 10) != 0];
    v76 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:11];
    if (v76)
    {
      int v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v76 error:0];
      [v5 setError:v25];
    }
    v75 = -[NDTaskStorageDB _sqlBlobHelper:forColumn:](self, "_sqlBlobHelper:forColumn:", a3, 12, v66);
    if (v75)
    {
      int v26 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v75 error:0];
      [v5 setRetryError:v26];
    }
    v74 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:13];
    if (v74)
    {
      id v27 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v74 error:0];
      [v5 setFileURL:v27];
    }
    BOOL v73 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:14];
    if (v73)
    {
      id v28 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v73 error:0];
      [v5 setDownloadFileURL:v28];
    }
    v29 = sqlite3_column_text(a3, 15);
    if (v29)
    {
      v30 = +[NSString stringWithUTF8String:v29];
      [v5 setBundleID:v30];
    }
    BOOL v31 = sqlite3_column_text(a3, 16);
    if (v31)
    {
      v32 = +[NSString stringWithUTF8String:v31];
      [v5 setSessionID:v32];
    }
    [v5 setHasStarted:sqlite3_column_int(a3, 17) != 0];
    [v5 setShouldCancelOnDisconnect:sqlite3_column_int(a3, 18) != 0];
    [v5 setBasePriority:sqlite3_column_int(a3, 19)];
    [v5 setBasePrioritySetExplicitly:sqlite3_column_int(a3, 20) != 0];
    [v5 setDiscretionary:sqlite3_column_int(a3, 21) != 0];
    [v5 setDiscretionaryOverride:sqlite3_column_int(a3, 22)];
    id v72 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:23];
    if (v72)
    {
      id v33 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v72 bytes]];
      [v5 setUniqueIdentifier:v33];
    }
    v34 = sqlite3_column_text(a3, 24);
    if (v34)
    {
      v35 = +[NSString stringWithUTF8String:v34];
      [v5 setStoragePartitionIdentifier:v35];
    }
    [v5 setCountOfBytesClientExpectsToSend:sqlite3_column_int64(a3, 25)];
    [v5 setCountOfBytesClientExpectsToReceive:sqlite3_column_int64(a3, 26)];
    [v5 setCountOfBytesReceived:sqlite3_column_int64(a3, 27)];
    [v5 setCountOfBytesSent:sqlite3_column_int64(a3, 28)];
    [v5 setCountOfBytesExpectedToSend:sqlite3_column_int64(a3, 29)];
    [v5 setCountOfBytesExpectedToReceive:sqlite3_column_int64(a3, 30)];
    [v5 setBytesPerSecondLimit:sqlite3_column_int64(a3, 31)];
    id v36 = sqlite3_column_text(a3, 32);
    if (v36)
    {
      v37 = +[NSString stringWithUTF8String:v36];
      [v5 setPersonaUniqueString:v37];
    }
    [v5 setExpectedProgressTarget:sqlite3_column_int64(a3, 33)];
    [v5 setMayBeDemotedToDiscretionary:sqlite3_column_int(a3, 34) != 0];
    [v5 set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)sqlite3_column_int(a3, 35)];
    [v5 set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)sqlite3_column_int(a3, 36)];
    [v5 set_hasSZExtractor:sqlite3_column_int(a3, 37) != 0];
    [v5 set_doesSZExtractorConsumeExtractedData:sqlite3_column_int(a3, 38) != 0];
    [v5 set_updatedStreamingZipModificationDate:sqlite3_column_int(a3, 39) != 0];
    [v5 setStartedUserInitiated:sqlite3_column_int(a3, 40) != 0];
    v71 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:41];
    if (v71)
    {
      if (qword_1000CB050 != -1) {
        dispatch_once(&qword_1000CB050, &stru_1000B50D8);
      }
      v38 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:qword_1000CB048 fromData:v71 error:0];
      [v5 setAdditionalProperties:v38];
    }
    BOOL v39 = sqlite3_column_text(a3, 42);
    if (v39)
    {
      v40 = +[NSString stringWithUTF8String:v39];
      [v5 setPathToDownloadTaskFile:v40];
    }
    [v5 setRetryCount:sqlite3_column_int(a3, 43)];
    [v5 setLoadingPriority:sqlite3_column_double(a3, 44)];
    [v5 setQos:sqlite3_column_int64(a3, 45)];
    v70 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:46];
    if (v70)
    {
      uint64_t v41 = objc_opt_class();
      v42 = +[NSKeyedUnarchiver unarchivedDictionaryWithKeysOfClass:v41 objectsOfClass:objc_opt_class() fromData:v70 error:0];
      [v5 set_backgroundTrailers:v42];
    }
    unsigned int v69 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:47];
    if (v69)
    {
      v43 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v69 error:0];
      [v5 setTaskMetrics:v43];
    }
    v68 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:48];
    if (v68)
    {
      v44 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v68 error:0];
      [v5 setURL:v44];
    }
    v45 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:49];
    if (v45)
    {
      v46 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v45 error:0];
      [v5 setDestinationURL:v46];
    }
    v47 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:50];
    if (v47)
    {
      double v48 = +[NSPropertyListSerialization propertyListWithData:v47 options:0 format:0 error:0];
      [v5 setOptions:v48];
    }
    [v5 setInitializedWithAVAsset:sqlite3_column_int(a3, 51) != 0];
    v49 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:52];
    if (v49)
    {
      v50 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v49 error:0];
      [v5 setTemporaryDestinationURL:v50];
    }
    v51 = sqlite3_column_text(a3, 53);
    if (v51)
    {
      BOOL v52 = +[NSString stringWithUTF8String:v51];
      [v5 setAssetTitle:v52];
    }
    v53 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:54];
    [v5 setAssetArtworkData:v53];

    v54 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:55];
    if (v54)
    {
      v55 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v54 error:0];
      [v5 setAVAssetURL:v55];
    }
    [v5 setAVAssetDownloadToken:sqlite3_column_int64(a3, 56)];
    v56 = sqlite3_column_text(a3, 57);
    if (v56)
    {
      v57 = +[NSString stringWithUTF8String:v56];
      [v5 setAvAssetDownloadChildDownloadSessionIdentifier:v57];
    }
    [v5 setEnableSPIDelegateCallbacks:sqlite3_column_int(a3, 58) != 0];
    BOOL v58 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:59];
    v59 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v58 error:0];
    [v5 setDownloadConfig:v59];

    v60 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:60];
    if (v60)
    {
      v61 = +[NSPropertyListSerialization propertyListWithData:v60 options:0 format:0 error:0];
      [v5 setAssetOptionsPlist:v61];
    }
    v62 = [(NDTaskStorageDB *)self _sqlBlobHelper:a3 forColumn:61];
    [v5 setResumableUploadData:v62];

    goto LABEL_65;
  }
  BOOL v64 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v81 = 0;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Dropping oversized request", v81, 2u);
  }

  v63 = 0;
LABEL_69:

  return v63;
}

- (id)_sqlBlobHelper:(sqlite3_stmt *)a3 forColumn:(int)a4
{
  int v6 = sqlite3_column_bytes(a3, a4);
  if (v6 < 1) {
    id v7 = 0;
  }
  else {
    id v7 = [objc_alloc((Class)NSData) initWithBytes:sqlite3_column_blob(a3, a4) length:v6];
  }

  return v7;
}

- (BOOL)_onqueue_initDB
{
  if (self->_dbInitialized)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    v2 = self;
    BOOL dbInitializationStarted = self->_dbInitializationStarted;
    LOBYTE(self) = 1;
    if (!dbInitializationStarted)
    {
      v2->_BOOL dbInitializationStarted = 1;
      path = v2->_path;
      if (!path)
      {
        uint64_t v5 = [(NSURL *)v2->_dbDir URLByAppendingPathComponent:@"tasks.sqlite" isDirectory:0];
        int v6 = v2->_path;
        v2->_path = (NSURL *)v5;

        path = v2->_path;
      }
      if ([(NDTaskStorageDB *)v2 _createDBSchemaForPath:path])
      {
        LOBYTE(self) = 1;
        v2->_dbInitialized = 1;
      }
      else
      {
        id v7 = qword_1000CB148;
        LODWORD(self) = os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR);
        if (self)
        {
          id v8 = v2->_path;
          int v10 = 138412290;
          unint64_t v11 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to create persistent store for background tasks at location %@.", (uint8_t *)&v10, 0xCu);
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (void)_onqueue_garbageCollect
{
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Garbage collection started", buf, 2u);
  }
  dbConnection = self->_dbConnection;
  if (dbConnection && self->_dbInitialized)
  {
    deleteEntriesStmt = self->_deleteEntriesStmt;
    if (deleteEntriesStmt)
    {
LABEL_6:
      if (sqlite3_step(deleteEntriesStmt) != 101)
      {
        int v6 = (id)qword_1000CB148;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          int v10 = sqlite3_errmsg(self->_dbConnection);
          *(_DWORD *)long long buf = 136315138;
          id v14 = (char *)v10;
          _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to delete expired entries from session_tasks db. Error= %s", buf, 0xCu);
        }
      }
      sqlite3_reset(self->_deleteEntriesStmt);
      errmsg = 0;
      if (sqlite3_exec(self->_dbConnection, "PRAGMA incremental_vacuum(10);", 0, 0, &errmsg))
      {
        id v7 = qword_1000CB148;
        if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315138;
          id v14 = errmsg;
          _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to auto vacuum when garbage collecting: %s", buf, 0xCu);
        }
      }
      return;
    }
    if (!sqlite3_prepare_v2(dbConnection, "DELETE FROM session_tasks", -1, &self->_deleteEntriesStmt, 0))
    {
      deleteEntriesStmt = self->_deleteEntriesStmt;
      goto LABEL_6;
    }
    id v9 = (id)qword_1000CB148;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      unint64_t v11 = sqlite3_errmsg(self->_dbConnection);
      *(_DWORD *)long long buf = 136315138;
      id v14 = (char *)v11;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to init the _deleteEntriesStmt statement for session_tasks. Error = %s", buf, 0xCu);
    }
  }
  else
  {
    id v8 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sqlite db not initialized", buf, 2u);
    }
  }
}

- (BOOL)_createDBSchemaForPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (const char *)[v4 fileSystemRepresentation];
  int v6 = v5;
  if (v5)
  {
    id v7 = dirname_r(v5, (char *)errmsg);
    int v8 = statfs(v7, &v27);
    char f_flags = v27.f_flags;
    unsigned __int8 v10 = [v4 checkResourceIsReachableAndReturnError:0];
    if (((v8 != -1) & ((f_flags & 0x80) >> 7)) != 0) {
      int v11 = 3145734;
    }
    else {
      int v11 = 6;
    }
    p_dbConnection = &self->_dbConnection;
    if (sqlite3_open_v2(v6, &self->_dbConnection, v11, 0))
    {
      sqlite3_close(*p_dbConnection);
      BOOL v13 = 0;
      *p_dbConnection = 0;
      goto LABEL_27;
    }
    +[NSString stringWithFormat:@"%@%d", @"PRAGMA user_version = ", 2, 0];
    id v15 = objc_claimAutoreleasedReturnValue();
    id v16 = (const char *)[v15 UTF8String];

    sqlite3_busy_timeout(*p_dbConnection, 1000);
    if (v10)
    {
      if ([(NDTaskStorageDB *)self handleSchemaVersionChange])
      {
LABEL_12:
        int v17 = 1;
LABEL_24:
        BOOL v23 = (id)qword_1000CB148;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = [v4 absoluteString];
          v27.f_bsize = 138412290;
          *(void *)&v27.f_iosize = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Opened db at path: %@", (uint8_t *)&v27, 0xCu);
        }
        BOOL v13 = v17 != 0;
        goto LABEL_27;
      }
      id v20 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        id v21 = "Failed to handle db version change";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v27, 2u);
        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (sqlite3_exec(*p_dbConnection, "PRAGMA auto_vacuum = 2;", 0, 0, errmsg))
    {
      unint64_t v18 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        id v19 = "Failed to set auto_vacuum to incremental";
LABEL_36:
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v27, 2u);
      }
    }
    else
    {
      if (!sqlite3_exec(*p_dbConnection, "PRAGMA journal_mode = WAL", 0, 0, errmsg))
      {
        char v22 = 0;
        int v17 = 1;
LABEL_21:
        if (sqlite3_exec(*p_dbConnection, v16, 0, 0, errmsg))
        {
          id v20 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27.f_bsize) = 0;
            id v21 = "Failed to set user_version";
            goto LABEL_34;
          }
        }
        else
        {
          if (v22) {
            goto LABEL_24;
          }
          if (!sqlite3_exec(*p_dbConnection, "CREATE TABLE IF NOT EXISTS session_tasks (\tidentifier int NOT NULL, task_kind int, creation_time real, state int, suspend_count int, task_description text, original_request blob, current_request blob, response blob,\tearliest_begin_date real, responded_to_will_begin_delayed_request_callback int, error blob, retry_error blob, file_url text, download_file_url text, bundle_id text, session_id text NOT NULL,\thas_started int, should_cancel_on_disconnect int, base_priority int, base_priority_set_explicitly int, discretionary int, discretionary_override int, unique_identifier blob NOT NULL,\tstorage_partition_identifier text, count_of_bytes_client_expects_to_send int, count_of_bytes_client_expects_to_receive int, count_of_bytes_received int, count_of_bytes_sent int,\tcount_of_bytes_expected_to_send int, count_of_bytes_expected_to_receive int, bytes_per_second_limit int, persona_unique_string text, expected_progress_target int, may_be_demoted_to_discretionary int,\ttls_minimum_supported_protocol_version int, tls_maximum_supported_protocol_version int, has_sz_extractor int, does_sz_extractor_consume_extracted_data int, updated_streaming_zip_modification_date int,\tstarted_user_initiated int, additional_properties blob, path_to_download_task_file text, retry_count int, loading_priority real, qos int, background_trailers blob, task_metrics blob,\tav_url text, av_destination_url text, av_options blob, av_initialized_with_av_asset int, av_temporary_destination_url text, av_asset_title text, av_asset_artwork_data blob, av_asset_url text,\tav_asset_download_token int, av_asset_download_child_download_session_identifier text, av_enable_spi_delegate_callbacks int, av_download_config blob, av_asset_options_plist blob, resumable_upload_data blob,\tUNIQUE(identifier, session_id));",
                  0,
                  0,
                  errmsg))
            goto LABEL_12;
          id v20 = qword_1000CB148;
          if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v27.f_bsize) = 0;
            id v21 = "Failed to create schema";
            goto LABEL_34;
          }
        }
LABEL_23:
        int v17 = 0;
        goto LABEL_24;
      }
      unint64_t v18 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v27.f_bsize) = 0;
        id v19 = "Failed to set journal mode";
        goto LABEL_36;
      }
    }
    int v17 = 0;
    char v22 = 1;
    goto LABEL_21;
  }
  id v14 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v27.f_bsize) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get dbPath", (uint8_t *)&v27, 2u);
  }
  BOOL v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)handleSchemaVersionChange
{
  ppStmt = 0;
  dbConnection = self->_dbConnection;
  if (!dbConnection || sqlite3_prepare_v2(dbConnection, "PRAGMA user_version", -1, &ppStmt, 0)) {
    return 1;
  }
  if (sqlite3_step(ppStmt) == 100)
  {
    uint64_t v5 = sqlite3_column_int(ppStmt, 0);
    int v6 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "schema version on disk is %ld", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = -1;
  }
  sqlite3_finalize(ppStmt);
  BOOL result = 1;
  if ((v5 & 0x8000000000000000) == 0 && v5 != 2) {
    return [(NDTaskStorageDB *)self migrateSchemaToLatestVersion:v5];
  }
  return result;
}

- (BOOL)migrateSchemaToLatestVersion:(int64_t)a3
{
  errmsg = 0;
  dbConnection = self->_dbConnection;
  if (!dbConnection)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  BOOL v6 = 1;
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      if (sqlite3_exec(dbConnection, "ALTER TABLE session_tasks ADD COLUMN resumable_upload_data blob;", 0, 0, 0))
      {
        id v7 = qword_1000CB148;
        if (!os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        *(_WORD *)long long buf = 0;
        int v8 = "Failed to migrate to version 2";
LABEL_25:
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
LABEL_11:
        int v9 = sqlite3_exec(self->_dbConnection, "DROP TABLE IF EXISTS session_tasks", 0, 0, &errmsg);
        unsigned __int8 v10 = qword_1000CB148;
        if (v9 && os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to drop table", buf, 2u);
          unsigned __int8 v10 = qword_1000CB148;
        }
        BOOL v6 = 0;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218240;
          int64_t v19 = a3;
          __int16 v20 = 1024;
          int v21 = 2;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dropped db table session_tasks as migration from version %ld to %d failed", buf, 0x12u);
          BOOL v6 = 0;
        }
      }
    }
    else if (!a3 {
           && sqlite3_exec(dbConnection, "ALTER TABLE session_tasks ADD COLUMN av_asset_options_plist blob;",
    }
                0,
                0,
                0))
    {
      id v7 = qword_1000CB148;
      if (!os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_WORD *)long long buf = 0;
      int v8 = "Failed to migrate to version 1";
      goto LABEL_25;
    }
    int v11 = +[NSString stringWithFormat:@"%@%d", @"PRAGMA user_version = ", 2];
    id v12 = self->_dbConnection;
    id v13 = v11;
    if (sqlite3_exec(v12, (const char *)[v13 UTF8String], 0, 0, &errmsg))
    {
      id v14 = qword_1000CB148;
      if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to set user_version", buf, 2u);
      }
      BOOL v6 = 0;
    }
  }
  id v15 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218496;
    int64_t v19 = a3;
    __int16 v20 = 1024;
    int v21 = 2;
    __int16 v22 = 1024;
    BOOL v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Migrated schema version from %ld to %d success = %d", buf, 0x18u);
  }
  return v6;
}

@end