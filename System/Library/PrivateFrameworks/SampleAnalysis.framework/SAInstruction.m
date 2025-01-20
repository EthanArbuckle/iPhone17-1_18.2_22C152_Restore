@interface SAInstruction
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)hasOffsetIntoBinary;
- (BOOL)hasSourceInfo;
- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4;
- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5;
- (NSString)debugDescription;
- (SABinary)binary;
- (SASegment)segment;
- (SASourceInfo)sourceInfo;
- (SASymbol)symbol;
- (id)realSegment;
- (int64_t)offsetIntoBinary;
- (uint64_t)enumerateSymbolsNullable:(void *)a1;
- (unint64_t)enumerateSymbols:(id)a3;
- (unint64_t)numSymbols;
- (unint64_t)offsetIntoSegment;
- (unint64_t)offsetIntoTextSegment;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)checkForNewSymbol;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setSymbol:(void *)a3 sourceinfo:;
@end

@implementation SAInstruction

- (void)setSymbol:(void *)a3 sourceinfo:
{
  id v8 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = a1;
    objc_sync_enter(v7);
    objc_storeStrong(v7 + 1, a2);
    objc_storeStrong(v7 + 2, a3);
    objc_sync_exit(v7);
  }
}

- (void)checkForNewSymbol
{
  v79[16] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v1 = *(void *)(a1 + 40);
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__2;
    v68 = __Block_byref_object_dispose__2;
    id v69 = 0;
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__2;
    v62 = __Block_byref_object_dispose__2;
    id v63 = 0;
    uint64_t v52 = 0;
    v53 = &v52;
    uint64_t v54 = 0x3032000000;
    v55 = __Block_byref_object_copy__2;
    v56 = __Block_byref_object_dispose__2;
    id v57 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__2;
    v50 = __Block_byref_object_dispose__2;
    id v51 = 0;
    v2 = -[SAInstruction realSegment]((id *)a1);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v40 = __34__SAInstruction_checkForNewSymbol__block_invoke;
    v41 = &unk_1E63F8AE0;
    v42 = &v64;
    v43 = &v52;
    v44 = &v58;
    v45 = &v46;
    v38 = v39;
    v3 = v2;
    if (v2)
    {
      id v4 = v2;
      objc_sync_enter(v4);
      obj = v4;
      v5 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v4, v1);
      id v6 = v5;
      if (v5)
      {
        v7 = v5;
        objc_sync_enter(v7);
        id v8 = v7[4];
        if (v8
          && (v79[0] = MEMORY[0x1E4F143A8],
              v79[1] = 3221225472,
              v79[2] = __51__SASymbol_nonInlineSourceInfoAtOffsetIntoSegment___block_invoke,
              v79[3] = &__block_descriptor_40_e22_q16__0__SASourceInfo_8l,
              v79[4] = v1,
              uint64_t v9 = SABinarySearchArray(v8, 0, (uint64_t)v79),
              v9 != 0x7FFFFFFFFFFFFFFFLL))
        {
          v10 = [v7[4] objectAtIndexedSubscript:v9];
        }
        else
        {
          v10 = 0;
        }
        objc_sync_exit(v7);

        v40(v38, v7, v10);
        v11 = (void *)obj[2];
        v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "offsetIntoSegment"));
        v13 = [v11 objectForKeyedSubscript:v12];

        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v14 = v13;
        uint64_t v37 = [v14 countByEnumeratingWithState:&v74 objects:v79 count:16];
        if (v37)
        {
          uint64_t v15 = *(void *)v75;
          v35 = v6;
          v36 = v3;
          uint64_t v33 = *(void *)v75;
          id v34 = v14;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v75 != v15) {
                objc_enumerationMutation(v14);
              }
              v17 = *(void **)(*((void *)&v74 + 1) + 8 * v16);
              uint64_t v18 = [v17 offsetIntoSegment];
              if ([v17 length] + v18 > v1)
              {
                if ([v17 offsetIntoSegment] > v1) {
                  goto LABEL_35;
                }
                long long v72 = 0u;
                long long v73 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                if (v17) {
                  id Property = objc_getProperty(v17, v19, 32, 1);
                }
                else {
                  id Property = 0;
                }
                id v21 = Property;
                uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v78 count:16];
                if (!v22)
                {

LABEL_30:
                  v40(v38, v17, 0);
                  goto LABEL_31;
                }
                char v23 = 0;
                uint64_t v24 = *(void *)v71;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v71 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v70 + 1) + 8 * i);
                    uint64_t v27 = [v26 offsetIntoSegment];
                    if ([v26 length] + v27 > v1)
                    {
                      if ([v26 offsetIntoSegment] > v1) {
                        goto LABEL_27;
                      }
                      v40(v38, v17, v26);
                      char v23 = 1;
                    }
                  }
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v70 objects:v78 count:16];
                }
                while (v22);
