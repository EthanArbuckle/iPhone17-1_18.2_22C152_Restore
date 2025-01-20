@interface ScanTurnsSubscriber
- (_TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber)init;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
@end

@implementation ScanTurnsSubscriber

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1D2F89D84(v4);
}

- (int64_t)receiveInput:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1D3002398();
  swift_unknownObjectRelease();
  int64_t v5 = sub_1D2F89EA0((uint64_t)v7);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (void)receiveCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  sub_1D2F8A7C4(v4);
}

- (void)cancel
{
  v2 = self;
  sub_1D2F8AA08();
}

- (_TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber)init
{
  result = (_TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber_turnsStartDateTime;
  uint64_t v4 = sub_1D3001018();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber_innerSubscription));
  swift_release();
  swift_release();
  sub_1D2F1CD78((uint64_t)self+ OBJC_IVAR____TtC28SiriPrivateLearningAnalyticsP33_95987ADD223C83697EEA450CF0CC3A3519ScanTurnsSubscriber_previousTurnId, &qword_1EBD62AA0);
}

@end