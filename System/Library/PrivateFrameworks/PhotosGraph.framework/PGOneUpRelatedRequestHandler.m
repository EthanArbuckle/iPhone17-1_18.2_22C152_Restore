@interface PGOneUpRelatedRequestHandler
- (PGOneUpRelatedRequestHandler)init;
- (PGOneUpRelatedRequestHandler)initWithGraphManager:(id)a3 error:(id *)a4;
- (void)requestAssetLocalIdentifiersTakenNearCoordinatesFromAssetLocalIdentifier:(NSString *)a3 error:(id)a4;
- (void)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(NSString *)a3 error:(id)a4;
@end

@implementation PGOneUpRelatedRequestHandler

- (PGOneUpRelatedRequestHandler)initWithGraphManager:(id)a3 error:(id *)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGOneUpRelatedRequestHandler__graphManager) = 0;
  id v7 = a3;
  v8 = self;
  v9 = (objc_class *)objc_msgSend(v7, sel_photoLibrary);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___PGOneUpRelatedRequestHandler_photoLibrary) = v9;

  v12.receiver = v8;
  v12.super_class = ObjectType;
  v10 = [(PGOneUpRelatedRequestHandler *)&v12 init];

  return v10;
}

- (void)requestAssetLocalIdentifiersTakenNearCoordinatesFromAssetLocalIdentifier:(NSString *)a3 error:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD48170);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D1EBE350();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA65AB78;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA65AB80;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1D1A948C4((uint64_t)v9, (uint64_t)&unk_1EA65AB88, (uint64_t)v14);
  swift_release();
}

- (void)requestAssetLocalIdentifiersWithSceneOverlapFromAssetLocalIdentifier:(NSString *)a3 error:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD48170);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1D1EBE350();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA65AB58;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA65AB60;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1D1A948C4((uint64_t)v9, (uint64_t)&unk_1EA65CC50, (uint64_t)v14);
  swift_release();
}

- (PGOneUpRelatedRequestHandler)init
{
  result = (PGOneUpRelatedRequestHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end