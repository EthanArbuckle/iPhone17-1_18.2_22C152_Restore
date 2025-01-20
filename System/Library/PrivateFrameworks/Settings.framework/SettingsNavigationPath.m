@interface SettingsNavigationPath
+ (BOOL)supportsSecureCoding;
- (_TtC8Settings22SettingsNavigationPath)init;
- (_TtC8Settings22SettingsNavigationPath)initWithCoder:(id)a3;
@end

@implementation SettingsNavigationPath

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC8Settings22SettingsNavigationPath)initWithCoder:(id)a3
{
  return (_TtC8Settings22SettingsNavigationPath *)SettingsNavigationPath.init(coder:)(a3);
}

- (_TtC8Settings22SettingsNavigationPath)init
{
  result = (_TtC8Settings22SettingsNavigationPath *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end