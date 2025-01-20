@interface TRICKQueryLog
- (TRICKQueryLog)initWithPaths:(id)a3;
- (void)_logQueryWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 guardedData:(id)a6;
- (void)_openFileIfNeededWithGuardedData:(id)a3;
- (void)logQueryWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
@end

@implementation TRICKQueryLog

- (TRICKQueryLog)initWithPaths:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TRICKQueryLog;
  v6 = [(TRICKQueryLog *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    uint64_t v8 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.triald.ck-query-log" qosClass:17];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v12;
  }
  return v7;
}

- (void)logQueryWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke;
  v15[3] = &unk_1E6BB9D78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 valueForKey:*MEMORY[0x1E4FB04D0]];
  if ([v3 unsignedIntValue] == 4)
  {
  }
  else
  {
    int v4 = [v3 unsignedIntValue];

    if (v4 != 5) {
      return;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke_2;
  v7[3] = &unk_1E6BB9D50;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  [v6 runWithLockAcquired:v7];
}

uint64_t __66__TRICKQueryLog_logQueryWithRecordType_predicate_sortDescriptors___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _logQueryWithRecordType:*(void *)(a1 + 40) predicate:*(void *)(a1 + 48) sortDescriptors:*(void *)(a1 + 56) guardedData:a2];
}

- (void)_logQueryWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 guardedData:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (id *)a6;
  id v14 = (void *)MEMORY[0x1E016E7F0]();
  [(TRICKQueryLog *)self _openFileIfNeededWithGuardedData:v13];
  if (!*((unsigned char *)v13 + 8) && v13[3])
  {
    if (v12)
    {
      objc_super v15 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_7);
      id v16 = [v15 componentsJoinedByString:@", "];
    }
    else
    {
      id v16 = &stru_1F3455898;
    }
    id v17 = [NSString alloc];
    id v18 = [v11 triLogDesc];
    v19 = (void *)[v17 initWithFormat:@"recordType:%@ | predicate:%@ | sortDescriptors:[%@]", v10, v18, v16];

    v20 = [v19 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F3455898];

    if (([v13[2] containsObject:v20] & 1) == 0)
    {
      [v13[2] addObject:v20];
      v21 = [v20 stringByAppendingString:@"\n"];

      v22 = [v21 dataUsingEncoding:4];
      if (v22)
      {
        id v23 = v13[3];
        id v27 = 0;
        int v24 = [v23 writeData:v22 error:&v27];
        id v25 = v27;
        if (v24)
        {
          [v13[3] synchronizeAndReturnError:0];
        }
        else
        {
          v26 = TRILogCategory_Server();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v29 = v25;
            _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Failed to log CKQuery: %@", buf, 0xCu);
          }
        }
      }

      v20 = v21;
    }
  }
}

uint64_t __79__TRICKQueryLog__logQueryWithRecordType_predicate_sortDescriptors_guardedData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

- (void)_openFileIfNeededWithGuardedData:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E016E7F0]();
  if (!*((unsigned char *)v4 + 8) && !*((void *)v4 + 3))
  {
    v6 = [(TRIPaths *)self->_paths logDir];
    v7 = [v6 stringByAppendingPathComponent:@"CKQueryLogs"];

    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];

    id v9 = objc_opt_new();
    id v10 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v9 setTimeZone:v10];

    [v9 setFormatOptions:19];
    id v11 = [NSString alloc];
    id v12 = objc_opt_new();
    id v13 = [v9 stringFromDate:v12];
    id v14 = (void *)[v11 initWithFormat:@"CKQueryLog-%@.log", v13];

    objc_super v15 = [v7 stringByAppendingPathComponent:v14];
    id v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v15;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Logging CK queries: %{public}@", buf, 0xCu);
    }

    id v17 = v15;
    uint64_t v18 = open((const char *)[v17 fileSystemRepresentation], 514, 420);
    if ((v18 & 0x80000000) != 0)
    {
      v26 = TRILogCategory_Server();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v40 = __error();
        v41 = strerror(*v40);
        int v42 = *__error();
        *(_DWORD *)buf = 136315394;
        v54 = v41;
        __int16 v55 = 1024;
        int v56 = v42;
        _os_log_error_impl(&dword_1DA291000, v26, OS_LOG_TYPE_ERROR, "Failed to open CKQueryLog: %s (%d)", buf, 0x12u);
      }

      *((unsigned char *)v4 + 8) = 1;
    }
    else
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v18 closeOnDealloc:1];
      v20 = (void *)*((void *)v4 + 3);
      *((void *)v4 + 3) = v19;

      v21 = (void *)*((void *)v4 + 3);
      id v51 = 0;
      v22 = [v21 readDataUpToLength:0x20000 error:&v51];
      id v46 = v51;
      if (v22)
      {
        if ((unint64_t)[v22 length] < 0x20000)
        {
          id v29 = (void *)[[NSString alloc] initWithData:v22 encoding:4];
          if (v29)
          {
            v44 = v14;
            v45 = v7;
            uint64_t v30 = objc_opt_new();
            v31 = (void *)*((void *)v4 + 2);
            *((void *)v4 + 2) = v30;

            v43 = v29;
            v32 = [v29 componentsSeparatedByString:@"\n"];
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v47 objects:v52 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v48 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  v37 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                  if ([v37 length]) {
                    [*((id *)v4 + 2) addObject:v37];
                  }
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v47 objects:v52 count:16];
              }
              while (v34);
            }

            id v14 = v44;
            v7 = v45;
            id v25 = v46;
            id v29 = v43;
          }
          else
          {
            v38 = TRILogCategory_Server();
            id v25 = v46;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1DA291000, v38, OS_LOG_TYPE_ERROR, "CKQueryLog is not UTF-8.", buf, 2u);
            }

            v39 = (void *)*((void *)v4 + 3);
            *((void *)v4 + 3) = 0;

            *((unsigned char *)v4 + 8) = 1;
          }
        }
        else
        {
          id v23 = TRILogCategory_Server();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "CKQueryLog is full.", buf, 2u);
          }

          int v24 = (void *)*((void *)v4 + 3);
          *((void *)v4 + 3) = 0;

          *((unsigned char *)v4 + 8) = 1;
          id v25 = v46;
        }
      }
      else
      {
        id v27 = TRILogCategory_Server();
        id v25 = v46;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v54 = (char *)v46;
          _os_log_error_impl(&dword_1DA291000, v27, OS_LOG_TYPE_ERROR, "Failed to load CKQueryLog: %{public}@", buf, 0xCu);
        }

        v28 = (void *)*((void *)v4 + 3);
        *((void *)v4 + 3) = 0;

        *((unsigned char *)v4 + 8) = 1;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end