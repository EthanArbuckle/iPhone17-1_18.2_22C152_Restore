@interface PFCachingArchiveIndex
- (BOOL)createIndexFromArchiveFile:(id)a3 tempIndexFile:(id)a4;
- (BOOL)indexFileValid:(const char *)a3;
- (BOOL)indexSupported;
- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4;
- (BOOL)loadOrCreateIndex;
- (BOOL)makeAndCacheIndexFileInDirectory:(id)a3 indexPath:(id)a4;
- (const)indexLabel;
- (id)dataArchivePath;
- (id)indexName;
- (id)indexPath:(id *)a3;
- (unint64_t)indexFileVersion;
- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3;
- (unsigned)architectureHash;
@end

@implementation PFCachingArchiveIndex

- (unsigned)architectureHash
{
  return 408216;
}

- (BOOL)createIndexFromArchiveFile:(id)a3 tempIndexFile:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  archive_read_new();
  v21[1] = 0;
  archive_read_support_filter_bzip2();
  archive_read_support_format_raw();
  id v8 = v6;
  [v8 fileSystemRepresentation];
  if (archive_read_open_filename() || archive_read_next_header())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int __dst = 136315394;
      v23 = [(PFCachingArchiveIndex *)self indexLabel];
      __int16 v24 = 2080;
      uint64_t v25 = archive_error_string();
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error opening %s source file: %s.", (uint8_t *)&__dst, 0x16u);
    }
    archive_read_free();
    BOOL v9 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v21[0] = 0;
    char v12 = [v11 removeItemAtPath:v7 error:v21];
    id v13 = v21[0];

    if ((v12 & 1) != 0
      || [v13 code] == 4
      && ([v13 domain],
          v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 isEqualToString:*MEMORY[0x1E4F281F8]],
          v15,
          (v16 & 1) != 0))
    {
      [(PFCachingArchiveIndex *)self archiveLineParserForIndexPath:v7];
      v19 = [(PFCachingArchiveIndex *)self indexLabel];
      do
      {
        int data_block = archive_read_data_block();
        BOOL v9 = data_block != 0;
      }
      while (!data_block);
      if (data_block != 1)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = archive_error_string();
          *(_DWORD *)buf = 136315394;
          v27 = v19;
          __int16 v28 = 2080;
          uint64_t v29 = v17;
          _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error decoding %s source archive file: %s.", buf, 0x16u);
        }
        BOOL v9 = 0;
      }
      archive_read_free();
      (*(void (**)())(*(void *)v20 + 24))();
      if (v20) {
        (*(void (**)())(*(void *)v20 + 8))();
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v18 = [(PFCachingArchiveIndex *)self indexLabel];
        int __dst = 136315394;
        v23 = v18;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v13;
        _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error removing old %s index: %@", (uint8_t *)&__dst, 0x16u);
      }
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (BOOL)makeAndCacheIndexFileInDirectory:(id)a3 indexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 stringByAppendingString:@".tmp"];
  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  v10 = [(PFCachingArchiveIndex *)self dataArchivePath];
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v15 = [(PFCachingArchiveIndex *)self indexName];
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error cannot use nil data archive path for %@.", buf, 0xCu);
    }
    goto LABEL_17;
  }
  id v21 = 0;
  char v11 = [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v12 = v21;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [(PFCachingArchiveIndex *)self indexLabel];
      *(_DWORD *)buf = 136315650;
      v23 = v17;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error making cache directory for %s index %@: %@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  [v9 removeItemAtPath:v7 error:0];
  if (![(PFCachingArchiveIndex *)self createIndexFromArchiveFile:v10 tempIndexFile:v8])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v18 = [(PFCachingArchiveIndex *)self indexLabel];
      *(_DWORD *)buf = 136315394;
      v23 = v18;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error creating %s index file %@", buf, 0x16u);
    }
LABEL_16:

LABEL_17:
    char v13 = 0;
    goto LABEL_18;
  }
  id v20 = 0;
  char v13 = [v9 moveItemAtPath:v8 toPath:v7 error:&v20];
  id v14 = v20;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = [(PFCachingArchiveIndex *)self indexLabel];
      *(_DWORD *)buf = 136315906;
      v23 = v19;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error renaming %s index file %@ to %@: %@", buf, 0x2Au);
    }
    [v9 removeItemAtPath:v8 error:0];
  }

LABEL_18:
  return v13;
}

- (BOOL)loadOrCreateIndex
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&-[PFCachingArchiveIndex loadOrCreateIndex]::cacheLock);
  if (!self->_loaded)
  {
    if ([(PFCachingArchiveIndex *)self indexSupported])
    {
      id v9 = 0;
      v3 = [(PFCachingArchiveIndex *)self indexPath:&v9];
      id v4 = v9;
      id v5 = v3;
      id v6 = (const char *)[v5 fileSystemRepresentation];
      if (![(PFCachingArchiveIndex *)self indexFileValid:v6]
        && [(PFCachingArchiveIndex *)self makeAndCacheIndexFileInDirectory:v4 indexPath:v5])
      {
        if (stat(v6, &v10) || ((__int16)v10.st_mode & 0x80000000) == 0)
        {
          if (*__error() != 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            int v8 = *__error();
            *(_DWORD *)buf = 67109120;
            int v12 = v8;
            _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected result checking if archive file exists: %d.", buf, 8u);
          }
        }
        else
        {
          [(PFCachingArchiveIndex *)self loadIndexFile:v6 fileSize:v10.st_size];
        }
      }
    }
    self->_loaded = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[PFCachingArchiveIndex loadOrCreateIndex]::cacheLock);
  return 1;
}

- (BOOL)indexFileValid:(const char *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!stat(a3, &v7) && (__int16)v7.st_mode < 0) {
    return [(PFCachingArchiveIndex *)self loadIndexFile:a3 fileSize:v7.st_size];
  }
  if (*__error() != 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = *__error();
    *(_DWORD *)buf = 67109120;
    int v9 = v6;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unexpected result checking if archive file exists: %d.", buf, 8u);
  }
  return 0;
}

- (id)indexPath:(id *)a3
{
  id v5 = NSTemporaryDirectory();
  int v6 = [MEMORY[0x1E4F28F80] processInfo];
  stat v7 = [v6 processName];
  int v8 = [v5 stringByAppendingFormat:@"com.apple.%@", v7];

  int v9 = [(PFCachingArchiveIndex *)self indexName];
  uint64_t v10 = [v9 stringByAppendingPathExtension:@"index"];

  char v11 = [v8 stringByAppendingPathComponent:v10];
  if (a3) {
    *a3 = v8;
  }

  return v11;
}

- (BOOL)indexSupported
{
  return 1;
}

- (id)dataArchivePath
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [(PFCachingArchiveIndex *)self indexName];
  id v5 = [v3 pathForResource:v4 ofType:@"bz2"];

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    stat v7 = [(PFCachingArchiveIndex *)self indexName];
    int v8 = [v3 bundlePath];
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    int v12 = v8;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error finding %{public}@ data archive resource in bundle %{public}@.", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  id v4 = v3;
  v5.var0.var0 = (ArchiveLineParser *)[(PFCachingArchiveIndex *)self doesNotRecognizeSelector:a2];
  *id v4 = 0;
  return v5;
}

- (const)indexLabel
{
  return 0;
}

- (id)indexName
{
  return 0;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  return 0;
}

- (unint64_t)indexFileVersion
{
  return 0;
}

@end