@interface MFMessageAttachmentMigrator
+ (BOOL)migrateMaildropFileForMessage:(id)a3 mailDropMetadata:(id)a4;
+ (OS_os_log)log;
- (BOOL)_checkContentProtectionState;
- (BOOL)_isMigratingAttachmentsOnThread;
- (BOOL)_messageHasAttachmentsToMigrate:(id)a3;
- (BOOL)_migrateAttachmentsForMessage:(id)a3 connection:(id)a4;
- (EFScheduler)backgroundMigrationScheduler;
- (MFMailMessageLibrary)library;
- (MFMessageAttachmentMigrator)initWithLibrary:(id)a3;
- (NSConditionLock)migrationState;
- (OS_dispatch_queue)contentProtectionQueue;
- (void)_setMigratingAttachmentsOnThread:(BOOL)a3;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)migrateAttachmentsForMessageIfNecessary:(id)a3;
- (void)setBackgroundMigrationScheduler:(id)a3;
- (void)setLibrary:(id)a3;
- (void)startMigratingAttachments;
@end

@implementation MFMessageAttachmentMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MFMessageAttachmentMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_19 != -1) {
    dispatch_once(&log_onceToken_19, block);
  }
  v2 = (void *)log_log_19;
  return (OS_os_log *)v2;
}

void __34__MFMessageAttachmentMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_19;
  log_log_19 = (uint64_t)v1;
}

- (MFMessageAttachmentMigrator)initWithLibrary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFMessageAttachmentMigrator;
  v5 = [(MFMessageAttachmentMigrator *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_library, v4);
    uint64_t v7 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.MFMessageAttachmentMigrator" qualityOfService:9];
    backgroundMigrationScheduler = v6->_backgroundMigrationScheduler;
    v6->_backgroundMigrationScheduler = (EFScheduler *)v7;

    v6->_upgradeLock._os_unfair_lock_opaque = 0;
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.message.MFMessageAttachmentMigrator.contentProtectionQueue", v9);
    contentProtectionQueue = v6->_contentProtectionQueue;
    v6->_contentProtectionQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    migrationState = v6->_migrationState;
    v6->_migrationState = (NSConditionLock *)v12;
  }
  return v6;
}

- (void)startMigratingAttachments
{
  id v3 = [(MFMessageAttachmentMigrator *)self backgroundMigrationScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke;
  v4[3] = &unk_1E5D3B5C0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13 = [MEMORY[0x1E4F60DB8] indexSet];
  v2 = [*(id *)(a1 + 32) library];
  v14 = [v2 database];

  id v3 = [NSString stringWithUTF8String:"-[MFMessageAttachmentMigrator startMigratingAttachments]_block_invoke"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2;
  v19[3] = &unk_1E5D3D068;
  id v4 = v13;
  id v20 = v4;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v3, v19);

  v5 = +[MFMessageAttachmentMigrator log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Found %lu messages to migrate", (uint8_t *)&buf, 0xCu);
  }

  EFRegisterContentProtectionObserver();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  [*(id *)(a1 + 32) _checkContentProtectionState];
  [*(id *)(a1 + 32) _setMigratingAttachmentsOnThread:1];
  do
  {
    uint64_t v7 = [*(id *)(a1 + 32) migrationState];
    [v7 lockWhenCondition:0];

    v8 = [*(id *)(a1 + 32) migrationState];
    [v8 unlock];

    v9 = [NSString stringWithUTF8String:"-[MFMessageAttachmentMigrator startMigratingAttachments]_block_invoke"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2_25;
    v15[3] = &unk_1E5D3CFA0;
    p_long long buf = &buf;
    id v10 = v4;
    uint64_t v11 = *(void *)(a1 + 32);
    id v16 = v10;
    uint64_t v17 = v11;
    objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v9, v15);
  }
  while (*(void *)(*((void *)&buf + 1) + 24) != 0x7FFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 32) _setMigratingAttachmentsOnThread:0];
  EFUnregisterContentProtectionObserver();
  uint64_t v12 = [*(id *)(a1 + 32) library];
  [v12 attachmentMigrationFinished];

  _Block_object_dispose(&buf, 8);
}

uint64_t __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 preparedStatementForQueryString:@"SELECT ROWID FROM messages WHERE (((flags&(63<<10))>>10) BETWEEN 1 AND 62) AND global_message_id NOT IN (SELECT DISTINCT global_message_id FROM message_attachments)"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_3;
  v5[3] = &unk_1E5D3C5E8;
  id v6 = *(id *)(a1 + 32);
  [v3 executeUsingBlock:v5 error:0];

  return 1;
}

