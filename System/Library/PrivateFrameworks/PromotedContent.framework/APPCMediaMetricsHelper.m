@interface APPCMediaMetricsHelper
- (APPCMediaMetricsHelper)init;
- (id)visiblePercentageChanged;
- (int64_t)visiblePercentage;
- (void)mediaComplete;
- (void)mediaContractedAtPosition:(double)a3 fullScreen:(BOOL)a4;
- (void)mediaExpandedAtPosition:(double)a3 fullScreen:(BOOL)a4;
- (void)mediaFinished;
- (void)mediaLoaded;
- (void)mediaPausedAtPosition:(double)a3;
- (void)mediaPlayedAtPosition:(double)a3;
- (void)mediaProgress:(int64_t)a3;
- (void)mediaShowControlsAtPosition:(double)a3;
- (void)mediaSkippedAtPosition:(double)a3;
- (void)mediaStarted;
- (void)mediaUserExitedArticle;
- (void)mediaVolumeChangedAtPosition:(double)a3 volume:(float)a4;
- (void)registerHandlerForAllMetricsWithClosure:(id)a3;
- (void)removeHandler;
- (void)setVisiblePercentage:(int64_t)a3;
- (void)setVisiblePercentageChanged:(id)a3;
- (void)videoChosen;
- (void)videoChosenWithVideoWidth:(float)a3 videoHeight:(float)a4;
@end

@implementation APPCMediaMetricsHelper

- (id)visiblePercentageChanged
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_visiblePercentageChanged);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1B5C31BC4;
    aBlock[3] = &unk_1F0EDCB88;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setVisiblePercentageChanged:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1B5C379BC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___APPCMediaMetricsHelper_visiblePercentageChanged);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1B5C16CE8(v7);
}

- (int64_t)visiblePercentage
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper__visiblePercentage);
}

- (void)setVisiblePercentage:(int64_t)a3
{
  v4 = self;
  sub_1B5C31F60(a3);
}

- (void)registerHandlerForAllMetricsWithClosure:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1B5C32254((uint64_t)sub_1B5C379B4, v5);

  swift_release();
}

- (void)removeHandler
{
  v2 = self;
  sub_1B5C324A0();
}

- (void)mediaLoaded
{
  v2 = self;
  sub_1B5C33530();
}

- (void)videoChosenWithVideoWidth:(float)a3 videoHeight:(float)a4
{
  v4 = self;
  sub_1B5C33B58();
}

- (void)videoChosen
{
  v2 = self;
  sub_1B5C33B58();
}

- (void)mediaPlayedAtPosition:(double)a3
{
  v4 = self;
  sub_1B5C33EAC(a3);
}

- (void)mediaPausedAtPosition:(double)a3
{
  v4 = self;
  sub_1B5C34278(a3);
}

- (void)mediaSkippedAtPosition:(double)a3
{
  v4 = self;
  sub_1B5C34634(a3);
}

- (void)mediaVolumeChangedAtPosition:(double)a3 volume:(float)a4
{
  v6 = self;
  sub_1B5C34954(a3, a4);
}

- (void)mediaExpandedAtPosition:(double)a3 fullScreen:(BOOL)a4
{
  v6 = self;
  sub_1B5C34DCC(a4, a3);
}

- (void)mediaContractedAtPosition:(double)a3 fullScreen:(BOOL)a4
{
  v6 = self;
  sub_1B5C351D4(a4, a3);
}

- (void)mediaShowControlsAtPosition:(double)a3
{
  v4 = self;
  sub_1B5C355DC(a3);
}

- (void)mediaStarted
{
  v2 = self;
  sub_1B5C35998();
}

- (void)mediaFinished
{
  v2 = self;
  sub_1B5C35B74(100);
}

- (void)mediaProgress:(int64_t)a3
{
  v4 = self;
  sub_1B5C35B74(a3);
}

- (void)mediaUserExitedArticle
{
}

- (APPCMediaMetricsHelper)init
{
  result = (APPCMediaMetricsHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCMediaMetricsHelper_videoURL, (uint64_t *)&unk_1EB851560);
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCMediaMetricsHelper_mediaStartedTimestamp, (uint64_t *)&unk_1EB851B10);
  sub_1B5C16D70((uint64_t)self + OBJC_IVAR___APPCMediaMetricsHelper_promotedContent);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_visiblePercentageChanged);
  sub_1B5C16CE8(v3);
}

- (void)mediaComplete
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_mediaHasStarted) == 1) {
    objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___APPCMediaMetricsHelper_primitiveCreator), sel_recordMetric_forPurpose_properties_internalProperties_order_options_, 77003, -1, 0, 0, 0, 0);
  }
}

@end