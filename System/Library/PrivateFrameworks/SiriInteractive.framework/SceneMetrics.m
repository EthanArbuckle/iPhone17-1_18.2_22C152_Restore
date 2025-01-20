@interface SceneMetrics
+ (BOOL)supportsSecureCoding;
- (CGSize)size;
- (_TtC15SiriInteractive12SceneMetrics)init;
- (_TtC15SiriInteractive12SceneMetrics)initWithCoder:(id)a3;
- (_TtC15SiriInteractive12SceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4;
- (_TtC15SiriInteractive12SceneMetrics)initWithXPCDictionary:(id)a3;
- (double)cornerRadius;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SceneMetrics

- (CGSize)size
{
  double v2 = sub_25C997974();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
}

- (double)cornerRadius
{
  return sub_25C997AB0();
}

- (void)setCornerRadius:(double)a3
{
}

- (_TtC15SiriInteractive12SceneMetrics)initWithXPCDictionary:(id)a3
{
  return (_TtC15SiriInteractive12SceneMetrics *)SceneMetrics.init(xpcDictionary:)();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_25C997C9C((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (_TtC15SiriInteractive12SceneMetrics)initWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return (_TtC15SiriInteractive12SceneMetrics *)SceneMetrics.init(size:cornerRadius:)(a3.width, a3.height, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C997E3C(v4);
}

- (_TtC15SiriInteractive12SceneMetrics)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive12SceneMetrics *)SceneMetrics.init(coder:)(a3);
}

- (_TtC15SiriInteractive12SceneMetrics)init
{
}

@end