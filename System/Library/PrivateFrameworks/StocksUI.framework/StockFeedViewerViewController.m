@interface StockFeedViewerViewController
- (_TtC8StocksUI29StockFeedViewerViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI29StockFeedViewerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didMoveToParentViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation StockFeedViewerViewController

- (_TtC8StocksUI29StockFeedViewerViewController)initWithCoder:(id)a3
{
  result = (_TtC8StocksUI29StockFeedViewerViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI29StockFeedViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI29StockFeedViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_blueprintPageViewController));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_shareMenuItemManager;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A4CD654();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(StockFeedViewerViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_blueprintPageViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
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

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_20A4CDB40(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v6.receiver;
  [(StockFeedViewerViewController *)&v6 viewDidAppear:v3];
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_shareMenuItemManager], *(void *)&v4[OBJC_IVAR____TtC8StocksUI29StockFeedViewerViewController_shareMenuItemManager + 24]);
  if (qword_26AC6AC70 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_20A8CB920();
  __swift_project_value_buffer(v5, (uint64_t)qword_26AC9E8E8);
  sub_20A8CA030();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_20A4CDDA8(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(StockFeedViewerViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_20A4CD754((uint64_t)v6);
}

- (void)didMoveToParentViewController:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_20A4CDFA4((uint64_t)a3);
}

@end