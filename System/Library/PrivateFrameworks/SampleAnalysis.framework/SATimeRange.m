@interface SATimeRange
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)timeRangeStart:(id)a3 end:(id)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSString)debugDescription;
- (SATimeRange)initWithStart:(id)a3 end:(id)a4;
- (SATimestamp)endTime;
- (SATimestamp)startTime;
- (double)deltaMachAbsTimeSeconds;
- (double)deltaMachContTimeSeconds;
- (double)deltaWallTime;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compare:(id)a3;
- (unint64_t)deltaMachAbsTime;
- (unint64_t)deltaMachContTime;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SATimeRange

- (SATimeRange)initWithStart:(id)a3 end:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([v7 le:v8] & 1) == 0)
  {
    int v12 = *__error();
    v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v7 debugDescription];
      uint64_t v15 = [v14 UTF8String];
      id v16 = [v8 debugDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      uint64_t v30 = [v16 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "start time %s > end time %s", buf, 0x16u);
    }
    *__error() = v12;
    id v17 = [v7 debugDescription];
    char v18 = [v17 UTF8String];
    id v19 = [v8 debugDescription];
    [v19 UTF8String];
    _SASetCrashLogMessage(567, "start time %s > end time %s", v20, v21, v22, v23, v24, v25, v18);

    _os_crash();
    __break(1u);
  }
  v26.receiver = self;
  v26.super_class = (Class)SATimeRange;
  v9 = [(SATimeRange *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startTime, a3);
    objc_storeStrong((id *)&v10->_endTime, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

+ (id)timeRangeStart:(id)a3 end:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithStart:v7 end:v6];

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SATimestamp *)self->_startTime compare:v4];
  if (v5 == -1)
  {
    if ([(SATimestamp *)self->_endTime compare:v4] == -1) {
      int64_t v5 = -1;
    }
    else {
      int64_t v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)deltaMachAbsTime
{
  unint64_t v3 = [(SATimestamp *)self->_startTime machAbsTime];
  unint64_t v4 = [(SATimestamp *)self->_endTime machAbsTime];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  else {
    return v4 - v3;
  }
}

- (double)deltaMachAbsTimeSeconds
{
  [(SATimestamp *)self->_startTime machAbsTimeSeconds];
  double v4 = v3;
  [(SATimestamp *)self->_endTime machAbsTimeSeconds];
  BOOL v6 = v4 == 0.0 || v5 == 0.0;
  double result = v5 - v4;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (unint64_t)deltaMachContTime
{
  unint64_t v3 = [(SATimestamp *)self->_startTime machContTime];
  unint64_t v4 = [(SATimestamp *)self->_endTime machContTime];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  else {
    return v4 - v3;
  }
}

- (double)deltaMachContTimeSeconds
{
  [(SATimestamp *)self->_startTime machContTimeSeconds];
  double v4 = v3;
  [(SATimestamp *)self->_endTime machContTimeSeconds];
  BOOL v6 = v4 == 0.0 || v5 == 0.0;
  double result = v5 - v4;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (double)deltaWallTime
{
  [(SATimestamp *)self->_startTime wallTime];
  double v4 = v3;
  [(SATimestamp *)self->_endTime wallTime];
  BOOL v6 = v4 == 0.0 || v5 == 0.0;
  double result = v5 - v4;
  if (v6) {
    return 0.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double v5 = (void *)[(SATimestamp *)self->_startTime copy];
  BOOL v6 = (void *)[(SATimestamp *)self->_endTime copy];
  id v7 = (void *)[v4 initWithStart:v5 end:v6];

  return v7;
}

- (NSString)debugDescription
{
  double v3 = NSString;
  double v4 = [(SATimestamp *)self->_startTime debugDescription];
  double v5 = [(SATimestamp *)self->_endTime debugDescription];
  BOOL v6 = [v3 stringWithFormat:@"start: %@\n  end: %@", v4, v5];

  return (NSString *)v6;
}

- (SATimestamp)startTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 8, 1);
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  [v4 appendString:@"\"startTime\":{"];
  [(SATimestamp *)self->_startTime writeJSONDictionaryEntriesToStream:v4];
  [v4 appendString:@"},\"endTime\":{"];
  [(SATimestamp *)self->_endTime writeJSONDictionaryEntriesToStream:v4];
  [v4 appendString:@"}"];
}

+ (id)classDictionaryKey
{
  return @"SATimeRange";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 18;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SATimeRange *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v10 = *__error();
    v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SATimeRange *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = [(SATimeRange *)self sizeInBytesForSerializedVersion];
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v10;
    id v13 = [(SATimeRange *)self debugDescription];
    char v14 = [v13 UTF8String];
    [(SATimeRange *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(838, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTime, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTime, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  id v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5)
  {
    [(SATimestamp *)self->_startTime addSelfToSerializationDictionary:v6];
    [(SATimestamp *)self->_endTime addSelfToSerializationDictionary:v6];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_9;
  }
  if (a4 <= 0x11)
  {
    int v6 = *__error();
    id v7 = _sa_logt();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v16 = a4;
      __int16 v17 = 2048;
      uint64_t v18 = 18;
      _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATimeRange struct %lu", buf, 0x16u);
    }

    *__error() = v6;
    _SASetCrashLogMessage(863, "bufferLength %lu < serialized SATimeRange struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v14 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATimeRange version" userInfo:0];
    objc_exception_throw(v14);
  }
  return objc_alloc_init(SATimeRange);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v29 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_9;
  }
  if (a4 <= 0x11)
  {
    int v20 = *__error();
    uint64_t v21 = _sa_logt();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = 18;
      _os_log_error_impl(&dword_1BF22B000, v21, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATimeRange struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(873, "bufferLength %lu < serialized SATimeRange struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v28 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATimeRange version" userInfo:0];
    objc_exception_throw(v28);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v29, v11, v13);
  id v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v14;

  unint64_t v16 = *(void *)((char *)a3 + 10);
  __int16 v17 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v29, v11, v17);
  uint64_t v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTime = self->_endTime;
  self->_endTime = v18;
}

@end