@interface KPFGingerEvent
- (BOOL)containsMovie;
- (BOOL)isAnimating;
- (BOOL)isAutomatic;
- (BOOL)isMoviePlaying;
- (CATransform3D)p_transformFromArray:(SEL)a3;
- (CGAffineTransform)p_affineTransformFromArray:(SEL)a3;
- (CGRect)p_rectFromDictionary:(id)a3;
- (KPFGingerEvent)initWithDictionary:(id)a3;
- (KPFGingerEvent)initWithEffectsDictionary:(id)a3;
- (id)accessibilityArray;
- (id)hyperlinkAtLocation:(CGPoint)a3;
- (id)hyperlinksRectArray;
- (id)p_effectsArray;
- (id)p_hyperlinksArray;
- (id)p_newLayerFromDict:(id)a3;
- (void)animateWithSession:(id)a3;
- (void)dealloc;
- (void)p_AnimationEnded;
- (void)pauseMoviePlayback;
- (void)renderEventWithSession:(id)a3;
- (void)resumeMoviePlayback;
- (void)setAnimationEndHandler:(id)a3;
- (void)stopMoviePlayback;
- (void)tearDown;
@end

@implementation KPFGingerEvent

- (KPFGingerEvent)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)KPFGingerEvent;
  v4 = [(KPFGingerEvent *)&v6 init];
  if (v4)
  {
    v4->mEventsDictionary = (NSDictionary *)a3;
    v4->_isAutomatic = [[a3 objectForKey:@"automaticPlay"] BOOLValue];
  }
  return v4;
}

- (KPFGingerEvent)initWithEffectsDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)KPFGingerEvent;
  v4 = [(KPFGingerEvent *)&v6 init];
  if (v4)
  {
    v4->mEffectsDictionary = (NSDictionary *)a3;
    v4->mEventsDictionary = 0;
  }
  return v4;
}

- (void)dealloc
{
  self->mAnimationDict = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerEvent;
  [(KPFGingerEvent *)&v3 dealloc];
}

- (void)setAnimationEndHandler:(id)a3
{
  self->mAnimationEndHandler = [a3 copy];
}

