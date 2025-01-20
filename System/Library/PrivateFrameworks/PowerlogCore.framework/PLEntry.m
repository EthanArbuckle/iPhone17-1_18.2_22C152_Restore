@interface PLEntry
+ (Class)classForEntryKey:(id)a3;
+ (id)entryKey;
+ (id)entryWithEntryKey:(id)a3 withData:(id)a4;
+ (id)entryWithEntryKey:(id)a3 withRawData:(id)a4;
+ (id)summarizeAggregateEntries:(id)a3;
+ (id)summarizeAggregateEntries:(id)a3 withPrimaryKeys:(id)a4;
+ (signed)dataFormatForMetric:(id)a3 auxiliaryMetrics:(id)a4;
+ (void)load;
+ (void)registerEntry:(Class)a3;
- (BOOL)existsInDB;
- (BOOL)filterEntryLogging;
- (BOOL)hasAppIdentifierKeys;
- (BOOL)hasArrayKeys;
- (BOOL)hasDMAKeys;
- (BOOL)hasDynamicKeys;
- (BOOL)isErrorEntry;
- (BOOL)isKeyAggregateValue:(id)a3;
- (BOOL)isKeyDynamic:(id)a3;
- (BOOL)isPPSEnabled;
- (BOOL)writeToDB;
- (NSArray)DMAKeys;
- (NSArray)arrayKeys;
- (NSArray)definedKeys;
- (NSArray)dynamicKeys;
- (NSDate)entryDate;
- (NSDictionary)entryDefinition;
- (NSMutableArray)allValues;
- (NSMutableArray)keys;
- (NSMutableDictionary)dictionary;
- (NSString)entryKey;
- (OS_dispatch_semaphore)sem;
- (PLEntry)init;
- (PLEntry)initWithEntryDate:(id)a3;
- (PLEntry)initWithEntryKey:(id)a3;
- (PLEntry)initWithEntryKey:(id)a3 withData:(id)a4;
- (PLEntry)initWithEntryKey:(id)a3 withDate:(id)a4;
- (PLEntry)initWithEntryKey:(id)a3 withRawData:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)definitionForKey:(id)a3;
- (id)description;
- (id)descriptionRespectingAllowlist:(BOOL)a3;
- (id)initEntryWithData:(id)a3;
- (id)initEntryWithRawData:(id)a3;
- (id)keyValuePathForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (id)serialized;
- (id)serializedForJSON;
- (id)subEntryKey;
- (id)unitForKey:(id)a3;
- (int)staticArraySizeForKey:(id)a3;
- (int64_t)compare:(id)a3;
- (int64_t)compare:(id)a3 options:(signed __int16)a4;
- (int64_t)entryID;
- (signed)formaterForKey:(id)a3;
- (void)checkOverridesEntryDateWithNowDate:(id)a3;
- (void)loadDynamicKeys;
- (void)removeObjectForKey:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setDynamicObjectsFromRawData:(id)a3;
- (void)setEntryDate:(id)a3;
- (void)setEntryDefinition:(id)a3;
- (void)setEntryID:(int64_t)a3;
- (void)setEntryKey:(id)a3;
- (void)setExistsInDB:(BOOL)a3;
- (void)setIsErrorEntry:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObjectsFromData:(id)a3;
- (void)setObjectsFromRawData:(id)a3;
- (void)setObjectsUsingMetricsFromData:(id)a3;
- (void)setSem:(id)a3;
- (void)setWriteToDB:(BOOL)a3;
@end

@implementation PLEntry

void __33__PLEntry_setObjectsFromRawData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"CalculatedValue"];
  if (([v6 BOOLValue] & 1) == 0)
  {
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v18];

    if (v7) {
      goto LABEL_16;
    }
    v8 = [v5 objectForKeyedSubscript:@"Type"];
    int v9 = [v8 shortValue];

    v10 = [v5 objectForKeyedSubscript:@"KeyValuePath"];

    if (v10)
    {
      v11 = [v5 objectForKeyedSubscript:@"KeyValuePath"];
      v12 = [v11 componentsJoinedByString:@"."];

      v6 = [*(id *)(a1 + 40) valueForKeyPath:v12];
    }
    else
    {
      v6 = [*(id *)(a1 + 40) objectForKey:v18];
    }
    id v13 = v18;
    if (v6 && v9 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = [v5 objectForKeyedSubscript:@"isCFAbsoluteTime"];
        int v15 = [v14 BOOLValue];

        v16 = (void *)MEMORY[0x1E4F1C9C8];
        [v6 doubleValue];
        if (v15) {
          objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        }
        else {
        uint64_t v17 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
        }

        v6 = (void *)v17;
      }
      id v13 = v18;
    }
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v13];
  }

LABEL_16:
}

- (void)setEntryID:(int64_t)a3
{
  self->_entryID = a3;
}

- (BOOL)hasDynamicKeys
{
  v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    BOOL v6 = +[PPSEntryKey hasDynamicKeys:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    BOOL v6 = +[PLEntryDefinition hasDynamicKeysForEntryDefinition:v5];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)hasArrayKeys
{
  v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    BOOL v6 = +[PPSEntryKey hasArrayKeys:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    BOOL v6 = +[PLEntryDefinition hasArrayKeysForEntryDefinition:v5];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setExistsInDB:(BOOL)a3
{
  self->_existsInDB = a3;
}

- (signed)formaterForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEntry *)self entryKey];
  BOOL v6 = +[PPSEntryKey PPSEnabled:v5];

  if (v6)
  {
    BOOL v7 = [(PLEntry *)self entryKey];
    v8 = +[PPSEntryKey subsystemForEntryKey:v7];

    int v9 = [(PLEntry *)self entryKey];
    v10 = +[PPSEntryKey categoryForEntryKey:v9];

    v11 = [MEMORY[0x1E4F89D08] getMetadataForSubsystem:v8 category:v10 name:v4];
    v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "datatype"));
    signed __int16 v13 = +[PLValueUtilties formatterFromDataType:v12];
  }
  else
  {
    v14 = [(PLEntry *)self definitionForKey:v4];
    v8 = [v14 objectForKeyedSubscript:@"Type"];

    if (v8) {
      signed __int16 v13 = [v8 shortValue];
    }
    else {
      signed __int16 v13 = 0x8000;
    }
  }

  return v13;
}

- (NSString)entryKey
{
  return self->_entryKey;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  BOOL v7 = [(PLEntry *)self sem];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  if (!v10)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v8 = [(PLEntry *)self dictionary];
  [v8 setObject:v10 forKeyedSubscript:v6];

  int v9 = [(PLEntry *)self sem];
  dispatch_semaphore_signal(v9);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEntry *)self sem];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(PLEntry *)self dictionary];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  v8 = [MEMORY[0x1E4F1CA98] null];

  if (v7 == v8)
  {

    goto LABEL_6;
  }
  if (v7) {
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"timestamp"])
  {
    int v9 = NSNumber;
    id v10 = [(PLEntry *)self entryDate];
    [v10 timeIntervalSince1970];
    BOOL v7 = objc_msgSend(v9, "numberWithDouble:");

    goto LABEL_13;
  }
  if (![v4 isEqualToString:@"entryDate"])
  {
    if (([v4 isEqualToString:@"ID"] & 1) != 0
      || [v4 isEqualToString:@"entryID"])
    {
      uint64_t v11 = objc_msgSend(NSNumber, "numberWithLongLong:", -[PLEntry entryID](self, "entryID"));
      goto LABEL_12;
    }
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = [(PLEntry *)self entryDate];
LABEL_12:
  BOOL v7 = (void *)v11;
LABEL_13:
  v12 = [(PLEntry *)self sem];
  dispatch_semaphore_signal(v12);

  return v7;
}

