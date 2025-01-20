@interface CRLWPRepCaretController
- (BOOL)caretAnimates;
- (BOOL)caretIsHidden;
- (BOOL)p_caretIsHidden;
- (BOOL)p_isRedesignedTextCursorEnabled;
- (BOOL)p_shouldSuppressSelectionHighlight;
- (BOOL)suppressCaret;
- (CALayer)caretLayer;
- (CRLWPRepCaretController)initWithDelegate:(id)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (void)didEnterBackground;
- (void)hideCaretLayer;
- (void)p_caretTimerFired:(id)a3;
- (void)p_disableAnimation;
- (void)p_enableAnimation;
- (void)p_setCaretOn:(BOOL)a3 forLayer:(id)a4;
- (void)p_setCaretOpacity:(float)a3;
- (void)p_startCaretLayerAnimation;
- (void)p_toggleCaretOpacity;
- (void)setCaretAnimates:(BOOL)a3;
- (void)setCaretLayer:(id)a3;
- (void)setSuppressCaret:(BOOL)a3;
- (void)showCaretLayerStartingAnimation;
- (void)stopCaretLayerAnimationHidingCaret:(BOOL)a3;
- (void)tearDown;
- (void)willEnterForeground;
@end

@implementation CRLWPRepCaretController

- (CRLWPRepCaretController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLWPRepCaretController;
  v5 = [(CRLWPRepCaretController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_caretAnimatorConfigurator = (Class)objc_opt_class();
    if ([(CRLWPRepCaretController *)v6 p_isRedesignedTextCursorEnabled]) {
      v6->_suppressCaret = 1;
    }
  }

  return v6;
}

- (void)tearDown
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)&self->_delegate, 0);
  [(CALayer *)self->_caretLayer setDelegate:0];
  caretLayer = self->_caretLayer;
  self->_caretLayer = 0;
}

- (void)setCaretLayer:(id)a3
{
  id v4 = (CALayer *)a3;
  [(CALayer *)self->_caretLayer setDelegate:0];
  [(CALayer *)v4 setDelegate:self];
  caretLayer = self->_caretLayer;
  self->_caretLayer = v4;
}

- (void)setSuppressCaret:(BOOL)a3
{
  self->_suppressCaret = a3;
}

