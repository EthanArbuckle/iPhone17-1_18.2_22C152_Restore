@interface TranscribingAudioAssetView
- (CGRect)frame;
- (_TtC7Journal26TranscribingAudioAssetView)initWithCoder:(id)a3;
- (_TtC7Journal26TranscribingAudioAssetView)initWithFrame:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation TranscribingAudioAssetView

- (_TtC7Journal26TranscribingAudioAssetView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionGridView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionGridSnapshotView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionFullScreenSnapshotView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionContainerView) = 0;
  id v4 = a3;

  result = (_TtC7Journal26TranscribingAudioAssetView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TranscribingAudioAssetView();
  [(TranscribingAudioAssetView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TranscribingAudioAssetView();
  v7 = (char *)v10.receiver;
  -[TranscribingAudioAssetView setFrame:](&v10, "setFrame:", x, y, width, height);
  id v8 = [v7[OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_hostingController] view];
  if (v8)
  {
    v9 = v8;
    [v8 layoutIfNeeded];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7Journal26TranscribingAudioAssetView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC7Journal26TranscribingAudioAssetView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionGridSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionFullScreenSnapshotView));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal26TranscribingAudioAssetView_transitionContainerView);
}

@end