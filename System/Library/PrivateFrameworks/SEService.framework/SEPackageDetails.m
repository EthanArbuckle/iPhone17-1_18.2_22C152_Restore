@interface SEPackageDetails
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9SEService16SEPackageDetails)init;
- (_TtC9SEService16SEPackageDetails)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEPackageDetails

- (_TtC9SEService16SEPackageDetails)init
{
  return (_TtC9SEService16SEPackageDetails *)sub_2147483DC();
}

+ (BOOL)supportsSecureCoding
{
  return byte_26781CFF0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781CFF0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SEPackageDetails.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService16SEPackageDetails)initWithCoder:(id)a3
{
  return (_TtC9SEService16SEPackageDetails *)SEPackageDetails.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  SEPackageDetails.description.getter();

  v3 = (void *)sub_2147ACF38();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService16SEPackageDetails_type);
  unint64_t v4 = *(void *)&self->packageLoaded[OBJC_IVAR____TtC9SEService16SEPackageDetails_type];
  sub_21472C78C(v3, v4);
}

@end