@interface PLClientLogAggregator
+ (id)sharedInstance;
- (BOOL)_aggregateForClientID:(id)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6;
- (BOOL)_isEventInputValid:(id)a3 configuration:(id)a4;
- (BOOL)_setEventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6 value:(id)a7;
- (BOOL)aggregateForClientID_async:(signed __int16)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6;
- (NSMutableDictionary)aggregatesCache;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_source)flushTimer;
- (OS_os_log)logHandle;
- (PLClientLogAggregator)init;
- (id)_eventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6;
- (unsigned)numAggregates;
- (unsigned)numAggregations;
- (void)_flushToPowerLog;
- (void)_scheduleFlushTimer;
- (void)cleanCache;
- (void)setExecutionQueue:(id)a3;
- (void)setFlushTimer:(id)a3;
- (void)setLogHandle:(id)a3;
- (void)setNumAggregates:(unsigned __int8)a3;
- (void)setNumAggregations:(unsigned __int8)a3;
@end

@implementation PLClientLogAggregator

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __39__PLClientLogAggregator_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(PLClientLogAggregator);
  return MEMORY[0x1F41817F8]();
}

- (PLClientLogAggregator)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLClientLogAggregator;
  v2 = [(PLClientLogAggregator *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    aggregatesCache = v2->_aggregatesCache;
    v2->_aggregatesCache = v3;

    *(_WORD *)&v2->_numAggregates = 0;
    os_log_t v5 = os_log_create("com.apple.powerlog.clientLogAggregator", "");
    logHandle = v2->_logHandle;
    v2->_logHandle = (OS_os_log *)v5;

    if (!v2->_logHandle) {
      objc_storeStrong((id *)&v2->_logHandle, MEMORY[0x1E4F14500]);
    }
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v8 = dispatch_queue_create("PLClientLogAggregator", v7);
    executionQueue = v2->_executionQueue;
    v2->_executionQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (void)_scheduleFlushTimer
{
  v3 = [(PLClientLogAggregator *)self flushTimer];

  if (!v3)
  {
    v4 = [(PLClientLogAggregator *)self executionQueue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    [(PLClientLogAggregator *)self setFlushTimer:v5];

    v6 = [(PLClientLogAggregator *)self flushTimer];
    dispatch_time_t v7 = dispatch_walltime(0, 900000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x14F46B0400uLL);

    dispatch_queue_t v8 = [(PLClientLogAggregator *)self flushTimer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __44__PLClientLogAggregator__scheduleFlushTimer__block_invoke;
    handler[3] = &unk_1E5A45DA0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    v9 = [(PLClientLogAggregator *)self flushTimer];
    dispatch_resume(v9);
  }
}

uint64_t __44__PLClientLogAggregator__scheduleFlushTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushToPowerLog];
}

- (BOOL)aggregateForClientID_async:(signed __int16)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v13 = [(PLClientLogAggregator *)self executionQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__PLClientLogAggregator_aggregateForClientID_async_eventName_eventDictionary_configuration___block_invoke;
  v18[3] = &unk_1E5A45FA0;
  id v21 = v12;
  v22 = &v24;
  signed __int16 v23 = a3;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v18);

  LOBYTE(self) = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  return (char)self;
}

void __92__PLClientLogAggregator_aggregateForClientID_async_eventName_eventDictionary_configuration___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithShort:*(__int16 *)(a1 + 72)];
  v3 = (void *)[*(id *)(a1 + 40) copy];
  v4 = (void *)[*(id *)(a1 + 48) copy];
  dispatch_source_t v5 = (void *)[*(id *)(a1 + 56) copy];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v2 _aggregateForClientID:v6 eventName:v3 eventDictionary:v4 configuration:v5];
}