void __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 objectForKeyedSubscript:@"ROWID"];
  uint64_t v4 = [v3 databaseIDValue];

  [*(id *)(a1 + 32) addIndex:v4];
}

uint64_t __56__MFMessageAttachmentMigrator_startMigratingAttachments__block_invoke_2_25(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    id v6 = (void *)MEMORY[0x1AD0E3E00]();
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) indexGreaterThanIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24)];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = [*(id *)(a1 + 40) library];
      v9 = [v8 messageWithLibraryID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) options:4227087 inMailbox:0];

      if (v9
        && (char v5 = 0, ([*(id *)(a1 + 40) _migrateAttachmentsForMessage:v9 connection:v3] & 1) != 0))
      {
        int v7 = 0;
      }
      else
      {
        if ([*(id *)(a1 + 40) _checkContentProtectionState])
        {
          int v7 = 0;
LABEL_11:

          goto LABEL_12;
        }
        --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        int v7 = 2;
      }
      char v5 = 1;
      goto LABEL_11;
    }
    int v7 = 2;
LABEL_12:
    if (v7) {
      break;
    }
    id v10 = [*(id *)(a1 + 40) migrationState];
    int v11 = [v10 tryLockWhenCondition:0];

    if (!v11) {
      break;
    }
    uint64_t v12 = [*(id *)(a1 + 40) migrationState];
    [v12 unlock];

    ++v4;
  }
  while (v4 != 500);
  v13 = +[MFMessageAttachmentMigrator log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = @"unsuccessful";
    if (v5) {
      v14 = @"successful";
    }
    int v16 = 134218242;
    uint64_t v17 = v4;
    __int16 v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Migration for %lu messages was %@", (uint8_t *)&v16, 0x16u);
  }

  return v5 & 1;
}

- (void)migrateAttachmentsForMessageIfNecessary:(id)a3
{
  id v4 = a3;
  if (![(MFMessageAttachmentMigrator *)self _isMigratingAttachmentsOnThread])
  {
    [(MFMessageAttachmentMigrator *)self _setMigratingAttachmentsOnThread:1];
    if ([(MFMessageAttachmentMigrator *)self _messageHasAttachmentsToMigrate:v4])
    {
      char v5 = [(MFMessageAttachmentMigrator *)self library];
      id v6 = [v5 database];
      int v7 = [NSString stringWithUTF8String:"-[MFMessageAttachmentMigrator migrateAttachmentsForMessageIfNecessary:]"];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      id v10 = __71__MFMessageAttachmentMigrator_migrateAttachmentsForMessageIfNecessary___block_invoke;
      int v11 = &unk_1E5D3CCE8;
      uint64_t v12 = self;
      id v13 = v4;
      objc_msgSend(v6, "__performWriteWithCaller:usingBlock:", v7, &v8);
    }
    -[MFMessageAttachmentMigrator _setMigratingAttachmentsOnThread:](self, "_setMigratingAttachmentsOnThread:", 0, v8, v9, v10, v11, v12);
  }
}

uint64_t __71__MFMessageAttachmentMigrator_migrateAttachmentsForMessageIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _migrateAttachmentsForMessage:*(void *)(a1 + 40) connection:v3];
  char v5 = +[MFMessageAttachmentMigrator log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "Did on demand migration for message %{public}@, success = %d", (uint8_t *)&v8, 0x12u);
  }
  return v4;
}

- (BOOL)_messageHasAttachmentsToMigrate:(id)a3
{
  id v4 = a3;
  char v5 = [(MFMessageAttachmentMigrator *)self library];
  id v6 = [v4 account];
  int v7 = [v5 messageBasePathForAccount:v6];

  int v8 = (void *)MEMORY[0x1E4F60B30];
  uint64_t v9 = [v4 globalMessageID];
  __int16 v10 = [v4 account];
  int v11 = objc_msgSend(v8, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v9, v7, objc_msgSend(v10, "supportsPurge"));

  uint64_t v12 = [v11 URLByAppendingPathComponent:@"Attachments"];
  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v14 = [v12 path];
  LOBYTE(v9) = [v13 fileExistsAtPath:v14];

  return v9;
}

