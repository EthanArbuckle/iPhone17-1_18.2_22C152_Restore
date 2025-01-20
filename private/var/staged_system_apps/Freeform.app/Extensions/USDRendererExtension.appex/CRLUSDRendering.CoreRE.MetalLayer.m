@interface CRLUSDRendering.CoreRE.MetalLayer
+ (id)defaultActionForKey:(id)a3;
- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)init;
- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)initWithCoder:(id)a3;
- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)initWithLayer:(id)a3;
@end

@implementation CRLUSDRendering.CoreRE.MetalLayer

- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)init
{
  return (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer *)sub_100055924();
}

- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100057210();
}

+ (id)defaultActionForKey:(id)a3
{
  id v3 = [objc_allocWithZone((Class)NSNull) init];

  return v3;
}

- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_10005E9A0();
  swift_unknownObjectRelease();
  result = (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003EB54(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData), *(uint64_t *)((char *)&self->super._priv+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData), *(void *)&self->textureData[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData], *(void **)&self->textureData[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData+ 8]);
  swift_release();
  sub_1000571D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext));
  sub_100056C14(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState), *(uint64_t *)((char *)&self->super._priv+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState), self->textureData[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState]);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_listener);
}

@end