@interface SLPersonIdentityGenerator
- (SLPersonIdentityGenerator)init;
- (SLPersonIdentityGenerator)initWithQueue:(id)a3;
- (void)generateLocalIdentityForDocumentIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)generatePersonIdentitiesForHandles:(NSArray *)a3 documentIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)generateProofForIdentity:(SWPersonIdentity *)a3 documentIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (void)signData:(NSData *)a3 documentIdentifier:(NSString *)a4 trackingPreventionSalt:(NSData *)a5 completionHandler:(id)a6;
@end

@implementation SLPersonIdentityGenerator

- (SLPersonIdentityGenerator)initWithQueue:(id)a3
{
  return (SLPersonIdentityGenerator *)PersonIdentityGenerator.init(queue:)(a3);
}

- (void)generatePersonIdentitiesForHandles:(NSArray *)a3 documentIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in PersonIdentityGenerator.generatePersonIdentitiesForHandles(handles:documentIdentifier:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_71Tu;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_76Tu, (uint64_t)v16);
  swift_release();
}

- (void)generateLocalIdentityForDocumentIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in PersonIdentityGenerator.generateLocalIdentity(documentIdentifier:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_56Tu;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_61Tu, (uint64_t)v14);
  swift_release();
}

- (void)generateProofForIdentity:(SWPersonIdentity *)a3 documentIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &async function pointer to partial apply for @objc closure #1 in PersonIdentityGenerator.generateProofForIdentity(_:documentIdentifier:);
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &_sIeghH_IeAgH_TRTA_41Tu;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v11, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_46Tu, (uint64_t)v16);
  swift_release();
}

- (void)signData:(NSData *)a3 documentIdentifier:(NSString *)a4 trackingPreventionSalt:(NSData *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &async function pointer to partial apply for @objc closure #1 in PersonIdentityGenerator.signData(data:documentIdentifier:trackingPreventionSalt:);
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &_sIeghH_IeAgH_TRTATu;
  v18[5] = v17;
  v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v13, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v18);
  swift_release();
}

- (SLPersonIdentityGenerator)init
{
  result = (SLPersonIdentityGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SLPersonIdentityGenerator_keyQueryController);
}

@end