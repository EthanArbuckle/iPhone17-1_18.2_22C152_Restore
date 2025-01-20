@interface SASwiftTask
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSString)debugDescription;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SASwiftTask

- (NSString)debugDescription
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"SwiftTask %llu", -[SARecipe identifier](self, "identifier"));
  return (NSString *)v2;
}

+ (id)classDictionaryKey
{
  return @"SASwiftTask";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  v2 = [(SARecipe *)self states];
  unint64_t v3 = 8 * [v2 count] + 14;

  return v3;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SASwiftTask *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v16 = *__error();
    v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(SASwiftTask *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v43 = [v18 UTF8String];
      __int16 v44 = 2048;
      unint64_t v45 = [(SASwiftTask *)self sizeInBytesForSerializedVersion];
      __int16 v46 = 2048;
      unint64_t v47 = a4;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v16;
    id v19 = [(SASwiftTask *)self debugDescription];
    char v20 = [v19 UTF8String];
    [(SASwiftTask *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5361, "%s: size %lu != buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
LABEL_7:
    int v27 = *__error();
    v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v29 = [(SASwiftTask *)self debugDescription];
      uint64_t v30 = [v29 UTF8String];
      v31 = [(SARecipe *)self states];
      uint64_t v32 = [v31 count];
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = v30;
      __int16 v44 = 2048;
      unint64_t v45 = v32;
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "%s: %lu swiftTaskStates", buf, 0x16u);
    }
    *__error() = v27;
    id v33 = [(SASwiftTask *)self debugDescription];
    char v34 = [v33 UTF8String];
    v35 = [(SARecipe *)self states];
    [v35 count];
    _SASetCrashLogMessage(5368, "%s: %lu swiftTaskStates", v36, v37, v38, v39, v40, v41, v34);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = [(SARecipe *)self identifier];
  v9 = [(SARecipe *)self states];
  unint64_t v10 = [v9 count];

  if (v10 >= 0xFFFFFFFF) {
    goto LABEL_7;
  }
  v11 = [(SARecipe *)self states];
  *(_DWORD *)((char *)&a3->var2 + 2) = [v11 count];

  v12 = (char *)&a3->var2 + 6;
  unint64_t v13 = *(unsigned int *)((char *)&a3->var2 + 2);
  v14 = [(SARecipe *)self states];
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(v12, v13, v14, v8);

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
    v7 = [(SARecipe *)self states];
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
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_11;
  }
  if (a4 <= 0xD)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      uint64_t v27 = 14;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(5391, "bufferLength %lu < serialized SASwiftTask struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 10) + 14 > a4)
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
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct with %u swiftTaskStates", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(5392, "bufferLength %lu < serialized SASwiftTask struct with %u swiftTaskStates", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v23 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SASwiftTask version" userInfo:0];
    objc_exception_throw(v23);
  }
  +[SADispatchQueue dispatchQueueWithId:]((uint64_t)SASwiftTask, *(void *)((char *)a3 + 2));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v38[13] = *MEMORY[0x1E4F143B8];
  id v34 = a5;
  id v11 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_15;
  }
  if (a4 <= 0xD)
  {
    int v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v36 = a4;
      __int16 v37 = 2048;
      *(void *)uint64_t v38 = 14;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct %lu", buf, 0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(5404, "bufferLength %lu < serialized SASwiftTask struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v12 = *(unsigned int *)((char *)a3 + 10);
  unint64_t v6 = 8 * v12 + 14;
  if (v6 > a4)
  {
LABEL_12:
    int v24 = *__error();
    unint64_t v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = *(_DWORD *)((char *)a3 + 10);
      *(_DWORD *)buf = 134218496;
      unint64_t v36 = a4;
      __int16 v37 = 1024;
      *(_DWORD *)uint64_t v38 = v26;
      v38[2] = 2048;
      *(void *)&v38[3] = v6;
      _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASwiftTask struct v1 with %u swiftTaskStates (%llu)", buf, 0x1Cu);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5406, "bufferLength %lu < serialized SASwiftTask struct v1 with %u swiftTaskStates (%llu)", v27, v28, v29, v30, v31, v32, a4);
    _os_crash();
    __break(1u);
LABEL_15:
    id v33 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SASwiftTask version" userInfo:0];
    objc_exception_throw(v33);
  }
  uint64_t v13 = v11;
  int v14 = objc_opt_class();
  int v16 = SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 14, v12, v34, v13, v14);
  if (self) {
    objc_setProperty_atomic(self, v15, v16, 8);
  }
}

@end