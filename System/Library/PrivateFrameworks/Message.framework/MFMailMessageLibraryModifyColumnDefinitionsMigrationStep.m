@interface MFMailMessageLibraryModifyColumnDefinitionsMigrationStep
- (BOOL)performMigrationStep;
- (EDPersistenceDatabaseConnection)connection;
- (EFSQLSchema)schema;
- (MFMailMessageLibraryModifyColumnDefinitionsMigrationStep)initWithSQLiteConnection:(id)a3;
- (id)actionFlagsTableSchema;
- (id)actionLabelsTableSchema;
- (id)actionMessagesTableSchema;
- (id)localMessageActionsTableSchema;
- (id)mailboxesTableStubSchema;
- (id)messagesTableStubSchema;
- (id)serverLabelsTableSchema;
- (id)serverMessagesTableSchema;
- (void)setConnection:(id)a3;
@end

@implementation MFMailMessageLibraryModifyColumnDefinitionsMigrationStep

- (MFMailMessageLibraryModifyColumnDefinitionsMigrationStep)initWithSQLiteConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFMailMessageLibraryModifyColumnDefinitionsMigrationStep;
  v6 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (EFSQLSchema)schema
{
  v28[8] = *MEMORY[0x1E4F143B8];
  v3 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self messagesTableStubSchema];
  v4 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self mailboxesTableStubSchema];
  id v5 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self serverMessagesTableSchema];
  v6 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self serverLabelsTableSchema];
  v7 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self localMessageActionsTableSchema];
  v8 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self actionMessagesTableSchema];
  objc_super v9 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self actionLabelsTableSchema];
  v10 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self actionFlagsTableSchema];
  v11 = [v5 columnForName:@"message"];
  [v11 setAsForeignKeyForTable:v3 onDelete:3 onUpdate:0];

  v12 = [v5 columnForName:@"mailbox"];
  [v12 setAsForeignKeyForTable:v4 onDelete:2 onUpdate:0];

  v13 = [v6 columnForName:@"server_message"];
  [v13 setAsForeignKeyForTable:v5 onDelete:2 onUpdate:0];

  v14 = [v6 columnForName:@"label"];
  [v14 setAsForeignKeyForTable:v4 onDelete:2 onUpdate:0];

  v15 = [v7 columnForName:@"mailbox"];
  [v15 setAsForeignKeyForTable:v4 onDelete:2 onUpdate:0];

  v16 = [v7 columnForName:@"source_mailbox"];
  [v16 setAsForeignKeyForTable:v4 onDelete:2 onUpdate:0];

  v17 = [v7 columnForName:@"destination_mailbox"];
  [v17 setAsForeignKeyForTable:v4 onDelete:2 onUpdate:0];

  v18 = [v8 columnForName:@"action"];
  [v18 setAsForeignKeyForTable:v7 onDelete:2 onUpdate:0];

  v19 = [v8 columnForName:@"message"];
  [v19 setAsForeignKeyForTable:v3 onDelete:3 onUpdate:0];

  v20 = [v8 columnForName:@"destination_message"];
  [v20 setAsForeignKeyForTable:v3 onDelete:2 onUpdate:0];

  v21 = [v9 columnForName:@"action"];
  [v21 setAsForeignKeyForTable:v7 onDelete:2 onUpdate:0];

  v22 = [v9 columnForName:@"label"];
  [v22 setAsForeignKeyForTable:v4 onDelete:2 onUpdate:0];

  v23 = [v10 columnForName:@"action"];
  [v23 setAsForeignKeyForTable:v7 onDelete:2 onUpdate:0];

  id v24 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v28[0] = v3;
  v28[1] = v4;
  v28[2] = v5;
  v28[3] = v6;
  v28[4] = v7;
  v28[5] = v8;
  v28[6] = v9;
  v28[7] = v10;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:8];
  v26 = (void *)[v24 initWithTables:v25];

  return (EFSQLSchema *)v26;
}

- (id)messagesTableStubSchema
{
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = (void *)[v2 initWithName:@"messages" rowIDType:1 columns:MEMORY[0x1E4F1CBF0]];
  return v3;
}

- (id)mailboxesTableStubSchema
{
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = (void *)[v2 initWithName:@"mailboxes" rowIDType:1 columns:MEMORY[0x1E4F1CBF0]];
  return v3;
}

