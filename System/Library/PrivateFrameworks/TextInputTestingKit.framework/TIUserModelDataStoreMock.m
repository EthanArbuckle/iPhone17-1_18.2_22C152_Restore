@interface TIUserModelDataStoreMock
- (BOOL)addValue:(id)a3 andSecondaryValue:(id)a4 andRealValue:(id)a5 andProperties:(id)a6 forKey:(id)a7 forInputMode:(id)a8 forDate:(id)a9;
- (BOOL)isValid;
- (BOOL)purgeDataForKey:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5;
- (BOOL)purgeDataForKeyPrefix:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5;
- (BOOL)setDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5;
- (BOOL)updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5;
- (NSDate)durableLastMigrationDate;
- (NSDate)propertiesLastMigrationDate;
- (NSDate)transientLastMigrationDate;
- (TIUserModelDataStoreMock)init;
- (id)getAllKnownInputModes;
- (id)getAllKnownInputModesSinceDate:(id)a3;
- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 fromDate:(id)a5 toDate:(id)a6;
- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5;
- (id)getAllValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5;
- (id)getDailyAndWeeklyValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6;
- (id)getDurableValueForKey:(id)a3;
- (id)getInputModesForKey:(id)a3;
- (int)durableVersion;
- (int)propertiesVersion;
- (int)transientVersion;
- (void)clear;
- (void)setDurableLastMigrationDate:(id)a3;
- (void)setPropertiesLastMigrationDate:(id)a3;
- (void)setTransientLastMigrationDate:(id)a3;
@end

@implementation TIUserModelDataStoreMock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientLastMigrationDate, 0);
  objc_storeStrong((id *)&self->_propertiesLastMigrationDate, 0);
  objc_storeStrong((id *)&self->_durableLastMigrationDate, 0);
  objc_storeStrong((id *)&self->_durableDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (int)transientVersion
{
  return self->_transientVersion;
}

- (void)setTransientLastMigrationDate:(id)a3
{
}

- (NSDate)transientLastMigrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (int)propertiesVersion
{
  return self->_propertiesVersion;
}

- (void)setPropertiesLastMigrationDate:(id)a3
{
}

- (NSDate)propertiesLastMigrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (int)durableVersion
{
  return self->_durableVersion;
}

- (void)setDurableLastMigrationDate:(id)a3
{
}

- (NSDate)durableLastMigrationDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)clear
{
  v3 = [MEMORY[0x263EFF980] array];
  database = self->_database;
  self->_database = v3;

  v5 = [MEMORY[0x263EFF9A0] dictionary];
  durableDatabase = self->_durableDatabase;
  self->_durableDatabase = v5;

  v7 = [MEMORY[0x263EFF910] distantPast];
  propertiesLastMigrationDate = self->_propertiesLastMigrationDate;
  self->_propertiesLastMigrationDate = v7;

  v9 = [MEMORY[0x263EFF910] distantPast];
  durableLastMigrationDate = self->_durableLastMigrationDate;
  self->_durableLastMigrationDate = v9;

  self->_transientLastMigrationDate = [MEMORY[0x263EFF910] distantPast];
  MEMORY[0x270F9A758]();
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 fromDate:(id)a5 toDate:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v35 = a3;
  id v30 = a4;
  id v37 = a5;
  id v36 = a6;
  v10 = self;
  objc_sync_enter(v10);
  v31 = v10;
  id v32 = [MEMORY[0x263EFF980] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = v10->_database;
  uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v11)
  {
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v14 = [v13 creationDate];
        uint64_t v15 = [v14 compare:v37];

        v16 = [v13 creationDate];
        uint64_t v17 = [v16 compare:v36];

        v18 = [v13 key];
        int v19 = [v18 isEqualToString:v35];
        if (v15 == 1) {
          int v20 = v19;
        }
        else {
          int v20 = 0;
        }
        if (v20 == 1)
        {

          if ((unint64_t)(v17 + 1) >= 2) {
            continue;
          }
          id v21 = objc_alloc(MEMORY[0x263F7E6F0]);
          v22 = [v13 lastUpdateDate];
          v23 = [v13 key];
          v24 = [v13 inputMode];
          v25 = [v13 value];
          v26 = [v13 secondaryValue];
          v27 = [v13 realValue];
          v28 = [v13 properties];
          v18 = (void *)[v21 initWithTimestamp:v22 withKey:v23 withInputMode:v24 withValue:v25 withSecondaryValue:v26 withRealValue:v27 withProperties:v28];

          [v32 addObject:v18];
        }
      }
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v31);
  return v32;
}

