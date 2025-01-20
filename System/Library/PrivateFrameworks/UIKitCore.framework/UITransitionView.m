@interface UITransitionView
+ (double)defaultDurationForTransition:(int)a3;
- (BOOL)_isTransitioningFromFromView:(id)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldDisableGroupOpacityOnAlphaTransitions;
- (BOOL)ignoreDirectTouchEvents;
- (BOOL)ignoresInteractionEvents;
- (BOOL)isTransitioning;
- (BOOL)rasterizesOnTransition;
- (BOOL)shouldNotifyDidCompleteImmediately;
- (BOOL)transition:(int)a3 fromView:(id)a4 toView:(id)a5;
- (BOOL)transition:(int)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6;
- (BOOL)transition:(int)a3 toView:(id)a4;
- (UITransitionView)initWithCoder:(id)a3;
- (UITransitionView)initWithFrame:(CGRect)a3;
- (double)_curlUpRevealedHeight;
- (double)durationForTransition:(int)a3;
- (id)_traitCollectionForChildEnvironment:(id)a3;
- (id)delegate;
- (id)fromView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)toView;
- (int)textEffectsVisibilityLevel;
- (int64_t)animationTimingCurve;
- (void)_completeRunningTransition;
- (void)_didCompleteTransition:(BOOL)a3;
- (void)_didStartTransition;
- (void)_startTransition:(int)a3 withDuration:(double)a4;
- (void)_transitionDidStopFinished:(BOOL)a3;
- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)notifyDidCompleteTransition:(id)a3;
- (void)safeAreaInsetsDidChange;
- (void)setAnimationTimingCurve:(int64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIgnoreDirectTouchEvents:(BOOL)a3;
- (void)setIgnoresInteractionEvents:(BOOL)a3;
- (void)setRasterizesOnTransition:(BOOL)a3;
- (void)setShouldNotifyDidCompleteImmediately:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation UITransitionView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"sublayerTransform"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITransitionView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)UITransitionView;
  [(UIView *)&v4 layoutSubviews];
  v3 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  [v3 _containerViewLayoutSubviews];
}

- (void)_viewDidMoveFromScreen:(id)a3 toScreen:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITransitionView;
  id v6 = a4;
  [(UIView *)&v8 _viewDidMoveFromScreen:a3 toScreen:v6];
  objc_super v7 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  [v7 _containerViewScreenDidChangeToScreen:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITransitionView;
  [(UIView *)&v5 traitCollectionDidChange:a3];
  objc_super v4 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  [v4 _containerViewTraitCollectionDidChange];
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  id v6 = [v5 _presentedViewForOverrideTraits];

  if (v6 == v4)
  {
    uint64_t v7 = [v5 traitCollection];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITransitionView;
    uint64_t v7 = [(UIView *)&v10 _traitCollectionForChildEnvironment:v4];
  }
  objc_super v8 = (void *)v7;

  return v8;
}

- (double)durationForTransition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  WeakRetained = (UITransitionView *)objc_loadWeakRetained(&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained) {
    BOOL v7 = WeakRetained == self;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || (objc_opt_respondsToSelector() & 1) == 0) {
    [(id)objc_opt_class() defaultDurationForTransition:v3];
  }
  else {
    [(UITransitionView *)v6 durationForTransition:v3];
  }
  double v9 = v8;

  return v9;
}

+ (double)defaultDurationForTransition:(int)a3
{
  if (a3 > 0xF) {
    return 0.4;
  }
  else {
    return dbl_186B9E360[a3];
  }
}

- (void)safeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UITransitionView;
  [(UIView *)&v4 safeAreaInsetsDidChange];
  uint64_t v3 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  [v3 _containerViewSafeAreaInsetsDidChange];
}

- (void)setFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITransitionView;
  -[UIView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  [v4 _containerViewBoundsDidChange];
}

- (UITransitionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITransitionView;
  uint64_t v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setClipsToBounds:1];
    [(UIView *)v4 setAutoresizingMask:16];
    *(_WORD *)&v4->_transitionViewFlags = *(_WORD *)&v4->_transitionViewFlags & 0xFEFD | 2;
    v4->_textEffectsVisibilityLevel = 300;
    [(UITransitionView *)v4 setAnimationTimingCurve:7];
  }
  return v4;
}

- (void)setAnimationTimingCurve:(int64_t)a3
{
  self->_animationTimingCurve = a3;
}

- (void)setIgnoreDirectTouchEvents:(BOOL)a3
{
  self->_ignoreDirectTouchEvents = a3;
}

- (BOOL)transition:(int)a3 toView:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BOOL v7 = [(UIView *)self subviews];
  int v8 = [v7 count];
  if (v8 < 1)
  {
    double v9 = 0;
  }
  else
  {
    double v9 = [v7 objectAtIndex:(v8 - 1)];
  }
  BOOL v10 = [(UITransitionView *)self transition:v4 fromView:v9 toView:v6];

  return v10;
}

