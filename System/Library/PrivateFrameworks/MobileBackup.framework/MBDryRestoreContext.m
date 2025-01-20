@interface MBDryRestoreContext
- (BOOL)shouldCancelVerification;
- (_TtC7backupd19MBDryRestoreContext)init;
- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5;
- (unint64_t)enginePolicy;
@end

@implementation MBDryRestoreContext

- (_TtC7backupd19MBDryRestoreContext)init
{
  result = (_TtC7backupd19MBDryRestoreContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
}

- (unint64_t)enginePolicy
{
  return 25;
}

- (BOOL)shouldCancelVerification
{
  return 0;
}

- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5
{
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  if (a4)
  {
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v13 = a5;
  v14 = self;
  id v15 = sub_100016D4C(v8, v10, v11, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

@end