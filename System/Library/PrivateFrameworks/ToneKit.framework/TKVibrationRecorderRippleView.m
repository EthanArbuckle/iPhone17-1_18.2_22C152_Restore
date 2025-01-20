@interface TKVibrationRecorderRippleView
- (BOOL)_isTouchDown;
- (TKVibrationRecorderRippleView)init;
- (TKVibrationRecorderRippleView)initWithStyleProvider:(id)a3;
- (double)_currentSpeed;
- (double)fadeOutRadius;
- (double)fingerMovingSpeed;
- (double)fingerStillSpeed;
- (double)firstRippleInitialRadius;
- (id)_reusableRingLayer;
- (id)_reusableTouchContextObject;
- (void)_enqueueReusableRingLayer:(id)a3;
- (void)_enqueueReusableTouchContextObject:(id)a3;
- (void)_enqueueRingLayerWithTimeIntervalSinceCreation:(double)a3 normalizedLocation:(CGPoint)a4 speed:(double)a5;
- (void)_refresh:(id)a3;
- (void)_startAnimation;
- (void)_stopAnimation;
- (void)_touchBeganAtLocation:(CGPoint)a3;
- (void)_touchEndedAtLocation:(CGPoint)a3;
- (void)_touchMovedToLocation:(CGPoint)a3;
- (void)_updateRingEnlargementAnimation;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFadeOutRadius:(double)a3;
- (void)setFingerMovingSpeed:(double)a3;
- (void)setFingerStillSpeed:(double)a3;
- (void)setFirstRippleInitialRadius:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TKVibrationRecorderRippleView

- (TKVibrationRecorderRippleView)init
{
  return [(TKVibrationRecorderRippleView *)self initWithStyleProvider:0];
}

