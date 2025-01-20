@interface MKMessageMigrator
- (BOOL)_import:(id)a3;
- (BOOL)_performSimpleQuery:(id)a3;
- (MKMessageMigrator)init;
- (id)chatIDForMessage:(id)a3 forHandleIDs:(id)a4 withGroup:(id)a5;
- (id)handleID:(id)a3;
- (id)handleIDs:(id)a3;
- (id)insertAttachment:(id)a3 withMessage:(id)a4;
- (id)insertChatForMessage:(id)a3 forHandleIDs:(id)a4 withGroup:(id)a5;
- (id)insertHandle:(id)a3;
- (id)insertMessage:(id)a3 forHandleID:(id)a4 withGroup:(id)a5;
- (id)joinAttachment:(id)a3 message:(id)a4;
- (id)joinChat:(id)a3 handle:(id)a4;
- (id)joinChat:(id)a3 message:(id)a4 date:(int64_t)a5;
- (void)begin;
- (void)close;
- (void)commit;
- (void)dealloc;
- (void)delete;
- (void)delete:(id)a3;
- (void)import;
- (void)import:(id)a3;
- (void)importDataEncodedInJSON:(id)a3;
- (void)notify;
- (void)open;
- (void)query:(id)a3;
- (void)rollback;
- (void)updateClient;
@end

@implementation MKMessageMigrator

- (MKMessageMigrator)init
{
  v9.receiver = self;
  v9.super_class = (Class)MKMessageMigrator;
  v2 = [(MKMigrator *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    accountGUID = v2->_accountGUID;
    v2->_accountGUID = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    groups = v2->_groups;
    v2->_groups = v6;

    v2->_database = 0;
    [(MKMigrator *)v2 setType:10];
    [(MKMessageMigrator *)v2 open];
  }
  return v2;
}

- (void)dealloc
{
  [(MKMessageMigrator *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MKMessageMigrator;
  [(MKMessageMigrator *)&v3 dealloc];
}

- (void)open
{
  objc_super v3 = NSHomeDirectory();
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"/Library/SMS/sms.db"];

  id v5 = v4;
  if (sqlite3_open((const char *)[v5 UTF8String], &self->_database))
  {
    v6 = +[MKLog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase open:]((uint64_t)self, v6);
    }
  }
}

- (void)close
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_database)
  {
    [(MKMessageMigrator *)obj updateClient];
    sqlite3_close(obj->_database);
    obj->_database = 0;
    [(MKMessageMigrator *)obj notify];
  }
  objc_sync_exit(obj);
}

- (void)notify
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.imdpersistenceagent.notification.mergecompleted", 0, 0, 1u);
}

- (void)import
{
  [(MKMessageMigrator *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MKMessageMigrator;
  [(MKMigrator *)&v3 import];
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  uint64_t v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKMessageMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)delete
{
  [(MKMessageMigrator *)self delete:@"message_attachment_join"];
  [(MKMessageMigrator *)self delete:@"chat_message_join"];
  [(MKMessageMigrator *)self delete:@"chat_handle_join"];
  [(MKMessageMigrator *)self delete:@"chat"];
  [(MKMessageMigrator *)self delete:@"attachment"];
  [(MKMessageMigrator *)self delete:@"message"];
  [(MKMessageMigrator *)self delete:@"handle"];
}

- (void)delete:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:@"DELETE FROM %@", a3];
  ppStmt = 0;
  database = self->_database;
  id v6 = v4;
  if (sqlite3_prepare(database, (const char *)[v6 UTF8String], -1, &ppStmt, 0))
  {
    id v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKPhotoLibraryAssetDatabase removeCollection:]();
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)query:(id)a3
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_database, (const char *)[a3 UTF8String], -1, &ppStmt, 0))
  {
    objc_super v3 = +[MKLog log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    if (sqlite3_step(ppStmt) != 101)
    {
      uint64_t v4 = +[MKLog log];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase query:]();
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)begin
{
}

- (void)commit
{
}

- (void)rollback
{
}

- (void)import:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [MEMORY[0x263EFF910] date];
  uint64_t v5 = (void *)MEMORY[0x230F5C060]([(MKMessageMigrator *)self begin]);
  BOOL v6 = [(MKMessageMigrator *)self _import:v17];
  if (v6)
  {
    [(MKMessageMigrator *)self commit];
    [(MKMigrator *)self migratorDidImport];
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v17 length]);
  }
  else
  {
    [(MKMessageMigrator *)self rollback];
    id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"MKMessageError" code:1 userInfo:0];
    [(MKMigrator *)self migratorDidFailWithImportError:v7];
  }
  id v8 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v8);
  objc_super v9 = [v8 payload];
  v10 = [v9 messages];

  v11 = [MEMORY[0x263EFF910] date];
  [v11 timeIntervalSinceDate:v4];
  double v13 = v12;

  v14 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v13];
  v15 = [v10 importElapsedTime];
  v16 = [v15 decimalNumberByAdding:v14];
  [v10 setImportElapsedTime:v16];

  objc_sync_exit(v8);
}

