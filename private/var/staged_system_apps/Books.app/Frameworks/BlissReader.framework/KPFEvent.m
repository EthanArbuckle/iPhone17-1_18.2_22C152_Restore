@interface KPFEvent
- (BOOL)containsMovie;
- (BOOL)isAnimating;
- (BOOL)isAutomatic;
- (BOOL)isMoviePlaying;
- (CATransform3D)p_transformFromArray:(SEL)a3;
- (CGAffineTransform)p_affineTransformFromArray:(SEL)a3;
- (CGRect)p_rectFromDictionary:(id)a3;
- (KPFEvent)initWithDictionary:(id)a3;
- (KPFEventAnimationDelegate)animationDelegate;
- (NSArray)textures;
- (id)accessibilityArray;
- (id)hyperlinkAtLocation:(CGPoint)a3;
- (id)hyperlinksRectArray;
- (id)p_animationKeyPathForAction:(id)a3;
- (id)p_animationsArray;
- (id)p_hyperlinksArray;
- (id)p_initialStatesArray;
- (id)p_propertyValueFromDictionary:(id)a3 forLayer:(id)a4 forAction:(id)a5;
- (id)p_timingFunctionFromString:(id)a3 forActionDictionary:(id)a4;
- (void)animateEventWithSession:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)p_addAnimationFromAnimationDict:(id)a3 forLayer:(id)a4 withTextureName:(id)a5;
- (void)p_addPerspectiveTransform:(id)a3;
- (void)p_glAnimationEndCallback;
- (void)p_movieEndCallback:(id)a3;
- (void)p_setupAndAnimateGLAnimationsFromPluginArray:(id)a3 withEffect:(id)a4 session:(id)a5;
- (void)pauseMoviePlayback;
- (void)renderEventWithSession:(id)a3;
- (void)setAnimationDelegate:(id)a3;
- (void)setAnimationEndHandler:(id)a3;
- (void)stopAllAnimations;
- (void)stopMoviePlayback;
- (void)tearDown;
@end

@implementation KPFEvent

- (KPFEvent)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)KPFEvent;
  v4 = [(KPFEvent *)&v6 init];
  if (v4)
  {
    v4->mEventDictionary = (NSDictionary *)a3;
    v4->_animationDelegate = [[KPFEventAnimationDelegate alloc] initWithEvent:v4];
  }
  return v4;
}

- (void)dealloc
{
  [(KPFEventAnimationDelegate *)self->_animationDelegate setWeakEvent:0];

  v3.receiver = self;
  v3.super_class = (Class)KPFEvent;
  [(KPFEvent *)&v3 dealloc];
}

- (void)setAnimationEndHandler:(id)a3
{
  self->mAnimationEndHandler = [a3 copy];
}

