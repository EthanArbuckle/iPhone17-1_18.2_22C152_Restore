@interface JSAMetricsController
+ (NSString)JSAPrivacyAcknowledgementDidChange;
+ (id)shared;
- (JSAMetricsController)init;
- (id)newSuspensionAssertion;
- (void)countingAssertProviderTransitionToNonZero:(id)a3;
- (void)countingAssertProviderTransitionToZero:(id)a3;
- (void)dealloc;
- (void)flushUnreportedEvents;
- (void)recordEvent:(id)a3 :(id)a4;
- (void)recordPersonalizedEvent:(id)a3 :(id)a4;
- (void)startSubmissionIfAllowed;
@end

@implementation JSAMetricsController

- (JSAMetricsController)init
{
  return (JSAMetricsController *)MetricsController.init()();
}

- (void)dealloc
{
  v2 = self;
  MetricsController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAMetricsController_suspensionAssertionProvider);
}

- (void)startSubmissionIfAllowed
{
  v2 = self;
  sub_6D8A4();
}

- (id)newSuspensionAssertion
{
  id result = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAMetricsController_suspensionAssertionProvider);
  if (result) {
    return [result newAssertion];
  }
  __break(1u);
  return result;
}

+ (id)shared
{
  if (qword_CC548 != -1) {
    swift_once();
  }
  v0 = (void *)qword_CD850;

  return v0;
}

- (void)recordEvent:(id)a3 :(id)a4
{
  uint64_t v5 = sub_86860();
  unint64_t v7 = v6;
  uint64_t v8 = sub_86800();
  if (v5 == 0xD000000000000010 && v7 == 0x800000000009E730) {
    char v9 = 1;
  }
  else {
    char v9 = sub_87070();
  }
  v10 = self;
  sub_6DB6C(v8, v5, v7, v9 & 1);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)recordPersonalizedEvent:(id)a3 :(id)a4
{
  uint64_t v5 = sub_86860();
  unint64_t v7 = v6;
  uint64_t v8 = sub_86800();
  char v9 = self;
  sub_6DB6C(v8, v5, v7, 1);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)flushUnreportedEvents
{
  uint64_t v3 = sub_2D920(&qword_CCEA0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_86B10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  char v9 = self;
  sub_43B10((uint64_t)v5, (uint64_t)&unk_CDA78, (uint64_t)v8);
  swift_release();
  sub_6FCBC((uint64_t)v5);
}

- (void)countingAssertProviderTransitionToNonZero:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s5JSApp17MetricsControllerC32countingAssertProviderTransition9toNonZeroySo019BUCountingAssertionF0C_tF_0();
}

- (void)countingAssertProviderTransitionToZero:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s5JSApp17MetricsControllerC32countingAssertProviderTransition6toZeroySo019BUCountingAssertionF0C_tF_0();
}

+ (NSString)JSAPrivacyAcknowledgementDidChange
{
  if (qword_CC550 != -1) {
    swift_once();
  }
  sub_86860();
  NSString v2 = sub_86830();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end