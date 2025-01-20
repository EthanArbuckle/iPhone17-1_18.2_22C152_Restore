@interface CRLPKStrokePathConverter
+ (id)pathFromPKStrokePath:(id)a3 pencilKitStrokePathData:(id *)a4;
+ (id)strokePathDataFromPKStroke:(id)a3 startingAtIndex:(unint64_t)a4 endingAtIndex:(unint64_t)a5;
+ (id)strokePathsFromBezierPath:(id)a3 baseWidth:(double)a4 strokePathCompactData:(id)a5 inkType:(id)a6 isFountainPenInkV2:(BOOL)a7;
+ (unint64_t)countOfBSplineControlPointsForBezierPath:(id)a3;
@end

@implementation CRLPKStrokePathConverter

+ (id)strokePathDataFromPKStroke:(id)a3 startingAtIndex:(unint64_t)a4 endingAtIndex:(unint64_t)a5
{
  id v7 = a3;
  v55 = [v7 path];
  v8 = (char *)[v55 count];
  if ((unint64_t)v8 < a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6C08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A674();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6C28);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:335 isFatal:0 description:"Out-of-bounds startingAtIndex parameter."];
  }
  if ((unint64_t)v8 < a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6C48);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A5EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6C68);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:336 isFatal:0 description:"Out-of-bounds endAtIndex parameter."];
  }
  if ((unint64_t)(v8 - 1) >= a4) {
    unint64_t v15 = a4;
  }
  else {
    unint64_t v15 = (unint64_t)(v8 - 1);
  }
  if ((unint64_t)(v8 - 1) >= a5) {
    unint64_t v16 = a5;
  }
  else {
    unint64_t v16 = (unint64_t)(v8 - 1);
  }
  v17 = [CRLPKStrokePathCompactData alloc];
  id v18 = [v7 randomSeed];
  v19 = [v55 creationDate];
  v20 = v17;
  v21 = v55;
  v22 = [(CRLPKStrokePathCompactData *)v20 initWithCapacity:v16 - v15 + 1 randomSeed:v18 creationDate:v19];

  v54 = v7;
  -[CRLPKStrokePathCompactData setShouldSolveMath:](v22, "setShouldSolveMath:", ((unint64_t)[v7 _flags] >> 41) & 1);
  for (uint64_t i = 0; i != 9; ++i)
  {
    if (v16 >= v15)
    {
      for (uint64_t j = 0; v15 + j <= v16; ++j)
      {
        v25 = [v21 pointAtIndex:v15 + j];
        switch((int)i)
        {
          case 0:
            unint64_t v26 = [(CRLPKStrokePathCompactData *)v22 altitudeData];
            [v25 altitude];
            goto LABEL_44;
          case 1:
            unint64_t v26 = [(CRLPKStrokePathCompactData *)v22 azimuthData];
            [v25 azimuth];
            sub_100066410(v30);
            goto LABEL_44;
          case 2:
            unint64_t v26 = [(CRLPKStrokePathCompactData *)v22 opacityData];
            [v25 opacity];
            goto LABEL_44;
          case 3:
            unint64_t v26 = [(CRLPKStrokePathCompactData *)v22 forceData];
            [v25 force];
            goto LABEL_44;
          case 4:
            id v28 = [(CRLPKStrokePathCompactData *)v22 sizeXData];
            [v25 size];
            goto LABEL_41;
          case 5:
            id v28 = [(CRLPKStrokePathCompactData *)v22 sizeYData];
            [v25 size];
            double v32 = v31;
            goto LABEL_42;
          case 6:
            id v28 = [(CRLPKStrokePathCompactData *)v22 timeOffsetData];
            [v25 timeOffset];
            goto LABEL_41;
          case 7:
            id v28 = [(CRLPKStrokePathCompactData *)v22 radius2Data];
            [v25 _radius2];
LABEL_41:
            double v32 = v29;
LABEL_42:
            unint64_t v26 = 0;
            break;
          case 8:
            unint64_t v26 = [(CRLPKStrokePathCompactData *)v22 edgeWidthData];
            [v25 _edgeWidth];
LABEL_44:
            double v32 = v27;
            id v28 = 0;
            break;
          default:
            unint64_t v26 = 0;
            id v28 = 0;
            double v32 = 0.0;
            break;
        }
        if (!(v26 | (unint64_t)v28))
        {
          unsigned int v38 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6C88);
          }
          v39 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v58 = v38;
            __int16 v59 = 2082;
            v60 = "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]";
            __int16 v61 = 2082;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m";
            __int16 v63 = 1024;
            int v64 = 408;
            _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected a uint16 value or a float value.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6CA8);
          }
          v40 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v44 = v40;
            v45 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v58 = v38;
            __int16 v59 = 2114;
            v60 = v45;
            _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]");
          v42 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
          +[CRLAssertionHandler handleFailureInFunction:v41 file:v42 lineNumber:408 isFatal:0 description:"Expected a uint16 value or a float value."];

          goto LABEL_68;
        }
        if (v26 && v28)
        {
          unsigned int v33 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6CC8);
          }
          v34 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v58 = v33;
            __int16 v59 = 2082;
            v60 = "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]";
            __int16 v61 = 2082;
            v62 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m";
            __int16 v63 = 1024;
            int v64 = 409;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected a uint16 value or a float value but not both.", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D6CE8);
          }
          v35 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            v46 = v35;
            v47 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v58 = v33;
            __int16 v59 = 2114;
            v60 = v47;
            _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          v36 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathDataFromPKStroke:startingAtIndex:endingAtIndex:]");
          v37 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
          +[CRLAssertionHandler handleFailureInFunction:v36 file:v37 lineNumber:409 isFatal:0 description:"Expected a uint16 value or a float value but not both."];

          v21 = v55;
        }
        else if (!v26)
        {
          if (v28)
          {
            float v43 = v32 * dbl_101175490[i];
            *((float *)v28 + j) = v43;
          }
          goto LABEL_68;
        }
        *(_WORD *)(v26 + 2 * j) = (int)(v32 * dbl_101175490[i]);
