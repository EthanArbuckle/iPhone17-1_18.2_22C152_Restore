@interface SettingsCellularSharedUtils
+ (id)createCTClientSerialQueue:(id)a3;
+ (id)sharedCTClientWorkloop;
+ (id)usageSizeString:(double)a3;
+ (void)logSpecifiers:(id)a3 origin:(id)a4;
@end

@implementation SettingsCellularSharedUtils

uint64_t __53__SettingsCellularSharedUtils_sharedCTClientWorkloop__block_invoke()
{
  _MergedGlobals_6 = (uint64_t)dispatch_workloop_create("com.apple.preferences.coretelephony_client_workloop");
  return MEMORY[0x270F9A758]();
}

+ (id)createCTClientSerialQueue:(id)a3
{
  id v4 = [NSString stringWithFormat:@"com.apple.preferences.coretelephony_client_%@_queue", a3];
  v5 = (const char *)[v4 UTF8String];
  v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v7 = [a1 sharedCTClientWorkloop];
  dispatch_queue_t v8 = dispatch_queue_create_with_target_V2(v5, v6, v7);

  return v8;
}

+ (id)sharedCTClientWorkloop
{
  if (qword_26AC328C8 != -1) {
    dispatch_once(&qword_26AC328C8, &__block_literal_global_3);
  }
  v2 = (void *)_MergedGlobals_6;
  return v2;
}

+ (void)logSpecifiers:(id)a3 origin:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = +[Logger loggerWithCategory:@"Specifiers"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2048;
    uint64_t v26 = [v5 count];
    _os_log_impl(&dword_2247E9000, v7, OS_LOG_TYPE_DEFAULT, "%@ showing %zu specifiers", buf, 0x16u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v19;
    *(void *)&long long v10 = 138412546;
    long long v17 = v10;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        v15 = +[Logger loggerWithCategory:@"Specifiers", v17, (void)v18];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [v14 name];
          *(_DWORD *)buf = v17;
          id v24 = v6;
          __int16 v25 = 2112;
          uint64_t v26 = (uint64_t)v16;
          _os_log_impl(&dword_2247E9000, v15, OS_LOG_TYPE_DEFAULT, "%@ showing specifier: %@", buf, 0x16u);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

+ (id)usageSizeString:(double)a3
{
  if (qword_26AC328D8 != -1) {
    dispatch_once(&qword_26AC328D8, &__block_literal_global_8);
  }
  id v4 = (void *)qword_26AC328D0;
  return (id)[v4 stringFromByteCount:(uint64_t)a3];
}

uint64_t __47__SettingsCellularSharedUtils_usageSizeString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F086F0]);
  v1 = (void *)qword_26AC328D0;
  qword_26AC328D0 = (uint64_t)v0;

  [(id)qword_26AC328D0 setZeroPadsFractionDigits:1];
  [(id)qword_26AC328D0 setAdaptive:0];
  v2 = (void *)qword_26AC328D0;
  return [v2 setCountStyle:3];
}

@end