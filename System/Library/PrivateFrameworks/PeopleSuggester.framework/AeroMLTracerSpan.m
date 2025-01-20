@interface AeroMLTracerSpan
- (AeroMLTracerSession)traceSession;
- (AeroMLTracerSpanEvent)spanEvent;
- (BOOL)isEnded;
- (BOOL)isStarted;
- (id)createSubEventWithName:(id)a3 details:(id)a4 attributes:(id)a5;
- (id)createSubSpanWithName:(id)a3;
- (id)getProcessName;
- (id)getSpanId;
- (id)getSpanIdFromIntervalId:(unint64_t)a3;
- (id)initSpanWithSpanName:(id)a3 traceSession:(id)a4 parentSpanId:(id)a5;
- (id)serializeAttributes:(id)a3;
- (id)stringForQoSClass:(unsigned int)a3;
- (unint64_t)intervalId;
- (unsigned)getMonotonicTimeInMilliseconds;
- (void)addAttributes:(id)a3;
- (void)addDeviceIdentifier:(id)a3;
- (void)addTrialDeploymentId:(id)a3 trialExperimentId:(id)a4 trialTreatmentId:(id)a5;
- (void)emitPETEvent;
- (void)end;
- (void)logDebugEventWithName:(id)a3 details:(id)a4 attributes:(id)a5;
- (void)logErrorEventWithName:(id)a3 details:(id)a4 attributes:(id)a5;
- (void)logErrorMessageWithCA:(id)a3;
- (void)logInfoEventWithName:(id)a3 details:(id)a4 attributes:(id)a5;
- (void)logInfoMessageWithCA:(id)a3;
- (void)logSchedulingInformation;
- (void)setIntervalId:(unint64_t)a3;
- (void)setIsEnded:(BOOL)a3;
- (void)setIsStarted:(BOOL)a3;
- (void)setSpanEvent:(id)a3;
- (void)setTraceSession:(id)a3;
- (void)start;
@end

@implementation AeroMLTracerSpan

- (id)initSpanWithSpanName:(id)a3 traceSession:(id)a4 parentSpanId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (__CFString *)a5;
  v20.receiver = self;
  v20.super_class = (Class)AeroMLTracerSpan;
  v11 = [(AeroMLTracerSpan *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_traceSession, a4);
    uint64_t v13 = objc_opt_new();
    spanEvent = v12->_spanEvent;
    v12->_spanEvent = (AeroMLTracerSpanEvent *)v13;

    [(AeroMLTracerSpanEvent *)v12->_spanEvent setVersion:@"055366d53d9de83f5839aaa4511d5b5409bc1d12"];
    [(AeroMLTracerSpanEvent *)v12->_spanEvent setName:v8];
    v15 = [v9 traceId];
    [(AeroMLTracerSpanEvent *)v12->_spanEvent setTraceId:v15];

    if (v10) {
      v16 = v10;
    }
    else {
      v16 = @"-1";
    }
    [(AeroMLTracerSpanEvent *)v12->_spanEvent setParentSpanId:v16];
    v17 = [(AeroMLTracerSpan *)v12 getProcessName];
    [(AeroMLTracerSpanEvent *)v12->_spanEvent setProcessName:v17];

    v18 = [(AeroMLTracerSession *)v12->_traceSession projectName];
    [(AeroMLTracerSpanEvent *)v12->_spanEvent setProjectName:v18];

    *(_WORD *)&v12->_isEnded = 0;
    v12->_intervalId = 0;
  }

  return v12;
}

- (id)createSubSpanWithName:(id)a3
{
  id v4 = a3;
  v5 = [AeroMLTracerSpan alloc];
  v6 = [(AeroMLTracerSpan *)self traceSession];
  v7 = [(AeroMLTracerSpan *)self spanEvent];
  id v8 = [v7 spanId];
  id v9 = [(AeroMLTracerSpan *)v5 initSpanWithSpanName:v4 traceSession:v6 parentSpanId:v8];

  return v9;
}

