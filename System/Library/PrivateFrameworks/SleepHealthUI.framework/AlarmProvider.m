@interface AlarmProvider
- (void)handleAlarmChangeWithNotification:(id)a3;
@end

@implementation AlarmProvider

- (void)handleAlarmChangeWithNotification:(id)a3
{
  uint64_t v3 = sub_1AD9DC7F0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DC7D0();
  swift_retain();
  sub_1AD994C78((uint64_t)v7);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end