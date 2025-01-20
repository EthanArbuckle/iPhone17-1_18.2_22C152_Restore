@interface SBHomeAffordanceInteraction
- (BOOL)isEnabled;
- (CGRect)homeAffordanceFrame;
- (CGRect)homeAffordanceHitTestRect;
- (MTLumaDodgePillSettings)lumaDodgePillSettings;
- (SBFHomeAffordanceInteractionDelegate)delegate;
- (SBFHomeGrabberSettings)homeGrabberSettings;
- (SBHomeAffordanceInteraction)initWithHomeAffordanceInteractionManager:(id)a3;
- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager;
- (UIEdgeInsets)expandedHomeAffordanceHitTestRectOutsets;
- (UIEdgeInsets)standardHomeAffordanceHitTestRectOutsets;
- (UIView)view;
- (id)_assistantController;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)notifyDidFailToRecognizeDoubleTap;
- (void)notifyDidRecognizeDoubleTap;
- (void)notifyDidRecognizeSingleTap;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHomeAffordanceHitTestRect:(CGRect)a3;
- (void)setNeedsUpdate;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)willMoveToView:(id)a3;
@end

@implementation SBHomeAffordanceInteraction

- (void)setNeedsUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
  [WeakRetained updateHomeAffordanceHitTestRectForHomeAffordanceInteraction:self];
}

- (UIEdgeInsets)standardHomeAffordanceHitTestRectOutsets
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained standardHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:self];
    double v24 = v29;
    double v25 = v30;
    double v27 = v31;
    double v28 = v32;
  }
  else
  {
    id WeakRetained = [(SBHomeAffordanceInteraction *)self view];
    v4 = [WeakRetained window];
    [(SBHomeAffordanceInteraction *)self homeAffordanceFrame];
    objc_msgSend(WeakRetained, "convertRect:toView:", v4);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 safeAreaInsets];
    double v14 = v13;
    [v4 bounds];
    CGFloat v15 = CGRectGetMaxY(v37) - v14;
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = v10;
    v38.size.height = v12;
    double v16 = 0.0;
    double v17 = fmax(CGRectGetMaxY(v38) - v15, 0.0);
    v18 = [(SBHomeAffordanceInteraction *)self _assistantController];
    int v19 = [v18 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

    if (v19) {
      double v16 = v17;
    }
    [(SBFHomeGrabberSettings *)self->_homeGrabberSettings hitTestOutsetTop];
    double v21 = v16 + v20;
    if (([(SBFHomeGrabberSettings *)self->_homeGrabberSettings constrainHitTestRectToSafeAreaInset] & (v21 > v17)) != 0)double v21 = v17; {
    [(SBFHomeGrabberSettings *)self->_homeGrabberSettings hitTestOutsetSides];
    }
    double v23 = v22;
    [(MTLumaDodgePillSettings *)self->_lumaDodgePillSettings edgeSpacing];
    double v24 = -v21;
    double v25 = -v23;
    double v27 = -v26;

    double v28 = v25;
  }

  double v33 = v24;
  double v34 = v25;
  double v35 = v27;
  double v36 = v28;
  result.right = v36;
  result.bottom = v35;
  result.left = v34;
  result.top = v33;
  return result;
}

- (CGRect)homeAffordanceFrame
{
  v3 = [(SBHomeAffordanceInteraction *)self view];
  v4 = v3;
  if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeAffordanceFrameForHomeAffordanceInteraction:self];
    double v6 = v14;
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
  }
  else if (v3)
  {
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setHomeAffordanceHitTestRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_homeAffordanceHitTestRect))
  {
    self->_homeAffordanceHitTestRect.origin.CGFloat x = x;
    self->_homeAffordanceHitTestRect.origin.CGFloat y = y;
    self->_homeAffordanceHitTestRect.size.CGFloat width = width;
    self->_homeAffordanceHitTestRect.size.CGFloat height = height;
    if ((*(unsigned char *)&self->_delegateRespondsTo & 8) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained homeAffordanceInteractionHomeAffordanceHitTestRectDidChange:self];
    }
  }
}

