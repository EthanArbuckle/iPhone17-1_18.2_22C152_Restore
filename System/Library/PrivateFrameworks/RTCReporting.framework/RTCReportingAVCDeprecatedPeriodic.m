@interface RTCReportingAVCDeprecatedPeriodic
- (BOOL)registerPeriodicTaskForModule:(unsigned int)a3 needToUpdate:(BOOL)a4 needToReport:(BOOL)a5 serviceBlock:(id)a6;
- (BOOL)unregisterPeriodTaskForModule:(unsigned int)a3;
- (RTCReportingAVCDeprecatedPeriodic)initWithSession:(id)a3;
- (void)_myPeriodicTask:(unsigned __int16)a3 type:(unsigned __int16)a4 intervalMultiplier:(int)a5 updateTimeout:(unint64_t)a6;
- (void)dealloc;
- (void)startLogTimerWithInterval:(int)a3 reportingMultiplier:(int)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6;
- (void)stopLogTimer;
@end

@implementation RTCReportingAVCDeprecatedPeriodic

- (RTCReportingAVCDeprecatedPeriodic)initWithSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RTCReportingAVCDeprecatedPeriodic;
  v4 = [(RTCReportingAVCDeprecatedPeriodic *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_session = (RTCReporting *)a3;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.RTCPeriodicTask", v6);
    v7 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INITIATED, 0);
    v5->_periodicTaskQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.PeriodicReportingTask", v7);
    v5->_periodicServiceDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v5;
}

- (void)dealloc
{
  if (self->_timer) {
    [(RTCReportingAVCDeprecatedPeriodic *)self stopLogTimer];
  }

  dispatch_release((dispatch_object_t)self->_queue);
  dispatch_release((dispatch_object_t)self->_periodicTaskQueue);
  v3.receiver = self;
  v3.super_class = (Class)RTCReportingAVCDeprecatedPeriodic;
  [(RTCReportingAVCDeprecatedPeriodic *)&v3 dealloc];
}

- (void)_myPeriodicTask:(unsigned __int16)a3 type:(unsigned __int16)a4 intervalMultiplier:(int)a5 updateTimeout:(unint64_t)a6
{
  uint64_t v8 = a4;
  uint64_t v9 = a3;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  ++self->_counter;
  BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v11) {
    -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.9(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  group = dispatch_group_create();
  v19 = dispatch_semaphore_create(4);
  if (self->_counter == a5)
  {
    id v104 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v121 = 0;
    v122 = &v121;
    uint64_t v123 = 0x6010000000;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v129 = 0;
    v124 = "";
    uint64_t v125 = 850045863;
    v20 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_periodicServiceDict, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global);
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v113 objects:v120 count:16];
    if (v21)
    {
      unsigned int v103 = v8;
      uint64_t v22 = *(void *)v114;
      int64_t v23 = 95000000000 * a6 / 0x64;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v114 != v22) {
            objc_enumerationMutation(v20);
          }
          v25 = (void *)[(NSMutableDictionary *)self->_periodicServiceDict objectForKey:*(void *)(*((void *)&v113 + 1) + 8 * i)];
          if ([v25 report])
          {
            dispatch_time_t v26 = dispatch_time(0, v23);
            if (dispatch_semaphore_wait(v19, v26))
            {
              BOOL v44 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
              uint64_t v9 = v9;
              uint64_t v8 = v103;
              if (v44) {
                -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.5(v44, v45, v46, v47, v48, v49, v50, v51);
              }
              goto LABEL_40;
            }
            periodicTaskQueue = self->_periodicTaskQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_27;
            block[3] = &unk_1E576F2C0;
            block[4] = v25;
            block[5] = v104;
            block[6] = v19;
            block[7] = &v121;
            dispatch_group_async(group, periodicTaskQueue, block);
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v113 objects:v120 count:16];
        if (v21) {
          continue;
        }
        break;
      }
      uint64_t v9 = v9;
      uint64_t v8 = v103;
    }
    else
    {
      int64_t v23 = 95000000000 * a6 / 0x64;
    }
    dispatch_time_t v69 = dispatch_time(0, v23);
    if (dispatch_group_wait(group, v69))
    {
      BOOL v70 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v70) {
        -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.4(v70, v71, v72, v73, v74, v75, v76, v77);
      }
    }