- (void)renderEventWithSession:(id)a3
{
  id v3 = a3;
  id v5 = [a3 KPFDocument];
  double v6 = CACurrentMediaTime();

  self->mLayers = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  self->mCanvasIDMap = (TSUNoCopyDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  objc_msgSend(objc_msgSend(v3, "showLayer"), "setSublayers:", 0);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = [(KPFEvent *)self p_initialStatesArray];
  v82 = self;
  v83 = v3;
  id v86 = [obj countByEnumeratingWithState:&v117 objects:v123 count:16];
  if (v86)
  {
    uint64_t v85 = *(void *)v118;
    double y = CGPointZero.y;
    v81 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v118 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v88 = v8;
        v9 = *(void **)(*((void *)&v117 + 1) + 8 * v8);
        id v10 = [v9 objectForKey:@"texture"];
        v11 = objc_alloc_init(THImageLayer);
        -[THImageLayer setHidden:](v11, "setHidden:", objc_msgSend(objc_msgSend(v9, "objectForKey:", @"hidden"), "BOOLValue"));
        objc_msgSend(objc_msgSend(v9, "objectForKey:", @"zIndex"), "floatValue");
        [(THImageLayer *)v11 setZPosition:v12];
        [(THImageLayer *)v11 setDoubleSided:0];
        [(THImageLayer *)v11 setEdgeAntialiasingMask:0];
        objc_msgSend(objc_msgSend(v9, "objectForKey:", @"opacity"), "floatValue");
        -[THImageLayer setOpacity:](v11, "setOpacity:");
        id v13 = [v9 objectForKey:@"opacityMultiplier"];
        if (v13)
        {
          v14 = v13;
          [(THImageLayer *)v11 opacity];
          float v16 = v15;
          [v14 floatValue];
          *(float *)&double v18 = v16 * v17;
          [(THImageLayer *)v11 setOpacity:v18];
        }
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_1100C0;
        v116[3] = &unk_459950;
        v116[4] = v5;
        v116[5] = v10;
        -[THImageLayer setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:](v11, "setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:", v116, 0, 0, 1.79769313e308, 1.79769313e308);
        [v5 textureSizeForName:v10];
        -[THImageLayer setBounds:](v11, "setBounds:", CGPointZero.x, y, v19, v20);
        id v90 = v10;
        [(THImageLayer *)v11 setName:v10];
        -[KPFEvent p_affineTransformFromArray:](self, "p_affineTransformFromArray:", [v9 objectForKey:@"affineTransform"]);
        [(THImageLayer *)v11 setAffineTransform:v115];
        id v21 = [v9 objectForKey:@"translationEmphasis"];
        if (v21)
        {
          v22 = v21;
          if ([v21 count] == (char *)&dword_0 + 3)
          {
            objc_msgSend(objc_msgSend(v22, "objectAtIndex:", 0), "floatValue");
            double v24 = v23;
            objc_msgSend(objc_msgSend(v22, "objectAtIndex:", 1), "floatValue");
            [(THImageLayer *)v11 setValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v24, v25) forKey:@"translationEmphasis"];
          }
        }
        id v26 = [v9 objectForKey:@"scaleEmphasis"];
        if (v26)
        {
          v27 = v26;
          if ([v26 count] == (char *)&dword_4 + 2)
          {
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 3), "floatValue");
            double v29 = v28;
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 4), "floatValue");
            [(THImageLayer *)v11 setValue:+[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", v29, v30) forKey:@"scaleEmphasis"];
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 0), "floatValue");
            double v32 = v31;
            objc_msgSend(objc_msgSend(v27, "objectAtIndex:", 1), "floatValue");
            [(THImageLayer *)v11 setValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v32, v33) forKey:@"centerOfEmphasis"];
          }
        }
        v87 = v9;
        id v34 = [v9 objectForKey:@"rotationEmphasis"];
        if (v34)
        {
          v35 = v34;
          if ([v34 count] == (char *)&dword_4 + 3)
          {
            objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 6), "floatValue");
            [(THImageLayer *)v11 setValue:+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:") forKey:@"rotationEmphasis"];
            objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 0), "floatValue");
            double v37 = v36;
            objc_msgSend(objc_msgSend(v35, "objectAtIndex:", 1), "floatValue");
            [(THImageLayer *)v11 setValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v37, v38) forKey:@"centerOfEmphasis"];
          }
        }
        objc_msgSend(objc_msgSend(v3, "showLayer"), "addSublayer:", v11);
        v89 = v11;
        [(TSUNoCopyDictionary *)self->mLayers setObject:v11 forKey:v90];
        if (!self->mMovie)
        {
          if ([v5 movieURLForTextureName:v90])
          {
            long long v113 = 0u;
            long long v114 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            id v40 = [(KPFEvent *)self p_animationsArray];
            id v41 = [v40 countByEnumeratingWithState:&v111 objects:v122 count:16];
            if (v41)
            {
              id v42 = v41;
              char v43 = 0;
              uint64_t v44 = *(void *)v112;
              do
              {
                for (i = 0; i != v42; i = (char *)i + 1)
                {
                  if (*(void *)v112 != v44) {
                    objc_enumerationMutation(v40);
                  }
                  v46 = *(void **)(*((void *)&v111 + 1) + 8 * i);
                  id v47 = [v46 objectForKey:@"effect"];
                  if ((([v47 isEqualToString:@"movieStart"] & 1) != 0
                     || [v47 isEqualToString:@"apple:movie-start"])
                    && !objc_msgSend(objc_msgSend(v46, "objectForKey:", @"animationType"), "isEqualToString:", @"buildOut"))
                  {
                    char v43 = 1;
                  }
                }
                id v42 = [v40 countByEnumeratingWithState:&v111 objects:v122 count:16];
              }
              while (v42);
              self = v82;
              id v3 = v83;
              id v5 = v81;
              if (v43)
              {
                v48 = (KPFMovie *)[v81 newMovieForTextureName:v90];
                v82->mMovie = v48;
                if (v48)
                {
                  v49 = [(KPFMovie *)v48 playerLayer];
                  [v81 textureSizeForName:v90];
                  -[AVPlayerLayer setBounds:](v49, "setBounds:", 0.0, 0.0, v50, v51);
                  -[AVPlayerLayer setPosition:](v49, "setPosition:", CGPointZero.x, y);
                  [(AVPlayerLayer *)v49 setHidden:1];
                  [(THImageLayer *)v89 zPosition];
                  -[AVPlayerLayer setZPosition:](v49, "setZPosition:");
                  if (v89)
                  {
                    [(THImageLayer *)v89 transform];
                  }
                  else
                  {
                    long long v109 = 0u;
                    long long v110 = 0u;
                    long long v107 = 0u;
                    long long v108 = 0u;
                    long long v105 = 0u;
                    long long v106 = 0u;
                    long long v103 = 0u;
                    long long v104 = 0u;
                  }
                  v102[4] = v107;
                  v102[5] = v108;
                  v102[6] = v109;
                  v102[7] = v110;
                  v102[0] = v103;
                  v102[1] = v104;
                  v102[2] = v105;
                  v102[3] = v106;
                  [(AVPlayerLayer *)v49 setTransform:v102];
                  [(AVPlayerLayer *)v49 setValue:v89 forKey:@"textureLayer"];
                  [(THImageLayer *)v89 setValue:v49 forKey:@"movieLayer"];
                  objc_msgSend(objc_msgSend(v83, "showLayer"), "addSublayer:", v49);
                }
              }
            }
          }
        }
        id v39 = [v87 objectForKey:@"canvasObjectID"];
        if (v39) {
          [(TSUNoCopyDictionary *)self->mCanvasIDMap setObject:v89 forKey:v39];
        }

        uint64_t v8 = v88 + 1;
      }
      while ((id)(v88 + 1) != v86);
      id v52 = [obj countByEnumeratingWithState:&v117 objects:v123 count:16];
      id v86 = v52;
    }
    while (v52);
  }
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v53 = [(TSUNoCopyDictionary *)self->mLayers allValues];
  id v54 = [v53 countByEnumeratingWithState:&v98 objects:v121 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v99;
    do
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(void *)v99 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = *(void **)(*((void *)&v98 + 1) + 8 * (void)j);
        memset(&v97, 0, sizeof(v97));
        if (v58) {
          [v58 affineTransform];
        }
        [v58 bounds];
        double v60 = v59;
        [v58 bounds];
        double v62 = v61;
        id v63 = [v58 valueForKey:@"centerOfEmphasis"];
        if (v63)
        {
          [v63 CGPointValue];
          double v65 = v64 + 1.0;
          double v67 = v66 + 1.0;
        }
        else
        {
          double v65 = v60 * 0.5;
          double v67 = v62 * 0.5;
        }
        CGAffineTransformMakeTranslation(&t2, v65, v67);
        CGAffineTransform t1 = v97;
        CGAffineTransformConcat(&v96, &t1, &t2);
        CGAffineTransform v97 = v96;
        [v58 bounds];
        double v69 = v65 / v68;
        [v58 bounds];
        [v58 setAnchorPoint:v69, v67 / v70];
        id v71 = [v58 valueForKey:@"translationEmphasis"];
        if (v71)
        {
          [v71 CGPointValue];
          CGAffineTransformMakeTranslation(&v93, v72, v73);
          CGAffineTransform t1 = v97;
          CGAffineTransformConcat(&v96, &v93, &t1);
          CGAffineTransform v97 = v96;
        }
        id v74 = [v58 valueForKey:@"scaleEmphasis"];
        if (v74)
        {
          [v74 CGSizeValue];
          CGAffineTransformMakeScale(&v92, v75, v76);
          CGAffineTransform t1 = v97;
          CGAffineTransformConcat(&v96, &v92, &t1);
          CGAffineTransform v97 = v96;
        }
        id v77 = [v58 valueForKey:@"rotationEmphasis"];
        if (v77)
        {
          [v77 floatValue];
          CGAffineTransformMakeRotation(&v91, v78);
          CGAffineTransform t1 = v97;
          CGAffineTransformConcat(&v96, &v91, &t1);
          CGAffineTransform v97 = v96;
        }
        CGAffineTransform v96 = v97;
        [v58 setAffineTransform:&v96];
        id v79 = [v58 valueForKey:@"movieLayer"];
        CGAffineTransform v96 = v97;
        [v79 setAffineTransform:&v96];
      }
      id v55 = [v53 countByEnumeratingWithState:&v98 objects:v121 count:16];
    }
    while (v55);
  }
  +[CATransaction commit];
  v82->mAnimationsStarted = 0;
  if ([v83 isDebuggingEnabled])
  {
    CFTimeInterval v80 = CACurrentMediaTime();
    NSLog(@"Rendering time: %f", v80 - v6);
  }
}