- (BOOL)_import:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v48 = a3;
  uint64_t v4 = [[MKMessage alloc] initWithData:v48];
  uint64_t v5 = v4;
  if (v4)
  {
    BOOL v6 = [(MKMessage *)v4 body];
    if ([v6 length])
    {
    }
    else
    {
      objc_super v9 = [(MKMessage *)v5 attachments];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        id v7 = +[MKLog log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[MKMessageMigrator _import:]();
        }
        BOOL v8 = 1;
        goto LABEL_78;
      }
    }
    v11 = +[MKLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "will import a message", buf, 2u);
    }

    id v7 = [(MKMessage *)v5 handles];
    double v12 = +[MKLog log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v7;
      _os_log_impl(&dword_22BFAC000, v12, OS_LOG_TYPE_INFO, "handles : %@", buf, 0xCu);
    }

    if ([v7 count])
    {
      os_log_t oslog = [(MKMessageMigrator *)self handleIDs:v7];
      v47 = [oslog sortedArrayUsingComparator:&__block_literal_global_3];
      v44 = [v47 componentsJoinedByString:@","];
      if ([(MKMessage *)v5 isSent])
      {
        v46 = &unk_26DF7AC50;
      }
      else
      {
        v46 = [oslog objectAtIndexedSubscript:0];
      }
      if (oslog)
      {
        double v13 = [(MKMessage *)v5 recipients];
        BOOL v14 = (unint64_t)[v13 count] > 1;

        if (v14)
        {
          v15 = self->_groups;
          objc_sync_enter(v15);
          v16 = [(NSMutableDictionary *)self->_groups objectForKey:v44];
          if (!v16)
          {
            v16 = objc_alloc_init(MKMessageGroup);
            [(NSMutableDictionary *)self->_groups setObject:v16 forKey:v44];
          }
          v45 = v16;
          objc_sync_exit(v15);
        }
        else
        {
          v45 = 0;
        }
        v19 = +[MKLog log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = oslog;
          _os_log_impl(&dword_22BFAC000, v19, OS_LOG_TYPE_INFO, "handle ids : %@", buf, 0xCu);
        }

        v20 = +[MKLog log];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v46;
          _os_log_impl(&dword_22BFAC000, v20, OS_LOG_TYPE_INFO, "sender handle id : %@", buf, 0xCu);
        }

        v21 = +[MKLog log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = [(MKMessageGroup *)v45 ID];
          *(_DWORD *)buf = 138412290;
          v56 = v22;
          _os_log_impl(&dword_22BFAC000, v21, OS_LOG_TYPE_INFO, "group id : %@", buf, 0xCu);
        }
        v23 = +[MKLog log];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = [(MKMessageGroup *)v45 roomName];
          *(_DWORD *)buf = 138412290;
          v56 = v24;
          _os_log_impl(&dword_22BFAC000, v23, OS_LOG_TYPE_INFO, "group room name : %@", buf, 0xCu);
        }
        v25 = [(MKMessageMigrator *)self insertMessage:v5 forHandleID:v46 withGroup:v45];
        v26 = +[MKLog log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v25;
          _os_log_impl(&dword_22BFAC000, v26, OS_LOG_TYPE_INFO, "message id : %@", buf, 0xCu);
        }

        if (v25)
        {
          long long v52 = 0u;
          long long v53 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          v27 = [(MKMessage *)v5 attachments];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v54 count:16];
          if (v28)
          {
            uint64_t v30 = *(void *)v51;
            *(void *)&long long v29 = 138412290;
            long long v43 = v29;
            while (2)
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v51 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                objc_msgSend(v32, "write", v43);
                v33 = [(MKMessageMigrator *)self insertAttachment:v32 withMessage:v5];
                v34 = +[MKLog log];
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v43;
                  v56 = v33;
                  _os_log_impl(&dword_22BFAC000, v34, OS_LOG_TYPE_INFO, "attachment id : %@", buf, 0xCu);
                }

                if (!v33)
                {
                  v40 = +[MKLog log];
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                    -[MKMessageMigrator _import:].cold.8();
                  }

                  goto LABEL_67;
                }
                v35 = [(MKMessageMigrator *)self joinAttachment:v33 message:v25];
                if (!v35)
                {
                  v41 = +[MKLog log];
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                    -[MKMessageMigrator _import:].cold.9();
                  }

                  goto LABEL_67;
                }
              }
              uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v54 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          v27 = [(MKMessageMigrator *)self chatIDForMessage:v5 forHandleIDs:v47 withGroup:v45];
          v36 = +[MKLog log];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v27;
            _os_log_impl(&dword_22BFAC000, v36, OS_LOG_TYPE_INFO, "chat id : %@", buf, 0xCu);
          }

          if (v27)
          {
            v37 = [(MKMessageMigrator *)self joinChat:v27 message:v25 date:[(MKMessage *)v5 timestampInNanoseconds]];
            BOOL v8 = v37 != 0;
            v38 = +[MKLog log];
            v39 = v38;
            if (v37)
            {
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22BFAC000, v39, OS_LOG_TYPE_INFO, "did import a message", buf, 2u);
              }
            }
            else if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              -[MKMessageMigrator _import:].cold.7();
            }
          }
          else
          {
            v37 = +[MKLog log];
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[MKMessageMigrator _import:].cold.6();
            }
            BOOL v8 = 0;
          }
        }
        else
        {
          v27 = +[MKLog log];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[MKMessageMigrator _import:].cold.5();
          }
