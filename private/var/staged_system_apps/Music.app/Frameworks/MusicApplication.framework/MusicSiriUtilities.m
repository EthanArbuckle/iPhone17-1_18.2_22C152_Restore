@interface MusicSiriUtilities
+ (NSString)preferredTriggerPhrase;
@end

@implementation MusicSiriUtilities

+ (NSString)preferredTriggerPhrase
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)getAFPreferencesClass_softClass;
  uint64_t v20 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = __getAFPreferencesClass_block_invoke;
    v15 = &unk_D13C20;
    v16 = &v17;
    __getAFPreferencesClass_block_invoke((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  v4 = [v3 sharedPreferences];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v5 = (void *)getVTPreferencesClass_softClass;
  uint64_t v20 = getVTPreferencesClass_softClass;
  if (!getVTPreferencesClass_softClass)
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = __getVTPreferencesClass_block_invoke;
    v15 = &unk_D13C20;
    v16 = &v17;
    __getVTPreferencesClass_block_invoke((uint64_t)&v12);
    v5 = (void *)v18[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v17, 8);
  v7 = [v6 sharedPreferences];
  v8 = [v4 languageCode];
  v9 = [v7 localizedTriggerPhraseForLanguageCode:v8];
  id v10 = [v9 copy];

  return (NSString *)v10;
}

@end