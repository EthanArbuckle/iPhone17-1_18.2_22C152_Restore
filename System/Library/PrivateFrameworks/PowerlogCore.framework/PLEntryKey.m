@interface PLEntryKey
+ (BOOL)isEntryKeySetup:(id)a3 forOperatorName:(id)a4;
+ (BOOL)shouldConfigureAdditionalTable:(id)a3 withType:(id)a4 withName:(id)a5;
+ (BOOL)shouldConfigureTable:(id)a3 withType:(id)a4 withName:(id)a5 withConfigs:(id)a6;
+ (Class)operatorClassForEntryKey:(id)a3;
+ (_PLTimeIntervalRange)timeIntervalRangeForEntryKey:(id)a3;
+ (id)PLEntryAggregateKeysForOperator:(id)a3;
+ (id)PLEntryAggregateKeysForOperatorClass:(Class)a3;
+ (id)PLEntryAggregateKeysForOperatorName:(id)a3;
+ (id)PLEntryKeyForEntryKey:(id)a3;
+ (id)PLEntryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5;
+ (id)PLEntryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6 isDynamic:(BOOL)a7;
+ (id)PLEntryKeyStringsForTasking;
+ (id)PLEntryKeysForEntryType:(id)a3;
+ (id)baseEntryKeyForEntryKey:(id)a3;
+ (id)dynamicEntryKeyForEntryKey:(id)a3;
+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5;
+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 isDynamic:(BOOL)a6;
+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6;
+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6 isDynamic:(BOOL)a7;
+ (id)entryKeyStringForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5;
+ (id)entryKeysForOperator:(id)a3;
+ (id)entryKeysForOperatorClass:(Class)a3;
+ (id)entryKeysForOperatorName:(id)a3;
+ (id)entryKeysForOperatorNameCopy:(id)a3;
+ (id)operatorNameForEntryKey:(id)a3;
+ (id)timeintervalRangeEntryKeyForEntryKey:(id)a3 withTimeIntervalRange:(_PLTimeIntervalRange)a4;
+ (id)wildCardForEntryKey:(id)a3;
+ (void)PLEntryKeyStringsForTaskingReset;
+ (void)addPLEntryKey:(id)a3;
+ (void)addPLEntryKeyStringToTasking:(id)a3;
+ (void)setupEntryObjectsForOperatorClass:(Class)a3;
- (BOOL)isDynamic;
- (Class)operatorClass;
- (NSString)entryKey;
- (NSString)entryName;
- (NSString)entryType;
- (NSString)operatorName;
- (NSString)wildCardName;
- (PLEntryKey)baseEntryKey;
- (PLEntryKey)initWithOperatorName:(id)a3 withEntryType:(id)a4 withEntryName:(id)a5;
- (_PLTimeIntervalRange)timeIntervalRange;
- (id)copyWithIsDynamic:(BOOL)a3;
- (id)copyWithTimeIntervalRange:(_PLTimeIntervalRange)a3;
- (id)copyWithWildCardName:(id)a3;
- (id)debugDescription;
- (void)setBaseEntryKey:(id)a3;
- (void)setIsDynamic:(BOOL)a3;
- (void)setTimeIntervalRange:(_PLTimeIntervalRange)a3;
- (void)setWildCardName:(id)a3;
@end

@implementation PLEntryKey

+ (Class)operatorClassForEntryKey:(id)a3
{
  v3 = [a1 PLEntryKeyForEntryKey:a3];
  v4 = [v3 operatorClass];

  return (Class)v4;
}

