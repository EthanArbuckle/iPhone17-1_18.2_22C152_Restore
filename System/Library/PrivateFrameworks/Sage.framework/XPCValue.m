@interface XPCValue
+ (BOOL)supportsSecureCoding;
- (_TtC4Sage8XPCValue)init;
- (_TtC4Sage8XPCValue)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCValue

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC4Sage8XPCValue)init
{
  return (_TtC4Sage8XPCValue *)XPCValue.init()();
}

- (_TtC4Sage8XPCValue)initWithCoder:(id)a3
{
  return (_TtC4Sage8XPCValue *)XPCValue.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25B9EB950(v4);
}

@end