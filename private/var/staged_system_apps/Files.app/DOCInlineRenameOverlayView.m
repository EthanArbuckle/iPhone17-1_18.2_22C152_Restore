@interface DOCInlineRenameOverlayView
- (_TtC5Files26DOCInlineRenameOverlayView)initWithCoder:(id)a3;
- (_TtC5Files26DOCInlineRenameOverlayView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation DOCInlineRenameOverlayView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = DOCInlineRenameOverlayView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5Files26DOCInlineRenameOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCInlineRenameOverlayView();
  return -[DOCInlineRenameOverlayView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files26DOCInlineRenameOverlayView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCInlineRenameOverlayView();
  return [(DOCInlineRenameOverlayView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end