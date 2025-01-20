@interface PPSSQLStorage
+ (id)trimConditionsForBGSQLWithTrimDate:(id)a3;
+ (id)trimConditionsForCESQLWithTrimDate:(id)a3;
+ (id)trimConditionsForEPSQLWithTrimDate:(id)a3;
+ (id)trimConditionsForEntryKey:(id)a3 trimDate:(double)a4 currDate:(double)a5;
+ (id)trimConditionsForPLSQLWithTrimDate:(id)a3;
+ (id)trimConditionsForStorage:(int)a3 trimDate:(id)a4;
+ (id)trimConditionsForXCSQLWithTrimDate:(id)a3;
- (BOOL)storageStarted;
- (BOOL)updateTable:(id)a3 transferDataForKeys:(id)a4;
- (NSDictionary)connectionByStorage;
- (NSMutableSet)entryKeysToSetup;
- (PPSSQLStorage)init;
- (id)BGSQLConnection;
- (id)CESQLConnection;
- (id)EPSQLConnection;
- (id)PLSQLConnection;
- (id)PreUnlockEPSQLConnection;
- (id)XCSQLConnection;
- (id)connectionForKey:(id)a3;
- (id)metricsToAddForStorage:(id)a3 processedMetrics:(id)a4;
- (id)metricsToUpdateForStorage:(id)a3 processedMetrics:(id)a4;
- (id)setupDBConnectionAtPath:(id)a3;
- (int)storageForConnection:(id)a3;
- (void)closeAllConnections;
- (void)createMetadataTable;
- (void)deleteOldMetadataStore;
- (void)handleMetadataVersionChange;
- (void)handleSchemaMismatchForTable:(id)a3;
- (void)persistMetadata;
- (void)setConnectionByStorage:(id)a3;
- (void)setEntryKeysToSetup:(id)a3;
- (void)setStorageStarted:(BOOL)a3;
- (void)setupArrayTableForEntryKey:(id)a3 withName:(id)a4 withConnection:(id)a5;
- (void)setupDBConnections;
- (void)setupDynamicTableForEntryKey:(id)a3 withName:(id)a4 withConnection:(id)a5;
- (void)setupFolders;
- (void)setupMetadataStorage;
- (void)setupStorageForEntryKey:(id)a3;
- (void)setupTableForEntryKey:(id)a3;
- (void)setupTableForEntryKey:(id)a3 withName:(id)a4;
- (void)startStorage;
- (void)updateMetadata:(id)a3 updateMetrics:(id)a4 addMetrics:(id)a5;
@end

@implementation PPSSQLStorage

- (id)connectionForKey:(id)a3
{
  uint64_t v4 = +[PPSEntryKey storageForEntryKey:a3];
  v5 = [(PPSSQLStorage *)self connectionByStorage];
  v6 = [NSNumber numberWithInt:v4];
  v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

- (NSDictionary)connectionByStorage
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (PPSSQLStorage)init
{
  v5.receiver = self;
  v5.super_class = (Class)PPSSQLStorage;
  v2 = [(PPSStorage *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PPSSQLStorage *)v2 setStorageStarted:0];
    [(PPSSQLStorage *)v3 setupFolders];
    [(PPSSQLStorage *)v3 setupDBConnections];
    if (init_onceToken_0 != -1) {
      dispatch_once(&init_onceToken_0, &__block_literal_global_23);
    }
  }
  return v3;
}

void __21__PPSSQLStorage_init__block_invoke()
{
  v3[10] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1580948;
  v2[1] = &unk_1F1580960;
  v3[0] = @"BLOB";
  v3[1] = @"INTEGER";
  v2[2] = &unk_1F1580978;
  v2[3] = &unk_1F1580990;
  v3[2] = @"INTEGER";
  v3[3] = @"TEXT";
  v2[4] = &unk_1F15809A8;
  v2[5] = &unk_1F15809C0;
  v3[4] = @"REAL";
  v3[5] = @"INTEGER";
  v2[6] = &unk_1F15809D8;
  v2[7] = &unk_1F15809F0;
  v3[6] = @"INTEGER";
  v3[7] = @"INTEGER";
  v2[8] = &unk_1F1580A08;
  v2[9] = &unk_1F1580A20;
  v3[8] = @"REAL";
  v3[9] = @"BLOB";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:10];
  v1 = (void *)PLVTypeToPLSQLiteType_0;
  PLVTypeToPLSQLiteType_0 = v0;
}

- (void)startStorage
{
  if (startStorage_onceToken != -1) {
    dispatch_once(&startStorage_onceToken, &__block_literal_global_73);
  }
}

void __29__PPSSQLStorage_startStorage__block_invoke()
{
  uint64_t v0 = sqlLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEFAULT, "[PPSSQLStorage] Starting Storage", v3, 2u);
  }

  v1 = +[PowerlogCore sharedCore];
  v2 = [v1 storage];
  [v2 startStorage];
}

- (void)setupMetadataStorage
{
  if (!+[PLUtilities shouldLogPreUnlockTelemetry])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PPSSQLStorage_setupMetadataStorage__block_invoke;
    block[3] = &unk_1E62538C8;
    block[4] = self;
    if (setupMetadataStorage_onceToken != -1) {
      dispatch_once(&setupMetadataStorage_onceToken, block);
    }
  }
}

uint64_t __37__PPSSQLStorage_setupMetadataStorage__block_invoke(uint64_t a1)
{
  v2 = sqlLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1BBD2F000, v2, OS_LOG_TYPE_DEFAULT, "[PPSSQLStorage] Setup Metadata Storage", v4, 2u);
  }

  [*(id *)(a1 + 32) handleMetadataVersionChange];
  [*(id *)(a1 + 32) createMetadataTable];
  [*(id *)(a1 + 32) persistMetadata];
  return [*(id *)(a1 + 32) deleteOldMetadataStore];
}

- (void)createMetadataTable
{
  v47[3] = *MEMORY[0x1E4F143B8];
  v45[0] = @"column-name";
  v45[1] = @"type";
  v46[0] = @"subsystem";
  v46[1] = @"TEXT";
  v47[0] = &unk_1F1586E68;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v47[1] = v2;
  v43[0] = @"column-name";
  v43[1] = @"type";
  v44[0] = @"category";
  v44[1] = @"TEXT";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v47[2] = v3;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:3];

  v42[0] = &unk_1F1586E90;
  v42[1] = &unk_1F1586EB8;
  v40[0] = @"column-name";
  v40[1] = @"type";
  v41[0] = @"build";
  v41[1] = @"TEXT";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  v42[2] = v4;
  v38[0] = @"column-name";
  v38[1] = @"type";
  v39[0] = @"name";
  v39[1] = @"TEXT";
  objc_super v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  v42[3] = v5;
  v36[0] = @"column-name";
  v36[1] = @"type";
  v37[0] = @"version";
  v37[1] = @"REAL";
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  v42[4] = v6;
  v34[0] = @"column-name";
  v34[1] = @"type";
  v35[0] = @"metadata";
  v35[1] = @"BLOB";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
  v42[5] = v7;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:6];

  v32[1] = @"REAL";
  v33[0] = &unk_1F1586EE0;
  v31[0] = @"column-name";
  v31[1] = @"type";
  v32[0] = @"version";
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v33[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [(PPSSQLStorage *)self connectionByStorage];
  v11 = [v10 allValues];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v16 tableExistsForTableName:@"PLCoreStorage_Metadata"] & 1) == 0)
        {
          [v16 createTableName:@"PLCoreStorage_Metadata" withColumns:v23];
          v29[0] = @"subsystem";
          v29[1] = @"category";
          v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
          [v16 createCompositeIndexOnTable:@"PLCoreStorage_Metadata" forColumns:v17];
        }
        if (([v16 tableExistsForTableName:@"PLCoreStorage_Metadata_Dynamic"] & 1) == 0)
        {
          [v16 createTableName:@"PLCoreStorage_Metadata_Dynamic" withColumns:v22];
          v28[0] = @"FK_ID";
          v28[1] = @"name";
          v28[2] = @"version";
          v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
          [v16 createCompositeIndexOnTable:@"PLCoreStorage_Metadata_Dynamic" forColumns:v18];
        }
        if (([v16 tableExistsForTableName:@"PLCoreStorage_MetadataVersion"] & 1) == 0)
        {
          [v16 createTableName:@"PLCoreStorage_MetadataVersion" withColumns:v9];
          v19 = [NSString stringWithFormat:@"INSERT INTO %@ (%@) VALUES (%f)", @"PLCoreStorage_MetadataVersion", @"version", 0x3FF0000000000000];
          id v20 = (id)[v16 performQuery:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v13);
  }
}

