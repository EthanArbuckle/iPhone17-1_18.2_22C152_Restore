@interface KPFMTLBuildRenderer
- (BOOL)addAnimationsAtLayerTime:(double)a3;
- (BOOL)shouldDrawFrameAtLayerTime:(double)a3;
- (CGRect)p_frameForTextures;
- (KNAnimatedBuild)animatedBuild;
- (KNAnimationPluginContext)pluginContext;
- (KPFMTLBuildRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 effect:(id)a6 session:(id)a7;
- (id)loadPluginIfNeeded;
- (void)animateAfterDelay:(double)a3;
- (void)dealloc;
- (void)displayMaskDidChange;
- (void)drawFrameAtLayerTime:(double)a3;
- (void)p_generateTextures;
- (void)p_initMetalLayerIfNeeded;
- (void)p_setupMetalContext;
- (void)prepareAnimations;
- (void)registerForBuildEndCallback:(SEL)a3 target:(id)a4;
- (void)removeAnimationsAndFinish:(BOOL)a3;
- (void)renderTextures;
- (void)replaceMetalLayerWithProxy;
- (void)setAnimatedBuild:(id)a3;
- (void)setupGraphicsLayerWithFrame:(CGRect)a3;
- (void)setupPluginContext;
- (void)stopAnimations;
- (void)teardown;
- (void)updateAnimationsForLayerTime:(double)a3;
@end

@implementation KPFMTLBuildRenderer

- (KPFMTLBuildRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 effect:(id)a6 session:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)KPFMTLBuildRenderer;
  v11 = [(KPFMTLBuildRenderer *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->mEffectClass = a3;
    v11->mDirection = a4;
    v11->mEffect = (KPFGingerEffect *)a6;
    v11->mSession = (KPFSession *)a7;
    v13 = [KNAnimationContext alloc];
    [(CALayer *)[(KPFSession *)v12->mSession showLayer] bounds];
    v12->mAnimationContext = -[KNAnimationContext initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:](v13, "initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:", [(KPFSession *)v12->mSession showLayer], 1, v14, v15, 1.0);
    v12->mTextures = 0;
    id v16 = objc_alloc((Class)TSDMetalLayer);
    [(CALayer *)[(KPFSession *)v12->mSession showLayer] bounds];
    v12->mMetalLayer = (TSDMetalLayer *)objc_msgSend(v16, "initWithFrame:isOpaque:isWideGamut:delegate:metalDevice:", objc_msgSend(objc_msgSend(a6, "baseLayer"), "isOpaque"), 0, v12, objc_msgSend(a7, "metalDevice"), v17, v18, v19, v20);
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KPFMTLBuildRenderer;
  [(KPFMTLBuildRenderer *)&v3 dealloc];
}

- (void)setupPluginContext
{
  mPluginContext = self->mPluginContext;
  if (!mPluginContext)
  {
    mPluginContext = objc_alloc_init(KNAnimationPluginContext);
    self->mPluginContext = mPluginContext;
  }
  [(KNAnimationPluginContext *)mPluginContext setRendererType:10];
  [(KNAnimatedBuild *)[(KPFMTLBuildRenderer *)self animatedBuild] duration];
  -[KNAnimationPluginContext setDuration:](mPluginContext, "setDuration:");
  [(KNAnimationPluginContext *)mPluginContext setDirection:self->mDirection];
  [(KNAnimationPluginContext *)mPluginContext setAnimatedBuild:[(KPFMTLBuildRenderer *)self animatedBuild]];
  mTextures = self->mTextures;

  [(KNAnimationPluginContext *)mPluginContext setTextures:mTextures];
}

- (void)p_setupMetalContext
{
  objc_opt_class();
  [(KPFMTLBuildRenderer *)self pluginContext];
  objc_super v3 = (void *)TSUCheckedDynamicCast();
  if (![v3 metalContext]) {
    [v3 setMetalContext:objc_opt_new()];
  }
  id v4 = [v3 metalContext];
  [v4 setDevice:[self->mMetalLayer device]];
  [v4 setPixelFormat:[self->mMetalLayer pixelFormat]];
  [(KPFMTLBuildRenderer *)self p_frameForTextures];
  [v3 setDrawableFrame:];
  [(TSDMetalLayer *)self->mMetalLayer frame];
  [v3 setAnimationFrame:];
  [(TSDMetalLayer *)self->mMetalLayer frame];
  [v4 setLayerSize:v5, v6];
  [v4 setCommandQueue:[self->mMetalLayer commandQueue]];
  mMetalLayer = self->mMetalLayer;

  [(TSDMetalLayer *)mMetalLayer setDelegate:self];
}

- (CGRect)p_frameForTextures
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  mTextures = self->mTextures;
  id v8 = [(NSArray *)mTextures countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(mTextures);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) frameOnCanvas];
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        [(TSDMetalLayer *)self->mMetalLayer frame];
        v32.origin.double x = v16;
        v32.origin.double y = v17;
        v29.origin.double x = x;
        v29.origin.double y = y;
        v29.size.double width = width;
        v29.size.double height = height;
        v32.size.double width = v13;
        v32.size.double height = v15;
        CGRect v30 = CGRectUnion(v29, v32);
        double x = v30.origin.x;
        double y = v30.origin.y;
        double width = v30.size.width;
        double height = v30.size.height;
      }
      id v9 = [(NSArray *)mTextures countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }
  id v18 = [(KPFMTLBuildRenderer *)self loadPluginIfNeeded];
  [(KPFMTLBuildRenderer *)self setupPluginContext];
  objc_opt_class();
  double v19 = (void *)TSUDynamicCast();
  [v19 setAnimatedBuild:self->mAnimatedBuild];
  [v18 frameOfEffectWithFrame:v19 context:x, y, width, height];
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)setupGraphicsLayerWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!self->mAnimatedBuild) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer setupGraphicsLayerWithFrame:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:119 description:@"invalid nil value for '%s'", "mAnimatedBuild"];
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (!self->mMetalLayer)
  {
    id v8 = [(KPFMTLBuildRenderer *)self loadPluginIfNeeded];
    [(KPFMTLBuildRenderer *)self setupPluginContext];
    objc_opt_class();
    id v9 = (void *)TSUDynamicCast();
    [v9 setAnimatedBuild:self->mAnimatedBuild];
    [v8 frameOfEffectWithFrame:v9 context:x, y, width, height];
    double v10 = v16.origin.x;
    double v11 = v16.origin.y;
    double v12 = v16.size.width;
    double v13 = v16.size.height;
    if (!CGRectIsEmpty(v16))
    {
      double v14 = [(KPFSession *)self->mSession sharedMetalLayer];
      self->mMetalLayer = v14;
      -[TSDMetalLayer setFrame:](v14, "setFrame:", v10, v11, v12, v13);
    }
    self->mStartTime = 0.0;
    self->mDelayTime = 0.0;
    self->mAnimationDidStart = 0;
    self->mForceRenderOfFirstFrame = 1;
    [(TSDMetalLayer *)self->mMetalLayer displayAtCurrentLayerTime];
  }

  +[CATransaction commit];
}

