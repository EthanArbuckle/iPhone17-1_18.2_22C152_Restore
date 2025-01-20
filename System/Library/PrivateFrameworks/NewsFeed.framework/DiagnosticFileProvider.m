@interface DiagnosticFileProvider
- (_TtC8NewsFeed22DiagnosticFileProvider)init;
- (void)diagnosticDataWithCompletionHandler:(id)a3;
- (void)diagnosticFilesWithCompletionHandler:(id)a3;
@end

@implementation DiagnosticFileProvider

- (void)diagnosticFilesWithCompletionHandler:(id)a3
{
  sub_1C01AE8C0(0, &qword_1EB882700, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - v6;
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1C151EE9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA197C60;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA197C68;
  v12[5] = v11;
  v13 = self;
  sub_1C0D478DC((uint64_t)v7, (uint64_t)&unk_1EA197C70, (uint64_t)v12);
  swift_release();
}

- (void)diagnosticDataWithCompletionHandler:(id)a3
{
  sub_1C01AE8C0(0, &qword_1EB882700, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - v6;
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1C151EE9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA197C50;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1A6940;
  v12[5] = v11;
  v13 = self;
  sub_1C0D478DC((uint64_t)v7, (uint64_t)&unk_1EA1A6950, (uint64_t)v12);
  swift_release();
}

- (_TtC8NewsFeed22DiagnosticFileProvider)init
{
  result = (_TtC8NewsFeed22DiagnosticFileProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed22DiagnosticFileProvider_attachmentResolver;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end