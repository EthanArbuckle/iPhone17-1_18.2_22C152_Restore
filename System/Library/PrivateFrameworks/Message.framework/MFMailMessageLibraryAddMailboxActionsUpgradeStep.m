@interface MFMailMessageLibraryAddMailboxActionsUpgradeStep
+ (id)_readSavedOperationsAtPath:(id)a3;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryAddMailboxActionsUpgradeStep

+ (int)runWithConnection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  if ((objc_msgSend(v30, "executeStatementString:errorMessage:", @"CREATE TABLE IF NOT EXISTS mailbox_actions (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, account_identifier TEXT, action_type INTEGER, mailbox_name TEXT);",
          @"Creating mailbox_actions table") & 1) != 0)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = +[MailAccount mailAccounts];
    uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(obj);
          }
          v3 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v4 = [v3 path];
            v29 = [v4 stringByAppendingPathComponent:@".OfflineCache/operations"];

            v24 = [a1 _readSavedOperationsAtPath:v29];
            v5 = [v30 preparedStatementForQueryString:@"INSERT INTO mailbox_actions (account_identifier, action_type, mailbox_name) VALUES (?, ?, ?)"];
            long long v35 = 0u;
            long long v36 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v6 = v24;
            uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v42 count:16];
            if (v7)
            {
              uint64_t v8 = *(void *)v34;
              while (2)
              {
                for (uint64_t j = 0; j != v7; ++j)
                {
                  if (*(void *)v34 != v8) {
                    objc_enumerationMutation(v6);
                  }
                  v10 = *(void **)(*((void *)&v33 + 1) + 8 * j);
                  uint64_t v11 = [v10 operationType];
                  uint64_t v12 = [v3 identifier];
                  v13 = (void *)v12;
                  if (v11 == 1) {
                    uint64_t v14 = 1;
                  }
                  else {
                    uint64_t v14 = 2;
                  }
                  v41[0] = v12;
                  v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
                  v41[1] = v15;
                  v16 = [v10 mailboxName];
                  v41[2] = v16;
                  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];

                  id v32 = 0;
                  char v18 = [v5 executeWithIndexedBindings:v17 usingBlock:0 error:&v32];
                  id v19 = v32;
                  v20 = v19;
                  if ((v18 & 1) == 0)
                  {
                    v22 = EDLibraryLog();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                      +[MFMailMessageLibraryAddMailboxActionsUpgradeStep runWithConnection:]((uint64_t)v20, v22);
                    }

                    int v21 = 1;
                    goto LABEL_28;
                  }
                }
                uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v42 count:16];
                if (v7) {
                  continue;
                }
                break;
              }
            }
          }
        }
        int v21 = 0;
        uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v25);
    }
    else
    {
      int v21 = 0;
    }
LABEL_28:
  }
  else
  {
    int v21 = 1;
  }

  return v21;
}

+ (id)_readSavedOperationsAtPath:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (v3)
  {
    v5 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:1 error:0];
    id v6 = v5;
    if (v5)
    {
      uint64_t v13 = 0;
      unint64_t v7 = [v5 length];
      if (v7 >= 4)
      {
        do
        {
          id v8 = v6;
          uint64_t v9 = [v8 bytes];
          if (*(_WORD *)(v9 + v13) != 0x7FFF || *(unsigned __int8 *)(v9 + v13 + 2) != 255) {
            break;
          }
          v13 += 3;
          id v11 = +[_MFOldIMAPOfflineOperation deserializedCopyFromData:v8 cursor:&v13];
          if (!v11) {
            break;
          }
          [v4 addObject:v11];
        }
        while (v13 + 3 < v7);
      }
    }
  }

  return v4;
}

+ (void)runWithConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Got error %@ inserting mailboxAction", (uint8_t *)&v2, 0xCu);
}

@end