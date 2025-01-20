@interface CanvasAssetOverflowView
- (_TtC7Journal23CanvasAssetOverflowView)initWithCoder:(id)a3;
- (_TtC7Journal23CanvasAssetOverflowView)initWithFrame:(CGRect)a3;
- (void)tapActionWithSender:(id)a3;
@end

@implementation CanvasAssetOverflowView

- (_TtC7Journal23CanvasAssetOverflowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal23CanvasAssetOverflowView_overflowCountLabel) = 0;
  v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal23CanvasAssetOverflowView_tapCompletion);
  void *v7 = AudioRecordingActivityState.hash(into:);
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CanvasAssetOverflowView();
  v8 = -[CanvasAssetOverflowView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  [(CanvasAssetOverflowView *)v8 setClipsToBounds:1];
  sub_10004BCA8();

  return v8;
}

- (_TtC7Journal23CanvasAssetOverflowView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal23CanvasAssetOverflowView_overflowCountLabel) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal23CanvasAssetOverflowView_tapCompletion);
  void *v4 = AudioRecordingActivityState.hash(into:);
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC7Journal23CanvasAssetOverflowView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)tapActionWithSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23CanvasAssetOverflowView_overflowCountLabel));

  swift_release();
}

@end