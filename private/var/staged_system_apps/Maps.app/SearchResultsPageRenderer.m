@interface SearchResultsPageRenderer
- (CGRect)overviewRect;
- (SearchResultsPageRenderer)initWithSearchResults:(id)a3 title:(id)a4 subTitle:(id)a5 mapView:(id)a6;
- (double)_zoomLevelForCoordinateRegion:(id *)a3 clampTo:(double)a4;
- (id)computeCurrentPrintInfo;
- (int64_t)numberOfPages;
- (int64_t)searchResultsPerPage;
- (void)_drawPinsInRect:(CGRect)a3 zoomLevel:(double)a4;
- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)prepareForDrawingPages:(_NSRange)a3;
@end

@implementation SearchResultsPageRenderer

- (SearchResultsPageRenderer)initWithSearchResults:(id)a3 title:(id)a4 subTitle:(id)a5 mapView:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SearchResultsPageRenderer;
  v15 = [(MapCachedPageRenderer *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchResults, a3);
    [(MapPageRenderer *)v16 setTitle:v12];
    [(MapPageRenderer *)v16 setSubTitle:v13];
    [(MapPageRenderer *)v16 setMapView:v14];
  }

  return v16;
}

- (id)computeCurrentPrintInfo
{
  uint64_t v3 = [(SearchResultsPageRenderer *)self searchResultsPerPage];
  if ((unint64_t)v3 >= 2)
  {
    uint64_t v38 = v3;
    unint64_t v40 = vcvtps_s32_f32((float)[(NSArray *)self->_searchResults count] / (float)v3);
    id v43 = objc_alloc_init((Class)NSMutableArray);
    [(SearchResultsPageRenderer *)self paperRect];
    CGFloat v6 = v5;
    id obja = v7;
    CGFloat rect = v8;
    CGFloat v10 = v9;
    [(SearchResultsPageRenderer *)self overviewRect];
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat height = v50.size.height;
    double v15 = CGRectGetMaxX(v50) + 41.0;
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = y;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v51);
    v52.origin.CGFloat x = v6;
    *(void *)&v52.origin.CGFloat y = obja;
    v52.size.CGFloat width = rect;
    v52.size.CGFloat height = v10;
    double v17 = CGRectGetMaxX(v52) - v15 + -63.0;
    v53.origin.CGFloat x = x;
    v53.origin.CGFloat y = y;
    v53.size.CGFloat width = width;
    v53.size.CGFloat height = height;
    CGFloat v18 = CGRectGetHeight(v53);
    v54.origin.CGFloat x = v15;
    v54.origin.CGFloat y = MinY;
    v54.size.CGFloat width = v17;
    v54.size.CGFloat height = v18;
    double v19 = CGRectGetHeight(v54);
    v55.origin.CGFloat x = v15;
    v55.origin.CGFloat y = MinY;
    v55.size.CGFloat width = v17;
    v55.size.CGFloat height = v18;
    double v20 = CGRectGetWidth(v55);
    v56.origin.CGFloat x = v15;
    v56.origin.CGFloat y = MinY;
    v56.size.CGFloat width = v17;
    v56.size.CGFloat height = v18;
    double MinX = CGRectGetMinX(v56);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obj = self->_searchResults;
    id v22 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v45;
      uint64_t v25 = 1;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v44 + 1) + 8 * i);
          v28 = [(MapPageRenderer *)self mapView];
          v29 = +[SearchResultCell cellWithSearchResult:order:mapType:](SearchResultCell, "cellWithSearchResult:order:mapType:", v27, (char *)i + v25, [v28 mapType]);

          [v29 setFrame:MinX, 0.0, v20, 81.5];
          [v43 addObject:v29];
        }
        id v23 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        v25 += (uint64_t)i;
      }
      while (v23);
    }

    id v30 = [v43 count];
    v57.origin.CGFloat x = v15;
    v57.origin.CGFloat y = MinY;
    v57.size.CGFloat width = v17;
    v57.size.CGFloat height = v18;
    double v31 = CGRectGetMinY(v57);
    if (v30)
    {
      double v32 = v31;
      uint64_t v33 = 0;
      v34 = 0;
      double v35 = (v19 + (double)v38 * -81.5) / (double)(v38 - 1) + 81.5;
      do
      {
        v36 = v34;
        v34 = [v43 objectAtIndexedSubscript:v33];

        [v34 setY:v32];
        [v34 setPage:v33 / v38];
        double v32 = v35 + v32;
        v58.origin.CGFloat x = v15;
        v58.origin.CGFloat y = MinY;
        v58.size.CGFloat width = v17;
        v58.size.CGFloat height = v18;
        if (v32 >= CGRectGetMaxY(v58))
        {
          v59.origin.CGFloat x = v15;
          v59.origin.CGFloat y = MinY;
          v59.size.CGFloat width = v17;
          v59.size.CGFloat height = v18;
          double v32 = CGRectGetMinY(v59);
        }
        ++v33;
      }
      while (v30 != (id)v33);
    }
    v4 = [[MapsSearchPrintingInfo alloc] initWithNumberOfPages:v40 searchResultCells:v43];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)numberOfPages
{
  v2 = [(MapCachedPageRenderer *)self currentPrintInfo];
  id v3 = [v2 numberOfPages];

  return (int64_t)v3;
}