LABEL_67:
          BOOL v8 = 0;
        }

        p_super = &v45->super;
      }
      else
      {
        id v17 = +[MKLog log];
        p_super = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          -[MKMessageMigrator _import:].cold.4();
          BOOL v8 = 0;
          p_super = v17;
        }
        else
        {
          BOOL v8 = 0;
        }
      }
    }
    else
    {
      os_log_t oslog = +[MKLog log];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR)) {
        -[MKMessageMigrator _import:]();
      }
      BOOL v8 = 0;
    }
  }
  else
  {
    id v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MKMessageMigrator _import:]();
    }
    BOOL v8 = 0;
  }
LABEL_78:

  return v8;
}

uint64_t __29__MKMessageMigrator__import___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)_performSimpleQuery:(id)a3
{
  ppStmt = 0;
  if (!sqlite3_prepare_v2(self->_database, (const char *)[a3 UTF8String], -1, &ppStmt, 0))sqlite3_finalize(ppStmt); {
  return 0;
  }
}

- (id)handleIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[MKMessageMigrator handleID:](self, "handleID:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (!v11)
        {

          id v13 = 0;
          goto LABEL_11;
        }
        double v12 = (void *)v11;
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v13 = v5;
LABEL_11:

  return v13;
}

- (id)handleID:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  if (!sqlite3_prepare(self->_database, (const char *)[@"SELECT rowid FROM handle WHERE id = ? LIMIT 1" UTF8String], -1, &ppStmt, 0))
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
    if (sqlite3_step(ppStmt) == 100)
    {
      sqlite3_int64 v5 = sqlite3_column_int64(ppStmt, 0);
      sqlite3_finalize(ppStmt);
      if (v5 != -1)
      {
        uint64_t v6 = [NSNumber numberWithLongLong:v5];
        goto LABEL_7;
      }
    }
    else
    {
      sqlite3_finalize(ppStmt);
    }
  }
  uint64_t v6 = [(MKMessageMigrator *)self insertHandle:v4];
