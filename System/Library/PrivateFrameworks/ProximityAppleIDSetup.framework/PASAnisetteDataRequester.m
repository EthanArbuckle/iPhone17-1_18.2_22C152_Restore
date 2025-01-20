@interface PASAnisetteDataRequester
- (_TtC21ProximityAppleIDSetup24PASAnisetteDataRequester)init;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(NSURLRequest *)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(NSString *)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)syncAnisetteWithSIMData:(NSData *)a3 completion:(id)a4;
@end

@implementation PASAnisetteDataRequester

- (void)provisionAnisetteWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684E5DB0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_22CC9EE18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2684E5E80;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2684E5E88;
  v12[5] = v11;
  swift_retain();
  sub_22CC5ADCC((uint64_t)v7, (uint64_t)&unk_2684E5E90, (uint64_t)v12);
  swift_release();
}

- (void)syncAnisetteWithSIMData:(NSData *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684E5DB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22CC9EE18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2684E5E60;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2684E5E68;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_22CC5ADCC((uint64_t)v9, (uint64_t)&unk_2684E5E70, (uint64_t)v14);
  swift_release();
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684E5DB0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_22CC9EE18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2684E5E40;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2684E5E48;
  v12[5] = v11;
  swift_retain();
  sub_22CC5ADCC((uint64_t)v7, (uint64_t)&unk_2684E5E50, (uint64_t)v12);
  swift_release();
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684E5DB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_22CC9EE18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2684E5E20;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2684E5E28;
  v14[5] = v13;
  swift_retain();
  sub_22CC5ADCC((uint64_t)v9, (uint64_t)&unk_2684E5E30, (uint64_t)v14);
  swift_release();
}

- (void)legacyAnisetteDataForDSID:(NSString *)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684E5DB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22CC9EE18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2684E5E00;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2684E5E08;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_22CC5ADCC((uint64_t)v9, (uint64_t)&unk_2684E5E10, (uint64_t)v14);
  swift_release();
}

- (void)fetchPeerAttestationDataForRequest:(NSURLRequest *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2684E5DB0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_22CC9EE18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2684E5DC0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2684E5DD0;
  v14[5] = v13;
  uint64_t v15 = a3;
  swift_retain();
  sub_22CC5ADCC((uint64_t)v9, (uint64_t)&unk_2684E5DE0, (uint64_t)v14);
  swift_release();
}

- (_TtC21ProximityAppleIDSetup24PASAnisetteDataRequester)init
{
  swift_defaultActor_initialize();
  result = (_TtC21ProximityAppleIDSetup24PASAnisetteDataRequester *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end