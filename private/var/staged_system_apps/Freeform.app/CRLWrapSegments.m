@interface CRLWrapSegments
- (CGRect)bounds;
- (CRLWrapSegments)init;
- (CRLWrapSegments)initWithPath:(id)a3;
- (const)segments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)wrapSegmentsByApplyingAffineTransform:(CGAffineTransform *)a3;
- (int64_t)segmentCount;
- (void)dealloc;
- (void)p_buildSegmentsForPath:(id)a3;
- (void)transformUsingAffineTransform:(CGAffineTransform *)a3;
@end

@implementation CRLWrapSegments

- (CRLWrapSegments)init
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWrapSegments;
  result = [(CRLWrapSegments *)&v4 init];
  if (result)
  {
    CGSize size = CGRectZero.size;
    result->mBounds.origin = CGRectZero.origin;
    result->mBounds.CGSize size = size;
  }
  return result;
}

- (CRLWrapSegments)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLWrapSegments;
  v5 = [(CRLWrapSegments *)&v9 init];
  if (v5)
  {
    if ([v4 isFlat])
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [v4 bezierPathByFlatteningPath];
    }
    v7 = v6;
    [(CRLWrapSegments *)v5 p_buildSegmentsForPath:v6];
  }
  return v5;
}

- (void)dealloc
{
  mSegments = self->mSegments;
  if (mSegments) {
    free(mSegments);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWrapSegments;
  [(CRLWrapSegments *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[CRLWrapSegments allocWithZone:a3] init];
  v5 = ($D9ACD5A945031E604089763E4FBE0988 *)malloc_type_calloc(self->mSegmentCount, 0x20uLL, 0x1000040E0EAB150uLL);
  v4->mSegments = v5;
  memcpy(v5, self->mSegments, 32 * self->mSegmentCount);
  v4->mSegmentCount = self->mSegmentCount;
  CGPoint origin = self->mBounds.origin;
  v4->mBounds.CGSize size = self->mBounds.size;
  v4->mBounds.CGPoint origin = origin;
  return v4;
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)segmentCount
{
  return self->mSegmentCount;
}

- (const)segments
{
  return self->mSegments;
}

- (id)wrapSegmentsByApplyingAffineTransform:(CGAffineTransform *)a3
{
  id v4 = [(CRLWrapSegments *)self copy];
  long long v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  [v4 transformUsingAffineTransform:v7];

  return v4;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v27.double c = v5;
  *(_OWORD *)&v27.tdouble x = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformIsIdentity(&v27))
  {
    int64_t mSegmentCount = self->mSegmentCount;
    if (mSegmentCount >= 1)
    {
      p_var1 = &self->mSegments->var1;
      double v8 = 2.22507386e-308;
      double v9 = 1.79769313e308;
      double v10 = 1.79769313e308;
      double v11 = 2.22507386e-308;
      do
      {
        double x = p_var1[-1].x;
        double y = p_var1[-1].y;
        double b = a3->b;
        double c = a3->c;
        double d = a3->d;
        tdouble x = a3->tx;
        tdouble y = a3->ty;
        double v19 = tx + y * c + a3->a * x;
        double v20 = ty + y * d + b * x;
        double v21 = p_var1->y;
        double v22 = tx + c * v21 + a3->a * p_var1->x;
        double v23 = ty + d * v21 + b * p_var1->x;
        if (v20 >= v23)
        {
          double v24 = v22;
          double v25 = v23;
        }
        else
        {
          double v24 = v19;
          double v25 = v20;
          double v19 = v22;
          double v20 = v23;
        }
        p_var1[-1].double x = v24;
        p_var1[-1].double y = v25;
        p_var1->double x = v19;
        p_var1->double y = v20;
        p_var1 += 2;
        if (v24 >= v19) {
          double v26 = v19;
        }
        else {
          double v26 = v24;
        }
        if (v24 >= v19) {
          double v19 = v24;
        }
        if (v10 >= v26) {
          double v10 = v26;
        }
        if (v11 < v19) {
          double v11 = v19;
        }
        if (v9 >= v25) {
          double v9 = v25;
        }
        if (v8 < v20) {
          double v8 = v20;
        }
        --mSegmentCount;
      }
      while (mSegmentCount);
      self->mBounds.origin.double x = v10;
      self->mBounds.origin.double y = v9;
      self->mBounds.size.double width = v11 - v10;
      self->mBounds.size.double height = v8 - v9;
    }
  }
}

- (void)p_buildSegmentsForPath:(id)a3
{
  id v4 = a3;
  if (([v4 isFlat] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECBA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109CB40();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECBC8);
    }
    long long v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:100 isFatal:0 description:"cannot enumerate flattened segments for a non-flat path"];
  }
  p_mSegments = &self->mSegments;
  if (self->mSegments)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECBE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109CAAC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014ECC08);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:101 isFatal:0 description:"mSegments must be NULL when initializing"];
  }
  CGSize size = CGRectNull.size;
  self->mBounds.CGPoint origin = CGRectNull.origin;
  self->mBounds.CGSize size = size;
  *p_mSegments = 0;
  self->int64_t mSegmentCount = 0;
  if ((uint64_t)[v4 elementCount] >= 1)
  {
    *p_mSegments = ($D9ACD5A945031E604089763E4FBE0988 *)malloc_type_calloc((size_t)[v4 elementCount], 0x20uLL, 0x1000040E0EAB150uLL);
    if ((uint64_t)[v4 elementCount] >= 1)
    {
      char v13 = 0;
      char v14 = 0;
      uint64_t v15 = 0;
      double v16 = 2.22507386e-308;
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      double v19 = 1.79769313e308;
      double v20 = 1.79769313e308;
      CGFloat v49 = CGPointZero.x;
      double v51 = 2.22507386e-308;
      double v21 = y;
      double v22 = CGPointZero.x;
      double v23 = y;
      while (1)
      {
        id v24 = [v4 elementAtIndex:v15 associatedPoints:&v60 *(void *)&v49];
        if (v24 == (id)3)
        {
          if (x == v50 && y == v21)
          {
            if ((v13 & 1) == 0) {
              goto LABEL_85;
            }
LABEL_71:
            if (v14) {
              goto LABEL_72;
            }
            char v14 = 0;
            char v26 = 1;
            goto LABEL_88;
          }
          if (v13)
          {
            double v23 = y;
            double v22 = x;
LABEL_72:
            char v14 = 0;
            if (v21 >= v23) {
              double v39 = v23;
            }
            else {
              double v39 = v21;
            }
            double v40 = v50;
            if (v21 >= v23) {
              double v41 = v22;
            }
            else {
              double v41 = v50;
            }
            if (v21 >= v23) {
              double v42 = v21;
            }
            else {
              double v42 = v23;
            }
            if (v21 < v23) {
              double v40 = v22;
            }
            int64_t mSegmentCount = self->mSegmentCount;
            v44 = &self->mSegments[mSegmentCount];
            v44->var0.double x = v41;
            v44->var0.double y = v39;
            v44->var1.double x = v40;
            v44->var1.double y = v42;
            self->int64_t mSegmentCount = mSegmentCount + 1;
            char v26 = 1;
            double v21 = v23;
            double v50 = v22;
            goto LABEL_88;
          }
          char v26 = 0;
          char v14 = 1;
          double v22 = x;
          double v23 = y;
        }
        else
        {
          if (v24 != (id)1)
          {
            if (!v24)
            {
              char v14 = 0;
              double x = v60;
              double y = v61;
              if (v20 >= v60) {
                double v20 = v60;
              }
              if (v19 >= v61) {
                double v19 = v61;
              }
              if (v16 < v60) {
                double v16 = v60;
              }
              double v25 = v51;
              if (v51 < v61) {
                double v25 = v61;
              }
              double v50 = v60;
              double v51 = v25;
              char v26 = 1;
              double v21 = v61;
              goto LABEL_88;
            }
            unsigned int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014ECC68);
            }
            v35 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v53 = v34;
              __int16 v54 = 2082;
              v55 = "-[CRLWrapSegments p_buildSegmentsForPath:]";
              __int16 v56 = 2082;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m";
              __int16 v58 = 1024;
              int v59 = 153;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected element type (path may not be flat)", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014ECC88);
            }
            v36 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v45 = v36;
              v46 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v53 = v34;
              __int16 v54 = 2114;
              v55 = v46;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]");
            v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"];
            +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:153 isFatal:0 description:"unexpected element type (path may not be flat)"];

            if ((v13 & 1) == 0)
            {
LABEL_85:
              char v26 = 0;
              goto LABEL_88;
            }
            goto LABEL_71;
          }
          if ((v13 & 1) == 0)
          {
            unsigned int v27 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014ECC28);
            }
            v28 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v53 = v27;
              __int16 v54 = 2082;
              v55 = "-[CRLWrapSegments p_buildSegmentsForPath:]";
              __int16 v56 = 2082;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m";
              __int16 v58 = 1024;
              int v59 = 135;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d must have previous point before lineTo", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014ECC48);
            }
            v29 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v47 = v29;
              v48 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v53 = v27;
              __int16 v54 = 2114;
              v55 = v48;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]");
            v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"];
            +[CRLAssertionHandler handleFailureInFunction:v30 file:v31 lineNumber:135 isFatal:0 description:"must have previous point before lineTo"];
          }
          double v22 = v60;
          double v23 = v61;
          if (v20 >= v60) {
            double v20 = v60;
          }
          if (v19 >= v61) {
            double v19 = v61;
          }
          if (v16 < v60) {
            double v16 = v60;
          }
          double v32 = v51;
          if (v51 < v61) {
            double v32 = v61;
          }
          double v51 = v32;
          if (v13) {
            goto LABEL_72;
          }
          char v26 = 0;
          char v14 = 1;
        }
LABEL_88:
        ++v15;
        char v13 = v26;
        if (v15 >= (uint64_t)objc_msgSend(v4, "elementCount", *(void *)&v50)) {
          goto LABEL_91;
        }
      }
    }
    double v20 = 1.79769313e308;
    double v16 = 2.22507386e-308;
    double v51 = 2.22507386e-308;
    double v19 = 1.79769313e308;
LABEL_91:
    self->mBounds.origin.double x = v20;
    self->mBounds.origin.double y = v19;
    self->mBounds.size.double width = v16 - v20;
    self->mBounds.size.double height = v51 - v19;
  }
}

@end