LABEL_7:
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)insertHandle:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sqlite3_int64 v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B130, "count"));
  if ([&unk_26DF7B130 count])
  {
    unint64_t v6 = 0;
    do
      [v5 setObject:@"?" atIndexedSubscript:v6++];
    while (v6 < [&unk_26DF7B130 count]);
  }
  uint64_t v7 = NSString;
  uint64_t v8 = [&unk_26DF7B130 componentsJoinedByString:@","];
  uint64_t v9 = [v5 componentsJoinedByString:@","];
  uint64_t v10 = [v7 stringWithFormat:@"INSERT INTO handle (%@) VALUES (%@)", v8, v9];

  uint64_t v11 = +[MKLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "query : %@", buf, 0xCu);
  }

  *(void *)buf = 0;
  p_database = &self->_database;
  database = self->_database;
  id v14 = v10;
  if (sqlite3_prepare(database, (const char *)[v14 UTF8String], -1, (sqlite3_stmt **)buf, 0))
  {
    long long v15 = +[MKLog log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    sqlite3_bind_text(*(sqlite3_stmt **)buf, 1, (const char *)[v4 UTF8String], -1, 0);
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 2);
    sqlite3_bind_text(*(sqlite3_stmt **)buf, 3, (const char *)[@"SMS" UTF8String], -1, 0);
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 4);
    if (sqlite3_step(*(sqlite3_stmt **)buf) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      sqlite3_finalize(*(sqlite3_stmt **)buf);
      if (insert_rowid != -1)
      {
        long long v17 = [NSNumber numberWithLongLong:insert_rowid];
        goto LABEL_17;
      }
    }
    else
    {
      long long v18 = +[MKLog log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase addIdentifier:]();
      }

      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
  }
  long long v17 = 0;
LABEL_17:

  return v17;
}

- (id)insertMessage:(id)a3 forHandleID:(id)a4 withGroup:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B148, "count"));
  if ([&unk_26DF7B148 count])
  {
    unint64_t v12 = 0;
    do
      [v11 setObject:@"?" atIndexedSubscript:v12++];
    while (v12 < [&unk_26DF7B148 count]);
  }
  id v13 = NSString;
  id v14 = [&unk_26DF7B148 componentsJoinedByString:@","];
  long long v15 = [v11 componentsJoinedByString:@","];
  long long v16 = [v13 stringWithFormat:@"INSERT INTO message (%@) VALUES (%@)", v14, v15];

  long long v17 = +[MKLog log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl(&dword_22BFAC000, v17, OS_LOG_TYPE_INFO, "query : %@", buf, 0xCu);
  }

  if ([v8 isRead])
  {
    sqlite3_int64 v18 = [v8 timestampInNanoseconds];
    int v42 = 1;
  }
  else
  {
    sqlite3_int64 v18 = 0;
    int v42 = 0;
  }
  *(void *)buf = 0;
  p_database = &self->_database;
  database = self->_database;
  id v21 = v16;
  if (sqlite3_prepare(database, (const char *)[v21 UTF8String], -1, (sqlite3_stmt **)buf, 0))
  {
    v22 = +[MKLog log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    v40 = v10;
    v23 = *(sqlite3_stmt **)buf;
    id v24 = [v8 UUID];
    sqlite3_bind_text(v23, 1, (const char *)[v24 UTF8String], -1, 0);

    v25 = *(sqlite3_stmt **)buf;
    id v26 = [v8 body];
    sqlite3_bind_text(v25, 2, (const char *)[v26 UTF8String], -1, 0);

    sqlite3_bind_null(*(sqlite3_stmt **)buf, 3);
    id v41 = v9;
    sqlite3_bind_int64(*(sqlite3_stmt **)buf, 4, [v9 longLongValue]);
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 5);
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 6);
    v27 = [v8 attributedBody];

    uint64_t v28 = *(sqlite3_stmt **)buf;
    if (v27)
    {
      id v29 = [v8 attributedBody];
      uint64_t v30 = (const void *)[v29 bytes];
      v31 = [v8 attributedBody];
      sqlite3_bind_blob(v28, 7, v30, [v31 length], 0);
    }
    else
    {
      sqlite3_bind_null(*(sqlite3_stmt **)buf, 7);
    }
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 8, 10);
    sqlite3_bind_text(*(sqlite3_stmt **)buf, 9, (const char *)[@"SMS" UTF8String], -1, 0);
    v32 = *(sqlite3_stmt **)buf;
    id v33 = [v8 account];
    sqlite3_bind_text(v32, 10, (const char *)[v33 UTF8String], -1, 0);

    sqlite3_bind_text(*(sqlite3_stmt **)buf, 11, [(NSString *)self->_accountGUID UTF8String], -1, 0);
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 12, 0);
    sqlite3_bind_int64(*(sqlite3_stmt **)buf, 13, [v8 timestampInNanoseconds]);
    sqlite3_bind_int64(*(sqlite3_stmt **)buf, 14, v18);
    sqlite3_bind_int64(*(sqlite3_stmt **)buf, 15, [v8 timestampInNanoseconds]);
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 16, 1);
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 17, [v8 isSent]);
    v34 = *(sqlite3_stmt **)buf;
    id v10 = v40;
    if (v40)
    {
      id v35 = [v40 roomName];
      sqlite3_bind_text(v34, 18, (const char *)[v35 UTF8String], -1, 0);
    }
    else
    {
      sqlite3_bind_null(*(sqlite3_stmt **)buf, 18);
    }
    id v9 = v41;
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 19, 1);
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 20, 0);
    sqlite3_bind_null(*(sqlite3_stmt **)buf, 21);
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 22, v42);
    sqlite3_bind_int(*(sqlite3_stmt **)buf, 23, 1);
    if (sqlite3_step(*(sqlite3_stmt **)buf) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      sqlite3_finalize(*(sqlite3_stmt **)buf);
      if (insert_rowid != -1)
      {
        v37 = [NSNumber numberWithLongLong:insert_rowid];
        goto LABEL_26;
      }
    }
    else
    {
      v38 = +[MKLog log];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase addIdentifier:]();
      }

      sqlite3_finalize(*(sqlite3_stmt **)buf);
    }
  }
  v37 = 0;
