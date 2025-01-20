@interface SASegment
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:;
+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:(uint64_t)a5 offsetIntoBinary:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)hasOffsetIntoBinary;
- (BOOL)isEmpty;
- (NSString)debugDescription;
- (NSString)name;
- (SABinary)binary;
- (SASegment)initWithBinary:(id)a3 name:(id)a4 length:(unint64_t)a5 offsetIntoBinary:(int64_t)a6;
- (id)addInlineSymbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:(unint64_t)a5 nonInlineSymbolOffsetIntoSegment:;
- (id)instructionAtOffsetIntoSegment:(unint64_t)a3;
- (id)nonInlineSymbolAtOffsetIntoSegment:(void *)a1;
- (int64_t)offsetIntoBinary;
- (uint64_t)baseAddressInSymbolOwnerWrapper:(void *)a1;
- (unint64_t)length;
- (unint64_t)sizeInBytesForSerializedVersion;
- (void)addNonInlineSymbolWithOffsetIntoSegment:(unint64_t)a3 length:(void *)a4 name:;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)grabInstructionsFromOtherSegment:(id *)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)setLength:(void *)a1;
- (void)symbolicateOffsetIntoSegment:(uint64_t)a3 symbolOwner:(uint64_t)a4 segmentBaseAddress:(uint64_t)a5 returningSymbols:(id *)a6 sourceInfos:(id *)a7;
- (void)symbolicateWithSymbolOwnerWrapper:(void *)a1;
- (void)writeJSONDictionaryEntriesToStream:(id)a3;
@end

@implementation SASegment

+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:(uint64_t)a5 offsetIntoBinary:
{
  id v8 = a3;
  id v9 = a2;
  v10 = (void *)[objc_alloc((Class)self) initWithBinary:v9 name:v8 length:a4 offsetIntoBinary:a5];

  return v10;
}

- (id)nonInlineSymbolAtOffsetIntoSegment:(void *)a1
{
  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    id v4 = v3[1];
    if (v4
      && (v10[0] = MEMORY[0x1E4F143A8],
          v10[1] = 3221225472,
          v10[2] = __48__SASegment_nonInlineSymbolAtOffsetIntoSegment___block_invoke,
          v10[3] = &__block_descriptor_40_e18_q16__0__SASymbol_8l,
          v10[4] = a2,
          (uint64_t v5 = SABinarySearchArray(v4, 1536, (uint64_t)v10)) != 0))
    {
      v6 = [v3[1] objectAtIndexedSubscript:v5 - 1];
      if ([v6 length]
        && (uint64_t v7 = [v6 offsetIntoSegment], objc_msgSend(v6, "length") + v7 <= a2))
      {
        id v8 = 0;
      }
      else
      {
        id v8 = v6;
      }
    }
    else
    {
      id v8 = 0;
    }
    objc_sync_exit(v3);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (SASegment)initWithBinary:(id)a3 name:(id)a4 length:(unint64_t)a5 offsetIntoBinary:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SASegment;
  v12 = [(SASegment *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_binary, v10);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_length = a5;
    v13->_offsetIntoBinary = a6;
    if (a5 >> 28)
    {
      if ([v11 containsString:@"TEXT"])
      {
        int v15 = *__error();
        v16 = _sa_logt();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          [(SASegment *)v13 debugDescription];
          int v19 = v15;
          id v17 = objc_claimAutoreleasedReturnValue();
          uint64_t v18 = [v17 UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v22 = v18;
          __int16 v23 = 2048;
          unint64_t v24 = a5;
          _os_log_fault_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);

          int v15 = v19;
        }

        *__error() = v15;
      }
    }
  }

  return v13;
}

- (id)instructionAtOffsetIntoSegment:(unint64_t)a3
{
  if (self->_length - 1 < a3)
  {
    v3 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = self;
  objc_sync_enter(v5);
  instructions = v5->_instructions;
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v3 = [(NSMutableDictionary *)instructions objectForKeyedSubscript:v7];

  if (v3)
  {
    objc_sync_exit(v5);
LABEL_5:

    goto LABEL_9;
  }
  if (!v5->_instructions)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:8];
    id v9 = v5->_instructions;
    v5->_instructions = (NSMutableDictionary *)v8;
  }
  id v10 = v5;
  v3 = (id *)objc_alloc_init((Class)self);
  id v11 = [v10 binary];
  objc_storeWeak(v3 + 3, v11);

  objc_storeWeak(v3 + 4, v10);
  v3[5] = (id)a3;
  v12 = v5->_instructions;
  v13 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v12 setObject:v3 forKeyedSubscript:v13];

  objc_sync_exit(v10);
  -[SAInstruction checkForNewSymbol]((uint64_t)v3);
  if (!v3[2])
  {
    WeakRetained = (SASegment *)objc_loadWeakRetained(v10 + 6);
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      BYTE1(WeakRetained[1].super.isa) = 1;
    }
    goto LABEL_5;
  }
LABEL_9:
  return v3;
}

- (int64_t)offsetIntoBinary
{
  return self->_offsetIntoBinary;
}

- (BOOL)isEmpty
{
  if (!a1) {
    return 0;
  }
  v1 = a1;
  objc_sync_enter(v1);
  if ([v1[7] count]) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = [v1[1] count] == 0;
  }
  objc_sync_exit(v1);

  return v2;
}

+ (id)segmentWithBinary:(void *)a3 name:(uint64_t)a4 length:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = (objc_class *)self;
  id v9 = v6;
  if ([v9 isEqualToString:@"__TEXT"]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v11 = (void *)[[v8 alloc] initWithBinary:v7 name:v9 length:a4 offsetIntoBinary:v10];

  return v11;
}