- (void)p_initMetalLayerIfNeeded
{
  mMetalLayer = self->mMetalLayer;
  if (!mMetalLayer)
  {
    id v4 = [(KPFSession *)self->mSession sharedMetalLayer];
    self->mMetalLayer = v4;
    [(TSDMetalLayer *)v4 displayAtCurrentLayerTime];
    [(TSDMetalLayer *)self->mMetalLayer setDelegate:self];
    [(CALayer *)[(KPFSession *)self->mSession showLayer] bounds];
    -[TSDMetalLayer setBounds:](self->mMetalLayer, "setBounds:");
    [(CALayer *)[(KPFSession *)self->mSession showLayer] addSublayer:self->mMetalLayer];
    mMetalLayer = self->mMetalLayer;
  }
  [(TSDMetalLayer *)mMetalLayer setHidden:0];
  LODWORD(v5) = 1.0;
  [(TSDMetalLayer *)self->mMetalLayer setOpacity:v5];
  if (!self->mMetalLayer) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer p_initMetalLayerIfNeeded]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:158 description:@"invalid nil value for '%s'", "mMetalLayer"];
  }
}

- (void)prepareAnimations
{
  if (!self->mAreAnimationsPrepared)
  {
    [(KPFMTLBuildRenderer *)self loadPluginIfNeeded];
    [(KPFMTLBuildRenderer *)self p_generateTextures];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(KPFMTLBuildRenderer *)self p_setupMetalContext];
    if ([(NSArray *)self->mTextures count])
    {
      self->mAreAnimationsPrepared = 1;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      mTextures = self->mTextures;
      id v4 = [(NSArray *)mTextures countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v33;
        CGFloat y = CGRectNull.origin.y;
        CGFloat height = CGRectNull.size.height;
        CGFloat r1 = CGRectNull.size.width;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v33 != v6) {
              objc_enumerationMutation(mTextures);
            }
            id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            [(CALayer *)[(KPFGingerEffect *)self->mEffect layer] frame];
            CGFloat v11 = v10;
            CGFloat v13 = v12;
            [(CALayer *)[(KPFGingerEffect *)self->mEffect baseLayer] frame];
            TSDAddPoints();
            v41.origin.double x = v14;
            v41.origin.CGFloat y = v15;
            v37.origin.CGFloat y = y;
            v37.origin.double x = CGRectNull.origin.x;
            v37.size.double width = r1;
            v37.size.CGFloat height = height;
            v41.size.double width = v11;
            v41.size.CGFloat height = v13;
            CGRect v38 = CGRectUnion(v37, v41);
            double x = v38.origin.x;
            double v17 = v38.origin.y;
            double width = v38.size.width;
            double v19 = v38.size.height;
            [v9 frame];
            double v21 = x + v20;
            [v9 frame];
            double v22 = v17 + CGRectGetMaxY(v39);
            [v9 frame];
            double v24 = v23;
            [v9 frame];
            [v9 setFrameOnCanvas:v21, v22, v24];
            -[KPFMTLBuildRenderer setupGraphicsLayerWithFrame:](self, "setupGraphicsLayerWithFrame:", x, v17, width, v19);
            [(CALayer *)[(KPFSession *)self->mSession showLayer] addSublayer:self->mMetalLayer];
          }
          id v5 = [(NSArray *)mTextures countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v5);
      }
    }
    id v25 = [(NSArray *)self->mTextures objectAtIndex:0];
    if ([(KNAnimatedBuild *)[(KNAnimationPluginContext *)self->mPluginContext animatedBuild] isBuildOut])
    {
      [v25 frameOnCanvas];
      double MidX = CGRectGetMidX(v40);
      [v25 frameOnCanvas];
      double v28 = v27;
      [v25 frameOnCanvas];
      objc_msgSend(objc_msgSend(v25, "layer"), "setPosition:", MidX, v28 + v29 * -0.5);
      self->mTextureLayer = (CALayer *)[v25 layer];
      objc_msgSend(-[TSDMetalLayer superlayer](self->mMetalLayer, "superlayer"), "insertSublayer:above:", objc_msgSend(v25, "layer"), self->mMetalLayer);
    }
    +[CATransaction commit];
  }
}