- (BOOL)_aggregateForClientID:(id)a3 eventName:(id)a4 eventDictionary:(id)a5 configuration:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v43 = a5;
  id v12 = a6;
  v13 = v12;
  BOOL v14 = 0;
  v40 = v10;
  if (v10 && v11 && v43 && v12)
  {
    id v15 = [(PLClientLogAggregator *)self logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v51 = v10;
      __int16 v52 = 2112;
      id v53 = v11;
      __int16 v54 = 2112;
      id v55 = v43;
      __int16 v56 = 2112;
      v57 = v13;
      _os_log_debug_impl(&dword_1A11A5000, v15, OS_LOG_TYPE_DEBUG, "Received (clientID:%@, eventName:%@, eventDictionary:%@) for aggregation with configuration:%@", buf, 0x2Au);
    }

    if ([(PLClientLogAggregator *)self _isEventInputValid:v43 configuration:v13])
    {
      id v16 = [v13 allKeysForObject:&unk_1EF450778];
      if ([v16 count])
      {
        v17 = [MEMORY[0x1E4F1CA98] null];
        v18 = [v43 objectsForKeys:v16 notFoundMarker:v17];

        id v19 = [MEMORY[0x1E4F1CA98] null];
        id v20 = v16;
        uint64_t v21 = [v18 indexOfObject:v19];

        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {

          v39 = 0;
          BOOL v14 = 0;
LABEL_31:

          goto LABEL_32;
        }
        v34 = v20;
        v39 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v18 forKeys:v20];
      }
      else
      {
        v34 = v16;
        v39 = &unk_1EF450B30;
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v36 = v13;
      id v22 = v13;
      uint64_t v42 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v42)
      {
        uint64_t v41 = *(void *)v46;
        v37 = self;
        id v38 = v22;
        while (2)
        {
          for (uint64_t i = 0; i != v42; ++i)
          {
            if (*(void *)v46 != v41) {
              objc_enumerationMutation(v22);
            }
            uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            context = (void *)MEMORY[0x1A622E6D0]();
            v25 = [v22 objectForKeyedSubscript:v24];
            if ([v25 unsignedIntValue])
            {
              unsigned int v26 = [v25 unsignedIntValue] - 1;
              if (v26 > 3)
              {

                BOOL v14 = 0;
                id v20 = v34;
                v13 = v36;
                goto LABEL_31;
              }
              uint64_t v27 = (uint64_t)*(&off_1E5A45FE0 + (int)v26);
              v28 = [v43 objectForKeyedSubscript:v24];

              if (v28)
              {
                v29 = [(PLClientLogAggregator *)self _eventAggregate:v40 eventName:v11 aggregateKey:v39 valueLabel:v24];
                v30 = [v43 objectForKeyedSubscript:v24];
                v31 = (*(void (**)(uint64_t, void *, void *))(v27 + 16))(v27, v29, v30);

                id v22 = v38;
                self = v37;
                [(PLClientLogAggregator *)v37 _setEventAggregate:v40 eventName:v11 aggregateKey:v39 valueLabel:v24 value:v31];
              }
            }
          }
          uint64_t v42 = [v22 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v42) {
            continue;
          }
          break;
        }
      }

      [(PLClientLogAggregator *)self setNumAggregations:([(PLClientLogAggregator *)self numAggregations] + 1)];
      if ([(PLClientLogAggregator *)self numAggregations] == 1) {
        [(PLClientLogAggregator *)self _scheduleFlushTimer];
      }
      unsigned int v32 = [(PLClientLogAggregator *)self numAggregations];
      id v20 = v35;
      if (v32 >= 0x14) {
        [(PLClientLogAggregator *)self _flushToPowerLog];
      }
      BOOL v14 = 1;
      v13 = v36;
      goto LABEL_31;
    }
    BOOL v14 = 0;
  }
LABEL_32:

  return v14;
}

- (BOOL)_isEventInputValid:(id)a3 configuration:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 != [v7 count])
  {
    v9 = [(PLClientLogAggregator *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLClientLogAggregator _isEventInputValid:configuration:].cold.5(v6, v7, v9);
    }
    goto LABEL_31;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v24 = self;
    char v25 = 0;
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v19 = [(PLClientLogAggregator *)v24 logHandle];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogAggregator _isEventInputValid:configuration:].cold.4(v14, v19);
          }

          goto LABEL_31;
        }
        id v15 = [v7 objectForKey:v14];
        if (!v15
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
          || (unint64_t)[v15 unsignedIntegerValue] >= 5)
        {
          v18 = [(PLClientLogAggregator *)v24 logHandle];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[PLClientLogAggregator _isEventInputValid:configuration:]();
          }

          goto LABEL_31;
        }
        id v16 = [v9 objectForKey:v14];
        if ([v15 unsignedIntegerValue])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v21 = [(PLClientLogAggregator *)v24 logHandle];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              unsigned int v22 = [v15 unsignedIntegerValue];
              if (v22 > 4) {
                signed __int16 v23 = @"(null)";
              }
              else {
                signed __int16 v23 = off_1E5A46000[v22];
              }
              *(_DWORD *)buf = 138412802;
              uint64_t v31 = v14;
              __int16 v32 = 2112;
              v33 = v16;
              __int16 v34 = 2112;
              v35 = v23;
              _os_log_debug_impl(&dword_1A11A5000, v21, OS_LOG_TYPE_DEBUG, "Invalid event data -- value for %@: %@ (according to configuration, %@ expects NSNumber)", buf, 0x20u);
            }
