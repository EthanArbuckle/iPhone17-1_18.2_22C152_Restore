@interface SDXPCHelperImageCache
+ (BOOL)cacheIsEmpty;
+ (CGImage)imageForKey:(id)a3 contactIDs:(id)a4;
+ (int64_t)cacheCount;
+ (void)clearCacheWithSync:(BOOL)a3;
+ (void)evictWithContactIdentifier:(id)a3;
+ (void)setImage:(CGImage *)a3 forKey:(id)a4 contactIDs:(id)a5;
- (_TtC16DaemoniOSLibrary21SDXPCHelperImageCache)init;
@end

@implementation SDXPCHelperImageCache

+ (void)clearCacheWithSync:(BOOL)a3
{
}

+ (void)evictWithContactIdentifier:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  _s16DaemoniOSLibrary21SDXPCHelperImageCacheC5evict17contactIdentifierySS_tFZ_0(v3, v4);

  swift_bridgeObjectRelease();
}

+ (void)setImage:(CGImage *)a3 forKey:(id)a4 contactIDs:(id)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = a3;
  _s16DaemoniOSLibrary21SDXPCHelperImageCacheC03setD0_6forKey10contactIDsySo10CGImageRefa_SSSaySSGtFZ_0(v10, v6, v8, v9);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (BOOL)cacheIsEmpty
{
  id v2 = [self defaultManager];
  if (qword_10096A120 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for URL();
  sub_10000B47C(v3, (uint64_t)qword_10097E1A0);
  URL.path.getter();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned __int8 v5 = [v2 fileExistsAtPath:v4];

  return v5 ^ 1;
}

+ (CGImage)imageForKey:(id)a3 contactIDs:(id)a4
{
  unint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  CGImageRef v8 = _s16DaemoniOSLibrary21SDXPCHelperImageCacheC11imageForKey_10contactIDsSo10CGImageRefaSgSS_SaySSGtFZ_0(v4, v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

+ (int64_t)cacheCount
{
  return sub_1006919D0();
}

- (_TtC16DaemoniOSLibrary21SDXPCHelperImageCache)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SDXPCHelperImageCache();
  return [(SDXPCHelperImageCache *)&v3 init];
}

@end