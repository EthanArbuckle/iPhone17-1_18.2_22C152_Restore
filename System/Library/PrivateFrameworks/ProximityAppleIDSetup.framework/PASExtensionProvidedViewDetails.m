@interface PASExtensionProvidedViewDetails
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails)init;
- (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PASExtensionProvidedViewDetails

- (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails)init
{
  result = (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *)sub_22CC9F268();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  PASExtensionProvidedViewDetails.description.getter();

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
  char v6 = PASExtensionProvidedViewDetails.isEqual(_:)((uint64_t)v8);

  sub_22CB9811C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = PASExtensionProvidedViewDetails.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return static PASExtensionProvidedViewDetails.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PASExtensionProvidedViewDetails.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PASExtensionProvidedViewDetails.encode(with:)((NSCoder)v4);
}

- (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC21ProximityAppleIDSetup31PASExtensionProvidedViewDetails *)sub_22CC70CDC();

  return v4;
}

- (void).cxx_destruct
{
}

@end