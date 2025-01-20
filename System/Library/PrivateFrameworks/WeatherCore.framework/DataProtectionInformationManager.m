@interface DataProtectionInformationManager
- (void)handleNSUbiquitousKeyValueStoreExternallyNotification:(id)a3;
@end

@implementation DataProtectionInformationManager

- (void)handleNSUbiquitousKeyValueStoreExternallyNotification:(id)a3
{
  uint64_t v3 = sub_1B4B36A08();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4B369E8();
  sub_1B4B36418();
  sub_1B4A690C0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end