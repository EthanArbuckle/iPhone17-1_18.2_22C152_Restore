@interface RBExtensionDataProvider
- (BOOL)configureLaunchContext:(id)a3 error:(id *)a4;
@end

@implementation RBExtensionDataProvider

- (BOOL)configureLaunchContext:(id)a3 error:(id *)a4
{
  if (MEMORY[0x263F04E20]) {
    return _EXConfigureLaunchContext();
  }
  v4 = rbs_process_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_226AB3000, v4, OS_LOG_TYPE_INFO, "Extension launch request made on platform that doesn't support ExtensionKit. Skipping extension launch by host check.", v6, 2u);
  }

  return 0;
}

@end