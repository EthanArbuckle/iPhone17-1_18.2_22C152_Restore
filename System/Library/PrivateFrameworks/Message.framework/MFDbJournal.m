@interface MFDbJournal
+ (id)_journalForMailbox:(id)a3;
+ (id)legacyJournal;
+ (int64_t)mergeAllJournalsUsingConnection:(id)a3;
+ (void)initialize;
- (BOOL)_markMailboxForReconciliation:(BOOL)a3 connection:(id)a4;
- (MFDbJournal)initWithMailbox:(id)a3;
- (int)_processJournalFile:(id)a3 connection:(id)a4;
- (int64_t)mergeUsingConnection:(id)a3;
- (void)dealloc;
@end

@implementation MFDbJournal

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = (void *)_journals;
    _journals = (uint64_t)v2;
  }
}

- (MFDbJournal)initWithMailbox:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MFDbJournal;
  v6 = [(MFDbJournal *)&v13 init];
  v7 = v6;
  if (v6)
  {
    pthread_mutex_init(&v6->_lock, 0);
    v7->_fd = -1;
    objc_storeStrong((id *)&v7->_mailbox, a3);
    v8 = [v5 fullPath];
    v9 = v8;
    if (v8) {
      [v8 stringByAppendingPathComponent:@"Journal"];
    }
    else {
    uint64_t v10 = NSTemporaryDirectory();
    }
    path = v7->_path;
    v7->_path = (NSString *)v10;
  }
  return v7;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  int fd = self->_fd;
  if (fd != -1) {
    close(fd);
  }
  v4.receiver = self;
  v4.super_class = (Class)MFDbJournal;
  [(MFDbJournal *)&v4 dealloc];
}