- (void)handleMetadataVersionChange
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"SELECT %@ FROM %@", @"version", @"PLCoreStorage_MetadataVersion"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [(PPSSQLStorage *)self connectionByStorage];
  objc_super v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v8 = @"PLCoreStorage_MetadataVersion";
    uint64_t v9 = *(void *)v25;
    v10 = @"PLCoreStorage_Metadata";
    do
    {
      uint64_t v11 = 0;
      uint64_t v23 = v7;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        if (![v12 tableExistsForTableName:v8]) {
          goto LABEL_11;
        }
        uint64_t v13 = [v12 performQuery:v3];
        if ([v13 count] != 1)
        {

LABEL_11:
          [v12 dropTable:v10];
          [v12 dropTable:@"PLCoreStorage_Metadata_Dynamic"];
          [v12 dropTable:v8];
          goto LABEL_12;
        }
        uint64_t v14 = [v13 objectAtIndexedSubscript:0];
        [v14 objectForKeyedSubscript:@"version"];
        uint64_t v15 = v9;
        v16 = v8;
        v17 = v10;
        v18 = v5;
        id v20 = v19 = v3;
        [v20 doubleValue];
        double v22 = v21;

        v3 = v19;
        objc_super v5 = v18;
        v10 = v17;
        v8 = v16;
        uint64_t v9 = v15;
        uint64_t v7 = v23;

        if (v22 != 1.0) {
          goto LABEL_11;
        }
LABEL_12:
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }
}

- (void)persistMetadata
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  [(PPSSQLStorage *)self setEntryKeysToSetup:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(PPSSQLStorage *)self connectionByStorage];
  objc_super v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        uint64_t v11 = objc_opt_new();
        uint64_t v12 = [(PPSSQLStorage *)self metricsToUpdateForStorage:v10 processedMetrics:v11];
        uint64_t v13 = [(PPSSQLStorage *)self metricsToAddForStorage:v10 processedMetrics:v11];
        if ([v12 count] || objc_msgSend(v13, "count")) {
          [(PPSSQLStorage *)self updateMetadata:v10 updateMetrics:v12 addMetrics:v13];
        }
        [v10 freeMetadataState];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)updateMetadata:(id)a3 updateMetrics:(id)a4 addMetrics:(id)a5
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v54 = a5;
  v63 = v7;
  [v7 beginTransaction];
  v62 = +[PLUtilities buildVersion];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v9 = v8;
  obuint64_t j = (id)[v9 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (obj)
  {
    uint64_t v56 = *(void *)v81;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v81 != v56)
        {
          uint64_t v11 = v10;
          objc_enumerationMutation(v9);
          uint64_t v10 = v11;
        }
        uint64_t v60 = v10;
        uint64_t v12 = *(void *)(*((void *)&v80 + 1) + 8 * v10);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        uint64_t v13 = [v9 objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v91 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v77 != v15) {
                objc_enumerationMutation(v13);
              }
              uint64_t v17 = *(void *)(*((void *)&v76 + 1) + 8 * i);
              v18 = [v9 objectForKeyedSubscript:v12];
              uint64_t v19 = [v18 objectForKeyedSubscript:v17];
              id v20 = [MEMORY[0x1E4F1CA98] null];
              BOOL v21 = v19 == v20;

              if (v21)
              {
                uint64_t v23 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE FK_ID='%@' AND name='%@'", @"PLCoreStorage_Metadata_Dynamic", v12, v17];
                id v25 = (id)[v63 performQuery:v23 returnValue:0 returnResult:0];
              }
              else
              {
                double v22 = [v9 objectForKeyedSubscript:v12];
                uint64_t v23 = [v22 objectForKeyedSubscript:v17];

                long long v24 = [v23 data];
                [v23 version];
                objc_msgSend(v63, "writeMetadata:forFKID:build:name:version:", v24, v12, v62, v17);
              }
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v76 objects:v91 count:16];
          }
          while (v14);
        }

        uint64_t v10 = v60 + 1;
      }
      while ((id)(v60 + 1) != obj);
      obuint64_t j = (id)[v9 countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (obj);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obja = v54;
  uint64_t v48 = [obja countByEnumeratingWithState:&v72 objects:v90 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v73 != v47) {
          objc_enumerationMutation(obja);
        }
        uint64_t v26 = *(void *)(*((void *)&v72 + 1) + 8 * j);
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        uint64_t v27 = v26;
        objc_msgSend(obja, "objectForKeyedSubscript:");
        id v50 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v52 = [v50 countByEnumeratingWithState:&v68 objects:v89 count:16];
        if (v52)
        {
          uint64_t v51 = *(void *)v69;
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v69 != v51)
              {
                uint64_t v29 = v28;
                objc_enumerationMutation(v50);
                uint64_t v28 = v29;
              }
              uint64_t v53 = v28;
              uint64_t v30 = *(void *)(*((void *)&v68 + 1) + 8 * v28);
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              long long v67 = 0u;
              v31 = [obja objectForKeyedSubscript:v27];
              id v55 = [v31 objectForKeyedSubscript:v30];

              uint64_t v61 = [v55 countByEnumeratingWithState:&v64 objects:v88 count:16];
              if (v61)
              {
                uint64_t v57 = *(void *)v65;
                do
                {
                  uint64_t v32 = 0;
                  do
                  {
                    if (*(void *)v65 != v57) {
                      objc_enumerationMutation(v55);
                    }
                    uint64_t v33 = *(void *)(*((void *)&v64 + 1) + 8 * v32);
                    v34 = [obja objectForKeyedSubscript:v27];
                    v35 = [v34 objectForKeyedSubscript:v30];
                    v36 = [v35 objectForKeyedSubscript:v33];

                    v37 = [NSString stringWithFormat:@"SELECT ID FROM %@ WHERE subsystem='%@' AND category='%@'", @"PLCoreStorage_Metadata", v27, v30];
                    v38 = [v63 performQuery:v37];
                    if ((unint64_t)[v38 count] < 2)
                    {
                      if ([v38 count])
                      {
                        v40 = v38;
                        goto LABEL_42;
                      }
                      v41 = sqlLog();
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        uint64_t v85 = v27;
                        __int16 v86 = 2112;
                        uint64_t v87 = v30;
                        _os_log_impl(&dword_1BBD2F000, v41, OS_LOG_TYPE_DEFAULT, "New subsystem category added: %@ %@", buf, 0x16u);
                      }

                      v39 = [NSString stringWithFormat:@"INSERT INTO %@ (subsystem, category) VALUES ('%@', '%@')", @"PLCoreStorage_Metadata", v27, v30];
                      id v42 = (id)[v63 performQuery:v39 returnValue:0 returnResult:0];
                      v40 = [v63 performQuery:v37];

                      if ([v40 count] == 1)
                      {

LABEL_42:
                        v43 = [v40 objectAtIndexedSubscript:0];
                        v39 = [v43 objectForKeyedSubscript:@"ID"];

                        v44 = [v36 data];
                        [v36 version];
                        objc_msgSend(v63, "writeMetadata:forFKID:build:name:version:", v44, v39, v62, v33);
                      }
                      else
                      {
                        v45 = sqlLog();
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v85 = v27;
                          __int16 v86 = 2112;
                          uint64_t v87 = v30;
                          _os_log_error_impl(&dword_1BBD2F000, v45, OS_LOG_TYPE_ERROR, "Failed to insert subsystem-category: %@ %@", buf, 0x16u);
                        }
                      }
                      v38 = v40;
                      goto LABEL_44;
                    }
                    v39 = sqlLog();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v85 = v27;
                      __int16 v86 = 2112;
                      uint64_t v87 = v30;
                      _os_log_error_impl(&dword_1BBD2F000, v39, OS_LOG_TYPE_ERROR, "Duplicate subsystem-category entries found: %@ %@", buf, 0x16u);
                    }
LABEL_44:

                    ++v32;
                  }
                  while (v61 != v32);
                  uint64_t v46 = [v55 countByEnumeratingWithState:&v64 objects:v88 count:16];
                  uint64_t v61 = v46;
                }
                while (v46);
              }

              uint64_t v28 = v53 + 1;
            }
            while (v53 + 1 != v52);
            uint64_t v52 = [v50 countByEnumeratingWithState:&v68 objects:v89 count:16];
          }
          while (v52);
        }
      }
      uint64_t v48 = [obja countByEnumeratingWithState:&v72 objects:v90 count:16];
    }
    while (v48);
  }

  [v63 endTransaction];
}

