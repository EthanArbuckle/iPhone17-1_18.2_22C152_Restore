@interface MFMailMessageLibraryAdoptSharedSchemaMigrationStep
+ (void)cleanUpAfterMigrationWithConnection:(id)a3;
- (BOOL)_cleanupOldSchema;
- (BOOL)_createIndexes;
- (BOOL)_createTemporaryTables;
- (BOOL)_dropTemporaryTables;
- (BOOL)_initializeOldProtectedSchema;
- (BOOL)_migrateData;
- (BOOL)_migrateMessages;
- (BOOL)_migrateNonMessages;
- (BOOL)_migrateSendersAndRecipients;
- (BOOL)_migrateSubjects;
- (BOOL)_migrateSummaries;
- (BOOL)_transformProtectedSchema;
- (BOOL)_transformSchema;
- (BOOL)performMigrationStep;
- (EDPersistenceDatabaseConnection)connection;
- (EFSQLSchema)protectedSchema;
- (EFSQLSchema)schema;
- (MFMailMessageLibraryAdoptSharedSchemaMigrationStep)initWithSQLiteConnection:(id)a3 protectedDatabaseName:(id)a4;
- (NSString)protectedDatabaseName;
- (id)_accountsTableSchema;
- (id)_addressesTableSchema;
- (id)_conversationIDMessageIDTableSchema;
- (id)_conversationsTableSchema;
- (id)_mailboxesTableSchema;
- (id)_messageDataDeletedTableSchema;
- (id)_messageDataTableSchema;
- (id)_messageReferencesTableSchema;
- (id)_messagesTableSchema;
- (id)_popUIDsTableSchema;
- (id)_propertiesTableSchema;
- (id)_protectedMessageDataTableSchema;
- (id)_recipientsTableSchema;
- (id)_spotlightMessageReindexTableSchema;
- (id)_spotlightTombstonesTableSchema;
- (id)_subjectsTableSchema;
- (id)_summariesTableSchema;
- (void)setConnection:(id)a3;
@end

@implementation MFMailMessageLibraryAdoptSharedSchemaMigrationStep

+ (void)cleanUpAfterMigrationWithConnection:(id)a3
{
  id v3 = a3;
  if ([v3 databaseIsAttached:@"ssms_mem"]) {
    [v3 executeStatementString:@"DETACH DATABASE ssms_mem" errorMessage:@"Detaching ssms_mem database"];
  }
}

- (MFMailMessageLibraryAdoptSharedSchemaMigrationStep)initWithSQLiteConnection:(id)a3 protectedDatabaseName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFMailMessageLibraryAdoptSharedSchemaMigrationStep;
  v9 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_protectedDatabaseName, a4);
  }

  return v10;
}

- (EFSQLSchema)schema
{
  v24[13] = *MEMORY[0x1E4F143B8];
  v23 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _messagesTableSchema];
  v22 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _recipientsTableSchema];
  v20 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _messageReferencesTableSchema];
  v19 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _conversationsTableSchema];
  v21 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _conversationIDMessageIDTableSchema];
  v18 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _spotlightMessageReindexTableSchema];
  id v3 = [v22 columnForName:@"message"];
  [v3 setAsForeignKeyForTable:v23 onDelete:2 onUpdate:0];

  v4 = [v20 columnForName:@"message"];
  [v4 setAsForeignKeyForTable:v23 onDelete:2 onUpdate:0];

  v5 = [v21 columnForName:@"conversation_id"];
  [v5 setAsForeignKeyForTable:v19 onDelete:2 onUpdate:2];

  v6 = [v18 columnForName:@"message_id"];
  [v6 setAsForeignKeyForTable:v23 onDelete:2 onUpdate:0];

  id v7 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v24[0] = v23;
  id v8 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _mailboxesTableSchema];
  v24[1] = v8;
  v24[2] = v22;
  v24[3] = v20;
  v24[4] = v19;
  v24[5] = v21;
  v9 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _propertiesTableSchema];
  v24[6] = v9;
  v10 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _messageDataTableSchema];
  v24[7] = v10;
  v11 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _messageDataDeletedTableSchema];
  v24[8] = v11;
  objc_super v12 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _popUIDsTableSchema];
  v24[9] = v12;
  v13 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _accountsTableSchema];
  v24[10] = v13;
  v14 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _spotlightTombstonesTableSchema];
  v24[11] = v14;
  v24[12] = v18;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:13];
  v16 = (void *)[v7 initWithTables:v15];

  return (EFSQLSchema *)v16;
}

