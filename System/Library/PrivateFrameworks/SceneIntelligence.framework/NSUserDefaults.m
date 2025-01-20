@interface NSUserDefaults
@end

@implementation NSUserDefaults

uint64_t __56__NSUserDefaults_SIAppleGlobalDomain__appleGlobalDomain__block_invoke()
{
  appleGlobalDomain_defaults = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"Apple Global Domain"];
  return MEMORY[0x270F9A758]();
}

uint64_t __62__NSUserDefaults_SIAppleGlobalDomain__appleGlobalDomainSIKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"com.apple.sceneintelligence."]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 hasPrefix:@"com_apple_sceneintelligence_"];
  }

  return v3;
}

@end