- (BOOL)hasOffsetIntoBinary
{
  return self->_offsetIntoBinary != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(void *)a1
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v3 = a1;
  objc_sync_enter(v3);
  if (!a2)
  {
LABEL_31:
    int v43 = *__error();
    v44 = _sa_logt();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = [v3 debugDescription];
      uint64_t v46 = [v45 UTF8String];
      *(_DWORD *)buf = 136315138;
      uint64_t v76 = v46;
      _os_log_error_impl(&dword_1BF22B000, v44, OS_LOG_TYPE_ERROR, "%s: setting length 0", buf, 0xCu);
    }
    *__error() = v43;
    a2 = [v3 debugDescription];
    char v47 = [(id)a2 UTF8String];
    _SASetCrashLogMessage(151, "%s: setting length 0", v48, v49, v50, v51, v52, v53, v47);

    _os_crash();
    __break(1u);
    goto LABEL_34;
  }
  if (v3[3])
  {
LABEL_34:
    int v54 = *__error();
    v55 = _sa_logt();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      id v56 = [v3 debugDescription];
      uint64_t v57 = [v56 UTF8String];
      id v58 = v3[3];
      *(_DWORD *)buf = 136315650;
      uint64_t v76 = v57;
      __int16 v77 = 2048;
      unint64_t v78 = a2;
      __int16 v79 = 2048;
      uint64_t v80 = (uint64_t)v58;
      _os_log_error_impl(&dword_1BF22B000, v55, OS_LOG_TYPE_ERROR, "%s: setting length to %llu when it was already %llu", buf, 0x20u);
    }
    *__error() = v54;
    id v59 = [v3 debugDescription];
    char v60 = [v59 UTF8String];
    _SASetCrashLogMessage(152, "%s: setting length to %llu when it was already %llu", v61, v62, v63, v64, v65, v66, v60);

    _os_crash();
    __break(1u);
    goto LABEL_37;
  }
  v3[3] = (id)a2;
  if (a2 >> 28)
  {
LABEL_37:
    int v67 = *__error();
    v68 = _sa_logt();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      id v69 = [v3 debugDescription];
      uint64_t v70 = [v69 UTF8String];
      *(_DWORD *)buf = 136315394;
      uint64_t v76 = v70;
      __int16 v77 = 2048;
      unint64_t v78 = a2;
      _os_log_fault_impl(&dword_1BF22B000, v68, OS_LOG_TYPE_FAULT, "%s has length above max: 0x%llx", buf, 0x16u);
    }
    *__error() = v67;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v4 = [v3[7] allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v71 objects:v83 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v72;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v72 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        if ([v8 unsignedLongLongValue] >= (unint64_t)v3[3])
        {
          uint64_t v9 = [v3[7] objectForKeyedSubscript:v8];
          uint64_t v10 = (id *)v9;
          if (v9)
          {
            id v11 = *(id *)(v9 + 8);
            if (v11)
            {
              id v12 = v11;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v13 = [v12 firstObject];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_28;
                }
                id v13 = v12;
              }
              v14 = v13;
              BOOL v15 = [v13 length] == 0;

              if (!v15)
              {
                int v16 = *__error();
                id v17 = _sa_logt();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  id v18 = [v3 debugDescription];
                  uint64_t v19 = [v18 UTF8String];
                  id v20 = v3[3];
                  uint64_t v21 = [v8 unsignedLongLongValue];
                  id v22 = [v10 debugDescription];
                  uint64_t v23 = [v22 UTF8String];
                  *(_DWORD *)buf = 136315906;
                  uint64_t v76 = v19;
                  __int16 v77 = 2048;
                  unint64_t v78 = (unint64_t)v20;
                  __int16 v79 = 2048;
                  uint64_t v80 = v21;
                  __int16 v81 = 2080;
                  uint64_t v82 = v23;
                  _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "%s: setting length to %llu when we have a symbol at offset %llu: %s", buf, 0x2Au);
                }
                *__error() = v16;
                id v24 = [v3 debugDescription];
                char v25 = [v24 UTF8String];
                id v12 = v3[3];
                [v8 unsignedLongLongValue];
                id v26 = [v10 debugDescription];
                [v26 UTF8String];
                _SASetCrashLogMessage(166, "%s: setting length to %llu when we have a symbol at offset %llu: %s", v27, v28, v29, v30, v31, v32, v25);

                _os_crash();
                __break(1u);
LABEL_28:
                int v33 = *__error();
                v34 = _sa_logt();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  ClassName = object_getClassName(v12);
                  *(_DWORD *)buf = 136315138;
                  uint64_t v76 = (uint64_t)ClassName;
                  _os_log_error_impl(&dword_1BF22B000, v34, OS_LOG_TYPE_ERROR, "symbol is %s", buf, 0xCu);
                }

                *__error() = v33;
                char v36 = object_getClassName(v12);
                _SASetCrashLogMessage(4151, "symbol is %s", v37, v38, v39, v40, v41, v42, v36);
                _os_crash();
                __break(1u);
                goto LABEL_31;
              }
            }
            objc_storeWeak(v10 + 3, 0);
            objc_storeWeak(v10 + 4, 0);
          }
          [v3[7] setObject:0 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_sync_exit(v3);
}

