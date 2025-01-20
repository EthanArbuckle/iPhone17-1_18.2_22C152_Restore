@interface CRLGradientFill
+ (id)linearGradientWithGradientStops:(id)a3;
+ (id)linearGradientWithStartColor:(id)a3 endColor:(id)a4;
+ (id)radialGradientWithGradientStops:(id)a3;
+ (id)radialGradientWithStartColor:(id)a3 endColor:(id)a4;
+ (void)sortStopsArray:(id)a3;
- (BOOL)hasAlpha;
- (BOOL)i_advancedGradientFlag;
- (BOOL)isAdvancedGradient;
- (BOOL)isAdvancedGradientIgnoringFlag;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (BOOL)p_isAnyStopP3;
- (CGAffineTransform)centeredRadialTransformInRect:(SEL)a3;
- (CGContext)p_beginBitmapWrapperContextInContext:(CGContext *)a3 returningIntegralBounds:(CGRect *)a4;
- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4;
- (CGShading)shadingRef;
- (CRLColor)firstColor;
- (CRLColor)lastColor;
- (CRLGradientFill)init;
- (CRLGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4;
- (CRLGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5;
- (CRLGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5;
- (NSArray)gradientStops;
- (double)opacity;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)p_insertStopAtFraction:(double)a3;
- (id)p_insertStopAtFraction:(double)a3 withColor:(id)a4;
- (id)p_newColorAtFraction:(double)a3;
- (id)p_newColorInShadingColorSpaceFromColor:(id)a3;
- (id)p_removeStopAtIndex:(unint64_t)a3;
- (id)stopAfterFraction:(double)a3;
- (id)stopAtIndex:(unint64_t)a3;
- (id)stopBeforeFraction:(double)a3;
- (int64_t)fillType;
- (unint64_t)gradientType;
- (unint64_t)hash;
- (unint64_t)p_shadingColorSpace;
- (void)dealloc;
- (void)i_setAdvancedGradientFlag:(BOOL)a3;
- (void)p_endBitmapWrapperContext:(CGContext *)a3 inContext:(CGContext *)a4 withIntegralBounds:(CGRect)a5;
- (void)p_evenlyDistributeStops;
- (void)p_insertGradientStop:(id)a3;
- (void)p_moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4;
- (void)p_removeStop:(id)a3;
- (void)p_reverseStopOrder;
- (void)p_setAlpha:(CGContext *)a3;
- (void)p_setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4;
- (void)p_setGradientStops:(id)a3;
- (void)p_setGradientType:(unint64_t)a3;
- (void)p_setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4;
- (void)p_setIsAdvancedGradient:(BOOL)a3;
- (void)p_setOpacity:(double)a3;
- (void)p_swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4;
- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4;
- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5;
- (void)releaseShadingRef;
@end

@implementation CRLGradientFill

- (void)p_setOpacity:(double)a3
{
  self->mOpacity = a3;
}

- (void)p_setIsAdvancedGradient:(BOOL)a3
{
  self->mIsAdvancedGradient = a3;
}

- (CRLGradientFill)init
{
  v4.receiver = self;
  v4.super_class = (Class)CRLGradientFill;
  v2 = [(CRLGradientFill *)&v4 init];
  if (v2)
  {
    v2->mStops = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mShadingColorSpace = 2;
  }
  return v2;
}

- (CRLGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4 opacity:(double)a5
{
  v8 = [(CRLGradientFill *)self init];
  v9 = v8;
  if (v8)
  {
    mStops = v8->mStops;
    if (mStops) {
      [(NSMutableArray *)mStops setArray:a3];
    }
    else {
      v9->mStops = (NSMutableArray *)[a3 mutableCopy];
    }
    v9->mType = a4;
    v9->mOpacity = a5;
    v9->mShadingColorSpace = 2;
  }
  return v9;
}

- (CRLGradientFill)initWithGradientStops:(id)a3 type:(unint64_t)a4
{
  return [(CRLGradientFill *)self initWithGradientStops:a3 type:a4 opacity:1.0];
}

- (CRLGradientFill)initWithStartColor:(id)a3 endColor:(id)a4 type:(unint64_t)a5
{
  v9[0] = +[CRLGradientFillStop gradientStopWithColor:a3 fraction:0.0];
  v9[1] = +[CRLGradientFillStop gradientStopWithColor:a4 fraction:1.0];
  return [(CRLGradientFill *)self initWithGradientStops:+[NSArray arrayWithObjects:v9 count:2] type:a5];
}

- (void)dealloc
{
  [(CRLGradientFill *)self releaseShadingRef];
  v3.receiver = self;
  v3.super_class = (Class)CRLGradientFill;
  [(CRLGradientFill *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"%@<%p>: type=%tu opacity=%f \n\tstops<%p>=%@", NSStringFromClass(v3), self, self->mType, *(void *)&self->mOpacity, self->mStops, self->mStops];
}

- (unint64_t)hash
{
  uint64_t v3 = sub_1000C8080((char *)&self->mType, 8, (uint64_t)[(NSArray *)[(CRLGradientFill *)self gradientStops] hash]);
  uint64_t v4 = sub_1000C8080((char *)&self->mOpacity, 8, v3);

  return sub_1000C8080((char *)&self->mIsAdvancedGradient, 1, v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v18 = v4;
    uint64_t v19 = v3;
    uint64_t v11 = objc_opt_class();
    id v12 = sub_1002469D0(v11, a3);
    if (v12)
    {
      v13 = v12;
      if ([v12 gradientType] == self->mType
        && (([v13 opacity], double mOpacity = self->mOpacity, v14 == mOpacity)
         || vabdd_f64(v14, mOpacity) < fabs(mOpacity * 0.000000999999997)))
      {
        LODWORD(v12) = [self->mStops isEqualToArray:[v13 gradientStops:v6, v5, v18, v19, v7, v8]];
        if (v12)
        {
          unsigned __int8 v16 = [v13 isAdvancedGradient];
          LOBYTE(v12) = v16 ^ [(CRLGradientFill *)self isAdvancedGradient] ^ 1;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
  }
  return (char)v12;
}

+ (void)sortStopsArray:(id)a3
{
}

+ (id)linearGradientWithStartColor:(id)a3 endColor:(id)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithStartColor:a3 endColor:a4 type:0];

  return v4;
}

+ (id)linearGradientWithGradientStops:(id)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithGradientStops:a3 type:0];

  return v3;
}

+ (id)radialGradientWithStartColor:(id)a3 endColor:(id)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithStartColor:a3 endColor:a4 type:1];

  return v4;
}

+ (id)radialGradientWithGradientStops:(id)a3
{
  id v3 = [objc_alloc((Class)objc_opt_class()) initWithGradientStops:a3 type:1];

  return v3;
}

- (NSArray)gradientStops
{
  return &self->mStops->super;
}

- (CRLColor)firstColor
{
  id v2 = [(NSMutableArray *)self->mStops firstObject];

  return (CRLColor *)[v2 color];
}

- (CRLColor)lastColor
{
  id v2 = [(NSMutableArray *)self->mStops lastObject];

  return (CRLColor *)[v2 color];
}

- (CGShading)shadingRef
{
  result = self->mShadingRef;
  if (!result)
  {
    *(_OWORD *)domain = xmmword_1011762C0;
    range[0] = 0.0;
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    range[1] = 1.0;
    uint64_t v12 = 0x3FF0000000000000;
    uint64_t v14 = 0x3FF0000000000000;
    uint64_t v15 = 0;
    uint64_t v16 = 0x3FF0000000000000;
    *(void *)&callbacks.version = 0;
    callbacks.evaluate = (CGFunctionEvaluateCallback)sub_10040C250;
    callbacks.releaseInfo = (CGFunctionReleaseInfoCallback)sub_10040C304;
    id v4 = (CRLGradientFill *)[(CRLGradientFill *)self mutableCopy];
    if (v4 == self)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F8238);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B0538();
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101076AC0();
      }
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLGradientFill *)NSString shadingRef], 245, 0, "Creating retain cycle between gradient and its shading ref"");
    }
    uint64_t v5 = CGFunctionCreate(v4, 1uLL, domain, 4uLL, range, &callbacks);
    if ((id)[(CRLGradientFill *)self p_shadingColorSpace] == (id)1) {
      uint64_t v6 = sub_10000FDD8();
    }
    else {
      uint64_t v6 = sub_10000FD54();
    }
    uint64_t v7 = (CGColorSpace *)v6;
    if ([(CRLGradientFill *)self gradientType])
    {
      v18.x = 0.0;
      v18.y = 0.0;
      v21.x = 0.0;
      v21.y = 0.0;
      Radial = CGShadingCreateRadial(v7, v18, 0.0, v21, 100.0, v5, 1, 1);
    }
    else
    {
      v20.x = 100.0;
      v19.x = 0.0;
      v19.y = 0.0;
      v20.y = 0.0;
      Radial = CGShadingCreateAxial(v7, v19, v20, v5, 1, 1);
    }
    self->mShadingRef = Radial;
    CGFunctionRelease(v5);
    return self->mShadingRef;
  }
  return result;
}

