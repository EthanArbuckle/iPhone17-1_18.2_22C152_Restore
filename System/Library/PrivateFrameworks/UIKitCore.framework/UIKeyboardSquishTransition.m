@interface UIKeyboardSquishTransition
- (BOOL)_allowFacesToAdjoinToAdjacentFaces;
- (BOOL)disableMeshOptimization;
- (BOOL)opacityAnimationDirectionForward;
- (BOOL)useInteractiveOpacity;
- (CADisplayLink)opacityAnimationDisplayLink;
- (NSArray)commonVisibleKeys;
- (NSArray)endGeometries;
- (NSArray)startGeometries;
- (double)opacityAnimationBeginTime;
- (double)previousProgress;
- (id)_animationsForEnd;
- (id)_animationsForStart;
- (id)geometriesForKeyplane:(id)a3;
- (id)meshTransformForKeyplane:(id)a3 toKeyplane:(id)a4;
- (id)sortedCommonVisibleKeys;
- (id)symmetricMeshTransformForKeyplane:(id)a3;
- (unint64_t)animationType;
- (void)_updateTransition;
- (void)commitTransitionRebuild;
- (void)dealloc;
- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6;
- (void)removeAllAnimations;
- (void)setAnimationType:(unint64_t)a3;
- (void)setCommonVisibleKeys:(id)a3;
- (void)setDisableMeshOptimization:(BOOL)a3;
- (void)setEndGeometries:(id)a3;
- (void)setOpacityAnimationBeginTime:(double)a3;
- (void)setOpacityAnimationDirectionForward:(BOOL)a3;
- (void)setOpacityAnimationDisplayLink:(id)a3;
- (void)setPreviousProgress:(double)a3;
- (void)setStartGeometries:(id)a3;
- (void)setUseInteractiveOpacity:(BOOL)a3;
- (void)updateOpacityAnimation:(id)a3;
- (void)updateWithProgress:(double)a3;
@end

@implementation UIKeyboardSquishTransition

- (void)dealloc
{
  [(CADisplayLink *)self->_opacityAnimationDisplayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardSquishTransition;
  [(UIKeyboardKeyplaneTransition *)&v3 dealloc];
}

- (void)rebuildWithStartKeyplane:(id)a3 startView:(id)a4 endKeyplane:(id)a5 endView:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)UIKeyboardSquishTransition;
  [(UIKeyboardKeyplaneTransition *)&v38 rebuildWithStartKeyplane:v10 startView:a4 endKeyplane:v11 endView:a6];
  if (v10)
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v13 = [v10 keys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v35 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v19 = [v18 shape];

          if (v19)
          {
            v20 = [v18 shape];
            [v12 addObject:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v15);
    }

    [(UIKeyboardSquishTransition *)self setStartGeometries:v12];
  }
  if (v11)
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v22 = objc_msgSend(v11, "keys", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          v28 = [v27 shape];

          if (v28)
          {
            v29 = [v27 shape];
            [v21 addObject:v29];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v24);
    }

    [(UIKeyboardSquishTransition *)self setEndGeometries:v21];
  }
}

- (void)commitTransitionRebuild
{
  [(UIKBTree *)self->super._end primaryKeylayoutWidthRatio];
  self->_widthRatio = v3;
  [(UIKBTree *)self->super._end primaryKeylayoutOffset];
  self->_offsetX = v4;
  v5 = [(UIKeyboardSquishTransition *)self sortedCommonVisibleKeys];
  [(UIKeyboardSquishTransition *)self setCommonVisibleKeys:v5];

  BOOL v6 = [(UIKeyboardKeyplaneTransition *)self initiallyAtEnd];
  double v7 = 0.0;
  if (v6) {
    double v7 = 1.0;
  }
  [(UIKeyboardSquishTransition *)self setPreviousProgress:v7];
  [(UIKeyboardSquishTransition *)self _updateTransition];
}

- (id)_animationsForStart
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(UIKeyboardSquishTransition *)self useInteractiveOpacity])
  {
    double v4 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F5820 toValue:&unk_1ED3F5838];
    v5 = [MEMORY[0x1E4F39C10] _kbTimingFunction];
    [v4 setTimingFunction:v5];

    [v3 setObject:v4 forKey:@"start opacity interpolation"];
  }
  if ([(UIKeyboardSquishTransition *)self animationType] == 1)
  {
    BOOL v6 = [(UIView *)self->super._startView layer];
    [v6 position];
    double v8 = v7;
    double v10 = v9;
    [v6 bounds];
    double v12 = v11;
    double v13 = 1.0 - self->_widthRatio;
    double v14 = v11 * v13;
    uint64_t v15 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"position" fromValue:0 toValue:0];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v8, v10);
    [v15 setFromValue:v16];

    if (self->_offsetX <= 7.0) {
      double v17 = -(v12 * v13);
    }
    else {
      double v17 = v14;
    }
    v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v8 + v17, v10);
    [v15 setToValue:v18];

    [v3 setObject:v15 forKey:@"start position interpolation"];
    long long v19 = 0uLL;
    memset(&v29, 0, sizeof(v29));
    if (v6)
    {
      [v6 transform];
      long long v19 = 0uLL;
    }
    *(_OWORD *)&v28.m41 = v19;
    *(_OWORD *)&v28.m43 = v19;
    *(_OWORD *)&v28.m31 = v19;
    *(_OWORD *)&v28.m33 = v19;
    *(_OWORD *)&v28.m21 = v19;
    *(_OWORD *)&v28.m23 = v19;
    *(_OWORD *)&v28.m11 = v19;
    *(_OWORD *)&v28.m13 = v19;
    double widthRatio = self->_widthRatio;
    CATransform3D v27 = v29;
    CATransform3DScale(&v28, &v27, widthRatio, 1.0, 1.0);
    v21 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"transform" fromValue:0 toValue:0];
    CATransform3D v27 = v29;
    v22 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v27];
    [v21 setFromValue:v22];

    CATransform3D v27 = v28;
    uint64_t v23 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v27];
    [v21 setToValue:v23];

    [v3 setObject:v21 forKey:@"start transform interpolation"];
  }
  else
  {
    if ([(UIKeyboardSquishTransition *)self animationType] != 2) {
      goto LABEL_13;
    }
    BOOL v6 = [(UIKeyboardSquishTransition *)self meshTransformForKeyplane:self->super._start toKeyplane:self->super._start];
    uint64_t v24 = [(UIKeyboardSquishTransition *)self meshTransformForKeyplane:self->super._start toKeyplane:self->super._end];
    uint64_t v25 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v6 toValue:v24];
    [v3 setObject:v25 forKey:@"start transform interpolation"];
  }
LABEL_13:
  return v3;
}

- (id)_animationsForEnd
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(UIKeyboardSquishTransition *)self useInteractiveOpacity])
  {
    double v4 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"opacity" fromValue:&unk_1ED3F5838 toValue:&unk_1ED3F5820];
    v5 = [MEMORY[0x1E4F39C10] _kbTimingFunction];
    [v4 setTimingFunction:v5];

    [v3 setObject:v4 forKey:@"end opacity interpolation"];
  }
  if ([(UIKeyboardSquishTransition *)self animationType] == 1)
  {
    BOOL v6 = [(UIView *)self->super._endView layer];
    [v6 position];
    double v8 = v7;
    double v10 = v9;
    [v6 bounds];
    double v12 = v11;
    double v13 = 1.0 - self->_widthRatio;
    double v14 = v11 * v13;
    uint64_t v15 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"position" fromValue:0 toValue:0];
    if (self->_offsetX <= 7.0) {
      double v16 = v14;
    }
    else {
      double v16 = -(v12 * v13);
    }
    double v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v8 + v16, v10);
    [v15 setFromValue:v17];

    v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v8, v10);
    [v15 setToValue:v18];

    [v6 addAnimation:v15 forKey:@"end position interpolation"];
    long long v19 = 0uLL;
    memset(&v29, 0, sizeof(v29));
    if (v6)
    {
      [v6 transform];
      long long v19 = 0uLL;
    }
    *(_OWORD *)&v28.m41 = v19;
    *(_OWORD *)&v28.m43 = v19;
    *(_OWORD *)&v28.m31 = v19;
    *(_OWORD *)&v28.m33 = v19;
    *(_OWORD *)&v28.m21 = v19;
    *(_OWORD *)&v28.m23 = v19;
    double widthRatio = self->_widthRatio;
    *(_OWORD *)&v28.m11 = v19;
    *(_OWORD *)&v28.m13 = v19;
    CATransform3D v27 = v29;
    CATransform3DScale(&v28, &v27, 1.0 / widthRatio, 1.0, 1.0);
    v21 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"transform" fromValue:0 toValue:0];
    CATransform3D v27 = v28;
    v22 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v27];
    [v21 setFromValue:v22];

    CATransform3D v27 = v29;
    uint64_t v23 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v27];
    [v21 setToValue:v23];

    [v3 setObject:v21 forKey:@"end transform interpolation"];
  }
  else
  {
    if ([(UIKeyboardSquishTransition *)self animationType] != 2) {
      goto LABEL_13;
    }
    BOOL v6 = [(UIKeyboardSquishTransition *)self meshTransformForKeyplane:self->super._end toKeyplane:self->super._start];
    uint64_t v24 = [(UIKeyboardSquishTransition *)self meshTransformForKeyplane:self->super._end toKeyplane:self->super._end];
    uint64_t v25 = [MEMORY[0x1E4F39B48] normalizedAnimationWithKeyPath:@"meshTransform" fromValue:v6 toValue:v24];
    [v3 setObject:v25 forKey:@"end transform interpolation"];
  }
LABEL_13:
  return v3;
}

- (void)_updateTransition
{
  double v3 = [(UIView *)self->super._startView layer];
  double v4 = [(UIView *)self->super._endView layer];
  [(UIView *)self->super._startView contentScaleFactor];
  objc_msgSend(v3, "setRasterizationScale:");
  [(UIView *)self->super._endView contentScaleFactor];
  objc_msgSend(v4, "setRasterizationScale:");
  v5 = [(UIKeyboardSquishTransition *)self _animationsForStart];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__UIKeyboardSquishTransition__updateTransition__block_invoke;
  v11[3] = &unk_1E52FE860;
  id v12 = v3;
  id v6 = v3;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  double v7 = [(UIKeyboardSquishTransition *)self _animationsForEnd];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__UIKeyboardSquishTransition__updateTransition__block_invoke_2;
  v9[3] = &unk_1E52FE860;
  id v10 = v4;
  id v8 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v9];
}