- (void)grabInstructionsFromOtherSegment:(id *)a1
{
  uint64_t v179 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    v125 = v3;
    id v5 = objc_loadWeakRetained(v3 + 6);

    if (WeakRetained != v5)
    {
      int v102 = *__error();
      v103 = _sa_logt();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      {
        id v104 = [a1 debugDescription];
        uint64_t v105 = [v104 UTF8String];
        id v106 = [v125 debugDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v166 = v105;
        __int16 v167 = 2080;
        uint64_t v168 = [v106 UTF8String];
        _os_log_error_impl(&dword_1BF22B000, v103, OS_LOG_TYPE_ERROR, "%s grabbing from %s", buf, 0x16u);
      }
      *__error() = v102;
      id v107 = [a1 debugDescription];
      char v108 = [v107 UTF8String];
      id v109 = [v125 debugDescription];
      [v109 UTF8String];
      _SASetCrashLogMessage(186, "%s grabbing from %s", v110, v111, v112, v113, v114, v115, v108);

      _os_crash();
      __break(1u);
    }
    v3 = v125;
    if ([a1 hasOffsetIntoBinary])
    {
      if ([v125 hasOffsetIntoBinary]
        && ([v125[7] count] || objc_msgSend(v125[1], "count")))
      {
        uint64_t v6 = [v125 offsetIntoBinary];
        id v7 = a1;
        objc_sync_enter(v7);
        uint64_t v8 = [v125[7] allKeys];
        uint64_t v9 = objc_msgSend(v8, "sortedArrayUsingSelector:");

        long long v163 = 0u;
        long long v164 = 0u;
        long long v161 = 0u;
        long long v162 = 0u;
        obuint64_t j = v9;
        uint64_t v136 = [obj countByEnumeratingWithState:&v161 objects:v178 count:16];
        if (v136)
        {
          id v132 = *(id *)v162;
          do
          {
            for (uint64_t i = 0; i != v136; ++i)
            {
              if (*(id *)v162 != v132) {
                objc_enumerationMutation(obj);
              }
              id v11 = *(void **)(*((void *)&v161 + 1) + 8 * i);
              uint64_t v12 = [v11 unsignedLongLongValue] + v6;
              id v13 = v7[5];
              uint64_t v14 = v12 - (void)v13;
              if (v12 >= (uint64_t)v13)
              {
                if (v12 >= (uint64_t)v13 + (uint64_t)v7[3]) {
                  goto LABEL_27;
                }
                uint64_t v15 = [v125[7] objectForKeyedSubscript:v11];
                id v16 = v7[7];
                if (!v16)
                {
                  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v125[7], "count"));
                  id v18 = v7[7];
                  v7[7] = (id)v17;

                  id v16 = v7[7];
                }
                uint64_t v19 = [NSNumber numberWithUnsignedLongLong:v14];
                id v20 = [v16 objectForKeyedSubscript:v19];

                if (v20)
                {
                  int v21 = *__error();
                  id v22 = _sa_logt();
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
                    v130 = [v7 debugDescription];
                    uint64_t v23 = [v20 debugDescription];
                    id v24 = [(id)v15 debugDescription];
                    *(_DWORD *)buf = 138412802;
                    uint64_t v166 = (uint64_t)v130;
                    __int16 v167 = 2112;
                    uint64_t v168 = (uint64_t)v23;
                    __int16 v169 = 2112;
                    uint64_t v170 = (uint64_t)v24;
                    _os_log_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: %@: have existing instruction %@ when grabbing %@, dropping grabbed instruction", buf, 0x20u);
                  }
                  *__error() = v21;
                  if (v15)
                  {
                    objc_storeWeak((id *)(v15 + 32), 0);
                    objc_storeWeak((id *)(v15 + 24), 0);
                  }
                }
                else
                {
                  if (v15)
                  {
                    objc_storeWeak((id *)(v15 + 32), v7);
                    *(void *)(v15 + 40) = v14;
                  }
                  id v25 = v7[7];
                  id v26 = [NSNumber numberWithUnsignedLongLong:v14];
                  [v25 setObject:v15 forKeyedSubscript:v26];
                }
                [v125[7] setObject:0 forKeyedSubscript:v11];
              }
            }
            uint64_t v136 = [obj countByEnumeratingWithState:&v161 objects:v178 count:16];
          }
          while (v136);
        }
LABEL_27:

        id v27 = v125[1];
        if (v27)
        {
          v160[0] = MEMORY[0x1E4F143A8];
          v160[1] = 3221225472;
          v160[2] = __46__SASegment_grabInstructionsFromOtherSegment___block_invoke;
          v160[3] = &unk_1E63F8378;
          v160[5] = v6;
          v160[4] = v7;
          unint64_t v28 = SABinarySearchArray(v27, 1280, (uint64_t)v160);
          id v29 = v125[1];
          v159[0] = MEMORY[0x1E4F143A8];
          v159[1] = 3221225472;
          v159[2] = __46__SASegment_grabInstructionsFromOtherSegment___block_invoke_2;
          v159[3] = &unk_1E63F8378;
          v159[5] = v6;
          v159[4] = v7;
          uint64_t v30 = SABinarySearchArray(v29, 1280, (uint64_t)v159);
          if (v28 < [v125[1] count])
          {
            if (v30)
            {
              unint64_t v31 = v30 - v28;
              v120 = objc_msgSend(v125[1], "subarrayWithRange:", v28, v31);
              objc_msgSend(v125[1], "removeObjectsInRange:", v28, v31);
              if (v7[1])
              {
                long long v157 = 0u;
                long long v158 = 0u;
                long long v155 = 0u;
                long long v156 = 0u;
                id v32 = v120;
                uint64_t v33 = [v32 countByEnumeratingWithState:&v155 objects:v177 count:16];
                if (!v33) {
                  goto LABEL_84;
                }
                id v123 = v32;
                unint64_t v34 = 0;
                uint64_t v126 = *(void *)v156;
                while (1)
                {
                  uint64_t v137 = 0;
                  uint64_t v128 = v33;
                  do
                  {
                    if (*(void *)v156 != v126) {
                      objc_enumerationMutation(v123);
                    }
                    v35 = *(void **)(*((void *)&v155 + 1) + 8 * v137);
                    uint64_t v36 = [v35 offsetIntoSegment];
                    uint64_t v37 = [v35 length];
                    uint64_t v39 = v36 + v6;
                    id v40 = v7[5];
                    uint64_t v41 = (uint64_t)v40 + (void)v7[3];
                    if (v37 + v36 + v6 <= v41)
                    {
                      unint64_t v42 = v39 - (void)v40;
                      if (v35) {
                        goto LABEL_40;
                      }
                    }
                    else
                    {
                      if (v35)
                      {
                        v35[2] = v41 - v39;
                        unint64_t v42 = v39 - (void)v7[5];
LABEL_40:
                        v35[1] = v42;
                        long long v153 = 0u;
                        long long v154 = 0u;
                        long long v151 = 0u;
                        long long v152 = 0u;
                        id Property = objc_getProperty(v35, v38, 32, 1);
                        char v133 = 0;
                        goto LABEL_41;
                      }
                      unint64_t v42 = v39 - (void)v40;
                    }
                    id Property = 0;
                    long long v153 = 0u;
                    long long v154 = 0u;
                    char v133 = 1;
                    long long v151 = 0u;
                    long long v152 = 0u;
LABEL_41:
                    id v44 = Property;
                    uint64_t v45 = [v44 countByEnumeratingWithState:&v151 objects:v176 count:16];
                    if (v45)
                    {
                      uint64_t v46 = *(void *)v152;
                      do
                      {
                        for (uint64_t j = 0; j != v45; ++j)
                        {
                          if (*(void *)v152 != v46) {
                            objc_enumerationMutation(v44);
                          }
                          uint64_t v48 = *(void **)(*((void *)&v151 + 1) + 8 * j);
                          uint64_t v49 = [v48 offsetIntoSegment];
                          if (v48) {
                            v48[2] = v49 + v6 - (void)v7[5];
                          }
                        }
                        uint64_t v45 = [v44 countByEnumeratingWithState:&v151 objects:v176 count:16];
                      }
                      while (v45);
                    }

                    while (v34 < [v7[1] count])
                    {
                      uint64_t v50 = [v7[1] objectAtIndexedSubscript:v34];
                      BOOL v51 = [v50 offsetIntoSegment] < v42;

                      if (!v51) {
                        break;
                      }
                      ++v34;
                    }
                    uint64_t v52 = [v7[1] objectAtIndexedSubscript:v34];
                    unint64_t v53 = [v52 offsetIntoSegment];
                    if (v53 == v42)
                    {
                      if ([v35 length])
                      {
                        if (![v52 length]
                          || (unint64_t v54 = [v35 length], v54 < objc_msgSend(v52, "length")))
                        {
                          uint64_t v55 = [v35 length];
                          if (v52) {
                            v52[2] = v55;
                          }
                        }
                      }
                      id v56 = [v52 name];
                      if (v56)
                      {
                      }
                      else
                      {
                        uint64_t v61 = [v35 name];
                        BOOL v62 = v61 == 0;

                        if (!v62)
                        {
                          uint64_t v64 = [v35 name];
                          if (v52) {
                            objc_setProperty_atomic_copy(v52, v63, v64, 24);
                          }
                        }
                      }
                    }
                    else
                    {
                      if (v34)
                      {
                        uint64_t v57 = [v7[1] objectAtIndexedSubscript:v34 - 1];
                        uint64_t v58 = [v57 offsetIntoSegment];
                        if (v42 < [v57 length] + v58)
                        {
                          uint64_t v59 = [v57 offsetIntoSegment];
                          if (v57) {
                            v57[2] = v42 - v59;
                          }
                        }
                      }
                      if ([v35 length] + v42 <= v53) {
                        char v60 = 1;
                      }
                      else {
                        char v60 = v133;
                      }
                      if ((v60 & 1) == 0) {
                        v35[2] = v53 - v42;
                      }
                      [v7[1] insertObject:v35 atIndex:v34++];
                    }

                    ++v137;
                  }
                  while (v137 != v128);
                  uint64_t v65 = [v123 countByEnumeratingWithState:&v155 objects:v177 count:16];
                  uint64_t v33 = v65;
                  if (!v65)
                  {
                    id v32 = v123;
                    goto LABEL_84;
                  }
                }
              }
              uint64_t v66 = [v120 mutableCopy];
              id v32 = v7[1];
              v7[1] = (id)v66;
LABEL_84:

              long long v149 = 0u;
              long long v150 = 0u;
              long long v147 = 0u;
              long long v148 = 0u;
              int v67 = [v125[2] allKeys];
              id v121 = [v67 sortedArrayUsingSelector:sel_compare_];

              uint64_t v68 = [v121 countByEnumeratingWithState:&v147 objects:v175 count:16];
              if (v68)
              {
                id v124 = *(id *)v148;
                do
                {
                  uint64_t v131 = 0;
                  uint64_t v138 = v68;
                  do
                  {
                    if (*(id *)v148 != v124) {
                      objc_enumerationMutation(v121);
                    }
                    v129 = *(void **)(*((void *)&v147 + 1) + 8 * v131);
                    uint64_t v69 = [v129 unsignedLongLongValue] + v6;
                    id v70 = v7[5];
                    if (v69 >= (uint64_t)v70)
                    {
                      if (v69 >= (uint64_t)v70 + (uint64_t)v7[3]) {
                        goto LABEL_121;
                      }
                      v127 = [v125[2] objectForKeyedSubscript:v129];
                      id v71 = v7[5];
                      id v72 = v7[2];
                      if (!v72)
                      {
                        uint64_t v73 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
                        id v74 = v7[2];
                        v7[2] = (id)v73;

                        id v72 = v7[2];
                      }
                      unint64_t v75 = v69 - (void)v71;
                      uint64_t v76 = [NSNumber numberWithUnsignedLongLong:v69 - (void)v71];
                      __int16 v77 = [v72 objectForKeyedSubscript:v76];
                      BOOL v78 = v77 == 0;

                      if (v78)
                      {
                        id v81 = v7[2];
                        uint64_t v82 = [NSNumber numberWithUnsignedLongLong:v75];
                        [v81 setObject:v127 forKeyedSubscript:v82];

                        long long v145 = 0u;
                        long long v146 = 0u;
                        long long v143 = 0u;
                        long long v144 = 0u;
                        id v134 = v127;
                        uint64_t v83 = [v134 countByEnumeratingWithState:&v143 objects:v174 count:16];
                        if (v83)
                        {
                          uint64_t v84 = *(void *)v144;
                          do
                          {
                            uint64_t v85 = 0;
                            do
                            {
                              if (*(void *)v144 != v84) {
                                objc_enumerationMutation(v134);
                              }
                              v86 = *(void **)(*((void *)&v143 + 1) + 8 * v85);
                              uint64_t v87 = [v86 offsetIntoSegment];
                              if (v86)
                              {
                                v86[1] = v87 + v6 - (void)v7[5];
                                long long v141 = 0u;
                                long long v142 = 0u;
                                long long v139 = 0u;
                                long long v140 = 0u;
                                id v89 = objc_getProperty(v86, v88, 32, 1);
                              }
                              else
                              {
                                id v89 = 0;
                                long long v141 = 0u;
                                long long v142 = 0u;
                                long long v139 = 0u;
                                long long v140 = 0u;
                              }
                              id v90 = v89;
                              uint64_t v91 = [v90 countByEnumeratingWithState:&v139 objects:v173 count:16];
                              if (v91)
                              {
                                uint64_t v92 = *(void *)v140;
                                do
                                {
                                  for (uint64_t k = 0; k != v91; ++k)
                                  {
                                    if (*(void *)v140 != v92) {
                                      objc_enumerationMutation(v90);
                                    }
                                    v94 = *(void **)(*((void *)&v139 + 1) + 8 * k);
                                    uint64_t v95 = [v94 offsetIntoSegment];
                                    if (v94) {
                                      v94[2] = v95 + v6 - (void)v7[5];
                                    }
                                  }
                                  uint64_t v91 = [v90 countByEnumeratingWithState:&v139 objects:v173 count:16];
                                }
                                while (v91);
                              }

                              uint64_t v68 = v138;
                              ++v85;
                            }
                            while (v85 != v83);
                            uint64_t v96 = [v134 countByEnumeratingWithState:&v143 objects:v174 count:16];
                            uint64_t v83 = v96;
                          }
                          while (v96);
                        }
                      }
                      else
                      {
                        int v79 = *__error();
                        uint64_t v80 = _sa_logt();
                        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                        {
                          id v97 = [v7 debugDescription];
                          uint64_t v118 = [v97 UTF8String];
                          uint64_t v117 = [v127 count];
                          -[SASegment nonInlineSymbolAtOffsetIntoSegment:](v7, v75);
                          id v135 = (id)objc_claimAutoreleasedReturnValue();
                          id v119 = [v135 debugDescription];
                          uint64_t v116 = [v119 UTF8String];
                          id v98 = v7[2];
                          v99 = [NSNumber numberWithUnsignedLongLong:v75];
                          v100 = [v98 objectForKeyedSubscript:v99];
                          uint64_t v101 = [v100 count];
                          *(_DWORD *)buf = 136315906;
                          uint64_t v166 = v118;
                          __int16 v167 = 2048;
                          uint64_t v168 = v117;
                          __int16 v169 = 2080;
                          uint64_t v170 = v116;
                          __int16 v171 = 2048;
                          uint64_t v172 = v101;
                          _os_log_debug_impl(&dword_1BF22B000, v80, OS_LOG_TYPE_DEBUG, "%s: throwing out %lu duplicate inline symbols for %s (already have %lu)", buf, 0x2Au);
                        }
                        *__error() = v79;
                      }
                      [v125[2] setObject:0 forKeyedSubscript:v129];
                    }
                    ++v131;
                  }
                  while (v131 != v68);
                  uint64_t v68 = [v121 countByEnumeratingWithState:&v147 objects:v175 count:16];
                }
                while (v68);
              }
LABEL_121:
            }
          }
        }

        objc_sync_exit(v7);
        v3 = v125;
      }
    }
  }
}

