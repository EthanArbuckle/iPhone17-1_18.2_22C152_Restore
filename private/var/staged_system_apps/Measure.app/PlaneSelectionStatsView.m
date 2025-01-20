@interface PlaneSelectionStatsView
- (_TtC7Measure23PlaneSelectionStatsView)initWithCoder:(id)a3;
- (_TtC7Measure23PlaneSelectionStatsView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation PlaneSelectionStatsView

- (_TtC7Measure23PlaneSelectionStatsView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure23PlaneSelectionStatsView *)sub_1001FC1E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure23PlaneSelectionStatsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_maxWidth) = 0;
  id v4 = a3;

  result = (_TtC7Measure23PlaneSelectionStatsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1001FC950();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_totalCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_arkitCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_adCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_localCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_patchCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_fallbackCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_inferredCountLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure23PlaneSelectionStatsView_prevCountLabel);
}

@end