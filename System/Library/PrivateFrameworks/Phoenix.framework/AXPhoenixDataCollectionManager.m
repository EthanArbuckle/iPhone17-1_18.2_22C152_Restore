@interface AXPhoenixDataCollectionManager
+ (id)sharedInstance;
- (AXPhoenixDataCollectionManager)init;
- (AXPhoenixDataCollectionManagerDelegate)delegate;
- (BOOL)isRunning;
- (NSString)uploadErrorMessage;
- (OS_dispatch_queue)queue;
- (int64_t)packagesRemaining;
- (void)removeOldData;
- (void)reportFalsePositive:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setPackagesRemaining:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setUploadErrorMessage:(id)a3;
- (void)start;
- (void)stop;
- (void)timerTick;
- (void)updateUploadStatus:(int64_t)a3 error:(id)a4;
- (void)uploadPackages;
@end

@implementation AXPhoenixDataCollectionManager

- (AXPhoenixDataCollectionManager)init
{
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)AXPhoenixDataCollectionManager;
  v9 = [(AXPhoenixDataCollectionManager *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.accessibility.phoenix.dataCollectionManager", 0);
    -[AXPhoenixDataCollectionManager setQueue:](v9, "setQueue:");

    object = [(AXPhoenixDataCollectionManager *)v9 queue];
    v5 = dispatch_get_global_queue(17, 0);
    dispatch_set_target_queue(object, v5);
  }
  v3 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v3;
}

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken_1;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance_instance;
  return v2;
}

void __48__AXPhoenixDataCollectionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXPhoenixDataCollectionManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

- (void)start
{
}

- (void)stop
{
  [(AXPhoenixDataCollectionManager *)self setIsRunning:0];
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:self];
}

- (void)timerTick
{
  v10 = self;
  v9[1] = (id)a2;
  [(AXPhoenixDataCollectionManager *)self uploadPackages];
  dispatch_time_t when = dispatch_time(0, 600000000000);
  queue = [(AXPhoenixDataCollectionManager *)v10 queue];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  objc_super v7 = __43__AXPhoenixDataCollectionManager_timerTick__block_invoke;
  SEL v8 = &unk_264CCE560;
  v9[0] = v10;
  dispatch_after(when, queue, &v4);

  objc_storeStrong(v9, 0);
}

uint64_t __43__AXPhoenixDataCollectionManager_timerTick__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRunning];
  if (result) {
    return [*(id *)(a1 + 32) timerTick];
  }
  return result;
}

- (void)removeOldData
{
  v39[4] = *MEMORY[0x263EF8340];
  v35[2] = self;
  v35[1] = (id)a2;
  v35[0] = (id)[MEMORY[0x263F08850] defaultManager];
  id v34 = 0;
  v33[1] = (id)5;
  id v14 = v35[0];
  id v17 = (id)[NSURL fileURLWithPath:@"/var/mobile/DTX"];
  v39[0] = *MEMORY[0x263EFF750];
  v39[1] = *MEMORY[0x263EFF610];
  v39[2] = *MEMORY[0x263EFF6A8];
  v39[3] = *MEMORY[0x263EFF688];
  id v16 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];
  id v32 = v34;
  id v15 = (id)objc_msgSend(v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v17);
  objc_storeStrong(&v34, v32);
  v33[0] = v15;

  memset(__b, 0, sizeof(__b));
  id obj = v33[0];
  uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
  if (v19)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v19;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      id v31 = *(id *)(__b[1] + 8 * v12);
      id v7 = v31;
      v37[0] = *MEMORY[0x263EFF750];
      v37[1] = *MEMORY[0x263EFF610];
      id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
      id v28 = v34;
      id v8 = (id)objc_msgSend(v7, "resourceValuesForKeys:error:");
      objc_storeStrong(&v34, v28);
      id v29 = v8;

      if (v29 && !v34)
      {
        id v24 = (id)[v29 objectForKeyedSubscript:*MEMORY[0x263EFF750]];
        id v23 = (id)[v24 pathExtension];
        id v22 = (id)[v29 objectForKeyedSubscript:*MEMORY[0x263EFF610]];
        char v20 = 0;
        BOOL v4 = 0;
        if ([v23 isEqualToString:@"json"])
        {
          id v21 = (id)[MEMORY[0x263EFF910] date];
          char v20 = 1;
          [v21 timeIntervalSinceDate:v22];
          BOOL v4 = v2 > 172800.0;
        }
        if (v20) {

        }
        if (v4)
        {
          id v3 = (id)[v31 path];
          +[AXPhoenixDataCollectionUtils deleteItem:](AXPhoenixDataCollectionUtils, "deleteItem:");
        }
        objc_storeStrong(&v22, 0);
        objc_storeStrong(&v23, 0);
        objc_storeStrong(&v24, 0);
        int v25 = 0;
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)AXLogBackTap();
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v6 = type;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v36, (uint64_t)"-[AXPhoenixDataCollectionManager removeOldData]", (uint64_t)v31);
          _os_log_error_impl(&dword_2372C8000, log, v6, "[PHOENIX] %s Error getting metadata properties for %@", v36, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v25 = 3;
      }
      objc_storeStrong(&v29, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(v35, 0);
}

