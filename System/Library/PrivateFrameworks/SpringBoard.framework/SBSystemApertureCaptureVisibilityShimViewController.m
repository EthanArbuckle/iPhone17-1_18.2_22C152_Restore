@interface SBSystemApertureCaptureVisibilityShimViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_isOriginalContentCloned;
- (BOOL)doContentsDifferOnClonedDisplay;
- (BOOL)isVisibleInSnapshots;
- (BOOL)isVisibleOnClonedDisplay;
- (SBSystemApertureCaptureVisibilityShimViewController)initWithContentViewController:(id)a3;
- (id)newDefaultVisibilityAnimator;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateClonedVisibility;
- (void)_updatePortalVisibility;
- (void)_updateSnapshotVisibility;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setContentsDifferOnClonedDisplay:(BOOL)a3;
- (void)setVisibleInSnapshots:(BOOL)a3;
- (void)setVisibleOnClonedDisplay:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SBSystemApertureCaptureVisibilityShimViewController

- (void)setVisibleOnClonedDisplay:(BOOL)a3
{
  if (self->_visibleOnClonedDisplay != a3)
  {
    self->_visibleOnClonedDisplay = a3;
    [(SBSystemApertureCaptureVisibilityShimViewController *)self _updateClonedVisibility];
  }
}

- (void)setVisibleInSnapshots:(BOOL)a3
{
  if (self->_visibleInSnapshots != a3)
  {
    self->_visibleInSnapshots = a3;
    [(SBSystemApertureCaptureVisibilityShimViewController *)self _updateSnapshotVisibility];
  }
}

- (void)setContentsDifferOnClonedDisplay:(BOOL)a3
{
  if (self->_contentsDifferOnClonedDisplay != a3)
  {
    self->_contentsDifferOnClonedDisplay = a3;
    [(SBSystemApertureCaptureVisibilityShimViewController *)self _updatePortalVisibility];
  }
}

- (void)_updateSnapshotVisibility
{
  id v7 = [(UIViewController *)self->_contentViewController view];
  v3 = [v7 layer];
  int v4 = [v3 disableUpdateMask];

  uint64_t v5 = v4 & 0xFFFFFFFD | (2 * !self->_visibleInSnapshots);
  v6 = [v7 layer];
  [v6 setDisableUpdateMask:v5];
}

- (void)_updateClonedVisibility
{
  double v2 = 1.0;
  if (!self->_visibleOnClonedDisplay) {
    double v2 = 0.0;
  }
  [(_UIPortalView *)self->_clonedDisplayPortalView setAlpha:v2];
}

- (id)newDefaultVisibilityAnimator
{
  if (![(SBSystemApertureCaptureVisibilityShimViewController *)self _isOriginalContentCloned])return 0; {
  id v3 = objc_alloc(MEMORY[0x1E4F43008]);
  }
  [(SBSystemApertureSettings *)self->_settings alphaTransitionDurationOnClonedDisplay];
  double v5 = v4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F42910]) initWithAnimationCurve:0];
  id v7 = (void *)[v3 initWithDuration:v6 timingParameters:v5];

  return v7;
}

- (BOOL)_isOriginalContentCloned
{
  double v2 = [(UIViewController *)self->_contentViewController view];
  id v3 = [v2 _fbsDisplayConfiguration];
  double v4 = [v3 CADisplay];
  char v5 = [v4 isCloned];

  return v5;
}

- (SBSystemApertureCaptureVisibilityShimViewController)initWithContentViewController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureCaptureVisibilityShimViewController;
  v6 = [(SBSystemApertureCaptureVisibilityShimViewController *)&v10 initWithNibName:0 bundle:0];
  if (v6)
  {
    uint64_t v7 = +[SBSystemApertureDomain rootSettings];
    settings = v6->_settings;
    v6->_settings = (SBSystemApertureSettings *)v7;

    objc_storeStrong((id *)&v6->_contentViewController, a3);
  }

  return v6;
}

