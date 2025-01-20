@interface SBCaptureButtonCoachingController
- (SBCaptureButtonCoachingController)initWithHUDController:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (void)_backlightLevelChanged:(id)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_startObservingSignalsToDismissIfNeeded;
- (void)_stopObservingSignalsToDismissIfNeeded;
- (void)captureButtonCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4;
- (void)captureButtonCoachingHUDViewControllerWillRotate:(id)a3;
- (void)dismissCoachingUI;
- (void)setExtraCoachingUIButtonOffset:(double)a3;
- (void)showCoachingUIWithText:(id)a3 dismissInterval:(double)a4;
- (void)showCoachingUIWithText:(id)a3 glyphPackageName:(id)a4 glyphLandscapeStateName:(id)a5 dismissInterval:(double)a6;
@end

@implementation SBCaptureButtonCoachingController

- (SBCaptureButtonCoachingController)initWithHUDController:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureButtonCoachingController;
  v6 = [(SBCaptureButtonCoachingController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hudController, a3);
    v8 = [[SBCaptureButtonCoachingHUDViewController alloc] initWithNibName:0 bundle:0];
    hudViewController = v7->_hudViewController;
    v7->_hudViewController = v8;

    hudController = v7->_hudController;
    v11 = v7->_hudViewController;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = [(SBHUDController *)hudController HUDSessionForViewController:v11 identifier:v13];
  }
  return v7;
}

- (void)showCoachingUIWithText:(id)a3 dismissInterval:(double)a4
{
}

- (void)showCoachingUIWithText:(id)a3 glyphPackageName:(id)a4 glyphLandscapeStateName:(id)a5 dismissInterval:(double)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *MEMORY[0x1E4FA6F10];
  v13 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA6F10]];
  id v14 = [v13 HUDViewController];
  if (!v13)
  {
    v15 = [[SBCaptureButtonCoachingHUDViewController alloc] initWithNibName:0 bundle:0];

    [(SBCaptureButtonCoachingHUDViewController *)v15 setDelegate:self];
    v13 = [(SBHUDController *)self->_hudController HUDSessionForViewController:v15 identifier:v12];
    id v14 = v15;
  }
  [v14 setCoachingText:v16 glyphPackageName:v10 glyphLandscapeState:v11];
  [v13 presentWithDismissalInterval:0 animated:a6];
  [v14 transitionToState:1 animated:1 completion:0];
}

- (void)dismissCoachingUI
{
  v2 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA6F10]];
  v3 = [v2 HUDViewController];
  if ([v3 state] && (objc_msgSend(v3, "isBeingDismissed") & 1) == 0)
  {
    [v2 invalidateDismissalTimer];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __54__SBCaptureButtonCoachingController_dismissCoachingUI__block_invoke;
    v4[3] = &unk_1E6AF5350;
    id v5 = v2;
    [v3 transitionToState:0 animated:1 completion:v4];
  }
}

uint64_t __54__SBCaptureButtonCoachingController_dismissCoachingUI__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) dismissAnimated:0];
  }
  return result;
}

- (void)setExtraCoachingUIButtonOffset:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__SBCaptureButtonCoachingController_setExtraCoachingUIButtonOffset___block_invoke;
  v3[3] = &unk_1E6AF4A70;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.2];
}

void __68__SBCaptureButtonCoachingController_setExtraCoachingUIButtonOffset___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) knownHUDControllerForIdentifier:*MEMORY[0x1E4FA6F10]];
  v2 = [v3 HUDViewController];
  objc_msgSend(v2, "setPositionOffset:", *(double *)(a1 + 40), 0.0);
}

- (void)captureButtonCoachingHUDViewController:(id)a3 didBeginTransitionToState:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (a4) {
      goto LABEL_6;
    }
    id v7 = v6;
    [(SBCaptureButtonCoachingController *)self _stopObservingSignalsToDismissIfNeeded];
  }
  else
  {
    id v7 = v6;
    [(SBCaptureButtonCoachingController *)self _startObservingSignalsToDismissIfNeeded];
  }
  id v6 = v7;
LABEL_6:
}

- (void)captureButtonCoachingHUDViewControllerWillRotate:(id)a3
{
  id v3 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA6F10]];
  [v3 rescheduleDismissalTimer];
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  if (self->_dismissGestureRecognizer == a3)
  {
    v4 = [(SBHUDController *)self->_hudController knownHUDControllerForIdentifier:*MEMORY[0x1E4FA6F10]];
    id v5 = [v4 HUDViewController];
    id v3 = [v5 view];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_dismissGestureRecognizer == a3) {
    [(SBCaptureButtonCoachingController *)self dismissCoachingUI];
  }
}

- (void)_startObservingSignalsToDismissIfNeeded
{
  if (!self->_dismissGestureRecognizer)
  {
    id v3 = objc_alloc_init(SBFailingSystemGestureRecognizer);
    [(SBFailingSystemGestureRecognizer *)v3 setDelegate:self];
    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = v3;
    id v5 = v3;

    id v6 = [(SBHUDController *)self->_hudController windowScene];
    id v7 = [v6 systemGestureManager];
    [v7 addGestureRecognizer:self->_dismissGestureRecognizer withType:137];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__backlightLevelChanged_ name:*MEMORY[0x1E4FA7A18] object:0];
    [v8 addObserver:self selector:sel__volumeButtonPressed_ name:*MEMORY[0x1E4FA7AE0] object:0];
  }
}

- (void)_stopObservingSignalsToDismissIfNeeded
{
  if (self->_dismissGestureRecognizer)
  {
    id v3 = [(SBHUDController *)self->_hudController windowScene];
    v4 = [v3 systemGestureManager];
    [v4 removeGestureRecognizer:self->_dismissGestureRecognizer];

    dismissGestureRecognizer = self->_dismissGestureRecognizer;
    self->_dismissGestureRecognizer = 0;

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:*MEMORY[0x1E4FA7A18] object:0];
    [v6 removeObserver:self name:*MEMORY[0x1E4FA7AE0] object:0];
  }
}

- (void)_backlightLevelChanged:(id)a3
{
  id v13 = [a3 userInfo];
  v4 = [v13 objectForKey:*MEMORY[0x1E4FA7A08]];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v13 objectForKey:*MEMORY[0x1E4FA7A28]];
  [v6 floatValue];
  float v8 = v7;

  v9 = [v13 objectForKey:*MEMORY[0x1E4FA7A20]];
  [v9 floatValue];
  float v11 = v10;

  if (v5 == 3 && v11 > v8) {
    [(SBCaptureButtonCoachingController *)self dismissCoachingUI];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hudViewController, 0);
  objc_storeStrong((id *)&self->_hudController, 0);
}

@end