- (void)uploadPackages
{
  v69[4] = *MEMORY[0x263EF8340];
  v61 = self;
  v60[1] = (id)a2;
  [(AXPhoenixDataCollectionManager *)self removeOldData];
  v60[0] = (id)[MEMORY[0x263F08850] defaultManager];
  id v59 = 0;
  v58[1] = (id)5;
  id v28 = v60[0];
  id v31 = (id)objc_msgSend(NSURL, "fileURLWithPath:");
  v69[0] = *MEMORY[0x263EFF750];
  v69[1] = *MEMORY[0x263EFF610];
  v69[2] = *MEMORY[0x263EFF6A8];
  v69[3] = *MEMORY[0x263EFF688];
  id v30 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:4];
  id obj = v59;
  id v29 = (id)objc_msgSend(v28, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v31);
  objc_storeStrong(&v59, obj);
  v58[0] = v29;

  id v56 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v54 = [[AXPhoenixDataPackager alloc] initWithFileSuffixes:&unk_26EA419C8 fromDataDirectory:@"/var/mobile/DTX/FalsePositives"];
  unint64_t v53 = 0;
  memset(__b, 0, sizeof(__b));
  id v32 = v58[0];
  uint64_t v33 = [v32 countByEnumeratingWithState:__b objects:v68 count:16];
  if (v33)
  {
    uint64_t v25 = *(void *)__b[2];
    uint64_t v26 = 0;
    unint64_t v27 = v33;
    while (1)
    {
      uint64_t v24 = v26;
      if (*(void *)__b[2] != v25) {
        objc_enumerationMutation(v32);
      }
      id v52 = *(id *)(__b[1] + 8 * v26);
      id v21 = v52;
      v67[0] = *MEMORY[0x263EFF750];
      v67[1] = *MEMORY[0x263EFF610];
      v67[2] = *MEMORY[0x263EFF6A8];
      v67[3] = *MEMORY[0x263EFF688];
      id v23 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:4];
      id v49 = v59;
      id v22 = (id)objc_msgSend(v21, "resourceValuesForKeys:error:");
      objc_storeStrong(&v59, v49);
      id v50 = v22;

      if (v50 && !v59)
      {
        id v45 = (id)[v50 objectForKeyedSubscript:*MEMORY[0x263EFF750]];
        id v44 = (id)[v45 pathExtension];
        uint64_t v43 = 0;
        id v15 = (id)[v50 objectForKeyedSubscript:*MEMORY[0x263EFF688]];
        uint64_t v16 = [v15 unsignedLongLongValue];

        uint64_t v43 = v16;
        char v42 = 0;
        id v17 = (id)[v50 objectForKeyedSubscript:*MEMORY[0x263EFF6A8]];
        char v18 = [v17 BOOLValue];

        char v42 = v18 & 1;
        if (v18)
        {
          id v10 = (id)[v52 path];
          +[AXPhoenixDataCollectionUtils deleteItem:](AXPhoenixDataCollectionUtils, "deleteItem:");
        }
        else if ([v44 isEqualToString:@"tgz"])
        {
          id v12 = v56;
          uint64_t v11 = NSString;
          v65[0] = @"/var/mobile/DTX/FalsePositives";
          v65[1] = v45;
          id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:2];
          id v13 = (id)objc_msgSend(v11, "pathWithComponents:");
          objc_msgSend(v12, "addObject:");
        }
        else if ([v54 isValidFile:v45])
        {
          [v55 addObject:v45];
          v53 += v43;
        }
        objc_storeStrong(&v44, 0);
        objc_storeStrong(&v45, 0);
        int v46 = 0;
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)AXLogBackTap();
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v20 = type;
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v66, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]", (uint64_t)v52);
          _os_log_error_impl(&dword_2372C8000, log, v20, "[PHOENIX] %s Error getting metadata properties for %@", v66, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v46 = 3;
      }
      objc_storeStrong(&v50, 0);
      ++v26;
      if (v24 + 1 >= v27)
      {
        uint64_t v26 = 0;
        unint64_t v27 = [v32 countByEnumeratingWithState:__b objects:v68 count:16];
        if (!v27) {
          break;
        }
      }
    }
  }

  int v2 = [v56 count];
  [(AXPhoenixDataCollectionManager *)v61 setPackagesRemaining:v2];
  if ((unint64_t)[v55 count] < 2 && v53 <= 0x19000)
  {
    if ([v55 count]) {
      [(AXPhoenixDataCollectionManager *)v61 setPackagesRemaining:[(AXPhoenixDataCollectionManager *)v61 packagesRemaining] + 1];
    }
  }
  else
  {
    id v41 = (id)[v54 packageDataUsingFiles:v55];
    memset(v39, 0, sizeof(v39));
    id v8 = v41;
    uint64_t v9 = [v8 countByEnumeratingWithState:v39 objects:v64 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)v39[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)v39[2] != v5) {
          objc_enumerationMutation(v8);
        }
        uint64_t v40 = *(void *)(v39[1] + 8 * v6);
        [v56 addObject:v40];
        [(AXPhoenixDataCollectionManager *)v61 setPackagesRemaining:[(AXPhoenixDataCollectionManager *)v61 packagesRemaining] + 1];
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [v8 countByEnumeratingWithState:v39 objects:v64 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }

    os_log_t v38 = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v37 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v63, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]", v53);
      _os_log_impl(&dword_2372C8000, v38, v37, "[PHOENIX] %s Total size of files being packaged %lu", v63, 0x16u);
    }
    objc_storeStrong((id *)&v38, 0);
    objc_storeStrong(&v41, 0);
  }
  if ([v56 count])
  {
    os_log_t v36 = (os_log_t)(id)AXLogBackTap();
    os_log_type_t v35 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v62, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]", [v56 count]);
      _os_log_impl(&dword_2372C8000, v36, v35, "[PHOENIX] %s Uploading %lu packages", v62, 0x16u);
    }
    objc_storeStrong((id *)&v36, 0);
    id v34 = @"test-phoenix-raw-carry-fp-data";
    id v3 = +[AXPhoenixBlobbyUploader sharedUploader];
    [v3 uploadPackages:v56 toBucket:v34 withCompletion:&__block_literal_global_35];

    objc_storeStrong((id *)&v34, 0);
  }
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(v60, 0);
}

