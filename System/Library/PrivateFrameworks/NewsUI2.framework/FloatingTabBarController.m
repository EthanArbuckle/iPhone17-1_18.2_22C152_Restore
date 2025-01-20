@interface FloatingTabBarController
- (BOOL)tabBarController:(id)a3 shouldSelectTab:(id)a4;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (NSArray)keyCommands;
- (_TtC7NewsUI224FloatingTabBarController)initWithCoder:(id)a3;
- (_TtC7NewsUI224FloatingTabBarController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7NewsUI224FloatingTabBarController)initWithTabs:(id)a3;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5;
- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4;
- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4;
- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4;
- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5;
- (void)didReceiveMemoryWarning;
- (void)keyCommandOpenNewWindow;
- (void)keyCommandToggleSidebar;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)showViewController:(id)a3 sender:(id)a4;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FloatingTabBarController

- (_TtC7NewsUI224FloatingTabBarController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF1FA068();
}

- (void)didReceiveMemoryWarning
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FloatingTabBarController();
  id v2 = v3.receiver;
  [(FloatingTabBarController *)&v3 didReceiveMemoryWarning];
  swift_retain();
  sub_1DFDEE0F0();

  swift_release();
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_1DF1EF250();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FloatingTabBarController();
  id v4 = v5.receiver;
  [(FloatingTabBarController *)&v5 viewWillAppear:v3];
  sub_1DF1F6F68();
  sub_1DF1F7104();
  sub_1DF1F728C();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FloatingTabBarController();
  id v2 = v3.receiver;
  [(FloatingTabBarController *)&v3 viewWillLayoutSubviews];
  sub_1DF1EEEF8();
  sub_1DF1EF7B0();
}

- (void)showViewController:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1DFDFF780();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    v9 = self;
  }
  sub_1DF1EFBBC(a3);

  sub_1DEA2CCF8((uint64_t)v10, (uint64_t)&qword_1EBABB7F0, MEMORY[0x1E4FBC840] + 8, MEMORY[0x1E4FBB718], (uint64_t (*)(void))sub_1DF1FB790);
}

- (_TtC7NewsUI224FloatingTabBarController)initWithTabs:(id)a3
{
  result = (_TtC7NewsUI224FloatingTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI224FloatingTabBarController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI224FloatingTabBarController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1DEA2CCF8((uint64_t)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_layoutCoordinator, (uint64_t)&qword_1EBAF4FA0, (uint64_t)&unk_1EBAF4F90, (uint64_t)&protocol descriptor for FloatingTabBarLayoutCoordinatorType, (uint64_t (*)(void))sub_1DE9B31FC);
  objc_super v3 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_presentationContextCache;
  sub_1DF1F9ADC();
  uint64_t v5 = v4;
  id v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_stagedModalContextCache, v5);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_overlayToolbar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController____lazy_storage___intrinsicTabBar));
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1DF1F29A0((uint64_t)v6, v7);
}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  sub_1DFDFE220();
  id v6 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate))
  {
    uint64_t v7 = *((void *)v6 + 1);
    swift_getObjectType();
    id v8 = *(void (**)(void))(v7 + 56);
    id v9 = a3;
    v10 = self;
    v8();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1DF1EEEF8();
}

