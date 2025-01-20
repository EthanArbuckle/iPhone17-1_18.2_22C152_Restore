@interface SiriTTSUserPreferences
+ (BOOL)getLogging;
+ (NSString)spokenLanguageChangedNotification;
+ (id)defaultOutputLanguageIdentifier;
+ (id)getAvailableLanguageIdentifiers;
+ (id)getSpokenLanguageIdentifier;
+ (void)setLogging:(BOOL)a3;
+ (void)setSpokenLanguageIdentifier:(id)a3;
- (SiriTTSUserPreferences)init;
@end

@implementation SiriTTSUserPreferences

- (SiriTTSUserPreferences)init
{
  return (SiriTTSUserPreferences *)sub_19CDEF8F0();
}

+ (NSString)spokenLanguageChangedNotification
{
  static UserPreferences.spokenLanguageChangedNotification.getter();
  v2 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (void)setSpokenLanguageIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_19CED5260();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  swift_getObjCClassMetadata();
  static UserPreferences.setSpokenLanguageIdentifier(_:)(v3, v5);
  swift_bridgeObjectRelease();
}

+ (id)getSpokenLanguageIdentifier
{
  return sub_19CDF0DD4((uint64_t)a1, (uint64_t)a2, (void (*)(void))static UserPreferences.getSpokenLanguageIdentifier());
}

+ (id)getAvailableLanguageIdentifiers
{
  static UserPreferences.getAvailableLanguageIdentifiers()();
  v2 = (void *)sub_19CED5630();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)defaultOutputLanguageIdentifier
{
  return sub_19CDF0DD4((uint64_t)a1, (uint64_t)a2, (void (*)(void))static UserPreferences.defaultOutputLanguageIdentifier());
}

+ (void)setLogging:(BOOL)a3
{
}

+ (BOOL)getLogging
{
  return static UserPreferences.getLogging()() & 1;
}

@end