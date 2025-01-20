@interface PPITunesStoreURLOverrideChecker
- (PPITunesStoreURLOverrideChecker)init;
- (PPITunesStoreURLOverrideChecker)initWithPlistPaths:(id)a3 isAppAvailableToOpenURLBlock:(id)a4;
- (PPITunesStoreURLOverrideChecker)initWithPropertyList:(id)a3 isAppAvailableToOpenURLBlock:(id)a4;
- (id)_compiledPattern:(uint64_t)a1;
- (id)overrideForURL:(id)a3;
@end

@implementation PPITunesStoreURLOverrideChecker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedHosts, 0);
  objc_storeStrong((id *)&self->_failedSchemes, 0);
  objc_storeStrong((id *)&self->_supportedSchemes, 0);
  objc_storeStrong((id *)&self->_compiledPatterns, 0);
  objc_storeStrong((id *)&self->_propertyList, 0);
  objc_storeStrong(&self->_isAppAvailableToOpenURLBlock, 0);
}

- (PPITunesStoreURLOverrideChecker)initWithPropertyList:(id)a3 isAppAvailableToOpenURLBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PPITunesStoreURLOverrideChecker;
  v9 = [(PPITunesStoreURLOverrideChecker *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_propertyList, a3);
    uint64_t v11 = [v8 copy];
    id isAppAvailableToOpenURLBlock = v10->_isAppAvailableToOpenURLBlock;
    v10->_id isAppAvailableToOpenURLBlock = (id)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:16];
    compiledPatterns = v10->_compiledPatterns;
    v10->_compiledPatterns = (NSMutableDictionary *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:4];
    supportedSchemes = v10->_supportedSchemes;
    v10->_supportedSchemes = (NSMutableSet *)v15;

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:4];
    failedSchemes = v10->_failedSchemes;
    v10->_failedSchemes = (NSMutableSet *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:64];
    failedHosts = v10->_failedHosts;
    v10->_failedHosts = (NSMutableSet *)v19;
  }
  return v10;
}

- (PPITunesStoreURLOverrideChecker)init
{
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MobileCoreServices"];
  v4 = [v3 pathForResource:@"iTunesStoreURLPatterns" ofType:@"plist"];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1CB79D060]();
    v6 = [&unk_1F256A478 arrayByAddingObject:v4];
  }
  else
  {
    v6 = &unk_1F256A478;
  }
  id v7 = [(PPITunesStoreURLOverrideChecker *)self initWithPlistPaths:v6 isAppAvailableToOpenURLBlock:&__block_literal_global_11602];

  return v7;
}

- (PPITunesStoreURLOverrideChecker)initWithPlistPaths:(id)a3 isAppAvailableToOpenURLBlock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    unint64_t v9 = 0x1E4F93000uLL;
LABEL_3:
    uint64_t v10 = 0;
    uint64_t v27 = v7;
    while (1)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
      v12 = (void *)MEMORY[0x1CB79D060]();
      uint64_t v13 = [v11 stringByExpandingTildeInPath];
      v14 = *(void **)(v9 + 2904);
      id v29 = 0;
      uint64_t v15 = [v14 dictionaryWithPath:v13 error:&v29];
      id v16 = v29;
      if (!v15)
      {
        uint64_t v17 = v8;
        unint64_t v18 = v9;
        uint64_t v19 = (void *)MEMORY[0x1CB79D060]();
        v20 = pp_default_log_handle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v35 = v16;
          __int16 v36 = 2112;
          v37 = v13;
          _os_log_error_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_ERROR, "got error %@ while creating lazy plist context for path %@", buf, 0x16u);
        }

        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v13];
        if (!v15)
        {
          v21 = (void *)MEMORY[0x1CB79D060]();
          objc_super v22 = pp_default_log_handle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v35 = v13;
            _os_log_error_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_ERROR, "failed to load plist at path %@ using Foundation fallback", buf, 0xCu);
          }
        }
        unint64_t v9 = v18;
        uint64_t v8 = v17;
        uint64_t v7 = v27;
      }

      if (v15) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
