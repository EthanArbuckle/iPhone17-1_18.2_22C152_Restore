@interface SDArchive
- (BOOL)shouldParallelCompress:(int)a3;
- (OS_dispatch_queue)tarQueue;
- (SDArchive)initWithFD:(int)a3 withOptions:(int)a4 withName:(id)a5;
- (SDArchive)initWithPath:(id)a3 withOptions:(int)a4 withName:(id)a5;
- (int)_initlibArchiveshouldCompress:(int)a3;
- (int)_initlibParallelCompressionWithOption:(int)a3;
- (int)_writeArchiveHeader:(void *)a3;
- (int)_writeChunk:(int)a3 maxSize:(int64_t)a4;
- (int)archiveFD;
- (int)getProtectionClass;
- (int64_t)_writeEntryData:(void *)a3 size:(int64_t)a4;
- (int64_t)archiveStatus;
- (int64_t)getUncompressedSize;
- (void)_createHeaderEntrywithFile:(id)a3 attributes:(stat *)a4;
- (void)_disposeEntry:(void *)a3;
- (void)_getCompressionParameters:(id *)a3 forAlgo:(int)a4;
- (void)addArchiveFile:(id)a3;
- (void)addArchiveObject:(id)a3;
- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4;
- (void)addFileToArchive:(id)a3 withFileName:(id)a4;
- (void)closeArchive;
- (void)finalizeArchiveAndClose:(BOOL)a3;
- (void)setArchiveFD:(int)a3;
- (void)setArchiveStatus:(int64_t)a3;
- (void)setTarQueue:(id)a3;
@end

@implementation SDArchive

- (int)_initlibArchiveshouldCompress:(int)a3
{
  self->_archive = (archive *)archive_write_new();
  if (a3)
  {
    if (a3 != 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Invalid compression type for tar", v11, 2u);
      }
      v10 = +[SDResourceManager sharedResourceManager];
      [v10 log:@"SDArchive: Invalid compression type for tar"];

      return -1;
    }
    archive_write_add_filter_gzip();
    archive_write_set_options();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Creating tar with gzip compression", buf, 2u);
    }
    v5 = +[SDResourceManager sharedResourceManager];
    v6 = v5;
    CFStringRef v7 = @"SDArchive: Creating tar with gzip compression";
  }
  else
  {
    archive_write_add_filter_none();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Creating tar without compression", v12, 2u);
    }
    v5 = +[SDResourceManager sharedResourceManager];
    v6 = v5;
    CFStringRef v7 = @"SDArchive: Creating tar without compression";
  }
  [v5 log:v7];

  archive_write_set_format_pax();
  if (!archive_write_open_fd())
  {
    disk_new = (archive *)archive_read_disk_new();
    int result = 0;
    self->_disk_reader = disk_new;
    return result;
  }
  return -1;
}

- (void)_getCompressionParameters:(id *)a3 forAlgo:(int)a4
{
  a3->var0 = 2;
  a3->var1 = a4;
  unint64_t v4 = 0x100000;
  if (a4 == 3) {
    unint64_t v4 = 0x400000;
  }
  a3->var2 = v4;
  a3->var3 = v4;
}

- (int)_initlibParallelCompressionWithOption:(int)a3
{
  if ((a3 - 2) >= 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Invalid compression type for yaa", buf, 2u);
    }
    v8 = +[SDResourceManager sharedResourceManager];
    v9 = v8;
    CFStringRef v10 = @"SDArchive: Invalid compression type for yaa";
    goto LABEL_11;
  }
  uint64_t v4 = dword_100074690[a3 - 2];
  p_archiveFD = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  *(_OWORD *)buf = 0u;
  [(SDArchive *)self _getCompressionParameters:buf forAlgo:v4];
  p_archiveFD = &self->_archiveFD;
  *(void *)&long long v19 = sub_10005B77C;
  v5 = (void *)ParallelCompressionOStreamCreate();
  self->_ostream = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ParallelCompressionOStreamCreate failed", v13, 2u);
    }
    v8 = +[SDResourceManager sharedResourceManager];
    v9 = v8;
    CFStringRef v10 = @"ParallelCompressionOStreamCreate failed";
