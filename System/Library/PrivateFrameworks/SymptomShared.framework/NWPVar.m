@interface NWPVar
+ (BOOL)supportsSecureCoding;
+ (id)_backgroundQueue;
+ (id)_defaultBackingStore;
+ (id)_fetchCheckpoint:(id)a3 isPrefix:(BOOL)a4;
+ (id)_serviceQueue;
+ (void)_setCustomBackingStore:(id)a3;
+ (void)setBackingStore:(id)a3;
+ (void)setLogHandle:(id)a3;
- (BOOL)selectModel:(unint64_t)a3;
- (BOOL)setInitialValue:(id)a3;
- (BOOL)setReward:(float)a3 onValue:(id)a4 forPredictionGenerationId:(id)a5;
- (BOOL)useScalarRange;
- (NSArray)referenceValues;
- (NSDictionary)allState;
- (NSDictionary)hyperParams;
- (NSSecureCoding)expectingRewardOn;
- (NSSecureCoding)firstValue;
- (NSString)exportLabel;
- (NSString)label;
- (NSUUID)durableId;
- (NWPVar)init;
- (NWPVar)initWithCoder:(id)a3;
- (id)_initToCopy;
- (id)_pullCounts;
- (id)checkpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFromCheckpoint:(id)a3 forLabel:(id)a4;
- (id)initFromLastCheckpointForLabel:(id)a3;
- (id)initInValueSpace:(id)a3 withLabel:(id)a4;
- (id)migrateToValueSpace:(id)a3;
- (id)predictValueGivenContext:(id)a3 generationId:(id *)a4;
- (id)telemetryReporter;
- (int64_t)_pruneOldCheckpoints;
- (unint64_t)logicalClock;
- (unint64_t)model;
- (unint64_t)pullCount;
- (void)_mirrorFrom:(id)a3;
- (void)_setToCleanSlate;
- (void)encodeWithCoder:(id)a3;
- (void)setAllState:(id)a3;
- (void)setDurableId:(id)a3;
- (void)setExpectingRewardOn:(id)a3;
- (void)setExportLabel:(id)a3;
- (void)setFirstValue:(id)a3;
- (void)setHyperParams:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLogicalClock:(unint64_t)a3;
- (void)setModel:(unint64_t)a3;
- (void)setPullCount:(unint64_t)a3;
- (void)setReferenceValues:(id)a3;
- (void)setTelemetryReporter:(id)a3;
- (void)setUseScalarRange:(BOOL)a3;
@end

@implementation NWPVar

+ (void)setLogHandle:(id)a3
{
}

- (NWPVar)init
{
  return 0;
}

- (id)initInValueSpace:(id)a3 withLabel:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6 && (uint64_t v8 = [v6 count], v7) && v8)
  {
    v16.receiver = self;
    v16.super_class = (Class)NWPVar;
    v9 = [(NWPVar *)&v16 init];
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_label, a4);
      uint64_t v11 = [v6 copy];
      referenceValues = v10->_referenceValues;
      v10->_referenceValues = (NSArray *)v11;

      [(NWPVar *)v10 _setToCleanSlate];
    }
    self = v10;
    v13 = self;
  }
  else
  {
    v14 = nwpvarLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_25E6D0000, v14, OS_LOG_TYPE_ERROR, "wrong argument: allValues %@, label %@", buf, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (id)initFromCheckpoint:(id)a3 forLabel:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = [NSString alloc];
    v10 = [v6 UUIDString];
    uint64_t v11 = [v9 initWithFormat:@"%s-%@-%@", "NWPVar", v8, v10];

    v12 = +[NWPVar _fetchCheckpoint:v11 isPrefix:0];
    if (v12)
    {
      v18.receiver = self;
      v18.super_class = (Class)NWPVar;
      v13 = [(NWPVar *)&v18 init];
      v14 = v13;
      if (v13) {
        [(NWPVar *)v13 _mirrorFrom:v12];
      }
      self = v14;
      v15 = self;
    }
    else
    {
      objc_super v16 = nwpvarLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        v22 = v8;
        _os_log_impl(&dword_25E6D0000, v16, OS_LOG_TYPE_ERROR, "identifier failed to recover valid object for: %@ and label: %@", buf, 0x16u);
      }

      v15 = 0;
    }
  }
  else
  {
    uint64_t v11 = nwpvarLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_25E6D0000, v11, OS_LOG_TYPE_ERROR, "wrong identifier: %@ or label: %@", buf, 0x16u);
    }
    v15 = 0;
  }

  return v15;
}

