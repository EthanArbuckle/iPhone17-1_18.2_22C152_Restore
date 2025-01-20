@interface MediaBackdropSnapshotRendererOperation
- (_TtC10TemplateUI38MediaBackdropSnapshotRendererOperation)init;
- (void)main;
@end

@implementation MediaBackdropSnapshotRendererOperation

- (void)main
{
  sub_1902BC(&qword_2DF058);
  __chkstk_darwin();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_192D60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = self;
  v7 = self;
  sub_18FBA8((uint64_t)v4, (uint64_t)&unk_2DF068, (uint64_t)v6);
  swift_release();
  sub_192DA0();
}

- (_TtC10TemplateUI38MediaBackdropSnapshotRendererOperation)init
{
  result = (_TtC10TemplateUI38MediaBackdropSnapshotRendererOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_content));
  swift_release();
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC10TemplateUI38MediaBackdropSnapshotRendererOperation_semaphore);
}

@end