LABEL_27:

                id v6 = v35;
                v3 = v36;
                uint64_t v15 = v33;
                id v14 = v34;
                if ((v23 & 1) == 0) {
                  goto LABEL_30;
                }
              }
LABEL_31:
              ++v16;
            }
            while (v16 != v37);
            uint64_t v28 = [v14 countByEnumeratingWithState:&v74 objects:v79 count:16];
            uint64_t v37 = v28;
          }
          while (v28);
        }
LABEL_35:
      }
      objc_sync_exit(obj);
    }
    v29 = (void *)v59[5];
    if (!v29) {
      v29 = (void *)v65[5];
    }
    v30 = (void *)v47[5];
    if (!v30) {
      v30 = (void *)v53[5];
    }
    -[SAInstruction setSymbol:sourceinfo:]((void *)a1, v29, v30);
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v58, 8);

    _Block_object_dispose(&v64, 8);
  }
}

- (BOOL)hasOffsetIntoBinary
{
  p_segment = &self->_segment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_segment);
    char v5 = [v4 hasOffsetIntoBinary];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (int64_t)offsetIntoBinary
{
  p_segment = &self->_segment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);

  if (!WeakRetained) {
    return self->_offsetIntoSegment;
  }
  id v5 = objc_loadWeakRetained((id *)p_segment);
  int v6 = [v5 hasOffsetIntoBinary];

  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t offsetIntoSegment = self->_offsetIntoSegment;
  id v8 = objc_loadWeakRetained((id *)p_segment);
  int64_t v9 = [v8 offsetIntoBinary] + offsetIntoSegment;

  return v9;
}

- (id)realSegment
{
  unint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 4);
    v3 = WeakRetained;
    if (WeakRetained)
    {
      unint64_t v1 = (id *)WeakRetained;
    }
    else
    {
      id v4 = objc_loadWeakRetained(v1 + 3);
      -[SABinary createFakeEntireBinarySegment](v4);
      unint64_t v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v1;
}

- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4
{
  return [(SAInstruction *)self symbolicateWithOptions:a3 pid:*(void *)&a4 additionalCSSymbolicatorFlags:0];
}

