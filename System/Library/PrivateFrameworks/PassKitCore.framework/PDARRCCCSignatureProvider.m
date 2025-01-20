@interface PDARRCCCSignatureProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd25PDARRCCCSignatureProvider)init;
- (_TtC5passd25PDARRCCCSignatureProvider)initWithWebServiceCoordinator:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationFailed:(id)a3 forRequirement:(id)a4 context:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRCCCSignatureProvider

- (_TtC5passd25PDARRCCCSignatureProvider)initWithWebServiceCoordinator:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = objc_allocWithZone((Class)PKDAManager);
  v7 = (objc_class *)a3;
  v8 = self;
  result = (_TtC5passd25PDARRCCCSignatureProvider *)[v6 init];
  if (result)
  {
    *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC5passd25PDARRCCCSignatureProvider_daManager) = (Class)result;
    *(Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC5passd25PDARRCCCSignatureProvider_webServiceCoordinator) = v7;
    v10 = v7;

    v12.receiver = v8;
    v12.super_class = ObjectType;
    v11 = [(PDARRCCCSignatureProvider *)&v12 init];

    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC5passd25PDARRCCCSignatureProvider)init
{
  result = (_TtC5passd25PDARRCCCSignatureProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd25PDARRCCCSignatureProvider_daManager);
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)requirementRegistrationFailed:(id)a3 forRequirement:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1004E30C8(v10);
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  objc_super v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  sub_1004E3530(v13, v16, (uint64_t)v17, (void (**)(void, void))v12);
  _Block_release(v12);
  _Block_release(v12);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  sub_1004CA0A4(&qword_100807D10);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1005B4130;
  id v8 = objc_allocWithZone((Class)PDAuxiliaryRegistrationRequirementReference);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  *(void *)(v7 + 32) = [v8 initWithDecryptionType:5];
  specialized Array._endMutation()();

  sub_1004DE1C0(0, &qword_100807FC0);
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v12.super.isa;
}

@end