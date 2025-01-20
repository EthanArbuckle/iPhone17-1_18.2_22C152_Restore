@interface PLCPUEnergySnapshot
+ (NSMutableDictionary)coalitionIDToCoalitionNameMapping;
+ (NSMutableDictionary)identifierToAccountingName;
+ (NSMutableDictionary)identifierToCoalitionID;
+ (void)setCoalitionIDToCoalitionNameMapping:(id)a3;
+ (void)setIdentifierToAccountingName:(id)a3;
+ (void)setIdentifierToCoalitionID:(id)a3;
- (BOOL)isValid;
- (BOOL)snapshotCPUEnergy:(id)a3;
- (NSMutableDictionary)mockData;
- (PLCPUEnergySnapshot)initWithIdentifier:(id)a3 andMockData:(id)a4;
- (double)computeEnergyDiff:(id)a3;
- (double)computeEnergyDiffUntilNow:(id)a3 andAdjustSnapshotToNow:(BOOL)a4;
- (id)description;
- (id)getCoalitionIDForIdentifier:(id)a3;
- (id)searchCoalitionsCacheForID:(id)a3;
- (unint64_t)cpuEnergy;
- (unint64_t)cpuEnergyBilledToMe;
- (unint64_t)cpuEnergyBilledToOthers;
- (void)refreshCoalitionIDMapping;
- (void)setCpuEnergy:(unint64_t)a3;
- (void)setCpuEnergyBilledToMe:(unint64_t)a3;
- (void)setCpuEnergyBilledToOthers:(unint64_t)a3;
- (void)setMockData:(id)a3;
@end

@implementation PLCPUEnergySnapshot

- (PLCPUEnergySnapshot)initWithIdentifier:(id)a3 andMockData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLCPUEnergySnapshot;
  v8 = [(PLCPUEnergySnapshot *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(PLCPUEnergySnapshot *)v8 setMockData:v7];
    [(PLCPUEnergySnapshot *)v9 snapshotCPUEnergy:v6];
  }

  return v9;
}

- (double)computeEnergyDiffUntilNow:(id)a3 andAdjustSnapshotToNow:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [PLCPUEnergySnapshot alloc];
  v8 = [(PLCPUEnergySnapshot *)self mockData];
  v9 = [(PLCPUEnergySnapshot *)v7 initWithIdentifier:v6 andMockData:v8];

  [(PLCPUEnergySnapshot *)v9 computeEnergyDiff:self];
  double v11 = v10;
  if (v4)
  {
    v12 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLCPUEnergySnapshot computeEnergyDiffUntilNow:andAdjustSnapshotToNow:]();
    }

    [(PLCPUEnergySnapshot *)self setCpuEnergy:[(PLCPUEnergySnapshot *)v9 cpuEnergy]];
    [(PLCPUEnergySnapshot *)self setCpuEnergyBilledToMe:[(PLCPUEnergySnapshot *)v9 cpuEnergyBilledToMe]];
    [(PLCPUEnergySnapshot *)self setCpuEnergyBilledToOthers:[(PLCPUEnergySnapshot *)v9 cpuEnergyBilledToOthers]];
    v13 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLCPUEnergySnapshot computeEnergyDiffUntilNow:andAdjustSnapshotToNow:]();
    }
  }
  return v11;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4 = a3;
  v5 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLCPUEnergySnapshot computeEnergyDiff:]();
  }

  double v6 = 0.0;
  if ([(PLCPUEnergySnapshot *)self isValid])
  {
    if ([v4 isValid])
    {
      id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy") - objc_msgSend(v4, "cpuEnergy"));
      [v7 doubleValue];
      double v9 = v8;

      double v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe")- objc_msgSend(v4, "cpuEnergyBilledToMe"));
      [v10 doubleValue];
      double v12 = v11;

      v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers")- objc_msgSend(v4, "cpuEnergyBilledToOthers"));
      [v13 doubleValue];
      double v15 = v14;

      if (v9 >= 0.0 && v12 >= 0.0 && v15 >= 0.0)
      {
        if ((v9 + v12 - v15) / 3600000000.0 >= 0.0) {
          double v6 = (v9 + v12 - v15) / 3600000000.0;
        }
        else {
          double v6 = 0.0;
        }
      }
    }
  }

  return v6;
}

- (BOOL)isValid
{
  return [(PLCPUEnergySnapshot *)self cpuEnergy]
      || [(PLCPUEnergySnapshot *)self cpuEnergyBilledToMe]
      || [(PLCPUEnergySnapshot *)self cpuEnergyBilledToOthers] != 0;
}

