@interface PPSFileUtilities
+ (id)containerPath;
@end

@implementation PPSFileUtilities

+ (id)containerPath
{
  if (containerPath_onceToken != -1) {
    dispatch_once(&containerPath_onceToken, &__block_literal_global);
  }
  v2 = (void *)containerPath_containerPath;
  return v2;
}

void __33__PPSFileUtilities_containerPath__block_invoke()
{
  uint64_t v4 = 1;
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    uint64_t v2 = [NSString stringWithUTF8String:v0];
    v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;

    free(v1);
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __33__PPSFileUtilities_containerPath__block_invoke_cold_1(&v4);
  }
}

void __33__PPSFileUtilities_containerPath__block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v2 = 134217984;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_258ED8000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error fetching group container systemgroup.com.apple.powerlog : %llu", (uint8_t *)&v2, 0xCu);
}

@end