- (BOOL)transition:(int)a3 fromView:(id)a4 toView:(id)a5 removeFromView:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  __int16 transitionViewFlags = (__int16)self->_transitionViewFlags;
  if (transitionViewFlags) {
    goto LABEL_83;
  }
  if ((transitionViewFlags & 2) != 0) {
    [(id)UIApp setIgnoresInteractionEvents:1];
  }
  v13 = [(UIView *)self subviews];
  v14 = +[UIDevice currentDevice];
  uint64_t v15 = [v14 userInterfaceIdiom];

  char v83 = transitionViewFlags;
  v82 = v13;
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    goto LABEL_9;
  }
  if (!v10)
  {
    if (![v13 count])
    {
      id v10 = 0;
      if (v11) {
        goto LABEL_9;
      }
LABEL_65:
      if ((unint64_t)[v13 count] < 2)
      {
        id obj = 0;
      }
      else
      {
        int v60 = dyld_program_sdk_at_least();
        uint64_t v61 = [v13 objectAtIndex:1];
        v62 = (void *)v61;
        if (v60)
        {
          uint64_t v63 = [v13 objectAtIndex:v61 != (void)v10];

          id obj = (id)v63;
        }
        else
        {
          id obj = (id)v61;
        }
      }
      goto LABEL_10;
    }
    id v10 = [v13 objectAtIndex:0];
  }
  if (!v11) {
    goto LABEL_65;
  }
LABEL_9:
  id obj = v11;
