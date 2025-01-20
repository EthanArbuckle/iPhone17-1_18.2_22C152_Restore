@interface MFMailMessageLibraryLocalActionsTablesMigrationStep
+ (id)log;
- (BOOL)_populateServerMessages;
- (BOOL)performMigrationStep;
- (EDPersistenceDatabaseConnection)connection;
- (MFMailMessageLibraryLocalActionsTablesMigrationStep)initWithSQLiteConnection:(id)a3;
- (id)_actionFlagsActionIndexDefinition;
- (id)_actionFlagsTableDefinition;
- (id)_actionLabelsActionIndexDefinition;
- (id)_actionLabelsLabelIndexDefinition;
- (id)_actionLabelsTableDefinition;
- (id)_actionMessagesActionIndexDefinition;
- (id)_actionMessagesDestinationMessageIndexDefinition;
- (id)_actionMessagesMessageIndexDefinition;
- (id)_actionMessagesTableDefinition;
- (id)_localMessageActionsMailboxRowIDIndexDefinition;
- (id)_localMessageActionsTableDefinition;
- (id)_offlineCacheOperations;
- (id)_serverLabelsTableDefinition;
- (id)_serverMessagesMessageIndexDefinition;
- (id)_serverMessagesTableDefinition;
- (void)setConnection:(id)a3;
@end

@implementation MFMailMessageLibraryLocalActionsTablesMigrationStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MFMailMessageLibraryLocalActionsTablesMigrationStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1) {
    dispatch_once(&log_onceToken_16, block);
  }
  v2 = (void *)log_log_16;
  return v2;
}

void __58__MFMailMessageLibraryLocalActionsTablesMigrationStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;
}

- (MFMailMessageLibraryLocalActionsTablesMigrationStep)initWithSQLiteConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryLocalActionsTablesMigrationStep;
  v6 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)performMigrationStep
{
  v31[14] = *MEMORY[0x1E4F143B8];
  id v3 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self connection];
  v24 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _serverMessagesTableDefinition];
  v31[0] = v24;
  v23 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _serverMessagesMessageIndexDefinition];
  v31[1] = v23;
  v22 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _serverLabelsTableDefinition];
  v31[2] = v22;
  v21 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _localMessageActionsTableDefinition];
  v31[3] = v21;
  v20 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _localMessageActionsMailboxRowIDIndexDefinition];
  v31[4] = v20;
  v19 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionMessagesTableDefinition];
  v31[5] = v19;
  v4 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionMessagesActionIndexDefinition];
  v31[6] = v4;
  id v5 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionMessagesMessageIndexDefinition];
  v31[7] = v5;
  v6 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionMessagesDestinationMessageIndexDefinition];
  v31[8] = v6;
  v7 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionLabelsTableDefinition];
  v31[9] = v7;
  v8 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionLabelsActionIndexDefinition];
  v31[10] = v8;
  objc_super v9 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionLabelsLabelIndexDefinition];
  v31[11] = v9;
  v10 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionFlagsTableDefinition];
  v31[12] = v10;
  v11 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _actionFlagsActionIndexDefinition];
  v31[13] = v11;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:14];

  v12 = [v25 componentsJoinedByString:@"\n"];
  if (![v3 executeStatementString:v12 errorMessage:@"Creating server messages and local actions tables"]|| !-[MFMailMessageLibraryLocalActionsTablesMigrationStep _populateServerMessages](self, "_populateServerMessages"))
  {
    goto LABEL_14;
  }
  [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self _offlineCacheOperations];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v13);
        }
        if (([*(id *)(*((void *)&v26 + 1) + 8 * i) translateToLocalActionWithConnection:v3] & 1) == 0)
        {

          goto LABEL_14;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if ([v3 executeStatementString:@"DROP TABLE offline_cache_operations" errorMessage:@"Dropping offline_cache_operations"])char v17 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"DROP TABLE offline_cache_replay_data", @"Dropping offline_cache_replay_data"); {
  else
  }
LABEL_14:
    char v17 = 0;

  return v17;
}

- (BOOL)_populateServerMessages
{
  v2 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self connection];
  id v3 = objc_opt_new();
  v4 = objc_opt_new();
  [v3 addObject:@"message"];
  [v4 addObject:@"messages.ROWID"];
  [v3 addObject:@"mailbox"];
  [v4 addObject:@"messages.mailbox"];
  [v3 addObject:@"remote_id"];
  [v4 addObject:@"messages.remote_id"];
  [v3 addObject:@"read"];
  [v4 addObject:@"messages.flags & 1"];
  [v3 addObject:@"deleted"];
  [v4 addObject:@"(messages.flags & (1 << 1)) != 0"];
  [v3 addObject:@"replied"];
  [v4 addObject:@"(messages.flags & (1 << 2)) != 0"];
  [v3 addObject:@"flagged"];
  [v4 addObject:@"(messages.flags & (1 << 4)) != 0"];
  [v3 addObject:@"draft"];
  [v4 addObject:@"(messages.flags & (1 << 6)) != 0"];
  [v3 addObject:@"forwarded"];
  [v4 addObject:@"(messages.flags & (1 << 8)) != 0"];
  [v3 addObject:@"redirected"];
  [v4 addObject:@"(messages.flags & (1 << 9)) != 0"];
  [v3 addObject:@"junk_level_set_by_user"];
  [v4 addObject:@"0"];
  [v3 addObject:@"junk_level"];
  [v4 addObject:@"(((messages.flags & (1 << 21)) != 0) AND ((messages.flags & (1 << 31)) == 0)) | ((((messages.flags & (1 << 21)) == 0) AND ((messages.flags & (1 << 31)) != 0)) << 1)"];
  [v3 addObject:@"flag_color"];
  [v4 addObject:@"0"];
  id v5 = NSString;
  v6 = [v3 componentsJoinedByString:@", "];
  v7 = [v4 componentsJoinedByString:@", "];
  v8 = [v5 stringWithFormat:@"INSERT OR IGNORE INTO server_messages (%@) SELECT %@ FROM messages JOIN mailboxes ON messages.mailbox = mailboxes.ROWID WHERE %@", v6, v7, @"((messages.flags & (1 << 32)) == 0) AND (mailboxes.url LIKE 'imap://%%')"];

  LOBYTE(v6) = [v2 executeStatementString:v8 errorMessage:@"Creating server_messages from messages"];
  return (char)v6;
}

