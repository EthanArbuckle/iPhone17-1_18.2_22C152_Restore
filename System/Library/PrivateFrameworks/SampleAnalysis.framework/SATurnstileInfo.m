@interface SATurnstileInfo
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)turnstileInfoWithKCDataTurnstileInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (SATurnstileInfo)init;
- (SATurnstileInfo)initWithKCDataTurnstileInfo:(const stackshot_thread_turnstileinfo_v2 *)a3;
- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 threadPriority:(int)a5 options:(unint64_t)a6 nameCallback:(id)a7;
- (int)blockingPid;
- (int64_t)compare:(id)a3;
- (uint64_t)_displaysContentForPid:(uint64_t)a3 tid:(int)a4 threadPriority:(char)a5 options:(void *)a6 displayString:(void *)a7 nameCallback:;
- (uint64_t)displaysSameContentAs:(uint64_t)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:;
- (uint64_t)matchesKCDataTurnstileInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:;
- (unint64_t)blockingTid;
- (unint64_t)context;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unsigned)numHops;
- (unsigned)priority;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SATurnstileInfo

- (SATurnstileInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)SATurnstileInfo;
  return (SATurnstileInfo *)[(SABlockingInfo *)&v3 _init];
}

- (SATurnstileInfo)initWithKCDataTurnstileInfo:(const stackshot_thread_turnstileinfo_v2 *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SATurnstileInfo;
  result = [(SABlockingInfo *)&v5 _init];
  if (result)
  {
    result->_context = a3->turnstile_context;
    result->_priority = a3->turnstile_priority;
    result->_numHops = a3->number_of_hops;
    result->_flags = a3->turnstile_flags;
  }
  return result;
}

+ (id)turnstileInfoWithKCDataTurnstileInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (objc_class *)self;
  if (v9)
  {
    v11 = [SATurnstileInfoWithPortLabel alloc];
    id v12 = v9;
    if (v11)
    {
      v20.receiver = v11;
      v20.super_class = (Class)SATurnstileInfoWithPortLabel;
      v13 = (id *)objc_msgSendSuper2(&v20, sel_initWithKCDataTurnstileInfo_, a2);
      uint64_t v14 = (uint64_t)v13;
      if (v13)
      {
        objc_storeStrong(v13 + 4, a3);
        if (a4 >= 0x10000)
        {
          int v16 = *__error();
          v17 = _sa_logt();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a4;
            _os_log_fault_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_FAULT, "port label flags 0x%llx is too large", buf, 0xCu);
          }

          *__error() = v16;
        }
        *(_WORD *)(v14 + 40) = a4;
        if (a5 >= 0x100)
        {
          int v18 = *__error();
          v19 = _sa_logt();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a5;
            _os_log_fault_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_FAULT, "port label domain %llu is too large", buf, 0xCu);
          }

          *__error() = v18;
        }
        *(unsigned char *)(v14 + 42) = a5;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = [[v10 alloc] initWithKCDataTurnstileInfo:a2];
  }

  return (id)v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SATurnstileInfo *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_super v5 = v4;
      BOOL v6 = self->_context == v5->_context
        && self->_priority == v5->_priority
        && self->_numHops == v5->_numHops
        && self->_flags == v5->_flags;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (int64_t)compare:(id)a3
{
  v4 = a3;
  unint64_t context = self->_context;
  unint64_t v6 = v4[2];
  if (context > v6) {
    goto LABEL_9;
  }
  if (context < v6) {
    goto LABEL_7;
  }
  unsigned int priority = self->_priority;
  unsigned int v8 = *((unsigned __int8 *)v4 + 8);
  if (priority > v8) {
    goto LABEL_9;
  }
  if (priority < v8)
  {
LABEL_7:
    int64_t v11 = -1;
    goto LABEL_10;
  }
  unsigned int numHops = self->_numHops;
  unsigned int v10 = *((unsigned __int8 *)v4 + 9);
  if (numHops > v10) {
    goto LABEL_9;
  }
  if (numHops < v10) {
    goto LABEL_7;
  }
  unint64_t flags = self->_flags;
  unint64_t v13 = v4[3];
  if (flags > v13)
  {
LABEL_9:
    int64_t v11 = 1;
    goto LABEL_10;
  }
  if (flags >= v13) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = -1;
  }
