@interface SimpleMapPageRenderer
- (CGRect)overviewRect;
- (SimpleMapPageRenderer)initWithMapView:(id)a3;
- (void)_setTitlesWithMapItem:(id)a3;
- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)prepareForDrawingPages:(_NSRange)a3;
@end

@implementation SimpleMapPageRenderer

- (SimpleMapPageRenderer)initWithMapView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SimpleMapPageRenderer;
  v5 = [(MapPageRenderer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MapPageRenderer *)v5 setMapView:v4];
  }

  return v6;
}

- (CGRect)overviewRect
{
  [(SimpleMapPageRenderer *)self paperRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SimpleMapPageRenderer *)self printableRect];
  uint64_t r2 = v11;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  CGFloat v18 = CGRectGetWidth(v29) + -126.0;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
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
  [(MKMapView *)self->super._mapView _zoomLevel];
  self->super._zoomLevel = v4;
  [(MapPageRenderer *)self visibleMapRect];
  v9.x = v6 + v5 * 0.5;
  v9.y = v8 + v7 * 0.5;
  self->super._centerCoordinate = MKCoordinateForMapPoint(v9);
}

- (void)_setTitlesWithMapItem:(id)a3
{
  id v19 = a3;
  double v4 = [v19 _geoAddress];
  double v5 = [v4 structuredAddress];

  double widthInMeters = self->_widthInMeters;
  title = self->super._title;
  self->super._title = 0;

  subTitle = self->super._subTitle;
  self->super._subTitle = 0;

  MKMapPoint v9 = [v5 areaOfInterests];
  CGFloat v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectAtIndexedSubscript:0];
LABEL_16:
    uint64_t v13 = self->super._title;
    self->super._title = v11;

    goto LABEL_17;
  }
  if ([v5 hasInlandWater])
  {
    uint64_t v11 = [v5 inlandWater];
    goto LABEL_16;
  }
  if ([v5 hasOcean])
  {
    uint64_t v11 = [v5 ocean];
    goto LABEL_16;
  }
  uint64_t v12 = [v19 _addressFormattedAsCity];

  if (v12 && widthInMeters < 300000.0)
  {
    uint64_t v11 = [v19 _addressFormattedAsCity];
    goto LABEL_16;
  }
  if ([v5 hasSubLocality] && widthInMeters < 300000.0)
  {
    uint64_t v11 = [v5 subLocality];
    goto LABEL_16;
  }
  if ([v5 hasSubAdministrativeArea] && widthInMeters < 300000.0)
  {
    uint64_t v11 = [v5 subAdministrativeArea];
    goto LABEL_16;
  }
  if ([v5 hasAdministrativeArea])
  {
    uint64_t v15 = [v5 administrativeArea];
    uint64_t v16 = self->super._title;
    self->super._title = v15;

    goto LABEL_21;
  }
  if ([v5 hasCountry])
  {
    CGFloat v18 = [v5 country];
    uint64_t v17 = self->super._title;
    self->super._title = v18;
    goto LABEL_24;
  }
LABEL_17:
  if (![v5 hasAdministrativeArea])
  {
LABEL_21:
    if (![v5 hasCountry]) {
      goto LABEL_25;
    }
    uint64_t v14 = [v5 country];
    goto LABEL_23;
  }
  uint64_t v14 = [v5 administrativeArea];
LABEL_23:
  uint64_t v17 = self->super._subTitle;
  self->super._subTitle = v14;
LABEL_24:

LABEL_25:
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  self->super._topContentIconType = 7;
  v4.receiver = self;
  v4.super_class = (Class)SimpleMapPageRenderer;
  -[MapPageRenderer drawTopContentInRect:forPageAtIndex:](&v4, "drawTopContentInRect:forPageAtIndex:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(MapPageRenderer *)self visibleMapRect];
  double v10 = v9 + v8 * 0.5;
  double v13 = v12 + v11 * 0.5;
  [(SimpleMapPageRenderer *)self overviewRect];
  double v15 = v14;
  double v17 = v16;
  MKZoomScaleForZoomLevelF();
  double v19 = v15 / v18;
  double v20 = v17 / v18;
  v45.double x = v10 - v15 / v18 * 0.5;
  v45.double y = v20 * 0.5 + v13 - v20 * 0.5;
  v46.double x = v19 + v45.x;
  v46.double y = v45.y;
  self->_double widthInMeters = MKMetersBetweenMapPoints(v45, v46);
  uint64_t v21 = [(MapPageRenderer *)self snapshotBlock];
  CGFloat v22 = (void *)v21;
  if (v21) {
    (*(void (**)(uint64_t))(v21 + 16))(v21);
  }
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  uint64_t v23 = +[MKMapService sharedService];
  uint64_t v24 = [v23 ticketForReverseGeocodeCoordinate:self->super._centerCoordinate.latitude, self->super._centerCoordinate.longitude];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10050D10C;
  v40[3] = &unk_1012ED898;
  v40[4] = self;
  v40[5] = &v41;
  [v24 submitWithHandler:v40 networkActivity:0];
  uint64_t v25 = +[UIPrintInteractionController sharedPrintController];
  [v25 _enableManualPrintPage:1];

  uint64_t v26 = +[NSDate date];
  double v27 = 0.0;
  while (!*((unsigned char *)v42 + 24))
  {
    if (v27 > 30.0) {
      goto LABEL_13;
    }
LABEL_12:
    CGRect v30 = +[NSRunLoop currentRunLoop];
    v31 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
    [v30 runUntilDate:v31];

    v32 = +[NSDate date];
    [v32 timeIntervalSinceDate:v26];
    double v27 = v33;
  }
  if (!self->super._hasSnapshot && v27 <= 30.0) {
    goto LABEL_12;
  }
LABEL_13:
  v34 = +[UIPrintInteractionController sharedPrintController];
  v35 = [v34 printPageRenderer];

  if (v35)
  {
    v36 = +[UIPrintInteractionController sharedPrintController];
    [v36 _enableManualPrintPage:0];

    [(MapPageRenderer *)self drawOverview];
    v37 = [[MapScaleCell alloc] initWithDistanceInMeters:self->_widthInMeters];
    [(SimpleMapPageRenderer *)self overviewRect];
    -[MapScaleCell drawInRect:](v37, "drawInRect:");
    -[SimpleMapPageRenderer drawTopContentInRect:forPageAtIndex:](self, "drawTopContentInRect:forPageAtIndex:", a3, x, y, width, height);
  }
  _Block_object_dispose(&v41, 8);
}

@end