+ (id)PLEntryKeyForEntryKey:(id)a3
{
  id v4 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  v5 = [(id)_PLEntryKeys objectForKeyedSubscript:v4];
  objc_sync_exit(@"++entryKeyObjectsSync++");
  if (v5)
  {
    id v6 = v5;
LABEL_16:
    v18 = v6;
    v20 = v6;
    goto LABEL_17;
  }
  v7 = [NSString stringWithFormat:@"_%@", @"Dynamic"];
  uint64_t v8 = [v4 rangeOfString:v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [v4 stringByReplacingOccurrencesOfString:v7 withString:&stru_1F15208F0];

    id v4 = (id)v9;
  }
  if ([v4 rangeOfString:@"+"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v11 = [v4 componentsSeparatedByString:@"+"];
    uint64_t v12 = [v11 objectAtIndexedSubscript:0];

    v10 = [v11 objectAtIndexedSubscript:1];

    id v4 = (id)v12;
  }
  v13 = [v4 componentsSeparatedByString:@"_"];
  v14 = (void *)[v13 mutableCopy];

  unint64_t v15 = [v14 count];
  if (v15 < 3)
  {
    v18 = 0;
  }
  else
  {
    v16 = [v14 objectAtIndexedSubscript:0];
    [v14 removeObjectAtIndex:0];
    v17 = [v14 objectAtIndexedSubscript:0];
    [v14 removeObjectAtIndex:0];
    if ((unint64_t)[v14 count] < 2) {
      [v14 objectAtIndexedSubscript:0];
    }
    else {
    v19 = [v14 componentsJoinedByString:@"_"];
    }
    v18 = [a1 PLEntryKeyForOperatorName:v16 withType:v17 withName:v19 withWildCardName:v10 isDynamic:v8 != 0x7FFFFFFFFFFFFFFFLL];
  }
  if (v15 >= 3)
  {
    id v6 = v18;
    goto LABEL_16;
  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (Class)operatorClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (NSString)entryType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)entryName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6 isDynamic:(BOOL)a7
{
  v7 = [a1 PLEntryKeyForOperatorName:a3 withType:a4 withName:a5 withWildCardName:a6 isDynamic:a7];
  uint64_t v8 = [v7 description];

  return v8;
}

+ (id)PLEntryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6 isDynamic:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  v16 = [(id)_PLEntryKeyForOperatorForEntryTypeForEntryName objectForKeyedSubscript:v12];
  v17 = [v16 objectForKeyedSubscript:v13];
  v18 = [v17 objectForKeyedSubscript:v14];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  if (v18)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [[PLEntryKey alloc] initWithOperatorName:v12 withEntryType:v13 withEntryName:v14];
    if (+[PLDefaults debugEnabled])
    {
      id v37 = v15;
      id v38 = a1;
      v23 = [NSString stringWithFormat:@"unknown entryKey %@", v18];
      v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLEntryKey.m"];
      v25 = [v24 lastPathComponent];
      v26 = [NSString stringWithUTF8String:"+[PLEntryKey PLEntryKeyForOperatorName:withType:withName:withWildCardName:isDynamic:]"];
      +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:295];

      v27 = PLLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        [(PLSubmissionFileSP *)(uint64_t)v23 copyAndPrepareLog];
      }

      id v15 = v37;
      a1 = v38;
    }
    [a1 addPLEntryKey:v18];
    if (v7)
    {
LABEL_3:
      objc_sync_enter(@"++entryKeyObjectsSync++");
      v19 = (void *)_PLEntryKeysDynamic;
      v20 = [(PLEntryKey *)v18 entryKey];
      uint64_t v21 = [v19 objectForKeyedSubscript:v20];

      objc_sync_exit(@"++entryKeyObjectsSync++");
      if (!v21)
      {
        uint64_t v22 = [(PLEntryKey *)v18 copyWithIsDynamic:1];
LABEL_15:
        uint64_t v21 = v22;
        [a1 addPLEntryKey:v22];
        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  if (!v15) {
    goto LABEL_17;
  }
  objc_sync_enter(@"++entryKeyObjectsSync++");
  v28 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
  v29 = [(PLEntryKey *)v18 entryKey];
  v30 = [v28 objectForKeyedSubscript:v29];
  uint64_t v21 = [v30 objectForKeyedSubscript:v15];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  if (!v21)
  {
    if ([v13 isEqualToString:@"Aggregate"])
    {
      v31 = [v15 componentsSeparatedByString:@"_"];
      [v31 count];
      id v32 = [v31 objectAtIndex:0];
      double v33 = atof((const char *)[v32 UTF8String]);

      id v34 = [v31 objectAtIndex:1];
      double v35 = atof((const char *)[v34 UTF8String]);

      uint64_t v22 = -[PLEntryKey copyWithTimeIntervalRange:](v18, "copyWithTimeIntervalRange:", v33, v35);
    }
    else
    {
      uint64_t v22 = [(PLEntryKey *)v18 copyWithWildCardName:v15];
    }
    goto LABEL_15;
  }
LABEL_16:

  v18 = (PLEntryKey *)v21;
LABEL_17:

  return v18;
}

- (NSString)entryKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 isDynamic:(BOOL)a6
{
  return (id)[a1 entryKeyForOperatorName:a3 withType:a4 withName:a5 withWildCardName:0 isDynamic:a6];
}

+ (BOOL)isEntryKeySetup:(id)a3 forOperatorName:(id)a4
{
  id v5 = a3;
  id v6 = +[PLEntryKey entryKeysForOperatorNameCopy:a4];
  char v7 = [v6 containsObject:v5];

  return v7;
}

+ (id)entryKeysForOperatorNameCopy:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  id v4 = [(id)_entryKeysForOperator objectForKeyedSubscript:v3];
  id v5 = (void *)[v4 copy];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v5;
}