uint64_t __46__SASegment_grabInstructionsFromOtherSegment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40) + [a2 offsetIntoSegment];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
  BOOL v5 = v4 <= v3;
  if (v4 >= v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1;
  }
}

uint64_t __46__SASegment_grabInstructionsFromOtherSegment___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40) + [a2 offsetIntoSegment];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24) + *(void *)(*(void *)(a1 + 32) + 40);
  BOOL v5 = v4 <= v3;
  if (v4 >= v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1;
  }
}

void __32__SASegment_addTailspinSymbols___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v28 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28FE8]) initWithString:v5];
    if (([v7 scanUnsignedLongLong:&v28] & 1) == 0)
    {
      int v17 = *__error();
      id v18 = _sa_logt();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "Unable to parse offset %@", (uint8_t *)&buf, 0xCu);
      }

      *__error() = v17;
      goto LABEL_30;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v14 = *__error();
      uint64_t v15 = _sa_logt();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "Bad offset in tailspin file", (uint8_t *)&buf, 2u);
      }

      id v16 = __error();
      goto LABEL_25;
    }
    uint64_t v28 = [v5 unsignedLongLongValue];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v14 = *__error();
    uint64_t v19 = _sa_logt();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "Bad symbol dict in tailspin file", (uint8_t *)&buf, 2u);
    }

    id v16 = __error();
LABEL_25:
    int *v16 = v14;
    goto LABEL_30;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = -1;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __32__SASegment_addTailspinSymbols___block_invoke_38;
  v27[3] = &unk_1E63F83A0;
  v27[5] = &buf;
  v27[6] = v28;
  v27[4] = *(void *)(a1 + 32);
  uint64_t v8 = (void (**)(void, void, void))MEMORY[0x1C18A6C80](v27);
  ((void (**)(void, id, void))v8)[2](v8, v6, 0);
  DictGetArray(v6, @"InlineSymbols");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int v20 = *__error();
          int v21 = _sa_logt();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v22 = 0;
            _os_log_error_impl(&dword_1BF22B000, v21, OS_LOG_TYPE_ERROR, "Bad inline symbol dict in tailspin file", v22, 2u);
          }

          *__error() = v20;
          goto LABEL_29;
        }
        v8[2](v8, v13, 1);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_29:

  _Block_object_dispose(&buf, 8);
LABEL_30:
}

void __32__SASegment_addTailspinSymbols___block_invoke_38(uint64_t a1, void *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = DictGetString(v5, @"Name");
  id v7 = DictGetNumber(v5, @"Offset");
  uint64_t v8 = [v7 unsignedLongLongValue];

  id v9 = DictGetNumber(v5, @"Length");
  uint64_t v10 = [v9 unsignedLongLongValue];

  if (v8) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v6 == 0;
  }
  if (v11) {
    goto LABEL_14;
  }
  unint64_t v12 = *(void *)(a1 + 48) - v8;
  if (!a3)
  {
    uint64_t v13 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(void **)(a1 + 32), v12, v10, v6);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v12;
    goto LABEL_9;
  }
  if (v6)
  {
    uint64_t v13 = -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](*(void **)(a1 + 32), v12, v10, v6, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
LABEL_9:
    int v14 = DictGetString(v5, @"FileName");
    if (v14)
    {
      uint64_t v15 = DictGetNumber(v5, @"SourceOffset");
      uint64_t v30 = [v15 unsignedLongLongValue];

      id v16 = DictGetNumber(v5, @"SourceLength");
      uint64_t v17 = [v16 unsignedLongLongValue];

      id v18 = DictGetNumber(v5, @"LineNumber");
      int v19 = [v18 unsignedIntValue];

      int v20 = DictGetNumber(v5, @"ColNumber");
      int v21 = [v20 unsignedIntValue];

      unint64_t v22 = *(void *)(a1 + 48) - v30;
      if (a3) {
        id v23 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v22, v17, v19, v21, v14);
      }
      else {
        id v24 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v13, v22, v17, v19, v21, v14);
      }
    }

    goto LABEL_14;
  }
  int v25 = *__error();
  long long v26 = _sa_logt();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    id v27 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    uint64_t v28 = [v27 debugDescription];
    id v29 = [*(id *)(a1 + 32) debugDescription];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    unint64_t v34 = v29;
    _os_log_error_impl(&dword_1BF22B000, v26, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", buf, 0x16u);
  }
  *__error() = v25;
LABEL_14:
}