LABEL_11:
    [v8 log:v10];
    int v7 = -1;
LABEL_12:

    return v7;
  }
  *(void *)v13 = 0;
  v14 = &ParallelCompressionOStreamWrite;
  v15 = &ParallelCompressionOStreamAbort;
  v16 = v5;
  v6 = (void *)ParallelArchiveWriterCreate();
  self->_writer = v6;
  if (!v6)
  {
    ParallelCompressionOStreamDestroy();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ParallelArchiveWriterCreate failed", v12, 2u);
    }
    v9 = +[SDResourceManager sharedResourceManager];
    [v9 log:@"ParallelArchiveWriterCreate failed"];
    int v7 = 0;
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)shouldParallelCompress:(int)a3
{
  return (a3 - 2) < 3;
}

- (SDArchive)initWithPath:(id)a3 withOptions:(int)a4 withName:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  v9 = (const char *)[a3 fileSystemRepresentation];
  BOOL v10 = -[SystemDiagnostic isDeviceUnlockedSinceBoot]_0();
  uint64_t v11 = sub_100026EF8(v9, v10);
  if (v11 == -1)
  {
    v12 = 0;
  }
  else
  {
    self = [(SDArchive *)self initWithFD:v11 withOptions:v5 withName:v8];
    v12 = self;
  }

  return v12;
}

- (SDArchive)initWithFD:(int)a3 withOptions:(int)a4 withName:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a5;
  if ((a3 & 0x80000000) == 0)
  {
    v41.receiver = self;
    v41.super_class = (Class)SDArchive;
    BOOL v10 = [(SDArchive *)&v41 init];
    self = v10;
    if (!v10) {
      goto LABEL_31;
    }
    v10->_int archiveFD = a3;
    v10->_archiveStatus = 0;
    v10->_shouldCompress = (v6 & 0xFFFFFFFD) != 0;
    v10->_uncompressed_size = 0;
    v10->_compressed_size = 0;
    v10->_useParallelCompression = [(SDArchive *)v10 shouldParallelCompress:v6];
    uint64_t v11 = +[NSMutableSet setWithCapacity:0];
    objects = self->_objects;
    self->_objects = v11;

    objc_storeStrong((id *)&self->_name, a5);
    v13 = sub_100026B44(self->_archiveFD);
    v14 = [v13 stringByDeletingPathExtension];
    basePath = self->_basePath;
    self->_basePath = v14;

    if (self->_shouldCompress && !self->_useParallelCompression)
    {
      v16 = [(NSString *)self->_basePath stringByDeletingPathExtension];
      v17 = self->_basePath;
      self->_basePath = v16;
    }
    long long v18 = [(NSString *)self->_basePath stringByAppendingString:@"-diagnostic_summary.log"];
    long long v19 = v18;
    if (v18)
    {
      id v20 = v18;
      v21 = fopen((const char *)[v20 fileSystemRepresentation], "wx");
      self->_summaryFD = v21;
      if (!v21)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v22 = __error();
          v23 = strerror(*v22);
          *(_DWORD *)buf = 138412546;
          id v43 = v20;
          __int16 v44 = 2080;
          *(void *)v45 = v23;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open fd at %@ with error %s", buf, 0x16u);
        }
        v24 = +[SDResourceManager sharedResourceManager];
        v25 = __error();
        [v24 log:@"Failed to open fd at %@ with error %s", v20, strerror(*v25)];
      }
    }
    if (self->_useParallelCompression)
    {
      v26 = dlopen(0, 2);
      if (v26)
      {
        v27 = v26;
        dlerror();
        if (!dlsym(v27, "ParallelArchiveWriterCreate"))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Couldn't locate PatallelCompression. Defaulting to libarchive", buf, 2u);
          }
          v28 = +[SDResourceManager sharedResourceManager];
          [v28 log:@"SDArchive: Couldn't locate PatallelCompression. Defaulting to libarchive"];

          self->_useParallelCompression = 0;
        }
        dlclose(v27);
        if (self->_useParallelCompression)
        {
          unsigned int v29 = [(SDArchive *)self _initlibParallelCompressionWithOption:v6];
LABEL_23:
          unsigned int v31 = v29;
          BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
          if (v31)
          {
            if (v32)
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v13;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Error creating archive at path %@", buf, 0xCu);
            }
            v33 = +[SDResourceManager sharedResourceManager];
            [v33 log:@"SDArchive: Error creating archive at path %@", v13];

            goto LABEL_27;
          }
          if (v32)
          {
            unsigned int v35 = [(SDArchive *)self getProtectionClass];
            int archiveFD = self->_archiveFD;
            *(_DWORD *)buf = 138412802;
            id v43 = v13;
            __int16 v44 = 1024;
            *(_DWORD *)v45 = v35;
            *(_WORD *)&v45[4] = 1024;
            *(_DWORD *)&v45[6] = archiveFD;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Successfully created tar at %@ with class %d and descriptor %d", buf, 0x18u);
          }
          v37 = +[SDResourceManager sharedResourceManager];
          [v37 log:@"SDArchive: Successfully created tar at %@ with class %d and descriptor %d", v13, -[SDArchive getProtectionClass](self, "getProtectionClass"), self->_archiveFD];

          v38 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.sysdiagnose.tar", 0);
          tarQueue = self->_tarQueue;
          self->_tarQueue = v38;

