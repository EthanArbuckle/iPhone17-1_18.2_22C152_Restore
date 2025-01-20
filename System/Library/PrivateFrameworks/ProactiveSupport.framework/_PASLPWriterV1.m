@interface _PASLPWriterV1
+ (dispatch_data_t)_mappedDataWithPlist:(int)a3 fd:(unint64_t)a4 ofs:(id *)a5 error:;
+ (id)dataWithPropertyList:(id)a3 error:(id *)a4;
+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 startOfs:(int64_t *)a5 error:(id *)a6;
+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 error:(id *)a5;
+ (uint64_t)_scanPlist:(unint64_t)a3 recursionDepth:(uint64_t *)a4 sizeUpperBound:(void *)a5 allDictionaryKeys:(id *)a6 error:;
+ (uint64_t)_valueWordForObjectGraph:(uint64_t)a3 allocContext:(unint64_t)a4 recursionDepth:;
+ (uint64_t)_visitObject:(uint64_t)a3 context:(void *)a4 handleBoolean:(void *)a5 handleInt64:(void *)a6 handleFloat64:(void *)a7 handleTimeInterval:(void *)a8 handleData:(void *)a9 handleString:(void *)a10 handleDict:(void *)a11 handleArray:(void *)a12 handleOther:;
@end

@implementation _PASLPWriterV1

