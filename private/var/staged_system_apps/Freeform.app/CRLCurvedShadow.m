@interface CRLCurvedShadow
+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(id)a8 enabled:(BOOL)a9;
- (BOOL)isEqual:(id)a3;
- (BOOL)showForEditingText;
- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6;
- (CGRect)boundsForRep:(id)a3;
- (CGRect)boundsInNaturalSpaceForRep:(id)a3;
- (CGRect)expandedBoundsForRect:(CGRect)a3;
- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4;
- (CRLCurvedShadow)initWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(id)a8 enabled:(BOOL)a9;
- (double)clampOffset:(double)a3;
- (double)curve;
- (double)paddingForBlur;
- (double)paddingForCurveWithSize:(CGSize)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newShadowClampedForSwatches;
- (unint64_t)hash;
- (unint64_t)shadowType;
- (void)i_setCurve:(double)a3;
@end

@implementation CRLCurvedShadow

+ (id)curvedShadowWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(id)a8 enabled:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a8;
  id v17 = [objc_alloc((Class)a1) initWithOffset:v16 angle:v9 radius:a3 curve:a4 opacity:a5 color:a6 enabled:a7];

  return v17;
}

- (CRLCurvedShadow)initWithOffset:(double)a3 angle:(double)a4 radius:(double)a5 curve:(double)a6 opacity:(double)a7 color:(id)a8 enabled:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a8;
  if (!v16)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA9A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099A48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EA9C0);
    }
    id v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 47, 0, "invalid nil value for '%{public}s'", "color");
  }
  v23.receiver = self;
  v23.super_class = (Class)CRLCurvedShadow;
  v20 = [(CRLShadow *)&v23 i_initWithOpacity:v16 color:v9 angle:a7 offset:a4 radius:a3 enabled:a5];
  v21 = (CRLCurvedShadow *)v20;
  if (v20) {
    v20[7] = a6;
  }

  return v21;
}

- (void)i_setCurve:(double)a3
{
  self->mCurve = a3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(CRLShadow *)self angle];
  uint64_t v6 = v5;
  [(CRLShadow *)self offset];
  uint64_t v8 = v7;
  [(CRLShadow *)self radius];
  uint64_t v10 = v9;
  [(CRLShadow *)self opacity];
  uint64_t v12 = v11;
  v13 = [(CRLShadow *)self color];
  unsigned int v14 = [(CRLShadow *)self isEnabled];
  v15 = @"NO";
  if (v14) {
    v15 = @"YES";
  }
  id v16 = v15;
  [(CRLCurvedShadow *)self curve];
  uint64_t v18 = v17;
  v19 = [(CRLShadow *)self typeDescription];
  v20 = +[NSString stringWithFormat:@"<%@ %p: angle=%g offset=%g radius=%g opacity=%g color=%p enabled=%@  curve=%f type=%@>", v4, self, v6, v8, v10, v12, v13, v16, v18, v19];

  return v20;
}

- (double)clampOffset:(double)a3
{
  float v3 = a3;
  return roundf(v3);
}

- (unint64_t)shadowType
{
  return 3;
}

- (double)paddingForBlur
{
  return 40.0;
}

- (CGRect)expandedBoundsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[CRLCurvedShadow paddingForCurveWithSize:](self, "paddingForCurveWithSize:", a3.size.width, a3.size.height);
  double v9 = v8;
  [(CRLCurvedShadow *)self paddingForBlur];
  double v11 = -v10;
  double v12 = -v10 - v9;
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;

  return CGRectInset(*(CGRect *)&v13, v11, v12);
}

- (double)paddingForCurveWithSize:(CGSize)a3
{
  return a3.height * 0.3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLMutableCurvedShadow alloc];
  [(CRLShadow *)self offset];
  double v6 = v5;
  [(CRLShadow *)self angle];
  double v8 = v7;
  [(CRLShadow *)self radius];
  double v10 = v9;
  [(CRLCurvedShadow *)self curve];
  double v12 = v11;
  [(CRLShadow *)self opacity];
  double v14 = v13;
  CGFloat v15 = [(CRLShadow *)self color];
  CGFloat v16 = [(CRLCurvedShadow *)v4 initWithOffset:v15 angle:[(CRLShadow *)self isEnabled] radius:v6 curve:v8 opacity:v10 color:v12 enabled:v14];

  return v16;
}

