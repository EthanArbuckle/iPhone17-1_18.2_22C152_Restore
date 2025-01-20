@interface SSCompressionHelper
+ (id)sharedInstance;
- (char)getDataOutWithSize:(unint64_t)a3 withFlag:(unint64_t)a4 fd:(int *)a5;
- (int)unTarFileWithFd:(id)a3 toPath:(id)a4;
- (int)unpackageTarForFd:(int)a3 size:(unint64_t)a4 parentDir:(const char *)a5;
- (void)uncompressedContentsForCompressedFile:(id)a3 outPath:(id)a4;
@end

@implementation SSCompressionHelper

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__SSCompressionHelper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_shared;
  return v2;
}

uint64_t __37__SSCompressionHelper_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_shared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (char)getDataOutWithSize:(unint64_t)a3 withFlag:(unint64_t)a4 fd:(int *)a5
{
  *a5 = -1;
  int TemporaryFileOfSize = allocateTemporaryFileOfSize(a3, a4);
  if (TemporaryFileOfSize < 0)
  {
    v10 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SSCompressionHelper getDataOutWithSize:withFlag:fd:]();
    }
  }
  else
  {
    int v8 = TemporaryFileOfSize;
    result = (char *)mmap(0, a3, 3, 1, TemporaryFileOfSize, 0);
    if (result != (char *)-1)
    {
      *a5 = v8;
      return result;
    }
    close(v8);
    v10 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SSCompressionHelper getDataOutWithSize:withFlag:fd:]();
    }
  }

  return 0;
}

- (void)uncompressedContentsForCompressedFile:(id)a3 outPath:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v7 = a3;
  id v25 = 0;
  int v8 = (void *)[[v6 alloc] initWithContentsOfFile:v7 options:8 error:&v25];

  id v9 = v25;
  if (v9)
  {
    uint64_t v10 = PRSLogCategoryDefault();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:].cold.4();
    }
    goto LABEL_16;
  }
  uint64_t v24 = -1;
  int v23 = -1;
  uint64_t v11 = [v8 length];
  v12 = (const uint8_t *)[v8 bytes];
  size_t v13 = *((void *)v12 - 1);
  size_t v14 = doBlockDecompression(v12, v11 - 8, v13, (uint8_t **)&v24, COMPRESSION_LZFSE, &v23);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__SSCompressionHelper_uncompressedContentsForCompressedFile_outPath___block_invoke;
  v21[3] = &__block_descriptor_52_e5_v8__0l;
  v15 = (uint8_t *)v24;
  v21[4] = v24;
  v21[5] = v14;
  int v22 = v23;
  uint64_t v16 = MEMORY[0x1C1885400](v21);
  uint64_t v10 = v16;
  if (!v14)
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
    v20 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:]();
    }
    goto LABEL_15;
  }
  int v17 = open((const char *)[v5 UTF8String], 514, 384);
  if (v17 < 0)
  {
    v20 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:]();
    }
LABEL_15:

    goto LABEL_16;
  }
  int v18 = v17;
  if (write(v17, v15, v13) == -1)
  {
    v19 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:]();
    }
  }
  close(v18);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
LABEL_16:
}

uint64_t __69__SSCompressionHelper_uncompressedContentsForCompressedFile_outPath___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t result = munmap(*(void **)(a1 + 32), *(void *)(a1 + 40));
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3 != -1)
  {
    bzero(v4, 0x400uLL);
    if ((fcntl(v3, 50, v4) & 0x80000000) == 0)
    {
      if (v4[0]) {
        unlink(v4);
      }
    }
    return close(*(_DWORD *)(a1 + 48));
  }
  return result;
}