- (OS_dispatch_semaphore)sem
{
  if (sem_onceToken != -1) {
    dispatch_once(&sem_onceToken, &__block_literal_global_28_1);
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)sem_masterSem, 0xFFFFFFFFFFFFFFFFLL);
  sem = self->_sem;
  if (!sem)
  {
    id v4 = (void *)sem_entryKeyToSem;
    id v5 = [(PLEntry *)self entryKey];
    id v6 = [v4 objectForKeyedSubscript:v5];
    BOOL v7 = self->_sem;
    self->_sem = v6;

    sem = self->_sem;
    if (!sem)
    {
      v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
      int v9 = self->_sem;
      self->_sem = v8;

      id v10 = self->_sem;
      uint64_t v11 = (void *)sem_entryKeyToSem;
      v12 = [(PLEntry *)self entryKey];
      [v11 setObject:v10 forKeyedSubscript:v12];

      sem = self->_sem;
    }
  }
  signed __int16 v13 = sem;
  dispatch_semaphore_signal((dispatch_semaphore_t)sem_masterSem);
  return v13;
}

- (NSMutableDictionary)dictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (id)definitionForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEntry *)self entryDefinition];
  id v6 = [v5 objectForKeyedSubscript:@"Keys"];
  BOOL v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (NSDictionary)entryDefinition
{
  entryDefinition = self->_entryDefinition;
  if (!entryDefinition)
  {
    id v4 = [(PLEntry *)self entryKey];
    id v5 = +[PLEntryDefinition definitionForEntryKey:v4];
    id v6 = self->_entryDefinition;
    self->_entryDefinition = v5;

    entryDefinition = self->_entryDefinition;
  }
  return entryDefinition;
}

- (id)subEntryKey
{
  v3 = [(PLEntry *)self entryDefinition];
  id v4 = +[PLEntryDefinition subEntryKeyKeyForEntryDefinition:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self objectForKeyedSubscript:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)checkOverridesEntryDateWithNowDate:(id)a3
{
  id v7 = a3;
  id v4 = [(PLEntry *)self entryDefinition];
  BOOL v5 = +[PLEntryDefinition overridesEntryDateForEntryDefinition:v4];

  if (v5)
  {
    uint64_t v6 = (uint64_t)v7;
    if (!v7)
    {
      uint64_t v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    }
    id v7 = (id)v6;
    [(PLEntry *)self setObject:v6 forKeyedSubscript:@"timestampLogged"];
  }
}

- (BOOL)isPPSEnabled
{
  v2 = [(PLEntry *)self entryKey];
  BOOL v3 = +[PPSEntryKey PPSEnabled:v2];

  return v3;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (PLEntry)initWithEntryKey:(id)a3 withRawData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(PLEntry *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryKey, a3);
    [(PLEntry *)v10 setObjectsFromRawData:v8];
    if (v10->_entryDate)
    {
      uint64_t v11 = 0;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      entryDate = v10->_entryDate;
      v10->_entryDate = (NSDate *)v12;

      uint64_t v11 = v10->_entryDate;
    }
    [(PLEntry *)v10 checkOverridesEntryDateWithNowDate:v11];
  }

  return v10;
}

- (PLEntry)initWithEntryKey:(id)a3 withDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(PLEntry *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryDate, a4);
    objc_storeStrong((id *)&v10->_entryKey, a3);
    [(PLEntry *)v10 checkOverridesEntryDateWithNowDate:0];
  }

  return v10;
}

- (PLEntry)initWithEntryKey:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PLEntry *)self init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    entryDate = v6->_entryDate;
    v6->_entryDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_entryKey, a3);
    [(PLEntry *)v6 checkOverridesEntryDateWithNowDate:v6->_entryDate];
  }

  return v6;
}

- (PLEntry)initWithEntryDate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLEntry;
  BOOL v3 = [(PLEntry *)&v8 init];
  if (v3)
  {
    if (initWithEntryDate__onceToken != -1) {
      dispatch_once(&initWithEntryDate__onceToken, &__block_literal_global_30_0);
    }
    uint64_t v4 = objc_opt_new();
    id v5 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v4;

    uint64_t v6 = (void *)*((void *)v3 + 3);
    *((void *)v3 + 3) = 0;

    *((void *)v3 + 6) = -1;
    *(_WORD *)(v3 + 9) = 256;
  }
  return (PLEntry *)v3;
}

- (PLEntry)init
{
  return [(PLEntry *)self initWithEntryDate:0];
}

- (BOOL)isErrorEntry
{
  return self->_isErrorEntry;
}

- (BOOL)filterEntryLogging
{
  BOOL v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    BOOL v6 = +[PPSEntryKey filterEntryLoggingForEntryKey:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    BOOL v6 = +[PLEntryDefinition filterEntryLoggingForEntryDefinition:v5];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)hasDMAKeys
{
  BOOL v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    BOOL v6 = +[PPSEntryKey hasDMAKeys:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    BOOL v6 = +[PLEntryDefinition hasDMAKeysForEntryDefinition:v5];
  }
  BOOL v7 = v6;

  return v7;
}

- (void)setObjectsFromRawData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [(PLEntry *)self entryDefinition];
      BOOL v6 = [v5 objectForKeyedSubscript:@"Keys"];

      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __33__PLEntry_setObjectsFromRawData___block_invoke;
      uint64_t v17 = &unk_1E6254330;
      id v18 = self;
      id v7 = v4;
      id v19 = v7;
      [v6 enumerateKeysAndObjectsUsingBlock:&v14];
      objc_super v8 = objc_msgSend(v7, "objectForKey:", @"entryDate", v14, v15, v16, v17, v18);

      if (v8)
      {
        int v9 = [v7 objectForKeyedSubscript:@"entryDate"];
        entryDate = self->_entryDate;
        self->_entryDate = v9;
      }
      else
      {
        uint64_t v11 = [v7 objectForKey:@"__pl_internal_timeSensitiveSystemDate"];

        if (!v11)
        {
LABEL_8:

          goto LABEL_9;
        }
        entryDate = [v7 objectForKey:@"__pl_internal_timeSensitiveSystemDate"];
        uint64_t v12 = [entryDate convertFromSystemToMonotonic];
        signed __int16 v13 = self->_entryDate;
        self->_entryDate = v12;
      }
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (int64_t)entryID
{
  return self->_entryID;
}

- (BOOL)existsInDB
{
  return self->_existsInDB;
}

- (BOOL)writeToDB
{
  return self->_writeToDB;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_entryKey, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
  objc_storeStrong((id *)&self->_entryDefinition, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (void)setEntryDate:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(PLEntry *)self entryKey];
  BOOL v6 = [(PLEntry *)self entryDate];
  id v7 = (void *)[v4 initWithEntryKey:v5 withDate:v6];

  objc_super v8 = [(PLEntry *)self dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __24__PLEntry_copyWithZone___block_invoke;
  v11[3] = &unk_1E62540E8;
  id v9 = v7;
  id v12 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];

  return v9;
}

- (void)setWriteToDB:(BOOL)a3
{
  self->_writeToDB = a3;
}

- (int64_t)compare:(id)a3 options:(signed __int16)a4
{
  int v4 = a4;
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PLEntry *)self entryDate];
  objc_super v8 = [v6 entryDate];
  int64_t v9 = [v7 compare:v8];

  v199 = v6;
  if (v4 == 2 && PLEntryDebug)
  {
    id v10 = [NSString stringWithFormat:@"tolerance in play"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
    id v12 = [v11 lastPathComponent];
    signed __int16 v13 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
    +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:547];

    uint64_t v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }

    id v6 = v199;
  }
  else if (v4 == 1)
  {
    if (!PLEntryDebug) {
      goto LABEL_22;
    }
    uint64_t v15 = NSString;
    v16 = [(PLEntry *)self entryDate];
    uint64_t v17 = [v6 entryDate];
    uint64_t v18 = [v15 stringWithFormat:@"PLEntry.compare date: self.date=%@ other.date=%@", v16, v17];

    id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
    v20 = [v19 lastPathComponent];
    v21 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
    id obj = (id)v18;
    +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:550];

    v22 = PLLogCommon();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