- (CGRect)overviewRect
{
  [(SearchResultsPageRenderer *)self paperRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SearchResultsPageRenderer *)self printableRect];
  uint64_t r2 = v11;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  v29.origin.CGFloat x = v4;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v10;
  CGFloat v18 = CGRectGetWidth(v29) * 0.5 + -63.0 + -20.0;
  v30.origin.CGFloat x = v4;
  v30.origin.CGFloat y = v6;
  v30.size.CGFloat width = v8;
  v30.size.CGFloat height = v10;
  double v19 = CGRectGetHeight(v30) + -76.5 + -69.5;
  uint64_t v20 = 0x404F800000000000;
  uint64_t v21 = 0x4053200000000000;
  CGFloat v22 = v18;
  uint64_t v23 = r2;
  uint64_t v24 = v13;
  uint64_t v25 = v15;
  uint64_t v26 = v17;

  return CGRectIntersection(*(CGRect *)&v20, *(CGRect *)&v23);
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  CGFloat v4 = malloc_type_malloc(16 * [(NSArray *)self->_searchResults count], 0x1000040451B5BE8uLL);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v5 = self->_searchResults;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      CGFloat v10 = 0;
      uint64_t v11 = (uint64_t)v4 + 16 * v8 + 8;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) coordinate:v20];
        *(MKMapPoint *)(v11 - 8) = MKMapPointForCoordinate(v25);
        CGFloat v10 = (char *)v10 + 1;
        v11 += 16;
      }
      while (v7 != v10);
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v8 += (uint64_t)v10;
    }
    while (v7);
  }

  MKMapRectBoundingMapPoints();
  MKCoordinateRegion v27 = MKCoordinateRegionForMapRect(v26);
  double latitude = v27.center.latitude;
  double longitude = v27.center.longitude;
  double latitudeDelta = v27.span.latitudeDelta;
  double longitudeDelta = v27.span.longitudeDelta;
  self->super.super._centerCoordinate.double latitude = v27.center.latitude;
  self->super.super._centerCoordinate.double longitude = v27.center.longitude;
  NSUInteger v16 = [(NSArray *)self->_searchResults count];
  double v17 = -1.0;
  if (v16 == 1)
  {
    [(MKMapView *)self->super.super._mapView _zoomLevel];
    double v17 = floor(v18) + -1.0;
  }
  -[SearchResultsPageRenderer _zoomLevelForCoordinateRegion:clampTo:](self, "_zoomLevelForCoordinateRegion:clampTo:", latitude, longitude, latitudeDelta, longitudeDelta, v17, (void)v20);
  self->super.super._zoomLevel = v19;
  free(v4);
}

