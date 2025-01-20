@interface TimelineFilterView
- (_TtC7Journal18TimelineFilterView)initWithCoder:(id)a3;
- (_TtC7Journal18TimelineFilterView)initWithFrame:(CGRect)a3;
@end

@implementation TimelineFilterView

- (_TtC7Journal18TimelineFilterView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18TimelineFilterView *)sub_10036CC74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18TimelineFilterView)initWithCoder:(id)a3
{
  return (_TtC7Journal18TimelineFilterView *)sub_10036CDD4(a3);
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal18TimelineFilterView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18TimelineFilterView_timelineFilterButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18TimelineFilterView_filterNameLabel));

  swift_release();
}

@end