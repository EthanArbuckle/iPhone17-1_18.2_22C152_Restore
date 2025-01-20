@interface SECBackgroundAssertion
- (_TtC10seserviced22SECBackgroundAssertion)init;
- (void)dealloc;
- (void)didAppEnterBackground:(id)a3;
- (void)didAppEnterForeground:(id)a3;
- (void)didAppGetSuspended:(id)a3;
@end

@implementation SECBackgroundAssertion

- (void)dealloc
{
  v2 = self;
  sub_1001A8B44();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced22SECBackgroundAssertion_queue);
}

- (void)didAppGetSuspended:(id)a3
{
}

- (void)didAppEnterBackground:(id)a3
{
}

- (void)didAppEnterForeground:(id)a3
{
}

- (_TtC10seserviced22SECBackgroundAssertion)init
{
  return (_TtC10seserviced22SECBackgroundAssertion *)sub_1001A9110();
}

@end