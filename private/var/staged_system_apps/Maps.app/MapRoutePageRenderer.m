@interface MapRoutePageRenderer
- (CGAffineTransform)_overviewAffineTransformForRect:(SEL)a3 zoomLevel:(CGRect)a4;
- (CGRect)overviewRect;
- (GEOComposedRoute)route;
- (MapRoutePageRenderer)initWithRoute:(id)a3 mapView:(id)a4;
- (double)_zoomLevelForCoordinateRegion:(id *)a3;
- (id)computeCurrentPrintInfo;
- (int64_t)numberOfPages;
- (int64_t)routeStepsPerPage;
- (void)_drawAddressWithPin:(unsigned int)a3 address:(id)a4 inRect:(CGRect)a5;
- (void)_drawBottomMarginContentInRect:(CGRect)a3;
- (void)_drawRouteLineInRect:(CGRect)a3 zoomLevel:(double)a4 transform:(CGAffineTransform *)a5;
- (void)_layoutRouteStepCalloutAtIndex:(unint64_t)a3 depth:(int64_t)a4;
- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4;
- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)prepareForDrawingPages:(_NSRange)a3;
@end

@implementation MapRoutePageRenderer

- (MapRoutePageRenderer)initWithRoute:(id)a3 mapView:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MapRoutePageRenderer;
  v9 = [(MapCachedPageRenderer *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_route, a3);
    [(MapPageRenderer *)v10 setMapView:v8];
    v11 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.278431373 green:0.560784314 blue:1.0 alpha:1.0];
    routeCenterPrintColor = v10->_routeCenterPrintColor;
    v10->_routeCenterPrintColor = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    snapshotObjects = v10->_snapshotObjects;
    v10->_snapshotObjects = v13;
  }
  return v10;
}