- (TKVibrationRecorderRippleView)initWithStyleProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TKVibrationRecorderRippleView;
  v6 = -[TKVibrationRecorderRippleView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v12 = v11;
    if (v7 && v8 && v9 && v10 && v11)
    {
      objc_storeStrong((id *)&v6->_reusableTouchContexts, v7);
      objc_storeStrong((id *)&v6->_recentTouchesContextQueue, v8);
      objc_storeStrong((id *)&v6->_ringLayersQueue, v9);
      objc_storeStrong((id *)&v6->_reusableRingLayers, v10);
      objc_storeStrong((id *)&v6->_ringLayersByIdentifiers, v12);
      objc_storeStrong((id *)&v6->_styleProvider, a3);
      v13 = [v5 vibrationRecorderRippleViewBackgroundColor];
      [(TKVibrationRecorderRippleView *)v6 setBackgroundColor:v13];

      [(TKVibrationRecorderRippleView *)v6 setOpaque:1];
      [(TKVibrationRecorderRippleView *)v6 setFingerStillSpeed:1.0];
      [(TKVibrationRecorderRippleView *)v6 setFingerMovingSpeed:1.0];
      [(TKVibrationRecorderRippleView *)v6 setFirstRippleInitialRadius:50.0];
      [(TKVibrationRecorderRippleView *)v6 setFadeOutRadius:100.0];
      [(TKVibrationRecorderRippleView *)v6 setAccessibilityTraits:*MEMORY[0x263F1CEE0]];
      [(TKVibrationRecorderRippleView *)v6 setIsAccessibilityElement:1];
    }
    else
    {

      v6 = 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  [(TKVibrationRecorderRippleView *)self _stopAnimation];
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderRippleView;
  [(TKVibrationRecorderRippleView *)&v3 dealloc];
}

- (void)setFirstRippleInitialRadius:(double)a3
{
  if (self->_firstRippleInitialRadius != a3)
  {
    self->_firstRippleInitialRadius = a3;
    [(TKVibrationRecorderRippleView *)self _updateRingEnlargementAnimation];
  }
}

- (void)setFadeOutRadius:(double)a3
{
  if (self->_fadeOutRadius != a3)
  {
    self->_fadeOutRadius = a3;
    [(TKVibrationRecorderRippleView *)self _updateRingEnlargementAnimation];
    reusableRingLayers = self->_reusableRingLayers;
    [(NSMutableArray *)reusableRingLayers removeAllObjects];
  }
}

- (BOOL)_isTouchDown
{
  return self->_isTrackingTouch;
}

- (void)_refresh:(id)a3
{
  double x = self->_currentTouchLocation.x;
  double y = self->_currentTouchLocation.y;
  [(TKVibrationRecorderRippleView *)self bounds];
  CGFloat v6 = v46.origin.x;
  CGFloat v7 = v46.origin.y;
  CGFloat width = v46.size.width;
  CGFloat height = v46.size.height;
  double v10 = CGRectGetWidth(v46);
  v47.origin.double x = v6;
  v47.origin.double y = v7;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v47);
  [(NSMutableArray *)self->_ringLayersQueue count];
  BOOL isTrackingTouch = self->_isTrackingTouch;
  if (self->_isTrackingTouch)
  {
    double v45 = x;
    double v13 = x / v10;
    double v14 = y;
    double v15 = y / v11;
    [(TKVibrationRecorderRippleView *)self _currentSpeed];
    double v17 = v16;
    unint64_t numberOfRipplesForCurrentTouch = self->_numberOfRipplesForCurrentTouch;
    if (!numberOfRipplesForCurrentTouch)
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      -[TKVibrationRecorderRippleView _enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:](self, "_enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:", v19 - self->_currentTouchStartTime, v13, v15, v17);
      unint64_t numberOfRipplesForCurrentTouch = 1;
    }
    v20 = [(NSMutableArray *)self->_ringLayersQueue tk_lastEnqueuedObject];
    [v20 normalizedRingLocation];
    double v22 = v21;
    double v24 = v23;
    [v20 timeIntervalSinceCreation];
    double v26 = v25;
    [v20 ringSpeed];
    double v28 = v27;
    unint64_t v29 = vcvtmd_u64_f64(v26 * v27);
    if (v29)
    {
      unint64_t v30 = 0;
      double v31 = v22 - v13;
      double v32 = v24 - v15;
      unint64_t v33 = numberOfRipplesForCurrentTouch + v29;
      unint64_t v34 = 1 - numberOfRipplesForCurrentTouch;
      while (v29 != 1 || v34 != v30)
      {
        ++v30;
        -[TKVibrationRecorderRippleView _enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:](self, "_enqueueRingLayerWithTimeIntervalSinceCreation:normalizedLocation:speed:", v26 - (double)v30 / v28, v13 + v31 * ((v26 - (double)v30 / v28) / v26), v15 + v32 * ((v26 - (double)v30 / v28) / v26), v17);
        if (v29 == v30)
        {
          unint64_t numberOfRipplesForCurrentTouch = v33;
          goto LABEL_11;
        }
      }
      unint64_t numberOfRipplesForCurrentTouch = 1;
    }
LABEL_11:
    double x = v45;
    double y = v14;
    self->_unint64_t numberOfRipplesForCurrentTouch = numberOfRipplesForCurrentTouch;
  }
  uint64_t v35 = [(NSMutableArray *)self->_recentTouchesContextQueue count];
  unint64_t v36 = v35;
  if (isTrackingTouch || v35)
  {
    if (isTrackingTouch)
    {
      if (v35)
      {
        v37 = [(NSMutableArray *)self->_recentTouchesContextQueue tk_lastEnqueuedObject];
        [v37 timeIntervalSinceCreation];
        double v39 = v38;

        if (v39 <= 0.0)
        {
          do
          {
LABEL_19:
            if (isTrackingTouch && v36 <= 5)
            {
              v41 = [(NSMutableArray *)self->_recentTouchesContextQueue tk_nextDequeuedObject];
              [v41 timeIntervalSinceCreation];
              double v43 = v42;

              if (v43 <= 0.0) {
                break;
              }
            }
            v44 = [(NSMutableArray *)self->_recentTouchesContextQueue tk_dequeueObject];
            if (v44) {
              [(TKVibrationRecorderRippleView *)self _enqueueReusableTouchContextObject:v44];
            }
            --v36;
            self->_needsCurrentSpeedRefresh = 1;
          }
          while (v36);
          return;
        }
      }
      v40 = [(TKVibrationRecorderRippleView *)self _reusableTouchContextObject];
      objc_msgSend(v40, "configureWithTimeIntervalSinceCreation:location:", 0.0, x, y);
      [(NSMutableArray *)self->_recentTouchesContextQueue tk_enqueueObject:v40];
      ++v36;
      self->_needsCurrentSpeedRefresh = 1;
    }
    if (!v36) {
      return;
    }
    goto LABEL_19;
  }
}