LABEL_40:
    pthread_mutex_lock((pthread_mutex_t *)(v122 + 4));
    BOOL v78 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v78) {
      -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:](v78, v79, v80, v81, v82, v83, v84, v85);
    }
    uint64_t v111 = 0;
    if ([v104 count])
    {
      BOOL v86 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v86) {
        -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:](v86, v87, v88, v89, v90, v91, v92, v93);
      }
      v119[0] = &unk_1EE455080;
      v118[0] = @"ParametersFlag";
      v118[1] = @"ParametersCategory";
      v119[1] = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v9];
      v118[2] = @"ParametersType";
      uint64_t v94 = [MEMORY[0x1E4F28ED0] numberWithUnsignedShort:v8];
      v118[3] = @"ParametersPayload";
      v119[2] = v94;
      v119[3] = v104;
      -[RTCReporting sendMessageWithDictionary:error:](self->_session, "sendMessageWithDictionary:error:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:4], &v111);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v122 + 4));

    BOOL v95 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v95) {
      -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:](v95, v96, v97, v98, v99, v100, v101, v102);
    }
    self->_counter = 0;
    _Block_object_dispose(&v121, 8);
  }
  else
  {
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    periodicServiceDict = self->_periodicServiceDict;
    uint64_t v29 = [(NSMutableDictionary *)periodicServiceDict countByEnumeratingWithState:&v107 objects:v117 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v108;
      int64_t v31 = 95000000000 * a6 / 0x64;
      while (2)
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v108 != v30) {
            objc_enumerationMutation(periodicServiceDict);
          }
          v33 = (void *)[(NSMutableDictionary *)self->_periodicServiceDict objectForKey:*(void *)(*((void *)&v107 + 1) + 8 * j)];
          if ([v33 update])
          {
            dispatch_time_t v34 = dispatch_time(0, v31);
            if (dispatch_semaphore_wait(v19, v34))
            {
              BOOL v36 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
              if (v36) {
                -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.8(v36, v37, v38, v39, v40, v41, v42, v43);
              }
              goto LABEL_34;
            }
            v35 = self->_periodicTaskQueue;
            v106[0] = MEMORY[0x1E4F143A8];
            v106[1] = 3221225472;
            v106[2] = __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_32;
            v106[3] = &unk_1E576F2E8;
            v106[4] = v33;
            v106[5] = v19;
            dispatch_group_async(group, v35, v106);
          }
        }
        uint64_t v29 = [(NSMutableDictionary *)periodicServiceDict countByEnumeratingWithState:&v107 objects:v117 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
    else
    {
      int64_t v31 = 95000000000 * a6 / 0x64;
    }
    dispatch_time_t v52 = dispatch_time(0, v31);
    if (dispatch_group_wait(group, v52))
    {
      BOOL v53 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v53) {
        -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.7(v53, v54, v55, v56, v57, v58, v59, v60);
      }
    }
LABEL_34:
    BOOL v61 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
    if (v61) {
      -[RTCReportingAVCDeprecatedPeriodic _myPeriodicTask:type:intervalMultiplier:updateTimeout:].cold.6(v61, v62, v63, v64, v65, v66, v67, v68);
    }
  }
  dispatch_release(group);
  dispatch_release(v19);
}

uint64_t __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 integerValue];
  if (v5 > [a3 integerValue]) {
    return 1;
  }
  uint64_t v7 = [a2 integerValue];
  if (v7 >= [a3 integerValue]) {
    return 0;
  }
  else {
    return -1;
  }
}

intptr_t __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_27(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [*(id *)(a1 + 32) block];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v2);
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
  if (v2)
  {
    v4 = *(void **)(a1 + 40);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          [v2 objectForKeyedSubscript:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v4 objectForKeyedSubscript:v9])
            {
              objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v9), "addEntriesFromDictionary:", objc_msgSend(v2, "objectForKeyedSubscript:", v9));
              continue;
            }
          }
          else
          {
            [v2 objectForKeyedSubscript:v9];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 objectForKeyedSubscript:v9])
            {
              objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v9), "addObjectsFromArray:", objc_msgSend(v2, "objectForKeyedSubscript:", v9));
              continue;
            }
          }
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(v2, "objectForKeyedSubscript:", v9), v9);
        }
        uint64_t v6 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

intptr_t __91__RTCReportingAVCDeprecatedPeriodic__myPeriodicTask_type_intervalMultiplier_updateTimeout___block_invoke_32(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) block];
  (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
  uint64_t v3 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v3);
}

- (void)startLogTimerWithInterval:(int)a3 reportingMultiplier:(int)a4 category:(unsigned __int16)a5 type:(unsigned __int16)a6
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke;
  block[3] = &unk_1E576F338;
  block[4] = self;
  unsigned __int16 v10 = a5;
  unsigned __int16 v11 = a6;
  int v8 = a3;
  int v9 = a4;
  dispatch_async(queue, block);
}

