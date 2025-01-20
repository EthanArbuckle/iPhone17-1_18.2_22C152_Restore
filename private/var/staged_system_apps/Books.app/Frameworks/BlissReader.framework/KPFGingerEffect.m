@interface KPFGingerEffect
- (BOOL)containsMovie;
- (BOOL)isMoviePlaying;
- (CALayer)baseLayer;
- (CALayer)layer;
- (CATransform3D)p_transformFromArray:(SEL)a3;
- (CGAffineTransform)p_affineTransformFromArray:(SEL)a3;
- (CGColor)p_colorFromArray:(id)a3;
- (CGPath)p_newPathFromArray:(id)a3;
- (CGRect)p_rectFromDictionary:(id)a3;
- (KPFGingerEffect)initWithEffectDict:(id)a3;
- (NSDictionary)baseLayerDict;
- (NSMutableArray)children;
- (NSMutableArray)textures;
- (NSString)name;
- (NSString)objectID;
- (NSString)textureToBeAnimated;
- (NSString)type;
- (id)p_basicAnimationFromAnimationDict:(id)a3 forLayer:(id)a4;
- (id)p_fillModefromDictionary:(id)a3;
- (id)p_groupedlLayerAnimationsFromAnimationDictionary:(id)a3 forLayer:(id)a4;
- (id)p_keyframeAnimationFromAnimationDict:(id)a3 forLayer:(id)a4;
- (id)p_newLayerFromDict:(id)a3;
- (id)p_propertyValueFromDictionary:(id)a3 forLayer:(id)a4 forAction:(id)a5;
- (id)p_timingFunctionFromString:(id)a3 forActionDictionary:(id)a4;
- (void)animateWithSession:(id)a3;
- (void)animationDidEnd;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)p_animateSubEffect:(id)a3;
- (void)p_createSubEffectsFromDict:(id)a3;
- (void)p_glAnimationEndCallback;
- (void)p_setupAndAnimateGLAnimationsFromAttributesDict:(id)a3;
- (void)p_subAnimationEnded;
- (void)pauseMoviePlayback;
- (void)renderEffectWithSession:(id)a3 withSwappableLayersDict:(id)a4;
- (void)resumeMoviePlayback;
- (void)setAnimationEndHandler:(id)a3;
- (void)stopMoviePlayback;
- (void)tearDown;
@end

@implementation KPFGingerEffect