- (double)_currentSpeed
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_super v3 = &OBJC_IVAR___TKVibrationRecorderContentViewController__vibratorController;
  if (self->_needsCurrentSpeedRefresh)
  {
    unint64_t v4 = [(NSMutableArray *)self->_recentTouchesContextQueue count];
    double v5 = 0.0;
    if (v4 >= 2)
    {
      unint64_t v6 = v4;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      CGFloat v7 = self->_recentTouchesContextQueue;
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        id v10 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v29;
        double v13 = (double)(((v6 - 1) * v6) >> 1);
        do
        {
          uint64_t v14 = 0;
          double v15 = v10;
          do
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v7);
            }
            double v16 = *(void **)(*((void *)&v28 + 1) + 8 * v14);
            if (v15)
            {
              objc_msgSend(v15, "location", (void)v28);
              double v18 = v17;
              double v20 = v19;
              [v16 location];
              double v5 = v5 + TKPointGetDistanceToPoint(v18, v20, v21, v22) * ((double)(unint64_t)(v11 + v14) / v13);
            }
            id v10 = v16;

            ++v14;
            double v15 = v10;
          }
          while (v9 != v14);
          v11 += v9;
          uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v9);
      }
      else
      {
        id v10 = 0;
      }

      objc_super v3 = &OBJC_IVAR___TKVibrationRecorderContentViewController__vibratorController;
    }
    double v23 = 1.0;
    if (v5 < 12.8) {
      double v23 = v5 / 12.8;
    }
    *(double *)((char *)&self->super.super.super.isa + v3[146]) = v23;
    self->_needsCurrentSpeedRefresh = 0;
  }
  [(TKVibrationRecorderRippleView *)self fingerStillSpeed];
  double v25 = v24;
  [(TKVibrationRecorderRippleView *)self fingerMovingSpeed];
  return v25 + (v26 - v25) * *(double *)((char *)&self->super.super.super.isa + v3[146]);
}

- (id)_reusableTouchContextObject
{
  if ([(NSMutableArray *)self->_reusableTouchContexts count])
  {
    objc_super v3 = [(NSMutableArray *)self->_reusableTouchContexts tk_dequeueObject];
  }
  else
  {
    objc_super v3 = objc_alloc_init(TKVibrationRecorderRippleTouchContext);
  }

  return v3;
}

- (void)_enqueueReusableTouchContextObject:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 reset];
    [(NSMutableArray *)self->_reusableTouchContexts tk_enqueueObject:v4];
  }
}

- (void)_startAnimation
{
  if (!self->_isAnimating)
  {
    self->_isAnimating = 1;
    objc_super v3 = +[TKDisplayLinkManager currentDisplayLinkManager];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__TKVibrationRecorderRippleView__startAnimation__block_invoke;
    v6[3] = &unk_264589D08;
    v6[4] = self;
    id v4 = [v3 addObserverWithHandler:v6];
    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = v4;
  }
}

uint64_t __48__TKVibrationRecorderRippleView__startAnimation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _refresh:a2];
}

