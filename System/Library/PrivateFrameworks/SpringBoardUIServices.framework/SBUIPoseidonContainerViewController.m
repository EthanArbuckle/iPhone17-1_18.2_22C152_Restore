@interface SBUIPoseidonContainerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)coachingActive;
- (BOOL)fingerOffSinceWake;
- (BOOL)isAuthenticated;
- (BOOL)isBioLockout;
- (BOOL)isScreenOn;
- (BOOL)resignActive;
- (SBUIPoseidonContainerViewController)initWithAuthenticationInformationProvider:(id)a3;
- (SBUIPoseidonContainerViewControllerDelegate)delegate;
- (SBUIPoseidonContainerViewControllerLockStatusProvider)authenticationInformationProvider;
- (_UILegibilitySettings)legibilitySettings;
- (id)_poseidonIconView;
- (id)_testPoseidonIconView;
- (int)unlockSource;
- (void)_setCounterTransformForOrientation:(int64_t)a3;
- (void)_setLocalTransformForOrientation:(int64_t)a3;
- (void)_updateRotation;
- (void)fillRestToOpenWithDuration:(double)a3;
- (void)loadView;
- (void)poseidonIconViewCoachingStateDidChange:(id)a3;
- (void)resetRestToOpen;
- (void)setAuthenticated:(BOOL)a3;
- (void)setAuthenticationInformationProvider:(id)a3;
- (void)setBioLockout:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerOffSinceWake:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setResignActive:(BOOL)a3;
- (void)setScreenOn:(BOOL)a3;
- (void)setTestPoseidonIconView:(id)a3;
- (void)setUnlockSource:(int)a3;
- (void)showCoaching:(BOOL)a3;
- (void)startRestToOpenCoaching:(BOOL)a3 withCompletion:(id)a4;
- (void)updateContainsFirstRowIcons:(BOOL)a3;
- (void)updateSidebarComplicationFrame:(CGRect)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBUIPoseidonContainerViewController

- (SBUIPoseidonContainerViewController)initWithAuthenticationInformationProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPoseidonContainerViewController;
  v5 = [(SBUIPoseidonContainerViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SBUIPoseidonContainerViewController *)v5 setAuthenticationInformationProvider:v4];
  }

  return v6;
}

