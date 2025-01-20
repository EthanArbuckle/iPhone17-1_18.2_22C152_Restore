@interface CRLImageRepSizingState
- (BOOL)sizedImageHasMask;
- (BOOL)wideGamut;
- (CGImage)sizedImage;
- (CGPath)maskPath;
- (CGSize)desiredSize;
- (CRLImageProvider)provider;
- (CRLImageRepSizingState)initWithDesiredSize:(CGSize)a3 provider:(id)a4 maskPath:(CGPath *)a5 wideGamutCanvas:(BOOL)a6;
- (int64_t)sizedImageOrientation;
- (int64_t)status;
- (void)dealloc;
- (void)generateSizedImage;
- (void)setStatus:(int64_t)a3;
@end

@implementation CRLImageRepSizingState

- (CRLImageRepSizingState)initWithDesiredSize:(CGSize)a3 provider:(id)a4 maskPath:(CGPath *)a5 wideGamutCanvas:(BOOL)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v12 = a4;
  if (!v12)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBE98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067A30();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBEB8);
    }
    v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v13);
    }
    v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepSizingState initWithDesiredSize:provider:maskPath:wideGamutCanvas:]");
    v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 32, 0, "invalid nil value for '%{public}s'", "provider");
  }
  v19.receiver = self;
  v19.super_class = (Class)CRLImageRepSizingState;
  v16 = [(CRLImageRepSizingState *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_desiredSize.CGFloat width = width;
    v16->_desiredSize.CGFloat height = height;
    objc_storeStrong((id *)&v16->_provider, a4);
    v17->_status = 0;
    v17->_wideGamutCanvas = a6;
    if (a5) {
      v17->_maskPath = CGPathRetain(a5);
    }
  }

  return v17;
}

- (void)dealloc
{
  CGImageRelease(self->_sizedImage);
  maskPath = self->_maskPath;
  if (maskPath) {
    CGPathRelease(maskPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLImageRepSizingState;
  [(CRLImageRepSizingState *)&v4 dealloc];
}

- (BOOL)sizedImageHasMask
{
  return [(CRLImageRepSizingState *)self maskPath] != 0;
}

- (void)generateSizedImage
{
  if (+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBED8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067AE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBEF8);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v3);
    }
    objc_super v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepSizingState generateSizedImage]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:59 isFatal:0 description:"wrong thread"];
  }
  sizedImage = self->_sizedImage;
  if (sizedImage)
  {
    CFRelease(sizedImage);
    self->_sizedImage = 0;
  }
  if (!self->_status)
  {
    double width = self->_desiredSize.width;
    double height = self->_desiredSize.height;
    if (width < 1.0 || height < 1.0)
    {
      unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CBF18);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        v37 = v11;
        v50.double width = width;
        v50.double height = height;
        v38 = NSStringFromCGSize(v50);
        *(_DWORD *)buf = 67110146;
        unsigned int v40 = v10;
        __int16 v41 = 2082;
        v42 = "-[CRLImageRepSizingState generateSizedImage]";
        __int16 v43 = 2082;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m";
        __int16 v45 = 1024;
        int v46 = 67;
        __int16 v47 = 2112;
        v48 = v38;
        _os_log_error_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Asked to resample an image to be size %@, which is invalid", buf, 0x2Cu);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CBF38);
      }
      id v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v12);
      }
      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageRepSizingState generateSizedImage]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLImageRepSizingState.m"];
      v49.double width = width;
      v49.double height = height;
      v15 = NSStringFromCGSize(v49);
      +[CRLAssertionHandler handleFailureInFunction:v13, v14, 67, 0, "Asked to resample an image to be size %@, which is invalid", v15 file lineNumber isFatal description];

      double height = 1.0;
      double width = 1.0;
    }
    uint64_t v16 = objc_opt_class();
    v17 = [(CRLImageRepSizingState *)self provider];
    v18 = sub_1002469D0(v16, v17);

    if (v18
      && (([v18 naturalSize], width == v20) ? (BOOL v21 = height == v19) : (BOOL v21 = 0),
          v21 && ![(CRLImageRepSizingState *)self maskPath]))
    {
      self->_sizedImage = CGImageRetain((CGImageRef)[v18 CGImageOfLargestSafeSize]);
      self->_sizedImageOrientation = (int64_t)[v18 orientation];
    }
    else
    {
      if ([(CRLImageRepSizingState *)self wideGamut]
        && ([(CRLImageRepSizingState *)self provider],
            v22 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v23 = [v22 isError],
            v22,
            (v23 & 1) == 0))
      {
        v25 = [(CRLImageRepSizingState *)self provider];
        id v26 = [v25 imageGamut];

        if (v26 == (id)2) {
          char v24 = 11;
        }
        else {
          char v24 = 43;
        }
      }
      else
      {
        char v24 = 11;
      }
      v27 = sub_100455AA8(v24, width, height);
      if (v27)
      {
        v28 = v27;
        CGContextSetInterpolationQuality(v27, kCGInterpolationHigh);
        double v29 = sub_100064070();
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        if ([(CRLImageRepSizingState *)self maskPath])
        {
          CGContextAddPath(v28, [(CRLImageRepSizingState *)self maskPath]);
          CGContextClip(v28);
        }
        v36 = [(CRLImageRepSizingState *)self provider];
        [v36 drawImageInContext:v28 rect:v29];

        self->_sizedImage = CGBitmapContextCreateImage(v28);
        self->_sizedImageOrientation = 0;
        CGContextRelease(v28);
      }
    }
  }
}

- (CGSize)desiredSize
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CRLImageProvider)provider
{
  return self->_provider;
}

- (CGPath)maskPath
{
  return self->_maskPath;
}

- (BOOL)wideGamut
{
  return self->_wideGamutCanvas;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (CGImage)sizedImage
{
  return self->_sizedImage;
}

- (int64_t)sizedImageOrientation
{
  return self->_sizedImageOrientation;
}

- (void).cxx_destruct
{
}

@end