- (void)p_movieEndCallback:(id)a3
{
  if (!self->mAnimationsStarted)
  {
    mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
    if (mAnimationEndHandler) {
      mAnimationEndHandler[2]();
    }
  }
}

- (void)p_glAnimationEndCallback
{
  unint64_t mAnimationsStarted = self->mAnimationsStarted;
  if (!mAnimationsStarted || (unint64_t v3 = mAnimationsStarted - 1, (self->mAnimationsStarted = v3) == 0))
  {
    mAnimationEndHandler = (void (**)(void))self->mAnimationEndHandler;
    if (mAnimationEndHandler) {
      mAnimationEndHandler[2]();
    }
  }
}

- (void)p_addAnimationFromAnimationDict:(id)a3 forLayer:(id)a4 withTextureName:(id)a5
{
  if (a4)
  {
    id v30 = +[NSMutableArray array];
    id v9 = [a3 objectForKey:@"actions"];
    if (!v9) {
      id v9 = [a3 objectForKey:@"noPluginActions"];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      id v28 = a3;
      char v12 = 0;
      unsigned __int8 v13 = 0;
      uint64_t v14 = *(void *)v32;
      id obj = v9;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(obj);
          }
          float v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v17 = [v16 objectForKey:@"texture"];
          if (!a5 || [v17 isEqualToString:a5])
          {
            id v18 = [v16 objectForKey:@"action"];
            id v19 = v18;
            if (v13) {
              unsigned __int8 v13 = 1;
            }
            else {
              unsigned __int8 v13 = [v18 isEqualToString:@"transform"];
            }
            double v20 = +[CABasicAnimation animationWithKeyPath:[(KPFEvent *)self p_animationKeyPathForAction:v19]];
            objc_msgSend(objc_msgSend(v16, "objectForKey:", @"beginTime"), "floatValue");
            [(CABasicAnimation *)v20 setBeginTime:v21];
            objc_msgSend(objc_msgSend(v16, "objectForKey:", @"duration"), "floatValue");
            [(CABasicAnimation *)v20 setDuration:v22];
            -[CABasicAnimation setFromValue:](v20, "setFromValue:", -[KPFEvent p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", [v16 objectForKey:@"from"], a4, v19));
            -[CABasicAnimation setToValue:](v20, "setToValue:", -[KPFEvent p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", [v16 objectForKey:@"to"], a4, v19));
            -[CABasicAnimation setTimingFunction:](v20, "setTimingFunction:", -[KPFEvent p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", [v16 objectForKey:@"timingFunction"], v16));
            [(CABasicAnimation *)v20 setFillMode:kCAFillModeForwards];
            [v30 addObject:v20];
            char v12 = 1;
          }
        }
        id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v11);
      if (v12)
      {
        if (v13) {
          [(KPFEvent *)self p_addPerspectiveTransform:a4];
        }
        objc_msgSend(objc_msgSend(v28, "objectForKey:", @"beginTime"), "floatValue");
        double v24 = v23;
        id v25 = +[CAAnimationGroup animation];
        [v25 setAnimations:v30];
        objc_msgSend(objc_msgSend(v28, "objectForKey:", @"duration"), "floatValue");
        [v25 setDuration:v24 + v26];
        [v25 setDelegate:self->_animationDelegate];
        [v25 setRemovedOnCompletion:0];
        [v25 setFillMode:kCAFillModeForwards];
        [v25 setValue:a4 forKey:@"layer"];
        v27 = [NSString stringWithFormat:@"%@-%@-%@", [v28 objectForKey:@"effect"], [v28 objectForKey:@"beginTime"], [v28 objectForKey:@"duration"]];
        if (![a4 animationForKey:v27]) {
          ++self->mAnimationsStarted;
        }
        [a4 addAnimation:v25 forKey:v27];
      }
    }
  }
}

- (void)p_setupAndAnimateGLAnimationsFromPluginArray:(id)a3 withEffect:(id)a4 session:(id)a5
{
  id v6 = objc_msgSend(objc_msgSend(a5, "animationRegistry"), "effectClassWithName:", a4);
  if (v6)
  {
    v7 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(a3);
          }
          id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v12 = [v11 objectForKey:@"animationAttributes"];
          id v13 = [v11 objectForKey:@"duration"];
          id v14 = [v12 objectForKey:@"animationDelay"];
          id v15 = [v12 objectForKey:@"direction"];
          id v26 = 0;
          id v26 = +[NSMutableDictionary dictionary];
          [v26 setObject:v15 forKey:@"KNTransitionAttributesDirection"];
          if ([v7 conformsToProtocol:&OBJC_PROTOCOL___KNAnimationPluginArchiving])
          {
            id v16 = [v7 supportedTypes];
            uint64_t v25 = 0;
            [v7 upgradeAttributes:&v26 animationName:0 warning:&v25 type:1 isFromClassic:90000000000];
          }
          id v17 = [KPFMTLTransitionRenderer alloc];
          id v18 = [[v26 valueForKey:@"KNTransitionAttributesDirection"] unsignedIntegerValue];
          [v13 doubleValue];
          id v19 = -[KPFMTLTransitionRenderer initWithEffectClass:direction:duration:session:](v17, "initWithEffectClass:direction:duration:session:", v7, v18, a5);
          self->mRenderer = v19;
          [(KPFMTLTransitionRenderer *)v19 registerForTransitionEndCallback:"p_glAnimationEndCallback" target:self];
          ++self->mAnimationsStarted;
          mRenderer = self->mRenderer;
          [v14 floatValue];
          [(KPFMTLTransitionRenderer *)mRenderer animateWithDelay:v21];
        }
        id v9 = [a3 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }
  }
}

- (void)animateEventWithSession:(id)a3
{
  if (!self->mLayers) {
    return;
  }
  if (objc_msgSend(-[KPFEvent p_animationsArray](self, "p_animationsArray"), "count")
    || (id mAnimationEndHandler = self->mAnimationEndHandler) == 0)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(KPFEvent *)self p_animationsArray];
    id v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (!v4) {
      goto LABEL_34;
    }
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v9 = [v8 objectForKey:@"effect"];
        id v10 = v9;
        if (self->mMovie)
        {
          if (([v9 isEqualToString:@"movieStart"] & 1) != 0
            || [v10 isEqualToString:@"apple:movie-start"])
          {
            [(KPFMovie *)self->mMovie registerForMovieEndCallback:"p_movieEndCallback:" target:self];
            [(AVPlayerLayer *)[(KPFMovie *)self->mMovie playerLayer] setHidden:0];
            mMovie = self->mMovie;
            objc_msgSend(objc_msgSend(v8, "objectForKey:", @"beginTime"), "floatValue");
            [(KPFMovie *)mMovie playAfterDelay:v12];
            continue;
          }
          if (self->mMovie && [v10 isEqualToString:@"movieStop"])
          {
            [(KPFMovie *)self->mMovie stop];
            [(AVPlayerLayer *)[(KPFMovie *)self->mMovie playerLayer] setHidden:1];
            continue;
          }
        }
        self->mTextures = (NSArray *)[v8 objectForKey:@"textures"];
        id v13 = [v8 objectForKey:@"pluginActions"];
        id v14 = [v8 objectForKey:@"animationType"];
        mTextures = self->mTextures;
        if (mTextures && v13)
        {
          id v16 = v14;
          if (objc_msgSend(objc_msgSend(a3, "animationRegistry"), "containsEffect:", v10)
            && [v16 isEqualToString:@"transition"])
          {
            [(KPFEvent *)self p_setupAndAnimateGLAnimationsFromPluginArray:v13 withEffect:v10 session:a3];
            continue;
          }
          mTextures = self->mTextures;
        }
        if (mTextures)
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v17 = [(NSArray *)mTextures countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(mTextures);
                }
                [(KPFEvent *)self p_addAnimationFromAnimationDict:v8 forLayer:[(TSUNoCopyDictionary *)self->mLayers objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)] withTextureName:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
              }
              id v18 = [(NSArray *)mTextures countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v18);
          }
        }
        else
        {
          id v21 = [v8 objectForKey:@"canvasObjectID"];
          if (v21) {
            [(KPFEvent *)self p_addAnimationFromAnimationDict:v8 forLayer:[(TSUNoCopyDictionary *)self->mCanvasIDMap objectForKey:v21] withTextureName:0];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (!v5)
      {
LABEL_34:
        +[CATransaction commit];
        return;
      }
    }
  }
  uint64_t v23 = (void (*)(void))*((void *)mAnimationEndHandler + 2);

  v23();
}

