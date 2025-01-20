@interface CRLCurvedShadowRenderHelper
- (CRLCurvedShadowRenderHelper)init;
- (double)p_baseBlurRadiusForCurve:(double)a3 unscaledSize:(CGSize)a4;
- (id)p_alphaOnlyImageFromImage:(id)a3;
- (id)p_blurredImage:(id)a3 edgeBlurRadius:(double)a4 middleBlurRadius:(double)a5 padding:(double)a6 edgeOpacity:(double)a7 middleOpacity:(double)a8;
- (id)p_curvedImageFromImage:(id)a3 curveAmount:(double)a4 padding:(double)a5;
- (id)p_debugColorOverlayImageFromImage:(id)a3;
- (id)p_tintedCIImageFromImage:(id)a3 withColor:(id)a4;
- (void)drawCurvedShadow:(id)a3 forImage:(CGImage *)a4 inContext:(CGContext *)a5 forUnscaledSize:(CGSize)a6 withScaleFactor:(double)a7;
- (void)p_setupCIContext;
@end

@implementation CRLCurvedShadowRenderHelper

- (CRLCurvedShadowRenderHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLCurvedShadowRenderHelper;
  result = [(CRLCurvedShadowRenderHelper *)&v3 init];
  if (result) {
    result->mCIContextCreationLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (double)p_baseBlurRadiusForCurve:(double)a3 unscaledSize:(CGSize)a4
{
  return fmax(fmin((fabs(a3) * 0.5 + fmin(1.0 - (1000.0 - a4.width) / 1000.0, 1.0) * 0.5) * 15.0, 15.0), 4.0);
}

- (void)drawCurvedShadow:(id)a3 forImage:(CGImage *)a4 inContext:(CGContext *)a5 forUnscaledSize:(CGSize)a6 withScaleFactor:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  if (a7 <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE2A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084CFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE2C8);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v14);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadowRenderHelper drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadowRenderHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 87, 0, "scaleFactor (%f) should be greater than 0.", *(void *)&a7);
  }
  if (a7 > 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE2E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084C58();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE308);
    }
    v17 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v17);
    }
    v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadowRenderHelper drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:]");
    v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadowRenderHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 88, 0, "scaleFactor (%f) should not be greater than 1.", *(void *)&a7);
  }
  ++dword_1016A91D8;
  [v13 paddingForBlur];
  double v21 = v20 * 0.5 * a7;
  [v13 curve];
  double v23 = v22;
  [v13 offset];
  double v25 = v24;
  objc_opt_class();
  objc_opt_class();
  CGContextSaveGState(a5);
  [(CRLCurvedShadowRenderHelper *)self p_setupCIContext];
  v26 = +[CIImage imageWithCGImage:a4];
  v27 = +[NSString stringWithFormat:@"%d-%d--%@", dword_1016A91D8, 0, @"sourceImage"];
  [(CRLCurvedShadowRenderHelper *)self p_debugLogImage:v26 name:v27];

  [v26 extent];
  CGRect v59 = CGRectInset(v58, v21, 0.0);
  v28 = [v26 imageByCroppingToRect:v59.origin.x, v59.origin.y, v59.size.width, v59.size.height];
  v29 = +[NSString stringWithFormat:@"%d-%d--%@", dword_1016A91D8, 0, @"sourceCroppedImage"];
  [(CRLCurvedShadowRenderHelper *)self p_debugLogImage:v28 name:v29];

  v30 = [(CRLCurvedShadowRenderHelper *)self p_alphaOnlyImageFromImage:v28];
  v31 = +[NSString stringWithFormat:@"%d-%d--%@", dword_1016A91D8, 0, @"alphaImage"];
  [(CRLCurvedShadowRenderHelper *)self p_debugLogImage:v30 name:v31];

  v57 = v13;
  v32 = [v13 color];
  v33 = [(CRLCurvedShadowRenderHelper *)self p_tintedCIImageFromImage:v30 withColor:v32];

  v34 = +[NSString stringWithFormat:@"%d-%d--%@", dword_1016A91D8, 0, @"tintedResult"];
  [(CRLCurvedShadowRenderHelper *)self p_debugLogImage:v33 name:v34];

  v35 = [(CRLCurvedShadowRenderHelper *)self p_curvedImageFromImage:v33 curveAmount:v23 * -50.0 * a7 padding:v21];
  v36 = +[NSString stringWithFormat:@"%d-%d--%@", dword_1016A91D8, 0, @"curvedImage"];
  [(CRLCurvedShadowRenderHelper *)self p_debugLogImage:v35 name:v36];

  double v37 = fmin(fabs(v25) * 0.25, 20.0) * a7;
  -[CRLCurvedShadowRenderHelper p_baseBlurRadiusForCurve:unscaledSize:](self, "p_baseBlurRadiusForCurve:unscaledSize:", v23, width, height);
  double v39 = v37 + v38 * a7;
  if (v23 <= 0.0) {
    double v40 = 0.5;
  }
  else {
    double v40 = 1.0;
  }
  if (v23 <= 0.0) {
    double v41 = 1.0;
  }
  else {
    double v41 = 0.5;
  }
  if (v23 >= 0.0) {
    double v42 = v37;
  }
  else {
    double v42 = v37 + v38 * a7;
  }
  if (v23 < 0.0) {
    double v39 = v37;
  }
  v43 = [(CRLCurvedShadowRenderHelper *)self p_blurredImage:v35 edgeBlurRadius:v42 middleBlurRadius:v39 padding:v21 edgeOpacity:v40 middleOpacity:v41];
  v44 = +[NSString stringWithFormat:@"%d-%d--%@", dword_1016A91D8, 0, @"blurredImage"];
  [(CRLCurvedShadowRenderHelper *)self p_debugLogImage:v43 name:v44];

  id v45 = v43;
  mCIContext = self->mCIContext;
  [v45 extent];
  v47 = -[CIContext createCGImage:fromRect:](mCIContext, "createCGImage:fromRect:", v45);
  if (v47)
  {
    v48 = v47;
    [v45 extent];
    v60.origin.x = sub_10006757C(v49, v50, v51, v52);
    CGContextDrawImage(a5, v60, v48);
    CGImageRelease(v48);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE328);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101084BB4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DE348);
    }
    v53 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v53);
    }
    v54 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadowRenderHelper drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:]");
    v55 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadowRenderHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v54, v55, 152, 0, "Cannot render curved shadow, the size is too large for the CIContext to convert back to a CGImage. Skipping render.");
  }
  CGContextRestoreGState(a5);
}

