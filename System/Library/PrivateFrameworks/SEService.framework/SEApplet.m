@interface SEApplet
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC9SEService8SEApplet)init;
- (_TtC9SEService8SEApplet)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SEApplet

+ (BOOL)supportsSecureCoding
{
  return byte_26781D470;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_26781D470 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SEApplet.encode(with:)((NSCoder)v4);
}

- (_TtC9SEService8SEApplet)initWithCoder:(id)a3
{
  return (_TtC9SEService8SEApplet *)SEApplet.init(coder:)(a3);
}

- (NSString)description
{
  v2 = self;
  SEApplet.description.getter();

  v3 = (void *)sub_2147ACF38();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9SEService8SEApplet)init
{
  result = (_TtC9SEService8SEApplet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end