- (BOOL)containsMovie
{
  return self->mMovie != 0;
}

- (BOOL)isAnimating
{
  return self->mAnimationsStarted != 0;
}

- (BOOL)isMoviePlaying
{
  mMovie = self->mMovie;
  if (mMovie) {
    LOBYTE(mMovie) = [(KPFMovie *)mMovie isPlaying];
  }
  return (char)mMovie;
}

- (void)stopAllAnimations
{
  [(KPFEvent *)self stopMoviePlayback];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(TSUNoCopyDictionary *)self->mLayers allValues];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeAllAnimations];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)stopMoviePlayback
{
  mMovie = self->mMovie;
  if (mMovie)
  {
    [(KPFMovie *)mMovie stop];
    if (!self->mAnimationsStarted)
    {
      id mAnimationEndHandler = self->mAnimationEndHandler;
      if (mAnimationEndHandler)
      {
        id v5 = (void (*)(void))*((void *)mAnimationEndHandler + 2);
        v5();
      }
    }
  }
}

- (void)pauseMoviePlayback
{
  if ([(KPFEvent *)self isMoviePlaying])
  {
    mMovie = self->mMovie;
    [(KPFMovie *)mMovie pause];
  }
}

- (BOOL)isAutomatic
{
  id v2 = [(NSDictionary *)self->mEventDictionary objectForKey:@"automaticPlay"];

  return [v2 BOOLValue];
}

