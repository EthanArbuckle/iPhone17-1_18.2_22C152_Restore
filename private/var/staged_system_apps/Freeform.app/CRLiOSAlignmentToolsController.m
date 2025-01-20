@interface CRLiOSAlignmentToolsController
- (UIViewController)viewController;
- (_TtC8Freeform30CRLiOSAlignmentToolsController)init;
- (_TtC8Freeform30CRLiOSAlignmentToolsController)initWithDelegate:(id)a3;
- (void)dismissAlignmentTools;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation CRLiOSAlignmentToolsController

- (_TtC8Freeform30CRLiOSAlignmentToolsController)initWithDelegate:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLiOSAlignmentToolsController();
  return [(CRLiOSAlignmentToolsController *)&v5 init];
}

- (UIViewController)viewController
{
  v2 = self;
  id v3 = sub_1006A5024();

  return (UIViewController *)v3;
}

- (void)setViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController) = (Class)a3;
  id v3 = a3;
}

- (void)dismissAlignmentTools
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    objc_super v5 = self;
    [v4 alignmentToolsControllerShouldDismiss:v5];

    swift_unknownObjectRelease();
  }
}

- (_TtC8Freeform30CRLiOSAlignmentToolsController)init
{
  result = (_TtC8Freeform30CRLiOSAlignmentToolsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController_delegate);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform30CRLiOSAlignmentToolsController____lazy_storage___viewController);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v6 = (void *)Strong;
    id v7 = a3;
    v8 = self;
    [v6 userDismissedAlignmentToolsController:v8];

    swift_unknownObjectRelease();
  }
}

@end