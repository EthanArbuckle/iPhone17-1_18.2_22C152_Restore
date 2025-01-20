@interface Logger
+ (id)loggerWithCategory:(id)a3;
+ (id)loggerWithCategory:(id)a3 instance:(id)a4;
@end

@implementation Logger

+ (id)loggerWithCategory:(id)a3
{
  return +[Logger loggerWithCategory:a3 instance:0];
}

+ (id)loggerWithCategory:(id)a3 instance:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_26AC328F8 != -1) {
    dispatch_once(&qword_26AC328F8, &__block_literal_global_5);
  }
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    v8 = [NSString stringWithFormat:@"%@.%@", v7, v6];
  }
  id v9 = (id)_MergedGlobals_8;
  objc_sync_enter(v9);
  v10 = [(id)_MergedGlobals_8 objectForKey:v8];
  if (!v10)
  {
    v11 = (const char *)kCellularSettingsLogSubsystem;
    id v12 = v8;
    v10 = os_log_create(v11, (const char *)[v12 UTF8String]);
    [(id)_MergedGlobals_8 setObject:v10 forKey:v12];
  }
  objc_sync_exit(v9);

  return v10;
}

uint64_t __38__Logger_loggerWithCategory_instance___block_invoke()
{
  _MergedGlobals_8 = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

@end