- (id)computeCurrentPrintInfo
{
  v3 = [(GEOComposedRoute *)self->_route steps];
  id v4 = [v3 count];

  if ([(GEOComposedRoute *)self->_route transportType] == 1)
  {
    v5 = [(GEOComposedRoute *)self->_route steppingSigns];
    id v4 = [v5 count];
  }
  uint64_t v6 = [(MapRoutePageRenderer *)self routeStepsPerPage];
  if (v6)
  {
    uint64_t v7 = v6;
    float obj = (float)(unint64_t)v4 / (float)v6;
    id v8 = objc_alloc_init((Class)NSMutableArray);
    id v54 = objc_alloc_init((Class)NSMutableArray);
    [(MapRoutePageRenderer *)self printableRect];
    CGFloat v10 = v9;
    CGFloat v50 = v12;
    CGFloat v52 = v11;
    CGFloat v14 = v13;
    [(MapRoutePageRenderer *)self overviewRect];
    CGFloat x = v68.origin.x;
    CGFloat y = v68.origin.y;
    CGFloat width = v68.size.width;
    CGFloat height = v68.size.height;
    double v19 = CGRectGetMaxX(v68) + 40.0;
    v69.origin.CGFloat x = x;
    v69.origin.CGFloat y = y;
    v69.size.CGFloat width = width;
    v69.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v69);
    v70.origin.CGFloat x = v10;
    v70.size.CGFloat width = v50;
    v70.origin.CGFloat y = v52;
    v70.size.CGFloat height = v14;
    double v21 = CGRectGetMaxX(v70) - v19 + -63.0;
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    CGFloat v22 = CGRectGetHeight(v71);
    if (v7 >= 2)
    {
      v72.origin.CGFloat x = v19;
      v72.origin.CGFloat y = MinY;
      v72.size.CGFloat width = v21;
      v72.size.CGFloat height = v22;
      double v23 = (CGRectGetHeight(v72) - (double)v7 * 81.5) / (double)(v7 - 1) + 81.5;
    }
    else
    {
      double v23 = 81.5;
    }
    unint64_t v25 = vcvtps_s32_f32(obj);
    v73.origin.CGFloat x = v19;
    v73.origin.CGFloat y = MinY;
    v73.size.CGFloat width = v21;
    v73.size.CGFloat height = v22;
    double v26 = CGRectGetWidth(v73);
    v74.origin.CGFloat x = v19;
    v74.origin.CGFloat y = MinY;
    v74.size.CGFloat width = v21;
    v74.size.CGFloat height = v22;
    double MinX = CGRectGetMinX(v74);
    if ([(GEOComposedRoute *)self->_route transportType] == 1)
    {
      long long v63 = 0uLL;
      long long v64 = 0uLL;
      long long v61 = 0uLL;
      long long v62 = 0uLL;
      id obja = [(GEOComposedRoute *)self->_route steppingSigns];
      id v28 = [obja countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v62;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v62 != v30) {
              objc_enumerationMutation(obja);
            }
            v32 = +[TransitRouteStepCell cellWithRoute:self->_route sign:*(void *)(*((void *)&v61 + 1) + 8 * i)];
            [v32 setFrame:MinX, 0.0, v26, 81.5];
            [v8 addObject:v32];
          }
          id v29 = [obja countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v29);
      }
    }
    else
    {
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v57 = 0uLL;
      long long v58 = 0uLL;
      id obja = [(GEOComposedRoute *)self->_route steps];
      id v33 = [obja countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v33)
      {
        id v34 = v33;
        unint64_t v51 = v25;
        uint64_t v53 = v7;
        uint64_t v35 = *(void *)v58;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            v37 = v8;
            if (*(void *)v58 != v35) {
              objc_enumerationMutation(obja);
            }
            id v38 = [*(id *)(*((void *)&v57 + 1) + 8 * (void)j) stepIndex:v51, v53];
            route = self->_route;
            v40 = [(MapPageRenderer *)self mapView];
            v41 = +[RouteStepCell cellWithRoute:stepIndex:mapType:](RouteStepCell, "cellWithRoute:stepIndex:mapType:", route, v38, [v40 mapType]);

            [v41 setFrame:MinX, 0.0, v26, 81.5];
            id v8 = v37;
            [v37 addObject:v41];
            v42 = +[RouteStepCalloutCell cellWithRoute:self->_route stepIndex:v38 type:0];
            [v54 addObject:v42];
          }
          id v34 = [obja countByEnumeratingWithState:&v57 objects:v65 count:16];
        }
        while (v34);
        unint64_t v25 = v51;
        uint64_t v7 = v53;
      }
    }

    id v43 = [v8 count];
    v75.origin.CGFloat x = v19;
    v75.origin.CGFloat y = MinY;
    v75.size.CGFloat width = v21;
    v75.size.CGFloat height = v22;
    double v44 = CGRectGetMinY(v75);
    if (v43)
    {
      double v45 = v44;
      uint64_t v46 = 0;
      v47 = 0;
      do
      {
        v48 = v47;
        v47 = [v8 objectAtIndexedSubscript:v46];

        [v47 setY:v45];
        [v47 setPage:v46 / v7];
        double v45 = v23 + v45;
        v76.origin.CGFloat x = v19;
        v76.origin.CGFloat y = MinY;
        v76.size.CGFloat width = v21;
        v76.size.CGFloat height = v22;
        if (v45 >= CGRectGetMaxY(v76))
        {
          v77.origin.CGFloat x = v19;
          v77.origin.CGFloat y = MinY;
          v77.size.CGFloat width = v21;
          v77.size.CGFloat height = v22;
          double v45 = CGRectGetMinY(v77);
        }
        ++v46;
      }
      while (v43 != (id)v46);
    }
    v24 = [[MapsRoutePrintingInfo alloc] initWithNumberOfPages:v25 routeStepCells:v8 routeStepCalloutCells:v54];
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (int64_t)numberOfPages
{
  v2 = [(MapCachedPageRenderer *)self currentPrintInfo];
  id v3 = [v2 numberOfPages];

  return (int64_t)v3;
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  [(GEOComposedRoute *)self->_route _maps_boundingMapRect];
  MKCoordinateRegion v8 = MKCoordinateRegionForMapRect(v7);
  CLLocationDegrees latitude = v8.center.latitude;
  CLLocationDegrees longitude = v8.center.longitude;
  -[MapRoutePageRenderer _zoomLevelForCoordinateRegion:](self, "_zoomLevelForCoordinateRegion:");
  self->super.super._zoomLevel = v6;
  self->super.super._centerCoordinate.CLLocationDegrees latitude = latitude;
  self->super.super._centerCoordinate.CLLocationDegrees longitude = longitude;
}