LABEL_31:
          self = self;
          v34 = self;
          goto LABEL_32;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get handle to current executable", buf, 2u);
        }
        v30 = +[SDResourceManager sharedResourceManager];
        [v30 log:@"Couldn't get handle to current executable"];

        self->_useParallelCompression = 0;
      }
    }
    unsigned int v29 = [(SDArchive *)self _initlibArchiveshouldCompress:v6];
    goto LABEL_23;
  }
LABEL_27:
  v34 = 0;
LABEL_32:

  return v34;
}

- (int)_writeChunk:(int)a3 maxSize:(int64_t)a4
{
  unint64_t v4 = a4;
  if ((unint64_t)a4 >= 0x2000) {
    size_t v7 = 0x2000;
  }
  else {
    size_t v7 = a4;
  }
  ssize_t v8 = read(a3, v13, v7);
  if (v8 < 1) {
    return 0;
  }
  ssize_t v9 = v8;
  while (1)
  {
    int64_t v10 = [(SDArchive *)self _writeEntryData:v13 size:v9];
    if (v10 != v9) {
      break;
    }
    self->_archiveStatus = 0;
    v4 -= v9;
    if (v4)
    {
      size_t v11 = v4 >= 0x2000 ? 0x2000 : v4;
      ssize_t v9 = read(a3, v13, v11);
      if (v9 > 0) {
        continue;
      }
    }
    return 0;
  }
  self->_archiveStatus = v10;
  return -1;
}