LABEL_17:
    uint64_t v15 = (void *)MEMORY[0x1E4F1CC08];
  }

  v23 = [(PPITunesStoreURLOverrideChecker *)self initWithPropertyList:v15 isAppAvailableToOpenURLBlock:v25];
  return v23;
}

- (id)overrideForURL:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:1];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;

  failedHosts = self->_failedHosts;
  uint64_t v10 = [v8 host];
  LOBYTE(failedHosts) = [(NSMutableSet *)failedHosts containsObject:v10];

  if (failedHosts)
  {
    uint64_t v11 = 0;
    goto LABEL_108;
  }
  v12 = [(NSDictionary *)self->_propertyList objectForKeyedSubscript:@"p2-url-resolution"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_106;
  }
  context = (void *)MEMORY[0x1CB79D060]();
  v78 = objc_opt_new();
  v83 = objc_opt_new();
  v75 = objc_opt_new();
  v76 = objc_opt_new();
  uint64_t v13 = [v8 scheme];
  v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = &stru_1F253DF18;
  }
  v77 = v15;

  uint64_t v16 = [v8 host];
  uint64_t v17 = (void *)v16;
  if (v16) {
    unint64_t v18 = (__CFString *)v16;
  }
  else {
    unint64_t v18 = &stru_1F253DF18;
  }
  v79 = v18;

  id v19 = v8;
  uint64_t location = [v19 rangeOfPath];
  NSUInteger length = v21;
  v72 = v8;
  v81 = v12;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v60 = self;
    id v61 = v19;
    v63 = id v62 = v4;
    v90.uint64_t location = 0x7FFFFFFFFFFFFFFFLL;
    v90.NSUInteger length = length;
    v64 = NSStringFromRange(v90);
    [v63 handleFailureInMethod:sel__pathAndQueryForURLComponents_, v60, @"PPITunesStoreURLOverrideChecker.m", 122, @"-[NSURLComponents pathRange] should never return an NSNotFound range, but got %@", v64 object file lineNumber description];

    id v4 = v62;
    id v19 = v61;
    self = v60;
    v12 = v81;
  }
  NSUInteger v23 = [v19 rangeOfQuery];
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v91.uint64_t location = v23;
    v91.NSUInteger length = v24;
    v89.uint64_t location = location;
    v89.NSUInteger length = length;
    NSRange v25 = NSUnionRange(v89, v91);
    uint64_t location = v25.location;
    NSUInteger length = v25.length;
  }
  v26 = [v19 string];
  objc_msgSend(v26, "substringWithRange:", location, length);
  uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v27) {
    v28 = v27;
  }
  else {
    v28 = &stru_1F253DF18;
  }
  v73 = v28;

  uint64_t v29 = [v12 count];
  if (v29)
  {
    unint64_t v30 = v29;
    v68 = v19;
    v80 = self;
    uint64_t v31 = 0;
    BOOL v32 = 1;
    char v74 = 1;
    long long v33 = v77;
    while (1)
    {
      v34 = [v12 objectAtIndexedSubscript:v31];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v35 = pp_default_log_handle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v34;
          _os_log_fault_impl(&dword_1CA9A8000, v35, OS_LOG_TYPE_FAULT, "expected NSDictionary, got %@", buf, 0xCu);
        }
        goto LABEL_32;
      }
      id v35 = [v34 objectForKeyedSubscript:@"scheme-mapping"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unint64_t v37 = v30;
        v38 = pp_default_log_handle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v35;
          _os_log_fault_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_FAULT, "expected NSDictionary, got %@", buf, 0xCu);
        }

        unint64_t v30 = v37;
LABEL_32:

        goto LABEL_95;
      }
      uint64_t v36 = [v35 objectForKeyedSubscript:v33];
      objc_opt_class();
      v84 = (void *)v36;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v36)
        {
          v82 = pp_default_log_handle();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v36;
            _os_log_fault_impl(&dword_1CA9A8000, v82, OS_LOG_TYPE_FAULT, "expected NSString, got %@", buf, 0xCu);
          }