- (KPFGingerEffect)initWithEffectDict:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)KPFGingerEffect;
  v4 = [(KPFGingerEffect *)&v17 init];
  if (v4)
  {
    v4->mEffectDict = (NSDictionary *)a3;
    v4->mChildren = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mBaseLayerDict = (NSDictionary *)[a3 objectForKey:@"baseLayer"];
    v4->mName = (NSString *)[a3 objectForKey:@"name"];
    v4->mType = (NSString *)[a3 objectForKey:@"type"];
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"beginTime"), "floatValue");
    v4->mBeginTime = v5;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duration"), "floatValue");
    v4->mDuration = v6;
    v4->mChildrenArray = (NSArray *)[a3 objectForKey:@"effects"];
    v4->mMovieDict = (NSDictionary *)[a3 objectForKey:@"movie"];
    v4->mObjectID = (NSString *)[a3 objectForKey:@"objectID"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    mChildrenArray = v4->mChildrenArray;
    id v8 = [(NSArray *)mChildrenArray countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(mChildrenArray);
          }
          [(KPFGingerEffect *)v4 p_createSubEffectsFromDict:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        id v9 = [(NSArray *)mChildrenArray countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return v4;
}

- (void)dealloc
{
  self->mBuildRenderer = 0;
  self->mTransitionRenderer = 0;
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerEffect;
  [(KPFGingerEffect *)&v3 dealloc];
}

- (void)setAnimationEndHandler:(id)a3
{
  self->mAnimationEndHandler = [a3 copy];
}

- (void)p_createSubEffectsFromDict:(id)a3
{
  if (a3)
  {
    v4 = [[KPFGingerEffect alloc] initWithEffectDict:a3];
    [(NSMutableArray *)self->mChildren addObject:v4];
  }
}

- (void)renderEffectWithSession:(id)a3 withSwappableLayersDict:(id)a4
{
  self->mKPFSession = (KPFSession *)a3;
  self->mSwappableLayersDict = (NSMutableDictionary *)a4;
  self->mAnimationDict = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);

  self->mTextures = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (self->mMovieDict && !self->mBaseLayerDict)
  {
    [(KPFGingerSlide *)[self->mKPFSession currentSlide] newMovieForTextureName:0 movieDict:self->mMovieDict withObjectID:[(KPFGingerEffect *)self objectID]];
    goto LABEL_14;
  }
  self->_baseLayer = (CALayer *)[(KPFGingerEffect *)self p_newLayerFromDict:[(KPFGingerEffect *)self baseLayerDict]];
  if (![(KPFGingerEffect *)self objectID]) {
    goto LABEL_11;
  }
  if (!self->mMovieDict)
  {
    id v5 = [(KPFGingerSlide *)[self->mKPFSession currentSlide] movieForObjectID:[(KPFGingerEffect *)self objectID]];
    if (v5)
    {
      float v6 = v5;
      id v7 = [(NSArray *)[(CALayer *)self->_baseLayer sublayers] objectAtIndexedSubscript:0];
      id v8 = v7;
      if (v7)
      {
        [v7 affineTransform];
      }
      else
      {
        long long v15 = 0u;
        long long v16 = 0u;
        long long v14 = 0u;
      }
      id v9 = [v6 playerLayer];
      v13[0] = v14;
      v13[1] = v15;
      v13[2] = v16;
      [v9 setAffineTransform:v13];
      [v8 anchorPoint];
      objc_msgSend(objc_msgSend(v6, "playerLayer"), "setAnchorPoint:", v10, v11);
      -[CALayer insertSublayer:atIndex:](self->_baseLayer, "insertSublayer:atIndex:", [v6 playerLayer], 1);
    }
LABEL_11:
    if (!self->mMovieDict) {
      goto LABEL_14;
    }
  }
  id v12 = [(KPFGingerSlide *)[self->mKPFSession currentSlide] movieForObjectID:[(KPFGingerEffect *)self objectID]];
  if (v12) {
    -[CALayer insertSublayer:atIndex:](self->_baseLayer, "insertSublayer:atIndex:", [v12 playerLayer], 1);
  }
LABEL_14:
  +[CATransaction commit];
  self->mAnimationsStarted = 0;
}

- (id)p_newLayerFromDict:(id)a3
{
  id v5 = +[CALayer layer];
  float v6 = (NSString *)[a3 objectForKey:@"texture"];
  id v7 = [a3 objectForKey:@"initialState"];
  id v8 = [a3 objectForKey:@"layers"];
  id v9 = [a3 objectForKey:@"objectID"];
  if (v9)
  {
    id v10 = [(NSMutableDictionary *)self->mSwappableLayersDict objectForKey:v9];
    if (v10)
    {
      double v11 = v10;
      id v12 = [v10 superlayer];
      id v13 = [v11 superlayer];
      if (v12) {
        [v13 replaceSublayer:v11 with:v5];
      }
    }
    [(NSMutableDictionary *)self->mSwappableLayersDict setObject:v5 forKey:v9];
  }
  -[CALayer setMasksToBounds:](v5, "setMasksToBounds:", objc_msgSend(objc_msgSend(v7, "objectForKey:", @"masksToBounds"), "BOOLValue"));
  -[CALayer setHidden:](v5, "setHidden:", objc_msgSend(objc_msgSend(v7, "objectForKey:", @"hidden"), "BOOLValue"));
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"zIndex"), "floatValue");
  [(CALayer *)v5 setZPosition:v14];
  [(CALayer *)v5 setDoubleSided:0];
  [(CALayer *)v5 setEdgeAntialiasingMask:0];
  id v15 = [v7 objectForKey:@"anchorPoint"];
  objc_msgSend(objc_msgSend(v15, "objectForKey:", @"pointX"), "floatValue");
  double v17 = v16;
  objc_msgSend(objc_msgSend(v15, "objectForKey:", @"pointY"), "floatValue");
  -[CALayer setAnchorPoint:](v5, "setAnchorPoint:", v17, v18);
  id v19 = [v7 objectForKey:@"position"];
  objc_msgSend(objc_msgSend(v19, "objectForKey:", @"pointX"), "floatValue");
  double v21 = v20;
  objc_msgSend(objc_msgSend(v19, "objectForKey:", @"pointY"), "floatValue");
  -[CALayer setPosition:](v5, "setPosition:", v21, v22);
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"width"), "floatValue");
  double v24 = v23;
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"height"), "floatValue");
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, v24, v25);
  id v26 = [v7 objectForKey:@"sublayerTransform"];
  if (self)
  {
    [(KPFGingerEffect *)self p_transformFromArray:v26];
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
  }
  v70[4] = v75;
  v70[5] = v76;
  v70[6] = v77;
  v70[7] = v78;
  v70[0] = v71;
  v70[1] = v72;
  v70[2] = v73;
  v70[3] = v74;
  [(CALayer *)v5 setSublayerTransform:v70];
  id v27 = [v7 objectForKey:@"affineTransform"];
  if (self) {
    [(KPFGingerEffect *)self p_affineTransformFromArray:v27];
  }
  else {
    memset(v69, 0, sizeof(v69));
  }
  [(CALayer *)v5 setAffineTransform:v69];
  -[KPFGingerEffect p_rectFromDictionary:](self, "p_rectFromDictionary:", [v7 objectForKey:@"contentsRect"]);
  -[CALayer setContentsRect:](v5, "setContentsRect:");
  objc_msgSend(objc_msgSend(v7, "objectForKey:", @"opacity"), "floatValue");
  -[CALayer setOpacity:](v5, "setOpacity:");
  id v28 = [v7 objectForKey:@"backgroundColor"];
  if (v28) {
    [(CALayer *)v5 setBackgroundColor:[(KPFGingerEffect *)self p_colorFromArray:v28]];
  }
  id v29 = [v7 objectForKey:@"opacityMultiplier"];
  if (v29)
  {
    v30 = v29;
    [(CALayer *)v5 opacity];
    float v32 = v31;
    [v30 floatValue];
    *(float *)&double v34 = v32 * v33;
    [(CALayer *)v5 setOpacity:v34];
  }
  mKPFSession = self->mKPFSession;
  if (mKPFSession && v6)
  {
    [(CALayer *)v5 setContents:[mKPFSession CGImageForTextureName:v6]];
    [(CALayer *)v5 setName:v6];
    [(NSMutableArray *)self->mTextures addObject:v6];
  }
  if (v9) {
    [(CALayer *)v5 setName:v9];
  }
  id v36 = [a3 objectForKey:@"animations"];
  v37 = self->mKPFSession;
  if (v37)
  {
    if (!self->mMovie)
    {
      if (self->mMovieDict)
      {
        if (v6)
        {
          if ([(KPFSession *)v37 movieNameForTextureName:v6])
          {
            if ([(NSString *)[(KPFGingerEffect *)self name] isEqualToString:@"renderMovie"])
            {
              if (![(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"buildOut"])
              {
                [(KPFGingerSlide *)[self->mKPFSession currentSlide] newMovieForTextureName:v6 movieDict:self->mMovieDict withObjectID:[(KPFGingerEffect *)self objectID]];
                id v43 = [(KPFGingerSlide *)[self->mKPFSession currentSlide] movieForObjectID:[(KPFGingerEffect *)self objectID]];
                if (v43)
                {
                  id v44 = [v43 playerLayer];
                  [self->mKPFSession textureSizeForName:v6];
                  [v44 setBounds:0.0, 0.0, v45, v46];
                  [(CALayer *)v5 anchorPoint];
                  [v44 setAnchorPoint:];
                  [(CALayer *)v5 position];
                  [v44 setPosition:];
                  if (v5)
                  {
                    [(CALayer *)v5 sublayerTransform];
                  }
                  else
                  {
                    long long v67 = 0u;
                    long long v68 = 0u;
                    long long v65 = 0u;
                    long long v66 = 0u;
                    long long v63 = 0u;
                    long long v64 = 0u;
                    long long v61 = 0u;
                    long long v62 = 0u;
                  }
                  v60[4] = v65;
                  v60[5] = v66;
                  v60[6] = v67;
                  v60[7] = v68;
                  v60[0] = v61;
                  v60[1] = v62;
                  v60[2] = v63;
                  v60[3] = v64;
                  [v44 setSublayerTransform:v60];
                  [(CALayer *)v5 opacity];
                  [v44 setOpacity:];
                  [(CALayer *)v5 zPosition];
                  [v44 setZPosition:];
                  if (v5)
                  {
                    [(CALayer *)v5 transform];
                  }
                  else
                  {
                    long long v58 = 0u;
                    long long v59 = 0u;
                    long long v56 = 0u;
                    long long v57 = 0u;
                    long long v54 = 0u;
                    long long v55 = 0u;
                    long long v52 = 0u;
                    long long v53 = 0u;
                  }
                  v51[4] = v56;
                  v51[5] = v57;
                  v51[6] = v58;
                  v51[7] = v59;
                  v51[0] = v52;
                  v51[1] = v53;
                  v51[2] = v54;
                  v51[3] = v55;
                  [v44 setTransform:v51];
                  [v44 setValue:v5 forKey:@"textureLayer"];
                  [(CALayer *)v5 setValue:v44 forKey:@"movieLayer"];
                  [(CALayer *)v5 setHidden:0];
                }
              }
            }
          }
        }
      }
    }
  }
  if ([v36 count])
  {
    [(TSURetainedPointerKeyDictionary *)self->mAnimationDict setObject:v36 forUncopiedKey:v5];
    self->_layer = v5;
    self->_textureToBeAnimated = v6;
  }
  if ([v8 count])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v38 = [v8 countByEnumeratingWithState:&v47 objects:v79 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v48;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v48 != v40) {
            objc_enumerationMutation(v8);
          }
          [(CALayer *)v5 addSublayer:[(KPFGingerEffect *)self p_newLayerFromDict:*(void *)(*((void *)&v47 + 1) + 8 * i)]];
        }
        id v39 = [v8 countByEnumeratingWithState:&v47 objects:v79 count:16];
      }
      while (v39);
    }
  }
  return v5;
}

