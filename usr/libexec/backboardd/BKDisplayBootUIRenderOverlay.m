@interface BKDisplayBootUIRenderOverlay
- (BKDisplayBootUIRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)_useLightBackground;
- (BOOL)disablesDisplayUpdates;
- (CALayer)contentLayer;
- (CGRect)_bounds;
- (id)_animationForBackgroundLayerCrossfading:(id)a3;
- (id)_animationForContentLayerCrossfading:(id)a3;
- (id)_prepareContentLayerForPresentation:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_cleanup;
- (void)_dismissWithAnimationSettings:(id)a3;
- (void)_setBounds:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation BKDisplayBootUIRenderOverlay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_backgroundLayer, 0);
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"bounds", a4, a5, a6))
  {
    [(BKDisplayBootUIRenderOverlay *)self _bounds];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    -[BKDisplayBootUIRenderOverlay _setBounds:](self, "_setBounds:");
    v11 = sub_10005F9DC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 134218496;
      v13 = self;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "-----------> %p: bounds of display changed: size.width: %f size.height: %f, updating overlay position", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKDisplayBootUIRenderOverlay;
  v4 = [(BKDisplayRenderOverlay *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  context = self->_context;
  if (context)
  {
    v6 = +[NSString stringWithFormat:@"%x (%u)", [(CAContext *)context contextId], [(CAContext *)self->_context contextId]];
    id v7 = [v4 appendObject:v6 withName:@"contextID"];
  }

  return v4;
}

- (id)_animationForBackgroundLayerCrossfading:(id)a3
{
  v3 = [(BKDisplayBootUIRenderOverlay *)self _animationForContentLayerCrossfading:a3];
  [v3 setBeginTimeMode:kCAAnimationRelative];
  [v3 duration];
  [v3 setBeginTime:];
  [v3 setFillMode:kCAFillModeBoth];

  return v3;
}

- (id)_animationForContentLayerCrossfading:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  [v4 duration];
  double v7 = v6;

  [v5 setDuration:v7 * 0.5];
  uint64_t v8 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
  [v5 applyToCAAnimation:v8];
  [v8 setFromValue:&off_100103778];
  [v8 setToValue:&off_100103788];
  [v8 setDelegate:self];

  return v8;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = a3;
  unint64_t outstandingAnimationsCount = self->_outstandingAnimationsCount;
  if (outstandingAnimationsCount)
  {
    unint64_t v7 = outstandingAnimationsCount - 1;
    self->_unint64_t outstandingAnimationsCount = v7;
    if (!v7)
    {
      id v8 = v5;
      [(BKDisplayBootUIRenderOverlay *)self _cleanup];
      id v5 = v8;
    }
  }
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  return self->_contentLayer;
}

- (void)_cleanup
{
  v3 = [(BKDisplayRenderOverlay *)self descriptor];
  id v4 = [v3 display];
  [v4 removeObserver:self forKeyPath:@"bounds"];

  [(BKDisplayBootUIRenderOverlay *)self _cleanUpContentLayer];
  [(CALayer *)self->_backgroundLayer removeAllAnimations];
  id v5 = sub_10005F9DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    context = self->_context;
    int v9 = 138412546;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    int v12 = context;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up %@ - Destroying context: %@", (uint8_t *)&v9, 0x16u);
  }

  [(CAContext *)self->_context setLayer:0];
  [(CAContext *)self->_context invalidate];
  unint64_t v7 = self->_context;
  self->_context = 0;

  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = 0;
}

