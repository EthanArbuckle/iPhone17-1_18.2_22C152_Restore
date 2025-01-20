@interface RTArchiver
+ (BOOL)extractArchiveAtURL:(id)a3 error:(id *)a4;
- (BOOL)valid;
- (RTArchiver)init;
- (RTArchiver)initWithOutputURL:(id)a3 compress:(BOOL)a4;
- (void)addDirectoryToArchive:(id)a3;
- (void)addFileToArchive:(id)a3;
- (void)closeArchive;
- (void)dealloc;
- (void)setValid:(BOOL)a3;
@end

@implementation RTArchiver

- (RTArchiver)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithOutputURL_compress_);
}

- (RTArchiver)initWithOutputURL:(id)a3 compress:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTArchiver initWithOutputURL:compress:]";
      __int16 v20 = 1024;
      int v21 = 42;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: outputURL (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)RTArchiver;
  self = [(RTArchiver *)&v17 init];
  if (self)
  {
    self->_archive = (archive *)archive_write_new();
    if (v4) {
      int v7 = archive_write_add_filter_gzip();
    }
    else {
      int v7 = archive_write_add_filter_none();
    }
    int v9 = v7;
    if (!v7)
    {
      int v9 = archive_write_set_format_pax();
      if (!v9)
      {
        id v12 = [v6 path];
        v13 = (const char *)[v12 UTF8String];

        int v14 = open_dprotected_np(v13, 514, 2, 0, 416);
        self->_archive_fd = v14;
        if (v14 < 0)
        {
          v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            int v16 = *__error();
            *(_DWORD *)buf = 138412546;
            v19 = (const char *)v6;
            __int16 v20 = 1024;
            int v21 = v16;
            _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Unable to create archive at path %@ with data protection, errno, %{errno}d", buf, 0x12u);
          }

          archive_write_close();
          goto LABEL_14;
        }
        int v9 = archive_write_open_fd();
        self->_valid = 1;
        if (!v9) {
          goto LABEL_15;
        }
      }
    }
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = (const char *)v6;
      __int16 v20 = 1024;
      int v21 = v9;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Error creating archive at path %@ %d", buf, 0x12u);
    }

    [(RTArchiver *)self closeArchive];
LABEL_14:

    self = 0;
  }
LABEL_15:

  return self;
}

- (void)dealloc
{
  [(RTArchiver *)self closeArchive];
  v3.receiver = self;
  v3.super_class = (Class)RTArchiver;
  [(RTArchiver *)&v3 dealloc];
}

- (void)addFileToArchive:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[RTArchiver addFileToArchive:]";
      __int16 v33 = 1024;
      int v34 = 99;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: filePath (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_9;
  }
  [v3 path];
  id v5 = objc_claimAutoreleasedReturnValue();
  id v6 = (const char *)[v5 UTF8String];

  if (!v6) {
    goto LABEL_10;
  }
  stat(v6, &v24);
  archive_entry_new();
  archive_entry_copy_stat();
  id v7 = [v4 relativePath];
  [v7 UTF8String];
  archive_entry_set_pathname();

  if (archive_write_header())
  {
    v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = [v4 path];
      int v21 = archive_errno();
      uint64_t v22 = archive_error_string();
      *(_DWORD *)buf = 138412802;
      v32 = v20;
      __int16 v33 = 1024;
      int v34 = v21;
      __int16 v35 = 2080;
      uint64_t v36 = v22;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "failed to write header for file, %@, status, %d, reason: %s", buf, 0x1Cu);
    }
    goto LABEL_10;
  }
  int v10 = open(v6, 0);
  if (v10 == -1)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = [v4 path];
      int v16 = *__error();
      int v17 = *__error();
      *(_DWORD *)buf = 138412802;
      v32 = v15;
      __int16 v33 = 1024;
      int v34 = v16;
      __int16 v35 = 1024;
      LODWORD(v36) = v17;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "failed to open file, %@, error, %d %{errno}d", buf, 0x18u);
    }
LABEL_9:

    goto LABEL_10;
  }
  int v11 = v10;
  ssize_t v12 = read(v10, buf, 0x2000uLL);
  if (v12 >= 1)
  {
    ssize_t v13 = v12;
    while (1)
    {
      uint64_t v14 = archive_write_data();
      if (v14 != v13) {
        break;
      }
      ssize_t v13 = read(v11, buf, 0x2000uLL);
      if (v13 <= 0) {
        goto LABEL_22;
      }
    }
    uint64_t v18 = v14;
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = [v4 path];
      *(_DWORD *)v25 = 138412802;
      v26 = v23;
      __int16 v27 = 2048;
      ssize_t v28 = v13;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_error_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_ERROR, "error writing file, %@, request to write %ld bytes but wrote %ld bytes", v25, 0x20u);
    }
  }
LABEL_22:
  archive_entry_free();
  close(v11);
LABEL_10:
}

