@interface ShowCarDestinationsActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ShowCarDestinationsActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = +[CarChromeModeCoordinator sharedInstance];
    [v6 displayDestinations];
  }
}

@end