LABEL_17:
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    goto LABEL_18;
  }
  v23 = [(PLEntry *)self keys];
  uint64_t v24 = [v23 count];
  v25 = [v6 keys];
  uint64_t v26 = [v25 count];

  if (v24 != v26)
  {
    if (!PLEntryDebug) {
      goto LABEL_22;
    }
    v37 = NSString;
    v38 = [(PLEntry *)self keys];
    uint64_t v39 = [v38 count];
    v40 = [v6 keys];
    uint64_t v41 = objc_msgSend(v37, "stringWithFormat:", @"PLEntry.compare key count: self.count=%lu other.count=%lu", v39, objc_msgSend(v40, "count"));

    v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
    v43 = [v42 lastPathComponent];
    v44 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
    id obj = (id)v41;
    +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:555];

    v22 = PLLogCommon();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v27 = [(PLEntry *)self entryKey];
  v28 = [v6 entryKey];
  uint64_t v29 = [v27 caseInsensitiveCompare:v28];

  if (v29)
  {
    if (!PLEntryDebug) {
      goto LABEL_22;
    }
    v30 = NSString;
    v31 = [(PLEntry *)self entryKey];
    v32 = [v6 entryKey];
    uint64_t v33 = [v30 stringWithFormat:@"PLEntry.compare key: self.key=%@ other.key=%@", v31, v32];

    v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
    v35 = [v34 lastPathComponent];
    v36 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
    id obj = (id)v33;
    +[PLCoreStorage logMessage:v33 fromFile:v35 fromFunction:v36 fromLineNumber:560];

    v22 = PLLogCommon();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  int v196 = v4;
  int64_t v193 = v9;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  id obj = [(PLEntry *)self keys];
  uint64_t v194 = [obj countByEnumeratingWithState:&v200 objects:v206 count:16];
  if (!v194)
  {
LABEL_108:

    if (PLEntryDebug)
    {
      v45 = [NSString stringWithFormat:@"PLEntry.compare NSOrderedSame!"];
      v147 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
      v148 = [v147 lastPathComponent];
      v149 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
      +[PLCoreStorage logMessage:v45 fromFile:v148 fromFunction:v149 fromLineNumber:692];

      v49 = PLLogCommon();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
      int64_t v9 = 0;
LABEL_21:
    }
    else
    {
      int64_t v9 = 0;
    }
    goto LABEL_22;
  }
  uint64_t v195 = *(void *)v201;
LABEL_25:
  uint64_t v51 = 0;
  while (1)
  {
    if (*(void *)v201 != v195) {
      objc_enumerationMutation(obj);
    }
    uint64_t v52 = *(void *)(*((void *)&v200 + 1) + 8 * v51);
    v53 = [(PLEntry *)self entryDefinition];
    v54 = +[PLEntryDefinition keyConfigsForEntryDefinition:v53];
    v55 = [v54 objectForKeyedSubscript:v52];
    v22 = [v55 objectForKeyedSubscript:@"FilterEntryLoggingTolerances"];

    BOOL v57 = v196 == 2 && v22 != 0;
    if (PLEntryDebug && v57)
    {
      v58 = [NSString stringWithFormat:@"key=%@ toleranceDefinition=%@", v52, v22];
      v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
      v60 = [v59 lastPathComponent];
      v61 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
      +[PLCoreStorage logMessage:v58 fromFile:v60 fromFunction:v61 fromLineNumber:567];

      v62 = PLLogCommon();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v205 = v58;
        _os_log_debug_impl(&dword_1BBD2F000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    id v6 = v199;
    if (v57)
    {
      v63 = [v22 objectForKeyedSubscript:@"Ignore"];
      v64 = v63;
      if (v63 && ([v63 BOOLValue] & 1) != 0) {
        goto LABEL_85;
      }
    }
    v65 = [(PLEntry *)self objectForKeyedSubscript:v52];
    if (v65)
    {
    }
    else
    {
      v66 = [v199 objectForKeyedSubscript:v52];

      if (!v66) {
        goto LABEL_86;
      }
    }
    v67 = [v199 objectForKeyedSubscript:v52];

    if (!v67)
    {
      if (!PLEntryDebug) {
        goto LABEL_141;
      }
      v150 = NSString;
      v151 = [(PLEntry *)self objectForKeyedSubscript:v52];
      v152 = [v199 objectForKeyedSubscript:v52];
      v153 = [v150 stringWithFormat:@"PLEntry.compare(%@) nil value: self.value=%@ other.value=%@", v52, v151, v152];

      v154 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
      v155 = [v154 lastPathComponent];
      v156 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
      +[PLCoreStorage logMessage:v153 fromFile:v155 fromFunction:v156 fromLineNumber:579];

      v157 = PLLogCommon();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_114;
      }
      goto LABEL_133;
    }
    v68 = [(PLEntry *)self objectForKeyedSubscript:v52];
    v69 = [v199 objectForKeyedSubscript:v52];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (!PLEntryDebug) {
        goto LABEL_141;
      }
      v158 = NSString;
      v159 = [(PLEntry *)self objectForKeyedSubscript:v52];
      v160 = (objc_class *)objc_opt_class();
      v161 = NSStringFromClass(v160);
      v162 = [v199 objectForKeyedSubscript:v52];
      v163 = (objc_class *)objc_opt_class();
      v164 = NSStringFromClass(v163);
      v153 = [v158 stringWithFormat:@"PLEntry.compare(%@) class value: self.value.class=%@ other.value.class=%@", v52, v161, v164];

      v165 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
      v166 = [v165 lastPathComponent];
      v167 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
      +[PLCoreStorage logMessage:v153 fromFile:v166 fromFunction:v167 fromLineNumber:584];

      v157 = PLLogCommon();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
LABEL_131:
      }
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
LABEL_132:
      id v6 = v199;
      goto LABEL_133;
    }
    v71 = [(PLEntry *)self objectForKeyedSubscript:v52];
    if (v57)
    {
      objc_opt_class();
      char v72 = objc_opt_isKindOfClass();

      v73 = [(PLEntry *)self objectForKeyedSubscript:v52];
      v74 = v73;
      if (v72)
      {
        [v73 doubleValue];
        double v76 = v75;

        v77 = [v199 objectForKeyedSubscript:v52];
        [v77 doubleValue];
      }
      else
      {
        objc_opt_class();
        char v84 = objc_opt_isKindOfClass();

        if ((v84 & 1) == 0)
        {
          if (!PLEntryDebug) {
            goto LABEL_86;
          }
          v117 = NSString;
          v118 = [(PLEntry *)self objectForKeyedSubscript:v52];
          v119 = (objc_class *)objc_opt_class();
          v120 = NSStringFromClass(v119);
          v64 = [v117 stringWithFormat:@"bailing on class %@", v120];

          v121 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
          v122 = [v121 lastPathComponent];
          v123 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
          +[PLCoreStorage logMessage:v64 fromFile:v122 fromFunction:v123 fromLineNumber:603];

          v116 = PLLogCommon();
          if (!os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_84;
          }
LABEL_97:
          *(_DWORD *)buf = 138412290;
          v205 = v64;
          _os_log_debug_impl(&dword_1BBD2F000, v116, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_84;
        }
        v85 = [(PLEntry *)self objectForKeyedSubscript:v52];
        [v85 timeIntervalSince1970];
        double v76 = v86;

        v77 = [v199 objectForKeyedSubscript:v52];
        [v77 timeIntervalSince1970];
      }
      double v87 = v78;

      v88 = [v22 objectForKeyedSubscript:@"SpecialCase"];

      if (v88)
      {
        v89 = [v22 objectForKeyedSubscript:@"SpecialCase"];
        [v89 doubleValue];
        double v91 = v90;

        if (PLEntryDebug)
        {
          v92 = objc_msgSend(NSString, "stringWithFormat:", @"specialCase! specialCase=%f thisValue=%f otherValue=%f", *(void *)&v91, *(void *)&v76, *(void *)&v87);
          v93 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
          v94 = [v93 lastPathComponent];
          v95 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
          +[PLCoreStorage logMessage:v92 fromFile:v94 fromFunction:v95 fromLineNumber:608];

          v96 = PLLogCommon();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v205 = v92;
            _os_log_debug_impl(&dword_1BBD2F000, v96, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v6 = v199;
        }
        BOOL v97 = v87 == v91 || v76 == v91;
        if (v97 && v76 != v87)
        {
          if (!PLEntryDebug) {
            goto LABEL_141;
          }
          v153 = [NSString stringWithFormat:@"hit specialCase!"];
          v190 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
          v191 = [v190 lastPathComponent];
          v192 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
          +[PLCoreStorage logMessage:v153 fromFile:v191 fromFunction:v192 fromLineNumber:610];

          v157 = PLLogCommon();
          int64_t v9 = v193;
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_137;
          }
          goto LABEL_134;
        }
      }
      v98 = [v22 objectForKeyedSubscript:@"ChangeBy"];

      if (v98)
      {
        v99 = [v22 objectForKeyedSubscript:@"ChangeBy"];
        [v99 doubleValue];
        double v101 = v100;

        double v102 = v76 - v101;
LABEL_70:
        double v103 = v76 + v101;
        goto LABEL_73;
      }
      v104 = [v22 objectForKeyedSubscript:@"ChangePercent"];

      if (v104)
      {
        v105 = [v22 objectForKeyedSubscript:@"ChangePercent"];
        [v105 doubleValue];
        double v107 = v106;

        double v102 = v76 - v107 * v76;
        double v103 = v76 + v107 * v76;
        goto LABEL_73;
      }
      v124 = [v22 objectForKeyedSubscript:@"ChangeByUpper"];
      if (v124)
      {

LABEL_91:
        v126 = [v22 objectForKeyedSubscript:@"ChangeByLower"];

        double v102 = v76;
        if (v126)
        {
          v127 = [v22 objectForKeyedSubscript:@"ChangeByLower"];
          [v127 doubleValue];
          double v129 = v128;

          double v102 = v76 - v129;
        }
        v130 = [v22 objectForKeyedSubscript:@"ChangeByUpper"];

        if (v130)
        {
          v131 = [v22 objectForKeyedSubscript:@"ChangeByUpper"];
          [v131 doubleValue];
          double v101 = v132;

          goto LABEL_70;
        }
LABEL_103:
        double v103 = v76;
        goto LABEL_73;
      }
      v125 = [v22 objectForKeyedSubscript:@"ChangeByLower"];

      if (v125) {
        goto LABEL_91;
      }
      v133 = [v22 objectForKeyedSubscript:@"ChangePercentUpper"];
      if (v133)
      {

LABEL_99:
        v135 = [v22 objectForKeyedSubscript:@"ChangePercentLower"];

        double v102 = v76;
        if (v135)
        {
          v136 = [v22 objectForKeyedSubscript:@"ChangePercentLower"];
          [v136 doubleValue];
          double v138 = v137;

          double v102 = v76 - v76 * v138;
        }
        v139 = [v22 objectForKeyedSubscript:@"ChangePercentUpper"];

        if (!v139) {
          goto LABEL_103;
        }
        v140 = [v22 objectForKeyedSubscript:@"ChangePercentUpper"];
        [v140 doubleValue];
        double v142 = v141;

        double v103 = v76 + v76 * v142;
LABEL_73:
        if (PLEntryDebug)
        {
          v108 = [NSString stringWithFormat:@"key=%@ thisValue=%f otherValue=%f lowerBound=%f upperBound=%f", v52, *(void *)&v76, *(void *)&v87, *(void *)&v102, *(void *)&v103];
          v109 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
          v110 = [v109 lastPathComponent];
          v111 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
          +[PLCoreStorage logMessage:v108 fromFile:v110 fromFunction:v111 fromLineNumber:661];

          v112 = PLLogCommon();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v205 = v108;
            _os_log_debug_impl(&dword_1BBD2F000, v112, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          id v6 = v199;
        }
        if (v102 <= v87 && v87 <= v103)
        {
          if (!PLEntryDebug) {
            goto LABEL_86;
          }
          v64 = [NSString stringWithFormat:@"inside tolerance"];
          v113 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
          v114 = [v113 lastPathComponent];
          v115 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
          +[PLCoreStorage logMessage:v64 fromFile:v114 fromFunction:v115 fromLineNumber:663];

          v116 = PLLogCommon();
          if (!os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_84;
          }
          goto LABEL_97;
        }
        if (!PLEntryDebug) {
          goto LABEL_141;
        }
        v153 = [NSString stringWithFormat:@"outside tolerance"];
        v187 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
        v188 = [v187 lastPathComponent];
        v189 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
        +[PLCoreStorage logMessage:v153 fromFile:v188 fromFunction:v189 fromLineNumber:666];

        v157 = PLLogCommon();
        int64_t v9 = v193;
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
LABEL_137:
        }
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
LABEL_134:

        goto LABEL_18;
      }
      v134 = [v22 objectForKeyedSubscript:@"ChangePercentLower"];

      if (v134) {
        goto LABEL_99;
      }
      if (PLEntryDebug)
      {
        v64 = [NSString stringWithFormat:@"Bailing on no matched tolerance..."];
        v143 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
        v144 = [v143 lastPathComponent];
        v145 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
        +[PLCoreStorage logMessage:v64 fromFile:v144 fromFunction:v145 fromLineNumber:657];

        v116 = PLLogCommon();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_97;
        }
LABEL_84:
        id v6 = v199;

LABEL_85:
        goto LABEL_86;
      }
      goto LABEL_86;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_120:
      if (!PLEntryDebug) {
        goto LABEL_141;
      }
      v168 = NSString;
      v169 = [(PLEntry *)self objectForKeyedSubscript:v52];
      if (objc_opt_respondsToSelector()) {
        v170 = @"YES";
      }
      else {
        v170 = @"NO";
      }
      v171 = [v199 objectForKeyedSubscript:v52];
      if (objc_opt_respondsToSelector()) {
        v172 = @"YES";
      }
      else {
        v172 = @"NO";
      }
      v153 = [v168 stringWithFormat:@"PLEntry.compare(%@) respondsToSelector: self.respondsToSelector=%@ other.respondsToSelector=%@", v52, v170, v172];

      v173 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
      v174 = [v173 lastPathComponent];
      v175 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
      +[PLCoreStorage logMessage:v153 fromFile:v174 fromFunction:v175 fromLineNumber:681];

      v157 = PLLogCommon();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
LABEL_114:
      }
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
LABEL_133:
      int64_t v9 = v193;
      goto LABEL_134;
    }
    v79 = [v199 objectForKeyedSubscript:v52];
    char v80 = objc_opt_respondsToSelector();

    if ((v80 & 1) == 0) {
      goto LABEL_120;
    }
    v81 = [(PLEntry *)self objectForKeyedSubscript:v52];
    v82 = [v199 objectForKeyedSubscript:v52];
    uint64_t v83 = [v81 compare:v82];

    if (v83) {
      break;
    }
