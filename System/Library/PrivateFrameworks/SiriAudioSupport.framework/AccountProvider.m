@interface AccountProvider
- (uint64_t)handleActiveAccountDidChangeNotificationWithNotification:;
@end

@implementation AccountProvider

- (uint64_t)handleActiveAccountDidChangeNotificationWithNotification:
{
  uint64_t v0 = sub_2380E4528();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26894AA20 != -1) {
    swift_once();
  }
  uint64_t v4 = __swift_project_value_buffer(v0, (uint64_t)qword_268956458);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_2380E4508();
  os_log_type_t v6 = sub_2380E4D38();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_237EB8000, v5, v6, "AccountProvider#handleActiveAccountDidChangeNotification clearing the account cache", v7, 2u);
    MEMORY[0x23EC87710](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_26894A850 != -1) {
    swift_once();
  }
  return (*(uint64_t (**)(void))(*(void *)off_26894BB80 + 200))();
}

@end