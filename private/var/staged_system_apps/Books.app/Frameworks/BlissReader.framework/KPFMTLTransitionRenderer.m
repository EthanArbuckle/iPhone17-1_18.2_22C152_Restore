@interface KPFMTLTransitionRenderer
- (BOOL)addAnimationsAtTime:(double)a3 relativeToCurrentMediaTime:(BOOL)a4;
- (BOOL)shouldDrawFrameAtLayerTime:(double)a3;
- (KNAnimationContext)animationContext;
- (KPFMTLTransitionRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 effect:(id)a6 session:(id)a7;
- (KPFMTLTransitionRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 session:(id)a6;
- (double)duration;
- (id)plugin;
- (unint64_t)direction;
- (void)animateWithDelay:(double)a3;
- (void)dealloc;
- (void)drawFrameAtLayerTime:(double)a3;
- (void)p_generateTextures;
- (void)p_initMetalLayerIfNeeded;
- (void)registerForTransitionEndCallback:(SEL)a3 target:(id)a4;
- (void)removeAnimations;
- (void)renderTextures;
- (void)setDirection:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setupPluginContext;
- (void)teardown;
@end

@implementation KPFMTLTransitionRenderer

- (KPFMTLTransitionRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 effect:(id)a6 session:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v32.receiver = self;
  v32.super_class = (Class)KPFMTLTransitionRenderer;
  v15 = [(KPFMTLTransitionRenderer *)&v32 init];
  v16 = v15;
  if (v15)
  {
    v15->mEffectClass = a3;
    objc_storeStrong((id *)&v15->mEffect, a6);
    objc_storeStrong((id *)&v16->mSession, a7);
    v16->mDirection = a4;
    v16->mDuration = a5;
    v17 = [KNAnimationContext alloc];
    v18 = [(KPFSession *)v16->mSession showLayer];
    [v18 bounds];
    double v20 = v19;
    double v22 = v21;
    v23 = [(KPFSession *)v16->mSession showLayer];
    v24 = -[KNAnimationContext initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:](v17, "initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:", v23, 1, v20, v22, 1.0);
    mAnimationContext = v16->mAnimationContext;
    v16->mAnimationContext = v24;

    mTextures = v16->mTextures;
    v16->mTextures = 0;

    uint64_t v27 = [(KPFSession *)v16->mSession sharedMetalLayer];
    metalLayer = v16->metalLayer;
    v16->metalLayer = (TSDMetalLayer *)v27;

    dispatch_semaphore_t v29 = dispatch_semaphore_create(3);
    mInFlightSemaphore = v16->mInFlightSemaphore;
    v16->mInFlightSemaphore = (OS_dispatch_semaphore *)v29;
  }
  return v16;
}

- (KPFMTLTransitionRenderer)initWithEffectClass:(Class)a3 direction:(unint64_t)a4 duration:(double)a5 session:(id)a6
{
  id v11 = a6;
  v29.receiver = self;
  v29.super_class = (Class)KPFMTLTransitionRenderer;
  v12 = [(KPFMTLTransitionRenderer *)&v29 init];
  id v13 = v12;
  if (v12)
  {
    v12->mEffectClass = a3;
    objc_storeStrong((id *)&v12->mCAKPFSession, a6);
    v13->mDirection = a4;
    v13->mDuration = a5;
    id v14 = [KNAnimationContext alloc];
    v15 = [v11 showLayer];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;
    double v20 = [v11 showLayer];
    double v21 = -[KNAnimationContext initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:](v14, "initWithShowSize:viewScale:baseLayer:isBaseLayerVisible:", v20, 1, v17, v19, 1.0);
    mAnimationContext = v13->mAnimationContext;
    v13->mAnimationContext = v21;

    mTextures = v13->mTextures;
    v13->mTextures = 0;

    uint64_t v24 = [v11 sharedMetalLayer];
    metalLayer = v13->metalLayer;
    v13->metalLayer = (TSDMetalLayer *)v24;

    dispatch_semaphore_t v26 = dispatch_semaphore_create(3);
    mInFlightSemaphore = v13->mInFlightSemaphore;
    v13->mInFlightSemaphore = (OS_dispatch_semaphore *)v26;
  }
  return v13;
}

- (void)dealloc
{
  [(KPFMTLTransitionRenderer *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)KPFMTLTransitionRenderer;
  [(KPFMTLTransitionRenderer *)&v3 dealloc];
}

- (void)setupPluginContext
{
  mContext = self->mContext;
  if (!mContext)
  {
    v4 = objc_alloc_init(KNAnimationPluginContext);
    v5 = self->mContext;
    self->mContext = v4;

    mContext = self->mContext;
  }
  [(KNAnimationPluginContext *)mContext setRendererType:9];
  [(KNAnimationPluginContext *)self->mContext setTextures:self->mTextures];
  [(KNAnimationPluginContext *)self->mContext setPercent:self->mPercent];
  [(KNAnimationPluginContext *)self->mContext setDuration:self->mDuration];
  [(KNAnimationPluginContext *)self->mContext setDirection:self->mDirection];
  v6 = objc_opt_new();
  [(KNAnimationPluginContext *)self->mContext setMetalContext:v6];

  v7 = [(TSDMetalLayer *)self->metalLayer device];
  v8 = [(KNAnimationPluginContext *)self->mContext metalContext];
  [v8 setDevice:v7];

  id v9 = [(TSDMetalLayer *)self->metalLayer pixelFormat];
  v10 = [(KNAnimationPluginContext *)self->mContext metalContext];
  [v10 setPixelFormat:v9];

  [(TSDMetalLayer *)self->metalLayer bounds];
  double v12 = v11;
  double v14 = v13;
  v15 = [(KNAnimationPluginContext *)self->mContext metalContext];
  [v15 setLayerSize:v12, v14];

  metalLayer = self->metalLayer;

  [(TSDMetalLayer *)metalLayer setDelegate:self];
}

- (id)plugin
{
  id mPlugin = self->mPlugin;
  if (!mPlugin)
  {
    id v4 = [objc_alloc(self->mEffectClass) initWithAnimationContext:self->mAnimationContext];
    id v5 = self->mPlugin;
    self->id mPlugin = v4;

    id mPlugin = self->mPlugin;
  }

  return mPlugin;
}

- (void)p_initMetalLayerIfNeeded
{
  mCAKPFSession = self->mCAKPFSession;
  if (!mCAKPFSession) {
    mCAKPFSession = self->mSession;
  }
  id v4 = [mCAKPFSession sharedMetalLayer];
  metalLayer = self->metalLayer;
  self->metalLayer = v4;

  [(TSDMetalLayer *)self->metalLayer displayAtCurrentLayerTime];
  [(TSDMetalLayer *)self->metalLayer setDelegate:self];
  mSession = self->mCAKPFSession;
  if (!mSession) {
    mSession = self->mSession;
  }
  v7 = [mSession showLayer];
  [v7 bounds];
  -[TSDMetalLayer setBounds:](self->metalLayer, "setBounds:");

  [(TSDMetalLayer *)self->metalLayer setPresentsWithTransaction:0];
  v8 = self->mCAKPFSession;
  id v9 = +[TSUColor blackColor];
  id v10 = [v9 CGColor];
  if (v8)
  {
    double v11 = [self->mCAKPFSession showLayer];
    [v11 setBackgroundColor:v10];

    double v12 = [self->mCAKPFSession showLayer];
    [v12 setSublayers:0];

    double v13 = [self->mCAKPFSession showLayer];
    [v13 addSublayer:self->metalLayer];

    if (self->metalLayer) {
      goto LABEL_11;
    }
    double v14 = +[TSUAssertionHandler currentHandler];
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer p_initMetalLayerIfNeeded]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
    [v14 handleFailureInFunction:v15 file:v16 lineNumber:176 description:@"invalid nil value for '%s'", "metalLayer"];
  }
  else
  {
    double v17 = [(KPFSession *)self->mSession showLayer];
    [v17 setBackgroundColor:v10];

    double v18 = [(KPFSession *)self->mSession showLayer];
    [v18 setSublayers:0];

    double v19 = [(KPFSession *)self->mSession showLayer];
    [v19 addSublayer:self->metalLayer];

    if (self->metalLayer) {
      goto LABEL_11;
    }
    double v14 = +[TSUAssertionHandler currentHandler];
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer p_initMetalLayerIfNeeded]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
    [v14 handleFailureInFunction:v15 file:v16 lineNumber:181 description:@"invalid nil value for '%s'", "metalLayer"];
  }

LABEL_11:
  [(TSDMetalLayer *)self->metalLayer setHidden:0];
  double v20 = self->metalLayer;
  LODWORD(v21) = 1.0;

  [(TSDMetalLayer *)v20 setOpacity:v21];
}

- (void)p_generateTextures
{
  objc_super v3 = [(KPFGingerEffect *)self->mEffect textures];
  id v4 = [v3 objectAtIndex:0];

  mCAKPFSession = self->mCAKPFSession;
  if (mCAKPFSession)
  {
    v6 = [mCAKPFSession KPFDocument];
    v7 = [self->mCAKPFSession currentEvent];
    v8 = [v7 textures];
    id v9 = [v8 objectAtIndex:0];
    id v10 = (CGImage *)[v6 newImageForTextureName:v9];
  }
  else
  {
    id v10 = [(KPFSession *)self->mSession CGImageForTextureName:v4];
  }
  id v11 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v10];
  double v12 = [(KPFGingerEffect *)self->mEffect textures];
  double v13 = [v12 objectAtIndex:1];

  double v14 = self->mCAKPFSession;
  if (v14)
  {
    v15 = [(CAKPFSession *)v14 KPFDocument];
    double v16 = [self->mCAKPFSession currentEvent];
    double v17 = [v16 textures];
    double v18 = [v17 objectAtIndex:1];
    double v19 = (CGImage *)[v15 newImageForTextureName:v18];
  }
  else
  {
    double v19 = [(KPFSession *)self->mSession CGImageForTextureName:v13];
  }
  id v20 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v19];
  v23[0] = v11;
  v23[1] = v20;
  double v21 = +[NSArray arrayWithObjects:v23 count:2];
  mTextures = self->mTextures;
  self->mTextures = v21;
}

