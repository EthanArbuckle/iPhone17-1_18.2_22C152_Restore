@interface RouteStepCell
+ (id)cellWithRoute:(id)a3 stepIndex:(unint64_t)a4 mapType:(unint64_t)a5;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_intersectLineWithPoint1:(id)a3 point2:(id)a4 withRect:(id)a5;
- (BOOL)_lineSegmentsIntersectLineAPoint1:(id)a3 lineAPoint2:(id)a4 lineBPoint1:(id)a5 lineBPoint2:(id)a6 outIntersectionPoint:(id *)a7;
- (BOOL)hasSnapshot;
- (CGPoint)_cgPointApplyAffineTransform:(CGPoint)a3 :(CGAffineTransform *)a4 :(CGAffineTransform *)a5 :(CGAffineTransform *)a6;
- (CGRect)frame;
- (GEOComposedRoute)route;
- (GEOComposedRouteStep)routeStep;
- (RouteStepCell)initWithRoute:(id)a3 stepIndex:(unint64_t)a4 mapType:(unint64_t)a5;
- (UIImage)snapshotImage;
- (double)_textLayoutHeightForLines:(id)a3;
- (double)y;
- (id)instructionStringsArray;
- (id)snapshotBlock;
- (int64_t)page;
- (unint64_t)mapType;
- (unint64_t)numberOfSteps;
- (unint64_t)stepIndex;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3;
- (void)drawPinInRect:(CGRect)a3 zoomLevel:(double)a4;
- (void)drawRouteLineInRect:(CGRect)a3 zoomLevel:(double)a4;
- (void)releaseSnapshotCreator;
- (void)setFrame:(CGRect)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setPage:(int64_t)a3;
- (void)setRoute:(id)a3;
- (void)setStepIndex:(unint64_t)a3;
- (void)setY:(double)a3;
@end

@implementation RouteStepCell

+ (id)cellWithRoute:(id)a3 stepIndex:(unint64_t)a4 mapType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithRoute:v8 stepIndex:a4 mapType:a5];

  return v9;
}

- (RouteStepCell)initWithRoute:(id)a3 stepIndex:(unint64_t)a4 mapType:(unint64_t)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RouteStepCell;
  id v9 = [(RouteStepCell *)&v18 init];
  v10 = v9;
  if (v9)
  {
    [(RouteStepCell *)v9 setRoute:v8];
    [(RouteStepCell *)v10 setStepIndex:a4];
    v11 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.254901961 green:0.447058824 blue:0.811764706 alpha:0.800000012];
    routeCenterPrintColor = v10->_routeCenterPrintColor;
    v10->_routeCenterPrintColor = v11;

    v13 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.223529412 green:0.380392157 blue:0.694117647 alpha:1.0];
    routeOutlinePrintColor = v10->_routeOutlinePrintColor;
    v10->_routeOutlinePrintColor = v13;

    v15 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.254901961 green:0.435294118 blue:0.658823529 alpha:1.0];
    blueTextColor = v10->_blueTextColor;
    v10->_blueTextColor = v15;

    v10->_mapType = a5;
  }

  return v10;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setY:(double)a3
{
  self->_frame.origin.y = a3;
}

- (double)y
{
  return self->_frame.origin.y;
}

- (GEOComposedRouteStep)routeStep
{
  v3 = [(GEOComposedRoute *)self->_route steps];
  v4 = [v3 objectAtIndexedSubscript:self->_stepIndex];

  return (GEOComposedRouteStep *)v4;
}