- (void)viewDidLoad
{
  v27.receiver = self;
  v27.super_class = (Class)SBSystemApertureCaptureVisibilityShimViewController;
  [(SBSystemApertureCaptureVisibilityShimViewController *)&v27 viewDidLoad];
  id v3 = [(SBSystemApertureCaptureVisibilityShimViewController *)self view];
  double v4 = [(SBSystemApertureCaptureVisibilityShimViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [(SBSystemApertureCaptureVisibilityShimViewController *)self bs_addChildViewController:self->_contentViewController withSuperview:v3];
  v13 = [(UIViewController *)self->_contentViewController view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  [v13 setAutoresizingMask:18];
  v14 = [v13 layer];
  [v14 setDisableUpdateMask:2];

  v15 = (_UIPortalView *)[objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:v13];
  displayPortalView = self->_displayPortalView;
  self->_displayPortalView = v15;

  [(_UIPortalView *)self->_displayPortalView setMatchesPosition:1];
  [(_UIPortalView *)self->_displayPortalView setMatchesTransform:1];
  [(_UIPortalView *)self->_displayPortalView setHidesSourceView:1];
  [(_UIPortalView *)self->_displayPortalView setForwardsClientHitTestingToSourceView:1];
  [(_UIPortalView *)self->_displayPortalView setAllowsHitTesting:1];
  -[_UIPortalView setFrame:](self->_displayPortalView, "setFrame:", v6, v8, v10, v12);
  [(_UIPortalView *)self->_displayPortalView setAutoresizingMask:18];
  v17 = [(_UIPortalView *)self->_displayPortalView layer];
  [v17 setDisableUpdateMask:1042];

  [v3 addSubview:self->_displayPortalView];
  v18 = (_UIPortalView *)[objc_alloc(MEMORY[0x1E4F43298]) initWithSourceView:v13];
  clonedDisplayPortalView = self->_clonedDisplayPortalView;
  self->_clonedDisplayPortalView = v18;

  [(_UIPortalView *)self->_clonedDisplayPortalView setUserInteractionEnabled:0];
  v20 = [(_UIPortalView *)self->_clonedDisplayPortalView layer];
  [v20 setAllowsHitTesting:0];

  [(_UIPortalView *)self->_clonedDisplayPortalView setMatchesPosition:1];
  [(_UIPortalView *)self->_clonedDisplayPortalView setMatchesTransform:1];
  [(_UIPortalView *)self->_clonedDisplayPortalView setHidesSourceView:1];
  -[_UIPortalView setFrame:](self->_clonedDisplayPortalView, "setFrame:", v6, v8, v10, v12);
  [(_UIPortalView *)self->_clonedDisplayPortalView setAutoresizingMask:18];
  v21 = [(_UIPortalView *)self->_clonedDisplayPortalView layer];
  [v21 setDisableUpdateMask:3];

  v22 = [(_UIPortalView *)self->_clonedDisplayPortalView layer];
  [v22 setAllowsGroupOpacity:1];

  [(_UIPortalView *)self->_clonedDisplayPortalView setAlpha:1.0];
  [v3 addSubview:self->_clonedDisplayPortalView];
  [(SBSystemApertureCaptureVisibilityShimViewController *)self _updateClonedVisibility];
  v23 = [(UIViewController *)self->_contentViewController view];
  v24 = [v23 _fbsDisplayConfiguration];
  v25 = [v24 CADisplay];
  observedDisplay = self->_observedDisplay;
  self->_observedDisplay = v25;

  [(CADisplay *)self->_observedDisplay addObserver:self forKeyPath:@"cloned" options:1 context:0];
  [(SBSystemApertureCaptureVisibilityShimViewController *)self _updatePortalVisibility];
}

- (void)dealloc
{
  [(CADisplay *)self->_observedDisplay removeObserver:self forKeyPath:@"cloned"];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemApertureCaptureVisibilityShimViewController;
  [(SBSystemApertureCaptureVisibilityShimViewController *)&v3 dealloc];
}

- (void)_updatePortalVisibility
{
  if ([(SBSystemApertureCaptureVisibilityShimViewController *)self _isOriginalContentCloned]) {
    BOOL contentsDifferOnClonedDisplay = self->_contentsDifferOnClonedDisplay;
  }
  else {
    BOOL contentsDifferOnClonedDisplay = 0;
  }
  [(_UIPortalView *)self->_displayPortalView setHidesSourceView:contentsDifferOnClonedDisplay];
  uint64_t v4 = contentsDifferOnClonedDisplay ^ 1;
  [(_UIPortalView *)self->_displayPortalView setHidden:v4];
  [(_UIPortalView *)self->_clonedDisplayPortalView setHidden:v4];
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(UIViewController *)self->_contentViewController view];
  }
  id v6 = (id)v5;
  [(_UIPortalView *)self->_displayPortalView setSourceView:v5];
  [(_UIPortalView *)self->_clonedDisplayPortalView setSourceView:v6];
}

- (unint64_t)supportedInterfaceOrientations
{
  return [(UIViewController *)self->_contentViewController supportedInterfaceOrientations];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  if ([a3 isEqualToString:@"cloned"] && BSEqualObjects())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__SBSystemApertureCaptureVisibilityShimViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __102__SBSystemApertureCaptureVisibilityShimViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePortalVisibility];
}

- (BOOL)isVisibleOnClonedDisplay
{
  return self->_visibleOnClonedDisplay;
}

- (BOOL)isVisibleInSnapshots
{
  return self->_visibleInSnapshots;
}

- (BOOL)doContentsDifferOnClonedDisplay
{
  return self->_contentsDifferOnClonedDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedDisplay, 0);
  objc_storeStrong((id *)&self->_clonedDisplayPortalView, 0);
  objc_storeStrong((id *)&self->_displayPortalView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end