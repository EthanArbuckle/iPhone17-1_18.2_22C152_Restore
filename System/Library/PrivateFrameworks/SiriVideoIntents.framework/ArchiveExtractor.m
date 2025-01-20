@interface ArchiveExtractor
- (BOOL)copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4;
- (BOOL)extractArchiveAtURL:(id)a3 toDestinationDirectoryURL:(id)a4;
- (BOOL)performExtractionForArchive:(archive *)a3 toDestinationDirectory:(id)a4;
- (BOOL)unarchiveData:(id)a3 toDestinationDirectory:(id)a4;
- (archive)createReadArchive;
- (archive)createWriteDiskArchive;
- (void)createReadArchive;
- (void)createWriteDiskArchive;
@end

@implementation ArchiveExtractor

- (archive)createReadArchive
{
  uint64_t v2 = archive_read_new();
  if (!v2)
  {
    v5 = TRILogCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor createReadArchive]();
    }
    goto LABEL_10;
  }
  v3 = (archive *)v2;
  if (archive_read_support_format_zip())
  {
    v4 = TRILogCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      if (!archive_read_free()) {
        return 0;
      }
      v5 = TRILogCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_22BB6D000, v5, OS_LOG_TYPE_DEFAULT, "Unable to free archive_read (leaking)", v8, 2u);
      }
LABEL_10:

      return 0;
    }
LABEL_4:
    -[ArchiveExtractor createReadArchive]();
    goto LABEL_5;
  }
  int support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20 && support_filter_all)
  {
    v4 = TRILogCategory();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  return v3;
}

- (archive)createWriteDiskArchive
{
  uint64_t v2 = (archive *)archive_write_disk_new();
  if (v2)
  {
    if (archive_write_disk_set_standard_lookup())
    {
      v3 = TRILogCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[ArchiveExtractor createWriteDiskArchive]();
      }
    }
    else
    {
      if (!archive_write_disk_set_options()) {
        return v2;
      }
      v3 = TRILogCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[ArchiveExtractor createWriteDiskArchive]();
      }
    }

    if (archive_write_free())
    {
      v4 = TRILogCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_22BB6D000, v4, OS_LOG_TYPE_DEFAULT, "Unable to free archive_write_disk (leaking)", v6, 2u);
      }
    }
    return 0;
  }
  return v2;
}

- (BOOL)copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4
{
  while (1)
  {
    int data_block = archive_read_data_block();
    if (data_block) {
      break;
    }
    if (archive_write_data_block() < 0)
    {
      v5 = TRILogCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[ArchiveExtractor copyDataFromReadArchive:toWriteDiskArchive:]();
      }
      goto LABEL_8;
    }
  }
  if (data_block == 1) {
    return data_block;
  }
  v5 = TRILogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[ArchiveExtractor copyDataFromReadArchive:toWriteDiskArchive:]();
  }
LABEL_8:

  LOBYTE(data_block) = 0;
  return data_block;
}

- (BOOL)performExtractionForArchive:(archive *)a3 toDestinationDirectory:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [MEMORY[0x263F08850] defaultManager];
  id v40 = 0;
  char v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v40];
  v9 = v40;

  if ((v8 & 1) == 0)
  {
    v10 = [v9 domain];
    if ([v10 isEqualToString:*MEMORY[0x263F07F70]])
    {
      uint64_t v11 = [v9 code];

      if (v11 == 516) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    v31 = TRILogCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:]0();
    }

    goto LABEL_39;
  }
LABEL_4:

  v12 = [(ArchiveExtractor *)self createWriteDiskArchive];
  if (!v12)
  {
    v9 = TRILogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:]();
    }
LABEL_39:
    BOOL v32 = 0;
    goto LABEL_59;
  }
  v13 = v12;
  v14 = [v6 URLByResolvingSymlinksInPath];

  do
  {
    uint64_t v39 = 0;
    int next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header == 1)
      {
        BOOL v32 = 1;
        goto LABEL_51;
      }
      v33 = TRILogCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.4();
      }
      goto LABEL_46;
    }
    int v16 = archive_entry_filetype();
    v17 = (void *)MEMORY[0x230F531D0]();
    uint64_t v18 = archive_entry_pathname_utf8();
    if (!v18)
    {
      v34 = TRILogCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.5();
      }

      goto LABEL_50;
    }
    v19 = (const char *)v18;
    uint64_t v20 = 0;
    do
      int v21 = *(unsigned __int8 *)(v18 + v20++);
    while (v21 == 47);
    if (v20 != 1)
    {
      v22 = TRILogCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        size_t v23 = strlen(v19);
        *(_DWORD *)buf = 134218240;
        uint64_t v42 = v20 - 1;
        __int16 v43 = 2048;
        size_t v44 = v23;
        _os_log_impl(&dword_22BB6D000, v22, OS_LOG_TYPE_INFO, "archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
      }
    }
    v24 = (void *)[[NSString alloc] initWithUTF8String:&v19[v20 - 1]];
    v25 = v24;
    if (!v24)
    {
      v27 = TRILogCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v42 = (uint64_t)&v19[v20 - 1];
        _os_log_error_impl(&dword_22BB6D000, v27, OS_LOG_TYPE_ERROR, "Unable to initialize entry path with string %s", buf, 0xCu);
      }
      LODWORD(v26) = 1;
      goto LABEL_23;
    }
    uint64_t v26 = [v24 length];
    if (!v26 && v16 != 0x4000)
    {
      v27 = TRILogCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.9(&v37, v38, v27);
      }
      LODWORD(v26) = 2;
