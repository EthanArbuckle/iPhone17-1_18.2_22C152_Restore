@interface TRICacheDeleteUtils
+ (BOOL)hasSufficientDiskSpaceForDownload:(unint64_t)a3;
+ (id)getFreeDiskSpace;
+ (id)getPurgeableDiskSpace;
@end

@implementation TRICacheDeleteUtils

+ (id)getFreeDiskSpace
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = NSHomeDirectory();
  id v11 = 0;
  v4 = [v2 attributesOfFileSystemForPath:v3 error:&v11];
  id v5 = v11;

  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
    if (v6)
    {
      v7 = v6;
      v8 = v7;
      goto LABEL_10;
    }
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Filesystem attributes are missing attribute NSFileSystemFreeSize.", buf, 2u);
    }

    v7 = 0;
  }
  else
  {
    v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Error reading attributes: %{public}@", buf, 0xCu);
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (id)getPurgeableDiskSpace
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = CacheDeleteCopyPurgeableSpaceWithInfo();
  if (v2)
  {
    v3 = v2;
    v4 = [v2 objectForKeyedSubscript:@"CACHE_DELETE_TOTAL_PURGEABLE"];
    id v5 = [v4 objectForKeyedSubscript:@"/private/var"];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v8 = TRILogCategory_Server();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Failed to locate purgeable bytes in Cache Delete Info: %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    v3 = TRILogCategory_Server();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1DA291000, v3, OS_LOG_TYPE_ERROR, "Failed to retrieve Cache Delete Info.", (uint8_t *)&v10, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasSufficientDiskSpaceForDownload:(unint64_t)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v4 = +[TRICacheDeleteUtils getFreeDiskSpace];
  unint64_t v5 = [v4 unsignedLongLongValue];

  unint64_t v6 = 2 * a3;
  BOOL v7 = 2 * a3 >= v5;
  unint64_t v8 = 2 * a3 - v5;
  if (v8 != 0 && v7)
  {
    v9 = +[TRICacheDeleteUtils getPurgeableDiskSpace];
    uint64_t v10 = [v9 unsignedLongLongValue];

    unint64_t v11 = v10 + v5;
    uint64_t v12 = TRILogCategory_Server();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10 + v5 < v6)
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v32 = v10;
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Insufficient disk space. Free space: %llu, required space: %llu, purgeable space: %llu", buf, 0x20u);
      }
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v32 = v10;
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Sufficient disk space, if we purge the cache. Free space: %llu, required space: %llu, purgeable space: %llu", buf, 0x20u);
      }

      v29[0] = @"CACHE_DELETE_VOLUME";
      v29[1] = @"CACHE_DELETE_AMOUNT";
      v30[0] = @"/private/var";
      uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v8];
      v30[1] = v14;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v32) = 1;
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __57__TRICacheDeleteUtils_hasSufficientDiskSpaceForDownload___block_invoke;
      v24 = &unk_1E6BBDEF0;
      v16 = v15;
      v25 = v16;
      v26 = buf;
      unint64_t v27 = v5;
      unint64_t v28 = v6;
      CacheDeletePurgeSpaceWithInfo();
      if ([MEMORY[0x1E4F93B18] waitForSemaphore:v16 timeoutSeconds:120.0])
      {
        unint64_t v5 = TRILogCategory_Server();
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
        {
          v20[0] = 0;
          _os_log_error_impl(&dword_1DA291000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "Timeout while attempting to have CacheDelete purge data before starting download.", (uint8_t *)v20, 2u);
        }

        LOBYTE(v5) = 0;
      }
      else
      {
        LOBYTE(v5) = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
      }

      _Block_object_dispose(buf, 8);
    }
    return (v11 >= v6) & v5;
  }
  else
  {
    v17 = TRILogCategory_Server();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1DA291000, v17, OS_LOG_TYPE_DEFAULT, "Sufficient disk space. Free space: %llu, required space: %llu", buf, 0x16u);
    }

    return 1;
  }
}

void __57__TRICacheDeleteUtils_hasSufficientDiskSpaceForDownload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)([v4 unsignedLongLongValue]+ v6) >= *(void *)(a1 + 56);
    BOOL v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 unsignedLongLongValue];
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        unint64_t v11 = @"YES";
      }
      else {
        unint64_t v11 = @"NO";
      }
      int v12 = 134218754;
      uint64_t v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Managed to purge %llu bytes. Free space: %llu, required space: %llu. Sufficient: %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else
  {
    BOOL v7 = TRILogCategory_Server();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)a2;
      _os_log_error_impl(&dword_1DA291000, v7, OS_LOG_TYPE_ERROR, "Failed to locate purged bytes in Cache Delete result: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end