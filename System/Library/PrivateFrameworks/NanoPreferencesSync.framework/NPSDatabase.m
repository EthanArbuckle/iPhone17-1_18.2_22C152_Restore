@interface NPSDatabase
- (BOOL)_openDBAtPath:(id)a3;
- (BOOL)getMessageType:(int *)a3 forMessageID:(id)a4;
- (BOOL)removeMessageFromMessageTypeTable:(id)a3;
- (BOOL)setMessageType:(int)a3 forMessageID:(id)a4;
- (NPSDatabase)initWithPath:(id)a3;
- (NSString)path;
- (int)_getSchemaVersion;
- (sqlite3)db;
- (sqlite3_stmt)flushStashedSettingSyncData;
- (sqlite3_stmt)getFileBackupForMessageID;
- (sqlite3_stmt)getFileBackupWithNullMessageID;
- (sqlite3_stmt)getMessageTypeForMessageID;
- (sqlite3_stmt)getSettingsBackupForMessageID;
- (sqlite3_stmt)getSettingsBackupWithNullMessageID;
- (sqlite3_stmt)getSettingsSyncForMessageID;
- (sqlite3_stmt)getSettingsSyncWithNullMessageID;
- (sqlite3_stmt)getStashedSettingSyncData;
- (sqlite3_stmt)purgeFileBackupTable;
- (sqlite3_stmt)purgeMessageTypeTable;
- (sqlite3_stmt)purgeSettingsBackupTable;
- (sqlite3_stmt)purgeSettingsSyncTable;
- (sqlite3_stmt)removeMessageFromMessageTypeTable;
- (sqlite3_stmt)setMessageIDForFileBackup;
- (sqlite3_stmt)setMessageIDForSettingBackup;
- (sqlite3_stmt)setMessageIDForSettingSync;
- (sqlite3_stmt)setMessageTypeForMessageID;
- (sqlite3_stmt)setNullMessageIDForFileBackup;
- (sqlite3_stmt)setNullMessageIDForSettingBackup;
- (sqlite3_stmt)setNullMessageIDForSettingSync;
- (sqlite3_stmt)stashSettingsSyncData;
- (sqlite3_stmt)untrackFileBackupForMessageID;
- (sqlite3_stmt)untrackFileBackupMessage;
- (sqlite3_stmt)untrackSettingsBackupForMessageID;
- (sqlite3_stmt)untrackSettingsBackupMessage;
- (sqlite3_stmt)untrackSettingsSyncForMessageID;
- (sqlite3_stmt)untrackSettingsSyncMessage;
- (unint64_t)version;
- (void)dealloc;
- (void)flushStashedSettingsSyncData;
- (void)getFileBackupDataForMessage:(id)a3 handler:(id)a4;
- (void)getSettingsBackupDataForMessage:(id)a3 handler:(id)a4;
- (void)getSettingsSyncDataForMessage:(id)a3 handler:(id)a4;
- (void)getStashedSettingsSyncDataWithHandler:(id)a3;
- (void)invalidate;
- (void)messageWasDelivered:(id)a3;
- (void)messageWasPurged:(id)a3;
- (void)purgePendingOutgoingMessages;
- (void)sentFileBackupMessage:(id)a3 forFileAtPath:(id)a4;
- (void)sentSettingsBackupMessage:(id)a3 forContainer:(id)a4 domain:(id)a5 keys:(id)a6;
- (void)sentSettingsSyncMessage:(id)a3 forDomain:(id)a4 keys:(id)a5 cloudEnabled:(BOOL)a6;
- (void)setDb:(sqlite3 *)a3;
- (void)setFlushStashedSettingSyncData:(sqlite3_stmt *)a3;
- (void)setGetFileBackupForMessageID:(sqlite3_stmt *)a3;
- (void)setGetFileBackupWithNullMessageID:(sqlite3_stmt *)a3;
- (void)setGetMessageTypeForMessageID:(sqlite3_stmt *)a3;
- (void)setGetSettingsBackupForMessageID:(sqlite3_stmt *)a3;
- (void)setGetSettingsBackupWithNullMessageID:(sqlite3_stmt *)a3;
- (void)setGetSettingsSyncForMessageID:(sqlite3_stmt *)a3;
- (void)setGetSettingsSyncWithNullMessageID:(sqlite3_stmt *)a3;
- (void)setGetStashedSettingSyncData:(sqlite3_stmt *)a3;
- (void)setPath:(id)a3;
- (void)setPurgeFileBackupTable:(sqlite3_stmt *)a3;
- (void)setPurgeMessageTypeTable:(sqlite3_stmt *)a3;
- (void)setPurgeSettingsBackupTable:(sqlite3_stmt *)a3;
- (void)setPurgeSettingsSyncTable:(sqlite3_stmt *)a3;
- (void)setRemoveMessageFromMessageTypeTable:(sqlite3_stmt *)a3;
- (void)setSetMessageIDForFileBackup:(sqlite3_stmt *)a3;
- (void)setSetMessageIDForSettingBackup:(sqlite3_stmt *)a3;
- (void)setSetMessageIDForSettingSync:(sqlite3_stmt *)a3;
- (void)setSetMessageTypeForMessageID:(sqlite3_stmt *)a3;
- (void)setSetNullMessageIDForFileBackup:(sqlite3_stmt *)a3;
- (void)setSetNullMessageIDForSettingBackup:(sqlite3_stmt *)a3;
- (void)setSetNullMessageIDForSettingSync:(sqlite3_stmt *)a3;
- (void)setStashSettingsSyncData:(sqlite3_stmt *)a3;
- (void)setUntrackFileBackupForMessageID:(sqlite3_stmt *)a3;
- (void)setUntrackFileBackupMessage:(sqlite3_stmt *)a3;
- (void)setUntrackSettingsBackupForMessageID:(sqlite3_stmt *)a3;
- (void)setUntrackSettingsBackupMessage:(sqlite3_stmt *)a3;
- (void)setUntrackSettingsSyncForMessageID:(sqlite3_stmt *)a3;
- (void)setUntrackSettingsSyncMessage:(sqlite3_stmt *)a3;
- (void)stashSettingsSyncData:(id)a3 forDomain:(id)a4 key:(id)a5 isTwoWaySync:(BOOL)a6 timestamp:(double)a7;
- (void)untrackFileBackupMessageForFileAtPath:(id)a3;
- (void)untrackSettingsBackupMessageForContainer:(id)a3 domain:(id)a4 keys:(id)a5;
- (void)untrackSettingsSyncMessagesForDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5;
@end

@implementation NPSDatabase

- (NPSDatabase)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPSDatabase;
  v5 = [(NPSDatabase *)&v10 init];
  if (v5
    && ([v4 stringByStandardizingPath],
        v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [(NPSDatabase *)v5 _openDBAtPath:v6],
        v6,
        !v7))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)dealloc
{
  [(NPSDatabase *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NPSDatabase;
  [(NPSDatabase *)&v3 dealloc];
}

- (void)invalidate
{
  if (self->_db)
  {
    sqlite3_finalize(self->_getMessageTypeForMessageID);
    sqlite3_finalize(self->_setMessageTypeForMessageID);
    sqlite3_finalize(self->_setMessageIDForSettingSync);
    sqlite3_finalize(self->_setMessageIDForSettingBackup);
    sqlite3_finalize(self->_setMessageIDForFileBackup);
    sqlite3_finalize(self->_untrackSettingsSyncMessage);
    sqlite3_finalize(self->_untrackSettingsBackupMessage);
    sqlite3_finalize(self->_untrackFileBackupMessage);
    sqlite3_finalize(self->_untrackSettingsSyncForMessageID);
    sqlite3_finalize(self->_untrackSettingsBackupForMessageID);
    sqlite3_finalize(self->_untrackFileBackupForMessageID);
    sqlite3_finalize(self->_removeMessageFromMessageTypeTable);
    sqlite3_finalize(self->_setNullMessageIDForSettingSync);
    sqlite3_finalize(self->_setNullMessageIDForSettingBackup);
    sqlite3_finalize(self->_setNullMessageIDForFileBackup);
    sqlite3_finalize(self->_getSettingsSyncForMessageID);
    sqlite3_finalize(self->_getSettingsBackupForMessageID);
    sqlite3_finalize(self->_getFileBackupForMessageID);
    sqlite3_finalize(self->_getSettingsSyncWithNullMessageID);
    sqlite3_finalize(self->_getSettingsBackupWithNullMessageID);
    sqlite3_finalize(self->_getFileBackupWithNullMessageID);
    sqlite3_finalize(self->_stashSettingsSyncData);
    sqlite3_finalize(self->_getStashedSettingSyncData);
    sqlite3_finalize(self->_flushStashedSettingSyncData);
    sqlite3_finalize(self->_purgeMessageTypeTable);
    sqlite3_finalize(self->_purgeSettingsSyncTable);
    sqlite3_finalize(self->_purgeSettingsBackupTable);
    sqlite3_finalize(self->_purgeFileBackupTable);
    sqlite3_close(self->_db);
    self->_db = 0;
  }
}

- (BOOL)setMessageType:(int)a3 forMessageID:(id)a4
{
  sub_10001A1BC(self->_setMessageTypeForMessageID, 1, a4);
  sqlite3_bind_int(self->_setMessageTypeForMessageID, 2, a3);
  int v6 = sqlite3_step(self->_setMessageTypeForMessageID);
  sqlite3_reset(self->_setMessageTypeForMessageID);
  sqlite3_clear_bindings(self->_setMessageTypeForMessageID);
  if ((v6 & 0xFFFFFFFE) != 0x64)
  {
    unsigned int v7 = sqlite3_errmsg(self->_db);
    v8 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "(nil)";
      if (v7) {
        v9 = v7;
      }
      v11[0] = 67109378;
      v11[1] = v6;
      __int16 v12 = 2080;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)v11, 0x12u);
    }
    if (v6 >= 102 && v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0) {
      sub_10001F450(v6);
    }
  }
  return (v6 & 0xFFFFFFFE) == 100;
}

