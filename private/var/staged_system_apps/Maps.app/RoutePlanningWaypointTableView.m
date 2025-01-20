@interface RoutePlanningWaypointTableView
- (id)postLayoutHandler;
- (void)layoutSubviews;
- (void)setPostLayoutHandler:(id)a3;
@end

@implementation RoutePlanningWaypointTableView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningWaypointTableView;
  [(RoutePlanningWaypointTableView *)&v5 layoutSubviews];
  v3 = [(RoutePlanningWaypointTableView *)self postLayoutHandler];

  if (v3)
  {
    v4 = [(RoutePlanningWaypointTableView *)self postLayoutHandler];
    v4[2]();
  }
}

- (id)postLayoutHandler
{
  return self->_postLayoutHandler;
}

- (void)setPostLayoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end