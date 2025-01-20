@interface PlayerPathCoordinator
- (MPCPlayerPath)metadataPlayerPath;
- (MPCPlayerPath)playbackPlayerPath;
- (_TtC19PodcastsTranscripts21PlayerPathCoordinator)init;
- (void)setMetadataPlayerPath:(id)a3;
- (void)setPlaybackPlayerPath:(id)a3;
@end

@implementation PlayerPathCoordinator

- (MPCPlayerPath)metadataPlayerPath
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_metadataPlayerPath);
  swift_beginAccess();
  return (MPCPlayerPath *)*v2;
}

- (void)setMetadataPlayerPath:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_6F594(v5);
}

- (MPCPlayerPath)playbackPlayerPath
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_playbackPlayerPath);
  swift_beginAccess();
  return (MPCPlayerPath *)*v2;
}

- (void)setPlaybackPlayerPath:(id)a3
{
  id v5 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_playbackPlayerPath);
  swift_beginAccess();
  v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_6AB20();
}

- (_TtC19PodcastsTranscripts21PlayerPathCoordinator)init
{
  result = (_TtC19PodcastsTranscripts21PlayerPathCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_metadataPlayerPath));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_playbackPlayerPath));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_invalidationQueue));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19PodcastsTranscripts21PlayerPathCoordinator_routingController);
}

@end