- (CGRect)homeAffordanceHitTestRect
{
  double x = self->_homeAffordanceHitTestRect.origin.x;
  double y = self->_homeAffordanceHitTestRect.origin.y;
  double width = self->_homeAffordanceHitTestRect.size.width;
  double height = self->_homeAffordanceHitTestRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_assistantController
{
  v2 = [(SBHomeAffordanceInteraction *)self view];
  v3 = [v2 _sbWindowScene];
  v4 = [v3 assistantController];

  return v4;
}

- (void)willMoveToView:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
    id v6 = WeakRetained;
    if (v3) {
      [WeakRetained registerHomeAffordanceInteraction:self];
    }
    else {
      [WeakRetained unregisterHomeAffordanceInteraction:self];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v5 = 2;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFD | v5;
    if (objc_opt_respondsToSelector()) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFB | v6;
    if (objc_opt_respondsToSelector()) {
      char v7 = 8;
    }
    else {
      char v7 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xF7 | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 16;
    }
    else {
      char v8 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xEF | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 32;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xDF | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 64;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xBF | v10;
  }
}

- (SBHomeAffordanceInteraction)initWithHomeAffordanceInteractionManager:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHomeAffordanceInteraction;
  char v5 = [(SBHomeAffordanceInteraction *)&v13 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_homeAffordanceInteractionManager, v4);
    uint64_t v7 = [MEMORY[0x1E4FA5F28] rootSettings];
    homeGrabberSettings = v6->_homeGrabberSettings;
    v6->_homeGrabberSettings = (SBFHomeGrabberSettings *)v7;

    [(SBFHomeGrabberSettings *)v6->_homeGrabberSettings addKeyObserver:v6];
    uint64_t v9 = [MEMORY[0x1E4F743B8] sharedInstance];
    lumaDodgePillSettings = v6->_lumaDodgePillSettings;
    v6->_lumaDodgePillSettings = (MTLumaDodgePillSettings *)v9;

    [(MTLumaDodgePillSettings *)v6->_lumaDodgePillSettings addKeyObserver:v6];
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v6->_homeAffordanceHitTestRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v6->_homeAffordanceHitTestRect.size = v11;
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
  [WeakRetained unregisterHomeAffordanceInteraction:self];

  v4.receiver = self;
  v4.super_class = (Class)SBHomeAffordanceInteraction;
  [(SBHomeAffordanceInteraction *)&v4 dealloc];
}

- (UIEdgeInsets)expandedHomeAffordanceHitTestRectOutsets
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained expandedHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:self];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v3 = v9;
    double v4 = v11;
    double v5 = v13;
    double v6 = v15;
  }
  else
  {
    [(SBFHomeGrabberSettings *)self->_homeGrabberSettings hitTestOutsetDoubleTap];
    [(SBHomeAffordanceInteraction *)self standardHomeAffordanceHitTestRectOutsets];
    UIEdgeInsetsAdd();
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)notifyDidRecognizeSingleTap
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 0x10) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeAffordanceInteractionDidRecognizeSingleTap:self];
  }
}

- (void)notifyDidRecognizeDoubleTap
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 0x20) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeAffordanceInteractionDidRecognizeDoubleTap:self];
  }
}

- (void)notifyDidFailToRecognizeDoubleTap
{
  if ((*(unsigned char *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained homeAffordanceInteractionDidFailToRecognizeDoubleTap:self];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_homeGrabberSettings == a3 || self->_lumaDodgePillSettings == a3) {
    [(SBHomeAffordanceInteraction *)self setNeedsUpdate];
  }
}

- (SBFHomeAffordanceInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFHomeAffordanceInteractionDelegate *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SBHomeAffordanceInteractionManager)homeAffordanceInteractionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceInteractionManager);
  return (SBHomeAffordanceInteractionManager *)WeakRetained;
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

- (MTLumaDodgePillSettings)lumaDodgePillSettings
{
  return self->_lumaDodgePillSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lumaDodgePillSettings, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
  objc_destroyWeak((id *)&self->_homeAffordanceInteractionManager);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end