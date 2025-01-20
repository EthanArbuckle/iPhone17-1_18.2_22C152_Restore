@interface FullScreenAudioTranscriptionView
- (_TtC7Journal32FullScreenAudioTranscriptionView)initWithCoder:(id)a3;
- (_TtC7Journal32FullScreenAudioTranscriptionView)initWithFrame:(CGRect)a3;
- (void)audioPlaybackDidFinish;
@end

@implementation FullScreenAudioTranscriptionView

- (_TtC7Journal32FullScreenAudioTranscriptionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal32FullScreenAudioTranscriptionView_transcribingAudioAssetView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7Journal32FullScreenAudioTranscriptionView_recordingViewModel) = 0;
  id v4 = a3;

  result = (_TtC7Journal32FullScreenAudioTranscriptionView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7Journal32FullScreenAudioTranscriptionView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal32FullScreenAudioTranscriptionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal32FullScreenAudioTranscriptionView_transcribingAudioAssetView));
  swift_release();

  swift_release();
}

- (void)audioPlaybackDidFinish
{
  v2 = self;
  sub_1002A8C64();
}

@end