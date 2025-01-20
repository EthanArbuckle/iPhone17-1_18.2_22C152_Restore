@interface FMContactsUtilities
+ (id)contactFor:(id)a3;
- (_TtC6FindMy19FMContactsUtilities)init;
@end

@implementation FMContactsUtilities

+ (id)contactFor:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = v4;
  swift_getObjCClassMetadata();
  id v6 = sub_100475AC0(v3, v5, 0, 0, 0, 0, 0);
  LODWORD(v3) = v7;
  swift_bridgeObjectRelease();
  if ((v3 & 0x10000) != 0)
  {

    id v6 = 0;
  }

  return v6;
}

- (_TtC6FindMy19FMContactsUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMContactsUtilities();
  return [(FMContactsUtilities *)&v3 init];
}

@end