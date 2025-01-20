@interface MTMetricsData
- (BOOL)isAnonymous;
- (BOOL)samplingEnabled;
- (MTCallerSuppliedFields)callerSuppliedFields;
- (MTPromise)configBaseFields;
- (NSArray)additionalBaseData;
- (NSArray)additionalEventData;
- (NSArray)registeredEventData;
- (NSDictionary)baseFields;
- (NSDictionary)eventSpecificFields;
- (NSMutableArray)additionalData;
- (NSMutableArray)postProcessingBlocks;
- (NSMutableDictionary)performanceData;
- (id)composeFieldsMaps;
- (id)debugDescription;
- (id)getAdditionalData;
- (id)getPostProcessingBlocks;
- (id)recordEvent;
- (id)toDictionary;
- (id)userAndClientIDFields;
- (void)addFields:(id)a3;
- (void)addFieldsWithDictionary:(id)a3;
- (void)addFieldsWithPromise:(id)a3;
- (void)addPostProcessingBlock:(id)a3;
- (void)addPostProcessingBlocks:(id)a3;
- (void)cancelUnfinishedPromisedEventData;
- (void)setAdditionalBaseData:(id)a3;
- (void)setAdditionalData:(id)a3;
- (void)setAdditionalEventData:(id)a3;
- (void)setAnonymous:(BOOL)a3;
- (void)setBaseFields:(id)a3;
- (void)setCallerSuppliedFields:(id)a3;
- (void)setConfigBaseFields:(id)a3;
- (void)setEventSpecificFields:(id)a3;
- (void)setPerformanceData:(id)a3;
- (void)setPostProcessingBlocks:(id)a3;
- (void)setRegisteredEventData:(id)a3;
- (void)setSamplingEnabled:(BOOL)a3;
@end

@implementation MTMetricsData

- (id)getAdditionalData
{
  additionalData = self->_additionalData;
  if (!additionalData)
  {
    v4 = [MEMORY[0x263EFF980] array];
    v5 = self->_additionalData;
    self->_additionalData = v4;

    additionalData = self->_additionalData;
  }

  return additionalData;
}

- (void)addFields:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MTMetricsData *)v5 getAdditionalData];
  v12 = (id *)&v13;
  id v7 = v4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 addObjectsFromArray:v9];
      }
      else {
        [v6 addObject:v9];
      }
      v10 = v12++;
      id v11 = *v10;

      v9 = v11;
    }
    while (v11);
  }

  objc_sync_exit(v5);
}

- (void)addFieldsWithDictionary:(id)a3
{
}

- (void)addFieldsWithPromise:(id)a3
{
}

- (id)getPostProcessingBlocks
{
  postProcessingBlocks = self->_postProcessingBlocks;
  if (!postProcessingBlocks)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = self->_postProcessingBlocks;
    self->_postProcessingBlocks = v4;

    postProcessingBlocks = self->_postProcessingBlocks;
  }

  return postProcessingBlocks;
}

- (void)addPostProcessingBlock:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MTMetricsData *)v4 getPostProcessingBlocks];
  v6 = (void *)MEMORY[0x21D465290](v7);
  [v5 addObject:v6];

  objc_sync_exit(v4);
}

- (void)addPostProcessingBlocks:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(MTMetricsData *)v4 getPostProcessingBlocks];
  [v5 addObjectsFromArray:v6];

  objc_sync_exit(v4);
}

- (id)composeFieldsMaps
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(MTMetricsData *)self registeredEventData];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(MTMetricsData *)self registeredEventData];
    [v3 addObjectsFromArray:v6];
  }
  id v7 = [(MTMetricsData *)self baseFields];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [(MTMetricsData *)self baseFields];
    [v3 addObject:v9];
  }
  v10 = [(MTMetricsData *)self additionalBaseData];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(MTMetricsData *)self additionalBaseData];
    [v3 addObjectsFromArray:v12];
  }
  uint64_t v13 = [(MTMetricsData *)self eventSpecificFields];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [(MTMetricsData *)self eventSpecificFields];
    [v3 addObject:v15];
  }
  v16 = [(MTMetricsData *)self additionalEventData];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [(MTMetricsData *)self additionalEventData];
    [v3 addObjectsFromArray:v18];
  }
  v19 = [(MTMetricsData *)self configBaseFields];

  if (v19)
  {
    v20 = [(MTMetricsData *)self configBaseFields];
    [v3 addObject:v20];
  }
  v21 = [(MTMetricsData *)self callerSuppliedFields];
  v22 = [v21 eventData];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    v24 = [(MTMetricsData *)self callerSuppliedFields];
    v25 = [v24 eventData];
    [v3 addObjectsFromArray:v25];
  }
  v26 = [(MTMetricsData *)self additionalData];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    v28 = [(MTMetricsData *)self additionalData];
    [v3 addObjectsFromArray:v28];
  }
  v29 = (void *)[v3 copy];

  return v29;
}

