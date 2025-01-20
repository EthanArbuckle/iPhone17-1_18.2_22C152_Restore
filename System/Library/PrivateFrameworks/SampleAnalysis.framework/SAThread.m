@interface SAThread
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)threadWithId:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isGlobalForcedIdle;
- (BOOL)isMainThread;
- (BOOL)isProcessorIdleThread;
- (NSArray)threadStates;
- (NSString)debugDescription;
- (SAThread)initWithId:(unint64_t)a3;
- (SATimestamp)creationTimestamp;
- (SATimestamp)exitTimestamp;
- (id)firstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)firstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)lastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (id)lastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (id)patchedStackForTruncatedStack:(id)a3;
- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4;
- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4;
- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)threadId;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)cpuTimeForThreadStateIndex:(void *)a3@<X2> inTimestampRangeStart:(void *)a4@<X3> end:(void *)a5@<X8>;
- (void)enumerateThreadStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7;
- (void)enumerateThreadStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8;
- (void)forwardFillMonotonicallyIncreasingData;
- (void)insertState:(uint64_t)a3 atIndex:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAThread

- (void)forwardFillMonotonicallyIncreasingData
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v1 = [a1 threadStates];
    uint64_t v2 = [v1 countByEnumeratingWithState:&v42 objects:v76 count:16];
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v41 = 0;
      v5 = 0;
      uint64_t v6 = *(void *)v43;
      *(void *)&long long v3 = 134221570;
      long long v26 = v3;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          v8 = v5;
          if (*(void *)v43 != v6) {
            objc_enumerationMutation(v1);
          }
          v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if (v5)
          {
            if ([*(id *)(*((void *)&v42 + 1) + 8 * i) userTimeInNs]
              && (unint64_t v10 = [v9 userTimeInNs], v10 < objc_msgSend(v8, "userTimeInNs"))
              || objc_msgSend(v9, "systemTimeInNs", v26)
              && (unint64_t v11 = [v9 systemTimeInNs], v11 < objc_msgSend(v8, "systemTimeInNs"))
              || [v9 instructions]
              && (unint64_t v12 = [v9 instructions], v12 < objc_msgSend(v8, "instructions"))
              || [v9 cycles] && (unint64_t v13 = objc_msgSend(v9, "cycles"), v13 < objc_msgSend(v8, "cycles")))
            {
              int v14 = *__error();
              v15 = _sa_logt();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v39 = [a1 threadId];
                v40 = [a1 threadStates];
                uint64_t v24 = [v40 count];
                v38 = [v8 debugDescription];
                v37 = [v9 debugDescription];
                uint64_t v36 = [v8 cpuTimeNs];
                uint64_t v35 = [v8 userTimeInNs];
                uint64_t v34 = [v8 systemTimeInNs];
                uint64_t v33 = [v9 cpuTimeNs];
                uint64_t v32 = [v9 userTimeInNs];
                uint64_t v31 = [v9 systemTimeInNs];
                uint64_t v30 = [v8 instructions];
                uint64_t v29 = [v9 instructions];
                uint64_t v28 = [v8 cycles];
                uint64_t v25 = [v9 cycles];
                *(_DWORD *)buf = v26;
                uint64_t v47 = v39;
                __int16 v48 = 2048;
                uint64_t v49 = v41 + i;
                __int16 v50 = 2048;
                uint64_t v51 = v24;
                __int16 v52 = 2112;
                v53 = v38;
                __int16 v54 = 2112;
                v55 = v37;
                __int16 v56 = 2048;
                uint64_t v57 = v36;
                __int16 v58 = 2048;
                uint64_t v59 = v35;
                __int16 v60 = 2048;
                uint64_t v61 = v34;
                __int16 v62 = 2048;
                uint64_t v63 = v33;
                __int16 v64 = 2048;
                uint64_t v65 = v32;
                __int16 v66 = 2048;
                uint64_t v67 = v31;
                __int16 v68 = 2048;
                uint64_t v69 = v30;
                __int16 v70 = 2048;
                uint64_t v71 = v29;
                __int16 v72 = 2048;
                uint64_t v73 = v28;
                __int16 v74 = 2048;
                uint64_t v75 = v25;
                _os_log_debug_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_DEBUG, "Thread 0x%llx monotonically increasing data decreased at index %lu of %lu between %@ and %@:\ncpu time %llu (%llu + %llu) -> %llu (%llu + %llu)\ninstructions %llu -> %llu\ncycles %llu -> %llu", buf, 0x98u);
              }
              *__error() = v14;
            }
            unint64_t v16 = objc_msgSend(v9, "userTimeInNs", v26);
            if (v16 < [v8 userTimeInNs])
            {
              uint64_t v17 = [v8 userTimeInNs];
              if (v9) {
                v9[17] = v17;
              }
            }
            unint64_t v18 = [v9 systemTimeInNs];
            if (v18 < [v8 systemTimeInNs])
            {
              uint64_t v19 = [v8 systemTimeInNs];
              if (v9) {
                v9[18] = v19;
              }
            }
            unint64_t v20 = [v9 instructions];
            if (v20 < [v8 instructions])
            {
              uint64_t v21 = [v8 instructions];
              if (v9) {
                v9[19] = v21;
              }
            }
            unint64_t v22 = [v9 cycles];
            if (v22 < [v8 cycles])
            {
              uint64_t v23 = [v8 cycles];
              if (v9) {
                v9[20] = v23;
              }
            }
          }
          v5 = v9;
        }
        uint64_t v4 = [v1 countByEnumeratingWithState:&v42 objects:v76 count:16];
        v41 += i;
      }
      while (v4);
    }
  }
}

