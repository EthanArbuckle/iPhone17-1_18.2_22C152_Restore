@interface NewsWebArchiveURLSchemeHandler
- (WKURLSchemeTask)task;
- (_TtC7NewsUI230NewsWebArchiveURLSchemeHandler)init;
- (void)start;
@end

@implementation NewsWebArchiveURLSchemeHandler

- (WKURLSchemeTask)task
{
  v2 = (void *)swift_unknownObjectRetain();
  return (WKURLSchemeTask *)v2;
}

- (void)start
{
  v2 = self;
  sub_1DFA9912C();
}

- (_TtC7NewsUI230NewsWebArchiveURLSchemeHandler)init
{
  result = (_TtC7NewsUI230NewsWebArchiveURLSchemeHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI230NewsWebArchiveURLSchemeHandler_webArchiveService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end