+ (void)addPLEntryKey:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  if ([v3 isDynamic])
  {
    id v4 = (void *)_PLEntryKeysDynamic;
    id v5 = [v3 baseEntryKey];
    id v6 = [v5 entryKey];
    [v4 setObject:v3 forKeyedSubscript:v6];
  }
  else
  {
    char v7 = [v3 wildCardName];

    if (v7)
    {
      [v3 timeIntervalRange];
      if (v8 != -1.0)
      {
        [v3 timeIntervalRange];
        if (v9 != -1.0)
        {
          v10 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
          v11 = [v3 baseEntryKey];
          id v12 = [v11 entryKey];
          id v13 = [v10 objectForKeyedSubscript:v12];

          if (!v13)
          {
            id v14 = objc_opt_new();
            id v15 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
            v16 = [v3 baseEntryKey];
            v17 = [v16 entryKey];
            [v15 setObject:v14 forKeyedSubscript:v17];
          }
          [v3 timeIntervalRange];
          uint64_t v19 = v18;
          uint64_t v21 = v20;
          uint64_t v22 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
          v23 = [v3 baseEntryKey];
          v24 = [v23 entryKey];
          v25 = [v22 objectForKeyedSubscript:v24];
          v86[0] = v19;
          v86[1] = v21;
          v26 = [MEMORY[0x1E4F29238] value:v86 withObjCType:"{_PLTimeIntervalRange=dd}"];
          [v25 setObject:v3 forKeyedSubscript:v26];
        }
      }
      v27 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
      v28 = [v3 baseEntryKey];
      v29 = [v28 entryKey];
      v30 = [v27 objectForKeyedSubscript:v29];

      if (!v30)
      {
        v31 = objc_opt_new();
        id v32 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
        double v33 = [v3 baseEntryKey];
        id v34 = [v33 entryKey];
        [v32 setObject:v31 forKeyedSubscript:v34];
      }
      double v35 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
      id v5 = [v3 baseEntryKey];
      v36 = [v5 entryKey];
      id v37 = [v35 objectForKeyedSubscript:v36];
      id v38 = [v3 wildCardName];
      [v37 setObject:v3 forKeyedSubscript:v38];
    }
    else
    {
      v39 = (void *)_PLEntryKeysForOperator;
      v40 = [v3 operatorName];
      v41 = [v39 objectForKeyedSubscript:v40];

      if (!v41)
      {
        v42 = objc_opt_new();
        v43 = (void *)_PLEntryKeysForOperator;
        v44 = [v3 operatorName];
        [v43 setObject:v42 forKeyedSubscript:v44];

        v45 = objc_opt_new();
        v46 = (void *)_entryKeysForOperator;
        v47 = [v3 operatorName];
        [v46 setObject:v45 forKeyedSubscript:v47];
      }
      v48 = (void *)_PLEntryKeysForOperator;
      v49 = [v3 operatorName];
      v50 = [v48 objectForKeyedSubscript:v49];
      [v50 addObject:v3];

      v51 = (void *)_entryKeysForOperator;
      v52 = [v3 operatorName];
      v53 = [v51 objectForKeyedSubscript:v52];
      v54 = [v3 entryKey];
      [v53 addObject:v54];

      v55 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
      v56 = [v3 operatorName];
      v57 = [v55 objectForKeyedSubscript:v56];

      if (!v57)
      {
        v58 = objc_opt_new();
        v59 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
        v60 = [v3 operatorName];
        [v59 setObject:v58 forKeyedSubscript:v60];
      }
      v61 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
      v62 = [v3 operatorName];
      v63 = [v61 objectForKeyedSubscript:v62];
      v64 = [v3 entryType];
      v65 = [v63 objectForKeyedSubscript:v64];

      if (!v65)
      {
        v66 = objc_opt_new();
        v67 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
        v68 = [v3 operatorName];
        v69 = [v67 objectForKeyedSubscript:v68];
        v70 = [v3 entryType];
        [v69 setObject:v66 forKeyedSubscript:v70];
      }
      v71 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
      v72 = [v3 operatorName];
      v73 = [v71 objectForKeyedSubscript:v72];
      v74 = [v3 entryType];
      v75 = [v73 objectForKeyedSubscript:v74];
      v76 = [v3 entryName];
      [v75 setObject:v3 forKeyedSubscript:v76];

      v77 = (void *)_PLEntryKeysForEntryType;
      v78 = [v3 entryType];
      v79 = [v77 objectForKeyedSubscript:v78];

      if (!v79)
      {
        v80 = objc_opt_new();
        v81 = (void *)_PLEntryKeysForEntryType;
        v82 = [v3 entryType];
        [v81 setObject:v80 forKeyedSubscript:v82];
      }
      v83 = (void *)_PLEntryKeysForEntryType;
      id v5 = [v3 entryType];
      v36 = [v83 objectForKeyedSubscript:v5];
      [v36 addObject:v3];
    }
  }
  v84 = (void *)_PLEntryKeys;
  v85 = [v3 entryKey];
  [v84 setObject:v3 forKeyedSubscript:v85];

  objc_sync_exit(@"++entryKeyObjectsSync++");
}