- (NSArray)threadStates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SAThread *)self indexOfFirstThreadStateOnOrAfterTime:a3 sampleIndex:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resampledleafOfCRootFramesReplacedBySwiftAsync, 0);
  objc_storeStrong((id *)&self->_resampledLeafUserFrame, 0);
  objc_storeStrong((id *)&self->_exitTimestamp, 0);
  objc_storeStrong((id *)&self->_creationTimestamp, 0);
  objc_storeStrong((id *)&self->_threadStates, 0);
}

- (void)enumerateThreadStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__SAThread_enumerateThreadStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke;
  v14[3] = &unk_1E63F8D98;
  BOOL v16 = a6;
  id v15 = v12;
  id v13 = v12;
  [(SAThread *)self enumerateThreadStatesBetweenStartTime:a3 startSampleIndex:0x7FFFFFFFFFFFFFFFLL endTime:a4 endSampleIndex:0x7FFFFFFFFFFFFFFFLL reverseOrder:v8 block:v14];
}

- (SAThread)initWithId:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SAThread;
  uint64_t v4 = [(SAThread *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_threadId = a3;
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    threadStates = v5->_threadStates;
    v5->_threadStates = v6;
  }
  return v5;
}

+ (id)threadWithId:(uint64_t)a1
{
  uint64_t v2 = (void *)[objc_alloc((Class)self) initWithId:a2];
  return v2;
}

- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6 = a3;
  if ([(NSMutableArray *)self->_threadStates count])
  {
    if (v6)
    {
      threadStates = self->_threadStates;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61__SAThread_indexOfFirstThreadStateOnOrAfterTime_sampleIndex___block_invoke;
      v14[3] = &unk_1E63F8D48;
      id v15 = v6;
      unint64_t v8 = SABinarySearchArray(threadStates, 1280, (uint64_t)v14);
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 < [(NSMutableArray *)self->_threadStates count])
    {
      do
      {
        unint64_t v10 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v8];
        if ([v10 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
        }
        else
        {
          unint64_t v11 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v8];
          unint64_t v12 = [v11 endSampleIndex];

          if (v12 >= a4) {
            break;
          }
        }
        ++v8;
      }
      while (v8 < [(NSMutableArray *)self->_threadStates count]);
    }
    if (v8 >= [(NSMutableArray *)self->_threadStates count]) {
      unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __61__SAThread_indexOfFirstThreadStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = [v3 startTimestamp];
  LOBYTE(v4) = [v4 lt:v5];

  if (v4)
  {
    uint64_t v6 = -1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    unint64_t v8 = [v3 endTimestamp];
    LODWORD(v6) = [v7 gt:v8];

    uint64_t v6 = v6;
  }

  return v6;
}

