@interface _PKProvisioningWatchUICoordinator
- (PKProvisioningWatchUICoordinatorDelegate)delegate;
- (_PKProvisioningWatchUICoordinator)init;
- (_PKProvisioningWatchUICoordinator)initWithManualEntrySetupContext:(int64_t)a3 provisioningController:(id)a4 skipRequirements:(BOOL)a5;
- (_PKProvisioningWatchUICoordinator)initWithSetupContext:(int64_t)a3 provisioningController:(id)a4 credential:(id)a5;
- (void)cancel;
- (void)continueWithFieldsModel:(id)a3;
- (void)dealloc;
- (void)preflightWithFieldModel:(id)a3 completion:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation _PKProvisioningWatchUICoordinator

- (PKProvisioningWatchUICoordinatorDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____PKProvisioningWatchUICoordinator_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1A6224F80](v2);

  return (PKProvisioningWatchUICoordinatorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_PKProvisioningWatchUICoordinator)initWithSetupContext:(int64_t)a3 provisioningController:(id)a4 credential:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = (_PKProvisioningWatchUICoordinator *)sub_19F7F7F40(a3, v7, v8);

  return v9;
}

- (_PKProvisioningWatchUICoordinator)initWithManualEntrySetupContext:(int64_t)a3 provisioningController:(id)a4 skipRequirements:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = (_PKProvisioningWatchUICoordinator *)sub_19F7F8314(a3, v7, v5);

  return v8;
}

- (void)dealloc
{
  v2 = self;
  sub_19F7F3FD4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningWatchUICoordinator();
  [(_PKProvisioningWatchUICoordinator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____PKProvisioningWatchUICoordinator_delegate);
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)continueWithFieldsModel:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_19F7F2FF8(v4);
}

- (void)preflightWithFieldModel:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_19F7F3100(v8, (uint64_t)sub_19F5789D8, v7);

  swift_release();
}

- (void)reset
{
  v2 = self;
  sub_19F7F35DC();
}

- (void)cancel
{
  v2 = self;
  sub_19F7F492C();
}

- (_PKProvisioningWatchUICoordinator)init
{
  result = (_PKProvisioningWatchUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end