- (void)drawPinInRect:(CGRect)a3 zoomLevel:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  MKZoomScaleForZoomLevelF();
  sCGFloat x = v8;
  id v9 = [(RouteStepCell *)self routeStep];
  [v9 startCoordinate];
  MKTilePointForCoordinate();
  double v11 = v10;
  double v13 = v12;
  v14 = [(RouteStepCell *)self snapshotImage];
  [v14 size];
  double v16 = v15;
  double v18 = v17;

  double v19 = v11 - v16 * 0.25;
  double v35 = v13 - v18 * 0.25;
  long long v33 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v34 = *(_OWORD *)&CGAffineTransformIdentity.a;
  tCGFloat x = CGAffineTransformIdentity.tx;
  tCGFloat y = CGAffineTransformIdentity.ty;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v22 = CGRectGetMinX(v40) - v19;
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v41);
  *(_OWORD *)&v38.double a = v34;
  *(_OWORD *)&v38.double c = v33;
  v38.tCGFloat x = tx;
  v38.tCGFloat y = ty;
  CGAffineTransformTranslate(&v39, &v38, v22, MinY - v35);
  CGAffineTransform v38 = v39;
  CGAffineTransformScale(&v39, &v38, sx, sx);
  double a = v39.a;
  double b = v39.b;
  double c = v39.c;
  double d = v39.d;
  double v29 = v39.tx;
  double v28 = v39.ty;
  v39.double a = 0.0;
  v38.double a = 0.0;
  [(GEOComposedRoute *)self->_route _maps_getMapPoints:&v39 count:&v38 forStep:v9];
  if (*(void *)&v38.a)
  {
    if (self->_stepIndex) {
      uint64_t v30 = 5;
    }
    else {
      uint64_t v30 = 4;
    }
    double v31 = **(double **)&v39.a;
    double v32 = *(double *)(*(void *)&v39.a + 8);
    free(*(void **)&v39.a);
    +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", v30, v29 + c * v32 + a * v31 + -6.0, v28 + d * v32 + b * v31 + -28.0, 12.0, 28.0);
  }
}

- (BOOL)_lineSegmentsIntersectLineAPoint1:(id)a3 lineAPoint2:(id)a4 lineBPoint1:(id)a5 lineBPoint2:(id)a6 outIntersectionPoint:(id *)a7
{
  double v7 = a6.var0 - a5.var0;
  double v8 = a6.var1 - a5.var1;
  double v9 = a4.var0 - a3.var0;
  double v10 = a4.var1 - a3.var1;
  double v11 = (a6.var1 - a5.var1) * v9 - v7 * (a4.var1 - a3.var1);
  BOOL result = 0;
  if (v11 != 0.0)
  {
    double v13 = a3.var1 - a5.var1;
    double v14 = a3.var0 - a5.var0;
    double v15 = (v7 * v13 - v8 * v14) / v11;
    if (v15 >= 0.0 && v15 <= 1.0)
    {
      double v17 = (v9 * v13 - v10 * v14) / v11;
      if (v17 >= 0.0 && v17 <= 1.0)
      {
        a7->var0 = a3.var0 + v15 * v9;
        a7->var1 = a3.var1 + v15 * v10;
        return 1;
      }
    }
  }
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_intersectLineWithPoint1:(id)a3 point2:(id)a4 withRect:(id)a5
{
  double var1 = a5.var1.var1;
  double v6 = a5.var0.var1;
  double var0 = a5.var0.var0;
  double v8 = a4.var1;
  double v9 = a4.var0;
  double v10 = a3.var1;
  double v11 = a3.var0;
  double v13 = a5.var0.var0 + a5.var1.var0;
  double v17 = 0.0;
  double v18 = 0.0;
  if (!-[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17))
  {
    double v14 = v6 + var1;
    if (!-[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17, v11, v10, v9, v8, v13, v6, v13, v14)&& !-[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17, v11, v10, v9, v8,
            var0,
            v14,
            v13,
            v14))
    {
      -[RouteStepCell _lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:](self, "_lineSegmentsIntersectLineAPoint1:lineAPoint2:lineBPoint1:lineBPoint2:outIntersectionPoint:", &v17, v11, v10, v9, v8, var0, v6, var0, v14);
    }
  }
  double v15 = v17;
  double v16 = v18;
  result.double var1 = v16;
  result.double var0 = v15;
  return result;
}

- (CGPoint)_cgPointApplyAffineTransform:(CGPoint)a3 :(CGAffineTransform *)a4 :(CGAffineTransform *)a5 :(CGAffineTransform *)a6
{
  CGFloat v6 = a4->tx + a3.y * a4->c + a4->a * a3.x;
  CGFloat v7 = a4->ty + a3.y * a4->d + a4->b * a3.x;
  float64x2_t v8 = vaddq_f64(*(float64x2_t *)&a6->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a6->c, a5->ty + v7 * a5->d + a5->b * v6), *(float64x2_t *)&a6->a, a5->tx + v7 * a5->c + a5->a * v6));
  double v9 = v8.f64[1];
  result.CGFloat x = v8.f64[0];
  result.CGFloat y = v9;
  return result;
}

