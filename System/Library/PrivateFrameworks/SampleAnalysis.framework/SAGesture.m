@interface SAGesture
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (void)parseKTrace:(char)a3 embedded:(void *)a4 findingGestureAndHIDEvents:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (NSString)debugDescription;
- (SAGesture)initWithPid:(int)a3 type:(id)a4 startTime:(id)a5;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAGesture

- (SAGesture)initWithPid:(int)a3 type:(id)a4 startTime:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SAGesture;
  v11 = [(SAGesture *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_pid = a3;
    objc_storeStrong((id *)&v11->_gestureType, a4);
    v13 = objc_alloc_init(SATimeRange);
    timeRange = v12->_timeRange;
    v12->_timeRange = v13;

    v16 = v12->_timeRange;
    if (v16) {
      objc_setProperty_atomic(v16, v15, v10, 8);
    }
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hidEvents = v12->_hidEvents;
    v12->_hidEvents = v17;
  }
  return v12;
}

+ (void)parseKTrace:(char)a3 embedded:(void *)a4 findingGestureAndHIDEvents:
{
  id v6 = a4;
  self;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = objc_opt_class();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke;
  v15[3] = &unk_1E63FA098;
  char v18 = a3;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  id v17 = v10;
  [v8 parseKTrace:a2 findingHIDEvents:v15];
  id v14 = v9;
  ktrace_events_range();
  v13 = v10;
  id v11 = v10;
  id v12 = v14;
  ktrace_events_range();
}

void __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_5;
  }
  if ([v3 hidEventType] != 11) {
    goto LABEL_5;
  }
  v4 = *(void **)(a1 + 32);
  v5 = NSNumber;
  id v6 = [v10 steps];
  id v7 = [v6 lastObject];
  v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "pid"));
  id v9 = [v4 objectForKeyedSubscript:v8];

  if (v9)
  {
    [v9[1] addObject:v10];
  }
  else
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t pid_for_thread = *(unsigned int *)(a2 + 88);
  if ((pid_for_thread & 0x80000000) != 0) {
    uint64_t pid_for_thread = ktrace_get_pid_for_thread();
  }
  v5 = [SAGesture alloc];
  id v6 = +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
  id v9 = [(SAGesture *)v5 initWithPid:pid_for_thread type:@"Scroll View Drag" startTime:v6];

  id v7 = *(void **)(a1 + 32);
  v8 = [NSNumber numberWithInt:pid_for_thread];
  [v7 setObject:v9 forKeyedSubscript:v8];
}

void __61__SAGesture_parseKTrace_embedded_findingGestureAndHIDEvents___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t pid_for_thread = *(unsigned int *)(a2 + 88);
  if ((pid_for_thread & 0x80000000) != 0) {
    uint64_t pid_for_thread = ktrace_get_pid_for_thread();
  }
  v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithInt:pid_for_thread];
  self = [v5 objectForKeyedSubscript:v6];

  id v7 = self;
  if (self)
  {
    v8 = +[SATimestamp timestampWithKTraceEvent:fromSession:]((uint64_t)SATimestamp, a2);
    id Property = objc_getProperty(self, v9, 32, 1);
    if (Property) {
      objc_setProperty_atomic(Property, v11, v8, 16);
    }

    id v12 = *(void **)(a1 + 32);
    v13 = [NSNumber numberWithInt:pid_for_thread];
    [v12 setObject:0 forKeyedSubscript:v13];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v7 = self;
  }
}

- (NSString)debugDescription
{
  id v4 = [NSString alloc];
  if (self)
  {
    id v5 = objc_getProperty(self, v3, 24, 1);
    id Property = objc_getProperty(self, v6, 32, 1);
  }
  else
  {
    id v5 = 0;
    id Property = 0;
  }
  id v8 = Property;
  id v10 = [v8 debugDescription];
  if (self) {
    id v11 = objc_getProperty(self, v9, 8, 1);
  }
  else {
    id v11 = 0;
  }
  id v12 = (void *)[v4 initWithFormat:@"%@ %@ (%lu hid events)", v5, v10, objc_msgSend(v11, "count")];

  return (NSString *)v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_gestureType, 0);
  objc_storeStrong((id *)&self->_hidEvents, 0);
}