- (id)metricsToUpdateForStorage:(id)a3 processedMetrics:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = [NSString stringWithFormat:@"SELECT * from %@", @"PLCoreStorage_Metadata"];
  long long v65 = v5;
  id v9 = [v5 performQuery:v8];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v10 = v9;
  uint64_t v11 = (void *)v7;
  obuint64_t j = v10;
  uint64_t v66 = [v10 countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v66)
  {
    uint64_t v64 = *(void *)v81;
    unint64_t v12 = 0x1E4F28000uLL;
    long long v75 = (void *)v7;
    long long v72 = v6;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v81 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = v13;
        uint64_t v14 = *(void **)(*((void *)&v80 + 1) + 8 * v13);
        context = (void *)MEMORY[0x1C1869120]();
        uint64_t v15 = [v14 objectForKeyedSubscript:@"subsystem"];
        long long v16 = [v14 objectForKeyedSubscript:@"category"];
        uint64_t v17 = [v14 objectForKeyedSubscript:@"ID"];
        uint64_t v18 = [v17 integerValue];

        long long v67 = [NSString stringWithFormat:@"SELECT FK_ID, name, max(version) as version FROM %@ WHERE FK_ID=%lu GROUP BY FK_ID,name", @"PLCoreStorage_Metadata_Dynamic", v18];
        uint64_t v19 = objc_msgSend(v65, "performQuery:");
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v71 = v19;
        uint64_t v11 = v75;
        uint64_t v74 = [v19 countByEnumeratingWithState:&v76 objects:v90 count:16];
        if (v74)
        {
          uint64_t v73 = *(void *)v77;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v77 != v73) {
                objc_enumerationMutation(v71);
              }
              BOOL v21 = *(void **)(*((void *)&v76 + 1) + 8 * v20);
              uint64_t v22 = [v21 objectForKeyedSubscript:@"name"];
              uint64_t v23 = [v21 objectForKeyedSubscript:@"version"];
              [v23 doubleValue];
              double v25 = v24;

              uint64_t v26 = (void *)v22;
              uint64_t v27 = [MEMORY[0x1E4F89D08] getMetadataForSubsystem:v15 category:v16 name:v22];
              uint64_t v28 = v27;
              if (!v27 || ([v27 version], v29 < v25))
              {
                uint64_t v30 = [*(id *)(v12 + 3792) numberWithInteger:v18];
                [v11 objectForKeyedSubscript:v30];
                uint64_t v32 = v31 = v12;

                if (!v32)
                {
                  uint64_t v33 = objc_opt_new();
                  v34 = [*(id *)(v31 + 3792) numberWithInteger:v18];
                  [v11 setObject:v33 forKeyedSubscript:v34];
                }
                v35 = [MEMORY[0x1E4F1CA98] null];
                v36 = [*(id *)(v31 + 3792) numberWithInteger:v18];
                v37 = [v11 objectForKeyedSubscript:v36];
                [v37 setObject:v35 forKeyedSubscript:v26];

                id v6 = v72;
LABEL_16:

                unint64_t v12 = 0x1E4F28000;
                goto LABEL_17;
              }
              [v28 version];
              id v6 = v72;
              if (v46 <= v25) {
                goto LABEL_18;
              }
              uint64_t v47 = [*(id *)(v12 + 3792) numberWithInteger:v18];
              uint64_t v48 = [v75 objectForKeyedSubscript:v47];

              if (!v48)
              {
                v49 = objc_opt_new();
                id v50 = [*(id *)(v12 + 3792) numberWithInteger:v18];
                [v75 setObject:v49 forKeyedSubscript:v50];
              }
              [v28 version];
              if ((int)v51 == (int)v25)
              {
                uint64_t v52 = [*(id *)(v12 + 3792) numberWithInteger:v18];
                uint64_t v53 = [v75 objectForKeyedSubscript:v52];
                [v53 setObject:v28 forKeyedSubscript:v26];

                v35 = +[PPSEntryKey entryKeyForMetric:v28];
                if (v35)
                {
                  v36 = [(PPSSQLStorage *)self entryKeysToSetup];
                  [v36 addObject:v35];
                  goto LABEL_16;
                }
LABEL_17:

LABEL_18:
                v38 = [v6 objectForKeyedSubscript:v15];

                if (!v38)
                {
                  v39 = objc_opt_new();
                  [v6 setObject:v39 forKeyedSubscript:v15];
                }
                v40 = [v6 objectForKeyedSubscript:v15];
                v41 = [v40 objectForKeyedSubscript:v16];

                if (!v41)
                {
                  id v42 = objc_opt_new();
                  v43 = [v6 objectForKeyedSubscript:v15];
                  [v43 setObject:v42 forKeyedSubscript:v16];
                }
                v44 = [v6 objectForKeyedSubscript:v15];
                v45 = [v44 objectForKeyedSubscript:v16];
                [v45 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v26];

                goto LABEL_23;
              }
              id v54 = [MEMORY[0x1E4F1CA98] null];
              id v55 = [*(id *)(v12 + 3792) numberWithInteger:v18];
              uint64_t v56 = [v75 objectForKeyedSubscript:v55];
              [v56 setObject:v54 forKeyedSubscript:v26];

              uint64_t v57 = [v72 objectForKeyedSubscript:v15];
              v58 = [v57 objectForKeyedSubscript:v16];
              [v58 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v26];

              v44 = sqlLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                v59 = [v28 subsystem];
                uint64_t v60 = [v28 category];
                *(_DWORD *)buf = 138412802;
                uint64_t v85 = v59;
                __int16 v86 = 2112;
                uint64_t v87 = v60;
                __int16 v88 = 2112;
                v89 = v26;
                _os_log_debug_impl(&dword_1BBD2F000, v44, OS_LOG_TYPE_DEBUG, "Metric[%@:%@:%@] underwent a major version change. Dropping old metadata", buf, 0x20u);
              }
              unint64_t v12 = 0x1E4F28000;
