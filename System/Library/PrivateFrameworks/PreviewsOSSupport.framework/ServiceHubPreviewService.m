@interface ServiceHubPreviewService
- (_TtC17PreviewsOSSupport24ServiceHubPreviewService)init;
- (void)activateWithCompletion:(id)a3;
- (void)cancel;
- (void)observeCancelation:(id)a3;
@end

@implementation ServiceHubPreviewService

- (void)activateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_232E22470((uint64_t)sub_232E12D64, v5);

  swift_release();
}

- (void)cancel
{
  swift_getObjectType();
  sub_232E23990((unint64_t *)&unk_2687501D8, v2, (void (*)(uint64_t))type metadata accessor for ServiceHubPreviewService);
  sub_232E32EB8();
}

- (void)observeCancelation:(id)a3
{
  swift_getObjectType();
  uint64_t v5 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v5;
  sub_232E23990((unint64_t *)&unk_2687501D8, v6, (void (*)(uint64_t))type metadata accessor for ServiceHubPreviewService);
  v7 = self;
  sub_232E32EC8();

  swift_release();
}

- (_TtC17PreviewsOSSupport24ServiceHubPreviewService)init
{
  result = (_TtC17PreviewsOSSupport24ServiceHubPreviewService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end