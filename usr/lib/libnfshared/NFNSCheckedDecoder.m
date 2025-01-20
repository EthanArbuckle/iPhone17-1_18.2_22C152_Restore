@interface NFNSCheckedDecoder
+ (id)coder:(id)a3 decodeArrayOfArrayOfClass:(Class)a4 forKey:(id)a5;
+ (id)coder:(id)a3 decodeArrayOfClass:(Class)a4 forKey:(id)a5;
+ (id)coder:(id)a3 decodeDictOfClass:(Class)a4 forKey:(id)a5;
@end

@implementation NFNSCheckedDecoder

+ (id)coder:(id)a3 decodeArrayOfClass:(Class)a4 forKey:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), a4, 0];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = [v9 decodeObjectOfClasses:v11 forKey:v10];
  if (v33[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)v33[5];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __54__NFNSCheckedDecoder_coder_decodeArrayOfClass_forKey___block_invoke;
      v31[3] = &unk_1E65ABD88;
      v31[4] = &v32;
      v31[5] = a4;
      v31[6] = a1;
      v31[7] = a2;
      [v12 enumerateObjectsUsingBlock:v31];
      id v13 = (id)v33[5];
      goto LABEL_19;
    }
    v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v16 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v16)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class)) {
        uint64_t v18 = 43;
      }
      else {
        uint64_t v18 = 45;
      }
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v21 = objc_opt_class();
      v16(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v18, ClassName, Name, 25, v21, @"NSArray");
      v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v22 = dispatch_get_specific(v14);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v23 = (id)_NFSharedLogClient[(void)v22];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      v26 = object_getClassName(a1);
      v27 = sel_getName(a2);
      v28 = objc_opt_class();
      *(_DWORD *)buf = 67110402;
      int v39 = v25;
      __int16 v40 = 2082;
      v41 = v26;
      __int16 v42 = 2082;
      v43 = v27;
      __int16 v44 = 1024;
      int v45 = 25;
      __int16 v46 = 2114;
      v47 = v28;
      __int16 v48 = 2114;
      v49 = @"NSArray";
      id v29 = v28;
      _os_log_impl(&dword_1CA51A000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);
    }
  }
  id v13 = 0;
LABEL_19:
  _Block_object_dispose(&v32, 8);

  return v13;
}

void __54__NFNSCheckedDecoder_coder_decodeArrayOfClass_forKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    *a4 = 1;
    id v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v11)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v26 = objc_opt_class();
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v16, ClassName, Name, 33, v26, *(void *)(a1 + 40));
      id v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v17 = dispatch_get_specific(v9);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v18 = (id)_NFSharedLogClient[(void)v17];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v19)) {
        int v20 = 43;
      }
      else {
        int v20 = 45;
      }
      uint64_t v21 = object_getClassName(*(id *)(a1 + 48));
      v22 = sel_getName(*(SEL *)(a1 + 56));
      v23 = objc_opt_class();
      uint64_t v24 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67110402;
      int v28 = v20;
      __int16 v29 = 2082;
      v30 = v21;
      __int16 v31 = 2082;
      uint64_t v32 = v22;
      __int16 v33 = 1024;
      int v34 = 33;
      __int16 v35 = 2114;
      v36 = v23;
      __int16 v37 = 2114;
      uint64_t v38 = v24;
      id v25 = v23;
      _os_log_impl(&dword_1CA51A000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);
    }
  }
}

+ (id)coder:(id)a3 decodeArrayOfArrayOfClass:(Class)a4 forKey:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:objc_opt_class(), a4, 0];
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x3032000000;
  __int16 v37 = __Block_byref_object_copy_;
  uint64_t v38 = __Block_byref_object_dispose_;
  id v39 = [v9 decodeObjectOfClasses:v11 forKey:v10];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  if (v35[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)v35[5];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke;
      v31[3] = &unk_1E65ABDB0;
      v31[6] = a1;
      v31[7] = a2;
      void v31[8] = a4;
      v31[4] = &v34;
      v31[5] = v32;
      [v12 enumerateObjectsUsingBlock:v31];
      id v13 = (id)v35[5];
      goto LABEL_19;
    }
    v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v16 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v16)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class)) {
        uint64_t v18 = 43;
      }
      else {
        uint64_t v18 = 45;
      }
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v21 = objc_opt_class();
      v16(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v18, ClassName, Name, 53, v21, @"NSArray");
      v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v22 = dispatch_get_specific(v14);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v23 = (id)_NFSharedLogClient[(void)v22];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = object_getClass(a1);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(a1);
      v27 = sel_getName(a2);
      int v28 = objc_opt_class();
      *(_DWORD *)buf = 67110402;
      int v41 = v25;
      __int16 v42 = 2082;
      v43 = v26;
      __int16 v44 = 2082;
      int v45 = v27;
      __int16 v46 = 1024;
      int v47 = 53;
      __int16 v48 = 2114;
      v49 = v28;
      __int16 v50 = 2114;
      v51 = @"NSArray";
      id v29 = v28;
      _os_log_impl(&dword_1CA51A000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);
    }
  }
  id v13 = 0;
LABEL_19:
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  return v13;
}

