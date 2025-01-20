@interface CoreDataStack
- (_TtC7Journal13CoreDataStack)init;
- (void)contextObjectsDidChangeWithNotification:(id)a3;
- (void)contextWillSaveWithNotification:(id)a3;
- (void)dealloc;
- (void)persistentStoreRemoteChangeWithNotification:(id)a3;
@end

@implementation CoreDataStack

- (void)dealloc
{
  v2 = self;
  sub_1002985F8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal13CoreDataStack_sessionID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  sub_10001ABB8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7Journal13CoreDataStack_persistentStoreLoadedSuccessfully));

  swift_release();

  swift_errorRelease();
}

- (void)contextObjectsDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10029A41C(v4);
}

- (void)contextWillSaveWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10029B1F0(v4);
}

- (void)persistentStoreRemoteChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10029B274(v4);
}

- (_TtC7Journal13CoreDataStack)init
{
  result = (_TtC7Journal13CoreDataStack *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end