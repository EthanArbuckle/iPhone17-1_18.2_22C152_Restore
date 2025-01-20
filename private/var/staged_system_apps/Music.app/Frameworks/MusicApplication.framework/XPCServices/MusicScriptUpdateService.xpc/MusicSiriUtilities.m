@interface MusicSiriUtilities
+ (NSString)preferredTriggerPhrase;
@end

@implementation MusicSiriUtilities

+ (NSString)preferredTriggerPhrase
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)qword_10059EFF0;
  uint64_t v20 = qword_10059EFF0;
  if (!qword_10059EFF0)
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1002D528C;
    v15 = &unk_10053E9D8;
    v16 = &v17;
    sub_1002D528C((uint64_t)&v12);
    v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  v4 = [v3 sharedPreferences];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v5 = (void *)qword_10059F000;
  uint64_t v20 = qword_10059F000;
  if (!qword_10059F000)
  {
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    v14 = sub_1002D542C;
    v15 = &unk_10053E9D8;
    v16 = &v17;
    sub_1002D542C((uint64_t)&v12);
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