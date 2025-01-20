@interface CanvasAssetPlayView
- (_TtC7Journal19CanvasAssetPlayView)initWithCoder:(id)a3;
- (_TtC7Journal19CanvasAssetPlayView)initWithFrame:(CGRect)a3;
- (void)tapActionWithSender:(id)a3;
@end

@implementation CanvasAssetPlayView

- (_TtC7Journal19CanvasAssetPlayView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19CanvasAssetPlayView *)sub_10004C8AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19CanvasAssetPlayView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal19CanvasAssetPlayView_accessoryButton;
  id v6 = objc_allocWithZone((Class)UIButton);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19CanvasAssetPlayView_tapCompletion);
  void *v8 = AudioRecordingActivityState.hash(into:);
  v8[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19CanvasAssetPlayView_isPlaying) = 0;

  result = (_TtC7Journal19CanvasAssetPlayView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tapActionWithSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19CanvasAssetPlayView_accessoryButton));

  swift_release();
}

@end