- (id)p_basicAnimationFromAnimationDict:(id)a3 forLayer:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v7 = [a3 objectForKey:@"property"];
  if (([v7 isEqualToString:@"transform.rotation.y"] & 1) != 0
    || [v7 isEqualToString:@"transform.translation.z"])
  {
    self->mRequiresPerspectiveTransform = 0;
  }
  id v8 = +[CABasicAnimation animationWithKeyPath:v7];
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"beginTime"), "floatValue");
  [(CABasicAnimation *)v8 setBeginTime:v9];
  if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"transition"])
  {
    [(CABasicAnimation *)v8 beginTime];
    [(CABasicAnimation *)v8 setBeginTime:v10 + self->mBeginTime];
  }
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duration"), "floatValue");
  [(CABasicAnimation *)v8 setDuration:v11];
  -[CABasicAnimation setFromValue:](v8, "setFromValue:", -[KPFGingerEffect p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", [a3 objectForKey:@"from"], a4, v7));
  -[CABasicAnimation setToValue:](v8, "setToValue:", -[KPFGingerEffect p_propertyValueFromDictionary:forLayer:forAction:](self, "p_propertyValueFromDictionary:forLayer:forAction:", [a3 objectForKey:@"to"], a4, v7));
  if ([a3 objectForKey:@"timingFunction"]) {
    -[CABasicAnimation setTimingFunction:](v8, "setTimingFunction:", -[KPFGingerEffect p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", [a3 objectForKey:@"timingFunction"], a3));
  }
  [(CABasicAnimation *)v8 setFillMode:[(KPFGingerEffect *)self p_fillModefromDictionary:a3]];
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"repeatCount"), "floatValue");
  -[CABasicAnimation setRepeatCount:](v8, "setRepeatCount:");
  return v8;
}

- (id)p_keyframeAnimationFromAnimationDict:(id)a3 forLayer:(id)a4
{
  id v7 = [a3 objectForKey:@"property"];
  id v8 = +[CAKeyframeAnimation animationWithKeyPath:v7];
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"beginTime"), "floatValue");
  [(CAKeyframeAnimation *)v8 setBeginTime:v9];
  if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"transition"])
  {
    [(CAKeyframeAnimation *)v8 beginTime];
    [(CAKeyframeAnimation *)v8 setBeginTime:v10 + self->mBeginTime];
  }
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"duration"), "floatValue");
  [(CAKeyframeAnimation *)v8 setDuration:v11];
  [(CAKeyframeAnimation *)v8 setFillMode:[(KPFGingerEffect *)self p_fillModefromDictionary:a3]];
  id v12 = [a3 objectForKey:@"path"];
  if (v12)
  {
    id v13 = v12;
    if ([v12 count])
    {
      float v14 = [(KPFGingerEffect *)self p_newPathFromArray:v13];
      [(CAKeyframeAnimation *)v8 setPath:v14];
      CGPathRelease(v14);
    }
  }
  id v15 = [a3 objectForKey:@"keyTimes"];
  if (v15)
  {
    id v16 = v15;
    if ([v15 count])
    {
      v30 = v8;
      id v31 = a3;
      id v17 = [a3 objectForKey:@"timingFunctions"];
      id v18 = +[NSMutableArray array];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v19 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v37;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v37 != v21) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(v18, "addObject:", -[KPFGingerEffect p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "objectForKey:", @"timingFunction"), *(void *)(*((void *)&v36 + 1) + 8 * i)));
          }
          id v20 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v20);
      }
      id v23 = [v31 objectForKey:@"values"];
      id v24 = +[NSMutableArray array];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v33;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(v23);
            }
            [v24 addObject:[self p_propertyValueFromDictionary:forLayer:forAction:](*(void *)(*((void *)&v32 + 1) + 8 * (void)j), a4, v7)];
          }
          id v26 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v26);
      }
      id v8 = v30;
      [(CAKeyframeAnimation *)v30 setKeyTimes:v16];
      [(CAKeyframeAnimation *)v30 setTimingFunctions:v18];
      [(CAKeyframeAnimation *)v30 setValues:v24];
      objc_msgSend(objc_msgSend(v31, "objectForKey:", @"repeatCount"), "floatValue");
      -[CAKeyframeAnimation setRepeatCount:](v30, "setRepeatCount:");
    }
  }
  return v8;
}

