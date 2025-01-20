@interface SAExclave
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)synthetic;
- (BOOL)unslid;
- (NSArray)loadInfos;
- (NSString)debugDescription;
- (NSString)name;
- (uint64_t)enumerateFrames:(uint64_t)a1;
- (uint64_t)fixupFrameInstructionsWithNewInstructions:(unsigned char *)a3 foundNewBinaryInfo:;
- (unint64_t)identifier;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)fillInName:(void *)a3 textLayout:;
- (void)initWithIdentifier:(void *)a1;
- (void)initWithKCData:(void *)a3 name:(void *)a4 textLayout:;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAExclave

- (void)initWithIdentifier:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)SAExclave;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[2] = a2;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v6 = (void *)v4[5];
    v4[5] = v5;
  }
  return v4;
}

- (void)initWithKCData:(void *)a3 name:(void *)a4 textLayout:
{
  id v7 = a4;
  if (a1)
  {
    objc_super v8 = -[SAExclave initWithIdentifier:](a1, *a2);
    a1 = v8;
    if (v8) {
      -[SAExclave fillInName:textLayout:]((uint64_t)v8, a3, v7);
    }
  }

  return a1;
}

- (void)fillInName:(void *)a3 textLayout:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  if (a1)
  {
    if (a2 && !*(void *)(a1 + 8))
    {
      uint64_t v7 = SANSStringForCString(a2);
      objc_super v8 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v7;
    }
    if (v6)
    {
      unint64_t v9 = objc_msgSend(objc_getProperty(v6, v5, 16, 1), "count");
      if (v9 > [*(id *)(a1 + 24) count])
      {
        *(void *)(a1 + 32) = *(void *)(v6[1] + 8);
        if (objc_msgSend(objc_getProperty(v6, v10, 16, 1), "count"))
        {
          id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
          v13 = objc_msgSend(v11, "initWithCapacity:", objc_msgSend(objc_getProperty(v6, v12, 16, 1), "count"));
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          v30 = v6;
          id obj = objc_getProperty(v6, v14, 16, 1);
          uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v33;
            do
            {
              uint64_t v18 = 0;
              do
              {
                if (*(void *)v33 != v17) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v18);
                if (v19)
                {
                  uint64_t v20 = *(void *)(v19 + 8);
                  uint64_t v21 = v20 + 16;
                }
                else
                {
                  uint64_t v20 = 0;
                  uint64_t v21 = 16;
                }
                uint64_t v22 = *(void *)v21;
                v23 = uuidForBytes(v20);
                v24 = +[SABinary binaryWithUUID:v23 absolutePath:0];
                v25 = -[SABinary segmentWithCleanName:](v24, @"__TEXT");
                if (!v25)
                {
                  v25 = +[SASegment segmentWithBinary:name:length:]((uint64_t)SASegment, v24, @"__TEXT", 0);
                  -[SABinary addSegment:](v24, v25);
                }
                v26 = +[SABinaryLoadInfo binaryLoadInfoWithSegment:loadAddress:isInKernelAddressSpace:exclave:](SABinaryLoadInfo, v25, v22, 1, (void *)a1);
                [v13 addObject:v26];

                ++v18;
              }
              while (v16 != v18);
              uint64_t v27 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
              uint64_t v16 = v27;
            }
            while (v27);
          }

          +[SABinaryLoadInfo sortBinaryLoadInfos:]((uint64_t)SABinaryLoadInfo, v13);
          uint64_t v28 = [v13 copy];
          v29 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v28;

          v6 = v30;
        }
      }
    }
  }
}

- (BOOL)synthetic
{
  return self->_textlayout_flags & 1;
}

- (BOOL)unslid
{
  return (LOBYTE(self->_textlayout_flags) >> 1) & 1;
}