- (id)firstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = [(SAThread *)self indexOfFirstThreadStateOnOrAfterTime:a3 sampleIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  if (![(NSMutableArray *)self->_threadStates count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  threadStates = self->_threadStates;
  if (a3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__SAThread_indexOfLastThreadStateOnOrBeforeTime_sampleIndex___block_invoke;
    v14[3] = &unk_1E63F8D48;
    void v14[4] = a3;
    uint64_t v8 = SABinarySearchArray(threadStates, 1536, (uint64_t)v14);
    if (!v8) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v8 = [(NSMutableArray *)threadStates count];
  }
  unint64_t v9 = v8 - 1;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    return v9;
  }
  while (1)
  {
    unint64_t v11 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v9];
    if ([v11 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
    }
    else
    {
      unint64_t v12 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v9];
      unint64_t v13 = [v12 startSampleIndex];

      if (v13 <= a4) {
        return v9;
      }
    }
    if (!v9) {
      break;
    }
    --v9;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __61__SAThread_indexOfLastThreadStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  unint64_t v5 = [a2 startTimestamp];
  LOBYTE(v4) = [v4 lt:v5];

  if (v4) {
    return -1;
  }
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [a2 endTimestamp];
  LODWORD(v7) = [v7 gt:v8];

  return v7;
}

- (id)lastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5 = [(SAThread *)self indexOfLastThreadStateOnOrBeforeTime:a3 sampleIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (id)firstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(SAThread *)self firstThreadStateOnOrAfterTime:a3 sampleIndex:v4];
}

- (id)lastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  unint64_t v5 = [(SAThread *)self indexOfLastThreadStateOnOrBeforeTime:a3 withSampleIndex:a4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableArray *)self->_threadStates objectAtIndexedSubscript:v5];
  }
  return v6;
}

- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(NSMutableArray *)self->_threadStates lastObject];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4 || (unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL, v9 = [v7 endSampleIndex], v9 != 0x7FFFFFFFFFFFFFFFLL)) {
      unint64_t v10 = [(SAThread *)self indexOfLastThreadStateOnOrBeforeTime:v6 sampleIndex:v9];
    }
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)enumerateThreadStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  unint64_t v16 = [(SAThread *)self indexOfFirstThreadStateOnOrAfterTime:a3 sampleIndex:a4];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v17 = v16;
    unint64_t v18 = [(SAThread *)self indexOfLastThreadStateOnOrBeforeTime:v14 sampleIndex:a6];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v19 = v18;
      if (v17 <= v18)
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __109__SAThread_enumerateThreadStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
        v22[3] = &unk_1E63F8D70;
        v22[4] = self;
        id v23 = v15;
        unint64_t v20 = (uint64_t (**)(void, void))MEMORY[0x1C18A6C80](v22);
        if (a7)
        {
          do
          {
            if (v19 + 1 <= v17) {
              break;
            }
            char v21 = v20[2](v20, v19--);
          }
          while ((v21 & 1) == 0);
        }
        else
        {
          do
          {
            if (v20[2](v20, v17)) {
              break;
            }
            ++v17;
          }
          while (v17 <= v19);
        }
      }
    }
  }
}

uint64_t __109__SAThread_enumerateThreadStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v6 = 0;
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:a2];
  (*(void (**)(uint64_t, void *, uint64_t, unsigned __int8 *))(v3 + 16))(v3, v4, a2, &v6);

  return v6;
}

void __93__SAThread_enumerateThreadStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (!*(unsigned char *)(a1 + 40) || (uint64_t v4 = [v3 startSampleIndex], v5 = v6, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    unint64_t v5 = v6;
  }
}

- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7 && ([v6 le:v7] & 1) == 0)
  {
    int v15 = *__error();
    unint64_t v16 = _sa_logt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [v6 debugDescription];
      uint64_t v18 = [v17 UTF8String];
      id v19 = [v8 debugDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v30 = v18;
      __int16 v31 = 2080;
      uint64_t v32 = [v19 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "start time %s after end time %s", buf, 0x16u);
    }
    *__error() = v15;
    id v20 = [v6 debugDescription];
    char v21 = [v20 UTF8String];
    id v22 = [v8 debugDescription];
    [v22 UTF8String];
    _SASetCrashLogMessage(258, "start time %s after end time %s", v23, v24, v25, v26, v27, v28, v21);

    _os_crash();
    __break(1u);
  }
  if ([(NSMutableArray *)self->_threadStates count]
    && (unint64_t v9 = [(SAThread *)self indexOfFirstThreadStateOnOrAfterTime:v6 sampleIndex:0x7FFFFFFFFFFFFFFFLL], v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v11 = v9;
    unint64_t v12 = [(SAThread *)self indexOfLastThreadStateOnOrBeforeTime:v8 sampleIndex:0x7FFFFFFFFFFFFFFFLL];
    if (v12 >= v11) {
      uint64_t v13 = v12 - v11 + 1;
    }
    else {
      uint64_t v13 = 0;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = v13;
    }
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (void)cpuTimeForThreadStateIndex:(void *)a3@<X2> inTimestampRangeStart:(void *)a4@<X3> end:(void *)a5@<X8>
{
  id v45 = a3;
  id v9 = a4;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  if (a1)
  {
    unint64_t v10 = [a1 threadStates];
    unint64_t v11 = [v10 count];

    if (v11 >= a2)
    {
      unint64_t v12 = [a1 threadStates];
      uint64_t v13 = [v12 objectAtIndexedSubscript:a2];

      uint64_t v14 = [v13 endSampleIndex];
      if (a2)
      {
        int v15 = [v13 startTimestamp];
        int v16 = [v15 gt:v45];

        if (v16)
        {
          id v17 = [a1 threadStates];
          uint64_t v18 = [v17 objectAtIndexedSubscript:a2 - 1];

          if (v14 == 0x7FFFFFFFFFFFFFFFLL || [v18 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL)
          {
            char v21 = v18;
          }
          else
          {
            unint64_t v19 = a2 - 2;
            while (v19 != -1)
            {
              id v20 = [a1 threadStates];
              char v21 = [v20 objectAtIndexedSubscript:v19];

              --v19;
              uint64_t v18 = v21;
              if ([v21 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_12;
              }
            }

            char v21 = 0;
          }
LABEL_12:
          id v22 = objc_msgSend(v21, "endTimestamp", v14);
          int v23 = [v22 lt:v45];

          if (v23)
          {

            uint64_t v14 = v44;
          }
          else
          {
            uint64_t v14 = v44;
            if (v21)
            {
              if (![v13 isIdleWorkQueue]
                || [v21 isIdleWorkQueue])
              {
                uint64_t v24 = [v13 cpuTimeNs];
                *a5 = v24 - [v21 cpuTimeNs];
                uint64_t v25 = [v13 instructions];
                a5[1] = v25 - [v21 instructions];
                uint64_t v26 = [v13 cycles];
                uint64_t v27 = v26 - [v21 cycles];
LABEL_21:
                a5[2] = v27;
              }
LABEL_23:
              if (([v13 isIdleWorkQueue] & 1) == 0)
              {
                uint64_t v30 = [a1 threadStates];
                if ([v30 count] - 1 <= a2)
                {
LABEL_41:

                  goto LABEL_42;
                }
                __int16 v31 = [v13 endTimestamp];
                int v32 = [v31 lt:v9];

                if (v32)
                {
                  uint64_t v33 = [a1 threadStates];
                  uint64_t v30 = [v33 objectAtIndexedSubscript:a2 + 1];

                  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if ([v30 startSampleIndex] == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      unint64_t v34 = a2 + 2;
                      while (1)
                      {
                        uint64_t v35 = [a1 threadStates];
                        unint64_t v36 = [v35 count] - 1;

                        if (v34 - 1 >= v36) {
                          break;
                        }
                        v37 = [a1 threadStates];
                        v38 = [v37 objectAtIndexedSubscript:v34];

                        ++v34;
                        uint64_t v30 = v38;
                        if ([v38 startSampleIndex] != 0x7FFFFFFFFFFFFFFFLL) {
                          goto LABEL_35;
                        }
                      }

                      v38 = 0;
                    }
                    else
                    {
                      v38 = v30;
                    }
LABEL_35:
                    uint64_t v39 = [v38 startTimestamp];
                    int v40 = [v39 gt:v9];

                    if (v40)
                    {

                      uint64_t v30 = 0;
                      goto LABEL_41;
                    }
                    uint64_t v30 = v38;
                  }
                  if (v30 && [v30 isIdleWorkQueue])
                  {
                    uint64_t v41 = [v30 cpuTimeNs];
                    *a5 += v41 - [v13 cpuTimeNs];
                    uint64_t v42 = [v30 instructions];
                    a5[1] += v42 - [v13 instructions];
                    uint64_t v43 = [v30 cycles];
                    a5[2] += v43 - [v13 cycles];
                  }
                  goto LABEL_41;
                }
              }
LABEL_42:

              goto LABEL_43;
            }
          }
        }
      }
      char v21 = [a1 creationTimestamp];
      if (!v21) {
        goto LABEL_23;
      }
      uint64_t v28 = [a1 creationTimestamp];
      int v29 = [v28 ge:v45];

      if (v29)
      {
        *a5 = [v13 cpuTimeNs];
        a5[1] = [v13 instructions];
        uint64_t v27 = [v13 cycles];
        char v21 = 0;
        goto LABEL_21;
      }
      char v21 = 0;
      goto LABEL_23;
    }
  }
LABEL_43:
}

- (void)insertState:(uint64_t)a3 atIndex:
{
  id v5 = a2;
  if (a1)
  {
    [a1[1] insertObject:v5 atIndex:a3];
    id v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, objc_msgSend(a1[1], "count") - a3);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v9 = a1[1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __32__SAThread_insertState_atIndex___block_invoke;
    v19[3] = &unk_1E63F8DC0;
    id v10 = v7;
    id v20 = v10;
    id v11 = v8;
    id v21 = v11;
    [v9 enumerateObjectsAtIndexes:v6 options:0 usingBlock:v19];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __32__SAThread_insertState_atIndex___block_invoke_2;
    v18[3] = &unk_1E63F8E10;
    v18[4] = a1;
    v18[5] = a3;
    unint64_t v12 = (void (**)(void, void))MEMORY[0x1C18A6C80](v18);
    ((void (**)(void, id))v12)[2](v12, v10);
    uint64_t v13 = [v5 dispatchQueue];
    if (v13)
    {
      uint64_t v14 = +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)SADispatchQueueState, a1, a3);
      if (v13[24]) {
        int v15 = 0;
      }
      else {
        int v15 = v13 + 24;
      }
      -[SARecipe insertState:hasConcurrentExecution:]((uint64_t)v13, v14, v15);
    }
    ((void (**)(void, id))v12)[2](v12, v11);
    int v16 = [v5 swiftTask];
    if (v16)
    {
      id v17 = +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)SASwiftTaskState, a1, a3);
      -[SARecipe insertState:hasConcurrentExecution:]((uint64_t)v16, v17, 0);
    }
  }
}

