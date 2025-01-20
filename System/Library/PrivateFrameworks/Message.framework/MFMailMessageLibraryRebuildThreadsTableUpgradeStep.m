@interface MFMailMessageLibraryRebuildThreadsTableUpgradeStep
+ (id)_threadsTableSchemaWithMessagesTable:(id)a3 conversationsTable:(id)a4 threadScopesTable:(id)a5;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryRebuildThreadsTableUpgradeStep

+ (id)_threadsTableSchemaWithMessagesTable:(id)a3 conversationsTable:(id)a4 threadScopesTable:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v50 = a4;
  id v51 = a5;
  id v7 = objc_alloc(MEMORY[0x1E4F60F08]);
  uint64_t v63 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"scope" nullable:0];
  v49 = (void *)v63;
  uint64_t v64 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation" nullable:0];
  v48 = (void *)v64;
  v47 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"newest_read_message" nullable:1];
  v65 = v47;
  v46 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"display_message" nullable:1];
  v66 = v46;
  v45 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v67 = v45;
  v44 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0 defaultValue:&unk_1EFF510C0];
  v68 = v44;
  v43 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0 defaultValue:&unk_1EFF510C0];
  v69 = v43;
  v42 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_red_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v70 = v42;
  v41 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_orange_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v71 = v41;
  v40 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_yellow_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v72 = v40;
  v39 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_green_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v73 = v39;
  v38 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_blue_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v74 = v38;
  v37 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_purple_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v75 = v37;
  v36 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_gray_flag" nullable:0 defaultValue:&unk_1EFF510C0];
  v76 = v36;
  v35 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"draft" nullable:0 defaultValue:&unk_1EFF510C0];
  v77 = v35;
  v34 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"replied" nullable:0 defaultValue:&unk_1EFF510C0];
  v78 = v34;
  v33 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"forwarded" nullable:0 defaultValue:&unk_1EFF510C0];
  v79 = v33;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"redirected" nullable:0 defaultValue:&unk_1EFF510C0];
  v80 = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level_set_by_user" nullable:0 defaultValue:&unk_1EFF510C0];
  v81 = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level" nullable:0 defaultValue:&unk_1EFF510C0];
  v82 = v10;
  v11 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_unflagged" nullable:0 defaultValue:&unk_1EFF510C0];
  v83 = v11;
  v12 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_attachments" nullable:0 defaultValue:&unk_1EFF510C0];
  v84 = v12;
  v13 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"count" nullable:0];
  v85 = v13;
  v14 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"journaled" nullable:0 defaultValue:&unk_1EFF510C0];
  v86 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:24];
  v16 = (void *)[v7 initWithName:@"threads" rowIDType:2 columns:v15];

  v62[0] = @"scope";
  v62[1] = @"conversation";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  [v16 addUniquenessConstraintForColumns:v17 conflictResolution:1];

  v61[0] = @"scope";
  v61[1] = @"date";
  v61[2] = @"conversation";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
  [v16 addIndexForColumns:v18];

  v60[0] = @"journaled";
  v60[1] = @"scope";
  v60[2] = @"date";
  v60[3] = @"conversation";
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
  [v16 addIndexForColumns:v19];

  v59 = @"display_message";
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  [v16 addIndexForColumns:v20];

  v58 = @"newest_read_message";
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
  [v16 addIndexForColumns:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v57[0] = @"journaled";
  v57[1] = @"date";
  v57[2] = @"scope";
  v57[3] = @"conversation";
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
  v24 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  v25 = [v24 equalTo:&unk_1EFF510D8];
  v26 = (void *)[v22 initWithTableName:@"threads" columnNames:v23 where:v25 unique:0];

  [v16 addIndex:v26];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke;
  aBlock[3] = &unk_1E5D3F6E0;
  id v27 = v16;
  id v56 = v27;
  v28 = _Block_copy(aBlock);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2;
  v53[3] = &unk_1E5D3F708;
  id v29 = v28;
  id v54 = v29;
  v30 = (void (**)(void *, __CFString *, id))_Block_copy(v53);
  v30[2](v30, @"scope", v51);
  v30[2](v30, @"conversation", v50);
  (*((void (**)(id, __CFString *, id, uint64_t))v29 + 2))(v29, @"newest_read_message", v52, 3);
  (*((void (**)(id, __CFString *, id, uint64_t))v29 + 2))(v29, @"display_message", v52, 3);
  id v31 = v27;

  return v31;
}

void __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = a3;
  id v7 = [*(id *)(a1 + 32) columnForName:a2];
  [v7 setAsForeignKeyForTable:v8 onDelete:a4 onUpdate:0];
}

uint64_t __128__MFMailMessageLibraryRebuildThreadsTableUpgradeStep__threadsTableSchemaWithMessagesTable_conversationsTable_threadScopesTable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  if (([v4 executeStatementString:@"DROP TABLE threads" errorMessage:@"Dropping threads"] & 1) != 0
    && [v4 executeStatementString:@"DELETE FROM thread_scopes" errorMessage:@"Clearing thread_scopes"]&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DELETE FROM thread_mailboxes", @"Clearing thread_mailboxes")&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DELETE FROM thread_senders", @"Clearing thread_senders")&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DELETE FROM thread_recipients", @"Clearing thread_recipients"))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F60F08]);
    v6 = (void *)[v5 initWithName:@"messages" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
    id v7 = objc_alloc(MEMORY[0x1E4F60F08]);
    id v8 = (void *)[v7 initWithName:@"conversations" rowIDType:2 rowIDAlias:@"conversation_id" columns:MEMORY[0x1E4F1CBF0]];
    id v9 = objc_alloc(MEMORY[0x1E4F60F08]);
    v10 = (void *)[v9 initWithName:@"thread_scopes" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
    v11 = [a1 _threadsTableSchemaWithMessagesTable:v6 conversationsTable:v8 threadScopesTable:v10];
    v12 = [v11 definitionWithDatabaseName:0];
    int v13 = [v4 executeStatementString:v12 errorMessage:@"Creating new threads"] ^ 1;
  }
  else
  {
    int v13 = 1;
  }

  return v13;
}

@end