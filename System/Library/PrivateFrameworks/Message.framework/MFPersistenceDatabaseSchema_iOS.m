@interface MFPersistenceDatabaseSchema_iOS
+ (id)_messagesTableSchemaAndForeignKeysToResolve:(uint64_t)a3 associationsToResolve:;
+ (id)accountsTableSchema;
+ (id)additionalSchemaProviders;
+ (id)mailboxesTableSchema;
+ (id)messageDataDeletedTableSchema;
+ (id)messageDataTableSchema;
+ (id)popUIDsTableSchema;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
@end

@implementation MFPersistenceDatabaseSchema_iOS

+ (id)additionalSchemaProviders
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = a1;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v33[9] = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v31 = 0;
  id v32 = 0;
  v25 = +[MFPersistenceDatabaseSchema_iOS _messagesTableSchemaAndForeignKeysToResolve:associationsToResolve:]((uint64_t)a1, (uint64_t)&v32, (uint64_t)&v31);
  id v8 = v32;
  id v9 = v31;
  [v26 addObjectsFromArray:v8];
  [v7 addObjectsFromArray:v9];
  id v29 = v9;
  id v30 = v8;
  v24 = [MEMORY[0x1E4F60B40] recipientsTableSchemaAndForeignKeysToResolve:&v30 associationsToResolve:&v29];
  id v23 = v30;

  id v10 = v29;
  [v26 addObjectsFromArray:v23];
  [v7 addObjectsFromArray:v10];
  id v28 = v10;
  v22 = [MEMORY[0x1E4F60B40] messageGlobalDataTableSchemaAndAssociationsToResolve:&v28];
  id v21 = v28;

  [v7 addObjectsFromArray:v21];
  id v11 = v26;
  *a3 = v11;
  id v12 = v7;
  *a4 = v12;
  v33[0] = v25;
  v33[1] = v24;
  v33[2] = v22;
  v13 = +[MFPersistenceDatabaseSchema_iOS mailboxesTableSchema]();
  v33[3] = v13;
  v14 = +[MFPersistenceDatabaseSchema_iOS messageDataTableSchema]();
  v33[4] = v14;
  v15 = +[MFPersistenceDatabaseSchema_iOS messageDataDeletedTableSchema]();
  v33[5] = v15;
  v16 = +[MFPersistenceDatabaseSchema_iOS popUIDsTableSchema]();
  v33[6] = v16;
  v17 = +[MFPersistenceDatabaseSchema_iOS accountsTableSchema]();
  v33[7] = v17;
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___MFPersistenceDatabaseSchema_iOS;
  v18 = objc_msgSendSuper2(&v27, sel_propertiesTableSchema);
  v33[8] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:9];

  return v19;
}

