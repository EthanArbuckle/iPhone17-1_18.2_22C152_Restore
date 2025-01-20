@interface TUNavigationBarDefaultCompressionAnimation
- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4;
- (BOOL)compressTitleView;
- (BOOL)hideTitleOnTop;
- (BOOL)shouldCloseGapOnScroll;
- (BOOL)shouldCompressAtTop;
- (NSArray)barButtonItemViews;
- (TUAnimationFloatFunction)opacityFunction;
- (TUAnimationFloatFunction)scaleFunction;
- (TUAnimationFloatFunction)translateFunction;
- (TUNavigationBarCompressibleTitleView)compressibleTitleView;
- (TUNavigationBarDefaultCompressionAnimation)initWithNavigationBar:(id)a3;
- (TUNavigationBarDefaultCompressionAnimation)initWithNavigationBar:(id)a3 tabBarController:(id)a4;
- (UINavigationBar)navigationBar;
- (UITabBarController)tabBarController;
- (double)maximumBarHeightForTraitCollection:(id)a3;
- (double)minimumBarHeightForTraitCollection:(id)a3;
- (double)topOffset;
- (double)translationOffset;
- (void)animateFloatingTabBarHiddenIfNeeded:(BOOL)a3;
- (void)prepareForUpdates;
- (void)reloadWithTraitCollection:(id)a3;
- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4;
- (void)setBarButtonItemViews:(id)a3;
- (void)setCompressTitleView:(BOOL)a3;
- (void)setCompressibleTitleView:(id)a3;
- (void)setHideTitleOnTop:(BOOL)a3;
- (void)setOpacityFunction:(id)a3;
- (void)setScaleFunction:(id)a3;
- (void)setTranslateFunction:(id)a3;
- (void)setTranslationOffset:(double)a3;
- (void)updateWithPercentage:(double)a3;
@end

@implementation TUNavigationBarDefaultCompressionAnimation

- (TUNavigationBarDefaultCompressionAnimation)initWithNavigationBar:(id)a3
{
  return [(TUNavigationBarDefaultCompressionAnimation *)self initWithNavigationBar:a3 tabBarController:0];
}

- (TUNavigationBarDefaultCompressionAnimation)initWithNavigationBar:(id)a3 tabBarController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUNavigationBarDefaultCompressionAnimation;
  v9 = [(TUNavigationBarDefaultCompressionAnimation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationBar, a3);
    v10->_compressTitleView = 1;
    v10->_translationOffset = -3.5;
    objc_storeStrong((id *)&v10->_tabBarController, a4);
  }

  return v10;
}

- (void)prepareForUpdates
{
  v3 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  v4 = objc_msgSend(v3, "ts_fetchCompressibleTitleView");
  [(TUNavigationBarDefaultCompressionAnimation *)self setCompressibleTitleView:v4];

  id v6 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  v5 = objc_msgSend(v6, "ts_barButtonViews");
  [(TUNavigationBarDefaultCompressionAnimation *)self setBarButtonItemViews:v5];
}