- (unint64_t)p_shadingColorSpace
{
  unint64_t result = self->mShadingColorSpace;
  if (result == 2)
  {
    unint64_t result = [(CRLGradientFill *)self p_isAnyStopP3];
    self->mShadingColorSpace = result;
  }
  return result;
}

- (void)releaseShadingRef
{
  self->mShadingRef = 0;
  self->mShadingColorSpace = 2;
}

- (id)p_newColorInShadingColorSpaceFromColor:(id)a3
{
  unint64_t v3 = [(CRLGradientFill *)self p_shadingColorSpace];
  id v4 = [a3 colorRGBSpace];
  if (v3 == 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8278);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B05F4();
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLGradientFill *)NSString p_newColorInShadingColorSpaceFromColor:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"], 286, 0, "Shading color space should not be unspecified."", v14, v15);
    return a3;
  }
  id v7 = v4;
  if (v4 != (id)2 && v4 != (id)v3)
  {
    if (v3 == 1)
    {
      if (v4)
      {
        int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014F82B8);
        }
        v9 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B06B0(v8, v9);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101076AC0();
        }
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLGradientFill *)NSString p_newColorInShadingColorSpaceFromColor:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"], 299, 0, "expected equality between %{public}s and %{public}s", "originalColorSpace", "CRLColorRGBSpaceSRGB"");
      }
      v10 = (CGColorSpace *)sub_10000FDD8();
      CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v10, kCGRenderingIntentDefault, (CGColorRef)[a3 CGColor], 0);
      uint64_t v5 = [[CRLColor alloc] initWithCGColor:CopyByMatchingToColorSpace colorSpace:1];
      CGColorRelease(CopyByMatchingToColorSpace);
      return v5;
    }
    unsigned int v12 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F82F8);
    }
    uint64_t v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v18 = v12;
      __int16 v19 = 2082;
      CGPoint v20 = "-[CRLGradientFill p_newColorInShadingColorSpaceFromColor:]";
      __int16 v21 = 2082;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
      __int16 v23 = 1024;
      int v24 = 307;
      __int16 v25 = 2048;
      id v26 = v7;
      __int16 v27 = 2048;
      unint64_t v28 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unexpected combination of source (%zu) and destination (%zu) color spaces for gradient shading.", buf, 0x36u);
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014F8318);
      }
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101076AC0();
    }
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(CRLGradientFill *)NSString p_newColorInShadingColorSpaceFromColor:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"], 307, 0, "Unexpected combination of source (%zu) and destination (%zu) color spaces for gradient shading."", v7, v3);
    return a3;
  }

  return a3;
}