- (BOOL)symbolicateWithOptions:(unint64_t)a3 pid:(int)a4 additionalCSSymbolicatorFlags:(unsigned int)a5
{
  if (self)
  {
    if (self->_sourceInfoOrSourceInfos) {
      return 0;
    }
    BOOL v10 = self->_symbolOrSymbols != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  if (!WeakRetained) {
    return 0;
  }
  v12 = WeakRetained;
  uint64_t v13 = -[SABinary symbolOwnerWrapperWithOptions:pid:checkExclave:additionalCSSymbolicatorFlags:](WeakRetained, a3, a4, 1, a5);
  if (v13)
  {
    id v14 = -[SAInstruction realSegment]((id *)&self->super.isa);
    uint64_t v15 = -[SASegment baseAddressInSymbolOwnerWrapper:](v14, (void *)v13);
    if (v15 == -1)
    {
      BOOL v9 = 0;
    }
    else
    {
      uint64_t v16 = v15;
      id v23 = 0;
      id v24 = 0;
      unint64_t offsetIntoSegment = self->_offsetIntoSegment;
      objc_copyStruct(dest, (const void *)(v13 + 16), 16, 1, 0);
      [(SASegment *)v14 symbolicateOffsetIntoSegment:dest[0] symbolOwner:dest[1] segmentBaseAddress:v16 returningSymbols:&v24 sourceInfos:&v23];
      id v19 = v23;
      id v18 = v24;
      -[SAInstruction setSymbol:sourceinfo:](self, v24, v23);
      id sourceInfoOrSourceInfos = self->_sourceInfoOrSourceInfos;
      BOOL v9 = sourceInfoOrSourceInfos != 0;
      if (sourceInfoOrSourceInfos) {
        char v21 = 1;
      }
      else {
        char v21 = v10;
      }
      if ((v21 & 1) == 0) {
        BOOL v9 = self->_symbolOrSymbols != 0;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __34__SAInstruction_checkForNewSymbol__block_invoke(void *a1, void *a2, void *a3)
{
  id v23 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (!v9)
  {
    objc_storeStrong(v8, a2);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
    goto LABEL_16;
  }
  BOOL v10 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (v10)
  {
    [v10 addObject:v23];
    uint64_t v11 = *(void *)(a1[7] + 8);
    v12 = *(void **)(v11 + 40);
    if (v6)
    {
      [*(id *)(v11 + 40) addObject:v6];
      goto LABEL_16;
    }
    id v18 = [MEMORY[0x1E4F1CA98] null];
    [v12 addObject:v18];
    goto LABEL_15;
  }
  uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", *(void *)(*(void *)(a1[4] + 8) + 40), v23, 0);
  uint64_t v14 = *(void *)(a1[6] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v17 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v18 = v17;
  if (!v17)
  {
    id v18 = [MEMORY[0x1E4F1CA98] null];
  }
  id v19 = v6;
  if (!v6)
  {
    id v19 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = objc_msgSend(v16, "initWithObjects:", v18, v19, 0);
  uint64_t v21 = *(void *)(a1[7] + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  if (!v6) {
  if (!v17)
  }
LABEL_15:

LABEL_16:
}

- (unint64_t)numSymbols
{
  return -[SAInstruction enumerateSymbolsNullable:](self, 0);
}

- (uint64_t)enumerateSymbolsNullable:(void *)a1
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a2;
  if (!a1)
  {
LABEL_38:
    uint64_t v14 = 0;
    goto LABEL_25;
  }
  id v5 = a1;
  objc_sync_enter(v5);
  id v6 = v5[1];
  uint64_t v7 = v5[2];
  objc_sync_exit(v5);

  if (!v6)
  {
    uint64_t v14 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (v4) {
          (*(void (**)(unint64_t, id, NSObject *, void))(v4 + 16))(v4, v6, v7, 0);
        }
        uint64_t v14 = 1;
        goto LABEL_24;
      }
    }
    else
    {
      int v16 = *__error();
      uint64_t v7 = _sa_logt();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        ClassName = object_getClassName(v6);
        _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
      }

      *__error() = v16;
      char v17 = object_getClassName(v6);
      _SASetCrashLogMessage(4305, "symbol is %s", v18, v19, v20, v21, v22, v23, v17);
      _os_crash();
      __break(1u);
    }
    int v24 = *__error();
    v25 = _sa_logt();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [v6 debugDescription];
      v2 = (char *)[v26 UTF8String];
      uint64_t v27 = [v7 count];
      uint64_t v28 = object_getClassName(v7);
      *(_DWORD *)buf = 136315650;
      ClassName = v2;
      __int16 v59 = 2048;
      uint64_t v60 = v27;
      __int16 v61 = 2080;
      v62 = v28;
      _os_log_error_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_ERROR, "1 symbol %s, but %lu source infos (%s)", buf, 0x20u);
    }
    *__error() = v24;
    id v29 = [v6 debugDescription];
    char v30 = [v29 UTF8String];
    id v8 = [v7 count];
    object_getClassName(v7);
    _SASetCrashLogMessage(4306, "1 symbol %s, but %lu source infos (%s)", v31, v32, v33, v34, v35, v36, v30);

    _os_crash();
    __break(1u);
    goto LABEL_32;
  }
  v2 = (char *)v6;
  if (v4)
  {
    id v8 = v7;
    if (!v8)
    {
LABEL_8:
      if ([v2 count])
      {
        uint64_t v10 = 0;
        while (1)
        {
          if (!v8) {
            goto LABEL_13;
          }
          uint64_t v11 = [v8 objectAtIndexedSubscript:v10];
          v12 = [MEMORY[0x1E4F1CA98] null];

          if (v11 == v12) {
            break;
          }
LABEL_14:
          uint64_t v13 = [v2 objectAtIndexedSubscript:v10];
          (*(void (**)(unint64_t, void *, void *, uint64_t))(v4 + 16))(v4, v13, v11, v10);

          if (++v10 >= (unint64_t)[v2 count]) {
            goto LABEL_15;
          }
        }

LABEL_13:
        uint64_t v11 = 0;
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 count];
      if (v9 == [v2 count]) {
        goto LABEL_8;
      }
      goto LABEL_35;
    }
LABEL_32:
    int v37 = *__error();
    v38 = _sa_logt();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = object_getClassName(v8);
      *(_DWORD *)buf = 136315138;
      ClassName = v39;
      _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "symbol is array, but source info is %s", buf, 0xCu);
    }

    *__error() = v37;
    char v40 = object_getClassName(v8);
    _SASetCrashLogMessage(4287, "symbol is array, but source info is %s", v41, v42, v43, v44, v45, v46, v40);
    _os_crash();
    __break(1u);
LABEL_35:
    unint64_t v4 = *__error();
    v47 = _sa_logt();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = [v2 count];
      uint64_t v49 = [v8 count];
      *(_DWORD *)buf = 134218240;
      ClassName = (const char *)v48;
      __int16 v59 = 2048;
      uint64_t v60 = v49;
      _os_log_error_impl(&dword_1BF22B000, v47, OS_LOG_TYPE_ERROR, "%lu symbols, but %lu source infos", buf, 0x16u);
    }

    *__error() = v4;
    char v50 = [v2 count];
    [v8 count];
    _SASetCrashLogMessage(4288, "%lu symbols, but %lu source infos", v51, v52, v53, v54, v55, v56, v50);
    _os_crash();
    __break(1u);
    goto LABEL_38;
  }
