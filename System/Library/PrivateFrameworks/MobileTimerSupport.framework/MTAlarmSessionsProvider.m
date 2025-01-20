@interface MTAlarmSessionsProvider
- (BOOL)hasActiveAlarmSession;
- (_TtC18MobileTimerSupport23MTAlarmSessionsProvider)init;
- (id)activeAlarmSessions;
- (id)activityIdForAlarmIdWithAlarmId:(id)a3;
- (id)alertingSessionId;
- (int64_t)numberOfActiveSessions;
- (void)createSessionWithContext:(id)a3 completion:(id)a4 forAlert:(BOOL)a5;
- (void)finishSessionWithAlarmId:(id)a3 completion:(id)a4;
- (void)restoreSessionsWithCompletion:(id)a3;
- (void)updateSessionWithContext:(id)a3 completion:(id)a4;
@end

@implementation MTAlarmSessionsProvider

- (BOOL)hasActiveAlarmSession
{
  v2 = self;
  char v3 = sub_1BE291FB4();

  return v3 & 1;
}

- (id)activeAlarmSessions
{
  v2 = self;
  sub_1BE2921C0();

  char v3 = (void *)sub_1BE3234F0();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)createSessionWithContext:(id)a3 completion:(id)a4 forAlert:(BOOL)a5
{
}

- (void)updateSessionWithContext:(id)a3 completion:(id)a4
{
}

- (void)finishSessionWithAlarmId:(id)a3 completion:(id)a4
{
}

- (void)restoreSessionsWithCompletion:(id)a3
{
}

- (id)activityIdForAlarmIdWithAlarmId:(id)a3
{
  uint64_t v4 = sub_1BE3233C0();
  uint64_t v6 = v5;
  v7 = self;
  sub_1BE2948A0(v4, v6);
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
  int64_t v3 = sub_1BE294E60();

  return v3;
}

- (id)alertingSessionId
{
  return sub_1BE295280(self, (uint64_t)a2, (void (*)(void))sub_1BE295064);
}

- (_TtC18MobileTimerSupport23MTAlarmSessionsProvider)init
{
  return (_TtC18MobileTimerSupport23MTAlarmSessionsProvider *)MTAlarmSessionsProvider.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupport23MTAlarmSessionsProvider_serializerQueue));
  swift_bridgeObjectRelease();
}

@end