- (uint64_t)enumerateFrames:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    if (v4) {
      +[SAFrame enumerateFrameTree:block:]((uint64_t)SAFrame, v4, v3);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (uint64_t)fixupFrameInstructionsWithNewInstructions:(unsigned char *)a3 foundNewBinaryInfo:
{
  id v5 = a2;
  if (a1)
  {
    if (a3) {
      *a3 = 0;
    }
    v6 = *(void **)(a1 + 40);
    if (v6) {
      +[SAFrame fixupLoadInfosInFrameTree:binaryLoadInfos:libraryCache:uuidsWithNewInstructions:]((uint64_t)SAFrame, v6, *(void **)(a1 + 24), 0, v5);
    }
  }
  return MEMORY[0x1F4181878]();
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  unint64_t v4 = [(SAExclave *)self identifier];
  id v5 = [(SAExclave *)self name];
  v6 = (void *)[v3 initWithFormat:@"exclave 0x%llx %@", v4, v5];

  return (NSString *)v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSArray)loadInfos
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootFrames, 0);
  objc_storeStrong((id *)&self->_loadInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)classDictionaryKey
{
  return @"SAExclave";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  v2 = self;
  if (self) {
    self = (SAExclave *)objc_getProperty(self, a2, 40, 1);
  }
  uint64_t v3 = [(SAExclave *)self count];
  unint64_t v4 = [(SAExclave *)v2 loadInfos];
  unint64_t v5 = 8 * ([v4 count] + v3) + 34;

  return v5;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if ([(SAExclave *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(SAExclave *)self debugDescription];
      a3 = ($D4B2CDE5810726702A84729949394ECB *)[v18 UTF8String];
      *(_DWORD *)buf = 136315650;
      v46 = a3;
      __int16 v47 = 2048;
      unint64_t v48 = [(SAExclave *)self sizeInBytesForSerializedVersion];
      __int16 v49 = 2048;
      unint64_t v50 = a4;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v16;
    id v19 = [(SAExclave *)self debugDescription];
    id v5 = (id)[v19 UTF8String];
    [(SAExclave *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(327, "%s: size %lu != buffer length %lu", v20, v21, v22, v23, v24, v25, (char)v5);

    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  *(_WORD *)&a3->var0 = 257;
  v10 = [(SAExclave *)self name];
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(v10, v9);

  *(unint64_t *)((char *)&a3->var2 + 2) = [(SAExclave *)self identifier];
  if (!self) {
    goto LABEL_16;
  }
  *(unint64_t *)((char *)&a3->var3 + 2) = self->_textlayout_flags;
  for (id i = objc_getProperty(self, v11, 40, 1); ; id i = 0)
  {
    a4 = (unint64_t)i;
    if ((unint64_t)[(id)a4 count] >= 0xFFFFFFFF)
    {
LABEL_10:
      int v26 = *__error();
      uint64_t v27 = _sa_logt();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v5 = [(SAExclave *)self debugDescription];
        a3 = ($D4B2CDE5810726702A84729949394ECB *)[v5 UTF8String];
        uint64_t v28 = [(id)a4 count];
        *(_DWORD *)buf = 136315394;
        v46 = a3;
        __int16 v47 = 2048;
        unint64_t v48 = v28;
        _os_log_error_impl(&dword_1BF22B000, v27, OS_LOG_TYPE_ERROR, "%s: %lu rootFrames", buf, 0x16u);
      }
      *__error() = v26;
      self = [(SAExclave *)self debugDescription];
      id v9 = (id)[(SAExclave *)self UTF8String];
      [(id)a4 count];
      _SASetCrashLogMessage(337, "%s: %lu rootFrames", v29, v30, v31, v32, v33, v34, (char)v9);

      _os_crash();
      __break(1u);
      goto LABEL_13;
    }
    unsigned int v13 = [(id)a4 count];
    *(_DWORD *)((char *)&a3->var4 + 2) = v13;
    SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var5 + 2, v13, (void *)a4, v9);
    id v5 = [(SAExclave *)self loadInfos];
    if ((unint64_t)[v5 count] < 0xFFFFFFFF) {
      break;
    }
LABEL_13:
    int v35 = *__error();
    v36 = _sa_logt();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(SAExclave *)self debugDescription];
      a3 = ($D4B2CDE5810726702A84729949394ECB *)[v9 UTF8String];
      uint64_t v37 = [v5 count];
      *(_DWORD *)buf = 136315394;
      v46 = a3;
      __int16 v47 = 2048;
      unint64_t v48 = v37;
      _os_log_error_impl(&dword_1BF22B000, v36, OS_LOG_TYPE_ERROR, "%s: %lu loadInfos", buf, 0x16u);
    }
    *__error() = v35;
    self = [(SAExclave *)self debugDescription];
    char v38 = [(SAExclave *)self UTF8String];
    [v5 count];
    _SASetCrashLogMessage(343, "%s: %lu loadInfos", v39, v40, v41, v42, v43, v44, v38);

    _os_crash();
    __break(1u);
LABEL_16:
    *(unint64_t *)((char *)&a3->var3 + 2) = 0;
  }
  unsigned int v14 = [v5 count];
  *(_DWORD *)((char *)&a3->var4 + 6) = v14;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var5 + 8 * *(unsigned int *)((char *)&a3->var4 + 2) + 2, v14, v5, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    uint64_t v7 = [(SAExclave *)self name];
    [v7 addSelfToSerializationDictionary:v4];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    if (self) {
      id Property = objc_getProperty(self, v8, 40, 1);
    }
    else {
      id Property = 0;
    }
    id v10 = Property;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * v14++) addSelfToSerializationDictionary:v4];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v12);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v15 = [(SAExclave *)self loadInfos];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v19++) addSelfToSerializationDictionary:v4];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
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
    objc_super v8 = _sa_logt();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v17 = a4;
      __int16 v18 = 2048;
      uint64_t v19 = 34;
      _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclave struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(372, "bufferLength %lu < serialized SAExclave struct %lu", v9, v10, v11, v12, v13, v14, a4);
    _os_crash();
    __break(1u);
