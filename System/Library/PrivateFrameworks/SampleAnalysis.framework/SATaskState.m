@interface SATaskState
+ (SATaskState)stateWithPAStyleTaskPrivateData:(void *)a3 donatingUniquePids:;
+ (SATaskState)stateWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6;
+ (SATaskStateInTransition)stateWithKCDataTransitioningTask:(uint64_t)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)stateWithKCDataDeltaTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:;
+ (id)stateWithKCDataTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:;
+ (void)stateWithStackshotTaskV1:(uint64_t)a3 machTimebase:(unsigned int)a4 hwPageSize:(void *)a5 startTimestamp:(void *)a6 endTimestamp:(uint64_t)a7 startSampleIndex:(uint64_t)a8 endSampleIndex:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isBoosted;
- (BOOL)isDarwinBG;
- (BOOL)isDarwinExtBG;
- (BOOL)isDirty;
- (BOOL)isForeground;
- (BOOL)isFrozen;
- (BOOL)isImpDonor;
- (BOOL)isLiveImpDonor;
- (BOOL)isNonVisible;
- (BOOL)isPidSuspended;
- (BOOL)isSuppressed;
- (BOOL)isSuspended;
- (BOOL)isTaskResourceFlagged;
- (BOOL)isTerminatedSnapshot;
- (BOOL)isTimerThrottled;
- (BOOL)isVisible;
- (BOOL)transitionIsTerminated;
- (BOOL)wqExceededConstrainedThreadLimit;
- (BOOL)wqExceededTotalThreadLimit;
- (NSSet)donatingUniquePids;
- (NSString)debugDescription;
- (SATaskState)initWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6;
- (SATimestamp)endTimestamp;
- (SATimestamp)startTimestamp;
- (id)debugDescriptionWithTask:(uint64_t)a1;
- (uint64_t)correspondsToKCDataDeltaTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:;
- (uint64_t)correspondsToKCDataTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:;
- (uint64_t)correspondsToKCDataTransitioningTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:;
- (unint64_t)endSampleIndex;
- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)ssFlags;
- (unint64_t)startSampleIndex;
- (unint64_t)taskSizeInBytes;
- (unint64_t)terminatedThreadsCpuTimeNs;
- (unint64_t)terminatedThreadsCycles;
- (unint64_t)terminatedThreadsInstructions;
- (unint64_t)terminatedThreadsSystemTimeInNs;
- (unint64_t)terminatedThreadsUserTimeInNs;
- (unint64_t)transitionType;
- (unsigned)cowFaults;
- (unsigned)faults;
- (unsigned)latencyQos;
- (unsigned)pageins;
- (unsigned)suspendCount;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)applyPAStyleSampleTimestamp:(uint64_t)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SATaskState

- (unint64_t)terminatedThreadsCycles
{
  return self->_terminatedThreadsCycles;
}

- (unsigned)cowFaults
{
  return self->_cowFaults;
}

+ (void)stateWithStackshotTaskV1:(uint64_t)a3 machTimebase:(unsigned int)a4 hwPageSize:(void *)a5 startTimestamp:(void *)a6 endTimestamp:(uint64_t)a7 startSampleIndex:(uint64_t)a8 endSampleIndex:
{
  id v14 = a6;
  id v15 = a5;
  self;
  v16 = [SATaskState alloc];
  if (v16)
  {
    uint64_t v17 = [(SATaskState *)v16 initWithStartTimestamp:v15 endTimestamp:v14 startSampleIndex:a7 endSampleIndex:a8];
    v18 = (void *)v17;
    if (v17)
    {
      *(_DWORD *)(v17 + 8) = *(_DWORD *)(a2 + 60);
      int v19 = *(_DWORD *)(a2 + 68);
      *(void *)(v17 + 64) = *(int *)(a2 + 64) * (unint64_t)a4;
      *(_DWORD *)(v17 + 12) = v19;
      *(_DWORD *)(v17 + 16) = *(_DWORD *)(a2 + 72);
      *(_DWORD *)(v17 + 20) = *(_DWORD *)(a2 + 76);
      *(void *)(v17 + 112) = *(unsigned int *)(a2 + 80);
      *(_DWORD *)(v17 + 24) = *(_DWORD *)(a2 + 125);
      if (a3 && HIDWORD(a3))
      {
        if (a3 == HIDWORD(a3))
        {
          *(void *)(v17 + 72) = *(void *)(a2 + 16);
          uint64_t v20 = *(void *)(a2 + 24);
        }
        else
        {
          *(void *)(v17 + 72) = __udivti3();
          uint64_t v20 = __udivti3();
        }
      }
      else
      {
        uint64_t v20 = 0;
        v18[9] = 0;
      }
      v18[10] = v20;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (SATimestamp)endTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 40, 1);
}

- (SATaskState)initWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SATaskState;
  v13 = [(SATaskState *)&v16 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startTimestamp, a3);
    objc_storeStrong((id *)&v14->_endTimestamp, a4);
    v14->_startSampleIndex = a5;
    v14->_endSampleIndex = a6;
  }

  return v14;
}