- (id)addInlineSymbolWithOffsetIntoSegment:(uint64_t)a3 length:(void *)a4 name:(unint64_t)a5 nonInlineSymbolOffsetIntoSegment:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id newValue = a4;
  if (!a1)
  {
LABEL_29:
    int v20 = 0;
    goto LABEL_18;
  }
  if (!a3)
  {
    int v29 = *__error();
    uint64_t v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [a1 debugDescription];
      uint64_t v32 = [v31 UTF8String];
      __int16 v33 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](a1, a5);
      id v34 = [v33 debugDescription];
      *(_DWORD *)long long buf = 136316162;
      uint64_t v48 = v32;
      __int16 v49 = 2080;
      uint64_t v50 = [v34 UTF8String];
      __int16 v51 = 2080;
      uint64_t v52 = [newValue UTF8String];
      __int16 v53 = 2048;
      uint64_t v54 = a2;
      __int16 v55 = 2048;
      uint64_t v56 = a2;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "%s: inlining into %s: %s (0x%llx-0x%llx) with length 0", buf, 0x34u);
    }
    *__error() = v29;
    id v35 = [a1 debugDescription];
    char v36 = [v35 UTF8String];
    uint64_t v37 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](a1, a5);
    id v38 = [v37 debugDescription];
    [v38 UTF8String];
    [newValue UTF8String];
    _SASetCrashLogMessage(481, "%s: inlining into %s: %s (0x%llx-0x%llx) with length 0", v39, v40, v41, v42, v43, v44, v36);

    _os_crash();
    __break(1u);
    goto LABEL_29;
  }
  id v9 = a1;
  objc_sync_enter(v9);
  uint64_t v10 = (void *)v9[2];
  if (!v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    unint64_t v12 = (void *)v9[2];
    v9[2] = v11;

    uint64_t v10 = (void *)v9[2];
  }
  uint64_t v13 = [NSNumber numberWithUnsignedLongLong:a5];
  int v14 = [v10 objectForKeyedSubscript:v13];

  if (!v14)
  {
    int v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    uint64_t v15 = (void *)v9[2];
    id v16 = [NSNumber numberWithUnsignedLongLong:a5];
    [v15 setObject:v14 forKeyedSubscript:v16];
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __95__SASegment_addInlineSymbolWithOffsetIntoSegment_length_name_nonInlineSymbolOffsetIntoSegment___block_invoke;
  v46[3] = &__block_descriptor_48_e18_q16__0__SASymbol_8l;
  v46[4] = a2;
  v46[5] = a3;
  uint64_t v17 = SABinarySearchArray(v14, 1536, (uint64_t)v46);
  uint64_t v18 = v17;
  if (v17)
  {
    uint64_t v19 = v17 - 1;
    while (1)
    {
      int v20 = [v14 objectAtIndexedSubscript:v19];
      if ([v20 offsetIntoSegment] != a2 || objc_msgSend(v20, "length") != a3)
      {

        goto LABEL_16;
      }
      int v21 = [v20 name];
      if (!v21) {
        break;
      }
      unint64_t v22 = [v20 name];
      int v23 = [v22 isEqualToString:newValue];

      if (v23) {
        break;
      }

      if (--v19 == -1) {
        goto LABEL_16;
      }
    }
    int v25 = [v20 name];
    BOOL v26 = v25 != 0;

    if (v20) {
      char v28 = v26;
    }
    else {
      char v28 = 1;
    }
    if ((v28 & 1) == 0) {
      objc_setProperty_atomic_copy(v20, v27, newValue, 24);
    }
  }
  else
  {
LABEL_16:
    int v20 = +[SASymbol symbolWithOffsetIntoSegment:length:name:]((uint64_t)SASymbol, a2, a3, newValue);
    [v14 insertObject:v20 atIndex:v18];
  }

  objc_sync_exit(v9);
LABEL_18:

  return v20;
}

- (void)addNonInlineSymbolWithOffsetIntoSegment:(unint64_t)a3 length:(void *)a4 name:
{
  id v7 = a4;
  if (!a1 || a1[3] - 1 < a2)
  {
    uint64_t v8 = 0;
    goto LABEL_27;
  }
  id v9 = a1;
  objc_sync_enter(v9);
  id v10 = v9[1];
  if (!v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:8];
    id v12 = v9[1];
    v9[1] = (id)v11;

    id v10 = v9[1];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__SASegment_addNonInlineSymbolWithOffsetIntoSegment_length_name___block_invoke;
  v20[3] = &__block_descriptor_40_e18_q16__0__SASymbol_8l;
  v20[4] = a2;
  unint64_t v13 = SABinarySearchArray(v10, 1280, (uint64_t)v20);
  if (v13 >= [v9[1] count]) {
    goto LABEL_20;
  }
  uint64_t v8 = [v9[1] objectAtIndexedSubscript:v13];
  if ([v8 offsetIntoSegment] != a2)
  {
    if ([v8 offsetIntoSegment] < a3 + a2) {
      a3 = [v8 offsetIntoSegment] - a2;
    }

LABEL_20:
    if (v13)
    {
      id v16 = [v9[1] objectAtIndexedSubscript:v13 - 1];
      uint64_t v17 = [v16 offsetIntoSegment];
      if ([v16 length] + v17 > a2)
      {
        uint64_t v18 = [v16 offsetIntoSegment];
        if (v16) {
          v16[2] = a2 - v18;
        }
      }
    }
    uint64_t v8 = +[SASymbol symbolWithOffsetIntoSegment:length:name:]((uint64_t)SASymbol, a2, a3, v7);
    [v9[1] insertObject:v8 atIndex:v13];
    goto LABEL_26;
  }
  if (a3 && (![v8 length] || objc_msgSend(v8, "length") > a3) && v8) {
    v8[2] = a3;
  }
  int v14 = [v8 name];

  if (v7 && !v14 && v8) {
    objc_setProperty_atomic_copy(v8, v15, v7, 24);
  }
LABEL_26:
  objc_sync_exit(v9);

LABEL_27:
  return v8;
}

uint64_t __95__SASegment_addInlineSymbolWithOffsetIntoSegment_length_name_nonInlineSymbolOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [v3 offsetIntoSegment];
  unint64_t v5 = *(void *)(a1 + 32);
  if (v5 <= v4)
  {
    if (v5 >= v4)
    {
      unint64_t v7 = [v3 length];
      unint64_t v8 = *(void *)(a1 + 40);
      BOOL v9 = v8 > v7;
      BOOL v10 = v8 < v7;
      if (v9) {
        uint64_t v6 = -1;
      }
      else {
        uint64_t v6 = v10;
      }
    }
    else
    {
      uint64_t v6 = -1;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __65__SASegment_addNonInlineSymbolWithOffsetIntoSegment_length_name___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 offsetIntoSegment];
  unint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = v4 > v3;
  if (v4 >= v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v5) {
    return 1;
  }
  else {
    return v6;
  }
}

unint64_t __34__SASegment_addInfoFromCSSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t Range = CSSymbolGetRange();
  unint64_t v8 = v7;
  Name = (void *)CSSymbolGetName();
  unint64_t v10 = Range - *(void *)(a1 + 40);
  if (!Name)
  {
    if (a4 != -1) {
      goto LABEL_7;
    }
    id v12 = 0;
LABEL_11:
    unint64_t v13 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(void **)(a1 + 32), v10, v8, v12);
    if (!v13) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
  uint64_t v11 = SANSStringForCString(Name);
  id v12 = v11;
  if (a4 == -1) {
    goto LABEL_11;
  }
  if (v11)
  {
    unint64_t v13 = -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](*(void **)(a1 + 32), v10, v8, v11, a4);
    if (!v13)
    {
LABEL_5:
      id v14 = 0;
      goto LABEL_13;
    }
LABEL_12:
    id v14 = v13;
    CSSymbolForeachSourceInfo();

    goto LABEL_13;
  }
LABEL_7:
  int v15 = *__error();
  id v16 = _sa_logt();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 32), a4);
    uint64_t v19 = [v18 debugDescription];
    int v20 = [*(id *)(a1 + 32) debugDescription];
    *(_DWORD *)long long buf = 138412546;
    unint64_t v22 = v19;
    __int16 v23 = 2112;
    id v24 = v20;
    _os_log_error_impl(&dword_1BF22B000, v16, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", buf, 0x16u);
  }
  id v12 = 0;
  id v14 = 0;
  unint64_t v10 = 0;
  *__error() = v15;
LABEL_13:

  return v10;
}

void __34__SASegment_addInfoFromCSSegment___block_invoke_46(void *a1)
{
  Path = (void *)CSSourceInfoGetPath();
  if (Path)
  {
    unint64_t v3 = SANSStringForCString(Path);
    if (v3)
    {
      id v13 = v3;
      int LineNumber = CSSourceInfoGetLineNumber();
      int Column = CSSourceInfoGetColumn();
      uint64_t Range = CSSourceInfoGetRange();
      uint64_t v8 = v7;
      BOOL v9 = (void *)a1[4];
      unint64_t v10 = Range - a1[5];
      if (a1[7] == -1) {
        id v12 = -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v10, v8, LineNumber, Column, v13);
      }
      else {
        id v11 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v10, v8, LineNumber, Column, v13);
      }
      unint64_t v3 = v13;
    }
  }
}

