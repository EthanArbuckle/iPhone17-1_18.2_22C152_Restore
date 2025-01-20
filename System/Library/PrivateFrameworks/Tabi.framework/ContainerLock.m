@interface ContainerLock
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC4Tabi13ContainerLock)init;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
@end

@implementation ContainerLock

- (NSURL)presentedItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B3925C0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC4Tabi13ContainerLock_containerURL;
  uint64_t v7 = sub_25E9C01A0();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_25E9C00F0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  uint64_t v2 = qword_26B391DA0;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = (NSOperationQueue *)(id)qword_26B391D98;

  return v4;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A717598);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25E9C0CE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A7175A8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A7175B8;
  v12[5] = v11;
  v13 = self;
  sub_25E9B3044((uint64_t)v7, (uint64_t)&unk_26A7175C8, (uint64_t)v12);
  swift_release();
}

- (_TtC4Tabi13ContainerLock)init
{
  result = (_TtC4Tabi13ContainerLock *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC4Tabi13ContainerLock_containerURL;
  uint64_t v3 = sub_25E9C01A0();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end