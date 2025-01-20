@interface CRLBrushStrokeLayoutOptions
- (CRLBrushStrokeLayoutOptions)init;
- (NSArray)patternOffsetsBySubpath;
- (NSArray)transparencyLayersBySubpath;
- (double)strokeEnd;
- (void)setPatternOffsetsBySubpath:(id)a3;
- (void)setStrokeEnd:(double)a3;
- (void)setTransparencyLayersBySubpath:(id)a3;
@end

@implementation CRLBrushStrokeLayoutOptions

- (CRLBrushStrokeLayoutOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLBrushStrokeLayoutOptions;
  result = [(CRLBrushStrokeLayoutOptions *)&v3 init];
  if (result) {
    result->_strokeEnd = 1.0;
  }
  return result;
}

- (void)setStrokeEnd:(double)a3
{
  double v5 = sub_100407E48(a3, 0.0, 1.0);
  self->_strokeEnd = v5;
  if (v5 != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB6C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B56A8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB6E0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStrokeLayoutOptions setStrokeEnd:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 146, 0, "strokeEnd (%f) should be between 0 and 1 inclusive.", *(void *)&a3);
  }
}

- (NSArray)patternOffsetsBySubpath
{
  return self->_patternOffsetsBySubpath;
}

- (void)setPatternOffsetsBySubpath:(id)a3
{
}

- (NSArray)transparencyLayersBySubpath
{
  return self->_transparencyLayersBySubpath;
}

- (void)setTransparencyLayersBySubpath:(id)a3
{
}

- (double)strokeEnd
{
  return self->_strokeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyLayersBySubpath, 0);

  objc_storeStrong((id *)&self->_patternOffsetsBySubpath, 0);
}

@end