@interface SACallTreeState
+ (id)treeCountedStateWithWaitInfo:(uint64_t)a1 turnstileInfo:(void *)a2 isPartOfADeadlock:(void *)a3 isBlockedByADeadlock:(unsigned int)a4 state:(unsigned int)a5 microstackshotState:(uint64_t)a6 pid:(unsigned int)a7 threadId:(int)a8 threadPriority:(uint64_t)a9 timeRange:(char)a10 originPid:(void *)a11 proximatePid:(uint64_t)a12 startSampleIndex:(uint64_t)a13 sampleCount:(uint64_t)a14;
+ (void)writeJSONDictionaryEntriesToStream:(__int16)a3 microstackshotState:(__int16)a4 primaryMicrostackshotState:(int)a5 includeIdleAndBattery:;
+ (void)writeJSONDictionaryEntriesToStream:(uint64_t)a3 state:(uint64_t *)a4 primaryState:;
- (NSString)debugDescription;
- (SACallTreeState)initWithWaitInfo:(id)a3 turnstileInfo:(id)a4 isPartOfADeadlock:(BOOL)a5 isBlockedByADeadlock:(BOOL)a6 state:(unint64_t)a7 microstackshotState:(unsigned int)a8 pid:(int)a9 threadId:(unint64_t)a10 threadPriority:(unsigned __int8)a11 timeRange:(id)a12 originPid:(int)a13 proximatePid:(int)a14 startSampleIndex:(unint64_t)a15 sampleCount:(unint64_t)a16;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SACallTreeState

- (SACallTreeState)initWithWaitInfo:(id)a3 turnstileInfo:(id)a4 isPartOfADeadlock:(BOOL)a5 isBlockedByADeadlock:(BOOL)a6 state:(unint64_t)a7 microstackshotState:(unsigned int)a8 pid:(int)a9 threadId:(unint64_t)a10 threadPriority:(unsigned __int8)a11 timeRange:(id)a12 originPid:(int)a13 proximatePid:(int)a14 startSampleIndex:(unint64_t)a15 sampleCount:(unint64_t)a16
{
  id v21 = a3;
  id v22 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SACallTreeState;
  id v23 = a12;
  v24 = [(SACallTreeNode *)&v31 initWithStartSampleIndex:a15 sampleCount:a16];
  if (v24)
  {
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v23, 0);
    timeRanges = v24->_timeRanges;
    v24->_timeRanges = (NSMutableArray *)v25;

    v24->_pid = a9;
    v24->_threadId = a10;
    v24->_threadPriority = a11;
    objc_storeStrong((id *)&v24->_waitInfo, a3);
    objc_storeStrong((id *)&v24->_turnstileInfo, a4);
    v24->_isPartOfADeadlock = a5;
    v24->_isBlockedByADeadlock = a6;
    v24->_state = a7;
    v24->_microstackshotState = a8;
    unint64_t v27 = a15 + a16 - 1;
    if (a15 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v24->_endSampleIndex = v27;
    v24->_originPid = a13;
    v24->_proximatePid = a14;
  }

  return v24;
}

