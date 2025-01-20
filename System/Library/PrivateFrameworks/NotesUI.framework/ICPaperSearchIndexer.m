@interface ICPaperSearchIndexer
+ (id)shared;
- (ICPaperSearchIndexer)init;
- (void)cancelEverythingWithCompletion:(id)a3;
- (void)needsToUpdateIndexWithManagedObjectContext:(NSManagedObjectContext *)a3 completionHandler:(id)a4;
- (void)updateIndexForAttachment:(NSManagedObjectID *)a3 userInitiated:(BOOL)a4 managedObjectContext:(NSManagedObjectContext *)a5 completionHandler:(id)a6;
- (void)updateIndexForAttachments:(NSSet *)a3 userInitiated:(BOOL)a4 managedObjectContext:(NSManagedObjectContext *)a5 completionHandler:(id)a6;
- (void)updateIndexWithManagedObjectContext:(NSManagedObjectContext *)a3 completionHandler:(id)a4;
@end

@implementation ICPaperSearchIndexer

+ (id)shared
{
  if (qword_1EBBB3918 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBBB43B8;
  return v2;
}

- (void)needsToUpdateIndexWithManagedObjectContext:(NSManagedObjectContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB5048);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1B0B8270C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9B4ACE8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9B4ACF0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1B0A5B40C((uint64_t)v9, (uint64_t)&unk_1E9B4ACF8, (uint64_t)v14);
  swift_release();
}

- (void)updateIndexWithManagedObjectContext:(NSManagedObjectContext *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB5048);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1B0B8270C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E9B4ACC8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E9B4ACD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1B0A5B40C((uint64_t)v9, (uint64_t)&unk_1E9B4ACD8, (uint64_t)v14);
  swift_release();
}

- (void)updateIndexForAttachments:(NSSet *)a3 userInitiated:(BOOL)a4 managedObjectContext:(NSManagedObjectContext *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB5048);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(unsigned char *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_1B0B8270C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9B4ACA8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E9B4ACB0;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_1B0A5B40C((uint64_t)v13, (uint64_t)&unk_1E9B4ACB8, (uint64_t)v18);
  swift_release();
}

- (void)updateIndexForAttachment:(NSManagedObjectID *)a3 userInitiated:(BOOL)a4 managedObjectContext:(NSManagedObjectContext *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB5048);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(unsigned char *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_1B0B8270C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9B4AC88;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E9B4AC90;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_1B0A5B40C((uint64_t)v13, (uint64_t)&unk_1E9B4AC98, (uint64_t)v18);
  swift_release();
}

- (void)cancelEverythingWithCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBBB5048);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1B0B8270C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1E9B4AC48;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1E9B4AC58;
  v12[5] = v11;
  v13 = self;
  sub_1B0A5B40C((uint64_t)v7, (uint64_t)&unk_1E9B4AC68, (uint64_t)v12);
  swift_release();
}

- (ICPaperSearchIndexer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICPaperSearchIndexer____lazy_storage___queue) = 0;
  v3.receiver = self;
  v3.super_class = (Class)ICPaperSearchIndexer;
  return [(ICPaperSearchIndexer *)&v3 init];
}

- (void).cxx_destruct
{
}

@end