- (int64_t)routeStepsPerPage
{
  [(MapRoutePageRenderer *)self overviewRect];
  return vcvtmd_s64_f64(CGRectGetHeight(v3) / 86.5);
}

- (CGRect)overviewRect
{
  [(MapRoutePageRenderer *)self paperRect];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  if (v3 * v4 >= 2.22044605e-16)
  {
    CGFloat v13 = v3;
    CGFloat v14 = v4;
    [(MapRoutePageRenderer *)self printableRect];
    CGFloat v25 = v15;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v26.origin.double x = v6;
    v26.origin.double y = v8;
    v26.size.double width = v13;
    v26.size.double height = v14;
    CGFloat r1 = CGRectGetWidth(v26) * 0.5 + -63.0 + -20.0;
    v27.origin.double x = v6;
    v27.origin.double y = v8;
    v27.size.double width = v13;
    v27.size.double height = v14;
    CGFloat v22 = CGRectGetHeight(v27) + -76.5 + -69.5;
    v28.origin.double x = v6;
    v28.origin.double y = v8;
    v28.size.double width = v13;
    v28.size.double height = v14;
    double MaxY = CGRectGetMaxY(v28);
    v29.origin.double x = v25;
    v29.origin.double y = v17;
    v29.size.double width = v19;
    v29.size.double height = v21;
    v30.size.double height = v22 + CGRectGetMaxY(v29) - MaxY;
    v30.origin.double x = 63.0;
    v30.origin.double y = 76.5;
    v30.size.double width = r1;
    v32.origin.double x = v25;
    v32.origin.double y = v17;
    v32.size.double width = v19;
    v32.size.double height = v21;
    *(CGRect *)&double x = CGRectIntersection(v30, v32);
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGAffineTransform)_overviewAffineTransformForRect:(SEL)a3 zoomLevel:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  MKZoomScaleForZoomLevelF();
  CGFloat v12 = v11;
  long long v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v22;
  long long v20 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tCGFloat x = v20;
  self = (MapRoutePageRenderer *)((char *)self + 112);
  Class isa = self->super.super.super.super.isa;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMinX(v25) - *(double *)&isa;
  title = self->super.super._title;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v26);
  *(_OWORD *)&v24.a = v21;
  *(_OWORD *)&v24.c = v22;
  *(_OWORD *)&v24.tCGFloat x = v20;
  CGAffineTransformTranslate(retstr, &v24, v14, MinY - *(double *)&title);
  long long v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v23.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v23.c = v17;
  *(_OWORD *)&v23.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformScale(&v24, &v23, v12, v12);
  long long v19 = *(_OWORD *)&v24.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&retstr->c = v19;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v24.tx;
  return result;
}