+ (id)treeCountedStateWithWaitInfo:(uint64_t)a1 turnstileInfo:(void *)a2 isPartOfADeadlock:(void *)a3 isBlockedByADeadlock:(unsigned int)a4 state:(unsigned int)a5 microstackshotState:(uint64_t)a6 pid:(unsigned int)a7 threadId:(int)a8 threadPriority:(uint64_t)a9 timeRange:(char)a10 originPid:(void *)a11 proximatePid:(uint64_t)a12 startSampleIndex:(uint64_t)a13 sampleCount:(uint64_t)a14
{
  id v16 = a11;
  id v17 = a3;
  id v18 = a2;
  LOBYTE(v22) = a10;
  LODWORD(v21) = a8;
  v19 = objc_msgSend(objc_alloc((Class)self), "initWithWaitInfo:turnstileInfo:isPartOfADeadlock:isBlockedByADeadlock:state:microstackshotState:pid:threadId:threadPriority:timeRange:originPid:proximatePid:startSampleIndex:sampleCount:", v18, v17, a4, a5, a6, a7, v21, a9, v22, v16, a12, a13, a14);

  return v19;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CC38];
  v6 = (void *)MEMORY[0x1E4F1CC28];
  if ((self->_microstackshotState & 2) != 0) {
    v7 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v30 = v4;
  SAJSONWriteDictionaryFirstEntry(v4, @"foreground", v7);
  unsigned int microstackshotState = self->_microstackshotState;
  if ((microstackshotState & 0x10) != 0)
  {
    if ((microstackshotState & 4) != 0) {
      v9 = v6;
    }
    else {
      v9 = v5;
    }
    SAJSONWriteDictionaryEntry(v30, @"userActive", v9);
    if ((self->_microstackshotState & 8) != 0) {
      v10 = v5;
    }
    else {
      v10 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"onBattery", v10);
    unsigned int microstackshotState = self->_microstackshotState;
  }
  if ((microstackshotState & 0x20) != 0) {
    v11 = v5;
  }
  else {
    v11 = v6;
  }
  SAJSONWriteDictionaryEntry(v30, @"suppressed", v11);
  if ((self->_microstackshotState & 0x80) != 0) {
    v12 = v5;
  }
  else {
    v12 = v6;
  }
  SAJSONWriteDictionaryEntry(v30, @"kernelMode", v12);
  unint64_t v13 = (((unint64_t)self->_microstackshotState >> 8) & 7) - 1;
  if (v13 > 6) {
    v14 = "Thread QoS Unknown";
  }
  else {
    v14 = off_1E63F8F20[v13];
  }
  v15 = [NSString stringWithUTF8String:v14];
  SAJSONWriteDictionaryEntry(v30, @"effectiveQos", v15);

  unint64_t v16 = (((unint64_t)self->_microstackshotState >> 11) & 7) - 1;
  if (v16 > 6) {
    id v17 = "Thread QoS Unknown";
  }
  else {
    id v17 = off_1E63F8F20[v16];
  }
  id v18 = [NSString stringWithUTF8String:v17];
  SAJSONWriteDictionaryEntry(v30, @"requestedQos", v18);

  unint64_t state = self->_state;
  if (state)
  {
    if ((state & 4) != 0) {
      v20 = v5;
    }
    else {
      v20 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"running", v20);
    if ((self->_state & 2) != 0) {
      uint64_t v21 = v5;
    }
    else {
      uint64_t v21 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"runnable", v21);
    if (self->_state) {
      uint64_t v22 = v5;
    }
    else {
      uint64_t v22 = v6;
    }
    SAJSONWriteDictionaryEntry(v30, @"suspended", v22);
  }
  waitInfo = self->_waitInfo;
  if (waitInfo)
  {
    v24 = [(SAWaitInfo *)waitInfo descriptionForPid:self->_pid tid:self->_threadId options:3 nameCallback:&__block_literal_global_8];
    if (v24) {
      SAJSONWriteDictionaryEntry(v30, @"waitInfo", v24);
    }
  }
  turnstileInfo = self->_turnstileInfo;
  if (turnstileInfo)
  {
    v26 = [(SATurnstileInfo *)turnstileInfo descriptionForPid:self->_pid tid:self->_threadId threadPriority:self->_threadPriority options:3 nameCallback:&__block_literal_global_152];
    if (v26) {
      SAJSONWriteDictionaryEntry(v30, @"turnstileInfo", v26);
    }
  }
  if (self->_isPartOfADeadlock)
  {
    unint64_t v27 = [NSNumber numberWithBool:1];
    SAJSONWriteDictionaryEntry(v30, @"isPartOfADeadlock", v27);
  }
  if (self->_isBlockedByADeadlock)
  {
    v28 = [NSNumber numberWithBool:1];
    SAJSONWriteDictionaryEntry(v30, @"isBlockedByADeadlock", v28);
  }
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  SAJSONWriteDictionaryEntry(v30, @"count", v29);
}

id __54__SACallTreeState_writeJSONDictionaryEntriesToStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == -1)
  {
    v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%llx", a3, v8);
  }
  else
  {
    id v5 = [NSString alloc];
    if (a3) {
      v6 = objc_msgSend(v5, "initWithFormat:", @"[%d] 0x%llx", a2, a3);
    }
    else {
      v6 = objc_msgSend(v5, "initWithFormat:", @"[%d]", a2, v8);
    }
  }
  return v6;
}

id __54__SACallTreeState_writeJSONDictionaryEntriesToStream___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == -1)
  {
    v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"0x%llx", a3, v8);
  }
  else
  {
    id v5 = [NSString alloc];
    if (a3) {
      v6 = objc_msgSend(v5, "initWithFormat:", @"[%d] 0x%llx", a2, a3);
    }
    else {
      v6 = objc_msgSend(v5, "initWithFormat:", @"[%d]", a2, v8);
    }
  }
  return v6;
}