+ (void)addPLEntryKeyStringToTasking:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  [(id)_PLEntryKeyStringsForTasking addObject:v3];
  objc_sync_exit(@"++entryKeyObjectsSync++");
}

+ (BOOL)shouldConfigureAdditionalTable:(id)a3 withType:(id)a4 withName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[PLCoreStorage additionalTables];

  if (v11
    && (+[PLCoreStorage additionalTables],
        id v12 = objc_claimAutoreleasedReturnValue(),
        [v12 objectForKey:v8],
        id v13 = objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    id v14 = +[PLEntryKey entryKeyStringForOperatorName:v8 withType:v9 withName:v10];
    id v15 = +[PLCoreStorage additionalTables];
    v16 = [v15 objectForKeyedSubscript:v8];
    uint64_t v17 = [v16 count];

    if (!v17) {
      goto LABEL_7;
    }
    uint64_t v18 = +[PLCoreStorage additionalTables];
    uint64_t v19 = [v18 objectForKeyedSubscript:v8];
    uint64_t v20 = [v19 objectForKey:v9];

    if (!v20) {
      goto LABEL_9;
    }
    uint64_t v21 = +[PLCoreStorage additionalTables];
    uint64_t v22 = [v21 objectForKeyedSubscript:v8];
    v23 = [v22 objectForKeyedSubscript:v9];
    uint64_t v24 = [v23 count];

    if (!v24) {
      goto LABEL_7;
    }
    v25 = +[PLCoreStorage additionalTables];
    v26 = [v25 objectForKeyedSubscript:v8];
    v27 = [v26 objectForKeyedSubscript:v9];
    int v28 = [v27 containsObject:v10];

    if (!v28)
    {
LABEL_9:
      BOOL v29 = 0;
    }
    else
    {
LABEL_7:
      [a1 addPLEntryKeyStringToTasking:v14];
      BOOL v29 = 1;
    }
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

+ (BOOL)shouldConfigureTable:(id)a3 withType:(id)a4 withName:(id)a5 withConfigs:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!+[PLDefaults fullMode]
    && ([v13 objectForKey:@"TaskModeTable"],
        id v14 = objc_claimAutoreleasedReturnValue(),
        v14,
        v14)
    && ([v13 objectForKeyedSubscript:@"TaskModeTable"],
        id v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 BOOLValue],
        v15,
        v16))
  {
    if (+[PLDefaults liteMode]) {
      char v17 = 0;
    }
    else {
      char v17 = [a1 shouldConfigureAdditionalTable:v10 withType:v11 withName:v12];
    }
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

+ (void)setupEntryObjectsForOperatorClass:(Class)a3
{
  id v5 = +[PLEntryDefinition entryDefinitionsForOperatorClass:](PLEntryDefinition, "entryDefinitionsForOperatorClass:");
  if (setupEntryObjectsForOperatorClass__onceToken != -1) {
    dispatch_once(&setupEntryObjectsForOperatorClass__onceToken, &__block_literal_global_26);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__11;
  v12[4] = __Block_byref_object_dispose__11;
  id v13 = 0;
  id v6 = [(objc_class *)a3 className];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PLEntryKey_setupEntryObjectsForOperatorClass___block_invoke_16;
  v8[3] = &unk_1E6254DA0;
  id v10 = v12;
  id v11 = a1;
  id v7 = v6;
  id v9 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  _Block_object_dispose(v12, 8);
}

uint64_t __48__PLEntryKey_setupEntryObjectsForOperatorClass___block_invoke()
{
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_PLEntryKeysForOperator;
  _PLEntryKeysForOperator = v0;

  uint64_t v2 = objc_opt_new();
  id v3 = (void *)_entryKeysForOperator;
  _entryKeysForOperator = v2;

  uint64_t v4 = objc_opt_new();
  id v5 = (void *)_PLEntryKeyForOperatorForEntryTypeForEntryName;
  _PLEntryKeyForOperatorForEntryTypeForEntryName = v4;

  uint64_t v6 = objc_opt_new();
  id v7 = (void *)_PLEntryKeysForEntryType;
  _PLEntryKeysForEntryType = v6;

  uint64_t v8 = objc_opt_new();
  id v9 = (void *)_PLEntryKeys;
  _PLEntryKeys = v8;

  uint64_t v10 = objc_opt_new();
  id v11 = (void *)_PLEntryKeyForEntryKeyForWildCardName;
  _PLEntryKeyForEntryKeyForWildCardName = v10;

  uint64_t v12 = objc_opt_new();
  id v13 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
  _PLEntryKeyForEntryKeyForPLTimeInterval = v12;

  uint64_t v14 = objc_opt_new();
  id v15 = (void *)_PLEntryKeysDynamic;
  _PLEntryKeysDynamic = v14;

  uint64_t v16 = objc_opt_new();
  char v17 = (void *)_PLEntryKeyStringsForTasking;
  _PLEntryKeyStringsForTasking = v16;

  return objc_sync_exit(@"++entryKeyObjectsSync++");
}

void __48__PLEntryKey_setupEntryObjectsForOperatorClass___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v6 objectForKeyedSubscript:v12];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"Configs"];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        if ([*(id *)(a1 + 48) shouldConfigureTable:*(void *)(a1 + 32) withType:v5 withName:v12 withConfigs:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])
        {
          char v17 = [[PLEntryKey alloc] initWithOperatorName:*(void *)(a1 + 32) withEntryType:v5 withEntryName:v12];
          [*(id *)(a1 + 48) addPLEntryKey:v17];
        }
        uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v19 = *(void **)(v18 + 40);
        *(void *)(v18 + 40) = 0;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