- (BOOL)p_shouldSuppressSelectionHighlight
{
  if ([(CRLWPRepCaretController *)self p_isRedesignedTextCursorEnabled]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v5 = [WeakRetained isSelectionHighlightSuppressed];

  return v5;
}

- (BOOL)p_isRedesignedTextCursorEnabled
{
  return +[CRLFeatureFlagGroup isRedesignedTextCursorEnabled];
}

- (BOOL)caretAnimates
{
  return !self->_animationDisabled;
}

- (void)setCaretAnimates:(BOOL)a3
{
  if (a3) {
    [(CRLWPRepCaretController *)self p_enableAnimation];
  }
  else {
    [(CRLWPRepCaretController *)self p_disableAnimation];
  }
}

- (void)p_disableAnimation
{
  if (!self->_animationDisabled)
  {
    self->_animationDisabled = 1;
    if (![(CRLWPRepCaretController *)self p_caretIsHidden])
    {
      [(CRLWPRepCaretController *)self stopCaretLayerAnimationHidingCaret:0];
    }
  }
}

- (void)p_enableAnimation
{
  if (self->_animationDisabled)
  {
    self->_animationDisabled = 0;
    if (![(CRLWPRepCaretController *)self p_caretIsHidden])
    {
      [(CRLWPRepCaretController *)self p_startCaretLayerAnimation];
    }
  }
}

- (void)willEnterForeground
{
  if (![(CRLWPRepCaretController *)self p_caretIsHidden])
  {
    [(CRLWPRepCaretController *)self p_startCaretLayerAnimation];
  }
}

- (void)didEnterBackground
{
  if (![(CRLWPRepCaretController *)self p_caretIsHidden])
  {
    [(CRLWPRepCaretController *)self stopCaretLayerAnimationHidingCaret:1];
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  v6 = +[NSNull null];
  if ([(objc_class *)self->_caretAnimatorConfigurator caretShouldFade]
    && [v5 isEqualToString:@"opacity"])
  {

    v6 = 0;
  }

  return v6;
}

- (void)p_startCaretLayerAnimation
{
  self->_caretCancelled = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  if (WeakRetained)
  {
  }
  else if (![(CRLWPRepCaretController *)self p_shouldSuppressSelectionHighlight])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003F6A0C;
    block[3] = &unk_1014CBBB0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)stopCaretLayerAnimationHidingCaret:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_caretLayer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  self->_caretCancelled = 1;
  if (WeakRetained || v3)
  {
    objc_storeWeak((id *)&self->_caretTimer, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1003F6BF0;
    v7[3] = &unk_1014E2B38;
    v7[4] = self;
    id v8 = WeakRetained;
    BOOL v10 = v3;
    v9 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)showCaretLayerStartingAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);

  id v4 = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v5 = [v4 selectionChangeWasLocal];

  if ((v5 & 1) != 0 || !WeakRetained)
  {
    if (!self->_animationDisabled)
    {
      [(CRLWPRepCaretController *)self stopCaretLayerAnimationHidingCaret:0];
      [(CRLWPRepCaretController *)self p_startCaretLayerAnimation];
    }
    if (![(CRLWPRepCaretController *)self suppressCaret])
    {
      [(CALayer *)self->_caretLayer setHidden:0];
      caretLayer = self->_caretLayer;
      [(CRLWPRepCaretController *)self p_setCaretOn:1 forLayer:caretLayer];
    }
  }
}

- (BOOL)caretIsHidden
{
  if (![(CRLWPRepCaretController *)self p_caretIsHidden]
    && ![(CALayer *)self->_caretLayer isHidden])
  {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_caretTimer);
  BOOL v4 = WeakRetained == 0;

  return v4;
}

- (void)hideCaretLayer
{
  if (!self->_animationDisabled) {
    [(CRLWPRepCaretController *)self stopCaretLayerAnimationHidingCaret:1];
  }
  caretLayer = self->_caretLayer;

  [(CALayer *)caretLayer setHidden:1];
}

- (void)p_caretTimerFired:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    if ([(objc_class *)self->_caretAnimatorConfigurator caretShouldFade])
    {
      [(CALayer *)self->_caretLayer opacity];
      BOOL v6 = v5 <= 0.01;
      BOOL v7 = v5 > 0.01;
      +[CATransaction begin];
      [(objc_class *)self->_caretAnimatorConfigurator animationDurationForHide:v7];
      +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
      [(CRLWPRepCaretController *)self p_setCaretOn:v6 forLayer:self->_caretLayer];
      +[CATransaction commit];
      [(objc_class *)self->_caretAnimatorConfigurator animationCycleForHide:v7];
      id v8 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "p_caretTimerFired:", 0, 0);
      objc_storeWeak((id *)&self->_caretTimer, v8);
    }
    else
    {
      [(CRLWPRepCaretController *)self p_toggleCaretOpacity];
    }
  }
  else
  {
    [v9 invalidate];
  }
}

- (void)p_setCaretOn:(BOOL)a3 forLayer:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(objc_class *)self->_caretAnimatorConfigurator caretShouldFade])
  {
    LODWORD(v6) = 1008981770;
    if (v4) {
      *(float *)&double v6 = 1.0;
    }
    [v7 setOpacity:v6];
  }
}

- (BOOL)p_caretIsHidden
{
  [(CALayer *)self->_caretLayer opacity];
  return v2 == 0.01;
}

- (void)p_setCaretOpacity:(float)a3
{
}

- (void)p_toggleCaretOpacity
{
  [(CALayer *)self->_caretLayer opacity];
  BOOL v3 = *(float *)&v4 == 0.01;
  LODWORD(v4) = 1.0;
  if (!v3) {
    *(float *)&double v4 = 0.01;
  }

  [(CRLWPRepCaretController *)self p_setCaretOpacity:v4];
}

- (CALayer)caretLayer
{
  return self->_caretLayer;
}

- (BOOL)suppressCaret
{
  return self->_suppressCaret;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_caretTimer);

  objc_storeStrong((id *)&self->_caretLayer, 0);
}

@end