void __32__SAThread_insertState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 dispatchQueue];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  uint64_t v4 = [v5 swiftTask];
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

void __32__SAThread_insertState_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) states];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __32__SAThread_insertState_atIndex___block_invoke_3;
        v10[3] = &unk_1E63F8DE8;
        uint64_t v9 = *(void *)(a1 + 40);
        v10[4] = *(void *)(a1 + 32);
        v10[5] = v9;
        [v8 enumerateObjectsWithOptions:2 usingBlock:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __32__SAThread_insertState_atIndex___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 thread];
  uint64_t v7 = *(void **)(a1 + 32);

  id v8 = v10;
  if (v6 == v7)
  {
    if ((unint64_t)[v10 threadStateIndex] >= *(void *)(a1 + 40))
    {
      uint64_t v9 = [v10 threadStateIndex];
      id v8 = v10;
      if (v10) {
        v10[2] = v9 + 1;
      }
    }
    else
    {
      *a4 = 1;
      id v8 = v10;
    }
  }
}

- (id)patchedStackForTruncatedStack:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  char v7 = [v6 isTruncatedBacktraceFrame];

  if ((v7 & 1) == 0)
  {
    int v41 = *__error();
    uint64_t v42 = _sa_logt();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = [v5 objectAtIndexedSubscript:0];
      id v43 = [(id)v3 debugDescription];
      *(_DWORD *)buf = 136315138;
      uint64_t v67 = [v43 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v42, OS_LOG_TYPE_ERROR, "%s is not a truncated frame", buf, 0xCu);
    }
    *__error() = v41;
    uint64_t v44 = [v5 objectAtIndexedSubscript:0];
    id v45 = [v44 debugDescription];
    char v46 = [v45 UTF8String];
    _SASetCrashLogMessage(469, "%s is not a truncated frame", v47, v48, v49, v50, v51, v52, v46);

    _os_crash();
    __break(1u);
LABEL_48:
    int v53 = *__error();
    __int16 v54 = _sa_logt();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v67 = v3;
      __int16 v68 = 2048;
      uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
      _os_log_error_impl(&dword_1BF22B000, v54, OS_LOG_TYPE_ERROR, "best match length is %lu, but index is %lu", buf, 0x16u);
    }

    *__error() = v53;
    _SASetCrashLogMessage(531, "best match length is %lu, but index is %lu", v55, v56, v57, v58, v59, v60, v3);
    _os_crash();
    __break(1u);
  }
  if (!self->_resampledLeafUserFrame)
  {
    id v28 = v5;
    goto LABEL_42;
  }
  unint64_t v65 = [v5 count];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v61 = self;
  uint64_t v9 = self->_resampledLeafUserFrame;
  if (v9)
  {
    id v10 = v9;
    do
    {
      [v8 insertObject:v10 atIndex:0];
      parentFrame = v10->_parentFrame;
      long long v12 = parentFrame;

      id v10 = v12;
    }
    while (parentFrame);
  }
  uint64_t v62 = [v8 count];
  if (!v62) {
    goto LABEL_29;
  }
  uint64_t v13 = 0;
  uint64_t v3 = 0;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v63 = v14;
    unint64_t v64 = v3;
    if (v65 < 2)
    {
      unint64_t v16 = 0;
    }
    else
    {
      unint64_t v15 = 0;
      while (1)
      {
        unint64_t v16 = v15 + 1;
        id v17 = v5;
        uint64_t v18 = [v5 objectAtIndexedSubscript:v15 + 1];
        uint64_t v19 = [v18 address];
        id v20 = [v8 objectAtIndexedSubscript:v13 + v15];
        uint64_t v21 = [v20 address];

        if (v19 != v21) {
          break;
        }
        if (v16 >= v62 - v13) {
          goto LABEL_16;
        }
        unint64_t v22 = v15 + 2;
        ++v15;
        id v5 = v17;
        if (v22 >= v65) {
          goto LABEL_17;
        }
      }
      unint64_t v16 = v15;
LABEL_16:
      id v5 = v17;
    }