- (BOOL)isAdvancedGradient
{
  if (self->mIsAdvancedGradient) {
    return 1;
  }
  else {
    return [(CRLGradientFill *)self isAdvancedGradientIgnoringFlag];
  }
}

- (BOOL)i_advancedGradientFlag
{
  return self->mIsAdvancedGradient;
}

- (void)i_setAdvancedGradientFlag:(BOOL)a3
{
  self->mIsAdvancedGradient = a3;
}

- (BOOL)isAdvancedGradientIgnoringFlag
{
  if (self->mType) {
    return 1;
  }
  if ([(NSMutableArray *)self->mStops count] != (id)2) {
    return 1;
  }
  [self->mStops objectAtIndexedSubscript:0].fraction
  if (v3 != 0.0) {
    return 1;
  }
  [self->mStops objectAtIndexedSubscript:0] inflection
  if (v4 != 0.5 && fabs(v4 + -0.5) >= 5.0e-11) {
    return 1;
  }
  [self->mStops lastObject].fraction;
  return v6 != 1.0;
}

- (id)stopBeforeFraction:(double)a3
{
  double v4 = sub_100407E48(a3, 0.0, 1.0);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableArray *)self->mStops reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v6) {
    return [(NSMutableArray *)self->mStops firstObject];
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v14;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v14 != v8) {
      objc_enumerationMutation(v5);
    }
    v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
    [v10 fraction];
    if (v11 <= v4) {
      return v10;
    }
    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return [(NSMutableArray *)self->mStops firstObject];
    }
  }
}