uint64_t __47__UIKeyboardSquishTransition__updateTransition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addAnimation:a3 forKey:a2];
}

uint64_t __47__UIKeyboardSquishTransition__updateTransition__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addAnimation:a3 forKey:a2];
}

- (void)removeAllAnimations
{
  double v3 = [(UIKeyboardSquishTransition *)self opacityAnimationDisplayLink];
  [v3 invalidate];

  [(UIKeyboardSquishTransition *)self setOpacityAnimationDisplayLink:0];
  double v4 = [(UIView *)self->super._startView layer];
  v5 = [(UIView *)self->super._endView layer];
  [v4 removeAnimationForKey:@"start opacity interpolation"];
  [v5 removeAnimationForKey:@"end opacity interpolation"];
  [v4 removeAnimationForKey:@"start position interpolation"];
  [v5 removeAnimationForKey:@"end position interpolation"];
  [v4 removeAnimationForKey:@"start transform interpolation"];
  [v5 removeAnimationForKey:@"end transform interpolation"];
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSquishTransition;
  [(UIKeyboardKeyplaneTransition *)&v6 removeAllAnimations];
}

- (void)updateWithProgress:(double)a3
{
  [(UIView *)self->super._startView setHidden:0];
  [(UIView *)self->super._endView setHidden:0];
  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardSquishTransition;
  [(UIKeyboardKeyplaneTransition *)&v13 updateWithProgress:a3];
  [(UIKeyboardSquishTransition *)self previousProgress];
  double v6 = v5;
  if (![(UIKeyboardSquishTransition *)self useInteractiveOpacity] && a3 >= 0.5 == v6 < 0.5)
  {
    [(UIKeyboardSquishTransition *)self setOpacityAnimationDirectionForward:a3 >= 0.5];
    double v7 = [(UIKeyboardSquishTransition *)self opacityAnimationDisplayLink];

    if (!v7)
    {
      [(UIKeyboardSquishTransition *)self setOpacityAnimationBeginTime:CACurrentMediaTime()];
      id v8 = [(UIView *)self->super._startView window];
      double v9 = [v8 screen];
      id v10 = [v9 displayLinkWithTarget:self selector:sel_updateOpacityAnimation_];
      [(UIKeyboardSquishTransition *)self setOpacityAnimationDisplayLink:v10];

      double v11 = [(UIKeyboardSquishTransition *)self opacityAnimationDisplayLink];
      id v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
    }
  }
  [(UIKeyboardSquishTransition *)self setPreviousProgress:a3];
}

- (void)updateOpacityAnimation:(id)a3
{
  [a3 timestamp];
  double v5 = v4;
  [(UIKeyboardSquishTransition *)self opacityAnimationBeginTime];
  double v7 = v5 - v6;
  double v8 = (v5 - v6) * 4.0;
  if ([(UIKeyboardSquishTransition *)self opacityAnimationDirectionForward])
  {
    double v9 = 1.0 - v8;
    double v11 = [(UIView *)self->super._startView layer];
    float v10 = 1.0 - v8;
    *(float *)&double v12 = v10;
    [v11 setOpacity:v12];

    float v13 = v8;
  }
  else
  {
    uint64_t v15 = [(UIView *)self->super._startView layer];
    float v14 = v8;
    *(float *)&double v16 = v14;
    [v15 setOpacity:v16];

    double v9 = 1.0 - v8;
    float v13 = 1.0 - v8;
  }
  double v17 = [(UIView *)self->super._endView layer];
  *(float *)&double v18 = v13;
  [v17 setOpacity:v18];

  if (fabs(v9) < 0.01 || v7 >= 1.0)
  {
    v20 = [(UIKeyboardSquishTransition *)self opacityAnimationDisplayLink];
    [v20 invalidate];

    [(UIKeyboardSquishTransition *)self setOpacityAnimationDisplayLink:0];
  }
}

- (id)sortedCommonVisibleKeys
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(UIKBTree *)self->super._end keys];
  double v5 = [(UIKBTree *)self->super._start keysOrderedByPosition];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__UIKeyboardSquishTransition_sortedCommonVisibleKeys__block_invoke;
  v11[3] = &unk_1E52FA400;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateObjectsUsingBlock:v11];

  double v8 = v13;
  id v9 = v6;

  return v9;
}

void __53__UIKeyboardSquishTransition_sortedCommonVisibleKeys__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 visible] && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3)) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)geometriesForKeyplane:(id)a3
{
  if (self->super._start == a3) {
    [(UIKeyboardSquishTransition *)self startGeometries];
  }
  else {
  id v3 = [(UIKeyboardSquishTransition *)self endGeometries];
  }
  return v3;
}

- (BOOL)_allowFacesToAdjoinToAdjacentFaces
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  BOOL v4 = fabs(v3 + -3.0) < 0.00000011920929;

  return v4;
}