- (void)_stopAnimation
{
  if (self->_isAnimating)
  {
    self->_isAnimating = 0;
    objc_super v3 = +[TKDisplayLinkManager currentDisplayLinkManager];
    [v3 removeObserverWithToken:self->_displayLinkManagerObserverToken];

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;
  }
}

- (void)_enqueueRingLayerWithTimeIntervalSinceCreation:(double)a3 normalizedLocation:(CGPoint)a4 speed:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  [(TKVibrationRecorderRippleView *)self firstRippleInitialRadius];
  double v11 = v10;
  [(TKVibrationRecorderRippleView *)self fadeOutRadius];
  double v13 = (v12 / 0.84 - v11) / (a5 * 12.8);
  id v16 = [(TKVibrationRecorderRippleView *)self _reusableRingLayer];
  objc_msgSend(v16, "configureWithTimeIntervalSinceCreation:normalizedRingLocation:ringSpeed:", a3, x, y, a5);
  ++self->_lastRingLayerIdentifier;
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  [(NSMutableDictionary *)self->_ringLayersByIdentifiers setObject:v16 forKey:v14];
  [(NSMutableArray *)self->_ringLayersQueue tk_enqueueObject:v16];
  double v15 = [(TKVibrationRecorderRippleView *)self layer];
  [v15 addSublayer:v16];

  [(TKVibrationRecorderRippleView *)self setNeedsLayout];
  [(CAAnimation *)self->_ringEnlargementAnimation setDelegate:self];
  [(CAAnimation *)self->_ringEnlargementAnimation setDuration:v13];
  [(CAAnimation *)self->_ringEnlargementAnimation setBeginTime:CACurrentMediaTime() - a3];
  [(CAAnimation *)self->_ringEnlargementAnimation setValue:v14 forKey:@"ring layer identifier"];
  [v16 addAnimation:self->_ringEnlargementAnimation forKey:@"ring enlargement animation"];
  [(CAAnimation *)self->_ringEnlargementAnimation setDelegate:0];
}

- (id)_reusableRingLayer
{
  if (![(NSMutableArray *)self->_reusableRingLayers count])
  {
    objc_super v3 = objc_alloc_init(TKVibrationRecorderRippleRingLayer);
    [(TKVibrationRecorderRippleView *)self _enqueueReusableRingLayer:v3];
  }
  reusableRingLayers = self->_reusableRingLayers;

  return [(NSMutableArray *)reusableRingLayers tk_dequeueObject];
}

- (void)_enqueueReusableRingLayer:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    [v6 reset];
    [(TKVibrationRecorderRippleView *)self fadeOutRadius];
    objc_msgSend(v6, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), v4 + v4, v4 + v4);
    id v5 = [(TKVibrationRecorderRippleView *)self tintColor];
    objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v5, "CGColor"));

    [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderRippleRingLineWidth];
    objc_msgSend(v6, "setLineWidth:");
    [(NSMutableArray *)self->_reusableRingLayers tk_enqueueObject:v6];
  }
}

