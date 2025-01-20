@interface BKDisplayRenderOverlayImage
- (BKDisplayRenderOverlayImage)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)disablesDisplayUpdates;
- (BOOL)isFrozen;
- (CGImage)image;
- (id)_animationForKeyPath:(id)a3 withSettings:(id)a4;
- (id)_initWithPersistenceData:(id)a3;
- (id)_persistenceData;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_cleanup;
- (void)_dismissWithAnimationSettings:(id)a3;
- (void)_freeze;
- (void)dealloc;
- (void)setFrozen:(BOOL)a3;
@end

@implementation BKDisplayRenderOverlayImage

- (void).cxx_destruct
{
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary
{
  v3 = [(BKDisplayRenderOverlay *)self descriptor];
  v4 = [v3 progressIndicatorProperties];

  if (v4)
  {
    int v33 = 0;
    long long v32 = 0u;
    long long v31 = 0u;
    if ([v4 style] == (id)2) {
      int v5 = 22;
    }
    else {
      int v5 = 14;
    }
    v30[0] = v5;
    double v28 = 0.0;
    double v29 = 0.0;
    double v27 = 1.0;
    v6 = [(BKDisplayRenderOverlay *)self display];
    v7 = [v6 uniqueId];
    sub_100011044(v7, &v29, &v28, &v27, 0, 0);

    double v8 = v29 / v27;
    double v9 = v28 / v27;
    [v4 position];
    double v11 = v10;
    double v13 = v12;
    if (BSFloatEqualToFloat())
    {
      unsigned int v14 = -1;
    }
    else
    {
      double v16 = fmax(v11 / v8, 0.0);
      if (v16 >= 1.0) {
        double v17 = 4294967300.0;
      }
      else {
        double v17 = v16 * 4294967300.0;
      }
      unsigned int v14 = fmin(fmax(v17, 0.0), 4294967300.0);
    }
    v30[1] = v14;
    if (BSFloatEqualToFloat())
    {
      unsigned int v18 = -1;
    }
    else
    {
      double v19 = fmax(v13 / v9, 0.0);
      if (v19 >= 1.0) {
        double v20 = 4294967300.0;
      }
      else {
        double v20 = v19 * 4294967300.0;
      }
      unsigned int v18 = fmin(fmax(v20, 0.0), 4294967300.0);
    }
    LODWORD(v31) = v18;
    v21 = sub_10005FD84();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      unsigned int v22 = [v4 style];
      *(_DWORD *)buf = 67109632;
      unsigned int v35 = v22;
      __int16 v36 = 1024;
      unsigned int v37 = v14;
      __int16 v38 = 1024;
      unsigned int v39 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Setting progress indicator (style = %d) for overlay at position (%u, %u).", buf, 0x14u);
    }

    int v23 = sysctlbyname("kern.progressoptions", 0, 0, v30, 0x2CuLL);
    BOOL v15 = v23 >= 0;
    v24 = sub_10005FD84();
    v25 = v24;
    if (v23 < 0)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v35 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to apply kernel progress indicator - error %d.", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully applied kernel progress indicator.", buf, 2u);
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_animationForKeyPath:(id)a3 withSettings:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 isSpringAnimation];
  v7 = [(id)objc_opt_class() animationWithKeyPath:v6];

  [v5 applyToCAAnimation:v7];

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKDisplayRenderOverlayImage;
  v4 = [(BKDisplayRenderOverlay *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  context = self->_context;
  if (context)
  {
    id v6 = +[NSString stringWithFormat:@"%x (%u)", [(CAContext *)context contextId], [(CAContext *)self->_context contextId]];
    id v7 = [v4 appendObject:v6 withName:@"contextID"];
  }

  return v4;
}

- (void)_cleanup
{
  +[CATransaction begin];
  v3 = [(CAContext *)self->_context layer];
  [v3 removeAllAnimations];

  [(CAContext *)self->_context setLayer:0];
  [(CAContext *)self->_context invalidate];
  context = self->_context;
  self->_context = 0;

  +[CATransaction commit];
}

- (id)_persistenceData
{
  v5.receiver = self;
  v5.super_class = (Class)BKDisplayRenderOverlayImage;
  v3 = [(BKDisplayRenderOverlay *)&v5 _persistenceData];
  [v3 setImage:self->_imageRef];
  [v3 setFrozen:self->_frozen];

  return v3;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (v4)
  {
    objc_super v5 = [(BKDisplayRenderOverlayImage *)self _animationForKeyPath:@"opacity" withSettings:v4];
    [v5 setFromValue:&off_1001037A8];
    [v5 setToValue:&off_100103798];
    [v5 setDelegate:self];
    id v6 = [(CAContext *)self->_context layer];
    [v6 setOpacity:0.0];

    id v7 = [(CAContext *)self->_context layer];
    [v7 addAnimation:v5 forKey:@"opacity"];
  }
  else
  {
    [(BKDisplayRenderOverlayImage *)self _cleanup];
  }
  imageRef = self->_imageRef;
  if (imageRef)
  {
    CGImageRelease(imageRef);
    self->_imageRef = 0;
  }
  objc_super v9 = [(BKDisplayRenderOverlay *)self _persistenceCoordinator];
  [v9 destroyOverlay:self];
}

- (void)_freeze
{
  if (!self->_frozen)
  {
    self->_frozen = 1;
    v3 = [(BKDisplayRenderOverlay *)self _persistenceCoordinator];
    [v3 saveOverlay:self];

    [(BKDisplayRenderOverlayImage *)self _applyProgressIndicatorPropertiesToKernelIfNecessary];
  }
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  if (self->_context)
  {
    v56 = +[NSString stringWithFormat:@"Already have a context"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v57 = NSStringFromSelector(a2);
      v58 = (objc_class *)objc_opt_class();
      v59 = NSStringFromClass(v58);
      LODWORD(v78.a) = 138544642;
      *(void *)((char *)&v78.a + 4) = v57;
      WORD2(v78.b) = 2114;
      *(void *)((char *)&v78.b + 6) = v59;
      HIWORD(v78.c) = 2048;
      *(void *)&v78.d = self;
      LOWORD(v78.tx) = 2114;
      *(void *)((char *)&v78.tx + 2) = @"BKDisplayRenderOverlayImage.m";
      WORD1(v78.ty) = 1024;
      HIDWORD(v78.ty) = 78;
      __int16 v79 = 2114;
      v80 = v56;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v78, 0x3Au);
    }
    [v56 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10003B56CLL);
  }
  id v6 = v5;
  double v71 = 0.0;
  double v72 = 0.0;
  uint64_t v70 = 0x3FF0000000000000;
  char v69 = 0;
  id v7 = [(BKDisplayRenderOverlay *)self descriptor];
  double v8 = [v7 displayUUID];

  sub_100011044(v8, &v72, &v71, (double *)&v70, &v69, 0);
  objc_super v9 = [(BKDisplayRenderOverlay *)self descriptor];
  id v10 = [v9 display];

  if (!v10)
  {
    double v12 = BKLogDisplay();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v78.a) = 138543362;
      *(void *)((char *)&v78.a + 4) = v8;
      v53 = "[BKDisplayRenderOverlay] No CADisplay found for UUID: %{public}@";
      v54 = v12;
      uint32_t v55 = 12;
      goto LABEL_34;
    }
