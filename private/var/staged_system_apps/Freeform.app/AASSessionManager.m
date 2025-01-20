@interface AASSessionManager
- (_TtC8Freeform17AASSessionManager)init;
- (void)end;
- (void)start;
@end

@implementation AASSessionManager

- (void)start
{
  v2 = self;
  sub_100635D54();
}

- (void)end
{
  v2 = self;
  swift_retain();
  SessionManager.endSync()();

  swift_release();
}

- (_TtC8Freeform17AASSessionManager)init
{
  result = (_TtC8Freeform17AASSessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end