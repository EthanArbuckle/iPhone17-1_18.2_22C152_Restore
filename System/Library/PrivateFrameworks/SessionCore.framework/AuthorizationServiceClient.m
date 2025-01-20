@interface AuthorizationServiceClient
- (BOOL)areActivitiesEnabledForBundleIdentifier:(id)a3;
- (BOOL)areActivitiesEnabledForCurrentProcess;
- (BOOL)areFrequentPushesEnabledForBundleIdentifier:(id)a3;
- (BOOL)areFrequentPushesEnabledForCurrentProcess;
- (BOOL)clearActivitiesAuthorizationForBundleIdentifier:(id)a3 error:(id *)a4;
- (BOOL)setActivitiesAuthorizationForBundleIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)setFrequentPushesEnabledForBundleIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)subscribeToAuthorizationLevelChangesForBundleIdentifier:(id)a3;
- (BOOL)unsubscribeToAuthorizationLevelChangesForBundleIdentifier:(id)a3;
- (_TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient)init;
- (id)activityAuthorizationsCountForBundleIdentifier:(id)a3;
@end

@implementation AuthorizationServiceClient

- (_TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient)init
{
  result = (_TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient_connection));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)setActivitiesAuthorizationForBundleIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1C7D2C550(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))sub_1C7D2C170);
}

- (BOOL)setFrequentPushesEnabledForBundleIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1C7D2C550(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))sub_1C7D2C308);
}

- (BOOL)clearActivitiesAuthorizationForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1C7D32CE0();
  uint64_t v7 = v6;
  v8 = self;
  sub_1C7D2C774(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)areActivitiesEnabledForCurrentProcess
{
  v2 = self;
  char v3 = sub_1C7D2CA2C();

  return v3 & 1;
}

- (id)activityAuthorizationsCountForBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_1C7D32CE0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8 = (void *)sub_1C7D2CC14(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)subscribeToAuthorizationLevelChangesForBundleIdentifier:(id)a3
{
  return sub_1C7D2D914(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C7D2CF20);
}

- (BOOL)unsubscribeToAuthorizationLevelChangesForBundleIdentifier:(id)a3
{
  return sub_1C7D2D914(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C7D2D0E4);
}

- (BOOL)areActivitiesEnabledForBundleIdentifier:(id)a3
{
  return sub_1C7D2D914(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C7D2D29C);
}

- (BOOL)areFrequentPushesEnabledForCurrentProcess
{
  v2 = self;
  char v3 = sub_1C7D2D480();

  return v3 & 1;
}

- (BOOL)areFrequentPushesEnabledForBundleIdentifier:(id)a3
{
  return sub_1C7D2D914(self, (uint64_t)a2, (uint64_t)a3, sub_1C7D2D6D4);
}

@end