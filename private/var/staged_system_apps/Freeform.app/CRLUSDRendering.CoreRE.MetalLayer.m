@interface CRLUSDRendering.CoreRE.MetalLayer
+ (id)defaultActionForKey:(id)a3;
- (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer)init;
- (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer)initWithCoder:(id)a3;
- (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer)initWithLayer:(id)a3;
@end

@implementation CRLUSDRendering.CoreRE.MetalLayer

- (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer)init
{
  return (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer *)sub_1009EA488();
}

- (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1009EBD08();
}

+ (id)defaultActionForKey:(id)a3
{
  id v3 = [objc_allocWithZone((Class)NSNull) init];

  return v3;
}

- (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  result = (_TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10076E18C(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_textureData), *(uint64_t *)((char *)&self->super._priv + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_textureData), *(void *)&self->textureData[OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_textureData], *(void **)&self->textureData[OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_textureData + 8]);
  swift_release();
  sub_1009EBCC8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_metalContext));
  sub_1009EB718(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_signalState), *(uint64_t *)((char *)&self->super._priv + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_signalState), self->textureData[OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_signalState]);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCOO8Freeform15CRLUSDRendering6CoreRE10MetalLayer_listener);
}

@end