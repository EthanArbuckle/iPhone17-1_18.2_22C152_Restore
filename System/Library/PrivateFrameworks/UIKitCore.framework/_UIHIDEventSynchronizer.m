@interface _UIHIDEventSynchronizer
- (id)initWithStrategy:(void *)a3 runLoop:(const void *)a4 outputEventsHandler:(const void *)a5 completionHandler:;
- (uint64_t)_completeWithReason:(uint64_t)result;
- (uint64_t)_processDigitizerEvent:(void *)a1;
- (uint64_t)handleDigitizerEvent:(uint64_t)a1;
- (void)_logPerformanceData:(uint64_t)a1;
- (void)_renderEvents:(id)a3;
- (void)dealloc;
@end

@implementation _UIHIDEventSynchronizer

- (id)initWithStrategy:(void *)a3 runLoop:(const void *)a4 outputEventsHandler:(const void *)a5 completionHandler:
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)_UIHIDEventSynchronizer;
  v9 = (id *)objc_msgSendSuper2(&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[1] = a2;
    objc_storeStrong(v9 + 5, a3);
    v11 = _Block_copy(a4);
    id v12 = v10[3];
    v10[3] = v11;

    v13 = _Block_copy(a5);
    id v14 = v10[4];
    v10[4] = v13;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &dealloc___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v7 = self;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Decommissioned.", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIHIDEventSynchronizer;
  [(_UIHIDEventSynchronizer *)&v5 dealloc];
}

- (uint64_t)handleDigitizerEvent:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  switch(*(void *)(a1 + 16))
  {
    case 0:
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25ED70);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v27 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = a2;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Processing initial HID event: %@.", buf, 0x16u);
        }
      }
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2020000000;
      uint64_t v37 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __57___UIHIDEventSynchronizer__processInitialDigitizerEvent___block_invoke;
      v43 = &unk_1E52DA1D8;
      v44 = &v34;
      _UIEventHIDEnumerateChildren(a2, 11, buf);
      if (v35[3])
      {
        uint64_t v8 = BKSHIDEventGetDigitizerAttributes();
        *(double *)(a1 + 48) = _UIEventHIDHitTestPointForChild(v8);
        *(void *)(a1 + 56) = v9;

        unint64_t TimeStamp = IOHIDEventGetTimeStamp();
        *(double *)(a1 + 64) = _UIMediaTimeForMachTime(TimeStamp);
        uint64_t v11 = *(void *)(a1 + 8);
        if (v11 == 1)
        {
          unint64_t v24 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25ED88);
          if (*(unsigned char *)v24)
          {
            v29 = *(NSObject **)(v24 + 8);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v38 = 134217984;
              uint64_t v39 = a1;
              _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Preparing for passthrough.", v38, 0xCu);
            }
          }
          uint64_t v19 = 0;
          goto LABEL_32;
        }
        if (v11 == 2)
        {
          unint64_t v12 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25ED80);
          if (*(unsigned char *)v12)
          {
            v28 = *(NSObject **)(v12 + 8);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v38 = 134217984;
              uint64_t v39 = a1;
              _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Preparing for synchronization.", v38, 0xCu);
            }
          }
          v13 = objc_alloc_init(_UIHIDPath);
          id v14 = *(void **)(a1 + 72);
          *(void *)(a1 + 72) = v13;

          v15 = objc_alloc_init(_UIHIDPathCollection);
          objc_super v16 = *(void **)(a1 + 80);
          *(void *)(a1 + 80) = v15;

          v17 = [(double *)[_UIHIDPathSynchronizationFilter alloc] initWithPosition:*(double *)(a1 + 56) timestamp:*(double *)(a1 + 64)];
          v18 = *(void **)(a1 + 88);
          *(void *)(a1 + 88) = v17;

          [*(id *)(a1 + 72) setDeliveryPhase:4];
          *(void *)(a1 + 96) = 5;
          [*(id *)(a1 + 72) updateWithHIDEvent:v35[3]];
          [*(id *)(a1 + 80) updateWithHIDEvent:a2];
          uint64_t v19 = 1;
