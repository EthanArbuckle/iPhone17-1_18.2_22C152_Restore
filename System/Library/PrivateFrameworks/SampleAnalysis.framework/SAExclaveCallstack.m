@interface SAExclaveCallstack
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSString)debugDescription;
- (id)initWithExclave:(void *)a3 leafFrame:;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAExclaveCallstack

- (id)initWithExclave:(void *)a3 leafFrame:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SAExclaveCallstack;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (NSString)debugDescription
{
  id v4 = [NSString alloc];
  if (self) {
    id Property = objc_getProperty(self, v3, 8, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property debugDescription];
  if (self) {
    id v8 = objc_getProperty(self, v6, 16, 1);
  }
  else {
    id v8 = 0;
  }
  v9 = [v8 debugDescription];
  objc_super v10 = (void *)[v4 initWithFormat:@"%@ callstack with leaf %@", v7, v9];

  return (NSString *)v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leafFrame, 0);
  objc_storeStrong((id *)&self->_exclave, 0);
}

+ (id)classDictionaryKey
{
  return @"SAExclaveCallstack";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 34;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAExclaveCallstack *)self sizeInBytesForSerializedVersion] == a4)
  {
    *(_WORD *)&a3->var0 = 257;
    if (self)
    {
      id Property = objc_getProperty(self, v9, 8, 1);
      *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(Property, v8);
      id v12 = objc_getProperty(self, v11, 16, 1);
      goto LABEL_4;
    }
  }
  else
  {
    int v15 = *__error();
    v16 = _sa_logt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [(SAExclaveCallstack *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = [v17 UTF8String];
      __int16 v27 = 2048;
      unint64_t v28 = [(SAExclaveCallstack *)self sizeInBytesForSerializedVersion];
      __int16 v29 = 2048;
      unint64_t v30 = a4;
      _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v15;
    a3 = [(SAExclaveCallstack *)self debugDescription];
    id v8 = (id)[($93CF9441C607C7AF89C984194EE6CD4E *)a3 UTF8String];
    [(SAExclaveCallstack *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(430, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, (char)v8);

    _os_crash();
    __break(1u);
  }
  uint64_t v24 = SASerializableIndexForPointerFromSerializationDictionary(0, v8);
  id v12 = 0;
  *(void *)(&a3->var1 + 1) = v24;
LABEL_4:
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);
  if (self)
  {
    *(unint64_t *)((char *)&a3->var3 + 2) = self->_threadNumericID;
    unint64_t invocationID = self->_invocationID;
  }
  else
  {
    unint64_t invocationID = 0;
    *(unint64_t *)((char *)&a3->var3 + 2) = 0;
  }
  *(unint64_t *)((char *)&a3->var4 + 2) = invocationID;

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v9 = a3;
  id v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v9, self, v4);

  if (v5)
  {
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v6, 8, 1), "addSelfToSerializationDictionary:", v9);
      id Property = objc_getProperty(self, v7, 16, 1);
    }
    else
    {
      [0 addSelfToSerializationDictionary:v9];
      id Property = 0;
    }
    [Property addSelfToSerializationDictionary:v9];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
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
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(457, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAExclaveCallstack version" userInfo:0];
    objc_exception_throw(v15);
  }
  id result = objc_alloc_init(SAExclaveCallstack);
  *((void *)result + 3) = *(void *)((char *)a3 + 18);
  *((void *)result + 4) = *(void *)((char *)a3 + 26);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v29 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_9;
  }
  if (a4 <= 0x21)
  {
    int v20 = *__error();
    uint64_t v21 = _sa_logt();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = 34;
      _os_log_error_impl(&dword_1BF22B000, v21, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(472, "bufferLength %lu < serialized SAExclaveCallstack struct %lu", v22, v23, v24, v25, v26, v27, a4);
    _os_crash();
    __break(1u);
LABEL_9:
    id v28 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAExclaveCallstack version" userInfo:0];
    objc_exception_throw(v28);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v29, v11, v13);
  uint64_t v14 = (SAExclave *)objc_claimAutoreleasedReturnValue();
  exclave = self->_exclave;
  self->_exclave = v14;

  unint64_t v16 = *(void *)((char *)a3 + 10);
  unint64_t v17 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v29, v11, v17, 0);
  __int16 v18 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafFrame = self->_leafFrame;
  self->_leafFrame = v18;
}

@end