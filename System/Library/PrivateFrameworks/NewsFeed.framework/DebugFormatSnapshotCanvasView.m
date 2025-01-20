@interface DebugFormatSnapshotCanvasView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC8NewsFeed29DebugFormatSnapshotCanvasView)initWithCoder:(id)a3;
- (_TtC8NewsFeed29DebugFormatSnapshotCanvasView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)doDepthChangedWithSender:(id)a3;
- (void)doHiddenChangedWithSender:(id)a3;
- (void)doPerspectiveWithSender:(id)a3;
- (void)doRotateWithGesture:(id)a3;
- (void)doTranslateWithGesture:(id)a3;
- (void)doZoomWithGesture:(id)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatSnapshotCanvasView

- (_TtC8NewsFeed29DebugFormatSnapshotCanvasView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed29DebugFormatSnapshotCanvasView *)sub_1C14C723C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed29DebugFormatSnapshotCanvasView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C14C9828();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C14C7B14();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1C14C7C94((uint64_t)a4, x, y);

  return v10;
}

- (void)doRotateWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C14C8990(v4);
}

- (void)doTranslateWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C14C8B60(v4);
}

- (void)doZoomWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C14C8CDC(v4);
}

- (void)doPerspectiveWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C14C8E4C(v4);
}

- (void)doDepthChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C14C6D68();
}

- (void)doHiddenChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C14C9154(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView_contentView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView____lazy_storage___rotateGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView____lazy_storage___translateGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView____lazy_storage___zoomGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView_hiddenSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatSnapshotCanvasView_depthSlider));
  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1C14C9424();

  return v9 & 1;
}

@end