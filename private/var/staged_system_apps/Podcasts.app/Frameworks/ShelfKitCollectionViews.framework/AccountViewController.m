@interface AccountViewController
- (_TtC23ShelfKitCollectionViews21AccountViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21AccountViewController)initWithCollectionViewLayout:(id)a3;
- (void)tappedDoneButton;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AccountViewController

- (_TtC23ShelfKitCollectionViews21AccountViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_32D2F4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_32B534();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_32BB54((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_32BD54((uint64_t)a3);
}

- (void)tappedDoneButton
{
}

- (_TtC23ShelfKitCollectionViews21AccountViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC23ShelfKitCollectionViews21AccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_accountCollectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_accountCollectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_accountCollectionViewDelegate));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21AccountViewController_activityIndicator);
}

@end