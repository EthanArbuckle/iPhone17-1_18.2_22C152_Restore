@interface PET2LoggingOutlet
+ (id)sharedInstance;
- (PET2LoggingOutlet)init;
- (id)_findBucketsForKey:(id)a3;
- (void)_dispatchBatchForKey:(id)a3 value:(unint64_t)a4 isUpdate:(BOOL)a5;
- (void)logDoubleValue:(double)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7;
- (void)logErrorForEvent:(id)a3 featureId:(id)a4 reason:(id)a5;
- (void)logUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7;
- (void)setUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7;
@end

@implementation PET2LoggingOutlet

void __57__PET2LoggingOutlet__dispatchBatchForKey_value_isUpdate___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v41;
    v7 = MEMORY[0x1E4F14500];
    *(void *)&long long v4 = 138412546;
    long long v34 = v4;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void *)(*((void *)&v40 + 1) + 8 * v8);
        v10 = objc_opt_new();
        [v10 setKey:v9];
        v11 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v9];
        uint64_t v12 = [v11 unsignedIntegerValue];

        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v34;
          uint64_t v46 = v9;
          __int16 v47 = 1024;
          int v48 = v12;
          _os_log_debug_impl(&dword_190C01000, v7, OS_LOG_TYPE_DEBUG, "Batch adding key: %@, value: %d", buf, 0x12u);
        }
        v13 = +[PETEventTracker2 sharedInstance];
        [v13 trackScalarForMessage:v10 count:v12];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v5);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v37;
    v19 = MEMORY[0x1E4F14500];
    *(void *)&long long v16 = 138412546;
    long long v35 = v16;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void *)(*((void *)&v36 + 1) + 8 * v20);
        v22 = objc_opt_new();
        [v22 setKey:v21];
        v23 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v21];
        uint64_t v24 = [v23 unsignedIntegerValue];

        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v35;
          uint64_t v46 = v21;
          __int16 v47 = 1024;
          int v48 = v24;
          _os_log_debug_impl(&dword_190C01000, v19, OS_LOG_TYPE_DEBUG, "Batch updating key: %@, value: %d", buf, 0x12u);
        }
        v25 = +[PETEventTracker2 sharedInstance];
        [v25 trackScalarForMessage:v22 updateCount:v24];

        ++v20;
      }
      while (v17 != v20);
      uint64_t v17 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v17);
  }

  uint64_t v26 = objc_opt_new();
  uint64_t v27 = *(void *)(a1 + 32);
  v28 = *(void **)(v27 + 24);
  *(void *)(v27 + 24) = v26;

  uint64_t v29 = objc_opt_new();
  uint64_t v30 = *(void *)(a1 + 32);
  v31 = *(void **)(v30 + 32);
  *(void *)(v30 + 32) = v29;

  uint64_t v32 = *(void *)(a1 + 32);
  v33 = *(void **)(v32 + 40);
  *(void *)(v32 + 40) = 0;
}

- (void)logUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  loggingQueue = self->_loggingQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__PET2LoggingOutlet_logUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke;
  v21[3] = &unk_1E56C3E50;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  uint64_t v26 = self;
  unint64_t v27 = a3;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(loggingQueue, v21);
}

void __95__PET2LoggingOutlet_logUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke(uint64_t a1)
{
  id v2 = +[PETLoggingUtils keyStringForEvent:*(void *)(a1 + 32) featureId:*(void *)(a1 + 40) stringifiedProperties:*(void *)(a1 + 48) metaData:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) _dispatchBatchForKey:v2 value:*(void *)(a1 + 72) isUpdate:0];
}

- (void)_dispatchBatchForKey:(id)a3 value:(unint64_t)a4 isUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (v5)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
    p_updateKeys = &self->_updateKeys;
  }
  else
  {
    p_updateKeys = &self->_addKeys;
    uint64_t v11 = [(NSMutableDictionary *)self->_addKeys objectForKeyedSubscript:v8];
    id v12 = (void *)v11;
    id v13 = &unk_1EE0909F8;
    if (v11) {
      id v13 = (void *)v11;
    }
    id v14 = v13;

    id v15 = NSNumber;
    uint64_t v16 = [v14 unsignedIntegerValue];

    uint64_t v9 = [v15 numberWithUnsignedInteger:v16 + a4];
  }
  [(NSMutableDictionary *)*p_updateKeys setObject:v9 forKeyedSubscript:v8];

  if (!self->_batchTxn)
  {
    id v17 = (OS_os_transaction *)os_transaction_create();
    batchTxn = self->_batchTxn;
    self->_batchTxn = v17;

    dispatch_time_t v19 = dispatch_time(0, 1000000000);
    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PET2LoggingOutlet__dispatchBatchForKey_value_isUpdate___block_invoke;
    block[3] = &unk_1E56C41D8;
    block[4] = self;
    dispatch_after(v19, loggingQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchTxn, 0);
  objc_storeStrong((id *)&self->_updateKeys, 0);
  objc_storeStrong((id *)&self->_addKeys, 0);
  objc_storeStrong((id *)&self->_pet1HistogramBuckets, 0);

  objc_storeStrong((id *)&self->_loggingQueue, 0);
}

