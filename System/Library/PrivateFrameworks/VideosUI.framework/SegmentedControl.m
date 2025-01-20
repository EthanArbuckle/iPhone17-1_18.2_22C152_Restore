@interface SegmentedControl
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI16SegmentedControl)initWithCoder:(id)a3;
- (_TtC8VideosUI16SegmentedControl)initWithFrame:(CGRect)a3;
- (_TtC8VideosUI16SegmentedControl)initWithItems:(id)a3;
- (void)segmentSelectionChanged;
@end

@implementation SegmentedControl

- (_TtC8VideosUI16SegmentedControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3543010();
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1E35430D0(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)segmentSelectionChanged
{
  v2 = self;
  sub_1E3543188();
}

- (_TtC8VideosUI16SegmentedControl)initWithFrame:(CGRect)a3
{
}

- (_TtC8VideosUI16SegmentedControl)initWithItems:(id)a3
{
  if (a3) {
    sub_1E387CC98();
  }
  sub_1E354333C();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI16SegmentedControl_delegate);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8VideosUI16SegmentedControl_handleActionForHostedView);
  sub_1E2C5FB90(v3);
}

@end