+ (id)_messagesTableSchemaAndForeignKeysToResolve:(uint64_t)a3 associationsToResolve:
{
  v101[4] = *MEMORY[0x1E4F143B8];
  self;
  v5 = [MEMORY[0x1E4F60B40] partialMessagesTableSchemaAndForeignKeysToResolve:a2 associationsToResolve:a3];
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"original_mailbox" nullable:1];
  [v5 addColumn:v6];

  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"visible" nullable:1];
  [v5 addColumn:v7];

  id v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sender_vip" nullable:1];
  [v5 addColumn:v8];

  id v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"encoding" nullable:1];
  [v5 addColumn:v9];

  id v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"content_type" nullable:1];
  [v5 addColumn:v10];

  id v11 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"sequence_identifier" nullable:1 defaultValue:&unk_1EFF514F8];
  [v5 addColumn:v11];

  id v12 = [MEMORY[0x1E4F60E80] textColumnWithName:@"external_id" collation:1 nullable:1];
  [v5 addColumn:v12];

  v13 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"unique_id" nullable:1];
  [v5 addColumn:v13];

  v14 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"content_index_transaction_id" nullable:1];
  [v5 addColumn:v14];

  v15 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"journaled" nullable:1];
  [v5 addColumn:v15];

  v17 = __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(v16, &unk_1EFF50880);
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:2];
  [v17 addObject:v18];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"ROWID" orderDirection:2];
  [v17 addObject:v19];

  id v20 = objc_alloc(MEMORY[0x1E4F60EB0]);
  id v21 = [v5 name];
  v22 = (void *)[v20 initWithTableName:v21 indexedColumns:v17];
  [v5 addIndex:v22];

  v24 = __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(v23, &unk_1EFF50898);

  v25 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:2];
  [v24 addObject:v25];

  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"ROWID" orderDirection:2];
  [v24 addObject:v26];

  id v27 = objc_alloc(MEMORY[0x1E4F60EB0]);
  id v28 = [v5 name];
  id v29 = (void *)[v27 initWithTableName:v28 indexedColumns:v24];
  [v5 addIndex:v29];

  id v31 = __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke(v30, &unk_1EFF508B0);

  id v32 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:2];
  [v31 addObject:v32];

  v33 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"ROWID"];
  [v31 addObject:v33];

  id v34 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v35 = [v5 name];
  v36 = (void *)[v34 initWithTableName:v35 indexedColumns:v31];
  [v5 addIndex:v36];

  v37 = __101__MFPersistenceDatabaseSchema_iOS__messagesTableSchemaAndForeignKeysToResolve_associationsToResolve___block_invoke([v5 addIndexForColumns:&unk_1EFF508C8], &unk_1EFF508E0);

  v38 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received" orderDirection:1];
  [v37 addObject:v38];

  id v39 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v40 = [v5 name];
  v41 = (void *)[v39 initWithTableName:v40 indexedColumns:v37];
  [v5 addIndex:v41];

  [v5 addIndexForColumns:&unk_1EFF508F8];
  [v5 addIndexForColumns:&unk_1EFF50910];
  [v5 addIndexForColumns:&unk_1EFF50928];
  [v5 addIndexForColumns:&unk_1EFF50940];
  [v5 addIndexForColumns:&unk_1EFF50958];
  [v5 addIndexForColumns:&unk_1EFF50970];
  [v5 addIndexForColumns:&unk_1EFF50988];
  [v5 addIndexForColumns:&unk_1EFF509A0];
  [v5 addIndexForColumns:&unk_1EFF509B8];
  [v5 addIndexForColumns:&unk_1EFF509D0];
  [v5 addIndexForColumns:&unk_1EFF509E8];
  v42 = [MEMORY[0x1E4F60E78] column:@"sender_vip"];
  v88 = [v42 equalTo:&unk_1EFF51510];

  v43 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  v93 = [v43 equalTo:&unk_1EFF514F8];

  v44 = [MEMORY[0x1E4F60E78] column:@"deleted"];
  v92 = [v44 equalTo:&unk_1EFF514F8];

  v45 = [MEMORY[0x1E4F60E78] column:@"read"];
  v91 = [v45 equalTo:&unk_1EFF514F8];

  id v46 = objc_alloc(MEMORY[0x1E4F60E48]);
  v101[0] = v88;
  v101[1] = v93;
  v101[2] = v92;
  v101[3] = v91;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:4];
  v48 = (void *)[v46 initWithExpressions:v47];

  id v49 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v50 = [v5 name];
  v51 = (void *)[v49 initWithTableName:v50 columnNames:&unk_1EFF50A00 where:v48 unique:0];

  [v5 addIndex:v51];
  v89 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"mailbox"];
  v90 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"date_received"];
  id v52 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v100 = v90;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
  id v54 = objc_alloc(MEMORY[0x1E4F60E48]);
  v99[0] = v92;
  v99[1] = v93;
  v99[2] = v91;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:3];
  v56 = (void *)[v54 initWithExpressions:v55];
  v57 = (void *)[v52 initWithName:@"messages_date_received_deleted0_journaled0_read0_index" tableName:@"messages" indexedColumns:v53 where:v56 unique:0];

  [v5 addIndex:v57];
  id v58 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v98[0] = v89;
  v98[1] = v90;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:2];
  id v60 = objc_alloc(MEMORY[0x1E4F60E48]);
  v97[0] = v92;
  v97[1] = v93;
  v97[2] = v91;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
  v62 = (void *)[v60 initWithExpressions:v61];
  v63 = (void *)[v58 initWithName:@"messages_mailbox_date_received_deleted0_journaled0_read0_index" tableName:@"messages" indexedColumns:v59 where:v62 unique:0];

  [v5 addIndex:v63];
  v64 = [MEMORY[0x1E4F60E78] column:@"journaled"];
  v87 = [v64 equalTo:&unk_1EFF51510];

  id v65 = objc_alloc(MEMORY[0x1E4F60E48]);
  v96[0] = v87;
  v96[1] = v92;
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
  v67 = (void *)[v65 initWithExpressions:v66];

  id v68 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v69 = [v5 name];
  v70 = (void *)[v68 initWithTableName:v69 columnNames:&unk_1EFF50A18 where:v67 unique:0];

  [v5 addIndex:v70];
  id v71 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v72 = [v5 name];
  v73 = (void *)[v71 initWithTableName:v72 columnNames:&unk_1EFF50A30 where:v93 unique:0];

  [v5 addIndex:v73];
  id v74 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v75 = [v5 name];
  v76 = (void *)[v74 initWithTableName:v75 columnNames:&unk_1EFF50A48 where:v93 unique:0];

  [v5 addIndex:v76];
  v86 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"read"];
  v77 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"deleted"];
  v78 = (void *)[objc_alloc(MEMORY[0x1E4F60EB8]) initWithColumnName:@"global_message_id"];
  id v79 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v95[0] = v86;
  v95[1] = v77;
  v95[2] = v78;
  v95[3] = v89;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
  v81 = (void *)MEMORY[0x1E4F60E48];
  v94[0] = v91;
  v94[1] = v92;
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:2];
  v83 = [v81 combined:v82];
  v84 = (void *)[v79 initWithName:@"messages_read_deleted_global_message_id_mailbox_read0_deleted0_index" tableName:@"messages" indexedColumns:v80 where:v83 unique:0];

  [v5 addIndex:v84];
  return v5;
}