- (id)initFromLastCheckpointForLabel:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [[NSString alloc] initWithFormat:@"%s-%@", "NWPVar", v4];
    id v6 = +[NWPVar _fetchCheckpoint:v5 isPrefix:1];
    if (v6)
    {
      v12.receiver = self;
      v12.super_class = (Class)NWPVar;
      id v7 = [(NWPVar *)&v12 init];
      uint64_t v8 = v7;
      if (v7) {
        [(NWPVar *)v7 _mirrorFrom:v6];
      }
      self = v8;
      id v9 = self;
    }
    else
    {
      v10 = nwpvarLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_25E6D0000, v10, OS_LOG_TYPE_ERROR, "identifier failed to recover last valid object for label: %@", buf, 0xCu);
      }

      id v9 = 0;
    }
  }
  else
  {
    v5 = nwpvarLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = 0;
      _os_log_impl(&dword_25E6D0000, v5, OS_LOG_TYPE_ERROR, "wrong label: %@", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)_initToCopy
{
  v3.receiver = self;
  v3.super_class = (Class)NWPVar;
  return [(NWPVar *)&v3 init];
}

- (BOOL)setInitialValue:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NWPVar.m", 178, @"Subclasses must provide an impl for %s", "-[NWPVar setInitialValue:]");

  return 0;
}

- (BOOL)selectModel:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NWPVar.m", 184, @"Subclasses must provide an impl for %s", "-[NWPVar selectModel:]");

  return 0;
}

- (void)setHyperParams:(id)a3
{
  id v5 = a3;
  if (self->_hyperParams)
  {
    id v6 = (void *)[(NSDictionary *)self->_hyperParams mutableCopy];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    objc_super v12 = __25__NWPVar_setHyperParams___block_invoke;
    v13 = &unk_26552AD88;
    id v14 = self;
    id v15 = v6;
    id v7 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:&v10];
    uint64_t v8 = (NSDictionary *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
    hyperParams = self->_hyperParams;
    self->_hyperParams = v8;
  }
  else
  {
    objc_storeStrong((id *)&self->_hyperParams, a3);
  }
}

void __25__NWPVar_setHyperParams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v7];

      if (v6) {
        [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
      }
    }
  }
}

- (id)predictValueGivenContext:(id)a3 generationId:(id *)a4
{
  id v6 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, a4);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NWPVar.m", 209, @"Subclasses must provide an impl for %s", "-[NWPVar predictValueGivenContext:generationId:]");

  return 0;
}

- (BOOL)setReward:(float)a3 onValue:(id)a4 forPredictionGenerationId:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a4, a5);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NWPVar.m", 215, @"Subclasses must provide an impl for %s", "-[NWPVar setReward:onValue:forPredictionGenerationId:]");

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[NWPVar alloc] _initToCopy];
  id v5 = [(NWPVar *)self label];
  [v4 setLabel:v5];

  id v6 = [(NWPVar *)self exportLabel];
  [v4 setExportLabel:v6];

  objc_msgSend(v4, "setModel:", -[NWPVar model](self, "model"));
  objc_msgSend(v4, "setPullCount:", -[NWPVar pullCount](self, "pullCount"));
  id v7 = [(NWPVar *)self hyperParams];
  [v4 setHyperParams:v7];

  uint64_t v8 = [(NWPVar *)self allState];
  [v4 setAllState:v8];

  id v9 = [(NWPVar *)self referenceValues];
  [v4 setReferenceValues:v9];

  uint64_t v10 = [(NWPVar *)self firstValue];
  [v4 setFirstValue:v10];

  uint64_t v11 = [(NWPVar *)self expectingRewardOn];
  [v4 setExpectingRewardOn:v11];

  objc_msgSend(v4, "setLogicalClock:", -[NWPVar logicalClock](self, "logicalClock"));
  objc_super v12 = [(NWPVar *)self durableId];
  [v4 setDurableId:v12];

  objc_msgSend(v4, "setUseScalarRange:", -[NWPVar useScalarRange](self, "useScalarRange"));
  return v4;
}