void __34__SASegment_addInfoFromCSSegment___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  CSSymbolForeachInlineRange();
}

uint64_t __34__SASegment_addInfoFromCSSegment___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    uint64_t v8 = result;
    result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    uint64_t v9 = a6 - 1;
    if (v9)
    {
      uint64_t v10 = a4 + 24;
      do
      {
        result = CSSymbolIsUnnamed();
        if ((result & 1) == 0) {
          result = (*(uint64_t (**)(void))(*(void *)(v8 + 32) + 16))();
        }
        v10 += 16;
        --v9;
      }
      while (v9);
    }
  }
  return result;
}

- (void)symbolicateOffsetIntoSegment:(uint64_t)a3 symbolOwner:(uint64_t)a4 segmentBaseAddress:(uint64_t)a5 returningSymbols:(id *)a6 sourceInfos:(id *)a7
{
  if (a1)
  {
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    char v36 = __Block_byref_object_copy__2;
    uint64_t v37 = __Block_byref_object_dispose__2;
    id v38 = 0;
    uint64_t v27 = 0;
    char v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = __Block_byref_object_copy__2;
    id v31 = __Block_byref_object_dispose__2;
    id v32 = 0;
    uint64_t v21 = 0;
    unint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__2;
    uint64_t v25 = __Block_byref_object_dispose__2;
    id v26 = 0;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__2;
    uint64_t v19 = __Block_byref_object_dispose__2;
    id v20 = 0;
    id v8 = a1;
    objc_sync_enter(v8);
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    int v14 = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    CSSymbolOwnerForEachStackFrameAtAddress();
    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    objc_sync_exit(v8);

    uint64_t v9 = (void *)v28[5];
    if (!v9) {
      uint64_t v9 = (void *)v34[5];
    }
    objc_storeStrong(a6, v9);
    uint64_t v10 = (void *)v16[5];
    if (!v10) {
      uint64_t v10 = (void *)v22[5];
    }
    objc_storeStrong(a7, v10);
    _Block_object_dispose(&v15, 8);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v33, 8);
  }
}

void __102__SASegment_symbolicateOffsetIntoSegment_symbolOwner_segmentBaseAddress_returningSymbols_sourceInfos___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ((CSIsNull() & 1) == 0
    && (!*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) || (CSSymbolIsUnnamed() & 1) == 0))
  {
    Name = (void *)CSSymbolGetName();
    uint64_t Range = CSSymbolGetRange();
    unint64_t v5 = v4;
    unint64_t v6 = Range - *(void *)(a1 + 88);
    if (Name)
    {
      uint64_t v7 = SANSStringForCString(Name);
      id v8 = v7;
      if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0)
      {
        if (v7)
        {
          uint64_t v9 = -[SASegment addInlineSymbolWithOffsetIntoSegment:length:name:nonInlineSymbolOffsetIntoSegment:](*(void **)(a1 + 32), v6, v5, v7, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
          if (!v9) {
            goto LABEL_20;
          }
LABEL_15:
          if ((CSIsNull() & 1) != 0 || (uint64_t Path = CSSourceInfoGetPath()) == 0)
          {
            uint64_t v21 = 0;
          }
          else
          {
            id v13 = (void *)Path;
            int LineNumber = CSSourceInfoGetLineNumber();
            int Column = CSSourceInfoGetColumn();
            id v16 = SANSStringForCString(v13);
            uint64_t v17 = CSSourceInfoGetRange();
            if (v16)
            {
              uint64_t v19 = v18;
              unint64_t v20 = v17 - *(void *)(a1 + 88);
              if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1) {
                -[SASymbol addNonInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v20, v19, LineNumber, Column, v16);
              }
              else {
              uint64_t v21 = -[SASymbol addInlineSourceInfoWithOffsetIntoSegment:length:lineNum:columnNum:filePath:](v9, v20, v19, LineNumber, Column, v16);
              }
            }
            else
            {
              uint64_t v21 = 0;
            }
          }
          uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v25 = *(void **)(v22 + 40);
          uint64_t v23 = (id *)(v22 + 40);
          id v24 = v25;
          if (!v25)
          {
            objc_storeStrong(v23, v9);
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v21);
            goto LABEL_52;
          }
          id v26 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          if (v26)
          {
            if (![v26 count])
            {
LABEL_34:
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v9];
              uint64_t v30 = *(void *)(*(void *)(a1 + 80) + 8);
              id v31 = *(void **)(v30 + 40);
              if (v21)
              {
                [*(id *)(v30 + 40) addObject:v21];
              }
              else
              {
                uint64_t v42 = [MEMORY[0x1E4F1CA98] null];
                [v31 addObject:v42];

                uint64_t v21 = 0;
              }
              goto LABEL_52;
            }
            uint64_t v27 = 0;
            while (1)
            {
              char v28 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectAtIndexedSubscript:v27];
              if (v9 == v28)
              {
                uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectAtIndexedSubscript:v27];

                if (v21 == v29)
                {
                  int v43 = *__error();
                  uint64_t v44 = _sa_logt();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  {
LABEL_54:
                    uint64_t v48 = [v9 debugDescription];
                    __int16 v49 = [v21 debugDescription];
                    *(_DWORD *)long long buf = 138412546;
                    __int16 v51 = v48;
                    __int16 v52 = 2112;
                    __int16 v53 = v49;
                    _os_log_error_impl(&dword_1BF22B000, v44, OS_LOG_TYPE_ERROR, "Same symbol/source info showed up twice in inlining: %@ %@", buf, 0x16u);
                  }
LABEL_51:

                  *__error() = v43;
                  goto LABEL_52;
                }
              }
              else
              {
              }
              if (++v27 >= (unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])goto LABEL_34; {
            }
              }
          }
          if (v9 == v24 && v21 == *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {
            int v43 = *__error();
            uint64_t v44 = _sa_logt();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
              goto LABEL_54;
            }
            goto LABEL_51;
          }
          uint64_t v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9, 0);
          uint64_t v33 = *(void *)(*(void *)(a1 + 72) + 8);
          id v34 = *(void **)(v33 + 40);
          *(void *)(v33 + 40) = v32;

          id v35 = objc_alloc(MEMORY[0x1E4F1CA48]);
          char v36 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          uint64_t v37 = v36;
          if (!v36)
          {
            uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
          }
          id v38 = v21;
          if (!v21)
          {
            id v38 = [MEMORY[0x1E4F1CA98] null];
          }
          uint64_t v39 = objc_msgSend(v35, "initWithObjects:", v37, v38, 0);
          uint64_t v40 = *(void *)(*(void *)(a1 + 80) + 8);
          uint64_t v41 = *(void **)(v40 + 40);
          *(void *)(v40 + 40) = v39;

          if (!v21) {
          if (!v36)
          }

LABEL_52:
          goto LABEL_53;
        }
LABEL_10:
        int v10 = *__error();
        id v11 = _sa_logt();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v45 = -[SASegment nonInlineSymbolAtOffsetIntoSegment:](*(void **)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
          uint64_t v46 = [v45 debugDescription];
          char v47 = [*(id *)(a1 + 32) debugDescription];
          *(_DWORD *)long long buf = 138412546;
          __int16 v51 = v46;
          __int16 v52 = 2112;
          __int16 v53 = v47;
          _os_log_error_impl(&dword_1BF22B000, v11, OS_LOG_TYPE_ERROR, "No symbol name for inline symbol (after non-inline symbol %@ in %@)", buf, 0x16u);
        }
        id v8 = 0;
        *__error() = v10;
        goto LABEL_20;
      }
    }
    else
    {
      if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0) {
        goto LABEL_10;
      }
      id v8 = 0;
    }
    uint64_t v9 = -[SASegment addNonInlineSymbolWithOffsetIntoSegment:length:name:](*(void **)(a1 + 32), v6, v5, v8);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
    if (!v9)
    {
LABEL_20:

      return;
    }
    goto LABEL_15;
  }
