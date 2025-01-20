@interface RavioliConstants
+ (NSUUID)ravioliUUID;
- (_TtC3asd16RavioliConstants)init;
@end

@implementation RavioliConstants

+ (NSUUID)ravioliUUID
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static RavioliConstants.ravioliUUID.getter((uint64_t)v5);
  v6.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);

  return (NSUUID *)v6.super.isa;
}

- (_TtC3asd16RavioliConstants)init
{
  return (_TtC3asd16RavioliConstants *)ASBackgroundActivityManager.init()();
}

@end