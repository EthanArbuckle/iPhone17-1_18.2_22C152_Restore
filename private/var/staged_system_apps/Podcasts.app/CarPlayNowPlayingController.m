@interface CarPlayNowPlayingController
- (_TtC8Podcasts27CarPlayNowPlayingController)init;
- (void)dealloc;
- (void)manifestContentsDidChange;
- (void)nowPlayingItemDidChange;
- (void)nowPlayingTemplateAlbumArtistButtonTapped:(id)a3;
- (void)nowPlayingTemplateUpNextButtonTapped:(id)a3;
- (void)playerPeriodicUpdate;
@end

@implementation CarPlayNowPlayingController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1003231D4();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(CarPlayNowPlayingController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_episodeController, (uint64_t *)&unk_1006033A0);
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_storeDataProvider, (uint64_t *)&unk_1005FB890);
  swift_bridgeObjectRelease();
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplatePlayerPeriodicUpdateCallback));
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplateAlbumArtistButtonTappedCallback));
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController_npTemplateUpNextButtonTappedCallback));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Podcasts27CarPlayNowPlayingController____lazy_storage___playbackRateButton);
}

- (void)nowPlayingItemDidChange
{
  v2 = self;
  sub_1003238E0();
}

- (void)playerPeriodicUpdate
{
  v2 = self;
  sub_100323FFC();
}

- (void)manifestContentsDidChange
{
  v2 = self;
  sub_100323AF4();
}

- (_TtC8Podcasts27CarPlayNowPlayingController)init
{
  return (_TtC8Podcasts27CarPlayNowPlayingController *)sub_10032450C();
}

- (void)nowPlayingTemplateAlbumArtistButtonTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10032A5B0();
}

- (void)nowPlayingTemplateUpNextButtonTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10032AFE0();
}

@end