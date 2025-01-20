@interface AXPhoenixDataLogger
- (AXPhoenixDataLogger)init;
- (OS_dispatch_queue)queue;
- (void)logClassifierData:(id)a3 isDoubleTap:(BOOL)a4 startTime:(double)a5 endTime:(double)a6 completion:(id)a7;
- (void)setQueue:(id)a3;
@end

@implementation AXPhoenixDataLogger

- (AXPhoenixDataLogger)init
{
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)AXPhoenixDataLogger;
  v9 = [(AXPhoenixDataLogger *)&v7 init];
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.accessibility.phoenix.dataLogger", attr);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v2;

    objc_storeStrong((id *)&attr, 0);
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)logClassifierData:(id)a3 isDoubleTap:(BOOL)a4 startTime:(double)a5 endTime:(double)a6 completion:(id)a7
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v22 = a4;
  v21[2] = *(id *)&a5;
  v21[1] = *(id *)&a6;
  v21[0] = 0;
  objc_storeStrong(v21, a7);
  objc_initWeak(&from, v24);
  queue = [(AXPhoenixDataLogger *)v24 queue];
  uint64_t v12 = MEMORY[0x263EF8330];
  int v13 = -1073741824;
  int v14 = 0;
  v15 = __82__AXPhoenixDataLogger_logClassifierData_isDoubleTap_startTime_endTime_completion___block_invoke;
  v16 = &unk_264CCE5D8;
  objc_copyWeak(v19, &from);
  id v17 = location[0];
  id v18 = v21[0];
  dispatch_async(queue, &v12);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(v19);
  objc_destroyWeak(&from);
  objc_storeStrong(v21, 0);
  objc_storeStrong(location, 0);
}

void __82__AXPhoenixDataLogger_logClassifierData_isDoubleTap_startTime_endTime_completion___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v38[2] = (id)a1;
  v38[1] = (id)a1;
  v38[0] = objc_loadWeakRetained((id *)(a1 + 48));
  char v37 = 0;
  id v36 = 0;
  if (v38[0])
  {
    if (([MEMORY[0x263F08900] isValidJSONObject:*(void *)(a1 + 32)] & 1) == 0)
    {
      id location = (id)AXLogBackTap();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v49, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", *(void *)(a1 + 32));
        _os_log_error_impl(&dword_2372C8000, (os_log_t)location, type, "[PHOENIX] %s Dictionary is not valid json: %@", v49, 0x16u);
      }
      objc_storeStrong(&location, 0);
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      int v33 = 1;
      goto LABEL_31;
    }
    id v32 = (id)[MEMORY[0x263EFF910] date];
    id v1 = +[AXPhoenixDataCollectionUtils createFilename:@"motion" usingTimestamp:v32 withFileExtension:@"json" underDirectory:@"/var/mobile/DTX"];
    id v2 = v36;
    id v36 = v1;

    if ([v36 length])
    {
      id v31 = (id)[objc_alloc(MEMORY[0x263EFF9E0]) initToFileAtPath:v36 append:0];
      if (v31)
      {
        [v31 open];
        if ([v31 hasSpaceAvailable])
        {
          id v28 = 0;
          id v27 = (id)[*(id *)(a1 + 32) objectForKey:@"accelerometer"];
          v46[0] = @"predictions";
          id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[0] = v14;
          v46[1] = @"result";
          id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[1] = v13;
          v46[2] = @"startTime";
          id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[2] = v12;
          v46[3] = @"endTime";
          id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[3] = v11;
          v46[4] = @"modelDescription";
          id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[4] = v10;
          v46[5] = @"modelVersion";
          id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[5] = v9;
          id v26 = (id)[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:6];

          id obj = v28;
          uint64_t v15 = [MEMORY[0x263F08900] writeJSONObject:v27 toStream:v31 options:3 error:&obj];
          objc_storeStrong(&v28, obj);
          if (v15)
          {
            os_log_t v24 = (os_log_t)(id)AXLogBackTap();
            os_log_type_t v23 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_2_8_32_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36);
              _os_log_impl(&dword_2372C8000, v24, v23, "[PHOENIX] %s Buffer written to: %@", v45, 0x16u);
            }
            objc_storeStrong((id *)&v24, 0);
            v43 = @"start_timestamp";
            id v44 = v32;
            id v22 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43);
            v3 = [AXPhoenixMetadataLogger alloc];
            v21 = [(AXPhoenixMetadataLogger *)v3 initWithMetadata:v22];
            [(AXPhoenixMetadataLogger *)v21 setMetadataFilePathUnderDirectory:@"/var/mobile/DTX"];
            v41 = @"motion";
            id v8 = (id)[v36 lastPathComponent];
            id v42 = v8;
            id v20 = (id)[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];

            [(AXPhoenixMetadataLogger *)v21 writeMetadataToFileWithSensors:v20 withAnnotations:MEMORY[0x263EFFA78] withFalsePositivesMetadata:v26];
            char v37 = 1;
            objc_storeStrong(&v20, 0);
            objc_storeStrong((id *)&v21, 0);
            objc_storeStrong(&v22, 0);
          }
          else
          {
            os_log_t v19 = (os_log_t)(id)AXLogBackTap();
            os_log_type_t v18 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v40, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36, (uint64_t)v28);
              _os_log_error_impl(&dword_2372C8000, v19, v18, "[PHOENIX] %s Error writing buffer to %@: %@", v40, 0x20u);
            }
            objc_storeStrong((id *)&v19, 0);
          }
          objc_storeStrong(&v26, 0);
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
        }
        else
        {
          os_log_t v17 = (os_log_t)(id)AXLogBackTap();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36);
            _os_log_error_impl(&dword_2372C8000, v17, OS_LOG_TYPE_ERROR, "[PHOENIX] %s No space error when writing output stream for %@", v39, 0x16u);
          }
          objc_storeStrong((id *)&v17, 0);
        }
        [v31 close];
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)AXLogBackTap();
        os_log_type_t v29 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v48, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36);
          _os_log_error_impl(&dword_2372C8000, oslog, v29, "[PHOENIX] %s Error creating stream for %@", v48, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      id v7 = (id)[v36 stringByDeletingPathExtension];
      id v6 = (id)[v7 lastPathComponent];
      id v4 = (id)[v6 stringByReplacingOccurrencesOfString:@"_motion" withString:&stru_26EA3C2C8];
      id v5 = v36;
      id v36 = v4;

      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v32, 0);
  }
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  int v33 = 0;
LABEL_31:
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v38, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end