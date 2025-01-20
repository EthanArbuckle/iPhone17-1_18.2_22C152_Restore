@interface NWStatsEntityMapperProcessWatcher
- (BOOL)canonicalizedNames;
- (NWStatsEntityMapperProcessWatcher)init;
- (id)identifierForUUID:(id)a3 derivation:(int *)a4;
- (id)stateDictionary;
- (void)_uuidProcessNameMapPrune;
- (void)noteUUID:(id)a3 forProcessName:(id)a4;
- (void)setCanonicalizedNames:(BOOL)a3;
@end

@implementation NWStatsEntityMapperProcessWatcher

- (id)identifierForUUID:(id)a3 derivation:(int *)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v6)
  {
    v8 = [(NSMutableDictionary *)v7->_uuidProcessNameMap objectForKeyedSubscript:v6];
    if (v8)
    {
      v9 = [MEMORY[0x263EFF910] date];
      [v8 setObject:v9 forKeyedSubscript:@"timestamp"];

      v10 = NSString;
      v11 = [v8 objectForKeyedSubscript:@"procName"];
      v12 = [v10 stringWithString:v11];
    }
    else
    {
      v12 = 0;
    }

    if (!a4) {
      goto LABEL_12;
    }
LABEL_9:
    if (v12) {
      *a4 = 6;
    }
    goto LABEL_12;
  }
  if (!v7->_niluuidProcessName)
  {
    v12 = 0;
    goto LABEL_12;
  }
  v12 = objc_msgSend(NSString, "stringWithString:");
  if (a4) {
    goto LABEL_9;
  }
LABEL_12:
  objc_sync_exit(v7);

  return v12;
}

- (NWStatsEntityMapperProcessWatcher)init
{
  v9.receiver = self;
  v9.super_class = (Class)NWStatsEntityMapperProcessWatcher;
  v2 = [(NWStatsEntityMapperProcessWatcher *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uuidProcessNameMap = v2->_uuidProcessNameMap;
    v2->_uuidProcessNameMap = v3;

    if (!v2->_uuidProcessNameMap)
    {

      v2 = 0;
    }
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26CCB1D50];
    daemonsWithStandardPrefixSet = v2->_daemonsWithStandardPrefixSet;
    v2->_daemonsWithStandardPrefixSet = (NSSet *)v5;

    daemonsWithNonStandardMappings = v2->_daemonsWithNonStandardMappings;
    v2->_daemonsWithNonStandardMappings = (NSDictionary *)&unk_26CCB1DC0;
  }
  return v2;
}

- (void)noteUUID:(id)a3 forProcessName:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v6)
  {
    if ((unint64_t)[(NSMutableDictionary *)v8->_uuidProcessNameMap count] >= 0x65) {
      [(NWStatsEntityMapperProcessWatcher *)v8 _uuidProcessNameMapPrune];
    }
    objc_super v9 = [(NSMutableDictionary *)v8->_uuidProcessNameMap objectForKeyedSubscript:v6];

    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      if (!v10)
      {
        v13 = NStatGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v7;
          _os_log_impl(&dword_21C4BC000, v13, OS_LOG_TYPE_ERROR, "Memory allocation failed for %@", buf, 0xCu);
        }
        goto LABEL_20;
      }
      v11 = v7;
      if (v8->_canonicalizedNames)
      {
        v12 = [(NSSet *)v8->_daemonsWithStandardPrefixSet member:v11];

        if (v12)
        {
          v13 = [[NSString alloc] initWithFormat:@"com.apple.%@", v11];

          v14 = NStatGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v19 = v11;
            __int16 v20 = 2112;
            id v21 = v6;
            __int16 v22 = 2112;
            v23 = v13;
            v15 = "Create canonical mapping for process %@, %@ -> %@";
LABEL_16:
            _os_log_impl(&dword_21C4BC000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0x20u);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
        v16 = [(NSDictionary *)v8->_daemonsWithNonStandardMappings objectForKeyedSubscript:v11];

        if (v16)
        {
          v13 = [(NSDictionary *)v8->_daemonsWithNonStandardMappings objectForKeyedSubscript:v11];

          v14 = NStatGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v19 = v11;
            __int16 v20 = 2112;
            id v21 = v6;
            __int16 v22 = 2112;
            v23 = v13;
            v15 = "Create non-standard mapping for process %@, %@ -> %@";
            goto LABEL_16;
          }
LABEL_17:

LABEL_19:
          [v10 setObject:v13 forKeyedSubscript:@"procName"];
          v17 = [MEMORY[0x263EFF910] date];
          [v10 setObject:v17 forKeyedSubscript:@"timestamp"];

          [(NSMutableDictionary *)v8->_uuidProcessNameMap setObject:v10 forKeyedSubscript:v6];
LABEL_20:

          goto LABEL_21;
        }
      }
      v13 = v11;
      goto LABEL_19;
    }
  }
  else
  {
    objc_storeStrong((id *)&v8->_niluuidProcessName, a4);
  }
LABEL_21:
  objc_sync_exit(v8);
}

- (id)stateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = (void *)[objc_alloc(NSDictionary) initWithDictionary:v4->_uuidProcessNameMap];
  [v3 setObject:v5 forKeyedSubscript:@"ProcessNameMap"];

  objc_sync_exit(v4);
  return v3;
}

- (void)_uuidProcessNameMapPrune
{
  if ((unint64_t)[(NSMutableDictionary *)self->_uuidProcessNameMap count] >= 0x65)
  {
    id v4 = [(NSMutableDictionary *)self->_uuidProcessNameMap keysSortedByValueUsingComparator:&__block_literal_global_771];
    id v3 = objc_msgSend(v4, "subarrayWithRange:", 0, 10);
    [(NSMutableDictionary *)self->_uuidProcessNameMap count];
    [(NSMutableDictionary *)self->_uuidProcessNameMap removeObjectsForKeys:v3];
  }
}

uint64_t __61__NWStatsEntityMapperProcessWatcher__uuidProcessNameMapPrune__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"timestamp"];
  id v6 = [v4 objectForKeyedSubscript:@"timestamp"];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)canonicalizedNames
{
  return self->_canonicalizedNames;
}

- (void)setCanonicalizedNames:(BOOL)a3
{
  self->_canonicalizedNames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonsWithNonStandardMappings, 0);
  objc_storeStrong((id *)&self->_daemonsWithStandardPrefixSet, 0);
  objc_storeStrong((id *)&self->_niluuidProcessName, 0);
  objc_storeStrong((id *)&self->_uuidProcessNameMap, 0);
}

@end