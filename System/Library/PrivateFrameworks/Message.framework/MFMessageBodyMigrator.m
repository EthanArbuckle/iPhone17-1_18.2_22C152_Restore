@interface MFMessageBodyMigrator
+ (OS_os_log)log;
- (BOOL)_mailboxHasUnmigratedFiles:(id)a3;
- (EFLazyCache)directoryContentCache;
- (EFScheduler)backgroundMigrationScheduler;
- (MFMailMessageLibrary)library;
- (MFMessageBodyMigrator)initWithLibrary:(id)a3;
- (NSMutableArray)mailboxesToCheck;
- (id)_directoryContentsForPath:(id)a3;
- (id)_filesForMessage:(id)a3;
- (id)_legacyAttachmentDataDirectoryURLForGlobalMessageID:(int64_t)a3 basePath:(id)a4 purgeable:(BOOL)a5;
- (id)legacyAttachmentDirectoryForMessage:(id)a3;
- (void)_migrateAllFilesForMailbox:(id)a3;
- (void)_migrateDataFilesForMessage:(id)a3;
- (void)migrateBodyForMessageIfNecessary:(id)a3;
- (void)setBackgroundMigrationScheduler:(id)a3;
- (void)setDirectoryContentCache:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setMailboxesToCheck:(id)a3;
- (void)startMigratingBodies;
@end

@implementation MFMessageBodyMigrator

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MFMessageBodyMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_20 != -1) {
    dispatch_once(&log_onceToken_20, block);
  }
  v2 = (void *)log_log_20;
  return (OS_os_log *)v2;
}

void __28__MFMessageBodyMigrator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_20;
  log_log_20 = (uint64_t)v1;
}

- (MFMessageBodyMigrator)initWithLibrary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MFMessageBodyMigrator;
  v5 = [(MFMessageBodyMigrator *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_library, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:5];
    directoryContentCache = v6->_directoryContentCache;
    v6->_directoryContentCache = (EFLazyCache *)v7;

    uint64_t v9 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.MFMessageBodyMigrator" qualityOfService:9];
    backgroundMigrationScheduler = v6->_backgroundMigrationScheduler;
    v6->_backgroundMigrationScheduler = (EFScheduler *)v9;

    uint64_t v11 = objc_opt_new();
    mailboxesToCheck = v6->_mailboxesToCheck;
    v6->_mailboxesToCheck = (NSMutableArray *)v11;

    v13 = [v4 database];
    v14 = [NSString stringWithUTF8String:"-[MFMessageBodyMigrator initWithLibrary:]"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__MFMessageBodyMigrator_initWithLibrary___block_invoke;
    v17[3] = &unk_1E5D3D068;
    v15 = v6;
    v18 = v15;
    objc_msgSend(v13, "__performReadWithCaller:usingBlock:", v14, v17);

    v15->_upgradeLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

uint64_t __41__MFMessageBodyMigrator_initWithLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"url" table:@"mailboxes"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__MFMessageBodyMigrator_initWithLibrary___block_invoke_2;
  v6[3] = &unk_1E5D3C5E8;
  id v7 = *(id *)(a1 + 32);
  [v3 executeSelectStatement:v4 withBlock:v6 error:0];

  return 1;
}

void __41__MFMessageBodyMigrator_initWithLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"url"];
  id v5 = [v3 stringValue];

  id v4 = +[MailAccount mailboxUidFromActiveAccountsForURL:v5];
  if (v4) {
    [*(id *)(*(void *)(a1 + 32) + 40) addObject:v4];
  }
}