- (int)unpackageTarForFd:(int)a3 size:(unint64_t)a4 parentDir:(const char *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  memset(&v21, 0, sizeof(v21));
  if (stat(a5, &v21) == -1 && mkdir(a5, 0x1C0u)) {
    return -1;
  }
  bzero(v23, 0x400uLL);
  __strcpy_chk();
  __strcat_chk();
  int v8 = open(v23, 2562, 384);
  if (v8 < 0) {
    return -1;
  }
  int v9 = v8;
  uint64_t v10 = mmap(0, 0x2800000uLL, 3, 1, v8, 0);
  if (v10 == (void *)-1)
  {
    size_t v17 = 41943040;
LABEL_15:
    munmap((void *)0xFFFFFFFFFFFFFFFFLL, v17);
    close(v9);
    return -1;
  }
  uint64_t v11 = v10;
  if (mmap(0, a4, 1, 1, a3, 0) == (void *)-1)
  {
    size_t v17 = a4;
    goto LABEL_15;
  }
  archive_read_new();
  archive_write_disk_new();
  int support_filter_bzip2 = archive_read_support_filter_bzip2();
  int support_format_tar = archive_read_support_format_tar();
  int v14 = archive_write_disk_set_standard_lookup();
  int open_memory = archive_read_open_memory();
  int v16 = -1;
  if (!support_filter_bzip2 && !support_format_tar && !v14 && !open_memory)
  {
    if (archive_read_next_header())
    {
LABEL_10:
      archive_write_free();
      archive_read_free();
      sync();
      munmap(v11, 0x2800000uLL);
      unlink(v23);
      int v16 = 0;
    }
    else
    {
      while (1)
      {
        bzero(v22, 0x400uLL);
        __strcpy_chk();
        __strcat_chk();
        archive_entry_pathname();
        __strcat_chk();
        archive_entry_set_pathname();
        if (archive_write_header()) {
          break;
        }
        uint64_t v19 = archive_entry_size();
        if (v19 > 41943040) {
          break;
        }
        uint64_t v20 = v19;
        if (archive_read_data_into_fd()
          || archive_write_data() != v20
          || lseek(v9, 0, 0)
          || ftruncate(v9, 0)
          || archive_write_finish_entry())
        {
          break;
        }
        if (archive_read_next_header()) {
          goto LABEL_10;
        }
      }
      munmap(v11, 0x2800000uLL);
      int v16 = -1;
    }
    close(v9);
  }
  return v16;
}

- (int)unTarFileWithFd:(id)a3 toPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = dup([v6 fileDescriptor]);
  if ((v8 & 0x80000000) == 0)
  {
    int v9 = v8;
    memset(&v15, 0, sizeof(v15));
    if (fstat(v8, &v15))
    {
      close(v9);
      uint64_t v10 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[SSCompressionHelper unTarFileWithFd:toPath:](v10);
      }
    }
    else
    {
      int v11 = -[SSCompressionHelper unpackageTarForFd:size:parentDir:](self, "unpackageTarForFd:size:parentDir:", [v6 fileDescriptor], v15.st_size, objc_msgSend(v7, "UTF8String"));
      v12 = PRSLogCategoryDefault();
      uint64_t v10 = v12;
      if (!v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)int v14 = 0;
          _os_log_impl(&dword_1BDB2A000, v10, OS_LOG_TYPE_DEFAULT, "[Model loading] unpackaged resources version", v14, 2u);
          int v11 = 0;
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[SSCompressionHelper unTarFileWithFd:toPath:]();
      }
    }
    int v11 = -1;
LABEL_10:

    goto LABEL_11;
  }
  int v11 = -1;
LABEL_11:

  return v11;
}

- (void)getDataOutWithSize:withFlag:fd:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[Model loading] Error opening encrypted file", v2, v3, v4, v5, v6);
}

- (void)getDataOutWithSize:withFlag:fd:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[Model loading] Error reading mmaped encrypted file", v2, v3, v4, v5, v6);
}

- (void)uncompressedContentsForCompressedFile:outPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[Model loading] returning unsuccessfully post decompression due to invalid destination size", v2, v3, v4, v5, v6);
}

- (void)uncompressedContentsForCompressedFile:outPath:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[Model loading] Error in out file.\n", v2, v3, v4, v5, v6);
}

- (void)uncompressedContentsForCompressedFile:outPath:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[Model loading] Error reading data from compressed file", v2, v3, v4, v5, v6);
}

- (void)unTarFileWithFd:toPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BDB2A000, v0, v1, "[Model loading] failed to unpackage resources", v2, v3, v4, v5, v6);
}

- (void)unTarFileWithFd:(NSObject *)a1 toPath:.cold.2(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1BDB2A000, a1, OS_LOG_TYPE_ERROR, "failed stat %s", (uint8_t *)&v4, 0xCu);
}

@end