- (void)start
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  [(AeroMLTracerSpan *)self logSchedulingInformation];
  v3 = [(AeroMLTracerSpan *)self traceSession];
  id v4 = [v3 traceSignpost];
  [(AeroMLTracerSpan *)self setIntervalId:os_signpost_id_generate(v4)];

  uint64_t v5 = [(AeroMLTracerSpan *)self getMonotonicTimeInMilliseconds];
  v6 = [(AeroMLTracerSpan *)self spanEvent];
  [v6 setPrivatizedStartTime:v5];

  v7 = [(AeroMLTracerSpan *)self spanEvent];
  id v8 = [v7 parentSpanId];
  char v9 = [v8 isEqualToString:@"-1"];

  v10 = [(AeroMLTracerSpan *)self traceSession];
  v11 = [v10 traceSignpost];

  unint64_t v12 = [(AeroMLTracerSpan *)self intervalId];
  os_signpost_id_t v13 = v12;
  if (v9)
  {
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      v14 = [(AeroMLTracerSpan *)self spanEvent];
      v15 = [v14 traceId];
      v16 = [(AeroMLTracerSpan *)self spanEvent];
      v17 = [v16 name];
      int v23 = 138543618;
      v24 = v15;
      __int16 v25 = 2114;
      v26 = v17;
      v18 = "RootSpanEvent";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, v18, " TraceId=%{signpost.telemetry:string1,public}@  SpanName=%{signpost.telemetry:string2,public}@ ", (uint8_t *)&v23, 0x16u);
    }
  }
  else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v14 = [(AeroMLTracerSpan *)self spanEvent];
    v15 = [v14 traceId];
    v16 = [(AeroMLTracerSpan *)self spanEvent];
    v17 = [v16 name];
    int v23 = 138543618;
    v24 = v15;
    __int16 v25 = 2114;
    v26 = v17;
    v18 = "SubSpanEvent";
    goto LABEL_8;
  }

  v19 = [(AeroMLTracerSpan *)self getSpanIdFromIntervalId:[(AeroMLTracerSpan *)self intervalId]];
  objc_super v20 = [(AeroMLTracerSpan *)self spanEvent];
  [v20 setSpanId:v19];

  [(AeroMLTracerSpan *)self setIsStarted:1];
  v21 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = [(AeroMLTracerSpan *)self spanEvent];
    int v23 = 138412290;
    v24 = v22;
    _os_log_impl(&dword_1A314B000, v21, OS_LOG_TYPE_INFO, "start span with spanEvent: %@", (uint8_t *)&v23, 0xCu);
  }
}

- (void)end
{
  v1 = [a1 spanEvent];
  v2 = [v1 spanId];
  OUTLINED_FUNCTION_9(&dword_1A314B000, v3, v4, "Try to end the span which is not started: %@", v5, v6, v7, v8, 2u);
}

- (void)logInfoEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(AeroMLTracerSpan *)self createSubEventWithName:v8 details:v9 attributes:a5];
  objc_msgSend(v10, "setPrivatizedTimeStamp:", -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds"));
  v11 = [(AeroMLTracerSpan *)self traceSession];
  unint64_t v12 = [v11 traceSignpost];

  if (os_signpost_enabled(v12))
  {
    os_signpost_id_t v13 = [(AeroMLTracerSpan *)self spanEvent];
    v14 = [v13 traceId];
    v15 = [v10 attributes];
    v16 = [(AeroMLTracerSpan *)self serializeAttributes:v15];
    int v20 = 138544130;
    v21 = v14;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InfoEvent", " TraceId=%{signpost.telemetry:string1,public}@  EventName=%{signpost.telemetry:string2,public}@  EventDetails=%{public, signpost.description:attribute}@  Attributes=%{public}@ ", (uint8_t *)&v20, 0x2Au);
  }
  v17 = [(AeroMLTracerSpan *)self spanEvent];
  [v17 addInfoEvents:v10];

  v18 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = [(AeroMLTracerSpan *)self spanEvent];
    int v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "log info event with spanEvent: %@", (uint8_t *)&v20, 0xCu);
  }
}

- (void)logErrorEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(AeroMLTracerSpan *)self createSubEventWithName:v8 details:v9 attributes:a5];
  objc_msgSend(v10, "setPrivatizedTimeStamp:", -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds"));
  v11 = [(AeroMLTracerSpan *)self traceSession];
  unint64_t v12 = [v11 traceSignpost];

  if (os_signpost_enabled(v12))
  {
    os_signpost_id_t v13 = [(AeroMLTracerSpan *)self spanEvent];
    v14 = [v13 traceId];
    v15 = [v10 attributes];
    v16 = [(AeroMLTracerSpan *)self serializeAttributes:v15];
    int v20 = 138544130;
    v21 = v14;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ErrorEvent", " TraceId=%{signpost.telemetry:string1,public}@  EventName=%{signpost.telemetry:string2,public}@  EventDetails=%{public, signpost.description:attribute}@  Attributes=%{public}@ ", (uint8_t *)&v20, 0x2Au);
  }
  v17 = [(AeroMLTracerSpan *)self spanEvent];
  [v17 addErrorEvents:v10];

  v18 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = [(AeroMLTracerSpan *)self spanEvent];
    int v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "log error event with spanEvent: %@", (uint8_t *)&v20, 0xCu);
  }
}

