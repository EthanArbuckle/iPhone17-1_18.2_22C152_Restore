@interface AXPhoenixDataArchiver
- (AXPhoenixDataArchiver)initWithPath:(id)a3;
- (archive)archiver;
- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4;
- (void)addFileToArchive:(id)a3 withFileName:(id)a4;
- (void)closeArchive;
- (void)setArchiver:(archive *)a3;
@end

@implementation AXPhoenixDataArchiver

- (AXPhoenixDataArchiver)initWithPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v9;
  id v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AXPhoenixDataArchiver;
  id v9 = [(AXPhoenixDataArchiver *)&v7 init];
  objc_storeStrong(&v9, v9);
  if (!v9) {
    goto LABEL_7;
  }
  [v9 setArchiver:archive_write_new()];
  [v9 archiver];
  archive_write_add_filter_gzip();
  [v9 archiver];
  archive_write_set_format_ustar();
  [v9 archiver];
  [location[0] UTF8String];
  int v6 = archive_write_open_filename();
  if (!v6)
  {
    chmod((const char *)[location[0] UTF8String], 0x1B4u);
LABEL_7:
    v10 = (AXPhoenixDataArchiver *)v9;
    goto LABEL_8;
  }
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_3_8_32_8_64_4_0((uint64_t)v11, (uint64_t)"-[AXPhoenixDataArchiver initWithPath:]", (uint64_t)location[0], v6);
    _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error creating archive at path %@ %d", v11, 0x1Cu);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&v9, 0);
  v10 = 0;
LABEL_8:
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (void)addFileToArchive:(id)a3 withFileName:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  uint64_t v15 = 0;
  memset(&__b, 0, sizeof(__b));
  ssize_t i = 0;
  int v12 = 0;
  v11 = (char *)[location[0] UTF8String];
  if (v11)
  {
    stat(v11, &__b);
    uint64_t v15 = archive_entry_new();
    archive_entry_copy_stat();
    [v16 UTF8String];
    archive_entry_set_pathname();
    [(AXPhoenixDataArchiver *)v18 archiver];
    archive_write_header();
    int v12 = open(v11, 0);
    if (v12 == -1)
    {
      os_log_t v7 = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = location[0];
        v4 = __error();
        __os_log_helper_16_2_3_8_32_8_64_4_0((uint64_t)v19, (uint64_t)"-[AXPhoenixDataArchiver addFileToArchive:withFileName:]", (uint64_t)v5, *v4);
        _os_log_impl(&dword_2372C8000, v7, OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Error opening file %@:%d", v19, 0x1Cu);
      }
      objc_storeStrong((id *)&v7, 0);
      int v8 = 1;
    }
    else
    {
      for (ssize_t i = read(v12, v21, 0x2000uLL); i > 0; ssize_t i = read(v12, v21, 0x2000uLL))
      {
        [(AXPhoenixDataArchiver *)v18 archiver];
        archive_write_data();
      }
      archive_entry_free();
      close(v12);
      int v8 = 0;
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v20, (uint64_t)"-[AXPhoenixDataArchiver addFileToArchive:withFileName:]");
      _os_log_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Error, requested to add nil file to archive", v20, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v8 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  id v21 = (id)[MEMORY[0x263F08850] defaultManager];
  id v28 = (id)[v21 contentsOfDirectoryAtPath:location[0] error:0];

  char v27 = 0;
  memset(__b, 0, sizeof(__b));
  id v22 = v28;
  uint64_t v23 = [v22 countByEnumeratingWithState:__b objects:v32 count:16];
  if (v23)
  {
    uint64_t v17 = *(void *)__b[2];
    uint64_t v18 = 0;
    unint64_t v19 = v23;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)__b[2] != v17) {
        objc_enumerationMutation(v22);
      }
      id v26 = *(id *)(__b[1] + 8 * v18);
      id v24 = (id)[location[0] stringByAppendingPathComponent:v26];
      id v14 = (id)[MEMORY[0x263F08850] defaultManager];
      char v15 = [v14 fileExistsAtPath:v24 isDirectory:&v27];

      if (v15)
      {
        if (v27)
        {
          v11 = v31;
          id v10 = v24;
          id v9 = v29;
          id v13 = (id)[v26 lastPathComponent];
          id v12 = (id)objc_msgSend(v9, "stringByAppendingPathComponent:");
          -[AXPhoenixDataArchiver addDirectoryToArchive:withDirName:](v11, "addDirectoryToArchive:withDirName:", v10);
        }
        else
        {
          int v6 = v31;
          id v5 = v24;
          id v4 = v29;
          id v8 = (id)[v26 lastPathComponent];
          id v7 = (id)objc_msgSend(v4, "stringByAppendingPathComponent:");
          -[AXPhoenixDataArchiver addFileToArchive:withFileName:](v6, "addFileToArchive:withFileName:", v5);
        }
      }
      objc_storeStrong(&v24, 0);
      ++v18;
      if (v16 + 1 >= v19)
      {
        uint64_t v18 = 0;
        unint64_t v19 = [v22 countByEnumeratingWithState:__b objects:v32 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)closeArchive
{
}

- (archive)archiver
{
  return self->_archiver;
}

- (void)setArchiver:(archive *)a3
{
  self->_archiver = a3;
}

@end