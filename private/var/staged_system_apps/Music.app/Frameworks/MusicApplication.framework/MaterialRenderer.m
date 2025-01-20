@interface MaterialRenderer
- (_TtC16MusicApplication16MaterialRenderer)init;
- (void)drawInMTKView:(id)a3;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
@end

@implementation MaterialRenderer

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = [v5 colorPixelFormat];
  [v5 frame];
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_resizeTexture) = (Class)sub_3AA920(v7, v8, v9);

  swift_unknownObjectRelease();
}

- (void)drawInMTKView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_3A9944((uint64_t)v4);
}

- (_TtC16MusicApplication16MaterialRenderer)init
{
  result = (_TtC16MusicApplication16MaterialRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_context + 16];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_447B0(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_textureSource), self->context[OBJC_IVAR____TtC16MusicApplication16MaterialRenderer_textureSource]);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer____lazy_storage___resizeRenderPipelineDescriptor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication16MaterialRenderer____lazy_storage___treatmentRenderPipelineDescriptor));

  swift_release();
}

@end