- (void)_createHeaderEntrywithFile:(id)a3 attributes:(stat *)a4
{
  id v6 = a3;
  size_t v7 = (const char *)[v6 UTF8String];
  if (!self->_useParallelCompression)
  {
    uint64_t v11 = archive_entry_new();
    if (v11)
    {
      ssize_t v9 = (void *)v11;
      archive_entry_copy_stat();
      archive_entry_set_pathname();
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: archive_entry_new() failed!", buf, 2u);
    }
    v14 = +[SDResourceManager sharedResourceManager];
    [v14 log:@"SDArchive: archive_entry_new() failed!"];
LABEL_16:

LABEL_17:
    ssize_t v9 = 0;
    goto LABEL_18;
  }
  ssize_t v8 = malloc_type_malloc(0x890uLL, 0x10000409D0E155EuLL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 136315138;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: malloc failed, err : %s", buf, 0xCu);
    }
    v14 = +[SDResourceManager sharedResourceManager];
    v15 = __error();
    [v14 log:@"SDArchive: malloc failed, err : %s", strerror(*v15)];
    goto LABEL_16;
  }
  ssize_t v9 = v8;
  bzero(v8, 0x890uLL);
  if (strlen(v7) >= 0x400)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = (char *)v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: header entry for file path %@ is too long, skipping.", buf, 0xCu);
    }
    int64_t v10 = +[SDResourceManager sharedResourceManager];
    [v10 log:@"SDArchive: header entry for file path %@ is too long, skipping.", v6];

    free(v9);
    goto LABEL_17;
  }
  v9[1] = *(void *)&a4->st_uid;
  *((_DWORD *)v9 + 4) = a4->st_flags;
  *((_DWORD *)v9 + 5) = 33188;
  off_t st_size = a4->st_size;
  v9[8] = st_size;
  v9[5] = st_size;
  void *v9 = 0x4600008201;
  __strlcpy_chk();
LABEL_18:

  return v9;
}

- (void)_disposeEntry:(void *)a3
{
  if (self->_useParallelCompression) {
    free(a3);
  }
  else {
    _archive_entry_free(a3, a2);
  }
}

- (int)_writeArchiveHeader:(void *)a3
{
  if (self->_useParallelCompression)
  {
    int v4 = ParallelArchiveWriteEntryHeader();
    if (v4 < 0) {
      self->_int64_t archiveStatus = -30;
    }
  }
  else
  {
    int v4 = archive_write_header();
    if (v4)
    {
      self->_int64_t archiveStatus = (int)archive_errno();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int64_t archiveStatus = self->_archiveStatus;
        *(_DWORD *)buf = 134218242;
        int64_t v9 = archiveStatus;
        __int16 v10 = 2080;
        uint64_t v11 = archive_error_string();
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: failed to write header. Status: %zd, reason: %s", buf, 0x16u);
      }
      id v6 = +[SDResourceManager sharedResourceManager];
      [v6 log:@"SDArchive: failed to write header. Status: %zd, reason: %s", self->_archiveStatus, archive_error_string()];
    }
  }
  return v4;
}

- (int64_t)_writeEntryData:(void *)a3 size:(int64_t)a4
{
  if (self->_useParallelCompression)
  {
    uint64_t v5 = ParallelArchiveWriteEntryData();
    if (v5)
    {
      uint64_t v6 = v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v14) = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: ParallelCompression failed with error %d", buf, 8u);
      }
      size_t v7 = +[SDResourceManager sharedResourceManager];
      [v7 log:@"SDArchive: ParallelCompression failed with error %d", v6];

      return (int)v6;
    }
  }
  else
  {
    uint64_t v8 = archive_write_data();
    if (v8 != a4)
    {
      int64_t v9 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        int64_t v14 = v9;
        __int16 v15 = 1024;
        int v16 = archive_errno();
        __int16 v17 = 2080;
        uint64_t v18 = archive_error_string();
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: SDArchive failed by returning %zd with error number %d and string %s", buf, 0x1Cu);
      }
      __int16 v10 = +[SDResourceManager sharedResourceManager];
      uint64_t v11 = archive_errno();
      [v10 log:@"SDArchive: SDArchive failed by returning %zd with error number %d and string %s", v9, v11, archive_error_string()];

      return v9;
    }
  }
  return a4;
}