+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 startOfs:(int64_t *)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (v11)
  {
    if ((a4 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"_PASLPWriterV1.m", 233, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];

    if ((a4 & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"_PASLPWriterV1.m", 234, @"Invalid parameter not satisfying: %@", @"fd >= 0" object file lineNumber description];

LABEL_3:
  id v27 = 0;
  v12 = (void *)MEMORY[0x1A62450A0]();
  memset(&v26, 0, sizeof(v26));
  if (fstat(a4, &v26))
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v15 = *__error();
    uint64_t v30 = *MEMORY[0x1E4F28568];
    id v16 = [NSString alloc];
    v17 = __error();
    v18 = strerror(*v17);
    v19 = objc_msgSend(v16, "initWithFormat:", @"stat() failure: %s (%d)", v18, *__error());
    v31[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v27 = (id)[v13 initWithDomain:v14 code:v15 userInfo:v20];

    v21 = 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      off_t st_size = v26.st_size;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASLazyPlist: Appending to fd beginning at file offset %lld", buf, 0xCu);
    }
    off_t v22 = v26.st_size;
    if (a5) {
      *a5 = v26.st_size;
    }
    v21 = +[_PASLPWriterV1 _mappedDataWithPlist:fd:ofs:error:]((uint64_t)a1, v11, a4, v22, &v27);
  }
  if (a6 && !v21) {
    *a6 = v27;
  }

  return v21;
}

+ (dispatch_data_t)_mappedDataWithPlist:(int)a3 fd:(unint64_t)a4 ofs:(id *)a5 error:
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v116 = self;
  if (!v8)
  {
    v75 = [MEMORY[0x1E4F28B00] currentHandler];
    [v75 handleFailureInMethod:sel__mappedDataWithPlist_fd_ofs_error_, v116, @"_PASLPWriterV1.m", 939, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];
  }
  int v112 = a3;
  if (a3 <= -2)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:sel__mappedDataWithPlist_fd_ofs_error_, v116, @"_PASLPWriterV1.m", 940, @"Invalid parameter not satisfying: %@", @"fd >= -1" object file lineNumber description];
  }
  unint64_t v113 = a4;
  if ((a4 & 0x8000000000000000) != 0)
  {
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:sel__mappedDataWithPlist_fd_ofs_error_, v116, @"_PASLPWriterV1.m", 941, @"Invalid parameter not satisfying: %@", @"ofs >= 0" object file lineNumber description];
  }
  unint64_t v118 = 0;
  v117 = v8;
  v114 = a5;
  v115 = objc_opt_new();
  if ((+[_PASLPWriterV1 _scanPlist:recursionDepth:sizeUpperBound:allDictionaryKeys:error:](v116, v8, 0, (uint64_t *)&v118, v115, a5) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
LABEL_83:
    v74 = *v114;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v74;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    goto LABEL_14;
  }
  BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
  unint64_t v10 = v118;
  if (v9)
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v118;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASLazyPlist: _mappedDataWithPlist: _PASLazyPlist size over-estimate: %zu bytes", buf, 0xCu);
  }
  if (v10 >> 29)
  {
    id v11 = objc_opt_new();
    [v11 setObject:@"The object is too large to serialize as _PASLazyPlist." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v11 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v13 = (void *)[v11 copy];
    uint64_t v14 = [v12 initWithDomain:@"_PASLazyPlistErrorDomain" code:7 userInfo:v13];

    uint64_t v15 = *v114;
    *v114 = (void *)v14;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_83;
    }
LABEL_14:
    dispatch_data_t v16 = 0;
    goto LABEL_15;
  }
  off_t v18 = a4 / *MEMORY[0x1E4F14B00] * *MEMORY[0x1E4F14B00];
  unint64_t v108 = a4 % *MEMORY[0x1E4F14B00];
  size_t v109 = v10;
  size_t v111 = v108 + v10;
  if (v112 == -1)
  {
    if (a4)
    {
      v100 = [MEMORY[0x1E4F28B00] currentHandler];
      [v100 handleFailureInMethod:sel__mappedDataWithPlist_fd_ofs_error_, v116, @"_PASLPWriterV1.m", 969, @"Invalid parameter not satisfying: %@", @"ofs == 0" object file lineNumber description];
    }
    v110 = (char *)mmap(0, v111, 3, 4098, -1, v18);
  }
  else
  {
    uint64_t v19 = v10 + a4;
    if (ftruncate(v112, v10 + a4))
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *__error();
      uint64_t v135 = *MEMORY[0x1E4F28568];
      id v22 = [NSString alloc];
      v23 = __error();
      v24 = strerror(*v23);
      v25 = objc_msgSend(v22, "initWithFormat:", @"Failed to ftruncate file to size %zu bytes: %s (%d)", v19, v24, *__error());
      v136 = v25;
      stat v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      uint64_t v27 = [v20 initWithDomain:*MEMORY[0x1E4F28798] code:v21 userInfo:v26];
      id v28 = *a5;
      *a5 = (id)v27;

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_83;
      }
      goto LABEL_14;
    }
    v110 = (char *)mmap(0, v111, 3, 1, v112, v18);
  }
  if (v110 == (char *)-1)
  {
    id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v66 = *__error();
    uint64_t v133 = *MEMORY[0x1E4F28568];
    id v67 = [NSString alloc];
    v68 = __error();
    v69 = strerror(*v68);
    v70 = objc_msgSend(v67, "initWithFormat:", @"Failed to map buffer of size %zu bytes: %s (%d)", v109, v69, *__error());
    v134 = v70;
    v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
    uint64_t v72 = [v65 initWithDomain:*MEMORY[0x1E4F28798] code:v66 userInfo:v71];
    id v73 = *a5;
    *a5 = (id)v72;

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    goto LABEL_83;
  }
  id v107 = v8;
  id v29 = v115;
  uint64_t v105 = self;
  Mutable = CFSetCreateMutable(0, 0, &bufferDescrCallbacks);
  if (!Mutable)
  {
    v78 = [MEMORY[0x1E4F28B00] currentHandler];
    [v78 handleFailureInMethod:sel__writePlist_allDictionaryKeys_toBuffer_size_actSize_ object:v105 file:@"_PASLPWriterV1.m" lineNumber:857 description:@"Failed to allocate buffer set"];
  }
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke;
  v128[3] = &__block_descriptor_40_e5_v8__0l;
  v128[4] = Mutable;
  id v106 = (id)MEMORY[0x1A6245320](v128);
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  memset(buf, 0, sizeof(buf));
  *(void *)buf = [v29 count];
  v124[0] = &v110[v108];
  v124[1] = &v110[v108 + v109];
  CFMutableSetRef theSet = Mutable;
  v126 = &v110[v108];
  buffer = &v110[v108];
  v127 = buf;
  uint64_t v31 = bumpChecked((uint64_t)v124, 16);
  *(_DWORD *)uint64_t v31 = 22039632;
  *(void *)(v31 + 8) = 0;
  *(_DWORD *)(v31 + 4) = 0;
  context = (void *)MEMORY[0x1A62450A0]();
  v32 = malloc_type_malloc(8 * [v29 count], 0x50040EE9192B6uLL);
  v33 = v32;
  if (!v32)
  {
    id v101 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v101);
  }
  v123[0] = MEMORY[0x1E4F143A8];
  v123[1] = 3221225472;
  v123[2] = __70___PASLPWriterV1__writePlist_allDictionaryKeys_toBuffer_size_actSize___block_invoke_2;
  v123[3] = &__block_descriptor_40_e5_v8__0l;
  v123[4] = v32;
  v103 = (void (**)(void))MEMORY[0x1A6245320](v123);
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v34 = v29;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v119 objects:v144 count:16];
  if (v35)
  {
    uint64_t v36 = 0;
    uint64_t v37 = *(void *)v120;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v120 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = [*(id *)(*((void *)&v119 + 1) + 8 * i) UTF8String];
        if (!v39)
        {
          v40 = [MEMORY[0x1E4F28B00] currentHandler];
          [v40 handleFailureInMethod:sel__writePlist_allDictionaryKeys_toBuffer_size_actSize_ object:v105 file:@"_PASLPWriterV1.m" lineNumber:886 description:@"dictionary key is not Unicode"];
        }
        v33[v36 + i] = v39;
      }
      uint64_t v35 = [v34 countByEnumeratingWithState:&v119 objects:v144 count:16];
      v36 += i;
    }
    while (v35);
  }

  qsort_b(v33, [v34 count], 8uLL, &__block_literal_global_143);
  unint64_t v41 = 0;
  *(_DWORD *)(v31 + 4) = v126 - LODWORD(v124[0]);
  while (v41 < [v34 count])
  {
    size_t v42 = strlen((const char *)v33[v41]) + 1;
    v43 = (void *)bumpChecked((uint64_t)v124, v42);
    memcpy(v43, (const void *)v33[v41], v42);
    *(void *)value = v43;
    *(void *)&value[8] = v42 | 0x100000000;
    v44 = theSet;
    ++*((void *)v127 + 15);
    CFSetAddValue(v44, value);
    ++v41;
  }
  *(_DWORD *)(v31 + 8) = v126 - LODWORD(v124[0]);
  if (v103) {
    v103[2](v103);
  }

  int v45 = +[_PASLPWriterV1 _valueWordForObjectGraph:allocContext:recursionDepth:](v105, v107, (uint64_t)v124, 0);
  alignChecked(v124, 4uLL);
  v46 = (_DWORD *)bumpChecked((uint64_t)v124, 4);
  _DWORD *v46 = v45;
  uint64_t v47 = v124[0];
  *(_DWORD *)(v31 + 12) = v46 - LODWORD(v124[0]);
  size_t v48 = (size_t)&v126[-v47];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(void *)&value[4] = v48;
    *(_WORD *)&value[12] = 2048;
    *(void *)&value[14] = &v110[v108];
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Successfully constructed _PASLazyPlist of size %zu bytes in buffer %p .  Object graph statistics:", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = *(void *)&buf[8];
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boolean:        %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = *(void *)&buf[16];
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged integer: %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = *(void *)&buf[24];
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed integer:  %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = v146;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Tagged real:    %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = *((void *)&v146 + 1);
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed real:     %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = v147;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Date:           %tu", value, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(void *)&value[4] = *((void *)&v147 + 1);
    *(_WORD *)&value[12] = 2048;
    *(void *)&value[14] = *(void *)buf;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: String:         %tu (%tu unique dictionary keys)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(void *)&value[4] = v148;
    *(_WORD *)&value[12] = 2048;
    *(void *)&value[14] = *((void *)&v148 + 1);
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Data:           %tu (%tu total bytes)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(void *)&value[4] = v150;
    *(_WORD *)&value[12] = 2048;
    *(void *)&value[14] = *((void *)&v150 + 1);
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Dictionary:     %tu (%tu total key/value mappings)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(void *)&value[4] = v149;
    *(_WORD *)&value[12] = 2048;
    *(void *)&value[14] = *((void *)&v149 + 1);
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Array:          %tu (%tu total elements)", value, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134217984;
    *(void *)&value[4] = v151;
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Object graph maximum depth: %tu", value, 0xCu);
  }
  uint64_t v49 = *((void *)&v151 + 1);
  if (*((void *)&v151 + 1) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)value = 134218240;
    *(void *)&value[4] = v49;
    *(_WORD *)&value[12] = 2048;
    *(void *)&value[14] = v150
                          + v149
                          + v148
                          + *((void *)&v147 + 1)
                          + v147
                          + *((void *)&v146 + 1)
                          + *(void *)&buf[24];
    _os_log_debug_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "_PASLazyPlist: Boxed allocations: %tu (referenced by %tu total pointers)", value, 0x16u);
  }
  uint64_t v50 = +[_PASLazyPlist serializationStatsHandler];
  v51 = (void *)v50;
  if (v50)
  {
    v52 = *(void (**)(uint64_t, unsigned char *))(v50 + 16);
    long long v140 = v148;
    long long v141 = v149;
    long long v142 = v150;
    long long v143 = v151;
    *(_OWORD *)value = *(_OWORD *)buf;
    *(_OWORD *)&value[16] = *(_OWORD *)&buf[16];
    long long v138 = v146;
    long long v139 = v147;
    v52(v50, value);
  }

  v53 = v106;
  if (v106)
  {
    (*((void (**)(void))v106 + 2))();
    v53 = v106;
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v48;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "_PASLazyPlist: _mappedDataWithPlist: _PASLazyPlist actual size: %zu bytes", buf, 0xCu);
  }
  size_t v54 = v109;
  int v55 = v112;
  if (v48 > v109)
  {
    v79 = [MEMORY[0x1E4F28B00] currentHandler];
    [v79 handleFailureInMethod:sel__mappedDataWithPlist_fd_ofs_error_, v116, @"_PASLPWriterV1.m", 1009, @"Invalid parameter not satisfying: %@", @"actSize <= sizeUpperBound" object file lineNumber description];

    int v55 = v112;
    size_t v54 = v109;
    if (v112 < 0) {
      goto LABEL_85;
    }
  }
  else if (v112 < 0)
  {
    goto LABEL_85;
  }
  int v55 = v112;
  if (msync(v110, v111, 16))
  {
    id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v57 = *__error();
    uint64_t v131 = *MEMORY[0x1E4F28568];
    id v58 = [NSString alloc];
    v59 = __error();
    v60 = strerror(*v59);
    v61 = objc_msgSend(v58, "initWithFormat:", @"Failed to msync file content of size %zu bytes: %s (%d)", v48, v60, *__error());
    v132 = v61;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
    uint64_t v63 = [v56 initWithDomain:*MEMORY[0x1E4F28798] code:v57 userInfo:v62];
    v64 = *v114;
    *v114 = (void *)v63;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_99;
    }
    goto LABEL_92;
  }