- (void)_dismissWithAnimationSettings:(id)a3
{
  id v4 = a3;
  id v5 = sub_10005F9DC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134217984;
    v13 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%p dismiss", (uint8_t *)&v12, 0xCu);
  }

  if (v4)
  {
    double v6 = [(BKDisplayBootUIRenderOverlay *)self _animationForContentLayerCrossfading:v4];
    [(CALayer *)self->_contentLayer setOpacity:0.0];
    contentLayer = self->_contentLayer;
    id v8 = [v6 keyPath];
    [(CALayer *)contentLayer addAnimation:v6 forKey:v8];

    int v9 = [(BKDisplayBootUIRenderOverlay *)self _animationForBackgroundLayerCrossfading:v4];
    [(CALayer *)self->_backgroundLayer setOpacity:0.0];
    backgroundLayer = self->_backgroundLayer;
    __int16 v11 = [v9 keyPath];
    [(CALayer *)backgroundLayer addAnimation:v9 forKey:v11];

    self->_outstandingAnimationsCount += 2;
  }
  else
  {
    [(BKDisplayBootUIRenderOverlay *)self _cleanup];
  }
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  id v5 = a3;
  double v6 = sub_10005F9DC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v47 = 134217984;
    v48 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%p present", (uint8_t *)&v47, 0xCu);
  }

  if (self->_context)
  {
    v35 = +[NSString stringWithFormat:@"Already have a context"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue();
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      int v47 = 138544642;
      v48 = v36;
      __int16 v49 = 2114;
      v50 = v38;
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2114;
      CFStringRef v54 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v55 = 1024;
      int v56 = 89;
      __int16 v57 = 2114;
      v58 = v35;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v47, 0x3Au);
    }
    [v35 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100030214);
  }
  unint64_t v7 = [(BKDisplayRenderOverlay *)self descriptor];
  id v8 = [v7 display];
  [v8 addObserver:self forKeyPath:@"bounds" options:0 context:0];

  int v9 = [(BKDisplayBootUIRenderOverlay *)self _prepareContentLayerForPresentation:v5];
  contentLayer = self->_contentLayer;
  self->_contentLayer = v9;

  if (!self->_contentLayer)
  {
    v39 = +[NSString stringWithFormat:@"Content layer not set"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v40 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue();
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      int v47 = 138544642;
      v48 = v40;
      __int16 v49 = 2114;
      v50 = v42;
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2114;
      CFStringRef v54 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v55 = 1024;
      int v56 = 94;
      __int16 v57 = 2114;
      v58 = v39;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v47, 0x3Au);
    }
    [v39 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100030300);
  }
  __int16 v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v11 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  int v12 = +[CAContext remoteContextWithOptions:v11];
  context = self->_context;
  self->_context = v12;

  __int16 v14 = self->_context;
  if (!v14)
  {
    v43 = +[NSString stringWithFormat:@"Couldn't create remote context"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v44 = (BKDisplayBootUIRenderOverlay *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      int v47 = 138544642;
      v48 = v44;
      __int16 v49 = 2114;
      v50 = v46;
      __int16 v51 = 2048;
      v52 = self;
      __int16 v53 = 2114;
      CFStringRef v54 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v55 = 1024;
      int v56 = 101;
      __int16 v57 = 2114;
      v58 = v43;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v47, 0x3Au);
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000303ECLL);
  }
  [(BKDisplayRenderOverlay *)self level];
  -[CAContext setLevel:](v14, "setLevel:");
  [(BKDisplayBootUIRenderOverlay *)self _bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = v19 * 0.5;
  double v24 = v21 * 0.5;
  v25 = +[CALayer layer];
  [v25 setBounds:v16, v18, v20, v22];
  [v25 setPosition:v23, v24];
  [(CAContext *)self->_context setLayer:v25];
  v26 = +[CALayer layer];
  -[CALayer setBounds:](v26, "setBounds:", v16, v18, v20, v22);
  -[CALayer setPosition:](v26, "setPosition:", v23, v24);
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v28 = DeviceRGB;
    if ([(BKDisplayBootUIRenderOverlay *)self _useLightBackground]) {
      v29 = (const CGFloat *)&unk_100121450;
    }
    else {
      v29 = (const CGFloat *)&unk_100121470;
    }
    CGColorRef v30 = CGColorCreate(v28, v29);
    if (v30)
    {
      CGColorRef v31 = v30;
      [(CALayer *)v26 setBackgroundColor:v30];
      CFRelease(v31);
    }
    CFRelease(v28);
  }
  [v25 addSublayer:v26];
  backgroundLayer = self->_backgroundLayer;
  self->_backgroundLayer = v26;
  v33 = v26;

  [v25 addSublayer:self->_contentLayer];
  return 1;
}

- (BOOL)disablesDisplayUpdates
{
  return 0;
}

- (void)_setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = a3.size.width * 0.5;
  double v9 = a3.size.height * 0.5;
  uint64_t v10 = sub_10005F9DC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 134218240;
    double v14 = v8;
    __int16 v15 = 2048;
    double v16 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "midBounds:%g,%g", (uint8_t *)&v13, 0x16u);
  }

  __int16 v11 = [(CAContext *)self->_context layer];
  [v11 setBounds:x, y, width, height];

  int v12 = [(CAContext *)self->_context layer];
  [v12 setPosition:v8, v9];

  -[CALayer setBounds:](self->_backgroundLayer, "setBounds:", x, y, width, height);
  -[CALayer setPosition:](self->_backgroundLayer, "setPosition:", v8, v9);
  -[CALayer setPosition:](self->_contentLayer, "setPosition:", v8, v9);
}

- (CGRect)_bounds
{
  v2 = [(BKDisplayRenderOverlay *)self descriptor];
  v3 = [v2 display];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  int v12 = +[BSPlatform sharedInstance];
  LODWORD(v3) = [v12 deviceClass];

  if (v3 == 3 && (v9 < 1920.0 || v11 < 1080.0))
  {
    double v5 = 0.0;
    double v11 = 1080.0;
    double v9 = 1920.0;
    double v7 = 0.0;
  }
  double v13 = v5;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (BOOL)_useLightBackground
{
  return self->_lightBackground;
}

- (BKDisplayBootUIRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  id v7 = a3;
  if (!v7)
  {
    int v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    double v14 = +[NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"descriptor", v13];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v15 = NSStringFromSelector(a2);
      double v16 = (objc_class *)objc_opt_class();
      double v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      v28 = v15;
      __int16 v29 = 2114;
      CGColorRef v30 = v17;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      CFStringRef v34 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v35 = 1024;
      int v36 = 35;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10003086CLL);
  }
  double v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v18 = (objc_class *)[v8 classForCoder];
    if (!v18) {
      double v18 = (objc_class *)objc_opt_class();
    }
    double v19 = NSStringFromClass(v18);
    double v20 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v20);
    double v22 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"descriptor", v19, v21];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v23 = NSStringFromSelector(a2);
      double v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      v28 = v23;
      __int16 v29 = 2114;
      CGColorRef v30 = v25;
      __int16 v31 = 2048;
      v32 = self;
      __int16 v33 = 2114;
      CFStringRef v34 = @"BKDisplayBootUIRenderOverlay.m";
      __int16 v35 = 1024;
      int v36 = 35;
      __int16 v37 = 2114;
      v38 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000309A8);
  }

  v26.receiver = self;
  v26.super_class = (Class)BKDisplayBootUIRenderOverlay;
  *(float *)&double v9 = a4;
  double v10 = [(BKDisplayRenderOverlay *)&v26 initWithOverlayDescriptor:v8 level:v9];
  if (v10) {
    v10->_lightBackground = MGGetSInt32Answer() == 1;
  }

  return v10;
}

@end