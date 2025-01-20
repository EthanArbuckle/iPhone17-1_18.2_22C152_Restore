@interface CSDAnalyticsManager
+ (_TtC13callservicesd19CSDAnalyticsManager)sharedInstance;
- (_TtC13callservicesd19CSDAnalyticsManager)init;
- (void)beginDailyMaintenanceWith:(id)a3;
- (void)setAnalyticsManagerProvider:(id)a3;
@end

@implementation CSDAnalyticsManager

+ (_TtC13callservicesd19CSDAnalyticsManager)sharedInstance
{
  id v2 = static CSDAnalyticsManager.sharedInstance.getter();

  return (_TtC13callservicesd19CSDAnalyticsManager *)v2;
}

- (void)setAnalyticsManagerProvider:(id)a3
{
}

- (_TtC13callservicesd19CSDAnalyticsManager)init
{
  return (_TtC13callservicesd19CSDAnalyticsManager *)sub_1002C8728();
}

- (void)beginDailyMaintenanceWith:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd19CSDAnalyticsManager_callDirectoryManager));

  swift_release();
}

@end