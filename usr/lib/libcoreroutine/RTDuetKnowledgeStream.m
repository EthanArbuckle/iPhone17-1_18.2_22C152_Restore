@interface RTDuetKnowledgeStream
+ (id)duetKnowledgeStreamTypeToDuetEventStream:(int64_t)a3;
+ (id)streamTypeToString:(int64_t)a3;
- (RTDuetKnowledgeStore)knowledgeStore;
- (RTDuetKnowledgeStream)init;
- (RTDuetKnowledgeStream)initWithDuetKnowledgeStore:(id)a3 streamType:(int64_t)a4;
- (RTDuetKnowledgeStream)initWithStreamType:(int64_t)a3 knowledgeStore:(id)a4;
- (_DKEventStream)eventStream;
- (id)_convertDuetEvent:(id)a3;
- (id)description;
- (int64_t)streamType;
- (void)dealloc;
- (void)enumerateEventsWithinDateInterval:(id)a3 usingBlock:(id)a4;
- (void)purge;
- (void)setEventStream:(id)a3;
- (void)setKnowledgeStore:(id)a3;
@end

@implementation RTDuetKnowledgeStream

- (RTDuetKnowledgeStream)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStreamType_knowledgeStore_);
}

- (RTDuetKnowledgeStream)initWithDuetKnowledgeStore:(id)a3 streamType:(int64_t)a4
{
  return [(RTDuetKnowledgeStream *)self initWithStreamType:a4 knowledgeStore:a3];
}

- (RTDuetKnowledgeStream)initWithStreamType:(int64_t)a3 knowledgeStore:(id)a4
{
  id v7 = a4;
  v8 = v7;
  if ((unint64_t)a3 >= 4)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v11 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: RT_DUET_KNOWLEDGE_STREAM_STREAM_TYPE_VALID(streamType)";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_9;
  }
  if (!v7)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: knowledgeStore";
    goto LABEL_12;
  }
  v15.receiver = self;
  v15.super_class = (Class)RTDuetKnowledgeStream;
  v9 = [(RTDuetKnowledgeStream *)&v15 init];
  v10 = v9;
  if (v9)
  {
    v9->_streamType = a3;
    objc_storeStrong((id *)&v9->_knowledgeStore, a4);
  }
  self = v10;
  v11 = self;
LABEL_10:

  return v11;
}

- (void)dealloc
{
  eventStream = self->_eventStream;
  self->_eventStream = 0;

  [(RTDuetKnowledgeStore *)self->_knowledgeStore reset];
  v4.receiver = self;
  v4.super_class = (Class)RTDuetKnowledgeStream;
  [(RTDuetKnowledgeStream *)&v4 dealloc];
}

- (void)purge
{
  obj = self;
  objc_sync_enter(obj);
  eventStream = obj->_eventStream;
  obj->_eventStream = 0;

  [(RTDuetKnowledgeStore *)obj->_knowledgeStore reset];
  objc_sync_exit(obj);
}