- (id)stopAfterFraction:(double)a3
{
  double v4 = sub_100407E48(a3, 0.0, 1.0);
  if (v4 == 1.0)
  {
    mStops = self->mStops;
    return [(NSMutableArray *)mStops lastObject];
  }
  else
  {
    double v7 = v4;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = self->mStops;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v9) {
      return [(NSMutableArray *)self->mStops lastObject];
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_7:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      [v13 fraction];
      if (v14 > v7) {
        return v13;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_7;
        }
        return [(NSMutableArray *)self->mStops lastObject];
      }
    }
  }
}

- (id)stopAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->mStops objectAtIndexedSubscript:a3];
}

- (id)p_newColorAtFraction:(double)a3
{
  if (a3 == 0.0)
  {
    double v4 = [(CRLGradientFill *)self firstColor];
LABEL_5:
    return v4;
  }
  if (a3 == 1.0)
  {
    double v4 = [(CRLGradientFill *)self lastColor];
    goto LABEL_5;
  }
  id v7 = [(CRLGradientFill *)self stopBeforeFraction:a3];
  id v8 = [(CRLGradientFill *)self stopAfterFraction:a3];
  if (v7 == v8)
  {
    double v4 = (CRLColor *)[v7 color];
    goto LABEL_5;
  }
  id v9 = v8;
  [v7 fraction];
  double v11 = v10;
  [v9 fraction];
  double v13 = v12 - v11;
  double v14 = 0.0;
  if (v13 > 0.001)
  {
    double v15 = sub_100407E48((a3 - v11) / v13, 0.0, 1.0);
    [v7 inflection];
    double v17 = sub_100407E48(v16, 0.0, 1.0);
    if (v15 >= v17)
    {
      double v14 = 0.5;
      if (v17 != 1.0) {
        double v14 = (v15 - v17) / (1.0 - v17) * 0.5 + 0.5;
      }
    }
    else
    {
      double v14 = v15 / v17 * 0.5;
    }
  }
  id v18 = [v7 color];
  id v19 = [v9 color];

  return [v18 newBlendedColorWithFraction:v19 ofColor:v14];
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8338);
  }
  id v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v4;
    __int16 v16 = 2082;
    double v17 = "-[CRLGradientFill paintRect:inContext:]";
    __int16 v18 = 2082;
    id v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
    __int16 v20 = 1024;
    int v21 = 421;
    __int16 v22 = 2114;
    __int16 v23 = NSStringFromClass(v6);
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8358);
    }
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = v4;
    __int16 v16 = 2114;
    double v17 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill paintRect:inContext:]");
  double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"];
  double v11 = (objc_class *)objc_opt_class();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 421, 0, "Abstract method not overridden by %{public}@", NSStringFromClass(v11));
  double v12 = (objc_class *)objc_opt_class();
  double v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v12), "-[CRLGradientFill paintRect:inContext:]"), 0);
  objc_exception_throw(v13);
}

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4 atAngle:(double)a5
{
  unsigned int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8378);
  }
  id v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v7 = (objc_class *)objc_opt_class();
    *(_DWORD *)buf = 67110146;
    unsigned int v16 = v5;
    __int16 v17 = 2082;
    __int16 v18 = "-[CRLGradientFill paintRect:inContext:atAngle:]";
    __int16 v19 = 2082;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
    __int16 v21 = 1024;
    int v22 = 425;
    __int16 v23 = 2114;
    int v24 = NSStringFromClass(v7);
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F8398);
    }
  }
  id v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v9 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v16 = v5;
    __int16 v17 = 2114;
    __int16 v18 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill paintRect:inContext:atAngle:]");
  double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"];
  double v12 = (objc_class *)objc_opt_class();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 425, 0, "Abstract method not overridden by %{public}@", NSStringFromClass(v12));
  double v13 = (objc_class *)objc_opt_class();
  double v14 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v13), "-[CRLGradientFill paintRect:inContext:atAngle:]"), 0);
  objc_exception_throw(v14);
}

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  unsigned int v4 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F83B8);
  }
  unsigned int v5 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    *(_DWORD *)buf = 67110146;
    unsigned int v15 = v4;
    __int16 v16 = 2082;
    __int16 v17 = "-[CRLGradientFill paintPath:inContext:]";
    __int16 v18 = 2082;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m";
    __int16 v20 = 1024;
    int v21 = 429;
    __int16 v22 = 2114;
    __int16 v23 = NSStringFromClass(v6);
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F83D8);
    }
  }
  id v7 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    id v8 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = v4;
    __int16 v16 = 2114;
    __int16 v17 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill paintPath:inContext:]");
  double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"];
  double v11 = (objc_class *)objc_opt_class();
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 429, 0, "Abstract method not overridden by %{public}@", NSStringFromClass(v11));
  double v12 = (objc_class *)objc_opt_class();
  double v13 = +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", NSStringFromClass(v12), "-[CRLGradientFill paintPath:inContext:]"), 0);
  objc_exception_throw(v13);
}

