@interface SBPosterEditingTransientOverlayViewController
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)handleHomeButtonPress;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldUseSceneBasedKeyboardFocus;
- (BOOL)synthesizeDelegateCallbacksFromAppearanceTransitions;
- (PRUISExternallyHostedPosterEditingRequest)editingRequest;
- (SBPosterEditingTransientOverlayViewController)initWithEditingRequest:(id)a3;
- (SBPosterEditingTransientOverlayViewControllerDelegate)delegate;
- (id)keyboardFocusTarget;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (void)_notifyDelegateOfDidDismissWithResponse:(id)a3;
- (void)_notifyDelegateOfWillDismissWithResponse:(id)a3;
- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4;
- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)modalRemoteViewController:(id)a3 willDismissWithResponse:(id)a4;
- (void)sendRequestDismissalAction;
- (void)setDelegate:(id)a3;
- (void)setSynthesizeDelegateCallbacksFromAppearanceTransitions:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBPosterEditingTransientOverlayViewController

- (SBPosterEditingTransientOverlayViewController)initWithEditingRequest:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  v6 = [(SBPosterEditingTransientOverlayViewController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_editingRequest, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F92458]);
    v9 = [v5 entryPoint];
    uint64_t v10 = [v8 initWithEntryPoint:v9];
    remoteViewController = v7->_remoteViewController;
    v7->_remoteViewController = (PRUISModalRemoteViewController *)v10;

    [(PRUISModalRemoteViewController *)v7->_remoteViewController setDelegate:v7];
    v7->_synthesizeDelegateCallbacksFromAppearanceTransitions = 1;
  }

  return v7;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 viewDidLoad];
  v3 = [(SBTransientOverlayViewController *)self contentView];
  [(SBPosterEditingTransientOverlayViewController *)self bs_addChildViewController:self->_remoteViewController withSuperview:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  [(SBPosterEditingTransientOverlayViewController *)&v5 viewWillDisappear:a3];
  if (self->_synthesizeDelegateCallbacksFromAppearanceTransitions)
  {
    objc_super v4 = [MEMORY[0x1E4F92450] cancel];
    [(SBPosterEditingTransientOverlayViewController *)self _notifyDelegateOfWillDismissWithResponse:v4];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 viewDidDisappear:a3];
  if (self->_synthesizeDelegateCallbacksFromAppearanceTransitions)
  {
    objc_super v4 = [MEMORY[0x1E4F92450] cancel];
    [(SBPosterEditingTransientOverlayViewController *)self _notifyDelegateOfDidDismissWithResponse:v4];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBPosterEditingTransientOverlayViewController;
  id v5 = a3;
  [(SBTransientOverlayViewController *)&v6 viewDidMoveToWindow:v5 shouldAppearOrDisappear:v4];
  objc_msgSend(v5, "setClipsToBounds:", 0, v6.receiver, v6.super_class);
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return 1;
}

- (id)keyboardFocusTarget
{
  if (!self->_keyboardFocusTarget && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = [(PRUISModalRemoteViewController *)self->_remoteViewController scene];
    if (v3)
    {
      BOOL v4 = +[SBKeyboardFocusTarget targetForFBScene:v3];
      keyboardFocusTarget = self->_keyboardFocusTarget;
      self->_keyboardFocusTarget = v4;
    }
  }
  objc_super v6 = self->_keyboardFocusTarget;
  return v6;
}

- (void)sendRequestDismissalAction
{
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3) {
    a3->var6 = 0;
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return 1;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return 1;
}

- (BOOL)handleHomeButtonPress
{
  return 1;
}

- (void)modalRemoteViewController:(id)a3 willDismissWithResponse:(id)a4
{
}

- (void)modalRemoteViewController:(id)a3 didDismissWithResponse:(id)a4
{
}

- (void)_notifyDelegateOfWillDismissWithResponse:(id)a3
{
  if ((*((unsigned char *)self + 1424) & 1) == 0)
  {
    *((unsigned char *)self + 1424) |= 1u;
    id v4 = a3;
    id v5 = [(SBPosterEditingTransientOverlayViewController *)self delegate];
    [v5 posterEditingTransientOverlayViewController:self willDismissWithResponse:v4];
  }
}

- (void)_notifyDelegateOfDidDismissWithResponse:(id)a3
{
  if ((*((unsigned char *)self + 1424) & 2) == 0)
  {
    *((unsigned char *)self + 1424) |= 2u;
    id v4 = a3;
    id v5 = [(SBPosterEditingTransientOverlayViewController *)self delegate];
    [v5 posterEditingTransientOverlayViewController:self didDismissWithResponse:v4];
  }
}

- (SBPosterEditingTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPosterEditingTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRUISExternallyHostedPosterEditingRequest)editingRequest
{
  return self->_editingRequest;
}

- (BOOL)synthesizeDelegateCallbacksFromAppearanceTransitions
{
  return self->_synthesizeDelegateCallbacksFromAppearanceTransitions;
}

- (void)setSynthesizeDelegateCallbacksFromAppearanceTransitions:(BOOL)a3
{
  self->_synthesizeDelegateCallbacksFromAppearanceTransitions = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardFocusTarget, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_editingRequest, 0);
}

@end