- (id)symmetricMeshTransformForKeyplane:(id)a3
{
  uint64_t v245 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(UIKeyboardSquishTransition *)self commonVisibleKeys];
  if ([(UIKeyboardSquishTransition *)self disableMeshOptimization]) {
    uint64_t v6 = 35;
  }
  else {
    uint64_t v6 = 20;
  }
  uint64_t v7 = 5 * [v5 count] + v6;
  uint64_t v8 = [v5 count];
  v211[1] = v211;
  MEMORY[0x1F4188790](v8);
  id v9 = &v211[-4 * v7];
  double v11 = MEMORY[0x1F4188790](v10);
  v223 = &v211[-v12];
  CGFloat v13 = *MEMORY[0x1E4F1DB20];
  double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  objc_msgSend(v4, "frame", v11);
  double v18 = v17;
  double v236 = 1.0 / v19;
  [v4 primaryKeylayoutOffset];
  double v21 = v20;
  [v4 primaryKeylayoutWidthRatio];
  double v23 = v22;
  v218 = self;
  id v220 = v4;
  id v219 = [(UIKeyboardSquishTransition *)self geometriesForKeyplane:v4];
  long long v240 = 0u;
  long long v241 = 0u;
  long long v242 = 0u;
  long long v243 = 0u;
  id v216 = v5;
  uint64_t v221 = [v216 countByEnumeratingWithState:&v240 objects:v244 count:16];
  uint64_t v24 = 0;
  CGFloat v25 = 0.0;
  if (!v221)
  {
    LODWORD(v26) = -1;
    uint64_t v230 = 0xFFFFFFFFLL;
    goto LABEL_29;
  }
  uint64_t v217 = *(void *)v241;
  CGFloat v214 = v21 + v23 * v18;
  double v212 = 1.0 / v18 * v214;
  CGFloat v215 = v21;
  double v224 = 1.0 / v18;
  double v213 = v21 * (1.0 / v18);
  *(double *)&uint64_t v230 = NAN;
  uint64_t v26 = -1;
  v222 = &v211[-4 * v7];
  do
  {
    CGFloat v235 = v13;
    uint64_t v27 = 0;
    do
    {
      double v28 = v235;
      CGFloat v238 = v14;
      CGFloat v239 = v16;
      CGFloat v29 = v15;
      if (*(void *)v241 != v217) {
        objc_enumerationMutation(v216);
      }
      uint64_t v233 = v27;
      uint64_t v30 = *(void *)(*((void *)&v240 + 1) + 8 * v27);
      long long v31 = [v220 keys];
      uint64_t v32 = [v31 indexOfObject:v30];
      long long v33 = [v219 objectAtIndex:v32];

      [v33 frame];
      CGFloat v35 = v34;
      double v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      id v232 = v33;
      [v33 paddedFrame];
      double v43 = v42;
      double v45 = v44;
      double v231 = v46;
      CGFloat v237 = v47;
      CGFloat v226 = v28;
      v247.origin.x = v28;
      double v48 = v238;
      v247.origin.y = v238;
      v247.size.width = v239;
      CGFloat v227 = v29;
      v247.size.height = v29;
      BOOL IsNull = CGRectIsNull(v247);
      uint64_t v50 = *(void *)&v25 + 1;
      int32x4_t v234 = vdupq_n_s32(0x7F7FFFFFu);
      v51 = v223;
      CGFloat v235 = v35;
      if (IsNull || v48 != v37)
      {
        double v228 = v43;
        double v229 = v45;
        v73 = (double *)&v223[5 * *(void *)&v25];
        v256.origin.x = v35;
        v256.origin.y = v37;
        v256.size.width = v39;
        v256.size.height = v41;
        CGFloat MinX = CGRectGetMinX(v256);
        double v75 = v224;
        double v76 = v224 * MinX;
        v257.origin.x = v35;
        v257.origin.y = v37;
        v257.size.width = v39;
        v257.size.height = v41;
        double v77 = v236 * CGRectGetMinY(v257);
        v258.origin.x = v35;
        v258.origin.y = v37;
        v258.size.width = v39;
        v258.size.height = v41;
        double v78 = v75 * CGRectGetMinX(v258);
        v259.origin.x = v35;
        v259.origin.y = v37;
        v259.size.width = v39;
        v259.size.height = v41;
        double v79 = v236 * CGRectGetMinY(v259);
        double *v73 = v76;
        v73[1] = v77;
        v73[2] = v78;
        v73[3] = v79;
        v73[4] = 0.5;
        v80 = (double *)&v51[5 * v50];
        v260.origin.x = v35;
        v260.origin.y = v37;
        v260.size.width = v39;
        v260.size.height = v41;
        double v81 = v75 * CGRectGetMinX(v260);
        v261.origin.x = v35;
        v261.origin.y = v37;
        v261.size.width = v39;
        v261.size.height = v41;
        double v82 = v236 * CGRectGetMaxY(v261);
        v262.origin.x = v35;
        v262.origin.y = v37;
        v262.size.width = v39;
        v262.size.height = v41;
        double v83 = v75 * CGRectGetMinX(v262);
        v263.origin.x = v35;
        v263.origin.y = v37;
        v263.size.width = v39;
        v263.size.height = v41;
        double v84 = v236 * CGRectGetMaxY(v263);
        double *v80 = v81;
        v80[1] = v82;
        v80[2] = v83;
        v80[3] = v84;
        v80[4] = 0.5;
        if ((IsNull | ![(UIKeyboardSquishTransition *)v218 _allowFacesToAdjoinToAdjacentFaces]))
        {
          CGFloat v85 = v235;
          v86 = v9;
          double v45 = v229;
        }
        else
        {
          CGFloat v87 = v226;
          v264.origin.x = v226;
          CGFloat v88 = v238;
          v264.origin.y = v238;
          CGFloat v89 = v239;
          v264.size.width = v239;
          CGFloat v90 = v227;
          v264.size.height = v227;
          if (CGRectGetMaxX(v264) >= v214)
          {
            __int32 v106 = v26;
          }
          else
          {
            long long v91 = *((_OWORD *)v73 + 1);
            v92 = &v51[5 * *(void *)&v25];
            *((_OWORD *)v92 + 5) = *(_OWORD *)v73;
            *((_OWORD *)v92 + 6) = v91;
            long long v93 = *((_OWORD *)v80 + 1);
            *(_OWORD *)(v92 + 15) = *(_OWORD *)v80;
            v92[14] = *((void *)v73 + 4);
            *(_OWORD *)(v92 + 17) = v93;
            v92[19] = *((void *)v80 + 4);
            CGFloat v94 = v87;
            *(CGFloat *)&long long v93 = v88;
            CGFloat v95 = v89;
            CGFloat v96 = v90;
            CGFloat MinY = CGRectGetMinY(*(CGRect *)((char *)&v93 - 8));
            double v98 = v236;
            double v225 = v236 * MinY;
            v265.origin.x = v87;
            v265.origin.y = v88;
            v265.size.width = v89;
            v265.size.height = v90;
            double v99 = v98 * CGRectGetMinY(v265);
            double v100 = v212;
            double v101 = v225;
            double *v73 = v212;
            v73[1] = v101;
            v73[2] = v100;
            v73[3] = v99;
            v73[4] = 0.5;
            v266.origin.x = v87;
            v266.origin.y = v88;
            v266.size.width = v89;
            v266.size.height = v90;
            double v225 = v236 * CGRectGetMaxY(v266);
            v267.origin.x = v87;
            v267.origin.y = v88;
            v267.size.width = v89;
            v267.size.height = v90;
            double v102 = v236 * CGRectGetMaxY(v267);
            double v103 = v225;
            double *v80 = v100;
            v80[1] = v103;
            v80[2] = v100;
            v80[3] = v102;
            v80[4] = 0.5;
            v104 = (int32x4_t *)&v9[4 * v24];
            __int32 v105 = v230;
            v104->i32[0] = v26;
            v104->i32[1] = v105;
            ++v24;
            v104->i32[2] = v50;
            v104->i32[3] = LODWORD(v25);
            v104[1] = v234;
            uint64_t v230 = *(void *)&v25 + 1;
            __int32 v106 = LODWORD(v25);
            uint64_t v50 = *(void *)&v25 + 3;
            v51 = v223;
            *(void *)&v25 += 2;
          }
          *(void *)&CGFloat v239 = *(void *)&v25 + 2;
          v107 = &v51[5 * *(void *)&v25];
          long long v108 = *((_OWORD *)v107 + 1);
          *((_OWORD *)v107 + 5) = *(_OWORD *)v107;
          *((_OWORD *)v107 + 6) = v108;
          v107[14] = v107[4];
          v109 = &v51[5 * v50];
          long long v110 = *((_OWORD *)v109 + 1);
          *((_OWORD *)v109 + 5) = *(_OWORD *)v109;
          *((_OWORD *)v109 + 6) = v110;
          v109[14] = v109[4];
          CGFloat v111 = v87;
          CGFloat v112 = v88;
          CGFloat v113 = v89;
          CGFloat v114 = v227;
          *(CGFloat *)&long long v110 = v227;
          CGFloat v115 = CGRectGetMinY(*(CGRect *)((char *)&v110 - 24));
          double v116 = v236;
          CGFloat v238 = v236 * v115;
          v268.origin.x = v87;
          v268.origin.y = v88;
          v268.size.width = v89;
          v268.size.height = v114;
          CGFloat v117 = CGRectGetMinY(v268);
          void *v107 = 0x3FF0000000000000;
          *((CGFloat *)v107 + 1) = v238;
          v107[2] = 0x3FF0000000000000;
          *((double *)v107 + 3) = v116 * v117;
          v107[4] = 0x3FE0000000000000;
          v269.origin.x = v87;
          v269.origin.y = v88;
          v269.size.width = v89;
          v269.size.height = v114;
          CGFloat v238 = v116 * CGRectGetMaxY(v269);
          v270.origin.x = v87;
          v270.origin.y = v88;
          v270.size.width = v89;
          v270.size.height = v114;
          CGFloat MaxY = CGRectGetMaxY(v270);
          void *v109 = 0x3FF0000000000000;
          *((CGFloat *)v109 + 1) = v238;
          v109[2] = 0x3FF0000000000000;
          *((double *)v109 + 3) = v116 * MaxY;
          v109[4] = 0x3FE0000000000000;
          v86 = v9;
          v119 = (int32x4_t *)&v9[4 * v24];
          __int32 v120 = v230;
          v119->i32[0] = v106;
          v119->i32[1] = v120;
          v119->i32[2] = v50;
          v119->i32[3] = LODWORD(v25);
          v119[1] = v234;
          ++v24;
          uint64_t v50 = *(void *)&v25 + 3;
          CGFloat v25 = v239;
          double v45 = v229;
          CGFloat v85 = v235;
        }
        uint64_t v26 = *(void *)&v25 + 2;
        v121 = &v51[5 * *(void *)&v25];
        long long v122 = *((_OWORD *)v121 + 1);
        *((_OWORD *)v121 + 5) = *(_OWORD *)v121;
        *((_OWORD *)v121 + 6) = v122;
        v121[14] = v121[4];
        v123 = &v51[5 * v50];
        long long v124 = *((_OWORD *)v123 + 1);
        *((_OWORD *)v123 + 5) = *(_OWORD *)v123;
        *((_OWORD *)v123 + 6) = v124;
        v123[14] = v123[4];
        CGFloat v125 = v85;
        *(double *)&long long v124 = v37;
        CGFloat v126 = v39;
        CGFloat v127 = v41;
        CGFloat v128 = CGRectGetMinY(*(CGRect *)((char *)&v124 - 8));
        double v129 = v236;
        double v130 = v236 * v128;
        v271.origin.x = v85;
        v271.origin.y = v37;
        v271.size.width = v39;
        v271.size.height = v41;
        CGFloat v131 = CGRectGetMinY(v271);
        void *v121 = 0;
        *((double *)v121 + 1) = v130;
        v121[2] = 0;
        *((double *)v121 + 3) = v129 * v131;
        v121[4] = 0x3FE0000000000000;
        v272.origin.x = v85;
        v272.origin.y = v37;
        v272.size.width = v39;
        v272.size.height = v41;
        double v132 = v129 * CGRectGetMaxY(v272);
        v273.origin.x = v85;
        v273.origin.y = v37;
        v273.size.width = v39;
        v273.size.height = v41;
        CGFloat v133 = CGRectGetMaxY(v273);
        void *v123 = 0;
        *((double *)v123 + 1) = v132;
        v123[2] = 0;
        *((double *)v123 + 3) = v129 * v133;
        v123[4] = 0x3FE0000000000000;
        v134 = (int32x4_t *)&v86[4 * v24];
        v134->i32[0] = LODWORD(v25);
        v134->i32[1] = v50;
        v134->i32[2] = v50 + 2;
        v134->i32[3] = LODWORD(v25) + 2;
        v134[1] = v234;
        uint64_t v71 = *(void *)&v25 + 3;
        v274.origin.x = v85;
        v274.origin.y = v37;
        v274.size.width = v39;
        v274.size.height = v41;
        if (CGRectGetMinX(v274) <= v215)
        {
          uint64_t v70 = 0;
          ++v24;
          *(void *)&v25 += 2;
        }
        else
        {
          v135 = &v51[5 * *(void *)&v25];
          long long v136 = *((_OWORD *)v121 + 6);
          *((_OWORD *)v135 + 10) = *((_OWORD *)v121 + 5);
          *((_OWORD *)v135 + 11) = v136;
          v137 = &v223[5 * v71];
          long long v138 = *((_OWORD *)v137 + 1);
          *(_OWORD *)(v135 + 25) = *(_OWORD *)v137;
          v135[24] = v121[14];
          *(_OWORD *)(v135 + 27) = v138;
          v135[29] = v137[4];
          CGFloat v139 = v85;
          *(double *)&long long v138 = v37;
          CGFloat v140 = v39;
          CGFloat v141 = v41;
          CGFloat v142 = CGRectGetMinY(*(CGRect *)((char *)&v138 - 8));
          double v143 = v236;
          double v144 = v236 * v142;
          v275.origin.x = v85;
          v275.origin.y = v37;
          v275.size.width = v39;
          v275.size.height = v41;
          double v145 = v143 * CGRectGetMinY(v275);
          double v146 = v213;
          *((double *)v121 + 10) = v213;
          *((double *)v121 + 11) = v144;
          *((double *)v121 + 12) = v146;
          *((double *)v121 + 13) = v145;
          v121[14] = 0x3FE0000000000000;
          v276.origin.x = v85;
          v276.origin.y = v37;
          v276.size.width = v39;
          v276.size.height = v41;
          double v147 = v236 * CGRectGetMaxY(v276);
          v277.origin.x = v85;
          v277.origin.y = v37;
          v277.size.width = v39;
          v277.size.height = v41;
          CGFloat v148 = CGRectGetMaxY(v277);
          uint64_t v70 = 0;
          double v149 = v236;
          *(double *)v137 = v146;
          *((double *)v137 + 1) = v147;
          *((double *)v137 + 2) = v146;
          *((double *)v137 + 3) = v149 * v148;
          v137[4] = 0x3FE0000000000000;
          v51 = v223;
          v150 = (int32x4_t *)&v222[4 * v24 + 4];
          v150->i32[0] = v26;
          v150->i32[1] = v71;
          v150->i32[2] = LODWORD(v25) + 5;
          v150->i32[3] = LODWORD(v25) + 4;
          v150[1] = v234;
          v24 += 2;
          uint64_t v71 = *(void *)&v25 + 5;
          uint64_t v26 = *(void *)&v25 + 4;
          *(void *)&v25 += 4;
        }
        double v43 = v228;
      }
      else
      {
        if ([(UIKeyboardSquishTransition *)v218 disableMeshOptimization])
        {
          v52 = (double *)&v51[5 * *(void *)&v25];
          v248.origin.x = v35;
          v248.origin.y = v37;
          v248.size.width = v39;
          v248.size.height = v41;
          CGFloat v53 = CGRectGetMinX(v248);
          double v54 = v224;
          double v228 = v43;
          CGFloat v239 = v224 * v53;
          v249.origin.x = v35;
          v249.origin.y = v37;
          v249.size.width = v39;
          v249.size.height = v41;
          CGFloat v55 = CGRectGetMinY(v249);
          CGFloat v56 = v41;
          CGFloat v57 = v35;
          double v58 = v236;
          double v59 = v236 * v55;
          v250.origin.x = v57;
          v250.origin.y = v37;
          v250.size.width = v39;
          v250.size.height = v56;
          CGFloat v60 = CGRectGetMinX(v250);
          double v229 = v45;
          double v61 = v54 * v60;
          v251.origin.x = v57;
          v251.origin.y = v37;
          v251.size.width = v39;
          v251.size.height = v56;
          CGFloat v62 = CGRectGetMinY(v251);
          double *v52 = v239;
          v52[1] = v59;
          v52[2] = v61;
          v52[3] = v58 * v62;
          v52[4] = 0.5;
          v63 = (double *)&v51[5 * v50];
          v252.origin.x = v57;
          v252.origin.y = v37;
          v252.size.width = v39;
          v252.size.height = v56;
          double v64 = v54 * CGRectGetMinX(v252);
          v253.origin.x = v57;
          v253.origin.y = v37;
          v253.size.width = v39;
          v253.size.height = v56;
          double v65 = v58 * CGRectGetMaxY(v253);
          v254.origin.x = v57;
          v254.origin.y = v37;
          v254.size.width = v39;
          v254.size.height = v56;
          double v66 = v54 * CGRectGetMinX(v254);
          v255.origin.x = v57;
          v255.origin.y = v37;
          v255.size.width = v39;
          v255.size.height = v56;
          CGFloat v67 = CGRectGetMaxY(v255);
          CGFloat v68 = v39;
          double v69 = v56;
          uint64_t v70 = 0;
          double *v63 = v64;
          v63[1] = v65;
          double v43 = v228;
          v63[2] = v66;
          v63[3] = v58 * v67;
          double v45 = v229;
          v63[4] = 0.5;
          uint64_t v71 = *(void *)&v25 + 1;
          uint64_t v26 = *(void *)&v25;
          double v72 = v231;
          goto LABEL_25;
        }
        uint64_t v70 = 2;
        uint64_t v71 = v230;
      }
      double v72 = v231;
      CGFloat v68 = v39;
      double v69 = v41;
LABEL_25:
      uint64_t v230 = v26;
      double v231 = *(double *)&v71;
      CGFloat v151 = v43 + 4.0;
      CGFloat v152 = v72 + -8.0;
      CGFloat v153 = v45 + 4.0;
      uint64_t v154 = *(void *)&v25 - v70;
      CGFloat v155 = v237 + -8.0;
      uint64_t v156 = *(void *)&v25 - v70 + 2;
      uint64_t v157 = *(void *)&v25 + (v70 ^ 3);
      LODWORD(v228) = LODWORD(v25) - v70 + 4;
      LODWORD(v227) = LODWORD(v25) - v70 + 5;
      LODWORD(v229) = LODWORD(v25) - v70 + 6;
      uint64_t v158 = *(void *)&v25 + (v70 ^ 7);
      CGFloat v159 = v235;
      CGFloat v160 = v235;
      double v161 = v37;
      double v162 = v68;
      double v163 = v69;
      CGFloat MaxX = CGRectGetMaxX(*(CGRect *)(&v68 - 2));
      CGFloat v239 = v37;
      double v165 = v224;
      CGFloat v226 = v224 * MaxX;
      v278.origin.x = v159;
      v278.origin.y = v239;
      v278.size.width = v162;
      v278.size.height = v69;
      CGFloat v166 = CGRectGetMinY(v278);
      CGFloat v238 = v69;
      double v225 = v236 * v166;
      v279.origin.x = v159;
      v279.origin.y = v239;
      v279.size.width = v162;
      v279.size.height = v69;
      CGFloat v167 = CGRectGetMaxX(v279);
      CGFloat v237 = v162;
      double v168 = v165 * v167;
      v280.origin.x = v159;
      v280.origin.y = v239;
      v280.size.width = v162;
      v280.size.height = v238;
      CGFloat v169 = CGRectGetMinY(v280);
      double v170 = v236;
      v171 = v51;
      v172 = (CGFloat *)&v51[5 * v154];
      double v173 = v225;
      v172[10] = v226;
      v172[11] = v173;
      v172[12] = v168;
      v172[13] = v170 * v169;
      v172[14] = 0.5;
      v174 = (double *)&v171[5 * v157];
      v281.origin.x = v159;
      v281.origin.y = v239;
      v281.size.width = v237;
      v281.size.height = v238;
      CGFloat v226 = v165 * CGRectGetMaxX(v281);
      v282.origin.x = v159;
      v282.origin.y = v239;
      v282.size.width = v237;
      v282.size.height = v238;
      double v225 = v170 * CGRectGetMaxY(v282);
      v283.origin.x = v159;
      v283.origin.y = v239;
      v283.size.width = v237;
      v283.size.height = v238;
      double v175 = v165 * CGRectGetMaxX(v283);
      v284.origin.x = v159;
      v284.origin.y = v239;
      v284.size.width = v237;
      v284.size.height = v238;
      CGFloat v176 = CGRectGetMaxY(v284);
      double v177 = v225;
      double *v174 = v226;
      v174[1] = v177;
      v174[2] = v175;
      v174[3] = v170 * v176;
      v174[4] = 0.5;
      v285.origin.x = v151;
      v285.origin.y = v153;
      v285.size.width = v152;
      v285.size.height = v155;
      CGFloat v226 = v165 * CGRectGetMinX(v285);
      v286.origin.x = v151;
      v286.origin.y = v153;
      v286.size.width = v152;
      v286.size.height = v155;
      double v178 = v170 * CGRectGetMinY(v286);
      v287.origin.x = v151;
      v287.origin.y = v153;
      v287.size.width = v152;
      v287.size.height = v155;
      double v179 = v165 * CGRectGetMinX(v287);
      v288.origin.x = v151;
      v288.origin.y = v153;
      v288.size.width = v152;
      v288.size.height = v155;
      CGFloat v180 = CGRectGetMinY(v288);
      v172[20] = v226;
      v172[21] = v178;
      v172[22] = v179;
      v172[23] = v170 * v180;
      v172[24] = 0.5;
      v289.origin.x = v151;
      v289.origin.y = v153;
      v289.size.width = v152;
      v289.size.height = v155;
      CGFloat v226 = v165 * CGRectGetMinX(v289);
      v290.origin.x = v151;
      v290.origin.y = v153;
      v290.size.width = v152;
      v290.size.height = v155;
      double v181 = v170 * CGRectGetMaxY(v290);
      v291.origin.x = v151;
      v291.origin.y = v153;
      v291.size.width = v152;
      v291.size.height = v155;
      double v182 = v165 * CGRectGetMinX(v291);
      v292.origin.x = v151;
      v292.origin.y = v153;
      v292.size.width = v152;
      v292.size.height = v155;
      CGFloat v183 = CGRectGetMaxY(v292);
      v172[25] = v226;
      v172[26] = v181;
      v172[27] = v182;
      v172[28] = v170 * v183;
      v172[29] = 0.5;
      v293.origin.x = v151;
      v293.origin.y = v153;
      v293.size.width = v152;
      v293.size.height = v155;
      CGFloat v226 = v165 * CGRectGetMaxX(v293);
      v294.origin.x = v151;
      v294.origin.y = v153;
      v294.size.width = v152;
      v294.size.height = v155;
      double v184 = v170 * CGRectGetMinY(v294);
      v295.origin.x = v151;
      v295.origin.y = v153;
      v295.size.width = v152;
      v295.size.height = v155;
      double v185 = v165 * CGRectGetMaxX(v295);
      v296.origin.x = v151;
      v296.origin.y = v153;
      v296.size.width = v152;
      v296.size.height = v155;
      CGFloat v186 = CGRectGetMinY(v296);
      v172[30] = v226;
      v172[31] = v184;
      v172[32] = v185;
      v172[33] = v170 * v186;
      v172[34] = 0.5;
      v187 = (double *)&v171[5 * v158];
      v297.origin.x = v151;
      v297.origin.y = v153;
      v297.size.width = v152;
      v297.size.height = v155;
      CGFloat v226 = v165 * CGRectGetMaxX(v297);
      v298.origin.x = v151;
      v298.origin.y = v153;
      v298.size.width = v152;
      v298.size.height = v155;
      double v188 = v170 * CGRectGetMaxY(v298);
      v299.origin.x = v151;
      v299.origin.y = v153;
      v299.size.width = v152;
      v299.size.height = v155;
      double v189 = v165 * CGRectGetMaxX(v299);
      v300.origin.x = v151;
      v300.origin.y = v153;
      v300.size.width = v152;
      v300.size.height = v155;
      CGFloat v190 = CGRectGetMaxY(v300);
      double *v187 = v226;
      v187[1] = v188;
      double v14 = v239;
      CGFloat v15 = v238;
      v187[2] = v189;
      v187[3] = v170 * v190;
      double v16 = v237;
      v187[4] = 0.5;
      id v9 = v222;
      v191 = (int32x4_t *)&v222[4 * v24];
      __int32 v192 = v230;
      __int32 v193 = LODWORD(v231);
      v191->i32[0] = v230;
      v191->i32[1] = v193;
      __int32 v194 = LODWORD(v227);
      __int32 v195 = LODWORD(v228);
      v191->i32[2] = LODWORD(v227);
      v191->i32[3] = v195;
      int32x4_t v196 = v234;
      v191[1] = v234;
      v191[2].i32[0] = v192;
      v191[2].i32[1] = v156;
      __int32 v197 = LODWORD(v229);
      v191[2].i32[2] = LODWORD(v229);
      v191[2].i32[3] = v195;
      v191[3] = v196;
      uint64_t v26 = v156;
      v191[4].i32[0] = v156;
      v191[4].i32[1] = v157;
      v191[4].i32[2] = v158;
      v191[4].i32[3] = v197;
      v191[5] = v196;
      v191[6].i32[0] = v193;
      v191[6].i32[1] = v194;
      v191[6].i32[2] = v158;
      v191[6].i32[3] = v157;
      uint64_t v230 = v157;
      v191[7] = v196;
      v191[8].i32[0] = v195;
      v191[8].i32[1] = v197;
      v191[8].i32[2] = v158;
      v191[8].i32[3] = v194;
      v24 += 5;
      *(void *)&CGFloat v25 = v154 + 8;
      v191[9] = v196;

      uint64_t v27 = v233 + 1;
    }
    while (v221 != v233 + 1);
    CGFloat v13 = v235;
    uint64_t v221 = [v216 countByEnumeratingWithState:&v240 objects:v244 count:16];
  }
  while (v221);