- (id)serverMessagesTableSchema
{
  v24[14] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v21 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:1];
  v24[0] = v21;
  v20 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:0];
  v24[1] = v20;
  v19 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sequence_identifier" nullable:1];
  v24[2] = v19;
  v18 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0];
  v24[3] = v18;
  v17 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"deleted" nullable:0];
  v24[4] = v17;
  v16 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"replied" nullable:0];
  v24[5] = v16;
  v15 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0];
  v24[6] = v15;
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"draft" nullable:0];
  v24[7] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"forwarded" nullable:0];
  v24[8] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"redirected" nullable:0];
  v24[9] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level_set_by_user" nullable:0];
  v24[10] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level" nullable:0];
  v24[11] = v7;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_color" nullable:0];
  v24[12] = v8;
  objc_super v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"remote_id" nullable:0];
  v24[13] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:14];
  v11 = (void *)[v2 initWithName:@"server_messages" rowIDType:2 columns:v10];

  v23[0] = @"mailbox";
  v23[1] = @"remote_id";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v11 addUniquenessConstraintForColumns:v12 conflictResolution:1];

  v22 = @"message";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v11 addIndexForColumns:v13];

  return v11;
}

- (id)serverLabelsTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"server_message" nullable:1];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"label" nullable:1];
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v9[0] = @"server_message";
  v9[1] = @"label";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = (void *)[v2 initWithName:@"server_labels" columns:v5 primaryKeyColumns:v6];

  return v7;
}

- (id)localMessageActionsTableSchema
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  v14[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"source_mailbox" nullable:1];
  v14[1] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"destination_mailbox" nullable:1];
  v14[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action_type" nullable:1];
  v14[3] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"user_initiated" nullable:1];
  v14[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:5];
  objc_super v9 = (void *)[v2 initWithName:@"local_message_actions" rowIDType:2 columns:v8];

  uint64_t v10 = *MEMORY[0x1E4F60D08];
  v13[0] = @"mailbox";
  v13[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v9 addIndexForColumns:v11];

  return v9;
}

- (id)actionMessagesTableSchema
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action" nullable:1];
  v17[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action_phase" nullable:1];
  v17[1] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:1];
  v17[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"remote_id" nullable:1];
  v17[3] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"destination_message" nullable:1];
  v17[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  objc_super v9 = (void *)[v2 initWithName:@"action_messages" rowIDType:1 columns:v8];

  v16 = @"action";
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v9 addIndexForColumns:v10];

  v15 = @"message";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  [v9 addIndexForColumns:v11];

  v14 = @"destination_message";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v9 addIndexForColumns:v12];

  return v9;
}

- (id)actionLabelsTableSchema
{
  v13[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action" nullable:1];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"do_add" nullable:1];
  v13[1] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"label" nullable:1];
  void v13[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v7 = (void *)[v2 initWithName:@"action_labels" rowIDType:1 columns:v6];

  v12 = @"action";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v7 addIndexForColumns:v8];

  v11 = @"label";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  [v7 addIndexForColumns:v9];

  return v7;
}

- (id)actionFlagsTableSchema
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"action" nullable:1];
  v11[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_type" nullable:1];
  v11[1] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_value" nullable:1];
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  v7 = (void *)[v2 initWithName:@"action_flags" rowIDType:1 columns:v6];

  uint64_t v10 = @"action";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  [v7 addIndexForColumns:v8];

  return v7;
}

- (BOOL)performMigrationStep
{
  v3 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self connection];
  v4 = [(MFMailMessageLibraryModifyColumnDefinitionsMigrationStep *)self schema];
  int v5 = [v3 executeStatementString:@"ALTER TABLE server_messages RENAME TO server_messages_old" errorMessage:@"Renaming old server_messages"];
  v6 = [v4 tableForName:@"server_messages"];
  v7 = [v6 definitionWithDatabaseName:0];

  if (v5
    && [v3 executeStatementString:v7 errorMessage:@"Creating new server_messages"]
    && [v3 executeStatementString:@"INSERT INTO server_messages SELECT * FROM server_messages_old" errorMessage:@"Populating new server_messages from old server_messages"]&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS server_messages_old", @"Dropping old server_messages")&& objc_msgSend(v3, "executeStatementString:errorMessage:", v7, @"Creating new indexes for server_messages"))
  {
    int v8 = [v3 executeStatementString:@"ALTER TABLE local_message_actions RENAME TO local_message_actions_old" errorMessage:@"Renaming old local_message_actions"];
  }
  else
  {
    int v8 = 0;
  }
  objc_super v9 = [v4 tableForName:@"local_message_actions"];
  uint64_t v10 = [v9 definitionWithDatabaseName:0];

  if (v8)
  {
    if ([v3 executeStatementString:v10 errorMessage:@"Creating new local_message_actions"]&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"INSERT INTO local_message_actions SELECT * FROM local_message_actions_old", @"Populating new local_message_actions from old local_message_actions")&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS local_message_actions_old", @"Dropping old local_message_actions"))
    {
      LOBYTE(v8) = [v3 executeStatementString:v10 errorMessage:@"Creating new indexes for local_message_actions"];
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
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

@end