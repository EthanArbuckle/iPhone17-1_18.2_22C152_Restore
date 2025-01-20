@interface BKAudiobookController
- (BKAudiobookController)init;
- (BKAudiobookController)initWithPlayer:(id)a3 sleepTimer:(id)a4 bag:(id)a5 bridge:(id)a6;
- (BKAudiobookControllerDelegate)delegate;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (void)books_decreaseVolume:(id)a3;
- (void)books_increaseVolume:(id)a3;
- (void)books_reportAudioIssue:(id)a3;
- (void)books_setPlaybackSpeed100Percent:(id)a3;
- (void)books_setPlaybackSpeed125Percent:(id)a3;
- (void)books_setPlaybackSpeed150Percent:(id)a3;
- (void)books_setPlaybackSpeed175Percent:(id)a3;
- (void)books_setPlaybackSpeed200Percent:(id)a3;
- (void)books_setPlaybackSpeed75Percent:(id)a3;
- (void)books_setSleepTimer10Minutes:(id)a3;
- (void)books_setSleepTimer15Minutes:(id)a3;
- (void)books_setSleepTimer1Hour:(id)a3;
- (void)books_setSleepTimer30Minutes:(id)a3;
- (void)books_setSleepTimer45Minutes:(id)a3;
- (void)books_setSleepTimer5Minutes:(id)a3;
- (void)books_setSleepTimerWhenCurrentChapterEnds:(id)a3;
- (void)books_skipBackward:(id)a3;
- (void)books_skipForward:(id)a3;
- (void)books_stopPlaying:(id)a3;
- (void)books_togglePlaying:(id)a3;
- (void)books_trackBackward:(id)a3;
- (void)books_trackForward:(id)a3;
- (void)books_unsetSleepTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)validateCommand:(id)a3;
@end

@implementation BKAudiobookController

- (BKAudiobookController)initWithPlayer:(id)a3 sleepTimer:(id)a4 bag:(id)a5 bridge:(id)a6
{
  return (BKAudiobookController *)sub_1000256BC(a3, a4, a5, a6);
}

- (void)setDelegate:(id)a3
{
}

- (BKAudiobookControllerDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BKAudiobookControllerDelegate *)Strong;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  unsigned __int8 v8 = sub_1004E8F48((uint64_t)a3, (uint64_t)v10);

  sub_10006CA38((uint64_t)v10);
  return v8 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004E9570(v4);
}

- (void)books_togglePlaying:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    v5 = self;
  }
  [*(id *)((char *)&self->super.super.isa + OBJC_IVAR___BKAudiobookController_player) togglePlayPause:v6, v7];

  sub_10006CA38((uint64_t)&v6);
}

- (void)books_stopPlaying:(id)a3
{
}

- (void)books_skipForward:(id)a3
{
}

- (void)books_skipBackward:(id)a3
{
}

- (void)books_trackForward:(id)a3
{
}

- (void)books_trackBackward:(id)a3
{
}

- (void)books_increaseVolume:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    v5 = self;
  }
  long long v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAudiobookController_player);
  [v6 volume:v8, v9];
  *(float *)&double v7 = *(float *)&v7 + 0.1;
  if (*(float *)&v7 < 0.0) {
    *(float *)&double v7 = 0.0;
  }
  if (*(float *)&v7 > 1.0) {
    *(float *)&double v7 = 1.0;
  }
  [v6 setVolume:v7];

  sub_10006CA38((uint64_t)&v8);
}

- (void)books_decreaseVolume:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1007FEEC0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    v5 = self;
  }
  long long v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKAudiobookController_player);
  [v6 volume:v8, v9];
  *(float *)&double v7 = *(float *)&v7 + -0.1;
  if (*(float *)&v7 < 0.0) {
    *(float *)&double v7 = 0.0;
  }
  if (*(float *)&v7 > 1.0) {
    *(float *)&double v7 = 1.0;
  }
  [v6 setVolume:v7];

  sub_10006CA38((uint64_t)&v8);
}

- (void)books_setPlaybackSpeed75Percent:(id)a3
{
}

- (void)books_setPlaybackSpeed100Percent:(id)a3
{
}

- (void)books_setPlaybackSpeed125Percent:(id)a3
{
}

- (void)books_setPlaybackSpeed150Percent:(id)a3
{
}

- (void)books_setPlaybackSpeed175Percent:(id)a3
{
}

- (void)books_setPlaybackSpeed200Percent:(id)a3
{
}

- (void)books_setSleepTimer5Minutes:(id)a3
{
}

- (void)books_setSleepTimer10Minutes:(id)a3
{
}

- (void)books_setSleepTimer15Minutes:(id)a3
{
}

- (void)books_setSleepTimer30Minutes:(id)a3
{
}

- (void)books_setSleepTimer45Minutes:(id)a3
{
}

- (void)books_setSleepTimer1Hour:(id)a3
{
}

- (void)books_setSleepTimerWhenCurrentChapterEnds:(id)a3
{
}

- (void)books_unsetSleepTimer:(id)a3
{
}

- (void)books_reportAudioIssue:(id)a3
{
}

- (BKAudiobookController)init
{
  result = (BKAudiobookController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___BKAudiobookController_delegate;

  sub_10023E454((uint64_t)v3);
}

@end