+ (id)entryKeysForOperator:(id)a3
{
  uint64_t v4 = [a3 className];
  id v5 = [a1 entryKeysForOperatorName:v4];

  return v5;
}

+ (id)entryKeysForOperatorClass:(Class)a3
{
  uint64_t v4 = [(objc_class *)a3 className];
  id v5 = [a1 entryKeysForOperatorName:v4];

  return v5;
}

+ (id)entryKeysForOperatorName:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v4 = [(id)_entryKeysForOperator objectForKeyedSubscript:v3];
  objc_sync_exit(@"++entryKeyObjectsSync++");

  return v4;
}

+ (id)PLEntryKeysForEntryType:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v4 = [(id)_PLEntryKeysForEntryType objectForKeyedSubscript:v3];
  objc_sync_exit(@"++entryKeyObjectsSync++");

  return v4;
}

+ (id)PLEntryKeyStringsForTasking
{
  objc_sync_enter(@"++entryKeyObjectsSync++");
  id v2 = (id)_PLEntryKeyStringsForTasking;
  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v2;
}

+ (void)PLEntryKeyStringsForTaskingReset
{
  objc_sync_enter(@"++entryKeyObjectsSync++");
  id v2 = (void *)_PLEntryKeyStringsForTasking;
  _PLEntryKeyStringsForTasking = 0;

  objc_sync_exit(@"++entryKeyObjectsSync++");
}

