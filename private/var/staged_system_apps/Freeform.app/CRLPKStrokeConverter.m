@interface CRLPKStrokeConverter
+ (id)pathFromPKStroke:(id)a3 pencilKitStrokePathData:(id *)a4;
+ (id)pathFromPKStroke:(id)a3 startingAtPointIndex:(unint64_t)a4 endingAtPointIndex:(unint64_t)a5 pencilKitStrokePathData:(id *)a6;
+ (id)pencilKitStrokesFromPath:(id)a3 inkStroke:(id)a4 strokePathCompactData:(id)a5 maskPath:(id)a6;
@end

@implementation CRLPKStrokeConverter

+ (id)pencilKitStrokesFromPath:(id)a3 inkStroke:(id)a4 strokePathCompactData:(id)a5 maskPath:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v56 = +[NSMutableArray array];
  v13 = [v10 color];
  uint64_t v14 = [v13 UIColor];

  [v10 width];
  double v16 = v15;
  v17 = [v10 inkType];
  +[CRLPencilKitInkStroke unadjustedStrokeWidthFromAdjustedWidth:v17 forInkType:v16];
  double v19 = v18;

  v20 = [v10 inkType];
  +[PKInkingTool _weightForWidth:v20 type:v19];
  double v22 = v21;

  v23 = [v10 inkType];
  v52 = (void *)v14;
  v24 = +[PKInk inkWithIdentifier:v23 color:v14 weight:v22];
  v25 = [v24 _sixChannelVersion];

  [v10 width];
  double v27 = v26;
  memset(&v64, 0, sizeof(v64));
  if (v11)
  {
    [v11 renderScaleX];
    CGFloat v29 = v28;
    [v11 renderScaleY];
    CGAffineTransformMakeScale(&v64, v29, v30);
  }
  else
  {
    long long v31 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v64.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v64.c = v31;
    *(_OWORD *)&v64.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v54 = v9;
  id v32 = [v9 copy];
  CGAffineTransform v62 = v64;
  CGAffineTransformInvert(&v63, &v62);
  [v32 transformUsingAffineTransform:&v63];
  v33 = [v10 inkType];
  v53 = v10;
  v51 = v32;
  v34 = +[CRLPKStrokePathConverter strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:](CRLPKStrokePathConverter, "strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:", v32, v11, v33, [v10 isFountainPenInkV2], v27);

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v34;
  id v35 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v59;
    do
    {
      for (i = 0; i != v36; i = (char *)i + 1)
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if (v12)
        {
          +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v12 CGPath]);
          id v40 = (id)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            CGAffineTransform v62 = v64;
            CGAffineTransformInvert(&v57, &v62);
            [v40 transformUsingAffineTransform:&v57];
            id v40 = v40;
            v41 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v40 CGPath]);
          }
          else
          {
            v41 = 0;
          }
        }
        else
        {
          v41 = 0;
          id v40 = 0;
        }
        id v42 = objc_alloc((Class)PKStroke);
        id v43 = [v11 randomSeed];
        CGAffineTransform v62 = v64;
        id v44 = [v42 initWithInk:v25 strokePath:v39 transform:&v62 mask:v41 randomSeed:v43];
        unint64_t v45 = (unint64_t)[v44 _flags];
        unsigned int v46 = [v11 shouldSolveMath];
        uint64_t v47 = 0x20000000000;
        if (!v46) {
          uint64_t v47 = 0;
        }
        [v44 _setFlags:v47 | v45 & 0xFFFFFDFFFFFFFFFFLL];
        v48 = [v11 renderGroupID];
        [v44 _setRenderGroupID:v48];

        [v11 anchorPointForTexture];
        v49 = [v44 crl_copyWithNewAnchorPointForTexture:];
        [v56 addObject:v49];
      }
      id v36 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v36);
  }

  return v56;
}