LABEL_16:
  uint64_t v14 = [v2 count];

LABEL_24:
LABEL_25:

  return v14;
}

- (BOOL)hasSourceInfo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = self->_sourceInfoOrSourceInfos;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v2;
    uint64_t v3 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v4);
          }
          uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          id v8 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v10);

          if (v7 != v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v3;
}

- (unint64_t)enumerateSymbols:(id)a3
{
  return -[SAInstruction enumerateSymbolsNullable:](self, a3);
}

- (NSString)debugDescription
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:128];
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  char v30 = __33__SAInstruction_debugDescription__block_invoke;
  uint64_t v31 = &unk_1E63F8B08;
  id v4 = v3;
  id v32 = v4;
  uint64_t v33 = self;
  uint64_t v5 = (void (**)(void, void, void))MEMORY[0x1C18A6C80](&v28);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([self->_symbolOrSymbols count])
    {
      unint64_t v6 = 0;
      char v7 = 1;
      do
      {
        if ((v7 & 1) == 0) {
          [v4 appendString:@", "];
        }
        id v8 = [self->_symbolOrSymbols objectAtIndexedSubscript:v6];
        uint64_t v9 = [self->_sourceInfoOrSourceInfos objectAtIndexedSubscript:v6];
        long long v10 = [MEMORY[0x1E4F1CA98] null];

        if (v9 == v10)
        {

          uint64_t v9 = 0;
        }
        ((void (**)(void, void *, void *))v5)[2](v5, v8, v9);

        ++v6;
        unint64_t v11 = [self->_symbolOrSymbols count];
        char v7 = 0;
      }
      while (v6 < v11);
    }
  }
  else if (self->_symbolOrSymbols)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v18 = *__error();
      uint64_t v19 = _sa_logt();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        ClassName = object_getClassName(self->_symbolOrSymbols);
        *(_DWORD *)buf = 136315138;
        uint64_t v35 = ClassName;
        _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
      }

      *__error() = v18;
      char v21 = object_getClassName(self->_symbolOrSymbols);
      _SASetCrashLogMessage(4340, "symbol is %s", v22, v23, v24, v25, v26, v27, v21);
      _os_crash();
      __break(1u);
    }
    ((void (**)(void, id, id))v5)[2](v5, self->_symbolOrSymbols, self->_sourceInfoOrSourceInfos);
  }
  else
  {
    [v4 appendFormat:@"???"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);

  if (WeakRetained) {
    p_segment = (id *)&self->_segment;
  }
  else {
    p_segment = (id *)&self->_binary;
  }
  id v14 = objc_loadWeakRetained(p_segment);
  uint64_t v15 = [v14 debugDescription];
  [v4 appendFormat:@" (%@ + %llu)", v15, self->_offsetIntoSegment, v28, v29, v30, v31];

  id v16 = v4;
  return (NSString *)v16;
}

void __33__SAInstruction_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v6 debugDescription];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40);
  uint64_t v9 = [v6 offsetIntoSegment];

  [v5 appendFormat:@"%@ + %llu", v7, v8 - v9];
  if (v12)
  {
    long long v10 = *(void **)(a1 + 32);
    unint64_t v11 = [v12 debugDescription];
    [v10 appendFormat:@" (%@ + %llu)", v11, *(void *)(*(void *)(a1 + 40) + 40) - objc_msgSend(v12, "offsetIntoSegment")];
  }
}

