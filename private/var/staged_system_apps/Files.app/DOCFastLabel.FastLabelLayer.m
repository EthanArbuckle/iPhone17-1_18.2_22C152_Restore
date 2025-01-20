@interface DOCFastLabel.FastLabelLayer
- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)init;
- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)initWithCoder:(id)a3;
- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)initWithLayer:(id)a3;
- (id)implicitAnimationForKeyPath:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation DOCFastLabel.FastLabelLayer

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_100054F50(v4);
}

- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_traitCollection) = 0;
  v3 = (char *)self
     + OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_labelInformation;
  sub_1000951C8((uint64_t)v7);
  sub_1000CBE0C((uint64_t)v7, (uint64_t)v3, &qword_100705560);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFastLabel.FastLabelLayer();
  v4 = [(DOCFastLabel.FastLabelLayer *)&v6 init];
  [(DOCFastLabel.FastLabelLayer *)v4 setOpaque:0];
  [(DOCFastLabel.FastLabelLayer *)v4 setContentsFormat:kCAContentsFormatAutomatic];

  return v4;
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_traitCollection));
  sub_1000CBE0C((uint64_t)self+ OBJC_IVAR____TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer_labelInformation, (uint64_t)v3, &qword_100705560);
  sub_100055128(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10009A89C);
}

- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)initWithCoder:(id)a3
{
  return (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer *)sub_10050142C(a3);
}

- (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtCC5Files12DOCFastLabelP33_7D1ECDF4F67D1CFA2DCB702D72CE29F114FastLabelLayer *)sub_100501520(v4);
}

@end