@interface ICSAnalyticsController
- (_TtC14iCloudSettings22ICSAnalyticsController)init;
- (_TtC14iCloudSettings22ICSAnalyticsController)initWithAccount:(id)a3;
- (void)sendBackupToggleEventWithActionType:(int64_t)a3;
- (void)sendToggleEventForDataclassID:(id)a3 actionType:(int64_t)a4 enabled:(BOOL)a5;
@end

@implementation ICSAnalyticsController

- (_TtC14iCloudSettings22ICSAnalyticsController)initWithAccount:(id)a3
{
  id v4 = a3;
  v5 = (_TtC14iCloudSettings22ICSAnalyticsController *)sub_262A8D1BC(a3);

  return v5;
}

- (void)sendToggleEventForDataclassID:(id)a3 actionType:(int64_t)a4 enabled:(BOOL)a5
{
  uint64_t v8 = sub_262B04488();
  uint64_t v10 = v9;
  v11 = self;
  ICSAnalyticsController.sendToggleEvent(for:actionType:enabled:)(v8, v10, a4, a5);

  swift_bridgeObjectRelease();
}

- (void)sendBackupToggleEventWithActionType:(int64_t)a3
{
  id v4 = self;
  ICSAnalyticsController.sendBackupToggleEvent(actionType:)(a3);
}

- (_TtC14iCloudSettings22ICSAnalyticsController)init
{
  result = (_TtC14iCloudSettings22ICSAnalyticsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings22ICSAnalyticsController_backupManager);
}

@end