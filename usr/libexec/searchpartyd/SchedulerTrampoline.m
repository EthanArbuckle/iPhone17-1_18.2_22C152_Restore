@interface SchedulerTrampoline
- (_TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline)init;
- (void)publishImmediatelyWithCompletion:(id)a3;
- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4;
@end

@implementation SchedulerTrampoline

- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4
{
  v6 = (void (**)(void *, void *))_Block_copy(a4);
  sub_1008706E8();
  swift_allocError();
  id v7 = a3;
  v9 = self;
  v8 = (void *)_convertErrorToNSError(_:)();
  v6[2](v6, v8);

  swift_errorRelease();
  _Block_release(v6);
}

- (void)publishImmediatelyWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100870380((uint64_t)sub_1001DFD28, v5);

  swift_release();
}

- (_TtC12searchpartydP33_8F16B571022752B5A0333344EAF60C1619SchedulerTrampoline)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SchedulerTrampoline();
  return [(SchedulerTrampoline *)&v3 init];
}

@end