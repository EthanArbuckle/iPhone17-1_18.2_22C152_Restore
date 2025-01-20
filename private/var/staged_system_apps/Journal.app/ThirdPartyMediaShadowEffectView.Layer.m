@interface ThirdPartyMediaShadowEffectView.Layer
- (BOOL)masksToBounds;
- (CACornerRadii)cornerRadii;
- (NSString)cornerCurve;
- (_TtCC7Journal31ThirdPartyMediaShadowEffectViewP33_12A01373AF1737769C2E66ABF7AEC5025Layer)init;
- (_TtCC7Journal31ThirdPartyMediaShadowEffectViewP33_12A01373AF1737769C2E66ABF7AEC5025Layer)initWithCoder:(id)a3;
- (_TtCC7Journal31ThirdPartyMediaShadowEffectViewP33_12A01373AF1737769C2E66ABF7AEC5025Layer)initWithLayer:(id)a3;
- (double)cornerRadius;
- (void)setCornerCurve:(id)a3;
- (void)setCornerRadii:(CACornerRadii *)a3;
- (void)setCornerRadius:(double)a3;
@end

@implementation ThirdPartyMediaShadowEffectView.Layer

- (BOOL)masksToBounds
{
  return 0;
}

- (double)cornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  [(ThirdPartyMediaShadowEffectView.Layer *)&v3 cornerRadius];
  return result;
}

- (void)setCornerRadius:(double)a3
{
  v4 = self;
  sub_1005872EC(a3);
}

- (NSString)cornerCurve
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  v2 = [(ThirdPartyMediaShadowEffectView.Layer *)&v4 cornerCurve];

  return v2;
}

- (void)setCornerCurve:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ThirdPartyMediaShadowEffectView.Layer *)&v6 setCornerCurve:v4];
  sub_1005874B4();
}

- (CACornerRadii)cornerRadii
{
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  double result = (CACornerRadii *)[(CACornerRadii *)&v12 cornerRadii];
  CGSize v5 = v9;
  CGSize v6 = v10;
  CGSize v7 = v11;
  retstr->var0 = v8;
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  return result;
}

- (void)setCornerRadii:(CACornerRadii *)a3
{
  CGSize var1 = a3->var1;
  v6[0] = (__int128)a3->var0;
  v6[1] = (__int128)var1;
  CGSize var3 = a3->var3;
  v6[2] = (__int128)a3->var2;
  v6[3] = (__int128)var3;
  CGSize v5 = self;
  sub_100587698(v6);
}

- (_TtCC7Journal31ThirdPartyMediaShadowEffectViewP33_12A01373AF1737769C2E66ABF7AEC5025Layer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  return [(ThirdPartyMediaShadowEffectView.Layer *)&v3 init];
}

- (_TtCC7Journal31ThirdPartyMediaShadowEffectViewP33_12A01373AF1737769C2E66ABF7AEC5025Layer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_10002E0BC(v8, v8[3]);
  uint64_t v4 = _bridgeAnythingToObjectiveC<A>(_:)();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  CGSize v5 = [(ThirdPartyMediaShadowEffectView.Layer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  _s7Journal19DynamicWaveformViewVwxx_0((uint64_t)v8);
  return v5;
}

- (_TtCC7Journal31ThirdPartyMediaShadowEffectViewP33_12A01373AF1737769C2E66ABF7AEC5025Layer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ThirdPartyMediaShadowEffectView.Layer();
  return [(ThirdPartyMediaShadowEffectView.Layer *)&v5 initWithCoder:a3];
}

@end