LABEL_26:

  return v37;
}

- (id)insertAttachment:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B160, "count"));
  if ([&unk_26DF7B160 count])
  {
    unint64_t v9 = 0;
    do
      [v8 setObject:@"?" atIndexedSubscript:v9++];
    while (v9 < [&unk_26DF7B160 count]);
  }
  id v10 = NSString;
  uint64_t v11 = [&unk_26DF7B160 componentsJoinedByString:@","];
  unint64_t v12 = [v8 componentsJoinedByString:@","];
  id v13 = [v10 stringWithFormat:@"INSERT INTO attachment (%@) VALUES (%@)", v11, v12];

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  id v16 = v13;
  if (sqlite3_prepare(database, (const char *)[v16 UTF8String], -1, &ppStmt, 0))
  {
    long long v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    sqlite3_int64 v18 = ppStmt;
    id v19 = [v6 UUID];
    sqlite3_bind_text(v18, 1, (const char *)[v19 UTF8String], -1, 0);

    sqlite3_bind_int64(ppStmt, 2, [v7 timestampInSeconds]);
    sqlite3_bind_int64(ppStmt, 3, [v7 timestampInSeconds]);
    uint64_t v20 = ppStmt;
    id v21 = [v6 filename];
    sqlite3_bind_text(v20, 4, (const char *)[v21 UTF8String], -1, 0);

    v22 = ppStmt;
    id v23 = [v6 uniformTypeIdentifier];
    sqlite3_bind_text(v22, 5, (const char *)[v23 UTF8String], -1, 0);

    id v24 = ppStmt;
    id v25 = [v6 contentType];
    sqlite3_bind_text(v24, 6, (const char *)[v25 UTF8String], -1, 0);

    sqlite3_bind_int(ppStmt, 7, [v6 transferState]);
    sqlite3_bind_int(ppStmt, 8, [v7 isSent]);
    sqlite3_bind_null(ppStmt, 9);
    id v26 = ppStmt;
    v27 = [v6 filename];
    id v28 = [v27 lastPathComponent];
    sqlite3_bind_text(v26, 10, (const char *)[v28 UTF8String], -1, 0);

    id v29 = ppStmt;
    uint64_t v30 = [v6 data];
    sqlite3_bind_int(v29, 11, [v30 length]);

    v31 = ppStmt;
    id v32 = [v6 UUID];
    sqlite3_bind_text(v31, 12, (const char *)[v32 UTF8String], -1, 0);

    if (sqlite3_step(ppStmt) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      sqlite3_finalize(ppStmt);
      if (insert_rowid != -1)
      {
        v34 = [NSNumber numberWithLongLong:insert_rowid];
        goto LABEL_15;
      }
    }
    else
    {
      id v35 = +[MKLog log];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase addIdentifier:]();
      }

      sqlite3_finalize(ppStmt);
    }
  }
  v34 = 0;
