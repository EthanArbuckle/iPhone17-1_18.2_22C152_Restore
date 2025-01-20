@interface MFMailMessageLibraryFixPopUidsUniquenessConstraintUpgradeStep
+ (id)_popUIDsTableSchema;
+ (int)runWithConnection:(id)a3;
@end

@implementation MFMailMessageLibraryFixPopUidsUniquenessConstraintUpgradeStep

+ (id)_popUIDsTableSchema
{
  v11[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  v4 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"uid", 1, 1, v3);
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_added" nullable:1];
  v11[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flags" nullable:1];
  v11[3] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"del" nullable:1];
  v11[4] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  v9 = (void *)[v2 initWithName:@"pop_uids" rowIDType:1 columns:v8];

  [v9 addUniquenessConstraintForColumns:&unk_1EFF50568 conflictResolution:1];
  [v9 addIndexForColumns:&unk_1EFF50580];
  return v9;
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  if ([v4 executeStatementString:@"ALTER TABLE pop_uids RENAME TO pop_uids_old" errorMessage:@"Moving pop_uids table aside"] & 1) != 0&& (objc_msgSend(a1, "_popUIDsTableSchema"), v5 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "definitionWithDatabaseName:includeIndexes:", 0, 0), v6 = objc_claimAutoreleasedReturnValue(), char v7 = objc_msgSend(v4, "executeStatementString:errorMessage:", v6, @"Creating new pop_uids table"), v6, v5, (v7)&& (objc_msgSend(v4, "executeStatementString:errorMessage:", @"INSERT OR REPLACE INTO pop_uids (mailbox, uid, date_added, flags, del) SELECT mailbox, uid, date_added, flags, del FROM pop_uids_old ORDER BY ROWID ASC ", @"Populating pop_uids") & 1) != 0&& objc_msgSend(v4, {
                       "executeStatementString:errorMessage:",
  }
                       @"DROP TABLE pop_uids_old",
                       @"Dropping pop_uids_old"))
  {
    v8 = [a1 _popUIDsTableSchema];
    v9 = [v8 indexDefinitionsWithDatabaseName:0];
    int v10 = [v4 executeStatementString:v9 errorMessage:@"Creating pop_uids indexes"];

    int v11 = v10 ^ 1;
  }
  else
  {
    int v11 = 1;
  }

  return v11;
}

@end