- (void)startMigratingBodies
{
  id v3 = [(MFMessageBodyMigrator *)self backgroundMigrationScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__MFMessageBodyMigrator_startMigratingBodies__block_invoke;
  v4[3] = &unk_1E5D3B5C0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __45__MFMessageBodyMigrator_startMigratingBodies__block_invoke(uint64_t a1)
{
  while (1)
  {
    v2 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock(v2);
    id v3 = [*(id *)(a1 + 32) mailboxesToCheck];
    id v4 = [v3 firstObject];

    os_unfair_lock_unlock(v2);
    id v5 = *(void **)(a1 + 32);
    if (!v4) {
      break;
    }
    if ([v5 _mailboxHasUnmigratedFiles:v4]) {
      [*(id *)(a1 + 32) _migrateAllFilesForMailbox:v4];
    }
  }
  id v6 = [v5 library];
  [v6 bodyMigrationFinished];
}

- (void)migrateBodyForMessageIfNecessary:(id)a3
{
  id v6 = a3;
  id v4 = [v6 mailbox];
  BOOL v5 = [(MFMessageBodyMigrator *)self _mailboxHasUnmigratedFiles:v4];

  if (v5) {
    [(MFMessageBodyMigrator *)self _migrateDataFilesForMessage:v6];
  }
}

- (void)_migrateDataFilesForMessage:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  v41 = [MEMORY[0x1E4F28CB8] defaultManager];
  v36 = [(MFMessageBodyMigrator *)self _filesForMessage:v42];
  if ([v36 count])
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v5 = [v42 mailbox];
    id v6 = [v5 fullPath];
    id v7 = [v6 stringByAppendingPathComponent:@"Messages"];
    v40 = [v4 fileURLWithPath:v7];

    v37 = [v42 account];
    uint64_t v8 = [(MFMessageBodyMigrator *)self library];
    v35 = [(id)v8 messageBasePathForAccount:v37];

    objc_msgSend(MEMORY[0x1E4F60B30], "messageDataDirectoryURLForGlobalMessageID:basePath:purgeable:", objc_msgSend(v42, "globalMessageID"), v35, objc_msgSend(v37, "supportsPurge"));
    v34 = self;
    v39 = uint64_t v50 = 0;
    LOBYTE(v8) = objc_msgSend(v41, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
    id v9 = 0;
    if ((v8 & 1) == 0)
    {
      v10 = +[MFMessageBodyMigrator log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[MFMessageBodyMigrator _migrateDataFilesForMessage:]((uint64_t)v9, v10);
      }
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v36;
    uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v47;
      do
      {
        uint64_t v13 = 0;
        v14 = v9;
        do
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v46 + 1) + 8 * v13);
          v16 = [v42 externalID];
          v17 = objc_msgSend(v15, "substringFromIndex:", objc_msgSend(v16, "length") + 1);

          v18 = @"full.emlx";
          if (([v17 isEqualToString:@"emlx"] & 1) == 0) {
            v18 = v17;
          }
          objc_super v19 = [v40 URLByAppendingPathComponent:v15];
          v20 = [v39 URLByAppendingPathComponent:v18];
          id v45 = v14;
          char v21 = [v41 moveItemAtURL:v19 toURL:v20 error:&v45];
          id v9 = v45;

          if ((v21 & 1) == 0)
          {
            v22 = +[MFMessageBodyMigrator log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v52 = v9;
              _os_log_error_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_ERROR, "Got error %@ creating body file directory", buf, 0xCu);
            }
          }
          ++v13;
          v14 = v9;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v11);
    }

    v23 = [(MFMessageBodyMigrator *)v34 legacyAttachmentDirectoryForMessage:v42];
    v24 = [v23 path];
    int v25 = [v41 fileExistsAtPath:v24];

    if (v25)
    {
      v26 = -[MFMessageBodyMigrator _legacyAttachmentDataDirectoryURLForGlobalMessageID:basePath:purgeable:](v34, "_legacyAttachmentDataDirectoryURLForGlobalMessageID:basePath:purgeable:", [v42 globalMessageID], v35, objc_msgSend(v37, "supportsPurge"));
      v27 = [v26 URLByDeletingLastPathComponent];
      id v44 = v9;
      char v28 = [v41 createDirectoryAtURL:v27 withIntermediateDirectories:1 attributes:0 error:&v44];
      id v29 = v44;

      if ((v28 & 1) == 0)
      {
        v30 = +[MFMessageBodyMigrator log];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[MFMessageBodyMigrator _migrateDataFilesForMessage:]((uint64_t)v29, v30);
        }
      }
      id v43 = v29;
      char v31 = [v41 moveItemAtURL:v23 toURL:v26 error:&v43];
      id v32 = v43;

      if ((v31 & 1) == 0)
      {
        v33 = +[MFMessageBodyMigrator log];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          [(MFMessageBodyMigrator *)(uint64_t)v32 _migrateDataFilesForMessage:v33];
        }
      }
    }
    else
    {
      id v32 = v9;
    }
  }
}

