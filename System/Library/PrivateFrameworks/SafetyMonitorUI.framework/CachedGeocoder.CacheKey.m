@interface CachedGeocoder.CacheKey
- (BOOL)isEqual:(id)a3;
- (_TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey)init;
- (int64_t)hash;
@end

@implementation CachedGeocoder.CacheKey

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = CachedGeocoder.CacheKey.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_25B900408();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = CachedGeocoder.CacheKey.isEqual(_:)((uint64_t)v8);

  sub_25B79070C((uint64_t)v8, &qword_26A510DF0);
  return v6;
}

- (_TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey)init
{
  result = (_TtCC15SafetyMonitorUI14CachedGeocoder8CacheKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end