@interface MTSchemaMTTranslationTTSPlayed(LTTranslationAdditions)
+ (id)lt_initWithSourceOrTargetLanguage:()LTTranslationAdditions isAutoplayTranslation:playbackSpeed:audioChannel:;
@end

@implementation MTSchemaMTTranslationTTSPlayed(LTTranslationAdditions)

+ (id)lt_initWithSourceOrTargetLanguage:()LTTranslationAdditions isAutoplayTranslation:playbackSpeed:audioChannel:
{
  id v10 = objc_alloc_init(MEMORY[0x263F6E410]);
  v11 = v10;
  if (a3 <= 2) {
    [v10 setSourceOrTarget:a3];
  }
  [v11 setIsAutoplayTranslation:a4];
  if (a5 <= 4) {
    [v11 setPlaybackSpeed:a5];
  }
  if ((unint64_t)(a6 - 1) < 5) {
    uint64_t v12 = a6;
  }
  else {
    uint64_t v12 = 0;
  }
  [v11 setAudioChannel:v12];
  return v11;
}

@end