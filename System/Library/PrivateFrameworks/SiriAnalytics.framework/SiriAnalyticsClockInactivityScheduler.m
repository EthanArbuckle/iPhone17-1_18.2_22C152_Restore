@interface SiriAnalyticsClockInactivityScheduler
- (SiriAnalyticsClockInactivityScheduler)init;
- (SiriAnalyticsClockInactivityScheduler)initWithSeconds:(int64_t)a3 queue:(id)a4 expiration:(id)a5 creation:(id)a6;
- (void)clockCreated;
- (void)clockExpiredWithCompletion:(id)a3;
- (void)clockForcefullyDestroyedWithCompletion:(id)a3;
- (void)destroyInactivityTimer;
- (void)startScheduling;
@end

@implementation SiriAnalyticsClockInactivityScheduler

- (SiriAnalyticsClockInactivityScheduler)initWithSeconds:(int64_t)a3 queue:(id)a4 expiration:(id)a5 creation:(id)a6
{
  v8 = _Block_copy(a5);
  v9 = _Block_copy(a6);
  *(void *)(swift_allocObject() + 16) = v8;
  if (v9) {
    *(void *)(swift_allocObject() + 16) = v9;
  }
  id v10 = a4;
  return (SiriAnalyticsClockInactivityScheduler *)ClockInactivityScheduler.init(seconds:queue:expiration:creation:)();
}

- (void)startScheduling
{
  v2 = self;
  sub_1A2B71258();
}

- (void)destroyInactivityTimer
{
  v2 = self;
  sub_1A2B71320();
}

- (void)clockExpiredWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1A2B71CA8;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1A2B71464((uint64_t)v7, v6);
  sub_1A2B5889C((uint64_t)v7);
}

- (void)clockForcefullyDestroyedWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1A2B588E4;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_1A2B71574((uint64_t)v7, v6);
  sub_1A2B5889C((uint64_t)v7);
}

- (void)clockCreated
{
  v2 = self;
  sub_1A2B71728();
}

- (SiriAnalyticsClockInactivityScheduler)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___SiriAnalyticsClockInactivityScheduler_interval;
  uint64_t v4 = sub_1A2C0D360();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_1A2B5889C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SiriAnalyticsClockInactivityScheduler_creation));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
}

@end