LABEL_32:
          *(void *)(a1 + 16) = 1;
          goto LABEL_37;
        }
        v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25ED90) + 8);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)(a1 + 8);
          *(_DWORD *)v38 = 134218240;
          uint64_t v39 = a1;
          __int16 v40 = 2048;
          uint64_t v41 = v26;
          _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "[SYNCHRONIZER: %p] Unknown synchronization strategy: %lu.", v38, 0x16u);
        }
        -[_UIHIDEventSynchronizer _completeWithReason:](a1, (uint64_t)"invalid synchronization strategy");
      }
      else
      {
        v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25ED78) + 8);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v38 = 134218242;
          uint64_t v39 = a1;
          __int16 v40 = 2112;
          uint64_t v41 = a2;
          _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "[SYNCHRONIZER: %p] Unable to find child digitizer event in the initial HID event: %@.", v38, 0x16u);
        }
        -[_UIHIDEventSynchronizer _completeWithReason:](a1, (uint64_t)"unexpected event data");
      }
      uint64_t v19 = 0;
LABEL_37:
      _Block_object_dispose(&v34, 8);
      break;
    case 1:
      if (*(unsigned char *)__UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25ED98)) {
        -[_UIHIDEventSynchronizer _logPerformanceData:](a1, a2);
      }
      if (*(void *)(a1 + 8) == 1)
      {
        -[_UIHIDEventSynchronizer _completeWithReason:](a1, (uint64_t)"Passthrough session ended");
        return 0;
      }
      if (!-[_UIHIDEventSynchronizer _processDigitizerEvent:]((void *)a1, a2)) {
        return 0;
      }
      if (*(void *)(a1 + 88) && !*(void *)(a1 + 104) && *(void *)(a1 + 16) == 1)
      {
        unint64_t v20 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDC8);
        if (*(unsigned char *)v20)
        {
          v30 = *(NSObject **)(v20 + 8);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            uint64_t v31 = *(void *)(a1 + 88);
            v32 = v30;
            if (v31) {
              uint64_t v33 = *(void *)(v31 + 96);
            }
            else {
              uint64_t v33 = 0;
            }
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v33;
            _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Begin rendering. Filter state: %ld.", buf, 0x16u);
          }
        }
        uint64_t v21 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:a1 selector:sel__renderEvents_];
        v22 = *(void **)(a1 + 104);
        *(void *)(a1 + 104) = v21;

        [*(id *)(a1 + 104) addToRunLoop:*(void *)(a1 + 40) forMode:*MEMORY[0x1E4F1C4B0]];
        *(void *)(a1 + 16) = 2;
      }
      return 1;
    case 2:
    case 3:
      return -[_UIHIDEventSynchronizer _processDigitizerEvent:]((void *)a1, a2);
    case 4:
      unint64_t v5 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &_MergedGlobals_927);
      if (*(unsigned char *)v5)
      {
        v6 = *(NSObject **)(v5 + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = a1;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] event is received after synchronization session completed. Will pass through.", buf, 0xCu);
        }
      }
      return 0;
    default:
      return 0;
  }
  return v19;
}

- (uint64_t)_processDigitizerEvent:(void *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __50___UIHIDEventSynchronizer__processDigitizerEvent___block_invoke;
  v25[3] = &unk_1E52DA1B0;
  v25[4] = a1;
  v25[5] = &v26;
  _UIEventHIDEnumerateChildren(a2, 11, v25);
  if (!v27[3])
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDA0);
    if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
      goto LABEL_18;
    }
    uint64_t v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 134218242;
    uint64_t v31 = a1;
    __int16 v32 = 2112;
    double v33 = *(double *)&a2;
    v6 = "[SYNCHRONIZER: %p] Skipping event without relevant path id: %@";
    v7 = v11;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 22;
    goto LABEL_5;
  }
  if (a1[2] == 3)
  {
    v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDA8) + 8);
    uint64_t v5 = 0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = a1;
      v6 = "[SYNCHRONIZER: %p] We haven't finished synthesizing the output path, but are already receiving new input path"
           ". Passing the event through.";
      v7 = v4;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
      uint32_t v9 = 12;