+ (id)_journalForMailbox:(id)a3
{
  id v3 = a3;
  id v4 = (id)_journals;
  objc_sync_enter(v4);
  id v5 = [(id)_journals objectForKey:v3];
  if (!v5)
  {
    id v5 = [[MFDbJournal alloc] initWithMailbox:v3];
    [(id)_journals setObject:v5 forKey:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

+ (id)legacyJournal
{
  id v2 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library"];
  id v3 = [v2 stringByAppendingPathComponent:@"Mail"];

  id v4 = [v3 stringByAppendingPathComponent:@"Vault"];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4 isDirectory:0];

  if (v6)
  {
    v7 = [[MFDbJournal alloc] initWithMailbox:0];
    objc_storeStrong((id *)&v7->_path, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int)_processJournalFile:(id)a3 connection:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  unsigned int v33 = -1431655766;
  unsigned int v34 = -1431655766;
  size_t v7 = NSPageSize();
  v8 = EDLibraryLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 138412290;
    *(void *)v36 = v5;
    _os_log_impl(&dword_1A7EFF000, v8, OS_LOG_TYPE_DEFAULT, "processing journal file %@", (uint8_t *)&v35, 0xCu);
  }

  v9 = malloc_type_malloc(v7, 0xE40C48CCuLL);
  if (!v9) {
    __assert_rtn("-[MFDbJournal _processJournalFile:connection:]", "MFDbJournal.m", 140, "buf && \"failed to allocate buffer during journal merge\"");
  }
  id v10 = v5;
  int v11 = open((const char *)[v10 fileSystemRepresentation], 0);
  int v12 = v11;
  if (v11 == -1)
  {
    v21 = v10;
    v22 = EDLibraryLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v30 = *__error();
      v31 = __error();
      v32 = strerror(*v31);
      int v35 = 67109890;
      *(_DWORD *)v36 = v30;
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = @"opening journal file";
      *(_WORD *)&v36[14] = 2112;
      *(void *)&v36[16] = v21;
      __int16 v37 = 2080;
      v38 = v32;
      _os_log_error_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_ERROR, "Error %d %@ at path %@: %s", (uint8_t *)&v35, 0x26u);
    }

    goto LABEL_22;
  }
  ssize_t v13 = read(v11, &v33, 4uLL);
  if (v13 != 4)
  {
    v21 = EDLibraryLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 134218240;
      *(void *)v36 = 4;
      *(_WORD *)&v36[8] = 2048;
      *(void *)&v36[10] = v13;
      v23 = "read wrong number of version bytes from journal, expected: %lu actual: %zd";
      v24 = v21;
      uint32_t v25 = 22;
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v33 == 1)
  {
    while (1)
    {
      if (read(v12, &v34, 4uLL) < 1)
      {
        int v26 = 0;
        goto LABEL_23;
      }
      size_t v14 = v34;
      unint64_t v15 = v34 + 4;
      if (v15 > v7)
      {
        v16 = malloc_type_realloc(v9, v34 + 4, 0x96530317uLL);
        if (!v16)
        {
          v21 = EDLibraryLog();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_22;
          }
          LOWORD(v35) = 0;
          v23 = "realloc failed when merging journal with database";
          v24 = v21;
          uint32_t v25 = 2;
LABEL_21:
          _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v35, v25);
          goto LABEL_22;
        }
        size_t v14 = v34;
        size_t v7 = v15;
        v9 = v16;
      }
      ssize_t v17 = read(v12, v9, v14);
      ssize_t v18 = v17;
      if (v17 != v34)
      {
        v21 = EDLibraryLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = 134218240;
          *(void *)v36 = v34;
          *(_WORD *)&v36[8] = 2048;
          *(void *)&v36[10] = v18;
          _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "read wrong number of bytes from journal, expected: %lu actual: %zd", (uint8_t *)&v35, 0x16u);
        }
        goto LABEL_22;
      }
      *((unsigned char *)v9 + v17) = 0;
      int v19 = sqlite3_exec((sqlite3 *)[v6 sqlDB], (const char *)v9, 0, 0, 0);
      if (v19)
      {
        v20 = (sqlite3 *)[v6 sqlDB];
        v21 = objc_msgSend(NSString, "stringWithFormat:", @"executing SQL statement from journal (%s)", v9);
        MFLogSQLiteError(v20, v19, v21);
        goto LABEL_22;
      }
    }
  }
  v21 = EDLibraryLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 67109376;
    *(_DWORD *)v36 = 1;
    *(_WORD *)&v36[4] = 2048;
    *(void *)&v36[6] = v33;
    v23 = "found journal file of wrong version, expected: %d actual: %lu";
    v24 = v21;
    uint32_t v25 = 18;
    goto LABEL_21;
  }
LABEL_22:

  int v26 = 1;
LABEL_23:
  free(v9);
  if ((v12 & 0x80000000) == 0) {
    close(v12);
  }
  if (v26)
  {
    int v27 = *__error();
    if (v27) {
      int v28 = v27;
    }
    else {
      int v28 = -1;
    }
  }
  else
  {
    int v28 = 0;
  }

  return v28;
}

