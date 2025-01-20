@interface SADispatchQueue
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)dispatchQueueWithId:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)hasConcurrentExecution;
- (BOOL)isConcurrent;
- (NSString)debugDescription;
- (NSString)dispatchQueueLabel;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SADispatchQueue

+ (void)dispatchQueueWithId:(uint64_t)a1
{
  id v3 = objc_alloc((Class)self);
  v4 = -[SARecipe initWithId:](v3, a2);
  return v4;
}

- (NSString)debugDescription
{
  dispatchQueueLabel = self->_dispatchQueueLabel;
  id v4 = [NSString alloc];
  if (dispatchQueueLabel) {
    v5 = (void *)[v4 initWithFormat:@"DispatchQueue \"%@\"(%llu)", self->_dispatchQueueLabel, -[SARecipe identifier](self, "identifier")];
  }
  else {
    v5 = objc_msgSend(v4, "initWithFormat:", @"DispatchQueue %llu", -[SARecipe identifier](self, "identifier"), v7);
  }
  return (NSString *)v5;
}

- (BOOL)isConcurrent
{
  return self->_hasConcurrentExecution;
}

- (NSString)dispatchQueueLabel
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasConcurrentExecution
{
  return self->_hasConcurrentExecution;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SADispatchQueue";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  v2 = [(SARecipe *)self states];
  unint64_t v3 = 8 * [v2 count] + 24;

  return v3;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SADispatchQueue *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v17 = *__error();
    v18 = _sa_logt();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(SADispatchQueue *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v55 = [v19 UTF8String];
      __int16 v56 = 2048;
      *(void *)v57 = [(SADispatchQueue *)self sizeInBytesForSerializedVersion];
      *(_WORD *)&v57[8] = 2048;
      *(void *)&v57[10] = a4;
      _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v17;
    id v20 = [(SADispatchQueue *)self debugDescription];
    char v21 = [v20 UTF8String];
    [(SADispatchQueue *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5250, "%s: size %lu != buffer length %lu", v22, v23, v24, v25, v26, v27, v21);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  *(_WORD *)&a3->var0 = 513;
  *(void *)(&a3->var1 + 1) = [(SARecipe *)self identifier];
  BYTE6(a3->var2) = BYTE6(a3->var2) & 0xFE | self->_hasConcurrentExecution;
  v9 = [(SARecipe *)self states];
  unint64_t v10 = [v9 count];

  if (v10 >= 0xFFFFFFFF)
  {
LABEL_8:
    uint64_t v15 = *__error();
    v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [(SADispatchQueue *)self debugDescription];
      uint64_t v30 = [v29 UTF8String];
      v31 = [(SARecipe *)self states];
      uint64_t v32 = [v31 count];
      *(_DWORD *)buf = 136315394;
      uint64_t v55 = v30;
      __int16 v56 = 2048;
      *(void *)v57 = v32;
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "%s: %lu dispatchQueueStates", buf, 0x16u);
    }
    *__error() = v15;
    a3 = [(SADispatchQueue *)self debugDescription];
    char v33 = [($82CD6472EE7B56EB03C663CAE55BF0B9 *)a3 UTF8String];
    self = [(SARecipe *)self states];
    [(SADispatchQueue *)self count];
    _SASetCrashLogMessage(5260, "%s: %lu dispatchQueueStates", v34, v35, v36, v37, v38, v39, v33);

    _os_crash();
    __break(1u);
LABEL_11:
    int v40 = *__error();
    v41 = _sa_logt();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      id v42 = [(SADispatchQueue *)self debugDescription];
      uint64_t v43 = [v42 UTF8String];
      int v44 = *(_DWORD *)((char *)&a3->var2 + 2);
      unint64_t v45 = [(SADispatchQueue *)self sizeInBytesForSerializedVersion];
      *(_DWORD *)buf = 136315906;
      uint64_t v55 = v43;
      __int16 v56 = 1024;
      *(_DWORD *)v57 = v44;
      *(_WORD *)&v57[4] = 2048;
      *(void *)&v57[6] = v15;
      *(_WORD *)&v57[14] = 2048;
      *(void *)&v57[16] = v45;
      _os_log_error_impl(&dword_1BF22B000, v41, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u dispatchQueueStates), ended with length %ld, should be %lu", buf, 0x26u);
    }
    *__error() = v40;
    id v46 = [(SADispatchQueue *)self debugDescription];
    char v47 = [v46 UTF8String];
    [(SADispatchQueue *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5267, "%s: after serializing (with %u dispatchQueueStates), ended with length %ld, should be %lu", v48, v49, v50, v51, v52, v53, v47);

    _os_crash();
    __break(1u);
  }
  v11 = [(SARecipe *)self states];
  *(_DWORD *)((char *)&a3->var2 + 2) = [v11 count];

  unint64_t v12 = *(unsigned int *)((char *)&a3->var2 + 2);
  v13 = [(SARecipe *)self states];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var3, v12, v13, v8);

  v14 = &a3->var3 + 2 * *(unsigned int *)((char *)&a3->var2 + 2);
  uint64_t v15 = 8 * *(unsigned int *)((char *)&a3->var2 + 2) + 24;
  if (v15 != [(SADispatchQueue *)self sizeInBytesForSerializedVersion]) {
    goto LABEL_11;
  }
  *(void *)v14 = SASerializableIndexForPointerFromSerializationDictionary(self->_dispatchQueueLabel, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(SARecipe *)self states];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) addSelfToSerializationDictionary:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(NSString *)self->_dispatchQueueLabel addSelfToSerializationDictionary:v4];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 3u) {
    goto LABEL_11;
  }
  if (a4 <= 0xF)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 16;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(5290, "bufferLength %lu < serialized SADispatchQueue struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 10) + 16 > a4)
  {
LABEL_8:
    int v14 = *__error();
    long long v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 10);
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct with %u dispatchQueueStates", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(5291, "bufferLength %lu < serialized SADispatchQueue struct with %u dispatchQueueStates", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v23 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SADispatchQueue version" userInfo:0];
    objc_exception_throw(v23);
  }
  +[SADispatchQueue dispatchQueueWithId:]((uint64_t)SADispatchQueue, *(void *)((char *)a3 + 2));
  id result = (id)objc_claimAutoreleasedReturnValue();
  *((unsigned char *)result + 24) = *(unsigned char *)(v5 + 14) & 1;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v52[13] = *MEMORY[0x1E4F143B8];
  id v48 = a5;
  id v12 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_21;
  }
  if (a4 <= 0xF)
  {
    int v22 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v50 = a4;
      __int16 v51 = 2048;
      *(void *)uint64_t v52 = 16;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct %lu", buf, 0x16u);
    }

    *__error() = v22;
    _SASetCrashLogMessage(5304, "bufferLength %lu < serialized SADispatchQueue struct %lu", v23, v24, v25, v26, v27, v28, a4);
    _os_crash();
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = *(unsigned int *)((char *)a3 + 10);
  uint64_t v13 = 8 * v7;
  unint64_t v6 = 8 * v7 + 16;
  if (v6 > a4)
  {
LABEL_15:
    int v29 = *__error();
    uint64_t v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v31 = *(_DWORD *)((char *)a3 + 10);
      *(_DWORD *)buf = 134218496;
      unint64_t v50 = a4;
      __int16 v51 = 1024;
      *(_DWORD *)uint64_t v52 = v31;
      v52[2] = 2048;
      *(void *)&v52[3] = v6;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct v1 with %u dispatchQueueStates (%llu)", buf, 0x1Cu);
    }

    *__error() = v29;
    _SASetCrashLogMessage(5306, "bufferLength %lu < serialized SADispatchQueue struct v1 with %u dispatchQueueStates (%llu)", v32, v33, v34, v35, v36, v37, a4);
    _os_crash();
    __break(1u);
