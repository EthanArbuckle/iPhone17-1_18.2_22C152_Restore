@interface TUIGradientView
+ (Class)layerClass;
- (CABasicAnimation)endPointAnimation;
- (CABasicAnimation)startPointAnimation;
- (CGPoint)_gradientEndPoint:(BOOL)a3;
- (CGPoint)_gradientStartPoint:(BOOL)a3;
- (_UIDirectionalLightConfiguration)lightConfiguration;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)runAnimationCount:(int64_t)a3 duration:(double)a4;
- (void)setColors:(id)a3;
- (void)setEndPointAnimation:(id)a3;
- (void)setLightConfiguration:(id)a3;
- (void)setStartPointAnimation:(id)a3;
@end

@implementation TUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPointAnimation, 0);
  objc_storeStrong((id *)&self->_startPointAnimation, 0);
  objc_storeStrong((id *)&self->_lightConfiguration, 0);
}

- (void)setEndPointAnimation:(id)a3
{
}

- (CABasicAnimation)endPointAnimation
{
  return self->_endPointAnimation;
}

- (void)setStartPointAnimation:(id)a3
{
}

- (CABasicAnimation)startPointAnimation
{
  return self->_startPointAnimation;
}

- (_UIDirectionalLightConfiguration)lightConfiguration
{
  return self->_lightConfiguration;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v11 = v6;
    id v7 = [(TUIGradientView *)self startPointAnimation];

    if (v7 == v11)
    {
      v10 = [(TUIGradientView *)self gradientLayer];
      [v10 removeAnimationForKey:@"startPoint.x"];

      [(TUIGradientView *)self setStartPointAnimation:0];
    }
    else
    {
      id v8 = [(TUIGradientView *)self endPointAnimation];

      id v6 = v11;
      if (v8 != v11) {
        goto LABEL_7;
      }
      v9 = [(TUIGradientView *)self gradientLayer];
      [v9 removeAnimationForKey:@"endPoint.x"];

      [(TUIGradientView *)self setEndPointAnimation:0];
    }
    id v6 = v11;
  }
LABEL_7:
}

- (void)runAnimationCount:(int64_t)a3 duration:(double)a4
{
  id v7 = [(TUIGradientView *)self startPointAnimation];
  if (v7)
  {
  }
  else
  {
    id v8 = [(TUIGradientView *)self endPointAnimation];

    if (!v8) {
      goto LABEL_5;
    }
  }
  v9 = [(TUIGradientView *)self gradientLayer];
  [v9 removeAllAnimations];

LABEL_5:
  v10 = [(TUIGradientView *)self lightConfiguration];

  if (v10)
  {
    [(_UIDirectionalLightConfiguration *)self->_lightConfiguration duration];
    a4 = v11;
  }
  [(TUIGradientView *)self _gradientStartPoint:1];
  double v13 = v12;
  double v15 = v14;
  [(TUIGradientView *)self _gradientStartPoint:0];
  double v17 = v16;
  [(TUIGradientView *)self _gradientEndPoint:1];
  double v19 = v18;
  double v21 = v20;
  [(TUIGradientView *)self _gradientEndPoint:0];
  double v23 = v22;
  v24 = [(TUIGradientView *)self gradientLayer];
  objc_msgSend(v24, "setStartPoint:", v13, v15);

  v25 = [(TUIGradientView *)self gradientLayer];
  objc_msgSend(v25, "setEndPoint:", v19, v21);

  id v36 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"startPoint.x"];
  v26 = [NSNumber numberWithDouble:v13];
  [v36 setFromValue:v26];

  v27 = [NSNumber numberWithDouble:v17];
  [v36 setToValue:v27];

  [v36 setDuration:a4];
  *(float *)&double v17 = (float)a3;
  *(float *)&double v28 = (float)a3;
  [v36 setRepeatCount:v28];
  uint64_t v29 = *MEMORY[0x1E4F39FA8];
  [v36 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v36 setRemovedOnCompletion:0];
  [(TUIGradientView *)self setStartPointAnimation:v36];
  v30 = [(TUIGradientView *)self gradientLayer];
  [v30 addAnimation:v36 forKey:@"startPoint.x"];

  v31 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"endPoint.x"];
  v32 = [NSNumber numberWithDouble:v19];
  [v31 setFromValue:v32];

  v33 = [NSNumber numberWithDouble:v23];
  [v31 setToValue:v33];

  [v31 setDuration:a4];
  LODWORD(v34) = LODWORD(v17);
  [v31 setRepeatCount:v34];
  [v31 setFillMode:v29];
  [v31 setRemovedOnCompletion:0];
  [(TUIGradientView *)self setEndPointAnimation:v31];
  v35 = [(TUIGradientView *)self gradientLayer];
  [v35 addAnimation:v31 forKey:@"endPoint.x"];
}

- (CGPoint)_gradientEndPoint:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(TUIGradientView *)self traitCollection];
  uint64_t v5 = [v4 layoutDirection];

  double v6 = -1.0;
  if (v5 == 1) {
    double v6 = 2.0;
  }
  double v7 = 1.0;
  if (v5 == 1) {
    double v7 = 0.0;
  }
  if (!v3) {
    double v6 = v7;
  }
  double v8 = 0.0;
  result.y = v8;
  result.x = v6;
  return result;
}

- (CGPoint)_gradientStartPoint:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(TUIGradientView *)self traitCollection];
  uint64_t v5 = [v4 layoutDirection];

  double v6 = 0.0;
  if (v5 == 1) {
    double v6 = 1.0;
  }
  double v7 = 2.0;
  if (v5 == 1) {
    double v7 = -1.0;
  }
  if (!v3) {
    double v6 = v7;
  }
  double v8 = 0.0;
  result.y = v8;
  result.x = v6;
  return result;
}

- (void)setColors:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v24 + 1) + 8 * v10);
        CGColorRef v12 = CGColorRetain((CGColorRef)objc_msgSend(v11, "CGColor", (void)v24));
        [v5 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  double v13 = [(TUIGradientView *)self gradientLayer];
  [v13 setColors:v5];

  [(TUIGradientView *)self _gradientStartPoint:1];
  double v15 = v14;
  double v17 = v16;
  double v18 = [(TUIGradientView *)self gradientLayer];
  objc_msgSend(v18, "setStartPoint:", v15, v17);

  [(TUIGradientView *)self _gradientEndPoint:1];
  double v20 = v19;
  double v22 = v21;
  double v23 = [(TUIGradientView *)self gradientLayer];
  objc_msgSend(v23, "setEndPoint:", v20, v22);
}

- (void)setLightConfiguration:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_lightConfiguration, a3);
  if (v11)
  {
    uint64_t v5 = [v11 colorPalette];
    id v6 = [v5 colors];
    [(TUIGradientView *)self setColors:v6];

    uint64_t v7 = [v11 colorPalette];
    uint64_t v8 = [v7 locations];
    uint64_t v9 = [(TUIGradientView *)self gradientLayer];
    [v9 setLocations:v8];
  }
  else
  {
    uint64_t v10 = [(TUIGradientView *)self gradientLayer];
    [v10 setColors:0];

    uint64_t v7 = [(TUIGradientView *)self gradientLayer];
    [v7 setLocations:0];
  }
}

@end