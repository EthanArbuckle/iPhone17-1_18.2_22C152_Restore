@interface CRLCanvasLayerSnapshotHostingView
- (_TtC8Freeform33CRLCanvasLayerSnapshotHostingView)initWithCoder:(id)a3;
- (_TtC8Freeform33CRLCanvasLayerSnapshotHostingView)initWithFrame:(CGRect)a3;
@end

@implementation CRLCanvasLayerSnapshotHostingView

- (_TtC8Freeform33CRLCanvasLayerSnapshotHostingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLCanvasLayerSnapshotHostingView();
  return -[CRLUserInteractionTogglableView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8Freeform33CRLCanvasLayerSnapshotHostingView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLCanvasLayerSnapshotHostingView();
  return [(CRLUserInteractionTogglableView *)&v5 initWithCoder:a3];
}

@end