- (void)_updateRingEnlargementAnimation
{
  v16[2] = *MEMORY[0x263EF8340];
  [(TKVibrationRecorderRippleView *)self firstRippleInitialRadius];
  double v4 = v3;
  [(TKVibrationRecorderRippleView *)self fadeOutRadius];
  if (v4 > 0.0)
  {
    double v6 = v5;
    if (v5 > 0.0)
    {
      CGFloat v7 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", v5 - v4, v5 - v4, v4 + v4, v4 + v4);
      uint64_t v8 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithOvalInRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), v6 + v6, v6 + v6);
      id v9 = objc_alloc_init(MEMORY[0x263F15760]);
      [v9 setKeyPath:@"path"];
      id v10 = v7;
      objc_msgSend(v9, "setFromValue:", objc_msgSend(v10, "CGPath"));
      id v11 = v8;
      objc_msgSend(v9, "setToValue:", objc_msgSend(v11, "CGPath"));
      id v12 = objc_alloc_init(MEMORY[0x263F15760]);
      [v12 setKeyPath:@"opacity"];
      [v12 setFromValue:&unk_26D2E85D0];
      [v12 setToValue:&unk_26D2E85E0];
      double v13 = (CAAnimation *)objc_alloc_init(MEMORY[0x263F15750]);
      v16[0] = v9;
      v16[1] = v12;
      uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
      [(CAAnimation *)v13 setAnimations:v14];

      ringEnlargementAnimation = self->_ringEnlargementAnimation;
      self->_ringEnlargementAnimation = v13;
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)TKVibrationRecorderRippleView;
  [(TKVibrationRecorderRippleView *)&v21 layoutSubviews];
  [(TKVibrationRecorderRippleView *)self bounds];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double v7 = CGRectGetHeight(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double v8 = CGRectGetWidth(v25);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = self->_ringLayersQueue;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "normalizedRingLocation", (void)v17);
        objc_msgSend(v14, "setPosition:", v8 * v15, v7 * v16);
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v11);
  }

  [MEMORY[0x263F158F8] commit];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v5 = objc_msgSend(a3, "valueForKey:", @"ring layer identifier", a4);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v8 = v5;
    double v7 = [(NSMutableDictionary *)self->_ringLayersByIdentifiers objectForKey:v5];
    if (v7)
    {
      [(NSMutableArray *)self->_ringLayersQueue removeObject:v7];
      [(NSMutableDictionary *)self->_ringLayersByIdentifiers removeObjectForKey:v8];
      [v7 removeFromSuperlayer];
      [(TKVibrationRecorderRippleView *)self _enqueueReusableRingLayer:v7];
      if (!self->_isTrackingTouch && ![(NSMutableArray *)self->_ringLayersQueue count]) {
        [(TKVibrationRecorderRippleView *)self _stopAnimation];
      }
    }

    uint64_t v6 = v8;
  }

  MEMORY[0x270F9A758](v5, v6);
}

- (void)_touchBeganAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_currentTouchStartTime = v6;
  self->_unint64_t numberOfRipplesForCurrentTouch = 0;
  self->_BOOL isTrackingTouch = 1;
  self->_currentTouchLocation.CGFloat x = x;
  self->_currentTouchLocation.CGFloat y = y;

  [(TKVibrationRecorderRippleView *)self _startAnimation];
}

- (void)_touchMovedToLocation:(CGPoint)a3
{
  self->_currentTouchLocation = a3;
}

- (void)_touchEndedAtLocation:(CGPoint)a3
{
  self->_BOOL isTrackingTouch = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[TKVibrationRecorderRippleView _touchBeganAtLocation:](self, "_touchBeganAtLocation:");
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[TKVibrationRecorderRippleView _touchMovedToLocation:](self, "_touchMovedToLocation:");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = [a3 anyObject];
  [v5 locationInView:self];
  -[TKVibrationRecorderRippleView _touchEndedAtLocation:](self, "_touchEndedAtLocation:");
}

- (double)fingerStillSpeed
{
  return self->_fingerStillSpeed;
}

- (void)setFingerStillSpeed:(double)a3
{
  self->_fingerStillSpeed = a3;
}

- (double)fingerMovingSpeed
{
  return self->_fingerMovingSpeed;
}

- (void)setFingerMovingSpeed:(double)a3
{
  self->_fingerMovingSpeed = a3;
}

- (double)firstRippleInitialRadius
{
  return self->_firstRippleInitialRadius;
}

- (double)fadeOutRadius
{
  return self->_fadeOutRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringEnlargementAnimation, 0);
  objc_storeStrong((id *)&self->_ringLayersByIdentifiers, 0);
  objc_storeStrong((id *)&self->_reusableRingLayers, 0);
  objc_storeStrong((id *)&self->_ringLayersQueue, 0);
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_reusableTouchContexts, 0);
  objc_storeStrong((id *)&self->_recentTouchesContextQueue, 0);

  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end