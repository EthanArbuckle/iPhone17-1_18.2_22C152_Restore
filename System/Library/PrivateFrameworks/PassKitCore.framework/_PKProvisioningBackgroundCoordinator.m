@interface _PKProvisioningBackgroundCoordinator
- (_PKProvisioningBackgroundCoordinator)init;
- (_PKProvisioningBackgroundCoordinator)initWithPkContext:(id)a3 credential:(id)a4 previouslyAcceptedTerms:(BOOL)a5;
- (id)archivedState;
- (void)cancel;
- (void)cleanUpArchivedProvisioningAndInvalidateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)startWithCompletion:(id)a3;
@end

@implementation _PKProvisioningBackgroundCoordinator

- (_PKProvisioningBackgroundCoordinator)initWithPkContext:(id)a3 credential:(id)a4 previouslyAcceptedTerms:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = _s11PassKitCore19ProvisioningContextC02pkE0ACSo014PKProvisioningE0C_tcfC_0(v7);
  id v10 = objc_allocWithZone((Class)type metadata accessor for ProvisioningBackgroundCoordinator());
  v11 = (_PKProvisioningBackgroundCoordinator *)sub_190F2FC1C((uint64_t)v9, v8, a5);

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (void)dealloc
{
  v2 = self;
  sub_190F2C0DC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningBackgroundCoordinator();
  [(_PKProvisioningBackgroundCoordinator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____PKProvisioningBackgroundCoordinator_completion));
  sub_190EF6480(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____PKProvisioningBackgroundCoordinator_preflightCompletion));
  sub_190EDFF34((uint64_t)self + OBJC_IVAR____PKProvisioningBackgroundCoordinator_composer, &qword_1E92BC938);

  swift_bridgeObjectRelease();
}

- (void)startWithCompletion:(id)a3
{
}

- (void)cancel
{
  v2 = self;
  sub_190F2B44C();
}

- (id)archivedState
{
  v2 = self;
  objc_super v3 = (void *)sub_190F2B5A4();

  return v3;
}

- (void)invalidate
{
  v2 = self;
  sub_190F2C0DC();
}

- (void)cleanUpArchivedProvisioningAndInvalidateWithCompletion:(id)a3
{
}

- (_PKProvisioningBackgroundCoordinator)init
{
  result = (_PKProvisioningBackgroundCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end