- (id)_messagesTableSchema
{
  v61[30] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v60 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[0] = v60;
  v59 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"remote_id" nullable:1];
  v61[1] = v59;
  v58 = [MEMORY[0x1E4F60E80] textColumnWithName:@"document_id" collation:1 nullable:1];
  v61[2] = v58;
  v57 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sender" nullable:1];
  v61[3] = v57;
  v56 = [MEMORY[0x1E4F60E80] textColumnWithName:@"subject_prefix" collation:1 nullable:1];
  v61[4] = v56;
  v55 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"subject" nullable:0];
  v61[5] = v55;
  v54 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"summary" nullable:1];
  v61[6] = v54;
  v53 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_sent" nullable:1];
  v61[7] = v53;
  v52 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_received" nullable:1];
  v61[8] = v52;
  v51 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:0];
  v61[9] = v51;
  v50 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"remote_mailbox" nullable:1];
  v61[10] = v50;
  v49 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flags" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[11] = v49;
  v48 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[12] = v48;
  v47 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[13] = v47;
  v46 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"deleted" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[14] = v46;
  v45 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"size" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[15] = v45;
  v44 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation_id" nullable:0 defaultValue:&unk_1EFF50DC0];
  v61[16] = v44;
  v43 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_last_viewed" nullable:1];
  v61[17] = v43;
  v42 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"original_mailbox" nullable:1];
  v61[18] = v42;
  v41 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"visible" nullable:1];
  v61[19] = v41;
  v40 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sender_vip" nullable:1];
  v61[20] = v40;
  v39 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"encoding" nullable:1];
  v61[21] = v39;
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"content_type" nullable:1];
  v61[22] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sequence_identifier" nullable:1 defaultValue:&unk_1EFF50DC0];
  v61[23] = v4;
  v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"external_id" collation:1 nullable:1];
  v61[24] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"unique_id" nullable:1];
  v61[25] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"content_index_transaction_id" nullable:1];
  v61[26] = v7;
  id v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"list_id_hash" nullable:1];
  v61[27] = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"journaled" nullable:1];
  v61[28] = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flag_color" nullable:1];
  v61[29] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:30];
  objc_super v12 = (void *)[v2 initWithName:@"messages" rowIDType:2 columns:v11];

  [v12 addIndexForColumns:&unk_1EFF50178];
  [v12 addIndexForColumns:&unk_1EFF50190];
  [v12 addIndexForColumns:&unk_1EFF501A8];
  [v12 addIndexForColumns:&unk_1EFF501C0];
  [v12 addIndexForColumns:&unk_1EFF501D8];
  [v12 addIndexForColumns:&unk_1EFF501F0];
  [v12 addIndexForColumns:&unk_1EFF50208];
  [v12 addIndexForColumns:&unk_1EFF50220];
  [v12 addIndexForColumns:&unk_1EFF50238];
  [v12 addIndexForColumns:&unk_1EFF50250];
  [v12 addIndexForColumns:&unk_1EFF50268];
  [v12 addIndexForColumns:&unk_1EFF50280];
  [v12 addIndexForColumns:&unk_1EFF50298];
  [v12 addIndexForColumns:&unk_1EFF502B0];
  [v12 addIndexForColumns:&unk_1EFF502C8];
  v13 = __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke([v12 addIndexForColumns:&unk_1EFF502E0], &unk_1EFF502F8);
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:2];
  [v13 addObject:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"ROWID" orderDirection:2];
  [v13 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v17 = [v12 name];
  v18 = (void *)[v16 initWithTableName:v17 indexedColumns:v13];
  [v12 addIndex:v18];

  v20 = __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(v19, &unk_1EFF50310);

  v21 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:2];
  [v20 addObject:v21];

  v22 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"ROWID" orderDirection:2];
  [v20 addObject:v22];

  id v23 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v24 = [v12 name];
  v25 = (void *)[v23 initWithTableName:v24 indexedColumns:v20];
  [v12 addIndex:v25];

  v27 = __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(v26, &unk_1EFF50328);

  v28 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:2];
  [v27 addObject:v28];

  v29 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"ROWID"];
  [v27 addObject:v29];

  id v30 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v31 = [v12 name];
  v32 = (void *)[v30 initWithTableName:v31 indexedColumns:v27];
  [v12 addIndex:v32];

  v33 = __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke([v12 addIndexForColumns:&unk_1EFF50340], &unk_1EFF50358);

  v34 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:1];
  [v33 addObject:v34];

  id v35 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v36 = [v12 name];
  v37 = (void *)[v35 initWithTableName:v36 indexedColumns:v33];
  [v12 addIndex:v37];

  [v12 addIndexForColumns:&unk_1EFF50370];
  return v12;
}

id __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "ef_map:", &__block_literal_global_116);
  id v3 = (void *)[v2 mutableCopy];

  return v3;
}

id __74__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__messagesTableSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:v2];

  return v3;
}

- (id)_mailboxesTableSchema
{
  v18[12] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v17 = [MEMORY[0x1E4F60E80] textColumnWithName:@"url" collation:1 nullable:0];
  v18[0] = v17;
  id v16 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"total_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[1] = v16;
  v15 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"unread_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[2] = v15;
  v14 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"deleted_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[3] = v14;
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"sequence_identifier" collation:1 nullable:1];
  v18[4] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[5] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"attachment_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[6] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"to_cc_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[7] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"server_unread_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[8] = v7;
  id v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_sync_status_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[9] = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"most_recent_status_count" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[10] = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"reconcile" nullable:0 defaultValue:&unk_1EFF50DC0];
  v18[11] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:12];
  objc_super v12 = (void *)[v2 initWithName:@"mailboxes" rowIDType:2 columns:v11];

  [v12 addUniquenessConstraintForColumns:&unk_1EFF50388 conflictResolution:1];
  return v12;
}

- (id)_recipientsTableSchema
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:0];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:1];
  v10[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"position" nullable:1];
  v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  id v8 = (void *)[v2 initWithName:@"recipients" rowIDType:1 columns:v7];

  [v8 addUniquenessConstraintForColumns:&unk_1EFF503A0 conflictResolution:1];
  [v8 addIndexForColumns:&unk_1EFF503B8];
  [v8 addIndexForColumns:&unk_1EFF503D0];
  return v8;
}