- (BOOL)getMessageType:(int *)a3 forMessageID:(id)a4
{
  sub_10001A1BC(self->_getMessageTypeForMessageID, 1, a4);
  int v6 = sqlite3_step(self->_getMessageTypeForMessageID);
  int v7 = v6;
  if (v6 == 100)
  {
    *a3 = sqlite3_column_int(self->_getMessageTypeForMessageID, 0);
  }
  else if (v6 != 101)
  {
    v8 = sqlite3_errmsg(self->_db);
    v9 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = "(nil)";
      if (v8) {
        objc_super v10 = v8;
      }
      v12[0] = 67109378;
      v12[1] = v7;
      __int16 v13 = 2080;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)v12, 0x12u);
    }
    if (v7 >= 102 && v7 <= 0xEu && ((1 << v7) & 0x4D70) != 0) {
      sub_10001F450(v7);
    }
  }
  sqlite3_reset(self->_getMessageTypeForMessageID);
  sqlite3_clear_bindings(self->_getMessageTypeForMessageID);
  return v7 == 100;
}

- (BOOL)removeMessageFromMessageTypeTable:(id)a3
{
  sub_10001A1BC(self->_removeMessageFromMessageTypeTable, 1, a3);
  int v4 = sqlite3_step(self->_removeMessageFromMessageTypeTable);
  unsigned int v5 = v4 & 0xFFFFFFFE;
  if ((v4 & 0xFFFFFFFE) != 0x64)
  {
    int v6 = v4;
    int v7 = sqlite3_errmsg(self->_db);
    v8 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = "(nil)";
      if (v7) {
        v9 = v7;
      }
      v13[0] = 67109378;
      v13[1] = v6;
      __int16 v14 = 2080;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)v13, 0x12u);
    }
    if (v6 >= 102 && v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0) {
      sub_10001F450(v6);
    }
  }
  sqlite3_reset(self->_removeMessageFromMessageTypeTable);
  sqlite3_clear_bindings(self->_removeMessageFromMessageTypeTable);
  return v5 == 100;
}

- (void)sentSettingsSyncMessage:(id)a3 forDomain:(id)a4 keys:(id)a5 cloudEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (!v13)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v18 = v12;
    id v19 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          sub_10001A1BC(self->_setMessageIDForSettingSync, 1, v11);
          sub_10001A1BC(self->_setMessageIDForSettingSync, 2, v23);
          sub_10001A1BC(self->_setMessageIDForSettingSync, 3, v10);
          sqlite3_bind_int(self->_setMessageIDForSettingSync, 4, v6);
          int v24 = sqlite3_step(self->_setMessageIDForSettingSync);
          sqlite3_reset(self->_setMessageIDForSettingSync);
          sqlite3_clear_bindings(self->_setMessageIDForSettingSync);
          if ((v24 - 102) <= 0xFFFFFFFD)
          {
            v30 = sqlite3_errmsg(self->_db);
            v31 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              v32 = "(nil)";
              if (v30) {
                v32 = v30;
              }
              *(_DWORD *)buf = 67109378;
              int v39 = v24;
              __int16 v40 = 2080;
              v41 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
            }
            if (v24 >= 102 && v24 <= 0xEu && ((1 << v24) & 0x4D70) != 0) {
              sub_10001F450(v24);
            }
            sub_10001A900(self->_db, "ROLLBACK TRANSACTION", (void)v33);

            goto LABEL_39;
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    if (!v10
      || -[NPSDatabase setMessageType:forMessageID:](self, "setMessageType:forMessageID:", 0, v10, (void)v33))
    {
      int v25 = sub_10001A900(self->_db, "COMMIT TRANSACTION", (void)v33);
      if (!v25) {
        goto LABEL_39;
      }
      int v26 = v25;
      v27 = sqlite3_errmsg(self->_db);
      v28 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v29 = "(nil)";
        if (v27) {
          v29 = v27;
        }
        *(_DWORD *)buf = 67109378;
        int v39 = v26;
        __int16 v40 = 2080;
        v41 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
      }
      if (v26 >= 102 && v26 <= 0xEu && ((1 << v26) & 0x4D70) != 0) {
        sub_10001F450(v26);
      }
    }
    sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
    goto LABEL_39;
  }
  int v14 = v13;
  v15 = sqlite3_errmsg(self->_db);
  v16 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    v17 = "(nil)";
    if (v15) {
      v17 = v15;
    }
    *(_DWORD *)buf = 67109378;
    int v39 = v14;
    __int16 v40 = 2080;
    v41 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
  }
  if (v14 >= 102 && v14 <= 0xEu && ((1 << v14) & 0x4D70) != 0) {
    sub_10001F450(v14);
  }
LABEL_39:
}

- (void)untrackSettingsSyncMessagesForDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v10)
  {
    int v11 = v10;
    id v12 = sqlite3_errmsg(self->_db);
    int v13 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = "(nil)";
      if (v12) {
        int v14 = v12;
      }
      *(_DWORD *)buf = 67109378;
      int v38 = v11;
      __int16 v39 = 2080;
      __int16 v40 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v11 >= 102 && v11 <= 0xEu && ((1 << v11) & 0x4D70) != 0) {
      sub_10001F450(v11);
    }
  }
  else
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v9;
    id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          sub_10001A1BC(self->_untrackSettingsSyncMessage, 1, v8);
          sub_10001A1BC(self->_untrackSettingsSyncMessage, 2, v22);
          sqlite3_bind_int(self->_untrackSettingsSyncMessage, 3, v5);
          int v23 = sqlite3_step(self->_untrackSettingsSyncMessage);
          sqlite3_reset(self->_untrackSettingsSyncMessage);
          sqlite3_clear_bindings(self->_untrackSettingsSyncMessage);
          if ((v23 - 102) <= 0xFFFFFFFD)
          {
            v29 = sqlite3_errmsg(self->_db);
            v30 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              v31 = "(nil)";
              if (v29) {
                v31 = v29;
              }
              *(_DWORD *)buf = 67109378;
              int v38 = v23;
              __int16 v39 = 2080;
              __int16 v40 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
            }
            if (v23 >= 102 && v23 <= 0xEu && ((1 << v23) & 0x4D70) != 0) {
              sub_10001F450(v23);
            }
            sub_10001A900(self->_db, "ROLLBACK TRANSACTION", (void)v32);

            goto LABEL_41;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    int v24 = sub_10001A900(self->_db, "COMMIT TRANSACTION", (void)v32);
    if (v24)
    {
      int v25 = v24;
      int v26 = sqlite3_errmsg(self->_db);
      v27 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v28 = "(nil)";
        if (v26) {
          v28 = v26;
        }
        *(_DWORD *)buf = 67109378;
        int v38 = v25;
        __int16 v39 = 2080;
        __int16 v40 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
      }
      if (v25 >= 102 && v25 <= 0xEu && ((1 << v25) & 0x4D70) != 0) {
        sub_10001F450(v25);
      }
      sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
    }
  }
LABEL_41:
}

- (void)sentSettingsBackupMessage:(id)a3 forContainer:(id)a4 domain:(id)a5 keys:(id)a6
{
  id v10 = a3;
  int v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v14)
  {
    int v15 = v14;
    v16 = sqlite3_errmsg(self->_db);
    id v17 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = "(nil)";
      if (v16) {
        id v18 = v16;
      }
      *(_DWORD *)buf = 67109378;
      int v43 = v15;
      __int16 v44 = 2080;
      v45 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v15 >= 102 && v15 <= 0xEu && ((1 << v15) & 0x4D70) != 0) {
      sub_10001F450(v15);
    }
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v36 = v13;
    id v19 = v13;
    id v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v38;
      if (v11) {
        int v23 = v11;
      }
      else {
        int v23 = &stru_10003DD30;
      }
      while (2)
      {
        int v24 = v11;
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v19);
          }
          int v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          sub_10001A1BC(self->_setMessageIDForSettingBackup, 1, v23);
          sub_10001A1BC(self->_setMessageIDForSettingBackup, 2, v12);
          sub_10001A1BC(self->_setMessageIDForSettingBackup, 3, v26);
          sub_10001A1BC(self->_setMessageIDForSettingBackup, 4, v10);
          int v27 = sqlite3_step(self->_setMessageIDForSettingBackup);
          sqlite3_reset(self->_setMessageIDForSettingBackup);
          sqlite3_clear_bindings(self->_setMessageIDForSettingBackup);
          if ((v27 - 102) <= 0xFFFFFFFD)
          {
            long long v33 = sqlite3_errmsg(self->_db);
            long long v34 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              long long v35 = "(nil)";
              if (v33) {
                long long v35 = v33;
              }
              *(_DWORD *)buf = 67109378;
              int v43 = v27;
              __int16 v44 = 2080;
              v45 = v35;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
            }
            int v11 = v24;
            if (v27 >= 102 && v27 <= 0xEu && ((1 << v27) & 0x4D70) != 0) {
              sub_10001F450(v27);
            }
            sub_10001A900(self->_db, "ROLLBACK TRANSACTION");

            goto LABEL_41;
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
        int v11 = v24;
        if (v21) {
          continue;
        }
        break;
      }
    }

    if (v10 && ![(NPSDatabase *)self setMessageType:1 forMessageID:v10])
    {
      sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
LABEL_41:
      id v13 = v36;
    }
    else
    {
      int v28 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
      id v13 = v36;
      if (v28)
      {
        int v29 = v28;
        v30 = sqlite3_errmsg(self->_db);
        v31 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          long long v32 = "(nil)";
          if (v30) {
            long long v32 = v30;
          }
          *(_DWORD *)buf = 67109378;
          int v43 = v29;
          __int16 v44 = 2080;
          v45 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
        }
        if (v29 >= 102 && v29 <= 0xEu && ((1 << v29) & 0x4D70) != 0) {
          sub_10001F450(v29);
        }
        sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
      }
    }
  }
}

