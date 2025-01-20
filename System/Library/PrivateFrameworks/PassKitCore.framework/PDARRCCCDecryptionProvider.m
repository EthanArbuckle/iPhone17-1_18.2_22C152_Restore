@interface PDARRCCCDecryptionProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd26PDARRCCCDecryptionProvider)init;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationFailed:(id)a3 forRequirement:(id)a4 context:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRCCCDecryptionProvider

- (_TtC5passd26PDARRCCCDecryptionProvider)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = objc_allocWithZone((Class)PKDAManager);
  v5 = self;
  result = (_TtC5passd26PDARRCCCDecryptionProvider *)[v4 init];
  if (result)
  {
    *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5passd26PDARRCCCDecryptionProvider_daManager) = (Class)result;

    v7.receiver = v5;
    v7.super_class = ObjectType;
    return [(PDARRCCCDecryptionProvider *)&v7 init];
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
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
  sub_1004FA8C8(v10);
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  _Block_copy(v12);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  sub_1004FAD34(v13, v16, (uint64_t)v17, (void (**)(void, void))v12);
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

@end