LABEL_23:

      continue;
    }
    v28 = [v14 path];
    v29 = [v28 stringByAppendingPathComponent:v25];

    id v30 = v29;
    [v30 fileSystemRepresentation];
    archive_entry_update_pathname_utf8();

    archive_entry_perm();
    archive_entry_set_perm();
    if (v26)
    {
      if (archive_write_header())
      {
        v33 = TRILogCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.8();
        }
        goto LABEL_46;
      }
      if ((!archive_entry_size_is_set() || archive_entry_size() >= 1)
        && ![(ArchiveExtractor *)self copyDataFromReadArchive:a3 toWriteDiskArchive:v13])
      {
        v33 = TRILogCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.7();
        }
        goto LABEL_46;
      }
      if (archive_write_finish_entry())
      {
        v33 = TRILogCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.6();
        }
LABEL_46:

        goto LABEL_50;
      }
      LODWORD(v26) = 0;
    }
  }
  while (!v26);
  if (v26 != 2)
  {
    BOOL v32 = 0;
    goto LABEL_60;
  }
LABEL_50:
  BOOL v32 = 0;
LABEL_51:
  if (archive_write_close())
  {
    v35 = TRILogCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:]();
    }

    BOOL v32 = 0;
  }
  if (archive_write_free())
  {
    v9 = TRILogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:]();
    }
    id v6 = v14;
LABEL_59:

    v14 = v6;
  }
LABEL_60:

  return v32;
}

- (BOOL)unarchiveData:(id)a3 toDestinationDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(ArchiveExtractor *)self createReadArchive];
  if (!v8)
  {
    v13 = TRILogCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor unarchiveData:toDestinationDirectory:]();
    }
    BOOL v12 = 0;
    goto LABEL_16;
  }
  v9 = v8;
  id v10 = v6;
  [v10 bytes];
  [v10 length];
  if (archive_read_open_memory())
  {
    uint64_t v11 = TRILogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor unarchiveData:toDestinationDirectory:]();
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = [(ArchiveExtractor *)self performExtractionForArchive:v9 toDestinationDirectory:v7];
    if (!archive_read_close()) {
      goto LABEL_13;
    }
    uint64_t v11 = TRILogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor unarchiveData:toDestinationDirectory:]();
    }
  }

LABEL_13:
  if (archive_read_free())
  {
    v13 = TRILogCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22BB6D000, v13, OS_LOG_TYPE_DEFAULT, "unable to free archive_read (leaking)", v15, 2u);
    }
LABEL_16:
  }
  return v12;
}

- (BOOL)extractArchiveAtURL:(id)a3 toDestinationDirectoryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 path];
  id v14 = 0;
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfFile:v8 options:8 error:&v14];
  id v10 = v14;
  if (!v9)
  {
    BOOL v12 = TRILogCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor extractArchiveAtURL:toDestinationDirectoryURL:]();
    }
    goto LABEL_8;
  }
  if (![(ArchiveExtractor *)self unarchiveData:v9 toDestinationDirectory:v7])
  {
    BOOL v12 = TRILogCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ArchiveExtractor extractArchiveAtURL:toDestinationDirectoryURL:]();
    }
LABEL_8:

    BOOL v11 = 0;
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (void)createReadArchive
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_read unable to set supported formats: %s.", v2, v3, v4, v5, v6);
}

- (void)createWriteDiskArchive
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_write_disk unable to set lookup functions - %s.", v2, v3, v4, v5, v6);
}

- (void)copyDataFromReadArchive:toWriteDiskArchive:.cold.1()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_read_data_block failed - %s.", v2, v3, v4, v5, v6);
}

- (void)copyDataFromReadArchive:toWriteDiskArchive:.cold.2()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_write_data_block failed - %s.", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22BB6D000, v0, v1, "Error creating disk archive for writing.", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22BB6D000, v0, v1, "unable to free archive_write_disk", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22BB6D000, v0, v1, "unable to close archive_write_disk", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.4()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_read_next_header failed - %s.", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22BB6D000, v0, v1, "archive_entry with no path encountered.", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.6()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_write_finish_entry failed - %s", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.7()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "error copying data to write archive - %s", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.8()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "archive_write_header failed - %s", v2, v3, v4, v5, v6);
}

- (void)performExtractionForArchive:(os_log_t)log toDestinationDirectory:.cold.9(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22BB6D000, log, OS_LOG_TYPE_ERROR, "archive_entry with no path after sanitization encountered.", buf, 2u);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.10()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22BB6D000, v0, v1, "failed to create directory at %@ - %@.");
}

- (void)unarchiveData:toDestinationDirectory:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22BB6D000, v0, v1, "Error creating archive for reading.", v2, v3, v4, v5, v6);
}

- (void)unarchiveData:toDestinationDirectory:.cold.2()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "unable to close archive_read - %s.", v2, v3, v4, v5, v6);
}

- (void)unarchiveData:toDestinationDirectory:.cold.3()
{
  archive_error_string();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22BB6D000, v0, v1, "unable to open archive_read - %s.", v2, v3, v4, v5, v6);
}

- (void)extractArchiveAtURL:toDestinationDirectoryURL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_22BB6D000, v0, v1, "Error reading archive file at %@: %@");
}

- (void)extractArchiveAtURL:toDestinationDirectoryURL:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_22BB6D000, v0, OS_LOG_TYPE_ERROR, "Error unarchiving file at %@", v1, 0xCu);
}

@end