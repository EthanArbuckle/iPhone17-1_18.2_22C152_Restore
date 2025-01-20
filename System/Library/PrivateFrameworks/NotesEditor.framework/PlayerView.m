@interface PlayerView
- (_TtC11NotesEditor10PlayerView)initWithCoder:(id)a3;
- (_TtC11NotesEditor10PlayerView)initWithFrame:(CGRect)a3;
- (void)back:(id)a3;
- (void)forward:(id)a3;
- (void)playPause:(id)a3;
- (void)stopRecording:(id)a3;
@end

@implementation PlayerView

- (_TtC11NotesEditor10PlayerView)initWithFrame:(CGRect)a3
{
  return (_TtC11NotesEditor10PlayerView *)sub_20C079294(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11NotesEditor10PlayerView)initWithCoder:(id)a3
{
  return (_TtC11NotesEditor10PlayerView *)sub_20C0794FC(a3);
}

- (void)back:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C084468((SEL *)&selRef_skipBackByInterval_completion_);
}

- (void)playPause:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C084304((SEL *)&selRef_togglePlayPause, (uint64_t)&unk_26C10AC80, (uint64_t)&unk_2676BDAB8, (void (*)(char *, uint64_t, void *))sub_20BF9DE48);
}

- (void)stopRecording:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C084304((SEL *)&selRef_stop, (uint64_t)&unk_26C10AC58, (uint64_t)&unk_2676BDAA8, (void (*)(char *, uint64_t, void *))sub_20C0B00A0);
}

- (void)forward:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20C084468((SEL *)&selRef_skipAheadByInterval_completion_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor10PlayerView_recordingPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor10PlayerView_recordingStopButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor10PlayerView_secondaryLabelColor));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11NotesEditor10PlayerView_playbackController;

  sub_20BFCEB78((uint64_t)v3);
}

@end