LABEL_5:
      _os_log_impl(&dword_1853B0000, v7, v8, v6, buf, v9);
LABEL_18:
      uint64_t v5 = 0;
    }
  }
  else
  {
    char IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v13 = IOHIDEventGetIntegerValue();
    unsigned int v14 = IntegerValue & 0x80;
    if (*(unsigned char *)__UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDB0))
    {
      v17 = BKSHIDEventGetDigitizerAttributes();
      double v18 = _UIEventHIDHitTestPointForChild(v17);
      uint64_t v20 = v19;

      unint64_t TimeStamp = IOHIDEventGetTimeStamp();
      double v22 = _UIMediaTimeForMachTime(TimeStamp);
      unint64_t v23 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDB8);
      if (*(unsigned char *)v23)
      {
        unint64_t v24 = *(NSObject **)(v23 + 8);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134219264;
          uint64_t v31 = a1;
          __int16 v32 = 2048;
          double v33 = v22;
          __int16 v34 = 2048;
          double v35 = v18;
          __int16 v36 = 2048;
          uint64_t v37 = v20;
          __int16 v38 = 1024;
          BOOL v39 = v13 != 0;
          __int16 v40 = 1024;
          unsigned int v41 = v14 >> 7;
          _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Processing digitizer event: %f, [%f:%f], touch: %d, cancel: %d.)", buf, 0x36u);
        }
      }
    }
    if ((-[_UIHIDPathSynchronizationFilter addInputEvent:](a1[11], v27[3]) & 1) == 0)
    {
      -[_UIHIDEventSynchronizer _completeWithReason:]((uint64_t)a1, (uint64_t)"unexpected event data");
      goto LABEL_18;
    }
    if (!v13 || v14)
    {
      uint64_t v15 = 6;
      if (v14) {
        uint64_t v15 = 7;
      }
      a1[12] = v15;
      a1[2] = 3;
    }
    uint64_t v5 = 1;
  }
  _Block_object_dispose(&v26, 8);
  return v5;
}

- (uint64_t)_completeWithReason:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDC0) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      uint64_t v12 = v3;
      __int16 v13 = 2080;
      uint64_t v14 = a2;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "[SYNCHRONIZER: %p] Session finished with reason '%s'.", (uint8_t *)&v11, 0x16u);
    }
    if (*(void *)(v3 + 104))
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDD0);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v7 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(v3 + 88);
          uint32_t v9 = v7;
          if (v8) {
            uint64_t v10 = *(void *)(v8 + 96);
          }
          else {
            uint64_t v10 = 0;
          }
          int v11 = 134218240;
          uint64_t v12 = v3;
          __int16 v13 = 2048;
          uint64_t v14 = v10;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Stop rendering. Filter state: %ld.", (uint8_t *)&v11, 0x16u);
        }
      }
      [*(id *)(v3 + 104) invalidate];
      v6 = *(void **)(v3 + 104);
      *(void *)(v3 + 104) = 0;
    }
    *(void *)(v3 + 16) = 4;
    return (*(uint64_t (**)(void))(*(void *)(v3 + 32) + 16))();
  }
  return result;
}

