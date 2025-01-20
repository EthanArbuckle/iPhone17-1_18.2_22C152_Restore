@interface MetaData
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC7Measure8MetaData)init;
- (_TtC7Measure8MetaData)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MetaData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7Measure8MetaData)initWithCoder:(id)a3
{
  return (_TtC7Measure8MetaData *)sub_100096FE0(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10009722C(v4);
}

- (NSString)description
{
  v2 = self;
  sub_100096C94();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC7Measure8MetaData)init
{
  result = (_TtC7Measure8MetaData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end