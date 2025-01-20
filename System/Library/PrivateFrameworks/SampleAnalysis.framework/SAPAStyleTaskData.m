@interface SAPAStyleTaskData
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAPAStyleTaskData

+ (id)classDictionaryKey
{
  return @"PASampleTaskData";
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5 = a5;
  id v6 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleTaskData" userInfo:0];
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleTaskData" userInfo:0];
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Trying to encode SAPAStyleTaskData" userInfo:0];
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    id v5 = @"NULL serializedTask_v2";
    goto LABEL_8;
  }
  if (*(void *)a3 >> 1 != 143727010)
  {
    id v5 = @"Bad SAPAStyleTaskData magic";
LABEL_8:
    id v6 = +[SAException exceptionWithName:@"Decoding failure" reason:v5 userInfo:0];
    objc_exception_throw(v6);
  }
  return objc_alloc_init(SAPAStyleTaskData);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (!a3 || !v9 || (v11 = v10) == 0)
  {
    v69 = @"Invalid args";
    goto LABEL_80;
  }
  unint64_t v12 = *((void *)a3 + 1);
  if (v12 > 0xFFFFFFFFFFFFFFFDLL || *((void *)a3 + 2) == -2)
  {
    v69 = @"Invalid index found";
    goto LABEL_80;
  }
  v13 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v9, v11, v13, 0);
  selfa = (id)objc_claimAutoreleasedReturnValue();
  if (!selfa)
  {
    v69 = @"Could not get time insensitive instance";
    goto LABEL_80;
  }
  unint64_t v14 = *((void *)a3 + 2);
  v15 = objc_opt_class();
  v75 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v9, v11, v15, 0);
  if (*(void *)a3 != 287454020)
  {
    if (*(void *)a3 == 287454021)
    {
      uint64_t v16 = 36;
      goto LABEL_11;
    }
    v69 = @"Bad SAPAStyleTaskData magic";
LABEL_80:
    id v70 = +[SAException exceptionWithName:@"Decoding failure" reason:v69 userInfo:0];
    objc_exception_throw(v70);
  }
  uint64_t v16 = 32;
