@interface IOSSiriContextProvider
- (MKMapView)mapView;
- (NSArray)searchResults;
- (SiriMapItemConvertible)selectedPOI;
- (SiriMapItemConvertible)selectedResult;
@end

@implementation IOSSiriContextProvider

- (MKMapView)mapView
{
  v2 = +[UIApplication sharedMapsDelegate];
  v3 = [v2 chromeViewController];
  v4 = [v3 mapView];

  return (MKMapView *)v4;
}

- (SiriMapItemConvertible)selectedPOI
{
  v2 = [(IOSSiriContextProvider *)self mapView];
  v3 = [v2 _selectedLabelMarker];

  if (!v3
    || ([v3 isTrafficIncident] & 1) != 0
    || ([v3 isTransitLine] & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6 = +[UIApplication sharedMapsDelegate];
    v7 = [v6 poiSearchManager];

    v8 = [v3 identifier];
    v4 = [v7 searchResultForIdentifier:v8];

    if (!v4) {
      v4 = [[POIPlaceholderSearchResult alloc] initWithLabelMarker:v3];
    }
  }

  return (SiriMapItemConvertible *)v4;
}

- (NSArray)searchResults
{
  v2 = +[SearchSession currentSearchSession];
  v3 = [v2 currentResults];

  return (NSArray *)v3;
}

- (SiriMapItemConvertible)selectedResult
{
  v2 = +[SearchSession currentSearchSession];
  v3 = [v2 currentResultsSearchInfo];
  v4 = [v3 selectedResult];

  return (SiriMapItemConvertible *)v4;
}

@end