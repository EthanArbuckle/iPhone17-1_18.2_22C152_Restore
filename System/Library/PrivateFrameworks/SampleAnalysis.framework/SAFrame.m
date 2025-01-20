@interface SAFrame
+ (SAFrame)frameWithPAStyleSerializedFrame:(uint64_t)a1;
+ (id)addStack:(uint64_t)a3 backtraceStyle:(void *)a4 toSetOfRootFrames:;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (uint64_t)fixupLoadInfosInFrameTree:(void *)a3 binaryLoadInfos:(void *)a4 libraryCache:(void *)a5 uuidsWithNewInstructions:;
+ (void)enumerateFrameTree:(void *)a3 block:;
+ (void)printFrameTree:(id)a3;
+ (void)releaseFrameTree:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExclave;
- (BOOL)isFakeFrame;
- (BOOL)isKernel;
- (BOOL)isLeafyCallstackIsInAnotherCallTreeFrame;
- (BOOL)isRootFrame;
- (BOOL)isSwiftAsync;
- (BOOL)isSymbolicationOffByOne;
- (BOOL)isTruncatedBacktraceFrame;
- (NSString)debugDescription;
- (SAExclave)exclave;
- (SAInstruction)instruction;
- (id)copyWithNewParent:(id)a3;
- (id)initCopyingFrame:(id)a3 withParent:(id)a4;
- (unint64_t)address;
- (unint64_t)hash;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)_addChildFrame:(uint64_t)a1;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedFrame:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)reset;
- (void)setChildFrameOrFrames:(uint64_t)a1;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SAFrame

- (SAInstruction)instruction
{
  p_binaryLoadInfo = &self->_binaryLoadInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    unint64_t address = self->_address;
    unint64_t v7 = address - [(SAFrame *)self isSymbolicationOffByOne];
    id v8 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    v9 = objc_msgSend(v5, "instructionAtOffsetIntoLoadInfo:", v7 - objc_msgSend(v8, "loadAddress"));

    if (!v9) {
      objc_storeWeak((id *)p_binaryLoadInfo, 0);
    }
  }
  else
  {
    v9 = 0;
  }
  return (SAInstruction *)v9;
}

- (BOOL)isTruncatedBacktraceFrame
{
  return (self->_BOOLs.bits >> 3) & 1;
}

- (unint64_t)address
{
  return self->_address;
}

+ (void)enumerateFrameTree:(void *)a3 block:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  self;
  if (![v4 count]) {
    goto LABEL_27;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v48 = v4;
  unint64_t v7 = (void *)[v4 mutableCopy];
  [v6 addObject:v7];

  uint64_t v8 = [v6 lastObject];
  if (!v8) {
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  while (1)
  {
    id v10 = (id)[v6 count];
    v11 = [MEMORY[0x1E4F1CA98] null];

    if ((void *)v9 != v11) {
      break;
    }
    [v6 removeLastObject];
LABEL_23:
    uint64_t v19 = [v6 lastObject];

    uint64_t v9 = v19;
    if (!v19) {
      goto LABEL_26;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = (id)v9;
    uint64_t v13 = [v12 anyObject];
    if (!v13)
    {
      uint64_t v9 = *__error();
      v20 = _sa_logt();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "No frame in child frames", buf, 2u);
      }

      *__error() = v9;
      _SASetCrashLogMessage(288, "No frame in child frames", v21, v22, v23, v24, v25, v26, v47);
      _os_crash();
      __break(1u);
LABEL_31:
      int v27 = *__error();
      v28 = _sa_logt();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        ClassName = object_getClassName((id)v9);
        *(_DWORD *)buf = 136315138;
        v50 = ClassName;
        _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v27;
      char v30 = object_getClassName((id)v9);
      _SASetCrashLogMessage(295, "child is %s", v31, v32, v33, v34, v35, v36, v30);
      _os_crash();
      __break(1u);
LABEL_34:
      int v37 = *__error();
      v38 = _sa_logt();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = object_getClassName(v10);
        *(_DWORD *)buf = 136315138;
        v50 = v39;
        _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
      }

      *__error() = v37;
      char v40 = object_getClassName(v10);
      _SASetCrashLogMessage(320, "child is %s", v41, v42, v43, v44, v45, v46, v40);
      _os_crash();
      __break(1u);
    }
    v14 = (id *)v13;
    [v12 removeObject:v13];
    uint64_t v15 = [v12 count];
    BOOL v16 = v15 == 0;
    if (!v15) {
      [v6 removeLastObject];
    }

    if (!v5) {
      goto LABEL_15;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_31;
    }
    v14 = (id *)(id)v9;
    [v6 removeLastObject];
    BOOL v16 = 1;
    if (!v5) {
      goto LABEL_15;
    }
  }
  buf[0] = 0;
  v5[2](v5, v14, v10, buf);
  if (!buf[0])
  {
LABEL_15:
    id v10 = v14[5];
    if (v10)
    {
      if (v16)
      {
        v17 = [MEMORY[0x1E4F1CA98] null];
        [v6 addObject:v17];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = (void *)[v10 mutableCopy];
        [v6 addObject:v18];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_34;
        }
        [v6 addObject:v10];
      }
    }

    goto LABEL_23;
  }

LABEL_26:
  id v4 = v48;
LABEL_27:
}

- (BOOL)isKernel
{
  return (self->_BOOLs.bits >> 2) & 1;
}

- (unint64_t)hash
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_childFrameOrFrames, 0);
  objc_destroyWeak((id *)&self->_binaryLoadInfo);
}

- (BOOL)isSwiftAsync
{
  return (self->_BOOLs.bits >> 1) & 1;
}

- (BOOL)isExclave
{
  return 0;
}

- (SAExclave)exclave
{
  return 0;
}

- (BOOL)isSymbolicationOffByOne
{
  if ((self->_BOOLs.bits & 1) == 0) {
    return 0;
  }
  p_binaryLoadInfo = &self->_binaryLoadInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)p_binaryLoadInfo);
    BOOL v2 = [v6 loadAddress] != self->_address;
  }
  else
  {
    BOOL v2 = 1;
  }

  return v2;
}

- (BOOL)isLeafyCallstackIsInAnotherCallTreeFrame
{
  return (self->_BOOLs.bits >> 4) & 1;
}

