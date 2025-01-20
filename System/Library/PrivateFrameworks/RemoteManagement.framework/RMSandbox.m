@interface RMSandbox
+ (BOOL)configureSandbox;
+ (id)tokenForURL:(id)a3;
+ (int64_t)consumeToken:(id)a3;
+ (void)configureSandbox;
+ (void)releaseToken:(int64_t)a3;
@end

@implementation RMSandbox

+ (BOOL)configureSandbox
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v2 bundleIdentifier];
  uint64_t v4 = [v3 UTF8String];

  if (v4)
  {
    if (_set_user_dir_suffix()) {
      return 1;
    }
    v6 = +[RMLog sandbox];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[RMSandbox configureSandbox](v6);
    }
  }
  else
  {
    v6 = +[RMLog sandbox];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[RMSandbox configureSandbox](v6);
    }
  }

  return 0;
}

+ (id)tokenForURL:(id)a3
{
  [a3 fileSystemRepresentation];
  uint64_t v3 = sandbox_extension_issue_file();
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    v5 = [NSString stringWithUTF8String:v3];
    free(v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)consumeToken:(id)a3
{
  uint64_t v3 = [a3 UTF8String];

  return MEMORY[0x270EDB2B8](v3);
}

+ (void)releaseToken:(int64_t)a3
{
}

+ (void)configureSandbox
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_224784000, a1, OS_LOG_TYPE_FAULT, "Failed to initialize sandbox: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

@end