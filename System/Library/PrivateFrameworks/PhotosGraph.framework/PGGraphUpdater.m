@interface PGGraphUpdater
- (PGGraphUpdater)init;
- (PGGraphUpdater)initWith:(id)a3;
- (void)applyChangesFrom:(PGGraphUpdate *)a3 progressReporter:(MAProgressReporter *)a4 completionHandler:(id)a5;
@end

@implementation PGGraphUpdater

- (PGGraphUpdater)initWith:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PGGraphUpdater_graphManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(PGGraphUpdater *)&v8 init];
}

- (void)applyChangesFrom:(PGGraphUpdate *)a3 progressReporter:(MAProgressReporter *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD48170);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1D1EBE350();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA65CC40;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA65AB60;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1D1A948C4((uint64_t)v11, (uint64_t)&unk_1EA65CC50, (uint64_t)v16);
  swift_release();
}

- (PGGraphUpdater)init
{
  result = (PGGraphUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end