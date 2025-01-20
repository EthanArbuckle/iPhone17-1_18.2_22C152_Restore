@interface CarKeyProvisioningUICoordinator
- (_TtC9PassKitUI31CarKeyProvisioningUICoordinator)init;
- (void)dealloc;
@end

@implementation CarKeyProvisioningUICoordinator

- (void)dealloc
{
  v2 = self;
  sub_19F706B0C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CarKeyProvisioningUICoordinator();
  [(CarKeyProvisioningUICoordinator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_delegate);
  swift_unknownObjectWeakDestroy();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_renderer);
  swift_release();
  swift_release();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_provisioningError));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_provisionedPasses));
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9PassKitUI31CarKeyProvisioningUICoordinator_idleTimerAssertion);
}

- (_TtC9PassKitUI31CarKeyProvisioningUICoordinator)init
{
  result = (_TtC9PassKitUI31CarKeyProvisioningUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end