LABEL_53:
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (uint64_t)baseAddressInSymbolOwnerWrapper:(void *)a1
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  if (a1)
  {
    unint64_t v4 = a1;
    objc_sync_enter(v4);
    uint64_t v5 = -[SACSSymbolOwnerWrapper symbolOwner]((uint64_t)v3);
    uint64_t v7 = v6;
    if ((v3[8] & 1) != 0 && [v4 hasOffsetIntoBinary])
    {
      CSSymbolOwnerGetBaseAddress();
      [v4 offsetIntoBinary];
      CSSymbolOwnerGetSegmentWithAddress();
      if (CSIsNull())
      {
        int v8 = *__error();
        uint64_t v9 = _sa_logt();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v24 = [v4 debugDescription];
          CFUUIDBytes = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
          unsigned int v26 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
          int v27 = v26 & 3;
          int v28 = -v26;
          BOOL v19 = v28 < 0;
          int v29 = v28 & 3;
          if (v19) {
            int v30 = v27;
          }
          else {
            int v30 = -v29;
          }
          id v31 = &uuid_string_string[37 * v30];
          uuid_unparse(CFUUIDBytes, v31);
          *(_DWORD *)uint64_t v39 = 138412546;
          *(void *)&v39[4] = v24;
          *(_WORD *)&v39[12] = 2080;
          *(void *)&v39[14] = v31;
          _os_log_error_impl(&dword_1BF22B000, v9, OS_LOG_TYPE_ERROR, "%@: segment not found in %s", v39, 0x16u);
        }
        *__error() = v8;
        uint64_t Range = -1;
      }
      else
      {
        uint64_t Range = CSRegionGetRange();
      }
    }
    else
    {
      *(void *)uint64_t v39 = 0;
      *(void *)&v39[8] = v39;
      *(void *)&v39[16] = 0x2020000000;
      uint64_t v40 = -1;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __45__SASegment_baseAddressInSymbolOwnerWrapper___block_invoke;
      v32[3] = &unk_1E63F84F8;
      v32[4] = v4;
      v32[5] = v39;
      SASymbolOwnerForeachSegment(v5, v7, v32);
      uint64_t Range = *(void *)(*(void *)&v39[8] + 24);
      if (Range == -1)
      {
        int v11 = *__error();
        id v12 = _sa_logt();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v14 = [v4 debugDescription];
          uint64_t v15 = v4[4];
          id v16 = (const unsigned __int8 *)CSSymbolOwnerGetCFUUIDBytes();
          unsigned int v17 = atomic_fetch_add_explicit(&uuid_string_index, 1u, memory_order_relaxed) + 1;
          int v18 = v17 & 3;
          int v20 = -v17;
          BOOL v19 = v20 < 0;
          int v21 = v20 & 3;
          if (v19) {
            int v22 = v18;
          }
          else {
            int v22 = -v21;
          }
          uint64_t v23 = &uuid_string_string[37 * v22];
          uuid_unparse(v16, v23);
          *(_DWORD *)long long buf = 138412802;
          id v34 = v14;
          __int16 v35 = 2112;
          uint64_t v36 = v15;
          __int16 v37 = 2080;
          id v38 = v23;
          _os_log_error_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_ERROR, "%@: segment %@ not found in %s", buf, 0x20u);
        }
        *__error() = v11;
        uint64_t Range = *(void *)(*(void *)&v39[8] + 24);
      }
      _Block_object_dispose(v39, 8);
    }
    objc_sync_exit(v4);
  }
  else
  {
    uint64_t Range = 0;
  }

  return Range;
}

void __45__SASegment_baseAddressInSymbolOwnerWrapper___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == -1)
  {
    Name = (void *)CSRegionGetName();
    if (Name)
    {
      unint64_t v3 = SANSStringForCString(Name);
      CopyCleanSegmentName(v3);
      id v4 = (id)objc_claimAutoreleasedReturnValue();

      if ([v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 32)]) {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = CSRegionGetRange();
      }
    }
  }
}

- (void)symbolicateWithSymbolOwnerWrapper:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1C18A6A20]();
    uint64_t v5 = a1;
    objc_sync_enter(v5);
    if (![v5[7] count] || (uint64_t v6 = -[SASegment baseAddressInSymbolOwnerWrapper:](v5, v3), v6 == -1))
    {
      objc_sync_exit(v5);
    }
    else
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5[7], "count"));
      uint64_t v8 = -[SACSSymbolOwnerWrapper symbolOwner]((uint64_t)v3);
      id v9 = v5[7];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __47__SASegment_symbolicateWithSymbolOwnerWrapper___block_invoke;
      v24[3] = &unk_1E63F8520;
      v24[4] = v5;
      uint64_t v26 = v8;
      uint64_t v27 = v10;
      uint64_t v28 = v6;
      id v11 = v7;
      id v25 = v11;
      [v9 enumerateKeysAndObjectsUsingBlock:v24];

      objc_sync_exit(v5);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            unsigned int v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", 0, (void)v20);
            int v18 = [v16 objectAtIndexedSubscript:1];
            if ((unint64_t)[v16 count] < 3)
            {
              BOOL v19 = 0;
            }
            else
            {
              BOOL v19 = [v16 objectAtIndexedSubscript:2];
            }
            -[SAInstruction setSymbol:sourceinfo:](v17, v18, v19);
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v29 count:16];
        }
        while (v13);
      }
    }
  }
}

void __47__SASegment_symbolicateWithSymbolOwnerWrapper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5 || !*((void *)v5 + 2))
  {
    id v13 = 0;
    id v14 = 0;
    -[SASegment symbolicateOffsetIntoSegment:symbolOwner:segmentBaseAddress:returningSymbols:sourceInfos:](*(void **)(a1 + 32), [v12 unsignedLongLongValue], *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), &v14, &v13);
    id v7 = v14;
    if (v14)
    {
      uint64_t v8 = *(void **)(a1 + 40);
      id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
      id v10 = v13;
      id v11 = objc_msgSend(v9, "initWithObjects:", v6, v7, v13, 0);
      [v8 addObject:v11];
    }
    else
    {
      id v10 = v13;
    }
  }
}

uint64_t __48__SASegment_nonInlineSymbolAtOffsetIntoSegment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void *)(a1 + 32);
  if (v4 >= [v3 offsetIntoSegment])
  {
    unint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = v6 > [v3 offsetIntoSegment];
  }
  else
  {
    uint64_t v5 = -1;
  }

  return v5;
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  uint64_t v5 = [WeakRetained name];
  id v6 = objc_loadWeakRetained((id *)&self->_binary);
  id v7 = [v6 uuid];
  uint64_t v8 = [v7 UUIDString];
  id v9 = (void *)[v3 initWithFormat:@"%@ <%@> %@ (offset 0x%llx length 0x%llx, %lu symbols)", v5, v8, self->_name, self->_offsetIntoBinary, self->_length, -[NSMutableArray count](self->_symbols, "count")];

  return (NSString *)v9;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (SABinary)binary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  return (SABinary *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_destroyWeak((id *)&self->_binary);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inlineSymbols, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v8 = v4;
  if (name) {
    SAJSONWriteDictionaryFirstEntry(v4, @"name", name);
  }
  if (self->_length)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    SAJSONWriteDictionaryEntry(v8, @"length", v6);
  }
  if ([(SASegment *)self hasOffsetIntoBinary])
  {
    id v7 = [NSNumber numberWithLongLong:self->_offsetIntoBinary];
    SAJSONWriteDictionaryEntry(v8, @"offsetIntoBinary", v7);
  }
}

