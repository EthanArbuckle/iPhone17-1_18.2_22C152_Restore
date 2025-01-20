@interface EdgeDetectorDebugView
- (_TtC7Measure21EdgeDetectorDebugView)initWithCoder:(id)a3;
- (_TtC7Measure21EdgeDetectorDebugView)initWithFrame:(CGRect)a3;
@end

@implementation EdgeDetectorDebugView

- (_TtC7Measure21EdgeDetectorDebugView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure21EdgeDetectorDebugView *)sub_10008BE18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure21EdgeDetectorDebugView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10008D188();
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure21EdgeDetectorDebugView_smoothLineView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure21EdgeDetectorDebugView_unprojectedPointView));

  swift_bridgeObjectRelease();
}

@end