- (id)hyperlinksRectArray
{
  id v3 = [(KPFEvent *)self p_hyperlinksArray];
  if (![v3 count]) {
    return 0;
  }
  id v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v3 reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        -[KPFEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [*(id *)(*((void *)&v11 + 1) + 8 * i) objectForKey:@"targetRectangle"]);
        [v4 addObject:[NSValue valueWithCGRect:]];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  return v4;
}

- (id)hyperlinkAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [[-[KPFEvent p_hyperlinksArray](self, "p_hyperlinksArray")] reverseObjectEnumerator];
  id result = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        -[KPFEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [v11 objectForKey:@"targetRectangle"]);
        v17.CGFloat x = x;
        v17.CGFloat y = y;
        if (CGRectContainsPoint(v18, v17)) {
          return [v11 objectForKey:@"url"];
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id result = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v8 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)accessibilityArray
{
  id v3 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(NSDictionary *)self->mEventDictionary objectForKey:@"textRegions"];
  id v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v7);
        v21[0] = @"targetRectangle";
        -[KPFEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [v8 objectForKey:@"targetRectangle"]);
        v16[0] = v9;
        v16[1] = v10;
        v16[2] = v11;
        v16[3] = v12;
        long long v13 = +[NSValue valueWithBytes:v16 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v21[1] = @"text";
        v22[0] = v13;
        v22[1] = [v8 objectForKey:@"text"];
        [v3 addObject:[NSDictionary dictionaryWithObjects:forKeys:count:v22, v21, 2]];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
  return [v3 copy];
}

