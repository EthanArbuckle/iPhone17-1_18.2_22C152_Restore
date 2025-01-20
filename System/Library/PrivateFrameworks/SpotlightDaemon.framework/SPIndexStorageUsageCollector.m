@interface SPIndexStorageUsageCollector
- (BOOL)canceled;
- (BOOL)collectAtPath:(id)a3;
- (NSDictionary)storageUsage;
- (SPIndexStorageUsageCollector)init;
- (void)sendToCoreAnalyticsWithLiveDocCount:(unint64_t)a3 deadDocCount:(unint64_t)a4;
- (void)setCanceled:(BOOL)a3;
@end

@implementation SPIndexStorageUsageCollector

- (SPIndexStorageUsageCollector)init
{
  v8.receiver = self;
  v8.super_class = (Class)SPIndexStorageUsageCollector;
  v2 = [(SPIndexStorageUsageCollector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    visitedInodes = v2->_visitedInodes;
    v2->_visitedInodes = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    storageUsage = v2->_storageUsage;
    v2->_storageUsage = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (NSDictionary)storageUsage
{
  v2 = (void *)[(NSMutableDictionary *)self->_storageUsage copy];
  return (NSDictionary *)v2;
}

- (BOOL)collectAtPath:(id)a3
{
  v115[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(SPIndexStorageUsageCollector *)self canceled])
  {
    BOOL v5 = 0;
    goto LABEL_109;
  }
  [(NSMutableDictionary *)self->_storageUsage removeAllObjects];
  [(NSMutableDictionary *)self->_visitedInodes removeAllObjects];
  v6 = [MEMORY[0x263F08850] defaultManager];
  id v81 = v4;
  v7 = [NSURL fileURLWithPath:v4];
  uint64_t v8 = *MEMORY[0x263EFF660];
  uint64_t v91 = *MEMORY[0x263EFF688];
  v115[0] = *MEMORY[0x263EFF688];
  v115[1] = v8;
  uint64_t v84 = v8;
  uint64_t v9 = *MEMORY[0x263EFF730];
  uint64_t v87 = *MEMORY[0x263EFF6D8];
  v115[2] = *MEMORY[0x263EFF6D8];
  v115[3] = v9;
  uint64_t v89 = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:4];
  v109[0] = MEMORY[0x263EF8330];
  v109[1] = 3221225472;
  v109[2] = __46__SPIndexStorageUsageCollector_collectAtPath___block_invoke;
  v109[3] = &unk_264509458;
  v109[4] = self;
  v82 = v6;
  v11 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:v10 options:0 errorHandler:v109];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v11;
  v85 = v7;
  uint64_t v86 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
  if (!v86) {
    goto LABEL_82;
  }
  uint64_t v88 = *(void *)v106;
  uint64_t v83 = *MEMORY[0x263F080A0];
  uint64_t v80 = *MEMORY[0x263F08098];
  uint64_t v79 = *MEMORY[0x263F08088];
  uint64_t v78 = *MEMORY[0x263F08080];
  v95 = self;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v106 != v88) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v105 + 1) + 8 * v12);
      if ([(SPIndexStorageUsageCollector *)self canceled]) {
        goto LABEL_102;
      }
      v14 = (void *)MEMORY[0x223C480D0]();
      id v103 = 0;
      id v104 = 0;
      char v15 = [v13 getResourceValue:&v104 forKey:v91 error:&v103];
      id v96 = v104;
      id v16 = v103;
      if ((v15 & 1) == 0)
      {
        v73 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
          -[SPIndexStorageUsageCollector collectAtPath:].cold.4();
        }

        [(SPIndexStorageUsageCollector *)self setCanceled:1];
        goto LABEL_101;
      }
      v17 = [v13 path];
      v18 = [v7 path];
      v19 = [v17 stringByReplacingOccurrencesOfString:v18 withString:&stru_26D0BD940];

      if ([v19 hasPrefix:@"/private"])
      {
        uint64_t v20 = [v19 substringFromIndex:objc_msgSend(@"/private", "length")];

        v19 = (void *)v20;
      }
      if ([v19 hasPrefix:@"/"])
      {
        uint64_t v21 = [v19 substringFromIndex:1];

        v19 = (void *)v21;
      }
      storageUsage = self->_storageUsage;
      uint64_t v23 = [v96 unsignedLongLongValue];
      v24 = storageUsage;
      id v25 = v19;
      char v26 = [v25 hasPrefix:@"Priority"];
      v27 = @"priority";
      if (v26) {
        goto LABEL_19;
      }
      char v28 = [v25 hasPrefix:v83];
      v27 = @"protectionClassCX";
      if ((v28 & 1) != 0
        || (char v29 = [v25 hasPrefix:v80], v27 = @"protectionClassC", (v29 & 1) != 0)
        || (char v30 = [v25 hasPrefix:v79], v27 = @"protectionClassB", (v30 & 1) != 0)
        || (int v31 = [v25 hasPrefix:v78], v27 = @"protectionClassA", v31))
      {
LABEL_19:
        incrementIndexStorageSize(v24, v27, v23);
      }
      if ([v25 hasSuffix:@".indexBigDates"])
      {
        v32 = v24;
        v33 = @"bigDate";
        goto LABEL_22;
      }
      v34 = [v25 lastPathComponent];
      if ([v34 isEqualToString:@".store.db"])
      {

LABEL_26:
        context = v14;
        incrementIndexStorageSize(v24, @"sdb", v23);
        uint64_t v36 = 1;
        while (1)
        {
          v37 = [v25 lastPathComponent];
          v38 = objc_msgSend(NSString, "stringWithFormat:", @"dbStr-%u.map.", v36);
          int v39 = [v37 hasPrefix:v38];

          if (v39) {
            break;
          }
          uint64_t v36 = (v36 + 1);
          if (v36 == 7) {
            goto LABEL_31;
          }
        }
        v40 = objc_msgSend(NSString, "stringWithFormat:", @"dataMap%u", v36);
        incrementIndexStorageSize(v24, v40, v23);

        goto LABEL_31;
      }
      int v35 = [v34 hasPrefix:@"dbStr-"];

      if (v35) {
        goto LABEL_26;
      }
      if (isEmbedding(v25))
      {
        v32 = v24;
        v33 = @"embedding";
        goto LABEL_22;
      }
      id v56 = v25;
      if ([v56 hasSuffix:@".directoryStoreFile"])
      {

LABEL_54:
        v32 = v24;
        v33 = @"forwardDirStore";
LABEL_22:
        incrementIndexStorageSize(v32, v33, v23);
        char v92 = 1;
        goto LABEL_34;
      }
      int v57 = [v56 hasSuffix:@".directoryStoreFile.shadow"];

      if (v57) {
        goto LABEL_54;
      }
      context = v14;
      v58 = [v56 lastPathComponent];
      if (([v58 isEqualToString:@"reverseDirectoryStore"] & 1) != 0
        || [v58 isEqualToString:@"reverseDirectoryStore.shadow"])
      {

LABEL_58:
        v59 = v24;
        v60 = @"reverseDirStore";
LABEL_59:
        incrementIndexStorageSize(v59, v60, v23);
        char v92 = 1;
        goto LABEL_33;
      }
      int v61 = [v58 isEqualToString:@"reverseStore.updates"];

      if (v61) {
        goto LABEL_58;
      }
      if ([v56 hasSuffix:@".indexIds"])
      {
        v59 = v24;
        v60 = @"indexId";
        goto LABEL_59;
      }
      v14 = context;
      if ([v56 hasSuffix:@".indexTermIds"])
      {
        v32 = v24;
        v33 = @"indexTermId";
        goto LABEL_22;
      }
      if ([v56 hasSuffix:@".indexPositions"])
      {
        v32 = v24;
        v33 = @"position";
        goto LABEL_22;
      }
      if ([v56 hasSuffix:@".indexPositionTable"])
      {
        v32 = v24;
        v33 = @"positionTable";
        goto LABEL_22;
      }
      if ([v56 hasSuffix:@".indexPostings"])
      {
        v32 = v24;
        v33 = @"posting";
        goto LABEL_22;
      }
      if ([v56 hasSuffix:@".indexScores"])
      {
        v32 = v24;
        v33 = @"score";
        goto LABEL_22;
      }
      if ([v56 hasSuffix:@".indexGroups"])
      {
        v62 = v24;
        v63 = @"group";
      }
      else if (isTermIndex(v56))
      {
        v62 = v24;
        v63 = @"termIndex";
      }
      else
      {
        if (!isJournal(v56))
        {
          char v92 = 0;
          goto LABEL_32;
        }
        v62 = v24;
        v63 = @"journal";
      }
      incrementIndexStorageSize(v62, v63, v23);
