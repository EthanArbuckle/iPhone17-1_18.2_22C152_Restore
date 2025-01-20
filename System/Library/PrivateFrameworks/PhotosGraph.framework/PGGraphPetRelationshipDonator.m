@interface PGGraphPetRelationshipDonator
- (PGGraphPetRelationshipDonator)init;
- (void)donateWithPetNodes:(NSArray *)a3 isRebuild:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation PGGraphPetRelationshipDonator

- (void)donateWithPetNodes:(NSArray *)a3 isRebuild:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD48170);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_1D1EBE350();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA65CAD0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA65AB60;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_1D1A948C4((uint64_t)v11, (uint64_t)&unk_1EA65CC50, (uint64_t)v16);
  swift_release();
}

- (PGGraphPetRelationshipDonator)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PGGraphPetRelationshipDonator_sourceIdentifier);
  void *v4 = 0xD000000000000018;
  v4[1] = 0x80000001D1EF6B10;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(PGGraphPetRelationshipDonator *)&v6 init];
}

- (void).cxx_destruct
{
}

@end