- (id)newShadowClampedForSwatches
{
  [(CRLCurvedShadow *)self curve];
  double v4 = sub_100407E48(v3, -0.07, 0.07);
  [(CRLShadow *)self offset];
  double v6 = sub_100407E48(v5, -15.0, 3.0);
  double v7 = [CRLCurvedShadow alloc];
  [(CRLShadow *)self angle];
  double v9 = v8;
  [(CRLShadow *)self radius];
  double v11 = v10;
  [(CRLShadow *)self opacity];
  double v13 = v12;
  double v14 = [(CRLShadow *)self color];
  CGFloat v15 = [(CRLCurvedShadow *)v7 initWithOffset:v14 angle:[(CRLShadow *)self isEnabled] radius:v6 curve:v9 opacity:v11 color:v4 enabled:v13];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, v4);

  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)CRLCurvedShadow,
        [(CRLShadow *)&v12 isEqual:v6]))
  {
    [(CRLCurvedShadow *)self curve];
    double v8 = v7;
    [v6 curve];
    BOOL v10 = v8 == v9 || vabdd_f64(v8, v9) < fabs(v9 * 0.000000999999997);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCurvedShadow;
  return [(CRLShadow *)&v3 hash];
}

- (BOOL)showForEditingText
{
  return 0;
}

