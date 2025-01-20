@interface PASExtensionDevicePair
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair)init;
- (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PASExtensionDevicePair

- (NSString)description
{
  v2 = self;
  PASExtensionDevicePair.description.getter();

  v3 = (void *)sub_22CC9EB98();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22CC9F038();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PASExtensionDevicePair.isEqual(_:)((uint64_t)v8);

  sub_22CB9811C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  return PASExtensionDevicePair.hash.getter();
}

+ (BOOL)supportsSecureCoding
{
  return static PASExtensionDevicePair.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PASExtensionDevicePair.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PASExtensionDevicePair.encode(with:)((NSCoder)v4);
}

- (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair *)sub_22CBCE294(v3);

  return v4;
}

- (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair)init
{
  result = (_TtC21ProximityAppleIDSetup22PASExtensionDevicePair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end