- (void)untrackSettingsBackupMessageForContainer:(id)a3 domain:(id)a4 keys:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v11)
  {
    int v12 = v11;
    id v13 = sqlite3_errmsg(self->_db);
    int v14 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = "(nil)";
      if (v13) {
        int v15 = v13;
      }
      *(_DWORD *)buf = 67109378;
      int v37 = v12;
      __int16 v38 = 2080;
      long long v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v12 >= 102 && v12 <= 0xEu && ((1 << v12) & 0x4D70) != 0) {
      sub_10001F450(v12);
    }
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = v10;
    id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v32;
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          sub_10001A1BC(self->_untrackSettingsBackupMessage, 1, v8);
          sub_10001A1BC(self->_untrackSettingsBackupMessage, 2, v9);
          sub_10001A1BC(self->_untrackSettingsBackupMessage, 3, v21);
          int v22 = sqlite3_step(self->_untrackSettingsBackupMessage);
          sqlite3_reset(self->_untrackSettingsBackupMessage);
          sqlite3_clear_bindings(self->_untrackSettingsBackupMessage);
          if ((v22 - 102) <= 0xFFFFFFFD)
          {
            int v28 = sqlite3_errmsg(self->_db);
            int v29 = nps_daemon_log;
            if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              v30 = "(nil)";
              if (v28) {
                v30 = v28;
              }
              *(_DWORD *)buf = 67109378;
              int v37 = v22;
              __int16 v38 = 2080;
              long long v39 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
            }
            if (v22 >= 102 && v22 <= 0xEu && ((1 << v22) & 0x4D70) != 0) {
              sub_10001F450(v22);
            }
            sub_10001A900(self->_db, "ROLLBACK TRANSACTION", (void)v31);

            goto LABEL_37;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    int v23 = sub_10001A900(self->_db, "COMMIT TRANSACTION", (void)v31);
    if (v23)
    {
      int v24 = v23;
      int v25 = sqlite3_errmsg(self->_db);
      int v26 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = "(nil)";
        if (v25) {
          int v27 = v25;
        }
        *(_DWORD *)buf = 67109378;
        int v37 = v24;
        __int16 v38 = 2080;
        long long v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
      }
      if (v24 >= 102 && v24 <= 0xEu && ((1 << v24) & 0x4D70) != 0) {
        sub_10001F450(v24);
      }
      sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
    }
  }
LABEL_37:
}

- (void)sentFileBackupMessage:(id)a3 forFileAtPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (!v8)
  {
    sub_10001A1BC(self->_setMessageIDForFileBackup, 1, v7);
    sub_10001A1BC(self->_setMessageIDForFileBackup, 2, v6);
    int v15 = sqlite3_step(self->_setMessageIDForFileBackup);
    sqlite3_reset(self->_setMessageIDForFileBackup);
    sqlite3_clear_bindings(self->_setMessageIDForFileBackup);
    if ((v15 - 102) > 0xFFFFFFFD)
    {
      if (v6 && ![(NPSDatabase *)self setMessageType:2 forMessageID:v6])
      {
LABEL_30:
        sub_10001A900(self->_db, "ROLLBACK TRANSACTION", v21, v22);
        goto LABEL_31;
      }
      int v19 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
      if (!v19) {
        goto LABEL_31;
      }
      int v15 = v19;
      id v20 = sqlite3_errmsg(self->_db);
      id v17 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = "(nil)";
        if (v20) {
          id v18 = v20;
        }
        goto LABEL_25;
      }
    }
    else
    {
      id v16 = sqlite3_errmsg(self->_db);
      id v17 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = "(nil)";
        if (v16) {
          id v18 = v16;
        }
LABEL_25:
        LODWORD(v21) = 67109378;
        HIDWORD(v21) = v15;
        LOWORD(v22) = 2080;
        *(void *)((char *)&v22 + 2) = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v21, 0x12u);
      }
    }
    if (v15 >= 102 && v15 <= 0xEu && ((1 << v15) & 0x4D70) != 0) {
      sub_10001F450(v15);
    }
    goto LABEL_30;
  }
  int v9 = v8;
  id v10 = sqlite3_errmsg(self->_db);
  int v11 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = "(nil)";
    if (v10) {
      int v12 = v10;
    }
    LODWORD(v21) = 67109378;
    HIDWORD(v21) = v9;
    LOWORD(v22) = 2080;
    *(void *)((char *)&v22 + 2) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v21, 0x12u);
  }
  if (v9 >= 102 && v9 <= 0xEu && ((1 << v9) & 0x4D70) != 0) {
    sub_10001F450(v9);
  }
LABEL_31:
}

- (void)untrackFileBackupMessageForFileAtPath:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v5)
  {
    int v6 = v5;
    id v7 = sqlite3_errmsg(self->_db);
    int v8 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = "(nil)";
      if (v7) {
        int v9 = v7;
      }
      LODWORD(v19) = 67109378;
      HIDWORD(v19) = v6;
      LOWORD(v20) = 2080;
      *(void *)((char *)&v20 + 2) = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v19, 0x12u);
    }
    if (v6 >= 102 && v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0) {
      sub_10001F450(v6);
    }
    goto LABEL_29;
  }
  sub_10001A1BC(self->_untrackFileBackupMessage, 1, v4);
  int v12 = sqlite3_step(self->_untrackFileBackupMessage);
  sqlite3_reset(self->_untrackFileBackupMessage);
  sqlite3_clear_bindings(self->_untrackFileBackupMessage);
  db = self->_db;
  if ((v12 - 102) > 0xFFFFFFFD)
  {
    int v17 = sub_10001A900(db, "COMMIT TRANSACTION");
    if (!v17) {
      goto LABEL_29;
    }
    int v12 = v17;
    id v18 = sqlite3_errmsg(self->_db);
    int v15 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v16 = "(nil)";
    if (v18) {
      id v16 = v18;
    }
  }
  else
  {
    int v14 = sqlite3_errmsg(db);
    int v15 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v16 = "(nil)";
    if (v14) {
      id v16 = v14;
    }
  }
  LODWORD(v19) = 67109378;
  HIDWORD(v19) = v12;
  LOWORD(v20) = 2080;
  *(void *)((char *)&v20 + 2) = v16;
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v19, 0x12u);
LABEL_24:
  if (v12 >= 102 && v12 <= 0xEu && ((1 << v12) & 0x4D70) != 0) {
    sub_10001F450(v12);
  }
  sub_10001A900(self->_db, "ROLLBACK TRANSACTION", v19, v20);
LABEL_29:
}

- (void)messageWasDelivered:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v5)
  {
    int v6 = v5;
    id v7 = sqlite3_errmsg(self->_db);
    int v8 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = "(nil)";
      if (v7) {
        int v9 = v7;
      }
      *(_DWORD *)buf = 67109378;
      int v27 = v6;
      __int16 v28 = 2080;
      int v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v6 >= 102 && v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0) {
      sub_10001F450(v6);
    }
    goto LABEL_43;
  }
  unsigned int v25 = 0;
  if ([(NPSDatabase *)self getMessageType:&v25 forMessageID:v4])
  {
    if (v25 >= 3) {
      abort();
    }
    int v12 = (sqlite3_stmt *)*((void *)&self->_untrackSettingsSyncForMessageID + v25);
    sub_10001A1BC(v12, 1, v4);
    int v13 = sqlite3_step(v12);
    if ((v13 & 0xFFFFFFFE) == 0x64)
    {
      if ([(NPSDatabase *)self removeMessageFromMessageTypeTable:v4]) {
        goto LABEL_32;
      }
    }
    else
    {
      int v14 = v13;
      int v15 = sqlite3_errmsg(self->_db);
      id v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = "(nil)";
        if (v15) {
          int v17 = v15;
        }
        *(_DWORD *)buf = 67109378;
        int v27 = v14;
        __int16 v28 = 2080;
        int v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
      }
      if (v14 >= 102 && v14 <= 0xEu && ((1 << v14) & 0x4D70) != 0) {
        sub_10001F450(v14);
      }
    }
    sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
LABEL_32:
    sqlite3_reset(v12);
    sqlite3_clear_bindings(v12);
  }
  int v20 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
  if (v20)
  {
    int v21 = v20;
    long long v22 = sqlite3_errmsg(self->_db);
    int v23 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = "(nil)";
      if (v22) {
        int v24 = v22;
      }
      *(_DWORD *)buf = 67109378;
      int v27 = v21;
      __int16 v28 = 2080;
      int v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v21 >= 102 && v21 <= 0xEu && ((1 << v21) & 0x4D70) != 0) {
      sub_10001F450(v21);
    }
    sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
  }
