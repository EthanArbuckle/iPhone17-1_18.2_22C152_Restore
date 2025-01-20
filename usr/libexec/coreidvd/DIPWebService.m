@interface DIPWebService
- (_TtC8coreidvd13DIPWebService)init;
- (void)dealloc;
@end

@implementation DIPWebService

- (void)dealloc
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd13DIPWebService_httpSession);
  v3 = *(void **)(v2 + 16);
  v4 = self;
  swift_retain();
  [v3 invalidateAndCancel];
  [*(id *)(v2 + 24) invalidateAndCancel];
  swift_release();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for DIPWebService();
  [(DIPWebService *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtC8coreidvd13DIPWebService)init
{
  result = (_TtC8coreidvd13DIPWebService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end