- (unint64_t)taskSizeInBytes
{
  return self->_taskSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donatingUniquePids, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

- (unint64_t)transitionType
{
  return 0;
}

- (BOOL)transitionIsTerminated
{
  return [(SATaskState *)self transitionType] & 1;
}

- (id)debugDescriptionWithTask:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [NSString alloc];
    v7 = [v3 debugDescription];
    uint64_t v8 = *(void *)(a1 + 48);
    if (v4 == v5)
    {
      v10 = [*(id *)(a1 + 32) debugDescription];
      id v12 = (void *)[v6 initWithFormat:@"%@ @ sample index %lu\n%@", v7, v8, v10];
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 56);
      v10 = [*(id *)(a1 + 32) debugDescription];
      id v11 = [*(id *)(a1 + 40) debugDescription];
      id v12 = (void *)[v6 initWithFormat:@"%@ @ sample indexes %lu-%lu\nstart:%@\n  end:%@", v7, v8, v9, v10, v11];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSString)debugDescription
{
  startTimestamp = self->_startTimestamp;
  endTimestamp = self->_endTimestamp;
  id v5 = [NSString alloc];
  unint64_t startSampleIndex = self->_startSampleIndex;
  if (startTimestamp == endTimestamp)
  {
    uint64_t v8 = [(SATimestamp *)self->_startTimestamp debugDescription];
    v10 = (void *)[v5 initWithFormat:@"Task state @ sample index %lu\n%@", startSampleIndex, v8];
  }
  else
  {
    unint64_t endSampleIndex = self->_endSampleIndex;
    uint64_t v8 = [(SATimestamp *)self->_startTimestamp debugDescription];
    uint64_t v9 = [(SATimestamp *)self->_endTimestamp debugDescription];
    v10 = (void *)[v5 initWithFormat:@"Task state @ sample indexes %lu-%lu\nstart:%@\n  end:%@", startSampleIndex, endSampleIndex, v8, v9];
  }
  return (NSString *)v10;
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    int v16 = *__error();
    p_super = _sa_logt();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v33 = a3;
      __int16 v34 = 2048;
      unint64_t v35 = a4;
      _os_log_error_impl(&dword_1BF22B000, p_super, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu > endSampleIndexCap %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(2387, "startSampleIndexCap %lu > endSampleIndexCap %lu", v17, v18, v19, v20, v21, v22, a3);
    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  p_super = &self->super;
  unint64_t startSampleIndex = self->_startSampleIndex;
  unint64_t endSampleIndex = self->_endSampleIndex;
  if (startSampleIndex == 0x7FFFFFFFFFFFFFFFLL) {
    return endSampleIndex == 0x7FFFFFFFFFFFFFFFLL;
  }
  if (endSampleIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_27:
    int v23 = *__error();
    v24 = _sa_logt();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      Class isa = p_super[6].isa;
      *(_DWORD *)buf = 134217984;
      unint64_t v33 = (unint64_t)isa;
      _os_log_error_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_ERROR, "_startSampleIndex %lu, end NSNotFound", buf, 0xCu);
    }

    *__error() = v23;
    _SASetCrashLogMessage(2390, "_startSampleIndex %lu, end NSNotFound", v26, v27, v28, v29, v30, v31, (char)p_super[6].isa);
    _os_crash();
    __break(1u);
  }
  if (endSampleIndex >= a4) {
    unint64_t v12 = a4;
  }
  else {
    unint64_t v12 = self->_endSampleIndex;
  }
  if (a4 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t endSampleIndex = v12;
  }
  if (startSampleIndex <= a3) {
    unint64_t v13 = a3;
  }
  else {
    unint64_t v13 = self->_startSampleIndex;
  }
  if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t startSampleIndex = v13;
  }
  BOOL v14 = endSampleIndex >= startSampleIndex;
  unint64_t v15 = endSampleIndex - startSampleIndex;
  if (v14) {
    return v15 + 1;
  }
  else {
    return 0;
  }
}

