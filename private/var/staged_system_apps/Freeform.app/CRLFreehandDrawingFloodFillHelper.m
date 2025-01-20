@interface CRLFreehandDrawingFloodFillHelper
+ (id)fillablePathFromPaths:(id)a3 atFillPoint:(CGPoint)a4 withConnectionThreshold:(double)a5 pathsUsedForFilling:(id *)a6;
+ (id)p_bezierPathWithSectionOfBezierPath:(id)a3 centeredAtPercentAlongPath:(double)a4 withMaximumLength:(double)a5;
+ (id)p_bitmapFillablePathFromPaths:(id)a3 atFillPoint:(CGPoint)a4 allowOverflowingPath:(BOOL)a5;
+ (id)p_connectionPathsForFillableAreas:(id)a3 withConnectionThreshold:(double)a4;
+ (id)p_flattenedPathForPath:(id)a3;
@end

@implementation CRLFreehandDrawingFloodFillHelper

+ (id)fillablePathFromPaths:(id)a3 atFillPoint:(CGPoint)a4 withConnectionThreshold:(double)a5 pathsUsedForFilling:(id *)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  v12 = [v11 crl_arrayOfObjectsPassingTest:&stru_1014FD388];

  if (![v12 count]) {
    goto LABEL_30;
  }
  v13 = [a1 p_bitmapFillablePathFromPaths:v12 atFillPoint:1 allowOverflowingPath:x, y];
  v14 = v13;
  if (!v13 || ![v13 containsElementsOtherThanMoveAndClose])
  {

LABEL_30:
    id v49 = 0;
    goto LABEL_31;
  }
  [v14 bounds];
  CGRect v90 = CGRectInset(v89, -20.0, -20.0);
  CGFloat v15 = v90.origin.x;
  CGFloat v16 = v90.origin.y;
  CGFloat width = v90.size.width;
  CGFloat height = v90.size.height;
  v19 = [[CRLBezierHitTester alloc] initWithBucketSize:10.0];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v20 = v12;
  id v21 = [v20 countByEnumeratingWithState:&v75 objects:v86 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v76;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v76 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        [v24 bounds];
        v95.origin.double x = v25;
        v95.origin.double y = v26;
        v95.size.CGFloat width = v27;
        v95.size.CGFloat height = v28;
        v91.origin.double x = v15;
        v91.origin.double y = v16;
        v91.size.CGFloat width = width;
        v91.size.CGFloat height = height;
        if (CGRectIntersectsRect(v91, v95)) {
          [(CRLBezierHitTester *)v19 addPath:v24 filled:0];
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v75 objects:v86 count:16];
    }
    while (v21);
  }

  v68 = [(CRLBezierHitTester *)v19 pathsCrossingPath:v14 withSearchThreshold:20.0];
  v29 = [v68 allObjects];
  v70 = [a1 p_connectionPathsForFillableAreas:v29 withConnectionThreshold:a5];

  v30 = [v68 allObjects];
  v69 = [v30 arrayByAddingObjectsFromArray:v70];

  v31 = [a1 p_bitmapFillablePathFromPaths:v69 atFillPoint:0 allowOverflowingPath:x, y];
  v32 = v31;
  if (v31 && [v31 containsElementsOtherThanMoveAndClose])
  {
    v66 = v32;
    [v32 bounds];
    CGRect v93 = CGRectInset(v92, -20.0, -20.0);
    CGFloat v33 = v93.origin.x;
    CGFloat v34 = v93.origin.y;
    CGFloat v35 = v93.size.width;
    CGFloat v36 = v93.size.height;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v37 = v70;
    id v38 = [v37 countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v72;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v72 != v39) {
            objc_enumerationMutation(v37);
          }
          v41 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
          [v41 bounds];
          v96.origin.double x = v42;
          v96.origin.double y = v43;
          v96.size.CGFloat width = v44;
          v96.size.CGFloat height = v45;
          v94.origin.double x = v33;
          v94.origin.double y = v34;
          v94.size.CGFloat width = v35;
          v94.size.CGFloat height = v36;
          if (CGRectIntersectsRect(v94, v96)) {
            [(CRLBezierHitTester *)v19 addPath:v41 filled:0];
          }
        }
        id v38 = [v37 countByEnumeratingWithState:&v71 objects:v85 count:16];
      }
      while (v38);
    }

    v32 = v66;
    v46 = [(CRLBezierHitTester *)v19 pathsCrossingPath:v66 withSearchThreshold:20.0];
    v67 = v46;
    if (a6)
    {
      *a6 = [v46 allObjects];
      v46 = v67;
    }
    v65 = [v46 allObjects];
    v47 = +[CRLBezierPathBooleanOperationHelper pathByFloodFillingPaths:x atFillPoint:y];
    v48 = v47;
    if (v47 && ([v47 containsElementsOtherThanMoveAndClose] & 1) != 0)
    {
      id v49 = v48;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD3A8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B8760();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD3C8);
      }
      v51 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v52 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:]");
      v53 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v52 file:v53 lineNumber:115 isFatal:0 description:"Failed to flood fill paths with Clipper. Falling back to a smoothed bitmap path."];

      if (qword_101719D20 != -1) {
        dispatch_once(&qword_101719D20, &stru_1014FD3E8);
      }
      if (os_log_type_enabled((os_log_t)off_10166E8B8, OS_LOG_TYPE_DEBUG))
      {
        v54 = [v20 crl_arrayByMappingObjectsUsingBlock:&stru_1014FD428];
        if (qword_101719D20 != -1) {
          dispatch_once(&qword_101719D20, &stru_1014FD448);
        }
        v55 = off_10166E8B8;
        if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEBUG))
        {
          v88.double x = x;
          v88.double y = y;
          v63 = NSStringFromCGPoint(v88);
          *(_DWORD *)buf = 134218498;
          double v80 = a5;
          __int16 v81 = 2112;
          v82 = v63;
          __int16 v83 = 2112;
          v84 = v54;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v55, OS_LOG_TYPE_DEBUG, "Flood fill failure:\nthreshold=%f\nfillPoint=%@\npaths=\n%@\n", buf, 0x20u);
        }
      }
      id v49 = +[CRLBezierPath smoothBezierPath:v66 withThreshold:2.0];

      v64 = [v49 bezierPathByOffsettingPath:[v49 lineJoinStyle] joinStyle:0.25];
      v56 = [v64 bezierPathByRemovingRedundantElements];
      v57 = v56;
      if (v56
        && (v58 = v56, unsigned int v59 = [v56 containsElementsOtherThanMoveAndClose], v57 = v58, v59))
      {
        v60 = v49;
        id v49 = v58;
      }
      else
      {
        v58 = v57;
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FD468);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B86D8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FD488);
        }
        v61 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v60 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper fillablePathFromPaths:atFillPoint:withConnectionThreshold:pathsUsedForFilling:]");
        v62 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v60 file:v62 lineNumber:134 isFatal:0 description:"Failed to re-outset the path to return. Returning the slightly inset version."];
      }
    }
  }
  else
  {
    id v49 = 0;
  }

  if (v49 && ([v49 containsElementsOtherThanMoveAndClose] & 1) == 0)
  {

    goto LABEL_30;
  }
