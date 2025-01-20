@interface PKStroke
+ (id)crl_strokePathsExcludingNonMaskedPathRangesForPKStroke:(id)a3;
- (CGPoint)crl_anchorPointForTexture;
- (double)crl_maximumActualWidth;
- (id)crl_copyWithNewAnchorPointForTexture:(CGPoint)a3;
- (id)crl_strokeByAppendingTransform:(CGAffineTransform *)a3;
- (id)crl_strokeForTracingWithOutset:(double)a3 shouldIgnoreMask:(BOOL)a4;
@end

@implementation PKStroke

- (double)crl_maximumActualWidth
{
  v3 = [(PKStroke *)self path];
  id v4 = [v3 count];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    double v8 = 0.0;
    double v9 = 0.0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    double v11 = 0.0;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    double v13 = 0.0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    double v15 = 0.0;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v17 = [v3 objectAtIndexedSubscript:v6];
      [v17 size];
      if (v18 > v8)
      {
        uint64_t v7 = v6;
        double v8 = v18;
      }
      if (v19 > v9)
      {
        uint64_t v10 = v6;
        double v9 = v19;
      }
      [v17 force];
      if (v20 > v11)
      {
        [v17 force];
        double v11 = v21;
        uint64_t v12 = v6;
      }
      [v17 _edgeWidth];
      if (v22 > v13)
      {
        [v17 _edgeWidth];
        double v13 = v23;
        uint64_t v14 = v6;
      }
      [v17 _radius2];
      if (v24 > v15)
      {
        [v17 _radius2];
        double v15 = v25;
        uint64_t v16 = v6;
      }

      ++v6;
    }
    while (v5 != (id)v6);
    v26 = +[NSMutableIndexSet indexSet];
    v27 = v26;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      [v26 addIndex:v7];
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [v27 addIndex:v10];
    }
    if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
      [v27 addIndex:v12];
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      [v27 addIndex:v14];
    }
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      [v27 addIndex:v16];
    }
    CGFloat x = CGRectNull.origin.x;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
    id v32 = [v27 firstIndex];
    if (v32 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v33 = v32;
      double v68 = CGPointZero.y;
      do
      {
        CGFloat r1 = height;
        CGFloat v70 = y;
        CGFloat v71 = x;
        v34 = [v3 objectAtIndexedSubscript:v33];
        id v35 = objc_alloc((Class)PKStrokePoint);
        [v34 size];
        double v37 = v36;
        double v39 = v38;
        [v34 opacity];
        double v41 = v40;
        [v34 force];
        double v43 = v42;
        [v34 azimuth];
        double v45 = v44;
        [v34 altitude];
        uint64_t v47 = v46;
        [v34 _edgeWidth];
        CGFloat v48 = width;
        uint64_t v50 = v49;
        [v34 _radius2];
        id v52 = [v35 initWithLocation:CGPointZero.x timeOffset:v68 size:0.0 opacity:v37 force:v39 azimuth:v41 altitude:v43 edgeWidth:v45 radius2:v50];
        id v53 = objc_alloc((Class)PKStrokePath);
        v73[0] = v52;
        v73[1] = v52;
        v54 = +[NSArray arrayWithObjects:v73 count:2];
        v55 = +[NSDate date];
        id v56 = [v53 initWithControlPoints:v54 creationDate:v55];

        id v57 = objc_alloc((Class)PKStroke);
        v58 = [(PKStroke *)self ink];
        [(PKStroke *)self transform];
        id v59 = [v57 initWithInk:v58 strokePath:v56 transform:v72 mask:0];

        [v59 renderBounds];
        v79.origin.CGFloat x = v60;
        v79.origin.CGFloat y = v61;
        v79.size.CGFloat width = v62;
        v79.size.CGFloat height = v63;
        v74.origin.CGFloat y = v70;
        v74.origin.CGFloat x = v71;
        v74.size.CGFloat width = v48;
        v74.size.CGFloat height = r1;
        CGRect v75 = CGRectUnion(v74, v79);
        CGFloat x = v75.origin.x;
        CGFloat y = v75.origin.y;
        CGFloat width = v75.size.width;
        CGFloat height = v75.size.height;
        id v33 = [v27 indexGreaterThanIndex:v33];
      }
      while (v33 != (id)0x7FFFFFFFFFFFFFFFLL);
    }
    v76.origin.CGFloat x = x;
    v76.origin.CGFloat y = y;
    v76.size.CGFloat width = width;
    v76.size.CGFloat height = height;
    double v64 = 0.0;
    if (!CGRectIsNull(v76))
    {
      v77.origin.CGFloat x = x;
      v77.origin.CGFloat y = y;
      v77.size.CGFloat width = width;
      v77.size.CGFloat height = height;
      double v65 = CGRectGetWidth(v77);
      v78.origin.CGFloat x = x;
      v78.origin.CGFloat y = y;
      v78.size.CGFloat width = width;
      v78.size.CGFloat height = height;
      CGFloat v66 = CGRectGetHeight(v78);
      double v64 = sqrt(v65 * v65 + v66 * v66);
    }
  }
  else
  {
    double v64 = 0.0;
  }

  return v64;
}

