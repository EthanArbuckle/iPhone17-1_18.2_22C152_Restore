@interface SKRExecutionOutput
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (SKRExecutionOutput)init;
- (SKRExecutionOutput)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRExecutionOutput

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = ExecutionOutput.debugDescription.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = (char *)self + OBJC_IVAR___SKRExecutionOutput_executionSource;
  uint64_t v4 = type metadata accessor for RequestSummary.ExecutionSource();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR___SKRExecutionOutput_inAppResponse, &demangling cache variable for type metadata for FlowOutputMessage.InAppResponse?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (SKRExecutionOutput)initWithCoder:(id)a3
{
  return (SKRExecutionOutput *)ExecutionOutput.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return static ExecutionOutput.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ExecutionOutput.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ExecutionOutput.encode(with:)((NSCoder)v4);
}

- (SKRExecutionOutput)init
{
  result = (SKRExecutionOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end