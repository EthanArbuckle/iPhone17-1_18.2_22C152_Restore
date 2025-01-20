@interface WCRLogging
+ (void)log:(id)a3 withType:(unint64_t)a4;
@end

@implementation WCRLogging

+ (void)log:(id)a3 withType:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (log_withType__onceToken != -1) {
    dispatch_once(&log_withType__onceToken, &__block_literal_global_1);
  }
  switch(a4)
  {
    case 1uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_ERROR)) {
        +[WCRLogging log:withType:]();
      }
      break;
    case 2uLL:
      uint64_t v9 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        id v11 = v5;
        v7 = v9;
        os_log_type_t v8 = OS_LOG_TYPE_INFO;
        goto LABEL_10;
      }
      break;
    case 3uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEBUG)) {
        +[WCRLogging log:withType:]();
      }
      break;
    case 4uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_FAULT)) {
        +[WCRLogging log:withType:].cold.4();
      }
      break;
    case 5uLL:
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEBUG)) {
        +[WCRLogging log:withType:]();
      }
      break;
    default:
      uint64_t v6 = osLogHandle;
      if (os_log_type_enabled((os_log_t)osLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v5;
        v7 = v6;
        os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
        _os_log_impl(&dword_2617A2000, v7, v8, "%{public}@", (uint8_t *)&v10, 0xCu);
      }
      break;
  }
}

uint64_t __27__WCRLogging_log_withType___block_invoke()
{
  osLogHandle = (uint64_t)os_log_create("com.apple.webcontentrestrictions", "WebContentRestrictions");
  return MEMORY[0x270F9A758]();
}

+ (void)log:withType:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2617A2000, v0, OS_LOG_TYPE_ERROR, "%{public}@", v1, 0xCu);
}

+ (void)log:withType:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2617A2000, v0, OS_LOG_TYPE_DEBUG, "%{public}@", v1, 0xCu);
}

+ (void)log:withType:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2617A2000, v0, OS_LOG_TYPE_DEBUG, "%{private}@", v1, 0xCu);
}

+ (void)log:withType:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_2617A2000, v0, OS_LOG_TYPE_FAULT, "%{public}@", v1, 0xCu);
}

@end