- (void)enumerateEventsWithinDateInterval:(id)a3 usingBlock:(id)a4
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v61 = (void (**)(id, void, id, char *))a4;
  v64 = v6;
  if (v61)
  {
    char v85 = 0;
    if (v6)
    {
      id v7 = self;
      objc_sync_enter(v7);
      eventStream = v7->_eventStream;
      obj = (id *)&v7->super.isa;
      if (eventStream)
      {
        v9 = eventStream;
LABEL_12:
        v59 = v9;
        dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
        v16 = 0;
        uint64_t v60 = 0;
        uint64_t v79 = 0;
        v80 = &v79;
        uint64_t v81 = 0x3032000000;
        v82 = __Block_byref_object_copy__93;
        v83 = __Block_byref_object_dispose__93;
        id v84 = 0;
        uint64_t v73 = 0;
        v74 = (id *)&v73;
        uint64_t v75 = 0x3032000000;
        v76 = __Block_byref_object_copy__93;
        v77 = __Block_byref_object_dispose__93;
        id v78 = 0;
        uint64_t v56 = *MEMORY[0x1E4F5CFE8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        while (1)
        {
          context = (void *)MEMORY[0x1E016D870]();
          v66 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
          v17 = (void *)MEMORY[0x1E4F5B5D0];
          v18 = [v64 startDate];
          v19 = [v64 endDate];
          v65 = [v17 predicateForEventsWithStartInDateRangeFrom:v18 to:v19];

          v20 = (void *)MEMORY[0x1E4F5B518];
          v94 = v59;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
          v93 = v66;
          v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
          v23 = [v20 eventQueryWithPredicate:v65 eventStreams:v21 offset:v60 limit:1000 sortDescriptors:v22];

          *(void *)v86 = 0;
          *(void *)&v86[8] = v86;
          *(void *)&v86[16] = 0x2020000000;
          v87 = 0;
          id v24 = obj[3];
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __70__RTDuetKnowledgeStream_enumerateEventsWithinDateInterval_usingBlock___block_invoke;
          v67[3] = &unk_1E6B98BF8;
          v70 = &v73;
          v25 = v58;
          v71 = v86;
          v72 = &v79;
          v68 = v25;
          v69 = obj;
          [v24 executeQuery:v23 completion:v67];
          v26 = v25;
          v27 = [MEMORY[0x1E4F1C9C8] now];
          dispatch_time_t v28 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(v26, v28)) {
            goto LABEL_18;
          }
          v29 = [MEMORY[0x1E4F1C9C8] now];
          [v29 timeIntervalSinceDate:v27];
          double v31 = v30;
          v32 = objc_opt_new();
          v33 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_74];
          v34 = [MEMORY[0x1E4F29060] callStackSymbols];
          v35 = [v34 filteredArrayUsingPredicate:v33];
          v36 = [v35 firstObject];

          [v32 submitToCoreAnalytics:v36 type:1 duration:v31];
          v37 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v38 = (void *)MEMORY[0x1E4F28C58];
          v99[0] = v57;
          *(void *)buf = @"semaphore wait timeout";
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v99 count:1];
          v40 = [v38 errorWithDomain:v56 code:15 userInfo:v39];

          if (v40)
          {
            id v41 = v40;

            char v42 = 0;
          }
          else
          {
LABEL_18:
            char v42 = 1;
            id v41 = v16;
          }

          id v43 = v41;
          if ((v42 & 1) == 0) {
            objc_storeStrong(v74 + 5, v41);
          }
          v61[2](v61, v80[5], v74[5], &v85);
          [obj[3] resume];
          if (v85) {
            break;
          }
          if (v74[5])
          {
            v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              id v47 = v74[5];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v47;
              _os_log_error_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_ERROR, "received error while enumerating duet events, %@, breaking out.", buf, 0xCu);
            }
            goto LABEL_27;
          }
          unint64_t v46 = *(void *)(*(void *)&v86[8] + 24);
          if (v46 < 0x3E8)
          {
            char v45 = 0;
            goto LABEL_29;
          }
          v60 += v46;
          v44 = v80[5];
          v80[5] = 0;
          char v45 = 1;
LABEL_28:

LABEL_29:
          _Block_object_dispose(v86, 8);

          v16 = v43;
          if ((v45 & 1) == 0)
          {
            v48 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              NSStringFromSelector(a2);
              id v51 = (id)objc_claimAutoreleasedReturnValue();
              v52 = (objc_class *)objc_opt_class();
              v53 = NSStringFromClass(v52);
              *(_DWORD *)v86 = 138413314;
              *(void *)&v86[4] = v51;
              *(_WORD *)&v86[12] = 2112;
              *(void *)&v86[14] = v53;
              *(_WORD *)&v86[22] = 2112;
              v87 = obj;
              __int16 v88 = 2048;
              uint64_t v89 = v60;
              __int16 v90 = 2112;
              v91 = v64;
              _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "%@, %@, %@, events, %lu, date interval, %@", v86, 0x34u);
            }
            _Block_object_dispose(&v73, 8);

            _Block_object_dispose(&v79, 8);
            goto LABEL_37;
          }
        }
        v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_DEBUG, "client set stop bit while enumerating duet events, breaking out.", buf, 2u);
        }
LABEL_27:
        char v45 = 0;
        goto LABEL_28;
      }
      uint64_t v14 = [(id)objc_opt_class() duetKnowledgeStreamTypeToDuetEventStream:v7->_streamType];
      objc_super v15 = v7->_eventStream;
      v7->_eventStream = (_DKEventStream *)v14;

      v9 = v7->_eventStream;
      if (v9) {
        goto LABEL_12;
      }
      uint64_t v95 = *MEMORY[0x1E4F28568];
      v96 = @"Invalid duet stream type.";
      v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      [MEMORY[0x1E4F28C58] errorWithDomain:@"RTDuetKnowledgeStoreErrorDomain" code:1 userInfo:nil];
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      v50 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        int64_t streamType = v7->_streamType;
        *(_DWORD *)v86 = 134217984;
        *(void *)&v86[4] = streamType;
        _os_log_error_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_ERROR, "Invalid duet stream type, %ld", v86, 0xCu);
      }

      v61[2](v61, 0, v43, &v85);