- (void)_mirrorFrom:(id)a3
{
  id v4 = a3;
  id v5 = [v4 label];
  [(NWPVar *)self setLabel:v5];

  id v6 = [v4 exportLabel];
  [(NWPVar *)self setExportLabel:v6];

  -[NWPVar setModel:](self, "setModel:", [v4 model]);
  -[NWPVar setPullCount:](self, "setPullCount:", [v4 pullCount]);
  id v7 = [v4 hyperParams];
  [(NWPVar *)self setHyperParams:v7];

  uint64_t v8 = [v4 allState];
  [(NWPVar *)self setAllState:v8];

  id v9 = [v4 referenceValues];
  [(NWPVar *)self setReferenceValues:v9];

  uint64_t v10 = [v4 firstValue];
  [(NWPVar *)self setFirstValue:v10];

  uint64_t v11 = [v4 expectingRewardOn];
  [(NWPVar *)self setExpectingRewardOn:v11];

  -[NWPVar setLogicalClock:](self, "setLogicalClock:", [v4 logicalClock]);
  objc_super v12 = [v4 durableId];
  [(NWPVar *)self setDurableId:v12];

  uint64_t v13 = [v4 useScalarRange];
  [(NWPVar *)self setUseScalarRange:v13];
}

- (void)_setToCleanSlate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NWPVar *)self referenceValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v3 addObject:*(void *)(*((void *)&v12 + 1) + 8 * v9)];
        uint64_t v10 = objc_alloc_init(NWPVarValueItem);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v11 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3];
  [(NWPVar *)self setAllState:v11];

  [(NWPVar *)self setPullCount:0];
  [(NWPVar *)self setExpectingRewardOn:0];
  [(NWPVar *)self setDurableId:0];
}

+ (id)_serviceQueue
{
  if (_serviceQueue_onceToken != -1) {
    dispatch_once(&_serviceQueue_onceToken, &__block_literal_global_85);
  }
  v2 = (void *)_serviceQueue_service_queue;
  return v2;
}

uint64_t __23__NWPVar__serviceQueue__block_invoke()
{
  _serviceQueue_service_queue = (uint64_t)dispatch_queue_create("com.apple.symptoms.NWPVar", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)_backgroundQueue
{
  if (_backgroundQueue_onceToken != -1) {
    dispatch_once(&_backgroundQueue_onceToken, &__block_literal_global_88);
  }
  v2 = (void *)_backgroundQueue_background_queue;
  return v2;
}

void __26__NWPVar__backgroundQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.symptoms.NWPVar.background", v2);
  v1 = (void *)_backgroundQueue_background_queue;
  _backgroundQueue_background_queue = (uint64_t)v0;
}

+ (void)setBackingStore:(id)a3
{
}

+ (id)_defaultBackingStore
{
  return (id)_backingStore;
}

+ (id)_fetchCheckpoint:(id)a3 isPrefix:(BOOL)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  objc_super v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v6 = +[NWPVar _serviceQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__NWPVar__fetchCheckpoint_isPrefix___block_invoke;
  block[3] = &unk_26552ADB0;
  BOOL v13 = a4;
  id v11 = v5;
  long long v12 = &v14;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __36__NWPVar__fetchCheckpoint_isPrefix___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = +[NWPVar _defaultBackingStore];
  if (v2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"timeStamp" ascending:0];
      id v4 = [v2 listItemsNameWithPrefix:*(void *)(a1 + 32) sortDescriptor:v3];
      id v5 = v4;
      if (v4 && [v4 count])
      {
        uint64_t v6 = nwpvarLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          int v15 = 134218242;
          uint64_t v16 = [v5 count];
          __int16 v17 = 2112;
          objc_super v18 = (const char *)v5;
          _os_log_impl(&dword_25E6D0000, v6, OS_LOG_TYPE_DEBUG, "fetch returned %lu keys: %@", (uint8_t *)&v15, 0x16u);
        }

        id v7 = [v5 firstObject];
      }
      else
      {
        id v7 = 0;
      }

      if (v7) {
        goto LABEL_14;
      }
    }
    else
    {
      id v7 = *(id *)(a1 + 32);
      if (v7)
      {
LABEL_14:
        uint64_t v10 = [v2 fetchItemUnderName:v7 verificationBlock:0];
        uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
        long long v12 = *(NSObject **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
LABEL_20:

        goto LABEL_21;
      }
    }
    long long v12 = nwpvarLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = (const char *)&unk_25E6D8FE6;
      if (!*(unsigned char *)(a1 + 48)) {
        uint64_t v14 = "not ";
      }
      int v15 = 138412546;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      objc_super v18 = v14;
      _os_log_impl(&dword_25E6D0000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch %@, %sprefixed", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_20;
  }
  id v7 = nwpvarLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = (const char *)&unk_25E6D8FE6;
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v9 = "not ";
    }
    int v15 = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    objc_super v18 = v9;
    _os_log_impl(&dword_25E6D0000, v7, OS_LOG_TYPE_ERROR, "No backing store to fetch %@, %sprefixed", (uint8_t *)&v15, 0x16u);
  }
LABEL_21:
}

