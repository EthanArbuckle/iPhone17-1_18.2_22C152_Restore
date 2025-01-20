@interface TCVegaJSConsole
+ (id)arguments;
+ (void)attachToJavaScriptContext:(id)a3;
@end

@implementation TCVegaJSConsole

+ (id)arguments
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  v3 = [MEMORY[0x263F10378] currentArguments];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(__CFString **)(*((void *)&v13 + 1) + 8 * i);
        [v2 appendString:@" "];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = v2;
          v10 = v8;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [(__CFString *)v8 debugDescription];
            [v2 appendString:v11];

            continue;
          }
          v9 = v2;
          v10 = @"Unknown argument type given to console.log";
        }
        [v9 appendString:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (void)attachToJavaScriptContext:(id)a3
{
  id v7 = a3;
  id v3 = (id)[v7 evaluateScript:@"var console = {};"];
  uint64_t v4 = [v7 objectForKeyedSubscript:@"console"];
  [v4 setObject:&__block_literal_global forKeyedSubscript:@"log"];

  uint64_t v5 = [v7 objectForKeyedSubscript:@"console"];
  [v5 setObject:&__block_literal_global_21 forKeyedSubscript:@"warn"];

  uint64_t v6 = [v7 objectForKeyedSubscript:@"console"];
  [v6 setObject:&__block_literal_global_27 forKeyedSubscript:@"error"];

  [v7 setExceptionHandler:&__block_literal_global_34];
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    id v1 = +[TCVegaJSConsole arguments];
    int v2 = 136315138;
    uint64_t v3 = [v1 UTF8String];
    _os_log_impl(&dword_223D44000, v0, OS_LOG_TYPE_INFO, "JS console log: %s", (uint8_t *)&v2, 0xCu);
  }
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke_19()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    id v1 = +[TCVegaJSConsole arguments];
    int v2 = 136315138;
    uint64_t v3 = [v1 UTF8String];
    _os_log_impl(&dword_223D44000, v0, OS_LOG_TYPE_INFO, "JS console warning: %s", (uint8_t *)&v2, 0xCu);
  }
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke_25()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v0 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    id v1 = +[TCVegaJSConsole arguments];
    int v2 = 136315138;
    uint64_t v3 = [v1 UTF8String];
    _os_log_impl(&dword_223D44000, v0, OS_LOG_TYPE_INFO, "JS console error: %s", (uint8_t *)&v2, 0xCu);
  }
}

void __45__TCVegaJSConsole_attachToJavaScriptContext___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 toString];
    int v22 = 136315138;
    uint64_t v23 = [v7 UTF8String];
    _os_log_impl(&dword_223D44000, v6, OS_LOG_TYPE_INFO, "Unhandled exception: %s", (uint8_t *)&v22, 0xCu);
  }
  v8 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v4 debugDescription];
    uint64_t v10 = [v9 UTF8String];
    int v22 = 136315138;
    uint64_t v23 = v10;
    _os_log_impl(&dword_223D44000, v8, OS_LOG_TYPE_INFO, "In context: %s", (uint8_t *)&v22, 0xCu);
  }
  v11 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v5 objectForKeyedSubscript:@"line"];
    id v13 = [v12 toString];
    uint64_t v14 = [v13 UTF8String];
    long long v15 = [v5 objectForKeyedSubscript:@"column"];
    id v16 = [v15 toString];
    uint64_t v17 = [v16 UTF8String];
    int v22 = 136315394;
    uint64_t v23 = v14;
    __int16 v24 = 2080;
    uint64_t v25 = v17;
    _os_log_impl(&dword_223D44000, v11, OS_LOG_TYPE_INFO, "Line %s, column %s", (uint8_t *)&v22, 0x16u);
  }
  uint64_t v18 = +[TCVegaLogger instance];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = [v5 objectForKeyedSubscript:@"stack"];
    id v20 = [v19 toString];
    uint64_t v21 = [v20 UTF8String];
    int v22 = 136315138;
    uint64_t v23 = v21;
    _os_log_impl(&dword_223D44000, v18, OS_LOG_TYPE_INFO, "Stacktrace: %s", (uint8_t *)&v22, 0xCu);
  }
}

@end