- (id)loadPluginIfNeeded
{
  id result = self->mPlugin;
  if (!result)
  {
    id result = [objc_alloc(self->mEffectClass) initWithAnimationContext:self->mAnimationContext];
    self->mPlugin = result;
  }
  return result;
}

- (void)p_generateTextures
{
  id v3 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:[self->mSession CGImageForTextureName:[self->mEffect textureToBeAnimated]]];
  self->mTextures = +[NSArray arrayWithObjects:&v3 count:1];
}

- (void)renderTextures
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSArray *)self->mTextures copy];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setupMetalTextureForDevice:[-[KNAnimationPluginContext metalContext](self->mPluginContext, "metalContext") device]];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)addAnimationsAtLayerTime:(double)a3
{
  if (!self->mAreAnimationsPrepared)
  {
    [(KPFMTLBuildRenderer *)self prepareAnimations];
    self->mForceRenderOfFirstFrame = 0;
  }
  if ([(NSArray *)self->mTextures count])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CALayer *)[(KPFGingerEffect *)self->mEffect layer] setHidden:1];
    self->mStartTime = a3;
    self->mDelayTime = 0.0;
    self->mAnimationDidStart = 1;
    +[CATransaction commit];
  }
  return [(NSArray *)self->mTextures count] != 0;
}

- (BOOL)shouldDrawFrameAtLayerTime:(double)a3
{
  return 1;
}

- (void)drawFrameAtLayerTime:(double)a3
{
  [(TSDMetalLayer *)self->mMetalLayer setBackgroundColor:0];
  if (!self->mPlugin) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:261 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "mPlugin"]];
  }
  if (!self->mAnimatedBuild) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m") lineNumber:262 description:@"invalid nil value for '%s'", "mAnimatedBuild"];
  }
  if (!self->mAreAnimationsPrepared) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m") lineNumber:263 description:@"Animations have not been prepared"];
  }
  if (!self->mWasPluginNotifiedOfAnimationStart)
  {
    id mPlugin = self->mPlugin;
    if (objc_opt_respondsToSelector())
    {
      [(KPFMTLBuildRenderer *)self setupPluginContext];
      [(KPFMTLBuildRenderer *)self p_setupMetalContext];
      [mPlugin animationWillBeginWithContext:self->mPluginContext];
      self->mWasPluginNotifiedOfAnimationStart = 1;
    }
  }
  id v6 = [(TSDMetalLayer *)self->mMetalLayer nextDrawable];
  id v7 = v6;
  if (!v6)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m") lineNumber:287 description:@"invalid nil value for '%s'", "drawable"];
    if ([0 texture]) {
      goto LABEL_32;
    }