- (void)drawRouteLineInRect:(CGRect)a3 zoomLevel:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v116 = 0;
  v117 = 0;
  [(GEOComposedRoute *)self->_route _maps_getMapPoints:&v117 count:&v116];
  if (v116) {
    goto LABEL_2;
  }
  v81 = sub_1005762E4();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v118.a) = 136315906;
    *(void *)((char *)&v118.a + 4) = "-[RouteStepCell drawRouteLineInRect:zoomLevel:]";
    WORD2(v118.b) = 2080;
    *(void *)((char *)&v118.b + 6) = "RouteStepCell.m";
    HIWORD(v118.c) = 1024;
    LODWORD(v118.d) = 239;
    WORD2(v118.d) = 2080;
    *(void *)((char *)&v118.d + 6) = "count > 0";
    _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v118, 0x26u);
  }

  if (sub_100BB36BC())
  {
    v82 = sub_1005762E4();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      v83 = +[NSThread callStackSymbols];
      LODWORD(v118.a) = 138412290;
      *(void *)((char *)&v118.a + 4) = v83;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v118, 0xCu);
    }
  }
  if (v116)
  {
LABEL_2:
    MKZoomScaleForZoomLevelF();
    sCGFloat x = v9;
    double v92 = 10.0 / v9;
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetLineCap(CurrentContext, kCGLineCapRound);
    CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
    v123.origin.CGFloat x = x;
    v123.origin.CGFloat y = y;
    v123.size.CGFloat width = width;
    v123.size.CGFloat height = height;
    CGContextClipToRect(CurrentContext, v123);
    Mutable = CGPathCreateMutable();
    double v12 = [(RouteStepCell *)self routeStep];
    [v12 startCoordinate];
    MKTilePointForCoordinate();
    double v109 = height;
    double v14 = v13;
    double v106 = width;
    double v16 = v15;
    double v17 = [(RouteStepCell *)self snapshotImage];
    [v17 size];
    double v104 = y;
    double v19 = v18;
    double v99 = x;
    double v21 = v20;

    double v97 = v16 - v21 * 0.5;
    [v12 startCoordinate];
    MKMapPoint v22 = MKMapPointForCoordinate(v119);
    MKCoordinateForTilePoint();
    MKMapPoint v23 = MKMapPointForCoordinate(v120);
    MKZoomScaleForZoomLevelF();
    double v25 = 10.0 / v24;
    v124.origin.CGFloat x = v23.x;
    v124.origin.CGFloat y = v23.y;
    v124.size.CGFloat width = v22.x - v23.x + v22.x - v23.x;
    v124.size.CGFloat height = v22.y - v124.origin.y + v22.y - v124.origin.y;
    MKMapRect v125 = MKMapRectInset(v124, v25, v25);
    double v86 = v125.origin.y;
    double v87 = v125.origin.x;
    double v84 = v125.size.height;
    double v85 = v125.size.width;
    CGFloat b = CGAffineTransformIdentity.b;
    CGFloat c = CGAffineTransformIdentity.c;
    CGFloat d = CGAffineTransformIdentity.d;
    CGFloat v29 = CGAffineTransformIdentity.tx;
    tCGFloat y = CGAffineTransformIdentity.ty;
    v125.origin.CGFloat x = v99;
    v125.origin.CGFloat y = v104;
    v125.size.CGFloat width = v106;
    v125.size.CGFloat height = v109;
    txCGFloat a = CGRectGetMinX((CGRect)v125) - (v14 - v19 * 0.5);
    v126.origin.CGFloat x = v99;
    v126.origin.CGFloat y = v104;
    v126.size.CGFloat width = v106;
    v126.size.CGFloat height = v109;
    CGFloat MinY = CGRectGetMinY(v126);
    v115.CGFloat a = CGAffineTransformIdentity.a;
    v115.CGFloat b = b;
    CGFloat v90 = c;
    CGFloat v91 = b;
    v115.CGFloat c = c;
    v115.CGFloat d = d;
    CGFloat v88 = v29;
    CGFloat v89 = d;
    v115.tCGFloat x = v29;
    v115.tCGFloat y = ty;
    CGAffineTransformTranslate(&v118, &v115, txa, MinY - v97);
    CGAffineTransform v115 = v118;
    CGAffineTransformScale(&v118, &v115, sx, sx);
    CGFloat a = v118.a;
    CGFloat v32 = v118.b;
    CGFloat v34 = v118.c;
    CGFloat v33 = v118.d;
    CGFloat v35 = v118.tx;
    CGFloat v105 = v118.ty;
    CGFloat v36 = v118.tx + v23.y * v118.c + v118.a * v23.x;
    CGFloat v37 = v118.ty + v23.y * v118.d + v118.b * v23.x;
    long long v107 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v110 = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v118.CGFloat a = v110;
    *(_OWORD *)&v118.CGFloat c = v107;
    long long v102 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_OWORD *)&v118.tCGFloat x = v102;
    *(_OWORD *)&v115.CGFloat a = v110;
    *(_OWORD *)&v115.CGFloat c = v107;
    *(_OWORD *)&v115.tCGFloat x = v102;
    CGAffineTransformTranslate(&v118, &v115, -v36, -v37);
    *(_OWORD *)&v115.CGFloat a = v110;
    *(_OWORD *)&v115.CGFloat c = v107;
    *(_OWORD *)&v115.tCGFloat x = v102;
    *(_OWORD *)&v114.CGFloat a = v110;
    *(_OWORD *)&v114.CGFloat c = v107;
    *(_OWORD *)&v114.tCGFloat x = v102;
    CGAffineTransformTranslate(&v115, &v114, v36, v37);
    CGAffineTransform v113 = v115;
    CGAffineTransformScale(&v114, &v113, 0.5, 0.5);
    CGAffineTransform v115 = v114;
    unsigned int v38 = [v12 startPointIndex];
    CGAffineTransform v39 = (double *)&v117[16 * v38];
    double v40 = *v39;
    double v41 = v39[1];
    unint64_t v42 = v38;
    CGFloat v98 = a;
    CGFloat v100 = v32;
    v114.CGFloat a = a;
    v114.CGFloat b = v32;
    CGFloat v101 = v33;
    CGFloat v103 = v34;
    v114.CGFloat c = v34;
    v114.CGFloat d = v33;
    tCGFloat x = v35;
    v114.tCGFloat x = v35;
    v114.tCGFloat y = v105;
    CGAffineTransform v113 = v118;
    CGAffineTransform v112 = v115;
    -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v114, &v113, &v112, v40, v41);
    double v43 = 0.0;
    CGPathAddArc(Mutable, 0, v44, v45, 1.0, 0.0, 6.28318548, 1);
    if (v42 + 1 >= v116)
    {
      double v49 = v40;
      double v64 = v41;
      double v66 = v92;
    }
    else
    {
      double v46 = v41;
      double v47 = v40;
      v48 = (double *)&v117[16 * v42 + 16];
      double v49 = *v48;
      double v50 = v48[1];
      double v52 = v86;
      double v51 = v87;
      v127.origin.CGFloat x = v87;
      v127.origin.CGFloat y = v86;
      double v54 = v84;
      double v53 = v85;
      v127.size.CGFloat width = v85;
      v127.size.CGFloat height = v84;
      v121.CGFloat x = *v48;
      v121.CGFloat y = v50;
      BOOL v55 = MKMapRectContainsPoint(v127, v121);
      char v56 = 0;
      uint64_t v57 = 16 * v42;
      double v111 = 0.0;
      do
      {
        unint64_t v58 = v42++;
        v114.CGFloat a = v98;
        v114.CGFloat b = v100;
        v114.CGFloat c = v103;
        v114.CGFloat d = v101;
        v114.tCGFloat x = tx;
        v114.tCGFloat y = v105;
        double v108 = sqrt((v49 - v47) * (v49 - v47) + (v50 - v46) * (v50 - v46));
        CGAffineTransform v113 = v118;
        CGAffineTransform v112 = v115;
        -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v114, &v113, &v112, v49, v50, *(void *)&v84, *(void *)&v85, *(void *)&v86, *(void *)&v87);
        CGPathAddLineToPoint(Mutable, 0, v59, v60);
        if (v42 < v116 - 1)
        {
          double v47 = v49;
          double v46 = v50;
        }
        double v111 = v111 + v108;
        if (v58 + 2 >= v116)
        {
          double v64 = v50;
          double v66 = v92;
          double v40 = v47;
          double v41 = v46;
          double v43 = v111;
          goto LABEL_16;
        }
        v56 |= v55;
        double v49 = *(double *)&v117[v57 + 32];
        double v50 = *(double *)&v117[v57 + 40];
        v128.origin.CGFloat x = v51;
        v128.origin.CGFloat y = v52;
        v128.size.CGFloat width = v53;
        v128.size.CGFloat height = v54;
        v122.CGFloat x = v49;
        v122.CGFloat y = v50;
        BOOL v55 = MKMapRectContainsPoint(v128, v122);
        v57 += 16;
      }
      while (v55 || (v56 & 1) == 0);
      double v61 = v47;
      double v41 = v46;
      double v40 = v61;
      -[RouteStepCell _intersectLineWithPoint1:point2:withRect:](self, "_intersectLineWithPoint1:point2:withRect:");
      double v49 = v62;
      double v64 = v63;
      double v65 = sqrt((v62 - v40) * (v62 - v40) + (v63 - v46) * (v63 - v46));
      double v66 = v92;
      if (v42 < 2 || v65 >= v92)
      {
        v114.CGFloat a = v98;
        v114.CGFloat b = v100;
        v114.CGFloat c = v103;
        v114.CGFloat d = v101;
        v114.tCGFloat x = tx;
        v114.tCGFloat y = v105;
        CGAffineTransform v113 = v118;
        CGAffineTransform v112 = v115;
        -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v114, &v113, &v112, v62, v63);
        CGPathAddLineToPoint(Mutable, 0, v67, v68);
      }
      else
      {
        double v49 = v40;
        double v64 = v46;
        double v40 = *(double *)&v117[v57 - 16];
        double v41 = *(double *)&v117[v57 - 8];
      }
      double v43 = v111 + v65;
    }
