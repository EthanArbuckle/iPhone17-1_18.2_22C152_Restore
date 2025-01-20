@interface MBDryRestoreCommand
+ (id)dryRestoreWithAllowance:(double)a3 snapshotUUID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7;
- (_TtC7backupd19MBDryRestoreCommand)init;
@end

@implementation MBDryRestoreCommand

+ (id)dryRestoreWithAllowance:(double)a3 snapshotUUID:(id)a4 account:(id)a5 connection:(id)a6 error:(id *)a7
{
  if (a4) {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = a5;
  id v11 = a6;
  sub_10004A9AC(v9);

  swift_bridgeObjectRelease();
  v12.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v12.super.isa;
}

- (_TtC7backupd19MBDryRestoreCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MBDryRestoreCommand *)&v3 init];
}

@end