- (void)reset
{
  self->_BOOLs.bits = 0;
  self->_unint64_t address = 0;
  self->_parentFrame = 0;
  objc_storeWeak((id *)&self->_binaryLoadInfo, 0);
  id childFrameOrFrames = self->_childFrameOrFrames;
  self->_id childFrameOrFrames = 0;
}

- (id)initCopyingFrame:(id)a3 withParent:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SAFrame;
  unint64_t v7 = [(SAFrame *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_unint64_t address = *((void *)v6 + 2);
    v7->_parentFrame = (SAFrame *)a4;
    id WeakRetained = objc_loadWeakRetained((id *)v6 + 3);
    objc_storeWeak((id *)&v8->_binaryLoadInfo, WeakRetained);

    v8->_BOOLs.bits = *((unsigned char *)v6 + 8);
  }

  return v8;
}

- (id)copyWithNewParent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initCopyingFrame:self withParent:v4];

  return v5;
}

- (BOOL)isRootFrame
{
  return self->_parentFrame == 0;
}

- (BOOL)isFakeFrame
{
  if ([(SAFrame *)self isTruncatedBacktraceFrame]) {
    return 1;
  }
  return [(SAFrame *)self isLeafyCallstackIsInAnotherCallTreeFrame];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (self) {
    LOBYTE(self) = self->_BOOLs.bits == *((unsigned __int8 *)v4 + 8) && self->_address == v4[2];
  }

  return (char)self;
}

- (void)_addChildFrame:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1 && v4)
  {
    id v21 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    id v5 = (id *)(a1 + 40);
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [*v5 addObject:v21];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v11 = *__error();
          id v12 = _sa_logt();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            ClassName = object_getClassName(*v5);
            *(_DWORD *)buf = 136315138;
            uint64_t v23 = ClassName;
            _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
          }

          *__error() = v11;
          char v14 = object_getClassName(*v5);
          _SASetCrashLogMessage(155, "child is %s", v15, v16, v17, v18, v19, v20, v14);
          _os_crash();
          __break(1u);
        }
        unint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA80];
        id v8 = *v5;
        uint64_t v9 = objc_msgSend([v7 alloc], "initWithObjects:", v8, v21, 0);
        id v10 = *v5;
        *id v5 = (id)v9;
      }
    }
    else
    {
      objc_storeStrong(v5, a2);
    }
    id v4 = v21;
  }
}

+ (id)addStack:(uint64_t)a3 backtraceStyle:(void *)a4 toSetOfRootFrames:
{
  id v6 = a2;
  id v7 = a4;
  self;
  if (v6)
  {
    if (v7)
    {
      *(void *)buf = 0;
      uint64_t v31 = buf;
      uint64_t v32 = 0x3032000000;
      uint64_t v33 = __Block_byref_object_copy_;
      uint64_t v34 = __Block_byref_object_dispose_;
      id v35 = 0;
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __53__SAFrame_addStack_backtraceStyle_toSetOfRootFrames___block_invoke;
      v27[3] = &unk_1E63F6F58;
      v29 = buf;
      id v8 = v7;
      id v28 = v8;
      [v6 iterateFramesWithBacktraceStyle:a3 block:v27];
      id v9 = *((id *)v31 + 5);

      _Block_object_dispose(buf, 8);
      return v9;
    }
  }
  else
  {
    int v11 = *__error();
    id v12 = _sa_logt();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "nil frameIterator", buf, 2u);
    }

    *__error() = v11;
    _SASetCrashLogMessage(165, "nil frameIterator", v13, v14, v15, v16, v17, v18, v27[0]);
    _os_crash();
    __break(1u);
  }
  int v19 = *__error();
  uint64_t v20 = _sa_logt();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "nil rootFrames", buf, 2u);
  }

  *__error() = v19;
  _SASetCrashLogMessage(166, "nil rootFrames", v21, v22, v23, v24, v25, v26, v27[0]);
  id result = (id)_os_crash();
  __break(1u);
  return result;
}

void __53__SAFrame_addStack_backtraceStyle_toSetOfRootFrames___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v21 = v3;
  if (v4)
  {
    id v5 = *(id *)(v4 + 40);
    if (!v5)
    {
      id v8 = 0;
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      id v7 = [v6 member:v21];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v12 = *__error();
        uint64_t v13 = _sa_logt();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          ClassName = object_getClassName(v5);
          _os_log_error_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
        }

        *__error() = v12;
        char v14 = object_getClassName(v5);
        _SASetCrashLogMessage(180, "child is %s", v15, v16, v17, v18, v19, v20, v14);
        _os_crash();
        __break(1u);
      }
      id v6 = v5;
      if (![v21 isEqual:v6])
      {
        id v8 = 0;
        goto LABEL_13;
      }
      id v7 = v6;
    }
    id v8 = v7;
LABEL_13:

LABEL_14:
    if (v8) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  id v8 = [*(id *)(a1 + 32) member:v3];
  if (v8) {
    goto LABEL_18;
  }
LABEL_15:
  id v8 = (void *)[v21 copyWithNewParent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9) {
    -[SAFrame _addChildFrame:](v9, v8);
  }
  else {
    [*(id *)(a1 + 32) addObject:v8];
  }
LABEL_18:
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
}

+ (void)printFrameTree:(id)a3
{
}

int *__26__SAFrame_printFrameTree___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  int v5 = *__error();
  id v6 = (FILE *)*MEMORY[0x1E4F143D8];
  int v7 = 2 * a3 - 2;
  id v8 = [v4 debugDescription];
  fprintf(v6, "%*s%p %s\n", v7, "", v4, (const char *)[v8 UTF8String]);

  id result = __error();
  *id result = v5;
  return result;
}