LABEL_17:
    uint64_t v14 = v63;
    uint64_t v3 = v64;
    if (v16) {
      BOOL v23 = v16 >= v64;
    }
    else {
      BOOL v23 = 0;
    }
    if (v23)
    {
      uint64_t v14 = v13;
      uint64_t v3 = v16;
    }
    ++v13;
  }
  while (v13 != v62);
  if (!v3)
  {
LABEL_29:
    if ((unint64_t)[v5 count] >= 3)
    {
      uint64_t v27 = [v5 objectAtIndexedSubscript:2];
      if ([v27 isKernel])
      {
      }
      else
      {
        if ([v5 count] == 3)
        {
        }
        else
        {
          int v29 = [v5 objectAtIndexedSubscript:3];
          char v30 = [v29 isKernel];

          if ((v30 & 1) == 0) {
            goto LABEL_38;
          }
        }
        __int16 v31 = [v5 objectAtIndexedSubscript:2];
        uint64_t v32 = [v31 address];
        uint64_t v33 = [v8 lastObject];
        uint64_t v34 = [v33 address];

        if (v32 == v34)
        {
          uint64_t v14 = v62 - 1;
          uint64_t v3 = 1;
          goto LABEL_27;
        }
      }
    }
LABEL_38:
    int v35 = *__error();
    unint64_t v36 = _sa_logt();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      v38 = [(SAThread *)v61 debugDescription];
      uint64_t v39 = [v8 debugDescription];
      int v40 = [v5 debugDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v67 = (uint64_t)v38;
      __int16 v68 = 2112;
      uint64_t v69 = (uint64_t)v39;
      __int16 v70 = 2112;
      uint64_t v71 = v40;
      _os_log_debug_impl(&dword_1BF22B000, v36, OS_LOG_TYPE_DEBUG, "%@ no matching frames in resampled stack:%@\nvs\n%@", buf, 0x20u);
    }
    *__error() = v35;
    uint64_t v26 = v5;
    goto LABEL_41;
  }
LABEL_27:
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_48;
  }
  objc_msgSend(v8, "removeObjectsInRange:", v14, v62 - v14);
  uint64_t v25 = objc_msgSend(v5, "subarrayWithRange:", 1, v65 - 1);
  [v8 addObjectsFromArray:v25];

  uint64_t v26 = v8;
LABEL_41:
  id v28 = v26;

LABEL_42:
  return v28;
}

- (BOOL)isProcessorIdleThread
{
  uint64_t v2 = [(NSMutableArray *)self->_threadStates lastObject];
  if (v2) {
    int v3 = v2[40] >> 7;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (NSString)debugDescription
{
  uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"Thread 0x%llx", self->_threadId);
  return (NSString *)v2;
}

- (unint64_t)threadId
{
  return self->_threadId;
}

- (SATimestamp)creationTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 32, 1);
}

- (SATimestamp)exitTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isGlobalForcedIdle
{
  return self->_isGlobalForcedIdle;
}

- (BOOL)isMainThread
{
  return self->_isMainThread;
}