+ (id)classDictionaryKey
{
  return @"SAGesture";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * [(NSMutableArray *)self->_hidEvents count] + 24;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAGesture *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v11 = *__error();
    id v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SAGesture *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v33 = [v13 UTF8String];
      __int16 v34 = 2048;
      unint64_t v35 = [(SAGesture *)self sizeInBytesForSerializedVersion];
      __int16 v36 = 2048;
      unint64_t v37 = a4;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v11;
    id v14 = [(SAGesture *)self debugDescription];
    char v15 = [v14 UTF8String];
    [(SAGesture *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(932, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
LABEL_7:
    int v22 = *__error();
    v23 = _sa_logt();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = [(NSMutableArray *)self->_hidEvents count];
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v24;
      _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "gesture with %lu hid events", buf, 0xCu);
    }

    *__error() = v22;
    char v25 = [(NSMutableArray *)self->_hidEvents count];
    _SASetCrashLogMessage(941, "gesture with %lu hid events", v26, v27, v28, v29, v30, v31, v25);
    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 257;
  *(_DWORD *)(&a3->var1 + 1) = self->_pid;
  *(void *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_gestureType, v8);
  *(unint64_t *)((char *)&a3->var3 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_timeRange, v8);
  if ((unint64_t)[(NSMutableArray *)self->_hidEvents count] >= 0xFFFF) {
    goto LABEL_7;
  }
  unsigned __int16 v9 = [(NSMutableArray *)self->_hidEvents count];
  HIWORD(a3->var4) = v9;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var5, v9, self->_hidEvents, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    [(SATimeRange *)self->_timeRange addSelfToSerializationDictionary:v4];
    [(NSString *)self->_gestureType addSelfToSerializationDictionary:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = self->_hidEvents;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v27[13] = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_11;
  }
  if (a4 <= 0x17)
  {
    int v7 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v25 = a4;
      __int16 v26 = 2048;
      *(void *)uint64_t v27 = 24;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(966, "bufferLength %lu < serialized SAGesture struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 11) + 24 > a4)
  {
LABEL_8:
    int v14 = *__error();
    long long v15 = _sa_logt();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(unsigned __int16 *)(v5 + 22);
      *(_DWORD *)buf = 134218496;
      unint64_t v25 = a4;
      __int16 v26 = 1024;
      *(_DWORD *)uint64_t v27 = v16;
      v27[2] = 2048;
      *(void *)&v27[3] = 8 * v16 + 24;
      _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v14;
    _SASetCrashLogMessage(967, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    id v23 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAGesture version" userInfo:0];
    objc_exception_throw(v23);
  }
  id result = objc_alloc_init((Class)objc_opt_class());
  *((_DWORD *)result + 4) = *(_DWORD *)(v5 + 2);
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  *(void *)&v44[13] = *MEMORY[0x1E4F143B8];
  id v40 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 2u) {
    goto LABEL_16;
  }
  if (a4 <= 0x17)
  {
    int v23 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v42 = a4;
      __int16 v43 = 2048;
      *(void *)v44 = 24;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct %lu", buf, 0x16u);
    }

    *__error() = v23;
    _SASetCrashLogMessage(980, "bufferLength %lu < serialized SAGesture struct %lu", v24, v25, v26, v27, v28, v29, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (8 * (unint64_t)*((unsigned __int16 *)a3 + 11) + 24 > a4)
  {
LABEL_13:
    int v30 = *__error();
    uint64_t v31 = _sa_logt();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = *((unsigned __int16 *)a3 + 11);
      *(_DWORD *)buf = 134218496;
      unint64_t v42 = a4;
      __int16 v43 = 1024;
      *(_DWORD *)v44 = v32;
      v44[2] = 2048;
      *(void *)&v44[3] = 8 * v32 + 24;
      _os_log_error_impl(&dword_1BF22B000, v31, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v30;
    _SASetCrashLogMessage(981, "bufferLength %lu < serialized SAGesture struct plus %u children %lu", v33, v34, v35, v36, v37, v38, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    id v39 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAGesture version" userInfo:0];
    objc_exception_throw(v39);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 14);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v40, v11, v13);
  int v14 = (SATimeRange *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  self->_timeRange = v14;

  unint64_t v16 = *(void *)((char *)a3 + 6);
  uint64_t v17 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v40, v11, v17);
  uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  gestureType = self->_gestureType;
  self->_gestureType = v18;

  objc_opt_class();
  if (*(uint64_t *)gSASerializationEncodedVersionBeingDecoded() <= 33
    && *(unsigned char *)gSASerializationEncodedDataIsEmbedded())
  {
    uint64_t v20 = objc_opt_class();
  }
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 24, *((unsigned __int16 *)a3 + 11), v40, v11, v20);
  uint64_t v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  hidEvents = self->_hidEvents;
  self->_hidEvents = v21;
}

@end