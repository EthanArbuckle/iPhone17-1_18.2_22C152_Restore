@interface FlowTaskXPC
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14SiriKitRuntime11FlowTaskXPC)init;
- (_TtC14SiriKitRuntime11FlowTaskXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FlowTaskXPC

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  FlowTaskXPC.encode(with:)((NSCoder)v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime11FlowTaskXPC_creationTime;
  uint64_t v4 = type metadata accessor for Date();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14SiriKitRuntime11FlowTaskXPC)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime11FlowTaskXPC *)FlowTaskXPC.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FlowTaskXPC.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC14SiriKitRuntime11FlowTaskXPC)init
{
  result = (_TtC14SiriKitRuntime11FlowTaskXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end