LABEL_29:

  CGFloat v198 = v13;
  v301.origin.x = v13;
  v301.origin.y = v14;
  v301.size.width = v16;
  v301.size.height = v15;
  if (CGRectIsNull(v301))
  {
    v199 = v223;
  }
  else
  {
    v199 = v223;
    v200 = (double *)&v223[5 * *(void *)&v25];
    v302.origin.x = v13;
    v302.origin.y = v14;
    v302.size.width = v16;
    v302.size.height = v15;
    CGFloat v201 = CGRectGetMinY(v302);
    double v202 = v236;
    double v203 = v236 * v201;
    v303.origin.x = v198;
    v303.origin.y = v14;
    v303.size.width = v16;
    v303.size.height = v15;
    CGFloat v204 = CGRectGetMinY(v303);
    double *v200 = 1.0;
    v200[1] = v203;
    v200[2] = 1.0;
    v200[3] = v202 * v204;
    v200[4] = 0.5;
    v304.origin.x = v198;
    v304.origin.y = v14;
    v304.size.width = v16;
    v304.size.height = v15;
    double v205 = v202 * CGRectGetMaxY(v304);
    v305.origin.x = v198;
    v305.origin.y = v14;
    v305.size.width = v16;
    v305.size.height = v15;
    CGFloat v206 = CGRectGetMaxY(v305);
    v200[5] = 1.0;
    v200[6] = v205;
    v200[7] = 1.0;
    v200[8] = v202 * v206;
    v200[9] = 0.5;
    v207 = (int32x4_t *)&v9[4 * v24];
    __int32 v208 = v230;
    v207->i32[0] = v26;
    v207->i32[1] = v208;
    v207->i32[2] = LODWORD(v25) + 1;
    v207->i32[3] = LODWORD(v25);
    v207[1] = vdupq_n_s32(0x7F7FFFFFu);
    ++v24;
    *(void *)&v25 += 2;
  }
  v209 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:*(void *)&v25 vertices:v199 faceCount:v24 faces:v9 depthNormalization:*MEMORY[0x1E4F39ED8]];

  return v209;
}

