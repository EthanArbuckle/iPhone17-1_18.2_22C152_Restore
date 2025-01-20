@interface AccuracyDebugView
- (_TtC7Measure17AccuracyDebugView)initWithCoder:(id)a3;
- (_TtC7Measure17AccuracyDebugView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
@end

@implementation AccuracyDebugView

- (_TtC7Measure17AccuracyDebugView)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure17AccuracyDebugView *)sub_1000570D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure17AccuracyDebugView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17AccuracyDebugView_maxWidth) = 0;
  id v4 = a3;

  result = (_TtC7Measure17AccuracyDebugView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_100057548();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17AccuracyDebugView_currentLineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Measure17AccuracyDebugView_currentEstimatedErrorLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure17AccuracyDebugView_planeTypesLabel);
}

@end