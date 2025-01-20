@interface SceneDriver
- (_TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver)init;
- (void)dealloc;
- (void)handlePlayerItemFinished:(id)a3;
- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5;
@end

@implementation SceneDriver

- (void)dealloc
{
  v2 = self;
  sub_21EF5E528();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_scene));
  sub_21EF60ADC((uint64_t)self + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_configuration, type metadata accessor for VideoViewConfiguration);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_player));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_camera));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_personalizedAssetMaterial));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_token));
  sub_21EF61B40((uint64_t)self + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_timeObserverToken, &qword_267EAEDF8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_textureCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_videoMaterial));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_featureStartedHandler));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_featureCompletedHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver_currentIOSurface));
  swift_release();
}

- (void)handlePlayerItemFinished:(id)a3
{
  uint64_t v4 = sub_21EFCDDE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EFCDDC8();
  v8 = self;
  sub_21EF5F264();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  uint64_t v9 = self;
  sub_21EF60D40(a3);
  swift_unknownObjectRelease();
}

- (_TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver)init
{
  result = (_TtC10ProductKitP33_D660C6A3879B3DCAB1A93C6FE6EA6B5B11SceneDriver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end