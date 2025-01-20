@interface MapsImpressionsSearchResultsFloatingDebugViewController
+ (MapsImpressionsSearchResultsFloatingDebugViewController)sharedInstance;
- (id)iconText;
@end

@implementation MapsImpressionsSearchResultsFloatingDebugViewController

+ (MapsImpressionsSearchResultsFloatingDebugViewController)sharedInstance
{
  if (qword_101611000 != -1) {
    dispatch_once(&qword_101611000, &stru_1013221C0);
  }
  v2 = (void *)qword_101610FF8;

  return (MapsImpressionsSearchResultsFloatingDebugViewController *)v2;
}

- (id)iconText
{
  return @"Search Impressions";
}

@end