- (void)_drawRouteLineInRect:(CGRect)a3 zoomLevel:(double)a4 transform:(CGAffineTransform *)a5
{
  [(MapRoutePageRenderer *)self overviewRect];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  unint64_t v24 = 0;
  CGRect v25 = 0;
  [(GEOComposedRoute *)self->_route _maps_getMapPoints:&v25 count:&v24];
  if (v24) {
    goto LABEL_2;
  }
  long long v21 = sub_1005762E4();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    CGRect v27 = "-[MapRoutePageRenderer _drawRouteLineInRect:zoomLevel:transform:]";
    __int16 v28 = 2080;
    CGRect v29 = "MapRoutePageRenderer.m";
    __int16 v30 = 1024;
    int v31 = 191;
    __int16 v32 = 2080;
    id v33 = "count > 0";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
  }

  if (sub_100BB36BC())
  {
    long long v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      CGAffineTransform v23 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      CGRect v27 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if (v24)
  {
LABEL_2:
    MKZoomScaleForZoomLevelF();
    double v16 = v15 * MKRoadWidthAtZoomScale(v15);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    v34.origin.CGFloat x = v8;
    v34.origin.CGFloat y = v10;
    v34.size.CGFloat width = v12;
    v34.size.CGFloat height = v14;
    CGContextClipToRect(CurrentContext, v34);
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, a5, *(CGFloat *)v25, *((CGFloat *)v25 + 1));
    if (v24 >= 2)
    {
      uint64_t v19 = 0;
      for (unint64_t i = 1; i < v24; ++i)
      {
        CGPathAddLineToPoint(Mutable, a5, *(CGFloat *)((char *)v25 + v19 + 16), *(CGFloat *)((char *)v25 + v19 + 24));
        v19 += 16;
      }
    }
    free(v25);
    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetLineWidth(CurrentContext, v16 + -1.0);
    CGContextSetStrokeColorWithColor(CurrentContext, [(UIColor *)self->_routeCenterPrintColor CGColor]);
    CGContextStrokePath(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGPathRelease(Mutable);
    CGContextRestoreGState(CurrentContext);
  }
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int v10 = [(GEOComposedRoute *)self->_route transportType];
  if (v10 <= 3) {
    self->super.super._topContentIconType = dword_100F6FB30[v10];
  }
  if ([(GEOComposedRoute *)self->_route transportType] == 1)
  {
    [(MapPageRenderer *)self setSubTitle:0];
  }
  else
  {
    double v11 = [(GEOComposedRoute *)self->_route expandedDistance];
    [(MapPageRenderer *)self setTitle:v11];

    [(MapPageRenderer *)self setSubTitle:0];
    CGFloat v12 = [(GEOComposedRoute *)self->_route expandedTravelTime];
    double v13 = +[NSString stringWithFormat:@"%@", v12];
    [(MapPageRenderer *)self setSubTitle:v13];
  }
  v14.receiver = self;
  v14.super_class = (Class)MapRoutePageRenderer;
  -[MapPageRenderer drawTopContentInRect:forPageAtIndex:](&v14, "drawTopContentInRect:forPageAtIndex:", a4, x, y, width, height);
}

- (void)_drawAddressWithPin:(unsigned int)a3 address:(id)a4 inRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v9 = *(void *)&a3;
  id v10 = a4;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  double MinX = CGRectGetMinX(v15);
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", v9, MinX, CGRectGetMinY(v16), 15.3000004, 18.0);
  CGFloat v12 = +[UIColor colorWithWhite:0.400000006 alpha:1.0];
  [v12 set];

  id v13 = +[UIFont systemFontOfSize:9.0];
  [v10 _maps_drawInRect:v13 withFont:x + 25.3000004, y, width + -25.3000004, height];
}

- (void)_drawBottomMarginContentInRect:(CGRect)a3
{
  [(MapRoutePageRenderer *)self overviewRect];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  CGFloat v8 = CGRectGetMaxY(v18) + 13.5;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat v10 = CGRectGetWidth(v20) * 0.5 + -20.0;
  [(MapRoutePageRenderer *)self printableRect];
  CGFloat v11 = CGRectGetMaxY(v21) - v8;
  CGFloat v12 = [(GEOComposedRoute *)self->_route origin];
  id v13 = [v12 navDisplayAddress];
  -[MapRoutePageRenderer _drawAddressWithPin:address:inRect:](self, "_drawAddressWithPin:address:inRect:", 4, v13, MinX, v8, v10, v11);

  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v14 = CGRectGetMidX(v22) + -7.65000021 + 3.0;
  id v16 = [(GEOComposedRoute *)self->_route destination];
  CGRect v15 = [v16 navDisplayAddress];
  -[MapRoutePageRenderer _drawAddressWithPin:address:inRect:](self, "_drawAddressWithPin:address:inRect:", 5, v15, v14, v8, v10, v11);
}