- (id)meshTransformForKeyplane:(id)a3 toKeyplane:(id)a4
{
  uint64_t v373 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 == v7)
  {
    CGRect v301 = [(UIKeyboardSquishTransition *)self symmetricMeshTransformForKeyplane:v6];
  }
  else
  {
    uint64_t v8 = [(UIKeyboardSquishTransition *)self commonVisibleKeys];
    if ([(UIKeyboardSquishTransition *)self disableMeshOptimization]) {
      uint64_t v9 = 35;
    }
    else {
      uint64_t v9 = 20;
    }
    uint64_t v10 = 5 * [v8 count] + v9;
    uint64_t v11 = [v8 count];
    v314[1] = v314;
    MEMORY[0x1F4188790](v11);
    uint64_t v12 = &v314[-4 * v10];
    MEMORY[0x1F4188790](v13);
    v331 = &v314[-v14];
    CGFloat v15 = *MEMORY[0x1E4F1DB20];
    CGFloat v359 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v358 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v357 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    [v6 frame];
    double v17 = v16;
    double v366 = 1.0 / v18;
    [v7 frame];
    double v20 = v19;
    double v367 = 1.0 / v21;
    [v6 primaryKeylayoutOffset];
    double v23 = v22;
    [v6 primaryKeylayoutWidthRatio];
    double v25 = v24;
    [v7 primaryKeylayoutOffset];
    double v27 = v26;
    [v7 primaryKeylayoutWidthRatio];
    double v29 = v28;
    id v330 = [(UIKeyboardSquishTransition *)self geometriesForKeyplane:v6];
    id v329 = [(UIKeyboardSquishTransition *)self geometriesForKeyplane:v7];
    long long v368 = 0u;
    long long v369 = 0u;
    long long v370 = 0u;
    long long v371 = 0u;
    id v321 = v8;
    uint64_t v332 = [v321 countByEnumeratingWithState:&v368 objects:v372 count:16];
    if (v332)
    {
      uint64_t v30 = 0;
      CGFloat v31 = 0.0;
      uint64_t v325 = *(void *)v369;
      CGFloat v319 = v23 + v17 * v25;
      double v316 = 1.0 / v17 * v319;
      double v315 = 1.0 / v20 * (v27 + v20 * v29);
      CGFloat v320 = v23;
      double v364 = 1.0 / v17;
      double v318 = v23 * (1.0 / v17);
      double v339 = NAN;
      double v365 = 1.0 / v20;
      double v317 = v27 * (1.0 / v20);
      CGFloat v32 = v357;
      double v33 = v357;
      CGFloat v34 = v358;
      double v35 = v358;
      CGFloat v36 = v359;
      double v37 = v359;
      double v38 = v15;
      double v338 = NAN;
      id v328 = v6;
      id v327 = v7;
      CGFloat v39 = v12;
      v335 = v12;
      v326 = self;
      do
      {
        uint64_t v40 = 0;
        do
        {
          CGFloat v360 = v38;
          CGFloat v355 = v37;
          CGFloat v354 = v35;
          CGFloat v361 = v33;
          CGFloat v333 = v15;
          CGFloat v334 = v36;
          CGFloat v341 = v34;
          CGFloat v336 = v32;
          if (*(void *)v369 != v325) {
            objc_enumerationMutation(v321);
          }
          uint64_t v346 = v40;
          uint64_t v41 = *(void *)(*((void *)&v368 + 1) + 8 * v40);
          double v42 = [v6 keys];
          uint64_t v43 = [v42 indexOfObject:v41];
          double v44 = [v330 objectAtIndex:v43];

          double v45 = [v7 keys];
          uint64_t v46 = [v45 indexOfObject:v41];
          double v47 = [v329 objectAtIndex:v46];

          [v44 frame];
          CGFloat v49 = v48;
          double v51 = v50;
          CGFloat v53 = v52;
          CGFloat v55 = v54;
          id v345 = v44;
          [v44 paddedFrame];
          double v57 = v56;
          double v59 = v58;
          CGFloat v349 = v60;
          CGFloat v350 = v61;
          [v47 frame];
          CGFloat v63 = v62;
          CGFloat v359 = v64;
          CGFloat v358 = v65;
          CGFloat v357 = v66;
          id v344 = v47;
          [v47 paddedFrame];
          double v343 = v67;
          CGFloat v347 = v68;
          double v342 = v69;
          CGFloat v348 = v70;
          v375.origin.x = v360;
          double v71 = v355;
          v375.origin.y = v355;
          v375.size.width = v354;
          v375.size.CGFloat height = v361;
          BOOL IsNull = CGRectIsNull(v375);
          uint64_t v73 = *(void *)&v31 + 1;
          int32x4_t v351 = vdupq_n_s32(0x7F7FFFFFu);
          CGFloat v352 = v53;
          CGFloat v363 = v51;
          CGFloat v356 = v49;
          CGFloat v362 = v63;
          CGFloat v353 = v55;
          if (IsNull || v71 != v51)
          {
            double v337 = v57;
            double v340 = v59;
            double v75 = v331;
            double v99 = (double *)&v331[5 * *(void *)&v31];
            v384.origin.x = v49;
            v384.origin.y = v51;
            v384.size.width = v53;
            v384.size.CGFloat height = v55;
            double v324 = v364 * CGRectGetMinX(v384);
            v385.origin.x = v49;
            v385.origin.y = v51;
            v385.size.width = v53;
            v385.size.CGFloat height = v55;
            double v323 = v366 * CGRectGetMinY(v385);
            v386.origin.x = v63;
            CGFloat v100 = v359;
            v386.origin.y = v359;
            CGFloat v101 = v358;
            v386.size.width = v358;
            CGFloat v102 = v357;
            v386.size.CGFloat height = v357;
            double v322 = v365 * CGRectGetMinX(v386);
            v387.origin.x = v63;
            v387.origin.y = v100;
            v387.size.width = v101;
            v387.size.CGFloat height = v102;
            double v103 = v367 * CGRectGetMinY(v387);
            double v104 = v323;
            *double v99 = v324;
            v99[1] = v104;
            v99[2] = v322;
            v99[3] = v103;
            v99[4] = 0.5;
            __int32 v105 = (double *)&v75[5 * v73];
            v388.origin.x = v49;
            v388.origin.y = v51;
            v388.size.width = v53;
            v388.size.CGFloat height = v55;
            double v324 = v364 * CGRectGetMinX(v388);
            v389.origin.x = v49;
            v389.origin.y = v51;
            v389.size.width = v53;
            v389.size.CGFloat height = v55;
            double v106 = v366 * CGRectGetMaxY(v389);
            v390.origin.x = v63;
            v390.origin.y = v100;
            v390.size.width = v101;
            v390.size.CGFloat height = v102;
            double v107 = v365 * CGRectGetMinX(v390);
            v391.origin.x = v63;
            v391.origin.y = v100;
            v391.size.width = v101;
            v391.size.CGFloat height = v102;
            double v108 = v367 * CGRectGetMaxY(v391);
            *__int32 v105 = v324;
            v105[1] = v106;
            v105[2] = v107;
            v105[3] = v108;
            v105[4] = 0.5;
            if ((IsNull | ![(UIKeyboardSquishTransition *)self _allowFacesToAdjoinToAdjacentFaces]))
            {
              CGFloat v109 = v353;
              CGFloat v110 = v352;
              CGFloat v111 = v363;
              CGFloat v112 = v39;
              CGFloat v113 = v358;
            }
            else
            {
              CGFloat v114 = v360;
              v392.origin.x = v360;
              CGFloat v115 = v355;
              v392.origin.y = v355;
              CGFloat v116 = v354;
              v392.size.width = v354;
              CGFloat v117 = v361;
              v392.size.CGFloat height = v361;
              CGFloat v112 = v39;
              if (CGRectGetMaxX(v392) >= v319)
              {
                __int32 v137 = LODWORD(v338);
                CGFloat v127 = v341;
                CGFloat v126 = v334;
                CGFloat v125 = v333;
              }
              else
              {
                long long v118 = *((_OWORD *)v99 + 1);
                v119 = &v75[5 * *(void *)&v31];
                *((_OWORD *)v119 + 5) = *(_OWORD *)v99;
                *((_OWORD *)v119 + 6) = v118;
                long long v120 = *((_OWORD *)v105 + 1);
                *(_OWORD *)(v119 + 15) = *(_OWORD *)v105;
                v119[14] = *((void *)v99 + 4);
                *(_OWORD *)(v119 + 17) = v120;
                v119[19] = *((void *)v105 + 4);
                CGFloat v121 = v114;
                *(CGFloat *)&long long v120 = v115;
                CGFloat v122 = v116;
                CGFloat v123 = v117;
                double v124 = v366 * CGRectGetMinY(*(CGRect *)((char *)&v120 - 8));
                CGFloat v125 = v333;
                v393.origin.x = v333;
                CGFloat v126 = v334;
                v393.origin.y = v334;
                CGFloat v127 = v341;
                v393.size.width = v341;
                CGFloat v128 = v116;
                CGFloat v129 = v336;
                v393.size.CGFloat height = v336;
                CGFloat MinY = CGRectGetMinY(v393);
                double v131 = v367;
                double v132 = v316;
                *double v99 = v316;
                v99[1] = v124;
                double v133 = v315;
                v99[2] = v315;
                v99[3] = v131 * MinY;
                v99[4] = 0.5;
                v394.origin.x = v360;
                v394.origin.y = v355;
                v394.size.width = v128;
                v394.size.CGFloat height = v361;
                double v324 = v366 * CGRectGetMaxY(v394);
                v395.origin.x = v125;
                v395.origin.y = v126;
                v395.size.width = v127;
                v395.size.CGFloat height = v129;
                CGFloat v116 = v128;
                double v134 = v131 * CGRectGetMaxY(v395);
                CGFloat v115 = v355;
                *__int32 v105 = v132;
                CGFloat v114 = v360;
                v105[1] = v324;
                v105[2] = v133;
                CGFloat v117 = v361;
                v105[3] = v134;
                v105[4] = 0.5;
                v135 = (int32x4_t *)&v39[4 * v30];
                __int32 v136 = LODWORD(v339);
                v135->i32[0] = LODWORD(v338);
                v135->i32[1] = v136;
                ++v30;
                v135->i32[2] = v73;
                v135->i32[3] = LODWORD(v31);
                v135[1] = v351;
                *(void *)&double v339 = *(void *)&v31 + 1;
                __int32 v137 = LODWORD(v31);
                uint64_t v73 = *(void *)&v31 + 3;
                *(void *)&v31 += 2;
              }
              CGFloat v341 = v127;
              *(void *)&CGFloat v360 = *(void *)&v31 + 2;
              double v144 = &v75[5 * *(void *)&v31];
              long long v145 = *((_OWORD *)v144 + 1);
              *((_OWORD *)v144 + 5) = *(_OWORD *)v144;
              *((_OWORD *)v144 + 6) = v145;
              v144[14] = v144[4];
              double v146 = &v75[5 * v73];
              long long v147 = *((_OWORD *)v146 + 1);
              *((_OWORD *)v146 + 5) = *(_OWORD *)v146;
              *((_OWORD *)v146 + 6) = v147;
              v146[14] = v146[4];
              CGFloat v148 = v114;
              *(CGFloat *)&long long v147 = v115;
              CGFloat v149 = v116;
              CGFloat v150 = v117;
              CGFloat v151 = CGRectGetMinY(*(CGRect *)((char *)&v147 - 8));
              double v152 = v366;
              CGFloat v153 = v114;
              double v154 = v366 * v151;
              v396.origin.x = v125;
              v396.origin.y = v126;
              v396.size.width = v127;
              CGFloat v155 = v336;
              v396.size.CGFloat height = v336;
              CGFloat v156 = CGRectGetMinY(v396);
              *double v144 = 0x3FF0000000000000;
              v397.origin.y = v115;
              CGFloat v157 = v126;
              double v158 = v367;
              *((double *)v144 + 1) = v154;
              v144[2] = 0x3FF0000000000000;
              *((double *)v144 + 3) = v158 * v156;
              v144[4] = 0x3FE0000000000000;
              v397.origin.x = v153;
              v397.size.width = v116;
              v397.size.CGFloat height = v361;
              double v159 = v152 * CGRectGetMaxY(v397);
              v398.origin.x = v125;
              v398.origin.y = v157;
              v398.size.width = v341;
              v398.size.CGFloat height = v155;
              CGFloat MaxY = CGRectGetMaxY(v398);
              *double v146 = 0x3FF0000000000000;
              *((double *)v146 + 1) = v159;
              v146[2] = 0x3FF0000000000000;
              *((double *)v146 + 3) = v158 * MaxY;
              v146[4] = 0x3FE0000000000000;
              double v161 = (int32x4_t *)&v112[4 * v30];
              __int32 v162 = LODWORD(v339);
              v161->i32[0] = v137;
              v161->i32[1] = v162;
              v161->i32[2] = v73;
              v161->i32[3] = LODWORD(v31);
              v161[1] = v351;
              ++v30;
              uint64_t v73 = *(void *)&v31 + 3;
              CGFloat v31 = v360;
              CGFloat v111 = v363;
              CGFloat v109 = v353;
              CGFloat v113 = v358;
              CGFloat v110 = v352;
            }
            CGFloat v163 = v362;
            *(void *)&double v97 = *(void *)&v31 + 2;
            v164 = &v75[5 * *(void *)&v31];
            long long v165 = *((_OWORD *)v164 + 1);
            *((_OWORD *)v164 + 5) = *(_OWORD *)v164;
            *((_OWORD *)v164 + 6) = v165;
            v164[14] = v164[4];
            CGFloat v166 = &v75[5 * v73];
            long long v167 = *((_OWORD *)v166 + 1);
            *((_OWORD *)v166 + 5) = *(_OWORD *)v166;
            *((_OWORD *)v166 + 6) = v167;
            v166[14] = v166[4];
            CGFloat v168 = v356;
            CGFloat v169 = v356;
            *(CGFloat *)&long long v167 = v110;
            CGFloat v170 = CGRectGetMinY(*(CGRect *)(&v111 - 1));
            double v171 = v366;
            double v172 = v366 * v170;
            v399.origin.x = v163;
            CGFloat v173 = v359;
            v399.origin.y = v359;
            v399.size.width = v113;
            CGFloat v174 = v357;
            v399.size.CGFloat height = v357;
            CGFloat v175 = CGRectGetMinY(v399);
            void *v164 = 0;
            double v176 = v367;
            *((double *)v164 + 1) = v172;
            v164[2] = 0;
            *((double *)v164 + 3) = v176 * v175;
            v164[4] = 0x3FE0000000000000;
            v400.origin.x = v168;
            v400.origin.y = v363;
            v400.size.width = v110;
            v400.size.CGFloat height = v353;
            double v177 = v171 * CGRectGetMaxY(v400);
            double v178 = v362;
            v401.origin.x = v362;
            v401.origin.y = v173;
            v401.size.width = v113;
            v401.size.CGFloat height = v174;
            CGFloat v179 = CGRectGetMaxY(v401);
            *CGFloat v166 = 0;
            *((double *)v166 + 1) = v177;
            CGFloat v180 = v110;
            CGFloat v181 = v353;
            CGFloat v182 = v363;
            v166[2] = 0;
            *((double *)v166 + 3) = v176 * v179;
            v166[4] = 0x3FE0000000000000;
            CGFloat v183 = (int32x4_t *)&v112[4 * v30];
            v183->i32[0] = LODWORD(v31);
            v183->i32[1] = v73;
            v183->i32[2] = v73 + 2;
            v183->i32[3] = LODWORD(v31) + 2;
            v183[1] = v351;
            *(void *)&double v96 = *(void *)&v31 + 3;
            v402.origin.x = v168;
            v402.origin.y = v182;
            v402.size.width = v180;
            v402.size.CGFloat height = v181;
            if (CGRectGetMinX(v402) <= v320)
            {
              uint64_t v94 = 0;
              ++v30;
              *(void *)&v31 += 2;
              double v98 = v366;
              double v93 = v181;
            }
            else
            {
              double v184 = &v75[5 * *(void *)&v31];
              long long v186 = *((_OWORD *)v164 + 5);
              long long v187 = *((_OWORD *)v164 + 6);
              double v185 = (double *)(v164 + 10);
              *((_OWORD *)v184 + 10) = v186;
              *((_OWORD *)v184 + 11) = v187;
              int v188 = LODWORD(v31) + 3;
              double v189 = &v75[5 * *(void *)&v96];
              long long v190 = *((_OWORD *)v189 + 1);
              *(_OWORD *)(v184 + 25) = *(_OWORD *)v189;
              *(void *)&double v191 = *(void *)&v31 + 4;
              v184[24] = *((void *)v185 + 4);
              *(void *)&double v192 = *(void *)&v31 + 5;
              *(_OWORD *)(v184 + 27) = v190;
              v184[29] = v189[4];
              *(CGFloat *)&long long v186 = v168;
              *(CGFloat *)&long long v190 = v182;
              CGFloat v193 = v180;
              CGFloat v194 = v181;
              CGFloat v195 = CGRectGetMinY(*(CGRect *)&v186);
              CGFloat v196 = v178;
              CGFloat v197 = v181;
              CGFloat v198 = v180;
              v403.size.CGFloat height = v174;
              CGFloat v199 = v168;
              double v200 = v366 * v195;
              v403.origin.x = v196;
              CGFloat v201 = v359;
              v403.origin.y = v359;
              CGFloat v202 = v358;
              v403.size.width = v358;
              CGFloat v203 = CGRectGetMinY(v403);
              double v204 = v367;
              v404.size.width = v198;
              v404.size.CGFloat height = v197;
              double v205 = v318;
              *double v185 = v318;
              v185[1] = v200;
              double v206 = v317;
              v185[2] = v317;
              v185[3] = v204 * v203;
              v185[4] = 0.5;
              v404.origin.x = v199;
              v404.origin.y = v182;
              CGFloat height = v404.size.height;
              CGFloat v208 = CGRectGetMaxY(v404);
              double v209 = v366;
              double v210 = v366 * v208;
              v405.origin.x = v362;
              v405.origin.y = v201;
              v405.size.width = v202;
              v405.size.CGFloat height = v357;
              CGFloat v211 = CGRectGetMaxY(v405);
              uint64_t v94 = 0;
              *(double *)double v189 = v205;
              *((double *)v189 + 1) = v210;
              *((double *)v189 + 2) = v206;
              *((double *)v189 + 3) = v204 * v211;
              v189[4] = 0x3FE0000000000000;
              double v212 = (int32x4_t *)&v335[4 * v30 + 4];
              v212->i32[0] = LODWORD(v97);
              v212->i32[1] = v188;
              v212->i32[2] = LODWORD(v192);
              v212->i32[3] = LODWORD(v191);
              v212[1] = v351;
              v30 += 2;
              double v96 = v192;
              double v97 = v191;
              CGFloat v31 = v191;
              double v98 = v209;
              double v93 = height;
            }
            double v59 = v340;
            double v57 = v337;
            double v138 = v350;
            double v139 = v349;
            double v140 = v348;
            double v141 = v347;
            double v142 = v343;
            double v143 = v342;
          }
          else
          {
            BOOL v74 = [(UIKeyboardSquishTransition *)self disableMeshOptimization];
            double v75 = v331;
            if (v74)
            {
              double v76 = (CGFloat *)&v331[5 * *(void *)&v31];
              v376.origin.x = v49;
              v376.origin.y = v51;
              v376.size.width = v53;
              v376.size.CGFloat height = v55;
              CGFloat MinX = CGRectGetMinX(v376);
              double v340 = v59;
              CGFloat v361 = v364 * MinX;
              v377.origin.x = v49;
              v377.origin.y = v51;
              v377.size.width = v53;
              v377.size.CGFloat height = v55;
              CGFloat v78 = CGRectGetMinY(v377);
              double v337 = v57;
              CGFloat v360 = v366 * v78;
              v378.origin.x = v63;
              CGFloat v79 = v359;
              v378.origin.y = v359;
              CGFloat v80 = v358;
              v378.size.width = v358;
              CGFloat v81 = v357;
              v378.size.CGFloat height = v357;
              double v82 = v365 * CGRectGetMinX(v378);
              v379.origin.x = v63;
              v379.origin.y = v79;
              v379.size.width = v80;
              v379.size.CGFloat height = v81;
              CGFloat v83 = CGRectGetMinY(v379);
              double v84 = v367;
              CGFloat v85 = v360;
              *double v76 = v361;
              v76[1] = v85;
              v76[2] = v82;
              v76[3] = v84 * v83;
              v76[4] = 0.5;
              v86 = (CGFloat *)&v75[5 * v73];
              v380.origin.x = v49;
              v380.origin.y = v51;
              v380.size.width = v53;
              CGFloat v87 = v353;
              v380.size.CGFloat height = v353;
              CGFloat v361 = v364 * CGRectGetMinX(v380);
              v381.origin.x = v49;
              v381.origin.y = v51;
              v381.size.width = v53;
              CGFloat v88 = v362;
              v381.size.CGFloat height = v87;
              CGFloat v89 = CGRectGetMaxY(v381);
              double v90 = v366;
              CGFloat v360 = v366 * v89;
              v382.origin.x = v88;
              v382.origin.y = v79;
              v382.size.width = v80;
              v382.size.CGFloat height = v81;
              double v91 = v365 * CGRectGetMinX(v382);
              v383.origin.x = v88;
              v383.origin.y = v79;
              v383.size.width = v80;
              v383.size.CGFloat height = v81;
              CGFloat v92 = CGRectGetMaxY(v383);
              double v93 = v87;
              uint64_t v94 = 0;
              double v59 = v340;
              CGFloat v95 = v360;
              CGFloat *v86 = v361;
              v86[1] = v95;
              double v57 = v337;
              v86[2] = v91;
              v86[3] = v84 * v92;
              v86[4] = 0.5;
              *(void *)&double v96 = *(void *)&v31 + 1;
              double v97 = v31;
              double v98 = v90;
            }
            else
            {
              uint64_t v94 = 2;
              double v98 = v366;
              double v93 = v55;
              double v97 = v338;
              double v96 = v339;
            }
            double v138 = v350;
            double v139 = v349;
            double v140 = v348;
            double v141 = v347;
            double v142 = v343;
            double v143 = v342;
          }
          double v342 = v97;
          double v343 = v96;
          double v213 = v98;
          CGFloat v360 = v57 + 4.0;
          CGFloat v361 = v139 + -8.0;
          CGFloat v354 = v59 + 4.0;
          CGFloat v347 = v138 + -8.0;
          CGFloat v349 = v142 + 4.0;
          CGFloat v350 = v143 + -8.0;
          uint64_t v214 = *(void *)&v31 - v94;
          *(void *)&double v215 = *(void *)&v31 - v94 + 2;
          *(void *)&double v216 = *(void *)&v31 + (v94 ^ 3);
          CGFloat v355 = v141 + 4.0;
          LODWORD(v341) = LODWORD(v31) - v94 + 4;
          CGFloat v348 = v140 + -8.0;
          LODWORD(v340) = LODWORD(v31) - v94 + 5;
          __int32 v217 = LODWORD(v31) - v94 + 6;
          uint64_t v218 = *(void *)&v31 + (v94 ^ 7);
          CGFloat v219 = v356;
          CGFloat v220 = v356;
          CGFloat v221 = v363;
          CGFloat v222 = v363;
          CGFloat v223 = v352;
          CGFloat v224 = v352;
          CGFloat v225 = v93;
          CGFloat MaxX = CGRectGetMaxX(*(CGRect *)(&v93 - 3));
          double v227 = v364;
          double v339 = v364 * MaxX;
          v406.origin.x = v219;
          v406.origin.y = v221;
          v406.size.width = v223;
          v406.size.CGFloat height = v225;
          double v228 = v213 * CGRectGetMinY(v406);
          double v229 = v362;
          v407.origin.x = v362;
          CGFloat v230 = v359;
          v407.origin.y = v359;
          CGFloat v231 = v358;
          v407.size.width = v358;
          CGFloat v232 = v357;
          v407.size.CGFloat height = v357;
          CGFloat v233 = CGRectGetMaxX(v407);
          CGFloat v234 = v229;
          double v235 = v365 * v233;
          v408.origin.x = v234;
          v408.origin.y = v230;
          v408.size.width = v231;
          v408.size.CGFloat height = v232;
          double v236 = v367 * CGRectGetMinY(v408);
          CGFloat v237 = (double *)&v75[5 * v214];
          v237[10] = v339;
          v237[11] = v228;
          v237[12] = v235;
          v237[13] = v236;
          v237[14] = 0.5;
          CGFloat v238 = v75;
          CGFloat v239 = (double *)&v75[5 * *(void *)&v216];
          CGFloat v240 = v356;
          v409.origin.x = v356;
          CGFloat v241 = v363;
          v409.origin.y = v363;
          v409.size.width = v223;
          v409.size.CGFloat height = v225;
          double v242 = v227 * CGRectGetMaxX(v409);
          v410.origin.x = v240;
          v410.origin.y = v241;
          v410.size.width = v223;
          v410.size.CGFloat height = v225;
          CGFloat v243 = CGRectGetMaxY(v410);
          double v244 = v366;
          double v245 = v366 * v243;
          CGFloat v246 = v362;
          v411.origin.x = v362;
          v411.origin.y = v230;
          v411.size.width = v231;
          v411.size.CGFloat height = v232;
          double v247 = v365 * CGRectGetMaxX(v411);
          v412.origin.x = v246;
          v412.origin.y = v230;
          v412.size.width = v231;
          v412.size.CGFloat height = v232;
          CGFloat v248 = CGRectGetMaxY(v412);
          double v249 = v367;
          *CGFloat v239 = v242;
          v239[1] = v245;
          v239[2] = v247;
          v239[3] = v249 * v248;
          v239[4] = 0.5;
          CGFloat v250 = v360;
          v413.origin.x = v360;
          CGFloat v251 = v354;
          v413.origin.y = v354;
          CGFloat v252 = v361;
          v413.size.width = v361;
          CGFloat v253 = v347;
          v413.size.CGFloat height = v347;
          double v254 = v364 * CGRectGetMinX(v413);
          v414.origin.x = v250;
          v414.origin.y = v251;
          v414.size.width = v252;
          v414.size.CGFloat height = v253;
          CGFloat v255 = v253;
          double v339 = v244 * CGRectGetMinY(v414);
          CGFloat v256 = v349;
          v415.origin.x = v349;
          CGFloat v257 = v355;
          v415.origin.y = v355;
          CGFloat v258 = v350;
          v415.size.width = v350;
          CGFloat v259 = v348;
          v415.size.CGFloat height = v348;
          double v260 = v365 * CGRectGetMinX(v415);
          v416.origin.x = v256;
          v416.origin.y = v257;
          v416.size.width = v258;
          v416.size.CGFloat height = v259;
          CGFloat v261 = CGRectGetMinY(v416);
          double v262 = v339;
          v237[20] = v254;
          v237[21] = v262;
          v237[22] = v260;
          v237[23] = v249 * v261;
          v237[24] = 0.5;
          CGFloat v263 = v360;
          v417.origin.x = v360;
          CGFloat v264 = v354;
          v417.origin.y = v354;
          CGFloat v265 = v361;
          v417.size.width = v361;
          v417.size.CGFloat height = v255;
          CGFloat v266 = CGRectGetMinX(v417);
          double v267 = v364;
          double v339 = v364 * v266;
          v418.origin.x = v263;
          v418.origin.y = v264;
          v418.size.width = v265;
          CGFloat v268 = v255;
          v418.size.CGFloat height = v255;
          CGFloat v269 = CGRectGetMaxY(v418);
          double v270 = v366;
          double v338 = v366 * v269;
          v419.origin.x = v256;
          CGFloat v271 = v355;
          v419.origin.y = v355;
          CGFloat v272 = v258;
          v419.size.width = v258;
          CGFloat v273 = v348;
          v419.size.CGFloat height = v348;
          CGFloat v274 = CGRectGetMinX(v419);
          double v275 = v365;
          double v337 = v365 * v274;
          v420.origin.x = v256;
          v420.origin.y = v271;
          v420.size.width = v272;
          v420.size.CGFloat height = v273;
          CGFloat v276 = v273;
          double v277 = v367 * CGRectGetMaxY(v420);
          double v278 = v338;
          v237[25] = v339;
          v237[26] = v278;
          v237[27] = v337;
          v237[28] = v277;
          v237[29] = 0.5;
          CGFloat v279 = v360;
          v421.origin.x = v360;
          CGFloat v280 = v354;
          v421.origin.y = v354;
          CGFloat v281 = v361;
          v421.size.width = v361;
          v421.size.CGFloat height = v268;
          double v339 = v267 * CGRectGetMaxX(v421);
          v422.origin.x = v279;
          v422.origin.y = v280;
          v422.size.width = v281;
          v422.size.CGFloat height = v268;
          double v282 = v270 * CGRectGetMinY(v422);
          CGFloat v283 = v349;
          v423.origin.x = v349;
          CGFloat v284 = v355;
          v423.origin.y = v355;
          CGFloat v285 = v350;
          v423.size.width = v350;
          v423.size.CGFloat height = v276;
          double v286 = v275 * CGRectGetMaxX(v423);
          v424.origin.x = v283;
          v424.origin.y = v284;
          v424.size.width = v285;
          v424.size.CGFloat height = v276;
          double v287 = v367 * CGRectGetMinY(v424);
          v237[30] = v339;
          v237[31] = v282;
          v237[32] = v286;
          v237[33] = v287;
          v237[34] = 0.5;
          CGRect v288 = (double *)&v238[5 * v218];
          CGFloat v289 = v360;
          v425.origin.x = v360;
          v425.origin.y = v280;
          CGFloat v290 = v361;
          v425.size.width = v361;
          CGFloat v291 = v347;
          v425.size.CGFloat height = v347;
          double v339 = v364 * CGRectGetMaxX(v425);
          v426.origin.x = v289;
          v426.origin.y = v280;
          v426.size.width = v290;
          v426.size.CGFloat height = v291;
          double v292 = v366 * CGRectGetMaxY(v426);
          v427.origin.x = v283;
          v427.origin.y = v284;
          v427.size.width = v285;
          v427.size.CGFloat height = v276;
          double v293 = v365 * CGRectGetMaxX(v427);
          v428.origin.x = v283;
          v428.origin.y = v284;
          v428.size.width = v285;
          v428.size.CGFloat height = v276;
          double v294 = v367 * CGRectGetMaxY(v428);
          *CGRect v288 = v339;
          v288[1] = v292;
          v288[2] = v293;
          v288[3] = v294;
          v288[4] = 0.5;
          CGFloat v39 = v335;
          CGRect v295 = (int32x4_t *)&v335[4 * v30];
          __int32 v296 = LODWORD(v342);
          __int32 v297 = LODWORD(v343);
          v295->i32[0] = LODWORD(v342);
          v295->i32[1] = v297;
          __int32 v298 = LODWORD(v340);
          __int32 v299 = LODWORD(v341);
          v295->i32[2] = LODWORD(v340);
          v295->i32[3] = v299;
          int32x4_t v300 = v351;
          v295[1] = v351;
          v295[2].i32[0] = v296;
          v295[2].i32[1] = LODWORD(v215);
          v295[2].i32[2] = v217;
          v295[2].i32[3] = v299;
          v295[3] = v300;
          double v338 = v215;
          v295[4].i32[0] = LODWORD(v215);
          v295[4].i32[1] = LODWORD(v216);
          v295[4].i32[2] = v218;
          v295[4].i32[3] = v217;
          v295[5] = v300;
          v295[6].i32[0] = v297;
          v295[6].i32[1] = v298;
          v295[6].i32[2] = v218;
          v295[6].i32[3] = LODWORD(v216);
          double v339 = v216;
          v295[7] = v300;
          v295[8].i32[0] = v299;
          v295[8].i32[1] = v217;
          v295[8].i32[2] = v218;
          v295[8].i32[3] = v298;
          v30 += 5;
          *(void *)&CGFloat v31 = v214 + 8;
          v295[9] = v300;

          uint64_t v40 = v346 + 1;
          id v6 = v328;
          id v7 = v327;
          self = v326;
          CGFloat v32 = v357;
          CGFloat v34 = v358;
          CGFloat v36 = v359;
          CGFloat v15 = v362;
          double v33 = v353;
          double v35 = v352;
          double v37 = v363;
          double v38 = v356;
        }
        while (v332 != v346 + 1);
        uint64_t v332 = [v321 countByEnumeratingWithState:&v368 objects:v372 count:16];
      }
      while (v332);
    }
    else
    {
      CGFloat v39 = v12;
      uint64_t v30 = 0;
      CGFloat v31 = 0.0;
      double v38 = v15;
      CGFloat v36 = v359;
      double v37 = v359;
      CGFloat v34 = v358;
      double v35 = v358;
      CGFloat v32 = v357;
      double v33 = v357;
      *(void *)&double v339 = 0xFFFFFFFFLL;
      *(void *)&double v338 = 0xFFFFFFFFLL;
    }

    v429.origin.x = v38;
    v429.origin.y = v37;
    v429.size.width = v35;
    v429.size.CGFloat height = v33;
    if (CGRectIsNull(v429))
    {
      CGRect v302 = v331;
    }
    else
    {
      CGRect v302 = v331;
      CGRect v303 = (double *)&v331[5 * *(void *)&v31];
      v430.origin.x = v38;
      v430.origin.y = v37;
      v430.size.width = v35;
      v430.size.CGFloat height = v33;
      CGFloat v304 = CGRectGetMinY(v430);
      CGFloat v352 = v35;
      CGFloat v356 = v38;
      double v305 = v366;
      double v306 = v366 * v304;
      v431.origin.x = v15;
      v431.origin.y = v36;
      v431.size.width = v34;
      v431.size.CGFloat height = v32;
      CGFloat v307 = CGRectGetMinY(v431);
      *CGRect v303 = 1.0;
      v432.origin.y = v37;
      double v308 = v367;
      v303[1] = v306;
      v303[2] = 1.0;
      v303[3] = v308 * v307;
      v303[4] = 0.5;
      v432.origin.x = v356;
      v432.size.width = v352;
      v432.size.CGFloat height = v33;
      double v309 = v305 * CGRectGetMaxY(v432);
      v433.origin.x = v15;
      v433.origin.y = v36;
      v433.size.width = v34;
      v433.size.CGFloat height = v32;
      CGFloat v310 = CGRectGetMaxY(v433);
      v303[5] = 1.0;
      v303[6] = v309;
      v303[7] = 1.0;
      v303[8] = v308 * v310;
      v303[9] = 0.5;
      v311 = (int32x4_t *)&v39[4 * v30];
      __int32 v312 = LODWORD(v339);
      v311->i32[0] = LODWORD(v338);
      v311->i32[1] = v312;
      v311->i32[2] = LODWORD(v31) + 1;
      v311->i32[3] = LODWORD(v31);
      v311[1] = vdupq_n_s32(0x7F7FFFFFu);
      ++v30;
      *(void *)&v31 += 2;
    }
    CGRect v301 = [MEMORY[0x1E4F39C18] meshTransformWithVertexCount:*(void *)&v31 vertices:v302 faceCount:v30 faces:v39 depthNormalization:*MEMORY[0x1E4F39ED8]];
  }
  return v301;
}

