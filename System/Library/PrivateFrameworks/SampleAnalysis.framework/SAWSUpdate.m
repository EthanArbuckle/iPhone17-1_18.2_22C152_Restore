@interface SAWSUpdate
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
@end

@implementation SAWSUpdate

+ (id)classDictionaryKey
{
  return @"PAWSUpdate";
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = +[SAWSUpdate classDictionaryKey];
  SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAWSUpdate *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v10 = *__error();
    v11 = _sa_logt();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(SAWSUpdate *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = [v12 UTF8String];
      __int16 v24 = 2048;
      unint64_t v25 = [(SAWSUpdate *)self sizeInBytesForSerializedVersion];
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v10;
    id v13 = [(SAWSUpdate *)self debugDescription];
    char v14 = [v13 UTF8String];
    [(SAWSUpdate *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(983, "%s: size %lu != buffer length %lu", v15, v16, v17, v18, v19, v20, v14);

    _os_crash();
    __break(1u);
LABEL_8:
    id v21 = +[SAException exceptionWithName:@"Encoding failure" reason:@"No buffer or completedSerializationDictionary" userInfo:0];
    objc_exception_throw(v21);
  }
  if (!a3 || !v8) {
    goto LABEL_8;
  }
  *(void *)a3 = 287545748;
  *((void *)a3 + 1) = *(void *)&self->_frameStartTime;
  *((void *)a3 + 2) = *(void *)&self->_deferStartTime;
  *((void *)a3 + 3) = *(void *)&self->_workStartTime;
  *((void *)a3 + 4) = *(void *)&self->_workEndTime;

  return 1;
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 40;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  if (!a3)
  {
    v6 = @"NULL buffer";
    goto LABEL_6;
  }
  if (*(void *)a3 != 287545748)
  {
    v6 = @"Bad SASerializedWSUpdateMagic magic";
LABEL_6:
    id v7 = +[SAException exceptionWithName:@"Decoding failure" reason:v6 userInfo:0];
    objc_exception_throw(v7);
  }
  id result = objc_alloc_init(SAWSUpdate);
  *((void *)result + 1) = *((void *)a3 + 1);
  *((void *)result + 2) = *((void *)a3 + 2);
  *((void *)result + 3) = *((void *)a3 + 3);
  *((void *)result + 4) = *((void *)a3 + 4);
  return result;
}

@end