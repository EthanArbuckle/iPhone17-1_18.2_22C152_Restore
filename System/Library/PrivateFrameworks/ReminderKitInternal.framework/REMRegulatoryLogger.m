@interface REMRegulatoryLogger
+ (id)sharedLogger;
+ (int64_t)attachmentTypeFromUTType:(id)a3;
+ (void)attachmentAddedForType:(int64_t)a3;
+ (void)attachmentAddedForUTType:(id)a3;
- (REMRegulatoryLogger)init;
- (ct_green_tea_logger_s)greenTeaLogger;
- (uint64_t)init;
- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3;
@end

@implementation REMRegulatoryLogger

- (REMRegulatoryLogger)init
{
  v9.receiver = self;
  v9.super_class = (Class)REMRegulatoryLogger;
  v2 = [(REMRegulatoryLogger *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [(id)*MEMORY[0x1E4F94D68] cStringUsingEncoding:1];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    v4 = (uint64_t (*)(uint64_t))getct_green_tea_logger_createSymbolLoc_ptr;
    v18 = getct_green_tea_logger_createSymbolLoc_ptr;
    if (!getct_green_tea_logger_createSymbolLoc_ptr)
    {
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __getct_green_tea_logger_createSymbolLoc_block_invoke;
      v13 = &unk_1E5CC8D48;
      v14 = &v15;
      v5 = (void *)libCTGreenTeaLoggerLibrary();
      v6 = dlsym(v5, "ct_green_tea_logger_create");
      *(void *)(v14[1] + 24) = v6;
      getct_green_tea_logger_createSymbolLoc_ptr = *(_UNKNOWN **)(v14[1] + 24);
      v4 = (uint64_t (*)(uint64_t))v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (!v4)
    {
      v8 = (_Unwind_Exception *)-[REMRegulatoryLogger init]();
      _Block_object_dispose(&v15, 8);
      _Unwind_Resume(v8);
    }
    v2->_greenTeaLogger = (ct_green_tea_logger_s *)v4(v3);
  }
  return v2;
}

+ (id)sharedLogger
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__REMRegulatoryLogger_sharedLogger__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, block);
  }
  v2 = (void *)sharedLogger_logger;

  return v2;
}

uint64_t __35__REMRegulatoryLogger_sharedLogger__block_invoke()
{
  sharedLogger_logger = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

+ (int64_t)attachmentTypeFromUTType:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToType:*MEMORY[0x1E4F44400]])
  {
    int64_t v4 = 3;
  }
  else if ([v3 conformsToType:*MEMORY[0x1E4F44330]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 conformsToType:*MEMORY[0x1E4F44448]])
  {
    int64_t v4 = 2;
  }
  else if ([v3 conformsToType:*MEMORY[0x1E4F44520]])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (void)attachmentAddedForUTType:(id)a3
{
  uint64_t v4 = [a1 attachmentTypeFromUTType:a3];

  [a1 attachmentAddedForType:v4];
}

+ (void)attachmentAddedForType:(int64_t)a3
{
  uint64_t v4 = [a1 sharedLogger];
  uint64_t v5 = [v4 greenTeaLogger];

  switch(a3)
  {
    case 0:
      v6 = [MEMORY[0x1E4F94B98] utility];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        +[REMRegulatoryLogger attachmentAddedForType:].cold.4();
      }
      goto LABEL_20;
    case 1:
      v7 = [MEMORY[0x1E4F94B98] utility];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        +[REMRegulatoryLogger attachmentAddedForType:]();
      }

      v8 = soft_getCTGreenTeaOsLogHandle(v5);
      v6 = v8;
      if (!v8 || !os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      __int16 v17 = 0;
      objc_super v9 = "Reading audio data";
      uint64_t v10 = (uint8_t *)&v17;
      break;
    case 2:
      uint64_t v11 = [MEMORY[0x1E4F94B98] utility];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        +[REMRegulatoryLogger attachmentAddedForType:]();
      }

      v12 = soft_getCTGreenTeaOsLogHandle(v5);
      v6 = v12;
      if (!v12 || !os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      __int16 v16 = 0;
      objc_super v9 = "Reading video data";
      uint64_t v10 = (uint8_t *)&v16;
      break;
    case 3:
      v13 = [MEMORY[0x1E4F94B98] utility];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[REMRegulatoryLogger attachmentAddedForType:]();
      }

      v14 = soft_getCTGreenTeaOsLogHandle(v5);
      v6 = v14;
      if (!v14 || !os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      __int16 v15 = 0;
      objc_super v9 = "Reading image/photo data";
      uint64_t v10 = (uint8_t *)&v15;
      break;
    default:
      return;
  }
  _os_log_impl(&dword_1A72A1000, v6, OS_LOG_TYPE_INFO, v9, v10, 2u);
LABEL_20:
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (uint64_t)init
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[REMRegulatoryLogger attachmentAddedForType:](v0);
}

+ (void)attachmentAddedForType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A72A1000, v0, v1, "%{public}@: Reading audio data", v2, v3, v4, v5, v6);
}

+ (void)attachmentAddedForType:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A72A1000, v0, v1, "%{public}@: Reading video data", v2, v3, v4, v5, v6);
}

+ (void)attachmentAddedForType:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A72A1000, v0, v1, "%{public}@: Reading image/photo data", v2, v3, v4, v5, v6);
}

+ (void)attachmentAddedForType:.cold.4()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2048;
  uint64_t v3 = 0;
  _os_log_debug_impl(&dword_1A72A1000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Reading other data {type: %ld}", v1, 0x16u);
}

@end