@interface SignpostSupportMachTimeTranslator
- (BOOL)containsContinuousTimeJumps;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMonitoringSleepWake;
- (NSMutableArray)startMachAbsoluteTimes;
- (NSMutableArray)startMachContinuousTimes;
- (NSMutableArray)translationRanges;
- (OS_dispatch_queue)synchronizationQueue;
- (SignpostSupportMachTimeTranslator)init;
- (SignpostSupportMachTimeTranslator)initWithDataRepresentation:(id)a3;
- (SignpostSupportMachTimeTranslator)initWithDictionaryRepresentation:(id)a3;
- (id)dataRepresentation;
- (id)serializableDictionaryRepresentation;
- (unint64_t)machAbsoluteTimeForMachContinuousTime:(unint64_t)a3;
- (unint64_t)machContinuousTimeForMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)maxEntries;
- (void)addTimestampPairWithMachAbsoluteTime:(unint64_t)a3 machContinuousTime:(unint64_t)a4;
- (void)setIsMonitoringSleepWake:(BOOL)a3;
- (void)setMaxEntries:(unint64_t)a3;
- (void)setSynchronizationQueue:(id)a3;
@end

@implementation SignpostSupportMachTimeTranslator

- (SignpostSupportMachTimeTranslator)init
{
  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportMachTimeTranslator;
  v2 = [(SignpostSupportMachTimeTranslator *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    translationRanges = v2->_translationRanges;
    v2->_translationRanges = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    startMachAbsoluteTimes = v2->_startMachAbsoluteTimes;
    v2->_startMachAbsoluteTimes = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    startMachContinuousTimes = v2->_startMachContinuousTimes;
    v2->_startMachContinuousTimes = (NSMutableArray *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("SignpostSupportMachTimeTranslator synchronization queue", 0);
    synchronizationQueue = v2->_synchronizationQueue;
    v2->_synchronizationQueue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (BOOL)containsContinuousTimeJumps
{
  v2 = [(SignpostSupportMachTimeTranslator *)self translationRanges];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (id)dataRepresentation
{
  v2 = [(SignpostSupportMachTimeTranslator *)self serializableDictionaryRepresentation];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v2 format:200 options:0 error:0];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (SignpostSupportMachTimeTranslator)initWithDataRepresentation:(id)a3
{
  id v10 = 0;
  v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (v4)
  {
    self = [(SignpostSupportMachTimeTranslator *)self initWithDictionaryRepresentation:v4];
    uint64_t v7 = self;
  }
  else
  {
    if (v5)
    {
      v8 = _timeTranslatorDebugLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SignpostSupportMachTimeTranslator initWithDataRepresentation:](v6, v8);
      }
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (SignpostSupportMachTimeTranslator)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"SignpostSupportMachTimeTranslatorTypeKey"];
  char v6 = [@"SignpostSupportMachTimeTranslator" isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v8 = _timeTranslatorDebugLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SignpostSupportMachTimeTranslator initWithDictionaryRepresentation:](v8);
    }
    goto LABEL_19;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"SignpostSupportMachTimeTranslatorVersionKey"];
  v8 = v7;
  if (!v7 || ([v7 isEqualToNumber:&unk_1EF81E7F0] & 1) == 0)
  {
    v18 = _timeTranslatorDebugLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      -[SignpostSupportMachTimeTranslator initWithDictionaryRepresentation:](v18);
    }

LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  dispatch_queue_t v9 = [(SignpostSupportMachTimeTranslator *)self init];
  if (v9)
  {
    id v10 = [v4 objectForKeyedSubscript:@"TranslationRanges"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[SignpostSupportMachTimeTranslationRange alloc] initWithArrayRepresentation:*(void *)(*((void *)&v20 + 1) + 8 * v14)];
          v16 = [(SignpostSupportMachTimeTranslator *)v9 translationRanges];
          [v16 addObject:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
  self = v9;
  v17 = self;
LABEL_20:

  return v17;
}

- (id)serializableDictionaryRepresentation
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  BOOL v3 = [(SignpostSupportMachTimeTranslator *)self synchronizationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__SignpostSupportMachTimeTranslator_serializableDictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E5B403B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__SignpostSupportMachTimeTranslator_serializableDictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) serializableArrayRepresentation];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"SignpostSupportMachTimeTranslator", @"SignpostSupportMachTimeTranslatorTypeKey", &unk_1EF81E7F0, @"SignpostSupportMachTimeTranslatorVersionKey", v2, @"TranslationRanges", 0);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (void)addTimestampPairWithMachAbsoluteTime:(unint64_t)a3 machContinuousTime:(unint64_t)a4
{
  uint64_t v7 = [(SignpostSupportMachTimeTranslator *)self synchronizationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke;
  block[3] = &unk_1E5B40408;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);
}

void __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    uint64_t v25 = [[SignpostSupportMachTimeTranslationRange alloc] initWithStartMachAbsoluteTime:*(void *)(a1 + 40) startContinuousTime:*(void *)(a1 + 48)];
    long long v22 = [*(id *)(a1 + 32) translationRanges];
    [v22 addObject:v25];

    long long v23 = [*(id *)(a1 + 32) startMachAbsoluteTimes];
    v24 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v23 addObject:v24];

    uint64_t v5 = [*(id *)(a1 + 32) startMachContinuousTimes];
    long long v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    [(SignpostSupportMachTimeTranslationRange *)v5 addObject:v21];
LABEL_11:

    goto LABEL_12;
  }
  unint64_t v4 = *(void *)(a1 + 40);
  uint64_t v25 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v5 = [(SignpostSupportMachTimeTranslationRange *)v25 firstObject];
  if (v4 < [(SignpostSupportMachTimeTranslationRange *)v5 startMachAbsoluteTime])
  {
LABEL_12:

    goto LABEL_13;
  }
  unint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 32) translationRanges];
  v8 = [v7 firstObject];
  unint64_t v9 = [v8 startMachContinuousTime];

  if (v6 <= v9) {
    return;
  }
  uint64_t v10 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v25 = [v10 lastObject];

  if (![(SignpostSupportMachTimeTranslationRange *)v25 setEndMachAbsoluteTimestamp:*(void *)(a1 + 40) endMachContinuousTime:*(void *)(a1 + 48)])
  {
    if ([(SignpostSupportMachTimeTranslationRange *)v25 endMachContinuousTime] != -1
      && [(SignpostSupportMachTimeTranslationRange *)v25 endMachContinuousTime] >= *(void *)(a1 + 48))
    {
      __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke_cold_1();
    }
    uint64_t v5 = [[SignpostSupportMachTimeTranslationRange alloc] initWithStartMachAbsoluteTime:*(void *)(a1 + 40) startContinuousTime:*(void *)(a1 + 48)];
    uint64_t v11 = [*(id *)(a1 + 32) translationRanges];
    [v11 addObject:v5];

    long long v12 = [*(id *)(a1 + 32) startMachAbsoluteTimes];
    long long v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
    [v12 addObject:v13];

    long long v14 = [*(id *)(a1 + 32) startMachContinuousTimes];
    long long v15 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    [v14 addObject:v15];

    if (![*(id *)(a1 + 32) maxEntries]) {
      goto LABEL_12;
    }
    v16 = [*(id *)(a1 + 32) translationRanges];
    unint64_t v17 = [v16 count];
    unint64_t v18 = [*(id *)(a1 + 32) maxEntries];

    if (v17 <= v18) {
      goto LABEL_12;
    }
    v19 = [*(id *)(a1 + 32) translationRanges];
    [v19 removeObjectAtIndex:0];

    long long v20 = [*(id *)(a1 + 32) startMachAbsoluteTimes];
    [v20 removeObjectAtIndex:0];

    long long v21 = [*(id *)(a1 + 32) startMachContinuousTimes];
    [v21 removeObjectAtIndex:0];
    goto LABEL_11;
  }