- (void)logErrorForEvent:(id)a3 featureId:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  loggingQueue = self->_loggingQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__PET2LoggingOutlet_logErrorForEvent_featureId_reason___block_invoke;
  v15[3] = &unk_1E56C42A0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  dispatch_time_t v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(loggingQueue, v15);
}

void __55__PET2LoggingOutlet_logErrorForEvent_featureId_reason___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [PETStringPairs alloc];
  long long v6 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  long long v4 = [(PETStringPairs *)v2 initWithKeys:&unk_1EE090AB8 values:v3];

  BOOL v5 = +[PETLoggingUtils keyStringForEvent:@"error" featureId:@"framework" stringifiedProperties:v4 metaData:0];
  [*(id *)(a1 + 56) _dispatchBatchForKey:v5 value:1 isUpdate:0];
}

- (void)logDoubleValue:(double)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  loggingQueue = self->_loggingQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __86__PET2LoggingOutlet_logDoubleValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke;
  v21[3] = &unk_1E56C3E50;
  void v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  double v26 = a3;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(loggingQueue, v21);
}

void __86__PET2LoggingOutlet_logDoubleValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v2 pathForResource:@"pet1_histogram_buckets" ofType:@"plist"];

    if (v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v3];
      uint64_t v5 = *(void *)(a1 + 32);
      long long v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v4;
    }
    if (!*(void *)(*(void *)(a1 + 32) + 16))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to load histogram buckets for PET1 keys", buf, 2u);
      }
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 16);
      *(void *)(v8 + 16) = v7;
    }
  }
  id v10 = +[PETLoggingUtils keyStringForEvent:*(void *)(a1 + 40) featureId:*(void *)(a1 + 48) stringifiedProperties:*(void *)(a1 + 56) metaData:*(void *)(a1 + 64)];
  uint64_t v11 = [*(id *)(a1 + 32) _findBucketsForKey:v10];
  id v12 = v11;
  if (v11)
  {
    double v13 = *(double *)(a1 + 72);
    id v14 = [v11 sortedArrayUsingSelector:sel_compare_];
    id v15 = [NSNumber numberWithDouble:v13];
    unint64_t v16 = objc_msgSend(v14, "indexOfObject:inSortedRange:options:usingComparator:", v15, 0, objc_msgSend(v14, "count"), 1280, &__block_literal_global_110);

    if (v16 >= [v14 count])
    {
      uint64_t v19 = 0x7FF0000000000000;
    }
    else
    {
      id v17 = [v14 objectAtIndexedSubscript:v16];
      [v17 doubleValue];
      uint64_t v19 = v18;
    }
    uint64_t v20 = [NSString stringWithFormat:@"%@.[%f,%f]", v10, v19, v19];

    [*(id *)(a1 + 32) _dispatchBatchForKey:v20 value:1 isUpdate:0];
    id v10 = (void *)v20;
  }
}

- (id)_findBucketsForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_pet1HistogramBuckets;
  uint64_t v6 = [(NSDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v4, "hasPrefix:", v10, (void)v13))
        {
          uint64_t v11 = [(NSDictionary *)self->_pet1HistogramBuckets objectForKeyedSubscript:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return v11;
}

- (void)setUnsignedIntegerValue:(unint64_t)a3 forEvent:(id)a4 featureId:(id)a5 stringifiedProperties:(id)a6 metaData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  loggingQueue = self->_loggingQueue;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__PET2LoggingOutlet_setUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke;
  v21[3] = &unk_1E56C3E50;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  double v26 = self;
  unint64_t v27 = a3;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(loggingQueue, v21);
}

void __95__PET2LoggingOutlet_setUnsignedIntegerValue_forEvent_featureId_stringifiedProperties_metaData___block_invoke(uint64_t a1)
{
  id v2 = +[PETLoggingUtils keyStringForEvent:*(void *)(a1 + 32) featureId:*(void *)(a1 + 40) stringifiedProperties:*(void *)(a1 + 48) metaData:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) _dispatchBatchForKey:v2 value:*(void *)(a1 + 72) isUpdate:1];
}

- (PET2LoggingOutlet)init
{
  v12.receiver = self;
  v12.super_class = (Class)PET2LoggingOutlet;
  id v2 = [(PET2LoggingOutlet *)&v12 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v5 = dispatch_queue_create("PET2LoggingOutlet", v4);
    loggingQueue = v2->_loggingQueue;
    v2->_loggingQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    addKeys = v2->_addKeys;
    v2->_addKeys = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    updateKeys = v2->_updateKeys;
    v2->_updateKeys = (NSMutableDictionary *)v9;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  id v2 = (void *)sharedInstance_instance;

  return v2;
}

void __35__PET2LoggingOutlet_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x192FD4890]();
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;
}

@end