LABEL_23:

              ++v20;
              uint64_t v11 = v75;
            }
            while (v74 != v20);
            uint64_t v61 = [v71 countByEnumeratingWithState:&v76 objects:v90 count:16];
            uint64_t v74 = v61;
          }
          while (v61);
        }

        uint64_t v13 = v69 + 1;
      }
      while (v69 + 1 != v66);
      uint64_t v66 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
    }
    while (v66);
  }

  return v11;
}

- (id)metricsToAddForStorage:(id)a3 processedMetrics:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v47 = a4;
  id v46 = (id)objc_opt_new();
  uint64_t v7 = [MEMORY[0x1E4F89D08] getAllSubsystem];
  v45 = self;
  v37 = v6;
  int v49 = [(PPSSQLStorage *)self storageForConnection:v6];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v7;
  uint64_t v40 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v61;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v61 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v8;
        uint64_t v9 = *(void *)(*((void *)&v60 + 1) + 8 * v8);
        id v10 = [MEMORY[0x1E4F89D08] getMetadataByCategoryForSubsystem:v9];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        uint64_t v43 = [v10 countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v43)
        {
          uint64_t v42 = *(void *)v57;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v57 != v42) {
                objc_enumerationMutation(v10);
              }
              uint64_t v44 = v11;
              uint64_t v12 = *(void *)(*((void *)&v56 + 1) + 8 * v11);
              long long v52 = 0u;
              long long v53 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id v48 = [v10 objectForKeyedSubscript:v12];
              uint64_t v51 = [v48 countByEnumeratingWithState:&v52 objects:v64 count:16];
              if (v51)
              {
                uint64_t v50 = *(void *)v53;
                do
                {
                  for (uint64_t i = 0; i != v51; ++i)
                  {
                    if (*(void *)v53 != v50) {
                      objc_enumerationMutation(v48);
                    }
                    uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                    uint64_t v15 = [v10 objectForKeyedSubscript:v12];
                    long long v16 = [v15 objectForKeyedSubscript:v14];

                    if ([v16 storage] == v49)
                    {
                      uint64_t v17 = [v47 objectForKeyedSubscript:v9];
                      [v17 objectForKeyedSubscript:v12];
                      uint64_t v19 = v18 = v9;
                      uint64_t v20 = [v19 objectForKeyedSubscript:v14];
                      char v21 = [v20 BOOLValue];

                      uint64_t v9 = v18;
                      if ((v21 & 1) == 0)
                      {
                        uint64_t v22 = [v46 objectForKeyedSubscript:v18];

                        if (!v22)
                        {
                          uint64_t v23 = objc_opt_new();
                          [v46 setObject:v23 forKeyedSubscript:v18];
                        }
                        double v24 = [v46 objectForKeyedSubscript:v18];
                        double v25 = [v24 objectForKeyedSubscript:v12];

                        if (!v25)
                        {
                          uint64_t v26 = objc_opt_new();
                          uint64_t v27 = [v46 objectForKeyedSubscript:v18];
                          [v27 setObject:v26 forKeyedSubscript:v12];
                        }
                        uint64_t v28 = [v10 objectForKeyedSubscript:v12];
                        double v29 = [v28 objectForKeyedSubscript:v14];
                        uint64_t v30 = [v46 objectForKeyedSubscript:v18];
                        unint64_t v31 = [v30 objectForKeyedSubscript:v12];
                        [v31 setObject:v29 forKeyedSubscript:v14];

                        uint64_t v32 = [v10 objectForKeyedSubscript:v12];
                        uint64_t v33 = [v32 objectForKeyedSubscript:v14];
                        v34 = +[PPSEntryKey entryKeyForMetric:v33];

                        if (v34)
                        {
                          v35 = [(PPSSQLStorage *)v45 entryKeysToSetup];
                          [v35 addObject:v34];
                        }
                        uint64_t v9 = v18;
                      }
                    }
                  }
                  uint64_t v51 = [v48 countByEnumeratingWithState:&v52 objects:v64 count:16];
                }
                while (v51);
              }

              uint64_t v11 = v44 + 1;
            }
            while (v44 + 1 != v43);
            uint64_t v43 = [v10 countByEnumeratingWithState:&v56 objects:v65 count:16];
          }
          while (v43);
        }

        uint64_t v8 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v40);
  }

  return v46;
}

- (void)deleteOldMetadataStore
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "deleteOldMetadataStore: %@", v1, 0xCu);
}

- (void)setupStorageForEntryKey:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(PPSSQLStorage *)self connectionForKey:v9];
  if (([v4 tableExistsForTableName:v9] & 1) == 0) {
    [(PPSSQLStorage *)self setupTableForEntryKey:v9];
  }
  if (+[PPSEntryKey hasDynamicKeys:v9])
  {
    id v5 = +[PPSEntryKey dynamicTableNameForEntryKey:v9];
    [(PPSSQLStorage *)self setupDynamicTableForEntryKey:v9 withName:v5 withConnection:v4];
  }
  if (+[PPSEntryKey hasArrayKeys:v9]) {
    [(PPSSQLStorage *)self setupArrayTableForEntryKey:v9 withName:v9 withConnection:v4];
  }
  id v6 = [(PPSSQLStorage *)self entryKeysToSetup];
  int v7 = [v6 containsObject:v9];

  if (v7)
  {
    [(PPSSQLStorage *)self handleSchemaMismatchForTable:v9];
    uint64_t v8 = [(PPSSQLStorage *)self entryKeysToSetup];
    [v8 removeObject:v9];
  }
}