LABEL_13:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(SignpostSupportMachTimeTranslator *)self translationRanges];
    uint64_t v7 = [v5 translationRanges];

    char v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)machAbsoluteTimeForMachContinuousTime:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v5 = [(SignpostSupportMachTimeTranslator *)self synchronizationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SignpostSupportMachTimeTranslator_machAbsoluteTimeForMachContinuousTime___block_invoke;
  block[3] = &unk_1E5B40450;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __75__SignpostSupportMachTimeTranslator_machAbsoluteTimeForMachContinuousTime___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v3 = [v2 count];

  if (!v3) {
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v5 = [v4 count];

  unint64_t v6 = *(void **)(a1 + 32);
  if (v5 != 1)
  {
    uint64_t v9 = [v6 startMachContinuousTimes];
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    uint64_t v11 = [*(id *)(a1 + 32) startMachContinuousTimes];
    uint64_t v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_19);

    if (v12)
    {
      uint64_t v7 = [*(id *)(a1 + 32) translationRanges];
      uint64_t v8 = [v7 objectAtIndexedSubscript:v12 - 1];
      goto LABEL_6;
    }
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    return;
  }
  uint64_t v7 = [v6 translationRanges];
  uint64_t v8 = [v7 firstObject];
LABEL_6:
  id v13 = (id)v8;

  if ([v13 containsMachContinuousTime:*(void *)(a1 + 48)]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v13 machAbsoluteTimeForMachContinuousTime:*(void *)(a1 + 48)];
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
  }
}