- (void)_logPerformanceData:(uint64_t)a1
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47___UIHIDEventSynchronizer__logPerformanceData___block_invoke;
  v15[3] = &unk_1E52DA1D8;
  v15[4] = &v16;
  _UIEventHIDEnumerateChildren(a2, 11, v15);
  if (v17[3])
  {
    uint64_t v3 = BKSHIDEventGetDigitizerAttributes();
    double v4 = _UIEventHIDHitTestPointForChild(v3);
    uint64_t v6 = v5;

    unint64_t TimeStamp = IOHIDEventGetTimeStamp();
    double v8 = _UIMediaTimeForMachTime(TimeStamp);
    double v9 = *(double *)(a1 + 64);
    uint64_t Latency = IOHIDEventGetLatency();
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &_logPerformanceData____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v12 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219520;
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 56);
        uint64_t v21 = a1;
        __int16 v22 = 2048;
        uint64_t v23 = v13;
        __int16 v24 = 2048;
        uint64_t v25 = v14;
        __int16 v26 = 2048;
        double v27 = v4;
        __int16 v28 = 2048;
        uint64_t v29 = v6;
        __int16 v30 = 2048;
        double v31 = v8 - v9;
        __int16 v32 = 2048;
        double v33 = (double)(unint64_t)Latency / 1000000.0;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Received second digitizer event. Initial path: [%f:%f] -> [%f:%f], duration: %f. Latency: %f.", buf, 0x48u);
      }
    }
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_renderEvents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    double v4 = CACurrentMediaTime();
    outputPathCollection = self->_outputPathCollection;
    if (self->_offsetToNextCoalescableEventIndex < 1)
    {
      [(_UIHIDPathCollection *)outputPathCollection setDigitizerSenderID:0x8000000800A15171];
    }
    else
    {
      [(_UIHIDPathCollection *)outputPathCollection setDigitizerSenderID:0x8000000800A15175];
      --self->_offsetToNextCoalescableEventIndex;
    }
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDD8);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v12 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        pathFilter = self->_pathFilter;
        uint64_t v14 = v12;
        if (pathFilter) {
          int64_t state = pathFilter->_state;
        }
        else {
          int64_t state = 0;
        }
        int v21 = 134218496;
        __int16 v22 = self;
        __int16 v23 = 2048;
        double v24 = v4;
        __int16 v25 = 2048;
        int64_t v26 = state;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Synthesize output event with timestamp: %f. Filter state: %ld.", (uint8_t *)&v21, 0x20u);
      }
    }
    -[_UIHIDPathSynchronizationFilter computeNextOutputPosition:]((uint64_t)self->_pathFilter, v4);
    if ([(_UIHIDPath *)self->_outputPath deliveryPhase] == 4) {
      [(_UIHIDPath *)self->_outputPath setDeliveryPhase:5];
    }
    v7 = self->_pathFilter;
    if (v7 && v7->_state == 2)
    {
      [(_UIHIDPath *)self->_outputPath setDeliveryPhase:self->_endingDeliveryPhase];
      v7 = self->_pathFilter;
    }
    -[_UIHIDPath setPosition:](self->_outputPath, "setPosition:", -[_UIHIDPathSynchronizationFilter outputPosition]((uint64_t)v7));
    [(_UIHIDPathCollection *)self->_outputPathCollection addPath:self->_outputPath];
    double v8 = self->_pathFilter;
    if (v8) {
      double outputPositionTimestamp = v8->_outputPositionTimestamp;
    }
    else {
      double outputPositionTimestamp = 0.0;
    }
    [(_UIHIDPathCollection *)self->_outputPathCollection updateEventTimestamp:_UIMachTimeForMediaTime(outputPositionTimestamp)];
    [(_UIHIDPathCollection *)self->_outputPathCollection hidEventFromCurrentState];
    unint64_t v10 = __UILogGetCategoryCachedImpl("HIDEventSynchronization", &qword_1EB25EDE0);
    if (*(unsigned char *)v10)
    {
      uint64_t v16 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = self->_pathFilter;
        uint64_t v18 = v16;
        int64_t v19 = (int64_t)v17;
        uint64_t v20 = v18;
        if (v17) {
          int64_t v19 = v17->_state;
        }
        int v21 = 134218240;
        __int16 v22 = self;
        __int16 v23 = 2048;
        double v24 = *(double *)&v19;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "[SYNCHRONIZER: %p] Deliver rendered event. Filter state: %ld.", (uint8_t *)&v21, 0x16u);
      }
    }
    (*((void (**)(void))self->_outputEventsHandler + 2))();
  }
  int v11 = self->_pathFilter;
  if (v11 && v11->_state == 2)
  {
    -[_UIHIDEventSynchronizer _completeWithReason:]((uint64_t)self, (uint64_t)"paths in sync");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_pathFilter, 0);
  objc_storeStrong((id *)&self->_outputPathCollection, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_outputEventsHandler, 0);
}

@end