- (void)handleSchemaMismatchForTable:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v60 = self;
  uint64_t v64 = [(PPSSQLStorage *)self connectionForKey:v4];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
  unint64_t v6 = 0x1E6253000uLL;
  if (+[PPSEntryKey hasDynamicKeys:v4])
  {
    long long v56 = +[PPSEntryKey dynamicTableNameForEntryKey:v4];
    objc_msgSend(v5, "addObject:");
  }
  else
  {
    long long v56 = 0;
  }
  id v63 = v4;
  BOOL v58 = +[PPSEntryKey hasArrayKeys:v4];
  if (v58)
  {
    int v7 = +[PPSEntryKey arrayMetricsForEntryKey:v4];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v89 objects:v103 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      long long v57 = 0;
      uint64_t v10 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v90 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v89 + 1) + 8 * i);
          uint64_t v13 = [v7 objectForKeyedSubscript:v12];
          int v14 = [v13 fixedArraySize];

          if (!v14)
          {
            uint64_t v15 = [NSString stringWithFormat:@"%@_Array_%@", v4, v12];

            [v5 addObject:v15];
            long long v57 = (void *)v15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v89 objects:v103 count:16];
      }
      while (v9);
    }
    else
    {
      long long v57 = 0;
    }

    unint64_t v6 = 0x1E6253000uLL;
  }
  else
  {
    long long v57 = 0;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v5;
  uint64_t v62 = [obj countByEnumeratingWithState:&v85 objects:v102 count:16];
  if (v62)
  {
    uint64_t v61 = *(void *)v86;
    unint64_t v16 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v85 + 1) + 8 * v17);
        uint64_t v19 = [*(id *)(v16 + 2656) dictionary];
        uint64_t v20 = [v64 tableInfo:v18];
        long long v65 = v18;
        uint64_t v66 = v20;
        if ([v18 isEqualToString:v4])
        {
          char v21 = [*(id *)(v6 + 1368) baseMetricsForEntryKey:v4];
          [v19 addEntriesFromDictionary:v21];

          if (v58)
          {
            uint64_t v22 = [*(id *)(v6 + 1368) arrayMetricsForEntryKey:v4];
            long long v81 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v81 objects:v101 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v82;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v82 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v81 + 1) + 8 * j);
                  uint64_t v28 = [v22 objectForKeyedSubscript:v27];
                  double v29 = v28;
                  if (v28 && [v28 fixedArraySize]) {
                    [v19 setObject:v29 forKeyedSubscript:v27];
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v81 objects:v101 count:16];
              }
              while (v24);
              uint64_t v20 = v66;
            }
            goto LABEL_41;
          }
        }
        else
        {
          if ([v18 containsString:@"_Dynamic"])
          {
            uint64_t v30 = [*(id *)(v6 + 1368) dynamicMetricsForEntryKey:v4];
            goto LABEL_40;
          }
          if ([v4 containsString:@"_Array"])
          {
            uint64_t v30 = [*(id *)(v6 + 1368) arrayMetricsForEntryKey:v4];
LABEL_40:
            uint64_t v22 = (void *)v30;
            [v19 addEntriesFromDictionary:v30];
LABEL_41:
          }
        }
        unint64_t v31 = [*(id *)(v16 + 2656) dictionary];
        uint64_t v32 = [MEMORY[0x1E4F1CA80] set];
        uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
        v34 = [MEMORY[0x1E4F1CA80] set];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke;
        v75[3] = &unk_1E62549E8;
        id v35 = v19;
        id v76 = v35;
        id v36 = v31;
        id v77 = v36;
        id v37 = v33;
        id v78 = v37;
        id v38 = v32;
        id v79 = v38;
        id v39 = v34;
        id v80 = v39;
        [v20 enumerateObjectsUsingBlock:v75];
        uint64_t v40 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v41 = [v35 allKeys];
        uint64_t v42 = [v40 setWithArray:v41];

        uint64_t v43 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v44 = [v36 allKeys];
        v45 = [v43 setWithArray:v44];
        [v42 minusSet:v45];

        [v42 minusSet:v39];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_2;
        v71[3] = &unk_1E6254A10;
        id v46 = v35;
        id v72 = v46;
        id v47 = v42;
        id v73 = v47;
        id v48 = v38;
        id v74 = v48;
        [v36 enumerateKeysAndObjectsUsingBlock:v71];
        if ([v48 count] || objc_msgSend(v37, "count"))
        {
          int v49 = sqlLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            v94 = v65;
            __int16 v95 = 2112;
            id v96 = v48;
            __int16 v97 = 2112;
            id v98 = v37;
            __int16 v99 = 2112;
            id v100 = v47;
            _os_log_debug_impl(&dword_1BBD2F000, v49, OS_LOG_TYPE_DEBUG, "SchemaMismatch: table: %@ deleted: %@ typechange: %@ new: %@", buf, 0x2Au);
          }

          uint64_t v50 = (void *)MEMORY[0x1E4F1CA80];
          uint64_t v51 = [v46 allKeys];
          long long v52 = [v50 setWithArray:v51];

          [v52 minusSet:v48];
          [v52 minusSet:v37];
          [v52 minusSet:v47];
          [(PPSSQLStorage *)v60 updateTable:v65 transferDataForKeys:v52];
          id v4 = v63;
        }
        else
        {
          uint64_t v53 = [v47 count];
          long long v52 = sqlLog();
          BOOL v54 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
          if (v53)
          {
            if (v54)
            {
              *(_DWORD *)buf = 138412546;
              v94 = v65;
              __int16 v95 = 2112;
              id v96 = v47;
              _os_log_debug_impl(&dword_1BBD2F000, v52, OS_LOG_TYPE_DEBUG, "SchemaMismatch: table: %@ newMetrics: %@", buf, 0x16u);
            }

            v67[0] = MEMORY[0x1E4F143A8];
            v67[1] = 3221225472;
            v67[2] = __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_167;
            v67[3] = &unk_1E6254A38;
            long long v68 = v46;
            uint64_t v69 = v65;
            id v70 = v64;
            [v47 enumerateObjectsUsingBlock:v67];

            long long v52 = v68;
          }
          else if (v54)
          {
            *(_DWORD *)buf = 138412290;
            v94 = v65;
            _os_log_debug_impl(&dword_1BBD2F000, v52, OS_LOG_TYPE_DEBUG, "SchemaMismatch: table: %@ metrics modified", buf, 0xCu);
          }
        }

        ++v17;
        unint64_t v6 = 0x1E6253000;
        unint64_t v16 = 0x1E4F1C000;
      }
      while (v17 != v62);
      uint64_t v55 = [obj countByEnumeratingWithState:&v85 objects:v102 count:16];
      uint64_t v62 = v55;
    }
    while (v55);
  }
}

void __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke(id *a1, void *a2)
{
  id v20 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = [v20 objectForKeyedSubscript:@"name"];
  id v5 = (void *)[v3 initWithString:v4];

  if (v5
    && ([v5 isEqualToString:@"ID"] & 1) == 0
    && ([v5 isEqualToString:@"timestamp"] & 1) == 0
    && ([v5 isEqualToString:@"FK_ID"] & 1) == 0)
  {
    unint64_t v6 = [a1[4] objectForKeyedSubscript:v5];

    if (!v6)
    {
      uint64_t v7 = [v5 rangeOfString:@"_[0-9.]+$" options:1024];
      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = objc_msgSend(v5, "stringByReplacingCharactersInRange:withString:", v7, v8, &stru_1F15208F0);
        if ([v9 length])
        {
          uint64_t v10 = [a1[4] objectForKeyedSubscript:v9];
          uint64_t v11 = v10;
          if (v10
            && [v10 auxiliaryType] == 3
            && [v11 fixedArraySize])
          {
            [a1[4] setObject:v11 forKey:v5];
            uint64_t v12 = [a1[5] objectForKeyedSubscript:v9];

            if (!v12)
            {
              uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
              [a1[5] setObject:v13 forKeyedSubscript:v9];
            }
            int v14 = [a1[5] objectForKeyedSubscript:v9];
            [v14 addObject:v5];
          }
        }
      }
    }
    uint64_t v15 = [a1[4] objectForKeyedSubscript:v5];
    if (v15)
    {
      unint64_t v16 = [v20 objectForKeyedSubscript:@"type"];
      uint64_t v17 = (void *)PLVTypeToPLSQLiteType_0;
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "datatype"));
      uint64_t v19 = [v17 objectForKeyedSubscript:v18];

      if (([v19 isEqualToString:v16] & 1) == 0) {
        [a1[6] addObject:v5];
      }
    }
    else
    {
      [a1[7] addObject:v5];
    }
    [a1[8] addObject:v5];
  }
}