- (id)toDictionary
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTMetricsData *)v2 composeFieldsMaps];
  id v4 = [(MTMetricsData *)v2 postProcessingBlocks];
  uint64_t v5 = (void *)[v4 copy];

  objc_sync_exit(v2);
  id v6 = +[MTPromise promiseWithComposition:v3];
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  v26 = __29__MTMetricsData_toDictionary__block_invoke;
  uint64_t v27 = &unk_26430FC28;
  id v28 = v5;
  v29 = v2;
  id v7 = v5;
  uint64_t v8 = [v6 thenWithBlock:&v24];

  v9 = [(MTObject *)v2 metricsKit];
  v10 = [v9 system];
  uint64_t v11 = [v10 treatmentFilter];
  uint64_t v12 = [v11 apply:v8];
  uint64_t v13 = (void *)v12;
  if (v12) {
    uint64_t v14 = (void *)v12;
  }
  else {
    uint64_t v14 = v8;
  }
  id v15 = v14;

  v16 = [(MTObject *)v2 metricsKit];
  uint64_t v17 = [v16 system];
  v18 = [v17 eventFilter];
  uint64_t v19 = [v18 apply:v15];
  v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = v15;
  }
  id v22 = v21;

  return v22;
}

id __29__MTMetricsData_toDictionary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_msgSend(v3, "mt_verifyEventData");
  id v4 = +[MTReflectUtil mergeAndCleanDictionaries:v3];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  if ([*(id *)(a1 + 40) isAnonymous])
  {
    v10 = objc_msgSend(MEMORY[0x263EFF9D0], "null", (void)v20);
    [v4 setObject:v10 forKeyedSubscript:@"dsId"];
  }
  if (objc_msgSend(v4, "count", (void)v20))
  {
    uint64_t v17 = (void *)[v4 copy];
    +[MTPromise promiseWithResult:v17];
  }
  else
  {
    uint64_t v17 = MTError(301, @"The metrics data for the event is empty. Please make sure there are fields provided for the event.", v11, v12, v13, v14, v15, v16, v20);
    +[MTPromise promiseWithError:v17];
  v18 = };

  return v18;
}

- (id)userAndClientIDFields
{
  v2 = [(MTMetricsData *)self toDictionary];
  id v3 = [v2 thenWithBlock:&__block_literal_global_7];

  return v3;
}

id __38__MTMetricsData_userAndClientIDFields__block_invoke(uint64_t a1, void *a2)
{
  v19[3] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v19[0] = @"dsId";
  v19[1] = @"userId";
  v19[2] = @"clientId";
  [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
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
        v10 = objc_msgSend(v2, "objectForKeyedSubscript:", v9, (void)v14);
        if (v10) {
          [v3 setObject:v10 forKeyedSubscript:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v11 = (void *)[v3 copy];
  uint64_t v12 = +[MTPromise promiseWithResult:v11];

  return v12;
}

- (void)cancelUnfinishedPromisedEventData
{
  id v3 = [(MTMetricsData *)self callerSuppliedFields];
  id v4 = [v3 eventData];
  +[MTPromise cancelPromisesInComposition:v4];

  uint64_t v5 = [(MTMetricsData *)self baseFields];
  +[MTPromise cancelPromisesInComposition:v5];

  uint64_t v6 = [(MTMetricsData *)self additionalBaseData];
  +[MTPromise cancelPromisesInComposition:v6];

  uint64_t v7 = [(MTMetricsData *)self eventSpecificFields];
  +[MTPromise cancelPromisesInComposition:v7];

  uint64_t v8 = [(MTMetricsData *)self additionalEventData];
  +[MTPromise cancelPromisesInComposition:v8];

  uint64_t v9 = [(MTMetricsData *)self configBaseFields];
  +[MTPromise cancelPromisesInComposition:v9];

  id v10 = [(MTMetricsData *)self additionalData];
  +[MTPromise cancelPromisesInComposition:v10];
}

- (id)recordEvent
{
  id v3 = [(MTMetricsData *)self toDictionary];
  id v4 = [(MTObject *)self metricsKit];
  uint64_t v5 = [v4 config];
  double v6 = (double)[v5 eventDataTimeout] / 1000.0;

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __28__MTMetricsData_recordEvent__block_invoke;
  v14[3] = &unk_264310248;
  v14[4] = self;
  uint64_t v7 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:0 repeats:v14 block:v6];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __28__MTMetricsData_recordEvent__block_invoke_10;
  v12[3] = &unk_264310270;
  id v13 = v7;
  id v8 = v7;
  [v3 addFinishBlock:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __28__MTMetricsData_recordEvent__block_invoke_2;
  v11[3] = &unk_26430F898;
  v11[4] = self;
  uint64_t v9 = [v3 thenWithBlock:v11];
  [v9 addErrorBlock:&__block_literal_global_14];

  return v9;
}

uint64_t __28__MTMetricsData_recordEvent__block_invoke(uint64_t a1)
{
  int v2 = atomic_load((unsigned int *)&_block_invoke_logCount);
  if (v2 <= 199)
  {
    atomic_fetch_add_explicit(&_block_invoke_logCount, 1u, memory_order_relaxed);
    id v3 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_218211000, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: Some promises in metrics data timed out", v5, 2u);
    }
  }
  return [*(id *)(a1 + 32) cancelUnfinishedPromisedEventData];
}

uint64_t __28__MTMetricsData_recordEvent__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id __28__MTMetricsData_recordEvent__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![*(id *)(a1 + 32) samplingEnabled]) {
    goto LABEL_5;
  }
  id v4 = [*(id *)(a1 + 32) metricsKit];
  uint64_t v5 = [v4 sampling];

  if (!v5 || [v5 isSampledInWithMetricsData:v3])
  {

LABEL_5:
    uint64_t v5 = [*(id *)(a1 + 32) metricsKit];
    double v6 = [v5 system];
    uint64_t v7 = [v6 eventRecorder];
    id v8 = [v7 recordEvent:v3 shouldSkipValidation:1];

    goto LABEL_6;
  }
  id v8 = +[MTPromise promiseWithResult:v3];
LABEL_6:

  return v8;
}