- (CGAffineTransform)centeredRadialTransformInRect:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v9 = CGRectGetWidth(a4);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v19);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGFloat MidX = CGRectGetMidX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v21);
  CGAffineTransformMakeTranslation(retstr, MidX, MidY);
  CGAffineTransformMakeScale(&t1, v9 * 0.00707106781, v10 * 0.00707106781);
  long long v13 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v16.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v16.c = v13;
  *(_OWORD *)&v16.tCGFloat x = *(_OWORD *)&retstr->tx;
  unint64_t result = CGAffineTransformConcat(&v18, &t1, &v16);
  long long v15 = *(_OWORD *)&v18.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v18.tx;
  return result;
}

- (BOOL)isOpaque
{
  [(CRLGradientFill *)self opacity];
  if (v3 == 1.0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unsigned int v4 = [(CRLGradientFill *)self gradientStops];
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "color"), "isOpaque");
        if (!v9) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
          LOBYTE(v9) = 1;
          if (v6) {
            goto LABEL_4;
          }
          return v9;
        }
      }
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unsigned int v4 = [(CRLGradientFill *)+[CRLMutableGradientFill allocWithZone:a3] initWithGradientStops:self->mStops type:self->mType opacity:self->mOpacity];
  [(CRLGradientFill *)v4 i_setAdvancedGradientFlag:[(CRLGradientFill *)self i_advancedGradientFlag]];
  return v4;
}

