@interface FlowPluginInfo
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC14SiriKitRuntime14FlowPluginInfo)init;
- (_TtC14SiriKitRuntime14FlowPluginInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FlowPluginInfo

- (_TtC14SiriKitRuntime14FlowPluginInfo)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime14FlowPluginInfo *)FlowPluginInfo.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  uint64_t v3 = FlowPluginInfo.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FlowPluginInfo.encode(with:)((NSCoder)v4);
}

- (_TtC14SiriKitRuntime14FlowPluginInfo)init
{
  result = (_TtC14SiriKitRuntime14FlowPluginInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end