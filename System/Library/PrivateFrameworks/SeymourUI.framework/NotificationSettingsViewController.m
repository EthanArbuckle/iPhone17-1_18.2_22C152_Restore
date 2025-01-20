@interface NotificationSettingsViewController
- (_TtC9SeymourUI34NotificationSettingsViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI34NotificationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)switchTappedWithCellSwitch:(id)a3;
- (void)updateSettings;
- (void)viewDidLoad;
@end

@implementation NotificationSettingsViewController

- (_TtC9SeymourUI34NotificationSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A66EB3C();
}

- (void)dealloc
{
  id v3 = self;
  uint64_t v4 = OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_notifyToken;
  uint64_t v5 = *(unsigned int *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_notifyToken);
  v6 = self;
  if (objc_msgSend(v3, sel_tokenIsValid_, v5)) {
    objc_msgSend(v3, sel_cancelToken_, *(unsigned int *)((char *)&self->super.super.super.isa + v4));
  }
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for NotificationSettingsViewController();
  [(NotificationSettingsViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_accountProvider);
  sub_239F4DBD4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_browsingStringBuilder);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_contentAvailabilityClient);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_fitnessModeObserver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_networkEvaluator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_notificationSettingsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_storefrontLocalizer);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_syncManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_tableView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_wheelchairStatus);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_contentUnavailableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_spinnerView));
  swift_bridgeObjectRelease();
  id v3 = (char *)self
     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController__fitnessPlusNotificationSettingsEnabled;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF5F7F0);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A668E44();
}

- (void)updateSettings
{
  v2 = self;
  sub_23A66B8AC();
}

- (void)switchTappedWithCellSwitch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23A66C0FC(v4);
}

- (_TtC9SeymourUI34NotificationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI34NotificationSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  int64_t v6 = _s9SeymourUI34NotificationSettingsViewControllerC16numberOfSections2inSiSo07UITableE0C_tF_0();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = self;
  int64_t v8 = sub_23A66EE20(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_23A7F6B08();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F6AA8();
  id v10 = a3;
  v11 = self;
  v12 = NotificationSettingsViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_23A66D660(self, (uint64_t)a2, a3, a4, (void (*)(uint64_t))sub_23A66EF18);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_23A66D660(self, (uint64_t)a2, a3, a4, (void (*)(uint64_t))sub_23A66F01C);
}

@end