@interface NavigationModeGuidanceConfiguration
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC4Maps35NavigationModeGuidanceConfiguration)init;
- (_TtC4Maps35NavigationModeGuidanceConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NavigationModeGuidanceConfiguration

- (NSString)description
{
  v2 = self;
  sub_100146584();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return byte_1015CF520;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1015CF520 = a3;
}

- (_TtC4Maps35NavigationModeGuidanceConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC4Maps35NavigationModeGuidanceConfiguration *)sub_100148A24(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001468C4(v4);
}

- (_TtC4Maps35NavigationModeGuidanceConfiguration)init
{
  result = (_TtC4Maps35NavigationModeGuidanceConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end