@interface PUDefaultTileTransitionCoordinator
- (CGAffineTransform)_adjustDefaultDisappearanceTransform:(SEL)a3;
- (NSNumber)animationDuration;
- (id)_layoutInfoWithDefaultDisappearance:(id)a3;
- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4;
- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4;
- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5;
- (void)configureOptions:(id)a3 forSpringAnimationsZoomingIn:(BOOL)a4;
- (void)setAnimationDuration:(id)a3;
@end

@implementation PUDefaultTileTransitionCoordinator

- (void).cxx_destruct
{
}

- (void)setAnimationDuration:(id)a3
{
}

- (NSNumber)animationDuration
{
  return self->_animationDuration;
}

- (CGAffineTransform)_adjustDefaultDisappearanceTransform:(SEL)a3
{
  long long v5 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  v6 = +[PUTilingViewSettings sharedInstance];
  int v7 = [v6 rotateDisappearingTiles];

  if (v7)
  {
    long long v9 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v13.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v13.c = v9;
    *(_OWORD *)&v13.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(retstr, &v13, 0.800000012, 0.800000012);
    long long v10 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v12.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v12.c = v10;
    *(_OWORD *)&v12.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformRotate(&v13, &v12, 0.5);
    long long v11 = *(_OWORD *)&v13.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v13.a;
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v13.tx;
  }
  return result;
}

- (id)_layoutInfoWithDefaultDisappearance:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  if (v4) {
    [v4 transform];
  }
  v19[0] = v23;
  v19[1] = v24;
  v19[2] = v25;
  [(PUDefaultTileTransitionCoordinator *)self _adjustDefaultDisappearanceTransform:v19];
  long long v23 = v20;
  long long v24 = v21;
  long long v25 = v22;
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  [v5 size];
  double v11 = v10;
  double v13 = v12;
  [v5 zPosition];
  double v15 = v14;
  v16 = [v5 coordinateSystem];
  long long v20 = v23;
  long long v21 = v24;
  long long v22 = v25;
  v17 = objc_msgSend(v5, "layoutInfoWithCenter:size:alpha:transform:zPosition:coordinateSystem:", &v20, v16, v7, v9, v11, v13, 0.0, v15);

  return v17;
}

- (void)configureOptions:(id)a3 forSpringAnimationsZoomingIn:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  double v6 = +[PUTilingViewSettings sharedInstance];
  if ([v6 useSpringAnimations])
  {
    if ([MEMORY[0x1E4F90300] isOneUpRefreshEnabled])
    {
      int v7 = [v6 lemonadeUseOvershootingSpringAnimations];
      int v8 = [v6 lemonadeUseSystemSpringAnimations];
    }
    else
    {
      int v7 = [v6 useOvershootingSpringAnimations];
      int v8 = [v6 useSystemSpringAnimations];
    }
    if (v4 && v7)
    {
      [v21 setKind:1002];
      [v6 animationDragCoefficient];
      double v10 = v9;
      [v6 animationDragCoefficient];
      [v21 setSpringMass:v10 * v11];
      [v21 setSpringStiffness:350.0];
      [v21 setSpringDampingRatio:0.670000017];
      [v21 setSpringNumberOfOscillations:1];
      goto LABEL_17;
    }
    if (v8)
    {
      [v6 animationDragCoefficient];
      if (v12 == 1.0)
      {
        [v21 setKind:1001];
        goto LABEL_17;
      }
      [v21 setKind:1000];
      [v6 animationDragCoefficient];
      double v18 = v17 * 0.5058;
    }
    else
    {
      double v13 = [(PUDefaultTileTransitionCoordinator *)self animationDuration];
      if (v13)
      {
        double v14 = [(PUDefaultTileTransitionCoordinator *)self animationDuration];
        [v14 doubleValue];
        double v16 = v15;
      }
      else
      {
        [v6 springAnimationDuration];
        double v16 = v19;
      }

      [v21 setKind:1000];
      [v6 animationDragCoefficient];
      double v18 = v16 * v20;
    }
    [v21 setDuration:v18];
    [v21 setSpringDampingRatio:1.0];
  }
LABEL_17:
}

- (id)optionsForAnimatingTileController:(id)a3 toLayoutInfo:(id)a4 withAnimationType:(int64_t)a5
{
  id v6 = a4;
  int v7 = [(PUDefaultTileTransitionCoordinator *)self animationDuration];
  if (v7)
  {
    int v8 = [(PUDefaultTileTransitionCoordinator *)self animationDuration];
    [v8 doubleValue];
  }
  else
  {
    int v8 = +[PUTilingViewSettings sharedInstance];
    [v8 defaultAnimationDuration];
  }
  double v10 = v9;

  double v11 = [v6 tileKind];

  uint64_t v12 = [v11 isEqualToString:PUTileKindBackground];
  if (v12)
  {
    double v13 = +[PUTilingViewSettings sharedInstance];
    [v13 transitionDuration];
    double v10 = v14;
  }
  double v15 = +[PUTilingViewSettings sharedInstance];
  [v15 animationDragCoefficient];
  double v17 = v10 * v16;

  id v18 = [(PUTileTransitionCoordinator *)self newTileAnimationOptions];
  [v18 setKind:0];
  [v18 setDuration:v17];
  [v18 setSynchronizedWithTransition:v12];
  return v18;
}

- (id)finalLayoutInfoForDisappearingTileController:(id)a3 fromLayoutInfo:(id)a4
{
  return [(PUDefaultTileTransitionCoordinator *)self _layoutInfoWithDefaultDisappearance:a4];
}

- (id)initialLayoutInfoForAppearingTileController:(id)a3 toLayoutInfo:(id)a4
{
  return [(PUDefaultTileTransitionCoordinator *)self _layoutInfoWithDefaultDisappearance:a4];
}

@end