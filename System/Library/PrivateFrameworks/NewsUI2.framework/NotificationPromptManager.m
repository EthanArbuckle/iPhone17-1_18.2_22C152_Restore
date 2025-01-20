@interface NotificationPromptManager
- (int64_t)notificationPrompt;
- (int64_t)subscribeNotificationPromptForTagID:(id)a3;
@end

@implementation NotificationPromptManager

- (int64_t)subscribeNotificationPromptForTagID:(id)a3
{
  uint64_t v3 = sub_1DFDFDD20();
  uint64_t v5 = v4;
  swift_retain();
  int64_t v6 = sub_1DEE957A4(v3, v5);
  swift_release();
  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)notificationPrompt
{
  swift_retain();
  int64_t v2 = sub_1DEE95B68();
  swift_release();
  return v2;
}

@end