LABEL_10:
  [(UITransitionView *)self durationForTransition:v8];
  double v17 = v16;
  v18 = [v10 firstResponder];
  uint64_t v19 = [v18 _responderForBecomeFirstResponder];

  v81 = (void *)v19;
  if ([v10 _containsResponder:v19]) {
    v20 = (void *)v19;
  }
  else {
    v20 = 0;
  }
  id v80 = v20;
  p_fromView = &self->_fromView;
  objc_storeStrong((id *)&self->_fromView, v10);
  p_toView = &self->_toView;
  objc_storeStrong((id *)&self->_toView, obj);
  objc_storeStrong((id *)&self->_firstResponderToRemember, v20);
  if (v6) {
    __int16 v22 = 1024;
  }
  else {
    __int16 v22 = 0;
  }
  *(_WORD *)&self->___int16 transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFBFF | v22;
  if (v8
    && v17 != 0.0
    && ((+[UIDevice currentDevice],
         v23 = objc_claimAutoreleasedReturnValue(),
         uint64_t v24 = [v23 userInterfaceIdiom],
         v23,
         (v24 & 0xFFFFFFFFFFFFFFFBLL) == 1)
     || (*p_fromView || !v6)
     && *p_fromView != *p_toView
     && (*p_toView || v8 > 0x13 || ((1 << v8) & 0xC0100) == 0)))
  {
    v25 = [(UIView *)self window];
    originalWindow = self->_originalWindow;
    self->_originalWindow = v25;

    [(UIWindow *)self->_originalWindow beginDisablingInterfaceAutorotation];
    WeakRetained = (UITransitionView *)objc_loadWeakRetained(&self->_delegate);
    v28 = [(UIView *)self window];
    *(_WORD *)&self->___int16 transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFFF7 | (8 * (v28 != 0));

    int v29 = 0;
    uint64_t v30 = 1;
    if ((*(_WORD *)&self->_transitionViewFlags & 8) != 0)
    {
LABEL_28:
      if (!WeakRetained
        || (objc_opt_respondsToSelector() & 1) != 0
        && [(UITransitionView *)WeakRetained transitionViewShouldUseViewControllerCallbacks])
      {
        v32 = WeakRetained;
        v33 = +[UIViewController viewControllerForView:](UIViewController, "viewControllerForView:", *p_fromView, p_fromView);
        v34 = +[UIViewController viewControllerForView:*p_toView];
        [v34 beginAppearanceTransition:1 animated:v30];
        [v33 beginAppearanceTransition:0 animated:v30];

        WeakRetained = v32;
      }
    }
  }
  else
  {
    WeakRetained = (UITransitionView *)objc_loadWeakRetained(&self->_delegate);
    uint64_t v30 = 0;
    __int16 v31 = *(_WORD *)&self->_transitionViewFlags & 0xFFF7;
    *(_WORD *)&self->___int16 transitionViewFlags = v31;
    int v29 = 1;
    if ((v31 & 8) != 0) {
      goto LABEL_28;
    }
  }
  if ((v8 - 12) <= 0xFFFFFFFD)
  {
    if (*p_toView)
    {
      v35 = [(UIView *)*p_toView superview];

      if (v35 != self) {
        [(UIView *)self addSubview:*p_toView];
      }
    }
  }
  [(UITransitionView *)self _didStartTransition];
  if (v29)
  {
    v37 = v80;
    v36 = v81;
    if (*p_toView)
    {
      v38 = WeakRetained;
      [(UIView *)*p_toView frame];
      double v40 = v39;
      double v42 = v41;
      v43 = +[UIDevice currentDevice];
      uint64_t v44 = [v43 userInterfaceIdiom];

      if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1 || (id v45 = *v79) == 0) {
        id v45 = *p_toView;
      }
      [v45 frame];
      double v47 = v46;
      double v49 = v48;
      v50 = *p_toView;
      WeakRetained = v38;
      if ((v8 - 12) <= 0xFFFFFFFD
        && (v8 - 18) <= 0xFFFFFFFD
        && (v8 - 15) <= 0xFFFFFFFD
        && v8 != 6
        && v8 != 20
        && v8 != 9)
      {
        if (v50)
        {
          if (v38)
          {
            if (v38 != self)
            {
              char v51 = objc_opt_respondsToSelector();
              v50 = *p_toView;
              if (v51)
              {
                -[UITransitionView transitionView:endOriginForToView:forTransition:defaultOrigin:](v38, "transitionView:endOriginForToView:forTransition:defaultOrigin:", self, v50, v8, v47, v49);
                double v47 = v52;
                double v49 = v53;
                v50 = *p_toView;
              }
            }
          }
        }
      }
      -[UIView setFrame:](v50, "setFrame:", v47, v49, v40, v42);
    }
    [(UITransitionView *)self _didCompleteTransition:1];
  }
  else
  {
    v37 = v80;
    double v55 = *MEMORY[0x1E4F1DAD8];
    double v54 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    switch((int)v8)
    {
      case 1:
        [(UIView *)self bounds];
        double v55 = v65;
        goto LABEL_73;
      case 2:
        [(UIView *)*p_toView bounds];
        double v55 = floor(-v66);
LABEL_73:
        double v54 = 0.0;
        goto LABEL_74;
      case 3:
      case 8:
      case 19:
        [(UIView *)self bounds];
        double v54 = v56;
        double v55 = 0.0;
        if (v8 == 19) {
          [*v79 setAlpha:1.0];
        }
        goto LABEL_74;
      case 6:
        [(UIView *)*p_toView setAlpha:0.0];
        [*v79 setAlpha:1.0];
        break;
      case 7:
      case 18:
        [(UIView *)self bounds];
        double v54 = -v64;
        double v55 = 0.0;
        goto LABEL_74;
      case 9:
      case 12:
      case 20:
        v57 = [(UIView *)self subviews];
        v58 = v57;
        if (*p_toView)
        {
          if (*v79)
          {
            unint64_t v59 = objc_msgSend(v57, "indexOfObject:");
            if (v59 < [v58 indexOfObject:*p_toView]) {
              -[UIView exchangeSubviewAtIndex:withSubviewAtIndex:](self, "exchangeSubviewAtIndex:withSubviewAtIndex:", [v58 indexOfObject:*v79], objc_msgSend(v58, "indexOfObject:", *p_toView));
            }
          }
        }
        if (v8 == 20) {
          [(UIView *)*p_toView setAlpha:0.0];
        }

        goto LABEL_74;
      case 10:
      case 11:
LABEL_74:
        if (WeakRetained && WeakRetained != self && (objc_opt_respondsToSelector() & 1) != 0)
        {
          -[UITransitionView transitionView:beginOriginForToView:forTransition:defaultOrigin:](WeakRetained, "transitionView:beginOriginForToView:forTransition:defaultOrigin:", self, *p_toView, v8, v55, v54);
          double v55 = v67;
          double v54 = v68;
        }
        if ([(UITransitionView *)self rasterizesOnTransition])
        {
          v69 = [(UIView *)*p_toView layer];
          [v69 setShouldRasterize:1];

          v70 = [(UIView *)self window];
          [v70 screen];
          v72 = v71 = WeakRetained;
          [v72 scale];
          double v74 = v73;
          v75 = [(UIView *)*p_toView layer];
          [v75 setRasterizationScale:v74];

          WeakRetained = v71;
          v76 = [(UIView *)*p_toView layer];
          [v76 setPreloadsCache:1];
        }
        -[UIView setFrameOrigin:](*p_toView, "setFrameOrigin:", v55, v54);
        break;
      case 13:
        [(UIWindow *)self->_originalWindow beginDisablingInterfaceAutorotation];
        break;
      case 14:
        *(_WORD *)&self->_transitionViewFlags |= 0x200u;
        break;
      default:
        break;
    }
    [(UITransitionView *)self _startTransition:v8 withDuration:v17];
    v36 = v81;
  }

  LOBYTE(transitionViewFlags) = v83;
  id v11 = obj;
LABEL_83:

  return (transitionViewFlags & 1) == 0;
}

- (BOOL)transition:(int)a3 fromView:(id)a4 toView:(id)a5
{
  return [(UITransitionView *)self transition:*(void *)&a3 fromView:a4 toView:a5 removeFromView:1];
}

- (void)_didStartTransition
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = WeakRetained;
    char v5 = objc_opt_respondsToSelector();
    uint64_t v4 = v6;
    if (v5)
    {
      [v6 transitionViewDidStart:self];
      uint64_t v4 = v6;
    }
  }
}

