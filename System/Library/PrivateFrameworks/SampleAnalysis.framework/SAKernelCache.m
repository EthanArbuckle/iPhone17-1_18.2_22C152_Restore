@interface SAKernelCache
+ (id)classDictionaryKey;
+ (id)kernelCacheWithUUID:(id)a3 loadAddress:(unint64_t)a4;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)_doKernelCachesWork:(uint64_t)a1;
+ (void)clearCaches;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)matchesUUID:(unsigned __int8)a3[16] loadAddress:(unint64_t)a4;
- (NSArray)binaryLoadInfos;
- (NSString)debugDescription;
- (NSUUID)uuid;
- (unint64_t)endAddress;
- (unint64_t)loadAddress;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)startAddress;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setBinaryLoadInfos:(id)a3;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAKernelCache

+ (void)_doKernelCachesWork:(uint64_t)a1
{
  v3 = a2;
  self;
  if (qword_1EB699178 != -1) {
    dispatch_once(&qword_1EB699178, &__block_literal_global_422);
  }
  id v2 = (id)qword_1EB699170;
  objc_sync_enter(v2);
  v3[2](v3, qword_1EB699170);
  objc_sync_exit(v2);
}

void __37__SAKernelCache__doKernelCachesWork___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v1 = (void *)qword_1EB699170;
  qword_1EB699170 = v0;
}

+ (id)kernelCacheWithUUID:(id)a3 loadAddress:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__SAKernelCache_kernelCacheWithUUID_loadAddress___block_invoke;
  v10[3] = &unk_1E63F85E0;
  id v7 = v6;
  v12 = &v14;
  unint64_t v13 = a4;
  id v11 = v7;
  +[SAKernelCache _doKernelCachesWork:]((uint64_t)a1, v10);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __49__SAKernelCache_kernelCacheWithUUID_loadAddress___block_invoke(void *a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v41 = a1;
  v4 = [v3 objectForKeyedSubscript:a1[4]];
  if (!v4)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [v3 setObject:v4 forKeyedSubscript:v41[4]];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ([v10 loadAddress] == v41[6])
        {
          objc_storeStrong((id *)(*(void *)(v41[5] + 8) + 40), v10);
          id v19 = v5;
          goto LABEL_30;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = [SAKernelCache alloc];
  v12 = (void *)v41[4];
  unint64_t v13 = v41[6];
  id v14 = v12;
  if (v11)
  {
    v50.receiver = v11;
    v50.super_class = (Class)SAKernelCache;
    v15 = (SAKernelCache *)objc_msgSendSuper2(&v50, sel_init);
    id v11 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_uuid, v12);
      v11->_loadAddress = v13;
    }
  }

  uint64_t v16 = *(void *)(v41[5] + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v11;

  v18 = [v5 firstObject];
  id v19 = v18;
  if (v18)
  {
    v20 = [v18 binaryLoadInfos];
    if ([v20 count])
    {
      id v38 = v5;
      id v39 = v3;
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v20, "count"));
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v37 = v20;
      obuint64_t j = v20;
      uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v43 != v24) {
              objc_enumerationMutation(obj);
            }
            v26 = *(void **)(*((void *)&v42 + 1) + 8 * j);
            uint64_t v27 = [v26 loadAddress];
            uint64_t v28 = v27 - [v19 loadAddress];
            uint64_t v29 = [*(id *)(*(void *)(v41[5] + 8) + 40) loadAddress] + v28;
            v30 = [v26 segment];

            if (v30)
            {
              v31 = [v26 segment];
              int v32 = [v26 isInKernelAddressSpace];
              v33 = [v26 exclave];
              +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v31, v29, v32, v33);
            }
            else
            {
              v31 = [v26 binary];
              int v34 = [v26 isInKernelAddressSpace];
              v33 = [v26 exclave];
              +[SABinaryLoadInfo binaryLoadInfoWithBinary:loadAddress:isInKernelAddressSpace:exclave:]((uint64_t)SABinaryLoadInfo, v31, v29, v34, v33);
            v35 = };

            [v21 addObject:v35];
          }
          uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
        }
        while (v23);
      }

      v36 = (void *)[v21 copy];
      [*(id *)(*(void *)(v41[5] + 8) + 40) setBinaryLoadInfos:v36];

      id v5 = v38;
      id v3 = v39;
      v20 = v37;
    }
  }
  [v5 addObject:*(void *)(*(void *)(v41[5] + 8) + 40)];
LABEL_30:
}

+ (void)clearCaches
{
}

uint64_t __28__SAKernelCache_clearCaches__block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeAllObjects];
}

- (BOOL)matchesUUID:(unsigned __int8)a3[16] loadAddress:(unint64_t)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_loadAddress != a4) {
    return 0;
  }
  *(void *)uu1 = 0;
  uint64_t v7 = 0;
  [(NSUUID *)self->_uuid getUUIDBytes:uu1];
  return uuid_compare(uu1, a3) == 0;
}

- (unint64_t)startAddress
{
  id v2 = [(NSArray *)self->_binaryLoadInfos firstObject];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 loadAddress];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unint64_t)endAddress
{
  id v2 = [(NSArray *)self->_binaryLoadInfos lastObject];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 length];
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0x10000000;
    }
    unint64_t v6 = v5 + [v3 loadAddress];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (NSString)debugDescription
{
  id v2 = (void *)[[NSString alloc] initWithFormat:@"0x%llx Kernel cache <%@> (%lu binaries)", self->_loadAddress, self->_uuid, -[NSArray count](self->_binaryLoadInfos, "count")];
  return (NSString *)v2;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)binaryLoadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBinaryLoadInfos:(id)a3
{
}