LABEL_31:
      char v92 = 1;
LABEL_32:
      v7 = v85;
LABEL_33:
      v14 = context;
LABEL_34:

      id v101 = 0;
      id v102 = 0;
      char v41 = [v13 getResourceValue:&v102 forKey:v89 error:&v101];
      id v42 = v102;
      id v43 = v101;

      if ((v41 & 1) == 0)
      {
        v74 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          -[SPIndexStorageUsageCollector collectAtPath:]();
        }

        [(SPIndexStorageUsageCollector *)v95 setCanceled:1];
        id v16 = v43;
        goto LABEL_101;
      }
      id v99 = 0;
      id v100 = 0;
      char v44 = [v13 getResourceValue:&v100 forKey:v87 error:&v99];
      id v45 = v100;
      id v16 = v99;

      if ((v44 & 1) == 0)
      {
        v75 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
          -[SPIndexStorageUsageCollector collectAtPath:]();
        }

        [(SPIndexStorageUsageCollector *)v95 setCanceled:1];
LABEL_101:

LABEL_102:
        BOOL v5 = 0;
        id v66 = obj;
        goto LABEL_107;
      }
      if ((unint64_t)[v42 unsignedLongValue] > 1)
      {
        contexta = v14;
        id v98 = 0;
        int v46 = [v13 getResourceValue:&v98 forKey:v84 error:0];
        id v47 = v98;
        if (v46)
        {
          v48 = [(NSMutableDictionary *)v95->_visitedInodes objectForKeyedSubscript:v47];

          v49 = NSNumber;
          if (v48)
          {
            v50 = [(NSMutableDictionary *)v95->_visitedInodes objectForKeyedSubscript:v47];
            v51 = objc_msgSend(v49, "numberWithUnsignedLong:", objc_msgSend(v50, "unsignedLongValue") - 1);
            [(NSMutableDictionary *)v95->_visitedInodes setObject:v51 forKeyedSubscript:v47];

            v52 = [(NSMutableDictionary *)v95->_visitedInodes objectForKeyedSubscript:v47];
            uint64_t v53 = [v52 unsignedLongValue];

            v7 = v85;
            if (!v53) {
              [(NSMutableDictionary *)v95->_visitedInodes removeObjectForKey:v47];
            }
          }
          else
          {
            v55 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v42, "unsignedLongValue") - 1);
            [(NSMutableDictionary *)v95->_visitedInodes setObject:v55 forKeyedSubscript:v47];

            updateStorageUsageIgnoreLinks(v95->_storageUsage, v25, [v96 unsignedLongLongValue], objc_msgSend(v45, "BOOLValue"), v92);
            v7 = v85;
          }
        }
        else
        {
          v54 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v111 = v13;
            __int16 v112 = 2112;
            id v113 = v16;
            _os_log_error_impl(&dword_21F1CE000, v54, OS_LOG_TYPE_ERROR, "Failed to get resource identifier: %@, %@", buf, 0x16u);
          }

          [(SPIndexStorageUsageCollector *)v95 setCanceled:1];
        }

        if (!v46) {
          goto LABEL_102;
        }
      }
      else
      {
        updateStorageUsageIgnoreLinks(v95->_storageUsage, v25, [v96 unsignedLongLongValue], objc_msgSend(v45, "BOOLValue"), v92);
      }
      ++v12;
      self = v95;
    }
    while (v12 != v86);
    uint64_t v64 = [obj countByEnumeratingWithState:&v105 objects:v114 count:16];
    uint64_t v86 = v64;
  }
  while (v64);
