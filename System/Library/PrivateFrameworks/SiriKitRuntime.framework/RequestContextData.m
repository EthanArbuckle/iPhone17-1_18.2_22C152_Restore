@interface RequestContextData
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)debugDescription;
- (_TtC14SiriKitRuntime18RequestContextData)init;
- (_TtC14SiriKitRuntime18RequestContextData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RequestContextData

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_audioSource, (uint64_t *)&demangling cache variable for type metadata for AudioSource?);
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_audioDestination, &demangling cache variable for type metadata for AudioDestination?);
  v3 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_responseMode;
  uint64_t v4 = type metadata accessor for ResponseMode();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  outlined destroy of ReferenceResolutionClientProtocol?((uint64_t)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_approximatePreviousTTSInterval, (uint64_t *)&demangling cache variable for type metadata for DateInterval?);
  v5 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_restrictions;
  uint64_t v6 = type metadata accessor for Restrictions();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (char *)self + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_positionInSession;
  uint64_t v8 = type metadata accessor for RequestPositionInSession();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14SiriKitRuntime18RequestContextData_conjunctionInfo);
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = RequestContextData.debugDescription.getter();
  uint64_t v5 = v4;

  uint64_t v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  RequestContextData.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return static RequestContextData.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static RequestContextData.supportsSecureCoding = a3;
}

- (_TtC14SiriKitRuntime18RequestContextData)initWithCoder:(id)a3
{
  return (_TtC14SiriKitRuntime18RequestContextData *)RequestContextData.init(coder:)((char *)a3);
}

- (_TtC14SiriKitRuntime18RequestContextData)init
{
  result = (_TtC14SiriKitRuntime18RequestContextData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end