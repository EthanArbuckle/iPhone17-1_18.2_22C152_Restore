@interface NavigationToken
+ (BOOL)supportsSecureCoding;
- (_TtC8Settings15NavigationToken)init;
- (_TtC8Settings15NavigationToken)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NavigationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D62354(v4);
}

- (_TtC8Settings15NavigationToken)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Settings15NavigationToken *)sub_1E4D62DC0();

  return v4;
}

- (_TtC8Settings15NavigationToken)init
{
  result = (_TtC8Settings15NavigationToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end