@interface SABinaryLocator
+ (id)sharedBinaryLocator;
- (SABinaryLocator)init;
- (_BYTE)addURLForSymbolOwner:(unsigned char *)a1;
- (id)mappings;
- (id)urlForUUID:(unsigned char *)a1;
- (uint64_t)addURL:(void *)a3 ForUUID:;
- (uint64_t)removeURLForUUID:(unsigned char *)a1;
- (void)_saveMappings;
- (void)done;
@end

@implementation SABinaryLocator

- (id)mappings
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  objc_sync_enter(v1);
  id v2 = v1[1];
  if (v2 || !*((unsigned char *)v1 + 25))
  {
LABEL_2:
    id v3 = v2;
    goto LABEL_3;
  }
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:@"/var/db/spindump/UUIDToBinaryLocations"];
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = v1[1];
  v1[1] = (id)v6;

  if (!v1[2])
  {
    CFDictionaryRef v8 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    CFDictionaryRef v9 = v8;
    if (!v8)
    {
      int v19 = *__error();
      v20 = _sa_logt();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_FAULT, "No system version", buf, 2u);
      }

      *__error() = v19;
      if (v5) {
        goto LABEL_15;
      }
      goto LABEL_27;
    }
    uint64_t v10 = CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E4F1CD10]);
    id v11 = v1[2];
    v1[2] = (id)v10;

    if (!v1[2])
    {
      int v12 = *__error();
      v13 = _sa_logt();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_FAULT, "No build number", buf, 2u);
      }

      *__error() = v12;
    }
    CFRelease(v9);
  }
  if (!v5)
  {
LABEL_27:
    int v21 = *__error();
    v22 = _sa_logt();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to open binary locator database", buf, 2u);
    }

    *__error() = v21;
    id v2 = v1[1];
    goto LABEL_2;
  }
LABEL_15:
  v14 = [v5 objectForKeyedSubscript:@"build_number"];
  id v15 = v1[2];
  if (!v15 || v14 && ([v15 isEqualToString:v14] & 1) != 0)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __27__SABinaryLocator_mappings__block_invoke;
    v37[3] = &unk_1E63F78D0;
    v37[4] = v1;
    [v5 enumerateKeysAndObjectsUsingBlock:v37];
    id v3 = v1[1];
  }
  else
  {
    v16 = (const char *)[@"/var/db/spindump/UUIDToBinaryLocations" UTF8String];
    if (!v16)
    {
      int v28 = *__error();
      v29 = _sa_logt();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BF22B000, v29, OS_LOG_TYPE_ERROR, "No cstring path for nsstring path", buf, 2u);
      }

      *__error() = v28;
      _SASetCrashLogMessage(110, "No cstring path for nsstring path", v30, v31, v32, v33, v34, v35, v36);
      _os_crash();
      __break(1u);
    }
    if (unlink(v16))
    {
      int v17 = *__error();
      v18 = _sa_logt();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v25 = *__error();
        *(_DWORD *)buf = 138412546;
        v39 = @"/var/db/spindump/UUIDToBinaryLocations";
        __int16 v40 = 1024;
        LODWORD(v41) = v25;
        _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "Unable to unlink old binary locator file %@: %{errno}d", buf, 0x12u);
      }

      *__error() = v17;
    }
    else
    {
      int v23 = *__error();
      v24 = _sa_logt();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = [v5 count];
        v27 = @"unknown";
        if (v14) {
          v27 = v14;
        }
        *(_DWORD *)buf = 138412546;
        v39 = v27;
        __int16 v40 = 2048;
        uint64_t v41 = v26;
        _os_log_debug_impl(&dword_1BF22B000, v24, OS_LOG_TYPE_DEBUG, "Deleted old binary locator file from old build %@ with %ld items", buf, 0x16u);
      }

      *__error() = v23;
    }

    id v3 = v1[1];
  }

LABEL_3:
  objc_sync_exit(v1);

  return v3;
}

