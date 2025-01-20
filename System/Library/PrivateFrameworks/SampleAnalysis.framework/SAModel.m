@interface SAModel
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSArray)executions;
- (NSArray)loadedChanges;
- (NSString)debugDescription;
- (NSString)identifier;
- (SAModel)initWithIdentifier:(id)a3;
- (unint64_t)maxMemoryCostBytes;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addExecution:(id)a3;
- (void)addLoadedChange:(id)a3;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setMaxMemoryCostBytes:(unint64_t)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAModel

- (SAModel)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAModel;
  v5 = [(SAModel *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    loadedChanges = v5->_loadedChanges;
    v5->_loadedChanges = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    executions = v5->_executions;
    v5->_executions = v10;

    v12 = v5;
  }

  return v5;
}

- (NSArray)loadedChanges
{
  v2 = (void *)[(NSMutableArray *)self->_loadedChanges copy];
  return (NSArray *)v2;
}

- (NSArray)executions
{
  v2 = (void *)[(NSMutableArray *)self->_executions copy];
  return (NSArray *)v2;
}

- (void)addExecution:(id)a3
{
}

- (void)addLoadedChange:(id)a3
{
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  id v4 = [(SAModel *)self identifier];
  v5 = (void *)[v3 initWithFormat:@"Model %@ with %lu load changes, %lu executions", v4, -[NSMutableArray count](self->_loadedChanges, "count"), -[NSMutableArray count](self->_executions, "count")];

  return (NSString *)v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)maxMemoryCostBytes
{
  return self->_maxMemoryCostBytes;
}

- (void)setMaxMemoryCostBytes:(unint64_t)a3
{
  self->_maxMemoryCostBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_executions, 0);
  objc_storeStrong((id *)&self->_loadedChanges, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v7 = a3;
  SAJSONWriteDictionaryFirstEntry(v7, @"identifier", self->_identifier);
  if (self->_maxMemoryCostBytes)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryEntry(v7, @"maxMemoryCostBytes", v4);
  }
  if ([(NSMutableArray *)self->_loadedChanges count])
  {
    v5 = [(SAModel *)self loadedChanges];
    SAJSONWriteDictionaryEntry(v7, @"loadedChanges", v5);
  }
  if ([(NSMutableArray *)self->_executions count])
  {
    uint64_t v6 = [(SAModel *)self executions];
    SAJSONWriteDictionaryEntry(v7, @"executions", v6);
  }
}