- (void)renderTextures
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSArray *)self->mTextures copy];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = [(KNAnimationPluginContext *)self->mContext metalContext];
        id v10 = [v9 device];
        [v8 setupMetalTextureForDevice:v10];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)animateWithDelay:(double)a3
{
  if (!self->mTextures)
  {
    [(KPFMTLTransitionRenderer *)self p_initMetalLayerIfNeeded];
    [(KPFMTLTransitionRenderer *)self setupPluginContext];
    [(KPFMTLTransitionRenderer *)self p_generateTextures];
    [(KPFMTLTransitionRenderer *)self renderTextures];
  }
  if ([(KPFMTLTransitionRenderer *)self addAnimationsAtTime:1 relativeToCurrentMediaTime:a3])
  {
    self->mIsRealtime = 1;
    [(TSDMetalLayer *)self->metalLayer startAnimation];
    self->_isAnimationBeingStopped = 0;
  }
  else if (self->mTransitionEndCallbackTarget)
  {
    if (objc_opt_respondsToSelector())
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_6E794;
      block[3] = &unk_456D40;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)addAnimationsAtTime:(double)a3 relativeToCurrentMediaTime:(BOOL)a4
{
  CFTimeInterval v4 = a3;
  if (a4) {
    CFTimeInterval v4 = CACurrentMediaTime() + a3;
  }
  self->mStartTime = v4;
  self->mDelayTime = 0.0;
  return 1;
}

- (void)teardown
{
  [(TSDMetalLayer *)self->metalLayer stopAnimation];
  if (!self->mAnimationRanToCompletion) {
    [(KPFMTLTransitionRenderer *)self removeAnimations];
  }
  id mPlugin = self->mPlugin;
  self->id mPlugin = 0;

  metalLayer = self->metalLayer;

  [(TSDMetalLayer *)metalLayer tearDown];
}

- (void)removeAnimations
{
  id v3 = [(TSDMetalLayer *)self->metalLayer superlayer];

  if (v3)
  {
    [(TSDMetalLayer *)self->metalLayer stopAnimation];
    [(TSDMetalLayer *)self->metalLayer setPresentsWithTransaction:0];
    self->mIsRealtime = 0;
    self->_isAnimationBeingStopped = 1;
    CFTimeInterval v4 = [(KPFMTLTransitionRenderer *)self plugin];
    if (self->mWasPluginNotifiedOfAnimationStart && (objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_6EA70;
      block[3] = &unk_456D90;
      id v17 = v4;
      double v18 = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    self->mWasPluginNotifiedOfAnimationStart = 0;
    id mPlugin = self->mPlugin;
    self->id mPlugin = 0;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = self->mTextures;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) releaseSingleTexture:v12];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
      }
      while (v8);
    }

    mTextures = self->mTextures;
    if (mTextures)
    {
      self->mTextures = 0;

      [(TSDMetalLayer *)self->metalLayer setDelegate:0];
      self->mAnimationRanToCompletion = 0;
    }
  }
}

