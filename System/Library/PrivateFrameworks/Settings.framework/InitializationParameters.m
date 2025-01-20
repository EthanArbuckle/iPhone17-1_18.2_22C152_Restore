@interface InitializationParameters
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC8Settings24InitializationParameters)init;
- (_TtC8Settings24InitializationParameters)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation InitializationParameters

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E4D64F38(v4);
}

- (_TtC8Settings24InitializationParameters)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Settings24InitializationParameters *)sub_1E4D6D05C(v3);

  return v4;
}

- (NSString)description
{
  v2 = self;
  sub_1E4D653B0();

  id v3 = (void *)sub_1E4DBDF08();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC8Settings24InitializationParameters)init
{
  result = (_TtC8Settings24InitializationParameters *)_swift_stdlib_reportUnimplementedInitializer();
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