+ (void)releaseFrameTree:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  id v3 = v2;
  id v4 = v3;
  if (v3)
  {
    int v5 = (id *)v3;
    do
    {
      id v6 = v5[5];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v7 = v6;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (!v9) {
            goto LABEL_14;
          }
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v49;
LABEL_7:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v49 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
            if (v13)
            {
              if (v13[5]) {
                break;
              }
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v58 count:16];
              if (!v10)
              {
LABEL_14:

                goto LABEL_18;
              }
              goto LABEL_7;
            }
          }
          uint64_t v15 = v13;

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_28;
        }
        char v14 = v6;
        if (v14[5])
        {
          uint64_t v15 = v14;
LABEL_21:

          if (v5 != v15[4])
          {
            int v19 = *__error();
            uint64_t v20 = _sa_logt();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              id v21 = [v5 debugDescription];
              uint64_t v22 = [v21 UTF8String];
              id v23 = [v15 debugDescription];
              uint64_t v24 = [v23 UTF8String];
              id v25 = v15[4];
              id v26 = [v25 debugDescription];
              uint64_t v27 = [v26 UTF8String];
              *(_DWORD *)buf = 136315650;
              uint64_t v53 = v22;
              __int16 v54 = 2080;
              uint64_t v55 = v24;
              __int16 v56 = 2080;
              uint64_t v57 = v27;
              _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "Frame %s child %s has different parent %s", buf, 0x20u);
            }
            *__error() = v19;
            id v28 = [v5 debugDescription];
            id v6 = (id)[v28 UTF8String];
            id v29 = [v15 debugDescription];
            [v29 UTF8String];
            id v30 = v15[4];
            id v31 = [v30 debugDescription];
            [v31 UTF8String];
            _SASetCrashLogMessage(249, "Frame %s child %s has different parent %s", v32, v33, v34, v35, v36, v37, (char)v6);

            _os_crash();
            __break(1u);
LABEL_28:
            int v38 = *__error();
            v39 = _sa_logt();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              ClassName = object_getClassName(v6);
              *(_DWORD *)buf = 136315138;
              uint64_t v53 = (uint64_t)ClassName;
              _os_log_error_impl(&dword_1BF22B000, v39, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
            }

            *__error() = v38;
            char v41 = object_getClassName(v6);
            _SASetCrashLogMessage(240, "child is %s", v42, v43, v44, v45, v46, v47, v41);
            _os_crash();
            __break(1u);
          }
          uint64_t v18 = v15;
          uint64_t v17 = v18;
          goto LABEL_23;
        }
LABEL_18:

        id v16 = v5[5];
        v5[5] = 0;
      }
      uint64_t v17 = (id *)v5[4];
      uint64_t v18 = 0;
      v5[4] = 0;
LABEL_23:

      int v5 = v17;
    }
    while (v17);
  }
}

- (void)setChildFrameOrFrames:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

+ (uint64_t)fixupLoadInfosInFrameTree:(void *)a3 binaryLoadInfos:(void *)a4 libraryCache:(void *)a5 uuidsWithNewInstructions:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  self;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__SAFrame_fixupLoadInfosInFrameTree_binaryLoadInfos_libraryCache_uuidsWithNewInstructions___block_invoke;
  v17[3] = &unk_1E63F6FA0;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v21 = &v22;
  id v14 = v11;
  id v20 = v14;
  +[SAFrame enumerateFrameTree:block:]((uint64_t)SAFrame, v8, v17);
  uint64_t v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __91__SAFrame_fixupLoadInfosInFrameTree_binaryLoadInfos_libraryCache_uuidsWithNewInstructions___block_invoke(void *a1, void *a2)
{
  id v18 = a2;
  char v3 = [v18 isFakeFrame];
  id v4 = v18;
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [v18 address];
    if (v18) {
      id WeakRetained = objc_loadWeakRetained(v18 + 3);
    }
    else {
      id WeakRetained = 0;
    }
    id v7 = +[SABinaryLoadInfo binaryLoadInfoForAddress:v5 inBinaryLoadInfos:a1[4] libraryCache:a1[5]];
    id v8 = v18;
    if (v18)
    {
      objc_storeWeak(v18 + 3, v7);
      id v8 = v18;
    }
    [v8 instruction];

    if (v7)
    {
      if (a1[6])
      {
        if (!WeakRetained) {
          goto LABEL_11;
        }
        uint64_t v9 = [v7 loadAddress];
        if (v9 != [WeakRetained loadAddress]) {
          goto LABEL_11;
        }
        id v10 = [v7 binary];
        id v11 = [v10 uuid];
        id v12 = [WeakRetained binary];
        id v13 = [v12 uuid];
        char v14 = [v11 isEqual:v13];

        if ((v14 & 1) == 0)
        {
LABEL_11:
          uint64_t v15 = (void *)a1[6];
          id v16 = [v7 binary];
          uint64_t v17 = [v16 uuid];
          [v15 addObject:v17];
        }
      }
    }
    else
    {
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
    }

    id v4 = v18;
  }
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  id v4 = [(SAFrame *)self instruction];
  uint64_t v5 = [v4 debugDescription];
  unint64_t address = self->_address;
  BOOL v7 = [(SAFrame *)self isSwiftAsync];
  BOOL v8 = [(SAFrame *)self isKernel];
  BOOL v9 = [(SAFrame *)self isExclave];
  uint64_t v24 = v4;
  BOOL v23 = v8;
  if (v9)
  {
    uint64_t v10 = [(SAFrame *)self exclave];
    BOOL v11 = v7;
    if (v10)
    {
      id v21 = (void *)v10;
      uint64_t v22 = [(SAFrame *)self exclave];
      uint64_t v12 = [v22 name];
      if (v12)
      {
        int v13 = 0;
        int v14 = 1;
        id v20 = (void *)v12;
        uint64_t v15 = (__CFString *)v12;
      }
      else
      {
        id v16 = [NSString alloc];
        id v19 = [(SAFrame *)self exclave];
        uint64_t v15 = (__CFString *)objc_msgSend(v16, "initWithFormat:", @"0x%llx", objc_msgSend(v19, "identifier"));
        id v20 = 0;
        int v14 = 1;
        int v13 = 1;
      }
    }
    else
    {
      id v21 = 0;
      int v14 = 0;
      int v13 = 0;
      uint64_t v15 = @"yes";
    }
  }
  else
  {
    BOOL v11 = v7;
    int v14 = 0;
    int v13 = 0;
    uint64_t v15 = @"no";
  }
  uint64_t v17 = (void *)[v3 initWithFormat:@"%@ [0x%llx] (swift:%d kernel:%d exclave:%@ offByOne:%d trunc:%d anotherCallTree:%d)", v5, address, v11, v23, v15, self->_BOOLs.bits & 1, -[SAFrame isTruncatedBacktraceFrame](self, "isTruncatedBacktraceFrame"), -[SAFrame isLeafyCallstackIsInAnotherCallTreeFrame](self, "isLeafyCallstackIsInAnotherCallTreeFrame")];
  if (v13)
  {
  }
  if (v14)
  {
  }
  if (v9) {

  }
  return (NSString *)v17;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [NSNumber numberWithUnsignedLongLong:self->_address];
  SAJSONWriteDictionaryFirstEntry(v4, @"address", v5);

  id v6 = [(SAFrame *)self instruction];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);

  if (!WeakRetained) {
    goto LABEL_24;
  }
  unint64_t address = self->_address;
  id v9 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  unint64_t v10 = address - [v9 loadAddress];

  id v11 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  uint64_t v12 = [v11 binary];

  id v13 = objc_loadWeakRetained((id *)&self->_binaryLoadInfo);
  int v14 = [v13 segment];

  uint64_t v15 = [v12 uuid];
  id v16 = [v15 UUIDString];
  SAJSONWriteDictionaryEntry(v4, @"binary", v16);

  if (v14)
  {
    if (![v14 hasOffsetIntoBinary]) {
      goto LABEL_7;
    }
    uint64_t v17 = NSNumber;
    uint64_t v18 = [v14 offsetIntoBinary];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = NSNumber;
  }
  id v19 = [v17 numberWithUnsignedLongLong:v18 + v10];
  SAJSONWriteDictionaryEntry(v4, @"offsetIntoBinary", v19);

