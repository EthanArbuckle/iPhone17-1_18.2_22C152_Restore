@interface VMPlayer
- (BOOL)activateAudioSessionForPlaybackAndReturnError:(id *)a3;
- (BOOL)playing;
- (BOOL)processingEnabled;
- (BOOL)silenceRemoverEnabled;
- (_TtC10VoiceMemos12VMPlayerItem)currentItem;
- (_TtC10VoiceMemos8VMPlayer)init;
- (_TtP10VoiceMemos16VMPlayerDelegate_)delegate;
- (double)currentTime;
- (float)targetRate;
- (id)audioEngineOutputNodeAccessQueue;
- (void)audioPlayerError:(id)a3;
- (void)audioPlayerIsPlayingChanged:(BOOL)a3;
- (void)pause;
- (void)play;
- (void)prepareItem:(id)a3 withCompletionHandler:(id)a4;
- (void)replaceCurrentItemWithPlayerItem:(id)a3;
- (void)seekTo:(double)a3 completion:(id)a4;
- (void)setCurrentItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProcessingEnabled:(BOOL)a3;
- (void)setSilenceRemoverEnabled:(BOOL)a3;
- (void)setTargetRate:(float)a3;
@end

@implementation VMPlayer

- (_TtC10VoiceMemos8VMPlayer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer____lazy_storage___audioPlayer) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VMPlayer();
  return [(VMPlayer *)&v4 init];
}

- (BOOL)playing
{
  v2 = self;
  char v3 = *(unsigned char *)(sub_100017220() + 16);

  swift_release();
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtP10VoiceMemos16VMPlayerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP10VoiceMemos16VMPlayerDelegate_ *)Strong;
}

- (_TtC10VoiceMemos12VMPlayerItem)currentItem
{
  return (_TtC10VoiceMemos12VMPlayerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem));
}

- (void)setCurrentItem:(id)a3
{
  objc_super v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100100818();
}

- (void)replaceCurrentItemWithPlayerItem:(id)a3
{
  objc_super v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100100818();
}

- (void)seekTo:(double)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v9 = sub_10010236C;
  }
  else
  {
    v9 = 0;
    uint64_t v8 = 0;
  }
  v10 = self;
  sub_100017220();
  sub_1000D4988(0, (void (*)(void))v9, v8, a3);
  swift_release();
  sub_1000D8194((uint64_t)v9);
}

- (double)currentTime
{
  v2 = self;
  sub_100017220();
  sub_1000D3E9C();
  double v4 = v3;

  swift_release();
  return v4;
}

- (float)targetRate
{
  v2 = self;
  float v3 = *(float *)(sub_100017220() + 84);

  swift_release();
  return v3;
}

- (void)setTargetRate:(float)a3
{
  double v4 = self;
  sub_100100C3C(a3);
}

- (void)play
{
  v2 = self;
  sub_100100CA8();
}

- (void)pause
{
  v2 = self;
  sub_100100D8C();
}

- (void)prepareItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = a3;
  v9 = self;
  sub_100017220();
  v10 = *(void **)&v8[OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_asset];
  uint64_t v11 = *(void *)&v8[OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime];
  char v12 = v8[OBJC_IVAR____TtC10VoiceMemos12VMPlayerItem_playableRangeEndTime + 8];
  v13 = (void *)swift_allocObject();
  v13[2] = v8;
  v13[3] = v9;
  v13[4] = sub_100102188;
  v13[5] = v7;
  v14 = v8;
  v15 = v9;
  id v16 = v10;
  swift_retain();
  sub_1000D58B0(v16, v11, v12, (uint64_t)sub_1001021E0, (uint64_t)v13);

  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)processingEnabled
{
  v2 = self;
  char v3 = *(unsigned char *)(sub_100017220() + 81);

  swift_release();
  return v3;
}

- (void)setProcessingEnabled:(BOOL)a3
{
  double v4 = self;
  sub_100101324(a3);
}

- (BOOL)silenceRemoverEnabled
{
  v2 = self;
  char v3 = *(unsigned char *)(sub_100017220() + 80);

  swift_release();
  return v3;
}

- (void)setSilenceRemoverEnabled:(BOOL)a3
{
  double v4 = self;
  sub_10010142C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000C4A4((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_delegate);
  char v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos8VMPlayer_currentItem);
}

- (id)audioEngineOutputNodeAccessQueue
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v4 = (void *)Strong;
    v5 = self;
    id v6 = [v4 audioEngineOutputNodeAccessQueue];

    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)activateAudioSessionForPlaybackAndReturnError:(id *)a3
{
  char v3 = self;
  sub_10010162C();

  return 1;
}

- (void)audioPlayerError:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    id v7 = a3;
    uint64_t v8 = self;
    v9 = (void *)_convertErrorToNSError(_:)();
    [v6 vmPlayerError:v9];

    swift_unknownObjectRelease();
  }
}

- (void)audioPlayerIsPlayingChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v6 = (void *)Strong;
    id v7 = self;
    [v6 isPlayingDidChange:v3];

    swift_unknownObjectRelease();
  }
}

@end