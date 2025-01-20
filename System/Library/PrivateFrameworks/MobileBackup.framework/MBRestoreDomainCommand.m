@interface MBRestoreDomainCommand
+ (BOOL)restoreWithDomain:(id)a3 rootPath:(id)a4 snapshotUUID:(id)a5 deviceUUID:(id)a6 account:(id)a7 connection:(id)a8 error:(id *)a9;
- (_TtC7backupd22MBRestoreDomainCommand)init;
@end

@implementation MBRestoreDomainCommand

+ (BOOL)restoreWithDomain:(id)a3 rootPath:(id)a4 snapshotUUID:(id)a5 deviceUUID:(id)a6 account:(id)a7 connection:(id)a8 error:(id *)a9
{
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;
  id v23 = a7;
  v24 = (Swift::String *)a8;
  sub_10004E54C(v11, v13, v14, v16, v17, v19, v20, v22, v23, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (_TtC7backupd22MBRestoreDomainCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MBRestoreDomainCommand *)&v3 init];
}

@end