+ (id)mailboxesTableSchema
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_METACLASS___MFPersistenceDatabaseSchema_iOS;
  v0 = objc_msgSendSuper2(&v13, sel_partialMailboxesTableSchema);
  v1 = [MEMORY[0x1E4F60E80] textColumnWithName:@"sequence_identifier" collation:1 nullable:1];
  [v0 addColumn:v1];

  v2 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged_count" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v2];

  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"attachment_count" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v3];

  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"to_cc_count" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v4];

  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"server_unread_count" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v5];

  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_sync_status_count" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v6];

  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"most_recent_status_count" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v7];

  id v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"reconcile" nullable:0 defaultValue:&unk_1EFF514F8];
  [v0 addColumn:v8];

  id v9 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"frecency" nullable:1];
  [v0 addColumn:v9];

  id v10 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"server_metadata" nullable:1];
  [v0 addColumn:v10];

  id v11 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"sync_info" nullable:1];
  [v0 addColumn:v11];

  return v0;
}

+ (id)messageDataTableSchema
{
  v9[5] = *MEMORY[0x1E4F143B8];
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F60F08]);
  v1 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:1];
  v2 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"part", 1, 1, v1);
  v9[1] = v2;
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"partial" nullable:1];
  v9[2] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"complete" nullable:1];
  v9[3] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"length" nullable:1];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  id v7 = (void *)[v0 initWithName:@"message_data" rowIDType:2 columns:v6];

  [v7 addUniquenessConstraintForColumns:&unk_1EFF50A60 conflictResolution:1];
  return v7;
}

+ (id)messageDataDeletedTableSchema
{
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F60F08]);
  v1 = (void *)[v0 initWithName:@"message_data_deleted" rowIDType:1 rowIDAlias:@"message_data_id" columns:MEMORY[0x1E4F1CBF0]];
  return v1;
}

+ (id)popUIDsTableSchema
{
  v9[5] = *MEMORY[0x1E4F143B8];
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F60F08]);
  v1 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  v2 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"uid", 1, 1, v1);
  v9[1] = v2;
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_added" nullable:1];
  v9[2] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flags" nullable:1];
  v9[3] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"del" nullable:1];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  id v7 = (void *)[v0 initWithName:@"pop_uids" rowIDType:1 columns:v6];

  [v7 addUniquenessConstraintForColumns:&unk_1EFF50A78 conflictResolution:1];
  [v7 addIndexForColumns:&unk_1EFF50A90];
  return v7;
}

+ (id)accountsTableSchema
{
  v5[1] = *MEMORY[0x1E4F143B8];
  self;
  id v0 = objc_alloc(MEMORY[0x1E4F60F08]);
  v1 = [MEMORY[0x1E4F60E80] textColumnWithName:@"text_id" collation:1 nullable:1];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  v3 = (void *)[v0 initWithName:@"accounts" rowIDType:2 columns:v2];

  [v3 addUniquenessConstraintForColumns:&unk_1EFF50AA8 conflictResolution:1];
  return v3;
}

@end