- (id)getAllValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v24 = a4;
  id v27 = a5;
  v8 = self;
  objc_sync_enter(v8);
  v25 = v8;
  id v26 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obj = v8->_database;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = [v11 key];
        if ([v12 hasPrefix:v30])
        {
          v13 = [v11 creationDate];
          BOOL v14 = [v13 compare:v27] == 1;

          if (!v14) {
            continue;
          }
          id v15 = objc_alloc(MEMORY[0x263F7E6F0]);
          v16 = [v11 lastUpdateDate];
          uint64_t v17 = [v11 key];
          v18 = [v11 inputMode];
          int v19 = [v11 value];
          int v20 = [v11 secondaryValue];
          id v21 = [v11 realValue];
          v22 = [v11 properties];
          v12 = objc_msgSend(v15, "initWithTimestamp:withKey:withInputMode:withValue:withSecondaryValue:withRealValue:withProperties:", v16, v17, v18, v19, v20, v21, v22, v24);

          [v26 addObject:v12];
        }
      }
      uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v25);
  return v26;
}

- (BOOL)updateDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  v12 = [(NSMutableDictionary *)v11->_durableDatabase objectForKey:v9];
  v13 = v12;
  if (v12)
  {
    BOOL v14 = NSNumber;
    id v15 = [(TIMockUserModelDatabaseRow *)v12 value];
    v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v8, "intValue") + objc_msgSend(v15, "intValue"));
    [(TIMockUserModelDatabaseRow *)v13 setValue:v16];

    [(TIMockUserModelDatabaseRow *)v13 setLastUpdateDate:v10];
  }
  else
  {
    uint64_t v17 = [TIMockUserModelDatabaseRow alloc];
    v18 = [NSNumber numberWithInt:0];
    int v19 = [NSNumber numberWithDouble:0.0];
    v13 = [(TIMockUserModelDatabaseRow *)v17 initWithKey:v9 inputMode:@"foo" value:v8 secondaryValue:v18 realValue:v19 properties:0 creationDate:v10 lastUpdateDate:v10];
  }
  [(NSMutableDictionary *)v11->_durableDatabase setObject:v13 forKey:v9];

  objc_sync_exit(v11);
  return 1;
}

- (BOOL)setDurableValue:(id)a3 forKey:(id)a4 forDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  v12 = [(NSMutableDictionary *)v11->_durableDatabase objectForKey:v9];
  v13 = v12;
  if (v12)
  {
    [(TIMockUserModelDatabaseRow *)v12 setValue:v8];
    [(TIMockUserModelDatabaseRow *)v13 setLastUpdateDate:v10];
  }
  else
  {
    BOOL v14 = [TIMockUserModelDatabaseRow alloc];
    id v15 = [NSNumber numberWithInt:0];
    v16 = [NSNumber numberWithDouble:0.0];
    v13 = [(TIMockUserModelDatabaseRow *)v14 initWithKey:v9 inputMode:@"foo" value:v8 secondaryValue:v15 realValue:v16 properties:0 creationDate:v10 lastUpdateDate:v10];
  }
  [(NSMutableDictionary *)v11->_durableDatabase setObject:v13 forKey:v9];

  objc_sync_exit(v11);
  return 1;
}

- (id)getDurableValueForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_durableDatabase objectForKey:v4];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F7E6E8]);
    id v8 = [v6 creationDate];
    id v9 = [v6 lastUpdateDate];
    id v10 = [v6 value];
    uint64_t v11 = (void *)[v7 initWithCreationDate:v8 withLastUpdateDate:v9 withKey:v4 withValue:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  objc_sync_exit(v5);
  return v11;
}

- (id)getAllKnownInputModesSinceDate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5->_database;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isMatchSinceDate:", v4, (void)v15))
        {
          v12 = [v11 inputMode];
          [v6 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v13 = [v6 allObjects];
  }
  else
  {
    v13 = 0;
  }

  objc_sync_exit(v5);
  return v13;
}

- (id)getAllKnownInputModes
{
  return [(TIUserModelDataStoreMock *)self getAllKnownInputModesSinceDate:0];
}

- (id)getInputModesForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [MEMORY[0x263EFF9C0] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5->_database;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isMatchForKey:forInputMode:sinceDate:", v4, 0, 0, (void)v15))
        {
          v12 = [v11 inputMode];
          [v6 addObject:v12];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    v13 = [v6 allObjects];
  }
  else
  {
    v13 = 0;
  }

  objc_sync_exit(v5);
  return v13;
}

- (id)getDailyAndWeeklyValuesForKeyPrefix:(id)a3 forInputMode:(id)a4 weeklyKeySuffixes:(id)a5 endDate:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  v25 = self;
  objc_sync_enter(v25);
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = v25->_database;
  uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  id v26 = (void *)v10;
  if (v11)
  {
    uint64_t v28 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v28) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v13 isMatchForKeyPrefix:v32 forInputMode:v31 weeklyKeySuffixes:v30 endDate:v29])
        {
          id v14 = objc_alloc(MEMORY[0x263F7E6F0]);
          long long v15 = [v13 lastUpdateDate];
          long long v16 = [v13 key];
          long long v17 = [v13 inputMode];
          long long v18 = [v13 value];
          int v19 = [v13 secondaryValue];
          uint64_t v20 = [v13 realValue];
          id v21 = [v13 properties];
          v22 = (void *)[v14 initWithTimestamp:v15 withKey:v16 withInputMode:v17 withValue:v18 withSecondaryValue:v19 withRealValue:v20 withProperties:v21];

          [v26 addObject:v22];
        }
      }
      uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v11);
  }

  if ([v26 count]) {
    id v23 = v26;
  }
  else {
    id v23 = 0;
  }

  objc_sync_exit(v25);
  return v23;
}