- (void)done
{
  obj = self;
  objc_sync_enter(obj);
  if (!--_MergedGlobals_10)
  {
    if (obj->_enabled) {
      -[SABinaryLocator _saveMappings](obj);
    }
    mappings = obj->_mappings;
    obj->_mappings = 0;
  }
  objc_sync_exit(obj);
}

- (SABinaryLocator)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"You must call sharedBinaryLocator" reason:0 userInfo:0];
  objc_exception_throw(v2);
}

+ (id)sharedBinaryLocator
{
  if (qword_1EB699268 != -1) {
    dispatch_once(&qword_1EB699268, &__block_literal_global_14);
  }
  id v2 = (id)qword_1EB699260;
  objc_sync_enter(v2);
  ++_MergedGlobals_10;
  objc_sync_exit(v2);

  id v3 = (void *)qword_1EB699260;
  return v3;
}

void __38__SABinaryLocator_sharedBinaryLocator__block_invoke()
{
  v0 = [SABinaryLocator alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)SABinaryLocator;
    v0 = (SABinaryLocator *)objc_msgSendSuper2(&v2, sel_init);
    if (v0) {
      v0->_enabled = 1;
    }
  }
  v1 = (void *)qword_1EB699260;
  qword_1EB699260 = (uint64_t)v0;
}

- (void)_saveMappings
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!*((unsigned char *)v1 + 24) || geteuid()) {
      goto LABEL_29;
    }
    if (v1[1])
    {
      objc_super v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1[1], "count") + 1);
      id v3 = v1[1];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __32__SABinaryLocator__saveMappings__block_invoke;
      v29[3] = &unk_1E63F9FF8;
      id v4 = v2;
      id v30 = v4;
      [v3 enumerateKeysAndObjectsUsingBlock:v29];
      [v4 setObject:v1[2] forKeyedSubscript:@"build_number"];
      memset(&v28, 0, sizeof(v28));
      if (stat("/var/db/spindump", &v28))
      {
        if (*__error() != 2)
        {
          int v7 = *__error();
          id v15 = _sa_logt();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v20 = *__error();
            int v21 = __error();
            v22 = strerror(*v21);
            *(_DWORD *)buf = 136315650;
            uint64_t v32 = "/var/db/spindump";
            __int16 v33 = 1024;
            int v34 = v20;
            __int16 v35 = 2080;
            char v36 = v22;
            _os_log_error_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_ERROR, "Unable to stat %s: %d %s", buf, 0x1Cu);
          }

          CFDictionaryRef v9 = __error();
          goto LABEL_19;
        }
        int v5 = *__error();
        uint64_t v6 = _sa_logt();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v32 = "/var/db/spindump";
          _os_log_debug_impl(&dword_1BF22B000, v6, OS_LOG_TYPE_DEBUG, "Creating nugget directory %s", buf, 0xCu);
        }

        *__error() = v5;
        if (mkdir("/var/db/spindump", 0x1EDu))
        {
          int v7 = *__error();
          CFDictionaryRef v8 = _sa_logt();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v23 = *__error();
            v24 = __error();
            int v25 = strerror(*v24);
            *(_DWORD *)buf = 136315650;
            uint64_t v32 = "/var/db/spindump";
            __int16 v33 = 1024;
            int v34 = v23;
            __int16 v35 = 2080;
            char v36 = v25;
            _os_log_error_impl(&dword_1BF22B000, v8, OS_LOG_TYPE_ERROR, "Unable to create %s: %d %s", buf, 0x1Cu);
          }

          CFDictionaryRef v9 = __error();
LABEL_19:
          *CFDictionaryRef v9 = v7;

