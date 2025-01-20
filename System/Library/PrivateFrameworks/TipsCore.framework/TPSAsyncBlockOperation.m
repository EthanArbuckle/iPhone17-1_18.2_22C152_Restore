@interface TPSAsyncBlockOperation
- (TPSAsyncBlockOperation)init;
- (TPSAsyncBlockOperation)initWithAsyncBlock:(id)a3;
- (id)asyncBlock;
- (void)main;
- (void)setAsyncBlock:(id)a3;
@end

@implementation TPSAsyncBlockOperation

- (void).cxx_destruct
{
}

- (TPSAsyncBlockOperation)initWithAsyncBlock:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  *v6 = sub_19C8ED518;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TPSAsyncBlockOperation();
  return [(TPSAsyncOperation *)&v8 init];
}

- (void)main
{
  v3 = (char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock;
  swift_beginAccess();
  v4 = *(void (**)(void (*)(void *), uint64_t))v3;
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = self;
  swift_retain();
  swift_retain();
  v4(sub_19C8ECC20, v5);

  swift_release();
  swift_release_n();
}

- (id)asyncBlock
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_19C93EA08;
  aBlock[3] = &block_descriptor_14;
  uint64_t v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (void)setAsyncBlock:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)self + OBJC_IVAR___TPSAsyncBlockOperation_asyncBlock);
  swift_beginAccess();
  TPSAsyncBlockOperation *v6 = sub_19C93F09C;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  swift_release();
}

- (TPSAsyncBlockOperation)init
{
  result = (TPSAsyncBlockOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end