- (BOOL)snapshotCPUEnergy:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLCPUEnergySnapshot *)self mockData];
  double v6 = [v5 objectForKeyedSubscript:@"CPUCoalitionsMock"];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (!v7)
  {
    v13 = [NSNumber numberWithUnsignedLongLong:0];
    double v11 = [(PLCPUEnergySnapshot *)self getCoalitionIDForIdentifier:v4];

    if ([v11 unsignedLongLongValue])
    {
      [v11 longLongValue];
      double v14 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLCPUEnergySnapshot snapshotCPUEnergy:]();
      }

      double v15 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
      int v16 = coalition_info_resource_usage();
      BOOL v12 = v16 == 0;
      if (v16)
      {
        if (!v15)
        {
LABEL_14:
          BOOL v12 = 0;
          goto LABEL_17;
        }
      }
      else
      {
        [(PLCPUEnergySnapshot *)self setCpuEnergy:v15[11]];
        [(PLCPUEnergySnapshot *)self setCpuEnergyBilledToMe:v15[20]];
        [(PLCPUEnergySnapshot *)self setCpuEnergyBilledToOthers:v15[21]];
      }
      free(v15);
      goto LABEL_17;
    }
    v17 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[PLCPUEnergySnapshot snapshotCPUEnergy:]();
    }

    goto LABEL_14;
  }
  double v8 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412546;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1A11A5000, v8, OS_LOG_TYPE_INFO, "Reading mock coalitions data for identifier=%@, mockDataForIdentifier=%@", (uint8_t *)&v19, 0x16u);
  }

  double v9 = [v7 objectForKeyedSubscript:@"cpuEnergy"];
  -[PLCPUEnergySnapshot setCpuEnergy:](self, "setCpuEnergy:", [v9 longLongValue]);

  double v10 = [v7 objectForKeyedSubscript:@"cpuEnergyBilledToMe"];
  -[PLCPUEnergySnapshot setCpuEnergyBilledToMe:](self, "setCpuEnergyBilledToMe:", [v10 longLongValue]);

  double v11 = [v7 objectForKeyedSubscript:@"cpuEnergyBilledToOthers"];
  -[PLCPUEnergySnapshot setCpuEnergyBilledToOthers:](self, "setCpuEnergyBilledToOthers:", [v11 longLongValue]);
  BOOL v12 = 1;
LABEL_17:

  return v12;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"cpuEnergy=%llu, cpuEnergyBilledToMe=%llu, cpuEnergyBilledToOthers=%llu", -[PLCPUEnergySnapshot cpuEnergy](self, "cpuEnergy"), -[PLCPUEnergySnapshot cpuEnergyBilledToMe](self, "cpuEnergyBilledToMe"), -[PLCPUEnergySnapshot cpuEnergyBilledToOthers](self, "cpuEnergyBilledToOthers")];
}

- (void)refreshCoalitionIDMapping
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = +[PLCPUEnergySnapshot coalitionIDToCoalitionNameMapping];
  [v2 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1A11A5000, a1, v3, "After refresh coalitionIDToCoalitionNameMapping count=%lu", v4);
}

- (id)getCoalitionIDForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [NSNumber numberWithUnsignedLongLong:0];
  double v6 = +[PLCPUEnergySnapshot identifierToCoalitionID];
  id v7 = [v6 objectForKeyedSubscript:v4];

  if (v7)
  {
    double v8 = PLLogDiscretionaryEnergyMonitor();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:]();
    }

    double v9 = +[PLCPUEnergySnapshot identifierToCoalitionID];
    double v10 = [v9 objectForKeyedSubscript:v4];
  }
  else
  {
    double v11 = [(PLCPUEnergySnapshot *)self searchCoalitionsCacheForID:v4];

    if (![v11 unsignedLongLongValue])
    {
      BOOL v12 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl(&dword_1A11A5000, v12, OS_LOG_TYPE_INFO, "coalitionID not found, refreshing coalition mapping and searching again for identifier=%@", (uint8_t *)&v17, 0xCu);
      }

      [(PLCPUEnergySnapshot *)self refreshCoalitionIDMapping];
      uint64_t v13 = [(PLCPUEnergySnapshot *)self searchCoalitionsCacheForID:v4];

      double v11 = (void *)v13;
    }
    if (![v11 unsignedLongLongValue])
    {
      double v14 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PLCPUEnergySnapshot getCoalitionIDForIdentifier:]();
      }
    }
    if ([v11 unsignedLongLongValue])
    {
      double v15 = +[PLCPUEnergySnapshot identifierToCoalitionID];
      [v15 setObject:v11 forKeyedSubscript:v4];
    }
    id v5 = v11;
    double v10 = v5;
  }

  return v10;
}

