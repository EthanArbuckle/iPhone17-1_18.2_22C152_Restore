@interface _UIOrbitalColorView.SpokeLayer
- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer)init;
- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer)initWithCoder:(id)a3;
- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation _UIOrbitalColorView.SpokeLayer

- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer)initWithLayer:(id)a3
{
  return (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer *)sub_18591B218((uint64_t)self, (uint64_t)a2, (uint64_t)a3, sub_18591B064);
}

- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer)initWithCoder:(id)a3
{
  result = (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSublayers
{
  v2 = self;
  sub_18591B2D8();
}

- (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer)init
{
  result = (_TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer_color));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC5UIKit19_UIOrbitalColorViewP33_E7ADF61CB2C5BE84A3CEAD4215D687DF10SpokeLayer_gradientLayer);
}

@end