- (BOOL)_migrateAttachmentsForMessage:(id)a3 connection:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(MFMessageAttachmentMigrator *)self library];
  v61 = v5;
  int v7 = [v5 account];
  v55 = [v6 messageBasePathForAccount:v7];

  int v8 = (void *)MEMORY[0x1E4F60B30];
  uint64_t v9 = [v5 globalMessageID];
  __int16 v10 = [v5 account];
  int v11 = objc_msgSend(v8, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v9, v55, objc_msgSend(v10, "supportsPurge"));

  v52 = v11;
  v58 = [v11 URLByAppendingPathComponent:@"Attachments"];
  v53 = +[MFAttachmentManager defaultManager];
  uint64_t v12 = [(MFMessageAttachmentMigrator *)self library];
  id v13 = [v12 persistence];
  v57 = [v13 attachmentPersistenceManager];

  [v53 attachmentsForMessage:v5 withSchemes:0];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v14)
  {
    uint64_t v56 = *(void *)v66;
    do
    {
      uint64_t v59 = v14;
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v66 != v56) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v17 = _os_activity_create(&dword_1A7EFF000, "Migrate message attachment", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
        state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
        v60 = v17;
        os_activity_scope_enter(v17, &state);
        __int16 v18 = +[MFMessageAttachmentMigrator log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v61, "ef_publicDescription");
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v20 = objc_msgSend(v16, "ef_publicDescription");
          *(_DWORD *)long long buf = 138412546;
          v70 = v19;
          __int16 v71 = 2112;
          v72 = v20;
          _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "Migrating message %@ attachment %@", buf, 0x16u);
        }
        id v21 = objc_alloc(MEMORY[0x1E4F60B10]);
        uint64_t v22 = [v61 globalMessageID];
        uint64_t v23 = [v16 fileName];
        uint64_t v24 = [v16 part];
        v25 = [v24 partNumber];
        v26 = [v16 mailDropMetadata];
        v27 = [v26 directUrl];
        v62 = (void *)[v21 initWithGlobalMessageID:v22 name:v23 mimePart:v25 attachmentID:0 remoteURL:v27];

        id v28 = v58;
        v29 = [v16 part];
        v30 = [v29 partNumber];

        if (v30)
        {
          v31 = [v16 part];
          v32 = [v31 partNumber];
          uint64_t v33 = [v28 URLByAppendingPathComponent:v32];

          id v28 = (id)v33;
        }
        v34 = [MEMORY[0x1E4F28CB8] defaultManager];
        v35 = [v28 path];
        v36 = [v34 contentsOfDirectoryAtPath:v35 error:0];
        v37 = [v36 firstObject];

        if (v37)
        {
          v38 = [v28 URLByAppendingPathComponent:v37];
          v39 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v55];
          id v63 = 0;
          int v40 = [v57 persistAttachmentWithURL:v38 attachmentMetadata:v62 basePath:v39 error:&v63];
          id v41 = v63;

          if (v40)
          {
            v42 = [MEMORY[0x1E4F28CB8] defaultManager];
            [v42 removeItemAtURL:v38 error:0];

            [v16 updatePath];
            v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v43 postNotificationName:@"LibraryMessageAttachmentDataBecameAvailableNotification" object:v61];
          }
        }
        else
        {
          v44 = +[MFMessageAttachmentMigrator log];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v61, "ef_publicDescription");
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v16, "ef_publicDescription");
            *(_DWORD *)long long buf = 138412546;
            v70 = v45;
            __int16 v71 = 2112;
            v72 = v46;
            _os_log_impl(&dword_1A7EFF000, v44, OS_LOG_TYPE_DEFAULT, "No attachment file for message %@ attachment %@. Persisting attachment metadata", buf, 0x16u);
          }
          int v40 = [v57 persistAttachmentMetadata:v62];
          id v41 = 0;
        }
        v47 = +[MFMessageAttachmentMigrator log];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          if (v40) {
            v48 = @"Successfully";
          }
          else {
            v48 = @"Unsuccessfully";
          }
          v49 = objc_msgSend(v61, "ef_publicDescription");
          v50 = objc_msgSend(v16, "ef_publicDescription");
          *(_DWORD *)long long buf = 138412802;
          v70 = v48;
          __int16 v71 = 2112;
          v72 = v49;
          __int16 v73 = 2112;
          v74 = v50;
          _os_log_impl(&dword_1A7EFF000, v47, OS_LOG_TYPE_DEFAULT, "%@ migrated message %@ attachment %@", buf, 0x20u);
        }
        os_activity_scope_leave(&state);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v14);
  }
  else
  {
    LOBYTE(v40) = 1;
  }

  return v40;
}

- (BOOL)_checkContentProtectionState
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v3 = [(MFMessageAttachmentMigrator *)self contentProtectionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MFMessageAttachmentMigrator__checkContentProtectionState__block_invoke;
  block[3] = &unk_1E5D3F590;
  block[4] = &v11;
  dispatch_sync(v3, block);

  int v4 = *((unsigned __int8 *)v12 + 24);
  if (!*((unsigned char *)v12 + 24))
  {
    id v5 = [(MFMessageAttachmentMigrator *)self migrationState];
    [v5 lock];

    id v6 = [(MFMessageAttachmentMigrator *)self migrationState];
    [v6 unlockWithCondition:1];

    int v7 = +[MFMessageAttachmentMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index unavailable", v9, 2u);
    }
  }
  _Block_object_dispose(&v11, 8);
  return v4 != 0;
}

