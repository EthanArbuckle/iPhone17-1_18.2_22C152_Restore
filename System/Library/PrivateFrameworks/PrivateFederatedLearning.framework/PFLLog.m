@interface PFLLog
@end

@implementation PFLLog

uint64_t __20___PFLLog_framework__block_invoke()
{
  framework__framework = (uint64_t)os_log_create("com.apple.PrivateFederatedLearning", "Framework");
  return MEMORY[0x270F9A758]();
}

uint64_t __20___PFLLog_telemetry__block_invoke()
{
  telemetry_telemetry = (uint64_t)os_log_create("com.apple.PrivateFederatedLearning", "Telemetry");
  return MEMORY[0x270F9A758]();
}

uint64_t __20___PFLLog_extension__block_invoke()
{
  extension__extension = (uint64_t)os_log_create("com.apple.PrivateFederatedLearning", "MLRuntimePlugin");
  return MEMORY[0x270F9A758]();
}

@end