- (int64_t)searchResultsPerPage
{
  [(SearchResultsPageRenderer *)self overviewRect];
  return vcvtmd_s64_f64(CGRectGetHeight(v3) / 86.5);
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  self->super.super._topContentIconType = 7;
  v4.receiver = self;
  v4.super_class = (Class)SearchResultsPageRenderer;
  -[MapPageRenderer drawTopContentInRect:forPageAtIndex:](&v4, "drawTopContentInRect:forPageAtIndex:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_drawPinsInRect:(CGRect)a3 zoomLevel:(double)a4
{
  [(SearchResultsPageRenderer *)self overviewRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  MKZoomScaleForZoomLevelF();
  CGFloat v14 = v13;
  *(_OWORD *)id obja = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v47.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v47.c = *(_OWORD *)obja;
  *(_OWORD *)&v47.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v36 = *(_OWORD *)&v47.tx;
  double x = self->_topLeftCorner.x;
  v49.origin.double x = v6;
  v49.origin.double y = v8;
  v49.size.CGFloat width = v10;
  v49.size.CGFloat height = v12;
  CGFloat v16 = CGRectGetMinX(v49) - x;
  double y = self->_topLeftCorner.y;
  v50.origin.double x = v6;
  v50.origin.double y = v8;
  v50.size.CGFloat width = v10;
  v50.size.CGFloat height = v12;
  CGFloat MinY = CGRectGetMinY(v50);
  *(_OWORD *)&v46.a = *(_OWORD *)&v47.a;
  *(_OWORD *)&v46.c = *(_OWORD *)obja;
  *(_OWORD *)&v46.tdouble x = *(_OWORD *)&v47.tx;
  CGAffineTransformTranslate(&v47, &v46, v16, MinY - y);
  CGAffineTransform v45 = v47;
  CGAffineTransformScale(&v46, &v45, v14, v14);
  CGAffineTransform v47 = v46;
  [(UIColor *)self->super.super._calloutTextColor set];
  double v19 = [(MapCachedPageRenderer *)self currentPrintInfo];
  long long v20 = [v19 searchResultCells];

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10050FC90;
  v43[3] = &unk_1012ED930;
  CGAffineTransform v44 = v47;
  [v20 sortedArrayUsingComparator:v43];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obj = long long v42 = 0u;
  id v21 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        CLLocationCoordinate2D v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        CGAffineTransform v46 = v47;
        [v25 transformedPoint:&v46 v36];
        double v27 = v26;
        double v29 = v28;
        +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", 6, v26 + -17.0000005, v28 + -35.0, 34.000001, 40.0);
        CGRect v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v25 order]);
        double v31 = +[NSNumberFormatter localizedStringFromNumber:v30 numberStyle:0];

        double v32 = +[UIFont boldSystemFontOfSize:9.0];
        [v31 _maps_sizeWithFont:v32];
        double v34 = v33;

        double v35 = +[UIFont boldSystemFontOfSize:9.0];
        [v31 _maps_drawAtPoint:v35 withFont:v27 + v34 * -0.5, v29 + -26.0];
      }
      id v22 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v22);
  }
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  [v10 addObject:self];
  long long v40 = self;
  double v11 = [(MapCachedPageRenderer *)self currentPrintInfo];
  CGFloat v12 = [v11 searchResultCells];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([v18 page] == (id)a3) {
          [v10 addObject:v18];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v15);
  }

  double v19 = +[UIPrintInteractionController sharedPrintController];
  [v19 _enableManualPrintPage:1];

  while ([v10 count])
  {
    long long v20 = [v10 objectAtIndexedSubscript:0];
    uint64_t v21 = [v20 snapshotBlock];
    id v22 = (void *)v21;
    if (v21)
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
      uint64_t v23 = +[NSDate date];
      if (([v20 hasSnapshot] & 1) == 0)
      {
        do
        {
          CLLocationCoordinate2D v25 = +[NSRunLoop currentRunLoop];
          double v26 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
          [v25 runUntilDate:v26];

          double v27 = +[NSDate date];
          [v27 timeIntervalSinceDate:v23];
          double v29 = v28;
        }
        while (([v20 hasSnapshot] & 1) == 0 && v29 <= 30.0);
      }
    }
    [v20 releaseSnapshotCreator];
    [v10 removeObjectAtIndex:0];
  }
  CGRect v30 = +[UIPrintInteractionController sharedPrintController];
  double v31 = [v30 printPageRenderer];

  if (v31)
  {
    double v32 = +[UIPrintInteractionController sharedPrintController];
    [v32 _enableManualPrintPage:0];

    [(MapPageRenderer *)v40 drawOverview];
    double v33 = [[MapScaleCell alloc] initWithDistanceInMeters:MKMetersBetweenMapPoints((MKMapPoint)v40->_mlMapPoint, (MKMapPoint)v40->_mrMapPoint)];
    [(SearchResultsPageRenderer *)v40 overviewRect];
    -[MapScaleCell drawInRect:](v33, "drawInRect:");
    -[SearchResultsPageRenderer _drawPinsInRect:zoomLevel:](v40, "_drawPinsInRect:zoomLevel:", x, y, width, height, v40->super.super._zoomLevel);
    -[SearchResultsPageRenderer drawTopContentInRect:forPageAtIndex:](v40, "drawTopContentInRect:forPageAtIndex:", a3, x, y, width, height);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v34 = v13;
    id v35 = [v34 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v42;
      do
      {
        for (j = 0; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v42 != v37) {
            objc_enumerationMutation(v34);
          }
          long long v39 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
          if ([v39 page] == (id)a3) {
            [v39 drawInRect:x, y, width, height];
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v36);
    }
  }
}