+ (int64_t)mergeAllJournalsUsingConnection:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = +[MFDbJournal legacyJournal];
  int v28 = (void *)v5;
  if (v5) {
    [v4 addObject:v5];
  }
  int v27 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [v31 preparedStatementForQueryString:@"SELECT url FROM mailboxes WHERE reconcile = '1'"];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __47__MFDbJournal_mergeAllJournalsUsingConnection___block_invoke;
  v42[3] = &unk_1E5D3C5E8;
  id v7 = v27;
  id v43 = v7;
  id v41 = 0;
  v29 = v6;
  char v8 = [v6 executeUsingBlock:v42 error:&v41];
  id v9 = v41;
  int v30 = v9;
  if ((v8 & 1) == 0) {
    [v31 handleError:v9 message:@"getting mailboxes to be reconciled"];
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        size_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        unint64_t v15 = +[MailAccount mailboxUidFromActiveAccountsForURL:v14];
        if (v15)
        {
          v16 = [a1 _journalForMailbox:v15];
          if ([v15 mailboxType] == 7) {
            [v4 insertObject:v16 atIndex:0];
          }
          else {
            [v4 addObject:v16];
          }
        }
        else
        {
          v16 = EDLibraryLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v14;
            _os_log_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_DEFAULT, "Could not find mailbox for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v11);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  uint64_t v17 = 0;
  uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
LABEL_20:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v34 != v19) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v33 + 1) + 8 * v20);
      uint64_t v22 = [v21 mergeUsingConnection:v31];
      id v23 = (id)_journals;
      objc_sync_enter(v23);
      if (v21[2]) {
        objc_msgSend((id)_journals, "removeObjectForKey:");
      }
      objc_sync_exit(v23);

      v17 |= v22;
      if (v17) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
        if (v18) {
          goto LABEL_20;
        }
        break;
      }
    }
  }

  v24 = EDLibraryLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v25 = MFDBJournalMergeResultString(v17);
    *(_DWORD *)buf = 138412290;
    v46 = v25;
    _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "MFProtectedDatabaseMergeResult %@", buf, 0xCu);
  }
  return v17;
}

void __47__MFDbJournal_mergeAllJournalsUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectAtIndexedSubscript:0];
  id v4 = [v3 stringValue];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (int64_t)mergeUsingConnection:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  int fd = self->_fd;
  if (fd != -1)
  {
    close(fd);
    self->_int fd = -1;
  }
  id v6 = self;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v43 = p_lock;
  char v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = [v8 contentsOfDirectoryAtPath:v6->_path error:0];

  [v9 sortedArrayUsingFunction:_sortFilenamesAlphabetically context:0];
  long long v60 = 0u;
  long long v61 = 0u;
  memset(v59, 0, sizeof(v59));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:v59 objects:&buf count:16];
  if (v11)
  {
    uint64_t v12 = **(void **)&v59[16];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (**(void **)&v59[16] != v12) {
          objc_enumerationMutation(v10);
        }
        size_t v14 = [(NSString *)v6->_path stringByAppendingPathComponent:*(void *)(*(void *)&v59[8] + 8 * i)];
        [v7 addObject:v14];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:v59 objects:&buf count:16];
    }
    while (v11);
  }

  if (![v7 count])
  {
    unint64_t v15 = EDLibraryLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "No journal files found", (uint8_t *)&buf, 2u);
    }
    goto LABEL_40;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (!v16)
  {
LABEL_40:

    int64_t v39 = 0;
    goto LABEL_44;
  }
  id obj = v15;
  uint64_t v46 = *(void *)v52;
  uint64_t v18 = *MEMORY[0x1E4F28390];
  *(void *)&long long v17 = 138412546;
  long long v42 = v17;