+ (id)PLEntryAggregateKeysForOperator:(id)a3
{
  uint64_t v4 = [a3 className];
  id v5 = [a1 PLEntryAggregateKeysForOperatorName:v4];

  return v5;
}

+ (id)PLEntryAggregateKeysForOperatorClass:(Class)a3
{
  uint64_t v4 = [(objc_class *)a3 className];
  id v5 = [a1 PLEntryAggregateKeysForOperatorName:v4];

  return v5;
}

+ (id)PLEntryAggregateKeysForOperatorName:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v4 = [(id)_PLEntryKeyForOperatorForEntryTypeForEntryName objectForKeyedSubscript:v3];
  id v5 = [v4 objectForKeyedSubscript:@"Aggregate"];
  id v6 = [v5 allValues];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  return v6;
}

+ (id)PLEntryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5
{
  return (id)[a1 PLEntryKeyForOperatorName:a3 withType:a4 withName:a5 withWildCardName:0 isDynamic:0];
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5
{
  return (id)[a1 entryKeyForOperatorName:a3 withType:a4 withName:a5 withWildCardName:0 isDynamic:0];
}

+ (id)entryKeyStringForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@_%@_%@", a3, a4, a5];
}

+ (id)entryKeyForOperatorName:(id)a3 withType:(id)a4 withName:(id)a5 withWildCardName:(id)a6
{
  return (id)[a1 entryKeyForOperatorName:a3 withType:a4 withName:a5 withWildCardName:a6 isDynamic:0];
}

+ (id)dynamicEntryKeyForEntryKey:(id)a3
{
  uint64_t v4 = [a1 PLEntryKeyForEntryKey:a3];
  id v5 = [v4 operatorName];
  id v6 = [v4 entryType];
  id v7 = [v4 entryName];
  uint64_t v8 = [a1 entryKeyForOperatorName:v5 withType:v6 withName:v7 isDynamic:1];

  return v8;
}