LABEL_31:

  return v49;
}

+ (id)p_connectionPathsForFillableAreas:(id)a3 withConnectionThreshold:(double)a4
{
  id v6 = a3;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_10048A064;
  v57[3] = &unk_1014FD4A8;
  v57[4] = a1;
  v7 = [v6 crl_arrayByTransformingWithBlock:v57];

  v8 = +[NSMutableArray array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v54;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v54 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ([v13 isCompound])
        {
          v14 = [v13 arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:1];
          [v8 addObjectsFromArray:v14];
        }
        else
        {
          [v8 addObject:v13];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v10);
  }

  id v15 = v8;
  memset(v51, 0, sizeof(v51));
  int v52 = 1065353216;
  CGFloat v16 = [[CRLBezierHitTester alloc] initWithBucketSize:5.0];
  unint64_t v17 = 0;
  double v18 = 0.0;
  while (1)
  {
    v46[0] = v17;
    if (v17 >= (unint64_t)[v15 count]) {
      break;
    }
    v19 = [v15 objectAtIndexedSubscript:v46[0]];
    [(CRLBezierHitTester *)v16 addPath:v19 filled:0 pathID:v46[0]];
    double v50 = 0.0;
    [v19 lineWidth];
    double v50 = v20;
    sub_10048C1C8((uint64_t)v51, v46, v46, &v50);
    if (v50 > v18) {
      double v18 = v50;
    }

    unint64_t v17 = v46[0] + 1;
  }
  v32 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v33 = dispatch_queue_create("com.apple.freeform.freehand-drawing.flood-fill-connection", v32);
  v46[0] = 0;
  v46[1] = (unint64_t)v46;
  v46[2] = 0x4812000000;
  v46[3] = (unint64_t)sub_10048A098;
  v46[4] = (unint64_t)sub_10048A0BC;
  v46[5] = (unint64_t)"";
  v48 = 0;
  uint64_t v49 = 0;
  __p = 0;
  id v21 = [v15 count];
  uint64_t v22 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10048A0D4;
  block[3] = &unk_1014FD588;
  id v23 = v15;
  id v40 = v23;
  double v44 = v18 + a4;
  v24 = v16;
  v41 = v24;
  sub_10048C3F8((uint64_t)v45, (uint64_t)v51);
  *(double *)&v45[5] = a4;
  CGFloat v25 = v33;
  CGFloat v42 = v25;
  CGFloat v43 = v46;
  dispatch_apply((size_t)v21, v22, block);

  CGFloat v26 = +[NSMutableArray array];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10048ACCC;
  v34[3] = &unk_1014FD5C0;
  id v37 = v46;
  id v27 = v23;
  id v35 = v27;
  id v38 = a1;
  id v28 = v26;
  id v36 = v28;
  dispatch_sync(v25, v34);
  v29 = v36;
  id v30 = v28;

  sub_10001D134((uint64_t)v45);
  _Block_object_dispose(v46, 8);
  if (__p)
  {
    v48 = __p;
    operator delete(__p);
  }

  sub_10001D134((uint64_t)v51);

  return v30;
}

