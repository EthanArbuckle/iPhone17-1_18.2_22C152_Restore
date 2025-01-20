@interface CRLShadowLayer
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC8Freeform14CRLShadowLayer)init;
- (_TtC8Freeform14CRLShadowLayer)initWithCoder:(id)a3;
- (_TtC8Freeform14CRLShadowLayer)initWithLayer:(id)a3;
- (double)cornerRadius;
- (void)setBounds:(CGRect)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation CRLShadowLayer

- (CGRect)frame
{
  sub_100B42F8C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_100B42F8C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (double)cornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLShadowLayer();
  [(CRLShadowLayer *)&v3 cornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
{
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for CRLShadowLayer();
  id v4 = v16.receiver;
  [(CRLShadowLayer *)&v16 setCornerRadius:a3];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 cornerRadius];
  id v14 = [self bezierPathWithContinuousCornerRoundedRect:v6 cornerRadius:v8 v10, v12, v13];
  id v15 = [v14 CGPath];

  [v4 setShadowPath:v15];
}

- (_TtC8Freeform14CRLShadowLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLShadowLayer();
  return [(CRLShadowLayer *)&v3 init];
}

- (_TtC8Freeform14CRLShadowLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10050F848(v8, v8[3]);
  uint64_t v4 = _bridgeAnythingToObjectiveC<A>(_:)();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLShadowLayer();
  double v5 = [(CRLShadowLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v8);
  return v5;
}

- (_TtC8Freeform14CRLShadowLayer)initWithCoder:(id)a3
{
  return (_TtC8Freeform14CRLShadowLayer *)sub_100B43350(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for CRLShadowLayer);
}

@end