LABEL_38:

            goto LABEL_31;
          }
          char v25 = 1;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v21 = [(PLClientLogAggregator *)v24 logHandle];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
                -[PLClientLogAggregator _isEventInputValid:configuration:]();
              }
              goto LABEL_38;
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    self = v24;
    if (v25)
    {
      BOOL v17 = 1;
      goto LABEL_32;
    }
  }
  else
  {
  }
  v9 = [(PLClientLogAggregator *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLClientLogAggregator _isEventInputValid:configuration:](v9);
  }
LABEL_31:

  BOOL v17 = 0;
LABEL_32:

  return v17;
}

- (void)_flushToPowerLog
{
  int v7 = [a2 numAggregations];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A11A5000, a4, OS_LOG_TYPE_DEBUG, "# of aggregations before flush: %d", a1, 8u);
}

- (void)cleanCache
{
  v3 = [(PLClientLogAggregator *)self aggregatesCache];
  [v3 removeAllObjects];

  [(PLClientLogAggregator *)self setNumAggregates:0];
  [(PLClientLogAggregator *)self setNumAggregations:0];
}

- (id)_eventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(PLClientLogAggregator *)self aggregatesCache];
  id v15 = [v14 objectForKeyedSubscript:v13];

  id v16 = [v15 objectForKeyedSubscript:v12];

  BOOL v17 = [v16 objectForKeyedSubscript:v11];

  v18 = [v17 objectForKeyedSubscript:v10];

  return v18;
}

