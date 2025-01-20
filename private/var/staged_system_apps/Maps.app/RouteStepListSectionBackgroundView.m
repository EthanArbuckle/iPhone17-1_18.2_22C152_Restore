@interface RouteStepListSectionBackgroundView
+ (id)decorationViewKind;
- (RouteStepListSectionBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation RouteStepListSectionBackgroundView

+ (id)decorationViewKind
{
  return @"RouteStepListSectionBackgroundView";
}

- (RouteStepListSectionBackgroundView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RouteStepListSectionBackgroundView;
  v3 = -[RouteStepListSectionBackgroundView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RouteStepListSectionBackgroundView *)v3 _setContinuousCornerRadius:10.0];
    v5 = +[UIColor colorNamed:@"RoutePlanningPlatterBackground"];
    [(RouteStepListSectionBackgroundView *)v4 setBackgroundColor:v5];
  }
  return v4;
}

@end