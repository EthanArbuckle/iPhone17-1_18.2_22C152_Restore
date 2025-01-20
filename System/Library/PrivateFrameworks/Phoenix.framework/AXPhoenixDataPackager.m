@interface AXPhoenixDataPackager
- (AXPhoenixDataPackager)initWithFileSuffixes:(id)a3 fromDataDirectory:(id)a4;
- (BOOL)isValidFile:(id)a3;
- (NSArray)allowedFileSuffixes;
- (NSString)dataDirectory;
- (id)_archiveDirectory:(id)a3;
- (id)_buildPackageDirectoryNameFromFilename:(id)a3 withMetadata:(id)a4;
- (id)_createPackageDirectory:(id)a3 withPackageDirectoryName:(id)a4;
- (id)_getDataForSubsession:(id)a3;
- (id)packageDataUsingFiles:(id)a3;
- (void)setAllowedFileSuffixes:(id)a3;
- (void)setDataDirectory:(id)a3;
@end

@implementation AXPhoenixDataPackager

- (AXPhoenixDataPackager)initWithFileSuffixes:(id)a3 fromDataDirectory:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AXPhoenixDataPackager;
  v11 = [(AXPhoenixDataPackager *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    [(AXPhoenixDataPackager *)v11 setAllowedFileSuffixes:location[0]];
    [(AXPhoenixDataPackager *)v11 setDataDirectory:v9];
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (id)packageDataUsingFiles:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"SELF ENDSWITH %@", kMetadataFileExtension];
  id v22 = (id)[location[0] filteredArrayUsingPredicate:v23];
  id v21 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  id obj = v22;
  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v11);
      id v18 = [(AXPhoenixDataPackager *)v25 _getDataForSubsession:v20];
      id v17 = [(AXPhoenixDataPackager *)v25 _buildPackageDirectoryNameFromFilename:v20 withMetadata:v18];
      v5 = v25;
      v6 = [(AXPhoenixDataPackager *)v25 dataDirectory];
      id v16 = -[AXPhoenixDataPackager _createPackageDirectory:withPackageDirectoryName:](v5, "_createPackageDirectory:withPackageDirectoryName:");

      id v8 = (id)[v18 objectForKeyedSubscript:@"data_files"];
      v7 = [(AXPhoenixDataPackager *)v25 dataDirectory];
      +[AXPhoenixDataCollectionUtils moveFiles:from:to:](AXPhoenixDataCollectionUtils, "moveFiles:from:to:", v8);

      id v15 = [(AXPhoenixDataPackager *)v25 _archiveDirectory:v16];
      [v21 addObject:v15];
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v18, 0);
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  id v4 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)isValidFile:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  id obj = [(AXPhoenixDataPackager *)v14 allowedFileSuffixes];
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(__b[1] + 8 * v6);
      if ([location[0] hasSuffix:v12]) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v7) {
          goto LABEL_9;
        }
      }
    }
    char v15 = 1;
    int v10 = 1;
  }
  else
  {
LABEL_9:
    int v10 = 0;
  }

  if (!v10) {
    char v15 = 0;
  }
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (id)_getDataForSubsession:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v4 = [(AXPhoenixDataPackager *)v16 dataDirectory];
  uint64_t v14 = [(NSString *)v4 stringByAppendingPathComponent:location[0]];

  id v13 = (id)[MEMORY[0x263EFF8F8] dataWithContentsOfFile:v14];
  id v12 = (id)[MEMORY[0x263F08900] JSONObjectWithData:v13 options:0 error:0];
  id v5 = (id)[v12 objectForKeyedSubscript:@"sensors"];
  id v11 = (id)[v5 allValues];

  id v6 = (id)[v12 objectForKeyedSubscript:@"annotations"];
  id v10 = (id)[v6 allValues];

  id v9 = (id)objc_opt_new();
  [v9 addObjectsFromArray:v11];
  [v9 addObjectsFromArray:v10];
  [v9 addObject:location[0]];
  v17[0] = @"data_files";
  v18[0] = v9;
  v17[1] = @"username";
  id v7 = (id)objc_msgSend(v12, "objectForKeyedSubscript:");
  v18[1] = v7;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_buildPackageDirectoryNameFromFilename:(id)a3 withMetadata:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  uint64_t v7 = [location[0] length];
  uint64_t v17 = v7 - [(id)kMetadataFileExtension length];
  id v16 = (id)[location[0] substringToIndex:v17];
  uint64_t v13 = [location[0] rangeOfString:@"-"];
  uint64_t v14 = v4;
  uint64_t v15 = v13 + 1;
  id v12 = (id)[v16 substringFromIndex:v13 + 1];
  id v8 = NSString;
  id v9 = (id)[v18 objectForKeyedSubscript:@"username"];
  id v11 = (id)[v8 stringWithFormat:@"%@_%@", v9, v12];

  id v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (id)_createPackageDirectory:(id)a3 withPackageDirectoryName:(id)a4
{
  v22[2] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  uint64_t v7 = NSString;
  v22[0] = location[0];
  v22[1] = v17;
  id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
  id v16 = (id)objc_msgSend(v7, "pathWithComponents:");

  id v15 = 0;
  id v9 = (id)[MEMORY[0x263F08850] defaultManager];
  id v14 = v15;
  [v9 createDirectoryAtPath:v16 withIntermediateDirectories:0 attributes:0 error:&v14];
  objc_storeStrong(&v15, v14);

  if (v15)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v21, (uint64_t)"-[AXPhoenixDataPackager _createPackageDirectory:withPackageDirectoryName:]", (uint64_t)v15);
      _os_log_error_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Error while creating package directory: %@. Using /tmp...", v21, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v19 = @"/tmp";
    int v11 = 1;
  }
  else
  {
    os_log_t v10 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v20, (uint64_t)"-[AXPhoenixDataPackager _createPackageDirectory:withPackageDirectoryName:]", (uint64_t)v16);
      _os_log_impl(&dword_2372C8000, v10, OS_LOG_TYPE_INFO, "[PHOENIX] %s Created package directory at %@", v20, 0x16u);
    }
    objc_storeStrong((id *)&v10, 0);
    v19 = (__CFString *)v16;
    int v11 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  uint64_t v4 = v19;
  return v4;
}

