@interface PommesSearchRequestXPC
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC21SiriInformationSearch22PommesSearchRequestXPC)init;
- (_TtC21SiriInformationSearch22PommesSearchRequestXPC)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PommesSearchRequestXPC

+ (BOOL)supportsSecureCoding
{
  return static PommesSearchRequestXPC.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static PommesSearchRequestXPC.supportsSecureCoding = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PommesSearchRequestXPC.encode(with:)((NSCoder)v4);
}

- (_TtC21SiriInformationSearch22PommesSearchRequestXPC)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch22PommesSearchRequestXPC *)PommesSearchRequestXPC.init(coder:)(a3);
}

- (_TtC21SiriInformationSearch22PommesSearchRequestXPC)init
{
  result = (_TtC21SiriInformationSearch22PommesSearchRequestXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of ParseStateXPC((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch22PommesSearchRequestXPC_parseState);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end