- (id)_messageReferencesTableSchema
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message" nullable:0];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "integerColumnWithName:nullable:defaultValue:", @"reference", 0, &unk_1EFF50DC0, v3);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"is_originator" nullable:0 defaultValue:&unk_1EFF50DC0];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v7 = (void *)[v2 initWithName:@"message_references" rowIDType:1 columns:v6];

  [v7 addIndexForColumns:&unk_1EFF503E8];
  [v7 addIndexForColumns:&unk_1EFF50400];
  return v7;
}

- (id)_conversationsTableSchema
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flags" nullable:0 defaultValue:&unk_1EFF50DC0];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"sync_key" collation:1 nullable:1];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = (void *)[v2 initWithName:@"conversations" rowIDType:2 rowIDAlias:@"conversation_id" columns:v5];

  return v6;
}

- (id)_conversationIDMessageIDTableSchema
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation_id" nullable:0];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "integerColumnWithName:nullable:defaultValue:", @"message_id", 0, &unk_1EFF50DC0, v3);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_sent" nullable:0 defaultValue:&unk_1EFF50DC0];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v7 = (void *)[v2 initWithName:@"conversation_id_message_id" columns:v6 primaryKeyColumns:&unk_1EFF50418];

  [v7 addIndexForColumns:&unk_1EFF50430];
  return v7;
}

- (id)_propertiesTableSchema
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"key" collation:1 nullable:0];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"value" nullable:0];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = (void *)[v2 initWithName:@"properties" rowIDType:1 columns:v5];

  [v6 addUniquenessConstraintForColumns:&unk_1EFF50448 conflictResolution:1];
  return v6;
}

- (id)_messageDataTableSchema
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:1];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"part", 1, 1, v3);
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"partial" nullable:1];
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"complete" nullable:1];
  v11[3] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"length" nullable:1];
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v9 = (void *)[v2 initWithName:@"message_data" rowIDType:2 columns:v8];

  [v9 addUniquenessConstraintForColumns:&unk_1EFF50460 conflictResolution:1];
  return v9;
}

- (id)_messageDataDeletedTableSchema
{
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = (void *)[v2 initWithName:@"message_data_deleted" rowIDType:1 rowIDAlias:@"message_data_id" columns:MEMORY[0x1E4F1CBF0]];
  return v3;
}

- (id)_popUIDsTableSchema
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"uid", 1, 1, v3);
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_added" nullable:1];
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flags" nullable:1];
  v11[3] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"del" nullable:1];
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v9 = (void *)[v2 initWithName:@"pop_uids" rowIDType:1 columns:v8];

  [v9 addUniquenessConstraintForColumns:&unk_1EFF50478 conflictResolution:1];
  [v9 addIndexForColumns:&unk_1EFF50490];
  return v9;
}

- (id)_accountsTableSchema
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"text_id" collation:1 nullable:1];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = (void *)[v2 initWithName:@"accounts" rowIDType:2 columns:v4];

  [v5 addUniquenessConstraintForColumns:&unk_1EFF504A8 conflictResolution:1];
  return v5;
}

- (id)_spotlightTombstonesTableSchema
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:1];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"identifier", 1, 1, v3);
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:1];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v7 = (void *)[v2 initWithName:@"spotlight_tombstones" rowIDType:2 columns:v6];

  [v7 addUniquenessConstraintForColumns:&unk_1EFF504C0 conflictResolution:1];
  [v7 addIndexForColumns:&unk_1EFF504D8];
  return v7;
}

- (id)_spotlightMessageReindexTableSchema
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:1];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:1];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = (void *)[v2 initWithName:@"spotlight_message_reindex" rowIDType:1 columns:v5];

  [v6 addUniquenessConstraintForColumns:&unk_1EFF504F0 conflictResolution:1];
  [v6 addIndexForColumns:&unk_1EFF50508];
  return v6;
}

- (EFSQLSchema)protectedSchema
{
  v11[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v4 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _addressesTableSchema];
  v11[0] = v4;
  v5 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _subjectsTableSchema];
  v11[1] = v5;
  v6 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _summariesTableSchema];
  v11[2] = v6;
  id v7 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _protectedMessageDataTableSchema];
  v11[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  v9 = (void *)[v3 initWithTables:v8];

  return (EFSQLSchema *)v9;
}

- (id)_addressesTableSchema
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"address" collation:2 nullable:0];
  v8[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] textColumnWithName:@"comment" collation:1 nullable:0];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = (void *)[v2 initWithName:@"addresses" rowIDType:2 columns:v5];

  [v6 addUniquenessConstraintForColumns:&unk_1EFF50520 conflictResolution:1];
  return v6;
}

- (id)_subjectsTableSchema
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"subject" collation:3 nullable:0];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = (void *)[v2 initWithName:@"subjects" rowIDType:2 columns:v4];

  [v5 addUniquenessConstraintForColumns:&unk_1EFF50538 conflictResolution:1];
  return v5;
}

- (id)_summariesTableSchema
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"summary" collation:3 nullable:0];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = (void *)[v2 initWithName:@"summaries" rowIDType:2 columns:v4];

  [v5 addUniquenessConstraintForColumns:&unk_1EFF50550 conflictResolution:1];
  return v5;
}

