@interface TitlebarConfiguration
+ (BOOL)supportsSecureCoding;
- (_TtC8Settings21TitlebarConfiguration)init;
- (_TtC8Settings21TitlebarConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TitlebarConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D86F34(v4);
}

- (_TtC8Settings21TitlebarConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Settings21TitlebarConfiguration *)sub_1E4D8793C(v3);

  return v4;
}

- (_TtC8Settings21TitlebarConfiguration)init
{
  result = (_TtC8Settings21TitlebarConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Settings21TitlebarConfiguration_cloudSyncConfiguration);
}

@end