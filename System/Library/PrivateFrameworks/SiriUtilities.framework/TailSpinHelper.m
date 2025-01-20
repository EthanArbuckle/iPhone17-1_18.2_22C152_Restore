@interface TailSpinHelper
+ (BOOL)isValidToCreateTailSpin:(id)a3;
+ (BOOL)isValidToDeleteTailSpinDir:(id)a3;
+ (id)getLastSuccessfulTailSpinDate:(id)a3;
+ (id)getLogger;
+ (id)getTailSpinDir:(id)a3;
+ (void)setSuccessfulTailSpinDate:(id)a3 date:(id)a4;
- (void)clearDirectory:(id)a3 queue:(id)a4;
- (void)dumpTailSpinOutputToFile:(id)a3 suiteName:(id)a4 options:(id)a5 queue:(id)a6 handler:(id)a7;
@end

@implementation TailSpinHelper

+ (id)getLogger
{
  if (getLogger_onceToken != -1) {
    dispatch_once(&getLogger_onceToken, &__block_literal_global);
  }
  v2 = (void *)getLogger__logger;

  return v2;
}

uint64_t __27__TailSpinHelper_getLogger__block_invoke()
{
  getLogger__logger = (uint64_t)os_log_create("com.apple.siri.sirikit", "TailSpinHelper");

  return MEMORY[0x1F41817F8]();
}

+ (id)getLastSuccessfulTailSpinDate:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithSuiteName:v4];

  v6 = [v5 objectForKey:@"siri_tailspin"];

  return v6;
}

+ (void)setSuccessfulTailSpinDate:(id)a3 date:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)[[v5 alloc] initWithSuiteName:v7];

  [v8 setObject:v6 forKey:@"siri_tailspin"];
}

+ (BOOL)isValidToCreateTailSpin:(id)a3
{
  v3 = +[TailSpinHelper getLastSuccessfulTailSpinDate:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    BOOL v7 = v6 >= 120.0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

+ (BOOL)isValidToDeleteTailSpinDir:(id)a3
{
  v3 = +[TailSpinHelper getLastSuccessfulTailSpinDate:a3];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    double v6 = v5;

    BOOL v7 = v6 >= 172800.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)getTailSpinDir:(id)a3
{
  v3 = [NSString stringWithFormat:@"/tailspins/siri/%@/", a3];
  id v4 = NSTemporaryDirectory();
  double v5 = [v4 stringByAppendingPathComponent:v3];

  return v5;
}

- (void)dumpTailSpinOutputToFile:(id)a3 suiteName:(id)a4 options:(id)a5 queue:(id)a6 handler:(id)a7
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  queue = a6;
  id v14 = a7;
  v15 = +[TailSpinHelper getTailSpinDir:v12];
  v16 = [MEMORY[0x1E4F1C9C8] date];
  id v17 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v17 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
  v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v38 = *MEMORY[0x1E4F28330];
  v39[0] = &unk_1F242D9E0;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  id v37 = 0;
  [v18 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:v19 error:&v37];
  id v20 = v37;

  if (v20)
  {
    v21 = queue;
    v22 = +[TailSpinHelper getLogger];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[TailSpinHelper dumpTailSpinOutputToFile:suiteName:options:queue:handler:]((uint64_t)v15, v22);
    }

    if (v14) {
      (*((void (**)(id, void, void))v14 + 2))(v14, 0, 0);
    }
  }
  else
  {
    uint64_t v30 = [v11 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

    v23 = NSString;
    [v17 stringFromDate:v16];
    v25 = v24 = v14;
    v29 = [v23 stringWithFormat:@"SiriUtils_%@_%@.tailspin", v30, v25];

    v26 = [v15 stringByAppendingPathComponent:v29];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke;
    block[3] = &unk_1E65A4BE0;
    id v33 = v12;
    id v34 = v26;
    v27 = v24;
    id v36 = v24;
    id v35 = v13;
    id v28 = v26;
    dispatch_async(queue, block);

    id v11 = (id)v30;
    v21 = queue;
    id v14 = v27;
  }
}

uint64_t __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TailSpinHelper isValidToCreateTailSpin:*(void *)(a1 + 32)];
  v3 = +[TailSpinHelper getLogger];
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v5;
      _os_log_impl(&dword_1C9E4C000, v4, OS_LOG_TYPE_INFO, "TailSpinHelper#dumpTailSpinOutputToFile dir: %@", buf, 0xCu);
    }

    int v6 = open((const char *)[*(id *)(a1 + 40) cStringUsingEncoding:1], 514, 484);
    if (tailspin_dump_output_with_options_sync())
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [MEMORY[0x1E4F1C9C8] date];
      +[TailSpinHelper setSuccessfulTailSpinDate:v7 date:v8];
    }
    close(v6);
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      v10 = *(uint64_t (**)(void))(result + 16);
      return v10();
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke_cold_1(a1, v4);
    }

    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      v10 = *(uint64_t (**)(void))(result + 16);
      return v10();
    }
  }
  return result;
}

- (void)clearDirectory:(id)a3 queue:(id)a4
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__TailSpinHelper_clearDirectory_queue___block_invoke;
  block[3] = &unk_1E65A4C08;
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)a4, block);
}

void __39__TailSpinHelper_clearDirectory_queue___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[TailSpinHelper getTailSpinDir:*(void *)(a1 + 32)];
  if (+[TailSpinHelper isValidToDeleteTailSpinDir:*(void *)(a1 + 32)])
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v4 = [v3 removeItemAtPath:v2 error:0];

    id v5 = +[TailSpinHelper getLogger];
    id v6 = v5;
    if (v4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v2;
        _os_log_impl(&dword_1C9E4C000, v6, OS_LOG_TYPE_INFO, "TailSpinHelper#clearDirectory cleaned up directory: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_1((uint64_t)v2, v6);
    }
  }
  else
  {
    id v6 = +[TailSpinHelper getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_2((uint64_t)v2, v6);
    }
  }
}

- (void)dumpTailSpinOutputToFile:(uint64_t)a1 suiteName:(NSObject *)a2 options:queue:handler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C9E4C000, a2, OS_LOG_TYPE_ERROR, "TailSpinHelper#dumpTailSpinOutputToFile unable to create directory %@", (uint8_t *)&v2, 0xCu);
}

void __75__TailSpinHelper_dumpTailSpinOutputToFile_suiteName_options_queue_handler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = 67109378;
  v3[1] = 120;
  __int16 v4 = 2112;
  uint64_t v5 = v2;
  _os_log_error_impl(&dword_1C9E4C000, a2, OS_LOG_TYPE_ERROR, "TailSpinHelper#dumpTailSpinOutputToFile enforcing minimum time interval (%d s) between tailspins, not creating new file: %@", (uint8_t *)v3, 0x12u);
}

void __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C9E4C000, a2, OS_LOG_TYPE_ERROR, "TailSpinHelper#clearDirectory failed to clean up directory: %@", (uint8_t *)&v2, 0xCu);
}

void __39__TailSpinHelper_clearDirectory_queue___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109378;
  v2[1] = 172800;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_1C9E4C000, a2, OS_LOG_TYPE_ERROR, "TailSpinHelper#clearDirectory enforcing minimum time interval (%d s) for deleting directory %@", (uint8_t *)v2, 0x12u);
}

@end