@interface StockSearchViewController
- (UISplitViewController)splitViewController;
- (_TtC8StocksUI25StockSearchViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI25StockSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didPresentSearchController:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation StockSearchViewController

- (_TtC8StocksUI25StockSearchViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI25StockSearchViewController_searchAction;
  sub_20A45A1DC();
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  v9 = (char *)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_stockSearchMode;
  uint64_t v10 = sub_20A8C40E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  swift_unknownObjectWeakInit();

  result = (_TtC8StocksUI25StockSearchViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI25StockSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI25StockSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A4380C4((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_searchAction));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_keyboardInputMonitor);
  swift_release();
  sub_20A56252C((uint64_t)self + OBJC_IVAR____TtC8StocksUI25StockSearchViewController_stockSearchMode, type metadata accessor for StockSearchMode);

  swift_unknownObjectWeakDestroy();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A55EF88();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(StockSearchViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI25StockSearchViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      Class v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(StockSearchViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_20A55F2B4((uint64_t)v6);
}

- (UISplitViewController)splitViewController
{
  v2 = self;
  id v3 = [(StockSearchViewController *)v2 presentingViewController];
  id v4 = objc_msgSend(v3, sel_splitViewController);

  return (UISplitViewController *)v4;
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A56278C();
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  id v6 = self;
  MEMORY[0x210523820]();
  sub_20A8C9BF0();
  id v8 = (id)sub_20A8C94C0();
  swift_release();
  objc_msgSend(v8, sel_adjustedContentInset);
  objc_msgSend(v8, sel_setContentOffset_animated_, 0, 0.0, -v7);
  [(StockSearchViewController *)v6 setContentScrollView:v8 forEdge:15];
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  uint64_t v5 = type metadata accessor for StockSearchMode(0);
  MEMORY[0x270FA5388](v5 - 8);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_20A8C40E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;
  double v10 = self;
  sub_20A55F70C((uint64_t)v7);
  sub_20A56252C((uint64_t)v7, type metadata accessor for StockSearchMode);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_20A56290C();
}

@end