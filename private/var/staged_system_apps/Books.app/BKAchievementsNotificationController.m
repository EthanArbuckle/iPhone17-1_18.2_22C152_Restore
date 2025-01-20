@interface BKAchievementsNotificationController
+ (NSString)categoryIdentifier;
+ (id)messageKeyFromNotificationUserInfo:(id)a3;
+ (id)titleKeyFromNotificationUserInfo:(id)a3;
+ (int64_t)goalTypeFromNotificationUserInfo:(id)a3;
- (BKAchievementsNotificationController)init;
@end

@implementation BKAchievementsNotificationController

+ (NSString)categoryIdentifier
{
  NSString v2 = sub_1007FDC30();

  return (NSString *)v2;
}

+ (id)titleKeyFromNotificationUserInfo:(id)a3
{
  return sub_1006BAA40((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))_s5Books34AchievementsNotificationControllerC8titleKey4fromSSSgSDySSypG_tFZ_0);
}

+ (id)messageKeyFromNotificationUserInfo:(id)a3
{
  return sub_1006BAA40((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))_s5Books34AchievementsNotificationControllerC10messageKey4fromSSSgSDySSypG_tFZ_0);
}

+ (int64_t)goalTypeFromNotificationUserInfo:(id)a3
{
  uint64_t v3 = sub_1007FDA70();
  int64_t v4 = _s5Books34AchievementsNotificationControllerC8goalType4from13BookAnalytics011BridgedGoalF0OSDySSypG_tFZ_0(v3);
  swift_bridgeObjectRelease();
  return v4;
}

- (BKAchievementsNotificationController)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(BKAchievementsNotificationController *)&v3 init];
}

@end