@interface PuzzleSettingsViewController
- (_TtC7NewsUI228PuzzleSettingsViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI228PuzzleSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PuzzleSettingsViewController

- (_TtC7NewsUI228PuzzleSettingsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___collectionView) = 0;
  id v4 = a3;

  result = (_TtC7NewsUI228PuzzleSettingsViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI228PuzzleSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI228PuzzleSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController_styler);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___dataSource));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI228PuzzleSettingsViewController____lazy_storage___collectionView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFDC5048();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(PuzzleSettingsViewController *)&v4 viewDidAppear:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1DFDC5A64((uint64_t)a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DFBFB758();
}

@end