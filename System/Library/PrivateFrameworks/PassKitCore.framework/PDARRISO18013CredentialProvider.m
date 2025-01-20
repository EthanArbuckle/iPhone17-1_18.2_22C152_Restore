@interface PDARRISO18013CredentialProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd31PDARRISO18013CredentialProvider)init;
- (_TtC5passd31PDARRISO18013CredentialProvider)initWithIso18013Manager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRISO18013CredentialProvider

- (_TtC5passd31PDARRISO18013CredentialProvider)initWithIso18013Manager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd31PDARRISO18013CredentialProvider_iso18013Manager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(PDARRISO18013CredentialProvider *)&v8 init];
}

- (_TtC5passd31PDARRISO18013CredentialProvider)init
{
  result = (_TtC5passd31PDARRISO18013CredentialProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd31PDARRISO18013CredentialProvider_iso18013Manager);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1004DFD70;
  *(void *)(v11 + 24) = v9;
  v16[4] = sub_1004E06A4;
  v16[5] = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_1004E02E0;
  v16[3] = &unk_1007575D0;
  v12 = _Block_copy(v16);
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  swift_retain();
  swift_release();
  [v10 createISOCredentialIdentifierForIdentityPartitionWithCompletion:v12];
  _Block_release(v12);

  swift_release();
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  id v13 = (void (*)(void *, void))v12[2];
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
  uint64_t v9 = (void (*)(void *, uint64_t))v8[2];
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  v9(v8, 1);
  _Block_release(v8);
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
}

@end