@interface ModelViewOverflowViewController
- (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissAnimated;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ModelViewOverflowViewController

- (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController)initWithCoder:(id)a3
{
  result = (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *)sub_385890();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_12AD5C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_12AF8C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ModelViewOverflowViewController();
  v4 = (char *)v5.receiver;
  [(ModelViewOverflowViewController *)&v5 viewWillDisappear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_scrollView] setContentOffset:0 animated:0.0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_12B314(a3);
}

- (void)dismissAnimated
{
}

- (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews31ModelViewOverflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_model);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_modelView));
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews31ModelViewOverflowViewController_preflightHandler);

  sub_27760(v3);
}

@end