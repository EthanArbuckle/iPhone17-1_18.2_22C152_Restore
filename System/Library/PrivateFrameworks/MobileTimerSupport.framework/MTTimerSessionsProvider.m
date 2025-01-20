@interface MTTimerSessionsProvider
- (BOOL)hasActiveTimerSession;
- (_TtC18MobileTimerSupport23MTTimerSessionsProvider)init;
- (id)activityIdForTimerIdWithTimerId:(id)a3;
- (id)alertingSessionId;
- (int64_t)numberOfActiveSessions;
- (void)createSessionWithContext:(id)a3 completion:(id)a4 forAlert:(BOOL)a5;
- (void)finishSessionWithTimerId:(id)a3 completion:(id)a4;
- (void)restoreSessionsWithCompletion:(id)a3;
- (void)updateSessionWithContext:(id)a3 completion:(id)a4;
@end

@implementation MTTimerSessionsProvider

- (BOOL)hasActiveTimerSession
{
  v2 = self;
  char v3 = sub_1BE28BEC4();

  return v3 & 1;
}

- (void)createSessionWithContext:(id)a3 completion:(id)a4 forAlert:(BOOL)a5
{
}

- (void)updateSessionWithContext:(id)a3 completion:(id)a4
{
}

- (void)finishSessionWithTimerId:(id)a3 completion:(id)a4
{
}

- (void)restoreSessionsWithCompletion:(id)a3
{
}

- (id)activityIdForTimerIdWithTimerId:(id)a3
{
  uint64_t v4 = sub_1BE3233C0();
  uint64_t v6 = v5;
  v7 = self;
  sub_1BE28E538(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_1BE3233B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (int64_t)numberOfActiveSessions
{
  v2 = self;
  int64_t v3 = sub_1BE28E8B8();

  return v3;
}

- (id)alertingSessionId
{
  return sub_1BE295280(self, (uint64_t)a2, (void (*)(void))sub_1BE28EA4C);
}

- (_TtC18MobileTimerSupport23MTTimerSessionsProvider)init
{
  return (_TtC18MobileTimerSupport23MTTimerSessionsProvider *)MTTimerSessionsProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  int64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18MobileTimerSupport23MTTimerSessionsProvider_serializerQueue);
}

@end