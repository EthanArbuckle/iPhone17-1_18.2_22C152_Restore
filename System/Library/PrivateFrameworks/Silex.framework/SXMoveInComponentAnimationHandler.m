@interface SXMoveInComponentAnimationHandler
- (double)startXOffset;
- (void)finishAnimation;
- (void)prepareAnimation;
- (void)setStartXOffset:(double)a3;
- (void)startAnimation;
- (void)updateAnimationWithFactor:(double)a3;
@end

@implementation SXMoveInComponentAnimationHandler

- (void)prepareAnimation
{
  v45.receiver = self;
  v45.super_class = (Class)SXMoveInComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v45 prepareAnimation];
  v3 = [(SXComponentAnimationHandler *)self component];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    v4 = [v3 layer];
    long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v44.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v44.m33 = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v44.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v44.m43 = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v44.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v44.m13 = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v44.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v44.m23 = v8;
    [v4 setTransform:&v44];
    goto LABEL_4;
  }
  v4 = [v3 viewport];
  [v3 absoluteFrame];
  CGFloat x = v46.origin.x;
  CGFloat y = v46.origin.y;
  CGFloat width = v46.size.width;
  CGFloat height = v46.size.height;
  double v39 = CGRectGetWidth(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v48);
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v13 = CGRectGetMinX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double v41 = CGRectGetMinY(v52);
  [v4 bounds];
  double v15 = CGRectGetWidth(v53);
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  double v16 = v15 - CGRectGetMaxX(v54);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.CGFloat width = width;
  v55.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v55);
  v18 = [v3 presentationDelegate];
  v19 = [v18 componentController];
  v20 = objc_msgSend(v19, "componentsInRect:", 0.0, MinY, v13, v14);
  uint64_t v21 = [v20 count];

  v22 = [v3 presentationDelegate];
  v23 = [v22 componentController];
  v24 = objc_msgSend(v23, "componentsInRect:", MaxX, v41, v16, v17);
  uint64_t v25 = [v24 count];

  v26 = [(SXComponentAnimationHandler *)self animation];
  uint64_t v27 = [v26 preferredStartingPosition];

  if (!v21 && v27 == 1) {
    goto LABEL_7;
  }
  v29 = [(SXComponentAnimationHandler *)self animation];
  uint64_t v30 = [v29 preferredStartingPosition];

  if (!v25 && v30 == 2) {
    goto LABEL_28;
  }
  v31 = [(SXComponentAnimationHandler *)self animation];
  uint64_t v32 = [v31 preferredStartingPosition];

  if (v32 || !v21)
  {
    if (!v32)
    {
LABEL_7:
      double v28 = -(v39 + MinX);
      goto LABEL_29;
    }
    uint64_t v33 = 2 * (v25 == 0);
  }
  else
  {
    if (!v25)
    {
      uint64_t v33 = 2;
      goto LABEL_25;
    }
    uint64_t v33 = 0;
  }
  if (v25) {
    BOOL v34 = v21 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  int v35 = !v34;
  if (!v21) {
    int v35 = 1;
  }
  if (v35) {
    uint64_t v33 = v34;
  }
LABEL_25:
  if (v33 != 2)
  {
    if (v33 != 1) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
LABEL_28:
  [v4 bounds];
  double v36 = CGRectGetWidth(v56);
  v57.origin.CGFloat x = x;
  v57.origin.CGFloat y = y;
  v57.size.CGFloat width = width;
  v57.size.CGFloat height = height;
  double v28 = v36 - CGRectGetMinX(v57);
LABEL_29:
  if (v28 != 0.0)
  {
    memset(&v44, 0, sizeof(v44));
    CATransform3DMakeTranslation(&v44, v28, 0.0, 0.0);
    v37 = [v3 layer];
    CATransform3D v43 = v44;
    [v37 setTransform:&v43];

    [(SXMoveInComponentAnimationHandler *)self setStartXOffset:v28];
  }
LABEL_4:
}

- (void)updateAnimationWithFactor:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SXMoveInComponentAnimationHandler;
  -[SXComponentAnimationHandler updateAnimationWithFactor:](&v10, sel_updateAnimationWithFactor_);
  [(SXMoveInComponentAnimationHandler *)self startXOffset];
  memset(&v9, 0, sizeof(v9));
  CATransform3DMakeTranslation(&v9, (1.0 - a3) * v5, 0.0, 0.0);
  long long v6 = [(SXComponentAnimationHandler *)self component];
  long long v7 = [v6 layer];
  CATransform3D v8 = v9;
  [v7 setTransform:&v8];
}

- (void)startAnimation
{
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsReduceMotionEnabled())
  {
    v17.receiver = self;
    v17.super_class = (Class)SXMoveInComponentAnimationHandler;
    [(SXComponentAnimationHandler *)&v17 startAnimation];
    v3 = [(SXComponentAnimationHandler *)self component];
    v4 = [v3 layer];
    double v5 = [v4 presentationLayer];

    long long v6 = [v5 valueForKeyPath:@"transform"];
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v16[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v16[5] = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v16[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v16[7] = v8;
    long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v16[0] = *MEMORY[0x263F15740];
    v16[1] = v9;
    long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v16[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v16[3] = v10;
    v11 = [MEMORY[0x263F08D40] valueWithCATransform3D:v16];
    v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    [v12 setDelegate:self];
    [v12 setFromValue:v6];
    [v12 setToValue:v11];
    double v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v12 setTimingFunction:v13];

    [v12 setFillMode:*MEMORY[0x263F15AB0]];
    [v12 setRemovedOnCompletion:0];
    [v12 setDuration:0.6];
    double v14 = [(SXComponentAnimationHandler *)self component];
    double v15 = [v14 layer];
    [v15 addAnimation:v12 forKey:@"moveIn"];
  }
}

- (void)finishAnimation
{
  v3 = [(SXComponentAnimationHandler *)self component];
  v4 = [v3 layer];
  [v4 removeAnimationForKey:@"moveIn"];

  double v5 = [(SXComponentAnimationHandler *)self component];
  long long v6 = [v5 layer];
  long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v12[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v12[5] = v7;
  long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v12[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v12[7] = v8;
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v12[0] = *MEMORY[0x263F15740];
  v12[1] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v12[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v12[3] = v10;
  [v6 setTransform:v12];

  v11.receiver = self;
  v11.super_class = (Class)SXMoveInComponentAnimationHandler;
  [(SXComponentAnimationHandler *)&v11 finishAnimation];
}

- (double)startXOffset
{
  return self->_startXOffset;
}

- (void)setStartXOffset:(double)a3
{
  self->_startXOffset = a3;
}

@end