- (void)_didCompleteTransition:(BOOL)a3
{
  BOOL v40 = a3;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(UIView *)self->_toView layer];
  [v4 setShouldRasterize:0];

  char v5 = [(UIView *)self->_toView layer];
  [v5 setPreloadsCache:0];

  BOOL v6 = [(UIView *)self->_fromView layer];
  [v6 setShouldRasterize:0];

  BOOL v7 = [(UIView *)self->_fromView layer];
  [v7 setPreloadsCache:0];

  $802F755A6CDB6E48F3999BA741DE358D transitionViewFlags = self->_transitionViewFlags;
  if ((*(unsigned char *)&transitionViewFlags & 0x20) != 0)
  {
    uint64_t v9 = (*(unsigned int *)&transitionViewFlags >> 7) & 1;
    id v10 = [(UIView *)self->_toView layer];
    [v10 setAllowsGroupOpacity:v9];

    uint64_t v11 = (*(_WORD *)&self->_transitionViewFlags >> 6) & 1;
    v12 = [(UIView *)self->_fromView layer];
    [v12 setAllowsGroupOpacity:v11];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v13 = self->_frozenSubviews;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v41 + 1) + 8 * i) layer];
        [v18 setFrozen:0];
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v15);
  }

  frozenSubviews = self->_frozenSubviews;
  self->_frozenSubviews = 0;

  fromView = self->_fromView;
  if (fromView)
  {
    if (fromView != self->_toView)
    {
      v21 = [(UIView *)fromView superview];

      if (v21 == self)
      {
        __int16 v39 = (__int16)self->_transitionViewFlags;
        if ((v39 & 0x400) != 0)
        {
          [(UIView *)self->_fromView removeFromSuperview];
          __int16 v39 = (__int16)self->_transitionViewFlags;
        }
        if ((v39 & 0x10) != 0) {
          [(UIView *)self->_fromView setAlpha:1.0];
        }
        if (self->_firstResponderToRemember
          && -[UIResponder _containsResponder:](self->_fromView, "_containsResponder:"))
        {
          [(UIResponder *)self->_firstResponderToRemember _becomeFirstResponderWhenPossible];
        }
      }
    }
  }
  firstResponderToRemember = self->_firstResponderToRemember;
  self->_firstResponderToRemember = 0;

  __int16 v23 = (__int16)self->_transitionViewFlags;
  if ((v23 & 2) != 0)
  {
    [(id)UIApp setIgnoresInteractionEvents:0];
    __int16 v23 = (__int16)self->_transitionViewFlags;
  }
  *(_WORD *)&self->_$802F755A6CDB6E48F3999BA741DE358D transitionViewFlags = v23 & 0xFFFE;
  ++self->_transitionID;
  [(UIWindow *)self->_originalWindow endDisablingInterfaceAutorotation];
  originalWindow = self->_originalWindow;
  self->_originalWindow = 0;

  v25 = (void *)MEMORY[0x1E4F1CA60];
  v26 = [NSNumber numberWithBool:v40];
  v27 = self->_fromView;
  v28 = [NSNumber numberWithBool:(*(_WORD *)&self->_transitionViewFlags >> 10) & 1];
  int v29 = objc_msgSend(v25, "dictionaryWithObjectsAndKeys:", v26, @"finished", v27, @"fromView", v28, @"removeFromView", 0);

  toView = self->_toView;
  if (toView) {
    [v29 setObject:toView forKey:@"toView"];
  }
  __int16 v31 = self->_fromView;
  v32 = self->_toView;
  v33 = self->_fromView;
  self->_fromView = 0;

  v34 = self->_toView;
  self->_toView = 0;

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (!WeakRetained) {
    goto LABEL_24;
  }
  __int16 v36 = (__int16)self->_transitionViewFlags;
  if ([(UITransitionView *)self shouldNotifyDidCompleteImmediately])
  {
    [(UITransitionView *)self notifyDidCompleteTransition:v29];
    if ((v36 & 8) == 0) {
      goto LABEL_25;
    }
  }
  else
  {
    [(UITransitionView *)self performSelector:sel_notifyDidCompleteTransition_ withObject:v29 afterDelay:0.0];
    if ((v36 & 8) == 0) {
      goto LABEL_25;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [WeakRetained transitionViewShouldUseViewControllerCallbacks])
  {
LABEL_24:
    v37 = +[UIViewController viewControllerForView:v31];
    v38 = +[UIViewController viewControllerForView:v32];
    [v37 endAppearanceTransition];
    [v38 endAppearanceTransition];
  }
LABEL_25:
}

- (BOOL)shouldNotifyDidCompleteImmediately
{
  return (*(_WORD *)&self->_transitionViewFlags >> 2) & 1;
}

- (void)notifyDidCompleteTransition:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(UITransitionView *)self delegate];
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      char v5 = [v8 objectForKey:@"fromView"];
      BOOL v6 = [v8 objectForKey:@"toView"];
      BOOL v7 = [v8 objectForKey:@"removeFromView"];
      objc_msgSend(v4, "transitionViewDidComplete:fromView:toView:removeFromView:", self, v5, v6, objc_msgSend(v7, "BOOLValue"));

