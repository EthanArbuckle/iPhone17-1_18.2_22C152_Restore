@interface DiagnosticFileProvider
- (_TtC16NewsSubscription22DiagnosticFileProvider)init;
- (void)diagnosticDataWithCompletionHandler:(id)a3;
- (void)diagnosticFilesWithCompletionHandler:(id)a3;
@end

@implementation DiagnosticFileProvider

- (void)diagnosticFilesWithCompletionHandler:(id)a3
{
  sub_1BFAE8ECC(0, &qword_1EA1858C8, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - v6;
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BFBD48C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA185918;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA185920;
  v12[5] = v11;
  v13 = self;
  sub_1BFAE805C((uint64_t)v7, (uint64_t)&unk_1EA185928, (uint64_t)v12);
  swift_release();
}

- (void)diagnosticDataWithCompletionHandler:(id)a3
{
  sub_1BFAE8ECC(0, &qword_1EA1858C8, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - v6;
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BFBD48C8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA1858D8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1858E8;
  v12[5] = v11;
  v13 = self;
  sub_1BFAE805C((uint64_t)v7, (uint64_t)&unk_1EA1858F8, (uint64_t)v12);
  swift_release();
}

- (_TtC16NewsSubscription22DiagnosticFileProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(DiagnosticFileProvider *)&v3 init];
}

@end