LABEL_86:

    if (v194 == ++v51)
    {
      uint64_t v146 = [obj countByEnumeratingWithState:&v200 objects:v206 count:16];
      uint64_t v194 = v146;
      if (!v146) {
        goto LABEL_108;
      }
      goto LABEL_25;
    }
  }
  if (PLEntryDebug)
  {
    v197 = NSString;
    v176 = [(PLEntry *)self objectForKeyedSubscript:v52];
    v177 = (objc_class *)objc_opt_class();
    v178 = NSStringFromClass(v177);
    v179 = [(PLEntry *)self objectForKeyedSubscript:v52];
    v180 = [v199 objectForKeyedSubscript:v52];
    v181 = (objc_class *)objc_opt_class();
    v182 = NSStringFromClass(v181);
    v183 = [v199 objectForKeyedSubscript:v52];
    v153 = [v197 stringWithFormat:@"PLEntry.compare(%@) value: self.value(%@)=%@ other.value(%@)=%@", v52, v178, v179, v182, v183];

    v184 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
    v185 = [v184 lastPathComponent];
    v186 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
    +[PLCoreStorage logMessage:v153 fromFile:v185 fromFunction:v186 fromLineNumber:673];

    v157 = PLLogCommon();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_131;
    }
    goto LABEL_132;
  }