void __28__MTMetricsData_recordEvent__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v3 = atomic_load((unsigned int *)&_block_invoke_2_logCount);
  if (v3 <= 199)
  {
    atomic_fetch_add_explicit(&_block_invoke_2_logCount, 1u, memory_order_relaxed);
    id v4 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v2;
      _os_log_impl(&dword_218211000, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Metrics event was not recorded. Error: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)debugDescription
{
  int v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [(MTMetricsData *)self callerSuppliedFields];
  uint64_t v7 = [(MTMetricsData *)self baseFields];
  id v8 = [(MTMetricsData *)self eventSpecificFields];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p, callerSuppliedFields: %@\nbaseFields: %@\neventSpecificFields: %@", v5, self, v6, v7, v8];

  id v10 = [(MTMetricsData *)self performanceData];

  if (v10)
  {
    uint64_t v11 = [(MTMetricsData *)self performanceData];
    [v9 appendFormat:@"\nperformanceData: %@", v11];
  }
  [v9 appendString:@">"];
  uint64_t v12 = (void *)[v9 copy];

  return v12;
}

- (BOOL)isAnonymous
{
  return self->_anonymous;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_anonymous = a3;
}

- (NSArray)registeredEventData
{
  return self->_registeredEventData;
}

- (void)setRegisteredEventData:(id)a3
{
}

- (NSDictionary)baseFields
{
  return self->_baseFields;
}

- (void)setBaseFields:(id)a3
{
}

- (NSArray)additionalBaseData
{
  return self->_additionalBaseData;
}

- (void)setAdditionalBaseData:(id)a3
{
}

- (NSDictionary)eventSpecificFields
{
  return self->_eventSpecificFields;
}

- (void)setEventSpecificFields:(id)a3
{
}

- (NSArray)additionalEventData
{
  return self->_additionalEventData;
}

- (void)setAdditionalEventData:(id)a3
{
}

- (MTPromise)configBaseFields
{
  return self->_configBaseFields;
}

- (void)setConfigBaseFields:(id)a3
{
}

- (MTCallerSuppliedFields)callerSuppliedFields
{
  return self->_callerSuppliedFields;
}

- (void)setCallerSuppliedFields:(id)a3
{
}

- (NSMutableArray)additionalData
{
  return self->_additionalData;
}

- (void)setAdditionalData:(id)a3
{
}

- (NSMutableDictionary)performanceData
{
  return self->_performanceData;
}

- (void)setPerformanceData:(id)a3
{
}

- (NSMutableArray)postProcessingBlocks
{
  return self->_postProcessingBlocks;
}

- (void)setPostProcessingBlocks:(id)a3
{
}

- (BOOL)samplingEnabled
{
  return self->_samplingEnabled;
}

- (void)setSamplingEnabled:(BOOL)a3
{
  self->_samplingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingBlocks, 0);
  objc_storeStrong((id *)&self->_performanceData, 0);
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_callerSuppliedFields, 0);
  objc_storeStrong((id *)&self->_configBaseFields, 0);
  objc_storeStrong((id *)&self->_additionalEventData, 0);
  objc_storeStrong((id *)&self->_eventSpecificFields, 0);
  objc_storeStrong((id *)&self->_additionalBaseData, 0);
  objc_storeStrong((id *)&self->_baseFields, 0);

  objc_storeStrong((id *)&self->_registeredEventData, 0);
}

@end