- (id)crl_strokeForTracingWithOutset:(double)a3 shouldIgnoreMask:(BOOL)a4
{
  uint64_t v7 = [(PKStroke *)self path];
  double v8 = (char *)[v7 count];
  if (v8)
  {
    double v9 = v8;
    [(PKStroke *)self transform];
    double v10 = sub_10007F808(v62);
    if (v10 == 0.0)
    {
      int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2D58);
      }
      uint64_t v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101073DFC(v11, v12);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2D78);
      }
      double v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v13, v11);
      }
      uint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PKStroke(CRLAdditions) crl_strokeForTracingWithOutset:shouldIgnoreMask:]");
      double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/PKStroke_CRLAdditions.m"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:153 isFatal:0 description:"the scale on a PKStroke should not be 0"];

      double v10 = 1.0;
    }
    double v57 = a3;
    double v58 = a3 / v10 + a3 / v10;
    uint64_t v16 = objc_opt_new();
    for (i = 0; i != v9; ++i)
    {
      double v18 = [v7 objectAtIndexedSubscript:i];
      [v18 size];
      double v20 = v58 + v19;
      if (v20 < 3.0) {
        double v20 = 3.0;
      }
      double v60 = v20;
      [v18 size];
      double v22 = v58 + v21;
      if (v58 + v21 < 3.0) {
        double v22 = 3.0;
      }
      double v59 = v22;
      id v23 = objc_alloc((Class)PKStrokePoint);
      [v18 location];
      double v25 = v24;
      double v27 = v26;
      [v18 timeOffset];
      double v29 = v28;
      [v18 opacity];
      double v31 = v30;
      [v18 force];
      double v33 = v32;
      [v18 azimuth];
      double v35 = v34;
      [v18 altitude];
      uint64_t v37 = v36;
      [v18 _edgeWidth];
      uint64_t v39 = v38;
      [v18 _radius2];
      id v41 = [v23 initWithLocation:v25 timeOffset:v27 size:v29 opacity:v60 force:v59 azimuth:v31 altitude:v33 edgeWidth:v35 radius2:v37];
      [v16 addObject:v41];
    }
    id v42 = objc_alloc((Class)PKStrokePath);
    double v43 = [v7 creationDate];
    id v44 = [v42 initWithControlPoints:v16 creationDate:v43];

    double v45 = +[CRLColor blackColor];
    uint64_t v46 = [v45 UIColor];

    id v47 = [objc_alloc((Class)PKInk) initWithInkType:PKInkTypePen color:v46];
    if (a4)
    {
      CGFloat v48 = 0;
      id v49 = 0;
    }
    else
    {
      id v49 = [(PKStroke *)self mask];

      if (!v49) {
        goto LABEL_24;
      }
      id v51 = [(PKStroke *)self mask];
      id v52 = +[CRLBezierPath bezierPathWithCGPath:](CRLBezierPath, "bezierPathWithCGPath:", [v51 CGPath]);

      id v49 = [v52 bezierPathByOffsettingPath:1 joinStyle:v57];

      if (v49)
      {
        id v49 = v49;
        CGFloat v48 = +[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", [v49 CGPath]);
      }
      else
      {
LABEL_24:
        CGFloat v48 = 0;
      }
    }
    id v53 = objc_alloc((Class)PKStroke);
    [(PKStroke *)self transform];
    id v54 = [v53 initWithInk:v47 strokePath:v44 transform:v61 mask:v48];
    v55 = [(PKStroke *)self _renderGroupID];
    [v54 _setRenderGroupID:v55];

    [(PKStroke *)self crl_anchorPointForTexture];
    [v54 crl_copyWithNewAnchorPointForTexture:];
    uint64_t v50 = (PKStroke *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v50 = self;
  }

  return v50;
}

- (id)crl_strokeByAppendingTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v18.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v18.c = v5;
  *(_OWORD *)&v18.tCGFloat x = *(_OWORD *)&a3->tx;
  if (CGAffineTransformIsIdentity(&v18))
  {
    id v6 = [(PKStroke *)self copy];
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    [(PKStroke *)self transform];
    long long v7 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v16.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v16.c = v7;
    *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&a3->tx;
    CGAffineTransformConcat(&v18, &t1, &v16);
    id v8 = objc_alloc((Class)PKStroke);
    double v9 = [(PKStroke *)self ink];
    double v10 = [(PKStroke *)self path];
    int v11 = [(PKStroke *)self mask];
    uint64_t v12 = [(PKStroke *)self randomSeed];
    CGAffineTransform v16 = v18;
    id v13 = [v8 initWithInk:v9 strokePath:v10 transform:&v16 mask:v11 randomSeed:v12];

    uint64_t v14 = [(PKStroke *)self _renderGroupID];
    [v13 _setRenderGroupID:v14];

    [v13 _setFlags:[self _flags]];
    [(PKStroke *)self crl_anchorPointForTexture];
    [v13 crl_copyWithNewAnchorPointForTexture];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)crl_strokePathsExcludingNonMaskedPathRangesForPKStroke:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v5 = [v3 maskedPathRanges];
  double v24 = v3;
  id v6 = [v3 path];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v12 lowerBound];
        unint64_t v14 = vcvtpd_u64_f64(v13);
        [v12 upperBound];
        unint64_t v16 = (unint64_t)v15;
        id v17 = objc_alloc_init((Class)NSMutableArray);
        while (v14 <= v16)
        {
          CGAffineTransform v18 = [v6 objectAtIndexedSubscript:v14];
          [v17 addObject:v18];

          ++v14;
        }
        if ([v17 count])
        {
          id v19 = objc_alloc((Class)PKStrokePath);
          id v20 = [v17 copy];
          double v21 = [v6 creationDate];
          id v22 = [v19 initWithControlPoints:v20 creationDate:v21];

          [v4 addObject:v22];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)crl_copyWithNewAnchorPointForTexture:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (objc_opt_respondsToSelector()) {
    id v6 = -[PKStroke copyWithNewAnchorPointForTexture:](self, "copyWithNewAnchorPointForTexture:", x, y);
  }
  else {
    id v6 = [(PKStroke *)self copy];
  }

  return v6;
}

- (CGPoint)crl_anchorPointForTexture
{
  if (objc_opt_respondsToSelector())
  {
    [(PKStroke *)self _anchorPointForTexture];
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

@end