- (unint64_t)offsetIntoTextSegment
{
  return self->_offsetIntoSegment;
}

- (SASourceInfo)sourceInfo
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_sourceInfoOrSourceInfos)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [v2->_sourceInfoOrSourceInfos firstObject];
      id v4 = [MEMORY[0x1E4F1CA98] null];

      if (v3 == v4) {
        id v5 = 0;
      }
      else {
        id v5 = v3;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v7 = *__error();
        uint64_t v8 = _sa_logt();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(v2->_sourceInfoOrSourceInfos);
          *(_DWORD *)buf = 136315138;
          int v18 = ClassName;
          _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "source info is %s", buf, 0xCu);
        }

        *__error() = v7;
        char v10 = object_getClassName(v2->_sourceInfoOrSourceInfos);
        _SASetCrashLogMessage(4371, "source info is %s", v11, v12, v13, v14, v15, v16, v10);
        _os_crash();
        __break(1u);
      }
      id v5 = v2->_sourceInfoOrSourceInfos;
    }
  }
  else
  {
    id v5 = 0;
  }
  objc_sync_exit(v2);

  return (SASourceInfo *)v5;
}

- (SASymbol)symbol
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  id symbolOrSymbols = v2->_symbolOrSymbols;
  if (symbolOrSymbols)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v2->_symbolOrSymbols firstObject];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v6 = *__error();
        int v7 = _sa_logt();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          ClassName = object_getClassName(v2->_symbolOrSymbols);
          *(_DWORD *)buf = 136315138;
          char v17 = ClassName;
          _os_log_error_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
        }

        *__error() = v6;
        char v9 = object_getClassName(v2->_symbolOrSymbols);
        _SASetCrashLogMessage(4385, "symbol is %s", v10, v11, v12, v13, v14, v15, v9);
        _os_crash();
        __break(1u);
      }
      id v4 = v2->_symbolOrSymbols;
    }
    id symbolOrSymbols = v4;
  }
  objc_sync_exit(v2);

  return (SASymbol *)symbolOrSymbols;
}

- (SABinary)binary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  return (SABinary *)WeakRetained;
}

- (SASegment)segment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segment);
  return (SASegment *)WeakRetained;
}

- (unint64_t)offsetIntoSegment
{
  return self->_offsetIntoSegment;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_segment);
  objc_destroyWeak((id *)&self->_binary);
  objc_storeStrong(&self->_sourceInfoOrSourceInfos, 0);
  objc_storeStrong(&self->_symbolOrSymbols, 0);
}