LABEL_11:
  v17 = (char *)a3 + v16;
  uint64_t v18 = *((void *)a3 + 3);
  v19 = objc_opt_class();
  v73 = v11;
  v20 = SASerializableNewMutableArrayFromIndexList((uint64_t)v17, v18, v9, v11, v19);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v86 objects:v91 count:16];
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v87 != v24) {
          objc_enumerationMutation(v20);
        }
        v26 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if ([(SATaskState *)self->_taskState isPidSuspended])
        {
          if (!v26) {
            continue;
          }
        }
        else
        {
          if ([(SATaskState *)self->_taskState suspendCount]) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28) {
            continue;
          }
        }
        Property = objc_getProperty(v26, v27, 16, 1);
        if (Property) {
          Property[11] |= 0x40u;
        }
      }
      uint64_t v23 = [v20 countByEnumeratingWithState:&v86 objects:v91 count:16];
    }
    while (v23);
  }
  v74 = v9;
  if (*(void *)a3 >= 0x11223345uLL && *((_DWORD *)a3 + 8))
  {
    uint64_t v30 = *((void *)a3 + 3);
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:*((unsigned int *)a3 + 8)];
    if (*((_DWORD *)a3 + 8))
    {
      v32 = self;
      unint64_t v33 = 0;
      v34 = &v17[8 * v30];
      v35 = (void *)v31;
      do
      {
        v36 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&v34[4 * v33]];
        [v35 addObject:v36];

        ++v33;
      }
      while (v33 < *((unsigned int *)a3 + 8));
      v37 = v35;
      self = v32;
    }
    else
    {
      v37 = (void *)v31;
    }
  }
  else
  {
    v37 = 0;
  }
  v38 = (id *)objc_getProperty(selfa, v22, 8, 1);
  v72 = v37;
  +[SATaskState stateWithPAStyleTaskPrivateData:donatingUniquePids:]((uint64_t)SATaskState, v75, v37);
  v39 = (SATaskState *)objc_claimAutoreleasedReturnValue();
  taskState = self->_taskState;
  self->_taskState = v39;

  if (v38)
  {
    [v38[1] addObject:self->_taskState];
    [v38[1] count];
  }
  v71 = self;
  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v20;
  uint64_t v80 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v80)
  {
    unint64_t v43 = 0x1E4F28000uLL;
    uint64_t v79 = *(void *)v83;
    id v81 = v42;
    v77 = v41;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v83 != v79) {
          objc_enumerationMutation(obj);
        }
        v45 = *(void **)(*((void *)&v82 + 1) + 8 * v44);
        v46 = [v38 threads];
        if (v45) {
          uint64_t v47 = v45[3];
        }
        else {
          uint64_t v47 = 0;
        }
        v48 = [*(id *)(v43 + 3792) numberWithUnsignedLongLong:v47];
        v49 = [v46 objectForKeyedSubscript:v48];

        if (!v49)
        {
          if (v45) {
            uint64_t v51 = v45[3];
          }
          else {
            uint64_t v51 = 0;
          }
          +[SAThread threadWithId:]((uint64_t)SAThread, v51);
          v49 = (id *)objc_claimAutoreleasedReturnValue();
          -[SATask addThread:]((uint64_t)v38, v49);
        }
        if (v45) {
          id v52 = objc_getProperty(v45, v50, 16, 1);
        }
        else {
          id v52 = 0;
        }
        v53 = (id *)v52;
        [v41 addObject:v53];
        v54 = [v49 threadStates];
        v55 = [v54 lastObject];

        BOOL v28 = v55 == v53;
        id v42 = v81;
        if (!v28)
        {
          if (v49)
          {
            [v49[1] addObject:v53];
            uint64_t v56 = [v49[1] count] - 1;
            if (!v45) {
              goto LABEL_60;
            }
          }
          else
          {
            uint64_t v56 = 0;
            if (!v45) {
              goto LABEL_60;
            }
          }
          if (v45[4])
          {
            v57 = [v38 dispatchQueues];
            v58 = [*(id *)(v43 + 3792) numberWithUnsignedLongLong:v45[4]];
            v59 = [v57 objectForKeyedSubscript:v58];

            if (!v59)
            {
              v59 = +[SADispatchQueue dispatchQueueWithId:]((uint64_t)SADispatchQueue, v45[4]);
              -[SATask addDispatchQueue:]((uint64_t)v38, v59);
            }
            v60 = +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)SADispatchQueueState, v49, v56);
            if (v59) {
              -[SARecipe addState:hasConcurrentExecution:]((uint64_t)v59, v60, 0);
            }
            unint64_t v43 = 0x1E4F28000uLL;
            if (v53) {
              objc_storeWeak(v53 + 14, v59);
            }

            v41 = v77;
            id v42 = v81;
          }
        }
LABEL_60:
        if ([v53 hasDispatchQueue])
        {
          v61 = [v53 dispatchQueue];
          unint64_t v62 = v43;
          v63 = objc_msgSend(*(id *)(v43 + 3792), "numberWithUnsignedLongLong:", objc_msgSend(v61, "identifier"));
          int v64 = [v42 containsObject:v63];

          if (v64)
          {
            if (v61) {
              v61[24] = 1;
            }
          }
          else
          {
            v65 = objc_msgSend(*(id *)(v62 + 3792), "numberWithUnsignedLongLong:", objc_msgSend(v61, "identifier"));
            [v42 addObject:v65];
          }
          unint64_t v43 = 0x1E4F28000;
        }

        ++v44;
      }
      while (v80 != v44);
      uint64_t v66 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
      uint64_t v80 = v66;
    }
    while (v66);
  }

  uint64_t v67 = [v41 copy];
  threadStates = v71->_threadStates;
  v71->_threadStates = (NSArray *)v67;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadStates, 0);
  objc_storeStrong((id *)&self->_taskState, 0);
}

@end