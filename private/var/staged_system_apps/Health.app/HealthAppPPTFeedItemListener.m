@interface HealthAppPPTFeedItemListener
- (_TtC6Health28HealthAppPPTFeedItemListener)init;
- (void)controllerDidChangeContent:(id)a3;
@end

@implementation HealthAppPPTFeedItemListener

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10004C264(v4);
}

- (_TtC6Health28HealthAppPPTFeedItemListener)init
{
  result = (_TtC6Health28HealthAppPPTFeedItemListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC6Health28HealthAppPPTFeedItemListener_fetchedResultsController);
}

@end