LABEL_82:

  if ([(SPIndexStorageUsageCollector *)self canceled])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v97 = 0;
    v65 = [v82 attributesOfFileSystemForPath:v81 error:&v97];
    id v66 = v97;
    if (v66) {
      BOOL v67 = 1;
    }
    else {
      BOOL v67 = v65 == 0;
    }
    BOOL v5 = !v67;
    if (v67)
    {
      v76 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        -[SPIndexStorageUsageCollector collectAtPath:]((uint64_t)v66, v76);
      }
    }
    else
    {
      v68 = [v65 objectForKeyedSubscript:*MEMORY[0x263F080D0]];
      uint64_t v69 = [v68 unsignedLongLongValue];

      v70 = [v65 objectForKeyedSubscript:*MEMORY[0x263F080C8]];
      uint64_t v71 = [v70 unsignedLongLongValue];

      uint64_t v72 = v69;
      v7 = v85;
      incrementIndexStorageSize(self->_storageUsage, @"diskSpace", v72);
      incrementIndexStorageSize(self->_storageUsage, @"spaceLeft", v71);
    }

LABEL_107:
  }
  id v4 = v81;

LABEL_109:
  return v5;
}

uint64_t __46__SPIndexStorageUsageCollector_collectAtPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __46__SPIndexStorageUsageCollector_collectAtPath___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) setCanceled:1];
  return 0;
}

