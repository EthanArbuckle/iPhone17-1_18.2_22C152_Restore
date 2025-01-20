@interface TopPicksCardConditionObserver
- (_TtC5Books29TopPicksCardConditionObserver)init;
- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4;
@end

@implementation TopPicksCardConditionObserver

- (_TtC5Books29TopPicksCardConditionObserver)init
{
  result = (_TtC5Books29TopPicksCardConditionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books29TopPicksCardConditionObserver_manager);
}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10050B49C();
}

@end