LABEL_16:
    BOOL v25 = 0;
    goto LABEL_17;
  }
  if (!self->_imageRef)
  {
    v67 = v8;
    v68 = v10;
    id v27 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v60 = (objc_class *)[v27 classForCoder];
      if (!v60) {
        v60 = (objc_class *)objc_opt_class();
      }
      v61 = NSStringFromClass(v60);
      v62 = (objc_class *)objc_opt_class();
      v63 = NSStringFromClass(v62);
      v64 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v61, v63];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v65 = +[NSString stringWithUTF8String:"CGImageRef BKDisplayCaptureImage(CADisplay *__strong)"];
        LODWORD(v78.a) = 138544130;
        *(void *)((char *)&v78.a + 4) = v65;
        WORD2(v78.b) = 2114;
        *(void *)((char *)&v78.b + 6) = @"BKDisplay.m";
        HIWORD(v78.c) = 1024;
        LODWORD(v78.d) = 888;
        WORD2(v78.d) = 2114;
        *(void *)((char *)&v78.d + 6) = v64;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v78, 0x26u);
      }
      [v64 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10003B688);
    }

    +[CATransaction flush];
    +[CATransaction synchronize];
    double v77 = 0.0;
    CGFloat sx = 1.0;
    double v76 = 0.0;
    char v74 = 0;
    double v28 = [v27 uniqueId];
    sub_100011044(v28, &v77, &v76, &sx, &v74, 0);

    v66 = v27;
    [v27 name];
    memset(&v78, 0, sizeof(v78));
    CGAffineTransformMakeScale(&v78, sx, sx);
    BSDegreesToRadians();
    CGAffineTransform v73 = v78;
    CGAffineTransformRotate(&v81, &v73, v29);
    CGAffineTransform v78 = v81;
    v82.size.unint64_t width = v77 / sx;
    v82.size.double height = v76 / sx;
    v82.origin.x = 0.0;
    v82.origin.y = 0.0;
    CGRect v83 = CGRectApplyAffineTransform(v82, &v81);
    double height = v83.size.height;
    unint64_t width = (unint64_t)v83.size.width;
    uint64_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
    int v33 = +[NSNumber numberWithUnsignedLong:width];
    v34 = +[NSNumber numberWithUnsignedLong:(unint64_t)height];
    unsigned int v35 = +[NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
    __int16 v36 = +[NSNumber numberWithUnsignedLong:AlignedBytesPerRow * (unint64_t)height];
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v33, kIOSurfaceWidth, v34, kIOSurfaceHeight, v35, kIOSurfaceBytesPerRow, v36, kIOSurfaceAllocSize, &off_1001034C0, kIOSurfaceBytesPerElement, &off_1001034D8, kIOSurfacePixelFormat, 0);
    CFDictionaryRef v37 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    __int16 v38 = IOSurfaceCreate(v37);
    if (v38)
    {
      unsigned int v39 = v38;
      IOSurfaceLock(v38, 0, 0);
      CARenderServerRenderDisplay();
      IOSurfaceUnlock(v39, 0, 0);
      IOSurfaceLock(v39, 0, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v39);
      size_t BytesPerRow = IOSurfaceGetBytesPerRow(v39);
      size_t v42 = IOSurfaceGetWidth(v39);
      size_t v43 = IOSurfaceGetHeight(v39);
      size_t AllocSize = IOSurfaceGetAllocSize(v39);
      v45 = CGDataProviderCreateWithData(v39, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_10003A320);
      CFRetain(v39);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v47 = CGImageCreate(v42, v43, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2006u, v45, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v45);
      CGColorSpaceRelease(DeviceRGB);
      double v8 = v67;
      if (v47)
      {
        CFRelease(v39);

        self->_imageRef = v47;
        id v10 = v68;
        goto LABEL_4;
      }
      CFDictionaryRef v50 = v37;
      v51 = BKLogCommon();
      id v10 = v68;
      v49 = v66;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v81.a) = 136315138;
        *(void *)((char *)&v81.a + 4) = "BKDisplayCaptureImage";
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%s Unable to create CGImageRef from IOSurface!", (uint8_t *)&v81, 0xCu);
      }

      CFRelease(v39);
    }
    else
    {
      v48 = BKLogCommon();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v81.a) = 136315394;
        *(void *)((char *)&v81.a + 4) = "BKDisplayCaptureImage";
        WORD2(v81.b) = 2114;
        *(void *)((char *)&v81.b + 6) = v37;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s Unable to create IOSurface with properties: %{public}@", (uint8_t *)&v81, 0x16u);
      }

      double v8 = v67;
      id v10 = v68;
      v49 = v66;
    }

    self->_imageRef = 0;
    v52 = BKLogDisplay();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v78.a) = 138543362;
      *(void *)((char *)&v78.a + 4) = v49;
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "[BKDisplayRenderOverlay] Unable to capture display image for display! %{public}@", (uint8_t *)&v78, 0xCu);
    }

    if (self->_imageRef) {
      goto LABEL_4;
    }
    double v12 = sub_10005FD84();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v78.a) = 0;
      v53 = "No image";
      v54 = v12;
      uint32_t v55 = 2;
