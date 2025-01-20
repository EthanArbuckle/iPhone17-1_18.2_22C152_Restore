@interface BKDisplayRenderOverlayPinkForTesting
+ (id)overlayWithLevel:(float)a3 display:(id)a4;
+ (void)doItHide;
+ (void)doItShow;
+ (void)doItShowKernel;
- (BKDisplayRenderOverlayPinkForTesting)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)disablesDisplayUpdates;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_dismissWithAnimationSettings:(id)a3;
- (void)dealloc;
@end

@implementation BKDisplayRenderOverlayPinkForTesting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)_applyProgressIndicatorPropertiesToKernelIfNecessary
{
  v3 = [(BKDisplayRenderOverlay *)self descriptor];
  v4 = [v3 progressIndicatorProperties];

  if (v4)
  {
    int v36 = 0;
    long long v35 = 0u;
    long long v34 = 0u;
    if ([v4 style] == (id)2) {
      int v5 = 22;
    }
    else {
      int v5 = 14;
    }
    v33[0] = v5;
    double v31 = 0.0;
    double v32 = 0.0;
    double v30 = 1.0;
    v6 = [(BKDisplayRenderOverlay *)self display];
    v7 = [v6 uniqueId];
    sub_100011044(v7, &v32, &v31, &v30, 0, 0);

    double v8 = v32 / v30;
    double v9 = v31 / v30;
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
    v33[1] = v14;
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
    LODWORD(v34) = v18;
    v21 = sub_10005FD84();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v29 = [v4 style];
      *(_DWORD *)buf = 67109632;
      unsigned int v38 = v29;
      __int16 v39 = 1024;
      unsigned int v40 = v14;
      __int16 v41 = 1024;
      unsigned int v42 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Setting progress indicator (style = %d) for overlay at position (%u, %u).", buf, 0x14u);
    }

    int v22 = sysctlbyname("kern.progressoptions", 0, 0, v33, 0x2CuLL);
    BOOL v15 = v22 >= 0;
    v23 = sub_10005FD84();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
    if (v22 < 0)
    {
      if (v24)
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v38 = v22;
        v25 = "Unable to apply kernel progress indicator - error %d.";
        v26 = v23;
        uint32_t v27 = 8;
        goto LABEL_27;
      }
    }
    else if (v24)
    {
      *(_WORD *)buf = 0;
      v25 = "Successfully applied kernel progress indicator.";
      v26 = v23;
      uint32_t v27 = 2;
LABEL_27:
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
    }

    goto LABEL_25;
  }
  BOOL v15 = 0;