- (id)searchCoalitionsCacheForID:(id)a3
{
  id v3 = a3;
  id v4 = PLLogDiscretionaryEnergyMonitor();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLCPUEnergySnapshot searchCoalitionsCacheForID:]();
  }

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy_;
  int v16 = __Block_byref_object_dispose_;
  id v17 = [NSNumber numberWithUnsignedLongLong:0];
  id v5 = +[PLCPUEnergySnapshot coalitionIDToCoalitionNameMapping];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke;
  v9[3] = &unk_1E5A45C90;
  id v6 = v3;
  id v10 = v6;
  double v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = [v9 objectAtIndexedSubscript:0];
  double v11 = [v9 objectAtIndexedSubscript:1];

  if ([v10 isEqualToString:&stru_1EF44BBB0])
  {
    if ((unint64_t)[v11 length] > 9)
    {
      id v12 = [v11 substringFromIndex:10];
    }
    else
    {
      id v12 = v11;
    }
  }
  else
  {
    id v12 = v10;
  }
  uint64_t v13 = v12;
  uint64_t v14 = (void *)(a1 + 32);
  if (([v12 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
    || ([v10 isEqualToString:*v14] & 1) != 0
    || [v11 isEqualToString:*v14])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    if (([v13 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
    {
      double v15 = PLLogDiscretionaryEnergyMonitor();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke_cold_1();
      }

      int v16 = +[PLCPUEnergySnapshot identifierToAccountingName];
      id v17 = [v16 objectForKeyedSubscript:*v14];

      if (!v17)
      {
        id v18 = +[PLCPUEnergySnapshot identifierToAccountingName];
        [v18 setObject:v13 forKeyedSubscript:*v14];

        uint64_t v19 = PLLogDiscretionaryEnergyMonitor();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = +[PLCPUEnergySnapshot identifierToAccountingName];
          int v21 = 138412290;
          v22 = v20;
          _os_log_impl(&dword_1A11A5000, v19, OS_LOG_TYPE_INFO, "identifierToAccountingName=%@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    *a4 = 1;
  }
}

+ (NSMutableDictionary)identifierToCoalitionID
{
  v2 = (void *)_identifierToCoalitionID;
  if (!_identifierToCoalitionID)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)_identifierToCoalitionID;
    _identifierToCoalitionID = (uint64_t)v3;

    v2 = (void *)_identifierToCoalitionID;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setIdentifierToCoalitionID:(id)a3
{
  if ((id)_identifierToCoalitionID != a3)
  {
    _identifierToCoalitionID = [a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

+ (NSMutableDictionary)coalitionIDToCoalitionNameMapping
{
  v2 = (void *)_coalitionIDToCoalitionNameMapping;
  if (!_coalitionIDToCoalitionNameMapping)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)_coalitionIDToCoalitionNameMapping;
    _coalitionIDToCoalitionNameMapping = (uint64_t)v3;

    v2 = (void *)_coalitionIDToCoalitionNameMapping;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setCoalitionIDToCoalitionNameMapping:(id)a3
{
  if ((id)_coalitionIDToCoalitionNameMapping != a3)
  {
    _coalitionIDToCoalitionNameMapping = [a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

+ (NSMutableDictionary)identifierToAccountingName
{
  v2 = (void *)_identifierToAccountingName;
  if (!_identifierToAccountingName)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = (void *)_identifierToAccountingName;
    _identifierToAccountingName = (uint64_t)v3;

    v2 = (void *)_identifierToAccountingName;
  }
  return (NSMutableDictionary *)v2;
}

+ (void)setIdentifierToAccountingName:(id)a3
{
  if ((id)_identifierToAccountingName != a3)
  {
    _identifierToAccountingName = [a3 mutableCopy];
    MEMORY[0x1F41817F8]();
  }
}

- (unint64_t)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(unint64_t)a3
{
  self->_cpuEnergy = a3;
}

- (unint64_t)cpuEnergyBilledToMe
{
  return self->_cpuEnergyBilledToMe;
}

- (void)setCpuEnergyBilledToMe:(unint64_t)a3
{
  self->_cpuEnergyBilledToMe = a3;
}

- (unint64_t)cpuEnergyBilledToOthers
{
  return self->_cpuEnergyBilledToOthers;
}

- (void)setCpuEnergyBilledToOthers:(unint64_t)a3
{
  self->_cpuEnergyBilledToOthers = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMockData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)computeEnergyDiffUntilNow:andAdjustSnapshotToNow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "after adjusting snapshot self=%@", v2, v3, v4, v5, v6);
}

- (void)computeEnergyDiffUntilNow:andAdjustSnapshotToNow:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "adjusting snapshot self=%@ to now", v2, v3, v4, v5, v6);
}

- (void)computeEnergyDiff:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1A11A5000, v0, v1, "computing energy diff between self=%@ and otherSnapshot=%@");
}

- (void)snapshotCPUEnergy:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, v0, v1, "coalitionID not found, unable to snapshot identifer=%@", v2, v3, v4, v5, v6);
}

- (void)snapshotCPUEnergy:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "Getting cpu energy from coalitions snapshot for  coalitionID=%llu", v2, v3, v4, v5, v6);
}

- (void)getCoalitionIDForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7(&dword_1A11A5000, v0, v1, "coalitionID not found after refresh, for identifer=%@", v2, v3, v4, v5, v6);
}

- (void)getCoalitionIDForIdentifier:.cold.2()
{
  uint64_t v0 = +[PLCPUEnergySnapshot identifierToCoalitionID];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_12(&dword_1A11A5000, v1, v2, "coalitionID found in identifierToCoalitionID for identifier=%@, identifierToCoalitionID=%@", v3, v4, v5, v6, v7);
}

- (void)searchCoalitionsCacheForID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A11A5000, v0, v1, "searching cache for coalitionID for identifier=%@", v2, v3, v4, v5, v6);
}

void __50__PLCPUEnergySnapshot_searchCoalitionsCacheForID___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_1A11A5000, v0, (uint64_t)v0, "identifier received is not equal to accountingIdentifier: identifier=%@, accountingIdentifier=%@", v1);
}

@end