+ (id)classDictionaryKey
{
  return @"SAInstruction";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  unint64_t v2 = [(SAInstruction *)self numSymbols];
  if (v2 <= 1) {
    return 99;
  }
  else {
    return 56 * v2 + 43;
  }
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAInstruction *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v19 = *__error();
    uint64_t v20 = _sa_logt();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(SAInstruction *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v34 = [v21 UTF8String];
      __int16 v35 = 2048;
      unint64_t v36 = [(SAInstruction *)self sizeInBytesForSerializedVersion];
      __int16 v37 = 2048;
      unint64_t v38 = a4;
      _os_log_error_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v19;
    id v22 = [(SAInstruction *)self debugDescription];
    char v23 = [v22 UTF8String];
    [(SAInstruction *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(5505, "%s: size %lu != buffer length %lu", v24, v25, v26, v27, v28, v29, v23);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 1025;
  *(void *)(&a3->var1 + 1) = self->_offsetIntoSegment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  uint64_t v10 = [WeakRetained uuid];

  if (v10) {
    [v10 getUUIDBytes:(char *)&a3->var2 + 2];
  }
  else {
    uuid_clear((unsigned __int8 *)&a3->var2 + 2);
  }
  id v11 = objc_loadWeakRetained((id *)&self->_segment);

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_segment);
    *(void *)((char *)&a3->var4.var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v12, v8);
  }
  else
  {
    *(void *)((char *)&a3->var4.var6 + 2) = -1;
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __98__SAInstruction_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke;
  v30[3] = &unk_1E63F8B98;
  id v31 = v8;
  id v32 = a3;
  id v13 = v8;
  unint64_t v14 = [(SAInstruction *)self enumerateSymbols:v30];
  if (v14 != 1)
  {
    if (v14)
    {
      BYTE2(a3->var5) = v14 - 1;
      unsigned int v15 = (v14 - 1);
      goto LABEL_13;
    }
    *(unint64_t *)((char *)&a3->var4.var1 + 2) = -1;
    *(unint64_t *)((char *)&a3->var4.var4 + 2) = -1;
  }
  unsigned int v15 = 0;
  BYTE2(a3->var5) = 0;
LABEL_13:
  uint64_t v16 = (char *)a3 + 56 * v15;
  id v17 = objc_loadWeakRetained((id *)&self->_binary);
  *(void *)(v16 + 91) = SASerializableIndexForPointerFromSerializationDictionary(v17, v13);

  return 1;
}

void __98__SAInstruction_Serialization__addSelfToBuffer_bufferLength_withCompletedSerializationDictionary___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v15 = a3;
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = v7 + 26;
  uint64_t v9 = v7 + 56 * a4 + 35;
  if (a4) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  id v11 = a2;
  *(void *)uint64_t v10 = [v11 offsetIntoSegment];
  *(void *)(v10 + 8) = [v11 length];
  id v12 = [v11 name];

  *(void *)(v10 + 16) = SASerializableIndexForPointerFromSerializationDictionary(v12, *(void **)(a1 + 32));
  id v13 = v15;
  if (v15)
  {
    *(void *)(v10 + 24) = [v15 offsetIntoSegment];
    *(_DWORD *)(v10 + 48) = [v15 lineNum];
    *(_DWORD *)(v10 + 52) = [v15 columnNum];
    *(void *)(v10 + 32) = [v15 length];
    unint64_t v14 = [v15 filePath];
    *(void *)(v10 + 40) = SASerializableIndexForPointerFromSerializationDictionary(v14, *(void **)(a1 + 32));

    id v13 = v15;
  }
  else
  {
    *(void *)(v10 + 40) = -1;
  }
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);

    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_binary);
      [v8 addSelfToSerializationDictionary:v4];
    }
    id v9 = objc_loadWeakRetained((id *)&self->_segment);

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_segment);
      [v10 addSelfToSerializationDictionary:v4];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__SAInstruction_Serialization__addSelfToSerializationDictionary___block_invoke;
    v11[3] = &unk_1E63F8BC0;
    id v12 = v4;
    [(SAInstruction *)self enumerateSymbols:v11];
  }
}

void __65__SAInstruction_Serialization__addSelfToSerializationDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = [a2 name];
  [v5 addSelfToSerializationDictionary:*(void *)(a1 + 32)];

  BOOL v6 = v8;
  if (v8)
  {
    uint64_t v7 = [v8 filePath];
    [v7 addSelfToSerializationDictionary:*(void *)(a1 + 32)];

    BOOL v6 = v8;
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  id v4 = (id *)objc_alloc_init((Class)self);
  objc_storeWeak(v4 + 3, 0);
  v4[5] = 0;
  return v4;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 5u) {
    goto LABEL_32;
  }
  if (a4 <= 0x19)
  {
    int v29 = *__error();
    char v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v52 = a4;
      __int16 v53 = 2048;
      uint64_t v54 = 26;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAInstruction struct %lu", buf, 0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(5596, "bufferLength %lu < serialized SAInstruction struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
LABEL_29:
    int v37 = *__error();
    unint64_t v38 = _sa_logt();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v52 = a4;
      __int16 v53 = 2048;
      uint64_t v54 = 91;
      _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAInstruction struct v3 %lu", buf, 0x16u);
    }

    *__error() = v37;
    _SASetCrashLogMessage(5626, "bufferLength %lu < serialized SAInstruction struct v3 %lu", v39, v40, v41, v42, v43, v44, a4);
    _os_crash();
    __break(1u);