LABEL_7:
  uint64_t v20 = [v12 path];
  if (v20)
  {
    id v21 = (void *)v20;
    uint64_t v22 = [v12 uuid];
    int v23 = +[SABinary haveMultipleBinariesWithUUID:]((uint64_t)SABinary, v22);

    if (v23)
    {
      uint64_t v24 = [v12 path];
      SAJSONWriteDictionaryEntry(v4, @"binaryPath", v24);
    }
  }
  if (v14)
  {
    uint64_t v25 = [v14 name];
    SAJSONWriteDictionaryEntry(v4, @"segment", v25);

    id v26 = [NSNumber numberWithUnsignedLongLong:v10];
    SAJSONWriteDictionaryEntry(v4, @"offsetIntoSegment", v26);
  }
  if ([(SAFrame *)self isSwiftAsync]) {
    SAJSONWriteDictionaryEntry(v4, @"isSwiftAsync", MEMORY[0x1E4F1CC38]);
  }
  if ([(SAFrame *)self isKernel]) {
    SAJSONWriteDictionaryEntry(v4, @"isKernelFrame", MEMORY[0x1E4F1CC38]);
  }
  if ([(SAFrame *)self isExclave])
  {
    uint64_t v27 = [(SAFrame *)self exclave];
    id v28 = [v27 name];
    if (v28)
    {
      SAJSONWriteDictionaryEntry(v4, @"exclave", v28);
    }
    else
    {
      id v29 = NSNumber;
      id v30 = [(SAFrame *)self exclave];
      id v31 = objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v30, "identifier"));
      SAJSONWriteDictionaryEntry(v4, @"exclave", v31);
    }
  }
  if ([v6 numSymbols])
  {
    [v4 appendString:@",\"symbols\":["];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __65__SAFrame_JSONSerialization__writeJSONDictionaryEntriesToStream___block_invoke;
    v33[3] = &unk_1E63F6FC8;
    id v32 = v4;
    id v34 = v32;
    id v35 = v6;
    uint64_t v36 = self;
    [v35 enumerateSymbols:v33];
    [v32 appendString:@"]"];
  }
LABEL_24:
}

void __65__SAFrame_JSONSerialization__writeJSONDictionaryEntriesToStream___block_invoke(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v17 = a2;
  id v7 = a3;
  if (a4) {
    [a1[4] appendString:@","];
  }
  [a1[4] appendString:@"{"];
  id v8 = a1[4];
  id v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1[5], "offsetIntoSegment")- objc_msgSend(v17, "offsetIntoSegment")+ objc_msgSend(a1[6], "isSymbolicationOffByOne"));
  SAJSONWriteDictionaryFirstEntry(v8, @"offsetIntoSymbol", v9);

  unint64_t v10 = [v17 name];
  if (v10) {
    SAJSONWriteDictionaryEntry(a1[4], @"symbolName", v10);
  }
  if (v7)
  {
    id v11 = a1[4];
    uint64_t v12 = [v7 filePath];
    SAJSONWriteDictionaryEntry(v11, @"sourceFilepath", v12);

    id v13 = a1[4];
    int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "lineNum"));
    SAJSONWriteDictionaryEntry(v13, @"sourceLineNum", v14);

    if ([v7 columnNum])
    {
      id v15 = a1[4];
      id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "columnNum"));
      SAJSONWriteDictionaryEntry(v15, @"sourceColumnNum", v16);
    }
  }
  [a1[4] appendString:@"}"];
}