- (void)_tabbarController:(id)a3 sidebar:(id)a4 editingStateDidChange:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  swift_retain();
  sub_1DFDED5D0();

  swift_release();
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 configureItem:(id)a5
{
  id v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    uint64_t v10 = *((void *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(void))(v10 + 8);
    id v12 = a3;
    id v13 = a4;
    id v14 = a5;
    v15 = self;
    v11();

    swift_unknownObjectRelease();
  }
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 updateItem:(id)a5
{
  id v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    uint64_t v10 = *((void *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(void))(v10 + 16);
    id v12 = a3;
    id v13 = a4;
    id v14 = a5;
    v15 = self;
    v11();

    swift_unknownObjectRelease();
  }
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5
{
  id v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    uint64_t v10 = *((void *)v9 + 1);
    swift_getObjectType();
    v11 = *(uint64_t (**)(void))(v10 + 24);
    id v12 = a3;
    id v13 = a4;
    id v14 = a5;
    v15 = self;
    v16 = (void *)v11();

    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  id v9 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    uint64_t v10 = *((void *)v9 + 1);
    swift_getObjectType();
    v11 = *(uint64_t (**)(void))(v10 + 32);
    id v12 = a3;
    id v13 = a4;
    id v14 = a5;
    v15 = self;
    v16 = (void *)v11();

    swift_unknownObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
}

- (BOOL)tabBarController:(id)a3 shouldSelectTab:(id)a4
{
  id v7 = (char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_sidebarDelegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    id v9 = *(uint64_t (**)(void))(v8 + 112);
    id v10 = a3;
    id v11 = a4;
    id v12 = self;
    char v13 = v9();

    swift_unknownObjectRelease();
  }
  else
  {
    char v13 = 1;
  }
  return v13 & 1;
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  id v9 = [(FloatingTabBarController *)v8 selectedIndex];
  id v10 = [(FloatingTabBarController *)v8 viewControllers];
  if (v10)
  {
    id v11 = v10;
    sub_1DE919914(0, (unint64_t *)&qword_1EBABAC50);
    unint64_t v12 = sub_1DFDFE220();

    sub_1DFA09CCC((uint64_t)v7, v12);
    id v14 = v13;
    char v16 = v15;
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0 && v9 == v14)
    {
      type metadata accessor for FloatingTabBarNavigationController();
      uint64_t v17 = swift_dynamicCastClass();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = (_TtC7NewsUI224FloatingTabBarController *)v7;
        sub_1DF1F2D18((uint64_t)v19, v18);

        uint64_t v8 = v19;
      }
    }
  }

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_previousSelectedElementIdentifier);
  *uint64_t v4 = 0;
  v4[1] = 0;
  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_searchElementIdentifier);
  uint64_t v4 = *(void *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI224FloatingTabBarController_searchElementIdentifier);
  id v6 = a3;
  unint64_t v12 = self;
  id v7 = [(FloatingTabBarController *)v12 viewControllers];
  if (v7)
  {
    uint64_t v8 = v7;
    sub_1DE919914(0, (unint64_t *)&qword_1EBABAC50);
    unint64_t v9 = sub_1DFDFE220();

    swift_bridgeObjectRetain();
    uint64_t v10 = sub_1DF1F9460(v9, v5, v4);
    LOBYTE(v8) = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v8 & 1) == 0) {
      [(FloatingTabBarController *)v12 setSelectedIndex:v10];
    }
  }
  sub_1DF1F3838(v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1DFDFDD20();
  unint64_t v8 = v7;
  id v9 = a3;
  uint64_t v10 = self;
  sub_1DF1FA8CC(v6, v8);

  swift_bridgeObjectRelease();
}

- (NSArray)keyCommands
{
  id v2 = self;
  uint64_t v3 = sub_1DF1F7BB8();

  if (v3)
  {
    sub_1DE919914(0, (unint64_t *)&unk_1EBABAAB0);
    uint64_t v4 = (void *)sub_1DFDFE200();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)keyCommandToggleSidebar
{
  id v2 = self;
  id v5 = [(FloatingTabBarController *)v2 _uip_sidebar];
  id v3 = [(FloatingTabBarController *)v2 _uip_sidebar];
  unsigned int v4 = objc_msgSend(v3, sel__isVisible);

  objc_msgSend(v5, sel__setVisible_, v4 ^ 1);
}

- (void)keyCommandOpenNewWindow
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1B80]), sel_init);
  id v1 = objc_msgSend(self, sel_sharedApplication);
  v4[4] = sub_1DF1F7E40;
  v4[5] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 1107296256;
  v4[2] = sub_1DEB1AE5C;
  v4[3] = &block_descriptor_47;
  id v2 = _Block_copy(v4);
  id v3 = v0;
  objc_msgSend(v1, sel_requestSceneSessionActivation_userActivity_options_errorHandler_, 0, 0, v3, v2);
  _Block_release(v2);
}

@end