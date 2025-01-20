@interface UIViewController
+ (id)_makeSearchResultsViewControllerWithViewModel:(id)a3;
@end

@implementation UIViewController

+ (id)_makeSearchResultsViewControllerWithViewModel:(id)a3
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for SearchResultsViewController());
  id v5 = a3;
  id result = (id)sub_100007874(v5);
  if (result)
  {
    id v7 = result;
    id v8 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:result];

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end