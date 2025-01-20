@interface PommesResult
+ (BOOL)supportsSecureCoding;
- (_TtC21SiriInformationSearch12PommesResult)init;
- (_TtC21SiriInformationSearch12PommesResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PommesResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC21SiriInformationSearch12PommesResult)initWithCoder:(id)a3
{
  return (_TtC21SiriInformationSearch12PommesResult *)PommesResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  PommesResult.encode(with:)((NSCoder)v4);
}

- (_TtC21SiriInformationSearch12PommesResult)init
{
  result = (_TtC21SiriInformationSearch12PommesResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata);
  unint64_t v4 = *(void *)&self->resultId[OBJC_IVAR____TtC21SiriInformationSearch12PommesResult_metadata];

  outlined consume of Data._Representation?(v3, v4);
}

@end