+ (void)writeJSONDictionaryEntriesToStream:(__int16)a3 microstackshotState:(__int16)a4 primaryMicrostackshotState:(int)a5 includeIdleAndBattery:
{
  id v23 = a2;
  self;
  uint64_t v8 = (void *)MEMORY[0x1E4F1CC38];
  v9 = (void *)MEMORY[0x1E4F1CC28];
  if ((a3 & 2) != (a4 & 2))
  {
    if ((a3 & 2) != 0) {
      v10 = (void *)MEMORY[0x1E4F1CC38];
    }
    else {
      v10 = (void *)MEMORY[0x1E4F1CC28];
    }
    SAJSONWriteDictionaryEntry(v23, @"foreground", v10);
  }
  if ((a3 & 0x20) != (a4 & 0x20))
  {
    if ((a3 & 0x20) != 0) {
      v11 = v8;
    }
    else {
      v11 = v9;
    }
    SAJSONWriteDictionaryEntry(v23, @"suppressed", v11);
  }
  if ((a3 & 0x80) != (a4 & 0x80))
  {
    if ((a3 & 0x80) != 0) {
      v12 = v8;
    }
    else {
      v12 = v9;
    }
    SAJSONWriteDictionaryEntry(v23, @"kernelMode", v12);
  }
  if (a5)
  {
    if ((a3 & 0x10) == 0)
    {
      if ((a4 & 0x10) == 0) {
        goto LABEL_36;
      }
      unint64_t v13 = @"idleBatteryInvalid";
      v14 = (void *)MEMORY[0x1E4F1CC38];
      goto LABEL_35;
    }
    if ((a4 & 0x10) == 0)
    {
      if ((a3 & 4) != 0) {
        v15 = v9;
      }
      else {
        v15 = v8;
      }
      SAJSONWriteDictionaryEntry(v23, @"userActive", v15);
LABEL_31:
      if ((a3 & 8) != 0) {
        v14 = v8;
      }
      else {
        v14 = v9;
      }
      unint64_t v13 = @"onBattery";
LABEL_35:
      SAJSONWriteDictionaryEntry(v23, v13, v14);
      goto LABEL_36;
    }
    if (((a4 ^ a3) & 4) != 0)
    {
      if ((a3 & 4) != 0) {
        unint64_t v16 = v9;
      }
      else {
        unint64_t v16 = v8;
      }
      SAJSONWriteDictionaryEntry(v23, @"userActive", v16);
    }
    if (((a4 ^ a3) & 8) != 0) {
      goto LABEL_31;
    }
  }
LABEL_36:
  if ((a3 & 0x700) != (a4 & 0x700))
  {
    uint64_t v17 = ((unsigned __int16)(a3 & 0x700) >> 8) - 1;
    if (v17 > 6) {
      id v18 = "Thread QoS Unknown";
    }
    else {
      id v18 = off_1E63F8F20[v17];
    }
    v19 = [NSString stringWithUTF8String:v18];
    SAJSONWriteDictionaryEntry(v23, @"effectiveQos", v19);
  }
  if ((a3 & 0x3800) != (a4 & 0x3800))
  {
    uint64_t v20 = ((unsigned __int16)(a3 & 0x3800) >> 11) - 1;
    if (v20 > 6) {
      uint64_t v21 = "Thread QoS Unknown";
    }
    else {
      uint64_t v21 = off_1E63F8F20[v20];
    }
    uint64_t v22 = [NSString stringWithUTF8String:v21];
    SAJSONWriteDictionaryEntry(v23, @"requestedQos", v22);
  }
}