- (id)_protectedMessageDataTableSchema
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] textColumnWithName:@"data" collation:1 nullable:1];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = (void *)[v2 initWithName:@"protected_message_data" rowIDType:1 columns:v4];

  return v5;
}

- (BOOL)performMigrationStep
{
  v4 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if (([v4 protectedDatabaseAttached] & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MFMailMessageLibraryAdoptSharedSchemaMigrationStep.m" lineNumber:412 description:@"Protected database must be attached"];
  }
  BOOL v5 = !+[MFDbJournal mergeAllJournalsUsingConnection:v4]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _initializeOldProtectedSchema]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _transformSchema]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _transformProtectedSchema]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _createTemporaryTables]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _migrateData]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _dropTemporaryTables]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _createIndexes]&& [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _cleanupOldSchema];

  return v5;
}

- (BOOL)_initializeOldProtectedSchema
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v2 executeStatementString:@"CREATE TABLE IF NOT EXISTS protected.messages (message_id INTEGER PRIMARY KEY, sender, subject, _to, cc, bcc)", @"Creating protected messages" errorMessage])char v3 = objc_msgSend(v2, "executeStatementString:errorMessage:", @"CREATE TABLE IF NOT EXISTS protected.message_data (message_data_id INTEGER PRIMARY KEY, data)", @"Creating protected message_data"); {
  else
  }
    char v3 = 0;

  return v3;
}

- (BOOL)_transformSchema
{
  char v3 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v3 executeStatementString:@"ALTER TABLE main.messages RENAME TO messages_old" errorMessage:@"Moving messages table aside"]&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE mailboxes RENAME TO mailboxes_old", @"Moving mailboxes table aside")&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE conversations RENAME TO conversations_old", @"Moving conversations table aside")&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE conversation_id_message_id RENAME TO conversation_id_message_id_old", @"Moving conversation_id_message_id table aside")
    && [v3 executeStatementString:@"ALTER TABLE properties RENAME TO properties_old" errorMessage:@"Moving properties table aside"]&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE main.message_data RENAME TO message_data_old", @"Moving message_data table aside")&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE message_data_deleted RENAME TO message_data_deleted_old", @"Moving message_data_deleted_old table aside")&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE pop_uids RENAME TO pop_uids_old", @"Moving pop_uids table aside")
    && [v3 executeStatementString:@"ALTER TABLE accounts RENAME TO accounts_old" errorMessage:@"Moving accounts table aside"]&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE spotlight_tombstones RENAME TO spotlight_tombstones_old", @"Moving spotlight_tombstones table aside")&& objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE spotlight_message_reindex RENAME TO spotlight_message_reindex_old", @"Moving spotlight_message_reindex table aside"))
  {
    v4 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self schema];
    BOOL v5 = [v4 definitionWithDatabaseName:0 includeIndexes:0];
    char v6 = [v3 executeStatementString:v5 errorMessage:@"Unable to create new tables"];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_transformProtectedSchema
{
  char v3 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  v4 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self protectedSchema];
  BOOL v5 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self protectedDatabaseName];
  char v6 = [v4 definitionWithDatabaseName:v5];
  char v7 = [v3 executeStatementString:v6 errorMessage:@"Unable to create new protected tables"];

  return v7;
}