- (void)_layoutRouteStepCalloutAtIndex:(unint64_t)a3 depth:(int64_t)a4
{
  double v7 = [(MapCachedPageRenderer *)self currentPrintInfo];
  id v13 = [v7 routeStepCalloutCells];

  id v8 = [v13 count];
  uint64_t v9 = [v13 objectAtIndexedSubscript:a3];
  if (a3 + 1 < (unint64_t)v8)
  {
    unint64_t v10 = a3 - (void)v8;
    for (uint64_t i = 1; v10 + i; ++i)
    {
      if (i)
      {
        CGFloat v12 = [v13 objectAtIndexedSubscript:a3 + i];
        if (([v12 shouldRotateWithCallout:v9] & 1) != 0
          || ([v12 shouldRotateWithCallout:self->_redPinCallout] & 1) != 0
          || [v12 shouldRotateWithCallout:self->_greenPinCallout])
        {
          if ([v12 rotate])
          {
            if (a4 > 3
              || ([(MapRoutePageRenderer *)self _layoutRouteStepCalloutAtIndex:a3 + i depth:a4 + 1], a4 >= 2))
            {

              break;
            }
          }
        }
      }
    }
  }
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(NSMutableArray *)self->_snapshotObjects addObject:self];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  unint64_t v10 = [(MapCachedPageRenderer *)self currentPrintInfo];
  CGFloat v11 = [v10 routeStepCells];

  id v12 = [v11 countByEnumeratingWithState:&v77 objects:v83 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v78 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        if ([v16 page] == (id)a3) {
          [(NSMutableArray *)self->_snapshotObjects addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v13);
  }

  long long v17 = +[UIPrintInteractionController sharedPrintController];
  [v17 _enableManualPrintPage:1];

  while ([(NSMutableArray *)self->_snapshotObjects count])
  {
    CGRect v18 = [(NSMutableArray *)self->_snapshotObjects objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 snapshotBlock];
    CGRect v20 = (void *)v19;
    if (v19)
    {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
      CGRect v21 = +[NSDate date];
      if (([v18 hasSnapshot] & 1) == 0)
      {
        do
        {
          CGAffineTransform v23 = +[NSRunLoop currentRunLoop];
          unint64_t v24 = +[NSDate dateWithTimeIntervalSinceNow:1.0];
          [v23 runUntilDate:v24];

          CGRect v25 = +[NSDate date];
          [v25 timeIntervalSinceDate:v21];
          double v27 = v26;
        }
        while (([v18 hasSnapshot] & 1) == 0 && v27 <= 30.0);
      }
    }
    [v18 releaseSnapshotCreator];
    [(NSMutableArray *)self->_snapshotObjects removeObjectAtIndex:0];
  }
  __int16 v28 = +[UIPrintInteractionController sharedPrintController];
  CGRect v29 = [v28 printPageRenderer];

  if (v29)
  {
    __int16 v30 = +[UIPrintInteractionController sharedPrintController];
    [v30 _enableManualPrintPage:0];

    [(MapPageRenderer *)self drawOverview];
    [(MapRoutePageRenderer *)self overviewRect];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v74 = 0u;
    -[MapRoutePageRenderer _overviewAffineTransformForRect:zoomLevel:](self, "_overviewAffineTransformForRect:zoomLevel:", v31);
    double zoomLevel = self->super.super._zoomLevel;
    v73[0] = v74;
    v73[1] = v75;
    v73[2] = v76;
    -[MapRoutePageRenderer _drawRouteLineInRect:zoomLevel:transform:](self, "_drawRouteLineInRect:zoomLevel:transform:", v73, x, y, width, height, zoomLevel);
    v40 = [(MapCachedPageRenderer *)self currentPrintInfo];
    v41 = [v40 routeStepCalloutCells];

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v42 = v41;
    id v43 = [v42 countByEnumeratingWithState:&v69 objects:v82 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v70;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v70 != v45) {
            objc_enumerationMutation(v42);
          }
          v47 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
          v68[0] = v74;
          v68[1] = v75;
          v68[2] = v76;
          [v47 setTransform:v68];
        }
        id v44 = [v42 countByEnumeratingWithState:&v69 objects:v82 count:16];
      }
      while (v44);
    }

    v48 = [[MapScaleCell alloc] initWithDistanceInMeters:MKMetersBetweenMapPoints((MKMapPoint)self->mlMapPoint, (MKMapPoint)self->mrMapPoint)];
    -[MapScaleCell drawInRect:](v48, "drawInRect:", v32, v34, v36, v38);
    -[MapRoutePageRenderer drawTopContentInRect:forPageAtIndex:](self, "drawTopContentInRect:forPageAtIndex:", a3, x, y, width, height);
    -[MapRoutePageRenderer _drawBottomMarginContentInRect:](self, "_drawBottomMarginContentInRect:", x, y, width, height);
    v49 = (char *)[v42 count];
    CGFloat v50 = v49;
    if (!a3 && v49)
    {
      unint64_t v51 = 0;
      do
        [(MapRoutePageRenderer *)self _layoutRouteStepCalloutAtIndex:v51++ depth:1];
      while (v50 != v51);
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    CGFloat v52 = [(MapCachedPageRenderer *)self currentPrintInfo];
    uint64_t v53 = [v52 routeStepCells];

    id v54 = [v53 countByEnumeratingWithState:&v64 objects:v81 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v65;
      do
      {
        for (k = 0; k != v55; k = (char *)k + 1)
        {
          if (*(void *)v65 != v56) {
            objc_enumerationMutation(v53);
          }
          long long v58 = *(void **)(*((void *)&v64 + 1) + 8 * (void)k);
          if ([v58 page] == (id)a3) {
            [v58 drawInRect:x, y, width, height];
          }
        }
        id v55 = [v53 countByEnumeratingWithState:&v64 objects:v81 count:16];
      }
      while (v55);
    }

    if ([v42 count])
    {
      if ((unint64_t)(v50 - 1) >= 2)
      {
        long long v59 = 0;
        uint64_t v60 = 2;
        do
        {
          long long v61 = v59;
          long long v59 = [v42 objectAtIndexedSubscript:v60 - 1];

          [v59 drawInRect:x, y, width, height];
          ++v60;
        }
        while (v50 != (char *)v60);
      }
      long long v62 = [v42 objectAtIndexedSubscript:0];
      [v62 drawInRect:x, y, width, height];

      long long v63 = [v42 lastObject];
      [v63 drawInRect:x, y, width, height];
    }
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_snapshotObjects, 0);
  objc_storeStrong((id *)&self->_routeCenterPrintColor, 0);
  objc_storeStrong((id *)&self->_greenPinCallout, 0);

  objc_storeStrong((id *)&self->_redPinCallout, 0);
}