LABEL_13:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v52 != v46) {
      objc_enumerationMutation(obj);
    }
    uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8 * v19);
    v21 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v42);
    uint64_t v22 = [v21 attributesOfItemAtPath:v20 error:0];

    id v23 = [v22 objectForKeyedSubscript:v18];
    BOOL v24 = [v23 integerValue] > 0;

    if (!v24)
    {
      int v30 = EDLibraryLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_DEFAULT, "Skipping empty journal file %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_35;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x2020000000;
    int v58 = -1431655766;
    v49[6] = &buf;
    id v50 = 0;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __36__MFDbJournal_mergeUsingConnection___block_invoke;
    v49[3] = &unk_1E5D3CFA0;
    v49[4] = v6;
    v49[5] = v20;
    char v25 = [v45 performWithOptions:3 transactionError:&v50 block:v49];
    id v26 = v50;
    int v27 = v26;
    if (*(_DWORD *)(*((void *)&buf + 1) + 24))
    {
      int v28 = EDLibraryLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        int v37 = *(_DWORD *)(*((void *)&buf + 1) + 24);
        long long v38 = strerror(v37);
        *(_DWORD *)v59 = 138412802;
        *(void *)&v59[4] = v20;
        *(_WORD *)&v59[12] = 1024;
        *(_DWORD *)&v59[14] = v37;
        *(_WORD *)&v59[18] = 2080;
        *(void *)&v59[20] = v38;
        _os_log_error_impl(&dword_1A7EFF000, v28, OS_LOG_TYPE_ERROR, "An error occurred while processing %@ (error %d: %s)", v59, 0x1Cu);
      }

      BOOL v29 = *(_DWORD *)(*((void *)&buf + 1) + 24) == 1;
LABEL_31:
      if (v29) {
        uint64_t v34 = 1;
      }
      else {
        uint64_t v34 = 2;
      }
      goto LABEL_34;
    }
    if ((v25 & 1) == 0)
    {
      int v35 = [v26 code];
      long long v36 = EDLibraryLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v59 = v42;
        *(void *)&v59[4] = v20;
        *(_WORD *)&v59[12] = 1024;
        *(_DWORD *)&v59[14] = v35;
        _os_log_error_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_ERROR, "An error occurred while committing transaction for %@ (sqlite error %d)", v59, 0x12u);
      }

      BOOL v29 = v35 == 778;
      goto LABEL_31;
    }
    id v31 = EDLibraryLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 138412290;
      *(void *)&v59[4] = v20;
      _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "Successfully reconciled journal file %@", v59, 0xCu);
    }

    id v32 = (id)MFRemoveItemAtPath();
    long long v33 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v33 createFileAtPath:v20 contents:0 attributes:0];

    uint64_t v34 = 0;
LABEL_34:

    _Block_object_dispose(&buf, 8);
    if (v34) {
      break;
    }
LABEL_35:
    if (v16 == ++v19)
    {
      uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v16) {
        goto LABEL_13;
      }
      unint64_t v15 = obj;
      goto LABEL_40;
    }
  }

  if (v34 == 1)
  {
    int64_t v39 = 1;
    goto LABEL_46;
  }
  int64_t v39 = 2;
LABEL_44:
  id v40 = (id)MFRemoveItemAtPath();
  if (v6->_mailbox)
  {
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __36__MFDbJournal_mergeUsingConnection___block_invoke_55;
    v47[3] = &unk_1E5D3CCE8;
    v47[4] = v6;
    id v48 = v45;
    [v48 performWithOptions:3 transactionError:0 block:v47];
  }
LABEL_46:
  pthread_mutex_unlock(v43);

  return v39;
}

BOOL __36__MFDbJournal_mergeUsingConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _processJournalFile:*(void *)(a1 + 40) connection:v3];
  BOOL v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;

  return v4;
}

uint64_t __36__MFDbJournal_mergeUsingConnection___block_invoke_55(uint64_t a1)
{
  return [*(id *)(a1 + 32) _markMailboxForReconciliation:0 connection:*(void *)(a1 + 40)];
}

- (BOOL)_markMailboxForReconciliation:(BOOL)a3 connection:(id)a4
{
  BOOL v4 = a3;
  [a4 preparedStatementForQueryString:@"UPDATE mailboxes SET reconcile = ? WHERE url = ?"];
  id v6 = objc_claimAutoreleasedReturnValue();
  id v7 = (sqlite3_stmt *)[v6 compiled];
  char v8 = v7;
  if (v7)
  {
    if (v4) {
      id v9 = "1";
    }
    else {
      id v9 = "0";
    }
    sqlite3_bind_text(v7, 1, v9, 1, 0);
    id v10 = [(MFMailboxUid *)self->_mailbox URLString];
    sqlite3_bind_text(v8, 2, (const char *)[v10 UTF8String], -1, 0);

    BOOL v11 = sqlite3_step(v8) == 101;
  }
  else
  {
    BOOL v11 = 0;
  }
  sqlite3_reset(v8);

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end