- (void)sendToCoreAnalyticsWithLiveDocCount:(unint64_t)a3 deadDocCount:(unint64_t)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (![(SPIndexStorageUsageCollector *)self canceled])
  {
    unint64_t v44 = a3;
    unint64_t v45 = a4;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v7 = self->_storageUsage;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v13 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [(NSMutableDictionary *)self->_storageUsage objectForKeyedSubscript:v12];
            [v14 unsignedLongLongValue];
            LOBYTE(v59) = 0;
            *(_DWORD *)buf = 0;
            humanize_number();
            char v15 = [NSString stringWithUTF8String:buf];
            *(_DWORD *)buf = 138412546;
            uint64_t v59 = v12;
            __int16 v60 = 2112;
            int v61 = v15;
            _os_log_impl(&dword_21F1CE000, v13, OS_LOG_TYPE_DEFAULT, "Index type %@ size %@", buf, 0x16u);
          }
        }
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v9);
    }

    id v16 = self->_storageUsage;
    v17 = objc_opt_new();
    id v47 = v16;
    v18 = [(NSMutableDictionary *)v16 allKeys];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v18;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:buf count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v54 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v23 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          if ([v23 isEqualToString:@"spaceLeft"])
          {
            char v24 = 30;
          }
          else if ([v23 isEqualToString:@"diskSpace"])
          {
            char v24 = 30;
          }
          else
          {
            char v24 = 10;
          }
          id v25 = NSNumber;
          char v26 = [(NSMutableDictionary *)v47 objectForKeyedSubscript:v23];
          v27 = objc_msgSend(v25, "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v26, "unsignedLongLongValue") >> v24);
          [v17 setObject:v27 forKeyedSubscript:v23];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v53 objects:buf count:16];
      }
      while (v20);
    }
    char v28 = NSNumber;
    char v29 = [v17 objectForKeyedSubscript:@"total"];
    uint64_t v30 = [v29 unsignedIntegerValue];
    int v31 = [v17 objectForKeyedSubscript:@"purgeable"];
    v32 = objc_msgSend(v28, "numberWithUnsignedInteger:", v30 - objc_msgSend(v31, "unsignedIntegerValue"));
    [v17 setObject:v32 forKeyedSubscript:@"nonPurgeable"];

    v33 = NSNumber;
    v34 = [v17 objectForKeyedSubscript:@"embedding"];
    uint64_t v35 = [v34 unsignedIntegerValue];
    uint64_t v36 = [v17 objectForKeyedSubscript:@"embeddingPurgeable"];
    v37 = objc_msgSend(v33, "numberWithUnsignedInteger:", v35 - objc_msgSend(v36, "unsignedIntegerValue"));
    [v17 setObject:v37 forKeyedSubscript:@"embeddingNonPurgeable"];

    v38 = [NSNumber numberWithUnsignedLongLong:v44];
    [v17 setObject:v38 forKeyedSubscript:@"liveDocCount"];

    int v39 = [NSNumber numberWithUnsignedLongLong:v45];
    [v17 setObject:v39 forKeyedSubscript:@"deletedDocCount"];

    v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x263F78CD0], "version"));
    char v41 = [v40 stringValue];
    [v17 setObject:v41 forKeyedSubscript:@"embeddingModelVersion"];

    id v42 = (void *)[v17 copy];
    v48 = v42;
    id v43 = v42;
    AnalyticsSendEventLazy();
  }
}

id __81__SPIndexStorageUsageCollector_sendToCoreAnalyticsWithLiveDocCount_deadDocCount___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageUsage, 0);
  objc_storeStrong((id *)&self->_visitedInodes, 0);
}

- (void)collectAtPath:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "Failed to retrieve file system attributes: %@", (uint8_t *)&v2, 0xCu);
}

- (void)collectAtPath:.cold.2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_21F1CE000, v0, v1, "Failed to get purgeability: %@, %@");
}

- (void)collectAtPath:.cold.3()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_21F1CE000, v0, v1, "Failed to get link count: %@, %@");
}

- (void)collectAtPath:.cold.4()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_21F1CE000, v0, v1, "Failed to get file size: %@, %@");
}

void __46__SPIndexStorageUsageCollector_collectAtPath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_21F1CE000, v0, v1, "Error enumerating file: %@, %@");
}

@end