void __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  unint64_t v6 = [a1[4] objectForKeyedSubscript:v15];
  if ([v6 auxiliaryType] == 3)
  {
    unsigned int v7 = [v6 fixedArraySize];
    unint64_t v8 = [v5 count];
    unsigned int v9 = [v6 fixedArraySize];
    if (v8 >= v7)
    {
      if ([v5 count] > (unint64_t)v9)
      {
        int v12 = [v6 fixedArraySize];
        if ([v5 count] > (unint64_t)v12)
        {
          unint64_t v13 = v12;
          do
          {
            int v14 = [NSString stringWithFormat:@"%@_%d", v15, v13];
            [a1[6] addObject:v14];

            ++v13;
          }
          while ([v5 count] > v13);
        }
      }
    }
    else if (v9)
    {
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = [NSString stringWithFormat:@"%@_%d", v15, v10];
        if (([v5 containsObject:v11] & 1) == 0)
        {
          [a1[4] setObject:v6 forKey:v11];
          [a1[5] addObject:v11];
        }

        uint64_t v10 = (v10 + 1);
      }
      while (v10 < [v6 fixedArraySize]);
    }
  }
}

void __46__PPSSQLStorage_handleSchemaMismatchForTable___block_invoke_167(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v12 = [v3 objectForKeyedSubscript:v4];
  id v5 = NSString;
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned int v7 = (void *)PLVTypeToPLSQLiteType_0;
  unint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "datatype"));
  unsigned int v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v5 stringWithFormat:@"ALTER TABLE '%@' ADD COLUMN '%@' %@;", v6, v4, v9];

  id v11 = (id)[*(id *)(a1 + 48) performQuery:v10];
}

- (void)setupTableForEntryKey:(id)a3
{
}

- (void)setupTableForEntryKey:(id)a3 withName:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  v45 = [(PPSSQLStorage *)self connectionForKey:v6];
  uint64_t v7 = +[PPSEntryKey baseMetricsForEntryKey:v6];
  id v47 = v6;
  uint64_t v8 = +[PPSEntryKey arrayMetricsForEntryKey:v6];
  unsigned int v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v52 = (void *)v7;
  [v9 addEntriesFromDictionary:v7];
  uint64_t v44 = (void *)v8;
  [v9 addEntriesFromDictionary:v8];
  uint64_t v50 = v9;
  uint64_t v10 = [v9 allKeys];
  id v11 = [v10 sortedArrayUsingSelector:sel_compare_];

  id v12 = objc_opt_new();
  [v12 addObject:&unk_1F1586F08];
  uint64_t v55 = v12;
  [v12 addObject:&unk_1F1586F30];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = v11;
  uint64_t v51 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v51)
  {
    unint64_t v13 = @"column-name";
    uint64_t v49 = *(void *)v58;
    int v14 = @"%@_%d";
    unint64_t v15 = 0x1E4F29000uLL;
    unint64_t v16 = @"type";
    uint64_t v17 = &containerPath_containerPath;
    unint64_t v18 = 0x1E4F28000uLL;
    unint64_t v19 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v58 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v53 = v20;
        uint64_t v21 = *(void *)(*((void *)&v57 + 1) + 8 * v20);
        uint64_t v22 = objc_msgSend(v50, "objectForKeyedSubscript:");
        if ([v22 auxiliaryType] == 3 && objc_msgSend(v22, "fixedArraySize"))
        {
          if ([v22 fixedArraySize])
          {
            uint64_t v23 = v21;
            uint64_t v24 = 0;
            long long v56 = v22;
            uint64_t v54 = v23;
            do
            {
              v63[0] = v13;
              uint64_t v25 = objc_msgSend(*(id *)(v15 + 24), "stringWithFormat:", v14, v23, v24);
              v63[1] = v16;
              v64[0] = v25;
              uint64_t v26 = (void *)v17[225];
              uint64_t v27 = v14;
              uint64_t v28 = objc_msgSend(*(id *)(v18 + 3792), "numberWithInt:", objc_msgSend(v56, "datatype"));
              double v29 = [v26 objectForKeyedSubscript:v28];
              v64[1] = v29;
              [*(id *)(v19 + 2536) dictionaryWithObjects:v64 forKeys:v63 count:2];
              unint64_t v30 = v18;
              unint64_t v31 = v17;
              uint64_t v32 = v16;
              v34 = uint64_t v33 = v13;
              [v55 addObject:v34];

              unint64_t v13 = v33;
              unint64_t v16 = v32;
              uint64_t v17 = v31;
              unint64_t v18 = v30;
              unint64_t v19 = 0x1E4F1C000;

              int v14 = v27;
              unint64_t v15 = 0x1E4F29000;

              uint64_t v22 = v56;
              uint64_t v24 = (v24 + 1);
              unsigned int v35 = [v56 fixedArraySize];
              uint64_t v23 = v54;
            }
            while (v24 < v35);
          }
        }
        else if (v52)
        {
          id v36 = [v52 objectForKeyedSubscript:v21];

          if (v36)
          {
            v61[1] = v16;
            v62[0] = v21;
            v61[0] = v13;
            id v37 = (void *)v17[225];
            id v38 = objc_msgSend(*(id *)(v18 + 3792), "numberWithInt:", objc_msgSend(v22, "datatype"));
            id v39 = [v37 objectForKeyedSubscript:v38];
            v62[1] = v39;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
            v41 = uint64_t v40 = v22;
            [v55 addObject:v41];

            uint64_t v22 = v40;
            unint64_t v19 = 0x1E4F1C000;
          }
        }

        uint64_t v20 = v53 + 1;
      }
      while (v53 + 1 != v51);
      uint64_t v51 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v51);
  }

  uint64_t v42 = sqlLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
    -[PPSSQLStorage setupTableForEntryKey:withName:]();
  }

  uint64_t v43 = sqlLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[PPSSQLStorage setupTableForEntryKey:withName:]();
  }

  [v45 createTableName:v46 withColumns:v55];
}

- (void)setupDynamicTableForEntryKey:(id)a3 withName:(id)a4 withConnection:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v23 = a4;
  id v22 = a5;
  uint64_t v8 = +[PPSEntryKey dynamicMetricsForEntryKey:v7];
  unsigned int v9 = objc_opt_new();
  [v9 addObject:&unk_1F1586F58];
  [v9 addObject:&unk_1F1586F80];
  uint64_t v24 = v7;
  +[PPSEntryKey allDynamicKeysForEntryKey:v7];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        unint64_t v15 = [v8 objectForKeyedSubscript:v14];
        v30[0] = @"column-name";
        v30[1] = @"type";
        v31[0] = v14;
        unint64_t v16 = (void *)PLVTypeToPLSQLiteType_0;
        uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "datatype"));
        unint64_t v18 = [v16 objectForKeyedSubscript:v17];
        v31[1] = v18;
        unint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
        [v9 addObject:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v11);
  }
  uint64_t v20 = sqlLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[PPSSQLStorage setupTableForEntryKey:withName:]();
  }

  uint64_t v21 = sqlLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    -[PPSSQLStorage setupTableForEntryKey:withName:]();
  }

  [v22 createTableName:v23 withColumns:v9];
  [v22 createCompositeIndexOnTable:v23 forColumns:&unk_1F1585B38];
}