- (BOOL)useInteractiveOpacity
{
  return self->_useInteractiveOpacity;
}

- (void)setUseInteractiveOpacity:(BOOL)a3
{
  self->_useInteractiveOpacity = a3;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

- (BOOL)disableMeshOptimization
{
  return self->_disableMeshOptimization;
}

- (void)setDisableMeshOptimization:(BOOL)a3
{
  self->_disableMeshOptimization = a3;
}

- (NSArray)startGeometries
{
  return self->_startGeometries;
}

- (void)setStartGeometries:(id)a3
{
}

- (NSArray)endGeometries
{
  return self->_endGeometries;
}

- (void)setEndGeometries:(id)a3
{
}

- (NSArray)commonVisibleKeys
{
  return self->_commonVisibleKeys;
}

- (void)setCommonVisibleKeys:(id)a3
{
}

- (CADisplayLink)opacityAnimationDisplayLink
{
  return self->_opacityAnimationDisplayLink;
}

- (void)setOpacityAnimationDisplayLink:(id)a3
{
}

- (double)opacityAnimationBeginTime
{
  return self->_opacityAnimationBeginTime;
}

- (void)setOpacityAnimationBeginTime:(double)a3
{
  self->_opacityAnimationBeginTime = a3;
}

- (BOOL)opacityAnimationDirectionForward
{
  return self->_opacityAnimationDirectionForward;
}

- (void)setOpacityAnimationDirectionForward:(BOOL)a3
{
  self->_opacityAnimationDirectionForward = a3;
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityAnimationDisplayLink, 0);
  objc_storeStrong((id *)&self->_commonVisibleKeys, 0);
  objc_storeStrong((id *)&self->_endGeometries, 0);
  objc_storeStrong((id *)&self->_startGeometries, 0);
}

@end