LABEL_6:
LABEL_7:

      goto LABEL_8;
    }
    if (objc_opt_respondsToSelector())
    {
      char v5 = [v8 objectForKey:@"fromView"];
      BOOL v6 = [v8 objectForKey:@"toView"];
      [v4 transitionViewDidComplete:self fromView:v5 toView:v6];
      goto LABEL_6;
    }
    if (objc_opt_respondsToSelector())
    {
      char v5 = [v8 objectForKey:@"finished"];
      objc_msgSend(v4, "transitionViewDidComplete:finished:", self, objc_msgSend(v5, "BOOLValue"));
      goto LABEL_7;
    }
    if (objc_opt_respondsToSelector()) {
      [v4 transitionViewDidComplete:self];
    }
  }
LABEL_8:
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UITransitionView;
  [(UIView *)&v7 willMoveToSuperview:v4];
  char v5 = [(UITransitionView *)self delegate];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0) {
    int v6 = [v5 overrideTextEffectsVisibilityLevelForTransitionView:self];
  }
  else {
    int v6 = 300;
  }
  self->_textEffectsVisibilityLevel = v6;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)_transitionDidStopFinished:(BOOL)a3
{
  if (*(_WORD *)&self->_transitionViewFlags)
  {
    BOOL v3 = a3;
    if ((*(_WORD *)&self->_transitionViewFlags & 0x200) != 0)
    {
      [(UIWindow *)self->_originalWindow endDisablingInterfaceAutorotation];
      *(_WORD *)&self->_transitionViewFlags &= ~0x200u;
    }
    [(UITransitionView *)self _didCompleteTransition:v3];
  }
}

- (void)_completeRunningTransition
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setShouldNotifyDidCompleteImmediately:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$802F755A6CDB6E48F3999BA741DE358D transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFFFB | v3;
}

- (void)setIgnoresInteractionEvents:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$802F755A6CDB6E48F3999BA741DE358D transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFFFD | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWindow, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_firstResponderToRemember, 0);
  objc_storeStrong((id *)&self->_frozenSubviews, 0);
  objc_storeStrong((id *)&self->_toView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
}

