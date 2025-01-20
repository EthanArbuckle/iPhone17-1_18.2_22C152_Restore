@interface FMCoreBridge
+ (id)displayNameFor:(id)a3;
- (_TtC6FindMy12FMCoreBridge)init;
@end

@implementation FMCoreBridge

+ (id)displayNameFor:(id)a3
{
  type metadata accessor for FMFCoreHelper();
  id v4 = a3;
  static FMFCoreHelper.displayName(for:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (_TtC6FindMy12FMCoreBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCoreBridge();
  return [(FMCoreBridge *)&v3 init];
}

@end