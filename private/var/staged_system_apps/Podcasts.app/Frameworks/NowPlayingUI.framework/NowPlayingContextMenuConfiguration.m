@interface NowPlayingContextMenuConfiguration
- (_TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration)init;
@end

@implementation NowPlayingContextMenuConfiguration

- (_TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_config) = 0;
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_previewProvider);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_actionProvider);
  v5 = (objc_class *)type metadata accessor for NowPlayingContextMenuConfiguration();
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(NowPlayingContextMenuConfiguration *)&v7 init];
}

- (void).cxx_destruct
{
  swift_release();
  sub_FB70(*(uint64_t *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_previewProvider));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUIP33_51F693B05AE440B605BF23B767A044C434NowPlayingContextMenuConfiguration_actionProvider);

  sub_FB70(v3);
}

@end