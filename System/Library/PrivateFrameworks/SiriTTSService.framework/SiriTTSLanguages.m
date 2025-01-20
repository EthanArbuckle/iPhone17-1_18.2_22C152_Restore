@interface SiriTTSLanguages
+ (NSSet)availableLanguages;
+ (id)fallbackLanguageFor:(id)a3;
- (SiriTTSLanguages)init;
@end

@implementation SiriTTSLanguages

+ (NSSet)availableLanguages
{
  static Languages.availableLanguages.getter();
  v2 = (void *)sub_19CED5630();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

+ (id)fallbackLanguageFor:(id)a3
{
  uint64_t v3 = sub_19CED5260();
  static Languages.fallbackLanguage(for:)(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return v5;
}

- (SiriTTSLanguages)init
{
  return (SiriTTSLanguages *)Languages.init()();
}

@end