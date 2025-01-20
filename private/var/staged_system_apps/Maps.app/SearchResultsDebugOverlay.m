@interface SearchResultsDebugOverlay
+ (id)rendererWithPolygon:(id)a3;
+ (id)viewForAnnotation:(id)a3;
- (MKMapView)mapView;
- (NSMutableArray)polygons;
- (SearchResultsDebugOverlay)initWithMapView:(id)a3;
- (id)annotationTitleWithMapRegion:(id)a3 title:(id)a4;
- (id)polygonForMapRegion:(id)a3 title:(id)a4;
- (void)drawDebugMapRegionsWithSearchResults:(id)a3 suggestedMapRegion:(id)a4;
- (void)removeDrawnDebugMapRegions;
- (void)setMapView:(id)a3;
- (void)setPolygons:(id)a3;
@end

@implementation SearchResultsDebugOverlay

- (SearchResultsDebugOverlay)initWithMapView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchResultsDebugOverlay;
  v6 = [(SearchResultsDebugOverlay *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapView, a3);
  }

  return v7;
}

- (void)drawDebugMapRegionsWithSearchResults:(id)a3 suggestedMapRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SearchResultsDebugOverlay *)self polygons];
  id v9 = [v8 count];

  if (v9) {
    [(SearchResultsDebugOverlay *)self removeDrawnDebugMapRegions];
  }
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v6, "count") + 1);
  [(SearchResultsDebugOverlay *)self setPolygons:v10];

  if (v7)
  {
    v11 = [(SearchResultsDebugOverlay *)self polygonForMapRegion:v7 title:@"searchResultsRegion"];
    v12 = +[UIColor blueColor];
    [v11 setStrokeColor:v12];

    v13 = [(SearchResultsDebugOverlay *)self polygons];
    [v13 addObject:v11];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v6;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v20 = [v19 mapItem:v29];
        v21 = [v20 _displayMapRegion];

        if (v21)
        {
          v22 = [v19 title];
          v23 = [(SearchResultsDebugOverlay *)self polygonForMapRegion:v21 title:v22];

          v24 = [(SearchResultsDebugOverlay *)self polygons];
          [v24 addObject:v23];
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  v25 = [(SearchResultsDebugOverlay *)self mapView];
  v26 = [(SearchResultsDebugOverlay *)self polygons];
  [v25 addOverlays:v26];

  v27 = [(SearchResultsDebugOverlay *)self mapView];
  v28 = [(SearchResultsDebugOverlay *)self polygons];
  [v27 addAnnotations:v28];
}

- (void)removeDrawnDebugMapRegions
{
  v3 = [(SearchResultsDebugOverlay *)self mapView];
  v4 = [(SearchResultsDebugOverlay *)self polygons];
  [v3 removeOverlays:v4];

  id v5 = [(SearchResultsDebugOverlay *)self mapView];
  id v6 = [(SearchResultsDebugOverlay *)self polygons];
  [v5 removeAnnotations:v6];

  [(SearchResultsDebugOverlay *)self setPolygons:0];
}

- (id)polygonForMapRegion:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 northLat];
  CLLocationDegrees v9 = v8;
  [v7 westLng];
  CLLocationCoordinate2D v28 = CLLocationCoordinate2DMake(v9, v10);
  MKMapPoint v11 = MKMapPointForCoordinate(v28);
  [v7 northLat];
  CLLocationDegrees v13 = v12;
  [v7 eastLng];
  CLLocationCoordinate2D v29 = CLLocationCoordinate2DMake(v13, v14);
  MKMapPoint v15 = MKMapPointForCoordinate(v29);
  [v7 southLat];
  CLLocationDegrees v17 = v16;
  [v7 eastLng];
  CLLocationCoordinate2D v30 = CLLocationCoordinate2DMake(v17, v18);
  MKMapPoint v19 = MKMapPointForCoordinate(v30);
  [v7 southLat];
  CLLocationDegrees v21 = v20;
  [v7 westLng];
  CLLocationCoordinate2D v31 = CLLocationCoordinate2DMake(v21, v22);
  v26[0] = v11;
  v26[1] = v15;
  v26[2] = v19;
  v26[3] = MKMapPointForCoordinate(v31);
  v23 = +[SearchResultDebugPolygon polygonWithPoints:v26 count:4];
  v24 = [(SearchResultsDebugOverlay *)self annotationTitleWithMapRegion:v7 title:v6];

  [v23 setTitle:v24];

  return v23;
}

- (id)annotationTitleWithMapRegion:(id)a3 title:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 eastLng];
  double v8 = +[NSString stringWithFormat:@"eastLng : %f", v7];
  [v6 westLng];
  CLLocationDegrees v10 = +[NSString stringWithFormat:@"westLng : %f", v9];
  [v6 northLat];
  double v12 = +[NSString stringWithFormat:@"northLat : %f", v11];
  [v6 southLat];
  uint64_t v14 = v13;

  MKMapPoint v15 = +[NSString stringWithFormat:@"southLat : %f", v14];
  double v16 = +[NSString stringWithFormat:@"{%@ %@ %@ %@}", v8, v10, v12, v15];
  CLLocationDegrees v17 = +[NSString stringWithFormat:@"%@: %@", v5, v16];

  return v17;
}

+ (id)rendererWithPolygon:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MKPolygonRenderer) initWithPolygon:v3];
  id v5 = [v3 strokeColor];

  id v6 = [v5 colorWithAlphaComponent:0.800000012];
  [v4 setStrokeColor:v6];

  [v4 setLineWidth:1.0];

  return v4;
}

+ (id)viewForAnnotation:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MKAnnotationView) initWithAnnotation:v3 reuseIdentifier:@"polygonAnnotation"];

  return v4;
}

- (NSMutableArray)polygons
{
  return self->_polygons;
}

- (void)setPolygons:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);

  objc_storeStrong((id *)&self->_polygons, 0);
}

@end