+ (id)p_flattenedPathForPath:(id)a3
{
  id v3 = a3;
  if ([v3 isFlat])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[CRLBezierPath bezierPath];
    [v3 copyPathAttributesTo:v4];
    uint64_t v5 = (uint64_t)[v3 elementCount];
    if (v5 >= 1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        long long v10 = xmmword_101175160;
        long long v11 = xmmword_101175160;
        *(_OWORD *)v12 = xmmword_101175160;
        *(_OWORD *)&v12[16] = xmmword_101175160;
        switch((unint64_t)[v3 elementAtIndex:i allPoints:&v10])
        {
          case 0uLL:
            [v4 moveToPoint:v10];
            break;
          case 1uLL:
            [v4 lineToPoint:v11];
            break;
          case 2uLL:
            double v7 = sub_100353D68((float64x2_t *)&v10);
            v9[0] = _NSConcreteStackBlock;
            v9[1] = 3221225472;
            v9[2] = sub_10048B094;
            v9[3] = &unk_1014FD5E8;
            v9[4] = v4;
            +[CRLBezierPath subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:](CRLBezierPath, "subdivideBezierWithFlatness:startPoint:controlPoint1:controlPoint2:endPoint:addLineBlock:", v9, v7, v10, v11, *(double *)v12, *(_OWORD *)&v12[8], *(void *)&v12[24]);
            break;
          case 3uLL:
            [v4 closePath];
            break;
          default:
            continue;
        }
      }
    }
  }

  return v4;
}

+ (id)p_bezierPathWithSectionOfBezierPath:(id)a3 centeredAtPercentAlongPath:(double)a4 withMaximumLength:(double)a5
{
  id v7 = a3;
  [v7 length];
  if (v8 == 0.0)
  {
    id v9 = +[CRLBezierPath bezierPath];
  }
  else
  {
    double v10 = a5 / v8 * 0.5;
    double v16 = 0.0;
    id v11 = [v7 elementPercentage:&v16 forOverallPercentage:fmax(a4 - v10, 0.0)];
    double v15 = 0.0;
    id v12 = [v7 elementPercentage:&v15 forOverallPercentage:fmin(v10 + a4, 1.0)];
    id v9 = [v7 copyFromSegment:v11 t:v12 toSegment:v16 t:v15];
  }
  v13 = v9;

  return v13;
}