LABEL_141:
  int64_t v9 = v193;
LABEL_18:

  if (PLEntryDebug)
  {
    v45 = [NSString stringWithFormat:@"PLEntry.compare notSame"];
    v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
    v47 = [v46 lastPathComponent];
    v48 = [NSString stringWithUTF8String:"-[PLEntry compare:options:]"];
    +[PLCoreStorage logMessage:v45 fromFile:v47 fromFunction:v48 fromLineNumber:689];

    v49 = PLLogCommon();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
    goto LABEL_21;
  }
LABEL_22:

  return v9;
}

- (NSArray)definedKeys
{
  BOOL v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    +[PPSEntryKey allBaseKeysForEntryKey:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    +[PLEntryDefinition allKeysForEntryDefinition:v5];
  id v6 = };

  return (NSArray *)v6;
}

- (NSMutableArray)keys
{
  v2 = [(PLEntry *)self dictionary];
  BOOL v3 = [v2 allKeys];

  return (NSMutableArray *)v3;
}

- (int)staticArraySizeForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEntry *)self entryKey];
  BOOL v6 = +[PPSEntryKey PPSEnabled:v5];

  if (v6)
  {
    id v7 = [(PLEntry *)self entryKey];
    objc_super v8 = +[PPSEntryKey subsystemForEntryKey:v7];

    int64_t v9 = [(PLEntry *)self entryKey];
    id v10 = +[PPSEntryKey categoryForEntryKey:v9];

    uint64_t v11 = [MEMORY[0x1E4F89D08] getMetadataForSubsystem:v8 category:v10 name:v4];
    id v12 = v11;
    if (v11
      && [v11 auxiliaryType] == 3
      && [v12 fixedArraySize])
    {
      int v13 = [v12 fixedArraySize];
    }
    else
    {
      int v13 = -1;
    }

    goto LABEL_10;
  }
  if (![(PLEntry *)self formaterForKey:v4])
  {
    uint64_t v15 = [(PLEntry *)self definitionForKey:v4];
    v16 = [v15 objectForKeyedSubscript:@"TypeArraySize"];

    if (v16)
    {
      objc_super v8 = [(PLEntry *)self definitionForKey:v4];
      id v10 = [v8 objectForKeyedSubscript:@"TypeArraySize"];
      int v13 = [v10 intValue];
LABEL_10:

      goto LABEL_11;
    }
  }
  int v13 = -1;
LABEL_11:

  return v13;
}

+ (id)entryWithEntryKey:(id)a3 withData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PLEntry classForEntryKey:v5];
  if (v7 == (objc_class *)objc_opt_class()) {
    objc_super v8 = [[PLEntry alloc] initWithEntryKey:v5 withData:v6];
  }
  else {
    objc_super v8 = (PLEntry *)[[v7 alloc] initEntryWithData:v6];
  }
  int64_t v9 = v8;

  return v9;
}

+ (Class)classForEntryKey:(id)a3
{
  id v3 = a3;
  if (classForEntryKey__onceToken != -1) {
    dispatch_once(&classForEntryKey__onceToken, &__block_literal_global_16_0);
  }
  id v4 = [(id)_entryKeyToClass objectForKeyedSubscript:v3];

  if (v4) {
    [(id)_entryKeyToClass objectForKeyedSubscript:v3];
  }
  else {
  id v5 = objc_opt_class();
  }

  return (Class)v5;
}

- (PLEntry)initWithEntryKey:(id)a3 withData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = [(PLEntry *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryKey, a3);
    [(PLEntry *)v10 setObjectsFromData:v8];
    uint64_t v11 = [v8 objectForKeyedSubscript:@"ID"];
    v10->_entryID = [v11 longLongValue];

    uint64_t v12 = [v8 objectForKeyedSubscript:@"timestamp"];
    if (!v12) {
      goto LABEL_5;
    }
    int v13 = (void *)v12;
    uint64_t v14 = [v8 objectForKeyedSubscript:@"timestamp"];
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];

    if (v14 == v15)
    {
LABEL_5:
      v20 = [(PLEntry *)v10 entryDefinition];
      v21 = [v20 objectForKeyedSubscript:@"Configs"];
      v22 = [v21 objectForKeyedSubscript:@"AllowNilTimestamp"];
      int v23 = [v22 BOOLValue];

      if (v23)
      {
        entryDate = v10->_entryDate;
        v10->_entryDate = 0;
      }
      else if (+[PLDefaults debugEnabled])
      {
        v25 = [NSString stringWithFormat:@"*** ERROR *** missing timestamp from Database record entryKey=%@ data=%@", v7, v8];
        uint64_t v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
        v27 = [v26 lastPathComponent];
        v28 = [NSString stringWithUTF8String:"-[PLEntry initWithEntryKey:withData:]"];
        +[PLCoreStorage logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:275];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v17 = [v8 objectForKeyedSubscript:@"timestamp"];
      [v17 doubleValue];
      uint64_t v18 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
      id v19 = v10->_entryDate;
      v10->_entryDate = (NSDate *)v18;
    }
    if (+[PLEntryDefinition isAggregateForEntryKey:v7])
    {
      uint64_t v30 = [v8 objectForKeyedSubscript:@"timeInterval"];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = [v8 objectForKeyedSubscript:@"timeInterval"];
        uint64_t v33 = [MEMORY[0x1E4F1CA98] null];

        if (v32 != v33)
        {
          v34 = [v8 objectForKeyedSubscript:@"timeInterval"];
          [(PLEntry *)v10 setObject:v34 forKeyedSubscript:@"timeInterval"];
        }
      }
    }
  }

  return v10;
}

- (void)setObjectsFromData:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEntry *)self entryKey];
  BOOL v6 = +[PPSEntryKey PPSEnabled:v5];

  if (v6)
  {
    [(PLEntry *)self setObjectsUsingMetricsFromData:v4];
  }
  else
  {
    id v7 = [(PLEntry *)self entryDefinition];
    id v8 = [v7 objectForKeyedSubscript:@"Keys"];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__PLEntry_setObjectsFromData___block_invoke;
    v9[3] = &unk_1E6254330;
    id v10 = v4;
    uint64_t v11 = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

- (id)initEntryWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() entryKey];
  BOOL v6 = [(PLEntry *)self initWithEntryKey:v5 withData:v4];

  return v6;
}

- (NSArray)DMAKeys
{
  id v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    +[PPSEntryKey allDMAKeysForEntryKey:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    +[PLEntryDefinition DMAKeysForEntryDefinition:v5];
  BOOL v6 = };

  return (NSArray *)v6;
}

uint64_t __24__PLEntry_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