- (void)tearDown
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(TSUNoCopyDictionary *)self->mLayers allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeAllAnimations];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->id mAnimationEndHandler = 0;
  self->mMovie = 0;
}

- (NSArray)textures
{
  return self->mTextures;
}

- (KPFEventAnimationDelegate)animationDelegate
{
  return self->_animationDelegate;
}

- (void)setAnimationDelegate:(id)a3
{
}

- (CGRect)p_rectFromDictionary:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"x"), "floatValue");
  double v5 = v4;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"y"), "floatValue");
  double v7 = v6;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"width"), "floatValue");
  double v9 = v8;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"height"), "floatValue");
  double v11 = v10;
  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)p_initialStatesArray
{
  return [(NSDictionary *)self->mEventDictionary objectForKey:@"eventInitialStates"];
}

- (id)p_animationsArray
{
  return [(NSDictionary *)self->mEventDictionary objectForKey:@"eventAnimations"];
}

- (id)p_hyperlinksArray
{
  return [(NSDictionary *)self->mEventDictionary objectForKey:@"hyperlinks"];
}

- (id)p_propertyValueFromDictionary:(id)a3 forLayer:(id)a4 forAction:(id)a5
{
  if (([a5 isEqualToString:@"transform.rotation.x"] & 1) != 0
    || ([a5 isEqualToString:@"transform.rotation.y"] & 1) != 0
    || ([a5 isEqualToString:@"transform.rotation.z"] & 1) != 0
    || ([a5 isEqualToString:@"transform.scale.x"] & 1) != 0
    || ([a5 isEqualToString:@"transform.scale.y"] & 1) != 0
    || ([a5 isEqualToString:@"transform.scale.z"] & 1) != 0
    || ([a5 isEqualToString:@"transform.scale"] & 1) != 0
    || ([a5 isEqualToString:@"hidden"] & 1) != 0
    || ([a5 isEqualToString:@"zPosition"] & 1) != 0
    || ([a5 isEqualToString:@"anchorPointZ"] & 1) != 0
    || ([a5 isEqualToString:@"zOrderHint"] & 1) != 0
    || ([a5 isEqualToString:@"isPlaying"] & 1) != 0
    || [a5 isEqualToString:@"translation.z"])
  {
    return [a3 objectForKey:@"scalar"];
  }
  if ([a5 isEqualToString:@"transform.translation.x"])
  {
    [a4 frame];
    double v11 = v10;
    [a4 frame];
    double v13 = v12 * 0.5;
LABEL_21:
    double v16 = v11 + v13;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"scalar"), "floatValue");
    double v18 = v16 + v17;
    *(float *)&double v18 = v18;
