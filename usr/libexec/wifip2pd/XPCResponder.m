@interface XPCResponder
- (_TtC12wifip2pdCore12XPCResponder)init;
@end

@implementation XPCResponder

- (_TtC12wifip2pdCore12XPCResponder)init
{
  result = (_TtC12wifip2pdCore12XPCResponder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12wifip2pdCore12XPCResponder_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12wifip2pdCore12XPCResponder_session);
}

@end