+ (id)classDictionaryKey
{
  return @"SAModel";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  uint64_t v3 = [(NSMutableArray *)self->_loadedChanges count];
  return 8 * ([(NSMutableArray *)self->_executions count] + v3) + 26;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([(SAModel *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v15 = *__error();
    v16 = _sa_logt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [(SAModel *)self debugDescription];
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)[v17 UTF8String];
      *(_DWORD *)buf = 136315650;
      v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = [(SAModel *)self sizeInBytesForSerializedVersion];
      __int16 v61 = 2048;
      unint64_t v62 = a4;
      _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v15;
    id v10 = [(SAModel *)self debugDescription];
    id v5 = (id)[v10 UTF8String];
    [(SAModel *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(192, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_identifier, v9);
  *(unint64_t *)((char *)&a3->var2 + 2) = self->_maxMemoryCostBytes;
  id v10 = [(SAModel *)self loadedChanges];
  if ((unint64_t)[v10 count] >= 0xFFFFFFFF)
  {
LABEL_9:
    int v24 = *__error();
    v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v5 = [(SAModel *)self debugDescription];
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)[v5 UTF8String];
      uint64_t v26 = [v10 count];
      *(_DWORD *)buf = 136315394;
      v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = v26;
      _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "%s has %lu loaded changes", buf, 0x16u);
    }
    *__error() = v24;
    self = [(SAModel *)self debugDescription];
    char v27 = [(SAModel *)self UTF8String];
    [v10 count];
    _SASetCrashLogMessage(201, "%s has %lu loaded changes", v28, v29, v30, v31, v32, v33, v27);

    _os_crash();
    __break(1u);
    goto LABEL_12;
  }
  id v5 = [(SAModel *)self executions];
  if ((unint64_t)[v5 count] >= 0xFFFFFFFF)
  {
LABEL_12:
    unint64_t v11 = *__error();
    v34 = _sa_logt();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      id v10 = [(SAModel *)self debugDescription];
      a3 = ($F2866A4E0F716C88DFE0077AFF37461B *)[v10 UTF8String];
      uint64_t v35 = [v5 count];
      *(_DWORD *)buf = 136315394;
      v58 = a3;
      __int16 v59 = 2048;
      unint64_t v60 = v35;
      _os_log_error_impl(&dword_1BF22B000, v34, OS_LOG_TYPE_ERROR, "%s has %lu executions", buf, 0x16u);
    }
    *__error() = v11;
    self = [(SAModel *)self debugDescription];
    a4 = [(SAModel *)self UTF8String];
    [v5 count];
    _SASetCrashLogMessage(204, "%s has %lu executions", v36, v37, v38, v39, v40, v41, a4);

    _os_crash();
    __break(1u);
LABEL_15:
    int v56 = *__error();
    v42 = _sa_logt();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      id v55 = [(SAModel *)self debugDescription];
      uint64_t v43 = [v55 UTF8String];
      uint64_t v44 = [v10 count];
      uint64_t v45 = [v5 count];
      uint64_t v46 = [v5 count];
      *(_DWORD *)buf = 136316162;
      v58 = ($F2866A4E0F716C88DFE0077AFF37461B *)v43;
      __int16 v59 = 2048;
      unint64_t v60 = v44;
      __int16 v61 = 2048;
      unint64_t v62 = v45;
      __int16 v63 = 2048;
      uint64_t v64 = v11 + 8 * v46 - (void)a3;
      __int16 v65 = 2048;
      unint64_t v66 = a4;
      _os_log_error_impl(&dword_1BF22B000, v42, OS_LOG_TYPE_ERROR, "%s: after serializing (with %lu loadedChanges, %lu executions), ended with length %ld, should be %lu", buf, 0x34u);
    }
    *__error() = v56;
    id v47 = [(SAModel *)self debugDescription];
    char v48 = [v47 UTF8String];
    [v10 count];
    [v5 count];
    [v5 count];
    _SASetCrashLogMessage(210, "%s: after serializing (with %lu loadedChanges, %lu executions), ended with length %ld, should be %lu", v49, v50, v51, v52, v53, v54, v48);

    _os_crash();
    __break(1u);
  }
  unint64_t v11 = (unint64_t)&a3->var4 + 8 * [v10 count] + 2;
  if (v11 + 8 * [v5 count] - (void)a3 != a4) {
    goto LABEL_15;
  }
  unsigned int v12 = [v10 count];
  *(_DWORD *)((char *)&a3->var3 + 2) = v12;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 2, v12, v10, v9);
  unsigned int v13 = [v5 count];
  *(_DWORD *)((char *)&a3->var3 + 6) = v13;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((void *)v11, v13, v5, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    [(NSString *)self->_identifier addSelfToSerializationDictionary:v4];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_loadedChanges;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) addSelfToSerializationDictionary:v4];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    unsigned int v12 = self->_executions;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "addSelfToSerializationDictionary:", v4, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v28[5] = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_11;
  }
  if (a4 <= 0x19)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      *(void *)uint64_t v28 = 26;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(240, "bufferLength %lu < serialized SAModel struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 22) + *(_DWORD *)((char *)a3 + 18)) + 26 > a4)
  {
LABEL_8:
    int v14 = *__error();
    uint64_t v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(v5 + 18);
      int v17 = *(_DWORD *)(v5 + 22);
      *(_DWORD *)buf = 134218496;
      unint64_t v26 = a4;
      __int16 v27 = 1024;
      *(_DWORD *)uint64_t v28 = v16;
      v28[2] = 1024;
      *(_DWORD *)&v28[3] = v17;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", buf, 0x18u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(241, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v24 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAModel version" userInfo:0];
    objc_exception_throw(v24);
  }
  id result = objc_alloc_init(SAModel);
  *((void *)result + 4) = *(void *)(v5 + 10);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v47[5] = *MEMORY[0x1E4F143B8];
  id v43 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_13;
  }
  if (a4 <= 0x19)
  {
    int v25 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v45 = a4;
      __int16 v46 = 2048;
      *(void *)id v47 = 26;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct %lu", buf, 0x16u);
    }

    *__error() = v25;
    _SASetCrashLogMessage(254, "bufferLength %lu < serialized SAModel struct %lu", v26, v27, v28, v29, v30, v31, a4);
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 22) + *(_DWORD *)((char *)a3 + 18)) + 26 > a4)
  {
LABEL_10:
    int v32 = *__error();
    uint64_t v33 = _sa_logt();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v34 = *(_DWORD *)((char *)a3 + 18);
      int v35 = *(_DWORD *)((char *)a3 + 22);
      *(_DWORD *)buf = 134218496;
      unint64_t v45 = a4;
      __int16 v46 = 1024;
      *(_DWORD *)id v47 = v34;
      v47[2] = 1024;
      *(_DWORD *)&v47[3] = v35;
      _os_log_error_impl(&dword_1BF22B000, v33, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", buf, 0x18u);
    }

    *__error() = v32;
    _SASetCrashLogMessage(255, "bufferLength %lu < serialized SAModel struct with %u loaded changes and %u executions", v36, v37, v38, v39, v40, v41, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    id v42 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAModel version" userInfo:0];
    objc_exception_throw(v42);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v43, v11, v13);
  int v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v14;

  uint64_t v16 = *(unsigned int *)((char *)a3 + 18);
  int v17 = objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 26, v16, v43, v11, v17);
  uint64_t v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  loadedChanges = self->_loadedChanges;
  self->_loadedChanges = v18;

  uint64_t v20 = (char *)a3 + 8 * *(unsigned int *)((char *)a3 + 18) + 26;
  uint64_t v21 = *(unsigned int *)((char *)a3 + 22);
  uint64_t v22 = objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)v20, v21, v43, v11, v22);
  uint64_t v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  executions = self->_executions;
  self->_executions = v23;
}

@end