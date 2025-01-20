@interface ArtistRadioStationController
- (_TtC16MusicApplication28ArtistRadioStationController)init;
- (void)dealloc;
@end

@implementation ArtistRadioStationController

- (void)dealloc
{
  v2 = self;
  sub_299E60();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_modelObject));
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_artistContainerURL, (uint64_t *)&unk_DC0FA0);
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_presentationSource, (uint64_t *)&unk_DCB6E0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_radioStationStoreItemMetadata));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16MusicApplication28ArtistRadioStationController_playbackCompletionHandler);

  sub_1A528(v3);
}

- (_TtC16MusicApplication28ArtistRadioStationController)init
{
  result = (_TtC16MusicApplication28ArtistRadioStationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end