LABEL_34:
      _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, v53, (uint8_t *)&v78, v55);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_4:
  +[CATransaction activate];
  double v11 = +[CALayer layer];
  double v12 = v11;
  int v13 = v69 & 0xFD;
  if (v13 == 1) {
    double v14 = v71;
  }
  else {
    double v14 = v72;
  }
  if (v13 == 1) {
    double v15 = v72;
  }
  else {
    double v15 = v71;
  }
  -[NSObject setFrame:](v11, "setFrame:", 0.0, 0.0, v14, v15);
  [v12 setContents:self->_imageRef];
  double v16 = [(BKDisplayRenderOverlay *)self name];
  double v17 = +[NSString stringWithFormat:@"BKDisplayRenderOverlayImage:%@", v16];
  [v12 setName:v17];

  [v12 setHidden:0];
  unsigned int v18 = +[BSColor blackColor];
  -[NSObject setBackgroundColor:](v12, "setBackgroundColor:", [v18 CGColor]);

  double v19 = +[NSMutableDictionary dictionary];
  [v19 setObject:kCFBooleanTrue forKey:kCAContextDisableGroupOpacity];
  [v19 setObject:kCFBooleanTrue forKey:kCAContextIgnoresHitTest];
  [v19 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v19 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  double v20 = [v10 name];
  if (v20) {
    [v19 setObject:v20 forKey:kCAContextDisplayName];
  }
  v21 = +[CAContext remoteContextWithOptions:v19];
  context = self->_context;
  self->_context = v21;

  int v23 = self->_context;
  [(BKDisplayRenderOverlay *)self level];
  -[CAContext setLevel:](v23, "setLevel:");
  [(CAContext *)self->_context setLayer:v12];
  if (v6)
  {
    v24 = [(BKDisplayRenderOverlayImage *)self _animationForKeyPath:@"opacity" withSettings:v6];
    [v24 setFromValue:&off_100103798];
    [v24 setToValue:&off_1001037A8];
    [v12 addAnimation:v24 forKey:@"opacity"];
  }
  BOOL v25 = 1;
LABEL_17:

  return v25;
}

