@interface SKRExecutionContextUpdate
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (SKRExecutionContextUpdate)init;
- (SKRExecutionContextUpdate)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKRExecutionContextUpdate

- (SKRExecutionContextUpdate)initWithCoder:(id)a3
{
  return (SKRExecutionContextUpdate *)ExecutionContextUpdate.init(coder:)(a3);
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = ExecutionContextUpdate.debugDescription.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR___SKRExecutionContextUpdate_undoDirectInvocation, &demangling cache variable for type metadata for Parse.DirectInvocation?);
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR___SKRExecutionContextUpdate_pommesContext, (uint64_t *)&demangling cache variable for type metadata for PommesContext?);
  uint64_t v3 = (char *)self + OBJC_IVAR___SKRExecutionContextUpdate_contextUpdateScope;
  uint64_t updated = type metadata accessor for ContextUpdateScope();
  (*(void (**)(char *, uint64_t))(*(void *)(updated - 8) + 8))(v3, updated);

  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return static ExecutionContextUpdate.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ExecutionContextUpdate.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  ExecutionContextUpdate.encode(with:)((NSCoder)v4);
}

- (SKRExecutionContextUpdate)init
{
  result = (SKRExecutionContextUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end