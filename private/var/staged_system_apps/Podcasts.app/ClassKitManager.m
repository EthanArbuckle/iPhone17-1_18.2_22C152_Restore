@interface ClassKitManager
- (_TtC8Podcasts15ClassKitManager)init;
- (void)applicationWillTerminate:(id)a3;
@end

@implementation ClassKitManager

- (void)applicationWillTerminate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10038E288();
}

- (_TtC8Podcasts15ClassKitManager)init
{
  result = (_TtC8Podcasts15ClassKitManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts15ClassKitManager_migrationQueue);
}

@end