LABEL_85:
  unint64_t v80 = (unint64_t)&buffer[v48 - 1 + *MEMORY[0x1E4F14B00]] / *MEMORY[0x1E4F14B00] * *MEMORY[0x1E4F14B00];
  if ((unint64_t)&buffer[v54] > v80)
  {
    int v55 = v112;
    if (munmap((void *)v80, (size_t)&buffer[v54 - v80]))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        v81 = __error();
        v82 = strerror(*v81);
        int v83 = *__error();
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = v82;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v83;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: Warning: failed to unmap unused tail: %s (%d)", buf, 0x12u);
        int v55 = v112;
      }
    }
  }
  size_t v111 = v48 + v108;
  if ((v55 & 0x80000000) == 0 && ftruncate(v55, v48 + v113))
  {
    id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v85 = *__error();
    uint64_t v129 = *MEMORY[0x1E4F28568];
    id v86 = [NSString alloc];
    v87 = __error();
    v88 = strerror(*v87);
    v89 = objc_msgSend(v86, "initWithFormat:", @"Failed to ftruncate file to size %zu bytes: %s (%d)", v48, v88, *__error());
    v130 = v89;
    v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
    uint64_t v91 = [v84 initWithDomain:*MEMORY[0x1E4F28798] code:v85 userInfo:v90];
    v92 = *v114;
    *v114 = (void *)v91;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_99:
      v99 = *v114;
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v99;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }
LABEL_92:
    if (munmap(v110, v111) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v93 = __error();
      v94 = strerror(*v93);
      int v95 = *__error();
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v94;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v95;
      _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: Warning: failed to unmap in failure recovery: %s (%d)", buf, 0x12u);
    }
    goto LABEL_14;
  }
  if (mprotect(v110, v111, 1) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v96 = __error();
    v97 = strerror(*v96);
    int v98 = *__error();
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v97;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v98;
    _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "_PASLazyPlist: Warning: failed to mprotect mapping: %s (%d)", buf, 0x12u);
  }
  dispatch_data_t v16 = dispatch_data_create(buffer, v48, 0, (dispatch_block_t)*MEMORY[0x1E4F143F8]);