LABEL_22:
    return +[NSNumber numberWithFloat:v18];
  }
  if ([a5 isEqualToString:@"transform.translation.y"])
  {
    [a4 frame];
    double v11 = v14;
    [a4 frame];
    double v13 = v15 * 0.5;
    goto LABEL_21;
  }
  if (([a5 isEqualToString:@"opacity"] & 1) != 0
    || [a5 isEqualToString:@"opacityMultiplier"])
  {
    [a4 opacity];
    float v20 = v19;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"scalar"), "floatValue");
    *(float *)&double v18 = v20 * *(float *)&v18;
    goto LABEL_22;
  }
  if ([a5 isEqualToString:@"translationEmphasis"])
  {
    id v21 = [a3 objectForKey:@"translationEmphasis"];
    [a4 position];
    double v23 = v22;
    double v25 = v24;
    id v26 = [a4 valueForKey:@"addtionalInitialTranslation"];
    if (v26)
    {
      [v26 CGPointValue];
      double v23 = v23 - v27;
      double v25 = v25 - v28;
    }
    [v21 objectAtIndex:0].floatValue;
    double v30 = v23 + v29;
    [v21 objectAtIndex:1].floatValue;
    double v32 = v25 + v31;
    double v33 = v30;
LABEL_32:
    return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v33, v32);
  }
  if ([a5 isEqualToString:@"rotationEmphasis"])
  {
    id v34 = [a3 objectForKey:@"rotationEmphasis"];
    uint64_t v35 = 6;
  }
  else
  {
    if (![a5 isEqualToString:@"scaleEmphasis"])
    {
      if (([a5 isEqualToString:@"transform.translation"] & 1) != 0
        || [a5 isEqualToString:@"anchorPoint"])
      {
        objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointX"), "floatValue");
        double v37 = v36;
        objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointY"), "floatValue");
        double v32 = v38;
      }
      else
      {
        if (![a5 isEqualToString:@"position"])
        {
          if (![a5 isEqualToString:@"transform"]) {
            return 0;
          }
          memset(&v49, 0, sizeof(v49));
          id v45 = [a3 objectForKey:@"transform"];
          if (self) {
            [(KPFEvent *)self p_transformFromArray:v45];
          }
          else {
            memset(&v49, 0, sizeof(v49));
          }
          if (a4) {
            [a4 transform];
          }
          else {
            memset(&b, 0, sizeof(b));
          }
          CATransform3D v46 = v49;
          CATransform3DConcat(&v48, &v46, &b);
          CATransform3D v49 = v48;
          return +[NSValue valueWithCATransform3D:&v48];
        }
        objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointX"), "floatValue");
        double v40 = v39;
        [a4 position];
        double v37 = v41 + v40;
        objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointY"), "floatValue");
        double v43 = v42;
        [a4 position];
        double v32 = v44 + v43;
      }
      double v33 = v37;
      goto LABEL_32;
    }
    id v34 = [a3 objectForKey:@"scaleEmphasis"];
    uint64_t v35 = 3;
  }

  return [v34 objectAtIndex:v35];
}

- (id)p_timingFunctionFromString:(id)a3 forActionDictionary:(id)a4
{
  if ([a3 isEqualToString:@"easeOut"])
  {
    float v6 = &kCAMediaTimingFunctionEaseOut;
LABEL_14:
    CAMediaTimingFunctionName v18 = *v6;
    return +[CAMediaTimingFunction functionWithName:v18];
  }
  if ([a3 isEqualToString:@"easeIn"])
  {
    float v6 = &kCAMediaTimingFunctionEaseIn;
    goto LABEL_14;
  }
  if ([a3 isEqualToString:@"easeInEaseOut"])
  {
    float v6 = &kCAMediaTimingFunctionEaseInEaseOut;
    goto LABEL_14;
  }
  if ([a3 isEqualToString:@"linear"])
  {
    float v6 = &kCAMediaTimingFunctionLinear;
    goto LABEL_14;
  }
  if (![a3 isEqualToString:@"custom"])
  {
    float v6 = &kCAMediaTimingFunctionDefault;
    goto LABEL_14;
  }
  objc_msgSend(objc_msgSend(a4, "objectForKey:", @"timingControlPoint1x"), "floatValue");
  int v8 = v7;
  objc_msgSend(objc_msgSend(a4, "objectForKey:", @"timingControlPoint1y"), "floatValue");
  int v10 = v9;
  objc_msgSend(objc_msgSend(a4, "objectForKey:", @"timingControlPoint2x"), "floatValue");
  int v12 = v11;
  objc_msgSend(objc_msgSend(a4, "objectForKey:", @"timingControlPoint2y"), "floatValue");
  LODWORD(v13) = LODWORD(v14);
  LODWORD(v14) = v8;
  LODWORD(v15) = v10;
  LODWORD(v16) = v12;

  return +[CAMediaTimingFunction functionWithControlPoints:v14 :v15 :v16 :v13];
}