- (BOOL)hasAlpha
{
  id v2 = [(NSMutableArray *)self->mStops objectEnumerator];
  do
  {
    id v3 = [v2 nextObject];
    id v4 = v3;
  }
  while (v3 && CGColorGetAlpha([[v3 color] CGColor]) == 1.0);
  return v4 != 0;
}

- (BOOL)p_isAnyStopP3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mStops = self->mStops;
  id v3 = [(NSMutableArray *)mStops countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(mStops);
      }
      id v3 = objc_msgSend(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "color"), "colorRGBSpace");
      if (v3 == (id)1) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v3 = [(NSMutableArray *)mStops countByEnumeratingWithState:&v8 objects:v12 count:16];
        id v4 = v3;
        if (v3) {
          goto LABEL_3;
        }
        return (char)v3;
      }
    }
  }
  return (char)v3;
}

- (int64_t)fillType
{
  return 1;
}

- (CGPoint)startPointForPath:(id)a3 andBounds:(CGRect)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F83F8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B07B0();
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101076AC0();
  }
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill startPointForPath:andBounds:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 516, 0, "Subclasses should override.");
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)endPointForPath:(id)a3 andBounds:(CGRect)a4
{
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014F8438);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010B086C();
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101076AC0();
  }
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGradientFill endPointForPath:andBounds:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGradientFill.m"), 521, 0, "Subclasses should override.");
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)p_setAlpha:(CGContext *)a3
{
  [(CRLGradientFill *)self opacity];

  CGContextSetAlpha(a3, v4);
}

- (CGContext)p_beginBitmapWrapperContextInContext:(CGContext *)a3 returningIntegralBounds:(CGRect *)a4
{
  if (!a3) {
    return 0;
  }
  ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
  double x = ClipBoundingBox.origin.x;
  CGFloat y = ClipBoundingBox.origin.y;
  CGFloat width = ClipBoundingBox.size.width;
  CGFloat height = ClipBoundingBox.size.height;
  CGRect v15 = CGRectIntegral(ClipBoundingBox);
  if (a4) {
    *a4 = v15;
  }
  v16.origin.double x = sub_1000652FC(x, y, width, height, 1.0);
  CGRect v17 = CGRectIntegral(v16);
  long long v9 = 0;
  if (v17.size.width > 0.0 && v17.size.height > 0.0)
  {
    double v10 = v17.origin.x;
    double v11 = v17.origin.y;
    long long v12 = sub_100455AA8(3, v17.size.width, v17.size.height);
    long long v9 = v12;
    if (v12)
    {
      CGContextTranslateCTM(v12, -v10, -v11);
      CGContextScaleCTM(v9, 1.0, 1.0);
    }
  }
  return v9;
}

- (void)p_endBitmapWrapperContext:(CGContext *)a3 inContext:(CGContext *)a4 withIntegralBounds:(CGRect)a5
{
  if (a3)
  {
    if (a4)
    {
      CGFloat height = a5.size.height;
      CGFloat width = a5.size.width;
      CGFloat y = a5.origin.y;
      CGFloat x = a5.origin.x;
      CGImageRef Image = CGBitmapContextCreateImage(a3);
      if (Image)
      {
        long long v12 = Image;
        CGContextSaveGState(a4);
        v14.origin.CGFloat x = x;
        v14.origin.CGFloat y = y;
        v14.size.CGFloat width = width;
        v14.size.CGFloat height = height;
        CGContextDrawImage(a4, v14, v12);
        CGContextRestoreGState(a4);
        CGImageRelease(v12);
      }
    }
    CGContextRelease(a3);
  }
}