+ (id)timeintervalRangeEntryKeyForEntryKey:(id)a3 withTimeIntervalRange:(_PLTimeIntervalRange)a4
{
  double length = a4.length;
  double location = a4.location;
  id v7 = a3;
  uint64_t v8 = [a1 PLEntryKeyForEntryKey:v7];
  objc_sync_enter(@"++entryKeyObjectsSync++");
  uint64_t v9 = (void *)_PLEntryKeyForEntryKeyForPLTimeInterval;
  uint64_t v10 = [v8 entryKey];
  id v11 = [v9 objectForKeyedSubscript:v10];
  *(double *)uint64_t v16 = location;
  *(double *)&v16[1] = length;
  uint64_t v12 = [MEMORY[0x1E4F29238] value:v16 withObjCType:"{_PLTimeIntervalRange=dd}"];
  id v13 = [v11 objectForKeyedSubscript:v12];

  objc_sync_exit(@"++entryKeyObjectsSync++");
  if (!v13)
  {
    id v13 = objc_msgSend(v8, "copyWithTimeIntervalRange:", location, length);
    [a1 addPLEntryKey:v13];
  }
  uint64_t v14 = [v13 entryKey];

  return v14;
}

+ (id)operatorNameForEntryKey:(id)a3
{
  id v3 = [a1 PLEntryKeyForEntryKey:a3];
  uint64_t v4 = [v3 operatorName];

  return v4;
}

+ (id)wildCardForEntryKey:(id)a3
{
  id v3 = [a1 PLEntryKeyForEntryKey:a3];
  uint64_t v4 = [v3 wildCardName];

  return v4;
}

+ (id)baseEntryKeyForEntryKey:(id)a3
{
  id v3 = [a1 PLEntryKeyForEntryKey:a3];
  uint64_t v4 = [v3 baseEntryKey];
  id v5 = [v4 entryKey];

  return v5;
}

+ (_PLTimeIntervalRange)timeIntervalRangeForEntryKey:(id)a3
{
  id v3 = [a1 PLEntryKeyForEntryKey:a3];
  [v3 timeIntervalRange];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double length = v9;
  result.double location = v8;
  return result;
}

- (void)setWildCardName:(id)a3
{
  double v4 = (NSString *)[a3 copy];
  wildCardName = self->_wildCardName;
  self->_wildCardName = v4;

  double v6 = NSString;
  id v9 = [(PLEntryKey *)self entryKey];
  double v7 = [v6 stringWithFormat:@"%@+%@", v9, self->_wildCardName];
  entryKey = self->_entryKey;
  self->_entryKey = v7;
}

- (void)setIsDynamic:(BOOL)a3
{
  self->_isDynamic = a3;
  double v4 = NSString;
  id v7 = [(PLEntryKey *)self entryKey];
  double v5 = [v4 stringWithFormat:@"%@_%@", v7, @"Dynamic"];
  entryKey = self->_entryKey;
  self->_entryKey = v5;
}

- (void)setTimeIntervalRange:(_PLTimeIntervalRange)a3
{
  self->_timeIntervalRange = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"%f_%f", *(void *)&a3.location, *(void *)&a3.length);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PLEntryKey *)self setWildCardName:v4];
}