- (CGRect)shadowBoundsForRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(CRLShadow *)self isEnabled])
  {
    long long v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v29.c = v10;
    *(_OWORD *)&v29.tCGFloat x = *(_OWORD *)&a4->tx;
    CGAffineTransformInvert(&v30, &v29);
    v31.origin.CGFloat x = x;
    v31.origin.CGFloat y = y;
    v31.size.CGFloat width = width;
    v31.size.CGFloat height = height;
    CGRect v32 = CGRectApplyAffineTransform(v31, &v30);
    -[CRLCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [(CRLShadow *)self offsetDelta];
    CGFloat r1 = height;
    CGFloat v20 = v19;
    [(CRLShadow *)self offsetDelta];
    CGFloat v22 = v21;
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = v14;
    v33.size.CGFloat width = v16;
    v33.size.CGFloat height = v18;
    CGRect v34 = CGRectOffset(v33, v20, v22);
    long long v23 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v29.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v29.c = v23;
    *(_OWORD *)&v29.tCGFloat x = *(_OWORD *)&a4->tx;
    CGRect v38 = CGRectApplyAffineTransform(v34, &v29);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = r1;
    CGRect v36 = CGRectUnion(v35, v38);
    CGFloat x = v36.origin.x;
    CGFloat y = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)boundsInNaturalSpaceForRep:(id)a3
{
  id v4 = [a3 styledLayout];
  uint64_t v5 = [v4 geometryInRoot];
  [v5 frame];
  double v6 = sub_100064070();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CRLCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", v6, v8, v10, v12);
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)boundsForRep:(id)a3
{
  id v4 = [a3 styledLayout];
  uint64_t v5 = [v4 geometryInRoot];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[CRLCurvedShadow expandedBoundsForRect:](self, "expandedBoundsForRect:", v7, v9, v11, v13);
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGImage)newShadowImageForRep:(id)a3 withSize:(CGSize)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  double v12 = [(CRLShadow *)self color];
  [(CRLShadow *)self opacity];
  if (v13 == 0.0 || ([v12 alphaComponent], v16 == 0.0) || width == 0.0 || height == 0.0)
  {
LABEL_2:
    double v14 = [(CRLShadow *)self i_newEmptyImage];
    goto LABEL_3;
  }
  if (qword_1016A95D0 != -1) {
    dispatch_once(&qword_1016A95D0, &stru_1014EA9E0);
  }
  double v17 = sub_10006727C(width, height, 1048576.0);
  double v19 = v18;
  [(CRLCurvedShadow *)self boundsForRep:v11];
  double v21 = v20;
  double v23 = v22;
  double v24 = sub_100455AA8(11, v17, v19);
  if (!v24)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAA00);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099AE4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAA20);
    }
    CGRect v34 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v34);
    }
    CGRect v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]");
    CGRect v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 217, 0, "Cannot render curved shadow, the size is too large for the CGContext to render. Returning an empty image instead.");

    goto LABEL_2;
  }
  double v25 = v24;
  v52 = v12;
  double v26 = [v11 canvas];
  id v27 = [v26 isPrinting];
  v28 = [v11 canvas];
  id v29 = [v28 isDrawingIntoPDF];
  CGAffineTransform v30 = [v11 canvas];
  [v30 contentsScale];
  sub_1004559A4((uint64_t)v25, (uint64_t)v27, (uint64_t)v29, 1, 0, v31);

  CGRect v32 = [v11 layout];
  CGRect v33 = v32;
  if (v32) {
    [v32 transformInRoot];
  }
  else {
    memset(v57, 0, 48);
  }
  double v37 = sub_10007F788(v57);
  sub_100456DE0((uint64_t)v25, v37);

  CGContextScaleCTM(v25, v17 / width, v17 / width);
  CGContextTranslateCTM(v25, -v21, -v23);
  memset(&v56, 0, sizeof(v56));
  CGRect v38 = [v11 styledLayout];
  v39 = v38;
  double v12 = v52;
  if (v38) {
    [v38 transformInRoot];
  }
  else {
    memset(&v56, 0, sizeof(v56));
  }

  CGAffineTransform transform = v56;
  CGContextConcatCTM(v25, &transform);
  [v11 performSelector:a5 withObject:v25];
  Image = CGBitmapContextCreateImage(v25);
  CGContextRelease(v25);
  v41 = sub_100455AA8(3, v17, v19);
  if (!v41)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAA40);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099B78();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAA60);
    }
    v46 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v46);
    }
    v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]");
    v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 249, 0, "Cannot render curved shadow, the size is too large for the CGContext to render. Returning empty image instead");

    CGImageRelease(Image);
    goto LABEL_2;
  }
  v42 = v41;
  if (v6)
  {
    memset(&transform, 0, sizeof(transform));
    v43 = [v11 layout];
    v44 = [v43 geometry];
    v45 = v44;
    if (v44) {
      [v44 transform];
    }
    else {
      memset(&transform, 0, sizeof(transform));
    }

    if (sub_100064F08(transform.a, transform.c, transform.b, transform.d) > 0.0)
    {
      v54.a = -1.0;
      v54.b = 0.0;
      v54.c = 0.0;
      v54.d = 1.0;
      v54.tCGFloat x = v17;
      v54.tCGFloat y = 0.0;
      CGContextConcatCTM(v42, &v54);
    }
    v53.b = 0.0;
    v53.c = 0.0;
    v53.a = 1.0;
    *(_OWORD *)&v53.d = xmmword_101177250;
    v53.tCGFloat y = v19;
    CGContextConcatCTM(v42, &v53);
  }
  if (Image)
  {
    [qword_1016A95C8 drawCurvedShadow:self forImage:Image inContext:v42 forUnscaledSize:width height:height withScaleFactor:v17 / width];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAA80);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101099C0C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EAAA0);
    }
    v49 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v49);
    }
    v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadow newShadowImageForRep:withSize:drawSelector:unflipped:]");
    v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadow.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 265, 0, "invalid nil value for '%{public}s'", "imageWithoutShadow");
  }
  double v14 = CGBitmapContextCreateImage(v42);
  CGContextRelease(v42);
  CGImageRelease(Image);
LABEL_3:

  return v14;
}

- (double)curve
{
  return self->mCurve;
}

@end