- (BOOL)_mailboxHasUnmigratedFiles:(id)a3
{
  id v4 = a3;
  p_upgradeLock = &self->_upgradeLock;
  os_unfair_lock_lock(&self->_upgradeLock);
  id v6 = [(MFMessageBodyMigrator *)self mailboxesToCheck];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    uint64_t v8 = [v4 fullPath];
    id v9 = [v8 stringByAppendingPathComponent:@"Messages"];

    v10 = [(MFMessageBodyMigrator *)self _directoryContentsForPath:v9];
    if ([v10 count]) {
      goto LABEL_4;
    }
    uint64_t v11 = [v4 fullPath];
    uint64_t v12 = [v11 stringByAppendingPathComponent:@"Attachments"];

    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    v14 = [v13 contentsOfDirectoryAtPath:v12 error:0];
    uint64_t v15 = [v14 count];

    if (v15)
    {
LABEL_4:
      BOOL v16 = 1;
    }
    else
    {
      v18 = [(MFMessageBodyMigrator *)self mailboxesToCheck];
      [v18 removeObject:v4];

      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
  os_unfair_lock_unlock(p_upgradeLock);

  return v16;
}

- (id)_legacyAttachmentDataDirectoryURLForGlobalMessageID:(int64_t)a3 basePath:(id)a4 purgeable:(BOOL)a5
{
  BOOL v5 = [MEMORY[0x1E4F60B30] messageDataDirectoryURLForGlobalMessageID:a3 basePath:a4 purgeable:a5];
  id v6 = [v5 URLByAppendingPathComponent:@"Attachments"];

  return v6;
}

- (void)_migrateAllFilesForMailbox:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[MFMessageCriterion criterionForMailbox:v4];
  id v6 = [(MFMessageBodyMigrator *)self library];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__MFMessageBodyMigrator__migrateAllFilesForMailbox___block_invoke;
  v10[3] = &unk_1E5D3F730;
  v10[4] = self;
  [v6 iterateMessagesMatchingCriterion:v5 options:6297663 handler:v10];

  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v4 fullPath];
  [v7 removeItemAtPath:v8 error:0];

  os_unfair_lock_lock(&self->_upgradeLock);
  id v9 = [(MFMessageBodyMigrator *)self mailboxesToCheck];
  [v9 removeObject:v4];

  os_unfair_lock_unlock(&self->_upgradeLock);
}

uint64_t __52__MFMessageBodyMigrator__migrateAllFilesForMailbox___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _migrateDataFilesForMessage:a2];
}

- (id)_filesForMessage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 externalID];
  if (v5)
  {
    id v6 = [v4 mailbox];
    int v7 = [v6 fullPath];
    uint64_t v8 = [v7 stringByAppendingPathComponent:@"Messages"];

    id v9 = [(MFMessageBodyMigrator *)self _directoryContentsForPath:v8];
    if ([v9 count])
    {
      os_unfair_lock_lock(&self->_upgradeLock);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __42__MFMessageBodyMigrator__filesForMessage___block_invoke;
      v13[3] = &unk_1E5D3F758;
      id v14 = v5;
      v10 = objc_msgSend(v9, "ef_filter:", v13);
      [v9 removeObjectsInArray:v10];

      os_unfair_lock_unlock(&self->_upgradeLock);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    uint64_t v8 = +[MFMessageBodyMigrator log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(v4, "ef_publicDescription");
      [(MFMessageBodyMigrator *)v11 _filesForMessage:v8];
    }
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

uint64_t __42__MFMessageBodyMigrator__filesForMessage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPrefix:*(void *)(a1 + 32)];
}

- (id)legacyAttachmentDirectoryForMessage:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v5 = [v3 mailbox];
  id v6 = [v5 fullPath];
  int v7 = [v6 stringByAppendingPathComponent:@"Attachments"];
  uint64_t v8 = [v4 fileURLWithPath:v7];

  id v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", objc_msgSend(v3, "libraryID"));
  v10 = [v9 stringValue];
  uint64_t v11 = [v8 URLByAppendingPathComponent:v10];

  return v11;
}

- (id)_directoryContentsForPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFMessageBodyMigrator *)self directoryContentCache];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__MFMessageBodyMigrator__directoryContentsForPath___block_invoke;
  v9[3] = &unk_1E5D3F780;
  id v6 = v4;
  id v10 = v6;
  int v7 = [v5 objectForKey:v6 generator:v9];

  return v7;
}

id __51__MFMessageBodyMigrator__directoryContentsForPath___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v2 contentsOfDirectoryAtPath:*(void *)(a1 + 32) error:0];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (MFMailMessageLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (void)setLibrary:(id)a3
{
}

- (EFLazyCache)directoryContentCache
{
  return self->_directoryContentCache;
}

- (void)setDirectoryContentCache:(id)a3
{
}

- (EFScheduler)backgroundMigrationScheduler
{
  return self->_backgroundMigrationScheduler;
}

- (void)setBackgroundMigrationScheduler:(id)a3
{
}

- (NSMutableArray)mailboxesToCheck
{
  return self->_mailboxesToCheck;
}

- (void)setMailboxesToCheck:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxesToCheck, 0);
  objc_storeStrong((id *)&self->_backgroundMigrationScheduler, 0);
  objc_storeStrong((id *)&self->_directoryContentCache, 0);
  objc_destroyWeak((id *)&self->_library);
}

- (void)_migrateDataFilesForMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Got error %@ moving attachment directory %@", (uint8_t *)&v3, 0x16u);
}

- (void)_migrateDataFilesForMessage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Got error %@ creating attachment parent directory", (uint8_t *)&v2, 0xCu);
}

- (void)_migrateDataFilesForMessage:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Got error %@ creating body file directory", (uint8_t *)&v2, 0xCu);
}

- (void)_filesForMessage:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "No externalID for message %{public}@", buf, 0xCu);
}

@end