void __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke_4;
    v26[3] = &unk_1E65ABD88;
    uint64_t v7 = *(void *)(a1 + 64);
    long long v27 = *(_OWORD *)(a1 + 48);
    v26[4] = *(void *)(a1 + 40);
    v26[5] = v7;
    [v6 enumerateObjectsUsingBlock:v26];
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      goto LABEL_18;
    }
  }
  else
  {
    v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    id v10 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v10)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v25 = objc_opt_class();
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v15, ClassName, Name, 60, v25, @"NSArray");
      v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v16 = dispatch_get_specific(v8);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    v17 = (id)_NFSharedLogClient[(void)v16];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      int v20 = object_getClassName(*(id *)(a1 + 48));
      uint64_t v21 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110402;
      int v29 = v19;
      __int16 v30 = 2082;
      __int16 v31 = v20;
      __int16 v32 = 2082;
      char v33 = v21;
      __int16 v34 = 1024;
      int v35 = 60;
      __int16 v36 = 2114;
      id v37 = (id)objc_opt_class();
      __int16 v38 = 2114;
      id v39 = @"NSArray";
      id v22 = v37;
      _os_log_impl(&dword_1CA51A000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);
    }
  }
  uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = 0;

  *a4 = 1;
LABEL_18:
}

void __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    id v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v9)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v24 = objc_opt_class();
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v14, ClassName, Name, 66, v24, *(void *)(a1 + 40));
      uint64_t v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v15 = dispatch_get_specific(v7);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v16 = (id)_NFSharedLogClient[(void)v15];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      int v19 = object_getClassName(*(id *)(a1 + 48));
      int v20 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67110402;
      int v26 = v18;
      __int16 v27 = 2082;
      int v28 = v19;
      __int16 v29 = 2082;
      __int16 v30 = v20;
      __int16 v31 = 1024;
      int v32 = 66;
      __int16 v33 = 2114;
      __int16 v34 = v21;
      __int16 v35 = 2114;
      uint64_t v36 = v22;
      id v23 = v21;
      _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);
    }
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

+ (id)coder:(id)a3 decodeDictOfClass:(Class)a4 forKey:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v12 = objc_opt_class();
  id v13 = [v11 initWithObjects:v12, objc_opt_class(), a4, 0];
  uint64_t v34 = 0;
  __int16 v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy_;
  __int16 v38 = __Block_byref_object_dispose_;
  id v39 = [v9 decodeObjectOfClasses:v13 forKey:v10];
  if (v35[5])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = (void *)v35[5];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __53__NFNSCheckedDecoder_coder_decodeDictOfClass_forKey___block_invoke;
      v33[3] = &unk_1E65ABDD8;
      v33[6] = a1;
      v33[7] = a2;
      v33[4] = &v34;
      v33[5] = a4;
      [v14 enumerateKeysAndObjectsUsingBlock:v33];
      id v15 = (id)v35[5];
      goto LABEL_19;
    }
    uint64_t v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    int v18 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v18)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class)) {
        uint64_t v20 = 43;
      }
      else {
        uint64_t v20 = 45;
      }
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v23 = objc_opt_class();
      v18(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v20, ClassName, Name, 95, v23, @"NSDictionary");
      uint64_t v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    uint64_t v24 = dispatch_get_specific(v16);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    uint64_t v25 = (id)_NFSharedLogClient[(void)v24];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      int v26 = object_getClass(a1);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      int v28 = object_getClassName(a1);
      __int16 v29 = sel_getName(a2);
      __int16 v30 = objc_opt_class();
      *(_DWORD *)buf = 67110402;
      int v41 = v27;
      __int16 v42 = 2082;
      v43 = v28;
      __int16 v44 = 2082;
      int v45 = v29;
      __int16 v46 = 1024;
      int v47 = 95;
      __int16 v48 = 2114;
      v49 = v30;
      __int16 v50 = 2114;
      v51 = @"NSDictionary";
      id v31 = v30;
      _os_log_impl(&dword_1CA51A000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);
    }
  }
  id v15 = 0;
LABEL_19:
  _Block_object_dispose(&v34, 8);

  return v15;
}

void __53__NFNSCheckedDecoder_coder_decodeDictOfClass_forKey___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    id v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v11)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v16 = objc_opt_class();
      uint64_t v31 = objc_opt_class();
      uint64_t v17 = 43;
      if (!isMetaClass) {
        uint64_t v17 = 45;
      }
      v11(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected key %{public}@, class %{public}@, expecting %{public}@", v17, ClassName, Name, 101, v16, v31, *(void *)(a1 + 40));
      id v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    int v18 = dispatch_get_specific(v9);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    int v19 = (id)_NFSharedLogClient[(void)v18];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v20)) {
        int v21 = 43;
      }
      else {
        int v21 = 45;
      }
      uint64_t v22 = object_getClassName(*(id *)(a1 + 48));
      uint64_t v23 = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v24 = objc_opt_class();
      id v25 = v24;
      int v26 = objc_opt_class();
      uint64_t v27 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 67110658;
      int v33 = v21;
      __int16 v34 = 2082;
      __int16 v35 = v22;
      __int16 v36 = 2082;
      uint64_t v37 = v23;
      __int16 v38 = 1024;
      int v39 = 101;
      __int16 v40 = 2114;
      int v41 = v24;
      __int16 v42 = 2114;
      v43 = v26;
      __int16 v44 = 2114;
      uint64_t v45 = v27;
      id v28 = v26;
      _os_log_impl(&dword_1CA51A000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected key %{public}@, class %{public}@, expecting %{public}@", buf, 0x40u);
    }
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 8);
    __int16 v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0;

    *a4 = 1;
  }
}

@end