- (id)p_groupedlLayerAnimationsFromAnimationDictionary:(id)a3 forLayer:(id)a4
{
  if ([a3 objectForKey:@"keyTimes"] || objc_msgSend(a3, "objectForKey:", @"path"))
  {
    return [(KPFGingerEffect *)self p_keyframeAnimationFromAnimationDict:a3 forLayer:a4];
  }
  else
  {
    return [(KPFGingerEffect *)self p_basicAnimationFromAnimationDict:a3 forLayer:a4];
  }
}

- (void)p_setupAndAnimateGLAnimationsFromAttributesDict:(id)a3
{
  id v5 = [self->mKPFSession animationRegistry];
  if ([(KPFGingerAnimationRegistry *)v5 containsEffect:[(KPFGingerEffect *)self name] ofType:[(KPFGingerEffect *)self type]])
  {
    float v6 = [(KPFGingerAnimationRegistry *)v5 effectClassWithName:[(KPFGingerEffect *)self name] andType:[(KPFGingerEffect *)self type]];
    if (v6)
    {
      id v7 = v6;
      id v8 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"direction"), "unsignedIntegerValue");
      double mBeginTime = self->mBeginTime;
      double mDuration = self->mDuration;
      if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"transition"])
      {
        float v11 = [[KPFMTLTransitionRenderer alloc] initWithEffectClass:v7 direction:v8 duration:self effect:self->mKPFSession session:mDuration];
        self->mTransitionRenderer = (KPFTransitionProtocol *)v11;
        [(KPFMTLTransitionRenderer *)v11 registerForTransitionEndCallback:"p_glAnimationEndCallback" target:self];
        ++self->mAnimationsStarted;
        mTransitionRenderer = self->mTransitionRenderer;
        [(KPFTransitionProtocol *)mTransitionRenderer animateWithDelay:mBeginTime];
      }
      else if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"buildIn"]|| [(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"buildOut"])
      {
        if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"buildIn"]) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 2;
        }
        self->mTransitionRenderer = 0;
        LOWORD(v18) = 0;
        LOBYTE(v17) = 0;
        id v14 = +[KNAnimatedBuild createWithBuildType:attributes:direction:effect:deliveryStyle:stageCount:eventIndex:stageIndex:startTime:eventStartTime:duration:automatic:renderer:animateAtEndOfPreviousBuild:isEmphasisBuild:](KNAnimatedBuild, "createWithBuildType:attributes:direction:effect:deliveryStyle:stageCount:eventIndex:stageIndex:startTime:eventStartTime:duration:automatic:renderer:animateAtEndOfPreviousBuild:isEmphasisBuild:", v13, a3, v8, [(KPFGingerEffect *)self name], 0, 0, mBeginTime, mBeginTime, mDuration, 0, 0, v17, 0, v18);
        id v15 = [[KPFMTLBuildRenderer alloc] initWithEffectClass:v7 direction:v8 duration:self effect:self->mKPFSession session:mDuration];
        self->mBuildRenderer = (KPFBuildProtocol *)v15;
        [(KPFMTLBuildRenderer *)v15 setAnimatedBuild:v14];
        [(KPFBuildProtocol *)self->mBuildRenderer registerForBuildEndCallback:"p_glAnimationEndCallback" target:self];
        ++self->mAnimationsStarted;
        mBuildRenderer = self->mBuildRenderer;
        [(KPFBuildProtocol *)mBuildRenderer animateAfterDelay:mBeginTime];
      }
    }
  }
}