void __30__PLEntry_setObjectsFromData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = [a3 objectForKeyedSubscript:@"Type"];
  int v6 = [v5 shortValue];

  id v7 = [*(id *)(a1 + 32) objectForKey:v17];
  if (v6 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && ([v7 isNil] & 1) == 0)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9C8];
      [v7 doubleValue];
      uint64_t v16 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");

      id v7 = (void *)v16;
    }
  }
  else if (!(_WORD)v6 && (int)[*(id *)(a1 + 40) staticArraySizeForKey:v17] >= 1 && !v7)
  {
    id v7 = objc_opt_new();
    int v8 = [*(id *)(a1 + 40) staticArraySizeForKey:v17];
    if (v8 >= 1)
    {
      int v9 = v8;
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = *(void **)(a1 + 32);
        uint64_t v12 = objc_msgSend(v17, "stringByAppendingFormat:", @"_%d", v10);
        int v13 = [v11 objectForKey:v12];

        if (v13)
        {
          [v7 addObject:v13];
        }
        else
        {
          uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
          [v7 addObject:v14];
        }
        uint64_t v10 = (v10 + 1);
      }
      while (v9 != v10);
    }
  }
  [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v17];
}

- (int64_t)compare:(id)a3
{
  return [(PLEntry *)self compare:a3 options:0];
}

- (NSArray)arrayKeys
{
  id v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    +[PPSEntryKey allArrayKeysForEntryKey:v5];
  }
  else
  {
    id v5 = [(PLEntry *)self entryDefinition];
    +[PLEntryDefinition arrayKeysForEntryDefinition:v5];
  int v6 = };

  return (NSArray *)v6;
}

- (NSArray)dynamicKeys
{
  id v3 = [(PLEntry *)self entryKey];
  BOOL v4 = +[PPSEntryKey PPSEnabled:v3];

  if (v4)
  {
    id v5 = [(PLEntry *)self entryKey];
    int v6 = +[PPSEntryKey allDynamicKeysForEntryKey:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CA48];
    int v8 = [(PLEntry *)self keys];
    int v6 = [v7 arrayWithArray:v8];

    int v9 = [(PLEntry *)self definedKeys];
    [v6 removeObjectsInArray:v9];

    if ([v6 containsObject:@"timestampLogged"]) {
      [v6 removeObject:@"timestampLogged"];
    }
  }
  return (NSArray *)v6;
}

- (void)setIsErrorEntry:(BOOL)a3
{
  self->_isErrorEntry = a3;
}

- (NSMutableArray)allValues
{
  v2 = [(PLEntry *)self dictionary];
  id v3 = [v2 allValues];

  return (NSMutableArray *)v3;
}

- (void)loadDynamicKeys
{
  id v4 = +[PowerlogCore sharedCore];
  id v3 = [v4 storage];
  [v3 loadDynamicValuesIntoEntry:self];
}

+ (void)load
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class())
  {
    uint64_t v3 = objc_opt_class();
    +[PLEntry registerEntry:v3];
  }
}

+ (void)registerEntry:(Class)a3
{
  if (registerEntry__onceToken != -1) {
    dispatch_once(&registerEntry__onceToken, &__block_literal_global_42);
  }
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[PLEntry registerEntry:](a3, v4);
  }

  id v5 = (id)_registeredEntries;
  objc_sync_enter(v5);
  [(id)_registeredEntries addObject:a3];
  objc_sync_exit(v5);
}

uint64_t __25__PLEntry_registerEntry___block_invoke()
{
  _registeredEntries = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)entryWithEntryKey:(id)a3 withRawData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PLEntry classForEntryKey:v5];
  if (v7 == (objc_class *)objc_opt_class()) {
    int v8 = [[PLEntry alloc] initWithEntryKey:v5 withRawData:v6];
  }
  else {
    int v8 = (PLEntry *)[[v7 alloc] initEntryWithRawData:v6];
  }
  int v9 = v8;

  return v9;
}

void __28__PLEntry_classForEntryKey___block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_entryKeyToClass;
  _entryKeyToClass = v0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)_registeredEntries;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        int v8 = (void *)_entryKeyToClass;
        int v9 = objc_msgSend(v7, "entryKey", (void)v10);
        [v8 setObject:v7 forKeyedSubscript:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

+ (id)entryKey
{
  return &stru_1F15208F0;
}

- (BOOL)hasAppIdentifierKeys
{
  id v2 = [(PLEntry *)self entryDefinition];
  BOOL v3 = +[PLEntryDefinition hasAppIdentifierKeysForEntryDefinition:v2];

  return v3;
}

uint64_t __14__PLEntry_sem__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)sem_masterSem;
  sem_masterSem = (uint64_t)v0;

  sem_entryKeyToSem = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

BOOL __29__PLEntry_initWithEntryDate___block_invoke()
{
  BOOL result = +[PLDefaults isClassDebugEnabled:objc_opt_class()];
  PLEntryDebug = result;
  return result;
}

- (id)initEntryWithRawData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() entryKey];
  id v6 = [(PLEntry *)self initWithEntryKey:v5 withRawData:v4];

  return v6;
}

- (void)setDynamicObjectsFromRawData:(id)a3
{
  id v4 = a3;
  if ([(PLEntry *)self hasDynamicKeys])
  {
    uint64_t v5 = [(PLEntry *)self entryDefinition];
    id v6 = [v5 objectForKeyedSubscript:@"Keys"];

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PLEntry_setDynamicObjectsFromRawData___block_invoke;
    v8[3] = &unk_1E6254330;
    id v9 = v6;
    long long v10 = self;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __40__PLEntry_setDynamicObjectsFromRawData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];

  if (!v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v8 = *(void **)(a1 + 40);
    if (isKindOfClass) {
      [v8 setObjectsFromRawData:v5];
    }
    else {
      [v8 setObject:v5 forKeyedSubscript:v9];
    }
  }
}

- (void)setObjectsUsingMetricsFromData:(id)a3
{
  id v4 = a3;
  id v5 = [(PLEntry *)self entryKey];
  id v6 = +[PPSEntryKey metricsForEntryKey:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PLEntry_setObjectsUsingMetricsFromData___block_invoke;
  v8[3] = &unk_1E6255948;
  id v9 = v4;
  long long v10 = self;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

void __42__PLEntry_setObjectsUsingMetricsFromData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  int v5 = [a3 datatype];
  id v6 = [*(id *)(a1 + 32) objectForKey:v9];
  if (v5 == 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && ([v6 isNil] & 1) == 0)
    {
      id v7 = (void *)MEMORY[0x1E4F1C9C8];
      [v6 doubleValue];
      uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSince1970:");

      id v6 = (void *)v8;
    }
  }
  [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v9];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(PLEntry *)self sem];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(PLEntry *)self dictionary];
  [v6 removeObjectForKey:v4];

  id v7 = [(PLEntry *)self sem];
  dispatch_semaphore_signal(v7);
}