LABEL_43:
}

- (void)messageWasPurged:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v5)
  {
    int v6 = v5;
    id v7 = sqlite3_errmsg(self->_db);
    int v8 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = "(nil)";
      if (v7) {
        int v9 = v7;
      }
      *(_DWORD *)buf = 67109378;
      int v27 = v6;
      __int16 v28 = 2080;
      int v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v6 >= 102 && v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0) {
      sub_10001F450(v6);
    }
    goto LABEL_43;
  }
  unsigned int v25 = 0;
  if ([(NPSDatabase *)self getMessageType:&v25 forMessageID:v4])
  {
    if (v25 >= 3) {
      abort();
    }
    int v12 = (sqlite3_stmt *)*((void *)&self->_setNullMessageIDForSettingSync + v25);
    sub_10001A1BC(v12, 1, v4);
    int v13 = sqlite3_step(v12);
    if ((v13 & 0xFFFFFFFE) == 0x64)
    {
      if ([(NPSDatabase *)self removeMessageFromMessageTypeTable:v4]) {
        goto LABEL_32;
      }
    }
    else
    {
      int v14 = v13;
      int v15 = sqlite3_errmsg(self->_db);
      id v16 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = "(nil)";
        if (v15) {
          int v17 = v15;
        }
        *(_DWORD *)buf = 67109378;
        int v27 = v14;
        __int16 v28 = 2080;
        int v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
      }
      if (v14 >= 102 && v14 <= 0xEu && ((1 << v14) & 0x4D70) != 0) {
        sub_10001F450(v14);
      }
    }
    sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
LABEL_32:
    sqlite3_reset(v12);
    sqlite3_clear_bindings(v12);
  }
  int v20 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
  if (v20)
  {
    int v21 = v20;
    long long v22 = sqlite3_errmsg(self->_db);
    int v23 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = "(nil)";
      if (v22) {
        int v24 = v22;
      }
      *(_DWORD *)buf = 67109378;
      int v27 = v21;
      __int16 v28 = 2080;
      int v29 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v21 >= 102 && v21 <= 0xEu && ((1 << v21) & 0x4D70) != 0) {
      sub_10001F450(v21);
    }
    sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
  }
LABEL_43:
}

- (void)getSettingsSyncDataForMessage:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  int v23 = v6;
  if (v6)
  {
    getSettingsSyncForMessageID = self->_getSettingsSyncForMessageID;
    sub_10001A1BC(getSettingsSyncForMessageID, 1, v6);
  }
  else
  {
    getSettingsSyncForMessageID = self->_getSettingsSyncWithNullMessageID;
  }
  int v8 = 0;
  int v9 = 0;
  while (1)
  {
    int v10 = sqlite3_step(getSettingsSyncForMessageID);
    if (v10 != 100) {
      break;
    }
    int v11 = sub_10001C544(getSettingsSyncForMessageID, 0);
    int v12 = sub_10001C544(getSettingsSyncForMessageID, 1);
    if (sqlite3_column_int(getSettingsSyncForMessageID, 2))
    {
      if (v8)
      {
        int v13 = v8;
      }
      else
      {
        int v13 = objc_opt_new();
        int v8 = v13;
      }
    }
    else if (v9)
    {
      int v13 = v9;
    }
    else
    {
      int v13 = objc_opt_new();
      int v9 = v13;
    }
    id v14 = v13;
    int v15 = objc_msgSend(v14, "objectForKeyedSubscript:", v11, v22, v23);
    if (!v15)
    {
      int v15 = objc_opt_new();
      [v14 setObject:v15 forKeyedSubscript:v11];
    }
    [v15 addObject:v12];
  }
  int v16 = v10;
  if (v10 != 101)
  {
    int v17 = sqlite3_errmsg(self->_db);
    id v18 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = "(nil)";
      if (v17) {
        uint64_t v19 = v17;
      }
      *(_DWORD *)buf = 67109378;
      int v29 = v16;
      __int16 v30 = 2080;
      long long v31 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v16 >= 102 && v16 <= 0xEu && ((1 << v16) & 0x4D70) != 0) {
      sub_10001F450(v16);
    }
  }
  sqlite3_reset(getSettingsSyncForMessageID);
  sqlite3_clear_bindings(getSettingsSyncForMessageID);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10001C584;
  v26[3] = &unk_10003D2A8;
  id v20 = v22;
  id v27 = v20;
  [v9 enumerateKeysAndObjectsUsingBlock:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001C598;
  v24[3] = &unk_10003D2A8;
  id v25 = v20;
  id v21 = v20;
  [v8 enumerateKeysAndObjectsUsingBlock:v24];
}

- (void)getSettingsBackupDataForMessage:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  if (v6)
  {
    getSettingsBackupForMessageID = self->_getSettingsBackupForMessageID;
    sub_10001A1BC(getSettingsBackupForMessageID, 1, v6);
  }
  else
  {
    getSettingsBackupForMessageID = self->_getSettingsBackupWithNullMessageID;
  }
  int v8 = 0;
  while (1)
  {
    int v9 = sqlite3_step(getSettingsBackupForMessageID);
    if (v9 != 100) {
      break;
    }
    int v10 = sub_10001C544(getSettingsBackupForMessageID, 0);
    int v11 = sub_10001C544(getSettingsBackupForMessageID, 1);
    int v12 = sub_10001C544(getSettingsBackupForMessageID, 2);
    if (!v8) {
      int v8 = objc_opt_new();
    }
    int v13 = [v8 objectForKeyedSubscript:v10];
    if (!v13)
    {
      int v13 = objc_opt_new();
      [v8 setObject:v13 forKeyedSubscript:v10];
    }
    id v14 = [v13 objectForKeyedSubscript:v11];
    if (!v14)
    {
      id v14 = objc_opt_new();
      [v13 setObject:v14 forKeyedSubscript:v11];
    }
    [v14 addObject:v12];
  }
  int v15 = v9;
  if (v9 != 101)
  {
    int v16 = sqlite3_errmsg(self->_db);
    int v17 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = "(nil)";
      if (v16) {
        id v18 = v16;
      }
      *(_DWORD *)buf = 67109378;
      int v24 = v15;
      __int16 v25 = 2080;
      int v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v15 >= 102 && v15 <= 0xEu && ((1 << v15) & 0x4D70) != 0) {
      sub_10001F450(v15);
    }
  }
  sqlite3_reset(getSettingsBackupForMessageID);
  sqlite3_clear_bindings(getSettingsBackupForMessageID);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001C884;
  v21[3] = &unk_10003D2F8;
  id v22 = v20;
  id v19 = v20;
  [v8 enumerateKeysAndObjectsUsingBlock:v21];
}

- (void)getFileBackupDataForMessage:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (v6)
  {
    getFileBackupForMessageID = self->_getFileBackupForMessageID;
    sub_10001A1BC(getFileBackupForMessageID, 1, v6);
  }
  else
  {
    getFileBackupForMessageID = self->_getFileBackupWithNullMessageID;
  }
  int v9 = 0;
  while (1)
  {
    int v10 = sqlite3_step(getFileBackupForMessageID);
    if (v10 != 100) {
      break;
    }
    int v11 = sub_10001C544(getFileBackupForMessageID, 0);
    if (!v9) {
      int v9 = objc_opt_new();
    }
    [v9 addObject:v11];
  }
  int v12 = v10;
  if (v10 != 101)
  {
    int v13 = sqlite3_errmsg(self->_db);
    id v14 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = "(nil)";
      if (v13) {
        int v15 = v13;
      }
      *(_DWORD *)buf = 67109378;
      int v27 = v12;
      __int16 v28 = 2080;
      int v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
    }
    if (v12 >= 102 && v12 <= 0xEu && ((1 << v12) & 0x4D70) != 0) {
      sub_10001F450(v12);
    }
  }
  sqlite3_reset(getFileBackupForMessageID);
  sqlite3_clear_bindings(getFileBackupForMessageID);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        v7[2](v7, *(void *)(*((void *)&v21 + 1) + 8 * i));
      }
      id v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }
}

- (void)stashSettingsSyncData:(id)a3 forDomain:(id)a4 key:(id)a5 isTwoWaySync:(BOOL)a6 timestamp:(double)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v15)
  {
    int v16 = v15;
    id v17 = sqlite3_errmsg(self->_db);
    id v18 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = "(nil)";
      if (v17) {
        uint64_t v19 = v17;
      }
      LODWORD(v31) = 67109378;
      HIDWORD(v31) = v16;
      LOWORD(v32) = 2080;
      *(void *)((char *)&v32 + 2) = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v31, 0x12u);
    }
    if (v16 >= 102 && v16 <= 0xEu && ((1 << v16) & 0x4D70) != 0) {
      sub_10001F450(v16);
    }
    goto LABEL_28;
  }
  sub_10001A1BC(self->_stashSettingsSyncData, 1, v13);
  sub_10001A1BC(self->_stashSettingsSyncData, 2, v14);
  stashSettingsSyncData = self->_stashSettingsSyncData;
  id v21 = v12;
  long long v22 = v21;
  if (v21)
  {
    id v23 = v21;
    sqlite3_bind_blob(stashSettingsSyncData, 3, [v23 bytes], (int)objc_msgSend(v23, "length"), 0);
  }
  else
  {
    sqlite3_bind_null(stashSettingsSyncData, 3);
  }

  sqlite3_bind_int(self->_stashSettingsSyncData, 4, v8);
  sqlite3_bind_double(self->_stashSettingsSyncData, 5, a7);
  int v24 = sqlite3_step(self->_stashSettingsSyncData);
  if ((v24 - 102) > 0xFFFFFFFD)
  {
    sqlite3_reset(self->_stashSettingsSyncData);
    sqlite3_clear_bindings(self->_stashSettingsSyncData);
    int v29 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
    if (!v29) {
      goto LABEL_28;
    }
    int v25 = v29;
    __int16 v30 = sqlite3_errmsg(self->_db);
    int v27 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v28 = "(nil)";
    if (v30) {
      __int16 v28 = v30;
    }
  }
  else
  {
    int v25 = v24;
    int v26 = sqlite3_errmsg(self->_db);
    int v27 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    __int16 v28 = "(nil)";
    if (v26) {
      __int16 v28 = v26;
    }
  }
  LODWORD(v31) = 67109378;
  HIDWORD(v31) = v25;
  LOWORD(v32) = 2080;
  *(void *)((char *)&v32 + 2) = v28;
  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v31, 0x12u);
