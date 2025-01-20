@interface BKAudiobookPresenterAssetStatus
- (BKAudiobookPresenterAssetStatus)init;
- (BOOL)assetAudiobookStatusIsPlaying;
- (double)assetAudiobookStatusTrackDuration;
- (double)assetAudiobookStatusTrackProgress;
- (double)assetAudiobookStatusTrackTimeRemaining;
- (void)assetAudiobookStatusTogglePlayPause;
- (void)setAssetAudiobookStatusPlaying:(BOOL)a3;
- (void)setAssetAudiobookStatusTrackDuration:(double)a3;
- (void)setAssetAudiobookStatusTrackProgress:(double)a3;
- (void)setAssetAudiobookStatusTrackTimeRemaining:(double)a3;
@end

@implementation BKAudiobookPresenterAssetStatus

- (BOOL)assetAudiobookStatusIsPlaying
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusIsPlaying);
}

- (void)setAssetAudiobookStatusPlaying:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusIsPlaying) = a3;
}

- (double)assetAudiobookStatusTrackDuration
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackDuration);
}

- (void)setAssetAudiobookStatusTrackDuration:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackDuration) = a3;
}

- (double)assetAudiobookStatusTrackProgress
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackProgress);
}

- (void)setAssetAudiobookStatusTrackProgress:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackProgress) = a3;
}

- (double)assetAudiobookStatusTrackTimeRemaining
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackTimeRemaining);
}

- (void)setAssetAudiobookStatusTrackTimeRemaining:(double)a3
{
  *(double *)((char *)&self->super.isa
            + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackTimeRemaining) = a3;
}

- (void)assetAudiobookStatusTogglePlayPause
{
  v2 = self;
  sub_1005AB808();
}

- (BKAudiobookPresenterAssetStatus)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusIsPlaying) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackDuration) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackProgress) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___BKAudiobookPresenterAssetStatus_assetAudiobookStatusTrackTimeRemaining) = 0;
  *(void *)&self->assetAudiobookStatusIsPlaying[OBJC_IVAR___BKAudiobookPresenterAssetStatus_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudiobookNowPlayingPresenterAssetStatus();
  return [(BKAudiobookPresenterAssetStatus *)&v4 init];
}

- (void).cxx_destruct
{
}

@end