uint64_t __59__MFMessageAttachmentMigrator__checkContentProtectionState__block_invoke(uint64_t a1)
{
  uint64_t result = EFProtectedDataAvailable();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_setMigratingAttachmentsOnThread:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [MEMORY[0x1E4F29060] currentThread];
  id v5 = [v4 threadDictionary];

  if (v3) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"com.apple.mail.attachmentMigrator"];
  }
  else {
    [v5 removeObjectForKey:@"com.apple.mail.attachmentMigrator"];
  }
}

- (BOOL)_isMigratingAttachmentsOnThread
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  BOOL v3 = [v2 threadDictionary];

  int v4 = [v3 objectForKeyedSubscript:@"com.apple.mail.attachmentMigrator"];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

+ (BOOL)migrateMaildropFileForMessage:(id)a3 mailDropMetadata:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = v5;
    v35 = +[MFMailMessageLibrary defaultInstance];
    int v8 = [v7 account];
    v34 = [v35 messageBasePathForAccount:v8];

    uint64_t v9 = (void *)MEMORY[0x1E4F60B30];
    uint64_t v10 = [v7 globalMessageID];
    uint64_t v11 = [v7 account];
    uint64_t v12 = objc_msgSend(v9, "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", v10, v34, objc_msgSend(v11, "supportsPurge"));

    uint64_t v33 = v12;
    uint64_t v13 = [v12 URLByAppendingPathComponent:@"Attachments"];
    char v14 = [v6 fileName];
    objc_super v15 = objc_msgSend(v14, "ef_sanitizedFileName");
    int v16 = [v13 URLByAppendingPathComponent:v15];

    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v18 = [v16 path];
    LODWORD(v9) = [v17 fileExistsAtPath:v18];

    if (v9)
    {
      v19 = [v35 persistence];
      uint64_t v20 = [v19 attachmentPersistenceManager];

      id v21 = objc_alloc(MEMORY[0x1E4F60B10]);
      uint64_t v22 = [v7 globalMessageID];
      uint64_t v23 = [v6 fileName];
      uint64_t v24 = [v6 directUrl];
      v25 = (void *)[v21 initWithGlobalMessageID:v22 name:v23 mimePart:0 attachmentID:0 remoteURL:v24];

      v26 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v34];
      int v27 = [v20 persistAttachmentWithURL:v16 attachmentMetadata:v25 basePath:v26 error:0];

      if (v27)
      {
        id v28 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v28 removeItemAtURL:v16 error:0];
      }
    }
    else
    {
      v31 = +[MFMessageAttachmentMigrator log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v37 = v16;
        _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "No file exists at this path to persist legacy file url: %@", buf, 0xCu);
      }

      LOBYTE(v27) = 0;
    }
  }
  else
  {
    int v7 = +[MFMessageAttachmentMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)long long buf = 138543362;
      v37 = v30;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Unable to migrateMaildropFileForMessage since current message with class %{public}@ is not MFLibraryMessage", buf, 0xCu);
    }
    LOBYTE(v27) = 0;
  }

  return v27;
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  id v6 = [(MFMessageAttachmentMigrator *)self contentProtectionQueue];
  dispatch_assert_queue_V2(v6);

  if (a3 == 2)
  {
    uint64_t v10 = +[MFMessageAttachmentMigrator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_DEFAULT, "Device about to lock", v12, 2u);
    }

    uint64_t v11 = [(MFMessageAttachmentMigrator *)self migrationState];
    [v11 lock];

    uint64_t v9 = [(MFMessageAttachmentMigrator *)self migrationState];
    [v9 unlockWithCondition:1];
  }
  else
  {
    if (a3) {
      return;
    }
    int v7 = +[MFMessageAttachmentMigrator log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index became available", buf, 2u);
    }

    int v8 = [(MFMessageAttachmentMigrator *)self migrationState];
    [v8 lock];

    uint64_t v9 = [(MFMessageAttachmentMigrator *)self migrationState];
    [v9 unlockWithCondition:0];
  }
}

- (MFMailMessageLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (void)setLibrary:(id)a3
{
}

- (EFScheduler)backgroundMigrationScheduler
{
  return self->_backgroundMigrationScheduler;
}

- (void)setBackgroundMigrationScheduler:(id)a3
{
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (NSConditionLock)migrationState
{
  return self->_migrationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationState, 0);
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_backgroundMigrationScheduler, 0);
  objc_destroyWeak((id *)&self->_library);
}

@end