LABEL_23:
  if (v25 >= 102 && v25 <= 0xEu && ((1 << v25) & 0x4D70) != 0) {
    sub_10001F450(v25);
  }
  sub_10001A900(self->_db, "ROLLBACK TRANSACTION", v31, v32);
LABEL_28:
}

- (void)getStashedSettingsSyncDataWithHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void *, void *, BOOL, __n128))a3;
  while (1)
  {
    int v5 = sqlite3_step(self->_getStashedSettingSyncData);
    if (v5 != 100) {
      break;
    }
    id v6 = sub_10001C544(self->_getStashedSettingSyncData, 0);
    id v7 = sub_10001C544(self->_getStashedSettingSyncData, 1);
    getStashedSettingSyncData = self->_getStashedSettingSyncData;
    int v9 = sqlite3_column_bytes(getStashedSettingSyncData, 2);
    int v10 = sqlite3_column_blob(getStashedSettingSyncData, 2);
    if (v9 < 1)
    {
      int v11 = 0;
    }
    else
    {
      int v11 = +[NSData dataWithBytes:v10 length:v9];
    }
    BOOL v12 = sqlite3_column_int(self->_getStashedSettingSyncData, 3) != 0;
    if (sqlite3_column_double(self->_getStashedSettingSyncData, 4) == 0.0) {
      v13.n128_f64[0] = 0.0;
    }
    else {
      v13.n128_f64[0] = 1.0;
    }
    v4[2](v4, v6, v7, v11, v12, v13);
  }
  int v14 = v5;
  if (v5 != 101)
  {
    int v15 = sqlite3_errmsg(self->_db);
    int v16 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = "(nil)";
      if (v15) {
        id v17 = v15;
      }
      v20[0] = 67109378;
      v20[1] = v14;
      __int16 v21 = 2080;
      long long v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)v20, 0x12u);
    }
    if (v14 >= 102 && v14 <= 0xEu && ((1 << v14) & 0x4D70) != 0) {
      sub_10001F450(v14);
    }
  }
  sqlite3_reset(self->_getStashedSettingSyncData);
  sqlite3_clear_bindings(self->_getStashedSettingSyncData);
}

- (void)flushStashedSettingsSyncData
{
  int v3 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (v3)
  {
    int v4 = v3;
    int v5 = sqlite3_errmsg(self->_db);
    id v6 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "(nil)";
      if (v5) {
        id v7 = v5;
      }
      LODWORD(v17) = 67109378;
      HIDWORD(v17) = v4;
      LOWORD(v18) = 2080;
      *(void *)((char *)&v18 + 2) = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v17, 0x12u);
    }
    if (v4 >= 102 && v4 <= 0xEu && ((1 << v4) & 0x4D70) != 0) {
      sub_10001F450(v4);
    }
    return;
  }
  int v10 = sqlite3_step(self->_flushStashedSettingSyncData);
  if ((v10 - 102) > 0xFFFFFFFD)
  {
    sqlite3_reset(self->_flushStashedSettingSyncData);
    sqlite3_clear_bindings(self->_flushStashedSettingSyncData);
    int v15 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
    if (!v15) {
      return;
    }
    int v11 = v15;
    int v16 = sqlite3_errmsg(self->_db);
    __n128 v13 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    int v14 = "(nil)";
    if (v16) {
      int v14 = v16;
    }
  }
  else
  {
    int v11 = v10;
    BOOL v12 = sqlite3_errmsg(self->_db);
    __n128 v13 = nps_daemon_log;
    if (!os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    int v14 = "(nil)";
    if (v12) {
      int v14 = v12;
    }
  }
  LODWORD(v17) = 67109378;
  HIDWORD(v17) = v11;
  LOWORD(v18) = 2080;
  *(void *)((char *)&v18 + 2) = v14;
  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v17, 0x12u);
LABEL_24:
  if (v11 >= 102 && v11 <= 0xEu && ((1 << v11) & 0x4D70) != 0) {
    sub_10001F450(v11);
  }
  sub_10001A900(self->_db, "ROLLBACK TRANSACTION", v17, v18);
}

- (void)purgePendingOutgoingMessages
{
  int v3 = sub_10001A900(self->_db, "BEGIN EXCLUSIVE TRANSACTION");
  if (!v3)
  {
    uint64_t v10 = 0;
    long long v11 = *(_OWORD *)&self->_purgeSettingsBackupTable;
    *(_OWORD *)buf = *(_OWORD *)&self->_purgeMessageTypeTable;
    *(_OWORD *)&buf[16] = v11;
    while (1)
    {
      BOOL v12 = *(sqlite3_stmt **)&buf[v10];
      int v13 = sqlite3_step(v12);
      if ((v13 & 0xFFFFFFFE) != 0x64) {
        break;
      }
      sqlite3_reset(v12);
      sqlite3_clear_bindings(v12);
      v10 += 8;
      if (v10 == 32)
      {
        int v14 = sub_10001A900(self->_db, "COMMIT TRANSACTION");
        if (!v14) {
          return;
        }
        int v15 = v14;
        int v16 = sqlite3_errmsg(self->_db);
        uint64_t v17 = nps_daemon_log;
        if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          long long v18 = "(nil)";
          if (v16) {
            long long v18 = v16;
          }
          int v24 = 67109378;
          int v25 = v15;
          __int16 v26 = 2080;
          int v27 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v24, 0x12u);
        }
        if (v15 < 102 || v15 > 0xEu || ((1 << v15) & 0x4D70) == 0)
        {
LABEL_38:
          sub_10001A900(self->_db, "ROLLBACK TRANSACTION");
          return;
        }
LABEL_37:
        sub_10001F450(v15);
        goto LABEL_38;
      }
    }
    int v15 = v13;
    uint64_t v19 = sqlite3_errmsg(self->_db);
    id v20 = nps_daemon_log;
    if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = "(nil)";
      if (v19) {
        __int16 v21 = v19;
      }
      int v24 = 67109378;
      int v25 = v15;
      __int16 v26 = 2080;
      int v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v24, 0x12u);
    }
    if (v15 < 102 || v15 > 0xEu || ((1 << v15) & 0x4D70) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  int v4 = v3;
  int v5 = sqlite3_errmsg(self->_db);
  id v6 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "(nil)";
    if (v5) {
      id v7 = v5;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v4;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", buf, 0x12u);
  }
  if (v4 >= 102 && v4 <= 0xEu && ((1 << v4) & 0x4D70) != 0) {
    sub_10001F450(v4);
  }
}

- (int)_getSchemaVersion
{
  if (sqlite3_table_column_metadata(self->_db, 0, "meta", 0, 0, 0, 0, 0, 0)) {
    return 0;
  }
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", 25, &ppStmt, 0);
  if (!v5)
  {
    int v10 = sqlite3_step(ppStmt);
    int v3 = 0;
    if (!v10) {
      goto LABEL_27;
    }
    int v11 = v10;
    if (v10 == 101) {
      goto LABEL_27;
    }
    if (v10 == 100)
    {
      int v3 = sqlite3_column_int(ppStmt, 0);
    }
    else
    {
      BOOL v12 = sqlite3_errmsg(self->_db);
      int v13 = nps_daemon_log;
      if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = "Unknown Error";
        if (v12) {
          int v14 = v12;
        }
        *(_DWORD *)buf = 67109378;
        int v17 = v11;
        __int16 v18 = 2080;
        uint64_t v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error fetching schema version: %d (%s)", buf, 0x12u);
      }
      if (v11 >= 102)
      {
        int v3 = 0;
        if (v11 > 0xEu || ((1 << v11) & 0x4D70) == 0) {
          goto LABEL_27;
        }
        sub_10001F450(v11);
      }
      int v3 = 0;
    }
LABEL_27:
    sqlite3_finalize(ppStmt);
    return v3;
  }
  int v6 = v5;
  if (v5 == 1) {
    return 0;
  }
  id v7 = sqlite3_errmsg(self->_db);
  BOOL v8 = nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = "Unknown Error";
    if (v7) {
      int v9 = v7;
    }
    *(_DWORD *)buf = 67109378;
    int v17 = v6;
    __int16 v18 = 2080;
    uint64_t v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error fetching schema version: %d (%s)", buf, 0x12u);
  }
  if (v6 < 102) {
    return 0;
  }
  int v3 = 0;
  if (v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0)
  {
    sub_10001F450(v6);
    return 0;
  }
  return v3;
}

