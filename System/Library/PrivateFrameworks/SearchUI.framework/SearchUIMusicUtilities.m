@interface SearchUIMusicUtilities
+ (void)canPlayAppleMusicWithCompletionHandler:(id)a3;
+ (void)playMusicItemWithMediaMetadata:(SFMediaMetadata *)a3 completionHandler:(id)a4;
- (SearchUIMusicUtilities)init;
@end

@implementation SearchUIMusicUtilities

+ (void)playMusicItemWithMediaMetadata:(SFMediaMetadata *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EAE560F0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EAE560F8;
  v14[5] = v13;
  v15 = a3;
  sub_1E4693074((uint64_t)v9, (uint64_t)&unk_1EAE56100, (uint64_t)v14);
  swift_release();
}

+ (void)canPlayAppleMusicWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB99B980);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_1E46A61C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EAE560E0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EAE559E0;
  v12[5] = v11;
  sub_1E4693074((uint64_t)v7, (uint64_t)&unk_1EAE559E8, (uint64_t)v12);
  swift_release();
}

- (SearchUIMusicUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUIMusicUtilities();
  return [(SearchUIMusicUtilities *)&v3 init];
}

@end