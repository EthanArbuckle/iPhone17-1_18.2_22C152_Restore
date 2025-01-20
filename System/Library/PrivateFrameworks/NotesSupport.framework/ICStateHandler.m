@interface ICStateHandler
+ (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4;
+ (void)addStateHandlerWithName:(const char *)a3 sysdiagnoseOnly:(BOOL)a4 stateBlock:(id)a5;
@end

@implementation ICStateHandler

+ (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4
{
}

+ (void)addStateHandlerWithName:(const char *)a3 sysdiagnoseOnly:(BOOL)a4 stateBlock:(id)a5
{
  id v6 = a5;
  v7 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[ICStateHandler addStateHandlerWithName:sysdiagnoseOnly:stateBlock:]((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);
  }

  v14 = dispatch_get_global_queue(0, 0);
  id v15 = v6;
  os_state_add_handler();
}

_DWORD *__69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3)
  {
    id v6 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_4();
    }
    uint64_t v9 = 0;
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_3();
    }

    v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v12 = 0;
    v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:&v12];
    id v6 = v12;
    if (v6)
    {
      v7 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_2();
      }
    }
    if ((unint64_t)[v5 length] >> 32)
    {
      uint64_t v10 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_1();
      }

      uint64_t v9 = 0;
    }
    else
    {
      unsigned int v8 = [v5 length];
      uint64_t v9 = malloc_type_calloc(1uLL, v8 + 200, 0x7EC54BF5uLL);
      *uint64_t v9 = 1;
      v9[1] = v8;
      __strlcpy_chk();
      memcpy(v9 + 50, (const void *)[v5 bytes], v8);
    }
  }
  return v9;
}

+ (void)addStateHandlerWithName:(uint64_t)a3 sysdiagnoseOnly:(uint64_t)a4 stateBlock:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_20C263000, v0, OS_LOG_TYPE_ERROR, "Error serializing state data for \"%s\": data size greater than UINT32_MAX", v1, 0xCu);
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_20C263000, v1, OS_LOG_TYPE_ERROR, "Error serializing state data for \"%s\": %@", v2, 0x16u);
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Processing os_state handler: %s", v2, v3, v4, v5, v6);
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_2_1(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_20C263000, v0, v1, "Skipped os_state handler: %s", v2, v3, v4, v5, v6);
}

@end