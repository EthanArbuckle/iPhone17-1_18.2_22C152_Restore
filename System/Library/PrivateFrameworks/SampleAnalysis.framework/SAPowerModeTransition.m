@interface SAPowerModeTransition
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)lowPowerMode;
- (BOOL)lowPowerModeChanged;
- (NSString)debugDescription;
- (SATimestamp)timestamp;
- (id)initWithLowPowerMode:(void *)a3 timestamp:;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAPowerModeTransition

- (void).cxx_destruct
{
}

- (id)initWithLowPowerMode:(void *)a3 timestamp:
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)SAPowerModeTransition;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      *((unsigned char *)v7 + 9) = a2;
      *((unsigned char *)v7 + 8) = 1;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  v2 = NSString;
  if (self->_lowPowerModeChanged)
  {
    if (self->_lowPowerMode) {
      v3 = "low";
    }
    else {
      v3 = "default";
    }
  }
  else
  {
    v3 = "unknown";
  }
  v4 = [(SATimestamp *)self->_timestamp debugDescription];
  v5 = [v2 stringWithFormat:@"%s power mode at %@", v3, v4];

  return (NSString *)v5;
}

- (SATimestamp)timestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)lowPowerModeChanged
{
  return self->_lowPowerModeChanged;
}

- (BOOL)lowPowerMode
{
  return self->_lowPowerMode;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v6 = a3;
  if (self->_lowPowerModeChanged)
  {
    v4 = [NSNumber numberWithBool:self->_lowPowerMode];
    SAJSONWriteDictionaryFirstEntry(v6, @"lowPowerMode", v4);

    timestamp = self->_timestamp;
    if (timestamp) {
      SAJSONWriteDictionaryEntry(v6, @"timestamp", timestamp);
    }
  }
}

+ (id)classDictionaryKey
{
  return @"SAPowerModeTransition";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 18;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAPowerModeTransition *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v10 = *__error();
    v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SAPowerModeTransition *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = [(SAPowerModeTransition *)self sizeInBytesForSerializedVersion];
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v10;
    id v13 = [(SAPowerModeTransition *)self debugDescription];
    char v14 = [v13 UTF8String];
    [(SAPowerModeTransition *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(75, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(&a3->var1 + 1) = self->_lowPowerMode;
  *(&a3->var1 + 2) = self->_lowPowerModeChanged;
  *($FF3C895AB0208964DD20957A829FE7A6 *)((char *)&a3->var2 + 2) = ($FF3C895AB0208964DD20957A829FE7A6)SASerializableIndexForPointerFromSerializationDictionary(self->_timestamp, v8);

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

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_7;
  }
  if (a4 <= 0x11)
  {
    int v7 = *__error();
    id v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 18;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(100, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAPowerModeTransition version" userInfo:0];
    objc_exception_throw(v15);
  }
  id result = objc_alloc_init(SAPowerModeTransition);
  *((unsigned char *)result + 9) = *((unsigned char *)a3 + 2);
  *((unsigned char *)result + 8) = *((unsigned char *)a3 + 3);
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
  if (a4 <= 0x11)
  {
    int v16 = *__error();
    unint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      uint64_t v29 = 18;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(114, "bufferLength %lu < serialized SAPowerModeTransition struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v24 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAPowerModeTransition version" userInfo:0];
    objc_exception_throw(v24);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 10);
  uint64_t v13 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v25, v11, v13, 0);
  uint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v14;
}

@end