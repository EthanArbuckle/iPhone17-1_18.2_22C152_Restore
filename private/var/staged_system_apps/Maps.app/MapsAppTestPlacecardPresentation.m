@interface MapsAppTestPlacecardPresentation
- (BOOL)runTest;
- (void)cleanup:(BOOL)a3;
- (void)startPlaceViewControllerPresentationTest;
@end

@implementation MapsAppTestPlacecardPresentation

- (BOOL)runTest
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"finishedTest" name:MKPlaceViewControllerDidShowNotification object:0];

  [(MapsAppTestPlacecardPresentation *)self performSelector:"startPlaceViewControllerPresentationTest" withObject:0 afterDelay:1.0];
  return 1;
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(MapsAppTest *)self dismissTrayWithAssertTrayType:1 completion:0];
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestPlacecardPresentation;
  [(MapsAppTest *)&v5 cleanup:v3];
}

- (void)startPlaceViewControllerPresentationTest
{
  BOOL v3 = [(MapsAppTest *)self options];
  [v3 _mapstest_location];
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [objc_alloc((Class)MKMapItem) initWithCLLocation:v7];
  objc_super v5 = [[SearchResult alloc] initWithMapItem:v4];
  [(MapsAppTest *)self startedTest];
  v6 = [(MapsAppTest *)self testCoordinator];
  [v6 pptTestPresentPlaceCardForSearchResult:v5 animated:1];
}

@end