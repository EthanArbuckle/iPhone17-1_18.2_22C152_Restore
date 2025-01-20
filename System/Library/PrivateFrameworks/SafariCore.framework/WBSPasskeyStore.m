@interface WBSPasskeyStore
- (_TtC10SafariCore15WBSPasskeyStore)init;
- (id)initForTesting:(BOOL)a3 queue:(id)a4;
- (void)test_copyPasskeyWithCredentialID:(NSData *)a3 toGroup:(NSString *)a4 inRecentlyDeleted:(BOOL)a5 completionHandler:(id)a6;
- (void)test_createLegacyCredentialWithName:(NSString *)a3 displayName:(NSString *)a4 relyingParty:(NSString *)a5 userHandle:(NSData *)a6 completionHandler:(id)a7;
- (void)test_createPasskeyWithName:(NSString *)a3 displayName:(NSString *)a4 relyingParty:(NSString *)a5 userHandle:(NSData *)a6 groupID:(NSString *)a7 inRecentlyDeleted:(BOOL)a8 completionHandler:(id)a9;
- (void)test_createPasskeyWithName:(NSString *)a3 displayName:(NSString *)a4 relyingParty:(NSString *)a5 userHandle:(NSData *)a6 groupID:(NSString *)a7 inRecentlyDeleted:(BOOL)a8 unsafeAllowRealKeychainAccess:(BOOL)a9 completionHandler:(id)a10;
@end

@implementation WBSPasskeyStore

- (id)initForTesting:(BOOL)a3 queue:(id)a4
{
  self->isForTesting[0] = a3;
  *(void *)&self->executorQueue[7] = a4;
  id v5 = a4;
  swift_retain();
  *(void *)&self->unownedExecutor[7] = sub_1B7384220();
  *(void *)&self->unownedExecutor[15] = v6;
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for WBSPasskeyStore();
  v7 = [(WBSPasskeyStore *)&v9 init];

  return v7;
}

- (_TtC10SafariCore15WBSPasskeyStore)init
{
  result = (_TtC10SafariCore15WBSPasskeyStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)test_createPasskeyWithName:(NSString *)a3 displayName:(NSString *)a4 relyingParty:(NSString *)a5 userHandle:(NSData *)a6 groupID:(NSString *)a7 inRecentlyDeleted:(BOOL)a8 completionHandler:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a9);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  *(void *)(v20 + 48) = a7;
  *(unsigned char *)(v20 + 56) = a8;
  *(void *)(v20 + 64) = v19;
  *(void *)(v20 + 72) = self;
  uint64_t v21 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1E9E593E8;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1E9E593F0;
  v23[5] = v22;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  swift_retain();
  sub_1B73671C4((uint64_t)v18, (uint64_t)&unk_1E9E593F8, (uint64_t)v23);
  swift_release();
}

- (void)test_createPasskeyWithName:(NSString *)a3 displayName:(NSString *)a4 relyingParty:(NSString *)a5 userHandle:(NSData *)a6 groupID:(NSString *)a7 inRecentlyDeleted:(BOOL)a8 unsafeAllowRealKeychainAccess:(BOOL)a9 completionHandler:(id)a10
{
  HIDWORD(v29) = a8;
  v30 = a3;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v16 - 8);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a10);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  *(void *)(v20 + 24) = a4;
  *(void *)(v20 + 32) = a5;
  *(void *)(v20 + 40) = a6;
  *(void *)(v20 + 48) = a7;
  *(unsigned char *)(v20 + 56) = BYTE4(v29);
  *(unsigned char *)(v20 + 57) = a9;
  *(void *)(v20 + 64) = v19;
  *(void *)(v20 + 72) = self;
  uint64_t v21 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_1E9E593C8;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_1E9E593D0;
  v23[5] = v22;
  v24 = v30;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  swift_retain();
  sub_1B73671C4((uint64_t)v18, (uint64_t)&unk_1E9E593D8, (uint64_t)v23);
  swift_release();
}

- (void)test_createLegacyCredentialWithName:(NSString *)a3 displayName:(NSString *)a4 relyingParty:(NSString *)a5 userHandle:(NSData *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1E9E593A8;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1E9E593B0;
  v20[5] = v19;
  uint64_t v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  swift_retain();
  sub_1B73671C4((uint64_t)v15, (uint64_t)&unk_1E9E593B8, (uint64_t)v20);
  swift_release();
}

- (void)test_copyPasskeyWithCredentialID:(NSData *)a3 toGroup:(NSString *)a4 inRecentlyDeleted:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9E59058);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_1B7384180();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1E9E59378;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1E9E59070;
  v18[5] = v17;
  v19 = a3;
  uint64_t v20 = a4;
  swift_retain();
  sub_1B73671C4((uint64_t)v13, (uint64_t)&unk_1E9E59078, (uint64_t)v18);
  swift_release();
}

@end