- (void).cxx_destruct
{
}

- (double)_zoomLevelForCoordinateRegion:(id *)a3 clampTo:(double)a4
{
  double v7 = v6;
  double v38 = v4;
  double v39 = v5;
  [(SearchResultsPageRenderer *)self overviewRect];
  double v10 = v9 * 0.5;
  double v12 = v11 * 0.5;
  if (v7 <= 0.0) {
    uint64_t v13 = 18;
  }
  else {
    uint64_t v13 = (uint64_t)v7;
  }
  if (v7 <= 0.0) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = (uint64_t)(v7 + -1.0);
  }
  double v15 = (double)v13;
  MKTilePointForCoordinate();
  if (v13 <= v14)
  {
    double v35 = v16 - v10;
    double v30 = v17 - v12;
  }
  else
  {
    while (1)
    {
      double v15 = (double)v13;
      MKTilePointForCoordinate();
      double v19 = v18 - v10;
      double v20 = v10;
      double v22 = v21 - v12;
      double v23 = v12;
      double v37 = v19;
      MKCoordinateForTilePoint();
      CLLocationDegrees coordinate = v24;
      double v26 = v25;
      MKCoordinateForTilePoint();
      CLLocationDegrees v42 = v27;
      double v29 = v28;
      double v30 = v22;
      MKCoordinateForTilePoint();
      double coordinate_8 = v31;
      MKCoordinateForTilePoint();
      double v33 = v32;
      v43.double latitude = coordinate;
      v43.double longitude = v26;
      self->_mlMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v43);
      v44.double latitude = v42;
      v44.double longitude = v29;
      self->_mrMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v44);
      if (coordinate_8 - v33 + 0.0001 >= v38 && v29 - v26 + 0.0001 >= v39) {
        break;
      }
      --v13;
      double v10 = v20;
      double v12 = v23;
      if (v13 <= v14)
      {
        double v15 = (double)v14;
        break;
      }
    }
    double v35 = v37;
  }
  self->_topLeftCorner.double x = v35;
  self->_topLeftCorner.double y = v30;
  return v15;
}

@end