- (void)setupArrayTableForEntryKey:(id)a3 withName:(id)a4 withConnection:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[PPSEntryKey arrayMetricsForEntryKey:v7];
  long long v29 = v7;
  uint64_t v11 = +[PPSEntryKey allArrayKeysForEntryKey:v7];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0x1E4F29000uLL;
    uint64_t v33 = *(void *)v35;
    unint64_t v30 = v10;
    id v31 = v8;
    do
    {
      uint64_t v15 = 0;
      uint64_t v32 = v13;
      do
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * v15);
        uint64_t v17 = [v10 objectForKeyedSubscript:v16];
        if (![v17 fixedArraySize])
        {
          unint64_t v18 = objc_opt_new();
          unint64_t v19 = [*(id *)(v14 + 24) stringWithFormat:@"%@_Array_%@", v8, v16];
          if (([v9 tableExistsForTableName:v19] & 1) == 0)
          {
            [v18 addObject:&unk_1F1586FA8];
            [v18 addObject:&unk_1F1586FD0];
            v39[0] = @"column-name";
            uint64_t v20 = [v17 name];
            v39[1] = @"type";
            v40[0] = v20;
            uint64_t v21 = v11;
            id v22 = v9;
            id v23 = (void *)PLVTypeToPLSQLiteType_0;
            uint64_t v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v17, "datatype"));
            uint64_t v25 = [v23 objectForKeyedSubscript:v24];
            v40[1] = v25;
            long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
            [v18 addObject:v26];

            id v9 = v22;
            uint64_t v11 = v21;

            unint64_t v14 = 0x1E4F29000;
            [v9 createTableName:v19 withColumns:v18];
            v38[0] = @"FK_ID";
            long long v27 = [v17 name];
            v38[1] = v27;
            long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
            [v9 createCompositeIndexOnTable:v19 forColumns:v28];

            uint64_t v10 = v30;
            id v8 = v31;
          }

          uint64_t v13 = v32;
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v13);
  }
}

- (BOOL)updateTable:(id)a3 transferDataForKeys:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [@"PPSTmp_" stringByAppendingString:v6];
  if ([v6 containsString:@"_Dynamic"])
  {
    id v9 = (void *)[v6 mutableCopy];
    uint64_t v10 = [v9 length] - 8;
LABEL_5:
    id v11 = [v9 substringToIndex:v10];

    goto LABEL_7;
  }
  if ([v6 containsString:@"_Array"])
  {
    id v9 = (void *)[v6 mutableCopy];
    uint64_t v10 = [v9 rangeOfString:@"_Array_"];
    goto LABEL_5;
  }
  id v11 = v6;
LABEL_7:
  uint64_t v12 = [(PPSSQLStorage *)self connectionForKey:v11];
  [v12 beginTransaction];
  [v7 addObject:@"ID"];
  if ([v6 containsString:@"_Dynamic"])
  {
    [v7 addObject:@"FK_ID"];
    [(PPSSQLStorage *)self setupDynamicTableForEntryKey:v11 withName:v8 withConnection:v12];
  }
  else if ([v6 containsString:@"_Array"])
  {
    [v7 addObject:@"FK_ID"];
    uint64_t v13 = [@"PPSTmp_" stringByAppendingString:v11];
    [(PPSSQLStorage *)self setupArrayTableForEntryKey:v11 withName:v13 withConnection:v12];
  }
  else
  {
    [v7 addObject:@"timestamp"];
    [(PPSSQLStorage *)self setupTableForEntryKey:v11 withName:v8];
  }
  unint64_t v14 = [MEMORY[0x1E4F28E78] string];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __49__PPSSQLStorage_updateTable_transferDataForKeys___block_invoke;
  v24[3] = &unk_1E6254A60;
  id v15 = v14;
  id v25 = v15;
  [v7 enumerateObjectsUsingBlock:v24];
  uint64_t v16 = objc_msgSend(v15, "substringToIndex:", objc_msgSend(v15, "length") - 2);
  uint64_t v17 = [NSString stringWithFormat:@"INSERT INTO %@ (%@) SELECT %@ FROM %@", v8, v16, v16, v6];
  unint64_t v18 = sqlLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[PPSSQLStorage updateTable:transferDataForKeys:]();
  }

  id v19 = (id)[v12 performQuery:v17];
  [v12 dropTable:v6];
  uint64_t v20 = [NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@", v8, v6];
  uint64_t v21 = sqlLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v27 = v20;
    _os_log_impl(&dword_1BBD2F000, v21, OS_LOG_TYPE_DEFAULT, "UpdateTable alter query %@", buf, 0xCu);
  }

  id v22 = (id)[v12 performQuery:v20];
  [v12 endTransaction];

  return 1;
}

uint64_t __49__PPSSQLStorage_updateTable_transferDataForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"\"%@\"", a2];
  [v3 appendString:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 appendString:@", "];
}

- (id)PLSQLConnection
{
  uint64_t v2 = [(PPSSQLStorage *)self connectionByStorage];
  id v3 = [v2 objectForKeyedSubscript:&unk_1F1580978];

  return v3;
}

- (id)EPSQLConnection
{
  uint64_t v2 = [(PPSSQLStorage *)self connectionByStorage];
  id v3 = [v2 objectForKeyedSubscript:&unk_1F1580960];

  return v3;
}

- (id)PreUnlockEPSQLConnection
{
  uint64_t v2 = [(PPSSQLStorage *)self connectionByStorage];
  id v3 = [v2 objectForKeyedSubscript:&unk_1F1580960];

  return v3;
}

- (id)CESQLConnection
{
  uint64_t v2 = [(PPSSQLStorage *)self connectionByStorage];
  id v3 = [v2 objectForKeyedSubscript:&unk_1F1580990];

  return v3;
}

- (id)XCSQLConnection
{
  uint64_t v2 = [(PPSSQLStorage *)self connectionByStorage];
  id v3 = [v2 objectForKeyedSubscript:&unk_1F15809A8];

  return v3;
}

- (id)BGSQLConnection
{
  uint64_t v2 = [(PPSSQLStorage *)self connectionByStorage];
  id v3 = [v2 objectForKeyedSubscript:&unk_1F15809C0];

  return v3;
}

- (int)storageForConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSSQLStorage *)self PLSQLConnection];

  if (v5 == v4)
  {
    int v11 = 2;
  }
  else
  {
    id v6 = [(PPSSQLStorage *)self EPSQLConnection];

    if (v6 == v4
      || ([(PPSSQLStorage *)self PreUnlockEPSQLConnection],
          id v7 = (id)objc_claimAutoreleasedReturnValue(),
          v7,
          v7 == v4))
    {
      int v11 = 1;
    }
    else
    {
      id v8 = [(PPSSQLStorage *)self CESQLConnection];

      if (v8 == v4)
      {
        int v11 = 3;
      }
      else
      {
        id v9 = [(PPSSQLStorage *)self XCSQLConnection];

        if (v9 == v4)
        {
          int v11 = 4;
        }
        else
        {
          id v10 = [(PPSSQLStorage *)self BGSQLConnection];

          if (v10 == v4) {
            int v11 = 5;
          }
          else {
            int v11 = 0;
          }
        }
      }
    }
  }

  return v11;
}

- (void)closeAllConnections
{
  id v3 = [(PPSSQLStorage *)self PLSQLConnection];
  [v3 closeConnection];

  id v4 = [(PPSSQLStorage *)self EPSQLConnection];
  [v4 closeConnection];

  id v5 = [(PPSSQLStorage *)self CESQLConnection];
  [v5 closeConnection];

  id v6 = [(PPSSQLStorage *)self XCSQLConnection];
  [v6 closeConnection];

  id v7 = [(PPSSQLStorage *)self BGSQLConnection];
  [v7 closeConnection];
}

