@interface PDARRAliroSignatureProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd27PDARRAliroSignatureProvider)init;
- (_TtC5passd27PDARRAliroSignatureProvider)initWithSubcredentialManager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationFailed:(id)a3 forRequirement:(id)a4 context:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRAliroSignatureProvider

- (_TtC5passd27PDARRAliroSignatureProvider)initWithSubcredentialManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd27PDARRAliroSignatureProvider_subcredentialManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(PDARRAliroSignatureProvider *)&v8 init];
}

- (_TtC5passd27PDARRAliroSignatureProvider)init
{
  result = (_TtC5passd27PDARRAliroSignatureProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd27PDARRAliroSignatureProvider_subcredentialManager));
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
  sub_1004F1F00(v8);
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
  id v8 = (void (**)(void *, id, void))_Block_copy(a5);
  id v9 = objc_allocWithZone((Class)PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState);
  id v10 = a3;
  id v11 = a4;
  v13 = self;
  id v12 = [v9 initWithCapability:v10 currentVersion:0 targetVersion:0];
  v8[2](v8, v12, 0);

  _Block_release(v8);
}

@end