- (void)loadView
{
  v3 = objc_alloc_init(SBUIPoseidonIconView);
  [(SBUIPoseidonIconView *)v3 setDelegate:self];
  [(SBUIPoseidonIconView *)v3 bs_setHitTestingDisabled:1];
  [(SBUIPoseidonContainerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBUIPoseidonContainerViewController;
  [(SBUIPoseidonContainerViewController *)&v3 viewDidLoad];
  [(SBUIPoseidonContainerViewController *)self _updateRotation];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)SBUIPoseidonContainerViewController;
  id v7 = a4;
  -[SBUIPoseidonContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v17, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  v9 = v8;
  if (v8) {
    [v8 transform];
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CGAffineTransformRotate(&v16, &v15, -1.0e-13);
  [v9 setTransform:&v16];
  if (v9) {
    [v9 localTransform];
  }
  else {
    memset(&v13, 0, sizeof(v13));
  }
  CGAffineTransformRotate(&v14, &v13, 1.0e-13);
  [v9 setLocalTransform:&v14];
  v10 = SBFWindowForViewControllerTransition();
  uint64_t v11 = [v10 _toWindowOrientation];

  [(SBUIPoseidonContainerViewController *)self _setLocalTransformForOrientation:v11];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__SBUIPoseidonContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v12[3] = &unk_1E5CCD648;
  v12[4] = self;
  v12[5] = v11;
  [v7 animateAlongsideTransition:v12 completion:0];
}

uint64_t __90__SBUIPoseidonContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCounterTransformForOrientation:*(void *)(a1 + 40)];
}

- (void)_setCounterTransformForOrientation:(int64_t)a3
{
  objc_super v3 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  SBTransformFromOrientationToOrientation();
  [v3 setTransform:&v4];
}

- (void)_setLocalTransformForOrientation:(int64_t)a3
{
  uint64_t v4 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  switch(a3)
  {
    case 0:
    case 1:
      long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v10[0] = *MEMORY[0x1E4F1DAB8];
      v10[1] = v5;
      v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v6 = (CGAffineTransform *)v10;
      goto LABEL_6;
    case 2:
      CGAffineTransformMakeRotation(&v9, -3.14159265);
      v6 = &v9;
      goto LABEL_6;
    case 3:
      CGAffineTransformMakeRotation(&v7, 1.57079633);
      v6 = &v7;
      goto LABEL_6;
    case 4:
      CGAffineTransformMakeRotation(&v8, -1.57079633);
      v6 = &v8;
LABEL_6:
      [v4 setLocalTransform:v6];
      break;
    default:
      break;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v7 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v6 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
    [v6 setLegibilitySettings:*p_legibilitySettings];
  }
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_authenticated != a3)
  {
    self->_authenticated = a3;
    if (a3)
    {
      [(SBUIPoseidonContainerViewController *)self setBioLockout:0];
      if (self->_fingerOffSinceWake)
      {
        int64_t v4 = 0;
      }
      else if (self->_unlockSource == 1)
      {
        int64_t v4 = 110000000;
      }
      else
      {
        int64_t v4 = 0;
      }
      dispatch_time_t v5 = dispatch_time(0, v4);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__SBUIPoseidonContainerViewController_setAuthenticated___block_invoke;
      block[3] = &unk_1E5CCC580;
      block[4] = self;
      dispatch_after(v5, MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __56__SBUIPoseidonContainerViewController_setAuthenticated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showCoaching:0];
}

- (void)setScreenOn:(BOOL)a3
{
  if (self->_screenOn != a3)
  {
    BOOL v3 = a3;
    self->_screenOn = a3;
    if (a3)
    {
      [(SBUIPoseidonContainerViewController *)self _updateRotation];
    }
    else
    {
      [(SBUIPoseidonContainerViewController *)self startRestToOpenCoaching:0 withCompletion:0];
      [(SBUIPoseidonContainerViewController *)self setFingerOffSinceWake:0];
      [(SBUIPoseidonContainerViewController *)self setUnlockSource:0];
    }
    [(SBUIPoseidonContainerViewController *)self showCoaching:v3];
  }
}

- (void)setBioLockout:(BOOL)a3
{
  if (self->_bioLockout != a3)
  {
    self->_bioLockout = a3;
    if (a3) {
      [(SBUIPoseidonContainerViewController *)self showCoaching:0];
    }
  }
}

- (void)setResignActive:(BOOL)a3
{
  if (self->_resignActive != a3)
  {
    self->_resignActive = a3;
    if (a3)
    {
      [(SBUIPoseidonContainerViewController *)self showCoaching:0];
      [(SBUIPoseidonContainerViewController *)self startRestToOpenCoaching:0 withCompletion:0];
    }
    else
    {
      [(SBUIPoseidonContainerViewController *)self showCoaching:1];
    }
  }
}

- (void)startRestToOpenCoaching:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  id v7 = [(SBUIPoseidonContainerViewController *)self delegate];
  if (v4
    && (-[SBUIPoseidonContainerViewController authenticationInformationProvider](self, "authenticationInformationProvider"), CGAffineTransform v8 = objc_claimAutoreleasedReturnValue(), v9 = [v8 isBiometricLockedOut], v8, (v9 & 1) == 0))
  {
    uint64_t v11 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
    uint64_t v12 = [v11 state];

    if (v12 == 2)
    {
      if (v6) {
        v6[2](v6, 1);
      }
    }
    else
    {
      CGAffineTransform v13 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__SBUIPoseidonContainerViewController_startRestToOpenCoaching_withCompletion___block_invoke;
      v14[3] = &unk_1E5CCD670;
      id v15 = v7;
      CGAffineTransform v16 = self;
      objc_super v17 = v6;
      [v13 setState:2 forIdleTimeout:0 withCompletion:v14];
    }
  }
  else
  {
    v10 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
    [v10 setState:0];
  }
}

uint64_t __78__SBUIPoseidonContainerViewController_startRestToOpenCoaching_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) poseidonContainerViewControllerCoachingStateDidChange:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)fillRestToOpenWithDuration:(double)a3
{
  id v4 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  [v4 fillRestToOpenWithDuration:a3];
}