- (void)renderEventWithSession:(id)a3
{
  self->mAnimationDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->mSwappableLayersDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);

  self->mMovietoLayerMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->mKPFSession = (KPFSession *)a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CALayer *)[self->mKPFSession showLayer] setSublayers:0];
  id v5 = [(KPFGingerEvent *)self p_newLayerFromDict:[(NSDictionary *)self->mEventsDictionary objectForKey:@"baseLayer"]];
  id v6 = [(NSMutableDictionary *)self->mMovietoLayerMap allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [[self->mMovietoLayerMap objectForKeyedSubscript:v11] playerLayer];
        id v13 = [v11 nonretainedObjectValue];
        if (objc_msgSend(objc_msgSend(v13, "sublayers"), "count")) {
          [v13 insertSublayer:v12 atIndex:1];
        }
        else {
          [v13 addSublayer:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [(CALayer *)[self->mKPFSession showLayer] addSublayer:v5];
  +[CATransaction commit];
  self->mAnimationsStarted = 0;
}

- (void)p_AnimationEnded
{
  unint64_t mAnimationsStarted = self->mAnimationsStarted;
  if (!mAnimationsStarted || (unint64_t v3 = mAnimationsStarted - 1, (self->mAnimationsStarted = v3) == 0)) {
    (*((void (**)(void))self->mAnimationEndHandler + 2))();
  }
}

- (id)p_newLayerFromDict:(id)a3
{
  id v5 = +[CALayer layer];
  id v6 = [a3 objectForKey:@"texture"];
  id v7 = [a3 objectForKey:@"initialState"];
  id v8 = [a3 objectForKey:@"layers"];
  id v9 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"objectID"), "stringValue");
  -[CALayer setMasksToBounds:](v5, "setMasksToBounds:", objc_msgSend(objc_msgSend(v7, "objectForKey:", @"masksToBounds"), "BOOLValue"));
  -[CALayer setHidden:](v5, "setHidden:", objc_msgSend(objc_msgSend(v7, "objectForKey:", @"hidden"), "BOOLValue"));
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"zIndex"), "floatValue");
  [(CALayer *)v5 setZPosition:v10];
  [(CALayer *)v5 setDoubleSided:0];
  [(CALayer *)v5 setEdgeAntialiasingMask:0];
  id v11 = [v7 objectForKey:@"anchorPoint"];
  objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pointX"), "floatValue");
  double v13 = v12;
  objc_msgSend(objc_msgSend(v11, "objectForKey:", @"pointY"), "floatValue");
  -[CALayer setAnchorPoint:](v5, "setAnchorPoint:", v13, v14);
  id v15 = [v7 objectForKey:@"position"];
  objc_msgSend(objc_msgSend(v15, "objectForKey:", @"pointX"), "floatValue");
  double v17 = v16;
  objc_msgSend(objc_msgSend(v15, "objectForKey:", @"pointY"), "floatValue");
  -[CALayer setPosition:](v5, "setPosition:", v17, v18);
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"width"), "floatValue");
  double v20 = v19;
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"height"), "floatValue");
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, v20, v21);
  id v22 = [v7 objectForKey:@"sublayerTransform"];
  if (self)
  {
    [(KPFGingerEvent *)self p_transformFromArray:v22];
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
  }
  v46[4] = v51;
  v46[5] = v52;
  v46[6] = v53;
  v46[7] = v54;
  v46[0] = v47;
  v46[1] = v48;
  v46[2] = v49;
  v46[3] = v50;
  [(CALayer *)v5 setSublayerTransform:v46];
  id v23 = [v7 objectForKey:@"affineTransform"];
  if (self) {
    [(KPFGingerEvent *)self p_affineTransformFromArray:v23];
  }
  else {
    memset(v45, 0, sizeof(v45));
  }
  [(CALayer *)v5 setAffineTransform:v45];
  -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [v7 objectForKey:@"contentsRect"]);
  -[CALayer setContentsRect:](v5, "setContentsRect:");
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"opacity"), "floatValue");
  -[CALayer setOpacity:](v5, "setOpacity:");
  id v24 = [v7 objectForKey:@"opacityMultiplier"];
  if (v24)
  {
    v25 = v24;
    [(CALayer *)v5 opacity];
    float v27 = v26;
    [v25 floatValue];
    *(float *)&double v29 = v27 * v28;
    [(CALayer *)v5 setOpacity:v29];
  }
  mKPFSession = self->mKPFSession;
  if (mKPFSession && v6)
  {
    [(CALayer *)v5 setContents:[(KPFGingerSlide *)[mKPFSession currentSlide] CGImageForTextureName:v6 session:self->mKPFSession]];
    [(CALayer *)v5 setName:v6];
  }
  if (v9)
  {
    id v31 = [(NSMutableDictionary *)self->mSwappableLayersDict objectForKey:v9];
    if (v31)
    {
      v32 = v31;
      id v33 = [v31 superlayer];
      id v34 = [v32 superlayer];
      if (v33) {
        [v34 replaceSublayer:v32 with:v5];
      }
    }
    [(CALayer *)v5 setName:v9];
    id v35 = [(KPFGingerSlide *)[self->mKPFSession currentSlide] movieForObjectID:v9];
    if (v35) {
      [(NSMutableDictionary *)self->mMovietoLayerMap setObject:v35 forKey:+[NSValue valueWithNonretainedObject:v5]];
    }
    [(NSMutableDictionary *)self->mSwappableLayersDict setObject:v5 forKey:v9];
  }
  if ([v8 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v36 = [v8 countByEnumeratingWithState:&v41 objects:v55 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v42;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v42 != v38) {
            objc_enumerationMutation(v8);
          }
          [(CALayer *)v5 addSublayer:[(KPFGingerEvent *)self p_newLayerFromDict:*(void *)(*((void *)&v41 + 1) + 8 * i)]];
        }
        id v37 = [v8 countByEnumeratingWithState:&v41 objects:v55 count:16];
      }
      while (v37);
    }
  }
  return v5;
}