- (void)addArchiveObject:(id)a3
{
  id v4 = a3;
  memset(&v54, 0, sizeof(v54));
  int v5 = [v4 fd];
  uint64_t v6 = [v4 sourcePath];
  size_t v7 = [v4 targetPath];
  uint64_t v8 = [v4 offsets];
  int64_t v9 = [v4 sizes];
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100065F38();
    }
    v13 = +[SDResourceManager sharedResourceManager];
    CFStringRef v14 = @"SDArchive: not going to add file to archive, as its source path is nil";
    [v13 stderrWrite:@"SDArchive: not going to add file to archive, as its source path is nil"];

    __int16 v15 = +[SDResourceManager sharedResourceManager];
    int v16 = v15;
    goto LABEL_12;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100065F80((uint64_t)v6);
    }
    __int16 v17 = +[SDResourceManager sharedResourceManager];
    CFStringRef v14 = @"SDArchive: not going to add source file %@ to archive, as its target path is nil";
    [v17 stderrWrite:@"SDArchive: not going to add source file %@ to archive, as its target path is nil", v6];

    __int16 v15 = +[SDResourceManager sharedResourceManager];
    int v16 = v15;
    v50 = v6;
LABEL_12:
    [v15 log:v14, v50];
LABEL_13:

    goto LABEL_14;
  }
  id v10 = 0;
  int64_t archiveStatus = self->_archiveStatus;
  if (archiveStatus == -30 || archiveStatus == 1)
  {
    id v12 = 0;
    goto LABEL_15;
  }
  if (self->_archiveFD < 0)
  {
LABEL_14:
    id v10 = 0;
    id v12 = 0;
    goto LABEL_15;
  }
  if ([(NSMutableSet *)self->_objects containsObject:v7])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: not going to add %@ to the archive, as it is already present", buf, 0xCu);
    }
    int v16 = +[SDResourceManager sharedResourceManager];
    [v16 log:@"SDArchive: not going to add %@ to the archive, as it is already present", v7];
    goto LABEL_13;
  }
  [(NSMutableSet *)self->_objects addObject:v7];
  if (v5 == -1)
  {
    id v18 = v6;
    int v5 = sub_100056710((const char *)[v18 fileSystemRepresentation], 0);
    if (v5 == -1)
    {
      uint64_t v34 = *__error();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v58 = (char *)v18;
        __int16 v59 = 2080;
        v60 = strerror(v34);
        __int16 v61 = 1024;
        int v62 = v34;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Error opening source file %@: %s (%d)", buf, 0x1Cu);
      }
      unsigned int v35 = +[SDResourceManager sharedResourceManager];
      [v35 log:@"SDArchive: Error opening source file %@: %s (%d)", v18, strerror(v34), v34];

      goto LABEL_14;
    }
  }
  if (fstat(v5, &v54) == -1)
  {
    uint64_t v30 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v31 = strerror(v30);
      *(_DWORD *)buf = 138412802;
      v58 = (char *)v6;
      __int16 v59 = 2080;
      v60 = v31;
      __int16 v61 = 1024;
      int v62 = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Failed to stat source file %@: %s (%d)", buf, 0x1Cu);
    }
    BOOL v32 = +[SDResourceManager sharedResourceManager];
    [v32 log:@"SDArchive: Failed to stat source file %@: %s (%d)", v6, strerror(v30), v30];

    id v10 = 0;
    id v12 = 0;
  }
  else
  {
    unsigned int v53 = v5;
    if (v8
      && [v8 count]
      && ([v9 valueForKeyPath:@"@sum.self"],
          long long v19 = objc_claimAutoreleasedReturnValue(),
          id v20 = [v19 longLongValue],
          v19,
          v20)
      && (uint64_t)v20 < v54.st_size)
    {
      v54.off_t st_size = (off_t)v20;
    }
    else
    {
      v21 = +[NSNumber numberWithInt:0];
      v56 = v21;
      uint64_t v22 = +[NSArray arrayWithObjects:&v56 count:1];

      v23 = +[NSNumber numberWithLongLong:v54.st_size];
      v55 = v23;
      uint64_t v24 = +[NSArray arrayWithObjects:&v55 count:1];

      int64_t v9 = (void *)v24;
      uint64_t v8 = (void *)v22;
    }
    v25 = [v7 pathComponents];
    id v10 = [v25 mutableCopy];

    if (-[NSString length](self->_name, "length") && (unint64_t)[v10 count] >= 2) {
      [v10 setObject:self->_name atIndexedSubscript:0];
    }
    id v12 = +[NSString pathWithComponents:v10];
    v26 = [(SDArchive *)self _createHeaderEntrywithFile:v12 attributes:&v54];
    if (v26)
    {
      v27 = v26;
      if (!self->_useParallelCompression)
      {
        [v6 UTF8String];
        archive_entry_copy_sourcepath();
        archive_read_disk_entry_from_file();
        archive_entry_set_mode();
      }
      v51 = v27;
      if ([(SDArchive *)self _writeArchiveHeader:v27])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (char *)[v12 UTF8String];
          *(_DWORD *)buf = 136315138;
          v58 = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: failed to write header for file, %s", buf, 0xCu);
        }
        unsigned int v29 = +[SDResourceManager sharedResourceManager];
        id v12 = v12;
        [v29 log:@"SDArchive: failed to write header for file, %s", [v12 UTF8String]];

        [(SDArchive *)self _disposeEntry:v51];
      }
      else
      {
        v52 = v9;
        if ([v8 count])
        {
          uint64_t v36 = 0;
          while (1)
          {
            v37 = [v8 objectAtIndexedSubscript:v36];
            unint64_t v38 = (unint64_t)[v37 longLongValue];

            if (v38)
            {
              off_t v39 = lseek(v53, v38, (v38 >> 62) & 2);
              if (v39 < 0) {
                break;
              }
            }
            v40 = [v52 objectAtIndexedSubscript:v36];
            id v41 = [v40 longLongValue];

            if ([(SDArchive *)self _writeChunk:v53 maxSize:v41])
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v58 = (char *)v6;
                __int16 v59 = 2112;
                v60 = (char *)v12;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Failed for file: %@, with destination at: %@", buf, 0x16u);
              }
              v42 = +[SDResourceManager sharedResourceManager];
              [v42 log:@"SDArchive: Failed for file: %@, with destination at: %@", v6, v12];

              goto LABEL_62;
            }
            if ((unint64_t)[v8 count] <= ++v36) {
              goto LABEL_62;
            }
          }
          int64_t v43 = v39;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v44 = __error();
            v45 = strerror(*v44);
            *(_DWORD *)buf = 136315138;
            v58 = v45;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lseek failed :%s", buf, 0xCu);
          }
          v46 = +[SDResourceManager sharedResourceManager];
          v47 = __error();
          [v46 log:@"lseek failed :%s", strerror(*v47)];

          self->_int64_t archiveStatus = v43;
        }