LABEL_36:
          int v39 = 4;
          goto LABEL_93;
        }
LABEL_37:
        int v39 = 4;
        goto LABEL_94;
      }
      if ([(NSMutableSet *)v80->_failedSchemes containsObject:v36])
      {
        char v74 = 0;
        goto LABEL_37;
      }
      v40 = [v34 objectForKeyedSubscript:@"host-patterns"];
      objc_opt_class();
      v82 = v40;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v47 = pp_default_log_handle();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v40;
          _os_log_fault_impl(&dword_1CA9A8000, v47, OS_LOG_TYPE_FAULT, "expected NSArray, got %@", buf, 0xCu);
        }
        int v39 = 4;
        goto LABEL_92;
      }
      uint64_t v41 = [v40 count];
      if (!v41) {
        goto LABEL_36;
      }
      uint64_t v42 = v41;
      unint64_t v67 = v30;
      uint64_t v43 = 0;
      id v69 = v4;
      while (1)
      {
        v44 = [v40 objectAtIndexedSubscript:v43];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v45 = pp_default_log_handle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v44;
            _os_log_fault_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_FAULT, "expected NSString, got %@", buf, 0xCu);
          }
          goto LABEL_54;
        }
        if (![v44 length]) {
          goto LABEL_60;
        }
        if (([v83 containsObject:v44] & 1) == 0) {
          break;
        }
LABEL_55:

        if (v42 == ++v43)
        {
          int v39 = 4;
          long long v33 = v77;
          unint64_t v30 = v67;
          goto LABEL_93;
        }
      }
      if ([v78 containsObject:v44]) {
        goto LABEL_60;
      }
      v45 = -[PPITunesStoreURLOverrideChecker _compiledPattern:]((uint64_t)v80, v44);
      if (!v45)
      {
        v46 = pp_default_log_handle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v44;
          _os_log_fault_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_FAULT, "failed to compile pattern: %@", buf, 0xCu);
        }

        id v4 = v69;
LABEL_53:
        [v83 addObject:v44];
LABEL_54:

        v12 = v81;
        goto LABEL_55;
      }
      v40 = v82;
      if (-[NSObject rangeOfFirstMatchInString:options:range:](v45, "rangeOfFirstMatchInString:options:range:", v79, 0, 0, [(__CFString *)v79 length]) == 0x7FFFFFFFFFFFFFFFLL)goto LABEL_53; {
      [v78 addObject:v44];
      }

      char v74 = 0;
      v12 = v81;
LABEL_60:

      v48 = [v34 objectForKeyedSubscript:@"path-patterns"];
      objc_opt_class();
      long long v33 = v77;
      v47 = v48;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v54 = pp_default_log_handle();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v48;
          _os_log_fault_impl(&dword_1CA9A8000, v54, OS_LOG_TYPE_FAULT, "expected NSArray, got %@", buf, 0xCu);
        }
        int v39 = 4;
        goto LABEL_83;
      }
      uint64_t v65 = [v48 count];
      if (!v65)
      {
        int v39 = 4;
        goto LABEL_91;
      }
      uint64_t v49 = 0;
      char v66 = 0;
      uint64_t v50 = v65;
      while (2)
      {
        v51 = [v48 objectAtIndexedSubscript:v49];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v52 = pp_default_log_handle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v51;
            _os_log_fault_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_FAULT, "expected NSString, got %@", buf, 0xCu);
          }
          goto LABEL_70;
        }
        if (![v51 length]) {
          goto LABEL_67;
        }
        if (([v76 containsObject:v51] & 1) == 0)
        {
          if ([v75 containsObject:v51])
          {
LABEL_67:
            char v66 = 1;
            goto LABEL_71;
          }
          v52 = -[PPITunesStoreURLOverrideChecker _compiledPattern:]((uint64_t)v80, v51);
          if (v52)
          {
            uint64_t v50 = v65;
            if (-[NSObject rangeOfFirstMatchInString:options:range:](v52, "rangeOfFirstMatchInString:options:range:", v73, 0, 0, [(__CFString *)v73 length]) != 0x7FFFFFFFFFFFFFFFLL)
            {
              [v75 addObject:v51];
              char v66 = 1;
              goto LABEL_70;
            }
          }
          else
          {
            v53 = pp_default_log_handle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v86 = v51;
              _os_log_fault_impl(&dword_1CA9A8000, v53, OS_LOG_TYPE_FAULT, "failed to compile pattern: %@", buf, 0xCu);
            }

            id v4 = v69;
          }
          [v76 addObject:v51];