- (UITransitionView)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UITransitionView;
  char v5 = [(UIView *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UIFromView"];
    fromView = v5->_fromView;
    v5->_fromView = (UIView *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UIToView"];
    toView = v5->_toView;
    v5->_toView = (UIView *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"UIFirstResponderToRemember"];
    firstResponderToRemember = v5->_firstResponderToRemember;
    v5->_firstResponderToRemember = (UIResponder *)v10;

    v12 = [v4 decodeObjectForKey:@"UIDelegate"];
    objc_storeWeak(&v5->_delegate, v12);

    if ([v4 decodeBoolForKey:@"UIIgnoresInteractionEvents"]) {
      __int16 v13 = 2;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&v5->_$802F755A6CDB6E48F3999BA741DE358D transitionViewFlags = *(_WORD *)&v5->_transitionViewFlags & 0xFEFD | v13;
    v5->_textEffectsVisibilityLevel = [v4 decodeIntForKey:@"UITextEffectsVisibilityLevel"];
    [(UITransitionView *)v5 setAnimationTimingCurve:7];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITransitionView;
  [(UIView *)&v9 encodeWithCoder:v4];
  fromView = self->_fromView;
  if (fromView) {
    [v4 encodeObject:fromView forKey:@"UIFromView"];
  }
  toView = self->_toView;
  if (toView) {
    [v4 encodeObject:toView forKey:@"UIToView"];
  }
  firstResponderToRemember = self->_firstResponderToRemember;
  if (firstResponderToRemember) {
    [v4 encodeConditionalObject:firstResponderToRemember forKey:@"UIFirstResponderToRemember"];
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained) {
    [v4 encodeConditionalObject:WeakRetained forKey:@"UIDelegate"];
  }
  if ((*(_WORD *)&self->_transitionViewFlags & 2) != 0) {
    [v4 encodeBool:1 forKey:@"UIIgnoresInteractionEvents"];
  }
  [v4 encodeInt:self->_textEffectsVisibilityLevel forKey:@"UITextEffectsVisibilityLevel"];
}

- (int)textEffectsVisibilityLevel
{
  return self->_textEffectsVisibilityLevel;
}

- (id)fromView
{
  return self->_fromView;
}

- (id)toView
{
  return self->_toView;
}

- (BOOL)isTransitioning
{
  return *(_WORD *)&self->_transitionViewFlags & 1;
}

- (BOOL)_isTransitioningFromFromView:(id)a3
{
  id v4 = (UIView *)a3;
  if ([(UITransitionView *)self isTransitioning] && self->_fromView == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UITransitionView;
    BOOL v5 = [(UIResponder *)&v7 _isTransitioningFromView:self];
  }

  return v5;
}

- (void)setRasterizesOnTransition:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_$802F755A6CDB6E48F3999BA741DE358D transitionViewFlags = *(_WORD *)&self->_transitionViewFlags & 0xFEFF | v3;
}

- (BOOL)rasterizesOnTransition
{
  return HIBYTE(*(_WORD *)&self->_transitionViewFlags) & 1;
}

- (BOOL)ignoresInteractionEvents
{
  return (*(_WORD *)&self->_transitionViewFlags >> 1) & 1;
}

- (void)_startTransition:(int)a3 withDuration:(double)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  *(_WORD *)&self->_transitionViewFlags |= 1u;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x3010000000;
  v67[3] = &unk_186D7DBA7;
  long long v68 = *MEMORY[0x1E4F1DAD8];
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x3010000000;
  v65[3] = &unk_186D7DBA7;
  long long v66 = v68;
  [(UIView *)self bounds];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  fromView = self->_fromView;
  toView = self->_toView;
  int64_t animationTimingCurve = self->_animationTimingCurve;
  unint64_t transitionID = self->_transitionID;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__UITransitionView__startTransition_withDuration___block_invoke;
  aBlock[3] = &unk_1E52E0000;
  aBlock[4] = self;
  aBlock[5] = transitionID;
  v18 = _Block_copy(aBlock);
  unsigned int v19 = a3 & 0xFFFFFFFE;
  int64_t v20 = animationTimingCurve << 16;
  if (a3 <= 0xE && ((1 << a3) & 0x6C00) != 0)
  {
    if (v19 == 10)
    {
      uint64_t v21 = 0x200000;
      if (a3 == 10) {
        uint64_t v21 = 0x100000;
      }
      +[UIView transitionFromView:self->_fromView toView:self->_toView duration:v20 | v21 options:v18 completion:a4];
    }
    else if (a3 == 14)
    {
      [(UIView *)self insertSubview:self->_fromView atIndex:0];
      +[UIView _animateWithFilter:200 filterView:self->_toView filterValue:v20 | 0x10000 duration:v18 delay:0.0 options:a4 completion:0.0];
    }
    else if (a3 == 13)
    {
      [(UIView *)self insertSubview:self->_toView atIndex:0];
      [(UIView *)self->_toView layoutBelowIfNeeded];
      [(UIView *)self->_toView bounds];
      recta[0] = v22;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      double v28 = v27;
      [(UIView *)self->_toView subviews];
      long long v56 = 0u;
      long long v57 = 0u;
      memset(&recta[1], 0, 32);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = [v29 countByEnumeratingWithState:&recta[1] objects:v69 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)recta[3];
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)recta[3] != v31) {
              objc_enumerationMutation(v29);
            }
            [*(id *)(recta[2] + 8 * i) frame];
            CGFloat x = v71.origin.x;
            CGFloat y = v71.origin.y;
            CGFloat width = v71.size.width;
            CGFloat height = v71.size.height;
            double MinY = CGRectGetMinY(v71);
            *(void *)&v72.origin.CGFloat x = recta[0];
            v72.origin.CGFloat y = v24;
            v72.size.CGFloat width = v26;
            v72.size.CGFloat height = v28;
            if (MinY < CGRectGetMaxY(v72))
            {
              v73.origin.CGFloat x = x;
              v73.origin.CGFloat y = y;
              v73.size.CGFloat width = width;
              v73.size.CGFloat height = height;
              double v38 = CGRectGetMinY(v73);
              *(void *)&v74.origin.CGFloat x = recta[0];
              v74.origin.CGFloat y = v24;
              v74.size.CGFloat width = v26;
              v74.size.CGFloat height = v28;
              double v28 = v38 - CGRectGetMinY(v74);
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&recta[1] objects:v69 count:16];
        }
        while (v30);
      }

      [(UIView *)self->_toView bounds];
      double v39 = CGRectGetHeight(v75);
      *(void *)&v76.origin.CGFloat x = recta[0];
      v76.origin.CGFloat y = v24;
      v76.size.CGFloat width = v26;
      v76.size.CGFloat height = v28;
      double MaxY = CGRectGetMaxY(v76);
      if (MaxY < 40.0) {
        double MaxY = 40.0;
      }
      self->_curlUpRevealedHeight = v39 - MaxY;
      [(UIView *)self->_toView bounds];
      _UIViewCurlUpTransitionToTime(&self->_curlUpRevealedHeight, v41, v42);
      +[UIView _animateWithFilter:200 filterView:self->_fromView filterValue:v20 | 0x20000 duration:v18 delay:self->_curlUpRevealedHeight options:a4 completion:0.0];
    }
  }
  else
  {
    BOOL v43 = v19 == 16;
    unsigned int v44 = a3 - 12;
    BOOL v45 = a3 != 6;
    BOOL v46 = a3 == 9 || toView == 0;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    BOOL v47 = v46 || a3 == 20;
    v63[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_2;
    v63[3] = &__block_descriptor_48_e24_v24__0___v___8___v__B_16l;
    BOOL v49 = !v47 && (a3 - 18) < 0xFFFFFFFE && a3 != 6;
    *(double *)&v63[4] = a4;
    v63[5] = v20;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    BOOL v50 = a3 == 8 || fromView == 0;
    v58[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_6;
    v58[3] = &unk_1E530FAC8;
    if (v50 || (a3 - 20) >= 0xFFFFFFFC) {
      BOOL v45 = 0;
    }
    int v59 = a3;
    BOOL v52 = __CFADD__(v44, 2);
    BOOL v53 = v44 < 0xFFFFFFFE && v49;
    if (v52) {
      BOOL v45 = 0;
    }
    v58[4] = self;
    v58[5] = v67;
    v58[7] = v7;
    v58[8] = v9;
    v58[9] = v11;
    v58[10] = v13;
    *(double *)&v58[11] = a4;
    BOOL v60 = v45;
    BOOL v61 = v53;
    v58[6] = v65;
    BOOL v62 = v43;
    +[UIView conditionallyAnimate:a4 > 0.0 withAnimation:v63 layout:v58 completion:v18];
  }

  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);
}