- (void)updateWithPercentage:(double)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v5 = [(TUNavigationBarDefaultCompressionAnimation *)self compressibleTitleView];

  if (!v5)
  {
    id v6 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
    id v7 = objc_msgSend(v6, "ts_fetchCompressibleTitleView");
    [(TUNavigationBarDefaultCompressionAnimation *)self setCompressibleTitleView:v7];
  }
  id v8 = [(TUNavigationBarDefaultCompressionAnimation *)self opacityFunction];
  [v8 solveForTime:a3];
  double v10 = v9;

  v11 = [(TUNavigationBarDefaultCompressionAnimation *)self scaleFunction];
  [v11 solveForTime:a3];
  double v13 = v12;

  v14 = [(TUNavigationBarDefaultCompressionAnimation *)self translateFunction];
  [v14 solveForTime:a3];
  CGFloat v16 = v15;

  if ([(TUNavigationBarDefaultCompressionAnimation *)self compressTitleView])
  {
    v17 = [(TUNavigationBarDefaultCompressionAnimation *)self compressibleTitleView];
    [v17 setContentAlpha:v10];
  }
  uint64_t v18 = [(TUNavigationBarDefaultCompressionAnimation *)self barButtonItemViews];
  if (!v18
    || (v19 = (void *)v18,
        [(TUNavigationBarDefaultCompressionAnimation *)self barButtonItemViews],
        v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [v20 count],
        v20,
        v19,
        !v21))
  {
    v22 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
    v23 = objc_msgSend(v22, "ts_barButtonViews");
    [(TUNavigationBarDefaultCompressionAnimation *)self setBarButtonItemViews:v23];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v24 = [(TUNavigationBarDefaultCompressionAnimation *)self barButtonItemViews];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v56 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        [v29 setContentAlpha:v10];
        v30 = [v29 view];
        CATransform3DMakeTranslation(&v54, 0.0, v16, 0.0);
        [v30 setTransform3D:&v54];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v26);
  }

  v31 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  v32 = [v31 items];
  v33 = [v32 firstObject];
  v34 = [v33 _bottomPalette];
  v35 = [v34 contentView];
  int v36 = [v35 conformsToProtocol:&unk_1F0FB1B88];

  double v37 = 0.0;
  if (v36)
  {
    v38 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
    v39 = [v38 items];
    v40 = [v39 firstObject];
    v41 = [v40 _bottomPalette];
    v42 = [v41 contentView];

    [v42 compressWithScale:v13 opacity:v10];
    [v42 paletteHeight];
    double v37 = v43;
  }
  v44 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  v45 = v44;
  if (a3 <= 0.0)
  {
    long long v51 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v52.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v52.c = v51;
    *(_OWORD *)&v52.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v50 = &v52;
  }
  else
  {
    [v44 bounds];
    double v46 = v37 + CGRectGetHeight(v61);
    [(TUNavigationBarDefaultCompressionAnimation *)self translationOffset];
    double v48 = v46 + v47;

    v45 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
    long long v49 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v52.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v52.c = v49;
    *(_OWORD *)&v52.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformTranslate(&v53, &v52, 0.0, -(v48 * a3));
    v50 = &v53;
  }
  objc_msgSend(v45, "setTransform:", v50, *(_OWORD *)&v52.a, *(_OWORD *)&v52.c, *(_OWORD *)&v52.tx);

  [(TUNavigationBarDefaultCompressionAnimation *)self animateFloatingTabBarHiddenIfNeeded:a3 > 0.0];
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  v3 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  [v3 frame];
  double Height = CGRectGetHeight(v6);

  return Height;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  id v5 = a3;
  CGRect v6 = [v5 window];
  [v6 safeAreaInsets];
  double v8 = v7;
  [v5 contentOffset];
  double v10 = v9;
  [v5 contentInset];
  if (v10 >= -v11)
  {
    [v5 contentOffset];
    double v14 = v13;

    char v12 = v14 < -v8 || !a4;
  }
  else
  {
    char v12 = [v5 isDragging];
  }
  return v12;
}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  BOOL v4 = a3;
  if ([(TUNavigationBarDefaultCompressionAnimation *)self hideTitleOnTop])
  {
    BOOL v6 = !v4;
    [(TUNavigationBarDefaultCompressionAnimation *)self setCompressTitleView:v6];
    if (v6)
    {
      double v8 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
      double v9 = v8;
      if (v8) {
        [v8 transform];
      }
      else {
        memset(&v12, 0, sizeof(v12));
      }
      BOOL IsIdentity = CGAffineTransformIsIdentity(&v12);

      if (IsIdentity)
      {
        double v11 = [(TUNavigationBarDefaultCompressionAnimation *)self compressibleTitleView];
        [v11 setContentAlpha:1.0];

        [(TUNavigationBarDefaultCompressionAnimation *)self animateFloatingTabBarHiddenIfNeeded:0];
      }
    }
    else
    {
      double v7 = [(TUNavigationBarDefaultCompressionAnimation *)self compressibleTitleView];
      [v7 setContentAlpha:0.0];

      [(TUNavigationBarDefaultCompressionAnimation *)self animateFloatingTabBarHiddenIfNeeded:1];
    }
  }
}

- (void)setHideTitleOnTop:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(TUNavigationBarDefaultCompressionAnimation *)self hideTitleOnTop];
  self->_hideTitleOnTop = v3;
  if (v3 && !v5)
  {
    BOOL v6 = [(TUNavigationBarDefaultCompressionAnimation *)self compressibleTitleView];
    [v6 setContentAlpha:0.0];

    [(TUNavigationBarDefaultCompressionAnimation *)self animateFloatingTabBarHiddenIfNeeded:1];
  }
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)reloadWithTraitCollection:(id)a3
{
  BOOL v4 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  BOOL v5 = objc_msgSend(v4, "ts_fetchCompressibleTitleView");
  [(TUNavigationBarDefaultCompressionAnimation *)self setCompressibleTitleView:v5];

  BOOL v6 = [(TUNavigationBarDefaultCompressionAnimation *)self compressibleTitleView];
  double v7 = [v6 view];
  [v7 setMaskView:0];

  double v8 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  double v9 = objc_msgSend(v8, "ts_barButtonViews");
  [(TUNavigationBarDefaultCompressionAnimation *)self setBarButtonItemViews:v9];

  id v10 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
  objc_msgSend(v10, "ts_resetButtonTransforms");
}