LABEL_70:

          long long v33 = v77;
        }
LABEL_71:

        ++v49;
        v48 = v47;
        if (v50 != v49) {
          continue;
        }
        break;
      }
      if (v66)
      {
        v55 = v84;
        if ([(NSMutableSet *)v80->_supportedSchemes containsObject:v84]) {
          goto LABEL_88;
        }
        v54 = objc_opt_new();
        [v54 setScheme:v84];
        id isAppAvailableToOpenURLBlock = (uint64_t (**)(id, void *))v80->_isAppAvailableToOpenURLBlock;
        v57 = [v54 URL];
        LODWORD(isAppAvailableToOpenURLBlock) = isAppAvailableToOpenURLBlock[2](isAppAvailableToOpenURLBlock, v57);

        if (isAppAvailableToOpenURLBlock)
        {
          v55 = v84;
          [(NSMutableSet *)v80->_supportedSchemes addObject:v84];

          long long v33 = v77;
LABEL_88:
          v54 = [v68 copy];
          v58 = (void *)[[NSString alloc] initWithString:v55];
          [v54 setScheme:v58];

          uint64_t v70 = [v54 URL];
          int v39 = 1;
          v12 = v81;
        }
        else
        {
          [(NSMutableSet *)v80->_failedSchemes addObject:v84];
          int v39 = 4;
          v12 = v81;
          long long v33 = v77;
        }
LABEL_83:
      }
      else
      {
        int v39 = 4;
        v12 = v81;
      }
LABEL_91:
      unint64_t v30 = v67;
LABEL_92:

LABEL_93:
LABEL_94:

      if (v39 != 4) {
        goto LABEL_105;
      }
LABEL_95:
      BOOL v32 = ++v31 < v30;
      if (v31 == v30)
      {
        if (v74)
        {
          self = v80;
          goto LABEL_101;
        }
        goto LABEL_104;
      }
    }
  }
  long long v33 = v77;
LABEL_101:
  if ((unint64_t)[(NSMutableSet *)self->_failedHosts count] >= 0x40) {
    [(NSMutableSet *)self->_failedHosts removeAllObjects];
  }
  [(NSMutableSet *)self->_failedHosts addObject:v79];
LABEL_104:
  BOOL v32 = 0;
LABEL_105:

  uint64_t v8 = v72;
  uint64_t v11 = (void *)v70;
  if (!v32) {
LABEL_106:
  }
    uint64_t v11 = 0;

LABEL_108:
  return v11;
}

- (id)_compiledPattern:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 24) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v8 = 0;
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v3 options:1 error:&v8];
      id v5 = v8;
      if (v4)
      {
        if ((unint64_t)[*(id *)(a1 + 24) count] >= 0x10) {
          [*(id *)(a1 + 24) removeAllObjects];
        }
        [*(id *)(a1 + 24) setObject:v4 forKeyedSubscript:v3];
      }
      else
      {
        uint64_t v6 = pp_default_log_handle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v10 = v3;
          __int16 v11 = 2112;
          id v12 = v5;
          _os_log_fault_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_FAULT, "failed to compile pattern %@: %@", buf, 0x16u);
        }

        id v4 = 0;
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __39__PPITunesStoreURLOverrideChecker_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F223E0];
  id v3 = a2;
  id v4 = [v2 defaultWorkspace];
  uint64_t v5 = [v4 isApplicationAvailableToOpenURL:v3 error:0];

  return v5;
}

@end