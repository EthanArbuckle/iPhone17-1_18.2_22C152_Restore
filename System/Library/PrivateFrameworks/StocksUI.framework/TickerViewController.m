@interface TickerViewController
- (_TtC8StocksUI20TickerViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI20TickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation TickerViewController

- (_TtC8StocksUI20TickerViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI20TickerViewController_autoScrolling) = 0;
  id v4 = a3;

  result = (_TtC8StocksUI20TickerViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI20TickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI20TickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI20TickerViewController_styler);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI20TickerViewController_blueprintViewController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A800F88();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(TickerViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8StocksUI20TickerViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TickerViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_20A801124((uint64_t)v6);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A8C9BF0();
  id v6 = (id)sub_20A8C94C0();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(unsigned char *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 0;
  sub_20A762830();
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20A8C9BF0();
  id v6 = (id)sub_20A8C94C0();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(unsigned char *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 1;
  sub_20A762830();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    objc_super v7 = self;
    sub_20A8C9BF0();
    id v8 = (id)sub_20A8C94C0();
    swift_release();
    type metadata accessor for TickerCollectionView();
    *(unsigned char *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 1;
    sub_20A762830();
  }
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_20A8C2B70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C2B10();
  id v10 = a3;
  double v11 = self;
  sub_20A8C9BF0();
  double v12 = (void *)sub_20A8C94C0();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(unsigned char *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 0;
  sub_20A762830();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_20A8C2B70();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  double v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C2B10();
  id v10 = a3;
  double v11 = self;
  sub_20A8C9BF0();
  double v12 = (void *)sub_20A8C94C0();
  swift_release();
  type metadata accessor for TickerCollectionView();
  *(unsigned char *)(swift_dynamicCastClassUnconditional() + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_autoScrolling) = 1;
  sub_20A762830();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end