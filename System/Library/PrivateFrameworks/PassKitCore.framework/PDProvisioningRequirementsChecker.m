@interface PDProvisioningRequirementsChecker
- (PDProvisioningRequirementsChecker)init;
- (PDProvisioningRequirementsChecker)initWithWebService:(id)a3 cloudStoreCoordinator:(id)a4;
- (void)meetsWithRequirementsContainer:(id)a3 completion:(id)a4;
@end

@implementation PDProvisioningRequirementsChecker

- (PDProvisioningRequirementsChecker)initWithWebService:(id)a3 cloudStoreCoordinator:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDProvisioningRequirementsChecker_webService) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDProvisioningRequirementsChecker_cloudStoreCoordinator) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ProvisioningRequirementsChecker();
  id v6 = a3;
  id v7 = a4;
  return [(PDProvisioningRequirementsChecker *)&v9 init];
}

- (void)meetsWithRequirementsContainer:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  objc_super v9 = self;
  id v10 = [v8 provisioningSID];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v14 = v13;
  }
  else
  {
    uint64_t v12 = 0;
    unint64_t v14 = 0xE000000000000000;
  }
  uint64_t v15 = PKProvisioningRequirementsContainer.requirements.getter();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_1004F7EE8;
  *(void *)(v16 + 24) = v7;
  swift_retain();
  ProvisioningRequirementsChecker.meets(requirements:sid:completion:)(v15, v12, v14, (uint64_t)sub_1004F8E30, v16);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (PDProvisioningRequirementsChecker)init
{
  result = (PDProvisioningRequirementsChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDProvisioningRequirementsChecker_cloudStoreCoordinator);
}

@end