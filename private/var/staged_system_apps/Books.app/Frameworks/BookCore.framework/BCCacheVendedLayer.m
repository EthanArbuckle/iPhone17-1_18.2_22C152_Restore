@interface BCCacheVendedLayer
- (BCCacheVendedLayer)initWithDebugLayout:(BOOL)a3;
- (BCCacheVendedLayerDelegate)vendedLayerDelegate;
- (BICDescribedImage)describedImageRequested;
- (BICDescribedImage)describedImageShown;
- (BOOL)needsNewVersion;
- (CALayer)imageLayer;
- (CAShapeLayer)stackLayer;
- (CATextLayer)descriptionLayer;
- (NSSet)stackIDs;
- (void)_setDescribedImage:(id)a3;
- (void)dealloc;
- (void)setDescribedImage:(id)a3;
- (void)setDescribedImageRequested:(id)a3;
- (void)setDescribedImageShown:(id)a3;
- (void)setDescriptionLayer:(id)a3;
- (void)setImageLayer:(id)a3;
- (void)setNeedsNewVersion:(BOOL)a3;
- (void)setStackIDs:(id)a3;
- (void)setStackLayer:(id)a3;
- (void)setVendedLayerDelegate:(id)a3;
@end

@implementation BCCacheVendedLayer

- (BCCacheVendedLayer)initWithDebugLayout:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BCCacheVendedLayer;
  v4 = [(BCCacheVendedLayer *)&v16 init];
  if (v4)
  {
    v5 = +[CALayer layer];
    [(BCCacheVendedLayer *)v4 addSublayer:v5];
    v4->_imageLayer = v5;
    double y = CGPointZero.y;
    -[CALayer setAnchorPoint:](v5, "setAnchorPoint:", CGPointZero.x, y);
    [(BCCacheVendedLayer *)v4 setMasksToBounds:0];
    if (v3)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v20[0] = xmmword_2A2BD0;
      v20[1] = unk_2A2BE0;
      v19[0] = xmmword_2A2BF0;
      v19[1] = unk_2A2C00;
      *(_OWORD *)components = xmmword_2A2C10;
      long long v18 = unk_2A2C20;
      [(BCCacheVendedLayer *)v4 setBorderWidth:0.5];
      sub_17B110(v4, DeviceRGB, (const CGFloat *)v19);
      [(CALayer *)v4->_imageLayer setBorderWidth:0.5];
      sub_17B110(v4->_imageLayer, DeviceRGB, (const CGFloat *)v20);
      v8 = +[CAShapeLayer layer];
      -[CAShapeLayer setAnchorPoint:](v8, "setAnchorPoint:", CGPointZero.x, y);
      [(CALayer *)v4->_imageLayer addSublayer:v8];
      v4->_stackLayer = v8;
      [(CAShapeLayer *)v8 setFillColor:0];
      [(CAShapeLayer *)v4->_stackLayer setLineWidth:0.5];
      v9 = v4->_stackLayer;
      v10 = CGColorCreate(DeviceRGB, components);
      [(CAShapeLayer *)v9 setStrokeColor:v10];

      CGColorRelease(v10);
      [(CAShapeLayer *)v4->_stackLayer setZPosition:100.0];
      v11 = +[CATextLayer layer];
      -[CATextLayer setAnchorPoint:](v11, "setAnchorPoint:", 0.0, 0.0);
      [(CATextLayer *)v11 setFontSize:12.0];
      id v12 = +[UIColor redColor];
      -[CATextLayer setForegroundColor:](v11, "setForegroundColor:", [v12 CGColor]);

      -[CATextLayer setBounds:](v11, "setBounds:", 0.0, 0.0, 250.0, 20.0);
      [(CALayer *)v4->_imageLayer addSublayer:v11];
      descriptionLayer = v4->_descriptionLayer;
      v4->_descriptionLayer = v11;
      v14 = v11;

      [(CATextLayer *)v4->_descriptionLayer setZPosition:200.0];
      CFRelease(DeviceRGB);
    }
  }
  return v4;
}

