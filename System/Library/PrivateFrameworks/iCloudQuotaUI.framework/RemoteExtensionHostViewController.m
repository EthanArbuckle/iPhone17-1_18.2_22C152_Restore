@interface RemoteExtensionHostViewController
- (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController)initWithCoder:(id)a3;
- (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)hostViewControllerDidActivate:;
- (unint64_t)supportedInterfaceOrientations;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation RemoteExtensionHostViewController

- (unint64_t)supportedInterfaceOrientations
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_currentDevice);
  id v6 = objc_msgSend(v5, sel_userInterfaceIdiom);

  if (v6 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController____lazy_storage___hostViewController) = 0;
  id v5 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController_appExtension;
  uint64_t v6 = sub_22C9A1948();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController *)sub_22C9A3F58();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.isa) + 0x88);
  v4 = self;
  id v5 = (id)v3();
  [(UIViewController *)v4 presentPreferredSizeWithViewController:v5 animated:1 completion:0];
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_22C95BE54(a4);
}

- (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13iCloudQuotaUI33RemoteExtensionHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController____lazy_storage___hostViewController));
  sub_22C8BE0DC((uint64_t)self + OBJC_IVAR____TtC13iCloudQuotaUI33RemoteExtensionHostViewController_appExtension, (uint64_t *)&unk_2684D34D0);
}

- (uint64_t)hostViewControllerDidActivate:
{
  uint64_t v0 = sub_22C9A1AA8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22C8F8FBC();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  id v5 = sub_22C9A1A98();
  os_log_type_t v6 = sub_22C9A3A78();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    uint64_t v11 = v8;
    *(_DWORD *)uint64_t v7 = 136315650;
    uint64_t v10 = sub_22C8BA27C(0xD000000000000035, 0x800000022C9C0C70, &v11);
    sub_22C9A3C78();
    *(_WORD *)(v7 + 12) = 2080;
    uint64_t v10 = sub_22C8BA27C(0xD000000000000021, 0x800000022C9C0E50, &v11);
    sub_22C9A3C78();
    *(_WORD *)(v7 + 22) = 2048;
    uint64_t v10 = 99;
    sub_22C9A3C78();
    _os_log_impl(&dword_22C821000, v5, v6, "%s: %s - line %ld", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x230F710E0](v8, -1, -1);
    MEMORY[0x230F710E0](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

@end