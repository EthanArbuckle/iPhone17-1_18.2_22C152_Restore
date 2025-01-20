@interface JSMediaItem
- (NSString)description;
@end

@implementation JSMediaItem

- (NSString)description
{
  v2 = self;
  JSMediaItem.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore11JSMediaItem_promotionalBackgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore11JSMediaItem_promotionalThumbnailArtwork));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore11JSMediaItem____lazy_storage___unmappedMusicItem, &qword_1010D3AC0);
}

@end