- (BOOL)_createTemporaryTables
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v2 executeStatementString:@"ATTACH DATABASE ':memory:' AS ssms_mem" errorMessage:@"Unable to create in-memory database"]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"CREATE TABLE ssms_mem.parsed_subjects(original PRIMARY KEY ON CONFLICT IGNORE, prefix TEXT COLLATE BINARY, unprefixed TEXT COLLATE RTRIM) WITHOUT ROWID", @"Creating ssms_mem.parsed_subjects table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"CREATE TABLE ssms_mem.summary_id_by_message(message INTEGER PRIMARY KEY, summary_id INTEGER)", @"Creating ssms_mem.summary_id_by_message table"))
  {
    char v3 = [v2 executeStatementString:@"CREATE TABLE ssms_mem.parsed_addresses(fullAddress TEXT NOT NULL PRIMARY KEY ON CONFLICT IGNORE, address TEXT, comment TEXT) WITHOUT ROWID", @"Creating ssms_mem.parsed_addresses table" errorMessage];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_dropTemporaryTables
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v2 executeStatementString:@"DROP TABLE ssms_mem.parsed_subjects" errorMessage:@"Dropping ssms_mem.subject_prefixes table"]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE ssms_mem.parsed_addresses", @"Dropping ssms_mem.parsed_addresses table"))
  {
    char v3 = [v2 executeStatementString:@"DROP TABLE ssms_mem.summary_id_by_message" errorMessage:@"Dropping ssms_mem.summary_id_by_message table"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_migrateData
{
  if (![(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _migrateNonMessages]
    || ![(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _migrateSubjects]
    || ![(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _migrateSummaries]
    || ![(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _migrateSendersAndRecipients])
  {
    return 0;
  }
  return [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self _migrateMessages];
}

- (BOOL)_migrateNonMessages
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v2 executeStatementString:@"INSERT INTO message_references (message, reference, is_originator) SELECT message_id, ifnull(reference, 0), ifnull(is_originator, 0) FROM threads", @"Populating message_references" errorMessage]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO mailboxes (ROWID, url, total_count, unread_count, deleted_count, sequence_identifier, flagged_count, to_cc_count, server_unread_count, last_sync_status_count, most_recent_status_count, reconcile) SELECT ROWID, url, ifnull(total_count, 0), ifnull(unread_count, 0), ifnull(deleted_count, 0), sequence_identifier, ifnull(flagged_count, 0), ifnull(to_cc_count, 0), ifnull(server_unread_count, 0), ifnull(last_sync_status_count, 0), ifnull(most_recent_status_count, 0), ifnull(reconcile, 0) FROM mailboxes_old", @"Populating mailboxes")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO conversations (conversation_id, flags, sync_key) SELECT conversation_id, (ifnull(flags, 0) & ~0x2) | ((ifnull(flags, 0) & 0x2) << 1), sync_key FROM conversations_old ", @"Populating conversations")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO conversation_id_message_id (conversation_id, message_id, date_sent) SELECT conversation_id, message_id, ifnull(date_sent, 0) FROM conversation_id_message_id_old", @"Populating conversation_id_message_id")
    && [v2 executeStatementString:@"INSERT INTO properties (key, value) SELECT key, value FROM properties_old", @"Populating properties" errorMessage]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO main.message_data (ROWID, message_id, part, partial, complete, length) SELECT ROWID, message_id, part, partial, complete, length FROM message_data_old WHERE part != 'summary' ", @"Populating message_data")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO message_data_deleted (message_data_id) SELECT message_data_id FROM message_data_deleted_old", @"Populating message_data_deleted")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO pop_uids (mailbox, uid, date_added, flags, del) SELECT mailbox, uid, date_added, flags, del FROM pop_uids_old", @"Populating pop_uids")
    && [v2 executeStatementString:@"INSERT INTO accounts (ROWID, text_id) SELECT ROWID, text_id FROM accounts_old", @"Populating accounts" errorMessage]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO spotlight_tombstones (ROWID, type, identifier, transaction_id) SELECT ROWID, type, identifier, transaction_id FROM spotlight_tombstones_old", @"Populating spotlight_tombstones"))
  {
    char v3 = [v2 executeStatementString:@"INSERT INTO spotlight_message_reindex (message_id, type) SELECT message_id, type FROM spotlight_message_reindex_old", @"Populating spotlight_message_reindex" errorMessage];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_migrateSubjects
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  [v2 preparedStatementForQueryString:@"SELECT DISTINCT subject FROM protected.messages JOIN main.messages_old ON main.messages_old.ROWID = protected.messages.message_id "];
  id v3 = objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 compiled];
  id v5 = [v2 preparedStatementForQueryString:@"INSERT INTO ssms_mem.parsed_subjects (original, prefix, unprefixed) VALUES (?1, ?2, ?3)"];
  uint64_t v6 = [v5 compiled];
  id v7 = [v2 preparedStatementForQueryString:@"INSERT INTO ssms_mem.parsed_subjects (original, prefix, unprefixed) VALUES (?1, NULL, ?1)"];
  uint64_t v8 = [v7 compiled];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSubjects__block_invoke;
  v15[3] = &unk_1E5D3F408;
  v17 = &v21;
  uint64_t v18 = v4;
  uint64_t v19 = v6;
  uint64_t v20 = v8;
  id v9 = v2;
  id v16 = v9;
  id v14 = 0;
  int v10 = [v3 executeUsingBlock:v15 error:&v14];
  id v11 = v14;
  if (v11) {
    char v12 = v10;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0) {
    [v9 handleError:v11 message:@"Populating ssms_mem.parsed_subjects"];
  }
  if (v10)
  {
    if (*((unsigned char *)v22 + 24)) {
      LOBYTE(v10) = [v9 executeStatementString:@"INSERT OR IGNORE INTO protected.subjects (subject) SELECT unprefixed FROM ssms_mem.parsed_subjects" errorMessage:@"Populating protected.subjects table"];
    }
    else {
      LOBYTE(v10) = 0;
    }
  }

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSubjects__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 48), 0);
  if (v6) {
    id v7 = (const char *)v6;
  }
  else {
    id v7 = "";
  }
  int v8 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 48), 0);
  id v9 = (void *)[[NSString alloc] initWithBytesNoCopy:v7 length:v8 encoding:4 freeWhenDone:0];
  uint64_t v10 = [MEMORY[0x1E4F608F0] prefixLengthForSubject:v9];
  if (v10)
  {
    id v11 = [v9 substringToIndex:v10];
    char v12 = [v9 substringFromIndex:v10];
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 56), 1, v7, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v13 = *(sqlite3_stmt **)(a1 + 56);
    id v14 = v11;
    sqlite3_bind_text(v13, 2, (const char *)[v14 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v15 = *(sqlite3_stmt **)(a1 + 56);
    id v16 = v12;
    sqlite3_bind_text(v15, 3, (const char *)[v16 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    v17 = *(sqlite3_stmt **)(a1 + 56);
    id v22 = 0;
    LOBYTE(v15) = performInsert(v17, &v22);
    id v18 = v22;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v15;
  }
  else
  {
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 64), 1, v7, v8, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    uint64_t v19 = *(sqlite3_stmt **)(a1 + 64);
    id v21 = 0;
    uint64_t v20 = performInsert(v19, &v21);
    id v18 = v21;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v20;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    [*(id *)(a1 + 32) handleError:v18 message:@"Inserting into ssms_mem.parsed_subjects"];
  }
}

- (BOOL)_migrateSummaries
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v2 executeStatementString:@"CREATE TABLE ssms_mem.temp_summaries(message INTEGER PRIMARY KEY, summary TEXT NOT NULL)", @"Creating ssms_mem.temp_summaries table" errorMessage]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO ssms_mem.temp_summaries (message, summary) SELECT main.message_data_old.message_id, protected.message_data.data FROM main.message_data_old JOIN protected.message_data ON protected.message_data.message_data_id = main.message_data_old.ROWID WHERE main.message_data_old.part = 'summary' AND protected.message_data.data IS NOT NULL ", @"Populating ssms_mem.temp_summaries")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT OR IGNORE INTO protected.summaries (summary) SELECT summary FROM ssms_mem.temp_summaries ", @"Populating protected.summaries")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"INSERT INTO ssms_mem.summary_id_by_message (message, summary_id) SELECT ssms_mem.temp_summaries.message, protected.summaries.ROWID FROM ssms_mem.temp_summaries JOIN protected.summaries ON protected.summaries.summary = ssms_mem.temp_summaries.summary ", @"Populating ssms_mem.summary_id_by_message"))
  {
    char v3 = [v2 executeStatementString:@"DROP TABLE ssms_mem.temp_summaries" errorMessage:@"Dropping ssms_mem.temp_summaries table"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_migrateSendersAndRecipients
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  char v3 = (sqlite3 *)[v2 sqlDB];
  objc_msgSend(v2, "handleSQLResult:message:", sqlite3_create_function(v3, "rawAddress", 1, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))rawAddress, 0, 0), @"error creating user function rawAddress");
  objc_msgSend(v2, "handleSQLResult:message:", sqlite3_create_function(v3, "displayName", 1, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))displayName, 0, 0), @"error creating user function displayName");
  int v4 = [v2 executeStatementString:@"CREATE TABLE ssms_mem.temp_recipients(message INTEGER NOT NULL, fullAddress TEXT NOT NULL, type INTEGER NOT NULL, position INTEGER NOT NULL)", @"Creating ssms_mem.temp_recipients table" errorMessage];
  id v5 = [v2 preparedStatementForQueryString:@"INSERT INTO ssms_mem.temp_recipients (message, fullAddress, type, position) VALUES (?, ?, ?, ?)"];
  uint64_t v6 = [v5 compiled];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke;
  aBlock[3] = &unk_1E5D3F458;
  char v24 = &v26;
  uint64_t v25 = v6;
  id v7 = v2;
  id v23 = v7;
  int v8 = _Block_copy(aBlock);
  [v7 preparedStatementForQueryString:@"SELECT protected.messages.message_id, protected.messages._to, protected.messages.cc, protected.messages.bcc FROM protected.messages JOIN main.messages_old ON main.messages_old.ROWID = protected.messages.message_id "];
  id v9 = objc_claimAutoreleasedReturnValue();
  id v10 = (id)[v9 compiled];
  if (!v4)
  {
    char v12 = 0;
LABEL_12:
    v15 = (void *)MEMORY[0x1AD0E3E00](v10);
    int v14 = 0;
    goto LABEL_13;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_3;
  v20[3] = &unk_1E5D3F480;
  v21[1] = v10;
  v21[2] = v6;
  id v18 = (id *)v21;
  v21[0] = v8;
  id v19 = 0;
  int v11 = [v9 executeUsingBlock:v20 error:&v19];
  id v10 = v19;
  char v12 = v10;
  if (v10) {
    char v13 = v11;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0) {
    id v10 = (id)[v7 handleError:v10 message:@"Populating ssms_mem.temp_recipients"];
  }
  if (!v11 || !*((unsigned char *)v27 + 24)) {
    goto LABEL_12;
  }
  int v14 = [v7 executeStatementString:@"INSERT INTO ssms_mem.parsed_addresses (fullAddress) SELECT sender FROM protected.messages JOIN main.messages_old ON main.messages_old.ROWID = protected.messages.message_id WHERE sender IS NOT NULL UNION ALL SELECT fullAddress FROM ssms_mem.temp_recipients WHERE fullAddress IS NOT NULL " errorMessage:@"Populating ssms_mem.parsed_addresses"];
  v15 = (void *)MEMORY[0x1AD0E3E00]();
  if (v14) {
    int v14 = [v7 executeStatementString:@"UPDATE ssms_mem.parsed_addresses SET address = rawAddress(fullAddress), comment = displayName(fullAddress)", @"Parsing addresses in ssms_mem.parsed_addresses" errorMessage];
  }
LABEL_13:
  if (v14
    && [v7 executeStatementString:@"INSERT OR IGNORE INTO protected.addresses (address, comment) SELECT address, comment FROM ssms_mem.parsed_addresses", @"Populating protected.addresses" errorMessage]&& objc_msgSend(v7, "executeStatementString:errorMessage:", @"INSERT INTO main.recipients (message, address, type, position) SELECT ssms_mem.temp_recipients.message, protected.addresses.ROWID, ssms_mem.temp_recipients.type, ssms_mem.temp_recipients.position FROM ssms_mem.temp_recipients JOIN ssms_mem.parsed_addresses ON ssms_mem.parsed_addresses.fullAddress = ssms_mem.temp_recipients.fullAddress JOIN protected.addresses ON protected.addresses.address = ssms_mem.parsed_addresses.address AND protected.addresses.comment = ssms_mem.parsed_addresses.comment ", @"Populating main.recipients"))
  {
    char v16 = [v7 executeStatementString:@"DROP TABLE ssms_mem.temp_recipients" errorMessage:@"Dropping ssms_mem.temp_recipients table"];
  }
  else
  {
    char v16 = 0;
  }
  objc_msgSend(v7, "handleSQLResult:message:", sqlite3_create_function(v3, "rawAddress", 1, 1, 0, 0, 0, 0), @"error deleting user function rawAddress");
  objc_msgSend(v7, "handleSQLResult:message:", sqlite3_create_function(v3, "displayName", 1, 1, 0, 0, 0, 0), @"error deleting user function displayName");
  if (v4) {

  }
  _Block_object_dispose(&v26, 8);
  return v16;
}