- (void)resetRestToOpen
{
  id v2 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  [v2 resetRestToOpen];
}

- (void)updateContainsFirstRowIcons:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  [v4 setContainsFirstRowIcons:v3];
}

- (void)updateSidebarComplicationFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  objc_msgSend(v7, "setSidebarFrame:", x, y, width, height);
}

- (BOOL)coachingActive
{
  id v2 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
  BOOL v3 = [v2 state] != 0;

  return v3;
}

- (void)showCoaching:(BOOL)a3
{
  if (!a3)
  {
    v6 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
    uint64_t v7 = [v6 state];

    if (v7 == 2) {
      return;
    }
    id v8 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
    [v8 setState:0];
    goto LABEL_9;
  }
  id v4 = [(SBUIPoseidonContainerViewController *)self authenticationInformationProvider];
  if (!self->_authenticated)
  {
    id v8 = v4;
    if (([v4 isBiometricLockedOut] & 1) == 0
      && [v8 hasBiometricAuthenticationCapabilityEnabled]
      && !self->_resignActive)
    {
      dispatch_time_t v5 = [(SBUIPoseidonContainerViewController *)self _poseidonIconView];
      [v5 setState:1];
    }
LABEL_9:
    id v4 = v8;
  }
}

- (id)_poseidonIconView
{
  testPoseidonIconView = self->_testPoseidonIconView;
  if (testPoseidonIconView)
  {
    BOOL v3 = testPoseidonIconView;
  }
  else
  {
    BOOL v3 = [(SBUIPoseidonContainerViewController *)self view];
  }
  return v3;
}

- (void)_updateRotation
{
  uint64_t v3 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  [(SBUIPoseidonContainerViewController *)self _setCounterTransformForOrientation:v3];
  [(SBUIPoseidonContainerViewController *)self _setLocalTransformForOrientation:v3];
}

- (void)poseidonIconViewCoachingStateDidChange:(id)a3
{
  id v4 = [(SBUIPoseidonContainerViewController *)self delegate];
  [v4 poseidonContainerViewControllerCoachingStateDidChange:self];
}

- (id)_testPoseidonIconView
{
  return self->_testPoseidonIconView;
}

- (void)setTestPoseidonIconView:(id)a3
{
  dispatch_time_t v5 = (SBUIPoseidonIconView *)a3;
  p_testPoseidonIconView = &self->_testPoseidonIconView;
  if (self->_testPoseidonIconView != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_testPoseidonIconView, a3);
    dispatch_time_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_testPoseidonIconView, v5);
}

- (SBUIPoseidonContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPoseidonContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBUIPoseidonContainerViewControllerLockStatusProvider)authenticationInformationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationInformationProvider);
  return (SBUIPoseidonContainerViewControllerLockStatusProvider *)WeakRetained;
}

- (void)setAuthenticationInformationProvider:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (BOOL)isBioLockout
{
  return self->_bioLockout;
}

- (BOOL)isScreenOn
{
  return self->_screenOn;
}

- (BOOL)fingerOffSinceWake
{
  return self->_fingerOffSinceWake;
}

- (void)setFingerOffSinceWake:(BOOL)a3
{
  self->_fingerOffSinceWake = a3;
}

- (int)unlockSource
{
  return self->_unlockSource;
}

- (void)setUnlockSource:(int)a3
{
  self->_unlockSource = a3;
}

- (BOOL)resignActive
{
  return self->_resignActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_authenticationInformationProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testPoseidonIconView, 0);
}

@end