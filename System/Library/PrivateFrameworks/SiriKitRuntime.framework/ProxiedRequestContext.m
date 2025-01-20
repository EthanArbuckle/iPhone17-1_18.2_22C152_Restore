@interface ProxiedRequestContext
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC14SiriKitRuntime21ProxiedRequestContext)init;
- (_TtC14SiriKitRuntime21ProxiedRequestContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ProxiedRequestContext

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ProxiedRequestContext.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_interactionType;
  uint64_t v4 = type metadata accessor for InteractionType();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_inputOrigin;
  uint64_t v6 = type metadata accessor for InputOrigin();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_bargeInContext, &demangling cache variable for type metadata for BargeInContext?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14SiriKitRuntime21ProxiedRequestContext_aceRemoteExecution));

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return static ProxiedRequestContext.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ProxiedRequestContext.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime21ProxiedRequestContext)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime21ProxiedRequestContext *)ProxiedRequestContext.init(coder:)(a3);
}

- (_TtC14SiriKitRuntime21ProxiedRequestContext)init
{
  result = (_TtC14SiriKitRuntime21ProxiedRequestContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end