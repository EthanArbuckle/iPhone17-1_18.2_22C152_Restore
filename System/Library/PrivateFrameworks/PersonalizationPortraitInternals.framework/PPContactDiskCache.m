@interface PPContactDiskCache
- (BOOL)isEmpty;
- (BOOL)iterNameRecordCacheWithError:(id *)a3 block:(id)a4;
- (PPContactDiskCache)initWithPath:(id)a3;
- (id)_cacheObjectFromFilePath:(id)a3 error:(id *)a4;
- (id)path;
@end

@implementation PPContactDiskCache

- (void).cxx_destruct
{
}

- (id)_cacheObjectFromFilePath:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v16 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v5 options:1 error:&v16];
  id v7 = v16;
  if (v6)
  {
    v8 = [[PPPBContactNameRecordCache alloc] initWithData:v6];
    if (v8)
    {
      v9 = v8;
      v10 = v9;
    }
    else
    {
      v14 = pp_contacts_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v5;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPPB: malformed contact name record cache file at %@", buf, 0xCu);
      }

      if (a4)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F89FD0] code:16 userInfo:0];
        v9 = 0;
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
    }
  }
  else
  {
    v11 = pp_contacts_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v5;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1CA9A8000, v11, OS_LOG_TYPE_DEFAULT, "PPPB: failed to read %@: error: %@", buf, 0x16u);
    }

    if (!a4)
    {
      v10 = 0;
      goto LABEL_19;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F89FD0];
    if (v7)
    {
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      id v18 = v7;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    }
    else
    {
      v9 = 0;
    }
    [v12 errorWithDomain:v13 code:15 userInfo:v9];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      goto LABEL_19;
    }
  }

LABEL_19:
  return v10;
}

- (BOOL)iterNameRecordCacheWithError:(id *)a3 block:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v54 = (void (**)(id, void *, unsigned char *))a4;
  unsigned __int8 v68 = 0;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:self->_path isDirectory:&v68];
  int v7 = v68;

  v8 = pp_contacts_log_handle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (v9)
    {
      path = self->_path;
      int buf = 138412546;
      v72 = path;
      __int16 v73 = 1024;
      int v74 = v68;
      char v12 = 1;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "PPPB: No name record cache at: %@ (isDirectory=%d)", (uint8_t *)&buf, 0x12u);
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v13 = self->_path;
      int buf = 138412290;
      v72 = v13;
      _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_INFO, "PPPB: loading contact record cache from: %@", (uint8_t *)&buf, 0xCu);
    }

    v14 = [MEMORY[0x1E4F28CB8] defaultManager];
    v15 = [v14 enumeratorAtPath:self->_path];

    if (v15)
    {
      long long v67 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v64 = 0u;
      v8 = v15;
      uint64_t v16 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v65;
        uint64_t v50 = *(void *)v65;
        v51 = v8;
        v52 = self;
LABEL_13:
        uint64_t v19 = 0;
        uint64_t v53 = v17;
        while (1)
        {
          if (*(void *)v65 != v18) {
            objc_enumerationMutation(v8);
          }
          id v20 = *(void **)(*((void *)&v64 + 1) + 8 * v19);
          __int16 v21 = [v20 pathExtension];
          int v22 = [v21 isEqualToString:@"pb"];

          if (v22)
          {
            uint64_t v23 = (void *)MEMORY[0x1CB79D060]();
            v24 = [(NSString *)self->_path stringByAppendingPathComponent:v20];
            id v63 = 0;
            v25 = [(PPContactDiskCache *)self _cacheObjectFromFilePath:v24 error:&v63];
            id v26 = v63;
            v57 = v26;
            if (v25)
            {
              v56 = v24;
              if ([v25 hasCreatedAt])
              {
                int64_t lastCreatedAt = self->_lastCreatedAt;
                uint64_t v28 = [v25 createdAt];
                if (lastCreatedAt && v28 >= self->_lastCreatedAt) {
                  uint64_t v28 = self->_lastCreatedAt;
                }
              }
              else
              {
                uint64_t v28 = 1;
              }
              self->_int64_t lastCreatedAt = v28;
              id v30 = objc_alloc(MEMORY[0x1E4F1CA60]);
              [v25 records];
              v32 = v31 = v25;
              v33 = objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v32, "count"));

              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              v55 = v31;
              v34 = [v31 records];
              uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v69 count:16];
              if (v35)
              {
                uint64_t v36 = v35;
                uint64_t v37 = *(void *)v60;
                do
                {
                  for (uint64_t i = 0; i != v36; ++i)
                  {
                    if (*(void *)v60 != v37) {
                      objc_enumerationMutation(v34);
                    }
                    v39 = *(void **)(*((void *)&v59 + 1) + 8 * i);
                    v40 = (void *)MEMORY[0x1CB79D060]();
                    v41 = [v39 sourceIdentifier];

                    if (v41)
                    {
                      v42 = [[PPInternalContactNameRecord alloc] initWithPBContactNameRecord:v39];
                      v43 = [v39 sourceIdentifier];
                      [v33 setObject:v42 forKeyedSubscript:v43];
                    }
                  }
                  uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v69 count:16];
                }
                while (v36);
              }

              char v58 = 0;
              v44 = (void *)MEMORY[0x1CB79D060]();
              v54[2](v54, v33, &v58);
              if (v58)
              {
                v45 = pp_contacts_log_handle();
                uint64_t v18 = v50;
                v8 = v51;
                uint64_t v17 = v53;
                v25 = v55;
                v24 = v56;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  LOWORD(buf) = 0;
                  _os_log_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_INFO, "PPPB: client stopped iteration early", (uint8_t *)&buf, 2u);
                }

                int v29 = 2;
              }
              else
              {
                int v29 = 0;
                uint64_t v18 = v50;
                v8 = v51;
                uint64_t v17 = v53;
                v25 = v55;
                v24 = v56;
              }

              self = v52;
            }
            else
            {
              if (a3) {
                *a3 = v26;
              }
              int v29 = 1;
            }

            if (v29) {
              break;
            }
          }
          if (++v19 == v17)
          {
            uint64_t v17 = [v8 countByEnumeratingWithState:&v64 objects:v70 count:16];
            if (v17) {
              goto LABEL_13;
            }
            goto LABEL_45;
          }
        }
      }
      else
      {
LABEL_45:
        LOBYTE(v29) = 0;
      }

      char v12 = (v29 & 1) == 0;
    }
    else
    {
      v46 = pp_contacts_log_handle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v48 = self->_path;
        int buf = 138412290;
        v72 = v48;
        _os_log_error_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_ERROR, "PPPB: failed to create enumerator for %@", (uint8_t *)&buf, 0xCu);
      }

      char v12 = (char)a3;
      if (a3)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F89FD0] code:14 userInfo:0];
        v8 = 0;
        char v12 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v12;
}

- (BOOL)isEmpty
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [v3 contentsOfDirectoryAtPath:self->_path error:0];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "pathExtension", (void)v15);
        int v12 = [v11 isEqualToString:@"pb"];

        v8 += v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
    BOOL v13 = v8 == 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (id)path
{
  return self->_path;
}

- (PPContactDiskCache)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPContactDiskCache;
  uint64_t v6 = [(PPContactDiskCache *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

@end