- (BOOL)isSuspended
{
  return self->_suspendCount || [(SATaskState *)self isPidSuspended];
}

- (BOOL)isTaskResourceFlagged
{
  return (LOBYTE(self->_ssFlags) >> 2) & 1;
}

- (BOOL)isTerminatedSnapshot
{
  return (LOBYTE(self->_ssFlags) >> 3) & 1;
}

- (BOOL)isPidSuspended
{
  return (LOBYTE(self->_ssFlags) >> 4) & 1;
}

- (BOOL)isFrozen
{
  return (LOBYTE(self->_ssFlags) >> 5) & 1;
}

- (BOOL)isDarwinBG
{
  return (LOBYTE(self->_ssFlags) >> 6) & 1;
}

- (BOOL)isDarwinExtBG
{
  return LOBYTE(self->_ssFlags) >> 7;
}

- (BOOL)isVisible
{
  return BYTE1(self->_ssFlags) & 1;
}

- (BOOL)isNonVisible
{
  return (BYTE1(self->_ssFlags) >> 1) & 1;
}

- (BOOL)isForeground
{
  return (BYTE1(self->_ssFlags) >> 2) & 1;
}

- (BOOL)isBoosted
{
  return (BYTE1(self->_ssFlags) >> 3) & 1;
}

- (BOOL)isSuppressed
{
  return (BYTE1(self->_ssFlags) >> 4) & 1;
}

- (BOOL)isTimerThrottled
{
  return (BYTE1(self->_ssFlags) >> 5) & 1;
}

- (BOOL)isImpDonor
{
  return (BYTE1(self->_ssFlags) >> 6) & 1;
}

- (BOOL)isLiveImpDonor
{
  return BYTE1(self->_ssFlags) >> 7;
}

- (BOOL)isDirty
{
  return BYTE2(self->_ssFlags) & 1;
}

- (BOOL)wqExceededConstrainedThreadLimit
{
  return (~LODWORD(self->_ssFlags) & 0xA0000) == 0;
}

- (BOOL)wqExceededTotalThreadLimit
{
  return (~LODWORD(self->_ssFlags) & 0xC0000) == 0;
}

- (unint64_t)terminatedThreadsCpuTimeNs
{
  return self->_terminatedThreadsSystemTimeInNs + self->_terminatedThreadsUserTimeInNs;
}

- (uint64_t)correspondsToKCDataTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:
{
  unint64_t v9 = a5;
  if (!a1) {
    goto LABEL_26;
  }
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 56)
    || *(void *)(a1 + 64) != *(void *)(a2 + 40)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 60)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 64)
    || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 68)
    || *(void *)(a1 + 112) != *(void *)(a2 + 8)
    || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 80))
  {
    goto LABEL_25;
  }
  uint64_t v10 = *(void *)(a1 + 72);
  if (a4 && HIDWORD(a4))
  {
    if (a4 == HIDWORD(a4))
    {
      if (v10 != *(void *)(a2 + 16)) {
        goto LABEL_25;
      }
      uint64_t v11 = *(void *)(a2 + 24);
    }
    else
    {
      if (v10 != __udivti3()) {
        goto LABEL_25;
      }
      uint64_t v11 = __udivti3();
    }
  }
  else
  {
    if (v10) {
      goto LABEL_25;
    }
    uint64_t v11 = 0;
  }
  if (*(void *)(a1 + 80) != v11) {
    goto LABEL_25;
  }
  if (a3)
  {
    if (*a3 == *(void *)(a1 + 88) && a3[1] == *(void *)(a1 + 96)) {
      goto LABEL_27;
    }
LABEL_25:
    a1 = 0;
    goto LABEL_26;
  }
  if (*(void *)(a1 + 88) || *(void *)(a1 + 96)) {
    goto LABEL_25;
  }
LABEL_27:
  uint64_t v13 = *(void *)(a1 + 104);
  a1 = (v9 | v13) == 0;
  if (v9 && v13) {
    a1 = objc_msgSend((id)v9, "isEqualToSet:");
  }
LABEL_26:

  return a1;
}

- (uint64_t)correspondsToKCDataDeltaTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:
{
  unint64_t v9 = a5;
  if (!a1) {
    goto LABEL_26;
  }
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 48)
    || *(void *)(a1 + 64) != *(void *)(a2 + 32)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 52)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 56)
    || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 60)
    || *(void *)(a1 + 112) != *(void *)(a2 + 8)
    || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 72))
  {
    goto LABEL_25;
  }
  uint64_t v10 = *(void *)(a1 + 72);
  if (a4 && HIDWORD(a4))
  {
    if (a4 == HIDWORD(a4))
    {
      if (v10 != *(void *)(a2 + 16)) {
        goto LABEL_25;
      }
      uint64_t v11 = *(void *)(a2 + 24);
    }
    else
    {
      if (v10 != __udivti3()) {
        goto LABEL_25;
      }
      uint64_t v11 = __udivti3();
    }
  }
  else
  {
    if (v10) {
      goto LABEL_25;
    }
    uint64_t v11 = 0;
  }
  if (*(void *)(a1 + 80) != v11) {
    goto LABEL_25;
  }
  if (a3)
  {
    if (*a3 == *(void *)(a1 + 88) && a3[1] == *(void *)(a1 + 96)) {
      goto LABEL_27;
    }
LABEL_25:
    a1 = 0;
    goto LABEL_26;
  }
  if (*(void *)(a1 + 88) || *(void *)(a1 + 96)) {
    goto LABEL_25;
  }
LABEL_27:
  uint64_t v13 = *(void *)(a1 + 104);
  a1 = (v9 | v13) == 0;
  if (v9 && v13) {
    a1 = objc_msgSend((id)v9, "isEqualToSet:");
  }
LABEL_26:

  return a1;
}

- (uint64_t)correspondsToKCDataTransitioningTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:
{
  unint64_t v8 = a5;
  if (!a1) {
    goto LABEL_11;
  }
  if (*(void *)(a1 + 112) != *(void *)(a2 + 8) || [(id)a1 transitionType] != *(void *)(a2 + 16)) {
    goto LABEL_10;
  }
  if (a3)
  {
    if (*a3 == *(void *)(a1 + 88) && a3[1] == *(void *)(a1 + 96)) {
      goto LABEL_12;
    }
LABEL_10:
    a1 = 0;
    goto LABEL_11;
  }
  if (*(void *)(a1 + 88) || *(void *)(a1 + 96)) {
    goto LABEL_10;
  }
LABEL_12:
  uint64_t v10 = *(void *)(a1 + 104);
  a1 = (v8 | v10) == 0;
  if (v8 && v10) {
    a1 = objc_msgSend((id)v8, "isEqualToSet:");
  }
LABEL_11:

  return a1;
}

+ (id)stateWithKCDataTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  self;
  uint64_t v17 = [SATaskState alloc];
  id v18 = v16;
  if (v17)
  {
    uint64_t v19 = [(SATaskState *)v17 initWithStartTimestamp:v15 endTimestamp:v14 startSampleIndex:a8 endSampleIndex:a9];
    uint64_t v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)(v19 + 104), a5);
      *(_DWORD *)(v20 + 8) = *(_DWORD *)(a2 + 56);
      *(void *)(v20 + 64) = *(void *)(a2 + 40);
      *(_DWORD *)(v20 + 12) = *(_DWORD *)(a2 + 60);
      *(_DWORD *)(v20 + 16) = *(_DWORD *)(a2 + 64);
      *(_DWORD *)(v20 + 20) = *(_DWORD *)(a2 + 68);
      *(void *)(v20 + 112) = *(void *)(a2 + 8);
      *(_DWORD *)(v20 + 24) = *(_DWORD *)(a2 + 80);
      if (!a4) {
        goto LABEL_7;
      }
      if (HIDWORD(a4))
      {
        if (a4 == HIDWORD(a4))
        {
          *(void *)(v20 + 72) = *(void *)(a2 + 16);
          uint64_t v21 = *(void *)(a2 + 24);
        }
        else
        {
          *(void *)(v20 + 72) = __udivti3();
          uint64_t v21 = __udivti3();
        }
      }
      else
      {
LABEL_7:
        uint64_t v21 = 0;
        *(void *)(v20 + 72) = 0;
      }
      *(void *)(v20 + 80) = v21;
      if (a3)
      {
        *(void *)(v20 + 88) = *a3;
        *(void *)(v20 + 96) = a3[1];
      }
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return (id)v20;
}

