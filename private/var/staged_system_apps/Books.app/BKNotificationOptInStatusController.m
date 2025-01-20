@interface BKNotificationOptInStatusController
- (BKNotificationOptInStatusController)init;
- (BKNotificationOptInStatusController)initWithCenter:(id)a3 status:(int64_t)a4;
- (void)checkAndReportOptInStatus;
@end

@implementation BKNotificationOptInStatusController

- (BKNotificationOptInStatusController)initWithCenter:(id)a3 status:(int64_t)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKNotificationOptInStatusController_center) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKNotificationOptInStatusController_status) = (Class)a4;
  v10.receiver = self;
  v10.super_class = ObjectType;
  id v8 = a3;
  return [(BKNotificationOptInStatusController *)&v10 init];
}

- (void)checkAndReportOptInStatus
{
  v2 = self;
  NotificationOptInStatusController.checkAndReportOptInStatus()();
}

- (BKNotificationOptInStatusController)init
{
  result = (BKNotificationOptInStatusController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end