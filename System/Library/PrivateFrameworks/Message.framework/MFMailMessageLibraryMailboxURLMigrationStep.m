@interface MFMailMessageLibraryMailboxURLMigrationStep
- (BOOL)_renameMailboxDataFolders:(sqlite3 *)a3;
- (BOOL)_renameMailboxURLsForMailAccount:(id)a3 inSQLiteDB:(sqlite3 *)a4;
- (BOOL)_updateMailboxURLsInSQLitedb:(sqlite3 *)a3 withOldURLToNewURLMap:(id)a4;
- (BOOL)performMigrationStep;
- (EDPersistenceDatabaseConnection)sqliteConnection;
- (MFMailMessageLibraryMailboxURLMigrationStep)initWithSQLiteConnection:(id)a3;
- (void)_purgeFoldersMatchingPatterns:(id)a3;
- (void)setSqliteConnection:(id)a3;
@end

@implementation MFMailMessageLibraryMailboxURLMigrationStep

- (MFMailMessageLibraryMailboxURLMigrationStep)initWithSQLiteConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryMailboxURLMigrationStep;
  v6 = [(MFMailMessageLibraryMailboxURLMigrationStep *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sqliteConnection, a3);
  }

  return v7;
}

- (BOOL)performMigrationStep
{
  v3 = [(EDPersistenceDatabaseConnection *)self->_sqliteConnection sqlDB];
  return [(MFMailMessageLibraryMailboxURLMigrationStep *)self _renameMailboxDataFolders:v3];
}

- (BOOL)_renameMailboxDataFolders:(sqlite3 *)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = +[MailAccount mailAccounts];
  uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v40;
    LOBYTE(v5) = 1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v40 != v4) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v8 = objc_opt_class();
        objc_super v9 = [v7 uniqueID];
        v10 = [v7 hostname];
        v11 = [v7 username];
        v12 = [v8 legacyPathForAccountIdentifier:v9 withHostname:v10 username:v11];

        if (v12)
        {
          v13 = [v7 defaultPath];
          v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(v7, "ef_publicDescription");
            *(_DWORD *)buf = 138543874;
            v44 = v15;
            __int16 v45 = 2112;
            v46 = v12;
            __int16 v47 = 2112;
            v48 = v13;
            _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Start Migrating Mailbox FilePath for Account %{public}@ from %@ to %@...", buf, 0x20u);
          }
          char v38 = 1;
          v16 = [MEMORY[0x1E4F28CB8] defaultManager];
          if ([v16 fileExistsAtPath:v12 isDirectory:&v38])
          {
            id v37 = 0;
            char v17 = [v16 moveItemAtPath:v12 toPath:v13 error:&v37];
            id v18 = v37;
            if ((v17 & 1) == 0)
            {
              v19 = MFLogGeneral();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v29 = objc_msgSend(v18, "ef_publicDescription");
                *(_DWORD *)buf = 138412802;
                v44 = v12;
                __int16 v45 = 2112;
                v46 = v13;
                __int16 v47 = 2114;
                v48 = v29;
                _os_log_error_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_ERROR, "#MobileMailMigrator Failed to Rename Path from %@ to %@ Due to Error %{public}@. Deleting the legacyMailboxPath.", buf, 0x20u);
              }
              [v16 removeItemAtPath:v12 error:0];
            }
          }
          v20 = MFLogGeneral();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = objc_msgSend(v7, "ef_publicDescription");
            *(_DWORD *)buf = 138543362;
            v44 = v21;
            _os_log_impl(&dword_1A7EFF000, v20, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Finished Migrating Mailbox FilePath for Account: %{public}@", buf, 0xCu);
          }
          v22 = MFLogGeneral();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_msgSend(v7, "ef_publicDescription");
            *(_DWORD *)buf = 138543362;
            v44 = v23;
            _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Start Migrating Mailbox URLs for Account: %{public}@", buf, 0xCu);
          }
          BOOL v5 = [(MFMailMessageLibraryMailboxURLMigrationStep *)self _renameMailboxURLsForMailAccount:v7 inSQLiteDB:a3];
          v24 = MFLogGeneral();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = objc_msgSend(v7, "ef_publicDescription");
            *(_DWORD *)buf = 138543618;
            v44 = v25;
            __int16 v45 = 1024;
            LODWORD(v46) = v5;
            _os_log_impl(&dword_1A7EFF000, v24, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Finish Migrating Mailbox URLs for Account: %{public}@ with result %d", buf, 0x12u);
          }
          v26 = [v7 username];

          if (v26)
          {
            v27 = [v7 username];
            [v33 addObject:v27];
          }
        }
        else
        {
          v13 = MFLogGeneral();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v28 = objc_msgSend(v7, "ef_publicDescription");
            *(_DWORD *)buf = 138543362;
            v44 = v28;
            _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: No Legacy Path For Account %{public}@, skipping migration...", buf, 0xCu);
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v3);
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  v30 = MFLogGeneral();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v30, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Starting Purge of Orphaned Mailboxes...", buf, 2u);
  }

  if ([v33 count]) {
    [(MFMailMessageLibraryMailboxURLMigrationStep *)self _purgeFoldersMatchingPatterns:v33];
  }
  v31 = MFLogGeneral();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator: Finished Purge of Orphaned Mailboxes...", buf, 2u);
  }

  return v5;
}