LABEL_15:

  return v34;
}

- (id)chatIDForMessage:(id)a3 forHandleIDs:(id)a4 withGroup:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v10)
  {
    unint64_t v12 = [v10 roomName];
    id v13 = @"SELECT rowid FROM chat WHERE room_name = ? LIMIT 1";
  }
  else
  {
    if ([v8 isSent])
    {
      id v14 = [v8 recipients];
      unint64_t v12 = [v14 objectAtIndexedSubscript:0];
    }
    else
    {
      unint64_t v12 = [v8 sender];
    }
    id v13 = @"SELECT rowid FROM chat WHERE chat_identifier = ? LIMIT 1";
  }
  ppStmt = 0;
  if (sqlite3_prepare(self->_database, (const char *)[(__CFString *)v13 UTF8String], -1, &ppStmt, 0)) {
    goto LABEL_23;
  }
  sqlite3_bind_text(ppStmt, 1, (const char *)[v12 UTF8String], -1, 0);
  if (sqlite3_step(ppStmt) != 100)
  {
    sqlite3_finalize(ppStmt);
    goto LABEL_23;
  }
  sqlite3_int64 v15 = sqlite3_column_int64(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  if (v15 < 0)
  {
LABEL_23:
    id v16 = [(MKMessageMigrator *)self insertChatForMessage:v8 forHandleIDs:v9 withGroup:v11];
    goto LABEL_24;
  }
  id v25 = v12;
  id v26 = v11;
  id v16 = [NSNumber numberWithLongLong:v15];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = v9;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [(MKMessageMigrator *)self joinChat:v16 handle:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        if (!v22)
        {
          id v23 = +[MKLog log];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[MKMessageMigrator chatIDForMessage:forHandleIDs:withGroup:](&buf, v29, v23);
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v19);
  }

  id v9 = v27;
  unint64_t v12 = v25;
  uint64_t v11 = v26;
LABEL_24:

  return v16;
}