+ (id)classDictionaryKey
{
  return @"SAThread";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * [(NSMutableArray *)self->_threadStates count] + 48;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([(SAThread *)self sizeInBytesForSerializedVersion] != a4)
  {
    uint64_t v5 = *__error();
    uint64_t v14 = _sa_logt();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = [(SAThread *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v51 = [v15 UTF8String];
      __int16 v52 = 2048;
      *(void *)int v53 = [(SAThread *)self sizeInBytesForSerializedVersion];
      *(_WORD *)&v53[8] = 2048;
      *(void *)&v53[10] = a4;
      _os_log_error_impl(&dword_1BF22B000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v5;
    id v16 = [(SAThread *)self debugDescription];
    char v17 = [v16 UTF8String];
    [(SAThread *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(4044, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, v17);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  *(_WORD *)&a3->var0 = 769;
  *(void *)(&a3->var1 + 1) = self->_threadId;
  char v10 = BYTE6(a3->var4) & 0xFE | self->_isGlobalForcedIdle;
  BYTE6(a3->var4) = v10;
  BYTE6(a3->var4) = v10 & 0xFD | (2 * self->_isMainThread);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_creationTimestamp, v9);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_exitTimestamp, v9);
  if ((unint64_t)[(NSMutableArray *)self->_threadStates count] >= 0xFFFFFFFF)
  {
LABEL_8:
    int v24 = *__error();
    uint64_t v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [(SAThread *)self debugDescription];
      uint64_t v27 = [v26 UTF8String];
      uint64_t v28 = [(NSMutableArray *)self->_threadStates count];
      *(_DWORD *)buf = 136315394;
      uint64_t v51 = v27;
      __int16 v52 = 2048;
      *(void *)int v53 = v28;
      _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "%s has %lu states", buf, 0x16u);
    }
    *__error() = v24;
    a3 = [(SAThread *)self debugDescription];
    char v29 = [($D861F1FA08E8FC41A5785E3813195A1D *)a3 UTF8String];
    [(NSMutableArray *)self->_threadStates count];
    _SASetCrashLogMessage(4058, "%s has %lu states", v30, v31, v32, v33, v34, v35, v29);

    _os_crash();
    __break(1u);
LABEL_11:
    int v36 = *__error();
    v37 = _sa_logt();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = [(SAThread *)self debugDescription];
      uint64_t v39 = [v38 UTF8String];
      int v40 = *(_DWORD *)((char *)&a3->var4 + 2);
      unint64_t v41 = [(SAThread *)self sizeInBytesForSerializedVersion];
      *(_DWORD *)buf = 136315906;
      uint64_t v51 = v39;
      __int16 v52 = 1024;
      *(_DWORD *)int v53 = v40;
      *(_WORD *)&v53[4] = 2048;
      *(void *)&v53[6] = v5;
      *(_WORD *)&v53[14] = 2048;
      *(void *)&v53[16] = v41;
      _os_log_error_impl(&dword_1BF22B000, v37, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u threadStates), ended with length %ld, should be %lu", buf, 0x26u);
    }
    *__error() = v36;
    id v42 = [(SAThread *)self debugDescription];
    char v43 = [v42 UTF8String];
    [(SAThread *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(4065, "%s: after serializing (with %u threadStates), ended with length %ld, should be %lu", v44, v45, v46, v47, v48, v49, v43);

    _os_crash();
    __break(1u);
  }
  unsigned int v11 = [(NSMutableArray *)self->_threadStates count];
  *(_DWORD *)((char *)&a3->var4 + 2) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var5, v11, self->_threadStates, v9);
  long long v12 = &a3->var5 + 2 * *(unsigned int *)((char *)&a3->var4 + 2);
  uint64_t v5 = 8 * *(unsigned int *)((char *)&a3->var4 + 2) + 48;
  if (v5 != [(SAThread *)self sizeInBytesForSerializedVersion]) {
    goto LABEL_11;
  }
  *(void *)long long v12 = SASerializableIndexForPointerFromSerializationDictionary(self->_resampledLeafUserFrame, v9);
  *((void *)v12 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_resampledleafOfCRootFramesReplacedBySwiftAsync, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    [(SATimestamp *)self->_creationTimestamp addSelfToSerializationDictionary:v4];
    [(SATimestamp *)self->_exitTimestamp addSelfToSerializationDictionary:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v7 = self->_threadStates;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(SAFrame *)self->_resampledLeafUserFrame addSelfToSerializationDictionary:v4];
    [(SAFrame *)self->_resampledleafOfCRootFramesReplacedBySwiftAsync addSelfToSerializationDictionary:v4];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_11;
  }
  if (a4 <= 0x1F)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 32;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(4094, "bufferLength %lu < serialized SAThread struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 26) + 32 > a4)
  {
LABEL_8:
    int v14 = *__error();
    long long v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct with %u thread states", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(4095, "bufferLength %lu < serialized SAThread struct with %u thread states", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v23 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAThread version" userInfo:0];
    objc_exception_throw(v23);
  }
  +[SAThread threadWithId:]((uint64_t)SAThread, *(void *)((char *)a3 + 2));
  id result = (id)objc_claimAutoreleasedReturnValue();
  *((unsigned char *)result + 16) = *(unsigned char *)(v5 + 30) & 1;
  *((unsigned char *)result + 17) = (*(unsigned char *)(v5 + 30) & 2) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v70 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_24;
  }
  if (a4 <= 0x1F)
  {
    int v35 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 2048;
      uint64_t v74 = 32;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct %lu", buf, 0x16u);
    }

    *__error() = v35;
    _SASetCrashLogMessage(4109, "bufferLength %lu < serialized SAThread struct %lu", v36, v37, v38, v39, v40, v41, a4);
    _os_crash();
    __break(1u);
    goto LABEL_15;
  }
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 26) + 32 > a4)
  {
LABEL_15:
    int v42 = *__error();
    char v43 = _sa_logt();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      int v44 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 1024;
      LODWORD(v74) = v44;
      _os_log_error_impl(&dword_1BF22B000, v43, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct with %u thread states", buf, 0x12u);
    }

    *__error() = v42;
    _SASetCrashLogMessage(4110, "bufferLength %lu < serialized SAThread struct with %u thread states", v45, v46, v47, v48, v49, v50, a4);
    _os_crash();
    __break(1u);
LABEL_18:
    int v51 = *__error();
    __int16 v52 = _sa_logt();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      int v53 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 1024;
      LODWORD(v74) = v53;
      _os_log_error_impl(&dword_1BF22B000, v52, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread v2 struct with %u thread states", buf, 0x12u);
    }

    *__error() = v51;
    _SASetCrashLogMessage(4120, "bufferLength %lu < serialized SAThread v2 struct with %u thread states", v54, v55, v56, v57, v58, v59, a4);
    _os_crash();
    __break(1u);
LABEL_21:
    int v60 = *__error();
    uint64_t v61 = _sa_logt();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      int v62 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      unint64_t v72 = a4;
      __int16 v73 = 1024;
      LODWORD(v74) = v62;
      _os_log_error_impl(&dword_1BF22B000, v61, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread v3 struct with %u thread states", buf, 0x12u);
    }

    *__error() = v60;
    _SASetCrashLogMessage(4126, "bufferLength %lu < serialized SAThread v3 struct with %u thread states", v63, v64, v65, v66, v67, v68, a4);
    _os_crash();
    __break(1u);
LABEL_24:
    id v69 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAThread version" userInfo:0];
    objc_exception_throw(v69);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 10);
  uint64_t v13 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v70, v11, v13, 0);
  int v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  creationTimestamp = self->_creationTimestamp;
  self->_creationTimestamp = v14;

  unint64_t v16 = *(void *)((char *)a3 + 18);
  uint64_t v17 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v70, v11, v17, 0);
  uint64_t v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  exitTimestamp = self->_exitTimestamp;
  self->_exitTimestamp = v18;

  uint64_t v20 = (char *)a3 + 32;
  uint64_t v21 = *(unsigned int *)((char *)a3 + 26);
  uint64_t v22 = objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 32, v21, v70, v11, v22);
  id v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  threadStates = self->_threadStates;
  self->_threadStates = v23;

  if (*((unsigned __int8 *)a3 + 1) < 2u) {
    goto LABEL_9;
  }
  uint64_t v25 = *(unsigned int *)((char *)a3 + 26);
  if (8 * v25 + 40 > a4) {
    goto LABEL_18;
  }
  unint64_t v26 = *(void *)&v20[8 * v25];
  uint64_t v27 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v70, v11, v27, 0);
  uint64_t v28 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  resampledLeafUserFrame = self->_resampledLeafUserFrame;
  self->_resampledLeafUserFrame = v28;

  if (*((unsigned __int8 *)a3 + 1) < 3u) {
    goto LABEL_9;
  }
  uint64_t v30 = *(unsigned int *)((char *)a3 + 26);
  if (8 * v30 + 48 > a4) {
    goto LABEL_21;
  }
  unint64_t v31 = *(void *)&v20[8 * v30 + 8];
  uint64_t v32 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v70, v11, v32, 0);
  uint64_t v33 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  resampledleafOfCRootFramesReplacedBySwiftAsync = self->_resampledleafOfCRootFramesReplacedBySwiftAsync;
  self->_resampledleafOfCRootFramesReplacedBySwiftAsync = v33;

LABEL_9:
}

@end