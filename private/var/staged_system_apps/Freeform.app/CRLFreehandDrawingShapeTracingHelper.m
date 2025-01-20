@interface CRLFreehandDrawingShapeTracingHelper
+ (id)unscaledOutlinePathFromFreehandDrawingShapeLayouts:(id)a3 unscaledOutset:(double)a4 viewScale:(double)a5;
@end

@implementation CRLFreehandDrawingShapeTracingHelper

+ (id)unscaledOutlinePathFromFreehandDrawingShapeLayouts:(id)a3 unscaledOutset:(double)a4 viewScale:(double)a5
{
  id v7 = a3;
  v8 = +[NSMutableArray array];
  v93 = +[NSMutableDictionary dictionary];
  v92 = +[NSMutableSet set];
  uint64_t v124 = 0;
  v125 = (CGRect *)&v124;
  uint64_t v126 = 0x4010000000;
  v127 = "";
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v129 = size;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obj = v7;
  id v96 = [obj countByEnumeratingWithState:&v120 objects:v135 count:16];
  if (v96)
  {
    uint64_t v95 = *(void *)v121;
    if (a5 <= 0.0) {
      double v10 = 2.0;
    }
    else {
      double v10 = 2.0 / a5;
    }
    do
    {
      v98 = 0;
      do
      {
        if (*(void *)v121 != v95) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v120 + 1) + 8 * (void)v98);
        double v12 = a4;
        if (a4 == 0.0)
        {
          v13 = [*(id *)(*((void *)&v120 + 1) + 8 * (void)v98) stroke];
          [v13 width];
          if (v14 >= 2.0) {
            double v12 = a4;
          }
          else {
            double v12 = v10;
          }
        }
        memset(&v134, 0, sizeof(v134));
        if (v11) {
          [v11 pureTransformInRoot];
        }
        uint64_t v15 = [v11 pathSource];
        v16 = [(id)v15 bezierPath];
        id v100 = [v16 copy];

        CGAffineTransform buf = v134;
        [v100 transformUsingAffineTransform:&buf];
        v17 = [v11 shapeInfo];
        LOBYTE(v15) = [v17 isTreatedAsFillForFreehandDrawing];

        if ((v15 & 1) == 0)
        {
          if (a4 != 0.0 || ([v100 length], v18 >= 10.0))
          {
            v25 = [v11 pencilKitStrokes];
            if (!v25)
            {
              unsigned int v26 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E0128);
              }
              v27 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v26;
                LOWORD(buf.b) = 2082;
                *(void *)((char *)&buf.b + 2) = "+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehand"
                                                  "DrawingShapeLayouts:unscaledOutset:viewScale:]";
                WORD1(buf.c) = 2082;
                *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFr"
                                                  "eehandDrawingShapeTracingHelper.m";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 88;
                WORD1(buf.tx) = 2082;
                *(void *)((char *)&buf.tx + 4) = "pkStrokesFromShapeLayout";
                _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E0148);
              }
              v28 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
              {
                v42 = +[CRLAssertionHandler packedBacktraceString];
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v26;
                LOWORD(buf.b) = 2114;
                *(void *)((char *)&buf.b + 2) = v42;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
              }
              v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:]");
              v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingShapeTracingHelper.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 88, 0, "invalid nil value for '%{public}s'", "pkStrokesFromShapeLayout");
            }
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            id v31 = v25;
            id v32 = [v31 countByEnumeratingWithState:&v116 objects:v132 count:16];
            if (v32)
            {
              uint64_t v33 = *(void *)v117;
              do
              {
                for (i = 0; i != v32; i = (char *)i + 1)
                {
                  if (*(void *)v117 != v33) {
                    objc_enumerationMutation(v31);
                  }
                  v35 = *(void **)(*((void *)&v116 + 1) + 8 * i);
                  CGAffineTransform buf = v134;
                  v36 = [v35 crl_strokeByAppendingTransform:&buf];
                  v37 = +[NSNumber numberWithDouble:v12];
                  v38 = +[CRLPair pairWithFirst:v36 second:v37];

                  [v8 addObject:v38];
                }
                id v32 = [v31 countByEnumeratingWithState:&v116 objects:v132 count:16];
              }
              while (v32);
            }
            v39 = v31;
            goto LABEL_41;
          }
        }
        v19 = [v11 stroke];
        [v19 width];
        double v21 = v20;

        double v22 = v12 + v21;
        [v100 setLineWidth:v22 + v22];
        [v100 bounds];
        v23 = v125;
        CGRect v140 = CGRectInset(v137, -v22, -v22);
        CGRect v138 = CGRectUnion(v23[1], v140);
        v125[1] = v138;
        [v100 length];
        if (v24 < 10.0)
        {
          [v92 addObject:v100];
          goto LABEL_43;
        }
        [v100 lineWidth];
        v40 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v39 = [v93 objectForKeyedSubscript:v40];

        if (!v39)
        {
          id v31 = [v100 copy];
          [v100 lineWidth];
          v41 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [v93 setObject:v31 forKeyedSubscript:v41];

LABEL_41:
          goto LABEL_42;
        }
        [v39 appendBezierPath:v100];
LABEL_42:

LABEL_43:
        v98 = (char *)v98 + 1;
      }
      while (v98 != v96);
      id v96 = [obj countByEnumeratingWithState:&v120 objects:v135 count:16];
    }
    while (v96);
  }

  v99 = +[NSMutableDictionary dictionary];
  v43 = (char *)[v8 count];
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2810000000;
  v114[3] = "";
  int v115 = 0;
  __dmb(0xBu);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D6D64;
  block[3] = &unk_1014E0170;
  block[6] = v114;
  block[7] = &v124;
  block[4] = v8;
  block[5] = v99;
  dispatch_apply((size_t)v43, 0, block);
  v97 = +[NSMutableArray array];
  if (v43)
  {
    for (j = 0; j != v43; ++j)
    {
      v45 = +[NSNumber numberWithUnsignedInteger:j];
      v46 = [v99 objectForKeyedSubscript:v45];

      if (v46) {
        [v97 addObject:v46];
      }
    }
  }
  if (CGRectGetWidth(v125[1]) == 0.0 || CGRectGetHeight(v125[1]) == 0.0)
  {
    int v47 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E0190);
    }
    v48 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_ERROR)) {
      sub_101087F00((uint8_t *)&v134, v47, (uint64_t)[obj count], (os_log_t)v48);
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E01B0);
    }
    v49 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
    {
      v50 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v50, (uint8_t *)&buf, v47, (os_log_t)v49);
    }

    v51 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLFreehandDrawingShapeTracingHelper unscaledOutlinePathFromFreehandDrawingShapeLayouts:unscaledOutset:viewScale:]");
    v52 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingShapeTracingHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v51, v52, 139, 0, "Unable to trace freehand drawing shape layouts (count: %zu).", [obj count]);

    if (CGRectIsNull(v125[1]))
    {
      v53 = &CGRectZero;
      p_double height = &CGRectZero.size.height;
      p_CGSize size = &CGRectZero.size;
      p_y = &CGRectZero.origin.y;
    }
    else
    {
      v53 = v125 + 1;
      p_y = &v125[1].origin.y;
      p_CGSize size = &v125[1].size;
      p_double height = &v125[1].size.height;
    }
    v57 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", v53->origin.x, *p_y, p_size->width, *p_height);
  }
  else
  {
    double width = v125[1].size.width;
    double height = v125[1].size.height;
    v139.origin.x = v125[1].origin.x;
    v139.origin.y = v125[1].origin.y;
    v139.size.double width = width;
    v139.size.double height = height;
    double v61 = CGRectGetWidth(v139);
    double v62 = sub_10006727C(width, height, 4194304.0);
    double v63 = sub_1000674B8(v62);
    double v65 = v64;
    memset(&v134, 0, sizeof(v134));
    CGAffineTransformMakeScale(&v134, v63 / v61, v63 / v61);
    CGFloat v66 = -v125[1].origin.x;
    CGFloat v67 = -v125[1].origin.y;
    CGAffineTransform v112 = v134;
    CGAffineTransformTranslate(&buf, &v112, v66, v67);
    CGAffineTransform v134 = buf;
    v68 = sub_100455AA8(10, v63, v65);
    sub_100457458((uint64_t)v68, 1);
    CGAffineTransform buf = v134;
    CGContextConcatCTM(v68, &buf);
    if ([v97 count]) {
      +[CRLPencilKitInkStroke drawStrokes:v97 inContext:v68 overTransparentCanvas:1];
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v69 = [v93 allValues];
    id v70 = [v69 countByEnumeratingWithState:&v108 objects:v131 count:16];
    if (v70)
    {
      uint64_t v71 = *(void *)v109;
      id v101 = v69;
      do
      {
        for (k = 0; k != v70; k = (char *)k + 1)
        {
          if (*(void *)v109 != v71) {
            objc_enumerationMutation(v101);
          }
          v73 = *(void **)(*((void *)&v108 + 1) + 8 * (void)k);
          v74 = [CRLBrushStroke alloc];
          v75 = +[CRLColor blackColor];
          [v73 lineWidth];
          double v77 = v76;
          v78 = +[CRLStrokePattern solidPattern];
          v79 = [(CRLBrushStroke *)v74 initWithName:@"Basic Rounded" color:v75 width:1 cap:1 join:v78 pattern:v77 miterLimit:0.0];

          -[CRLBrushStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](v79, "paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:", [v73 CGPath], 0, v68, 0, 0, 0);
        }
        v69 = v101;
        id v70 = [v101 countByEnumeratingWithState:&v108 objects:v131 count:16];
      }
      while (v70);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v102 = v92;
    id v80 = [v102 countByEnumeratingWithState:&v104 objects:v130 count:16];
    if (v80)
    {
      uint64_t v81 = *(void *)v105;
      do
      {
        for (m = 0; m != v80; m = (char *)m + 1)
        {
          if (*(void *)v105 != v81) {
            objc_enumerationMutation(v102);
          }
          v83 = *(void **)(*((void *)&v104 + 1) + 8 * (void)m);
          v84 = [CRLStroke alloc];
          v85 = +[CRLColor blackColor];
          [v83 lineWidth];
          double v87 = v86;
          v88 = +[CRLStrokePattern solidPattern];
          v89 = [(CRLStroke *)v84 initWithColor:v85 width:1 cap:1 join:v88 pattern:v87];

          -[CRLStroke paintPath:inContext:](v89, "paintPath:inContext:", [v83 CGPath], v68);
        }
        id v80 = [v102 countByEnumeratingWithState:&v104 objects:v130 count:16];
      }
      while (v80);
    }

    Image = CGBitmapContextCreateImage(v68);
    CGContextRelease(v68);
    v91 = +[CRLBezierPath tracedPathForImage:Image alphaThreshold:0.01 pointSpacing:3.0];
    CGImageRelease(Image);
    CGAffineTransform buf = v134;
    CGAffineTransformInvert(&v103, &buf);
    [v91 transformUsingAffineTransform:&v103];
    v57 = +[CRLBezierPath exteriorOfBezierPath:v91];
  }
  _Block_object_dispose(v114, 8);

  _Block_object_dispose(&v124, 8);

  return v57;
}

@end