@interface CloudSyncConfiguration
+ (BOOL)supportsSecureCoding;
- (_TtC8Settings22CloudSyncConfiguration)init;
- (_TtC8Settings22CloudSyncConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CloudSyncConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D5B074(v4);
}

- (_TtC8Settings22CloudSyncConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Settings22CloudSyncConfiguration *)sub_1E4D5BA04(v3);

  return v4;
}

- (_TtC8Settings22CloudSyncConfiguration)init
{
  result = (_TtC8Settings22CloudSyncConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1E4D5BF1C((uint64_t)self + OBJC_IVAR____TtC8Settings22CloudSyncConfiguration_redirectURL);
  swift_bridgeObjectRelease();
}

@end