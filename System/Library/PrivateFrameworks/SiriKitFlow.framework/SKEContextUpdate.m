@interface SKEContextUpdate
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (SKEContextUpdate)init;
- (SKEContextUpdate)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKEContextUpdate

+ (BOOL)supportsSecureCoding
{
  return static ContextUpdate.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (SKEContextUpdate)initWithCoder:(id)a3
{
  return (SKEContextUpdate *)ContextUpdate.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C97BDE28(v4);
}

- (SKEContextUpdate)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end