- (int64_t)_pruneOldCheckpoints
{
  v2 = +[NWPVar _defaultBackingStore];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F08A98];
    id v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-604800.0];
    id v5 = [v3 predicateWithFormat:@"%K BEGINSWITH %@ AND %K < %@", @"identifier", @"NWPVar", @"timeStamp", v4];

    int64_t v6 = [v2 deleteItemsMatchingPredicate:v5];
  }
  else
  {
    id v7 = nwpvarLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E6D0000, v7, OS_LOG_TYPE_ERROR, "No backing store to prune", buf, 2u);
    }

    int64_t v6 = 0;
  }

  return v6;
}

- (id)checkpoint
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = +[NWPVar _serviceQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __20__NWPVar_checkpoint__block_invoke;
  v6[3] = &unk_26552AE00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __20__NWPVar_checkpoint__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v2 = +[NWPVar _defaultBackingStore];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) durableId];

    if (!v3)
    {
      id v4 = [MEMORY[0x263F08C38] UUID];
      [*(id *)(a1 + 32) setDurableId:v4];
    }
    id v5 = [*(id *)(a1 + 32) copy];
    id v6 = [NSString alloc];
    uint64_t v7 = [*(id *)(a1 + 32) label];
    uint64_t v8 = [*(id *)(a1 + 32) durableId];
    uint64_t v9 = [v8 UUIDString];
    uint64_t v10 = (void *)[v6 initWithFormat:@"%s-%@-%@", "NWPVar", v7, v9];

    if ([v2 storeUnderName:v10 item:v5])
    {
      uint64_t v11 = [*(id *)(a1 + 32) durableId];
      uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    else
    {
      uint64_t v14 = nwpvarLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218242;
        uint64_t v23 = v15;
        __int16 v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_25E6D0000, v14, OS_LOG_TYPE_ERROR, "(%p) failed to archive and import as: %@", buf, 0x16u);
      }
    }
    uint64_t v16 = [MEMORY[0x263EFF910] now];
    __int16 v17 = v16;
    if (!checkpointsLastPruned || (objc_msgSend(v16, "timeIntervalSinceDate:"), v18 > 604800.0))
    {
      uint64_t v19 = +[NWPVar _serviceQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __20__NWPVar_checkpoint__block_invoke_108;
      block[3] = &unk_26552ADD8;
      void block[4] = *(void *)(a1 + 32);
      id v21 = v17;
      dispatch_async(v19, block);
    }
  }
  else
  {
    id v5 = nwpvarLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E6D0000, v5, OS_LOG_TYPE_ERROR, "No backing store to checkpoint to", buf, 2u);
    }
  }
}

void __20__NWPVar_checkpoint__block_invoke_108(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _pruneOldCheckpoints];
  id v3 = nwpvarLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 134218240;
    uint64_t v6 = v4;
    __int16 v7 = 2048;
    uint64_t v8 = v2;
    _os_log_impl(&dword_25E6D0000, v3, OS_LOG_TYPE_DEFAULT, "(%p) removed %ld stale checkpoints", (uint8_t *)&v5, 0x16u);
  }

  objc_storeStrong((id *)&checkpointsLastPruned, *(id *)(a1 + 40));
}