+ (id)p_bitmapFillablePathFromPaths:(id)a3 atFillPoint:(CGPoint)a4 allowOverflowingPath:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  CGFloat v9 = CGRectNull.origin.x;
  CGFloat v10 = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v91 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v90 + 1) + 8 * i) controlPointBounds];
        v108.origin.double x = v17;
        v108.origin.double y = v18;
        v108.size.CGFloat width = v19;
        v108.size.CGFloat height = v20;
        v103.origin.double x = v9;
        v103.origin.double y = v10;
        v103.size.CGFloat width = width;
        v103.size.CGFloat height = height;
        CGRect v104 = CGRectUnion(v103, v108);
        CGFloat v9 = v104.origin.x;
        CGFloat v10 = v104.origin.y;
        CGFloat width = v104.size.width;
        CGFloat height = v104.size.height;
      }
      id v14 = [v13 countByEnumeratingWithState:&v90 objects:v95 count:16];
    }
    while (v14);
  }
  BOOL v80 = a5;

  v105.origin.double x = v9;
  v105.origin.double y = v10;
  v105.size.CGFloat width = width;
  v105.size.CGFloat height = height;
  CGRect v106 = CGRectInset(v105, -5.0, -5.0);
  sub_1000674B8(v106.size.width);
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v21, v22);
  id v27 = 0;
  if (v25 != 0.0 && v26 != 0.0)
  {
    double v28 = v23;
    double v29 = v24;
    double v30 = v25;
    double v31 = sub_1000646A4(v25, v26, 2.0);
    double v33 = sub_10006727C(v31, v32, 4194304.0);
    double v34 = sub_1000674B8(v33);
    double v36 = v35;
    memset(&v89, 0, sizeof(v89));
    double v37 = v34 / v30;
    CGAffineTransformMakeScale(&v89, v37, v37);
    CGAffineTransform v88 = v89;
    CGAffineTransformTranslate((CGAffineTransform *)v96, &v88, -v28, -v29);
    CGAffineTransform v89 = *(CGAffineTransform *)v96;
    id v38 = sub_100455AA8(10, v34, v36);
    if (!v38)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD608);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B89A8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD628);
      }
      uint64_t v39 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      id v40 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]");
      v41 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v40, v41, 460, 0, "invalid nil value for '%{public}s'", "pathContext");
    }
    CGContextSaveGState(v38);
    CGAffineTransform transform = v89;
    CGContextConcatCTM(v38, &transform);
    CGContextSetLineWidth(v38, 1.0 / v37);
    CGContextSetGrayStrokeColor(v38, 0.0, 1.0);
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v42 = v13;
    id v43 = [v42 countByEnumeratingWithState:&v83 objects:v94 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v84;
      do
      {
        for (j = 0; j != v43; j = (char *)j + 1)
        {
          if (*(void *)v84 != v44) {
            objc_enumerationMutation(v42);
          }
          CGContextAddPath(v38, (CGPathRef)[*(id *)(*((void *)&v83 + 1) + 8 * (void)j) CGPath]);
        }
        id v43 = [v42 countByEnumeratingWithState:&v83 objects:v94 count:16];
      }
      while (v43);
    }

    CGContextStrokePath(v38);
    CGContextRestoreGState(v38);
    Image = CGBitmapContextCreateImage(v38);
    if (!Image)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD648);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B890C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD668);
      }
      v47 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v48 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]");
      uint64_t v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 477, 0, "invalid nil value for '%{public}s'", "pathImage");
    }
    CGContextRelease(v38);
    id v50 = +[CRLInstantAlphaHelper newInstantAlphaImageWithCGImage:ofSize:](CRLInstantAlphaHelper, "newInstantAlphaImageWithCGImage:ofSize:", Image, v34, v36);
    CGImageRelease(Image);
    if (v50)
    {
      double v51 = v89.tx + y * v89.c + v89.a * x;
      double v52 = v89.ty + y * v89.d + v89.b * x;
      v107.origin.double x = sub_100064070();
      double v53 = v107.origin.y;
      double v54 = v107.size.width;
      double v55 = v107.size.height;
      double v79 = v107.origin.x;
      v102.double x = v51;
      v102.double y = v52;
      if (!CGRectContainsPoint(v107, v102))
      {
LABEL_44:
        id v27 = 0;
LABEL_76:

        goto LABEL_77;
      }
      uint64_t v56 = (uint64_t)v51;
      uint64_t v57 = (uint64_t)v52;
      v58 = v50;
      unsigned int v59 = v58;
      if ((uint64_t)v51 < 0 || v57 < 0 || (uint64_t v60 = v58[1], v60 <= v56) || v58[2] <= v57)
      {
        unsigned int v65 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FD708);
        }
        v66 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          uint64_t v77 = v59[1];
          uint64_t v78 = v59[2];
          *(_DWORD *)CGRect v96 = 67110914;
          *(_DWORD *)&v96[4] = v65;
          *(_WORD *)&v96[8] = 2082;
          *(void *)&v96[10] = "CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)";
          *(_WORD *)&v96[18] = 2082;
          *(void *)&v96[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h";
          *(_WORD *)&v96[28] = 1024;
          *(_DWORD *)&v96[30] = 36;
          *(_WORD *)&v96[34] = 2048;
          *(void *)&v96[36] = (uint64_t)v51;
          *(_WORD *)&v96[44] = 2048;
          *(void *)&v96[46] = (uint64_t)v52;
          __int16 v97 = 2048;
          uint64_t v98 = v77;
          __int16 v99 = 2048;
          uint64_t v100 = v78;
          _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", v96, 0x4Au);
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FD728);
          }
        }
        v67 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v68 = +[NSString stringWithUTF8String:"CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)"];
        v69 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v68, v69, 36, 0, "bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", (uint64_t)v51, (uint64_t)v52, v59[1], v59[2]);
      }
      else
      {
        int v61 = *(_DWORD *)(v58[3] + 4 * (v56 + v60 * v57));

        if (v61) {
          goto LABEL_44;
        }
      }
      v63 = [[CRLInstantAlphaBinaryBitmap alloc] initWithWidth:(uint64_t)v34 height:(uint64_t)v36];
      id v64 = +[CRLInstantAlphaHelper newMaskSeedFillWithPoint:inImage:tolerance:oldFill:](CRLInstantAlphaHelper, "newMaskSeedFillWithPoint:inImage:tolerance:oldFill:", v59, 0, v63, v51, v52);
      if (!v64)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FD6C8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B8870();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FD6E8);
        }
        v70 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        long long v71 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]");
        long long v72 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v71, v72, 500, 0, "invalid nil value for '%{public}s'", "binaryBitmap");
      }
      long long v73 = +[CRLBezierPath tracedPathForInstantAlphaBinaryBitmap:v64 pointSpacing:1.0];
      long long v74 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v79, v53, v54, v55);
      long long v75 = [v74 subtractBezierPath:v73];

      id v27 = v75;
      if (v80 || !objc_msgSend(v75, "containsPoint:", v37 * 5.0 * 0.5, v37 * 5.0 * 0.5))
      {
        CGAffineTransform v81 = v89;
        CGAffineTransformInvert(&v82, &v81);
        [v75 transformUsingAffineTransform:&v82];
        goto LABEL_75;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD688);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B87E8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FD6A8);
      }
      v62 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingFloodFillHelper p_bitmapFillablePathFromPaths:atFillPoint:allowOverflowingPath:]");
      v63 = (CRLInstantAlphaBinaryBitmap *)objc_claimAutoreleasedReturnValue();
      id v64 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingFloodFillHelper.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v63 file:v64 lineNumber:486 isFatal:0 description:"iaImage should not be nil"];
    }
    id v27 = 0;
LABEL_75:

    goto LABEL_76;
  }
LABEL_77:

  return v27;
}

@end