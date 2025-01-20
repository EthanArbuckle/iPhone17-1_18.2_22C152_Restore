@interface MFMailMessageLibraryGlobalDataUpgradeStep
+ (BOOL)_recreateMessagesIndices:(id)a3;
+ (id)_messagesTableDefinition;
+ (id)_triggerDefinition;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryGlobalDataUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  if (([v4 executeStatementString:@"CREATE TABLE message_global_data (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\nmessage_id INTEGER,\nUNIQUE(message_id) ON CONFLICT ABORT)" errorMessage:@"Creating message_global_data"] & 1) == 0)goto LABEL_11; {
  if (![v4 executeStatementString:@"INSERT INTO message_global_data (message_id) SELECT DISTINCT message_id FROM messages" errorMessage:@"Populating message_global_data table"])goto LABEL_11;
  }
  if (!objc_msgSend(v4, "executeStatementString:errorMessage:", @"DROP TRIGGER IF EXISTS after_delete_message;\n",
                        @"Dropping trigger"))
    goto LABEL_11;
  if (![v4 executeStatementString:@"ALTER TABLE messages RENAME TO messages_old" errorMessage:@"Moving messages table aside"])goto LABEL_11; {
  v5 = [a1 _messagesTableDefinition];
  }
  char v6 = [v4 executeStatementString:v5 errorMessage:@"Adding new messages table"];

  if ((v6 & 1) == 0) {
    goto LABEL_11;
  }
  if [v4 executeStatementString:@"INSERT INTO messages (ROWID, message_id, global_message_id, remote_id, document_id, sender, subject_prefix, subject, summary, date_sent, date_received, mailbox, remote_mailbox, flags, read, flagged, deleted, size, conversation_id, date_last_viewed, original_mailbox, visible, sender_vip, encoding, content_type, sequence_identifier, external_id, unique_id, content_index_transaction_id, list_id_hash, journaled, flag_color, searchable_message) SELECT messages_old.ROWID, messages_old.message_id, message_global_data.ROWID, remote_id, document_id, sender, subject_prefix, subject, summary, date_sent, date_received, mailbox, remote_mailbox, flags, read, flagged, deleted, size, conversation_id, date_last_viewed, original_mailbox, visible, sender_vip, encoding, content_type, sequence_identifier, external_id, unique_id, content_index_transaction_id, list_id_hash, journaled, flag_color, searchable_message FROM messages_old JOIN message_global_data ON messages_old.message_id = message_global_data.message_id", @"Copying messages to new table" errorMessage]&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DROP TABLE messages_old", @"Dropping old messages table")&& objc_msgSend(a1, "_recreateMessagesIndices:", v4)&& (objc_msgSend(a1, "_triggerDefinition"), v7 = objc_claimAutoreleasedReturnValue(), char v8 = objc_msgSend(v4, "executeStatementString:errorMessage:", v7, @"Adding trigger"), v7, (v8))
  {
    [v4 executeStatementString:@"INSERT INTO properties  (key, value) VALUES (\"NeedToMigrateFiles\",1)", @"Setting need to upgrade property" errorMessage];
    int v9 = 0;
  }
  else
  {
LABEL_11:
    int v9 = 1;
  }

  return v9;
}

+ (id)_messagesTableDefinition
{
  return @"CREATE TABLE messages (ROWID INTEGER PRIMARY KEY AUTOINCREMENT,\nmessage_id INTEGER NOT NULL DEFAULT 0,\nglobal_message_id INTEGER NOT NULL REFERENCES message_global_data(ROWID) ON DELETE CASCADE,\nremote_id INTEGER,\ndocument_id TEXT COLLATE BINARY,\nsender INTEGER,\nsubject_prefix TEXT COLLATE BINARY,\nsubject INTEGER NOT NULL,\nsummary INTEGER,\ndate_sent INTEGER,\ndate_received INTEGER,\nmailbox INTEGER NOT NULL,\nremote_mailbox INTEGER,\nflags INTEGER NOT NULL DEFAULT 0,\nread INTEGER NOT NULL DEFAULT 0,\nflagged INTEGER NOT NULL DEFAULT 0,\ndeleted INTEGER NOT NULL DEFAULT 0,\nsize INTEGER NOT NULL DEFAULT 0,\nconversation_id INTEGER NOT NULL DEFAULT 0,\ndate_last_viewed INTEGER,\noriginal_mailbox INTEGER,\nvisible INTEGER,\nsender_vip INTEGER,\nencoding INTEGER,\ncontent_type INTEGER,\nsequence_identifier INTEGER DEFAULT 0,\nexternal_id TEXT COLLATE BINARY,\nunique_id INTEGER,\ncontent_index_transaction_id INTEGER,\nlist_id_hash INTEGER,\njournaled INTEGER,\nflag_color INTEGER,\nsearchable_message INTEGER REFERENCES searchable_messages(message_id) ON DELETE SET NULL);";
}

+ (BOOL)_recreateMessagesIndices:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [&unk_1EFF50598 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(&unk_1EFF50598);
        }
        if (([v3 executeStatementString:*(void *)(*((void *)&v9 + 1) + 8 * i) errorMessage:@"Adding index"] & 1) == 0)
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [&unk_1EFF50598 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

+ (id)_triggerDefinition
{
  return @"CREATE TRIGGER after_delete_message AFTER DELETE ON messages\n    BEGIN\n        DELETE FROM message_data WHERE message_id = OLD.ROWID;\n    END;\n";
}

@end