- (void)addDirectoryToArchive:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v5 = [v3 path];
    id v33 = 0;
    id v6 = [v4 contentsOfDirectoryAtPath:v5 error:&v33];
    id v7 = v33;

    if (v7)
    {
      v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = (const char *)v7;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "error while reading directory, %@", buf, 0xCu);
      }
    }
    else if (v6)
    {
      v26 = v6;
      buf[0] = 0;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id obj = v6;
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      unint64_t v10 = 0x1E4F28000uLL;
      if (v9)
      {
        uint64_t v11 = v9;
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v15 = (void *)MEMORY[0x1E016D870]();
            int v16 = [v3 path];
            int v17 = [v16 stringByAppendingPathComponent:v14];

            uint64_t v18 = [v3 relativePath];
            v19 = [v18 stringByAppendingPathComponent:v14];

            __int16 v20 = [*(id *)(v10 + 3256) defaultManager];
            int v21 = [v20 fileExistsAtPath:v17 isDirectory:buf];

            if (v21)
            {
              uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
              uint64_t v23 = buf[0];
              stat v24 = [v3 baseURL];
              v25 = [v22 fileURLWithPath:v19 isDirectory:v23 relativeToURL:v24];

              if (buf[0]) {
                [(RTArchiver *)self addDirectoryToArchive:v25];
              }
              else {
                [(RTArchiver *)self addFileToArchive:v25];
              }

              unint64_t v10 = 0x1E4F28000;
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v11);
      }

      id v6 = v26;
      id v7 = 0;
    }
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v36 = "-[RTArchiver addDirectoryToArchive:]";
      __int16 v37 = 1024;
      int v38 = 148;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: directory (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)closeArchive
{
  if (self->_valid)
  {
    archive_write_free();
    self->_valid = 0;
  }
  int archive_fd = self->_archive_fd;
  if (archive_fd >= 1)
  {
    close(archive_fd);
    self->_int archive_fd = -1;
  }
}

+ (BOOL)extractArchiveAtURL:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "+[RTArchiver extractArchiveAtURL:error:]";
      __int16 v51 = 1024;
      int v52 = 201;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: archiveURL (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v5 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if (v9)
  {
    archive_read_new();
    archive_read_support_format_all();
    archive_read_support_filter_all();
    id v10 = [v5 path];
    [v10 UTF8String];
    int open_filename = archive_read_open_filename();

    if (open_filename)
    {
      if (a4)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = *MEMORY[0x1E4F5CFE8];
        uint64_t v45 = *MEMORY[0x1E4F28568];
        uint64_t v14 = NSString;
        v15 = [v5 path];
        int v16 = [v14 stringWithFormat:@"failed to open archive, %@, %s", v15, archive_error_string()];
        v46 = v16;
        int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        *a4 = [v12 errorWithDomain:v13 code:0 userInfo:v17];

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      archive_write_disk_new();
      archive_write_disk_set_options();
      while (1)
      {
        int next_header = archive_read_next_header();
        if (next_header) {
          break;
        }
        if (archive_write_header())
        {
          v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v26 = archive_error_string();
            *(_DWORD *)buf = 136315138;
            v50 = (const char *)v26;
            _os_log_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_INFO, "failed to write header, archive_write_header, error, %s", buf, 0xCu);
          }
        }
        else
        {
          while (1)
          {
            int data_block = archive_read_data_block();
            if (data_block) {
              break;
            }
            if (archive_write_data_block() < 0)
            {
              ssize_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
                goto LABEL_26;
              }
              uint64_t v29 = archive_error_string();
              *(_DWORD *)buf = 136315138;
              v50 = (const char *)v29;
              long long v30 = v28;
              long long v31 = "failed to write data block, archive_write_data_block, error, %s";
              goto LABEL_25;
            }
          }
          if (data_block == 1) {
            goto LABEL_27;
          }
          ssize_t v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            uint64_t v32 = archive_error_string();
            *(_DWORD *)buf = 136315138;
            v50 = (const char *)v32;
            long long v30 = v28;
            long long v31 = "failed to read data block, archive_read_data_block, error, %s";
LABEL_25:
            _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, v31, buf, 0xCu);
          }
LABEL_26:

LABEL_27:
          if (archive_write_finish_entry())
          {
            if (a4)
            {
              id v33 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v34 = *MEMORY[0x1E4F5CFE8];
              uint64_t v41 = *MEMORY[0x1E4F28568];
              __int16 v35 = [NSString stringWithFormat:@"failed to write archive, %s", archive_error_string()];
              v42 = v35;
              uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
              __int16 v37 = &v42;
              int v38 = &v41;
              goto LABEL_34;
            }
            goto LABEL_35;
          }
        }
      }
      if (next_header == 1)
      {
        LOBYTE(a4) = 1;
        goto LABEL_36;
      }
      if (a4)
      {
        id v33 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v34 = *MEMORY[0x1E4F5CFE8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        __int16 v35 = [NSString stringWithFormat:@"failed to open archive, %s", archive_error_string()];
        v44 = v35;
        uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v37 = &v44;
        int v38 = &v43;
LABEL_34:
        uint64_t v39 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:1];
        *a4 = [v33 errorWithDomain:v34 code:0 userInfo:v39];

LABEL_35:
        LOBYTE(a4) = 0;
      }
LABEL_36:
      archive_read_free();
    }
    archive_read_free();
  }
  else if (a4)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    __int16 v20 = NSString;
    int v21 = [v5 path];
    uint64_t v22 = [v20 stringWithFormat:@"archive doesn't exist at path, %@", v21];
    v48 = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    *a4 = [v18 errorWithDomain:v19 code:0 userInfo:v23];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end