BOOL __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke(uint64_t a1, sqlite3_int64 a2, uint64_t a3, unint64_t a4)
{
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 48), 3, a2);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  uint64_t v20 = __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_2;
  id v21 = &unk_1E5D3F430;
  uint64_t v23 = *(void *)(a1 + 48);
  long long v18 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v18;
  long long v22 = v18;
  int v8 = v19;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  int v11 = 0;
  do
  {
    unint64_t v12 = (unint64_t)&v11[v10];
    if ((unint64_t)&v11[v10] >= a4) {
      break;
    }
    uint64_t v10 = v12 ? v12 + 3 : 0;
    char v13 = (char *)memmem((const void *)(a3 + v10), a4 - v10, "\r\r\n", 3uLL);
    int v14 = &v13[-a3];
    if (!v13) {
      int v14 = (char *)a4;
    }
    int v11 = &v14[-v10];
    v15 = (void *)MEMORY[0x1AD0E3E00]();
    BOOL v16 = v20((uint64_t)v8, v9, (const char *)(a3 + v10), (int)v11);
    uint64_t v9 = (v9 + 1);
  }
  while (v16);

  return v12 >= a4;
}

BOOL __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_2(uint64_t a1, int a2, const char *a3, int a4)
{
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 48), 2, a3, a4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 48), 4, a2);
  uint64_t v6 = *(sqlite3_stmt **)(a1 + 48);
  id v12 = 0;
  char v7 = performInsert(v6, &v12);
  id v8 = v12;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(unsigned __int8 *)(v9 + 24);
  if (!*(unsigned char *)(v9 + 24)) {
    [*(id *)(a1 + 32) handleError:v8 message:@"Inserting recipient into ssms_mem.temp_recipients"];
  }

  return v10 != 0;
}