- (PLEntryKey)initWithOperatorName:(id)a3 withEntryType:(id)a4 withEntryName:(id)a5
{
  id v9 = (NSString *)a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PLEntryKey;
  uint64_t v12 = [(PLEntryKey *)&v25 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_operatorName, a3);
    uint64_t v14 = NSClassFromString(v9);
    Class operatorClass = v13->_operatorClass;
    v13->_Class operatorClass = (Class)v14;

    objc_storeStrong((id *)&v13->_entryType, a4);
    objc_storeStrong((id *)&v13->_entryName, a5);
    uint64_t v16 = [NSString stringWithFormat:@"%@_%@_%@", v9, v10, v11];
    entryKey = v13->_entryKey;
    v13->_entryKey = (NSString *)v16;

    objc_storeWeak((id *)&v13->_baseEntryKey, v13);
    wildCardName = v13->_wildCardName;
    v13->_wildCardName = 0;

    __asm { FMOV            V0.2D, #-1.0 }
    v13->_timeIntervalRange = _Q0;
    v13->_isDynamic = 0;
  }

  return v13;
}

- (id)copyWithWildCardName:(id)a3
{
  id v4 = a3;
  double v5 = [PLEntryKey alloc];
  double v6 = [(PLEntryKey *)self operatorName];
  id v7 = [(PLEntryKey *)self entryType];
  double v8 = [(PLEntryKey *)self entryName];
  id v9 = [(PLEntryKey *)v5 initWithOperatorName:v6 withEntryType:v7 withEntryName:v8];

  [(PLEntryKey *)v9 setWildCardName:v4];
  [(PLEntryKey *)v9 setBaseEntryKey:self];
  return v9;
}

- (id)copyWithIsDynamic:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [PLEntryKey alloc];
  double v6 = [(PLEntryKey *)self operatorName];
  id v7 = [(PLEntryKey *)self entryType];
  double v8 = [(PLEntryKey *)self entryName];
  id v9 = [(PLEntryKey *)v5 initWithOperatorName:v6 withEntryType:v7 withEntryName:v8];

  [(PLEntryKey *)v9 setIsDynamic:v3];
  [(PLEntryKey *)v9 setBaseEntryKey:self];
  return v9;
}

- (id)copyWithTimeIntervalRange:(_PLTimeIntervalRange)a3
{
  double length = a3.length;
  double location = a3.location;
  double v6 = [PLEntryKey alloc];
  id v7 = [(PLEntryKey *)self operatorName];
  double v8 = [(PLEntryKey *)self entryType];
  id v9 = [(PLEntryKey *)self entryName];
  id v10 = [(PLEntryKey *)v6 initWithOperatorName:v7 withEntryType:v8 withEntryName:v9];

  -[PLEntryKey setTimeIntervalRange:](v10, "setTimeIntervalRange:", location, length);
  [(PLEntryKey *)v10 setBaseEntryKey:self];
  return v10;
}

- (id)debugDescription
{
  BOOL v3 = NSString;
  id v4 = [(PLEntryKey *)self entryKey];
  double v5 = [(PLEntryKey *)self operatorName];
  double v6 = [(PLEntryKey *)self entryType];
  id v7 = [(PLEntryKey *)self entryName];
  double v8 = [(PLEntryKey *)self wildCardName];
  [(PLEntryKey *)self isDynamic];
  id v9 = NSStringFromBOOL();
  id v10 = [v3 stringWithFormat:@"[%p] entryKey=%@ operatorName=%@ entryType=%@ entryName=%@ wildCardName=%@ isDynamc=%@", self, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (PLEntryKey)baseEntryKey
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_baseEntryKey);
  return (PLEntryKey *)WeakRetained;
}

- (void)setBaseEntryKey:(id)a3
{
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)wildCardName
{
  return self->_wildCardName;
}

- (BOOL)isDynamic
{
  return self->_isDynamic;
}

- (_PLTimeIntervalRange)timeIntervalRange
{
  double location = self->_timeIntervalRange.location;
  double length = self->_timeIntervalRange.length;
  result.double length = length;
  result.double location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wildCardName, 0);
  objc_storeStrong((id *)&self->_entryName, 0);
  objc_storeStrong((id *)&self->_entryType, 0);
  objc_storeStrong((id *)&self->_operatorClass, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_destroyWeak((id *)&self->_baseEntryKey);
  objc_storeStrong((id *)&self->_entryKey, 0);
}

@end