- (BOOL)disablesDisplayUpdates
{
  if (self->_frozen) {
    return 1;
  }
  v3 = [(BKDisplayRenderOverlay *)self progressIndicatorProperties];
  BOOL v2 = v3 != 0;

  return v2;
}

- (CGImage)image
{
  return self->_imageRef;
}

- (void)dealloc
{
  if (self->_context)
  {
    id v4 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_context == nil"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      double v12 = v7;
      __int16 v13 = 2048;
      double v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKDisplayRenderOverlayImage.m";
      __int16 v17 = 1024;
      int v18 = 59;
      __int16 v19 = 2114;
      double v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10003B878);
  }
  CGImageRelease(self->_imageRef);
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayRenderOverlayImage;
  [(BKDisplayRenderOverlay *)&v8 dealloc];
}

- (id)_initWithPersistenceData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)BKDisplayRenderOverlayImage;
    id v5 = [(BKDisplayRenderOverlay *)&v9 _initWithPersistenceData:v4];
    if (v5)
    {
      id v6 = (CGImage *)[v4 image];
      if (v6)
      {
        v5[7] = CGImageRetain(v6);
        *((unsigned char *)v5 + 64) = [v4 isFrozen];
      }
    }
    self = v5;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BKDisplayRenderOverlayImage)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlayImage;
  id v4 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  id v5 = v4;
  if (v4) {
    [(BKDisplayRenderOverlay *)v4 _setType:1];
  }
  return v5;
}

@end