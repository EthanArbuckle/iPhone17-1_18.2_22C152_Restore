@interface InsightsCalendarDetailTabView.Coordinator
- (_TtCV7Journal29InsightsCalendarDetailTabView11Coordinator)init;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
@end

@implementation InsightsCalendarDetailTabView.Coordinator

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return sub_100664E60(self, (uint64_t)a2, a3, a4, -1);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return sub_100664E60(self, (uint64_t)a2, a3, a4, 1);
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  id v7 = a3;
  v8 = self;
  sub_100667AD4(v7);
}

- (_TtCV7Journal29InsightsCalendarDetailTabView11Coordinator)init
{
  result = (_TtCV7Journal29InsightsCalendarDetailTabView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end