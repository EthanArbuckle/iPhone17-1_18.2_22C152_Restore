@interface CSDSpeechAssetManager
- (CSDSpeechAssetManager)init;
- (CSDSpeechAssetManager)initWithQueue:(id)a3;
- (void)handleCurrentLocaleDidChange;
@end

@implementation CSDSpeechAssetManager

- (CSDSpeechAssetManager)initWithQueue:(id)a3
{
  return (CSDSpeechAssetManager *)sub_100277480(a3);
}

- (void)handleCurrentLocaleDidChange
{
  v2 = self;
  sub_100278DEC();
}

- (CSDSpeechAssetManager)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CSDSpeechAssetManager_languageManager;
  uint64_t v4 = type metadata accessor for LanguageManager();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___CSDSpeechAssetManager____lazy_storage___downloadSpeechAssetPath);

  sub_100208490(v5);
}

@end