+ (void)writeJSONDictionaryEntriesToStream:(uint64_t)a3 state:(uint64_t *)a4 primaryState:
{
  id v18 = a2;
  self;
  if (!a4)
  {
    if (a3) {
      SAJSONWriteDictionaryEntry(v18, @"suspended", MEMORY[0x1E4F1CC38]);
    }
    if ((a3 & 4) != 0)
    {
      SAJSONWriteDictionaryEntry(v18, @"running", MEMORY[0x1E4F1CC38]);
    }
    else if ((a3 & 6) == 2)
    {
LABEL_21:
      if ((a3 & 2) != 0) {
        v10 = (void *)MEMORY[0x1E4F1CC38];
      }
      else {
        v10 = (void *)MEMORY[0x1E4F1CC28];
      }
      SAJSONWriteDictionaryEntry(v18, @"runnable", v10);
      unint64_t v11 = a3 & 0x7F8;
      BOOL v12 = v11 != 0;
      if (!a4)
      {
        if ((a3 & 0x7F8) == 0) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
      goto LABEL_32;
    }
    unint64_t v11 = a3 & 0x7F8;
    if ((a3 & 0x7F8) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  uint64_t v6 = *a4;
  uint64_t v7 = *a4 ^ a3;
  if (v7)
  {
    if (a3) {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CC28];
    }
    SAJSONWriteDictionaryEntry(v18, @"suspended", v8);
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 ^ a3;
  }
  if ((v7 & 4) == 0)
  {
    if ((a3 & 4) != 0) {
      goto LABEL_27;
    }
LABEL_20:
    if (!(v6 & 4 | v7 & 2))
    {
LABEL_27:
      unint64_t v11 = a3 & 0x7F8;
      BOOL v12 = v11 != 0;
      goto LABEL_33;
    }
    goto LABEL_21;
  }
  if ((a3 & 4) != 0) {
    v9 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    v9 = (void *)MEMORY[0x1E4F1CC28];
  }
  SAJSONWriteDictionaryEntry(v18, @"running", v9);
  if ((a3 & 4) == 0)
  {
    uint64_t v6 = *a4;
    uint64_t v7 = *a4 ^ a3;
    goto LABEL_20;
  }
  unint64_t v11 = a3 & 0x7F8;
  BOOL v12 = v11 != 0;
LABEL_32:
  uint64_t v6 = *a4;
LABEL_33:
  if (((v12 ^ ((v6 & 0x7F8) != 0)) & 1) == 0)
  {
    char v14 = !v12;
    if ((v6 & 0x7F8) == 0) {
      char v14 = 1;
    }
    if ((v14 & 1) != 0 || (v11 >> 3) == (v6 >> 3))
    {
LABEL_46:
      uint64_t v15 = *a4 ^ a3;
      if ((v15 & 0x800) != 0)
      {
        if ((a3 & 0x800) != 0) {
          unint64_t v16 = (void *)MEMORY[0x1E4F1CC38];
        }
        else {
          unint64_t v16 = (void *)MEMORY[0x1E4F1CC28];
        }
        SAJSONWriteDictionaryEntry(v18, @"eCore", v16);
        uint64_t v15 = *a4 ^ a3;
      }
      if ((v15 & 0x1000) != 0) {
        goto LABEL_52;
      }
      goto LABEL_56;
    }
  }
  if (!v12)
  {
    SAJSONWriteDictionaryEntry(v18, @"cpuNum", &unk_1F1A9AF08);
    goto LABEL_46;
  }
LABEL_35:
  unint64_t v13 = [NSNumber numberWithInt:(v11 >> 3) - 1];
  SAJSONWriteDictionaryEntry(v18, @"cpuNum", v13);

  if (a4) {
    goto LABEL_46;
  }
LABEL_36:
  if ((a3 & 0x800) != 0) {
    SAJSONWriteDictionaryEntry(v18, @"eCore", MEMORY[0x1E4F1CC38]);
  }
  if ((a3 & 0x1000) != 0)
  {
LABEL_52:
    if ((a3 & 0x1000) != 0) {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CC28];
    }
    SAJSONWriteDictionaryEntry(v18, @"pCore", v17);
  }
LABEL_56:
}

- (NSString)debugDescription
{
  id v20 = [NSString alloc];
  unint64_t v19 = [(SACallTreeNode *)self startSampleIndex];
  if (self) {
    unint64_t endSampleIndex = self->_endSampleIndex;
  }
  else {
    unint64_t endSampleIndex = 0;
  }
  unint64_t v3 = [(SACallTreeNode *)self sampleCount];
  unint64_t threadId = self->_threadId;
  unint64_t v17 = v3;
  uint64_t threadPriority = self->_threadPriority;
  unint64_t state = self->_state;
  uint64_t pid = self->_pid;
  uint64_t microstackshotState = self->_microstackshotState;
  uint64_t v7 = [(SAWaitInfo *)self->_waitInfo debugDescription];
  uint64_t v8 = [(SATurnstileInfo *)self->_turnstileInfo debugDescription];
  BOOL isPartOfADeadlock = self->_isPartOfADeadlock;
  BOOL isBlockedByADeadlock = self->_isBlockedByADeadlock;
  unint64_t v11 = [(NSMutableArray *)self->_childIOEvents debugDescription];
  BOOL v12 = [(NSMutableArray *)self->_timeRanges debugDescription];
  unint64_t v13 = (void *)[v20 initWithFormat:@"tree state %lu-%lu (%lu) [%d] thread 0x%llx priority:%d state:0x%llx microState:0x%x waitInfo:%@ turnstileInfo:%@ deadlocked:%d indirectly_deadlocked:%d io:%@ timeRanges:%@ originPid:%d proximatePid:%d", v19, endSampleIndex, v17, pid, threadId, threadPriority, state, microstackshotState, v7, v8, isPartOfADeadlock, isBlockedByADeadlock, v11, v12, self->_originPid, self->_proximatePid];

  return (NSString *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRanges, 0);
  objc_storeStrong((id *)&self->_childIOEvents, 0);
  objc_storeStrong((id *)&self->_turnstileInfo, 0);
  objc_storeStrong((id *)&self->_waitInfo, 0);
}

@end