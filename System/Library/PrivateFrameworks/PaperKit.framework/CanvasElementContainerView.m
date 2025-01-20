@interface CanvasElementContainerView
- (_TtC8PaperKit26CanvasElementContainerView)initWithCoder:(id)a3;
- (_TtC8PaperKit26CanvasElementContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CanvasElementContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  CanvasElementContainerView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (_TtC8PaperKit26CanvasElementContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CanvasElementContainerView();
  return -[CanvasElementContainerView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8PaperKit26CanvasElementContainerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CanvasElementContainerView();
  return [(CanvasElementContainerView *)&v5 initWithCoder:a3];
}

@end