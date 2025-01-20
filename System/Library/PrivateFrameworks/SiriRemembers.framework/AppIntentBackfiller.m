@interface AppIntentBackfiller
- (_TtC13SiriRemembers19AppIntentBackfiller)init;
- (void)main;
@end

@implementation AppIntentBackfiller

- (_TtC13SiriRemembers19AppIntentBackfiller)init
{
  return (_TtC13SiriRemembers19AppIntentBackfiller *)AppIntentBackfiller.init()();
}

- (void)main
{
  v2 = self;
  sub_1C69F4C74();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super._iop.__nextPriOp + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_store);
  unint64_t v4 = *(unint64_t *)((char *)&self->super._iop.__queue
                           + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_store);
  swift_release();
  swift_release();
  sub_1C69F5AF8(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC13SiriRemembers19AppIntentBackfiller_stream);
}

@end