+ (id)stateWithKCDataDeltaTask:(void *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  self;
  uint64_t v17 = [SATaskState alloc];
  id v18 = v16;
  if (v17)
  {
    uint64_t v19 = [(SATaskState *)v17 initWithStartTimestamp:v15 endTimestamp:v14 startSampleIndex:a8 endSampleIndex:a9];
    uint64_t v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)(v19 + 104), a5);
      *(_DWORD *)(v20 + 8) = *(_DWORD *)(a2 + 48);
      *(void *)(v20 + 64) = *(void *)(a2 + 32);
      *(_DWORD *)(v20 + 12) = *(_DWORD *)(a2 + 52);
      *(_DWORD *)(v20 + 16) = *(_DWORD *)(a2 + 56);
      *(_DWORD *)(v20 + 20) = *(_DWORD *)(a2 + 60);
      *(void *)(v20 + 112) = *(void *)(a2 + 8);
      *(_DWORD *)(v20 + 24) = *(_DWORD *)(a2 + 72);
      if (!a4) {
        goto LABEL_7;
      }
      if (HIDWORD(a4))
      {
        if (a4 == HIDWORD(a4))
        {
          *(void *)(v20 + 72) = *(void *)(a2 + 16);
          uint64_t v21 = *(void *)(a2 + 24);
        }
        else
        {
          *(void *)(v20 + 72) = __udivti3();
          uint64_t v21 = __udivti3();
        }
      }
      else
      {
LABEL_7:
        uint64_t v21 = 0;
        *(void *)(v20 + 72) = 0;
      }
      *(void *)(v20 + 80) = v21;
      if (a3)
      {
        *(void *)(v20 + 88) = *a3;
        *(void *)(v20 + 96) = a3[1];
      }
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  return (id)v20;
}

+ (SATaskStateInTransition)stateWithKCDataTransitioningTask:(uint64_t)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:
{
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  self;
  id v18 = [[SATaskStateInTransition alloc] initWithKCDataTransitioningTask:a2 andTerminatedThreadsInstructionCycles:a3 machTimebase:a4 andDonatingUniquePids:v17 startTimestamp:v16 endTimestamp:v15 startSampleIndex:a8 endSampleIndex:a9];

  return v18;
}

+ (SATaskState)stateWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  unint64_t v12 = (void *)[objc_alloc((Class)a1) initWithStartTimestamp:v11 endTimestamp:v10 startSampleIndex:a5 endSampleIndex:a6];

  return (SATaskState *)v12;
}

- (SATimestamp)startTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)startSampleIndex
{
  return self->_startSampleIndex;
}

- (unint64_t)endSampleIndex
{
  return self->_endSampleIndex;
}

- (unsigned)suspendCount
{
  return self->_suspendCount;
}

- (unsigned)faults
{
  return self->_faults;
}

- (unsigned)pageins
{
  return self->_pageins;
}

- (unsigned)latencyQos
{
  return self->_latencyQos;
}

- (unint64_t)terminatedThreadsUserTimeInNs
{
  return self->_terminatedThreadsUserTimeInNs;
}

- (unint64_t)terminatedThreadsSystemTimeInNs
{
  return self->_terminatedThreadsSystemTimeInNs;
}

- (unint64_t)terminatedThreadsInstructions
{
  return self->_terminatedThreadsInstructions;
}

- (NSSet)donatingUniquePids
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)ssFlags
{
  return self->_ssFlags;
}