+ (id)classDictionaryKey
{
  return @"SASegment";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 114;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SASegment *)self sizeInBytesForSerializedVersion] > a4)
  {
    int v16 = *__error();
    unsigned int v17 = _sa_logt();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(SASegment *)self debugDescription];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v39 = [v18 UTF8String];
      __int16 v40 = 2048;
      unint64_t v41 = a4;
      __int16 v42 = 2048;
      unint64_t v43 = [(SASegment *)self sizeInBytesForSerializedVersion];
      _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "%s: size %lu > buffer length %lu", buf, 0x20u);
    }
    *__error() = v16;
    id v19 = [(SASegment *)self debugDescription];
    char v20 = [v19 UTF8String];
    [(SASegment *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(4931, "%s: size %lu > buffer length %lu", v21, v22, v23, v24, v25, v26, v20);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
  if (!WeakRetained) {
    goto LABEL_11;
  }
  id v10 = WeakRetained;
  *(_WORD *)&a3->var0 = 513;
  *(void *)&a3->var3[64] = self->_offsetIntoBinary;
  *(int64_t *)((char *)&a3->var4 + 2) = self->_length;
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v8);
  id v11 = objc_loadWeakRetained((id *)&self->_binary);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(v11, v8);

  id v12 = [(NSString *)self->_name dataUsingEncoding:4 allowLossyConversion:1];
  if ((unint64_t)[v12 length] >= 0x40)
  {
LABEL_8:
    int v27 = *__error();
    uint64_t v28 = _sa_logt();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = [(NSString *)self->_name UTF8String];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v39 = (uint64_t)v29;
      __int16 v40 = 2048;
      unint64_t v41 = 63;
      _os_log_error_impl(&dword_1BF22B000, v28, OS_LOG_TYPE_ERROR, "Segment %s longer than %lu characters", buf, 0x16u);
    }

    *__error() = v27;
    char v30 = (char)[(NSString *)self->_name UTF8String];
    _SASetCrashLogMessage(4950, "Segment %s longer than %lu characters", v31, v32, v33, v34, v35, v36, v30);
    _os_crash();
    __break(1u);
LABEL_11:
    id v37 = +[SAException exceptionWithName:@"Encoding failure" reason:@"Segment with no binary" userInfo:0];
    objc_exception_throw(v37);
  }
  id v13 = v12;
  memmove(a3->var3, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
  a3->var3[[v13 length]] = 0;
  id v14 = [v10 uuid];
  [v14 getUUIDBytes:a3->var2];

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  id v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_binary);
    [WeakRetained addSelfToSerializationDictionary:v7];

    [(NSString *)self->_name addSelfToSerializationDictionary:v7];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = (unint64_t)a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 3u) {
    goto LABEL_36;
  }
  if (a4 <= 0x61)
  {
    int v29 = *__error();
    char v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      *(void *)BOOL v78 = a4;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = 98;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASegment struct %lu", buf, 0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(4973, "bufferLength %lu < serialized SASegment struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  id v11 = v10;
  if (*((unsigned __int8 *)a3 + 1) < 2u) {
    goto LABEL_9;
  }
  if (a4 <= 0x71)
  {
LABEL_27:
    int v49 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      *(void *)BOOL v78 = a4;
      *(_WORD *)&v78[8] = 2048;
      *(void *)&v78[10] = 114;
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASegment v2 struct %lu", buf, 0x16u);
    }

    *__error() = v49;
    _SASetCrashLogMessage(4980, "bufferLength %lu < serialized SASegment v2 struct %lu", v50, v51, v52, v53, v54, v55, a4);
    _os_crash();
    __break(1u);
    goto LABEL_30;
  }
  unint64_t v12 = *(void *)((char *)a3 + 98);
  id v13 = objc_opt_class();
  a4 = SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, (void *)v9, v11, v13);
  unint64_t v14 = *(void *)((char *)a3 + 106);
  uint64_t v15 = objc_opt_class();
  int v16 = SASerializablePartiallyDecodedNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v14, (void *)v9, v11, v15);
  if (!a4)
  {
    unint64_t v9 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)BOOL v78 = [v16 UTF8String];
      _os_log_error_impl(&dword_1BF22B000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "No binary for segment %s", buf, 0xCu);
    }

    *__error() = v9;
    char v17 = [v16 UTF8String];
    _SASetCrashLogMessage(4992, "No binary for segment %s", v18, v19, v20, v21, v22, v23, v17);
    _os_crash();
    __break(1u);
LABEL_9:
    a4 = gSASerializationEncodedVersionBeingDecoded();
    if (*(uint64_t *)a4 >= 31)
    {
LABEL_30:
      int v56 = *__error();
      uint64_t v57 = _sa_logt();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        int v58 = *((unsigned __int8 *)a3 + 1);
        uint64_t v59 = *(void *)a4;
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)BOOL v78 = v58;
        *(_WORD *)&v78[4] = 2048;
        *(void *)&v78[6] = v59;
        _os_log_error_impl(&dword_1BF22B000, v57, OS_LOG_TYPE_ERROR, "segment version %d, but encoded version %ld", buf, 0x12u);
      }

      *__error() = v56;
      _SASetCrashLogMessage(4985, "segment version %d, but encoded version %ld", v60, v61, v62, v63, v64, v65, *((unsigned char *)a3 + 1));
      _os_crash();
      __break(1u);
      goto LABEL_33;
    }
    uint64_t v24 = *(void **)gBinaryBeingDecoded(&gBinaryBeingDecoded);
    if (!v24)
    {
LABEL_33:
      int v66 = *__error();
      int v67 = _sa_logt();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        int v68 = *((unsigned __int8 *)a3 + 1);
        uint64_t v69 = *(void *)a4;
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)BOOL v78 = v68;
        *(_WORD *)&v78[4] = 2048;
        *(void *)&v78[6] = v69;
        _os_log_error_impl(&dword_1BF22B000, v67, OS_LOG_TYPE_ERROR, "Segment version %d, encoded version %ld, no gBinaryBeingDecoded", buf, 0x12u);
      }

      *__error() = v66;
      _SASetCrashLogMessage(4986, "Segment version %d, encoded version %ld, no gBinaryBeingDecoded", v70, v71, v72, v73, v74, v75, *((unsigned char *)a3 + 1));
      _os_crash();
      __break(1u);
LABEL_36:
      id v76 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SASegment version" userInfo:0];
      objc_exception_throw(v76);
    }
    a4 = v24;
    int v16 = SANSStringForCString((char *)a3 + 18);
  }
  if (!v16)
  {
LABEL_24:
    int v37 = *__error();
    id v38 = _sa_logt();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      id v39 = [(id)a4 debugDescription];
      uint64_t v40 = [v39 UTF8String];
      *(_DWORD *)long long buf = 136315138;
      *(void *)BOOL v78 = v40;
      _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "No name for segment in %s", buf, 0xCu);
    }
    *__error() = v37;
    id v41 = [(id)a4 debugDescription];
    char v42 = [v41 UTF8String];
    _SASetCrashLogMessage(4993, "No name for segment in %s", v43, v44, v45, v46, v47, v48, v42);

    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v25 = -[SABinary segmentWithCleanName:]((void *)a4, v16);
  if (v25)
  {
    uint64_t v26 = v25;
    if (![v25 length])
    {
      unint64_t v27 = *(void *)((char *)a3 + 90);
      if (v27) {
        -[SASegment setLength:](v26, v27);
      }
    }
    if (([v26 hasOffsetIntoBinary] & 1) == 0) {
      v26[5] = *(void *)((char *)a3 + 82);
    }
  }
  else
  {
    uint64_t v26 = +[SASegment segmentWithBinary:name:length:offsetIntoBinary:]((uint64_t)SASegment, (void *)a4, v16, *(void *)((char *)a3 + 90), *(void *)((char *)a3 + 82));
    -[SABinary addSegment:]((void *)a4, v26);
  }

  return v26;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v24 = a5;
  id v9 = a6;
  if (*((unsigned __int8 *)a3 + 1) >= 2u)
  {
    if (a4 <= 0x71)
    {
      int v16 = *__error();
      char v17 = _sa_logt();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134218240;
        unint64_t v26 = a4;
        __int16 v27 = 2048;
        uint64_t v28 = 114;
        _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SASegment v2 struct %lu", buf, 0x16u);
      }

      *__error() = v16;
      _SASetCrashLogMessage(5015, "bufferLength %lu < serialized SASegment v2 struct %lu", v18, v19, v20, v21, v22, v23, a4);
      _os_crash();
      __break(1u);
    }
    unint64_t v10 = *(void *)((char *)a3 + 98);
    id v11 = objc_opt_class();
    id v12 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v10, v24, v9, v11);
    unint64_t v13 = *(void *)((char *)a3 + 106);
    unint64_t v14 = objc_opt_class();
    id v15 = SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v13, v24, v9, v14);
  }
}

@end