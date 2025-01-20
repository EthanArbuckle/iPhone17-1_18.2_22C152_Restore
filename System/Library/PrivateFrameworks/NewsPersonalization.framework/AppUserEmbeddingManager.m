@interface AppUserEmbeddingManager
- (_TtC19NewsPersonalization23AppUserEmbeddingManager)init;
- (void)generateUserEmbeddingIfNeededWithCompletion:(id)a3;
@end

@implementation AppUserEmbeddingManager

- (_TtC19NewsPersonalization23AppUserEmbeddingManager)init
{
  result = (_TtC19NewsPersonalization23AppUserEmbeddingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC19NewsPersonalization23AppUserEmbeddingManager_sessionDataProvider);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC19NewsPersonalization23AppUserEmbeddingManager_userEmbeddingConfigurationService;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)generateUserEmbeddingIfNeededWithCompletion:(id)a3
{
  sub_1DE77AFD0(0, (unint64_t *)&qword_1EBEB9630, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - v6;
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = sub_1DE7B18D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = sub_1DE77B48C;
  v11[6] = v9;
  v12 = self;
  swift_retain();
  sub_1DE56B660((uint64_t)v7, (uint64_t)&unk_1EABF24B8, (uint64_t)v11);

  swift_release();
  swift_release();
}

@end