- (id)migrateToValueSpace:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWPVar)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NWPVar;
  int v5 = [(NWPVar *)&v24 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x2611E0E10]();
    uint64_t v7 = [v4 decodeObjectForKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"exportLabel"];
    exportLabel = v5->_exportLabel;
    v5->_exportLabel = (NSString *)v9;

    v5->_model = [v4 decodeIntegerForKey:@"model"];
    v5->_pullCount = [v4 decodeIntegerForKey:@"pullCount"];
    uint64_t v11 = [v4 decodeObjectForKey:@"hyperParams"];
    hyperParams = v5->_hyperParams;
    v5->_hyperParams = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"allState"];
    allState = v5->_allState;
    v5->_allState = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectForKey:@"referenceValues"];
    referenceValues = v5->_referenceValues;
    v5->_referenceValues = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"firstValue"];
    firstValue = v5->_firstValue;
    v5->_firstValue = (NSSecureCoding *)v17;

    uint64_t v19 = [v4 decodeObjectForKey:@"expectingRewardOn"];
    expectingRewardOn = v5->_expectingRewardOn;
    v5->_expectingRewardOn = (NSSecureCoding *)v19;

    v5->_logicalClock = [v4 decodeInt64ForKey:@"logicalClock"];
    uint64_t v21 = [v4 decodeObjectForKey:@"durableId"];
    durableId = v5->_durableId;
    v5->_durableId = (NSUUID *)v21;

    v5->_useScalarRange = [v4 decodeBoolForKey:@"useScalarRange"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  id v4 = (void *)MEMORY[0x2611E0E10]();
  int v5 = [(NWPVar *)self label];
  [v13 encodeObject:v5 forKey:@"label"];

  uint64_t v6 = [(NWPVar *)self exportLabel];
  [v13 encodeObject:v6 forKey:@"exportLabel"];

  objc_msgSend(v13, "encodeInteger:forKey:", -[NWPVar model](self, "model"), @"model");
  objc_msgSend(v13, "encodeInteger:forKey:", -[NWPVar pullCount](self, "pullCount"), @"pullCount");
  uint64_t v7 = [(NWPVar *)self hyperParams];
  [v13 encodeObject:v7 forKey:@"hyperParams"];

  uint64_t v8 = [(NWPVar *)self allState];
  [v13 encodeObject:v8 forKey:@"allState"];

  uint64_t v9 = [(NWPVar *)self referenceValues];
  [v13 encodeObject:v9 forKey:@"referenceValues"];

  uint64_t v10 = [(NWPVar *)self firstValue];
  [v13 encodeObject:v10 forKey:@"firstValue"];

  uint64_t v11 = [(NWPVar *)self expectingRewardOn];
  [v13 encodeObject:v11 forKey:@"expectingRewardOn"];

  objc_msgSend(v13, "encodeInt64:forKey:", -[NWPVar logicalClock](self, "logicalClock"), @"logicalClock");
  uint64_t v12 = [(NWPVar *)self durableId];
  [v13 encodeObject:v12 forKey:@"durableId"];

  objc_msgSend(v13, "encodeBool:forKey:", -[NWPVar useScalarRange](self, "useScalarRange"), @"useScalarRange");
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = "num";
  if (!self->_useScalarRange) {
    id v4 = "var";
  }
  int v5 = (void *)[v3 initWithFormat:@"(%p) label: %@, exportLabel: %@, model: %lu, pullCount: %lu, %s-range, initVal: %@, expecting: %@, logical-clock: %llu, state: %@", self, *(_OWORD *)&self->_label, self->_model, self->_pullCount, v4, self->_firstValue, self->_expectingRewardOn, self->_logicalClock, self->_allState];
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)exportLabel
{
  return self->_exportLabel;
}

- (void)setExportLabel:(id)a3
{
}

- (unint64_t)model
{
  return self->_model;
}

- (void)setModel:(unint64_t)a3
{
  self->_model = a3;
}

- (NSDictionary)hyperParams
{
  return self->_hyperParams;
}

- (unint64_t)pullCount
{
  return self->_pullCount;
}

- (void)setPullCount:(unint64_t)a3
{
  self->_pullCount = a3;
}

- (id)telemetryReporter
{
  return self->_telemetryReporter;
}

- (void)setTelemetryReporter:(id)a3
{
}

- (NSDictionary)allState
{
  return self->_allState;
}

- (void)setAllState:(id)a3
{
}

- (NSArray)referenceValues
{
  return self->_referenceValues;
}

- (void)setReferenceValues:(id)a3
{
}

- (NSSecureCoding)firstValue
{
  return self->_firstValue;
}

- (void)setFirstValue:(id)a3
{
}

- (NSSecureCoding)expectingRewardOn
{
  return self->_expectingRewardOn;
}

- (void)setExpectingRewardOn:(id)a3
{
}

- (unint64_t)logicalClock
{
  return self->_logicalClock;
}

- (void)setLogicalClock:(unint64_t)a3
{
  self->_logicalClock = a3;
}

- (NSUUID)durableId
{
  return self->_durableId;
}

- (void)setDurableId:(id)a3
{
}

- (BOOL)useScalarRange
{
  return self->_useScalarRange;
}

- (void)setUseScalarRange:(BOOL)a3
{
  self->_useScalarRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durableId, 0);
  objc_storeStrong((id *)&self->_expectingRewardOn, 0);
  objc_storeStrong((id *)&self->_firstValue, 0);
  objc_storeStrong((id *)&self->_referenceValues, 0);
  objc_storeStrong((id *)&self->_allState, 0);
  objc_storeStrong(&self->_telemetryReporter, 0);
  objc_storeStrong((id *)&self->_hyperParams, 0);
  objc_storeStrong((id *)&self->_exportLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (void)_setCustomBackingStore:(id)a3
{
}

- (id)_pullCounts
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NWPVar *)self allState];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [(NWPVar *)self allState];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "armPullCount"));
        [v3 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

@end