LABEL_15:

  return v16;
}

+ (uint64_t)_scanPlist:(unint64_t)a3 recursionDepth:(uint64_t *)a4 sizeUpperBound:(void *)a5 allDictionaryKeys:(id *)a6 error:
{
  id v10 = a2;
  id v11 = a5;
  uint64_t v12 = self;
  if (!a6)
  {
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:sel__scanPlist_recursionDepth_sizeUpperBound_allDictionaryKeys_error_, v12, @"_PASLPWriterV1.m", 359, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  if (a3 < 0x65)
  {
    uint64_t v17 = *a4;
    unint64_t v28 = a3;
    uint64_t v29 = v17;
    id v30 = v11;
    id obj = *a6;
    uint64_t v18 = +[_PASLPWriterV1 _visitObject:context:handleBoolean:handleInt64:handleFloat64:handleTimeInterval:handleData:handleString:handleDict:handleArray:handleOther:](v12, v10, (uint64_t)&v28, &__block_literal_global_4038, &__block_literal_global_40, &__block_literal_global_43, &__block_literal_global_45_4039, &__block_literal_global_48, &__block_literal_global_51, &__block_literal_global_57_4040, &__block_literal_global_68, &__block_literal_global_72);
    if (v18)
    {
      id v19 = obj;
      *a4 = v29 + 19;
      objc_storeStrong(a6, v19);
      id v20 = v30;
      id v30 = 0;

      id v21 = obj;
      id obj = 0;
    }
  }
  else
  {
    id v13 = (id)[[NSString alloc] initWithFormat:@"plist object graph exceeds maximum depth %tu, or contains a cycle", 100];
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = v14;
    if (v13)
    {
      dispatch_data_t v16 = (void *)[[NSString alloc] initWithFormat:@"The object is too large to serialize as _PASLazyPlist: %@", v13];
      [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    else
    {
      [v14 setObject:@"The object is too large to serialize as _PASLazyPlist." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    [v15 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28588]];

    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    v23 = (void *)[v15 copy];
    uint64_t v24 = [v22 initWithDomain:@"_PASLazyPlistErrorDomain" code:7 userInfo:v23];

    id v25 = *a6;
    *a6 = (id)v24;

    uint64_t v18 = 0;
  }

  return v18;
}

+ (uint64_t)_valueWordForObjectGraph:(uint64_t)a3 allocContext:(unint64_t)a4 recursionDepth:
{
  id v6 = a2;
  uint64_t v7 = self;
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a3 + 32);
  unint64_t v10 = *(void *)(v9 + 112);
  if (v10 <= a4) {
    unint64_t v10 = a4;
  }
  *(void *)(v9 + 112) = v10;
  uint64_t v15 = a3;
  uint64_t v16 = 0;
  unint64_t v17 = a4;
  char v11 = +[_PASLPWriterV1 _visitObject:context:handleBoolean:handleInt64:handleFloat64:handleTimeInterval:handleData:handleString:handleDict:handleArray:handleOther:](v7, v6, (uint64_t)&v15, &__block_literal_global_82, &__block_literal_global_84_3972, &__block_literal_global_86, &__block_literal_global_91, &__block_literal_global_93, &__block_literal_global_99, &__block_literal_global_105, &__block_literal_global_120, 0);

  if ((v11 & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:sel__valueWordForObjectGraph_allocContext_recursionDepth_, v8, @"_PASLPWriterV1.m", 841, @"Invalid parameter not satisfying: %@", @"ok" object file lineNumber description];
  }
  if (!BYTE4(v16))
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:sel__valueWordForObjectGraph_allocContext_recursionDepth_, v8, @"_PASLPWriterV1.m", 842, @"Invalid parameter not satisfying: %@", @"valueWordContext.hasValueWord" object file lineNumber description];
  }
  return v16;
}

+ (uint64_t)_visitObject:(uint64_t)a3 context:(void *)a4 handleBoolean:(void *)a5 handleInt64:(void *)a6 handleFloat64:(void *)a7 handleTimeInterval:(void *)a8 handleData:(void *)a9 handleString:(void *)a10 handleDict:(void *)a11 handleArray:(void *)a12 handleOther:
{
  id v17 = a2;
  id v39 = a4;
  id v18 = a5;
  v40 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v23 = a11;
  uint64_t v24 = a12;
  uint64_t v25 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v26 = CFGetTypeID(v17);
    if (v26 == CFBooleanGetTypeID())
    {
      uint64_t v27 = (uint64_t (**)(void, void, void))v18;
      unint64_t v28 = v39;
      if (v39)
      {
        BOOL v29 = CFBooleanGetValue((CFBooleanRef)v17) != 0;
        uint64_t v30 = (*((uint64_t (**)(id, uint64_t, BOOL))v39 + 2))(v39, a3, v29);
LABEL_34:
        uint64_t v34 = v30;
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    uint64_t v27 = (uint64_t (**)(void, void, void))v18;
    if (CFNumberIsFloatType((CFNumberRef)v17))
    {
      if (v40)
      {
        unint64_t valuePtr = 0;
        if (!CFNumberGetValue((CFNumberRef)v17, kCFNumberDoubleType, &valuePtr))
        {
          uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:sel__visitObject_context_handleBoolean_handleInt64_handleFloat64_handleTimeInterval_handleData_handleString_handleDict_handleArray_handleOther_, v25, @"_PASLPWriterV1.m", 307, @"Invalid parameter not satisfying: %@", @"convOk" object file lineNumber description];

          uint64_t v27 = (uint64_t (**)(void, void, void))v18;
        }
        v33.n128_u64[0] = valuePtr;
        uint64_t v32 = v40[2](v40, a3, v33);
        goto LABEL_13;
      }
    }
    else if (v18)
    {
      unint64_t valuePtr = 0;
      if (!CFNumberGetValue((CFNumberRef)v17, kCFNumberSInt64Type, &valuePtr))
      {
        uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
        [v37 handleFailureInMethod:sel__visitObject_context_handleBoolean_handleInt64_handleFloat64_handleTimeInterval_handleData_handleString_handleDict_handleArray_handleOther_, v25, @"_PASLPWriterV1.m", 314, @"Invalid parameter not satisfying: %@", @"convOk" object file lineNumber description];

        uint64_t v27 = (uint64_t (**)(void, void, void))v18;
      }
      uint64_t v32 = v27[2](v27, a3, valuePtr);
      goto LABEL_13;
    }
LABEL_24:
    uint64_t v34 = 1;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    uint64_t v27 = (uint64_t (**)(void, void, void))v18;
    if (objc_opt_isKindOfClass())
    {
      unint64_t v28 = v39;
      if (v20)
      {
        uint64_t v30 = v20[2](v20, a3, v17);
        goto LABEL_34;
      }
    }
    else
    {
      objc_opt_class();
      unint64_t v28 = v39;
      if (objc_opt_isKindOfClass())
      {
        if (v21)
        {
          uint64_t v30 = v21[2](v21, a3, v17);
          goto LABEL_34;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v22)
          {
            uint64_t v30 = v22[2](v22, a3, v17);
            goto LABEL_34;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v23)
            {
              uint64_t v30 = v23[2](v23, a3, v17);
              goto LABEL_34;
            }
          }
          else if (v24)
          {
            uint64_t v30 = v24[2](v24, a3, v17);
            goto LABEL_34;
          }
        }
      }
    }
LABEL_35:
    uint64_t v34 = 1;
    goto LABEL_36;
  }
  uint64_t v27 = (uint64_t (**)(void, void, void))v18;
  if (!v19) {
    goto LABEL_24;
  }
  [v17 timeIntervalSinceReferenceDate];
  uint64_t v32 = v19[2](v19, a3, v31);