LABEL_25:

  return v15;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKDisplayRenderOverlayPinkForTesting;
  v4 = [(BKDisplayRenderOverlay *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  context = self->_context;
  if (context)
  {
    v6 = +[NSString stringWithFormat:@"%x (%u)", [(CAContext *)context contextId], [(CAContext *)self->_context contextId]];
    id v7 = [v4 appendObject:v6 withName:@"contextID"];
  }

  return v4;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  [(CAContext *)self->_context setLayer:0];
  [(CAContext *)self->_context invalidate];
  context = self->_context;
  self->_context = 0;

  layer = self->_layer;
  self->_layer = 0;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  if (self->_context)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"BKDisplayRenderOverlayPinkForTesting.m" lineNumber:57 description:@"Already have a _context"];
  }
  v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v6 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  double v30 = 1.0;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10001143C;
  v31[3] = &unk_1000F6620;
  v31[4] = 0;
  v31[5] = 0;
  v31[6] = &v30;
  memset(&v31[7], 0, 24);
  sub_1000112C0(v31);
  id v7 = +[CAContext remoteContextWithOptions:v6];
  context = self->_context;
  self->_context = v7;

  objc_super v9 = self->_context;
  if (!v9)
  {
    unsigned int v29 = +[NSAssertionHandler currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"BKDisplayRenderOverlayPinkForTesting.m" lineNumber:67 description:@"Couldn't create remote context"];

    objc_super v9 = self->_context;
  }
  [(BKDisplayRenderOverlay *)self level];
  -[CAContext setLevel:](v9, "setLevel:");
  double v10 = +[CALayer layer];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    double v12 = DeviceRGB;
    CGColorRef v13 = CGColorCreate(DeviceRGB, dbl_100121FE8);
    if (v13)
    {
      CGColorRef v14 = v13;
      [(CALayer *)v10 setBackgroundColor:v13];
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  BOOL v15 = [(BKDisplayRenderOverlay *)self descriptor];
  double v16 = [v15 display];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  -[CALayer setBounds:](v10, "setBounds:", v18, v20, v22, v24);
  [(CALayer *)v10 setContentsScale:v30];
  [(CALayer *)v10 setHidden:0];
  -[CALayer setPosition:](v10, "setPosition:", v22 * 0.5, v24 * 0.5);
  layer = self->_layer;
  self->_layer = v10;
  v26 = v10;

  [(CAContext *)self->_context setLayer:self->_layer];
  return 1;
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (void)dealloc
{
  [(CAContext *)self->_context invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKDisplayRenderOverlayPinkForTesting;
  [(BKDisplayRenderOverlay *)&v3 dealloc];
}

- (BKDisplayRenderOverlayPinkForTesting)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlayPinkForTesting;
  v4 = -[BKDisplayRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  id v5 = v4;
  if (v4) {
    [(BKDisplayRenderOverlay *)v4 _setType:4];
  }
  return v5;
}

+ (void)doItHide
{
  if (qword_100123088)
  {
    [(id)qword_100123088 dismissWithAnimationSettings:0];
    v2 = (void *)qword_100123088;
    qword_100123088 = 0;
  }
}

+ (void)doItShow
{
  +[BKDisplayRenderOverlayPinkForTesting doItHide];
  id v2 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  objc_super v3 = +[CADisplay mainDisplay];
  id v8 = [v2 initWithName:@"Testing" display:v3];

  v4 = [BKDisplayRenderOverlayPinkForTesting alloc];
  LODWORD(v5) = 1161527296;
  v6 = [(BKDisplayRenderOverlayPinkForTesting *)v4 initWithOverlayDescriptor:v8 level:v5];
  objc_super v7 = (void *)qword_100123088;
  qword_100123088 = (uint64_t)v6;

  [(id)qword_100123088 presentWithAnimationSettings:0];
}

+ (void)doItShowKernel
{
  +[BKDisplayRenderOverlayPinkForTesting doItHide];
  id v2 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  objc_super v3 = +[CADisplay mainDisplay];
  id v9 = [v2 initWithName:@"Testing" display:v3];

  v4 = +[BKSDisplayProgressIndicatorProperties progressIndicatorWithStyle:position:](BKSDisplayProgressIndicatorProperties, "progressIndicatorWithStyle:position:", 2, 100.0, 175.0);
  [v9 setProgressIndicatorProperties:v4];
  double v5 = [BKDisplayRenderOverlayPinkForTesting alloc];
  LODWORD(v6) = 1176255488;
  objc_super v7 = [(BKDisplayRenderOverlayPinkForTesting *)v5 initWithOverlayDescriptor:v9 level:v6];
  id v8 = (void *)qword_100123088;
  qword_100123088 = (uint64_t)v7;

  [(id)qword_100123088 presentWithAnimationSettings:0];
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  objc_super v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  id v9 = [v6 initWithName:v8 display:v5];

  [v9 setLockBacklight:0];
  double v10 = [BKDisplayRenderOverlayPinkForTesting alloc];
  *(float *)&double v11 = a3;
  double v12 = [(BKDisplayRenderOverlayPinkForTesting *)v10 initWithOverlayDescriptor:v9 level:v11];

  return v12;
}

@end