void *__50__UITransitionView__startTransition_withDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 32;
  result = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) == result[60]) {
    return (void *)[result _transitionDidStopFinished:a2];
  }
  return result;
}

void __50__UITransitionView__startTransition_withDuration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  self;
  if (fluidPresentationTransitionsEnabled == 1)
  {
    uint64_t v7 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:*(double *)(a1 + 32)];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_3;
    v17[3] = &unk_1E52DA040;
    uint64_t v8 = &v18;
    id v18 = v5;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_4;
    v15[3] = &unk_1E52E8F50;
    id v16 = v6;
    id v9 = v5;
    +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v17 completion:v15];
  }
  else
  {
    double v10 = *(double *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_5;
    v13[3] = &unk_1E52DA040;
    uint64_t v8 = &v14;
    id v14 = v5;
    id v12 = v5;
    +[UIView animateWithDuration:v11 delay:v13 options:v6 animations:v10 completion:0.0];
  }
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048611, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048611, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __50__UITransitionView__startTransition_withDuration___block_invoke_6(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 96);
  switch(v2)
  {
    case 1:
      [*(id *)(*(void *)(a1 + 32) + 408) bounds];
      double v6 = -v5;
      goto LABEL_7;
    case 2:
      double v6 = *(double *)(a1 + 72);
LABEL_7:
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      *(double *)(v7 + 32) = floor(v6);
      *(void *)(v7 + 40) = 0;
      goto LABEL_9;
    case 3:
    case 12:
      double v3 = -*(double *)(a1 + 80);
      goto LABEL_4;
    case 7:
    case 9:
    case 20:
      double v3 = *(double *)(a1 + 80);
LABEL_4:
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v4 + 32) = 0;
      *(double *)(v4 + 40) = floor(v3);
      goto LABEL_9;
    case 17:
      [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 416) belowSubview:*(void *)(*(void *)(a1 + 32) + 408)];