+ (id)classDictionaryKey
{
  return @"SAFrame";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  if (!self->_childFrameOrFrames) {
    return 39;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return 8 * [self->_childFrameOrFrames count] + 39;
  }
  else {
    return 47;
  }
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAFrame *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v19 = *__error();
    uint64_t v20 = _sa_logt();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(SAFrame *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v65 = [v21 UTF8String];
      __int16 v66 = 2048;
      *(void *)v67 = [(SAFrame *)self sizeInBytesForSerializedVersion];
      *(_WORD *)&v67[8] = 2048;
      *(void *)&v67[10] = a4;
      _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v19;
    a3 = [(SAFrame *)self debugDescription];
    char v22 = [($165022A6B82873954AF8662177CFB640 *)a3 UTF8String];
    [(SAFrame *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(1276, "%s: size %lu != buffer length %lu", v23, v24, v25, v26, v27, v28, v22);

    _os_crash();
    __break(1u);
    goto LABEL_21;
  }
  *(_WORD *)&a3->var0 = 1025;
  *(void *)(&a3->var1 + 1) = self->_address;
  *((unsigned char *)&a3->var4 + 6) = *((unsigned char *)&a3->var4 + 6) & 0xFE | [(SAFrame *)self isKernel];
  if ([(SAFrame *)self isSwiftAsync]) {
    char v9 = 2;
  }
  else {
    char v9 = 0;
  }
  char v10 = *((unsigned char *)&a3->var4 + 6) & 0xFD | v9;
  *((unsigned char *)&a3->var4 + 6) = v10;
  *((unsigned char *)&a3->var4 + 6) = (4 * (self->_BOOLs.bits & 1)) | v10 & 0xFB;
  if ([(SAFrame *)self isExclave]) {
    char v11 = 8;
  }
  else {
    char v11 = 0;
  }
  *((unsigned char *)&a3->var4 + 6) = *((unsigned char *)&a3->var4 + 6) & 0xF7 | v11;
  uint64_t v12 = [(SAFrame *)self instruction];
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);

  *(unint64_t *)((char *)&a3->var3 + 6) = SASerializableIndexForPointerFromSerializationDictionary(self->_parentFrame, v8);
  a4 = (unint64_t)&a3->var4 + 7;
  if (self->_childFrameOrFrames)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = self->_childFrameOrFrames;
      if ((unint64_t)[v13 count] >= 0xFFFFFFFF)
      {
LABEL_24:
        int v42 = *__error();
        uint64_t v43 = _sa_logt();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          id v44 = [(SAFrame *)self debugDescription];
          uint64_t v45 = [v44 UTF8String];
          uint64_t v46 = [v13 count];
          *(_DWORD *)buf = 136315394;
          uint64_t v65 = v45;
          __int16 v66 = 2048;
          *(void *)v67 = v46;
          _os_log_error_impl(&dword_1BF22B000, v43, OS_LOG_TYPE_ERROR, "%s has %lu children", buf, 0x16u);
        }
        *__error() = v42;
        self = [(SAFrame *)self debugDescription];
        char v47 = [(SAFrame *)self UTF8String];
        [v13 count];
        _SASetCrashLogMessage(1294, "%s has %lu children", v48, v49, v50, v51, v52, v53, v47);

        _os_crash();
        __break(1u);
LABEL_27:
        int v54 = *__error();
        uint64_t v55 = _sa_logt();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(self->_childFrameOrFrames);
          *(_DWORD *)buf = 136315138;
          uint64_t v65 = (uint64_t)ClassName;
          _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
        }

        *__error() = v54;
        char v57 = object_getClassName(self->_childFrameOrFrames);
        _SASetCrashLogMessage(1298, "child is %s", v58, v59, v60, v61, v62, v63, v57);
        _os_crash();
        __break(1u);
      }
      unsigned int v14 = [v13 count];
      *(_DWORD *)((char *)&a3->var3 + 2) = v14;
      SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)&a3->var4 + 7, v14, v13, v8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_27;
      }
      id childFrameOrFrames = self->_childFrameOrFrames;
      *(_DWORD *)((char *)&a3->var3 + 2) = 1;
      id v13 = childFrameOrFrames;
      *(void *)((char *)&a3->var4 + 7) = SASerializableIndexForPointerFromSerializationDictionary(v13, v8);
    }
  }
  else
  {
    *(_DWORD *)((char *)&a3->var3 + 2) = 0;
  }
  id v16 = (uint64_t *)(a4 + 8 * *(unsigned int *)((char *)&a3->var3 + 2));
  id v17 = [(SAFrame *)self exclave];
  *id v16 = SASerializableIndexForPointerFromSerializationDictionary(v17, v8);

  if ((char *)v16 - (char *)a3 + 8 != [(SAFrame *)self sizeInBytesForSerializedVersion])
  {
LABEL_21:
    int v29 = *__error();
    id v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [(SAFrame *)self debugDescription];
      uint64_t v32 = [v31 UTF8String];
      uint64_t v33 = *(unsigned int *)((char *)&a3->var3 + 2);
      unint64_t v34 = [(SAFrame *)self sizeInBytesForSerializedVersion];
      *(_DWORD *)buf = 136315906;
      uint64_t v65 = v32;
      __int16 v66 = 1024;
      *(_DWORD *)v67 = v33;
      *(_WORD *)&v67[4] = 2048;
      *(void *)&v67[6] = a4 + 8 * v33 - (void)a3;
      *(_WORD *)&v67[14] = 2048;
      *(void *)&v67[16] = v34;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u children), ended with length %ld, should be %lu", buf, 0x26u);
    }
    *__error() = v29;
    id v35 = [(SAFrame *)self debugDescription];
    id v13 = (id)[v35 UTF8String];
    [(SAFrame *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(1311, "%s: after serializing (with %u children), ended with length %ld, should be %lu", v36, v37, v38, v39, v40, v41, (char)v13);

    _os_crash();
    __break(1u);
    goto LABEL_24;
  }

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", self, 0);
  while ([v4 count])
  {
    uint64_t v5 = (void *)MEMORY[0x1C18A6A20]();
    uint64_t v6 = [v4 lastObject];
    [v4 removeLastObject];
    id v7 = [(id)objc_opt_class() classDictionaryKey];
    BOOL v8 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v26, (void *)v6, v7);

    if (v8)
    {
      char v9 = [(id)v6 instruction];
      [v9 addSelfToSerializationDictionary:v26];

      if (v6)
      {
        char v10 = *(void **)(v6 + 32);
        id v11 = v10;
        if (v10) {
          [v4 addObject:v11];
        }
        id WeakRetained = objc_loadWeakRetained((id *)(v6 + 24));
      }
      else
      {
        id v11 = 0;
        id WeakRetained = 0;
      }
      [WeakRetained addSelfToSerializationDictionary:v26];

      id v13 = [(id)v6 exclave];
      [v13 addSelfToSerializationDictionary:v26];

      if (v6)
      {
        id v14 = *(id *)(v6 + 40);
        if (v14)
        {
          id v15 = v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = [v15 allObjects];
            [v4 addObjectsFromArray:v16];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v17 = *__error();
              uint64_t v18 = _sa_logt();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                ClassName = object_getClassName(v15);
                _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "child is %s", buf, 0xCu);
              }

              *__error() = v17;
              char v19 = object_getClassName(v15);
              _SASetCrashLogMessage(1343, "child is %s", v20, v21, v22, v23, v24, v25, v19);
              _os_crash();
              __break(1u);
            }
            [v4 addObject:v15];
          }
        }
      }
    }
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  *(void *)&v36[13] = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 5u) {
    goto LABEL_32;
  }
  if (a4 <= 0x1E)
  {
    int v15 = *__error();
    uint64_t v5 = _sa_logt();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v34 = a4;
      __int16 v35 = 2048;
      *(void *)uint64_t v36 = 31;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct %lu", buf, 0x16u);
    }

    *__error() = v15;
    _SASetCrashLogMessage(1358, "bufferLength %lu < serialized SAFrame struct %lu", v16, v17, v18, v19, v20, v21, a4);
    _os_crash();
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 18) + 31 > a4)
  {
LABEL_29:
    int v22 = *__error();
    uint64_t v23 = _sa_logt();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(unsigned int *)(v5 + 18);
      *(_DWORD *)buf = 134218496;
      unint64_t v34 = a4;
      __int16 v35 = 1024;
      *(_DWORD *)uint64_t v36 = v24;
      v36[2] = 2048;
      *(void *)&v36[3] = 8 * v24 + 31;
      _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", buf, 0x1Cu);
    }

    *__error() = v22;
    _SASetCrashLogMessage(1359, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", v25, v26, v27, v28, v29, v30, a4);
    _os_crash();
    __break(1u);
LABEL_32:
    id v31 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAFrame version" userInfo:0];
    objc_exception_throw(v31);
  }
  if (*((unsigned __int8 *)a3 + 1) >= 4u && (*((unsigned char *)a3 + 30) & 8) != 0)
  {
    uint64_t v6 = (SAFrame *)-[SAExclaveFrame initWithExclave:]([SAExclaveFrame alloc], 0);
    int v7 = 1;
  }
  else
  {
    uint64_t v6 = objc_alloc_init(SAFrame);
    int v7 = 0;
  }
  unint64_t v8 = *(void *)(v5 + 2);
  if (v6)
  {
    v6->_unint64_t address = v8;
    v6->_BOOLs.unsigned __int8 bits = v6->_BOOLs.bits & 0xFB | (4 * (*(unsigned char *)(v5 + 30) & 1));
    unint64_t v8 = *(void *)(v5 + 2);
  }
  if (v8)
  {
    char v9 = 0;
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (*(void *)(v5 + 22) == -1) {
    int v7 = 1;
  }
  if (v7) {
    char v9 = 8;
  }
  else {
    char v9 = 0;
  }
  if (v6) {
LABEL_12:
  }
    v6->_BOOLs.unsigned __int8 bits = v6->_BOOLs.bits & 0xF7 | v9;
LABEL_13:
  unsigned int v10 = *(unsigned __int8 *)(v5 + 1);
  if (v10 < 2) {
    char v11 = 0;
  }
  else {
    char v11 = *(unsigned char *)(v5 + 30) & 2;
  }
  if (v6)
  {
    p_BOOLs = &v6->_BOOLs;
    unsigned __int8 bits = v6->_BOOLs.bits & 0xFD | v11;
    v6->_BOOLs.unsigned __int8 bits = bits;
    if (*(unsigned __int8 *)(v5 + 1) >= 3u)
    {
      int v14 = (*(unsigned __int8 *)(v5 + 30) >> 2) & 1;
LABEL_39:
      p_BOOLs->unsigned __int8 bits = bits & 0xFE | v14;
      return v6;
    }
  }
  else if (v10 > 2)
  {
    return v6;
  }
  LOBYTE(v14) = ![(SAFrame *)v6 isSwiftAsync] && *(_DWORD *)(v5 + 18) != 0;
  if (v6)
  {
    p_BOOLs = &v6->_BOOLs;
    unsigned __int8 bits = v6->_BOOLs.bits;
    goto LABEL_39;
  }
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  unint64_t v11 = (unint64_t)a6;
  uint64_t v12 = (unsigned char *)gFrameTreeBeingDecoded();
  if (!*v12)
  {
    v146 = v12;
    *uint64_t v12 = 1;
    if (*(unsigned __int8 *)a3 > 4u)
    {
LABEL_13:
      id v19 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAFrame version" userInfo:0];
      objc_exception_throw(v19);
    }
    unint64_t v13 = -1;
    while (1)
    {
      if (a4 <= 0x1E) {
        goto LABEL_51;
      }
      if (a4 < 8 * (unint64_t)*(unsigned int *)((char *)a3 + 18) + 31)
      {
LABEL_54:
        int v74 = *__error();
        v75 = _sa_logt();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          uint64_t v76 = *(unsigned int *)((char *)a3 + 18);
          *(_DWORD *)buf = 134218496;
          *(void *)v155 = a4;
          *(_WORD *)&v155[8] = 1024;
          *(_DWORD *)&v155[10] = v76;
          *(_WORD *)&v155[14] = 2048;
          *(void *)&v155[16] = 8 * v76 + 31;
          _os_log_error_impl(&dword_1BF22B000, v75, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", buf, 0x1Cu);
        }

        *__error() = v74;
        _SASetCrashLogMessage(1415, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", v77, v78, v79, v80, v81, v82, a4);
        _os_crash();
        __break(1u);
LABEL_57:
        int v83 = *__error();
        v84 = _sa_logt();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BF22B000, v84, OS_LOG_TYPE_ERROR, "bad parent frame buffer", buf, 2u);
        }

        *__error() = v83;
        _SASetCrashLogMessage(1423, "bad parent frame buffer", v85, v86, v87, v88, v89, v90, v140);
        _os_crash();
        __break(1u);
LABEL_60:
        int v91 = *__error();
        v92 = _sa_logt();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v155 = a3;
          *(_WORD *)&v155[8] = 2048;
          *(void *)&v155[10] = 31;
          _os_log_error_impl(&dword_1BF22B000, v92, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct %lu", buf, 0x16u);
        }

        *__error() = v91;
        _SASetCrashLogMessage(1468, "bufferLength %lu < serialized SAFrame struct %lu", v93, v94, v95, v96, v97, v98, (char)a3);
        _os_crash();
        __break(1u);
LABEL_63:
        int v99 = *__error();
        v100 = _sa_logt();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          uint64_t v101 = *(unsigned int *)(a4 + 18);
          *(_DWORD *)buf = 134218496;
          *(void *)v155 = a3;
          *(_WORD *)&v155[8] = 1024;
          *(_DWORD *)&v155[10] = v101;
          *(_WORD *)&v155[14] = 2048;
          *(void *)&v155[16] = 8 * v101 + 31;
          _os_log_error_impl(&dword_1BF22B000, v100, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", buf, 0x1Cu);
        }

        *__error() = v99;
        _SASetCrashLogMessage(1469, "bufferLength %lu < serialized SAFrame struct plus %u children %lu", v102, v103, v104, v105, v106, v107, (char)a3);
        _os_crash();
        __break(1u);
LABEL_66:
        int v108 = *__error();
        v109 = _sa_logt();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BF22B000, v109, OS_LOG_TYPE_ERROR, "empty child frames array", buf, 2u);
        }

        *__error() = v108;
        _SASetCrashLogMessage(1516, "empty child frames array", v110, v111, v112, v113, v114, v115, v141);
        _os_crash();
        __break(1u);
LABEL_69:
        int v116 = *__error();
        v117 = _sa_logt();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
        {
          int v118 = *(_DWORD *)(a4 + 18);
          *(_DWORD *)buf = 134218240;
          *(void *)v155 = a3;
          *(_WORD *)&v155[8] = 1024;
          *(_DWORD *)&v155[10] = v118;
          _os_log_error_impl(&dword_1BF22B000, v117, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct v4 with %u children", buf, 0x12u);
        }

        *__error() = v116;
        _SASetCrashLogMessage(1483, "bufferLength %lu < serialized SAFrame struct v4 with %u children", v119, v120, v121, v122, v123, v124, (char)a3);
        _os_crash();
        __break(1u);
LABEL_72:
        int v125 = *__error();
        v126 = _sa_logt();
        v127 = self;
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          int v128 = (*(unsigned __int8 *)(a4 + 30) >> 3) & 1;
          id v129 = [(id)a3 debugDescription];
          uint64_t v130 = [v129 UTF8String];
          ClassName = object_getClassName(v127);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v155 = v128;
          *(_WORD *)&v155[4] = 2080;
          *(void *)&v155[6] = v130;
          *(_WORD *)&v155[14] = 2080;
          *(void *)&v155[16] = ClassName;
          _os_log_error_impl(&dword_1BF22B000, v126, OS_LOG_TYPE_ERROR, "Frame exclave:%d has exclave %s, is class %s, not SAExclaveFrame", buf, 0x1Cu);
        }
        *__error() = v125;
        int v132 = (*(unsigned __int8 *)(a4 + 30) >> 3) & 1;
        id v133 = [(id)a3 debugDescription];
        [v133 UTF8String];
        object_getClassName(v127);
        _SASetCrashLogMessage(1487, "Frame exclave:%d has exclave %s, is class %s, not SAExclaveFrame", v134, v135, v136, v137, v138, v139, v132);

        _os_crash();
        __break(1u);
      }
      unint64_t v14 = *(void *)((char *)a3 + 22);
      if (v14 == -1) {
        break;
      }
      int v15 = objc_opt_class();
      uint64_t v16 = SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v10, (void *)v11, v15);
      if (v16) {
        BOOL v18 = v17 > 0x1E;
      }
      else {
        BOOL v18 = 0;
      }
      if (!v18) {
        goto LABEL_57;
      }
      a4 = v17;
      unint64_t v13 = *(void *)((char *)a3 + 22);
      a3 = v16;
      if (*v16 > 4u) {
        goto LABEL_13;
      }
    }
    if (v13 != -1)
    {
      uint64_t v20 = objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v10, (void *)v11, v20, 0);
      uint64_t v21 = (SAFrame *)objc_claimAutoreleasedReturnValue();
      int v22 = v146;
      if (v21)
      {
LABEL_20:
        uint64_t v30 = [[SAFrameDeserializationHelper alloc] initWithFrame:v21 buffer:a3 bufferLength:a4];
        id v31 = [SAFrameSiblingsDeserializationHelper alloc];
        v143 = v30;
        v153 = v30;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v153 count:1];
        uint64_t v33 = [(SAFrameSiblingsDeserializationHelper *)v31 initWithFrameHelpers:v32];

        char v141 = 0;
        v142 = (void *)v33;
        unint64_t v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v33];
        if (![v34 count]) {
          goto LABEL_46;
        }
        v144 = v34;
        v145 = v21;
        v150 = (void *)v11;
        v151 = v10;
        while (1)
        {
          __int16 v35 = (void *)MEMORY[0x1C18A6A20]();
          uint64_t v36 = [v34 lastObject];
          uint64_t v37 = [v36 frameHelpers];
          unint64_t v38 = [v36 index];
          if (v38 >= [v37 count])
          {
            [v34 removeLastObject];
            goto LABEL_45;
          }
          v149 = v36;
          uint64_t v39 = objc_msgSend(v37, "objectAtIndexedSubscript:", objc_msgSend(v36, "index"));
          self = [v39 frame];
          a4 = [v39 buffer];
          v148 = v39;
          uint64_t v40 = (const void *)[v39 bufferLength];
          if (*(unsigned __int8 *)a4 >= 5u) {
            goto LABEL_13;
          }
          a3 = v40;
          if ((unint64_t)v40 <= 0x1E) {
            goto LABEL_60;
          }
          if ((unint64_t)v40 < 8 * (unint64_t)*(unsigned int *)(a4 + 18) + 31) {
            goto LABEL_63;
          }
          v147 = v37;
          v152 = self;
          self = *(SAFrame **)(a4 + 10);
          uint64_t v41 = objc_opt_class();
          id v42 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass((unint64_t)self, v10, (void *)v11, v41, 0);
          uint64_t v43 = (unint64_t *)(a4 + 31);
          uint64_t v44 = *(unsigned int *)(a4 + 18);
          if (*(unsigned __int8 *)(a4 + 1) >= 4u)
          {
            uint64_t v45 = &v43[v44];
            if ((char *)a3 + a4 < (char *)(v45 + 1)) {
              goto LABEL_69;
            }
            unint64_t v46 = *v45;
            char v47 = objc_opt_class();
            _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v46, v151, v150, v47, 0);
            a3 = (const void *)objc_claimAutoreleasedReturnValue();
            if (a3)
            {
              objc_opt_class();
              self = v152;
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_72;
              }
              if (v152) {
                objc_storeWeak((id *)&v152[1].super.isa, (id)a3);
              }
            }
          }
          uint64_t v36 = v149;
          objc_msgSend(v149, "setIndex:", objc_msgSend(v149, "index") + 1);
          if (!v44)
          {
            __int16 v56 = v152;
            -[SAFrame setChildFrameOrFrames:]((uint64_t)v152, 0);
            unint64_t v11 = (unint64_t)v150;
            uint64_t v37 = v147;
            goto LABEL_44;
          }
          a3 = (const void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v44];
          a4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v44];
          do
          {
            unint64_t v48 = *v43++;
            uint64_t v49 = objc_opt_class();
            self = (SAFrame *)SASerializableBufferForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v48, v151, v150, v49);
            uint64_t v51 = v50;
            uint64_t v52 = objc_opt_class();
            uint64_t v53 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v48, v151, v150, v52, 0);
            if (!v53)
            {
              int v58 = *__error();
              uint64_t v59 = _sa_logt();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1BF22B000, v59, OS_LOG_TYPE_ERROR, "can't decode child", buf, 2u);
              }

              *__error() = v58;
              _SASetCrashLogMessage(1508, "can't decode child", v60, v61, v62, v63, v64, v65, 0);
              _os_crash();
              __break(1u);