void __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 40))
  {
    *(void *)(*(void *)(a1 + 32) + 40) = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v1 + 24));
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 40))
    {
      *(_DWORD *)(v3 + 8) = 0;
      uint64_t v4 = 1000000000 * *(unsigned int *)(a1 + 40);
      uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      dispatch_time_t v6 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(v5, v6, v4, 0x5F5E100uLL);
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(NSObject **)(v7 + 40);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_2;
      handler[3] = &unk_1E576F310;
      int v9 = *(_DWORD *)(a1 + 48);
      int v11 = *(_DWORD *)(a1 + 44);
      int v12 = v9;
      handler[4] = v7;
      handler[5] = v4;
      dispatch_source_set_event_handler(v8, handler);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _myPeriodicTask:*(unsigned __int16 *)(a1 + 52) type:*(unsigned __int16 *)(a1 + 54) intervalMultiplier:*(unsigned int *)(a1 + 48) updateTimeout:*(void *)(a1 + 40)];
}

- (void)stopLogTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke;
  block[3] = &unk_1E576F360;
  block[4] = self;
  dispatch_async(queue, block);
}

void __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v3)
    {
      *(_WORD *)int v11 = 0;
      _os_log_debug_impl(&dword_193646000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "stopLogTimer.", v11, 2u);
      uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    }
    dispatch_source_cancel(v2);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 40));
    *(void *)(*(void *)(a1 + 32) + 40) = 0;
    [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
    *(_DWORD *)(*(void *)(a1 + 32) + 8) = 0;
  }
  else if (v3)
  {
    __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (BOOL)registerPeriodicTaskForModule:(unsigned int)a3 needToUpdate:(BOOL)a4 needToReport:(BOOL)a5 serviceBlock:(id)a6
{
  if (a6)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke;
    block[3] = &unk_1E576F388;
    BOOL v11 = a4;
    BOOL v12 = a5;
    block[4] = self;
    void block[5] = a6;
    unsigned int v10 = a3;
    dispatch_async(queue, block);
  }
  return a6 != 0;
}

void __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (unsigned __int8 *)(a1 + 53);
  BOOL v3 = (unsigned char *)(a1 + 52);
  uint64_t v4 = [[UpdateAndReportServices alloc] initWithServices:*(unsigned __int8 *)(a1 + 52) needToReport:*(unsigned __int8 *)(a1 + 53) service:*(void *)(a1 + 40)];
  if (v4)
  {
    uint64_t v5 = v4;
    unsigned int v7 = *(_DWORD *)(a1 + 48);
    uint64_t v6 = (int *)(a1 + 48);
    objc_msgSend(*(id *)(*((void *)v6 - 2) + 16), "setObject:forKeyedSubscript:", v4, objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", v7));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke_cold_1(v6, v3, v2);
    }
  }
}

- (BOOL)unregisterPeriodTaskForModule:(unsigned int)a3
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke;
  v5[3] = &unk_1E576F3B0;
  v5[4] = self;
  unsigned int v6 = a3;
  dispatch_sync(queue, v5);
  return 1;
}

void __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke(uint64_t a1)
{
  uint64_t v2 = (int *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "objectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40))))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "removeObjectForKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40)));
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_2(v2);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_1(v2);
  }
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_myPeriodicTask:(uint64_t)a3 type:(uint64_t)a4 intervalMultiplier:(uint64_t)a5 updateTimeout:(uint64_t)a6 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __97__RTCReportingAVCDeprecatedPeriodic_startLogTimerWithInterval_reportingMultiplier_category_type___block_invoke_cold_1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_193646000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "startLogTimerWithInterval: %d, %d", v0, 0xEu);
}

void __49__RTCReportingAVCDeprecatedPeriodic_stopLogTimer__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __106__RTCReportingAVCDeprecatedPeriodic_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock___block_invoke_cold_1(int *a1, unsigned char *a2, unsigned __int8 *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  uint64_t v4 = "";
  int v5 = *a3;
  if (*a2) {
    unsigned int v6 = "";
  }
  else {
    unsigned int v6 = " no";
  }
  v7[0] = 67109634;
  if (!v5) {
    uint64_t v4 = " no";
  }
  v7[1] = v3;
  __int16 v8 = 2080;
  uint64_t v9 = v6;
  __int16 v10 = 2080;
  BOOL v11 = v4;
  _os_log_debug_impl(&dword_193646000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "registerPeriodicTaskForModule: %u,%s update,%s reporting", (uint8_t *)v7, 0x1Cu);
}

void __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_1(int *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl(&dword_193646000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "unregisterPeriodTaskForModule: %u doesn't exist", (uint8_t *)v2, 8u);
}

void __67__RTCReportingAVCDeprecatedPeriodic_unregisterPeriodTaskForModule___block_invoke_cold_2(int *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = *a1;
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_debug_impl(&dword_193646000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "unregisterPeriodTaskForModule: %u removed", (uint8_t *)v2, 8u);
}

@end