@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __65__NSUserDefaults_TranslationDaemonAdditions__lt_appGroupDefaults__block_invoke()
{
  v0 = [MEMORY[0x263F08850] defaultManager];
  id v3 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.private.translation"];

  uint64_t v1 = [objc_alloc(MEMORY[0x263EFFA40]) _initWithSuiteName:@"group.com.apple.private.translation" container:v3];
  v2 = (void *)lt_appGroupDefaults_appGroupDefaults;
  lt_appGroupDefaults_appGroupDefaults = v1;
}

@end