LABEL_51:
              int v66 = *__error();
              v67 = _sa_logt();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v155 = a4;
                *(_WORD *)&v155[8] = 2048;
                *(void *)&v155[10] = 31;
                _os_log_error_impl(&dword_1BF22B000, v67, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAFrame struct %lu", buf, 0x16u);
              }

              *__error() = v66;
              _SASetCrashLogMessage(1414, "bufferLength %lu < serialized SAFrame struct %lu", v68, v69, v70, v71, v72, v73, a4);
              _os_crash();
              __break(1u);
              goto LABEL_54;
            }
            int v54 = (void *)v53;
            *(void *)(v53 + 32) = v152;
            self = [[SAFrameDeserializationHelper alloc] initWithFrame:v53 buffer:self bufferLength:v51];
            [(id)a3 addObject:v54];
            [(id)a4 addObject:self];

            --v44;
          }
          while (v44);
          if (![(id)a3 count]) {
            goto LABEL_66;
          }
          if ([(id)a3 count] == 1)
          {
            uint64_t v55 = [(id)a3 anyObject];
            __int16 v56 = v152;
            -[SAFrame setChildFrameOrFrames:]((uint64_t)v152, v55);
          }
          else
          {
            __int16 v56 = v152;
            -[SAFrame setChildFrameOrFrames:]((uint64_t)v152, (void *)a3);
          }
          uint64_t v21 = v145;
          int v22 = v146;
          unint64_t v34 = v144;
          unint64_t v11 = (unint64_t)v150;
          uint64_t v37 = v147;
          char v57 = [[SAFrameSiblingsDeserializationHelper alloc] initWithFrameHelpers:a4];
          [v144 addObject:v57];

          uint64_t v36 = v149;