- (void)p_setGradientStops:(id)a3
{
  if (self->mStops != a3)
  {
    uint64_t v5 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:");
    if ([a3 count])
    {
      uint64_t v6 = 0;
      unsigned int v7 = 1;
      do
      {
        id v8 = [a3 objectAtIndexedSubscript:v6];
        id v9 = [v8 color];
        ColorSpace = CGColorGetColorSpace((CGColorRef)[v9 CGColor]);
        if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB)
        {
          [v9 redComponent];
          double v12 = v11;
          [v9 greenComponent];
          double v14 = v13;
          [v9 blueComponent];
          double v16 = v15;
          [v9 alphaComponent];
          [v5 replaceObjectAtIndex:v6 withObject:[v8 gradientStopWithColor:[CRLColor colorWithRed:v12 green:v14 blue:v16 alpha:v17]]];
        }
        uint64_t v6 = v7;
      }
      while ((unint64_t)[a3 count] > v7++);
    }
    [(NSMutableArray *)self->mStops removeAllObjects];
    [(NSMutableArray *)self->mStops addObjectsFromArray:v5];
    [(CRLGradientFill *)self releaseShadingRef];
  }
}

- (void)p_insertGradientStop:(id)a3
{
  if ([(NSMutableArray *)self->mStops count])
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    id v11 = 0;
    id v11 = [(NSMutableArray *)self->mStops count];
    mStops = self->mStops;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10040EBF0;
    v7[3] = &unk_1014F8480;
    v7[4] = a3;
    v7[5] = &v8;
    [(NSMutableArray *)mStops enumerateObjectsUsingBlock:v7];
    [(NSMutableArray *)self->mStops insertObject:a3 atIndex:v9[3]];
    [(CRLGradientFill *)self releaseShadingRef];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    uint64_t v6 = self->mStops;
    [(NSMutableArray *)v6 addObject:a3];
  }
}

- (void)p_removeStop:(id)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mStops count] < 3) {
    +[NSException raise:NSGenericException format:@"Attempted to remove too many gradient stops. Must have at least 2."];
  }
  else {
    [(NSMutableArray *)self->mStops removeObject:a3];
  }

  [(CRLGradientFill *)self releaseShadingRef];
}

- (id)p_removeStopAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mStops count] < 3) {
    objc_exception_throw(+[NSException exceptionWithName:NSInvalidArgumentException reason:@"Attempted to remove too many gradient stops. Must have at least 2." userInfo:0]);
  }
  id v5 = [(NSMutableArray *)self->mStops objectAtIndexedSubscript:a3];
  [(NSMutableArray *)self->mStops removeObjectAtIndex:a3];
  [(CRLGradientFill *)self releaseShadingRef];

  return v5;
}

- (id)p_insertStopAtFraction:(double)a3
{
  id v5 = -[CRLGradientFill p_newColorAtFraction:](self, "p_newColorAtFraction:");

  return [(CRLGradientFill *)self p_insertStopAtFraction:v5 withColor:a3];
}

- (id)p_insertStopAtFraction:(double)a3 withColor:(id)a4
{
  id v5 = +[CRLGradientFillStop gradientStopWithColor:a4 fraction:a3];
  [(CRLGradientFill *)self p_insertGradientStop:v5];
  [(CRLGradientFill *)self releaseShadingRef];
  return v5;
}