- (id)_archiveDirectory:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = (id)[NSString stringWithFormat:@"%@.tgz", location[0]];
  id v26 = (id)[v27 stringByAppendingString:@".tmp"];
  id v25 = [[AXPhoenixDataArchiver alloc] initWithPath:v26];
  id v12 = location[0];
  id v13 = (id)[location[0] lastPathComponent];
  objc_msgSend(v25, "addDirectoryToArchive:withDirName:", v12);

  [v25 closeArchive];
  id v24 = 0;
  id v14 = (id)[MEMORY[0x263F08850] defaultManager];
  id v23 = v24;
  [v14 removeItemAtPath:location[0] error:&v23];
  objc_storeStrong(&v24, v23);

  if (v24)
  {
    id v22 = (id)AXLogBackTap();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      log = v22;
      os_log_type_t type = v21;
      id v11 = (id)[location[0] lastPathComponent];
      id v20 = v11;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v31, (uint64_t)"-[AXPhoenixDataPackager _archiveDirectory:]", (uint64_t)v20, (uint64_t)v24);
      _os_log_impl(&dword_2372C8000, log, type, "[PHOENIX] %s Error deleting %@: %@", v31, 0x20u);

      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v22, 0);
  }
  else
  {
    id v19 = (id)AXLogBackTap();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v19;
      os_log_type_t v7 = v18;
      id v8 = (id)[location[0] lastPathComponent];
      id v17 = v8;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v30, (uint64_t)"-[AXPhoenixDataPackager _archiveDirectory:]", (uint64_t)v17);
      _os_log_impl(&dword_2372C8000, v6, v7, "[PHOENIX] %s Deleted: %@", v30, 0x16u);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(&v24, 0);
  id v5 = (id)[MEMORY[0x263F08850] defaultManager];
  id obj = v24;
  [v5 moveItemAtPath:v26 toPath:v27 error:&obj];
  objc_storeStrong(&v24, obj);

  if (v24)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v29, (uint64_t)"-[AXPhoenixDataPackager _archiveDirectory:]", (uint64_t)v24);
      _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error while renaming temporary archive file: %@", v29, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v4 = v27;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (NSString)dataDirectory
{
  return self->_dataDirectory;
}

- (void)setDataDirectory:(id)a3
{
}

- (NSArray)allowedFileSuffixes
{
  return self->_allowedFileSuffixes;
}

- (void)setAllowedFileSuffixes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end