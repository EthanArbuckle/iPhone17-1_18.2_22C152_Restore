@interface ShowMyLocationCardActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ShowMyLocationCardActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v11 appCoordinator];
    v8 = [v7 chromeViewController];
    v9 = [v8 mapView];

    v10 = [v9 userLocation];
    [v9 selectAnnotation:v10 animated:1];
  }
}

@end