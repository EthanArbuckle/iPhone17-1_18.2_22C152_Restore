@interface SAModelExecution
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSString)debugDescription;
- (NSString)requester;
- (NSString)useCaseID;
- (SATimestamp)endTime;
- (SATimestamp)startTime;
- (unint64_t)instructions;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setEndTime:(id)a3;
- (void)setInstructions:(unint64_t)a3;
- (void)setRequester:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setUseCaseID:(id)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAModelExecution

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  v4 = [(SAModelExecution *)self requester];
  v5 = [(SAModelExecution *)self useCaseID];
  unint64_t v6 = [(SAModelExecution *)self instructions];
  v7 = [(SAModelExecution *)self startTime];
  v8 = [v7 debugDescription];
  v9 = [(SAModelExecution *)self endTime];
  v10 = [v9 debugDescription];
  v11 = (void *)[v3 initWithFormat:@"execution on behalf of %@ use case %@, %llu instructions, from %@-%@", v4, v5, v6, v8, v10];

  return (NSString *)v11;
}

- (NSString)requester
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRequester:(id)a3
{
}

- (NSString)useCaseID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUseCaseID:(id)a3
{
}

- (SATimestamp)startTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartTime:(id)a3
{
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndTime:(id)a3
{
}

- (unint64_t)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(unint64_t)a3
{
  self->_instructions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_useCaseID, 0);
  objc_storeStrong((id *)&self->_requester, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  requester = self->_requester;
  id v13 = v4;
  if (requester)
  {
    SAJSONWriteDictionaryFirstEntry(v4, @"requester", requester);
    useCaseID = self->_useCaseID;
    if (useCaseID) {
      SAJSONWriteDictionaryEntry(v13, @"useCaseID", useCaseID);
    }
    goto LABEL_6;
  }
  v7 = self->_useCaseID;
  if (v7)
  {
    SAJSONWriteDictionaryFirstEntry(v4, @"useCaseID", v7);
LABEL_6:
    startTime = self->_startTime;
    if (startTime) {
      SAJSONWriteDictionaryEntry(v13, @"startTime", startTime);
    }
    goto LABEL_8;
  }
  v11 = self->_startTime;
  if (v11)
  {
    SAJSONWriteDictionaryFirstEntry(v4, @"startTime", v11);
LABEL_8:
    endTime = self->_endTime;
    if (endTime) {
      SAJSONWriteDictionaryEntry(v13, @"endTime", endTime);
    }
    goto LABEL_10;
  }
  v12 = self->_endTime;
  if (v12)
  {
    SAJSONWriteDictionaryFirstEntry(v4, @"endTime", v12);
LABEL_10:
    if (!self->_instructions) {
      goto LABEL_13;
    }
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryEntry(v13, @"instructions", v10);
    goto LABEL_12;
  }
  if (self->_instructions)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryFirstEntry(v13, @"instructions", v10);
LABEL_12:
  }
LABEL_13:
}

+ (id)classDictionaryKey
{
  return @"SAModelExecution";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 42;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAModelExecution *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v10 = *__error();
    v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SAModelExecution *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = [v12 UTF8String];
      __int16 v23 = 2048;
      unint64_t v24 = [(SAModelExecution *)self sizeInBytesForSerializedVersion];
      __int16 v25 = 2048;
      unint64_t v26 = a4;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v10;
    id v13 = [(SAModelExecution *)self debugDescription];
    char v14 = [v13 UTF8String];
    [(SAModelExecution *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(430, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 771;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_requester, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTime, v8);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTime, v8);
  *(unint64_t *)((char *)&a3->var4 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_useCaseID, v8);
  *(unint64_t *)((char *)&a3->var5 + 2) = self->_instructions;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v6 = a3;
  id v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5)
  {
    [(NSString *)self->_requester addSelfToSerializationDictionary:v6];
    [(SATimestamp *)self->_startTime addSelfToSerializationDictionary:v6];
    [(SATimestamp *)self->_endTime addSelfToSerializationDictionary:v6];
    [(NSString *)self->_useCaseID addSelfToSerializationDictionary:v6];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_7;
  }
  if (a4 <= 0x21)
  {
    int v7 = *__error();
    id v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 34;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelExecution struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(460, "bufferLength %lu < serialized SAModelExecution struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAModelExecution version" userInfo:0];
    objc_exception_throw(v15);
  }
  id result = objc_alloc_init(SAModelExecution);
  *((void *)result + 5) = *(void *)((char *)a3 + 26);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v45 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_15;
  }
  if (a4 <= 0x21)
  {
    int v28 = *__error();
    v29 = _sa_logt();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v47 = a4;
      __int16 v48 = 2048;
      uint64_t v49 = 34;
      _os_log_error_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelExecution struct %lu", buf, 0x16u);
    }

    *__error() = v28;
    _SASetCrashLogMessage(473, "bufferLength %lu < serialized SAModelExecution struct %lu", v30, v31, v32, v33, v34, v35, a4);
    _os_crash();
    __break(1u);
LABEL_12:
    int v36 = *__error();
    v37 = _sa_logt();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v47 = a4;
      _os_log_error_impl(&dword_1BF22B000, v37, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModelExecution v2 struct", buf, 0xCu);
    }

    *__error() = v36;
    _SASetCrashLogMessage(482, "bufferLength %lu < serialized SAModelExecution v2 struct", v38, v39, v40, v41, v42, v43, a4);
    _os_crash();
    __break(1u);
LABEL_15:
    id v44 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAModelExecution version" userInfo:0];
    objc_exception_throw(v44);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v45, v11, v13, 0);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  requester = self->_requester;
  self->_requester = v14;

  unint64_t v16 = *(void *)((char *)a3 + 10);
  unint64_t v17 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v45, v11, v17, 0);
  __int16 v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v18;

  unint64_t v20 = *(void *)((char *)a3 + 18);
  v21 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v20, v45, v11, v21, 0);
  uint64_t v22 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTime = self->_endTime;
  self->_endTime = v22;

  if (*((unsigned __int8 *)a3 + 1) < 3u) {
    goto LABEL_6;
  }
  if (a4 <= 0x29) {
    goto LABEL_12;
  }
  unint64_t v24 = *(void *)((char *)a3 + 26);
  __int16 v25 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v45, v11, v25, 0);
  unint64_t v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  useCaseID = self->_useCaseID;
  self->_useCaseID = v26;

LABEL_6:
}

@end