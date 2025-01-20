@interface SettingsSearchItem
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC8Settings18SettingsSearchItem)init;
- (_TtC8Settings18SettingsSearchItem)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SettingsSearchItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SettingsSearchItem.description.getter();

  v3 = (void *)sub_1E4DBDF08();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SettingsSearchItem.encode(with:)((NSCoder)v4);
}

- (_TtC8Settings18SettingsSearchItem)initWithCoder:(id)a3
{
  return (_TtC8Settings18SettingsSearchItem *)SettingsSearchItem.init(coder:)(a3);
}

- (_TtC8Settings18SettingsSearchItem)init
{
  result = (_TtC8Settings18SettingsSearchItem *)_swift_stdlib_reportUnimplementedInitializer();
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