- (void)animateWithSession:(id)a3
{
  self->mKPFSession = (KPFSession *)a3;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v5 = [(NSDictionary *)self->mEffectDict objectForKey:@"attributes"];
  float v6 = [self->mKPFSession animationRegistry];
  mMovieDict = self->mMovieDict;
  id v8 = [(KPFGingerEffect *)self name];
  if (mMovieDict)
  {
    if ([(NSString *)v8 isEqualToString:@"renderMovie"])
    {
      id v9 = [a3 currentSlide];
      double v10 = [(KPFGingerEffect *)self objectID];
      [self->mEffectDict objectForKeyedSubscript:@"beginTime"] floatValue];
      [v9 playMovieForObjectID:v10 afterDelay:v11];
    }
  }
  else if (([(NSString *)v8 isEqualToString:@"apple:movie-start"] {
          || [(NSString *)[(KPFGingerEffect *)self name] isEqualToString:@"apple:audio-start"])&& [(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"buildOut"])
  }
  {
    objc_msgSend(objc_msgSend(a3, "currentSlide"), "stopMovieForObjectID:", -[KPFGingerEffect objectID](self, "objectID"));
  }
  else if (![(NSString *)[(KPFGingerEffect *)self name] isEqualToString:@"apple:audio-start"]|| ![(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"buildIn"])
  {
    if ([(KPFGingerAnimationRegistry *)v6 containsEffect:[(KPFGingerEffect *)self name] ofType:[(KPFGingerEffect *)self type]]&& v5&& [(NSMutableArray *)self->mTextures count])
    {
      id v12 = [[self->mTextures reverseObjectEnumerator] allObjects];
      [(NSMutableArray *)self->mTextures removeAllObjects];
      [(NSMutableArray *)self->mTextures addObjectsFromArray:v12];
      [(KPFGingerEffect *)self p_setupAndAnimateGLAnimationsFromAttributesDict:v5];
    }
    else
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = [(TSURetainedPointerKeyDictionary *)self->mAnimationDict allKeys];
      id v36 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v36)
      {
        uint64_t v35 = *(void *)v50;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(obj);
            }
            uint64_t v37 = v13;
            id v14 = *(void **)(*((void *)&v49 + 1) + 8 * v13);
            id v15 = [(TSURetainedPointerKeyDictionary *)self->mAnimationDict objectForKey:v14];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v38 = v15;
            id v40 = [v15 countByEnumeratingWithState:&v45 objects:v54 count:16];
            if (v40)
            {
              uint64_t v39 = *(void *)v46;
              do
              {
                for (i = 0; i != v40; i = (char *)i + 1)
                {
                  if (*(void *)v46 != v39) {
                    objc_enumerationMutation(v38);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
                  self->mRequiresPerspectiveTransform = 0;
                  id v18 = [v17 objectForKey:@"animations"];
                  id v19 = [v18 count];
                  id v20 = +[NSMutableArray array];
                  if (v19)
                  {
                    long long v43 = 0u;
                    long long v44 = 0u;
                    long long v41 = 0u;
                    long long v42 = 0u;
                    id v21 = [v18 countByEnumeratingWithState:&v41 objects:v53 count:16];
                    if (v21)
                    {
                      id v22 = v21;
                      uint64_t v23 = *(void *)v42;
                      do
                      {
                        for (j = 0; j != v22; j = (char *)j + 1)
                        {
                          if (*(void *)v42 != v23) {
                            objc_enumerationMutation(v18);
                          }
                          [v20 addObject:[self p_groupedlLayerAnimationsFromAnimationDictionary:forLayer:*(void *)(*((void *)&v41 + 1) + 8 * (void)j), v14]];
                        }
                        id v22 = [v18 countByEnumeratingWithState:&v41 objects:v53 count:16];
                      }
                      while (v22);
                    }
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", @"beginTime"), "floatValue");
                    double v26 = v25;
                    if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"transition"])
                    {
                      double v26 = self->mBeginTime + v26;
                    }
                    id v27 = +[CAAnimationGroup animation];
                    [v27 setAnimations:v20];
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", @"duration"), "floatValue");
                    [v27 setDuration:v26 + v28];
                    [v27 setFillMode:kCAFillModeForwards];
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", @"repeatCount"), "floatValue");
                    [v27 setRepeatCount:];
                    if ([v17 objectForKey:@"timingFunction"]) {
                      objc_msgSend(v27, "setTimingFunction:", -[KPFGingerEffect p_timingFunctionFromString:forActionDictionary:](self, "p_timingFunctionFromString:forActionDictionary:", objc_msgSend(v17, "objectForKey:", @"timingFunction"), v17));
                    }
                    [v27 setDelegate:self];
                    [v27 setRemovedOnCompletion:0];
                    [v27 setValue:v14 forKey:@"layer"];
                    id v29 = [(NSString *)[v20 objectAtIndex:0] keyPath];
                  }
                  else
                  {
                    [v20 addObject:[self p_groupedlLayerAnimationsFromAnimationDictionary:v17 forLayer:v14]];
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", @"beginTime"), "floatValue");
                    double v31 = v30;
                    if ([(NSString *)[(KPFGingerEffect *)self type] isEqualToString:@"transition"])
                    {
                      double v31 = self->mBeginTime + v31;
                    }
                    id v27 = +[CAAnimationGroup animation];
                    [v27 setAnimations:v20];
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", @"duration"), "floatValue");
                    [v27 setDuration:v31 + v32];
                    objc_msgSend(objc_msgSend(v17, "objectForKey:", @"repeatCount"), "floatValue");
                    [v27 setRepeatCount:];
                    [v27 setFillMode:kCAFillModeForwards];
                    [v27 setDelegate:self];
                    [v27 setRemovedOnCompletion:0];
                    [v27 setValue:v14 forKey:@"layer"];
                    id v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@", [v17 objectForKey:@"property"]);
                  }
                  long long v33 = v29;
                  if (![v14 animationForKey:v29]) {
                    ++self->mAnimationsStarted;
                  }
                  [v14 addAnimation:v27 forKey:v33];
                }
                id v40 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
              }
              while (v40);
            }
            uint64_t v13 = v37 + 1;
          }
          while ((id)(v37 + 1) != v36);
          id v36 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v36);
      }
    }
  }
  +[CATransaction commit];
  if (!self->mAnimationsStarted) {
    [(KPFGingerEffect *)self animationDidEnd];
  }
}

