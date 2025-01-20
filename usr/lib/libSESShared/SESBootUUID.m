@interface SESBootUUID
+ (BOOL)isFirstLaunchAfterBootForKey:(id)a3;
+ (id)getInstance;
+ (void)setFirstLaunchAfterBootDoneForKey:(id)a3;
@end

@implementation SESBootUUID

+ (id)getInstance
{
  if (getInstance_onceToken_0 != -1) {
    dispatch_once(&getInstance_onceToken_0, &__block_literal_global_2);
  }
  v2 = (void *)getInstance_instance_0;

  return v2;
}

void __26__SESBootUUID_getInstance__block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)getInstance_instance_0;
  getInstance_instance_0 = v0;

  memset(v5, 0, sizeof(v5));
  size_t v4 = 37;
  int v2 = sysctlbyname("kern.bootsessionuuid", v5, &v4, 0, 0);
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSString stringWithUTF8String:v5];
  }
  objc_storeStrong((id *)(getInstance_instance_0 + 8), v3);
  if (!v2) {
}
  }

+ (BOOL)isFirstLaunchAfterBootForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  size_t v4 = +[SESBootUUID getInstance];
  objc_sync_enter(v4);
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced"];
  uint64_t v6 = [v5 valueForKey:v3];
  v7 = v6;
  if (v4[1]) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    int v9 = 0;
  }
  else {
    int v9 = [v6 isEqualToString:];
  }
  v10 = SESDefaultLogObject();
  int v11 = v9 ^ 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412546;
    id v14 = v3;
    __int16 v15 = 1024;
    int v16 = v11;
    _os_log_impl(&dword_263826000, v10, OS_LOG_TYPE_INFO, "First launch after boot for %@ %d", (uint8_t *)&v13, 0x12u);
  }

  objc_sync_exit(v4);
  return v11;
}

+ (void)setFirstLaunchAfterBootDoneForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  size_t v4 = +[SESBootUUID getInstance];
  objc_sync_enter(v4);
  v5 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.seserviced"];
  [v5 setObject:v4[1] forKey:v3];
  uint64_t v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_263826000, v6, OS_LOG_TYPE_INFO, "First launch after boot complete for %@", (uint8_t *)&v7, 0xCu);
  }

  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end