LABEL_44:

          id v10 = v151;
LABEL_45:

          if (![v34 count])
          {
LABEL_46:
            *int v22 = 0;

            goto LABEL_47;
          }
        }
      }
      unint64_t v11 = *__error();
      uint64_t v23 = _sa_logt();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v23, OS_LOG_TYPE_ERROR, "can't decode root frame", buf, 2u);
      }

      *__error() = v11;
      _SASetCrashLogMessage(1437, "can't decode root frame", v24, v25, v26, v27, v28, v29, v140);
      _os_crash();
      __break(1u);
    }
    uint64_t v21 = self;
    int v22 = v146;
    goto LABEL_20;
  }
LABEL_47:
}

+ (SAFrame)frameWithPAStyleSerializedFrame:(uint64_t)a1
{
  self;
  id v3 = objc_alloc_init(SAFrame);
  unint64_t v4 = *(void *)(a2 + 8);
  if (v3)
  {
    v3->_unint64_t address = v4;
    v3->_BOOLs.unsigned __int8 bits = v3->_BOOLs.bits & 0xFB | (4 * (*(unsigned char *)(a2 + 17) != 0));
    unint64_t v4 = *(void *)(a2 + 8);
  }
  if (v4)
  {
    LOBYTE(v5) = 0;
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v5 = (8 * (*(void *)(a2 + 26) == -1));
  if (v3)
  {
LABEL_5:
    unsigned __int8 v6 = v3->_BOOLs.bits & 0xF7 | v5;
    v3->_BOOLs.unsigned __int8 bits = v6;
    v3->_BOOLs.unsigned __int8 bits = v6 & 0xFE | (*(void *)(a2 + 18) != 0);
  }
LABEL_6:
  return v3;
}

- (void)populateReferencesUsingPAStyleSerializedFrame:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    unint64_t v9 = *(void *)(a2 + 26);
    id v10 = objc_opt_class();
    Property = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v7, v8, v10, 0);
    unint64_t v13 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v12, 8, 1);
    }
    *(void *)(a1 + 32) = Property;
    uint64_t v14 = a2 + 34;
    uint64_t v15 = *(void *)(a2 + 18);
    uint64_t v16 = objc_opt_class();
    unint64_t v17 = SASerializableNewMutableSetFromIndexList(v14, v15, v7, v8, v16);
    if ([v17 count] == 1)
    {
      BOOL v18 = [v17 anyObject];
      uint64_t v20 = v18;
      if (v18) {
        id v21 = objc_getProperty(v18, v19, 8, 1);
      }
      else {
        id v21 = 0;
      }
      objc_storeStrong((id *)(a1 + 40), v21);
    }
    else if ((unint64_t)[v17 count] < 2)
    {
      uint64_t v33 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    else
    {
      id v34 = v7;
      uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v17, "count"));
      uint64_t v23 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v22;

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v24 = v17;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v25)
      {
        uint64_t v27 = v25;
        uint64_t v28 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v24);
            }
            id v30 = *(id *)(*((void *)&v35 + 1) + 8 * i);
            id v31 = *(void **)(a1 + 40);
            if (v30) {
              id v30 = objc_getProperty(v30, v26, 8, 1);
            }
            id v32 = v30;
            [v31 addObject:v32];
          }
          uint64_t v27 = [v24 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v27);
      }

      id v7 = v34;
    }
  }
}

@end