LABEL_16:
    free(v117);
    if (v43 > v66)
    {
      v114.CGFloat a = v98;
      v114.CGFloat b = v100;
      v114.CGFloat c = v103;
      v114.CGFloat d = v101;
      v114.tCGFloat x = tx;
      v114.tCGFloat y = v105;
      CGAffineTransform v113 = v118;
      CGAffineTransform v112 = v115;
      -[RouteStepCell _cgPointApplyAffineTransform::::](self, "_cgPointApplyAffineTransform::::", &v114, &v113, &v112, v49, v64);
      double v70 = v69;
      double v72 = v71;
      float v73 = atan2(v64 - v41, v49 - v40);
      v113.CGFloat a = CGAffineTransformIdentity.a;
      v113.CGFloat b = v91;
      v113.CGFloat c = v90;
      v113.CGFloat d = v89;
      v113.tCGFloat x = v88;
      v113.tCGFloat y = ty;
      CGAffineTransformRotate(&v114, &v113, v73);
      double v74 = v114.a;
      double v75 = v114.b;
      double v76 = v114.c;
      double v77 = v114.d;
      double v78 = v114.tx;
      double v79 = v114.ty;
      CGPathAddLineToPoint(Mutable, 0, v70 + v114.tx + v114.c * -3.0 + v114.a * -5.0, v72 + v114.ty + v114.d * -3.0 + v114.b * -5.0);
      CGPathMoveToPoint(Mutable, 0, v70, v72);
      CGPathAddLineToPoint(Mutable, 0, v70 + v78 + v76 * 3.0 + v74 * -5.0, v72 + v79 + v77 * 3.0 + v75 * -5.0);
    }
    CGFloat v80 = sx * MKRoadWidthAtZoomScale(sx) * 0.25;
    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetLineWidth(CurrentContext, v80);
    CGContextSetStrokeColorWithColor(CurrentContext, [(UIColor *)self->_routeOutlinePrintColor CGColor]);
    CGContextStrokePath(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    CGContextAddPath(CurrentContext, Mutable);
    CGContextSetLineWidth(CurrentContext, v80 + -1.0);
    CGContextSetStrokeColorWithColor(CurrentContext, [(UIColor *)self->_routeCenterPrintColor CGColor]);
    CGContextSetCompositeOperation();
    CGContextStrokePath(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGContextRestoreGState(CurrentContext);
    CGPathRelease(Mutable);
  }
}