- (id)insertChatForMessage:(id)a3 forHandleIDs:(id)a4 withGroup:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v47 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B178, "count"));
  if ([&unk_26DF7B178 count])
  {
    unint64_t v11 = 0;
    do
      [v10 setObject:@"?" atIndexedSubscript:v11++];
    while (v11 < [&unk_26DF7B178 count]);
  }
  if ([v8 isSent])
  {
    unint64_t v12 = [v8 recipients];
    v46 = [v12 objectAtIndexedSubscript:0];
  }
  else
  {
    v46 = [v8 sender];
  }
  if ([v8 isSent])
  {
    id v13 = [v8 sender];
  }
  else if (v9)
  {
    id v13 = &stru_26DF6A8B0;
  }
  else
  {
    id v14 = [v8 recipients];
    id v13 = [v14 objectAtIndexedSubscript:0];
  }
  if (v13) {
    sqlite3_int64 v15 = v13;
  }
  else {
    sqlite3_int64 v15 = &stru_26DF6A8B0;
  }
  id v45 = [NSString stringWithFormat:@"P:%@", v15];
  long long v50 = v9;
  if (v9)
  {
    id v49 = [v9 roomName];
    id v48 = [NSString stringWithFormat:@"SMS;+;%@", v49];
    id v44 = [v9 ID];
    id v16 = v46;
  }
  else
  {
    id v16 = v46;
    id v49 = v46;
    id v48 = [NSString stringWithFormat:@"SMS;-;%@", v49];
    id v17 = [MEMORY[0x263F08C38] UUID];
    id v44 = [v17 UUIDString];
  }
  uint64_t v18 = NSString;
  uint64_t v19 = [&unk_26DF7B178 componentsJoinedByString:@","];
  uint64_t v20 = [v10 componentsJoinedByString:@","];
  id v21 = [v18 stringWithFormat:@"INSERT INTO chat (%@) VALUES (%@)", v19, v20];

  ppStmt = 0;
  database = self->_database;
  id v43 = v21;
  if (sqlite3_prepare(database, (const char *)[v43 UTF8String], -1, &ppStmt, 0))
  {
    id v23 = +[MKLog log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }

    id v24 = 0;
    id v25 = v47;
LABEL_22:
    id v27 = v44;
    id v26 = v45;
    goto LABEL_47;
  }
  if (v9) {
    int v28 = 43;
  }
  else {
    int v28 = 45;
  }
  sqlite3_bind_text(ppStmt, 1, (const char *)[v48 UTF8String], -1, 0);
  sqlite3_bind_int(ppStmt, 2, v28);
  sqlite3_bind_int(ppStmt, 3, 3);
  sqlite3_bind_text(ppStmt, 4, [(NSString *)self->_accountGUID UTF8String], -1, 0);
  sqlite3_bind_null(ppStmt, 5);
  sqlite3_bind_text(ppStmt, 6, (const char *)[v49 UTF8String], -1, 0);
  sqlite3_bind_text(ppStmt, 7, (const char *)[@"SMS" UTF8String], -1, 0);
  id v29 = ppStmt;
  if (v9)
  {
    id v30 = [v9 roomName];
    sqlite3_bind_text(v29, 8, (const char *)[v30 UTF8String], -1, 0);
  }
  else
  {
    sqlite3_bind_null(ppStmt, 8);
  }
  id v26 = v45;
  sqlite3_bind_text(ppStmt, 9, (const char *)[v45 UTF8String], -1, 0);
  sqlite3_bind_text(ppStmt, 10, (const char *)[(__CFString *)v13 UTF8String], -1, 0);
  sqlite3_bind_text(ppStmt, 11, (const char *)[&stru_26DF6A8B0 UTF8String], -1, 0);
  id v27 = v44;
  sqlite3_bind_text(ppStmt, 12, (const char *)[v44 UTF8String], -1, 0);
  if (sqlite3_step(ppStmt) == 101)
  {
    sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_database);
    sqlite3_finalize(ppStmt);
    if (insert_rowid != -1)
    {
      id v41 = v13;
      id v42 = v8;
      id v24 = [NSNumber numberWithLongLong:insert_rowid];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v32 = v47;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = [(MKMessageMigrator *)self joinChat:v24 handle:*(void *)(*((void *)&v53 + 1) + 8 * i)];
            if (!v37)
            {
              v38 = +[MKLog log];
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                -[MKMessageMigrator chatIDForMessage:forHandleIDs:withGroup:](&buf, v52, v38);
              }
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v34);
      }

      id v13 = v41;
      id v8 = v42;
      id v16 = v46;
      id v25 = v47;
      goto LABEL_22;
    }
  }
  else
  {
    v39 = +[MKLog log];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase addIdentifier:]();
    }

    sqlite3_finalize(ppStmt);
  }
  id v24 = 0;
  id v25 = v47;
LABEL_47:

  return v24;
}

- (id)joinAttachment:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B190, "count"));
  if ([&unk_26DF7B190 count])
  {
    unint64_t v9 = 0;
    do
      [v8 setObject:@"?" atIndexedSubscript:v9++];
    while (v9 < [&unk_26DF7B190 count]);
  }
  id v10 = NSString;
  unint64_t v11 = [&unk_26DF7B190 componentsJoinedByString:@","];
  unint64_t v12 = [v8 componentsJoinedByString:@","];
  id v13 = [v10 stringWithFormat:@"INSERT INTO message_attachment_join (%@) VALUES (%@)", v11, v12];

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  id v16 = v13;
  if (sqlite3_prepare(database, (const char *)[v16 UTF8String], -1, &ppStmt, 0))
  {
    id v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, [v7 longLongValue]);
    sqlite3_bind_int64(ppStmt, 2, [v6 longLongValue]);
    if (sqlite3_step(ppStmt) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      sqlite3_finalize(ppStmt);
      if (insert_rowid != -1)
      {
        uint64_t v19 = [NSNumber numberWithLongLong:insert_rowid];
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v20 = +[MKLog log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase addIdentifier:]();
      }

      sqlite3_finalize(ppStmt);
    }
  }
  uint64_t v19 = 0;
