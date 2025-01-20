@interface DebugSettingsViewController
- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)dismissFrom:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)takeNewBoolValueFrom:(id)a3;
- (void)userDefaultsDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DebugSettingsViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(DebugSettingsViewController *)&v4 viewWillAppear:v3];
}

- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithCoder:(id)a3
{
  *(void *)&self->settings[OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_debugActionsProvider] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews27DebugSettingsViewController *)sub_385890();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  DebugSettingsViewController.viewDidLoad()();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  objc_super v4 = self;
  id v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(DebugSettingsViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_debugActionsProvider;

  sub_154940((uint64_t)v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(DebugSettingsViewController *)v2 traitCollection];
  objc_super v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)userDefaultsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_31C8E8();
}

- (void)takeNewBoolValueFrom:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_319B34(v4);
}

- (void)dismissFrom:(id)a3
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  swift_beginAccess();
  return *(void *)(*(void *)v3 + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  int64_t result = swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(*(void *)v5 + 16) > (unint64_t)a4)
  {
    return *(void *)(*(void *)(*(void *)v5 + 40 * a4 + 64) + 16);
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  id result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (*(void *)(*(void *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  NSString v7 = sub_384380();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews27DebugSettingsViewController_settings;
  id result = (id)swift_beginAccess();
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (*(void *)(*(void *)v5 + 16) <= (unint64_t)a4)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (*(void *)(*(void *)v5 + 40 * a4 + 56))
  {
    swift_bridgeObjectRetain();
    NSString v7 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)DebugSettingsViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_37B160();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_31CB74(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_4726A0);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v13 = a3;
  uint64_t v14 = self;
  DebugSettingsViewController.tableView(_:willSelectRowAt:)((uint64_t)v9, (uint64_t)v12);

  uint64_t v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    Class isa = sub_37B0D0().super.isa;
    v15(v12, v6);
  }

  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_37B160();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_37B0E0();
  id v10 = a3;
  uint64_t v11 = self;
  DebugSettingsViewController.tableView(_:didSelectRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithStyle:(int64_t)a3
{
  id result = (_TtC23ShelfKitCollectionViews27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC23ShelfKitCollectionViews27DebugSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  id result = (_TtC23ShelfKitCollectionViews27DebugSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end