- (BOOL)_renameMailboxURLsForMailAccount:(id)a3 inSQLiteDB:(sqlite3 *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 legacySQLExpressionToMatchAllMailboxes];
  v8 = NSString;
  objc_super v9 = objc_msgSend(v7, "ef_SQLExpression");
  id v10 = [v8 stringWithFormat:@"SELECT url FROM mailboxes WHERE %@", v9];
  v11 = (const char *)[v10 UTF8String];

  ppStmt = (sqlite3_stmt *)0xAAAAAAAAAAAAAAAALL;
  int v12 = sqlite3_prepare_v2(a4, v11, -1, &ppStmt, 0);
  int v13 = v12;
  if (!ppStmt || v12)
  {
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = v13;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Could not migrate Mailbox URLs due to sqlite error: (%d)", buf, 8u);
    }
    BOOL v22 = 0;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    while (1)
    {
      int v15 = sqlite3_step(ppStmt);
      int v16 = v15;
      if (v15 != 100) {
        break;
      }
      id v17 = [NSString alloc];
      id v18 = objc_msgSend(v17, "initWithUTF8String:", sqlite3_column_text(ppStmt, 0));
      id v19 = [NSString alloc];
      v20 = [v6 URLStringFromLegacyURLString:v18];
      v21 = (void *)[v19 initWithString:v20];

      if ([v18 length])
      {
        if ([v21 length]) {
          [v14 setObject:v21 forKey:v18];
        }
      }
    }
    BOOL v22 = v15 == 101;
    sqlite3_finalize(ppStmt);
    if (v16 != 101
      || ([v14 allKeys],
          v23 = objc_claimAutoreleasedReturnValue(),
          BOOL v24 = [v23 count] == 0,
          v23,
          v24))
    {
      v29 = MFLogGeneral();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_msgSend(v6, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        v34 = v30;
        _os_log_impl(&dword_1A7EFF000, v29, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator No Mailboxes found for account %{public}@ to migrate.", buf, 0xCu);
      }
    }
    else
    {
      v25 = MFLogGeneral();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v6, "ef_publicDescription");
        v27 = [v14 allKeys];
        v28 = [v14 allValues];
        *(_DWORD *)buf = 138543874;
        v34 = v26;
        __int16 v35 = 2112;
        v36 = v27;
        __int16 v37 = 2112;
        char v38 = v28;
        _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator For Account %{public}@ Renaming Mailboxes From URL %@ To %@", buf, 0x20u);
      }
      BOOL v22 = [(MFMailMessageLibraryMailboxURLMigrationStep *)self _updateMailboxURLsInSQLitedb:a4 withOldURLToNewURLMap:v14];
    }
  }

  return v22;
}

- (BOOL)_updateMailboxURLsInSQLitedb:(sqlite3 *)a3 withOldURLToNewURLMap:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v5 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = [v5 objectForKey:v9];
        uint64_t v11 = [v10 UTF8String];
        id v12 = v9;
        int v13 = sqlite3_mprintf("UPDATE mailboxes SET url = '%q' WHERE url = '%q';", v11, [v12 UTF8String]);
        int v14 = sqlite3_exec(a3, v13, 0, 0, 0);
        if (v14)
        {
          int v15 = MFLogGeneral();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v23 = v12;
            __int16 v24 = 2112;
            id v25 = v10;
            __int16 v26 = 1024;
            int v27 = v14;
            _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Updating mailbox table from Old URL %@ to New URL %@ failed with sqlite code (%d).", buf, 0x1Cu);
          }
        }
        sqlite3_free(v13);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v6);
  }

  return 1;
}

- (void)_purgeFoldersMatchingPatterns:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__MFMailMessageLibraryMailboxURLMigrationStep__purgeFoldersMatchingPatterns___block_invoke;
  block[3] = &unk_1E5D3B5C0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void __77__MFMailMessageLibraryMailboxURLMigrationStep__purgeFoldersMatchingPatterns___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v23 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = +[MailAccount defaultAccountDirectory];
  long long v21 = [v2 fileURLWithPath:v3];

  uint64_t v4 = *MEMORY[0x1E4F1C628];
  v37[0] = *MEMORY[0x1E4F1C628];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  long long v20 = [v23 enumeratorAtURL:v21 includingPropertiesForKeys:v5 options:5 errorHandler:0];

  uint64_t v6 = [*(id *)(a1 + 32) allObjects];
  BOOL v22 = [v6 componentsJoinedByString:@"|"];

  __int16 v24 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v22 options:1 error:0];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v20;
  uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v27 = 0;
        int v11 = [v10 getResourceValue:&v27 forKey:v4 error:0];
        id v12 = v27;
        int v13 = v12;
        if (v11 && [v12 BOOLValue])
        {
          int v14 = [v10 absoluteString];
          int v15 = [v10 absoluteString];
          uint64_t v16 = objc_msgSend(v24, "numberOfMatchesInString:options:range:", v15, 0, 0, objc_msgSend(v14, "length"));

          if (v16)
          {
            id v17 = MFLogGeneral();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v10;
              _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Purging Orphaned Mailbox storage at Directory URL %@", buf, 0xCu);
            }

            id v26 = 0;
            [v23 removeItemAtURL:v10 error:&v26];
            id v18 = v26;
            if (v18)
            {
              long long v19 = MFLogGeneral();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v33 = v10;
                __int16 v34 = 2112;
                id v35 = v18;
                _os_log_impl(&dword_1A7EFF000, v19, OS_LOG_TYPE_DEFAULT, "#MobileMailMigrator Unable to delete Orphaned Mailbox storage at Directory URL %@ due to Error: %@.", buf, 0x16u);
              }
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v7);
  }
}

- (EDPersistenceDatabaseConnection)sqliteConnection
{
  return self->_sqliteConnection;
}

- (void)setSqliteConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end