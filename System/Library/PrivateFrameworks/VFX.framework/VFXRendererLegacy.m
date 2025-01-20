@interface VFXRendererLegacy
- (BOOL)additiveWritesToAlpha;
- (BOOL)enableDeferredRendering;
- (BOOL)hasRenderableObjects;
- (MTLTexture)depthTexture;
- (MTLTexture)texture;
- (UIColor)backgroundColor;
- (_TtC3VFX13VFXCoreCamera)pointOfView;
- (_TtC3VFX17VFXRendererLegacy)init;
- (_TtC3VFX17VFXRendererLegacy)initWithCommandQueue:(id)a3;
- (_TtC3VFX8VFXScene)scene;
- (_TtC3VFX9VFXEffect)effect;
- (id)postRenderCallback;
- (id)snapshotImageWithSize:(CGSize)a3 deltaTime:(double)a4;
- (id)snapshotWithSize:(CGSize)a3 deltaTime:(double)a4;
- (void)encodeWithCommandBuffer:(id)a3;
- (void)finalizeEncoding;
- (void)setAdditiveWritesToAlpha:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDepthTexture:(id)a3;
- (void)setEffect:(id)a3;
- (void)setEnableDeferredRendering:(BOOL)a3;
- (void)setPointOfView:(id)a3;
- (void)setPostRenderCallback:(id)a3;
- (void)setScene:(id)a3;
- (void)setTexture:(id)a3;
@end

@implementation VFXRendererLegacy

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene));
}

- (void)setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene) = (Class)a3;
  id v3 = a3;
}

- (_TtC3VFX9VFXEffect)effect
{
  return (_TtC3VFX9VFXEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect));
}

- (void)setEffect:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect;
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_effect) = (Class)a3;
  id v6 = a3;
  v7 = self;

  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v4);
  if (v8) {
    uint64_t v9 = MEMORY[0x1BA9B8670](v8 + OBJC_IVAR____TtC3VFX9VFXEffect_scene);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene);
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene) = (Class)v9;
}

- (MTLTexture)texture
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLTexture *)v2;
}

- (void)setTexture:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_texture) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (MTLTexture)depthTexture
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLTexture *)v2;
}

- (void)setDepthTexture:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1B6CCBA00((uint64_t)a3);

  swift_unknownObjectRelease();
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_backgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_backgroundColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_backgroundColor) = (Class)a3;
  id v3 = a3;
}

- (_TtC3VFX13VFXCoreCamera)pointOfView
{
  return (_TtC3VFX13VFXCoreCamera *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_pointOfView));
}

- (void)setPointOfView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_pointOfView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_pointOfView) = (Class)a3;
  id v3 = a3;
}

- (_TtC3VFX17VFXRendererLegacy)initWithCommandQueue:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = (_TtC3VFX17VFXRendererLegacy *)sub_1B6CCBA94(a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC3VFX17VFXRendererLegacy)init
{
  return (_TtC3VFX17VFXRendererLegacy *)sub_1B6CC9088();
}

- (BOOL)hasRenderableObjects
{
  v2 = self;
  char v3 = sub_1B6CC9244();

  return v3 & 1;
}

- (void)encodeWithCommandBuffer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1B6CC93C4(a3);
  swift_unknownObjectRelease();
}

- (void)finalizeEncoding
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_scene);
  if (v2)
  {
    id v6 = v2;
    id v4 = self;
    uint64_t v5 = swift_retain();
    sub_1B69DD1E4(v5, v6);

    swift_release();
  }
}

- (BOOL)enableDeferredRendering
{
  return ((*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[536] & 1) == 0;
}

- (void)setEnableDeferredRendering:(BOOL)a3
{
  (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[536] = !a3;
  char v3 = self;
  sub_1B6382348();
  sub_1B6382348();
}

- (id)snapshotWithSize:(CGSize)a3 deltaTime:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  uint64_t v8 = (void *)sub_1B6CC9C3C(width, height, a4);

  return v8;
}

- (id)snapshotImageWithSize:(CGSize)a3 deltaTime:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1B6CC9C3C(width, height, a4);
  swift_getObjectType();
  MTLTexture.toImage()(v8);
  id v10 = v9;

  swift_unknownObjectRelease();

  return v10;
}

- (BOOL)additiveWritesToAlpha
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[321];
}

- (void)setAdditiveWritesToAlpha:(BOOL)a3
{
  (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_renderer))[321] = a3;
}

- (id)postRenderCallback
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback))
  {
    uint64_t v2 = *(void *)&self->scene[OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);
    v5[5] = v2;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 1107296256;
    v5[2] = sub_1B6B66BC0;
    v5[3] = &unk_1F0FB8318;
    char v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_1B637B5F4;
  }
  else
  {
    id v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);
  _TtC3VFX17VFXRendererLegacy *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_1B62C6A50(v8);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX17VFXRendererLegacy_postRenderCallback);

  sub_1B62C6A50(v3);
}

@end