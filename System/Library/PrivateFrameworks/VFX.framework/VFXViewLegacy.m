@interface VFXViewLegacy
- (BOOL)framebufferOnly;
- (BOOL)isHidden;
- (BOOL)lowLatency;
- (MTLCommandQueue)commandQueue;
- (UIColor)backgroundColor;
- (_TtC3VFX13VFXCoreCamera)pointOfView;
- (_TtC3VFX13VFXViewLegacy)initWithCoder:(id)a3;
- (_TtC3VFX13VFXViewLegacy)initWithFrame:(CGRect)a3;
- (_TtC3VFX8VFXScene)scene;
- (_TtC3VFX9VFXEffect)effect;
- (double)scaleFactor;
- (id)postRenderCallback;
- (int64_t)preferredFramesPerSecond;
- (unint64_t)pixelFormat;
- (unsigned)resizingMode;
- (void)renderWithCompletion:(id)a3;
- (void)renderWithPresentWithTransaction:(BOOL)a3 completion:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setEffect:(id)a3;
- (void)setFramebufferOnly:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLowLatency:(BOOL)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setPointOfView:(id)a3;
- (void)setPostRenderCallback:(id)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setResizingMode:(unsigned __int8)a3;
- (void)setScaleFactor:(double)a3;
- (void)setScene:(id)a3;
@end

@implementation VFXViewLegacy

- (_TtC3VFX8VFXScene)scene
{
  return (_TtC3VFX8VFXScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                      + OBJC_IVAR____TtC3VFX13VFXViewLegacy_scene));
}

- (void)setScene:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_scene);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_scene) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_1B6981140();
}

- (BOOL)framebufferOnly
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_layer);
  unsigned __int8 v5 = objc_msgSend(v4, sel_framebufferOnly);

  return v5;
}

- (void)setFramebufferOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  unsigned __int8 v5 = self;
  id v6 = objc_msgSend(v4, sel_layer);
  objc_msgSend(v6, sel_setFramebufferOnly_, v3);
}

- (MTLCommandQueue)commandQueue
{
  v2 = self;
  BOOL v3 = (void *)sub_1B69801AC();

  return (MTLCommandQueue *)v3;
}

- (id)postRenderCallback
{
  v2 = (void *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
                + OBJC_IVAR____TtC3VFX11VFXCoreView_postRenderCallback);
  if (*v2)
  {
    uint64_t v3 = v2[1];
    v6[4] = *v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1B6B66BC0;
    v6[3] = &unk_1F0FB8430;
    id v4 = _Block_copy(v6);
    swift_retain();
    swift_release();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setPostRenderCallback:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_1B637B5EC;
  }
  else
  {
    id v6 = 0;
  }
  v7 = (uint64_t *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
                 + OBJC_IVAR____TtC3VFX11VFXCoreView_postRenderCallback);
  uint64_t v8 = *v7;
  uint64_t *v7 = (uint64_t)v6;
  v7[1] = v4;

  sub_1B62C6A50(v8);
}

- (void)renderWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v7 = self;
  uint64_t v8 = v6;
  sub_1B6A80730(0, v8, (void (*)(uint64_t))sub_1B6981D28, v5);

  swift_release();
}

- (void)renderWithPresentWithTransaction:(BOOL)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v9 = self;
  v10 = v8;
  sub_1B6A80730(a3, v10, (void (*)(uint64_t))sub_1B688A8C4, v7);

  swift_release();
}

- (_TtC3VFX9VFXEffect)effect
{
  return (_TtC3VFX9VFXEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC3VFX13VFXViewLegacy_effect));
}

- (void)setEffect:(id)a3
{
  id v6 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_effect);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_effect) = (Class)a3;
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B69805D4(v6);
}

- (_TtC3VFX13VFXCoreCamera)pointOfView
{
  return (_TtC3VFX13VFXCoreCamera *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                            + OBJC_IVAR____TtC3VFX13VFXViewLegacy_pointOfView));
}

- (void)setPointOfView:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1B6980888((uint64_t)a3);
}

- (unsigned)resizingMode
{
  return (*(unsigned char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView))[OBJC_IVAR____TtC3VFX11VFXCoreView_resizingMode];
}

- (void)setResizingMode:(unsigned __int8)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView);
  v3[OBJC_IVAR____TtC3VFX11VFXCoreView_resizingMode] = a3;
  id v4 = self;
  id v5 = v3;
  sub_1B6A7E9D8();
}

- (UIColor)backgroundColor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView), sel_backgroundColor);

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
}

- (unint64_t)pixelFormat
{
  return (unint64_t)objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)+ OBJC_IVAR____TtC3VFX11VFXCoreView_metalLayer), sel_pixelFormat);
}

- (void)setPixelFormat:(unint64_t)a3
{
}

- (double)scaleFactor
{
  return *(double *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
                   + OBJC_IVAR____TtC3VFX11VFXCoreView_scaleFactor);
}

- (void)setScaleFactor:(double)a3
{
  id v4 = self;
  sub_1B6980AC0(a3);
}

- (int64_t)preferredFramesPerSecond
{
  id v2 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)
     + OBJC_IVAR____TtC3VFX11VFXCoreView_preferredFramesPerSecond;
  if (v2[8]) {
    return 0;
  }
  else {
    return *(void *)v2;
  }
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  id v4 = self;
  sub_1B6980CCC(a3);
}

- (BOOL)lowLatency
{
  return objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView)+ OBJC_IVAR____TtC3VFX11VFXCoreView_metalLayer), sel_lowLatency);
}

- (void)setLowLatency:(BOOL)a3
{
}

- (_TtC3VFX13VFXViewLegacy)initWithFrame:(CGRect)a3
{
  return (_TtC3VFX13VFXViewLegacy *)sub_1B6980D94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC3VFX13VFXViewLegacy)initWithCoder:(id)a3
{
  return (_TtC3VFX13VFXViewLegacy *)sub_1B6980F74(a3);
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXViewLegacy();
  return [(VFXViewLegacy *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VFXViewLegacy();
  id v4 = (char *)v6.receiver;
  [(VFXViewLegacy *)&v6 setHidden:v3];
  id v5 = *(id *)&v4[OBJC_IVAR____TtC3VFX13VFXViewLegacy_coreView];
  objc_msgSend(v5, sel_setHidden_, objc_msgSend(v4, sel_isHidden, v6.receiver, v6.super_class));
}

- (void).cxx_destruct
{
  swift_release();

  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX13VFXViewLegacy_pointOfView);
}

@end