- (double)_textLayoutHeightForLines:(id)a3
{
  id v4 = a3;
  double MinX = CGRectGetMinX(self->_frame);
  double MaxX = CGRectGetMaxX(self->_frame);
  double Height = CGRectGetHeight(self->_frame);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    double v11 = MaxX - (MinX + 135.0);
    uint64_t v12 = *(void *)v21;
    double v13 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        double v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v16 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5, (void)v20);
          [v15 _maps_sizeWithFont:v16 constrainedToSize:1 options:v11 Height];
          double v18 = v17;

          double v13 = v13 + v18;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (unint64_t)numberOfSteps
{
  v2 = [(GEOComposedRoute *)self->_route steps];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)instructionStringsArray
{
  route = self->_route;
  id v3 = [(RouteStepCell *)self routeStep];
  id v4 = +[RouteMiddleStepLabelListView stringsForRoute:route step:v3 tableMode:0 isPrinting:1];

  return v4;
}

- (void)drawInRect:(CGRect)a3
{
  double MinX = CGRectGetMinX(self->_frame);
  double v5 = CGRectGetMinX(self->_frame) + 35.0;
  stepIndeCGFloat x = (char *)self->_stepIndex;
  if (!stepIndex)
  {
    uint64_t v20 = 4;
LABEL_10:
    +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", v20, MinX + 4.0, CGRectGetMinY(self->_frame), 14.0, 31.0);
    goto LABEL_11;
  }
  if (stepIndex >= (char *)[(RouteStepCell *)self numberOfSteps] - 1)
  {
    if (self->_stepIndex) {
      uint64_t v20 = 5;
    }
    else {
      uint64_t v20 = 4;
    }
    goto LABEL_10;
  }
  [(UIColor *)self->_blueTextColor set];
  CGFloat v7 = +[NSString stringWithFormat:@"%lu", self->_stepIndex];
  id v8 = +[UIFont systemFontOfSize:37.0];
  [v7 _maps_sizeWithFont:v8];
  double v10 = MinX + 10.0 + v9 * -0.5;
  double v11 = v9 + v10;
  double v12 = v5 + -5.0 - v11;
  BOOL v13 = v11 <= v5 + -5.0;
  double v14 = -0.0;
  if (!v13) {
    double v14 = v12;
  }
  double v15 = v10 + v14;
  double MinY = CGRectGetMinY(self->_frame);
  [v8 ascender];
  double v18 = v17;
  [v8 capHeight];
  [v7 _maps_drawAtPoint:v8 withFont:v15 MinY - (v18 - v19)];

LABEL_11:
  long long v21 = [(RouteStepCell *)self instructionStringsArray];
  double v22 = CGRectGetMinY(self->_frame);
  long long v23 = +[UIColor darkGrayColor];
  [v23 set];

  double v24 = +[UIFont systemFontOfSize:13.5];
  double v25 = CGRectGetHeight(self->_frame) + 5.0;
  double Width = CGRectGetWidth(self->_frame);
  [(RouteStepCell *)self _textLayoutHeightForLines:v21];
  if (v27 > v25)
  {
    uint64_t v28 = +[UIFont systemFontOfSize:11.0];

    double v24 = (void *)v28;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v29 = v21;
  id v30 = [v29 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v30)
  {
    id v31 = v30;
    double v32 = Width + -135.0;
    uint64_t v33 = *(void *)v55;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v55 != v33) {
          objc_enumerationMutation(v29);
        }
        CGFloat v35 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v35 set];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v22 == CGRectGetMinY(self->_frame))
            {
              [v24 ascender];
              double v37 = v36;
              [v24 capHeight];
              double v22 = v22 - (v37 - v38);
            }
            [v35 _maps_sizeWithFont:v24 constrainedToSize:1 options:v32];
            double v40 = v39;
            [v35 _maps_drawInRect:v24 withFont:CGRectGetMinX(self->_frame) + 135.0, v22, v32, v25];
            double v22 = v22 + v40;
          }
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v31);
  }

  double v41 = [(RouteStepCell *)self snapshotImage];

  if (v41)
  {
    unint64_t v42 = [(RouteStepCell *)self snapshotImage];
    [v42 size];
    double v44 = v43;
    double v46 = v45;

    double v47 = CGRectGetMinY(self->_frame);
    double v48 = v44 * 0.5;
    double v49 = v46 * 0.5;
    double v50 = [(RouteStepCell *)self snapshotImage];
    [v50 drawInRect:v5, v47, v48, v49];

    double v51 = (char *)self->_stepIndex;
    if (v51 && v51 < (char *)[(RouteStepCell *)self numberOfSteps] - 1) {
      -[RouteStepCell drawRouteLineInRect:zoomLevel:](self, "drawRouteLineInRect:zoomLevel:", v5, v47, v48, v49, 16.0);
    }
    else {
      -[RouteStepCell drawPinInRect:zoomLevel:](self, "drawPinInRect:zoomLevel:", v5, v47, v48, v49, 16.0);
    }
    double v52 = +[UIColor lightGrayColor];
    [v52 set];

    double v53 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, v47, v48, v49);
    [v53 stroke];
  }
}

- (id)snapshotBlock
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100547D3C;
  v5[3] = &unk_1012E6690;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = [v5 copy];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (UIImage)snapshotImage
{
  return [(MKMapSnapshot *)self->_snapshot image];
}

- (void)releaseSnapshotCreator
{
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;
}

- (void)dealloc
{
  [(RouteStepCell *)self releaseSnapshotCreator];
  v3.receiver = self;
  v3.super_class = (Class)RouteStepCell;
  [(RouteStepCell *)&v3 dealloc];
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndeCGFloat x = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)page
{
  return self->_page;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueTextColor, 0);
  objc_storeStrong((id *)&self->_routeOutlinePrintColor, 0);
  objc_storeStrong((id *)&self->_routeCenterPrintColor, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end