- (CGAffineTransform)p_affineTransformFromArray:(SEL)a3
{
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
  CGFloat v7 = v6;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
  CGFloat v9 = v8;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
  CGFloat v11 = v10;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
  CGFloat v13 = v12;
  objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
  CGFloat v15 = v14;
  CGRect result = [(CGAffineTransform *)[a4 objectAtIndex:5] floatValue];
  retstr->a = v7;
  retstr->CATransform3D b = v9;
  retstr->c = v11;
  retstr->d = v13;
  retstr->tCGFloat x = v15;
  retstr->tCGFloat y = v17;
  return result;
}

- (CATransform3D)p_transformFromArray:(SEL)a3
{
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&retstr->m33 = v5;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&retstr->m43 = v6;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->m13 = v7;
  long long v8 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&retstr->m23 = v8;
  if (a4)
  {
    self = (CATransform3D *)[a4 count];
    if (self == (CATransform3D *)&dword_10)
    {
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 0), "floatValue");
      retstr->m11 = v10;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 1), "floatValue");
      retstr->m12 = v11;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 2), "floatValue");
      retstr->m13 = v12;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 3), "floatValue");
      retstr->m14 = v13;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 4), "floatValue");
      retstr->m21 = v14;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
      retstr->m22 = v15;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 6), "floatValue");
      retstr->m23 = v16;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 7), "floatValue");
      retstr->m24 = v17;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 8), "floatValue");
      retstr->m31 = v18;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 9), "floatValue");
      retstr->m32 = v19;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 10), "floatValue");
      retstr->m33 = v20;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 11), "floatValue");
      retstr->m34 = v21;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 12), "floatValue");
      retstr->m41 = v22;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 13), "floatValue");
      retstr->m42 = v23;
      objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 14), "floatValue");
      retstr->m43 = v24;
      self = (CATransform3D *)objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 15), "floatValue");
      retstr->m44 = v25;
    }
  }
  return self;
}

- (id)p_animationKeyPathForAction:(id)a3
{
  if ([a3 isEqualToString:@"opacityMultiplier"]) {
    return @"opacity";
  }
  if ([a3 isEqualToString:@"translationEmphasis"]) {
    return @"position";
  }
  if ([a3 isEqualToString:@"zOrderHint"]) {
    return @"zPosition";
  }
  if ([a3 isEqualToString:@"rotationEmphasis"]) {
    return @"transform.rotation.z";
  }
  if ([a3 isEqualToString:@"scaleEmphasis"]) {
    return @"transform.scale.xy";
  }
  return a3;
}

- (void)p_addPerspectiveTransform:(id)a3
{
  id v4 = [a3 superlayer];
  id v5 = a3;
  id v6 = objc_alloc_init((Class)CALayer);
  [v4 bounds];
  [v6 setFrame:];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  if (v6) {
    [v6 sublayerTransform];
  }
  [v4 bounds];
  double v8 = v7;
  [v4 bounds];
  if (v8 >= v9) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }
  *((double *)&v17 + 1) = 1.0 / (v10 * -2.64490471);
  v11[6] = v18;
  v11[7] = v19;
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  v11[3] = v15;
  v11[4] = v16;
  v11[5] = v17;
  [v6 setSublayerTransform:v11];
  [a3 zPosition];
  [v6 setZPosition:];
  [v4 insertSublayer:v6 above:a3];
  [a3 removeFromSuperlayer];
  [v6 addSublayer:v5];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    unint64_t mAnimationsStarted = self->mAnimationsStarted;
    if (!mAnimationsStarted || (unint64_t v6 = mAnimationsStarted - 1, (self->mAnimationsStarted = v6) == 0))
    {
      mMovie = self->mMovie;
      if (!mMovie || ![(KPFMovie *)mMovie isPlaying])
      {
        id mAnimationEndHandler = self->mAnimationEndHandler;
        if (mAnimationEndHandler)
        {
          double v9 = (void (*)(void))*((void *)mAnimationEndHandler + 2);
          v9();
        }
      }
    }
  }
}

@end