LABEL_62:
        int64_t compressed_size = self->_compressed_size;
        off_t v49 = sub_100027520(self->_archiveFD);
        self->_int64_t compressed_size = v49;
        sub_100027714(self->_summaryFD, v7, self->_basePath, (void *)v54.st_size, (void *)(v49 - compressed_size));
        [(SDArchive *)self _disposeEntry:v51];
        self->_uncompressed_size += v54.st_size;
        int64_t v9 = v52;
        int v5 = v53;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: creating entry for header failed", buf, 2u);
      }
      v33 = +[SDResourceManager sharedResourceManager];
      [v33 log:@"SDArchive: creating entry for header failed"];
    }
  }
  if ([v4 fd] == -1) {
    close(v5);
  }
LABEL_15:
}

- (void)addFileToArchive:(id)a3 withFileName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[SDArchiveFile alloc] initWithPath:v7 target:v6 ofType:NSFileTypeRegular];

  [(SDArchive *)self addArchiveObject:v8];
}

- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  id v6 = +[NSFileManager defaultManager];
  v21 = v5;
  id v7 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  v30[0] = NSURLNameKey;
  v30[1] = NSURLIsDirectoryKey;
  uint64_t v8 = +[NSArray arrayWithObjects:v30 count:2];
  int64_t v9 = [v6 enumeratorAtURL:v7 includingPropertiesForKeys:v8 options:20 errorHandler:&stru_10009E178];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      CFStringRef v14 = 0;
      do
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v14);
        id v24 = 0;
        [v15 getResourceValue:&v24 forKey:NSURLIsDirectoryKey error:0];
        id v17 = v24;
        if (([v17 BOOLValue] & 1) == 0)
        {
          id v18 = [v15 relativePath];
          long long v19 = [v15 path];
          id v20 = [v23 stringByAppendingPathComponent:v18];
          [(SDArchive *)self addFileToArchive:v19 withFileName:v20];
        }
        CFStringRef v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }
}