LABEL_9:
      int v2 = *(_DWORD *)(a1 + 96);
      break;
    default:
      break;
  }
  switch(v2)
  {
    case 20:
      [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
      break;
    case 19:
      double v14 = *(double *)(a1 + 88);
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_7;
      v73[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
      *(double *)&v73[4] = v14;
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_9;
      v72[3] = &unk_1E52D9F70;
      v72[4] = *(void *)(a1 + 32);
      +[UIView conditionallyAnimate:v14 > 0.0 withAnimation:v73 layout:v72 completion:0];
      *(_WORD *)(*(void *)(a1 + 32) + 456) |= 0x10u;
      if ([*(id *)(a1 + 32) _shouldDisableGroupOpacityOnAlphaTransitions])
      {
        objc_super v15 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
        if ([v15 allowsGroupOpacity]) {
          __int16 v16 = 128;
        }
        else {
          __int16 v16 = 0;
        }
        *(_WORD *)(*(void *)(a1 + 32) + 456) = *(_WORD *)(*(void *)(a1 + 32) + 456) & 0xFF7F | v16;

        double v17 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
        if ([v17 allowsGroupOpacity]) {
          __int16 v18 = 64;
        }
        else {
          __int16 v18 = 0;
        }
        *(_WORD *)(*(void *)(a1 + 32) + 456) = *(_WORD *)(*(void *)(a1 + 32) + 456) & 0xFFBF | v18;

        unsigned int v19 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
        [v19 setAllowsGroupOpacity:0];

        uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 408);
        goto LABEL_30;
      }
      break;
    case 6:
      [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
      [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
      *(_WORD *)(*(void *)(a1 + 32) + 456) |= 0x10u;
      if ([*(id *)(a1 + 32) _shouldDisableGroupOpacityOnAlphaTransitions])
      {
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
        if ([v8 allowsGroupOpacity]) {
          __int16 v9 = 128;
        }
        else {
          __int16 v9 = 0;
        }
        *(_WORD *)(*(void *)(a1 + 32) + 456) = *(_WORD *)(*(void *)(a1 + 32) + 456) & 0xFF7F | v9;

        double v10 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
        if ([v10 allowsGroupOpacity]) {
          __int16 v11 = 64;
        }
        else {
          __int16 v11 = 0;
        }
        *(_WORD *)(*(void *)(a1 + 32) + 456) = *(_WORD *)(*(void *)(a1 + 32) + 456) & 0xFFBF | v11;

        id v12 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
        [v12 setAllowsGroupOpacity:0];

        uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 408);
LABEL_30:
        int64_t v20 = [v13 layer];
        [v20 setAllowsGroupOpacity:0];

        *(_WORD *)(*(void *)(a1 + 32) + 456) |= 0x20u;
      }
      break;
  }
  uint64_t v21 = [*(id *)(a1 + 32) delegate];
  uint64_t v22 = (void *)v21;
  if (*(unsigned char *)(a1 + 100) && v21 && v21 != *(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v22, "transitionView:endOriginForFromView:forTransition:defaultOrigin:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 408), *(unsigned int *)(a1 + 96), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v23 + 32) = v24;
    *(void *)(v23 + 40) = v25;
  }
  if (*(unsigned char *)(a1 + 101) && v22 && v22 != *(void **)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v22, "transitionView:endOriginForToView:forTransition:defaultOrigin:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 416), *(unsigned int *)(a1 + 96), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v26 + 32) = v27;
    *(void *)(v26 + 40) = v28;
  }
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v30 = *(void *)(a1 + 32);
  uint64_t v31 = *(void **)(v30 + 424);
  *(void *)(v30 + 424) = v29;

  if (*(unsigned char *)(a1 + 100))
  {
    if ([*(id *)(a1 + 32) rasterizesOnTransition])
    {
      v32 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
      [v32 setShouldRasterize:1];

      v33 = [*(id *)(a1 + 32) window];
      v34 = [v33 screen];
      [v34 scale];
      double v36 = v35;
      v37 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
      [v37 setRasterizationScale:v36];

      double v38 = [*(id *)(*(void *)(a1 + 32) + 408) layer];
      [v38 setPreloadsCache:1];

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      double v39 = [*(id *)(*(void *)(a1 + 32) + 408) subviews];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v68 objects:v75 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v69 != v42) {
              objc_enumerationMutation(v39);
            }
            unsigned int v44 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            BOOL v45 = [v44 layer];
            char v46 = [v45 isFrozen];

            if ((v46 & 1) == 0)
            {
              BOOL v47 = [v44 layer];
              [v47 setFrozen:1];

              [*(id *)(*(void *)(a1 + 32) + 424) addObject:v44];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v68 objects:v75 count:16];
        }
        while (v41);
      }
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrameOrigin:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  if (*(unsigned char *)(a1 + 101))
  {
    if ([*(id *)(a1 + 32) rasterizesOnTransition])
    {
      double v48 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
      [v48 setShouldRasterize:1];

      BOOL v49 = [*(id *)(a1 + 32) window];
      BOOL v50 = [v49 screen];
      [v50 scale];
      double v52 = v51;
      BOOL v53 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
      [v53 setRasterizationScale:v52];

      double v54 = [*(id *)(*(void *)(a1 + 32) + 416) layer];
      [v54 setPreloadsCache:1];

      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      double v55 = [*(id *)(*(void *)(a1 + 32) + 416) subviews];
      uint64_t v56 = [v55 countByEnumeratingWithState:&v64 objects:v74 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v57; ++j)
          {
            if (*(void *)v65 != v58) {
              objc_enumerationMutation(v55);
            }
            BOOL v60 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            BOOL v61 = [v60 layer];
            char v62 = [v61 isFrozen];

            if ((v62 & 1) == 0)
            {
              uint64_t v63 = [v60 layer];
              [v63 setFrozen:1];

              [*(id *)(*(void *)(a1 + 32) + 424) addObject:v60];
            }
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v64 objects:v74 count:16];
        }
        while (v57);
      }
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrameOrigin:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  if (*(unsigned char *)(a1 + 102) && v22 && v22 != *(void **)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [v22 transitionView:*(void *)(a1 + 32) startCustomTransitionWithDuration:*(double *)(a1 + 88)];
  }
}

void __50__UITransitionView__startTransition_withDuration___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  self;
  if (fluidPresentationTransitionsEnabled == 1)
  {
    uint64_t v7 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:*(double *)(a1 + 32) * 0.375];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__UITransitionView__startTransition_withDuration___block_invoke_8;
    v8[3] = &unk_1E52E8F50;
    id v9 = v6;
    +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v5 completion:v8];
  }
  else
  {
    +[UIView animateWithDuration:512 delay:v5 options:v6 animations:*(double *)(a1 + 32) * 0.375 completion:0.0];
  }
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__UITransitionView__startTransition_withDuration___block_invoke_9(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
}

- (BOOL)_shouldDisableGroupOpacityOnAlphaTransitions
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UITransitionView;
  -[UIView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (UITransitionView *)objc_claimAutoreleasedReturnValue();
  if (self->_ignoreDirectTouchEvents)
  {
    int v6 = 0;
  }
  else
  {
    uint64_t v7 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
    int v8 = [v7 _containerViewShouldIgnoreDirectTouchEvents];

    int v6 = v8 ^ 1;
  }
  if (v5 == self && v6 == 0) {
    double v10 = 0;
  }
  else {
    double v10 = v5;
  }

  return v10;
}

- (void)setBounds:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITransitionView;
  -[UIView setBounds:](&v5, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = [(UIView *)self _presentationControllerToNotifyOnLayoutSubviews];
  [v4 _containerViewBoundsDidChange];
}

- (int64_t)animationTimingCurve
{
  return self->_animationTimingCurve;
}

- (BOOL)ignoreDirectTouchEvents
{
  return self->_ignoreDirectTouchEvents;
}

- (double)_curlUpRevealedHeight
{
  return self->_curlUpRevealedHeight;
}

@end