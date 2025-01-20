@interface PresentNearbySearchActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation PresentNearbySearchActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v8 = a4;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v8 chrome];
    [v7 displayNearbySearch];
  }
}

@end