uint64_t __82__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateSendersAndRecipients__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 40), 0);
  char v7 = 1;
  sqlite3_bind_int64(*(sqlite3_stmt **)(a1 + 48), 1, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 40), 1);
  int v10 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 1);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, const unsigned __int8 *, void))(v8 + 16))(v8, 1, v9, v10);
  if (result)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    char v13 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 40), 2);
    int v14 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 2);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, const unsigned __int8 *, void))(v12 + 16))(v12, 2, v13, v14);
    if (result)
    {
      uint64_t v15 = *(void *)(a1 + 32);
      BOOL v16 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 40), 3);
      int v17 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 3);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, const unsigned __int8 *, void))(v15 + 16))(v15, 3, v16, v17);
      char v7 = result ^ 1;
    }
    else
    {
      char v7 = 1;
    }
  }
  *a4 = v7;
  return result;
}

- (BOOL)_migrateMessages
{
  v19[31] = *MEMORY[0x1E4F143B8];
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  int v3 = [v2 executeStatementString:@"DELETE FROM protected.messages WHERE ROWID IN (SELECT message_id FROM messages_deleted)" errorMessage:@"Deleting rows from protected.messages"];
  v18[0] = @"ROWID";
  v18[1] = @"message_id";
  v19[0] = @"messages_old.ROWID";
  v19[1] = @"ifnull(messages_old.message_id, 0)";
  v18[2] = @"remote_id";
  v18[3] = @"document_id";
  if ([v2 columnExists:@"document_id" inTable:@"messages_old" type:0]) {
    int v4 = @"document_id";
  }
  else {
    int v4 = @"null";
  }
  void v19[2] = @"remote_id";
  v19[3] = v4;
  v18[4] = @"sender";
  v18[5] = @"subject_prefix";
  v19[4] = @"protected.addresses.ROWID";
  v19[5] = @"ssms_mem.parsed_subjects.prefix";
  v18[6] = @"subject";
  v18[7] = @"summary";
  v19[6] = @"protected.subjects.ROWID";
  v19[7] = @"ssms_mem.summary_id_by_message.summary_id";
  v18[8] = @"date_sent";
  v18[9] = @"date_received";
  v19[8] = @"date_sent";
  v19[9] = @"date_received";
  v18[10] = @"mailbox";
  v18[11] = @"remote_mailbox";
  v19[10] = @"mailbox";
  v19[11] = @"remote_mailbox";
  v18[12] = @"flags";
  void v18[13] = @"read";
  v19[12] = @"ifnull(flags, 0)";
  v19[13] = @"ifnull(read, 0)";
  v18[14] = @"flagged";
  v18[15] = @"deleted";
  v19[14] = @"ifnull(flagged, 0)";
  v19[15] = @"ifnull(deleted, 0)";
  v18[16] = @"size";
  v18[17] = @"conversation_id";
  v19[16] = @"ifnull(size, 0)";
  v19[17] = @"ifnull(conversation_id, 0)";
  v18[18] = @"date_last_viewed";
  v18[19] = @"original_mailbox";
  v19[18] = @"null";
  v19[19] = @"original_mailbox";
  v18[20] = @"visible";
  v18[21] = @"sender_vip";
  v19[20] = @"visible";
  v19[21] = @"sender_vip";
  v18[22] = @"encoding";
  v18[23] = @"content_type";
  v19[22] = @"encoding";
  v19[23] = @"content_type";
  v18[24] = @"sequence_identifier";
  v18[25] = @"external_id";
  v19[24] = @"0";
  v19[25] = @"external_id";
  v18[26] = @"unique_id";
  v18[27] = @"content_index_transaction_id";
  v19[26] = @"unique_id";
  v19[27] = @"content_index_transaction_id";
  v18[28] = @"list_id_hash";
  v18[29] = @"journaled";
  v19[28] = @"list_id_hash";
  v19[29] = @"journaled";
  v18[30] = @"flag_color";
  v19[30] = @"CASE WHEN messages_old.flags & 16 THEN ((messages_old.flags & (7 << 41)) >> 41) ELSE NULL END";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:31];
  sqlite3_int64 v6 = objc_opt_new();
  char v7 = objc_opt_new();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateMessages__block_invoke;
  v15[3] = &unk_1E5D3B848;
  id v8 = v6;
  id v16 = v8;
  id v9 = v7;
  id v17 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];
  int v10 = NSString;
  int v11 = [v8 componentsJoinedByString:@", "];
  uint64_t v12 = [v9 componentsJoinedByString:@", "];
  char v13 = [v10 stringWithFormat:@"INSERT INTO main.messages (%@) SELECT %@ FROM messages_old JOIN protected.messages ON messages_old.ROWID = protected.messages.message_id JOIN ssms_mem.parsed_subjects ON ssms_mem.parsed_subjects.original = ifnull(protected.messages.subject, '') JOIN protected.subjects ON protected.subjects.subject = ssms_mem.parsed_subjects.unprefixed LEFT OUTER JOIN ssms_mem.parsed_addresses ON ssms_mem.parsed_addresses.fullAddress = protected.messages.sender LEFT OUTER JOIN protected.addresses ON protected.addresses.address = ssms_mem.parsed_addresses.address AND protected.addresses.comment = ssms_mem.parsed_addresses.comment LEFT OUTER JOIN ssms_mem.summary_id_by_message ON ssms_mem.summary_id_by_message.message = messages_old.ROWID ", v11, v12];

  if (v3) {
    LOBYTE(v3) = [v2 executeStatementString:v13 errorMessage:@"Populating messages"];
  }

  return v3;
}