- (BOOL)_setEventAggregate:(id)a3 eventName:(id)a4 aggregateKey:(id)a5 valueLabel:(id)a6 value:(id)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [(PLClientLogAggregator *)self aggregatesCache];
  v18 = [v17 objectForKeyedSubscript:v12];

  if (!v18)
  {
    id v19 = objc_opt_new();
    id v20 = [(PLClientLogAggregator *)self aggregatesCache];
    [v20 setObject:v19 forKeyedSubscript:v12];
  }
  v64 = v15;
  uint64_t v21 = [(PLClientLogAggregator *)self aggregatesCache];
  unsigned int v22 = [v21 objectForKeyedSubscript:v12];
  signed __int16 v23 = [v22 objectForKeyedSubscript:v13];

  if (!v23)
  {
    uint64_t v24 = objc_opt_new();
    char v25 = [(PLClientLogAggregator *)self aggregatesCache];
    long long v26 = [v25 objectForKeyedSubscript:v12];
    [v26 setObject:v24 forKeyedSubscript:v13];
  }
  long long v27 = [MEMORY[0x1E4F1C9C8] date];
  [v27 timeIntervalSince1970];
  double v29 = v28;

  v30 = [(PLClientLogAggregator *)self aggregatesCache];
  uint64_t v31 = [v30 objectForKeyedSubscript:v12];
  __int16 v32 = [v31 objectForKeyedSubscript:v13];
  v33 = [v32 objectForKeyedSubscript:v14];

  if (!v33)
  {
    __int16 v34 = objc_opt_new();
    v35 = [(PLClientLogAggregator *)self aggregatesCache];
    v36 = [v35 objectForKeyedSubscript:v12];
    uint64_t v37 = [v36 objectForKeyedSubscript:v13];
    [v37 setObject:v34 forKeyedSubscript:v14];

    id v38 = [NSNumber numberWithDouble:v29];
    v39 = [(PLClientLogAggregator *)self aggregatesCache];
    v40 = [v39 objectForKeyedSubscript:v12];
    uint64_t v41 = [v40 objectForKeyedSubscript:v13];
    uint64_t v42 = [v41 objectForKeyedSubscript:v14];
    [v42 setObject:v38 forKeyedSubscript:@"__firstTimestamp"];

    id v43 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLClientLogAggregator numAggregates](self, "numAggregates"));
    v44 = [(PLClientLogAggregator *)self aggregatesCache];
    long long v45 = [v44 objectForKeyedSubscript:v12];
    long long v46 = [v45 objectForKeyedSubscript:v13];
    long long v47 = [v46 objectForKeyedSubscript:v14];
    [v47 setObject:v43 forKeyedSubscript:@"__number"];

    [(PLClientLogAggregator *)self setNumAggregates:([(PLClientLogAggregator *)self numAggregates] + 1)];
  }
  long long v48 = [(PLClientLogAggregator *)self aggregatesCache];
  v49 = [v48 objectForKeyedSubscript:v12];
  v50 = [v49 objectForKeyedSubscript:v13];
  id v51 = [v50 objectForKeyedSubscript:v14];
  [v51 setObject:v16 forKeyedSubscript:v64];

  __int16 v52 = [NSNumber numberWithDouble:v29];
  id v53 = [(PLClientLogAggregator *)self aggregatesCache];
  __int16 v54 = [v53 objectForKeyedSubscript:v12];
  id v55 = [v54 objectForKeyedSubscript:v13];
  __int16 v56 = [v55 objectForKeyedSubscript:v14];
  [v56 setObject:v52 forKeyedSubscript:@"__lastTimestamp"];

  v57 = [(PLClientLogAggregator *)self logHandle];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    v59 = [(PLClientLogAggregator *)self aggregatesCache];
    v60 = [v59 objectForKeyedSubscript:v12];
    v61 = [v60 objectForKeyedSubscript:v13];
    v62 = [v61 objectForKeyedSubscript:v14];
    v63 = [v62 objectForKeyedSubscript:@"__number"];
    *(_DWORD *)buf = 138412546;
    v66 = v63;
    __int16 v67 = 2112;
    v68 = v64;
    _os_log_debug_impl(&dword_1A11A5000, v57, OS_LOG_TYPE_DEBUG, "-- Updated aggregated event #%@ (key: %@)", buf, 0x16u);
  }
  return 1;
}

- (NSMutableDictionary)aggregatesCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)numAggregates
{
  return self->_numAggregates;
}

- (void)setNumAggregates:(unsigned __int8)a3
{
  self->_numAggregates = a3;
}

- (unsigned)numAggregations
{
  return self->_numAggregations;
}

- (void)setNumAggregations:(unsigned __int8)a3
{
  self->_numAggregations = a3;
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (OS_dispatch_queue)executionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExecutionQueue:(id)a3
{
}

- (OS_dispatch_source)flushTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFlushTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_aggregatesCache, 0);
}

- (void)_isEventInputValid:(os_log_t)log configuration:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11A5000, log, OS_LOG_TYPE_DEBUG, "Invalid configuration -- expected at least one numeric AggregateType key", v1, 2u);
}

- (void)_isEventInputValid:configuration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1A11A5000, v0, v1, "Invalid configuration -- value for %@: %@ (expected AggregateType)");
}

- (void)_isEventInputValid:configuration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_1A11A5000, v0, v1, "Invalid event data -- GROUP_BY on %@: %@ (expected NSString or NSNumber)");
}

- (void)_isEventInputValid:(uint64_t)a1 configuration:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A11A5000, a2, OS_LOG_TYPE_DEBUG, "Invalid event data -- %@ key (expected NSString)", (uint8_t *)&v2, 0xCu);
}

- (void)_isEventInputValid:(NSObject *)a3 configuration:.cold.5(void *a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218240;
  uint64_t v6 = [a1 count];
  __int16 v7 = 2048;
  uint64_t v8 = [a2 count];
  _os_log_debug_impl(&dword_1A11A5000, a3, OS_LOG_TYPE_DEBUG, "Invalid configuration -- event data (%lu) and configuration (%lu) should have the same number of keys", (uint8_t *)&v5, 0x16u);
}

@end