+ (id)classDictionaryKey
{
  return @"SATaskState";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * [(NSSet *)self->_donatingUniquePids count] + 111;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([(SATaskState *)self sizeInBytesForSerializedVersion] != a4)
  {
    LODWORD(v5) = *__error();
    id v18 = _sa_logt();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(SATaskState *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v72 = [v19 UTF8String];
      __int16 v73 = 2048;
      *(void *)v74 = [(SATaskState *)self sizeInBytesForSerializedVersion];
      *(_WORD *)&v74[8] = 2048;
      *(void *)&v74[10] = a4;
      _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v5;
    id v20 = [(SATaskState *)self debugDescription];
    char v21 = [v20 UTF8String];
    [(SATaskState *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(3395, "%s: size %lu != buffer length %lu", v22, v23, v24, v25, v26, v27, v21);

    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  *(_WORD *)&a3->var0 = 513;
  *(_OWORD *)((char *)&a3->var3 + 2) = *(_OWORD *)&self->_startSampleIndex;
  *(_DWORD *)((char *)&a3->var5 + 2) = self->_suspendCount;
  *(unint64_t *)((char *)&a3->var5 + 6) = self->_taskSizeInBytes;
  *(unsigned int *)((char *)&a3->var6 + 6) = self->_faults;
  *(_DWORD *)((char *)&a3->var7 + 2) = self->_pageins;
  *(_DWORD *)((char *)&a3->var7 + 6) = self->_cowFaults;
  *(unsigned int *)((char *)&a3->var8 + 2) = self->_latencyQos;
  *(void *)((char *)&a3->var9 + 2) = self->_terminatedThreadsUserTimeInNs;
  *(void *)((char *)&a3->var11 + 2) = self->_terminatedThreadsSystemTimeInNs;
  *(unint64_t *)((char *)&a3->var12 + 6) = self->_terminatedThreadsInstructions;
  *(unint64_t *)((char *)&a3->var13 + 6) = self->_terminatedThreadsCycles;
  *(unint64_t *)((char *)&a3->var14 + 7) = self->_ssFlags;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTimestamp, v9);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTimestamp, v9);
  if ([(NSSet *)self->_donatingUniquePids count] >= 0xFF)
  {
LABEL_18:
    int v28 = *__error();
    uint64_t v29 = _sa_logt();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      id v30 = [(SATaskState *)self debugDescription];
      uint64_t v31 = [v30 UTF8String];
      NSUInteger v32 = [(NSSet *)self->_donatingUniquePids count];
      *(_DWORD *)buf = 136315394;
      uint64_t v72 = v31;
      __int16 v73 = 2048;
      *(void *)v74 = v32;
      _os_log_error_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_ERROR, "%s: %lu donatingUniquePids", buf, 0x16u);
    }
    *__error() = v28;
    id v33 = [(SATaskState *)self debugDescription];
    char v34 = [v33 UTF8String];
    [(NSSet *)self->_donatingUniquePids count];
    _SASetCrashLogMessage(3417, "%s: %lu donatingUniquePids", v35, v36, v37, v38, v39, v40, v34);

    _os_crash();
    __break(1u);
    goto LABEL_21;
  }
  id v10 = (char *)&a3->var15 + 7;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v11 = self->_donatingUniquePids;
  uint64_t v12 = [(NSSet *)v11 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    LOBYTE(v5) = 0;
    uint64_t v14 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(v11);
        }
        *(void *)&v10[8 * v5] = [*(id *)(*((void *)&v67 + 1) + 8 * i) unsignedLongLongValue];
        LOBYTE(v5) = v5 + 1;
      }
      uint64_t v13 = [(NSSet *)v11 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v13);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  if ([(NSSet *)self->_donatingUniquePids count] != v5)
  {
LABEL_21:
    int v41 = *__error();
    v42 = _sa_logt();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v43 = [(SATaskState *)self debugDescription];
      uint64_t v44 = [v43 UTF8String];
      NSUInteger v45 = [(NSSet *)self->_donatingUniquePids count];
      uint64_t v5 = v5;
      *(_DWORD *)buf = 136315650;
      uint64_t v72 = v44;
      __int16 v73 = 2048;
      *(void *)v74 = v45;
      *(_WORD *)&v74[8] = 1024;
      *(_DWORD *)&v74[10] = v5;
      _os_log_error_impl(&dword_1BF22B000, v42, OS_LOG_TYPE_ERROR, "%s: %lu donatingUniquePids, but %u serialized", buf, 0x1Cu);
    }
    else
    {
      uint64_t v5 = v5;
    }

    *__error() = v41;
    a3 = [(SATaskState *)self debugDescription];
    char v46 = [($2089E77EEE4A1EB652AD555C69D4CCDC *)a3 UTF8String];
    [(NSSet *)self->_donatingUniquePids count];
    _SASetCrashLogMessage(3424, "%s: %lu donatingUniquePids, but %u serialized", v47, v48, v49, v50, v51, v52, v46);

    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  BYTE6(a3->var14) = v5;
  id v16 = &v10[8 * v5];
  uint64_t v5 = v16 - (char *)a3 + 8;
  if (v5 != [(SATaskState *)self sizeInBytesForSerializedVersion])
  {
LABEL_24:
    int v53 = *__error();
    v54 = _sa_logt();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      id v55 = [(SATaskState *)self debugDescription];
      uint64_t v56 = [v55 UTF8String];
      int v57 = BYTE6(a3->var14);
      unint64_t v58 = [(SATaskState *)self sizeInBytesForSerializedVersion];
      *(_DWORD *)buf = 136315906;
      uint64_t v72 = v56;
      __int16 v73 = 1024;
      *(_DWORD *)v74 = v57;
      *(_WORD *)&v74[4] = 2048;
      *(void *)&v74[6] = v5;
      *(_WORD *)&v74[14] = 2048;
      *(void *)&v74[16] = v58;
      _os_log_error_impl(&dword_1BF22B000, v54, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u donating uniquepids), ended with length %ld, should be %lu", buf, 0x26u);
    }
    *__error() = v53;
    id v59 = [(SATaskState *)self debugDescription];
    char v60 = [v59 UTF8String];
    [(SATaskState *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(3428, "%s: after serializing (with %u donating uniquepids), ended with length %ld, should be %lu", v61, v62, v63, v64, v65, v66, v60);

    _os_crash();
    __break(1u);
  }
  *(void *)id v16 = [(SATaskState *)self transitionType];

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5)
  {
    [(SATimestamp *)self->_startTimestamp addSelfToSerializationDictionary:v6];
    [(SATimestamp *)self->_endTimestamp addSelfToSerializationDictionary:v6];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 3u) {
    goto LABEL_31;
  }
  if (a4 <= 0x66)
  {
    int v23 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v50 = a4;
      __int16 v51 = 2048;
      uint64_t v52 = 103;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATaskState struct %lu", buf, 0x16u);
    }

    *__error() = v23;
    _SASetCrashLogMessage(3449, "bufferLength %lu < serialized SATaskState struct %lu", v24, v25, v26, v27, v28, v29, a4);
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = *((unsigned __int8 *)a3 + 94);
  if (8 * v6 + 103 > a4)
  {
LABEL_25:
    int v30 = *__error();
    uint64_t v31 = _sa_logt();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v32 = *(unsigned __int8 *)(v5 + 94);
      *(_DWORD *)buf = 134218240;
      unint64_t v50 = a4;
      __int16 v51 = 1024;
      LODWORD(v52) = v32;
      _os_log_error_impl(&dword_1BF22B000, v31, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", buf, 0x12u);
    }

    *__error() = v30;
    _SASetCrashLogMessage(3451, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", v33, v34, v35, v36, v37, v38, a4);
    _os_crash();
    __break(1u);
LABEL_28:
    int v39 = *__error();
    uint64_t v40 = _sa_logt();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      int v41 = *(unsigned __int8 *)(v5 + 94);
      *(_DWORD *)buf = 134218240;
      unint64_t v50 = a4;
      __int16 v51 = 1024;
      LODWORD(v52) = v41;
      _os_log_error_impl(&dword_1BF22B000, v40, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATaskState struct v2 with %u donating unique pids", buf, 0x12u);
    }

    *__error() = v39;
    _SASetCrashLogMessage(3459, "bufferLength %lu < serialized SATaskState struct v2 with %u donating unique pids", v42, v43, v44, v45, v46, v47, a4);
    _os_crash();
    __break(1u);
LABEL_31:
    id v48 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATaskState version" userInfo:0];
    objc_exception_throw(v48);
  }
  v7 = (char *)a3 + 103;
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    unint64_t v8 = 0;
    goto LABEL_9;
  }
  if (8 * v6 + 111 > a4) {
    goto LABEL_28;
  }
  unint64_t v8 = &v7[8 * v6];
  if (!*(void *)v8)
  {
LABEL_9:
    int v9 = 0;
    id v10 = off_1E63F6E20;
    goto LABEL_10;
  }
  int v9 = 1;
  id v10 = off_1E63F6E28;