- (BOOL)_openDBAtPath:(id)a3
{
  id v4 = a3;
  p_db = &self->_db;
  int v6 = sqlite3_open_v2((const char *)[v4 fileSystemRepresentation], &self->_db, 4194310, 0);
  if (!v6 && *p_db) {
    goto LABEL_276;
  }
  id v7 = nps_daemon_log;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (*p_db) {
      BOOL v8 = sqlite3_errmsg(*p_db);
    }
    else {
      BOOL v8 = "";
    }
    int v153 = 138412802;
    *(void *)v154 = v4;
    *(_WORD *)&v154[8] = 1024;
    *(_DWORD *)&v154[10] = v6;
    __int16 v155 = 2080;
    v156 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error opening SQLite3 DB at (%@): (%d) %s", (uint8_t *)&v153, 0x1Cu);
  }

  if (v6 >= 102 && v6 <= 0xEu && ((1 << v6) & 0x4D70) != 0) {
    sub_10001F450(v6);
  }
  if (*p_db)
  {
    sqlite3_close(*p_db);
    BOOL v9 = 0;
    *p_db = 0;
  }
  else
  {
LABEL_276:
    int v10 = (NSString *)[v4 copy];
    path = self->_path;
    self->_path = v10;

    sub_10001A900(self->_db, "PRAGMA journal_mode=WAL;");
    sqlite3_busy_timeout(self->_db, 60000);
    sqlite3_extended_result_codes(self->_db, 1);
    switch([(NPSDatabase *)self _getSchemaVersion])
    {
      case 0:
        sub_10001A900(*p_db, "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp REAL)");
        sub_10001A900(*p_db, "CREATE TABLE IF NOT EXISTS sync_msgs (domain TEXT NOT NULL, key TEXT NOT NULL, messageID TEXT, PRIMARY KEY(domain, key))");
        sub_10001A900(*p_db, "CREATE TABLE IF NOT EXISTS backup_msgs (container TEXT NOT NULL DEFAULT (''), domain TEXT NOT NULL, key TEXT NOT NULL, messageID TEXT, PRIMARY KEY(container, domain, key))");
        sub_10001A900(*p_db, "CREATE TABLE IF NOT EXISTS msgs_type (messageID TEXT NOT NULL PRIMARY KEY, type INTEGER NOT NULL)");
        sub_10001A900(*p_db, "CREATE INDEX sync_msgs_messageID_idx ON sync_msgs (messageID ASC)");
        sub_10001A900(*p_db, "CREATE INDEX backup_msgs_messageID_idx ON backup_msgs (messageID ASC)");
        sub_10001A900(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_17;
      case 1:
LABEL_17:
        sub_10001A900(*p_db, "CREATE TABLE IF NOT EXISTS file_backup_msgs (path TEXT NOT NULL, messageID TEXT, PRIMARY KEY(path))");
        sub_10001A900(*p_db, "CREATE INDEX file_backup_msgs_messageID_idx ON file_backup_msgs (messageID ASC)");
        sub_10001A900(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_18;
      case 2:
LABEL_18:
        sub_10001A900(*p_db, "CREATE TABLE IF NOT EXISTS stashed_sync_msgs (domain TEXT NOT NULL, key TEXT NOT NULL, data BLOB, two_way_sync INTEGER, timestamp DOUBLE, PRIMARY KEY(domain, key))");
        sub_10001A900(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        goto LABEL_19;
      case 3:
LABEL_19:
        sub_10001A900(*p_db, "ALTER TABLE sync_msgs ADD COLUMN cloudEnabled INTEGER");
        sub_10001A900(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
        break;
      default:
        break;
    }
    int v12 = sqlite3_prepare_v2(self->_db, "SELECT type FROM msgs_type WHERE messageID=?", -1, &self->_getMessageTypeForMessageID, 0);
    if (v12)
    {
      int v13 = v12;
      int v14 = sqlite3_errmsg(*p_db);
      int v15 = nps_daemon_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = "(nil)";
        if (v14) {
          int v16 = v14;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v13;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v13 >= 102 && v13 <= 0xEu && ((1 << v13) & 0x4D70) != 0) {
        sub_10001F450(v13);
      }
    }
    int v17 = sqlite3_prepare_v2(self->_db, "INSERT INTO msgs_type (messageID, type) VALUES (?, ?)", -1, &self->_setMessageTypeForMessageID, 0);
    if (v17)
    {
      int v18 = v17;
      uint64_t v19 = sqlite3_errmsg(*p_db);
      id v20 = nps_daemon_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = "(nil)";
        if (v19) {
          __int16 v21 = v19;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v18;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v18 >= 102 && v18 <= 0xEu && ((1 << v18) & 0x4D70) != 0) {
        sub_10001F450(v18);
      }
    }
    int v22 = sqlite3_prepare_v2(self->_db, "INSERT OR REPLACE INTO sync_msgs (domain, key, messageID, cloudEnabled) VALUES (?, ?, ?, ?)", -1, &self->_setMessageIDForSettingSync, 0);
    if (v22)
    {
      int v23 = v22;
      int v24 = sqlite3_errmsg(*p_db);
      int v25 = nps_daemon_log;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = "(nil)";
        if (v24) {
          __int16 v26 = v24;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v23;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v23 >= 102 && v23 <= 0xEu && ((1 << v23) & 0x4D70) != 0) {
        sub_10001F450(v23);
      }
    }
    int v27 = sqlite3_prepare_v2(self->_db, "INSERT OR REPLACE INTO backup_msgs (container, domain, key, messageID) VALUES (?, ?, ?, ?)", -1, &self->_setMessageIDForSettingBackup, 0);
    if (v27)
    {
      int v28 = v27;
      int v29 = sqlite3_errmsg(*p_db);
      __int16 v30 = nps_daemon_log;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v31 = "(nil)";
        if (v29) {
          uint64_t v31 = v29;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v28;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v28 >= 102 && v28 <= 0xEu && ((1 << v28) & 0x4D70) != 0) {
        sub_10001F450(v28);
      }
    }
    int v32 = sqlite3_prepare_v2(self->_db, "INSERT OR REPLACE INTO file_backup_msgs (path, messageID) VALUES (?, ?)", -1, &self->_setMessageIDForFileBackup, 0);
    if (v32)
    {
      int v33 = v32;
      long long v34 = sqlite3_errmsg(*p_db);
      long long v35 = nps_daemon_log;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = "(nil)";
        if (v34) {
          id v36 = v34;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v33;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v33 >= 102 && v33 <= 0xEu && ((1 << v33) & 0x4D70) != 0) {
        sub_10001F450(v33);
      }
    }
    int v37 = sqlite3_prepare_v2(self->_db, "DELETE FROM sync_msgs WHERE domain=? AND key=? AND cloudEnabled=?", -1, &self->_untrackSettingsSyncMessage, 0);
    if (v37)
    {
      int v38 = v37;
      long long v39 = sqlite3_errmsg(*p_db);
      long long v40 = nps_daemon_log;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = "(nil)";
        if (v39) {
          v41 = v39;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v38;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v38 >= 102 && v38 <= 0xEu && ((1 << v38) & 0x4D70) != 0) {
        sub_10001F450(v38);
      }
    }
    int v42 = sqlite3_prepare_v2(self->_db, "DELETE FROM backup_msgs WHERE container=? AND domain=? AND key=?", -1, &self->_untrackSettingsBackupMessage, 0);
    if (v42)
    {
      int v43 = v42;
      __int16 v44 = sqlite3_errmsg(*p_db);
      v45 = nps_daemon_log;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = "(nil)";
        if (v44) {
          v46 = v44;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v43;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v43 >= 102 && v43 <= 0xEu && ((1 << v43) & 0x4D70) != 0) {
        sub_10001F450(v43);
      }
    }
    int v47 = sqlite3_prepare_v2(self->_db, "DELETE FROM file_backup_msgs WHERE path=?", -1, &self->_untrackFileBackupMessage, 0);
    if (v47)
    {
      int v48 = v47;
      v49 = sqlite3_errmsg(*p_db);
      v50 = nps_daemon_log;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = "(nil)";
        if (v49) {
          v51 = v49;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v48;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v51;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v48 >= 102 && v48 <= 0xEu && ((1 << v48) & 0x4D70) != 0) {
        sub_10001F450(v48);
      }
    }
    int v52 = sqlite3_prepare_v2(self->_db, "DELETE FROM sync_msgs WHERE messageID=?", -1, &self->_untrackSettingsSyncForMessageID, 0);
    if (v52)
    {
      int v53 = v52;
      v54 = sqlite3_errmsg(*p_db);
      v55 = nps_daemon_log;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = "(nil)";
        if (v54) {
          v56 = v54;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v53;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v53 >= 102 && v53 <= 0xEu && ((1 << v53) & 0x4D70) != 0) {
        sub_10001F450(v53);
      }
    }
    int v57 = sqlite3_prepare_v2(self->_db, "DELETE FROM backup_msgs WHERE messageID=?", -1, &self->_untrackSettingsBackupForMessageID, 0);
    if (v57)
    {
      int v58 = v57;
      v59 = sqlite3_errmsg(*p_db);
      v60 = nps_daemon_log;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = "(nil)";
        if (v59) {
          v61 = v59;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v58;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v58 >= 102 && v58 <= 0xEu && ((1 << v58) & 0x4D70) != 0) {
        sub_10001F450(v58);
      }
    }
    int v62 = sqlite3_prepare_v2(self->_db, "DELETE FROM file_backup_msgs WHERE messageID=?", -1, &self->_untrackFileBackupForMessageID, 0);
    if (v62)
    {
      int v63 = v62;
      v64 = sqlite3_errmsg(*p_db);
      v65 = nps_daemon_log;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        v66 = "(nil)";
        if (v64) {
          v66 = v64;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v63;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v66;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v63 >= 102 && v63 <= 0xEu && ((1 << v63) & 0x4D70) != 0) {
        sub_10001F450(v63);
      }
    }
    int v67 = sqlite3_prepare_v2(self->_db, "DELETE FROM msgs_type WHERE messageID=?", -1, &self->_removeMessageFromMessageTypeTable, 0);
    if (v67)
    {
      int v68 = v67;
      v69 = sqlite3_errmsg(*p_db);
      v70 = nps_daemon_log;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = "(nil)";
        if (v69) {
          v71 = v69;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v68;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v71;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v68 >= 102 && v68 <= 0xEu && ((1 << v68) & 0x4D70) != 0) {
        sub_10001F450(v68);
      }
    }
    int v72 = sqlite3_prepare_v2(self->_db, "UPDATE sync_msgs SET messageID=NULL WHERE messageID=?", -1, &self->_setNullMessageIDForSettingSync, 0);
    if (v72)
    {
      int v73 = v72;
      v74 = sqlite3_errmsg(*p_db);
      v75 = nps_daemon_log;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = "(nil)";
        if (v74) {
          v76 = v74;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v73;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v76;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v73 >= 102 && v73 <= 0xEu && ((1 << v73) & 0x4D70) != 0) {
        sub_10001F450(v73);
      }
    }
    int v77 = sqlite3_prepare_v2(self->_db, "UPDATE backup_msgs SET messageID=NULL WHERE messageID=?", -1, &self->_setNullMessageIDForSettingBackup, 0);
    if (v77)
    {
      int v78 = v77;
      v79 = sqlite3_errmsg(*p_db);
      v80 = nps_daemon_log;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        v81 = "(nil)";
        if (v79) {
          v81 = v79;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v78;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v81;
        _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v78 >= 102 && v78 <= 0xEu && ((1 << v78) & 0x4D70) != 0) {
        sub_10001F450(v78);
      }
    }
    int v82 = sqlite3_prepare_v2(self->_db, "UPDATE file_backup_msgs SET messageID=NULL WHERE messageID=?", -1, &self->_setNullMessageIDForFileBackup, 0);
    if (v82)
    {
      int v83 = v82;
      v84 = sqlite3_errmsg(*p_db);
      v85 = nps_daemon_log;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = "(nil)";
        if (v84) {
          v86 = v84;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v83;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v86;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v83 >= 102 && v83 <= 0xEu && ((1 << v83) & 0x4D70) != 0) {
        sub_10001F450(v83);
      }
    }
    int v87 = sqlite3_prepare_v2(self->_db, "SELECT domain, key, cloudEnabled FROM sync_msgs WHERE messageID=?", -1, &self->_getSettingsSyncForMessageID, 0);
    if (v87)
    {
      int v88 = v87;
      v89 = sqlite3_errmsg(*p_db);
      v90 = nps_daemon_log;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        v91 = "(nil)";
        if (v89) {
          v91 = v89;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v88;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v91;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v88 >= 102 && v88 <= 0xEu && ((1 << v88) & 0x4D70) != 0) {
        sub_10001F450(v88);
      }
    }
    int v92 = sqlite3_prepare_v2(self->_db, "SELECT container, domain, key FROM backup_msgs WHERE messageID=?", -1, &self->_getSettingsBackupForMessageID, 0);
    if (v92)
    {
      int v93 = v92;
      v94 = sqlite3_errmsg(*p_db);
      v95 = nps_daemon_log;
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        v96 = "(nil)";
        if (v94) {
          v96 = v94;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v93;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v96;
        _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v93 >= 102 && v93 <= 0xEu && ((1 << v93) & 0x4D70) != 0) {
        sub_10001F450(v93);
      }
    }
    int v97 = sqlite3_prepare_v2(self->_db, "SELECT path FROM file_backup_msgs WHERE messageID=?", -1, &self->_getFileBackupForMessageID, 0);
    if (v97)
    {
      int v98 = v97;
      v99 = sqlite3_errmsg(*p_db);
      v100 = nps_daemon_log;
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
      {
        v101 = "(nil)";
        if (v99) {
          v101 = v99;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v98;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v101;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v98 >= 102 && v98 <= 0xEu && ((1 << v98) & 0x4D70) != 0) {
        sub_10001F450(v98);
      }
    }
    int v102 = sqlite3_prepare_v2(self->_db, "SELECT domain, key, cloudEnabled FROM sync_msgs WHERE messageID IS NULL", -1, &self->_getSettingsSyncWithNullMessageID, 0);
    if (v102)
    {
      int v103 = v102;
      v104 = sqlite3_errmsg(*p_db);
      v105 = nps_daemon_log;
      if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
        v106 = "(nil)";
        if (v104) {
          v106 = v104;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v103;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v106;
        _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v103 >= 102 && v103 <= 0xEu && ((1 << v103) & 0x4D70) != 0) {
        sub_10001F450(v103);
      }
    }
    int v107 = sqlite3_prepare_v2(self->_db, "SELECT container, domain, key FROM backup_msgs WHERE messageID IS NULL", -1, &self->_getSettingsBackupWithNullMessageID, 0);
    if (v107)
    {
      int v108 = v107;
      v109 = sqlite3_errmsg(*p_db);
      v110 = nps_daemon_log;
      if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
      {
        v111 = "(nil)";
        if (v109) {
          v111 = v109;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v108;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v111;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v108 >= 102 && v108 <= 0xEu && ((1 << v108) & 0x4D70) != 0) {
        sub_10001F450(v108);
      }
    }
    int v112 = sqlite3_prepare_v2(self->_db, "SELECT path FROM file_backup_msgs WHERE messageID IS NULL", -1, &self->_getFileBackupWithNullMessageID, 0);
    if (v112)
    {
      int v113 = v112;
      v114 = sqlite3_errmsg(*p_db);
      v115 = nps_daemon_log;
      if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
      {
        v116 = "(nil)";
        if (v114) {
          v116 = v114;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v113;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v116;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v113 >= 102 && v113 <= 0xEu && ((1 << v113) & 0x4D70) != 0) {
        sub_10001F450(v113);
      }
    }
    int v117 = sqlite3_prepare_v2(self->_db, "INSERT OR REPLACE INTO stashed_sync_msgs (domain, key, data) VALUES (?, ?, ?)", -1, &self->_stashSettingsSyncData, 0);
    if (v117)
    {
      int v118 = v117;
      v119 = sqlite3_errmsg(*p_db);
      v120 = nps_daemon_log;
      if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
      {
        v121 = "(nil)";
        if (v119) {
          v121 = v119;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v118;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v121;
        _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v118 >= 102 && v118 <= 0xEu && ((1 << v118) & 0x4D70) != 0) {
        sub_10001F450(v118);
      }
    }
    int v122 = sqlite3_prepare_v2(self->_db, "SELECT domain, key, data, two_way_sync, timestamp FROM stashed_sync_msgs", -1, &self->_getStashedSettingSyncData, 0);
    if (v122)
    {
      int v123 = v122;
      v124 = sqlite3_errmsg(*p_db);
      v125 = nps_daemon_log;
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
      {
        v126 = "(nil)";
        if (v124) {
          v126 = v124;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v123;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v126;
        _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v123 >= 102 && v123 <= 0xEu && ((1 << v123) & 0x4D70) != 0) {
        sub_10001F450(v123);
      }
    }
    int v127 = sqlite3_prepare_v2(self->_db, "DELETE FROM stashed_sync_msgs", -1, &self->_flushStashedSettingSyncData, 0);
    if (v127)
    {
      int v128 = v127;
      v129 = sqlite3_errmsg(*p_db);
      v130 = nps_daemon_log;
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
      {
        v131 = "(nil)";
        if (v129) {
          v131 = v129;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v128;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v131;
        _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v128 >= 102 && v128 <= 0xEu && ((1 << v128) & 0x4D70) != 0) {
        sub_10001F450(v128);
      }
    }
    int v132 = sqlite3_prepare_v2(self->_db, "DELETE FROM msgs_type", -1, &self->_purgeMessageTypeTable, 0);
    if (v132)
    {
      int v133 = v132;
      v134 = sqlite3_errmsg(*p_db);
      v135 = nps_daemon_log;
      if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
      {
        v136 = "(nil)";
        if (v134) {
          v136 = v134;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v133;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v136;
        _os_log_impl((void *)&_mh_execute_header, v135, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v133 >= 102 && v133 <= 0xEu && ((1 << v133) & 0x4D70) != 0) {
        sub_10001F450(v133);
      }
    }
    int v137 = sqlite3_prepare_v2(self->_db, "DELETE FROM sync_msgs", -1, &self->_purgeSettingsSyncTable, 0);
    if (v137)
    {
      int v138 = v137;
      v139 = sqlite3_errmsg(*p_db);
      v140 = nps_daemon_log;
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        v141 = "(nil)";
        if (v139) {
          v141 = v139;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v138;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v141;
        _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v138 >= 102 && v138 <= 0xEu && ((1 << v138) & 0x4D70) != 0) {
        sub_10001F450(v138);
      }
    }
    int v142 = sqlite3_prepare_v2(self->_db, "DELETE FROM backup_msgs", -1, &self->_purgeSettingsBackupTable, 0);
    if (v142)
    {
      int v143 = v142;
      v144 = sqlite3_errmsg(*p_db);
      v145 = nps_daemon_log;
      if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
      {
        v146 = "(nil)";
        if (v144) {
          v146 = v144;
        }
        int v153 = 67109378;
        *(_DWORD *)v154 = v143;
        *(_WORD *)&v154[4] = 2080;
        *(void *)&v154[6] = v146;
        _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
      }

      if (v143 >= 102 && v143 <= 0xEu && ((1 << v143) & 0x4D70) != 0) {
        sub_10001F450(v143);
      }
    }
    int v147 = sqlite3_prepare_v2(self->_db, "DELETE FROM file_backup_msgs", -1, &self->_purgeFileBackupTable, 0);
    if (!v147) {
      goto LABEL_269;
    }
    int v148 = v147;
    v149 = sqlite3_errmsg(*p_db);
    v150 = nps_daemon_log;
    if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
    {
      v151 = "(nil)";
      if (v149) {
        v151 = v149;
      }
      int v153 = 67109378;
      *(_DWORD *)v154 = v148;
      *(_WORD *)&v154[4] = 2080;
      *(void *)&v154[6] = v151;
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "SQL Error: (%d) %s", (uint8_t *)&v153, 0x12u);
    }

    if (v148 >= 102)
    {
      BOOL v9 = 1;
      if (v148 <= 0xEu && ((1 << v148) & 0x4D70) != 0) {
        sub_10001F450(v148);
      }
    }
    else
    {
LABEL_269:
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)version
{
  return self->_version;
}

- (sqlite3)db
{
  return self->_db;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (sqlite3_stmt)getMessageTypeForMessageID
{
  return self->_getMessageTypeForMessageID;
}

- (void)setGetMessageTypeForMessageID:(sqlite3_stmt *)a3
{
  self->_getMessageTypeForMessageID = a3;
}

- (sqlite3_stmt)setMessageTypeForMessageID
{
  return self->_setMessageTypeForMessageID;
}

- (void)setSetMessageTypeForMessageID:(sqlite3_stmt *)a3
{
  self->_setMessageTypeForMessageID = a3;
}

- (sqlite3_stmt)setMessageIDForSettingSync
{
  return self->_setMessageIDForSettingSync;
}

- (void)setSetMessageIDForSettingSync:(sqlite3_stmt *)a3
{
  self->_setMessageIDForSettingSync = a3;
}

- (sqlite3_stmt)setMessageIDForSettingBackup
{
  return self->_setMessageIDForSettingBackup;
}

- (void)setSetMessageIDForSettingBackup:(sqlite3_stmt *)a3
{
  self->_setMessageIDForSettingBackup = a3;
}

- (sqlite3_stmt)setMessageIDForFileBackup
{
  return self->_setMessageIDForFileBackup;
}

- (void)setSetMessageIDForFileBackup:(sqlite3_stmt *)a3
{
  self->_setMessageIDForFileBackup = a3;
}

- (sqlite3_stmt)untrackSettingsSyncMessage
{
  return self->_untrackSettingsSyncMessage;
}

- (void)setUntrackSettingsSyncMessage:(sqlite3_stmt *)a3
{
  self->_untrackSettingsSyncMessage = a3;
}

- (sqlite3_stmt)untrackSettingsBackupMessage
{
  return self->_untrackSettingsBackupMessage;
}

- (void)setUntrackSettingsBackupMessage:(sqlite3_stmt *)a3
{
  self->_untrackSettingsBackupMessage = a3;
}

- (sqlite3_stmt)untrackFileBackupMessage
{
  return self->_untrackFileBackupMessage;
}

- (void)setUntrackFileBackupMessage:(sqlite3_stmt *)a3
{
  self->_untrackFileBackupMessage = a3;
}

- (sqlite3_stmt)untrackSettingsSyncForMessageID
{
  return self->_untrackSettingsSyncForMessageID;
}

- (void)setUntrackSettingsSyncForMessageID:(sqlite3_stmt *)a3
{
  self->_untrackSettingsSyncForMessageID = a3;
}

- (sqlite3_stmt)untrackSettingsBackupForMessageID
{
  return self->_untrackSettingsBackupForMessageID;
}

- (void)setUntrackSettingsBackupForMessageID:(sqlite3_stmt *)a3
{
  self->_untrackSettingsBackupForMessageID = a3;
}

- (sqlite3_stmt)untrackFileBackupForMessageID
{
  return self->_untrackFileBackupForMessageID;
}

- (void)setUntrackFileBackupForMessageID:(sqlite3_stmt *)a3
{
  self->_untrackFileBackupForMessageID = a3;
}

- (sqlite3_stmt)removeMessageFromMessageTypeTable
{
  return self->_removeMessageFromMessageTypeTable;
}

- (void)setRemoveMessageFromMessageTypeTable:(sqlite3_stmt *)a3
{
  self->_removeMessageFromMessageTypeTable = a3;
}

- (sqlite3_stmt)setNullMessageIDForSettingSync
{
  return self->_setNullMessageIDForSettingSync;
}

- (void)setSetNullMessageIDForSettingSync:(sqlite3_stmt *)a3
{
  self->_setNullMessageIDForSettingSync = a3;
}

- (sqlite3_stmt)setNullMessageIDForSettingBackup
{
  return self->_setNullMessageIDForSettingBackup;
}

- (void)setSetNullMessageIDForSettingBackup:(sqlite3_stmt *)a3
{
  self->_setNullMessageIDForSettingBackup = a3;
}

- (sqlite3_stmt)setNullMessageIDForFileBackup
{
  return self->_setNullMessageIDForFileBackup;
}

- (void)setSetNullMessageIDForFileBackup:(sqlite3_stmt *)a3
{
  self->_setNullMessageIDForFileBackup = a3;
}

- (sqlite3_stmt)getSettingsSyncForMessageID
{
  return self->_getSettingsSyncForMessageID;
}

- (void)setGetSettingsSyncForMessageID:(sqlite3_stmt *)a3
{
  self->_getSettingsSyncForMessageID = a3;
}

- (sqlite3_stmt)getSettingsBackupForMessageID
{
  return self->_getSettingsBackupForMessageID;
}

- (void)setGetSettingsBackupForMessageID:(sqlite3_stmt *)a3
{
  self->_getSettingsBackupForMessageID = a3;
}

- (sqlite3_stmt)getFileBackupForMessageID
{
  return self->_getFileBackupForMessageID;
}

- (void)setGetFileBackupForMessageID:(sqlite3_stmt *)a3
{
  self->_getFileBackupForMessageID = a3;
}

- (sqlite3_stmt)getSettingsSyncWithNullMessageID
{
  return self->_getSettingsSyncWithNullMessageID;
}

- (void)setGetSettingsSyncWithNullMessageID:(sqlite3_stmt *)a3
{
  self->_getSettingsSyncWithNullMessageID = a3;
}

- (sqlite3_stmt)getSettingsBackupWithNullMessageID
{
  return self->_getSettingsBackupWithNullMessageID;
}

- (void)setGetSettingsBackupWithNullMessageID:(sqlite3_stmt *)a3
{
  self->_getSettingsBackupWithNullMessageID = a3;
}

- (sqlite3_stmt)getFileBackupWithNullMessageID
{
  return self->_getFileBackupWithNullMessageID;
}

- (void)setGetFileBackupWithNullMessageID:(sqlite3_stmt *)a3
{
  self->_getFileBackupWithNullMessageID = a3;
}

- (sqlite3_stmt)stashSettingsSyncData
{
  return self->_stashSettingsSyncData;
}

- (void)setStashSettingsSyncData:(sqlite3_stmt *)a3
{
  self->_stashSettingsSyncData = a3;
}

- (sqlite3_stmt)getStashedSettingSyncData
{
  return self->_getStashedSettingSyncData;
}

- (void)setGetStashedSettingSyncData:(sqlite3_stmt *)a3
{
  self->_getStashedSettingSyncData = a3;
}

- (sqlite3_stmt)flushStashedSettingSyncData
{
  return self->_flushStashedSettingSyncData;
}

- (void)setFlushStashedSettingSyncData:(sqlite3_stmt *)a3
{
  self->_flushStashedSettingSyncData = a3;
}

- (sqlite3_stmt)purgeMessageTypeTable
{
  return self->_purgeMessageTypeTable;
}

- (void)setPurgeMessageTypeTable:(sqlite3_stmt *)a3
{
  self->_purgeMessageTypeTable = a3;
}

- (sqlite3_stmt)purgeSettingsSyncTable
{
  return self->_purgeSettingsSyncTable;
}

- (void)setPurgeSettingsSyncTable:(sqlite3_stmt *)a3
{
  self->_purgeSettingsSyncTable = a3;
}

- (sqlite3_stmt)purgeSettingsBackupTable
{
  return self->_purgeSettingsBackupTable;
}

- (void)setPurgeSettingsBackupTable:(sqlite3_stmt *)a3
{
  self->_purgeSettingsBackupTable = a3;
}

- (sqlite3_stmt)purgeFileBackupTable
{
  return self->_purgeFileBackupTable;
}

- (void)setPurgeFileBackupTable:(sqlite3_stmt *)a3
{
  self->_purgeFileBackupTable = a3;
}

- (void).cxx_destruct
{
}

@end