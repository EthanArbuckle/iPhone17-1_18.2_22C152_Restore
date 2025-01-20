@interface BatchFeedRequestController
+ (void)fetchOutOfDateShowUUIDsWith:(NSArray *)a3 completionHandler:(id)a4;
+ (void)fetchOutOfDateShowUUIDsWithIncludeImplicit:(BOOL)a3 completionHandler:(id)a4;
- (_TtC18PodcastsFoundation26BatchFeedRequestController)init;
@end

@implementation BatchFeedRequestController

+ (void)fetchOutOfDateShowUUIDsWith:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7705F0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1ACE767F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E99F3CA8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E99F3CB0;
  v14[5] = v13;
  v15 = a3;
  sub_1ACC25D7C((uint64_t)v9, (uint64_t)&unk_1E99F3CB8, (uint64_t)v14);
  swift_release();
}

+ (void)fetchOutOfDateShowUUIDsWithIncludeImplicit:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7705F0);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = a1;
  uint64_t v12 = sub_1ACE767F8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1E99F3C68;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1E99F3C78;
  v14[5] = v13;
  sub_1ACC25D7C((uint64_t)v9, (uint64_t)&unk_1E99F3C88, (uint64_t)v14);
  swift_release();
}

- (_TtC18PodcastsFoundation26BatchFeedRequestController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BatchFeedRequestController();
  return [(BatchFeedRequestController *)&v3 init];
}

@end