- (TUAnimationFloatFunction)opacityFunction
{
  opacityFunction = self->_opacityFunction;
  if (!opacityFunction)
  {
    BOOL v4 = objc_alloc_init(TUAnimationFloatFunction);
    BOOL v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [(TUAnimationFloatFunction *)v4 setTimingFunction:v5];

    [(TUAnimationFloatFunction *)v4 setSpeed:2.0];
    [(TUAnimationFloatFunction *)v4 setStartValue:1.0];
    [(TUAnimationFloatFunction *)v4 setEndValue:0.0];
    BOOL v6 = self->_opacityFunction;
    self->_opacityFunction = v4;

    opacityFunction = self->_opacityFunction;
  }
  return opacityFunction;
}

- (TUAnimationFloatFunction)scaleFunction
{
  scaleFunction = self->_scaleFunction;
  if (!scaleFunction)
  {
    BOOL v4 = objc_alloc_init(TUAnimationFloatFunction);
    BOOL v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [(TUAnimationFloatFunction *)v4 setTimingFunction:v5];

    [(TUAnimationFloatFunction *)v4 setSpeed:1.38];
    [(TUAnimationFloatFunction *)v4 setStartValue:1.0];
    [(TUAnimationFloatFunction *)v4 setEndValue:0.7];
    BOOL v6 = self->_scaleFunction;
    self->_scaleFunction = v4;

    scaleFunction = self->_scaleFunction;
  }
  return scaleFunction;
}

- (TUAnimationFloatFunction)translateFunction
{
  translateFunction = self->_translateFunction;
  if (!translateFunction)
  {
    BOOL v4 = objc_alloc_init(TUAnimationFloatFunction);
    BOOL v5 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [(TUAnimationFloatFunction *)v4 setTimingFunction:v5];

    [(TUAnimationFloatFunction *)v4 setStartValue:0.0];
    BOOL v6 = [(TUNavigationBarDefaultCompressionAnimation *)self navigationBar];
    [v6 frame];
    [(TUAnimationFloatFunction *)v4 setEndValue:CGRectGetHeight(v10) * 0.5];

    double v7 = self->_translateFunction;
    self->_translateFunction = v4;

    translateFunction = self->_translateFunction;
  }
  return translateFunction;
}

- (void)animateFloatingTabBarHiddenIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TUNavigationBarDefaultCompressionAnimation *)self tabBarController];
  if (v5)
  {
    id v13 = (id)v5;
    BOOL v6 = [(TUNavigationBarDefaultCompressionAnimation *)self tabBarController];
    double v7 = objc_msgSend(v6, "_uip_sidebar");
    if ([v7 _isVisible])
    {
    }
    else
    {
      double v8 = [(TUNavigationBarDefaultCompressionAnimation *)self tabBarController];
      double v9 = [v8 traitCollection];
      uint64_t v10 = [v9 horizontalSizeClass];

      if (v10 != 2) {
        return;
      }
      double v11 = [(TUNavigationBarDefaultCompressionAnimation *)self tabBarController];
      int v12 = objc_msgSend(v11, "_uip_isTabBarHidden");

      if (v12 == v3) {
        return;
      }
      id v13 = [(TUNavigationBarDefaultCompressionAnimation *)self tabBarController];
      objc_msgSend(v13, "_uip_setTabBarHidden:animated:", v3, objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled"));
    }
  }
}

- (double)topOffset
{
  return self->topOffset;
}

- (BOOL)hideTitleOnTop
{
  return self->_hideTitleOnTop;
}

- (double)translationOffset
{
  return self->_translationOffset;
}

- (void)setTranslationOffset:(double)a3
{
  self->_translationOffset = a3;
}

- (TUNavigationBarCompressibleTitleView)compressibleTitleView
{
  return self->_compressibleTitleView;
}

- (void)setCompressibleTitleView:(id)a3
{
}

- (NSArray)barButtonItemViews
{
  return self->_barButtonItemViews;
}

- (void)setBarButtonItemViews:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (UITabBarController)tabBarController
{
  return self->_tabBarController;
}

- (void)setOpacityFunction:(id)a3
{
}

- (void)setScaleFunction:(id)a3
{
}

- (void)setTranslateFunction:(id)a3
{
}

- (BOOL)compressTitleView
{
  return self->_compressTitleView;
}

- (void)setCompressTitleView:(BOOL)a3
{
  self->_compressTitleView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translateFunction, 0);
  objc_storeStrong((id *)&self->_scaleFunction, 0);
  objc_storeStrong((id *)&self->_opacityFunction, 0);
  objc_storeStrong((id *)&self->_tabBarController, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_barButtonItemViews, 0);
  objc_storeStrong((id *)&self->_compressibleTitleView, 0);
}

@end