- (BOOL)containsMovie
{
  BOOL v2 = self->mMovieDict != 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(KPFGingerEffect *)self children];
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) containsMovie]) {
          return 1;
        }
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    return 0;
  }
  return v2;
}

- (BOOL)isMoviePlaying
{
  mMovie = self->mMovie;
  if (mMovie) {
    unsigned __int8 v4 = [(KPFMovie *)mMovie isPlaying];
  }
  else {
    unsigned __int8 v4 = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(KPFGingerEffect *)self children];
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) isMoviePlaying]) {
          return 1;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    return 0;
  }
  return v4;
}

- (void)stopMoviePlayback
{
  mMovie = self->mMovie;
  if (mMovie)
  {
    if ([(KPFMovie *)mMovie isPlaying]) {
      [(KPFMovie *)self->mMovie stop];
    }
    [(KPFGingerEffect *)self animationDidEnd];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v4 = [(KPFGingerEffect *)self children];
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) stopMoviePlayback];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)pauseMoviePlayback
{
  if ([(KPFGingerEffect *)self isMoviePlaying]) {
    [(KPFMovie *)self->mMovie pause];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v3 = [(KPFGingerEffect *)self children];
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) pauseMoviePlayback];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)resumeMoviePlayback
{
  if ([(KPFGingerEffect *)self isMoviePlaying]) {
    [(KPFMovie *)self->mMovie resume];
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v3 = [(KPFGingerEffect *)self children];
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) resumeMoviePlayback];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)tearDown
{
  mTransitionRenderer = self->mTransitionRenderer;
  if (mTransitionRenderer)
  {
    [(KPFTransitionProtocol *)mTransitionRenderer removeAnimations];
    [(KPFTransitionProtocol *)self->mTransitionRenderer teardown];
  }
  mBuildRenderer = self->mBuildRenderer;
  if (mBuildRenderer)
  {
    [(KPFBuildProtocol *)mBuildRenderer stopAnimations];
    [(KPFBuildProtocol *)self->mBuildRenderer teardown];
  }
  mMovie = self->mMovie;
  if (mMovie) {
    [(KPFMovie *)mMovie stop];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(TSURetainedPointerKeyDictionary *)self->mAnimationDict allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) removeAllAnimations];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  self->mAnimationDict = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = [(KPFGingerEffect *)self children];
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v15) tearDown];
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
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
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)p_animateSubEffect:(id)a3
{
  [a3 renderEffectWithSession:self->mKPFSession withSwappableLayersDict:self->mSwappableLayersDict];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B540;
  v5[3] = &unk_456DE0;
  v5[4] = self;
  [a3 setAnimationEndHandler:v5];
  if (([a3 containsMovie] & 1) == 0) {
    ++self->mAnimationsStarted;
  }
  [a3 animateWithSession:self->mKPFSession];
}

