@interface RecordingViewModel
- (void)audioControllerPlaybackStateChanged:(id)a3;
- (void)handleBackgroundTranscriptionFinished:(id)a3;
- (void)handleBackgroundTranscriptionStarted:(id)a3;
- (void)handleTimeNotificationWithNotification:(id)a3;
@end

@implementation RecordingViewModel

- (void)handleTimeNotificationWithNotification:(id)a3
{
}

- (void)handleBackgroundTranscriptionStarted:(id)a3
{
}

- (void)handleBackgroundTranscriptionFinished:(id)a3
{
}

- (void)audioControllerPlaybackStateChanged:(id)a3
{
  uint64_t v3 = sub_20C15F200();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  swift_retain();
  sub_20C114564();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end