- (void)setupFolders
{
  void v35[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA48];
  id v3 = [MEMORY[0x1E4F89D10] containerPath];
  id v4 = [v3 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  v35[0] = v4;
  id v5 = [MEMORY[0x1E4F89D10] containerPath];
  id v6 = [v5 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  id v7 = [v6 stringByAppendingString:@"ExtendedPersistence/"];
  v35[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  id v9 = [v2 arrayWithArray:v8];

  if (+[PLUtilities shouldLogPreUnlockTelemetry])
  {
    id v10 = [MEMORY[0x1E4F89D10] containerPath];
    int v11 = [v10 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
    uint64_t v12 = [v11 stringByAppendingString:@"PreUnlock/"];
    [v9 addObject:v12];
  }
  uint64_t v13 = [MEMORY[0x1E4F89D10] containerPath];
  unint64_t v14 = [v13 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  id v15 = [v14 stringByAppendingString:@"CleanEnergy/"];
  [v9 addObject:v15];

  if (_os_feature_enabled_impl())
  {
    uint64_t v16 = [MEMORY[0x1E4F89D10] containerPath];
    uint64_t v17 = [v16 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
    unint64_t v18 = [v17 stringByAppendingString:@"BackgroundProcessing/"];
    [v9 addObject:v18];
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        +[PLUtilities createAndChownDirectory:](PLUtilities, "createAndChownDirectory:", *(void *)(*((void *)&v28 + 1) + 8 * v23++), (void)v28);
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v21);
  }

  uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v32 = *MEMORY[0x1E4F28370];
  uint64_t v33 = *MEMORY[0x1E4F28378];
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  long long v26 = [MEMORY[0x1E4F89D10] containerPath];
  long long v27 = [v26 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  [v24 setAttributes:v25 ofItemAtPath:v27 error:0];
}

- (void)setupDBConnections
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Invalid connection to Clean Energy DB", v2, v3, v4, v5, v6);
}

- (id)setupDBConnectionAtPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F89D10] containerPath];
  uint64_t v5 = [v4 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
  uint8_t v6 = [v5 stringByAppendingString:@"PreUnlock/"];
  id v7 = [v6 stringByAppendingString:@"PreUnlockLog.EPSQL"];
  int v8 = [v3 isEqualToString:v7];

  id v9 = [PLSQLiteConnection alloc];
  if (v8) {
    uint64_t v10 = [(PLSQLiteConnection *)v9 initWithFilePath:v3 withFlags:&unk_1F1585B50];
  }
  else {
    uint64_t v10 = [(PLSQLiteConnection *)v9 initWithFilePath:v3];
  }
  int v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v12 = sqlLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[PPSSQLStorage setupDBConnectionAtPath:]();
    }

    +[PLUtilities exitWithReason:101];
  }

  return v11;
}

+ (id)trimConditionsForPLSQLWithTrimDate:(id)a3
{
  return (id)[a1 trimConditionsForStorage:2 trimDate:a3];
}

+ (id)trimConditionsForEPSQLWithTrimDate:(id)a3
{
  return (id)[a1 trimConditionsForStorage:1 trimDate:a3];
}

+ (id)trimConditionsForCESQLWithTrimDate:(id)a3
{
  return (id)[a1 trimConditionsForStorage:3 trimDate:a3];
}

+ (id)trimConditionsForXCSQLWithTrimDate:(id)a3
{
  return (id)[a1 trimConditionsForStorage:4 trimDate:a3];
}

+ (id)trimConditionsForBGSQLWithTrimDate:(id)a3
{
  return (id)[a1 trimConditionsForStorage:5 trimDate:a3];
}

+ (id)trimConditionsForStorage:(int)a3 trimDate:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  id v7 = [v5 monotonicDate];
  [v7 timeIntervalSince1970];
  uint64_t v9 = v8;

  [v6 timeIntervalSince1970];
  uint64_t v11 = v10;

  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = +[PPSEntryKey allEntryKeysForStorage:v4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__PPSSQLStorage_trimConditionsForStorage_trimDate___block_invoke;
  v17[3] = &unk_1E6254A88;
  uint64_t v19 = v11;
  uint64_t v20 = v9;
  id v14 = v12;
  id v18 = v14;
  [v13 enumerateObjectsUsingBlock:v17];
  id v15 = sqlLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[PPSSQLStorage trimConditionsForStorage:trimDate:]((uint64_t)v14, v4, v15);
  }

  return v14;
}

void __51__PPSSQLStorage_trimConditionsForStorage_trimDate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = +[PPSSQLStorage trimConditionsForEntryKey:trimDate:currDate:](PPSSQLStorage, "trimConditionsForEntryKey:trimDate:currDate:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

+ (id)trimConditionsForEntryKey:(id)a3 trimDate:(double)a4 currDate:(double)a5
{
  id v7 = a3;
  uint64_t v8 = +[PPSEntryKey timeToLiveForEntryKey:v7];
  if (+[PPSEntryKey directionalityForEntryKey:v7] == 3)
  {
    [NSString stringWithFormat:@"%@ is NULL OR %@<(SELECT max(%@) FROM '%@' WHERE %@<%f)", @"timestamp", @"timestamp", @"timestamp", v7, @"timestamp", *(void *)&a4];
  }
  else
  {
    double v9 = a5 + (double)v8 * -86400.0;
    if (v9 > a4) {
      double v9 = a4;
    }
    [NSString stringWithFormat:@"(%@ is NULL OR %@<%f)", @"timestamp", @"timestamp", *(void *)&v9, v12, v13, v14];
  uint64_t v10 = };

  return v10;
}

- (BOOL)storageStarted
{
  return self->_storageStarted;
}

- (void)setStorageStarted:(BOOL)a3
{
  self->_storageStarted = a3;
}

- (void)setConnectionByStorage:(id)a3
{
}

- (NSMutableSet)entryKeysToSetup
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEntryKeysToSetup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryKeysToSetup, 0);
  objc_storeStrong((id *)&self->_connectionByStorage, 0);
}

- (void)updateMetadata:(_DWORD *)a3 updateMetrics:(void *)a4 addMetrics:.cold.1(void *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  id v6 = objc_begin_catch(a1);
  id v7 = sqlLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *a3 = 138412290;
    *a4 = v6;
    OUTLINED_FUNCTION_3_1(&dword_1BBD2F000, v8, v9, "Exception occurred while adding metadata, %@");
  }

  objc_end_catch();
}

- (void)updateMetadata:(_DWORD *)a3 updateMetrics:(void *)a4 addMetrics:.cold.2(void *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  id v6 = objc_begin_catch(a1);
  id v7 = sqlLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *a3 = 138412290;
    *a4 = v6;
    OUTLINED_FUNCTION_3_1(&dword_1BBD2F000, v8, v9, "Exception occurred while updating metadata, %@");
  }

  objc_end_catch();
}

- (void)setupTableForEntryKey:withName:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "tableSchemaColumns: %@", v2, v3, v4, v5, v6);
}

- (void)setupTableForEntryKey:withName:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "tableName: %@", v2, v3, v4, v5, v6);
}

- (void)updateTable:transferDataForKeys:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "UpdateTable insert query %@", v2, v3, v4, v5, v6);
}

- (void)setupDBConnectionAtPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "no connection to DB: %@", v1, 0xCu);
}

+ (void)trimConditionsForStorage:(os_log_t)log trimDate:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Storage: %d, trimFilters: %@", (uint8_t *)v3, 0x12u);
}

@end