void __48__AXPhoenixDataCollectionManager_uploadPackages__block_invoke(NSObject *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v2, (uint64_t)"-[AXPhoenixDataCollectionManager uploadPackages]_block_invoke");
    _os_log_impl(&dword_2372C8000, oslog[0], OS_LOG_TYPE_DEFAULT, "[PHOENIX] %s Uploaded all packages", v2, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)updateUploadStatus:(int64_t)a3 error:(id)a4
{
  uint64_t v16 = self;
  SEL v15 = a2;
  id v14 = (void *)a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  [(AXPhoenixDataCollectionManager *)v16 setPackagesRemaining:v14];
  [(AXPhoenixDataCollectionManager *)v16 setUploadErrorMessage:location];
  uint64_t v5 = [(AXPhoenixDataCollectionManager *)v16 delegate];

  if (v5)
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    uint64_t v9 = __59__AXPhoenixDataCollectionManager_updateUploadStatus_error___block_invoke;
    id v10 = &unk_264CCE588;
    uint64_t v11 = v16;
    v12[1] = v14;
    v12[0] = location;
    dispatch_async(queue, &v6);

    objc_storeStrong(v12, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

void __59__AXPhoenixDataCollectionManager_updateUploadStatus_error___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  [v2 uploadStatusChanged:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)reportFalsePositive:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)AXLogBackTap();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v10, (uint64_t)"-[AXPhoenixDataCollectionManager reportFalsePositive:]", (uint64_t)location[0]);
    _os_log_impl(&dword_2372C8000, (os_log_t)v7, v6, "[PHOENIX] %s False positive reported, moving files to FP folder: %@", v10, 0x16u);
  }
  objc_storeStrong(&v7, 0);
  id v5 = (id)[location[0] stringByAppendingString:@"_metadata.json"];
  id v4 = (id)[location[0] stringByAppendingString:@"_motion.json"];
  v9[0] = v5;
  v9[1] = v4;
  id v3 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  +[AXPhoenixDataCollectionUtils moveFiles:from:to:](AXPhoenixDataCollectionUtils, "moveFiles:from:to:");

  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (int64_t)packagesRemaining
{
  return self->_packagesRemaining;
}

- (void)setPackagesRemaining:(int64_t)a3
{
  self->_packagesRemaining = a3;
}

- (AXPhoenixDataCollectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXPhoenixDataCollectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)uploadErrorMessage
{
  return self->_uploadErrorMessage;
}

- (void)setUploadErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end