LABEL_37:

      v11 = obj;
      objc_sync_exit(obj);
    }
    else
    {
      uint64_t v97 = *MEMORY[0x1E4F28568];
      v98 = @"Non-nil date interval required.";
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTDuetKnowledgeStoreErrorDomain" code:0 userInfo:v11];
      v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v86 = 0;
        _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Non-nil date interval required", v86, 2u);
      }

      v61[2](v61, 0, v12, &v85);
    }
  }
  else
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v86 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block", v86, 2u);
    }
  }
}

void __70__RTDuetKnowledgeStream_enumerateEventsWithinDateInterval_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v28[0] = @"Object type containing fetched duet results was not an NSArray.";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTDuetKnowledgeStoreErrorDomain" code:2 userInfo:v7];
      uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
      v21 = *(void **)(v20 + 40);
      *(void *)(v20 + 40) = v19;
    }
    else
    {
      id v7 = v5;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v7 count];
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
        {
          uint64_t v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:];
          uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
          v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;
        }
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v11 = v7;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * v15);
              v17 = (void *)MEMORY[0x1E016D870](v12);
              v18 = [*(id *)(a1 + 40) _convertDuetEvent:v16];
              if (v18) {
                [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v18];
              }

              ++v15;
            }
            while (v13 != v15);
            uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
            uint64_t v13 = v12;
          }
          while (v12);
        }
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (id)_convertDuetEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  unint64_t streamType = self->_streamType;
  if (streamType < 2) {
    goto LABEL_4;
  }
  if (streamType != 2)
  {
    if (streamType != 3)
    {
      v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v19 = 134218498;
        unint64_t v20 = streamType;
        __int16 v21 = 2080;
        long long v22 = "-[RTDuetKnowledgeStream _convertDuetEvent:]";
        __int16 v23 = 1024;
        int v24 = 222;
        _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Unhandled stream type, %lu (in %s:%d)", (uint8_t *)&v19, 0x1Cu);
      }

      goto LABEL_11;
    }
LABEL_4:
    id v7 = [v4 value];
    int v8 = [v7 BOOLValue];

    if (!v8) {
      goto LABEL_11;
    }
LABEL_7:
    id v13 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v14 = [v5 startDate];
    uint64_t v15 = [v5 endDate];
    uint64_t v16 = (void *)[v13 initWithStartDate:v14 endDate:v15];

    goto LABEL_12;
  }
  uint64_t v9 = [v4 value];
  uint64_t v10 = [v9 integerValue];
  id v11 = [MEMORY[0x1E4F5B590] stationary];
  uint64_t v12 = [v11 integerValue];

  if (v10 == v12) {
    goto LABEL_7;
  }
LABEL_11:
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

+ (id)duetKnowledgeStreamTypeToDuetEventStream:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      v3 = [MEMORY[0x1E4F5B5F8] deviceIsPluggedInStream];
      break;
    case 1:
      v3 = [MEMORY[0x1E4F5B5F8] keybagIsLockedStream];
      break;
    case 2:
      v3 = [MEMORY[0x1E4F5B5F8] motionStream];
      break;
    case 3:
      v3 = [MEMORY[0x1E4F5B5F8] wifiConnectionStream];
      break;
    default:
      id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v6 = 136315394;
        id v7 = "+[RTDuetKnowledgeStream duetKnowledgeStreamTypeToDuetEventStream:]";
        __int16 v8 = 1024;
        int v9 = 247;
        _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Returning nil _DKEventStream for RTDuetKnowledgeStreamStreamType. (in %s:%d)", (uint8_t *)&v6, 0x12u);
      }

      v3 = 0;
      break;
  }

  return v3;
}

+ (id)streamTypeToString:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 4) {
    return off_1E6B98C18[a3];
  }
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    int v6 = "+[RTDuetKnowledgeStream streamTypeToString:]";
    __int16 v7 = 1024;
    int v8 = 273;
    _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Returning nil for RTDuetKnowledgeStreamStreamType. (in %s:%d)", (uint8_t *)&v5, 0x12u);
  }

  return 0;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(id)objc_opt_class() streamTypeToString:self->_streamType];
  int v5 = [(_DKEventStream *)self->_eventStream name];
  int v6 = [v3 stringWithFormat:@"stream, %@, name, %@", v4, v5];

  return v6;
}

- (int64_t)streamType
{
  return self->_streamType;
}

- (_DKEventStream)eventStream
{
  return self->_eventStream;
}

- (void)setEventStream:(id)a3
{
}

- (RTDuetKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knowledgeStore, 0);

  objc_storeStrong((id *)&self->_eventStream, 0);
}

@end