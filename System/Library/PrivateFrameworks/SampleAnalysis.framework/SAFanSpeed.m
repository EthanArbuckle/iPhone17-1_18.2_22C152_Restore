@interface SAFanSpeed
+ fanSpeedWithPAStyleSerializedFanSpeed:(uint64_t)a1;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)fanSpeedIsValid;
- (SAFanSpeed)init;
- (SAFanSpeed)initWithTimestamp:(id)a3;
- (SATimestamp)timestamp;
- (id)initEmpty;
- (int)fanSpeed;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAFanSpeed

- (SAFanSpeed)init
{
  v3 = +[SATimestamp timestamp];
  v4 = [(SAFanSpeed *)self initWithTimestamp:v3];

  return v4;
}

- (SAFanSpeed)initWithTimestamp:(id)a3
{
  if (numFans_onceToken != -1) {
    dispatch_once(&numFans_onceToken, &__block_literal_global_15);
  }

  return 0;
}

- (BOOL)fanSpeedIsValid
{
  return self->_fanSpeed != -1;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (int)fanSpeed
{
  return self->_fanSpeed;
}

- (void).cxx_destruct
{
}

+ (id)classDictionaryKey
{
  return @"SAFanSpeed";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 14;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAFanSpeed *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v10 = *__error();
    v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SAFanSpeed *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = [(SAFanSpeed *)self sizeInBytesForSerializedVersion];
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v10;
    id v13 = [(SAFanSpeed *)self debugDescription];
    char v14 = [v13 UTF8String];
    [(SAFanSpeed *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(204, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(_DWORD *)(&a3->var1 + 1) = self->_fanSpeed;
  *(void *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5) {
    [(SATimestamp *)self->_timestamp addSelfToSerializationDictionary:v6];
  }
}

- (id)initEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)SAFanSpeed;
  return [(SAFanSpeed *)&v3 init];
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_7;
  }
  if (a4 <= 0xD)
  {
    int v7 = *__error();
    id v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 14;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFanSpeed struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(233, "bufferLength %lu < serialized SAFanSpeed struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAFanSpeed version" userInfo:0];
    objc_exception_throw(v15);
  }
  id result = [[SAFanSpeed alloc] initEmpty];
  *((_DWORD *)result + 2) = *(_DWORD *)((char *)a3 + 2);
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
  if (a4 <= 0xD)
  {
    int v16 = *__error();
    unint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = 14;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFanSpeed struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(246, "bufferLength %lu < serialized SAFanSpeed struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v24 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAFanSpeed version" userInfo:0];
    objc_exception_throw(v24);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 6);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;
}

+ fanSpeedWithPAStyleSerializedFanSpeed:(uint64_t)a1
{
  self;
  objc_super v3 = [[SAFanSpeed alloc] initEmpty];
  v3[2] = *(_DWORD *)(a2 + 16);
  uint64_t v4 = +[SATimestamp timestampWithMachAbsTime:0 machAbsTimeSec:0 machContTime:*(double *)(a2 + 8) machContTimeSec:0.0 wallTime:0.0];
  BOOL v5 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v4;

  return v3;
}

@end