@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __45__NSUserDefaults_WebUIExtras__webui_defaults__block_invoke()
{
  webui_defaults_userDefaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.WebUI"];
  return MEMORY[0x270F9A758]();
}

@end