LABEL_16:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer drawFrameAtLayerTime:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m") lineNumber:289 description:@"invalid nil value for '%s'", "texture"];
    goto LABEL_32;
  }
  id v8 = [v6 texture];
  if (!v8) {
    goto LABEL_16;
  }
  id v9 = v8;
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    commandQueue = [TSDMetalLayer device][self->mMetalLayer device] newCommandQueue];
    if (commandQueue)
    {
      self->_commandQueue = commandQueue;
    }
    else
    {
      commandQueue = (MTLCommandQueue *)[(TSDMetalLayer *)self->mMetalLayer commandQueue];
      self->_commandQueue = commandQueue;
      if (!commandQueue)
      {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:295 description:@"invalid nil value for '%s'", "_commandQueue"];
        commandQueue = self->_commandQueue;
      }
    }
  }
  id v11 = [(MTLCommandQueue *)commandQueue commandBuffer];
  if (!v11) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:297 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"commandBuffer"];
  }
  self->mForceRenderOfFirstFrame = 0;
  mPluginContext = self->mPluginContext;
  if (!mPluginContext)
  {
    [(KPFMTLBuildRenderer *)self setupPluginContext];
    mPluginContext = self->mPluginContext;
  }
  [(KNAnimationPluginContext *)mPluginContext duration];
  TSUClamp();
  double v14 = v13;
  self->mAnimationRanToCompletion = v13 >= 1.0;
  CGFloat v15 = [(KNAnimationPluginContext *)self->mPluginContext metalContext];
  [(TSDMetalContext *)v15 setCommandQueue:self->_commandQueue];
  [(TSDMetalContext *)v15 setCommandBuffer:v11];
  [(TSDMetalContext *)v15 setCurrentBuffer:self->mCurrentBuffer];
  CGRect v16 = +[MTLRenderPassDescriptor renderPassDescriptor];
  [[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v16 colorAttachments] objectAtIndexedSubscript:0] setTexture:v9];
  [[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v16 colorAttachments] objectAtIndexedSubscript:0] setLoadAction:2];
  [[(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v16 colorAttachments] objectAtIndexedSubscript:0] setStoreAction:1];
  -[MTLRenderPassColorAttachmentDescriptor setClearColor:]([(MTLRenderPassColorAttachmentDescriptorArray *)[(MTLRenderPassDescriptor *)v16 colorAttachments] objectAtIndexedSubscript:0], "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  [(TSDMetalContext *)v15 setPassDescriptor:v16];
  id v17 = [v11 renderCommandEncoderWithDescriptor:v16];
  if ([(TSDMetalContext *)v15 renderEncoder]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer drawFrameAtLayerTime:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:322 description:[NSString stringWithFormat:@"expected nil value for '%s'", @"metalContext.renderEncoder"];
  }
  [(TSDMetalContext *)v15 setRenderEncoder:v17];
  [(KNAnimationPluginContext *)self->mPluginContext setPercent:v14];
  [self->mPlugin renderFrameWithContext:self->mPluginContext];
  [v17 endEncoding];
  if (self->mIsRealtime)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_117A9C;
    v20[3] = &unk_459A50;
    v20[4] = v7;
    [v11 addScheduledHandler:v20];
  }
  [v11 commit];
  if (self->mTextureLayer)
  {
    [v11 waitUntilCompleted];
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    +[CATransaction activateBackground:](CATransaction, "activateBackground:", +[NSThread isMainThread] ^ 1);
    [(CALayer *)self->mTextureLayer removeFromSuperlayer];
    self->mTextureLayer = 0;
    +[CATransaction commit];
  }
  if (self->mAnimationRanToCompletion)
  {
    [(KPFMTLBuildRenderer *)self removeAnimationsAndFinish:1];
    self->mAnimationRanToCompletion = 1;
    if (self->mBuildEndCallbackTarget)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_117AA4;
      block[3] = &unk_456DE0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
LABEL_32:
}