LABEL_7:
    id v15 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAExclave version" userInfo:0];
    objc_exception_throw(v15);
  }
  id result = objc_alloc_init(SAExclave);
  *((void *)result + 2) = *(void *)((char *)a3 + 10);
  *((void *)result + 4) = *(void *)((char *)a3 + 18);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v49[5] = *MEMORY[0x1E4F143B8];
  id v45 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_13;
  }
  if (a4 <= 0x21)
  {
    int v27 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v47 = a4;
      __int16 v48 = 2048;
      *(void *)__int16 v49 = 34;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclave struct %lu", buf, 0x16u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(387, "bufferLength %lu < serialized SAExclave struct %lu", v28, v29, v30, v31, v32, v33, a4);
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  if (8 * (unint64_t)(*(_DWORD *)((char *)a3 + 30) + *(_DWORD *)((char *)a3 + 26)) + 34 > a4)
  {
LABEL_10:
    int v34 = *__error();
    int v35 = _sa_logt();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v36 = *(_DWORD *)((char *)a3 + 26);
      int v37 = *(_DWORD *)((char *)a3 + 30);
      *(_DWORD *)buf = 134218496;
      unint64_t v47 = a4;
      __int16 v48 = 1024;
      *(_DWORD *)__int16 v49 = v36;
      v49[2] = 1024;
      *(_DWORD *)&v49[3] = v37;
      _os_log_error_impl(&dword_1BF22B000, v35, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAExclave struct with %u root frames, %u image infos", buf, 0x18u);
    }

    *__error() = v34;
    _SASetCrashLogMessage(389, "bufferLength %lu < serialized SAExclave struct with %u root frames, %u image infos", v38, v39, v40, v41, v42, v43, a4);
    _os_crash();
    __break(1u);
LABEL_13:
    id v44 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAExclave version" userInfo:0];
    objc_exception_throw(v44);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v45, v11, v13, 0);
  uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v14;

  uint64_t v16 = (char *)a3 + 34;
  unint64_t v17 = (char *)a3 + 8 * *(unsigned int *)((char *)a3 + 26) + 34;
  uint64_t v18 = *(unsigned int *)((char *)a3 + 30);
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = SASerializableNewMutableArrayFromIndexList((uint64_t)v17, v18, v45, v11, v19);
  long long v21 = (NSArray *)[v20 copy];
  loadInfos = self->_loadInfos;
  self->_loadInfos = v21;

  uint64_t v23 = *(unsigned int *)((char *)a3 + 26);
  long long v24 = objc_opt_class();
  SASerializableNewMutableSetFromIndexList((uint64_t)v16, v23, v45, v11, v24);
  long long v25 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  rootFrames = self->_rootFrames;
  self->_rootFrames = v25;
}

@end