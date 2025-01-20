@interface MediaBackdropSnapshotRendererOperation
- (_TtC7BooksUI38MediaBackdropSnapshotRendererOperation)init;
- (void)main;
@end

@implementation MediaBackdropSnapshotRendererOperation

- (void)main
{
  uint64_t v3 = sub_4A98(&qword_2EA2E0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_26D6F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_19E514((uint64_t)v5, (uint64_t)&unk_2EA2F0, (uint64_t)v7);
  swift_release();
  sub_26D8D0();
}

- (_TtC7BooksUI38MediaBackdropSnapshotRendererOperation)init
{
  result = (_TtC7BooksUI38MediaBackdropSnapshotRendererOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7BooksUI38MediaBackdropSnapshotRendererOperation_content));
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7BooksUI38MediaBackdropSnapshotRendererOperation_semaphore);
}

@end