LABEL_18:
    int v38 = *__error();
    uint64_t v39 = _sa_logt();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      int v40 = *(_DWORD *)((char *)a3 + 10);
      *(_DWORD *)buf = 134218496;
      unint64_t v50 = a4;
      __int16 v51 = 1024;
      *(_DWORD *)uint64_t v52 = v40;
      v52[2] = 2048;
      *(void *)&v52[3] = v7;
      _os_log_error_impl(&dword_1BF22B000, v39, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SADispatchQueue struct v2 with %u dispatchQueueStates (%llu)", buf, 0x1Cu);
    }

    *__error() = v38;
    _SASetCrashLogMessage(5313, "bufferLength %lu < serialized SADispatchQueue struct v2 with %u dispatchQueueStates (%llu)", v41, v42, v43, v44, v45, v46, a4);
    _os_crash();
    __break(1u);
LABEL_21:
    id v47 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SADispatchQueue version" userInfo:0];
    objc_exception_throw(v47);
  }
  int v14 = v12;
  long long v15 = objc_opt_class();
  uint64_t v17 = SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 16, v7, v48, v14, v15);
  if (self) {
    objc_setProperty_atomic(self, v16, v17, 8);
  }

  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    uint64_t v7 = v13 + 24;
    if (v13 + 24 <= a4)
    {
      unint64_t v18 = *((void *)a3 + *(unsigned int *)((char *)a3 + 10) + 2);
      uint64_t v19 = objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v18, v48, v14, v19, 0);
      uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      dispatchQueueLabel = self->_dispatchQueueLabel;
      self->_dispatchQueueLabel = v20;

      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_9:
}

@end