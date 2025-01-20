@interface PinningHeaderView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI17PinningHeaderView)initWithCoder:(id)a3;
- (_TtC8VideosUI17PinningHeaderView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PinningHeaderView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  v7 = self;
  double v8 = sub_1E36D86F8(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.CGFloat width = v11;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  double v9 = self;
  id v10 = sub_1E36D9088((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8VideosUI17PinningHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI17PinningHeaderView *)sub_1E36D91A0();
}

- (_TtC8VideosUI17PinningHeaderView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI17PinningHeaderView *)sub_1E36D9250(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17PinningHeaderView_collapsingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17PinningHeaderView_pinnedView));
  sub_1E36D8F4C((uint64_t)self + OBJC_IVAR____TtC8VideosUI17PinningHeaderView_animator);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17PinningHeaderView_trackingScrollView));
  swift_release();
}

@end