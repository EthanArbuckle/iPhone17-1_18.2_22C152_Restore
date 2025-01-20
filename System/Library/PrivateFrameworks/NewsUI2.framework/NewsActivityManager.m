@interface NewsActivityManager
- (_TtC7NewsUI219NewsActivityManager)init;
- (void)clearAllSavedUserActivities;
- (void)deregisterActivityWithData:(id)a3;
- (void)registerCurrentActivityWithData:(id)a3;
@end

@implementation NewsActivityManager

- (void)registerCurrentActivityWithData:(id)a3
{
  id v4 = a3;
  v5 = self;
  NewsActivityManager.registerCurrentActivity(with:)((uint64_t)v4);
}

- (void)deregisterActivityWithData:(id)a3
{
  id v4 = a3;
  v5 = self;
  NewsActivityManager.deregisterActivity(with:)((uint64_t)v4);
}

- (void)clearAllSavedUserActivities
{
  v2 = self;
  swift_retain();
  sub_1DFDF23A0();

  swift_release();
}

- (_TtC7NewsUI219NewsActivityManager)init
{
  result = (_TtC7NewsUI219NewsActivityManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end