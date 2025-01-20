@interface WelcomeViewController
- (_TtC9SeymourUI21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9SeymourUI21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapContinueButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WelcomeViewController

- (void)viewDidLoad
{
  v2 = self;
  WelcomeViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_23A7FEE28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = self;
  sub_23A7FE8E8();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v11.receiver = v10;
  v11.super_class = ObjectType;
  [(OBBaseWelcomeController *)&v11 viewDidAppear:v3];
}

- (void)didTapContinueButton
{
  v2 = self;
  sub_23A45E790();
}

- (_TtC9SeymourUI21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9SeymourUI21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI21WelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9SeymourUI21WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_dismissHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_privacyPreferenceClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_storefrontLocalizer);
  sub_239C1E4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_version), *(void *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_version), *((unsigned char *)&self->super.super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_version));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_sheet;
  uint64_t v4 = sub_23A7F6BE8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI21WelcomeViewController_metricPage;
  uint64_t v6 = sub_23A7F6C38();
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end