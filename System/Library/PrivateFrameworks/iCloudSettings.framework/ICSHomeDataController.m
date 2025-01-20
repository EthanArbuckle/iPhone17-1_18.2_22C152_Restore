@interface ICSHomeDataController
- (ICSHomeDataController)init;
- (ICSHomeDataController)initWithAccount:(id)a3;
- (ICSHomeDataController)initWithAccount:(id)a3 launchedFromRootLevel:(BOOL)a4;
- (id)cachediCloudHomeDataModel;
- (void)fetchCloudStorage:(BOOL)a3 completion:(id)a4;
- (void)fetchCloudStorageInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchiCloudHomeDataModelAllowingCache:(BOOL)a3 completion:(id)a4;
- (void)reportStatefulHeaderImpressionWithUrl:(id)a3 payload:(id)a4;
@end

@implementation ICSHomeDataController

- (ICSHomeDataController)initWithAccount:(id)a3
{
  return [(ICSHomeDataController *)self initWithAccount:a3 launchedFromRootLevel:1];
}

- (ICSHomeDataController)initWithAccount:(id)a3 launchedFromRootLevel:(BOOL)a4
{
  id v5 = a3;
  v6 = (ICSHomeDataController *)sub_262A7FB38(v5, a4);

  return v6;
}

- (void)fetchiCloudHomeDataModelAllowingCache:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A9870B0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A9870B8;
  v14[5] = v13;
  v15 = self;
  sub_262A7F994((uint64_t)v9, (uint64_t)&unk_26A9870C0, (uint64_t)v14);
  swift_release();
}

- (void)fetchCloudStorage:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26A987080;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26A985018;
  v14[5] = v13;
  v15 = self;
  sub_262A7F994((uint64_t)v9, (uint64_t)&unk_26A985020, (uint64_t)v14);
  swift_release();
}

- (id)cachediCloudHomeDataModel
{
  uint64_t v2 = qword_26B422A08;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  id result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&v3->super.isa
                                                                 + OBJC_IVAR___ICSHomeDataController_account), sel_aa_altDSID));
  if (result)
  {
    id v5 = result;
    uint64_t v6 = sub_262B04488();
    uint64_t v8 = v7;

    v9 = sub_262A0CBA0(v6, v8);
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)fetchCloudStorageInfo:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    v10 = sub_262A806D4;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = 0;
  *(void *)(v13 + 32) = self;
  *(unsigned char *)(v13 + 40) = a3;
  *(void *)(v13 + 48) = v10;
  *(void *)(v13 + 56) = v11;
  v14 = self;
  sub_262A7FE04((uint64_t)v10);
  sub_2629DC6C8((uint64_t)v9, (uint64_t)&unk_26A987070, v13);
  swift_release();
  sub_262A185E8((uint64_t)v10);
}

- (void)reportStatefulHeaderImpressionWithUrl:(id)a3 payload:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_262B02A38();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v22 - v13;
  sub_262B029F8();
  uint64_t v15 = sub_262B04408();
  uint64_t v16 = self;
  sub_262B04658();
  uint64_t v17 = sub_262B04698();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 0, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v19 = (v10 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  *((void *)v20 + 4) = v16;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v20[v18], v12, v8);
  *(void *)&v20[v19] = v15;
  v21 = v16;
  swift_bridgeObjectRetain();
  sub_2629DC6C8((uint64_t)v7, (uint64_t)&unk_26A987068, (uint64_t)v20);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
}

- (ICSHomeDataController)init
{
  id result = (ICSHomeDataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end