LABEL_29:
          objc_sync_exit(v1);

          return;
        }
      }
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToFileAtPath:@"/var/db/spindump/UUIDToBinaryLocations" append:0];
      id v11 = v10;
      if (v10)
      {
        [v10 open];
        id v27 = 0;
        uint64_t v12 = [MEMORY[0x1E4F28F98] writePropertyList:v4 toStream:v11 format:200 options:0 error:&v27];
        id v13 = v27;
        [v11 close];
        if (v12)
        {
          int v14 = 0;
        }
        else
        {
          int v18 = *__error();
          int v19 = _sa_logt();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = [v13 debugDescription];
            *(_DWORD *)buf = 138412290;
            uint64_t v32 = v26;
            _os_log_error_impl(&dword_1BF22B000, v19, OS_LOG_TYPE_ERROR, "Unable to save mappings: %@", buf, 0xCu);
          }
          *__error() = v18;
          int v14 = 1;
        }
      }
      else
      {
        int v16 = *__error();
        int v17 = _sa_logt();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BF22B000, v17, OS_LOG_TYPE_ERROR, "Unable to create stream for binary locator path", buf, 2u);
        }

        *__error() = v16;
        int v14 = 1;
      }

      if (v14) {
        goto LABEL_29;
      }
    }
    *((unsigned char *)v1 + 24) = 0;
    goto LABEL_29;
  }
}

void __27__SABinaryLocator_mappings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:@"build_number"] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    int v7 = uuidForString(v8);
    if (v7) {
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKey:v7];
    }
  }
}

void __32__SABinaryLocator__saveMappings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];

    if (v7 != v6)
    {
      id v8 = [v6 path];
      if (v8)
      {
        CFDictionaryRef v9 = *(void **)(a1 + 32);
        uint64_t v10 = [v5 UUIDString];
        [v9 setObject:v8 forKey:v10];
      }
      else
      {
        int v11 = *__error();
        uint64_t v12 = _sa_logt();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315138;
          uint64_t v14 = [v6 fileSystemRepresentation];
          _os_log_impl(&dword_1BF22B000, v12, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to get path for %s", (uint8_t *)&v13, 0xCu);
        }

        *__error() = v11;
      }
    }
  }
}

- (id)urlForUUID:(unsigned char *)a1
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1 || !a1[25])
  {
    uint64_t v12 = 0;
    goto LABEL_24;
  }
  id v4 = -[SABinaryLocator mappings](a1);
  id v5 = [v4 objectForKey:v3];

  if (!v5) {
    goto LABEL_12;
  }
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v6)
  {
    uint64_t v12 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = [v5 path];
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  CFDictionaryRef v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [v5 path];
  int v11 = [v9 fileExistsAtPath:v10];

  if (!v11)
  {
LABEL_9:
    int v13 = *__error();
    uint64_t v14 = _sa_logt();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v3 UUIDString];
      int v16 = [v5 path];
      *(_DWORD *)buf = 138412546;
      v29 = v15;
      __int16 v30 = 2112;
      v31[0] = v16;
      _os_log_impl(&dword_1BF22B000, v14, OS_LOG_TYPE_INFO, "Found stale entry for UUID %@, mapping to non-existent path %@. This will be ignored and evicted from the cache.", buf, 0x16u);
    }
    *__error() = v13;
    a1[24] = 1;
    int v17 = -[SABinaryLocator mappings](a1);
    [v17 removeObjectForKey:v3];

LABEL_12:
    v32[0] = 0;
    v32[1] = 0;
    [v3 getUUIDBytes:v32];
    OSLogLookupPathWithUUID();
    int v18 = SAFilepathForCString(0);
    if ([v18 isAbsolutePath])
    {
      int v19 = *__error();
      int v20 = _sa_logt();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v18;
        __int16 v30 = 1040;
        LODWORD(v31[0]) = 16;
        WORD2(v31[0]) = 2096;
        *(void *)((char *)v31 + 6) = v32;
        _os_log_debug_impl(&dword_1BF22B000, v20, OS_LOG_TYPE_DEBUG, "Got %@ for %{uuid_t}.16P from libtrace", buf, 0x1Cu);
      }

      *__error() = v19;
      int v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v22 = [v21 fileExistsAtPath:v18];

      if (v22)
      {
        int v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v18 isDirectory:0];

        -[SABinaryLocator addURL:ForUUID:](a1, v23, v3);
        id v5 = v23;
        uint64_t v12 = v5;
      }
      else
      {
        int v24 = *__error();
        int v25 = _sa_logt();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = [v3 UUIDString];
          *(_DWORD *)buf = 138412546;
          v29 = v26;
          __int16 v30 = 2080;
          v31[0] = 0;
          _os_log_impl(&dword_1BF22B000, v25, OS_LOG_TYPE_INFO, "OSLogLookupPathWithUUID returned stale entry for UUID %@; path %s doesn't exist. This will be ignored.",
            buf,
            0x16u);
        }
        uint64_t v12 = 0;
        *__error() = v24;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_23;
  }
  id v5 = v5;
  uint64_t v12 = v5;