- (void)dealloc
{
  [(BICDescribedImage *)self->_describedImageRequested setPriority:1];
  +[BICCacheStats logOperation:BICCacheStatsOperationCancelled[0] forRequest:self->_describedImageRequested];
  BOOL v3 = BCImageCacheLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    describedImageRequested = self->_describedImageRequested;
    *(_DWORD *)buf = 138412290;
    v7 = describedImageRequested;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "BCCacheVendedLayer: Lowering priority of %@", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)BCCacheVendedLayer;
  [(BCCacheVendedLayer *)&v5 dealloc];
}

- (void)setDescribedImage:(id)a3
{
  id v4 = a3;
  [(BCCacheVendedLayer *)self setDescribedImageShown:v4];
  if (+[NSThread isMainThread])
  {
    [(BCCacheVendedLayer *)self _setDescribedImage:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = [v4 copy];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17B394;
    block[3] = &unk_2C4070;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    id v6 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_setDescribedImage:(id)a3
{
  id v27 = a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v4 = [v27 image];
  id v5 = (CGImage *)[v4 CGImage];

  id v6 = [(BCCacheVendedLayer *)self imageLayer];
  [v6 setContents:v5];

  double v7 = mainScreenScaleFactor();
  double v8 = (double)CGImageGetWidth(v5) / v7;
  double v9 = (double)CGImageGetHeight(v5) / v7;
  [v27 nonShadowArea];
  v30.origin.x = CGRectZero.origin.x;
  v30.origin.double y = CGRectZero.origin.y;
  v30.size.width = CGRectZero.size.width;
  v30.size.height = CGRectZero.size.height;
  double v10 = 0.0;
  double v11 = v9;
  double v12 = v8;
  double v13 = 0.0;
  if (!CGRectEqualToRect(v29, v30))
  {
    [v27 nonShadowArea];
    double v13 = v14;
    double v10 = v15;
    double v12 = v16;
    double v11 = v17;
  }
  long long v18 = [(BCCacheVendedLayer *)self imageLayer];
  [v18 setBounds:0.0, 0.0, v8, v9];

  v19 = [(BCCacheVendedLayer *)self imageLayer];
  [v19 setPosition:-v13, -v10];

  -[BCCacheVendedLayer setBounds:](self, "setBounds:", CGPointZero.x, CGPointZero.y, v12, v11);
  v20 = [(BCCacheVendedLayer *)self stackLayer];

  if (v20)
  {
    id v21 = [v27 stackOutline];
    v22 = [(BCCacheVendedLayer *)self stackLayer];
    [v22 setPath:v21];
  }
  v23 = [(BCCacheVendedLayer *)self descriptionLayer];

  if (v23)
  {
    v24 = [v27 identifier];
    v25 = [(BCCacheVendedLayer *)self descriptionLayer];
    [v25 setString:v24];
  }
  +[CATransaction commit];
  v26 = [(BCCacheVendedLayer *)self vendedLayerDelegate];
  [v26 vendedLayerDidUpdate:self];
}

- (BOOL)needsNewVersion
{
  return self->needsNewVersion;
}

- (void)setNeedsNewVersion:(BOOL)a3
{
  self->needsNewVersion = a3;
}

- (BCCacheVendedLayerDelegate)vendedLayerDelegate
{
  return self->_vendedLayerDelegate;
}

- (void)setVendedLayerDelegate:(id)a3
{
  self->_vendedLayerDelegate = (BCCacheVendedLayerDelegate *)a3;
}

- (BICDescribedImage)describedImageRequested
{
  return self->_describedImageRequested;
}

- (void)setDescribedImageRequested:(id)a3
{
}

- (BICDescribedImage)describedImageShown
{
  return (BICDescribedImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDescribedImageShown:(id)a3
{
}

- (NSSet)stackIDs
{
  return self->_stackIDs;
}

- (void)setStackIDs:(id)a3
{
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  self->_imageLayer = (CALayer *)a3;
}

- (CAShapeLayer)stackLayer
{
  return self->_stackLayer;
}

- (void)setStackLayer:(id)a3
{
  self->_stackLayer = (CAShapeLayer *)a3;
}

- (CATextLayer)descriptionLayer
{
  return self->_descriptionLayer;
}

- (void)setDescriptionLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLayer, 0);
  objc_storeStrong((id *)&self->_stackIDs, 0);
  objc_storeStrong((id *)&self->_describedImageShown, 0);

  objc_storeStrong((id *)&self->_describedImageRequested, 0);
}

@end