LABEL_32:
    id v45 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAInstruction version" userInfo:0];
    objc_exception_throw(v45);
  }
  id v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 4u)
  {
    if (uuid_is_null((const unsigned __int8 *)a3 + 10))
    {
      id v14 = 0;
      goto LABEL_25;
    }
    id v15 = uuidForBytes((uint64_t)a3 + 10);
    id v14 = +[SABinary binaryWithUUID:v15 absolutePath:0];
  }
  else
  {
    unint64_t v12 = *(void *)((char *)a3 + 56 * *((unsigned __int8 *)a3 + 90) + 91);
    id v13 = objc_opt_class();
    _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v9, v11, v13, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14) {
      goto LABEL_25;
    }
  }
  unsigned int v16 = *((unsigned __int8 *)a3 + 1);
  if (v16 < 2) {
    goto LABEL_25;
  }
  if (v16 != 2)
  {
    if (a4 > 0x5A)
    {
      uint64_t v20 = (uint64_t *)gSASerializationEncodedVersionBeingDecoded();
      if (*v20 <= 30) {
        *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = v14;
      }
      unint64_t v21 = *(void *)((char *)a3 + 82);
      id v22 = objc_opt_class();
      char v23 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v9, v11, v22, 0);
      if (*v20 <= 30) {
        *(void *)gBinaryBeingDecoded(&gBinaryBeingDecoded) = 0;
      }
      LODWORD(v24) = *((unsigned __int8 *)a3 + 90);
      goto LABEL_21;
    }
    goto LABEL_29;
  }
  id v17 = -[SABinary segmentWithCleanName:](v14, @"__TEXT_EXEC");
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    -[SABinary segmentWithCleanName:](v14, @"__TEXT");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v23 = v19;

  LODWORD(v24) = 0;
LABEL_21:
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __128__SAInstruction_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke;
  v46[3] = &unk_1E63F8BE8;
  id v47 = v9;
  id v48 = v11;
  id v25 = v23;
  id v49 = v25;
  id v14 = v14;
  id v50 = v14;
  uint64_t v26 = (void (**)(void, void, void))MEMORY[0x1C18A6C80](v46);
  ((void (**)(void, char *, uint64_t))v26)[2](v26, (char *)a3 + 26, -1);
  if (v24)
  {
    uint64_t v27 = *(void *)((char *)a3 + 26);
    uint64_t v28 = (char *)a3 + 91;
    uint64_t v24 = v24;
    do
    {
      ((void (**)(void, char *, uint64_t))v26)[2](v26, v28, v27);
      v28 += 56;
      --v24;
    }
    while (v24);
  }

LABEL_25:
}

void __128__SAInstruction_Serialization__populateReferencesUsingBuffer_bufferLength_andDeserializationDictionary_andDataBufferDictionary___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *(void *)(a2 + 16);
  if (v6 != -1 || *(void *)a2 || *(void *)(a2 + 8))
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    id v9 = objc_opt_class();
    id v10 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v6, v7, v8, v9, 0);
    id v11 = *(void **)(a1 + 48);
    if (v11)
    {
      if (a3 == -1)
      {
        uint64_t v12 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](v11, *(void *)a2, *(void *)(a2 + 8), v10);
      }
      else
      {
        if (!v10)
        {
          int v25 = *__error();
          uint64_t v26 = _sa_logt();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 48), a3);
            uint64_t v28 = [v27 debugDescription];
            int v29 = [*(id *)(a1 + 48) debugDescription];
            int v30 = 138412546;
            uint64_t v31 = v28;
            __int16 v32 = 2112;
            uint64_t v33 = v29;
            _os_log_error_impl(&dword_1BF22B000, v26, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", (uint8_t *)&v30, 0x16u);
          }
          id v13 = 0;
          *__error() = v25;
          goto LABEL_18;
        }
        uint64_t v12 = -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](v11, *(void *)a2, *(void *)(a2 + 8), v10, a3);
      }
    }
    else
    {
      uint64_t v12 = -[SABinary addSymbolWithOffsetIntoBinary:length:name:](*(void **)(a1 + 56), *(void *)a2, *(void *)(a2 + 8), v10);
    }
    id v13 = (void *)v12;
    unint64_t v14 = *(void *)(a2 + 40);
    if (v14 != -1)
    {
      unsigned int v16 = *(void **)(a1 + 32);
      id v15 = *(void **)(a1 + 40);
      id v17 = objc_opt_class();
      uint64_t v18 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, v16, v15, v17);
      unint64_t v19 = *(void *)(a2 + 24);
      uint64_t v20 = *(void *)(a2 + 32);
      int v21 = *(_DWORD *)(a2 + 48);
      int v22 = *(_DWORD *)(a2 + 52);
      if (a3 == -1) {
        id v24 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v19, v20, v21, v22, v18);
      }
      else {
        id v23 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v19, v20, v21, v22, v18);
      }
    }
LABEL_18:
  }
}

@end