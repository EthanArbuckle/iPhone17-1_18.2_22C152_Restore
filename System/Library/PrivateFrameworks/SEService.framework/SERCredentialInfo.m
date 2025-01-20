@interface SERCredentialInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC9SEService17SERCredentialInfo)init;
- (_TtC9SEService17SERCredentialInfo)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SERCredentialInfo

- (_TtC9SEService17SERCredentialInfo)init
{
  result = (_TtC9SEService17SERCredentialInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SEService17SERCredentialInfo_requiredMemoryForCredential);
}

+ (BOOL)supportsSecureCoding
{
  return byte_26781D190;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781D190 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SERCredentialInfo.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService17SERCredentialInfo)initWithCoder:(id)a3
{
  return (_TtC9SEService17SERCredentialInfo *)SERCredentialInfo.init(coder:)(a3);
}

@end