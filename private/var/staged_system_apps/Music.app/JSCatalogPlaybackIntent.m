@interface JSCatalogPlaybackIntent
@end

@implementation JSCatalogPlaybackIntent

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore23JSCatalogPlaybackIntent_containerStoreItemMetadata));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore23JSCatalogPlaybackIntent_containerIdentifierSet));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end