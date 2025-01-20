@interface PlayingEpisodePlayStateDataSource
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (_TtC8Podcasts33PlayingEpisodePlayStateDataSource)init;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)dealloc;
- (void)playerPathDidChange;
@end

@implementation PlayingEpisodePlayStateDataSource

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_timer))
  {
    v3 = self;
    swift_retain();
    sub_10024E728();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayingEpisodePlayStateDataSource();
  [(PlayingEpisodePlayStateDataSource *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerRequestController));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playingEpisodeRefreshSerialQueue));
  sub_1000536BC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_refreshControllerStates));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_accessQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerController));

  swift_unknownObjectRelease();
}

- (void)playerPathDidChange
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerController);
  v3 = self;
  id v6 = [v2 playerPath];
  v4 = *(Class *)((char *)&v3->super.isa
                + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerRequestController);
  id v5 = [v4 request];
  [v5 setPlayerPath:v6];

  [v4 setNeedsReloadForSignificantRequestChange];
}

- (_TtC8Podcasts33PlayingEpisodePlayStateDataSource)init
{
  result = (_TtC8Podcasts33PlayingEpisodePlayStateDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_10024C3E8(v8, (uint64_t)sub_1000343D8, v7);

  swift_release();
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_10024F11C(v6);

  return v9 & 1;
}

@end