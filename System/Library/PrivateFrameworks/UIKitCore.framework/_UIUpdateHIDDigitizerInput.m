@interface _UIUpdateHIDDigitizerInput
+ (char)inputWithProfileName:(uint64_t)a1;
- (__IOHIDEvent)stopEventForModelTime:(unint64_t)a3 alignment:(int)a4;
- (void)addEvent:(__IOHIDEvent *)a3;
- (void)dealloc;
- (void)removeEvent:(__IOHIDEvent *)a3;
@end

@implementation _UIUpdateHIDDigitizerInput

- (__IOHIDEvent)stopEventForModelTime:(unint64_t)a3 alignment:(int)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t eventModelTimeDifferenceMin = self->_eventModelTimeDifferenceMin;
  int64_t shiftDuration = self->_input._alignments[a4].shiftDuration;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = self->_events;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = a3 - eventModelTimeDifferenceMin - shiftDuration;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v7);
      }
      v13 = *(__IOHIDEvent **)(*((void *)&v15 + 1) + 8 * v12);
      if ((IOHIDEventGetEventFlags() & 0x40) == 0 && v10 < IOHIDEventGetTimeStamp()) {
        break;
      }
      if (v9 == ++v12)
      {
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v13 = 0;
  }

  return v13;
}

+ (char)inputWithProfileName:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self;
  memset(v24, 0, 512);
  uint64_t v3 = _UIUpdateInputTimingProfileLoad(a2, (uint64_t)v24);
  v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventBus", &inputWithProfileName____s_category) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = SLODWORD(v24[0]);
    v6 = v4;
    if (v5 >= 3) {
      abort();
    }
    v7 = v6;
    uint64_t v8 = off_1E5305A10[v5];
    *(_DWORD *)v21 = 136315650;
    *(void *)&v21[4] = a2;
    *(_WORD *)&v21[12] = 2080;
    *(void *)&v21[14] = v8;
    __int16 v22 = 2080;
    v23 = (char *)v24 + 4;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Event Timing Profile for %s: %s, path=\"%s\"", v21, 0x20u);
  }
  if (v3 && (uint64_t v9 = [_UIUpdateHIDDigitizerInput alloc]) != 0)
  {
    *(void *)v21 = v9;
    *(void *)&v21[8] = _UIUpdateHIDDigitizerInput;
    unint64_t v10 = (char *)objc_msgSendSuper2((objc_super *)v21, sel_init);
    uint64_t v11 = v10;
    if (v10)
    {
      *((void *)v10 + 13) = v3;
      uint64_t v12 = objc_opt_new();
      v13 = (void *)*((void *)v11 + 14);
      *((void *)v11 + 14) = v12;

      uint64_t v14 = objc_opt_new();
      long long v15 = (void *)*((void *)v11 + 15);
      *((void *)v11 + 15) = v14;

      int v16 = *(unsigned __int8 *)(v3 + 24);
      *((void *)v11 + 2) = 0;
      *((void *)v11 + 3) = 0;
      *((void *)v11 + 1) = 0;
      *((_DWORD *)v11 + 8) = v16;
      *(_OWORD *)(v11 + 40) = 0u;
      *(_OWORD *)(v11 + 56) = 0u;
      *((void *)v11 + 9) = 0;
      *((void *)v11 + 10) = _UIUpdateHIDDigitizerReadyForModelTime;
      *((void *)v11 + 11) = v11;
      *((void *)v11 + 12) = a2;
      _UIUpdateInputSetAddInput((uint64_t)&commonSet, (void *)v11 + 1);
      uint64_t v17 = *((void *)v11 + 13);
      uint64_t v18 = *(void *)(v17 + 8) + *(void *)v17;
      *((void *)v11 + 16) = v18 - *(void *)(v17 + 16);
      *((void *)v11 + 17) = *(void *)(v17 + 16) + v18;
      if (*(unsigned char *)(v17 + 24)) {
        *((void *)v11 + 6) = *(void *)(v17 + 32);
      }
      uint64_t v19 = *(void *)(v17 + 72);
      if (v19 && *(unsigned char *)(v19 + 8) || (uint64_t v19 = *(void *)(v17 + 80)) != 0 && *(unsigned char *)(v19 + 8)) {
        *((void *)v11 + 18) = *(void *)v19;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (void)removeEvent:(__IOHIDEvent *)a3
{
  p_input = &self->_input;
  [(NSMutableArray *)self->_events removeObjectIdenticalTo:a3];
  if ([(NSMutableArray *)self->_events count])
  {
    [(NSMutableArray *)self->_events firstObject];

    self->_input._state.earliestModelTime = self->_eventModelTimeDifferenceMin + IOHIDEventGetTimeStamp();
  }
  else
  {
    self->_input._state.mode = self->_nextEventExpected;
  }
  set = self->_input._set;
  _UIUpdateInputSetInputChanged(set, (uint64_t)p_input);
}

- (void)addEvent:(__IOHIDEvent *)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  unint64_t TimeStamp = IOHIDEventGetTimeStamp();
  int64_t eventModelTimeDifferenceMin = self->_eventModelTimeDifferenceMin;
  int64_t eventModelTimeDifferenceMax = self->_eventModelTimeDifferenceMax;
  unsigned int EventFlags = IOHIDEventGetEventFlags();
  char v9 = IOHIDEventGetEventFlags();
  BOOL nextEventExpected = self->_nextEventExpected;
  uint64_t v11 = BKSHIDEventGetDigitizerAttributes();
  int v12 = v9 & 0x40;
  __int16 v13 = [v11 options];

  if ((v13 & 0x200) == 0 && self->_input._state.latestModelTime < eventModelTimeDifferenceMax + TimeStamp) {
    self->_input._state.latestModelTime = eventModelTimeDifferenceMax + TimeStamp;
  }
  int64_t nextEventReceiveDeadlineTimeDifference = self->_nextEventReceiveDeadlineTimeDifference;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  if (self->_profile->var6 && v12 == 0)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke;
    v37[3] = &unk_1E53059C8;
    v37[4] = self;
    v37[5] = &v42;
    v37[6] = &v38;
    _UIEventHIDEnumerateChildren((uint64_t)a3, 1, v37);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __39___UIUpdateHIDDigitizerInput_addEvent___block_invoke_2;
  v36[3] = &unk_1E53059F0;
  v36[4] = self;
  v36[5] = a3;
  _UIEventHIDEnumerateChildren((uint64_t)a3, 11, v36);
  uint64_t v16 = [(NSMutableSet *)self->_touches count];
  uint64_t v17 = (unsigned char *)v39[3];
  BOOL v18 = v17 == 0;
  self->_BOOL nextEventExpected = v16 != 0;
  if (!v16) {
    BOOL v18 = 0;
  }
  if (v17 && v16) {
    BOOL v18 = *v17 != 0;
  }
  self->_BOOL nextEventExpected = v18;
  events = self->_events;
  if (*((unsigned char *)v43 + 24))
  {
    if (![(NSMutableArray *)events count]) {
      self->_input._state.int mode = self->_nextEventExpected;
    }
  }
  else
  {
    if (![(NSMutableArray *)events count])
    {
      unint64_t v20 = eventModelTimeDifferenceMin + TimeStamp;
      if (v12) {
        unint64_t v20 = 0;
      }
      self->_input._state.earliestModelTime = v20;
      self->_input._state.int mode = 2;
    }
    [(NSMutableArray *)self->_events addObject:a3];
  }
  if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck())
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("EventBus", &addEvent____s_category_0);
    __int16 v22 = *(id *)(CategoryCachedImpl + 8);
    os_signpost_id_t v23 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v24 = v23;
      if (os_signpost_enabled(v22))
      {
        unsigned int v34 = v12;
        BOOL v35 = nextEventExpected;
        BOOL v33 = v39[3] != 0;
        BOOL v31 = self->_nextEventExpected;
        int v32 = *((unsigned __int8 *)v43 + 24);
        double v25 = _UIMediaDurationForMachDuration(nextEventReceiveDeadlineTimeDifference);
        double v26 = _UIMediaDurationForMachDuration(self->_nextEventReceiveDeadlineTimeDifference);
        int v30 = [(NSMutableArray *)self->_events count];
        int v27 = [(NSMutableSet *)self->_touches count];
        int mode = self->_input._state.mode;
        memset(v46, 0, sizeof(v46));
        v29 = _UIMachTimeDebugDescriptionCopyCStr(TimeStamp, 0, v46, 0x30uLL);
        *(_DWORD *)buf = 67112194;
        int v48 = (EventFlags >> 5) & 1;
        __int16 v49 = 1024;
        BOOL v50 = v35;
        __int16 v51 = 1024;
        BOOL v52 = v31;
        __int16 v53 = 1024;
        int v54 = (unsigned __int16)(v13 & 0x200) >> 9;
        __int16 v55 = 1024;
        unsigned int v56 = v34 >> 6;
        __int16 v57 = 1024;
        BOOL v58 = v33;
        __int16 v59 = 1024;
        int v60 = v32;
        __int16 v61 = 2048;
        double v62 = v25;
        __int16 v63 = 2048;
        double v64 = v26;
        __int16 v65 = 1024;
        int v66 = v30;
        __int16 v67 = 1024;
        int v68 = v27;
        __int16 v69 = 1024;
        int v70 = mode;
        __int16 v71 = 2080;
        v72 = v29;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v22, OS_SIGNPOST_EVENT, v24, "EventAdded", "interpolated=%u, expected=%u, nextExpected=%u, multiplexedMore=%u, synthetic=%u, nextInfo=%u, onlyInfo=%u, deadline=%.06f, nextDeadline=%.06f, events=%u, touches=%u, mode=%u, event=%s", buf, 0x5Cu);
      }
    }
  }
  _UIUpdateInputSetInputChanged(self->_input._set, (uint64_t)&self->_input);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
}

- (void)dealloc
{
  free(self->_profile);
  v3.receiver = self;
  v3.super_class = (Class)_UIUpdateHIDDigitizerInput;
  [(_UIUpdateHIDDigitizerInput *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

@end