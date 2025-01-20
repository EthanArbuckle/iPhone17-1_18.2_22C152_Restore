@interface MapsImpressionsPlaceCardFloatingDebugViewController
+ (MapsImpressionsPlaceCardFloatingDebugViewController)sharedInstance;
- (id)iconText;
@end

@implementation MapsImpressionsPlaceCardFloatingDebugViewController

+ (MapsImpressionsPlaceCardFloatingDebugViewController)sharedInstance
{
  if (qword_101610FF0 != -1) {
    dispatch_once(&qword_101610FF0, &stru_1013221A0);
  }
  v2 = (void *)qword_101610FE8;

  return (MapsImpressionsPlaceCardFloatingDebugViewController *)v2;
}

- (id)iconText
{
  return @"Placecard Impressions";
}

@end