LABEL_15:

  return v19;
}

- (id)joinChat:(id)a3 handle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B1A8, "count"));
  if ([&unk_26DF7B1A8 count])
  {
    unint64_t v9 = 0;
    do
      [v8 setObject:@"?" atIndexedSubscript:v9++];
    while (v9 < [&unk_26DF7B1A8 count]);
  }
  id v10 = NSString;
  unint64_t v11 = [&unk_26DF7B1A8 componentsJoinedByString:@","];
  unint64_t v12 = [v8 componentsJoinedByString:@","];
  id v13 = [v10 stringWithFormat:@"INSERT OR IGNORE INTO chat_handle_join (%@) VALUES (%@)", v11, v12];

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  id v16 = v13;
  if (sqlite3_prepare(database, (const char *)[v16 UTF8String], -1, &ppStmt, 0))
  {
    id v17 = +[MKLog log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, [v6 longLongValue]);
    sqlite3_bind_int64(ppStmt, 2, [v7 longLongValue]);
    if (sqlite3_step(ppStmt) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      sqlite3_finalize(ppStmt);
      if (insert_rowid != -1)
      {
        uint64_t v19 = [NSNumber numberWithLongLong:insert_rowid];
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v20 = +[MKLog log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase addIdentifier:]();
      }

      sqlite3_finalize(ppStmt);
    }
  }
  uint64_t v19 = 0;
LABEL_15:

  return v19;
}

- (id)joinChat:(id)a3 message:(id)a4 date:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(&unk_26DF7B1C0, "count"));
  if ([&unk_26DF7B1C0 count])
  {
    unint64_t v11 = 0;
    do
      [v10 setObject:@"?" atIndexedSubscript:v11++];
    while (v11 < [&unk_26DF7B1C0 count]);
  }
  unint64_t v12 = NSString;
  id v13 = [&unk_26DF7B1C0 componentsJoinedByString:@","];
  id v14 = [v10 componentsJoinedByString:@","];
  sqlite3_int64 v15 = [v12 stringWithFormat:@"INSERT INTO chat_message_join (%@) VALUES (%@)", v13, v14];

  ppStmt = 0;
  p_database = &self->_database;
  database = self->_database;
  id v18 = v15;
  if (sqlite3_prepare(database, (const char *)[v18 UTF8String], -1, &ppStmt, 0))
  {
    uint64_t v19 = +[MKLog log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationDatabase query:]();
    }
  }
  else
  {
    sqlite3_bind_int64(ppStmt, 1, [v8 longLongValue]);
    sqlite3_bind_int64(ppStmt, 2, [v9 longLongValue]);
    sqlite3_bind_int64(ppStmt, 3, a5);
    if (sqlite3_step(ppStmt) == 101)
    {
      sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(*p_database);
      sqlite3_finalize(ppStmt);
      if (insert_rowid != -1)
      {
        id v21 = [NSNumber numberWithLongLong:insert_rowid];
        goto LABEL_15;
      }
    }
    else
    {
      v22 = +[MKLog log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationDatabase addIdentifier:]();
      }

      sqlite3_finalize(ppStmt);
    }
  }
  id v21 = 0;
LABEL_15:

  return v21;
}

- (void)updateClient
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_22BFAC000, v1, v2, "update failed. %d (%s)", v3, v4, v5, v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_accountGUID, 0);
}

- (void)_import:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "message is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "message import will be skipped due to empty body.", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "handles is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "handle ids is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "message id is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "chat id is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "chat join id is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "attachment id is missing", v2, v3, v4, v5, v6);
}

- (void)_import:.cold.9()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_22BFAC000, v0, v1, "attachment join id is missing", v2, v3, v4, v5, v6);
}

- (void)chatIDForMessage:(uint8_t *)buf forHandleIDs:(unsigned char *)a2 withGroup:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "chat handle join id is missing", buf, 2u);
}

@end