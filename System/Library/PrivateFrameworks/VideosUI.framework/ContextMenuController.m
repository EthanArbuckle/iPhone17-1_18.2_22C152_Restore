@interface ContextMenuController
- (void)handleRequestNotificationWithNotification:(id)a3;
@end

@implementation ContextMenuController

- (void)handleRequestNotificationWithNotification:(id)a3
{
  uint64_t v3 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v5 = v4;
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_31();
  uint64_t v9 = v8 - v7;
  sub_1E3875BE8();
  swift_retain();
  sub_1E36B95B0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v9, v3);
}

@end