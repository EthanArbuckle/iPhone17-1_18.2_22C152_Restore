@interface PBFCompressionHelper
+ (BOOL)unarchiveFileAtURL:(id)a3 toURL:(id)a4;
+ (int)unTarFileWithFd:(id)a3 toPath:(id)a4;
+ (int)unpackageTarData:(void *)a3 size:(unint64_t)a4 parentDir:(const char *)a5;
@end

@implementation PBFCompressionHelper

+ (int)unpackageTarData:(void *)a3 size:(unint64_t)a4 parentDir:(const char *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(&v17, 0, sizeof(v17));
  if (stat(a5, &v17) == -1 && mkdir(a5, 0x1C0u)) {
    return -1;
  }
  __strcpy_chk();
  __strcat_chk();
  int v6 = open(v18, 2562, 384);
  if (v6 < 0) {
    return -1;
  }
  int v7 = v6;
  v8 = mmap(0, 0x2800000uLL, 3, 1, v6, 0);
  if (v8 == (void *)-1)
  {
    close(v7);
    return -1;
  }
  v9 = v8;
  archive_read_new();
  archive_write_disk_new();
  int support_filter_gzip = archive_read_support_filter_gzip();
  int support_format_tar = archive_read_support_format_tar();
  int v12 = archive_write_disk_set_standard_lookup();
  int open_memory = archive_read_open_memory();
  int result = -1;
  if (!support_filter_gzip && !support_format_tar && !v12 && !open_memory)
  {
    if (archive_read_next_header())
    {
LABEL_9:
      archive_write_free();
      archive_read_free();
      sync();
      munmap(v9, 0x2800000uLL);
      unlink(v18);
      close(v7);
      return 0;
    }
    while (1)
    {
      __strcpy_chk();
      __strcat_chk();
      archive_entry_pathname();
      __strcat_chk();
      archive_entry_set_pathname();
      if (archive_write_header()) {
        return -1;
      }
      uint64_t v15 = archive_entry_size();
      if (v15 > 41943040) {
        return -1;
      }
      uint64_t v16 = v15;
      if (archive_read_data_into_fd()
        || archive_write_data() != v16
        || lseek(v7, 0, 0)
        || ftruncate(v7, 0)
        || archive_write_finish_entry())
      {
        return -1;
      }
      if (archive_read_next_header()) {
        goto LABEL_9;
      }
    }
  }
  return result;
}

+ (int)unTarFileWithFd:(id)a3 toPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = dup([v6 fileDescriptor]);
  if (v8 < 0)
  {
    int v13 = -1;
  }
  else
  {
    int v9 = v8;
    memset(&v19, 0, sizeof(v19));
    if (fstat(v8, &v19))
    {
      close(v9);
      v10 = PBFLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = __error();
        int v12 = strerror(*v11);
        *(_DWORD *)buf = 136315138;
        v21 = v12;
        _os_log_impl(&dword_1D31CE000, v10, OS_LOG_TYPE_INFO, "failed stat %s", buf, 0xCu);
      }
      int v13 = -1;
    }
    else
    {
      v14 = [v6 availableData];
      off_t st_size = v19.st_size;
      v10 = v14;
      LODWORD(st_size) = objc_msgSend(a1, "unpackageTarData:size:parentDir:", -[NSObject bytes](v10, "bytes"), st_size, objc_msgSend(v7, "UTF8String"));
      uint64_t v16 = PBFLogCommon();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
      if (st_size)
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_INFO, "failed to unpackage resources", buf, 2u);
        }
        int v13 = -1;
      }
      else
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_INFO, "unpackaged resources version", buf, 2u);
        }
        int v13 = 0;
      }
    }
  }

  return v13;
}

+ (BOOL)unarchiveFileAtURL:(id)a3 toURL:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28CB0];
  id v7 = a4;
  int v8 = [a3 path];
  int v9 = [v6 fileHandleForReadingAtPath:v8];

  v10 = [v7 path];

  LOBYTE(a1) = [a1 unTarFileWithFd:v9 toPath:v10] == 0;
  return (char)a1;
}

@end