uint64_t __75__SignpostSupportMachTimeTranslator_machAbsoluteTimeForMachContinuousTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)machContinuousTimeForMachAbsoluteTime:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v5 = [(SignpostSupportMachTimeTranslator *)self synchronizationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SignpostSupportMachTimeTranslator_machContinuousTimeForMachAbsoluteTime___block_invoke;
  block[3] = &unk_1E5B40450;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __75__SignpostSupportMachTimeTranslator_machContinuousTimeForMachAbsoluteTime___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v3 = [v2 count];

  if (!v3) {
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 32) translationRanges];
  uint64_t v5 = [v4 count];

  unint64_t v6 = *(void **)(a1 + 32);
  if (v5 != 1)
  {
    uint64_t v9 = [v6 startMachAbsoluteTimes];
    uint64_t v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 48)];
    uint64_t v11 = [*(id *)(a1 + 32) startMachAbsoluteTimes];
    uint64_t v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_75);

    if (v12)
    {
      uint64_t v7 = [*(id *)(a1 + 32) translationRanges];
      uint64_t v8 = [v7 objectAtIndexedSubscript:v12 - 1];
      goto LABEL_6;
    }
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    return;
  }
  uint64_t v7 = [v6 translationRanges];
  uint64_t v8 = [v7 firstObject];
LABEL_6:
  id v13 = (id)v8;

  if ([v13 containsMachAbsoluteTime:*(void *)(a1 + 48)]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v13 machContinuousTimeForMachAbsoluteTime:*(void *)(a1 + 48)];
  }
  else {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
  }
}

uint64_t __75__SignpostSupportMachTimeTranslator_machContinuousTimeForMachAbsoluteTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSMutableArray)translationRanges
{
  return self->_translationRanges;
}

- (NSMutableArray)startMachAbsoluteTimes
{
  return self->_startMachAbsoluteTimes;
}

- (NSMutableArray)startMachContinuousTimes
{
  return self->_startMachContinuousTimes;
}

- (unint64_t)maxEntries
{
  return self->_maxEntries;
}

- (void)setMaxEntries:(unint64_t)a3
{
  self->_maxEntries = a3;
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void)setSynchronizationQueue:(id)a3
{
}

- (BOOL)isMonitoringSleepWake
{
  return self->_isMonitoringSleepWake;
}

- (void)setIsMonitoringSleepWake:(BOOL)a3
{
  self->_isMonitoringSleepWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_startMachContinuousTimes, 0);
  objc_storeStrong((id *)&self->_startMachAbsoluteTimes, 0);

  objc_storeStrong((id *)&self->_translationRanges, 0);
}

- (void)initWithDataRepresentation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1A4576000, a2, OS_LOG_TYPE_DEBUG, "Could not deserialize time translator: %@", (uint8_t *)&v4, 0xCu);
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Invalid version key", v1, 2u);
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4576000, log, OS_LOG_TYPE_DEBUG, "Missing type key", v1, 2u);
}

void __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke_cold_1()
{
}

@end