- (void)registerForTransitionEndCallback:(SEL)a3 target:(id)a4
{
  id v6 = a4;
  if (a3) {
    id v7 = a3;
  }
  else {
    id v7 = 0;
  }
  self->mTransitionEndCallbackTarget = v6;
  self->mTransitionEndCallbackSelector = v7;

  _objc_release_x1();
}

- (BOOL)shouldDrawFrameAtLayerTime:(double)a3
{
  if (self->mStartTime > a3) {
    self->mForceRenderFirstFrame = 1;
  }
  return !self->mAnimationRanToCompletion;
}

- (void)drawFrameAtLayerTime:(double)a3
{
  if (self->mIsRealtime) {
    double v4 = a3;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [(KPFMTLTransitionRenderer *)self plugin];
  if (!self->mWasPluginNotifiedOfAnimationStart && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(KPFMTLTransitionRenderer *)self setupPluginContext];
    [v5 animationWillBeginWithContext:self->mContext];
    self->mWasPluginNotifiedOfAnimationStart = 1;
  }
  [(TSDMetalLayer *)self->metalLayer setDelegate:self];
  id v7 = [(TSDMetalLayer *)self->metalLayer nextDrawable];
  if (!v7)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:358 description:@"invalid nil value for '%s'", "drawable"];
  }
  long long v11 = [v7 texture];
  if (!v11)
  {
    long long v12 = +[TSUAssertionHandler currentHandler];
    long long v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]");
    long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:360 description:@"invalid nil value for '%s'", "texture"];

    goto LABEL_14;
  }
  if (!v7)
  {
LABEL_14:
    long long v15 = 0;
    goto LABEL_15;
  }
  self->mForceRenderFirstFrame = 0;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->mInFlightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_isAnimationBeingStopped)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->mInFlightSemaphore);
    goto LABEL_14;
  }
  commandQueue = self->_commandQueue;
  if (!commandQueue)
  {
    id v17 = [(TSDMetalLayer *)self->metalLayer device];
    double v18 = (MTLCommandQueue *)[v17 newCommandQueue];
    double v19 = self->_commandQueue;
    self->_commandQueue = v18;

    commandQueue = self->_commandQueue;
    if (!commandQueue)
    {
      id v20 = +[TSUAssertionHandler currentHandler];
      double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]");
      double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
      [v20 handleFailureInFunction:v21 file:v22 lineNumber:374 description:@"invalid nil value for '%s'", "_commandQueue"];

      commandQueue = self->_commandQueue;
    }
  }
  long long v15 = [(MTLCommandQueue *)commandQueue commandBuffer];
  if (!v15)
  {
    v23 = +[TSUAssertionHandler currentHandler];
    uint64_t v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]");
    v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
    [v23 handleFailureInFunction:v24 file:v25 lineNumber:377 description:@"invalid nil value for '%s'", "commandBuffer"];
  }
  v43 = v6;
  mContext = self->mContext;
  if (!mContext)
  {
    [(KPFMTLTransitionRenderer *)self setupPluginContext];
    mContext = self->mContext;
  }
  v45 = mContext;
  uint64_t v27 = [(KNAnimationPluginContext *)v45 metalContext];
  [v27 setCommandQueue:self->_commandQueue];
  [v27 setCommandBuffer:v15];
  [v27 setCurrentBuffer:self->mCurrentBuffer];
  v28 = +[MTLRenderPassDescriptor renderPassDescriptor];
  objc_super v29 = [v28 colorAttachments];
  v30 = [v29 objectAtIndexedSubscript:0];
  [v30 setTexture:v11];

  v31 = [v28 colorAttachments];
  objc_super v32 = [v31 objectAtIndexedSubscript:0];
  [v32 setLoadAction:2];

  v33 = [v28 colorAttachments];
  v34 = [v33 objectAtIndexedSubscript:0];
  [v34 setStoreAction:1];

  v35 = [v28 colorAttachments];
  v36 = [v35 objectAtIndexedSubscript:0];
  [v36 setClearColor:0.0, 0.0, 0.0, 0.0];

  [v27 setPassDescriptor:v28];
  v44 = [v15 renderCommandEncoderWithDescriptor:v28];
  v37 = [v27 renderEncoder];

  if (v37)
  {
    v38 = +[TSUAssertionHandler currentHandler];
    v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KPFMTLTransitionRenderer drawFrameAtLayerTime:]");
    v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KPFMTLTransitionRenderer.m"];
    [v38 handleFailureInFunction:v39 file:v40 lineNumber:397 description:@"expected nil value for '%s'", "metalContext.renderEncoder"];
  }
  [v27 setRenderEncoder:v44];
  self->mPercent = (v4 - self->mStartTime) / self->mDuration;
  TSUClamp();
  self->mPercent = v41;
  -[KNAnimationPluginContext setPercent:](v45, "setPercent:");
  self->mAnimationRanToCompletion = self->mPercent >= 1.0;
  v42 = [(KPFMTLTransitionRenderer *)self plugin];
  [v42 renderFrameWithContext:self->mContext];

  [v44 endEncoding];
  if (self->mIsRealtime)
  {
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_6F264;
    v52[3] = &unk_458068;
    id v53 = v7;
    [v15 addScheduledHandler:v52];
  }
  objc_initWeak(&location, self->mInFlightSemaphore);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_6F26C;
  v49[3] = &unk_458090;
  objc_copyWeak(&v50, &location);
  [v15 addCompletedHandler:v49];
  id v6 = v43;
  [v15 commit];
  self->mCurrentBuffer = (self->mCurrentBuffer + 1) % 3;
  self->mForceRenderFirstFrame = 0;
  objc_destroyWeak(&v50);
  objc_destroyWeak(&location);

LABEL_15:
  if (self->mAnimationRanToCompletion)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6F2AC;
    block[3] = &unk_456D90;
    id v47 = v15;
    v48 = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (KNAnimationContext)animationContext
{
  return self->mAnimationContext;
}

- (unint64_t)direction
{
  return self->mDirection;
}

- (void)setDirection:(unint64_t)a3
{
  self->mDirection = a3;
}

- (double)duration
{
  return self->mDuration;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCAKPFSession, 0);
  objc_storeStrong((id *)&self->mInFlightSemaphore, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong(&self->mTransitionEndCallbackTarget, 0);
  objc_storeStrong((id *)&self->mContext, 0);
  objc_storeStrong((id *)&self->mTextures, 0);
  objc_storeStrong((id *)&self->mAnimationContext, 0);
  objc_storeStrong((id *)&self->metalLayer, 0);
  objc_storeStrong((id *)&self->mSession, 0);
  objc_storeStrong((id *)&self->mEffect, 0);

  objc_storeStrong(&self->mPlugin, 0);
}

@end