@interface MFMailMessageLibraryThreadFlagColorsUpgradeStep
+ (id)_threadsTableSchemaWithMessagesTable:(id)a3 conversationsTable:(id)a4 threadScopesTable:(id)a5;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryThreadFlagColorsUpgradeStep

+ (id)_threadsTableSchemaWithMessagesTable:(id)a3 conversationsTable:(id)a4 threadScopesTable:(id)a5
{
  v50[23] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v41 = a4;
  id v42 = a5;
  id v7 = objc_alloc(MEMORY[0x1E4F60F08]);
  v40 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"scope" nullable:0];
  v50[0] = v40;
  v39 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation" nullable:0];
  v50[1] = v39;
  v38 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"newest_read_message" nullable:1];
  v50[2] = v38;
  v37 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"display_message" nullable:1];
  v50[3] = v37;
  v36 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v50[4] = v36;
  v35 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0 defaultValue:&unk_1EFF51108];
  v50[5] = v35;
  v34 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0 defaultValue:&unk_1EFF51108];
  v50[6] = v34;
  v33 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_red_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[7] = v33;
  v32 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_orange_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[8] = v32;
  v31 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_yellow_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[9] = v31;
  v30 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_green_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[10] = v30;
  v29 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_blue_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[11] = v29;
  v28 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_purple_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[12] = v28;
  v27 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_gray_flag" nullable:0 defaultValue:&unk_1EFF51108];
  v50[13] = v27;
  v26 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"draft" nullable:0 defaultValue:&unk_1EFF51108];
  v50[14] = v26;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"replied" nullable:0 defaultValue:&unk_1EFF51108];
  v50[15] = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"forwarded" nullable:0 defaultValue:&unk_1EFF51108];
  v50[16] = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"redirected" nullable:0 defaultValue:&unk_1EFF51108];
  v50[17] = v10;
  v11 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level_set_by_user" nullable:0 defaultValue:&unk_1EFF51108];
  v50[18] = v11;
  v12 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level" nullable:0 defaultValue:&unk_1EFF51108];
  v50[19] = v12;
  v13 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_unflagged" nullable:0 defaultValue:&unk_1EFF51108];
  v50[20] = v13;
  v14 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_attachments" nullable:0 defaultValue:&unk_1EFF51108];
  v50[21] = v14;
  v15 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"count" nullable:0];
  v50[22] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:23];
  v17 = (void *)[v7 initWithName:@"threads" rowIDType:2 columns:v16];

  v49[0] = @"scope";
  v49[1] = @"conversation";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  [v17 addUniquenessConstraintForColumns:v18 conflictResolution:1];

  v48[0] = @"scope";
  v48[1] = @"date";
  v48[2] = @"conversation";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
  [v17 addIndexForColumns:v19];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke;
  aBlock[3] = &unk_1E5D3F6E0;
  id v20 = v17;
  id v47 = v20;
  v21 = _Block_copy(aBlock);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2;
  v44[3] = &unk_1E5D3F708;
  id v22 = v21;
  id v45 = v22;
  v23 = (void (**)(void *, __CFString *, id))_Block_copy(v44);
  v23[2](v23, @"scope", v42);
  v23[2](v23, @"conversation", v41);
  (*((void (**)(id, __CFString *, id, uint64_t))v22 + 2))(v22, @"newest_read_message", v43, 3);
  (*((void (**)(id, __CFString *, id, uint64_t))v22 + 2))(v22, @"display_message", v43, 3);
  id v24 = v20;

  return v24;
}

void __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  id v7 = [*(id *)(a1 + 32) columnForName:a2];
  [v7 setAsForeignKeyForTable:v8 onDelete:a4 onUpdate:0];
}

uint64_t __125__MFMailMessageLibraryThreadFlagColorsUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  if (([v4 columnExists:@"flag_color" inTable:@"messages" type:0] & 1) == 0
    && (([v4 executeStatementString:@"ALTER TABLE messages ADD COLUMN flag_color INTEGER" errorMessage:@"Adding messages.flag_color"] & 1) == 0|| !objc_msgSend(v4, "executeStatementString:errorMessage:", @"CREATE INDEX IF NOT EXISTS messages_mailbox_conversation_id_flag_color_date_received_index ON messages(mailbox, conversation_id, flag_color, date_received)", @"Creating messages_mailbox_conversation_id_flag_color_date_received_index")|| !objc_msgSend(v4, "executeStatementString:errorMessage:", @"UPDATE messages SET flag_color = ((flags & (7 << 41)) >> 41) WHERE (flags & 16) != 0", @"Setting flag_color")))
  {
    goto LABEL_17;
  }
  if (([v4 columnExists:@"has_red_flag" inTable:@"threads" type:0] & 1) == 0)
  {
    if (([v4 executeStatementString:@"DROP TABLE threads" errorMessage:@"Dropping threads"] & 1) != 0&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DROP TABLE thread_flag_colors", @"Dropping thread_flag_colors")&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DELETE FROM thread_mailboxes", @"Clearing thread_mailboxes")&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DELETE FROM thread_senders", @"Clearing thread_senders")
      && [v4 executeStatementString:@"DELETE FROM thread_recipients" errorMessage:@"Clearing thread_recipients"])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F60F08]);
      id v7 = (void *)[v6 initWithName:@"messages" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
      id v8 = objc_alloc(MEMORY[0x1E4F60F08]);
      v9 = (void *)[v8 initWithName:@"conversations" rowIDType:2 rowIDAlias:@"conversation_id" columns:MEMORY[0x1E4F1CBF0]];
      id v10 = objc_alloc(MEMORY[0x1E4F60F08]);
      v11 = (void *)[v10 initWithName:@"thread_scopes" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
      v12 = [a1 _threadsTableSchemaWithMessagesTable:v7 conversationsTable:v9 threadScopesTable:v11];
      v13 = [v12 definitionWithDatabaseName:0];
      if ([v4 executeStatementString:v13 errorMessage:@"Creating new threads"])
      {
        char v14 = [v4 executeStatementString:@"UPDATE thread_scopes SET needs_update = 1" errorMessage:@"Resetting thread_scopes"];

        if (v14) {
          goto LABEL_3;
        }
      }
      else
      {
      }
    }
LABEL_17:
    int v5 = 1;
    goto LABEL_18;
  }
LABEL_3:
  int v5 = 0;
LABEL_18:

  return v5;
}

@end