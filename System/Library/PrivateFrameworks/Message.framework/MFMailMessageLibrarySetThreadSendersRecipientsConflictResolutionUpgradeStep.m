@interface MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep
+ (EFSQLTableSchema)threadRecipientsTableSchema;
+ (EFSQLTableSchema)threadSendersTableSchema;
+ (id)_schemaWithThreadsTable:(id)a3;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep

+ (EFSQLTableSchema)threadSendersTableSchema
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v16[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v16[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v16[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"priority" nullable:0 defaultValue:&unk_1EFF510F0];
  v16[3] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v15[0] = @"thread";
  v15[1] = @"address";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v9 = (void *)[v2 initWithName:@"thread_senders" columns:v7 primaryKeyColumns:v8 conflictResolution:5];

  v14[0] = @"address";
  v14[1] = @"thread";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v9 addIndexForColumns:v10];

  v13[0] = @"thread";
  v13[1] = @"priority";
  v13[2] = @"date";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v9 addIndexForColumns:v11];

  return (EFSQLTableSchema *)v9;
}

+ (EFSQLTableSchema)threadRecipientsTableSchema
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v17[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v17[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:0];
  v17[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v17[3] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"priority" nullable:0 defaultValue:&unk_1EFF510F0];
  v17[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v16[0] = @"thread";
  v16[1] = @"type";
  v16[2] = @"address";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v10 = (void *)[v2 initWithName:@"thread_recipients" columns:v8 primaryKeyColumns:v9 conflictResolution:5];

  v15[0] = @"address";
  v15[1] = @"thread";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v10 addIndexForColumns:v11];

  v14[0] = @"thread";
  v14[1] = @"priority";
  void v14[2] = @"date";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v10 addIndexForColumns:v12];

  return (EFSQLTableSchema *)v10;
}

+ (id)_schemaWithThreadsTable:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 threadSendersTableSchema];
  v6 = [a1 threadRecipientsTableSchema];
  __103__MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep__schemaWithThreadsTable___block_invoke((uint64_t)v6, v5, @"thread", v4);
  __103__MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep__schemaWithThreadsTable___block_invoke(v7, v6, @"thread", v4);
  id v8 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v12[0] = v5;
  v12[1] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = (void *)[v8 initWithTables:v9];

  return v10;
}

void __103__MFMailMessageLibrarySetThreadSendersRecipientsConflictResolutionUpgradeStep__schemaWithThreadsTable___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v6 = [a2 columnForName:a3];
  [v6 setAsForeignKeyForTable:v7 onDelete:2 onUpdate:0];
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  if (([v4 executeStatementString:@"ALTER TABLE thread_senders RENAME TO thread_senders_old" errorMessage:@"Renaming thread_senders"] & 1) != 0&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"ALTER TABLE thread_recipients RENAME TO thread_recipients_old", @"Renaming thread_recipients"))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F60F08]);
    v6 = (void *)[v5 initWithName:@"threads" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
    id v7 = [a1 _schemaWithThreadsTable:v6];
    id v8 = [v7 definitionWithDatabaseName:0];
    if (([v4 executeStatementString:v8 errorMessage:@"Creating new thread_senders and thread_recipients"] & 1) != 0&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"INSERT INTO thread_senders SELECT * FROM thread_senders_old", @"Repopulating thread_senders")&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"INSERT INTO thread_recipients SELECT * FROM thread_recipients_old", @"Repopulating thread_recipients")&& objc_msgSend(v4, "executeStatementString:errorMessage:", @"DROP TABLE thread_senders_old", @"Dropping old thread_senders"))
    {
      int v9 = [v4 executeStatementString:@"DROP TABLE thread_recipients_old" errorMessage:@"Dropping old thread_recipients"] ^ 1;
    }
    else
    {
      int v9 = 1;
    }
  }
  else
  {
    int v9 = 1;
  }

  return v9;
}

@end