LABEL_10:

  return v11;
}

- (uint64_t)matchesKCDataTurnstileInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:
{
  unint64_t v9 = a3;
  if (a1
    && *(void *)(a1 + 16) == *(void *)(a2 + 8)
    && *(unsigned __int8 *)(a1 + 8) == *(unsigned __int8 *)(a2 + 16)
    && *(unsigned __int8 *)(a1 + 9) == *(unsigned __int8 *)(a2 + 17)
    && *(void *)(a1 + 24) == *(void *)(a2 + 18)
    && [(id)a1 portDomain] == a5
    && [(id)a1 portFlags] == a4)
  {
    uint64_t v10 = [(id)a1 portName];
    if (v9 | v10)
    {
      uint64_t v11 = [(id)a1 portName];
      id v12 = (void *)v11;
      uint64_t v13 = 0;
      if (v9 && v11)
      {
        uint64_t v14 = [(id)a1 portName];
        uint64_t v13 = [v14 isEqualToString:v9];
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_context ^ self->_priority ^ self->_numHops ^ self->_flags;
}

- (NSString)debugDescription
{
  objc_super v3 = [(SABlockingInfo *)self portName];

  id v4 = [NSString alloc];
  objc_super v5 = v4;
  unint64_t context = self->_context;
  uint64_t priority = self->_priority;
  uint64_t numHops = self->_numHops;
  unint64_t flags = self->_flags;
  if (v3)
  {
    uint64_t v10 = [(SABlockingInfo *)self portName];
    uint64_t v11 = (void *)[v5 initWithFormat:@"turnstile blocked on 0x%llx at priority %d, %d hops, 0x%llx flags, port name:%@, flags:0x%llx, domain:%llu", context, priority, numHops, flags, v10, -[SABlockingInfo portFlags](self, "portFlags"), -[SABlockingInfo portDomain](self, "portDomain")];
  }
  else
  {
    uint64_t v11 = (void *)[v4 initWithFormat:@"turnstile blocked on 0x%llx at priority %d, %d hops, 0x%llx flags", context, priority, self->_numHops, flags];
  }
  return (NSString *)v11;
}

- (unint64_t)blockingTid
{
  if ((self->_flags & 8) != 0) {
    return self->_context;
  }
  else {
    return 0;
  }
}

- (int)blockingPid
{
  if ((self->_flags & 0x10) != 0) {
    return self->_context;
  }
  else {
    return -1;
  }
}

- (uint64_t)displaysSameContentAs:(uint64_t)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:
{
  v7 = a2;
  unsigned int v8 = v7;
  if (!a1) {
    goto LABEL_27;
  }
  if ((unsigned char *)a1 == v7) {
    goto LABEL_15;
  }
  if (!v7)
  {
    if (a5) {
      goto LABEL_27;
    }
    uint64_t v23 = *(void *)(a1 + 24);
    if ((v23 & 8) != 0 || (a5 & 2) != 0 && (v23 & 4) != 0) {
      goto LABEL_27;
    }
    v24 = [(id)a1 portName];

    if (v24) {
      goto LABEL_27;
    }
LABEL_15:
    uint64_t v25 = 1;
    goto LABEL_28;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v43 = *((void *)v7 + 3);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *((void *)v7 + 2);
  int v12 = *(unsigned __int8 *)(a1 + 8);
  int v40 = *(unsigned __int8 *)(a1 + 9);
  int v41 = v7[8];
  int v39 = v7[9];
  uint64_t v13 = [(id)a1 portName];
  uint64_t v44 = v9;
  int v42 = v12;
  if (!v13)
  {
    v38 = [v8 portName];
    if (!v38)
    {
      v38 = 0;
      int v22 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  uint64_t v14 = [(id)a1 portName];
  if (!v14) {
    goto LABEL_17;
  }
  v15 = (void *)v14;
  uint64_t v16 = [v8 portName];
  if (!v16)
  {

LABEL_17:
    int v22 = 0;
    if (!v13) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  v17 = (void *)v16;
  [(id)a1 portName];
  int v18 = v37 = v10;
  [v8 portName];
  char v19 = a5;
  v21 = uint64_t v20 = v11;
  int v22 = [v18 isEqualToString:v21];

  uint64_t v11 = v20;
  a5 = v19;

  uint64_t v10 = v37;
  if (!v13) {
    goto LABEL_20;
  }
LABEL_21:

  uint64_t v26 = [(id)a1 portFlags];
  uint64_t v27 = [v8 portFlags];
  uint64_t v28 = [(id)a1 portDomain];
  uint64_t v29 = [v8 portDomain];
  uint64_t v25 = 0;
  if (v22 && v26 == v27 && v28 == v29)
  {
    unint64_t v30 = *(void *)(a1 + 24);
    if ((v30 & 0xC) != 0 || (v8[24] & 0xC) != 0)
    {
      if (((v43 ^ v44) & 0xC) != 0)
      {
LABEL_27:
        uint64_t v25 = 0;
        goto LABEL_28;
      }
      uint64_t v32 = (v30 >> 2) & 1;
      BOOL v34 = v42 == v41 && v40 == v39;
      BOOL v35 = v10 == v11 && v34;
      if ((((a5 & 2) == 0) & v32) != 0) {
        uint64_t v25 = v34;
      }
      else {
        uint64_t v25 = v35;
      }
    }
    else
    {
      uint64_t v25 = (a5 & 1) == 0 || v44 == v43;
    }
  }
LABEL_28:

  return v25;
}

- (uint64_t)_displaysContentForPid:(uint64_t)a3 tid:(int)a4 threadPriority:(char)a5 options:(void *)a6 displayString:(void *)a7 nameCallback:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = a7;
  if (!a1) {
    goto LABEL_26;
  }
  if (a5) {
    goto LABEL_5;
  }
  uint64_t v14 = [(id)a1 portName];
  if (v14 || (uint64_t v22 = *(void *)(a1 + 24), (v22 & 0x10) != 0) && (*(unsigned char *)(a1 + 19) & 0x80) == 0)
  {

    goto LABEL_5;
  }
  if ((v22 & 8) != 0 && *(void *)(a1 + 16))
  {
LABEL_5:
    if (!a6)
    {
LABEL_58:
      uint64_t v23 = 1;
      goto LABEL_59;
    }
    v15 = (void *)[@"turnstile" mutableCopy];
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)(a1 + 24);
    if (v17)
    {
      [v15 appendString:@" UNKNOWN"];
      uint64_t v17 = *(void *)(a1 + 24);
    }
    if ((v17 & 2) != 0) {
      [v16 appendString:@" LOCKED"];
    }
    if (*(unsigned __int8 *)(a1 + 8) != a4) {
      objc_msgSend(v16, "appendFormat:", @" with priority %d", *(unsigned __int8 *)(a1 + 8));
    }
    if ((*(unsigned char *)(a1 + 24) & 0xDC) == 0)
    {
      int v18 = [(id)a1 portName];

      if (!v18) {
        goto LABEL_52;
      }
    }
    [v16 appendString:@" waiting for"];
    uint64_t v19 = *(void *)(a1 + 24);
    if ((v19 & 8) != 0)
    {
      uint64_t v20 = *(void *)(a1 + 16);
      if (!v20)
      {
        v21 = @" unknown thread";
        goto LABEL_33;
      }
      if (v20 == a3)
      {
        v21 = @" this thread";
LABEL_33:
        [v16 appendString:v21];
        goto LABEL_36;
      }
      v13[2](v13, 0xFFFFFFFFLL, v20);
    }
    else
    {
      if ((v19 & 0x10) == 0)
      {
        if ((v19 & 4) != 0)
        {
          [v16 appendString:@" workqueue"];
          if ((a5 & 2) != 0) {
            objc_msgSend(v16, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 16));
          }
        }
LABEL_36:
        uint64_t v26 = *(void *)(a1 + 24);
        if ((v26 & 0x40) != 0)
        {
          uint64_t v27 = @" send port";
        }
        else
        {
          if ((v26 & 0x80) == 0) {
            goto LABEL_41;
          }
          uint64_t v27 = @" receive port";
        }
        [v16 appendString:v27];
LABEL_41:
        uint64_t v28 = [(id)a1 portName];
        if (v28 || [(id)a1 portFlags])
        {

LABEL_44:
          if ((*(unsigned char *)(a1 + 24) & 0xC0) == 0) {
            [v16 appendString:@" port"];
          }
          uint64_t v29 = [(id)a1 portName];

          if (v29)
          {
            unint64_t v30 = [(id)a1 portName];
            [v16 appendFormat:@" name \"%@\"", v30];
          }
          if ([(id)a1 portFlags]) {
            objc_msgSend(v16, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
          }
          if ([(id)a1 portDomain]) {
            objc_msgSend(v16, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
          }
          goto LABEL_52;
        }
        if ([(id)a1 portDomain]) {
          goto LABEL_44;
        }
LABEL_52:
        unint64_t v31 = *(void *)(a1 + 24);
        if ((v31 & 0x20) != 0)
        {
          [v16 appendFormat:@" iplock held"];
          unint64_t v31 = *(void *)(a1 + 24);
        }
        if (v31 >= 0x100)
        {
          int v34 = *__error();
          BOOL v35 = _sa_logt();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
          {
            uint64_t v36 = *(void *)(a1 + 24);
            *(_DWORD *)buf = 134217984;
            uint64_t v38 = v36;
            _os_log_fault_impl(&dword_1BF22B000, v35, OS_LOG_TYPE_FAULT, "Unknown turnstile flags 0x%llx", buf, 0xCu);
          }

          *__error() = v34;
          objc_msgSend(v16, "appendFormat:", @" with unknown flags 0x%llx", *(void *)(a1 + 24));
        }
        if (*(unsigned char *)(a1 + 9) != 1) {
          objc_msgSend(v16, "appendFormat:", @" after %d hops", *(unsigned __int8 *)(a1 + 9));
        }
        id v32 = v16;
        *a6 = v32;

        goto LABEL_58;
      }
      uint64_t v24 = *(unsigned int *)(a1 + 16);
      if ((v24 & 0x80000000) != 0)
      {
        v21 = @" unknown process";
        goto LABEL_33;
      }
      if (v24 == a2)
      {
        v21 = @" this process";
        goto LABEL_33;
      }
      v13[2](v13, v24, 0);
    uint64_t v25 = };
    [v16 appendFormat:@" %@", v25];

    goto LABEL_36;
  }
LABEL_26:
  uint64_t v23 = 0;
LABEL_59:

  return v23;
}

- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 threadPriority:(int)a5 options:(unint64_t)a6 nameCallback:(id)a7
{
  id v9 = 0;
  -[SATurnstileInfo _displaysContentForPid:tid:threadPriority:options:displayString:nameCallback:]((uint64_t)self, a3, a4, a5, a6, &v9, a7);
  id v7 = v9;
  return v7;
}

- (unint64_t)context
{
  return self->_context;
}

- (unsigned)priority
{
  return self->_priority;
}

- (unsigned)numHops
{
  return self->_numHops;
}

- (unint64_t)flags
{
  return self->_flags;
}

+ (id)classDictionaryKey
{
  return @"SATurnstileInfo";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 44;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SATurnstileInfo *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v11 = *__error();
    int v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [(SATurnstileInfo *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = [v13 UTF8String];
      __int16 v24 = 2048;
      unint64_t v25 = [(SATurnstileInfo *)self sizeInBytesForSerializedVersion];
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v11;
    id v14 = [(SATurnstileInfo *)self debugDescription];
    char v15 = [v14 UTF8String];
    [(SATurnstileInfo *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5673, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 513;
  *(void *)(&a3->var1 + 1) = self->_context;
  BYTE2(a3->var2) = self->_priority;
  BYTE3(a3->var2) = self->_numHops;
  *(unint64_t *)((char *)&a3->var2 + 4) = self->_flags;
  id v9 = [(SABlockingInfo *)self portName];
  *(void *)(&a3->var4 + 3) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  *(unint64_t *)((char *)&a3->var5 + 4) = [(SABlockingInfo *)self portFlags];
  *(unint64_t *)((char *)&a3->var6 + 4) = [(SABlockingInfo *)self portDomain];

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  id v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    unint64_t v6 = [(SABlockingInfo *)self portName];
    [v6 addSelfToSerializationDictionary:v7];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 3u) {
    goto LABEL_17;
  }
  if (a4 <= 0x13)
  {
    int v8 = *__error();
    id v9 = _sa_logt();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = 20;
      _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo struct %lu", buf, 0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5703, "bufferLength %lu < serialized SATurnstileInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = 44;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5709, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_17:
    id v24 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATurnstileInfo version" userInfo:0];
    objc_exception_throw(v24);
  }
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
LABEL_9:
    unint64_t v6 = objc_alloc_init(SATurnstileInfo);
    goto LABEL_10;
  }
  if (a4 <= 0x2B) {
    goto LABEL_14;
  }
  if (*(void *)((char *)a3 + 20) == -1 && !*(void *)((char *)a3 + 28) && !*(void *)((char *)a3 + 36)) {
    goto LABEL_9;
  }
  unint64_t v6 = objc_alloc_init(SATurnstileInfoWithPortLabel);
  [(SATurnstileInfoWithPortLabel *)v6 setPortFlags:*(void *)((char *)a3 + 28)];
  [(SATurnstileInfoWithPortLabel *)v6 setPortDomain:*(void *)((char *)a3 + 36)];
LABEL_10:
  v6->super._unint64_t context = *(void *)((char *)a3 + 2);
  v6->super._uint64_t priority = *((unsigned char *)a3 + 10);
  v6->super._uint64_t numHops = *((unsigned char *)a3 + 11);
  v6->super._unint64_t flags = *(void *)((char *)a3 + 12);
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v42 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u) {
    goto LABEL_22;
  }
  if (a4 <= 0x13)
  {
    int v16 = *__error();
    uint64_t v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v44 = a4;
      __int16 v45 = 2048;
      uint64_t v46 = 20;
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo struct %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5738, "bufferLength %lu < serialized SATurnstileInfo struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    int v24 = *__error();
    _sa_logt();
    self = (SATurnstileInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v44 = a4;
      __int16 v45 = 2048;
      uint64_t v46 = 44;
      _os_log_error_impl(&dword_1BF22B000, &self->super.super, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", buf, 0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage(5742, "bufferLength %lu < serialized SATurnstileInfo_v2 struct %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
LABEL_19:
    int v31 = *__error();
    id v32 = _sa_logt();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self);
      *(_DWORD *)buf = 136315138;
      unint64_t v44 = (unint64_t)ClassName;
      _os_log_error_impl(&dword_1BF22B000, v32, OS_LOG_TYPE_ERROR, "turnstile info with port info, but class is %s", buf, 0xCu);
    }

    *__error() = v31;
    char v34 = object_getClassName(self);
    _SASetCrashLogMessage(5748, "turnstile info with port info, but class is %s", v35, v36, v37, v38, v39, v40, v34);
    _os_crash();
    __break(1u);
LABEL_22:
    id v41 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SATurnstileInfo version" userInfo:0];
    objc_exception_throw(v41);
  }
  uint64_t v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 2u) {
    goto LABEL_10;
  }
  if (a4 <= 0x2B) {
    goto LABEL_16;
  }
  if (*(void *)((char *)a3 + 20) != -1 || *(void *)((char *)a3 + 28) || *(void *)((char *)a3 + 36))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v12 = *(void *)((char *)a3 + 20);
      uint64_t v13 = self;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v42, v11, v14, 0);
      [(SATurnstileInfo *)v13 setPortName:v15];

      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_10:
}

@end