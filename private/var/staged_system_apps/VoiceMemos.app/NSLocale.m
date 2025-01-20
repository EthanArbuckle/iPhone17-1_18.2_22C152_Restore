@interface NSLocale
+ (id)numberingSystem;
@end

@implementation NSLocale

+ (id)numberingSystem
{
  uint64_t v2 = type metadata accessor for Locale();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale.autoupdatingCurrent.getter();
  uint64_t v6 = type metadata accessor for Locale.NumberingSystem();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Locale.numberingSystem.getter();
  Locale.NumberingSystem.identifier.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v10;
}

@end