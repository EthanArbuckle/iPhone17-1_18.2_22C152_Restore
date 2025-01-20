@interface DisplayModeNavActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation DisplayModeNavActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v15;
    v7 = +[MNNavigationService sharedService];
    unsigned int v8 = [v7 isInNavigatingState];

    if (v8)
    {
      v9 = +[CarDisplayController sharedInstance];
      unsigned int v10 = [v9 isCurrentlyConnectedToAnyCarScene];

      unsigned int v11 = [v6 showDetails];
      if (v10)
      {
        v12 = +[CarChromeModeCoordinator sharedInstance];
        v13 = v12;
        if (v11) {
          [v12 goToDetail];
        }
        else {
          [v12 goToOverview];
        }
      }
      else
      {
        v14 = [v5 navActionCoordinator];
        v13 = v14;
        if (v11) {
          [v14 pressedZoomToManeuverWithSender:0];
        }
        else {
          [v14 pressedShowOverviewWithSender:0];
        }
      }
    }
  }
}

@end