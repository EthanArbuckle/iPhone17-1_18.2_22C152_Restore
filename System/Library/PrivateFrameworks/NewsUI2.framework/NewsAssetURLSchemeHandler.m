@interface NewsAssetURLSchemeHandler
- (WKURLSchemeTask)task;
- (_TtC7NewsUI225NewsAssetURLSchemeHandler)init;
- (void)cancel;
- (void)finish;
- (void)start;
@end

@implementation NewsAssetURLSchemeHandler

- (WKURLSchemeTask)task
{
  v2 = (void *)swift_unknownObjectRetain();
  return (WKURLSchemeTask *)v2;
}

- (void)start
{
  v2 = self;
  sub_1DFD164C0();
}

- (void)cancel
{
  v2 = self;
  sub_1DFD16C48();
}

- (void)finish
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI225NewsAssetURLSchemeHandler_cancelHandler;
  swift_beginAccess();
  v4 = self;
  sub_1DFD16FF8((uint64_t)v5, (uint64_t)v3);
  swift_endAccess();
}

- (_TtC7NewsUI225NewsAssetURLSchemeHandler)init
{
  result = (_TtC7NewsUI225NewsAssetURLSchemeHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end