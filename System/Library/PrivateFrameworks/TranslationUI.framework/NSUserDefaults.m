@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __66__NSUserDefaults_TranslationSettings__translationAppGroupDefaults__block_invoke()
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.private.translation"];

  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB18]) _initWithSuiteName:@"group.com.apple.private.translation" container:v3];
  v2 = (void *)translationAppGroupDefaults_userDefaults;
  translationAppGroupDefaults_userDefaults = v1;
}

@end