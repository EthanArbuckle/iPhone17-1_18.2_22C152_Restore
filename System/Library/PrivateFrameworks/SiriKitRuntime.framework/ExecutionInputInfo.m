@interface ExecutionInputInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC14SiriKitRuntime18ExecutionInputInfo)init;
- (_TtC14SiriKitRuntime18ExecutionInputInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ExecutionInputInfo

+ (BOOL)supportsSecureCoding
{
  return static ExecutionInputInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ExecutionInputInfo.supportsSecureCoding = a3;
}

- (NSString)description
{
  v2 = self;
  unint64_t v3 = ExecutionInputInfo.description.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC14SiriKitRuntime18ExecutionInputInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (_TtC14SiriKitRuntime18ExecutionInputInfo *)specialized ExecutionInputInfo.init(coder:)(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ExecutionInputInfo.encode(with:)((NSCoder)v4);
}

- (_TtC14SiriKitRuntime18ExecutionInputInfo)init
{
  result = (_TtC14SiriKitRuntime18ExecutionInputInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end