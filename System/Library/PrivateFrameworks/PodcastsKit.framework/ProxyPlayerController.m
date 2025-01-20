@interface ProxyPlayerController
- (PKDurationSnapshot)durationSnapshot;
- (PKEpisode)currentEpisode;
- (_TtC11PodcastsKit21ProxyPlayerController)init;
- (double)backwardJumpDuration;
- (double)forwardJumpDuration;
- (id)playerResponseHandler;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
- (void)jumpBackwardsWithCompletion:(id)a3;
- (void)jumpForwardsWithCompletion:(id)a3;
- (void)pauseWithCompletion:(id)a3;
- (void)playWithCompletion:(id)a3;
- (void)playWithDetailedCompletion:(id)a3;
- (void)seekToPositionWithElapsedTime:(double)a3 completion:(id)a4;
- (void)setCurrentEpisode:(id)a3;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 completion:(id)a5;
- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 detailedCompletion:(id)a5;
- (void)setPlayerResponseHandler:(id)a3;
- (void)startPlayback:(id)a3 completion:(id)a4;
@end

@implementation ProxyPlayerController

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_23F0B41F8;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  *(void *)(v10 + 24) = v9;
  v14[4] = sub_23F0B41A8;
  v14[5] = v10;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_23F0B34A0;
  v14[3] = &block_descriptor_9;
  v11 = _Block_copy(v14);
  id v12 = a3;
  v13 = self;
  sub_23F0B41D8((uint64_t)v8);
  swift_release();
  [(ProxyPlayerController *)v13 setManifest:v12 startPlayback:v5 detailedCompletion:v11];
  _Block_release(v11);
  sub_23F0B41E8((uint64_t)v8);
}

- (void)setManifest:(id)a3 startPlayback:(BOOL)a4 detailedCompletion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = v8;
    v8 = sub_23F0B4058;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_23F0B3694((uint64_t)v10, v5, (uint64_t)v8, v9);
  sub_23F0B41E8((uint64_t)v8);
}

- (_TtC11PodcastsKit21ProxyPlayerController)init
{
  return (_TtC11PodcastsKit21ProxyPlayerController *)sub_23F0B9D5C();
}

- (PKEpisode)currentEpisode
{
  return (PKEpisode *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_currentEpisode));
}

- (void)setCurrentEpisode:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_currentEpisode);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_currentEpisode) = (Class)a3;
  id v6 = a3;
  BOOL v5 = self;
  sub_23F0B9EEC(v4);
}

- (PKDurationSnapshot)durationSnapshot
{
  v2 = self;
  id v3 = sub_23F0BA0C0();

  return (PKDurationSnapshot *)v3;
}

- (void)playWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_23F0B97AC;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_23F0BA1EC((uint64_t)v7, v6);
  sub_23F0B41E8((uint64_t)v7);
}

- (void)playWithDetailedCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_23F0B4058;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_23F0BA2C0((uint64_t)v7, v6);
  sub_23F0B41E8((uint64_t)v7);
}

- (void)pauseWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_23F0B97AC;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_23F0BA394((uint64_t)v7, v6);
  sub_23F0B41E8((uint64_t)v7);
}

- (void)startPlayback:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_23F0B97AC;
    v13[4] = sub_23F0B97AC;
    v13[5] = v7;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    v13[2] = sub_23F0BA5DC;
    v13[3] = &block_descriptor_120;
    v8 = _Block_copy(v13);
    id v9 = a3;
    id v10 = self;
    swift_retain();
    swift_release();
  }
  else
  {
    id v11 = a3;
    id v12 = self;
    v8 = 0;
  }
  [(ProxyPlayerController *)self setManifest:a3 startPlayback:1 completion:v8];
  _Block_release(v8);
  sub_23F0B41E8((uint64_t)v6);
}

- (void)seekToPositionWithElapsedTime:(double)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    id v9 = sub_23F0B97AC;
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = 0;
  }
  id v10 = self;
  sub_23F0BA768((uint64_t)v9, v8, a3);
  sub_23F0B41E8((uint64_t)v9);
}

- (void)jumpForwardsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_23F0B97AC;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  sub_23F0BAA00((uint64_t)v7, v6);
  sub_23F0B41E8((uint64_t)v7);
}

- (void)jumpBackwardsWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    BOOL v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_23F0B965C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  sub_23F0BAAF4((uint64_t)v7, v6);
  sub_23F0B41E8((uint64_t)v7);
}

- (double)forwardJumpDuration
{
  v2 = self;
  sub_23F0BADEC();
  double v4 = v3;

  return v4;
}

- (double)backwardJumpDuration
{
  v2 = self;
  sub_23F0BAFD8();
  double v4 = v3;

  return v4;
}

- (id)playerResponseHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler))
  {
    uint64_t v2 = *(void *)&self->currentEpisode[OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler);
    v5[5] = v2;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 1107296256;
    v5[2] = sub_23F0B538C;
    v5[3] = &block_descriptor_102;
    double v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (void)setPlayerResponseHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    uint64_t v6 = sub_23F0BEA34;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler);
  *uint64_t v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_23F0B41E8(v8);
}

- (void).cxx_destruct
{
  sub_23F0B41E8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_playerResponseHandler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11PodcastsKit21ProxyPlayerController_requestResponseController);
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  id v9 = self;
  sub_23F0BE578((uint64_t)sub_23F0BE568, v7);

  swift_release();
}

@end