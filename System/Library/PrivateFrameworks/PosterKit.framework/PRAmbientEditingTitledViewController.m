@interface PRAmbientEditingTitledViewController
- (PRAmbientEditingTitledViewController)initWithCoder:(id)a3;
- (PRAmbientEditingTitledViewController)initWithContentViewController:(id)a3;
- (PRAmbientEditingTitledViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PRAmbientEditingTitledViewControllerDelegate)delegate;
- (id)accessibilityTitleLabel;
- (void)loadView;
- (void)setDelegate:(id)a3;
@end

@implementation PRAmbientEditingTitledViewController

- (PRAmbientEditingTitledViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192F91D20](v2);
  return (PRAmbientEditingTitledViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (PRAmbientEditingTitledViewController)initWithContentViewController:(id)a3
{
  return (PRAmbientEditingTitledViewController *)AmbientEditingTitledViewController.init(contentViewController:)(a3);
}

- (PRAmbientEditingTitledViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  sub_18C29B910(0, &qword_1EB67E220);
  id v5 = a3;
  sub_18C2CAAE0();
  sub_18C29B910(0, &qword_1EB67E248);
  sub_18C2CAAE0();

  result = (PRAmbientEditingTitledViewController *)sub_18C2CAC50();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  AmbientEditingTitledViewController.loadView()();
}

- (id)accessibilityTitleLabel
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_18C2CAAC0();

  swift_release();
  swift_release();
  return v5;
}

- (PRAmbientEditingTitledViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PRAmbientEditingTitledViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PRAmbientEditingTitledViewController_contentViewController));
  sub_18C29BBE4((uint64_t)self + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate);
  v3 = (char *)self + OBJC_IVAR___PRAmbientEditingTitledViewController__titleLabel;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170578);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR___PRAmbientEditingTitledViewController__closeButton;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9170580);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end