- (void)addArchiveFile:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    NSFileAttributeType v5 = [v4 fileType];

    if (v5 == NSFileTypeDirectory)
    {
      id v6 = [v8 sourcePath];
      id v7 = [v8 targetPath];
      [(SDArchive *)self addDirectoryToArchive:v6 withDirName:v7];
    }
    else
    {
      [(SDArchive *)self addArchiveObject:v8];
    }
    id v4 = v8;
  }
}

- (int)getProtectionClass
{
  return sub_100026C54(self->_archiveFD);
}

- (int64_t)getUncompressedSize
{
  return self->_uncompressed_size;
}

- (void)closeArchive
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int archiveFD = self->_archiveFD;
    *(_DWORD *)buf = 67109120;
    int v9 = archiveFD;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Closing archive with descriptor %d", buf, 8u);
  }
  id v4 = +[SDResourceManager sharedResourceManager];
  [v4 log:@"SDArchive: Closing archive with descriptor %d", self->_archiveFD];

  int v5 = self->_archiveFD;
  if (v5 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = self->_archiveFD;
      *(_DWORD *)buf = 67109120;
      int v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Not a valid tar descriptor %d to close", buf, 8u);
    }
    id v7 = +[SDResourceManager sharedResourceManager];
    [v7 log:@"SDArchive: Not a valid tar descriptor %d to close", self->_archiveFD];
  }
  else
  {
    close(v5);
  }
  self->_int archiveFD = -1;
}

- (void)finalizeArchiveAndClose:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NSString *)self->_basePath stringByAppendingString:@"-diagnostic_summary.log"];
  int v6 = [(NSString *)self->_basePath lastPathComponent];
  id v7 = [v6 stringByAppendingPathComponent:@"/summaries/diagnostic_summary.log"];

  summaryFD = self->_summaryFD;
  if (summaryFD)
  {
    fclose(summaryFD);
    [(SDArchive *)self addFileToArchive:v5 withFileName:v7];
    int v9 = +[NSFileManager defaultManager];
    id v15 = 0;
    unsigned __int8 v10 = [v9 removeItemAtPath:v5 error:&v15];
    id v11 = v15;

    if ((v10 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v11 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDARCHIVE: error removing summary file %@", buf, 0xCu);
      }
      uint64_t v13 = +[SDResourceManager sharedResourceManager];
      CFStringRef v14 = [v11 localizedDescription];
      [v13 log:@"SDARCHIVE: error removing summary file %@", v14];
    }
  }
  if (self->_useParallelCompression)
  {
    ParallelArchiveWriterDestroy();
    ParallelCompressionOStreamDestroy();
    if (!v3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  archive_write_close();
  archive_write_free();
  archive_read_free();
  if (v3) {
LABEL_9:
  }
    [(SDArchive *)self closeArchive];
LABEL_10:
  if (!self->_archiveStatus) {
    self->_int64_t archiveStatus = 1;
  }
}

- (OS_dispatch_queue)tarQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTarQueue:(id)a3
{
}

- (int64_t)archiveStatus
{
  return self->_archiveStatus;
}

- (void)setArchiveStatus:(int64_t)a3
{
  self->_int64_t archiveStatus = a3;
}

- (int)archiveFD
{
  return self->_archiveFD;
}

- (void)setArchiveFD:(int)a3
{
  self->_int archiveFD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tarQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objects, 0);

  objc_storeStrong((id *)&self->_basePath, 0);
}

@end