- (void)animateAfterDelay:(double)a3
{
  if (!self->mTextures)
  {
    [(KPFMTLBuildRenderer *)self p_initMetalLayerIfNeeded];
    [(KPFMTLBuildRenderer *)self setupPluginContext];
    [(KPFMTLBuildRenderer *)self prepareAnimations];
    [(TSDMetalLayer *)self->mMetalLayer setDelegate:self];
    [(KPFMTLBuildRenderer *)self renderTextures];
  }
  if ([(KPFMTLBuildRenderer *)self addAnimationsAtLayerTime:CACurrentMediaTime() + a3])
  {
    self->mIsRealtime = 1;
    mMetalLayer = self->mMetalLayer;
    [(TSDMetalLayer *)mMetalLayer startAnimation];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_117BF0;
    v6[3] = &unk_457250;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)updateAnimationsForLayerTime:(double)a3
{
  self->mNonRealtimeLayerTime = a3;
  [(TSDMetalLayer *)self->mMetalLayer displayAtCurrentLayerTime];
}

- (void)replaceMetalLayerWithProxy
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v3 = [(NSArray *)self->mTextures objectAtIndex:0];
  [v3 frameOnCanvas];
  double MidX = CGRectGetMidX(v9);
  [v3 frameOnCanvas];
  double v6 = v5;
  [v3 frameOnCanvas];
  objc_msgSend(objc_msgSend(v3, "layer"), "setPosition:", MidX, v6 + v7 * -0.5);
  objc_msgSend(-[TSDMetalLayer superlayer](self->mMetalLayer, "superlayer"), "insertSublayer:above:", objc_msgSend(v3, "layer"), self->mMetalLayer);
  [(TSDMetalLayer *)self->mMetalLayer removeFromSuperlayer];

  +[CATransaction commit];
}

- (void)teardown
{
  [(TSDMetalLayer *)self->mMetalLayer setDelegate:0];
  mMetalLayer = self->mMetalLayer;

  [(TSDMetalLayer *)mMetalLayer tearDown];
}

- (void)removeAnimationsAndFinish:(BOOL)a3
{
  if (a3) {
    self->mAnimationRanToCompletion = 1;
  }
  mMetalLayer = self->mMetalLayer;
  if (mMetalLayer && [(TSDMetalLayer *)mMetalLayer superlayer])
  {
    if (!self->mPlugin) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLBuildRenderer removeAnimationsAndFinish:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m") lineNumber:430 description:@"invalid nil value for '%s'", "mPlugin"];
    }
    if (!self->mAnimatedBuild) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KPFMTLBuildRenderer removeAnimationsAndFinish:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLBuildRenderer.m"] lineNumber:431 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "mAnimatedBuild"]];
    }
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(TSDMetalLayer *)self->mMetalLayer setHidden:1];
    [(TSDMetalLayer *)self->mMetalLayer setOpacity:0.0];
    [(TSDMetalLayer *)self->mMetalLayer stopAnimation];
    self->mIsRealtime = 0;
    self->mNonRealtimeLayerTime = 0.0;
    if ([(KNAnimatedBuild *)[(KNAnimationPluginContext *)self->mPluginContext animatedBuild] isBuildIn])
    {
      [(KPFMTLBuildRenderer *)self replaceMetalLayerWithProxy];
    }
    +[CATransaction commit];
    if (self->mWasPluginNotifiedOfAnimationStart && (objc_opt_respondsToSelector() & 1) != 0) {
      [self->mPlugin animationDidEndWithContext:self->mPluginContext];
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    mTextures = self->mTextures;
    id v6 = [(NSArray *)mTextures countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(mTextures);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) releaseSingleTexture];
        }
        id v7 = [(NSArray *)mTextures countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    self->id mPlugin = 0;
    self->mTextures = 0;
    [(TSDMetalLayer *)self->mMetalLayer tearDown];
    [(TSDMetalLayer *)self->mMetalLayer setDelegate:0];
    *(_WORD *)&self->mAreAnimationsPrepared = 0;
    *(_WORD *)&self->mAnimationRanToCompletion = 0;
  }
}

- (void)stopAnimations
{
}

- (void)registerForBuildEndCallback:(SEL)a3 target:(id)a4
{
  self->mBuildEndCallbackTarget = a4;
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = 0;
  }
  self->mBuildEndCallbackSelector = v4;
}

- (void)displayMaskDidChange
{
  id v3 = [(KPFMTLBuildRenderer *)self loadPluginIfNeeded];
  if (self->mWasPluginNotifiedOfAnimationStart)
  {
    id v4 = v3;
    if (objc_opt_respondsToSelector())
    {
      [v4 animationDidEndWithContext:self->mPluginContext];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      mTextures = self->mTextures;
      id v6 = [(NSArray *)mTextures countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(mTextures);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * i) releaseSingleTexture];
          }
          id v7 = [(NSArray *)mTextures countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
      self->mWasPluginNotifiedOfAnimationStart = 0;
    }
  }
}

- (KNAnimationPluginContext)pluginContext
{
  return self->mPluginContext;
}

- (KNAnimatedBuild)animatedBuild
{
  return self->mAnimatedBuild;
}

- (void)setAnimatedBuild:(id)a3
{
}

@end