+ (id)pathFromPKStroke:(id)a3 startingAtPointIndex:(unint64_t)a4 endingAtPointIndex:(unint64_t)a5 pencilKitStrokePathData:(id *)a6
{
  id v9 = a3;
  id v10 = [v9 path];
  id v11 = (char *)[v10 count];

  if ((unint64_t)v11 < a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDF68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010845E0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDF88);
    }
    id v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:]");
    uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokeConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:111 isFatal:0 description:"Out-of-bounds startingAtPointIndex parameter."];
  }
  if ((unint64_t)v11 < a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDFA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084558();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DDFC8);
    }
    double v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v15);
    }
    double v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokeConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:112 isFatal:0 description:"Out-of-bounds endingAtPointIndex parameter."];
  }
  if ((unint64_t)(v11 - 1) < a4) {
    a4 = (unint64_t)(v11 - 1);
  }
  if ((unint64_t)(v11 - 1) < a5) {
    a5 = (unint64_t)(v11 - 1);
  }
  double v18 = [v9 path];
  id v19 = [v18 count];

  if ((unint64_t)v19 <= 1)
  {
    v20 = [v9 path];
    id v21 = [v20 count];

    if (v21)
    {
      double v22 = [v9 path];
      id v23 = [v22 objectAtIndexedSubscript:0];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DDFE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010844D0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE008);
      }
      v24 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v24);
      }
      v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:]");
      double v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokeConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:121 isFatal:0 description:"Unable to convert a PKStroke with no points. Using fallback values."];

      id v23 = [objc_alloc((Class)PKStrokePoint) initWithLocation:CGPointZero.x timeOffset:CGPointZero.y size:0.0 opacity:5.0 force:5.0 azimuth:1.0 altitude:1.0];
    }
    id v27 = objc_alloc((Class)PKStrokePoint);
    [v23 location];
    double v29 = v28 + 0.1;
    [v23 location];
    double v31 = v30;
    [v23 timeOffset];
    double v33 = v32 + 0.01;
    [v23 size];
    double v35 = v34;
    double v37 = v36;
    [v23 opacity];
    double v39 = v38;
    [v23 force];
    double v41 = v40;
    [v23 azimuth];
    double v43 = v42;
    [v23 altitude];
    id v45 = [v27 initWithLocation:v29 timeOffset:v31 size:v33 opacity:v35 force:v37 azimuth:v39 altitude:v41];
    id v46 = objc_alloc((Class)PKStrokePath);
    v69[0] = v23;
    v69[1] = v45;
    uint64_t v47 = +[NSArray arrayWithObjects:v69 count:2];
    v48 = [v9 path];
    v49 = [v48 creationDate];
    id v50 = [v46 initWithControlPoints:v47 creationDate:v49];

    id v51 = objc_alloc((Class)PKStroke);
    v52 = [v9 ink];
    if (v9) {
      [v9 transform];
    }
    else {
      memset(v68, 0, sizeof(v68));
    }
    v53 = [v9 mask];
    id v54 = [v51 initWithInk:v52 strokePath:v50 transform:v68 mask:v53 randomSeed:[v9 randomSeed]];

    a5 = 1;
    id v9 = v54;
  }
  if (a6)
  {
    *a6 = +[CRLPKStrokePathConverter strokePathDataFromPKStroke:v9 startingAtIndex:a4 endingAtIndex:a5];
  }
  v55 = [v9 mask];

  if (v55)
  {
    id v56 = objc_alloc((Class)PKStroke);
    CGAffineTransform v57 = [v9 ink];
    long long v58 = [v9 path];
    if (v9) {
      [v9 transform];
    }
    else {
      memset(v67, 0, sizeof(v67));
    }
    id v63 = [v56 initWithInk:v57 strokePath:v58 transform:v67 mask:0 randomSeed:[v9 randomSeed]];

    CGAffineTransform v62 = v63;
  }
  else
  {
    if (!a4)
    {
      long long v59 = [v9 path];
      long long v60 = (char *)[v59 count] - 1;

      if ((char *)a5 == v60)
      {
        id v61 = [v9 _newPathRepresentation];
        goto LABEL_53;
      }
    }
    CGAffineTransform v62 = [v9 _substrokeWithRange:a4, a5 - a4 + 1];
    id v63 = v62;
  }
  id v61 = [v62 _newPathRepresentation];

LABEL_53:
  CGAffineTransform v64 = +[CRLBezierPath bezierPathWithCGPath:v61];
  if (v9) {
    [v9 transform];
  }
  else {
    memset(v66, 0, sizeof(v66));
  }
  [v64 transformUsingAffineTransform:v66];
  if (v61) {
    CFRelease(v61);
  }

  return v64;
}

+ (id)pathFromPKStroke:(id)a3 pencilKitStrokePathData:(id *)a4
{
  id v5 = a3;
  v6 = [v5 path];
  v7 = +[CRLPKStrokeConverter pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:startingAtPointIndex:endingAtPointIndex:pencilKitStrokePathData:", v5, 0, (char *)[v6 count] - 1, a4);

  return v7;
}

@end