- (void)p_setupCIContext
{
  if (!self->mCIContext)
  {
    p_mCIContextCreationLock = &self->mCIContextCreationLock;
    os_unfair_lock_lock(&self->mCIContextCreationLock);
    if (!self->mCIContext)
    {
      v4 = +[CIContext contextWithOptions:0];
      mCIContext = self->mCIContext;
      self->mCIContext = v4;
    }
    os_unfair_lock_unlock(p_mCIContextCreationLock);
  }
}

- (id)p_tintedCIImageFromImage:(id)a3 withColor:(id)a4
{
  long long v12 = xmmword_1011762F0;
  long long v13 = unk_101176300;
  id v5 = a3;
  [a4 getRGBAComponents:&v12];
  v6 = +[CIFilter filterWithName:@"CIConstantColorGenerator"];
  v7 = +[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", v12, v13);
  [v6 setValue:v7 forKey:@"inputColor"];
  v8 = [v6 valueForKey:@"outputImage"];
  v9 = +[CIFilter filterWithName:@"CIMultiplyCompositing"];
  [v9 setValue:v8 forKey:@"inputImage"];
  [v9 setValue:v5 forKey:@"inputBackgroundImage"];

  v10 = [v9 valueForKey:@"outputImage"];

  return v10;
}

- (id)p_debugColorOverlayImageFromImage:(id)a3
{
  id v3 = a3;
  v4 = +[CIFilter filterWithName:@"CIConstantColorGenerator"];
  id v5 = +[CIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
  [v4 setValue:v5 forKey:@"inputColor"];
  v6 = [v4 valueForKey:@"outputImage"];
  v7 = [v3 imageByCompositingOverImage:v6];
  [v3 extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [v7 imageByCroppingToRect:v9, v11, v13, v15];

  return v16;
}

- (id)p_alphaOnlyImageFromImage:(id)a3
{
  id v3 = a3;
  v4 = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:1.0];
  id v5 = +[CIVector vectorWithX:0.0 Y:0.0 Z:0.0 W:0.0];
  v6 = +[CIFilter filterWithName:@"CIColorMatrix", kCIInputImageKey, v3, @"inputRVector", v4, @"inputGVector", v4, @"inputBVector", v4, @"inputAVector", v4, @"inputBiasVector", v5, 0 keysAndValues];

  v7 = [v6 outputImage];

  return v7;
}

- (id)p_curvedImageFromImage:(id)a3 curveAmount:(double)a4 padding:(double)a5
{
  id v7 = a3;
  [v7 extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v17 = +[CRLCurvedShadowCurveFilter curveKernel];
  v23[0] = v7;
  v23[1] = v16;
  v18 = +[NSNumber numberWithDouble:a5];
  v23[2] = v18;
  v19 = +[NSNumber numberWithDouble:a4];
  v23[3] = v19;
  double v20 = +[NSArray arrayWithObjects:v23 count:4];

  double v21 = [v17 applyWithExtent:&stru_1014DE388 roiCallback:v20 arguments:v9, v11, v13, v15];

  return v21;
}

- (id)p_blurredImage:(id)a3 edgeBlurRadius:(double)a4 middleBlurRadius:(double)a5 padding:(double)a6 edgeOpacity:(double)a7 middleOpacity:(double)a8
{
  id v13 = a3;
  double v14 = sub_100407E68(a4, a5, 0.5);
  double v15 = +[NSNumber numberWithDouble:a4];
  v48 = +[CIFilter filterWithName:@"CIGaussianBlur", kCIInputImageKey, v13, kCIInputRadiusKey, v15, 0 keysAndValues];

  v16 = [v48 outputImage];
  v17 = +[NSNumber numberWithDouble:a5];
  v47 = +[CIFilter filterWithName:@"CIGaussianBlur", kCIInputImageKey, v13, kCIInputRadiusKey, v17, 0 keysAndValues];

  v18 = [v47 outputImage];
  v19 = +[NSNumber numberWithDouble:v14];
  double v20 = +[CIFilter filterWithName:@"CIGaussianBlur", kCIInputImageKey, v13, kCIInputRadiusKey, v19, 0 keysAndValues];

  double v21 = [v20 outputImage];
  v46 = v16;
  [v16 extent];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [v18 extent];
  v53.origin.double x = v30;
  v53.origin.double y = v31;
  v53.size.double width = v32;
  v53.size.double height = v33;
  v51.origin.double x = v23;
  v51.origin.double y = v25;
  v51.size.double width = v27;
  v51.size.double height = v29;
  CGRect v52 = CGRectUnion(v51, v53);
  double x = v52.origin.x;
  double y = v52.origin.y;
  double width = v52.size.width;
  double height = v52.size.height;
  double v38 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  double v39 = +[CRLCurvedShadowBlurBlendFilter blurBlendKernel];
  v49[0] = v16;
  v49[1] = v21;
  v49[2] = v18;
  v49[3] = v38;
  double v40 = +[NSNumber numberWithDouble:a6];
  v49[4] = v40;
  double v41 = +[NSNumber numberWithDouble:a7];
  v49[5] = v41;
  double v42 = +[NSNumber numberWithDouble:a8];
  v49[6] = v42;
  v43 = +[NSArray arrayWithObjects:v49 count:7];
  v44 = [v39 applyWithExtent:&stru_1014DE3A8 roiCallback:v43 arguments:x, y, width, height];

  return v44;
}

- (void).cxx_destruct
{
}

@end