- (id)_offlineCacheOperations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(MFMailMessageLibraryLocalActionsTablesMigrationStep *)self connection];
  id v5 = [v4 preparedStatementForQueryString:@"SELECT operation_data FROM offline_cache_operations WHERE completed = '0' ORDER BY rowid ASC"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__MFMailMessageLibraryLocalActionsTablesMigrationStep__offlineCacheOperations__block_invoke;
  v13[3] = &unk_1E5D3C5E8;
  id v6 = v3;
  id v14 = v6;
  id v12 = 0;
  char v7 = [v5 executeUsingBlock:v13 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0) {
    [v4 handleError:v8 message:@"getting offline cache operations"];
  }
  objc_super v9 = v14;
  id v10 = v6;

  return v10;
}

void __78__MFMailMessageLibraryLocalActionsTablesMigrationStep__offlineCacheOperations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 dataValue];

  if ([v5 length])
  {
    id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (id)_serverMessagesTableDefinition
{
  return @"CREATE TABLE IF NOT EXISTS server_messages (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL, mailbox INTEGER NOT NULL REFERENCES mailboxes(ROWID) ON DELETE CASCADE, sequence_identifier INTEGER, read INTEGER NOT NULL, deleted INTEGER NOT NULL, replied INTEGER NOT NULL, flagged INTEGER NOT NULL, draft INTEGER NOT NULL, forwarded INTEGER NOT NULL, redirected INTEGER NOT NULL, junk_level_set_by_user INTEGER NOT NULL, junk_level INTEGER NOT NULL, flag_color INTEGER NOT NULL, remote_id INTEGER NOT NULL, UNIQUE(mailbox, remote_id) ON CONFLICT ABORT);";
}

- (id)_serverMessagesMessageIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS server_messages_message_index ON server_messages(message);";
}

- (id)_serverLabelsTableDefinition
{
  return @"CREATE TABLE IF NOT EXISTS server_labels (server_message INTEGER REFERENCES server_messages(ROWID) ON DELETE CASCADE, label INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, PRIMARY KEY(server_message, label)) WITHOUT ROWID;";
}

- (id)_localMessageActionsTableDefinition
{
  return @"CREATE TABLE IF NOT EXISTS local_message_actions (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, mailbox INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, source_mailbox INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, destination_mailbox INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE, action_type INTEGER, user_initiated INTEGER);";
}

- (id)_localMessageActionsMailboxRowIDIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS local_message_actions_mailbox_rowid_index ON local_message_actions(mailbox, ROWID);";
}

- (id)_actionMessagesTableDefinition
{
  return @"CREATE TABLE IF NOT EXISTS action_messages (ROWID INTEGER PRIMARY KEY, action INTEGER REFERENCES local_message_actions(ROWID) ON DELETE CASCADE, action_phase INTEGER, message INTEGER REFERENCES messages(ROWID) ON DELETE SET NULL, remote_id INTEGER, destination_message INTEGER REFERENCES messages(ROWID) ON DELETE CASCADE);";
}

- (id)_actionMessagesActionIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS action_messages_action_index ON action_messages(action);";
}

- (id)_actionMessagesMessageIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS action_messages_message_index ON action_messages(message);";
}

- (id)_actionMessagesDestinationMessageIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS action_messages_destination_message_index ON action_messages(destination_message);";
}

- (id)_actionLabelsTableDefinition
{
  return @"CREATE TABLE IF NOT EXISTS action_labels (ROWID INTEGER PRIMARY KEY, action INTEGER REFERENCES local_message_actions(ROWID) ON DELETE CASCADE, do_add INTEGER, label INTEGER REFERENCES mailboxes(ROWID) ON DELETE CASCADE);";
}

- (id)_actionLabelsActionIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS action_labels_action_index ON action_labels(action);";
}

- (id)_actionLabelsLabelIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS action_labels_label_index ON action_labels(label);";
}

- (id)_actionFlagsTableDefinition
{
  return @"CREATE TABLE IF NOT EXISTS action_flags (ROWID INTEGER PRIMARY KEY, action INTEGER REFERENCES local_message_actions(ROWID) ON DELETE CASCADE, flag_type INTEGER, flag_value INTEGER);";
}

- (id)_actionFlagsActionIndexDefinition
{
  return @"CREATE INDEX IF NOT EXISTS action_flags_action_index ON action_flags(action);";
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __78__MFMailMessageLibraryLocalActionsTablesMigrationStep__offlineCacheOperations__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, a2, a3, "Exception thrown while unarchiving offline cache operation: %@", (uint8_t *)&v3);
}

@end