- (void)p_reverseStopOrder
{
  id v3 = (char *)[(NSMutableArray *)self->mStops count];
  CGFloat v4 = +[NSMutableArray arrayWithCapacity:v3];
  if (v3)
  {
    for (i = 0; i != v3; ++i)
      [v4 addObject:[-[NSMutableArray objectAtIndexedSubscript:](self->mStops, "objectAtIndexedSubscript:", i), "mutableCopy"]];
  }
  unint64_t v6 = 1;
  unsigned int v7 = v3 - 1;
  do
  {
    id v8 = [(NSMutableArray *)v4 objectAtIndexedSubscript:v6 - 1];
    [v8 fraction];
    [v8 setFraction:1.0 - v9];
    if ((char *)(v6 - 1) != v7)
    {
      id v10 = [(NSMutableArray *)v4 objectAtIndexedSubscript:v7];
      [v10 fraction];
      [v10 setFraction:1.0 - v11];
      [(NSMutableArray *)v4 exchangeObjectAtIndex:v6 - 1 withObjectAtIndex:v7];
    }
  }
  while (v6++ <= (unint64_t)--v7);
  if (v3 != (char *)1)
  {
    uint64_t v13 = 0;
    double v14 = v3 - 2;
    do
    {
      id v15 = [(NSMutableArray *)v4 objectAtIndexedSubscript:v13];
      [self->mStops[v14] inflection];
      [v15 setInflection:1.0 - v16];
      ++v13;
      --v14;
    }
    while (v14 != (char *)-1);
  }
  [v4 objectAtIndexedSubscript:v3 - 1].setInflection(0.5);
  if (v3)
  {
    for (j = 0; j != v3; ++j)
    {
      CGAffineTransform v18 = [[CRLGradientFillStop alloc] initWithGradientStop:[(NSMutableArray *)v4 objectAtIndexedSubscript:j]];
      [(NSMutableArray *)self->mStops setObject:v18 atIndexedSubscript:j];
    }
  }

  [(CRLGradientFill *)self releaseShadingRef];
}

- (void)p_evenlyDistributeStops
{
  id v3 = [(NSMutableArray *)self->mStops count];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mStops = self->mStops;
  id v5 = [(NSMutableArray *)mStops countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    double v7 = 1.0 / (double)((unint64_t)v3 - 1);
    uint64_t v8 = *(void *)v12;
    double v9 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(mStops);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setFraction:v9];
        double v9 = v7 + v9;
      }
      id v6 = [(NSMutableArray *)mStops countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  [(CRLGradientFill *)self releaseShadingRef];
}

- (void)p_setGradientType:(unint64_t)a3
{
  self->mType = a3;
  [(CRLGradientFill *)self releaseShadingRef];
}

- (void)p_moveStopAtIndex:(unint64_t)a3 toFraction:(double)a4
{
  id v7 = [[self->mStops objectAtIndexedSubscript:] mutableCopy];
  [v7 setFraction:a4];
  uint64_t v8 = [[CRLGradientFillStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];

  [(CRLGradientFill *)self releaseShadingRef];
}

- (void)p_swapStopAtIndex:(unint64_t)a3 withStopAtIndex:(unint64_t)a4
{
  id v7 = [[self->mStops objectAtIndexedSubscript:] mutableCopy];
  uint64_t v8 = [[CRLGradientFillStop alloc] initWithGradientStop:[self->mStops objectAtIndexedSubscript:a4] mutableCopy];
  double v9 = [[CRLGradientFillStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];
  [(NSMutableArray *)self->mStops setObject:v9 atIndexedSubscript:a4];

  [(CRLGradientFill *)self releaseShadingRef];
}

- (void)p_setColorOfStopAtIndex:(unint64_t)a3 toColor:(id)a4
{
  id v7 = [[self->mStops objectAtIndexedSubscript:] mutableCopy];
  [v7 setColor:a4];
  uint64_t v8 = [[CRLGradientFillStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];

  [(CRLGradientFill *)self releaseShadingRef];
}

- (void)p_setInflectionOfStopAtIndex:(unint64_t)a3 toInflection:(double)a4
{
  id v7 = [[self->mStops objectAtIndexedSubscript:] mutableCopy];
  [v7 setInflection:a4];
  uint64_t v8 = [[CRLGradientFillStop alloc] initWithGradientStop:v7];
  [(NSMutableArray *)self->mStops setObject:v8 atIndexedSubscript:a3];

  [(CRLGradientFill *)self releaseShadingRef];
}

- (unint64_t)gradientType
{
  return self->mType;
}

- (double)opacity
{
  return self->mOpacity;
}

@end