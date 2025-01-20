@interface SAMemoryPressureEvent
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)parseKTrace:(void *)a3 findingMemoryPressureEvents:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (SATimestamp)timestamp;
- (unint64_t)availableBytes;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unsigned)memoryStatusLevel;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAMemoryPressureEvent

+ (void)parseKTrace:(void *)a3 findingMemoryPressureEvents:
{
  id v3 = a3;
  self;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__7;
  v8[4] = __Block_byref_object_dispose__7;
  id v9 = 0;
  if (!ktrace_get_machine())
  {
    int v4 = *__error();
    v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "Unable to get machine from ktrace session", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!ktrace_machine_hw_page_size())
  {
    int v4 = *__error();
    v5 = _sa_logt();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "Unable to get hw page size from ktrace session", buf, 2u);
    }
LABEL_9:

    *__error() = v4;
    goto LABEL_10;
  }
  ktrace_events_single();
  id v6 = v3;
  ktrace_events_single();

LABEL_10:
  _Block_object_dispose(v8, 8);
}

uint64_t __65__SAMemoryPressureEvent_parseKTrace_findingMemoryPressureEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = objc_alloc_init(SAMemoryPressureEvent);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v8 = +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v9) {
    objc_setProperty_atomic(v9, v7, v8, 16);
  }

  v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v11 = *(unsigned int *)(a1 + 48);
  uint64_t v12 = *(void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 24);
  uint64_t result = [v10 availableBytes];
  if (v10) {
    v10[3] = result + (v13 + v12) * v11;
  }
  return result;
}

void __65__SAMemoryPressureEvent_parseKTrace_findingMemoryPressureEvents___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    *(unsigned char *)(v2 + 8) = *(unsigned char *)(a2 + 24);
    int v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    uint64_t v6 = *(void *)(a2 + 8);
    uint64_t v7 = *(void *)(a2 + 16);
    uint64_t v8 = [v4 availableBytes];
    if (v4) {
      v4[3] = v8 + (v7 + v6) * v5;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)availableBytes
{
  return self->_availableBytes;
}

- (unsigned)memoryStatusLevel
{
  return self->_memoryStatusLevel;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAMemoryPressureEvent";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 19;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAMemoryPressureEvent *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v10 = *__error();
    uint64_t v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SAMemoryPressureEvent *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = [(SAMemoryPressureEvent *)self sizeInBytesForSerializedVersion];
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v10;
    id v13 = [(SAMemoryPressureEvent *)self debugDescription];
    char v14 = [v13 UTF8String];
    [(SAMemoryPressureEvent *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(113, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_availableBytes;
  BYTE2(a3->var3) = self->_memoryStatusLevel;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  int v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5) {
    [(SATimestamp *)self->_timestamp addSelfToSerializationDictionary:v6];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_9;
  }
  if (a4 <= 0x12)
  {
    int v7 = *__error();
    id v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 19;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAIOEvent struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(138, "bufferLength %lu < serialized SAIOEvent struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAMemoryPressureEvent version" userInfo:0];
    objc_exception_throw(v15);
  }
  id result = objc_alloc_init(SAMemoryPressureEvent);
  if (result)
  {
    *((void *)result + 3) = *(void *)((char *)a3 + 10);
    *((unsigned char *)result + 8) = *((unsigned char *)a3 + 18);
  }
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v25 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_9;
  }
  if (a4 <= 0x12)
  {
    int v16 = *__error();
    unint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = 19;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAMemoryPressureEvent struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(152, "bufferLength %lu < serialized SAMemoryPressureEvent struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v24 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAMemoryPressureEvent version" userInfo:0];
    objc_exception_throw(v24);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;
}

@end