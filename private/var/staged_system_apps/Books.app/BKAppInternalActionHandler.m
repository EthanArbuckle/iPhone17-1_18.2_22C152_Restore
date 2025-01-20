@interface BKAppInternalActionHandler
- (BKAppInternalActionHandler)init;
- (BKAppInternalActionHandler)initWithApplication:(id)a3 sceneManager:(id)a4;
- (void)books_internal_disableStoreInternalDebugMessageUI:(id)a3;
- (void)books_internal_incrementPostLaunchCacheCount:(id)a3;
- (void)books_internal_openRedeemURL:(id)a3;
- (void)books_internal_presentDebugMenu:(id)a3;
- (void)books_internal_selectSidebarCollection:(id)a3;
- (void)books_internal_selectSidebarItem:(id)a3;
- (void)books_internal_selectSidebarSearch:(id)a3;
- (void)books_internal_setLegacyAccount:(id)a3;
- (void)books_internal_simulateMemoryWarning:(id)a3;
- (void)books_internal_toggleFakePlayer:(id)a3;
- (void)books_internal_toggleRecordingLiveResizeStats:(id)a3;
- (void)books_internal_triggerFakeDailyReadingGoalAchievementNotification:(id)a3;
- (void)books_internal_triggerFakeLongestStreakNotification:(id)a3;
- (void)books_internal_triggerFakeYearlyBooksGoalAchievementNotification:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation BKAppInternalActionHandler

- (BKAppInternalActionHandler)initWithApplication:(id)a3 sceneManager:(id)a4
{
  return (BKAppInternalActionHandler *)sub_10001EEB8((uint64_t)a3, (uint64_t)a4);
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004073DC(v4);
}

- (void)books_internal_presentDebugMenu:(id)a3
{
}

- (void)books_internal_simulateMemoryWarning:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v5 = self;
  }
  id v6 = [self defaultCenter];
  [v6 postNotificationName:UIApplicationDidReceiveMemoryWarningNotification object:*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_application)];

  sub_10006CA38((uint64_t)v7);
}

- (void)books_internal_openRedeemURL:(id)a3
{
}

- (void)books_internal_toggleFakePlayer:(id)a3
{
}

- (void)books_internal_toggleRecordingLiveResizeStats:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    v5 = self;
  }
  [*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_userDefaults) setBool:[*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_userDefaults) BOOLForKey:TUIUserDefaultRecordLiveResizeStats, v6, v7] ^ 1 forKey:TUIUserDefaultRecordLiveResizeStats];

  sub_10006CA38((uint64_t)&v6);
}

- (void)books_internal_disableStoreInternalDebugMessageUI:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
  }
  long long v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_userDefaults);
  NSString v7 = sub_1007FDC30();
  unsigned int v8 = [v6 BOOLForKey:v7];

  NSString v9 = sub_1007FDC30();
  [v6 setBool:v8 ^ 1 forKey:v9];

  sub_10006CA38((uint64_t)v10);
}

- (void)books_internal_triggerFakeDailyReadingGoalAchievementNotification:(id)a3
{
  uint64_t v5 = sub_1007FA150();
  __chkstk_darwin(v5);
  NSString v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    unsigned int v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    NSString v9 = self;
  }
  *(void *)NSString v7 = 0;
  v7[8] = 0;
  swift_storeEnumTagMultiPayload();
  static AchievementsNotificationController.notify(_:currentlyShowingSheetKind:)((uint64_t)v7, 0);
  sub_10040A2C4((uint64_t)v7);

  sub_10006CA38((uint64_t)v10);
}

- (void)books_internal_triggerFakeYearlyBooksGoalAchievementNotification:(id)a3
{
  uint64_t v5 = sub_1007FA150();
  __chkstk_darwin(v5);
  NSString v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    unsigned int v8 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    NSString v9 = self;
  }
  *NSString v7 = 0;
  swift_storeEnumTagMultiPayload();
  static AchievementsNotificationController.notify(_:currentlyShowingSheetKind:)((uint64_t)v7, 0);
  sub_10040A2C4((uint64_t)v7);

  sub_10006CA38((uint64_t)v10);
}

- (void)books_internal_triggerFakeLongestStreakNotification:(id)a3
{
  uint64_t v5 = sub_1007F2BA0();
  __chkstk_darwin(v5 - 8);
  uint64_t v6 = sub_1007FA150();
  __chkstk_darwin(v6);
  unsigned int v8 = (void *)((char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3)
  {
    NSString v9 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v10 = self;
  }
  sub_100058D18(&qword_100B32978);
  *unsigned int v8 = 88;
  sub_1007F2B90();
  sub_1007F4980();
  swift_storeEnumTagMultiPayload();
  static AchievementsNotificationController.notify(_:currentlyShowingSheetKind:)((uint64_t)v8, 0);
  sub_10040A2C4((uint64_t)v8);

  sub_10006CA38((uint64_t)v11);
}

- (void)books_internal_selectSidebarItem:(id)a3
{
}

- (void)books_internal_selectSidebarSearch:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = self;
  }
  id v6 = [*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_sceneManager) primarySceneController:v9, v10];
  id v7 = [v6 rootBarCoordinator];

  if (v7)
  {
    NSString v8 = sub_1007FDC30();
    [v7 selectWithIdentifier:v8 isUserAction:1];

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_10006CA38((uint64_t)&v9);
}

- (void)books_internal_selectSidebarCollection:(id)a3
{
}

- (void)books_internal_setLegacyAccount:(id)a3
{
}

- (void)books_internal_incrementPostLaunchCacheCount:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    uint64_t v5 = self;
  }
  id v6 = [self defaultCenter];
  if (qword_100B23038 != -1) {
    swift_once();
  }
  [v6 postNotificationName:qword_100B75E88 object:[self application] userInfo:v7];

  sub_10006CA38((uint64_t)&v7);
}

- (BKAppInternalActionHandler)init
{
  result = (BKAppInternalActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAppInternalActionHandler_fakePlayerViewController);
}

@end