LABEL_10:
  id v11 = objc_alloc_init(*v10);
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)(v5 + 18);
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 != 0x7FFFFFFF && v13 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v14 = *(void *)(v5 + 18);
  }
  v11[6] = v14;
  uint64_t v15 = *(void *)(v5 + 26);
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 != 0x7FFFFFFF && v15 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v16 = *(void *)(v5 + 26);
  }
  v11[7] = v16;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(v5 + 34);
  v11[8] = *(void *)(v5 + 38);
  *((_DWORD *)v11 + 3) = *(_DWORD *)(v5 + 46);
  *((_DWORD *)v11 + 4) = *(_DWORD *)(v5 + 50);
  *((_DWORD *)v11 + 5) = *(_DWORD *)(v5 + 54);
  *((_DWORD *)v11 + 6) = *(_DWORD *)(v5 + 58);
  v11[9] = *(void *)(v5 + 62);
  v11[10] = *(void *)(v5 + 70);
  v11[11] = *(void *)(v5 + 78);
  v11[12] = *(void *)(v5 + 86);
  v11[14] = *(void *)(v5 + 95);
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:*(unsigned __int8 *)(v5 + 94)];
  if (*(unsigned char *)(v5 + 94))
  {
    unint64_t v18 = 0;
    do
    {
      id v19 = [NSNumber numberWithUnsignedLongLong:*(void *)&v7[8 * v18]];
      [v17 addObject:v19];

      ++v18;
    }
    while (v18 < *(unsigned __int8 *)(v5 + 94));
  }
  uint64_t v20 = [v17 copy];
  char v21 = (void *)v12[13];
  v12[13] = v20;

  if (v9) {
    v12[15] = *(void *)v8;
  }

  return v12;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v37 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 3u) {
    goto LABEL_13;
  }
  if (a4 <= 0x66)
  {
    int v20 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v39 = a4;
      __int16 v40 = 2048;
      uint64_t v41 = 103;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATaskState struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(3508, "bufferLength %lu < serialized SATaskState struct %lu", v21, v22, v23, v24, v25, v26, a4);
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  if (8 * (unint64_t)*((unsigned __int8 *)a3 + 94) + 103 > a4)
  {
LABEL_10:
    int v27 = *__error();
    uint64_t v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = *((unsigned __int8 *)a3 + 94);
      *(_DWORD *)buf = 134218240;
      unint64_t v39 = a4;
      __int16 v40 = 1024;
      LODWORD(v41) = v29;
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", buf, 0x12u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(3509, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", v30, v31, v32, v33, v34, v35, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    id v36 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATaskState version" userInfo:0];
    objc_exception_throw(v36);
  }
  id v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v37, v11, v13);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTimestamp = self->_startTimestamp;
  self->_startTimestamp = v14;

  unint64_t v16 = *(void *)((char *)a3 + 10);
  id v17 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v37, v11, v17);
  unint64_t v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTimestamp = self->_endTimestamp;
  self->_endTimestamp = v18;
}

