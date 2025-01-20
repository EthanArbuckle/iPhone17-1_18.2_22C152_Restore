@interface SKEUserSpecificInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (SKEUserSpecificInfo)init;
- (SKEUserSpecificInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKEUserSpecificInfo

+ (BOOL)supportsSecureCoding
{
  return static UserSpecificInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static UserSpecificInfo.supportsSecureCoding = a3;
}

- (SKEUserSpecificInfo)initWithCoder:(id)a3
{
  return (SKEUserSpecificInfo *)UserSpecificInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  UserSpecificInfo.encode(with:)((NSCoder)v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = UserSpecificInfo.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = UserSpecificInfo.debugDescription.getter();
  uint64_t v5 = v4;

  char v6 = (void *)MEMORY[0x1BA9E2DD0](v3, v5);
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (SKEUserSpecificInfo)init
{
  result = (SKEUserSpecificInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end