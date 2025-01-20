@interface ProductRatingsHistogramView
- (NSArray)accessibilityProgressBarViews;
- (NSArray)accessibilityStarViews;
- (_TtC8AppStore27ProductRatingsHistogramView)init;
- (_TtC8AppStore27ProductRatingsHistogramView)initWithCoder:(id)a3;
- (_TtC8AppStore27ProductRatingsHistogramView)initWithFrame:(CGRect)a3;
@end

@implementation ProductRatingsHistogramView

- (_TtC8AppStore27ProductRatingsHistogramView)init
{
  return (_TtC8AppStore27ProductRatingsHistogramView *)sub_10047EE58();
}

- (_TtC8AppStore27ProductRatingsHistogramView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore27ProductRatingsHistogramView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)accessibilityStarViews
{
  swift_beginAccess();
  type metadata accessor for RatingView();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (NSArray)accessibilityProgressBarViews
{
  NSArray v2 = self;
  sub_10047FE3C();

  sub_100084CF0(0, (unint64_t *)&qword_1009828E0);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC8AppStore27ProductRatingsHistogramView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end