LABEL_23:

LABEL_24:
  return v12;
}

- (uint64_t)addURL:(void *)a3 ForUUID:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a1 || !a1[25]) {
    goto LABEL_17;
  }
  uint64_t v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_18;
  }
  id v9 = v5;
  uint64_t v10 = (const char *)[v9 fileSystemRepresentation];
  if (!v10)
  {
LABEL_15:
    int v16 = a1;
    objc_sync_enter(v16);
    int v17 = -[SABinaryLocator mappings](v16);
    int v18 = [v17 objectForKey:v7];
    if (!v18)
    {
      v16[24] = 1;
      [v17 setObject:v9 forKey:v7];

      objc_sync_exit(v16);
      uint64_t v8 = 1;
      goto LABEL_18;
    }

    objc_sync_exit(v16);
    goto LABEL_17;
  }
  int v11 = v10;
  memset(&v21, 0, sizeof(v21));
  if (stat(v10, &v21))
  {
LABEL_17:
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  memset(&v26, 0, 512);
  if (statfs(v11, &v26))
  {
    int v12 = *__error();
    int v13 = _sa_logt();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v20 = *__error();
      *(_DWORD *)buf = 136315394;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v20;
      _os_log_debug_impl(&dword_1BF22B000, v13, OS_LOG_TYPE_DEBUG, "Unable to statfs %s: %{errno}d", buf, 0x12u);
    }

    *__error() = v12;
    goto LABEL_15;
  }
  if (v26.f_type != 22) {
    goto LABEL_15;
  }
  int v14 = *__error();
  uint64_t v15 = _sa_logt();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    int v23 = v11;
    _os_log_debug_impl(&dword_1BF22B000, v15, OS_LOG_TYPE_DEBUG, "Not caching translocated path %s", buf, 0xCu);
  }

  uint64_t v8 = 0;
  *__error() = v14;
LABEL_18:

  return v8;
}

- (_BYTE)addURLForSymbolOwner:(unsigned char *)a1
{
  v1 = a1;
  if (a1)
  {
    if (a1[25])
    {
      uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
      Path = (unsigned char *)CSSymbolOwnerGetPath();
      id v4 = SAFilepathForCString(Path);
      id v5 = v4;
      if (CFUUIDBytes && [v4 isAbsolutePath])
      {
        id v6 = uuidForBytes(CFUUIDBytes);
        uint64_t v7 = -[SABinaryLocator urlForUUID:](v1, v6);

        if (v7)
        {
          v1 = 0;
        }
        else
        {
          uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v5 isDirectory:0];
          v1 = (unsigned char *)-[SABinaryLocator addURL:ForUUID:](v1, v8, v6);
        }
      }
      else
      {
        v1 = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)removeURLForUUID:(unsigned char *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1)
  {
    if (v3)
    {
      if (a1[25])
      {
        uint64_t v5 = -[SABinaryLocator urlForUUID:](a1, v3);
        if (v5)
        {
          int v6 = *__error();
          uint64_t v7 = _sa_logt();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v10 = [v4 UUIDString];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v10;
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = [ (id) v5 fileSystemRepresentation];
            _os_log_debug_impl(&dword_1BF22B000, v7, OS_LOG_TYPE_DEBUG, "Deleted %@ -> %s", buf, 0x16u);
          }
          *__error() = v6;
          a1[24] = 1;
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          [v4 getUUIDBytes:buf];
          OSLogLookupPathWithUUID();
          uint64_t v8 = -[SABinaryLocator mappings](a1);
          [v8 removeObjectForKey:v4];

          uint64_t v5 = 1;
        }
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
}

@end