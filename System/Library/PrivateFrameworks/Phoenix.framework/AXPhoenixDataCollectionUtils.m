@interface AXPhoenixDataCollectionUtils
+ (id)createFilename:(id)a3 usingTimestamp:(id)a4 withFileExtension:(id)a5 underDirectory:(id)a6;
+ (void)deleteItem:(id)a3;
+ (void)moveFiles:(id)a3 from:(id)a4 to:(id)a5;
@end

@implementation AXPhoenixDataCollectionUtils

+ (id)createFilename:(id)a3 usingTimestamp:(id)a4 withFileExtension:(id)a5 underDirectory:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = 0;
  objc_storeStrong(&v28, a6);
  id v27 = objc_alloc_init(MEMORY[0x263F08790]);
  [v27 setDateFormat:@"YYYY-MM-dd-HH-mm-ss-SSS"];
  id v26 = (id)[v27 stringFromDate:v30];
  id v18 = (id)[MEMORY[0x263F1C5C0] currentDevice];
  id v17 = (id)[v18 identifierForVendor];
  id v16 = (id)[v17 UUIDString];
  id v25 = (id)[v16 substringToIndex:5];

  id v24 = (id)[NSString stringWithFormat:@"%@-%@_%@.%@", v25, v26, location[0], v29];
  if ([v26 isEqualToString:&stru_26EA3C2C8])
  {
    id v6 = (id)[NSString stringWithFormat:@"%@.%@", location[0], v29];
    id v7 = v24;
    id v24 = v6;
  }
  id v11 = (id)[MEMORY[0x263F08850] defaultManager];
  char v12 = [v11 fileExistsAtPath:v28 isDirectory:0];

  if ((v12 & 1) == 0)
  {
    id v23 = 0;
    id v10 = (id)[MEMORY[0x263F08850] defaultManager];
    id v22 = v23;
    [v10 createDirectoryAtPath:v28 withIntermediateDirectories:1 attributes:0 error:&v22];
    objc_storeStrong(&v23, v22);

    if (v23)
    {
      id v21 = (id)AXLogBackTap();
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"+[AXPhoenixDataCollectionUtils createFilename:usingTimestamp:withFileExtension:underDirectory:]", (uint64_t)v23);
        _os_log_error_impl(&dword_2372C8000, (os_log_t)v21, v20, "[PHOENIX] %s Error creating directory: %@", v32, 0x16u);
      }
      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
  }
  id v19 = (id)[NSString stringWithFormat:@"%@/%@", v28, v24];
  id v9 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v9;
}

+ (void)deleteItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  id v9 = (id)[MEMORY[0x263F08850] defaultManager];
  id v16 = v17;
  [v9 removeItemAtPath:location[0] error:&v16];
  objc_storeStrong(&v17, v16);

  if (v17)
  {
    id v15 = (id)AXLogBackTap();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      os_log_type_t type = v14;
      id v8 = (id)[location[0] lastPathComponent];
      id v13 = v8;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v20, (uint64_t)"+[AXPhoenixDataCollectionUtils deleteItem:]", (uint64_t)v13, (uint64_t)v17);
      _os_log_impl(&dword_2372C8000, log, type, "[PHOENIX] %s Error deleting %@: %@", v20, 0x20u);

      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = oslog;
      os_log_type_t v4 = v11;
      id v5 = (id)[location[0] lastPathComponent];
      id v10 = v5;
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v19, (uint64_t)"+[AXPhoenixDataCollectionUtils deleteItem:]", (uint64_t)v10);
      _os_log_impl(&dword_2372C8000, v3, v4, "[PHOENIX] %s Deleted: %@", v19, 0x16u);

      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

+ (void)moveFiles:(id)a3 from:(id)a4 to:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  id v28 = (id)[MEMORY[0x263F08850] defaultManager];
  if (([v28 fileExistsAtPath:v29] & 1) == 0) {
    objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0);
  }
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  os_log_type_t type = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v36, (uint64_t)"+[AXPhoenixDataCollectionUtils moveFiles:from:to:]", (uint64_t)v30, (uint64_t)v29);
    _os_log_impl(&dword_2372C8000, oslog, type, "[PHOENIX] %s Moving files from %@ to %@", v36, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  memset(__b, 0, sizeof(__b));
  id v17 = location[0];
  uint64_t v18 = [v17 countByEnumeratingWithState:__b objects:v35 count:16];
  if (v18)
  {
    uint64_t v14 = *(void *)__b[2];
    uint64_t v15 = 0;
    unint64_t v16 = v18;
    while (1)
    {
      uint64_t v13 = v15;
      if (*(void *)__b[2] != v14) {
        objc_enumerationMutation(v17);
      }
      uint64_t v25 = *(void *)(__b[1] + 8 * v15);
      id v23 = 0;
      id v8 = v28;
      id v6 = NSString;
      v34[0] = v30;
      v34[1] = v25;
      id v12 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v34);
      id v11 = (id)objc_msgSend(v6, "pathWithComponents:");
      id v7 = NSString;
      v33[0] = v29;
      v33[1] = v25;
      id v10 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
      id v9 = (id)objc_msgSend(v7, "pathWithComponents:");
      id v22 = v23;
      objc_msgSend(v8, "moveItemAtPath:toPath:error:", v11);
      objc_storeStrong(&v23, v22);

      if (v23)
      {
        os_log_t v21 = (os_log_t)(id)AXLogBackTap();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v5 = v21;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v32, (uint64_t)"+[AXPhoenixDataCollectionUtils moveFiles:from:to:]", v25);
          _os_log_error_impl(&dword_2372C8000, v5, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error moving file to package directory: %@", v32, 0x16u);
        }
        objc_storeStrong((id *)&v21, 0);
      }
      objc_storeStrong(&v23, 0);
      ++v15;
      if (v13 + 1 >= v16)
      {
        uint64_t v15 = 0;
        unint64_t v16 = [v17 countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v16) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

@end