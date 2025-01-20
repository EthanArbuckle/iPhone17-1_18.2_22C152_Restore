@interface MigrationViewController
- (BOOL)isModalInPresentation;
- (_TtC23ShelfKitCollectionViews23MigrationViewController)init;
- (_TtC23ShelfKitCollectionViews23MigrationViewController)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23MigrationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MigrationViewController

- (_TtC23ShelfKitCollectionViews23MigrationViewController)init
{
  return (_TtC23ShelfKitCollectionViews23MigrationViewController *)sub_336A9C();
}

- (_TtC23ShelfKitCollectionViews23MigrationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_337A4C();
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_336D00();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_3374D8(a3);
}

- (_TtC23ShelfKitCollectionViews23MigrationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ShelfKitCollectionViews23MigrationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_messageLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews23MigrationViewController_deferredBlock);

  sub_27760(v3);
}

@end