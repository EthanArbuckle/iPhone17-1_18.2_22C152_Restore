@interface PresentTableBookingActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentTableBookingActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    v7 = [v5 appCoordinator];
    v8 = [v6 mapItem];

    [v7 startTableBookingFlowFromMapItem:v8];
  }
}

@end