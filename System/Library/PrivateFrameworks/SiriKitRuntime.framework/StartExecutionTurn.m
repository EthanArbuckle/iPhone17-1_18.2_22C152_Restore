@interface StartExecutionTurn
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC14SiriKitRuntime18StartExecutionTurn)init;
- (_TtC14SiriKitRuntime18StartExecutionTurn)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation StartExecutionTurn

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18StartExecutionTurn_sessionId;

  outlined destroy of UUID?((uint64_t)v3);
}

+ (BOOL)supportsSecureCoding
{
  return static StartExecutionTurn.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static StartExecutionTurn.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime18StartExecutionTurn)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime18StartExecutionTurn *)StartExecutionTurn.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  StartExecutionTurn.encode(with:)((NSCoder)v4);
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t started = StartExecutionTurn.debugDescription.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1BA9E2DD0](started, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtC14SiriKitRuntime18StartExecutionTurn)init
{
  result = (_TtC14SiriKitRuntime18StartExecutionTurn *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end