- (void)p_glAnimationEndCallback
{
  unint64_t mAnimationsStarted = self->mAnimationsStarted;
  if (mAnimationsStarted) {
    self->unint64_t mAnimationsStarted = mAnimationsStarted - 1;
  }
  [(KPFGingerEffect *)self animationDidEnd];
}

- (void)p_subAnimationEnded
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

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    unint64_t mAnimationsStarted = self->mAnimationsStarted;
    if (!mAnimationsStarted || (unint64_t v5 = mAnimationsStarted - 1, (self->mAnimationsStarted = v5) == 0)) {
      [(KPFGingerEffect *)self animationDidEnd];
    }
  }
}

- (void)animationDidEnd
{
  if ([(NSMutableArray *)[(KPFGingerEffect *)self children] count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v3 = [(KPFGingerEffect *)self children];
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          [(KPFGingerEffect *)self p_animateSubEffect:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else if (!self->mAnimationsStarted)
  {
    id mAnimationEndHandler = self->mAnimationEndHandler;
    if (mAnimationEndHandler)
    {
      double v9 = (void (*)(void))*((void *)mAnimationEndHandler + 2);
      v9();
    }
  }
}

- (id)p_fillModefromDictionary:(id)a3
{
  id v3 = [a3 objectForKey:@"fillMode"];
  if ([v3 isEqualToString:@"both"])
  {
    id v4 = (id *)&kCAFillModeBoth;
  }
  else if ([v3 isEqualToString:@"forwards"])
  {
    id v4 = (id *)&kCAFillModeForwards;
  }
  else
  {
    unsigned int v5 = [v3 isEqualToString:@"backwards"];
    id v4 = (id *)&kCAFillModeRemoved;
    if (v5) {
      id v4 = (id *)&kCAFillModeBackwards;
    }
  }
  return *v4;
}

- (CGPath)p_newPathFromArray:(id)a3
{
  Mutable = CGPathCreateMutable();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a3;
  id v22 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        id v7 = [v6 objectForKey:@"points"];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              if (objc_msgSend(objc_msgSend(v6, "objectForKey:", @"type"), "isEqualToString:", @"MoveToPoint"))
              {
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "floatValue");
                CGFloat v14 = v13;
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 1), "floatValue");
                CGPathMoveToPoint(Mutable, 0, v14, v15);
              }
              else if (objc_msgSend(objc_msgSend(v6, "objectForKey:", @"type"), "isEqualToString:", @"AddLine"))
              {
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 0), "floatValue");
                CGFloat v17 = v16;
                objc_msgSend(objc_msgSend(v12, "objectAtIndex:", 1), "floatValue");
                CGPathAddLineToPoint(Mutable, 0, v17, v18);
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v9);
        }
        uint64_t v5 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }
  return Mutable;
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
    || ([a5 isEqualToString:@"translation.z"] & 1) != 0
    || ([a5 isEqualToString:@"transform.scale.xy"] & 1) != 0
    || ([a5 isEqualToString:@"sublayerTransform.rotation.x"] & 1) != 0
    || ([a5 isEqualToString:@"sublayerTransform.rotation.y"] & 1) != 0
    || ([a5 isEqualToString:@"transform.rotation"] & 1) != 0
    || ([a5 isEqualToString:@"opacity"] & 1) != 0
    || ([a5 isEqualToString:@"doubleSided"] & 1) != 0
    || [a5 isEqualToString:@"sublayerTransform.transform.scale"])
  {
    return [a3 objectForKey:@"scalar"];
  }
  if ([a5 isEqualToString:@"transform.translation.x"]
    || [a5 isEqualToString:@"transform.translation.y"]
    || [a5 isEqualToString:@"transform.translation.z"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"scalar"), "floatValue");
