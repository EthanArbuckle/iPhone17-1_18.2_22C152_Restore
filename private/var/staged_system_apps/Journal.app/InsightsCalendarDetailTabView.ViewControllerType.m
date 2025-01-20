@interface InsightsCalendarDetailTabView.ViewControllerType
- (_TtCV7Journal29InsightsCalendarDetailTabView18ViewControllerType)initWithCoder:(id)a3;
- (_TtCV7Journal29InsightsCalendarDetailTabView18ViewControllerType)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (void)didMoveToParentViewController:(id)a3;
- (void)setContentScrollView:(id)a3 forEdge:(unint64_t)a4;
@end

@implementation InsightsCalendarDetailTabView.ViewControllerType

- (void)didMoveToParentViewController:(id)a3
{
  if (a3)
  {
    v4 = self;
    id v5 = a3;
    id v6 = [(InsightsCalendarDetailTabView.ViewControllerType *)v4 contentScrollViewForEdge:1];
    [v5 setContentScrollView:v6 forEdge:1];
  }
}

- (void)setContentScrollView:(id)a3 forEdge:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InsightsCalendarDetailTabView.ViewControllerType();
  id v6 = a3;
  id v7 = v10.receiver;
  [(InsightsCalendarDetailTabView.ViewControllerType *)&v10 setContentScrollView:v6 forEdge:a4];
  if (a4 == 1)
  {
    [v7 parentViewController];
    if (v8)
    {
      id v9 = v8;
      [v8 setContentScrollView:v6 forEdge:1];

      id v6 = v7;
      id v7 = v9;
    }
  }
}

- (_TtCV7Journal29InsightsCalendarDetailTabView18ViewControllerType)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  isa = a5;
  if (a5)
  {
    type metadata accessor for OptionsKey(0);
    sub_1006666CC(&qword_1007F8C10, type metadata accessor for OptionsKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for InsightsCalendarDetailTabView.ViewControllerType();
  id v9 = [(InsightsCalendarDetailTabView.ViewControllerType *)&v11 initWithTransitionStyle:a3 navigationOrientation:a4 options:isa];

  return v9;
}

- (_TtCV7Journal29InsightsCalendarDetailTabView18ViewControllerType)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InsightsCalendarDetailTabView.ViewControllerType();
  return [(InsightsCalendarDetailTabView.ViewControllerType *)&v5 initWithCoder:a3];
}

@end