void __70__MFMailMessageLibraryAdoptSharedSchemaMigrationStep__migrateMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) addObject:v6];
  [*(id *)(a1 + 40) addObject:v5];
}

- (BOOL)_createIndexes
{
  int v3 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  int v4 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self schema];
  id v5 = [v4 indexDefinitionsWithDatabaseName:0];
  char v6 = [v3 executeStatementString:v5 errorMessage:@"Unable to create new indexes"];

  return v6;
}

- (BOOL)_cleanupOldSchema
{
  id v2 = [(MFMailMessageLibraryAdoptSharedSchemaMigrationStep *)self connection];
  if ([v2 executeStatementString:@"DROP TABLE IF EXISTS messages_old" errorMessage:@"Dropping old messages table"]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS mailboxes_old", @"Dropping old mailboxes table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS threads", @"Dropping threads table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS conversations_old", @"Dropping old conversations table")
    && [v2 executeStatementString:@"DROP TABLE IF EXISTS conversation_id_message_id_old" errorMessage:@"Dropping old conversation_id_message_id table"]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS properties_old", @"Dropping old properties table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS message_data_old", @"Dropping old message_data table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS message_data_deleted_old", @"Dropping old message_data_deleted table")
    && [v2 executeStatementString:@"DROP TABLE IF EXISTS pop_uids_old" errorMessage:@"Dropping old pop_uids table"]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS accounts_old", @"Dropping old accounts table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS spotlight_tombstones_old", @"Dropping spotlight_tombstones table")&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS spotlight_message_reindex_old", @"Dropping spotlight_message_reindex table")
    && [v2 executeStatementString:@"DROP TABLE IF EXISTS messages_deleted" errorMessage:@"Dropping messages_deleted table"]&& objc_msgSend(v2, "executeStatementString:errorMessage:", @"DROP TABLE IF EXISTS protected.messages", @"Dropping protected.messages"))
  {
    char v3 = [v2 executeStatementString:@"DROP TABLE IF EXISTS protected.message_data" errorMessage:@"Dropping protected.message_data"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (EDPersistenceDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)protectedDatabaseName
{
  return self->_protectedDatabaseName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedDatabaseName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end