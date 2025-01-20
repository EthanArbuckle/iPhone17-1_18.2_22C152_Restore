@interface PeopleLegacyResult
+ (BOOL)supportsSecureCoding;
- (_TtC6People18PeopleLegacyResult)init;
- (_TtC6People18PeopleLegacyResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PeopleLegacyResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC6People18PeopleLegacyResult)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC6People18PeopleLegacyResult *)sub_1C6D385BC();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C6D38318(v4);
}

- (_TtC6People18PeopleLegacyResult)init
{
  result = (_TtC6People18PeopleLegacyResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC6People18PeopleLegacyResult_data);
  unint64_t v4 = *(void *)&self->bundleID[OBJC_IVAR____TtC6People18PeopleLegacyResult_data];
  sub_1C6CE2360(v3, v4);
}

@end