LABEL_13:
  uint64_t v34 = v32;
LABEL_25:
  unint64_t v28 = v39;
LABEL_36:

  return v34;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  char v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"_PASLPWriterV1.m", 200, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"_PASLPWriterV1.m", 201, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

LABEL_3:
  id v31 = 0;
  uint64_t v12 = (void *)MEMORY[0x1A62450A0]();
  id v13 = v11;
  int v14 = open((const char *)[v13 fileSystemRepresentation], 1538, 420);
  if (v14 < 0)
  {
    id v17 = [NSString alloc];
    id v18 = __error();
    id v19 = strerror(*v18);
    id v20 = (id)objc_msgSend(v17, "initWithFormat:", @"Could not open file: %s (%d)", v19, *__error());
    id v21 = v13;
    id v22 = objc_opt_new();
    v23 = v22;
    if (v20)
    {
      uint64_t v24 = (void *)[[NSString alloc] initWithFormat:@"The file cannot be opened: %@", v20];
      [v23 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    else
    {
      [v22 setObject:@"The file cannot be opened." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    [v23 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F28588]];

    [v23 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28328]];
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    CFTypeID v26 = (void *)[v23 copy];
    uint64_t v27 = (void *)[v25 initWithDomain:@"_PASLazyPlistErrorDomain" code:1 userInfo:v26];

    id v31 = v27;
    uint64_t v16 = 0;
  }
  else
  {
    int v15 = v14;
    uint64_t v16 = +[_PASLPWriterV1 _mappedDataWithPlist:fd:ofs:error:]((uint64_t)a1, v9, v14, 0, &v31);
    close(v15);
  }
  if (a5 && !v16) {
    *a5 = v31;
  }

  return v16;
}

+ (id)dataWithPropertyList:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (v7)
  {
    id v14 = 0;
    uint64_t v8 = (void *)MEMORY[0x1A62450A0]();
    id v9 = a1;
    id v10 = v7;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_PASLPWriterV1.m", 180, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];

    id v14 = 0;
    uint64_t v8 = (void *)MEMORY[0x1A62450A0]();
    id v9 = a1;
    id v10 = 0;
  }
  char v11 = +[_PASLPWriterV1 _mappedDataWithPlist:fd:ofs:error:]((uint64_t)v9, v10, -1, 0, &v14);
  if (a4 && !v11) {
    *a4 = v14;
  }

  return v11;
}

@end