- (void)logDebugEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(AeroMLTracerSpan *)self createSubEventWithName:v8 details:v9 attributes:a5];
  objc_msgSend(v10, "setPrivatizedTimeStamp:", -[AeroMLTracerSpan getMonotonicTimeInMilliseconds](self, "getMonotonicTimeInMilliseconds"));
  v11 = [(AeroMLTracerSpan *)self traceSession];
  unint64_t v12 = [v11 traceSignpost];

  if (os_signpost_enabled(v12))
  {
    os_signpost_id_t v13 = [(AeroMLTracerSpan *)self spanEvent];
    v14 = [v13 traceId];
    v15 = [v10 attributes];
    v16 = [(AeroMLTracerSpan *)self serializeAttributes:v15];
    int v20 = 138544130;
    v21 = v14;
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2114;
    id v25 = v9;
    __int16 v26 = 2114;
    uint64_t v27 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DebugEvent", " TraceId=%{signpost.telemetry:string1,public}@  EventName=%{signpost.telemetry:string2,public}@  EventDetails=%{public, signpost.description:attribute}@  Attributes=%{public}@ ", (uint8_t *)&v20, 0x2Au);
  }
  v17 = [(AeroMLTracerSpan *)self spanEvent];
  [v17 addDebugEvents:v10];

  v18 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = [(AeroMLTracerSpan *)self spanEvent];
    int v20 = 138412290;
    v21 = v19;
    _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "log debug event with spanEvent: %@", (uint8_t *)&v20, 0xCu);
  }
}

- (void)addTrialDeploymentId:(id)a3 trialExperimentId:(id)a4 trialTreatmentId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AeroMLTracerSpan *)self spanEvent];
  [v11 setTrialDeploymentId:v10];

  unint64_t v12 = [(AeroMLTracerSpan *)self spanEvent];
  [v12 setTrialExperimentId:v9];

  id v13 = [(AeroMLTracerSpan *)self spanEvent];
  [v13 setTrialTreatmentId:v8];
}

- (void)addDeviceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AeroMLTracerSpan *)self spanEvent];
  [v5 setDeviceIdentifier:v4];

  uint64_t v6 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AeroMLTracerSpan addDeviceIdentifier:]((uint64_t)v4, v6);
  }
}

- (id)getSpanId
{
  v2 = [(AeroMLTracerSpan *)self spanEvent];
  uint64_t v3 = [v2 spanId];

  return v3;
}

- (unsigned)getMonotonicTimeInMilliseconds
{
  if (!dword_1E95A9D84) {
    mach_timebase_info((mach_timebase_info_t)&getMonotonicTimeInMilliseconds_timebase);
  }
  return mach_absolute_time()
       * getMonotonicTimeInMilliseconds_timebase
       / dword_1E95A9D84
       / 0xF4240;
}