- (BOOL)isKeyDynamic:(id)a3
{
  id v4 = a3;
  if ([(PLEntry *)self hasDynamicKeys])
  {
    int v5 = [(PLEntry *)self definitionForKey:v4];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isKeyAggregateValue:(id)a3
{
  BOOL v3 = [(PLEntry *)self definitionForKey:a3];
  id v4 = [v3 objectForKeyedSubscript:@"IsAggregateValue"];

  if (v4)
  {
    int v5 = [v3 objectForKeyedSubscript:@"IsAggregateValue"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)unitForKey:(id)a3
{
  BOOL v3 = [(PLEntry *)self definitionForKey:a3];
  id v4 = [v3 objectForKeyedSubscript:@"Unit"];

  return v4;
}

+ (signed)dataFormatForMetric:(id)a3 auxiliaryMetrics:(id)a4
{
  if (!a3 || !a4) {
    return 0x8000;
  }
  id v4 = objc_msgSend(a4, "objectForKeyedSubscript:");
  int v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "datatype"));
  signed __int16 v6 = +[PLValueUtilties formatterFromDataType:v5];

  return v6;
}

- (id)keyValuePathForKey:(id)a3
{
  BOOL v3 = [(PLEntry *)self definitionForKey:a3];
  id v4 = [v3 objectForKeyedSubscript:@"KeyValuePath"];
  int v5 = [v4 componentsJoinedByString:@"."];

  return v5;
}

- (id)descriptionRespectingAllowlist:(BOOL)a3
{
  BOOL v25 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28E78];
  int v5 = [(PLEntry *)self entryDate];
  signed __int16 v6 = [(PLEntry *)self entryKey];
  id v7 = [v4 stringWithFormat:@"%@ [%@]", v5, v6];

  if ([(PLEntry *)self entryID] > 0) {
    goto LABEL_5;
  }
  uint64_t v8 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PLEntry_descriptionRespectingAllowlist___block_invoke;
  block[3] = &unk_1E6253EC0;
  v31 = @"printID";
  uint64_t v32 = v8;
  if (descriptionRespectingAllowlist__defaultOnce != -1) {
    dispatch_once(&descriptionRespectingAllowlist__defaultOnce, block);
  }
  int v9 = descriptionRespectingAllowlist__classDebugEnabled;

  if (v9) {
LABEL_5:
  }
    objc_msgSend(v7, "appendFormat:", @" ID=%lld; ", -[PLEntry entryID](self, "entryID"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v10 = [(PLEntry *)self keys];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v16 = [(PLEntry *)self objectForKeyedSubscript:v15];
        if ([v16 isNil])
        {
          [v7 appendFormat:@" %@=<unknown>;", v15];
        }
        else
        {
          if (v25)
          {
            id v17 = [(PLEntry *)self entryKey];
            int v18 = +[PLUtilities logModeForEntryKey:v17 withKey:v15 andValue:v16];

            switch(v18)
            {
              case 0:
                break;
              case 1:
                id v19 = [(PLEntry *)self unitForKey:v15];
                [v7 appendFormat:@" %@=<private>%@;", v15, v19, v24];
                goto LABEL_24;
              case 2:
                uint64_t v20 = +[PLUtilities hashString:v16];

                uint64_t v16 = (void *)v20;
                goto LABEL_17;
              case 3:
                goto LABEL_19;
              case 4:
LABEL_17:
                if (v18 == 4)
                {
                  uint64_t v21 = +[PLUtilities hashBundleID:v16];
LABEL_22:
                  v22 = (void *)v21;

                  uint64_t v16 = v22;
                  break;
                }
LABEL_19:
                if (v18 == 3)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v21 = [v16 lastPathComponent];
                    goto LABEL_22;
                  }
                }
                break;
              default:
                goto LABEL_25;
            }
          }
          id v19 = [(PLEntry *)self unitForKey:v15];
          [v7 appendFormat:@" %@=%@%@;", v15, v16, v19];
LABEL_24:
        }
LABEL_25:
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v12);
  }

  objc_msgSend(v7, "appendFormat:", @" existsInDB=%i;", -[PLEntry existsInDB](self, "existsInDB"));
  return v7;
}

BOOL __42__PLEntry_descriptionRespectingAllowlist___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  descriptionRespectingAllowlist__classDebugEnabled = result;
  return result;
}

- (id)description
{
  return [(PLEntry *)self descriptionRespectingAllowlist:1];
}

- (id)debugDescription
{
  return [(PLEntry *)self descriptionRespectingAllowlist:0];
}

- (id)serialized
{
  BOOL v3 = objc_opt_new();
  id v4 = [(PLEntry *)self dictionary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __21__PLEntry_serialized__block_invoke;
  v10[3] = &unk_1E62540E8;
  id v5 = v3;
  id v11 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  signed __int16 v6 = [(PLEntry *)self entryDate];

  if (v6) {
    [(PLEntry *)self entryDate];
  }
  else {
  id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  [v5 setObject:v7 forKeyedSubscript:@"timestamp"];

  uint64_t v8 = [(PLEntry *)self entryKey];
  [v5 setObject:v8 forKeyedSubscript:@"EntryKey"];

  return v5;
}

void __21__PLEntry_serialized__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([v5 isNil] & 1) == 0) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

- (id)serializedForJSON
{
  BOOL v3 = [(PLEntry *)self dictionary];
  id v4 = +[PLUtilities JSONSanitizeDictionary:v3];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = NSNumber;
  id v7 = [(PLEntry *)self entryDate];
  [v7 timeIntervalSince1970];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setObject:v8 forKeyedSubscript:@"timestamp"];

  return v5;
}

+ (id)summarizeAggregateEntries:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    id v5 = [v4 entryDefinition];
    id v6 = [v5 objectForKeyedSubscript:@"AggregateKeys"];

    id v7 = [v3 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 definedKeys];
    int v9 = [v8 arrayByRemovingObjectsFromArray:v6];

    long long v10 = +[PLEntry summarizeAggregateEntries:v3 withPrimaryKeys:v9];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