LABEL_28:
    return +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  }
  if ([a5 isEqualToString:@"opacityMultiplier"])
  {
    [a4 opacity];
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"scalar"), "floatValue");
    goto LABEL_28;
  }
  if ([a5 isEqualToString:@"translationEmphasis"])
  {
    id v10 = [a3 objectForKey:@"translationEmphasis"];
    [a4 position];
    double v12 = v11;
    double v14 = v13;
    id v15 = [a4 valueForKey:@"addtionalInitialTranslation"];
    if (v15)
    {
      [v15 CGPointValue];
      double v12 = v12 - v16;
      double v14 = v14 - v17;
    }
    objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "floatValue");
    double v19 = v12 + v18;
    objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "floatValue");
    double v21 = v14 + v20;
    double v22 = v19;
    goto LABEL_37;
  }
  if ([a5 isEqualToString:@"rotationEmphasis"])
  {
    id v23 = [a3 objectForKey:@"rotationEmphasis"];
    uint64_t v24 = 6;
LABEL_44:
    return [v23 objectAtIndex:v24];
  }
  if ([a5 isEqualToString:@"scaleEmphasis"])
  {
    id v23 = [a3 objectForKey:@"scaleEmphasis"];
    uint64_t v24 = 3;
    goto LABEL_44;
  }
  if (([a5 isEqualToString:@"transform.translation"] & 1) != 0
    || [a5 isEqualToString:@"anchorPoint"]
    || [a5 isEqualToString:@"position"])
  {
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointX"), "floatValue");
    double v26 = v25;
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointY"), "floatValue");
    double v21 = v27;
    double v22 = v26;
LABEL_37:
    return +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v22, v21);
  }
  if ([a5 isEqualToString:@"transform"])
  {
    memset(&v41, 0, sizeof(v41));
    id v28 = [a3 objectForKey:@"transform"];
    if (self) {
      [(KPFGingerEffect *)self p_transformFromArray:v28];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    if (a4) {
      [a4 transform];
    }
    else {
      memset(&b, 0, sizeof(b));
    }
    CATransform3D v38 = v41;
    CATransform3DConcat(&v40, &v38, &b);
    CATransform3D v41 = v40;
    return +[NSValue valueWithCATransform3D:&v40];
  }
  if ([a5 isEqualToString:@"contents"])
  {
    if (self->mKPFSession)
    {
      id v29 = [a3 objectForKey:@"texture"];
      mKPFSession = self->mKPFSession;
      return [mKPFSession CGImageForTextureName:v29];
    }
    return 0;
  }
  if (![a5 isEqualToString:@"bounds"]) {
    return 0;
  }
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointX"), "floatValue");
  double v32 = v31;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"pointY"), "floatValue");
  double v34 = v33;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"width"), "floatValue");
  double v36 = v35;
  objc_msgSend(objc_msgSend(a3, "objectForKey:", @"height"), "floatValue");

  return +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v32, v34, v36, v37);
}

- (id)p_timingFunctionFromString:(id)a3 forActionDictionary:(id)a4
{
  if ([a3 isEqualToString:@"easeOut"])
  {
    uint64_t v6 = &kCAMediaTimingFunctionEaseOut;
LABEL_14:
    CAMediaTimingFunctionName v18 = *v6;
    return +[CAMediaTimingFunction functionWithName:v18];
  }
  if ([a3 isEqualToString:@"easeIn"])
  {
    uint64_t v6 = &kCAMediaTimingFunctionEaseIn;
    goto LABEL_14;
  }
  if ([a3 isEqualToString:@"easeInEaseOut"])
  {
    uint64_t v6 = &kCAMediaTimingFunctionEaseInEaseOut;
    goto LABEL_14;
  }
  if ([a3 isEqualToString:@"linear"])
  {
    uint64_t v6 = &kCAMediaTimingFunctionLinear;
    goto LABEL_14;
  }
  if (![a3 isEqualToString:@"custom"])
  {
    uint64_t v6 = &kCAMediaTimingFunctionDefault;
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
  retstr->tx = v15;
  retstr->ty = v17;
  return result;
}

- (CGColor)p_colorFromArray:(id)a3
{
  CGRect result = [[TSUColor blackColor] CGColor];
  if (a3)
  {
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "floatValue");
    double v6 = v5;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "floatValue");
    double v8 = v7;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "floatValue");
    double v10 = v9;
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", 3), "floatValue");
    float v12 = +[TSUColor colorWithRed:v6 green:v8 blue:v10 alpha:v11];
    return (CGColor *)[(TSUColor *)v12 CGColor];
  }
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

- (NSDictionary)baseLayerDict
{
  return self->mBaseLayerDict;
}

- (NSMutableArray)children
{
  return self->mChildren;
}

- (NSString)name
{
  return self->mName;
}

- (NSString)type
{
  return self->mType;
}

- (NSMutableArray)textures
{
  return self->mTextures;
}

- (NSString)objectID
{
  return self->mObjectID;
}

- (CALayer)layer
{
  return self->_layer;
}

- (CALayer)baseLayer
{
  return self->_baseLayer;
}

- (NSString)textureToBeAnimated
{
  return self->_textureToBeAnimated;
}

@end