- (void)animateWithSession:(id)a3
{
  if (objc_msgSend(-[KPFGingerEvent p_effectsArray](self, "p_effectsArray"), "count"))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(KPFGingerEvent *)self p_effectsArray];
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          float v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          [v10 renderEffectWithSession:a3 withSwappableLayersDict:self->mSwappableLayersDict];
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_1248B0;
          v12[3] = &unk_456DE0;
          v12[4] = self;
          [v10 setAnimationEndHandler:v12];
          [v10 animateWithSession:a3];
          ++self->mAnimationsStarted;
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v11 = (void (*)(void))*((void *)self->mAnimationEndHandler + 2);
    v11();
  }
}

- (id)hyperlinksRectArray
{
  id v3 = +[NSMutableArray array];
  id v4 = [(KPFGingerEvent *)self p_hyperlinksArray];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) objectForKeyedSubscript:@"targetRectangle"]);
        [v3 addObject:[NSValue valueWithCGRect:]];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)hyperlinkAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [[self p_hyperlinksArray] reverseObjectEnumerator];
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
        -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [v11 objectForKey:@"targetRectangle"]);
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
  id obj = [(NSDictionary *)self->mEventsDictionary objectForKey:@"accessibility"];
  id v4 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v7);
        v21[0] = @"targetRectangle";
        -[KPFGingerEvent p_rectFromDictionary:](self, "p_rectFromDictionary:", [v8 objectForKey:@"targetRectangle"]);
        v16[0] = v9;
        v16[1] = v10;
        v16[2] = v11;
        v16[3] = v12;
        long long v13 = +[NSValue valueWithBytes:v16 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        v21[1] = @"text";
        v22[0] = v13;
        v22[1] = [v8 objectForKey:@"text"];
        [v3 addObject:[NSDictionary dictionaryWithObjects:forKeys:count:v22, v21, 2]];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
  return v3;
}

- (BOOL)containsMovie
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(KPFGingerEvent *)self p_effectsArray];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) containsMovie])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (BOOL)isMoviePlaying
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(KPFGingerEvent *)self p_effectsArray];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) isMoviePlaying])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (void)pauseMoviePlayback
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(KPFGingerEvent *)self p_effectsArray];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) pauseMoviePlayback];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)resumeMoviePlayback
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(KPFGingerEvent *)self p_effectsArray];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) resumeMoviePlayback];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stopMoviePlayback
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(KPFGingerEvent *)self p_effectsArray];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) stopMoviePlayback];
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)tearDown
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mEffectsArraCGFloat y = self->mEffectsArray;
  id v4 = [(NSMutableArray *)mEffectsArray countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mEffectsArray);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) tearDown];
      }
      id v5 = [(NSMutableArray *)mEffectsArray countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->mEffectsArraCGFloat y = 0;
  self->mSwappableLayersDict = 0;

  self->mMovietoLayerMap = 0;
}

- (BOOL)isAnimating
{
  return self->mAnimationsStarted != 0;
}

- (BOOL)isAutomatic
{
  return self->_isAutomatic;
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

- (id)p_hyperlinksArray
{
  id result = self->mEventsDictionary;
  if (result) {
    return [result objectForKey:@"hyperlinks"];
  }
  return result;
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
  id result = (CGAffineTransform *)objc_msgSend(objc_msgSend(a4, "objectAtIndex:", 5), "floatValue");
  retstr->a = v7;
  retstr->b = v9;
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

- (id)p_effectsArray
{
  if (!self->mEventsDictionary) {
    return 0;
  }
  if (!self->mEffectsArray)
  {
    self->mEffectsArraCGFloat y = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v3 = [(NSDictionary *)self->mEventsDictionary objectForKey:@"effects"];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = [[KPFGingerEffect alloc] initWithEffectDict:*(void *)(*((void *)&v10 + 1) + 8 * i)];
          if (![(NSString *)[(KPFGingerEffect *)v8 name] isEqualToString:@"none"]
            || ![(NSString *)[(KPFGingerEffect *)v8 type] isEqualToString:@"transition"])
          {
            [(NSMutableArray *)self->mEffectsArray addObject:v8];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  return self->mEffectsArray;
}

@end