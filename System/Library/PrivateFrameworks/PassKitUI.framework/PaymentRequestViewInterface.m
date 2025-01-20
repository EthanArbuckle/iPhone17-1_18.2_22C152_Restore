@interface PaymentRequestViewInterface
- (UIViewController)viewController;
- (_TtC9PassKitUI27PaymentRequestViewInterface)init;
- (id)serviceDelegate;
- (void)invalidate;
- (void)setServiceDelegate:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PaymentRequestViewInterface

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_viewController));
}

- (id)serviceDelegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();

  return v2;
}

- (void)setServiceDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_serviceDelegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)start
{
}

- (void)stop
{
}

- (void)invalidate
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_stateMachine);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);
}

- (_TtC9PassKitUI27PaymentRequestViewInterface)init
{
  result = (_TtC9PassKitUI27PaymentRequestViewInterface *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_presenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9PassKitUI27PaymentRequestViewInterface_stateMachine);

  swift_release();
}

@end