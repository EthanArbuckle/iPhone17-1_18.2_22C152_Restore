@interface FormatVideoPlayerProvider
- (_TtC8NewsFeed25FormatVideoPlayerProvider)init;
- (double)impressionThreshold;
- (id)loadWithCompletionBlock:(id)a3;
- (void)playbackFailedWithError:(id)a3;
- (void)playbackFinished;
- (void)playbackInitiatedWithButtonTapped:(BOOL)a3;
- (void)playbackPaused;
- (void)playbackReadyToStart;
- (void)playbackResumed;
- (void)playbackStarted;
- (void)startedPictureInPicture;
- (void)stoppedPictureInPicture;
@end

@implementation FormatVideoPlayerProvider

- (id)loadWithCompletionBlock:(id)a3
{
  sub_1BFF2E698(0, (unint64_t *)&qword_1EB8948A0, MEMORY[0x1E4F276F0], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  v10 = (char *)aBlock - v9;
  v11 = (uint64_t (**)(void *, void *))_Block_copy(a3);
  v12 = (char *)self + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_data;
  v13 = &v12[*(int *)(type metadata accessor for FormatVideoPlayerData() + 36)];
  uint64_t v14 = sub_1C1515FDC();
  uint64_t v15 = *(void *)(v14 - 8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v10, v13, v14);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v10, 0, 1, v14);
  sub_1C0025B10((uint64_t)v10, (uint64_t)v7);
  int v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v14);
  v17 = self;
  v18 = 0;
  if (v16 != 1)
  {
    v18 = (void *)sub_1C1515E9C();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  }
  v19 = (objc_class *)(id)v11[2](v11, v18);

  sub_1C002F608((uint64_t)v10);
  *(Class *)((char *)&v17->super.isa + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_metadata) = v19;
  swift_unknownObjectRelease();
  _Block_release(v11);

  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFC9FC68;
  aBlock[3] = &block_descriptor_32;
  v20 = _Block_copy(aBlock);
  swift_release();
  return v20;
}

- (double)impressionThreshold
{
  return 2.0;
}

- (void)playbackInitiatedWithButtonTapped:(BOOL)a3
{
  v3 = self;
  _s8NewsFeed25FormatVideoPlayerProviderC17playbackInitiated16withButtonTappedySb_tF_0();
}

- (void)playbackReadyToStart
{
  uint64_t v2 = qword_1EB87BF18;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (void *)qword_1EB93C748;
  sub_1BFF2E698(0, (unint64_t *)&qword_1EB895EB0, (uint64_t (*)(uint64_t))sub_1C0062478, MEMORY[0x1E4FBBE00]);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1C1529AE0;
  type metadata accessor for FormatVideoPlayerData();
  id v6 = v4;
  uint64_t v7 = sub_1C1515E2C();
  uint64_t v9 = v8;
  *(void *)(v5 + 56) = MEMORY[0x1E4FBB1A0];
  *(void *)(v5 + 64) = sub_1BFE9C558();
  *(void *)(v5 + 32) = v7;
  *(void *)(v5 + 40) = v9;
  sub_1C151F38C();
  sub_1C15197BC();

  swift_bridgeObjectRelease();
}

- (void)playbackStarted
{
  uint64_t v2 = self;
  FormatVideoPlayerProvider.playbackStarted()();
}

- (void)playbackPaused
{
  uint64_t v2 = self;
  FormatVideoPlayerProvider.playbackPaused()();
}

- (void)playbackResumed
{
  uint64_t v2 = self;
  FormatVideoPlayerProvider.playbackResumed()();
}

- (void)playbackFinished
{
  uint64_t v2 = self;
  FormatVideoPlayerProvider.playbackFinished()();
}

- (void)playbackFailedWithError:(id)a3
{
  v4 = self;
  id v5 = a3;
  _s8NewsFeed25FormatVideoPlayerProviderC23playbackFailedWithErroryys0J0_pSgF_0();
}

- (void)startedPictureInPicture
{
  uint64_t v2 = self;
  FormatVideoPlayerProvider.startedPictureInPicture()();
}

- (void)stoppedPictureInPicture
{
  uint64_t v2 = self;
  FormatVideoPlayerProvider.stoppedPictureInPicture()();
}

- (_TtC8NewsFeed25FormatVideoPlayerProvider)init
{
  result = (_TtC8NewsFeed25FormatVideoPlayerProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C093B080((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_data, (uint64_t (*)(void))type metadata accessor for FormatVideoPlayerData);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed25FormatVideoPlayerProvider_coordinator);
  swift_unknownObjectRelease();
}

@end