+ (SATaskState)stateWithPAStyleTaskPrivateData:(void *)a3 donatingUniquePids:
{
  uint64_t v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_alloc_init(SATaskState);
  v7 = v6;
  if (v5)
  {
    v6->_taskSizeInBytes = *((void *)v5 + 4);
    v6->_faults = *((_DWORD *)v5 + 3);
    v6->_pageins = *((_DWORD *)v5 + 4);
    v6->_cowFaults = *((_DWORD *)v5 + 5);
    v6->_suspendCount = *((_DWORD *)v5 + 2);
    v6->_latencyQos = *((_DWORD *)v5 + 6);
    v6->_terminatedThreadsUserTimeInNs = *((void *)v5 + 6);
    v6->_terminatedThreadsSystemTimeInNs = *((void *)v5 + 7);
    v6->_terminatedThreadsInstructions = *((void *)v5 + 8);
    v6->_terminatedThreadsCycles = *((void *)v5 + 9);
    unint64_t v8 = *((void *)v5 + 5);
  }
  else
  {
    unint64_t v8 = 0;
    *(void *)&v6->_suspendCount = 0;
    *(void *)&v6->_pageins = 0;
    v6->_latencyQos = 0;
    *(_OWORD *)&v6->_taskSizeInBytes = 0u;
    *(_OWORD *)&v6->_terminatedThreadsSystemTimeInNs = 0u;
    v6->_terminatedThreadsCycles = 0;
  }

  donatingUniquePids = v7->_donatingUniquePids;
  v7->_donatingUniquePids = v4;
  v7->_ssFlags = v8;

  return v7;
}

- (void)applyPAStyleSampleTimestamp:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    if (!*(void *)(a1 + 32)) {
      objc_storeStrong((id *)(a1 + 32), a2);
    }
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

@end