- (void)addAttributes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = objc_opt_new();
        [v10 setName:v9];
        v11 = [v4 objectForKeyedSubscript:v9];
        [v10 setStringValue:v11];

        unint64_t v12 = [(AeroMLTracerSpan *)self spanEvent];
        [v12 addAttributes:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)logInfoMessageWithCA:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __41__AeroMLTracerSpan_logInfoMessageWithCA___block_invoke(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"TraceId";
  v2 = [*(id *)(a1 + 32) spanEvent];
  id v3 = [v2 traceId];
  v14[0] = v3;
  v13[1] = @"SpanId";
  id v4 = [*(id *)(a1 + 32) spanEvent];
  uint64_t v5 = [v4 spanId];
  v14[1] = v5;
  v13[2] = @"projectName";
  uint64_t v6 = [*(id *)(a1 + 32) spanEvent];
  uint64_t v7 = [v6 projectName];
  v14[2] = v7;
  v13[3] = @"processName";
  uint64_t v8 = [*(id *)(a1 + 32) spanEvent];
  uint64_t v9 = [v8 processName];
  v13[4] = @"infoMessage";
  uint64_t v10 = *(void *)(a1 + 40);
  v14[3] = v9;
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (void)logErrorMessageWithCA:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __42__AeroMLTracerSpan_logErrorMessageWithCA___block_invoke(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"TraceId";
  v2 = [*(id *)(a1 + 32) spanEvent];
  id v3 = [v2 traceId];
  v14[0] = v3;
  v13[1] = @"SpanId";
  id v4 = [*(id *)(a1 + 32) spanEvent];
  uint64_t v5 = [v4 spanId];
  v14[1] = v5;
  v13[2] = @"projectName";
  uint64_t v6 = [*(id *)(a1 + 32) spanEvent];
  uint64_t v7 = [v6 projectName];
  v14[2] = v7;
  v13[3] = @"processName";
  uint64_t v8 = [*(id *)(a1 + 32) spanEvent];
  uint64_t v9 = [v8 processName];
  v13[4] = @"errorMessage";
  uint64_t v10 = *(void *)(a1 + 40);
  v14[3] = v9;
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (id)getSpanIdFromIntervalId:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
}

- (void)emitPETEvent
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F93728] sharedInstance];
  id v4 = [(AeroMLTracerSpan *)self spanEvent];
  uint64_t v5 = [(AeroMLTracerSpan *)self traceSession];
  uint64_t v6 = [v5 projectName];
  [v3 logMessage:v4 subGroup:v6];

  uint64_t v7 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [(AeroMLTracerSpan *)self spanEvent];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_INFO, "emitted PET message with spanEvent: %@", (uint8_t *)&v9, 0xCu);
  }
  [(AeroMLTracerSpan *)self logInfoMessageWithCA:@"PET_Message_Sent"];
}

- (id)createSubEventWithName:(id)a3 details:(id)a4 attributes:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_opt_new();
  [v10 setName:v7];
  [v10 setDetails:v8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v17 = objc_opt_new();
        objc_msgSend(v17, "setName:", v16, (void)v20);
        uint64_t v18 = [v11 objectForKeyedSubscript:v16];
        [v17 setStringValue:v18];

        [v10 addAttributes:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)serializeAttributes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [v10 name];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = [v10 stringValue];

          if (v13)
          {
            uint64_t v14 = [v10 name];
            long long v15 = [v10 stringValue];
            [v4 appendFormat:@" %@:%@, ", v14, v15, (void)v17];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)getProcessName
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  id v3 = [v2 processName];

  return v3;
}

- (void)logSchedulingInformation
{
  id v3 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_INFO, "start to record  logSchedulingInformation", buf, 2u);
  }

  id v4 = dispatch_get_current_queue();
  id v5 = [NSString stringWithUTF8String:dispatch_queue_get_label(v4)];
  uint64_t v6 = [(AeroMLTracerSpan *)self spanEvent];
  [v6 setGcdQueueName:v5];

  int relative_priority_ptr = 0;
  dispatch_queue_get_qos_class(v4, &relative_priority_ptr);
  uint64_t v7 = [(AeroMLTracerSpan *)self stringForQoSClass:qos_class_self()];
  uint64_t v8 = [(AeroMLTracerSpan *)self spanEvent];
  [v8 setQosClassName:v7];

  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", relative_priority_ptr);
  uint64_t v10 = [(AeroMLTracerSpan *)self spanEvent];
  [v10 setRelativePriority:v9];

  uint64_t v11 = [(AeroMLTracerSession *)self->_traceSession traceChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1A314B000, v11, OS_LOG_TYPE_INFO, "finished recording  logSchedulingInformation", v12, 2u);
  }
}

- (id)stringForQoSClass:(unsigned int)a3
{
  HIDWORD(v4) = a3 - 9;
  LODWORD(v4) = a3 - 9;
  unsigned int v3 = v4 >> 2;
  if (v3 > 6) {
    return @"Unspecified";
  }
  else {
    return off_1E5AE0460[v3];
  }
}

- (AeroMLTracerSpanEvent)spanEvent
{
  return self->_spanEvent;
}

- (void)setSpanEvent:(id)a3
{
}

- (AeroMLTracerSession)traceSession
{
  return self->_traceSession;
}

- (void)setTraceSession:(id)a3
{
}

- (BOOL)isEnded
{
  return self->_isEnded;
}

- (void)setIsEnded:(BOOL)a3
{
  self->_isEnded = a3;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (unint64_t)intervalId
{
  return self->_intervalId;
}

- (void)setIntervalId:(unint64_t)a3
{
  self->_intervalId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traceSession, 0);

  objc_storeStrong((id *)&self->_spanEvent, 0);
}

- (void)addDeviceIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "log device identifer: %@", (uint8_t *)&v2, 0xCu);
}

@end