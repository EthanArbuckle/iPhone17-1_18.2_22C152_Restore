@interface StockListViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (NSArray)keyCommands;
- (_TtC8StocksUI23StockListViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI23StockListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deleteItem;
- (void)didDismissSearchController:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)didTapAttributionButton;
- (void)didTapPlusButton;
- (void)reconfigureLayoutForAccessibilityStateChange;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation StockListViewController

- (_TtC8StocksUI23StockListViewController)initWithCoder:(id)a3
{
}

- (id)contentScrollView
{
  v2 = self;
  sub_20A8C9BF0();
  v3 = (void *)sub_20A8C94C0();

  swift_release();

  return v3;
}

- (void)dealloc
{
  v2 = self;
  sub_20A70F8A0();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_scrollTracker));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_bootstrapper));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI23StockListViewController____lazy_storage___exchangeStatusToolbarItem));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_keyboardInputMonitor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_appConfigurationManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_quoteAttributionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_featureAvailability);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_editWatchlistMenuProvider);
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI23StockListViewController_logger;
  uint64_t v4 = sub_20A8C7DF0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

- (_TtC8StocksUI23StockListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI23StockListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A70FE6C();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_20A713780(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(StockListViewController *)&v4 viewDidDisappear:v3];
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_20A713E90();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20A7145D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20A714F58((uint64_t)a3);
}

- (int64_t)preferredStatusBarStyle
{
  BOOL v3 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI23StockListViewController_styler);
  swift_beginAccess();
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  v6 = __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v7 = *(void *)(v4 - 8);
  double v8 = MEMORY[0x270FA5388](v6);
  v10 = (char *)&v16 - v9;
  (*(void (**)(char *, double))(v7 + 16))((char *)&v16 - v9, v8);
  uint64_t v11 = *(void *)(v5 + 24);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
  v13 = self;
  int64_t v14 = v12(v4, v11);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v4);

  return v14;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8StocksUI23StockListViewController_eventHandler);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(unsigned char *)(v8 + 24) = v5;
  *(unsigned char *)(v8 + 25) = a4;
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v11 = *(void (**)(BOOL, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(v9 + 136);
  v12 = self;
  v11(v5, sub_20A71F80C, v8, ObjectType, v9);

  swift_release();
}

- (void)reconfigureLayoutForAccessibilityStateChange
{
  v2 = self;
  id v3 = [(StockListViewController *)v2 traitCollection];
  sub_20A715108(v3);
}

- (void)didTapAttributionButton
{
  uint64_t v3 = (*(void **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC8StocksUI23StockListViewController_eventHandler))[5];
  uint64_t ObjectType = swift_getObjectType();
  BOOL v5 = *(void (**)(uint64_t, uint64_t))(v3 + 104);
  v6 = self;
  v5(ObjectType, v3);
}

- (void)didTapPlusButton
{
  v6 = self;
  id v2 = [(StockListViewController *)v6 navigationItem];
  id v3 = objc_msgSend(v2, sel_searchController);

  if (v3)
  {
    uint64_t v4 = (_TtC8StocksUI23StockListViewController *)objc_msgSend(v3, sel_searchBar);

    [(StockListViewController *)v4 becomeFirstResponder];
    BOOL v5 = v4;
  }
  else
  {
    BOOL v5 = v6;
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  LOBYTE(self) = sub_20A71C8E0();

  return self & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_20A719440(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_20A719610(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  sub_20A71CAA0(v4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_20A71A0E4(v4);
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_20A71CB78();
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  BOOL v5 = sub_20A8C7DD0();
  os_log_type_t v6 = sub_20A8CEA00();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_20A414000, v5, v6, "Hiding ForYou card due to presenting search controller", v7, 2u);
    MEMORY[0x210528850](v7, -1, -1);
  }

  sub_20A712B5C(1, 1);
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_20A71A370(v4);
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_20A71A82C(v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = sub_20A8CEB40();
  if (v5)
  {
    os_log_type_t v6 = (void *)v5;
    sub_20A71074C((int)[(StockListViewController *)v8 isEditing], (int)[(StockListViewController *)v8 isEditing]);
    sub_20A42CFF0(0, (unint64_t *)&qword_26AC7F8F8);
    uint64_t v7 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setToolbarItems_, v7);
  }
  objc_msgSend(v4, sel_setAutomaticallyShowsSearchResultsController_, 1);
}

- (NSArray)keyCommands
{
  if (sub_20A71D264())
  {
    sub_20A42CFF0(0, &qword_26AC82FE8);
    id v2 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)deleteItem
{
  id v2 = self;
  sub_20A71B084();
}

- (void)delete:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_20A8CF270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_20A71B084();

  sub_20A71F5E4((uint64_t)v6, (uint64_t)&qword_26AC80170, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A4F6CD4);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    os_log_type_t v6 = self;
    swift_unknownObjectRetain();
    sub_20A8CF270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  char v8 = sub_20A71B53C((uint64_t)a3, (uint64_t)v10);

  sub_20A71F5E4((uint64_t)v10, (uint64_t)&qword_26AC80170, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_20A4F6CD4);
  return v8 & 1;
}

@end