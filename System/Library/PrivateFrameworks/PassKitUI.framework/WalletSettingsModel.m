@interface WalletSettingsModel
- (void)passLibraryDidChangeWithNotification:(id)a3;
- (void)paymentOptionsDidChange;
@end

@implementation WalletSettingsModel

- (void)paymentOptionsDidChange
{
  sub_1A03ADE18();
  sub_19F80452C();

  swift_release();
}

- (void)passLibraryDidChangeWithNotification:(id)a3
{
  uint64_t v3 = sub_1A03AE798();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AE778();
  sub_1A03ADE18();
  sub_19F804C6C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end