@interface CarSiriContextProvider
- (MKMapView)mapView;
- (NSArray)searchResults;
- (SiriMapItemConvertible)selectedPOI;
- (SiriMapItemConvertible)selectedResult;
- (id)_visuallySelectedResult;
@end

@implementation CarSiriContextProvider

- (id)_visuallySelectedResult
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 chromeViewController];
  v4 = [v3 visuallySelectedItem];

  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (MKMapView)mapView
{
  v2 = +[CarDisplayController sharedInstance];
  v3 = [v2 chromeViewController];
  v4 = [v3 mapView];

  return (MKMapView *)v4;
}

- (SiriMapItemConvertible)selectedPOI
{
  return 0;
}

- (NSArray)searchResults
{
  v3 = +[SearchSession currentSearchSession];
  v4 = [v3 currentResults];

  id v5 = [(CarSiriContextProvider *)self _visuallySelectedResult];
  if (v5 && ![v4 containsObject:v5]) {
    id v6 = 0;
  }
  else {
    id v6 = v4;
  }

  return (NSArray *)v6;
}

- (SiriMapItemConvertible)selectedResult
{
  v2 = [(CarSiriContextProvider *)self _visuallySelectedResult];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = +[SearchSession currentSearchSession];
    id v6 = [v5 currentResultsSearchInfo];
    id v4 = [v6 selectedResult];
  }

  return (SiriMapItemConvertible *)v4;
}

@end