@interface _SBStatusBarWindowRootViewController
- (BOOL)_canShowWhileLocked;
- (SBStatusBarWindow)statusBarWindow;
- (_SBStatusBarWindowRootViewController)initWithWindow:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)loadView;
- (void)setStatusBarWindow:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _SBStatusBarWindowRootViewController

- (_SBStatusBarWindowRootViewController)initWithWindow:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBStatusBarWindowRootViewController;
  v5 = [(_SBStatusBarWindowRootViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_statusBarWindow, v4);
  }

  return v6;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)_SBStatusBarWindowRootViewController;
  [(_SBStatusBarWindowRootViewController *)&v4 loadView];
  v3 = [(_SBStatusBarWindowRootViewController *)self view];
  [v3 setOpaque:0];
  [v3 setUserInteractionEnabled:0];
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarWindow);
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStatusBar"))
  {
    int v4 = __sb__runningInSpringBoard();
    char v5 = v4;
    if (v4)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_12;
      }
    }
    else
    {
      v2 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v2 userInterfaceIdiom] != 1)
      {

LABEL_12:
        unint64_t v6 = 2;
        goto LABEL_13;
      }
    }
    v7 = [WeakRetained _sbWindowScene];
    char v8 = [v7 isExtendedDisplayWindowScene];

    if ((v5 & 1) == 0) {
    if (v8)
    }
      goto LABEL_12;
    unint64_t v6 = 30;
  }
  else
  {
    [WeakRetained orientation];
    unint64_t v6 = SBFInterfaceOrientationMaskForInterfaceOrientation();
  }
LABEL_13:

  return v6;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_SBStatusBarWindowRootViewController;
  -[_SBStatusBarWindowRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v19, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleStatusBar"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarWindow);
    v9 = [WeakRetained statusBar];
    uint64_t v10 = [WeakRetained _toWindowOrientation];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v15[3] = &unk_1E6B07150;
    id v16 = v9;
    id v17 = WeakRetained;
    uint64_t v18 = v10;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91___SBStatusBarWindowRootViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v13[3] = &unk_1E6AF53F8;
    id v14 = v16;
    id v11 = v16;
    id v12 = WeakRetained;
    [v7 animateAlongsideTransition:v15 completion:v13];
  }
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SBStatusBarWindow)statusBarWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarWindow);
  return (SBStatusBarWindow *)WeakRetained;
}

- (void)setStatusBarWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end