LABEL_68:
      }
    }
  }
  [(CRLPKStrokePathCompactData *)v22 setPointCount:v16 - v15 + 1];
  if (v54) {
    [v54 transform];
  }
  else {
    memset(v56, 0, sizeof(v56));
  }
  double v48 = sub_10007F81C((double *)v56);
  double v50 = v49;
  *(float *)&double v48 = v48;
  [(CRLPKStrokePathCompactData *)v22 setRenderScaleX:v48];
  *(float *)&double v51 = v50;
  [(CRLPKStrokePathCompactData *)v22 setRenderScaleY:v51];
  v52 = [v54 _renderGroupID];
  [(CRLPKStrokePathCompactData *)v22 setRenderGroupID:v52];

  [v54 crl_anchorPointForTexture];
  -[CRLPKStrokePathCompactData setAnchorPointForTexture:](v22, "setAnchorPointForTexture:");

  return v22;
}

+ (id)strokePathsFromBezierPath:(id)a3 baseWidth:(double)a4 strokePathCompactData:(id)a5 inkType:(id)a6 isFountainPenInkV2:(BOOL)a7
{
  id v11 = a3;
  id v12 = a5;
  v13 = (NSString *)a6;
  v14 = +[NSMutableArray array];
  if (v13) {
    PKInkType v15 = v13;
  }
  else {
    PKInkType v15 = PKInkTypeMonoline;
  }
  unint64_t v16 = v15;
  long long v47 = 0uLL;
  double v48 = 0;
  sub_10010F940(v11, &v47);
  v17 = v48;
  if (v48)
  {
    if (v12)
    {
      if (a7) {
        int v18 = 0;
      }
      else {
        int v18 = [(NSString *)v13 isEqualToString:PKInkTypeFountainPen];
      }
      long long v45 = v47;
      v46 = v48;
      sub_10010F684(v12, (uint64_t)&v45, v18);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = v48;
      v42 = v13;
      id v40 = v11;
      v22 = +[NSMutableArray array];
      uint64_t v23 = *((void *)&v47 + 1);
      if (*((void *)&v47 + 1))
      {
        double v24 = fmax(a4 * 0.5, 1.0);
        double v43 = fmax(a4 * 0.5 + 2.0, 1.0);
        double v25 = dbl_101175460[v24 < 2.0];
        double v26 = dbl_101175470[v24 < 2.0];
        double v44 = (a4 + 1.0) * 0.85;
        uint64_t v27 = qword_101175480[v24 < 2.0];
        if (v24 < 2.0) {
          a4 = 0.0;
        }
        id v28 = v41 + 1;
        do
        {
          double v30 = *(v28 - 1);
          double v29 = *v28;
          double v31 = v16;
          if ([(NSString *)v31 isEqualToString:PKInkTypePencil])
          {
            id v32 = [objc_alloc((Class)PKStrokePoint) initWithLocation:v30 timeOffset:v29 size:0.0 opacity:v24 force:v24 azimuth:v25 altitude:v26 edgeWidth:v27 radius2:*(void *)&a4];
          }
          else if ([(NSString *)v31 isEqualToString:PKInkTypeWatercolor])
          {
            id v32 = [objc_alloc((Class)PKStrokePoint) initWithLocation:v30 timeOffset:v29 size:0.0 opacity:v24 force:v24 azimuth:0.18 altitude:1.0 edgeWidth:3.14159265 radius2:0x3FF921FB54442D18];
          }
          else if ([(NSString *)v31 isEqualToString:PKInkTypePen] {
                 || [(NSString *)v31 isEqualToString:PKInkTypeMonoline])
          }
          {
            id v32 = [objc_alloc((Class)PKStrokePoint) initWithLocation:v30 timeOffset:v29 size:0.0 opacity:v43 force:v43 azimuth:1.0 altitude:3.14159265];
          }
          else
          {
            id v32 = [objc_alloc((Class)PKStrokePoint) initWithLocation:v30 timeOffset:v29 size:0.0 opacity:v24 force:v24 azimuth:1.0 altitude:3.14159265];
          }
          unsigned int v33 = v32;

          [v22 addObject:v33];
          v28 += 2;
          --v23;
        }
        while (v23);
      }
      id v34 = objc_alloc((Class)PKStrokePath);
      v35 = +[NSDate date];
      id v20 = [v34 initWithControlPoints:v22 creationDate:v35];

      id v12 = 0;
      id v11 = v40;
      v17 = v41;
      v13 = v42;
    }
    free(v17);
    if (v20)
    {
      [v14 addObject:v20];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6E08);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107A784();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D6E28);
      }
      v36 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v36);
      }
      v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:]");
      unsigned int v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 647, 0, "invalid nil value for '%{public}s'", "newStrokePath");
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6DC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A6FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6DE8);
    }
    v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v19);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPKStrokePathConverter strokePathsFromBezierPath:baseWidth:strokePathCompactData:inkType:isFountainPenInkV2:]");
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:624 isFatal:0 description:"Unexpectedly failed to generate B-Spline control points."];
  }

  return v14;
}

+ (id)pathFromPKStrokePath:(id)a3 pencilKitStrokePathData:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)PKInk);
  id v7 = +[UIColor blackColor];
  id v8 = [v6 initWithInkType:PKInkTypePen color:v7];

  id v9 = objc_alloc((Class)PKStroke);
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v14[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v14[1] = v10;
  v14[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v11 = [v9 initWithInk:v8 strokePath:v5 transform:v14 mask:0];

  id v12 = +[CRLPKStrokeConverter pathFromPKStroke:v11 pencilKitStrokePathData:a4];

  return v12;
}

+ (unint64_t)countOfBSplineControlPointsForBezierPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  id v7 = 0;
  sub_10010F940(a3, &v5);
  unint64_t v3 = v6;
  if (v7) {
    free(v7);
  }
  return v3;
}

@end