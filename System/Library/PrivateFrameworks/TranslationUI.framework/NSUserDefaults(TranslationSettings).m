@interface NSUserDefaults(TranslationSettings)
+ (id)translationAppGroupDefaults;
@end

@implementation NSUserDefaults(TranslationSettings)

+ (id)translationAppGroupDefaults
{
  if (translationAppGroupDefaults_onceToken[0] != -1) {
    dispatch_once(translationAppGroupDefaults_onceToken, &__block_literal_global);
  }
  v0 = (void *)translationAppGroupDefaults_userDefaults;
  return v0;
}

@end