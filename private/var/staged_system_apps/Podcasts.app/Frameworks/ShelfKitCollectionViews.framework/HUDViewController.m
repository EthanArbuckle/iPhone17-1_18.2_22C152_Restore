@interface HUDViewController
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (_TtC23ShelfKitCollectionViews17HUDViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17HUDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUDViewController

- (UILabel)primaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel));
}

- (void)setPrimaryLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel) = (Class)a3;
  id v3 = a3;
}

- (UILabel)secondaryLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel));
}

- (void)setSecondaryLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC23ShelfKitCollectionViews17HUDViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s23ShelfKitCollectionViews17HUDViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_14ABE0();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_14B80C(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_14BC48();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_14D184((uint64_t)a3);
}

- (_TtC23ShelfKitCollectionViews17HUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews17HUDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_14DCD8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type), *(void *)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type], *(void *)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type + 8], *(void *)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type + 16], *(void **)&self->type[OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_type + 24]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController_presentationWindow));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17HUDViewController____lazy_storage___HUDView);
}

@end