- (unint64_t)loadAddress
{
  return self->_loadAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryLoadInfos, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(NSUUID *)self->_uuid UUIDString];
  SAJSONWriteDictionaryFirstEntry(v6, @"uuid", v4);

  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_loadAddress];
  SAJSONWriteDictionaryEntry(v6, @"loadAddress", v5);

  if (self->_binaryLoadInfos)
  {
    [v6 appendString:@",\"binaryLoadInfos\":"];
    SAJSONWriteArray(v6, self->_binaryLoadInfos);
  }
}

+ (id)classDictionaryKey
{
  return @"SAKernelCache";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * [(NSArray *)self->_binaryLoadInfos count] + 28;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  *(_WORD *)&a3->var0 = 257;
  *(void *)(&a3->var3 + 1) = self->_loadAddress;
  [(NSUUID *)self->_uuid getUUIDBytes:a3->var2];
  if ([(SAKernelCache *)self sizeInBytesForSerializedVersion] == a4)
  {
    if ([(NSArray *)self->_binaryLoadInfos count] < 0xFFFF)
    {
      unsigned __int16 v10 = [(NSArray *)self->_binaryLoadInfos count];
      a3->var3 = v10;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 4, v10, self->_binaryLoadInfos, v9);
      goto LABEL_8;
    }
    v12 = *__error();
    uint64_t v16 = _sa_logt();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [(SAKernelCache *)self debugDescription];
      *(_DWORD *)buf = 136315394;
      unint64_t v33 = [v17 UTF8String];
      __int16 v34 = 1024;
      LODWORD(v35) = 0xFFFF;
      _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "%s: more than %d binaries", buf, 0x12u);
    }
    *__error() = (int)v12;
    id v18 = [(SAKernelCache *)self debugDescription];
    char v19 = [v18 UTF8String];
    _SASetCrashLogMessage(5361, "%s: more than %d binaries", v20, v21, v22, v23, v24, v25, v19);

    id v11 = _os_crash();
    __break(1u);
LABEL_12:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v33 = a4;
      __int16 v34 = 2048;
      uint64_t v35 = 28;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "bufferLength %lu != serialized SAKernelCache struct %lu", buf, 0x16u);
    }

    *__error() = v5;
    _SASetCrashLogMessage(5367, "bufferLength %lu != serialized SAKernelCache struct %lu", v26, v27, v28, v29, v30, v31, a4);
    _os_crash();
    __break(1u);
  }
  int v5 = *__error();
  id v11 = _sa_logt();
  v12 = v11;
  if (a4 != 28) {
    goto LABEL_12;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v13 = [(SAKernelCache *)self debugDescription];
    NSUInteger v14 = [(NSArray *)self->_binaryLoadInfos count];
    *(_DWORD *)buf = 138412546;
    unint64_t v33 = (unint64_t)v13;
    __int16 v34 = 2048;
    uint64_t v35 = v14;
    _os_log_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_DEFAULT, "WARNING: SAKernelCache %@ got its %lu binaries after starting serialization!", buf, 0x16u);
  }
  *__error() = v5;
  a3->var3 = 0;
LABEL_8:

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_binaryLoadInfos;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v29[13] = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_11;
  }
  if (a4 <= 0x1B)
  {
    int v9 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      *(void *)uint64_t v29 = 28;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct %lu", buf, 0x16u);
    }

    *__error() = v9;
    _SASetCrashLogMessage(5390, "bufferLength %lu < serialized SAKernelCache struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_8:
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(unsigned __int16 *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      unint64_t v27 = a4;
      __int16 v28 = 1024;
      *(_DWORD *)uint64_t v29 = v18;
      v29[2] = 2048;
      *(void *)&v29[3] = 8 * v18 + 28;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5391, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", v19, v20, v21, v22, v23, v24, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v25 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAKernelCache version" userInfo:0];
    objc_exception_throw(v25);
  }
  BOOL v6 = uuidForBytes((uint64_t)a3 + 2);
  uint64_t v7 = +[SAKernelCache kernelCacheWithUUID:v6 loadAddress:*(void *)(v5 + 20)];

  return v7;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v38[13] = *MEMORY[0x1E4F143B8];
  id v34 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_16;
  }
  if (a4 <= 0x1B)
  {
    int v17 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v36 = a4;
      __int16 v37 = 2048;
      *(void *)id v38 = 28;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct %lu", buf, 0x16u);
    }

    *__error() = v17;
    _SASetCrashLogMessage(5405, "bufferLength %lu < serialized SAKernelCache struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 9) + 28 > a4)
  {
LABEL_13:
    int v24 = *__error();
    id v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *((unsigned __int16 *)a3 + 9);
      *(_DWORD *)buf = 134218496;
      unint64_t v36 = a4;
      __int16 v37 = 1024;
      *(_DWORD *)id v38 = v26;
      v38[2] = 2048;
      *(void *)&v38[3] = 8 * v26 + 28;
      _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", buf, 0x1Cu);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5406, "bufferLength %lu < serialized SAKernelCache struct plus %u load infos %lu", v27, v28, v29, v30, v31, v32, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    id v33 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAInstruction version" userInfo:0];
    objc_exception_throw(v33);
  }
  uint64_t v11 = v10;
  if (![(NSArray *)self->_binaryLoadInfos count])
  {
    uint64_t v12 = *((unsigned __int16 *)a3 + 9);
    if (*((_WORD *)a3 + 9))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 28, v12, v34, v11, v13);
      uint64_t v15 = (NSArray *)[v14 copy];
      binaryLoadInfos = self->_binaryLoadInfos;
      self->_binaryLoadInfos = v15;
    }
  }
}

@end