- (id)getAllValuesForKey:(id)a3 forInputMode:(id)a4 sinceDate:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v24 = self;
  objc_sync_enter(v24);
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = v24->_database;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  id v26 = (void *)v8;
  if (v9)
  {
    uint64_t v10 = *(void *)v33;
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      uint64_t v27 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
        if ([v12 isMatchForKey:v31 forInputMode:v30 sinceDate:v29])
        {
          id v13 = objc_alloc(MEMORY[0x263F7E6F0]);
          id v14 = [v12 lastUpdateDate];
          long long v15 = [v12 key];
          long long v16 = [v12 inputMode];
          long long v17 = [v12 value];
          long long v18 = [v12 secondaryValue];
          int v19 = [v12 realValue];
          uint64_t v20 = [v12 properties];
          id v21 = (void *)[v13 initWithTimestamp:v14 withKey:v15 withInputMode:v16 withValue:v17 withSecondaryValue:v18 withRealValue:v19 withProperties:v20];

          [v26 addObject:v21];
          uint64_t v9 = v27;
          uint64_t v10 = v25;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  if ([v26 count]) {
    id v22 = v26;
  }
  else {
    id v22 = 0;
  }

  objc_sync_exit(v24);
  return v22;
}

- (BOOL)purgeDataForKeyPrefix:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  id v22 = v11;
  v12 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = v11->_database;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v17 = [v16 isMatchForKeyPrefix:v8 forInputMode:v9 sinceDate:0] ^ 1;
        if (!v10) {
          LOBYTE(v17) = 1;
        }
        if ((v17 & 1) == 0)
        {
          long long v18 = [v16 lastUpdateDate];
          BOOL v19 = [v18 compare:v10] == 1;

          if (!v19) {
            continue;
          }
        }
        [(NSMutableArray *)v12 addObject:v16];
      }
      uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  database = v22->_database;
  v22->_database = v12;

  objc_sync_exit(v22);
  return 1;
}

- (BOOL)purgeDataForKey:(id)a3 forInputMode:(id)a4 beforeDate:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  objc_sync_enter(v11);
  id v22 = v11;
  v12 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obj = v11->_database;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        int v17 = [v16 isMatchForKey:v8 forInputMode:v9 sinceDate:0] ^ 1;
        if (!v10) {
          LOBYTE(v17) = 1;
        }
        if ((v17 & 1) == 0)
        {
          long long v18 = [v16 lastUpdateDate];
          BOOL v19 = [v18 compare:v10] == 1;

          if (!v19) {
            continue;
          }
        }
        [(NSMutableArray *)v12 addObject:v16];
      }
      uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  database = v22->_database;
  v22->_database = v12;

  objc_sync_exit(v22);
  return 1;
}

- (BOOL)addValue:(id)a3 andSecondaryValue:(id)a4 andRealValue:(id)a5 andProperties:(id)a6 forKey:(id)a7 forInputMode:(id)a8 forDate:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = self;
  objc_sync_enter(v22);
  database = v22->_database;
  long long v24 = [[TIMockUserModelDatabaseRow alloc] initWithKey:v19 inputMode:v20 value:v15 secondaryValue:v16 realValue:v17 properties:v18 creationDate:v21 lastUpdateDate:v21];
  [(NSMutableArray *)database addObject:v24];

  objc_sync_exit(v22);
  return 1;
}

- (BOOL)isValid
{
  return 1;
}

- (TIUserModelDataStoreMock)init
{
  v14.receiver = self;
  v14.super_class = (Class)TIUserModelDataStoreMock;
  v2 = [(TIUserModelDataStoreMock *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    database = v2->_database;
    v2->_database = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    durableDatabase = v2->_durableDatabase;
    v2->_durableDatabase = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF910] distantPast];
    propertiesLastMigrationDate = v2->_propertiesLastMigrationDate;
    v2->_propertiesLastMigrationDate = (NSDate *)v7;

    uint64_t v9 = [MEMORY[0x263EFF910] distantPast];
    durableLastMigrationDate = v2->_durableLastMigrationDate;
    v2->_durableLastMigrationDate = (NSDate *)v9;

    uint64_t v11 = [MEMORY[0x263EFF910] distantPast];
    transientLastMigrationDate = v2->_transientLastMigrationDate;
    v2->_transientLastMigrationDate = (NSDate *)v11;
  }
  return v2;
}

@end