@interface PDARRCoreIDCredAccountKeyProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)init;
- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)initWithIso18013Manager:(id)a3;
- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRCoreIDCredAccountKeyProvider

- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)initWithIso18013Manager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd33PDARRCoreIDCredAccountKeyProvider_iso18013Manager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(PDARRCoreIDCredAccountKeyProvider *)&v8 init];
}

- (_TtC5passd33PDARRCoreIDCredAccountKeyProvider)init
{
  result = (_TtC5passd33PDARRCoreIDCredAccountKeyProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd33PDARRCoreIDCredAccountKeyProvider_iso18013Manager));
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void (*)(void *, void))v12[2];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  v13(v12, 0);
  _Block_release(v12);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_100509520(v10, (uint64_t)v11, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
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
  objc_super v8 = _Block_copy(a5);
  id v9 = (void (*)(void *, void, void))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 0, 0);
  _Block_release(v8);
}

- (id)associatedRequirementsForRequirement:(id)a3 context:(id)a4
{
  sub_1004CA0A4(&qword_100807D10);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1005B4710;
  id v8 = objc_allocWithZone((Class)PDAuxiliaryRegistrationRequirementReference);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  *(void *)(v7 + 32) = [v8 initWithSignatureType:5];
  *(void *)(v7 + 40) = [objc_allocWithZone((Class)PDAuxiliaryRegistrationRequirementReference) initWithDecryptionType:1];
  specialized Array._endMutation()();

  sub_1004DE1C0(0, &qword_100807FC0);
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v12.super.isa;
}

@end