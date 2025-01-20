@interface AppRecordObserver
- (_TtC21SeymourClientServices17AppRecordObserver)init;
- (void)appQuery:(id)a3 resultsDidChange:(id)a4;
@end

@implementation AppRecordObserver

- (_TtC21SeymourClientServices17AppRecordObserver)init
{
  result = (_TtC21SeymourClientServices17AppRecordObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25C25E32C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated));

  swift_bridgeObjectRelease();
}

- (void)appQuery:(id)a3 resultsDidChange:(id)a4
{
  sub_25C256834(0, &qword_26A599188);
  sub_25C274A10();
  id v6 = a3;
  v7 = self;
  sub_25C25E510();

  swift_bridgeObjectRelease();
}

@end