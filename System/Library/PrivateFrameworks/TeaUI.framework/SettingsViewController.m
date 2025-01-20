@interface SettingsViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC5TeaUI22SettingsViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDone;
- (void)keyboardWillChangeFrameWithNotification:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SettingsViewController

- (_TtC5TeaUI22SettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SettingsViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  SettingsViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  SettingsViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  SettingsViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SettingsViewController.viewDidLayoutSubviews()();
}

- (void)doDone
{
  v2 = self;
  sub_1B5F3DF00();
}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v4 = sub_1B61AF6F0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AF6B0();
  v8 = self;
  sub_1B5F3E004((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC5TeaUI22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  SettingsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI22SettingsViewController_actionHandler);

  swift_release();
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  LOBYTE(self) = SettingsViewController.tableView(_:shouldHighlightRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  SettingsViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return SettingsViewController.numberOfSections(in:)((UITableView *)self);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  Swift::Int v8 = SettingsViewController.tableView(_:numberOfRowsInSection:)((UITableView *)v7, a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = (void *)SettingsViewController.tableView(_:cellForRowAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B61AFCB0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v10 = a3;
  v11 = self;
  SettingsViewController.tableView(_:heightForRowAt:)();
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_1B5F41E84(self, (uint64_t)a2, a3, a4, (void (*)(void))SettingsViewController.tableView(_:titleForHeaderInSection:));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_1B5F41E84(self, (uint64_t)a2, a3, a4, (void (*)(void))SettingsViewController.tableView(_:titleForFooterInSection:));
}

@end