+ (id)summarizeAggregateEntries:(id)a3 withPrimaryKeys:(id)a4
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v89 = v5;
  uint64_t v7 = [v5 count];
  id v103 = 0;
  if (v6 && v7)
  {
    if ([v6 count])
    {
      uint64_t v8 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__PLEntry_summarizeAggregateEntries_withPrimaryKeys___block_invoke;
      block[3] = &unk_1E6253EC0;
      v125 = @"sumarizeAggregate";
      uint64_t v126 = v8;
      if (summarizeAggregateEntries_withPrimaryKeys__defaultOnce != -1) {
        dispatch_once(&summarizeAggregateEntries_withPrimaryKeys__defaultOnce, block);
      }
      int v9 = summarizeAggregateEntries_withPrimaryKeys__classDebugEnabled;

      long long v10 = objc_opt_new();
      BOOL v97 = objc_opt_new();
      id v11 = [v5 objectAtIndexedSubscript:0];
      uint64_t v12 = [v11 entryDefinition];
      double v91 = [v12 objectForKeyedSubscript:@"AggregateKeys"];

      double v100 = objc_opt_new();
      v93 = v10;
      if (v9)
      {
        uint64_t v13 = [NSString stringWithFormat:@"primaryKeys=%@\naggregateKeys=%@", v6, v91];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
        uint64_t v15 = [v14 lastPathComponent];
        uint64_t v16 = [NSString stringWithUTF8String:"+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]"];
        +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:803];

        id v17 = PLLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        long long v10 = v93;
      }
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id obj = v89;
      id v90 = v6;
      uint64_t v95 = [obj countByEnumeratingWithState:&v120 objects:v132 count:16];
      if (v95)
      {
        uint64_t v94 = *(void *)v121;
        int v18 = @"AggregateFunction";
        int v98 = v9;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v121 != v94) {
              objc_enumerationMutation(obj);
            }
            double v102 = *(void **)(*((void *)&v120 + 1) + 8 * v19);
            id v20 = v10;
            uint64_t v96 = v19;
            if (v9)
            {
              v99 = objc_opt_new();
              if (![v6 count])
              {
                id v21 = v20;
                v105 = 0;
                goto LABEL_41;
              }
            }
            else
            {
              v99 = 0;
              if (![v6 count])
              {
                v105 = 0;
                goto LABEL_70;
              }
            }
            unint64_t v22 = 0;
            v105 = 0;
            char v23 = 0;
            do
            {
              uint64_t v24 = [v6 objectAtIndexedSubscript:v22];
              BOOL v25 = [v102 objectForKeyedSubscript:v24];

              if (v9)
              {
                long long v26 = [v6 objectAtIndexedSubscript:v22];
                [v99 setObject:v25 forKeyedSubscript:v26];
              }
              long long v27 = [v20 objectForKeyedSubscript:v25];

              if (!v27)
              {
                if (v22 == [v6 count] - 1)
                {
                  long long v28 = (void *)[v102 copy];
                  [v28 entryKey];
                  v30 = long long v29 = v20;
                  v31 = +[PLEntryKey baseEntryKeyForEntryKey:v30];
                  [v28 setEntryKey:v31];

                  id v20 = v29;
                  int v9 = v98;
                  [v29 setObject:v28 forKeyedSubscript:v25];
                  [v97 addObject:v28];
                  char v23 = 1;
                }
                else
                {
                  long long v28 = objc_opt_new();
                  [v20 setObject:v28 forKeyedSubscript:v25];
                }
              }
              uint64_t v32 = [v6 count] - 1;
              uint64_t v33 = [v20 objectForKeyedSubscript:v25];
              uint64_t v34 = v105;
              if (v22 == v32) {
                v35 = v105;
              }
              else {
                v35 = v20;
              }
              if (v22 == v32) {
                uint64_t v34 = (void *)v33;
              }
              else {
                id v20 = (id)v33;
              }
              v105 = v34;

              ++v22;
            }
            while ([v6 count] > v22);
            if (v23)
            {
              if (v9)
              {
                uint64_t v36 = [NSString stringWithFormat:@"first hit for %@", v99];
                v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
                v38 = [v37 lastPathComponent];
                uint64_t v39 = [NSString stringWithUTF8String:"+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]"];
                id v101 = (id)v36;
                +[PLCoreStorage logMessage:v36 fromFile:v38 fromFunction:v39 fromLineNumber:838];

                v40 = PLLogCommon();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v131 = v36;
                  _os_log_debug_impl(&dword_1BBD2F000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                uint64_t v19 = v96;
                long long v10 = v93;
                goto LABEL_48;
              }
LABEL_73:
              uint64_t v19 = v96;
              goto LABEL_70;
            }
            if (!v9)
            {
              if (!v105)
              {
                v105 = 0;
                goto LABEL_73;
              }
              goto LABEL_51;
            }
            id v21 = v20;
LABEL_41:
            uint64_t v41 = [NSString stringWithFormat:@"aggregating... for %@", v99];
            v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
            v43 = [v42 lastPathComponent];
            v44 = [NSString stringWithUTF8String:"+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]"];
            +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:842];

            v45 = PLLogCommon();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v131 = (uint64_t)v41;
              _os_log_debug_impl(&dword_1BBD2F000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v20 = v21;
            if (!v105)
            {
              uint64_t v46 = [NSString stringWithFormat:@"We should not be here!"];
              v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m"];
              v48 = [v47 lastPathComponent];
              v49 = [NSString stringWithUTF8String:"+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]"];
              id v101 = (id)v46;
              +[PLCoreStorage logMessage:v46 fromFile:v48 fromFunction:v49 fromLineNumber:864];

              v40 = PLLogCommon();
              int v9 = v98;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v131 = v46;
                _os_log_debug_impl(&dword_1BBD2F000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
              v105 = 0;
              long long v10 = v93;
              uint64_t v19 = v96;
LABEL_48:

              goto LABEL_69;
            }
            int v9 = v98;
LABEL_51:
            uint64_t v19 = v96;
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            id v101 = v91;
            id v104 = (id)[v101 countByEnumeratingWithState:&v116 objects:v129 count:16];
            if (!v104) {
              goto LABEL_69;
            }
            id v92 = v20;
            uint64_t v50 = *(void *)v117;
            uint64_t v51 = v102;
            do
            {
              for (uint64_t i = 0; i != v104; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v117 != v50) {
                  objc_enumerationMutation(v101);
                }
                uint64_t v53 = *(void *)(*((void *)&v116 + 1) + 8 * i);
                v54 = [v51 definitionForKey:v53];
                v55 = [v54 objectForKeyedSubscript:v18];
                unsigned int v56 = [v55 shortValue];

                if (v56 > 1)
                {
                  if (v56 == 3)
                  {
                    v69 = [v105 objectForKeyedSubscript:v53];
                    v70 = [v51 objectForKeyedSubscript:v53];
                    uint64_t v71 = [v69 compare:v70];

                    BOOL v68 = v71 == -1;
                  }
                  else
                  {
                    if ((unsigned __int16)v56 != 2) {
                      goto LABEL_66;
                    }
                    v65 = [v105 objectForKeyedSubscript:v53];
                    v66 = [v51 objectForKeyedSubscript:v53];
                    uint64_t v67 = [v65 compare:v66];

                    BOOL v68 = v67 == 1;
                  }
                  uint64_t v51 = v102;
                  if (v68)
                  {
                    char v72 = [v102 objectForKeyedSubscript:v53];
                    [v105 setObject:v72 forKeyedSubscript:v53];
                  }
                }
                else
                {
                  BOOL v57 = NSNumber;
                  [v105 objectForKeyedSubscript:v53];
                  v59 = v58 = v18;
                  [v59 doubleValue];
                  double v61 = v60;
                  v62 = [v51 objectForKeyedSubscript:v53];
                  [v62 doubleValue];
                  v64 = [v57 numberWithDouble:v61 + v63];
                  [v105 setObject:v64 forKeyedSubscript:v53];

                  uint64_t v51 = v102;
                  int v18 = v58;
                  if (v56 == 1) {
                    [v100 addObject:v53];
                  }
                }
LABEL_66:
              }
              id v104 = (id)[v101 countByEnumeratingWithState:&v116 objects:v129 count:16];
            }
            while (v104);
            id v6 = v90;
            id v20 = v92;
            long long v10 = v93;
            int v9 = v98;
            uint64_t v19 = v96;
LABEL_69:

LABEL_70:
            ++v19;
          }
          while (v19 != v95);
          uint64_t v73 = [obj countByEnumeratingWithState:&v120 objects:v132 count:16];
          uint64_t v95 = v73;
        }
        while (v73);
      }

      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v103 = v97;
      uint64_t v74 = [v103 countByEnumeratingWithState:&v112 objects:v128 count:16];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v106 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v75; ++j)
          {
            if (*(void *)v113 != v106) {
              objc_enumerationMutation(v103);
            }
            v77 = *(void **)(*((void *)&v112 + 1) + 8 * j);
            long long v108 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            long long v111 = 0u;
            id v78 = v100;
            uint64_t v79 = [v78 countByEnumeratingWithState:&v108 objects:v127 count:16];
            if (v79)
            {
              uint64_t v80 = v79;
              uint64_t v81 = *(void *)v109;
              do
              {
                for (uint64_t k = 0; k != v80; ++k)
                {
                  if (*(void *)v109 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  uint64_t v83 = *(void *)(*((void *)&v108 + 1) + 8 * k);
                  char v84 = NSNumber;
                  v85 = [v77 objectForKeyedSubscript:v83];
                  [v85 doubleValue];
                  double v87 = objc_msgSend(v84, "numberWithDouble:", v86 / (double)(unint64_t)objc_msgSend(obj, "count"));
                  [v77 setObject:v87 forKeyedSubscript:v83];
                }
                uint64_t v80 = [v78 countByEnumeratingWithState:&v108 objects:v127 count:16];
              }
              while (v80);
            }
          }
          uint64_t v75 = [v103 countByEnumeratingWithState:&v112 objects:v128 count:16];
        }
        while (v75);
      }

      id v6 = v90;
    }
    else
    {
      id v103 = 0;
    }
  }

  return v103;
}

BOOL __53__PLEntry_summarizeAggregateEntries_withPrimaryKeys___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  summarizeAggregateEntries_withPrimaryKeys__classDebugEnabled = result;
  return result;
}

- (void)setDictionary:(id)a3
{
}

- (void)setEntryDefinition:(id)a3
{
}

- (void)setEntryKey:(id)a3
{
}

- (void)setSem:(id)a3
{
}

+ (void)registerEntry:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [a1 superclass];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  id v5 = v4;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "%@ %@ registered", v6, 0x16u);
}

@end