- (double)_zoomLevelForCoordinateRegion:(id *)a3
{
  double v27 = v3;
  double v28 = v4;
  [(MapRoutePageRenderer *)self overviewRect];
  double v25 = v7 * 0.5;
  double v26 = v6 * 0.5;
  MKTilePointForCoordinate();
  unint64_t v8 = 20;
  while (1)
  {
    MKTilePointForCoordinate();
    double v10 = v9 - v26;
    double v12 = v11 - v25;
    MKCoordinateForTilePoint();
    CLLocationDegrees coordinate = v13;
    double v15 = v14;
    MKCoordinateForTilePoint();
    CLLocationDegrees v17 = v16;
    double v19 = v18;
    MKCoordinateForTilePoint();
    double coordinate_8 = v20;
    MKCoordinateForTilePoint();
    double v22 = v21;
    v31.CLLocationDegrees latitude = coordinate;
    v31.CLLocationDegrees longitude = v15;
    self->mlMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v31);
    v32.CLLocationDegrees latitude = v17;
    v32.CLLocationDegrees longitude = v19;
    self->mrMapPoint = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapPointForCoordinate(v32);
    if (coordinate_8 - v22 + 0.0001 >= v27 && v19 - v15 + 0.0001 >= v28) {
      break;
    }
    if (--v8 <= 3)
    {
      unint64_t v8 = 3;
      break;
    }
  }
  self->topLeftCorner.double x = v10;
  self->topLeftCorner.double y = v12;
  return (double)v8;
}

@end