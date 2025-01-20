@interface ManageWatchlistsViewController
- (_TtC8StocksUI30ManageWatchlistsViewController)initWithCoder:(id)a3;
- (_TtC8StocksUI30ManageWatchlistsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)handleDone;
- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ManageWatchlistsViewController

- (_TtC8StocksUI30ManageWatchlistsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_descriptionLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8StocksUI30ManageWatchlistsViewController *)sub_20A8CF520();
  __break(1u);
  return result;
}

- (_TtC8StocksUI30ManageWatchlistsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI30ManageWatchlistsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_blueprintViewController));
  sub_20A692DE8((uint64_t)self + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_contentMode, type metadata accessor for ManageWatchlistsContentMode);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI30ManageWatchlistsViewController_descriptionLabel);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A690C00();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_20A6916D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ManageWatchlistsViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_20A693010();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v6 = v10.receiver;
  [(ManageWatchlistsViewController *)&v10 setEditing:v5 animated:v4];
  sub_20A8C9BE0();
  sub_20A8C9BF0();
  objc_super v7 = (void *)sub_20A8C94C0();
  swift_release();
  uint64_t v8 = v5 ^ 1;
  objc_msgSend(v7, sel_setDragInteractionEnabled_, v8, v10.receiver, v10.super_class);

  sub_20A8C9BF0();
  v9 = (void *)sub_20A8C94C0();
  swift_release();
  objc_msgSend(v9, sel_setAllowsMultipleSelection_, v8);
}

- (void)handleDone
{
  BOOL v5 = self;
  v2 = (_TtC8StocksUI30ManageWatchlistsViewController *)[(ManageWatchlistsViewController *)v5 navigationController];
  if (v2)
  {
    v3 = v2;
    [(ManageWatchlistsViewController *)v2 dismissViewControllerAnimated:1 completion:0];

    BOOL v4 = v3;
  }
  else
  {
    BOOL v4 = v5;
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  int64_t v9 = sub_20A693208(v6, v7);

  return v9;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    sub_20A45F33C();
    uint64_t v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_20A8D5CA0;
    objc_super v10 = self;
    id v14 = a4;
    id v11 = a3;
    v12 = self;
    *(void *)(v9 + 32) = objc_msgSend(v10, sel_largeDetent);
    sub_20A8CE620();
    sub_20A692FD0();
    v13 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setDetents_, v13);

    objc_msgSend(v8, sel_setPrefersEdgeAttachedInCompactHeight_, 0);
  }
}

@end