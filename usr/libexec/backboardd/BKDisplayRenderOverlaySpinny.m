@interface BKDisplayRenderOverlaySpinny
+ (id)overlayWithLevel:(float)a3 display:(id)a4;
- (BKDisplayRenderOverlaySpinny)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BOOL)_useLightBackground;
- (id)_assetPrefix;
- (id)_prepareContentLayerForPresentation:(id)a3;
- (id)_spinnyImageSequence;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)background;
- (void)_cleanUpContentLayer;
- (void)_setScale:(double)a3;
- (void)_startAnimating;
- (void)_unloadSpinnyImageSequence;
- (void)setBackground:(unint64_t)a3;
@end

@implementation BKDisplayRenderOverlaySpinny

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animation, 0);

  objc_storeStrong((id *)&self->_imageSequence, 0);
}

- (void)setBackground:(unint64_t)a3
{
  self->_background = a3;
}

- (unint64_t)background
{
  return self->_background;
}

- (id)_assetPrefix
{
  return @"gear";
}

- (BOOL)_useLightBackground
{
  unint64_t background = self->_background;
  if (!background)
  {
    v5.receiver = self;
    v5.super_class = (Class)BKDisplayRenderOverlaySpinny;
    if ([(BKDisplayBootUIRenderOverlay *)&v5 _useLightBackground]) {
      return 1;
    }
    unint64_t background = self->_background;
  }
  return background == 2;
}

- (void)_unloadSpinnyImageSequence
{
  v3 = sub_10005F9DC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%p unload spinny", (uint8_t *)&v5, 0xCu);
  }

  imageSequence = self->_imageSequence;
  self->_imageSequence = 0;
}

- (id)_spinnyImageSequence
{
  imageSequence = self->_imageSequence;
  if (!imageSequence)
  {
    v4 = sub_10005F9DC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134217984;
      v12 = self;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%p load spinny", (uint8_t *)&v11, 0xCu);
    }

    int v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = [(BKDisplayRenderOverlaySpinny *)self _assetPrefix];
    v7 = [BKImageSequence alloc];
    [(BKDisplayRenderOverlay *)self _scale];
    v8 = -[BKImageSequence initWithBasename:bundle:imageCount:scale:](v7, "initWithBasename:bundle:imageCount:scale:", v6, v5, 24);
    v9 = self->_imageSequence;
    self->_imageSequence = v8;

    imageSequence = self->_imageSequence;
  }

  return imageSequence;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlaySpinny;
  v4 = [(BKDisplayBootUIRenderOverlay *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = [v4 appendUnsignedInteger:self->_background withName:@"_background"];

  return v4;
}

- (void)_setScale:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlaySpinny;
  [(BKDisplayRenderOverlay *)&v7 _setScale:a3];
  [(BKDisplayRenderOverlaySpinny *)self _unloadSpinnyImageSequence];
  animation = self->_animation;
  if (animation)
  {
    id v5 = [(BKDisplayRenderOverlaySpinny *)self _spinnyImageSequence];
    v6 = [v5 allImages];
    [(CAKeyframeAnimation *)animation setValues:v6];
  }
}

- (void)_cleanUpContentLayer
{
  v3 = [(BKDisplayBootUIRenderOverlay *)self contentLayer];
  [v3 removeAllAnimations];

  [(BKDisplayRenderOverlaySpinny *)self _unloadSpinnyImageSequence];
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  v4 = [(BKDisplayRenderOverlay *)self display];
  id v5 = [v4 uniqueId];

  sub_1000399F0(v5);
  v6 = [(BKDisplayRenderOverlaySpinny *)self _spinnyImageSequence];
  objc_super v7 = (CGImage *)[v6 imageAtIndex:0];

  v8 = +[CALayer layer];
  [(BKDisplayBootUIRenderOverlay *)self _bounds];
  double v10 = v9 * 0.5;
  double v12 = v11 * 0.5;
  double Width = (double)CGImageGetWidth(v7);
  [v8 setBounds:0.0, 0.0, Width, (double)CGImageGetHeight(v7)];
  [v8 setPosition:v10, v12];
  [v8 setContents:v7];

  return v8;
}

- (void)_startAnimating
{
  v3 = (CAKeyframeAnimation *)objc_alloc_init((Class)CAKeyframeAnimation);
  [(CAKeyframeAnimation *)v3 setKeyPath:@"contents"];
  v4 = [(BKDisplayRenderOverlaySpinny *)self _spinnyImageSequence];
  id v5 = [v4 allImages];
  [(CAKeyframeAnimation *)v3 setValues:v5];

  [(CAKeyframeAnimation *)v3 setCalculationMode:kCAAnimationDiscrete];
  [(CAKeyframeAnimation *)v3 setRepeatCount:3.53369517e72];
  [(CAKeyframeAnimation *)v3 setDuration:1.0];
  v6 = [(BKDisplayBootUIRenderOverlay *)self contentLayer];
  [v6 addAnimation:v3 forKey:@"contents"];

  animation = self->_animation;
  self->_animation = v3;
}

- (BKDisplayRenderOverlaySpinny)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlaySpinny;
  v4 = -[BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  id v5 = v4;
  if (v4)
  {
    [(BKDisplayRenderOverlay *)v4 _setType:2];
    v5->_unint64_t background = 0;
  }
  return v5;
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  objc_super v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [v6 initWithName:v8 display:v5];

  [v9 setLockBacklight:0];
  double v10 = [BKDisplayRenderOverlaySpinny alloc];
  *(float *)&double v11 = a3;
  double v12 = [(BKDisplayRenderOverlaySpinny *)v10 initWithOverlayDescriptor:v9 level:v11];

  return v12;
}

@end