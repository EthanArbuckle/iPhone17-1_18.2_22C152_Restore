@interface SBPIPMorphAnimatorController
- (BOOL)_isWaitingForExternalAnimationCompletion;
- (BOOL)hasCompletedSourceAnimations;
- (BOOL)hasCompletedTargetAnimations;
- (BOOL)isGestureInitiated;
- (BOOL)isTerminated;
- (CGRect)appLayoutBoundingBox;
- (NSString)scenePersistenceIdentifier;
- (NSUUID)uuid;
- (SBAppLayout)appLayout;
- (SBPIPContainerViewController)pictureInPictureContainerViewController;
- (SBPIPMorphAnimatorController)initWithTargetProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4 appLayout:(id)a5 layoutRole:(int64_t)a6 appLayoutBoundingBox:(CGRect)a7 windowScene:(id)a8 direction:(int64_t)a9 gestureInitiated:(BOOL)a10 delegate:(id)a11 uuid:(id)a12;
- (SBPIPMorphAnimatorController)initWithTargetProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4 windowScene:(id)a5 direction:(int64_t)a6 gestureInitiated:(BOOL)a7 delegate:(id)a8 uuid:(id)a9;
- (SBPIPMorphAnimatorControllerDelegate)delegate;
- (SBViewMorphAnimator)viewMorphAnimator;
- (SBViewMorphAnimatorDataSource)viewMorphAnimatorDataSource;
- (id)animatorWaitingForExternalAnimationActionBlock;
- (id)setupCompletionBlock;
- (int)targetProcessIdentifier;
- (int64_t)completedTargetAnimations;
- (int64_t)layoutRole;
- (void)_performAnimatorWaitingForExternalAnimationActionBlock;
- (void)_terminate;
- (void)cancel;
- (void)didEndSourceAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5;
- (void)didEndTargetAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5;
- (void)interrupt;
- (void)setAnimatorWaitingForExternalAnimationActionBlock:(id)a3;
- (void)setAppLayout:(id)a3;
- (void)setAppLayoutBoundingBox:(CGRect)a3;
- (void)setCompletedTargetAnimations:(int64_t)a3;
- (void)setLayoutRole:(int64_t)a3;
- (void)setPictureInPictureContainerViewController:(id)a3;
- (void)setSetupCompletionBlock:(id)a3;
- (void)willRemoveTargeMatchMoveAnimationAtFrame:(CGRect)a3 withinSourceFrame:(CGRect)a4;
- (void)willStartSourceAnimations:(unint64_t)a3;
@end

@implementation SBPIPMorphAnimatorController

- (SBPIPMorphAnimatorController)initWithTargetProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4 windowScene:(id)a5 direction:(int64_t)a6 gestureInitiated:(BOOL)a7 delegate:(id)a8 uuid:(id)a9
{
  LOBYTE(v10) = a7;
  return -[SBPIPMorphAnimatorController initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:](self, "initWithTargetProcessIdentifier:scenePersistenceIdentifier:appLayout:layoutRole:appLayoutBoundingBox:windowScene:direction:gestureInitiated:delegate:uuid:", *(void *)&a3, a4, 0, 0, a5, a6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v10, a8, a9);
}

- (SBPIPMorphAnimatorController)initWithTargetProcessIdentifier:(int)a3 scenePersistenceIdentifier:(id)a4 appLayout:(id)a5 layoutRole:(int64_t)a6 appLayoutBoundingBox:(CGRect)a7 windowScene:(id)a8 direction:(int64_t)a9 gestureInitiated:(BOOL)a10 delegate:(id)a11 uuid:(id)a12
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v22 = a4;
  id v39 = a5;
  id v23 = a8;
  id v24 = a11;
  id v25 = a12;
  v40.receiver = self;
  v40.super_class = (Class)SBPIPMorphAnimatorController;
  v26 = [(SBPIPMorphAnimatorController *)&v40 init];
  v27 = v26;
  if (v26)
  {
    id v37 = v22;
    v26->_targetProcessIdentifier = a3;
    objc_storeStrong((id *)&v26->_scenePersistenceIdentifier, a4);
    objc_storeStrong((id *)&v27->_appLayout, a5);
    v27->_layoutRole = a6;
    v27->_appLayoutBoundingBox.origin.CGFloat x = x;
    v27->_appLayoutBoundingBox.origin.CGFloat y = y;
    v27->_appLayoutBoundingBox.size.CGFloat width = width;
    v27->_appLayoutBoundingBox.size.CGFloat height = height;
    v27->_gestureInitiated = a10;
    objc_storeStrong((id *)&v27->_uuid, a12);
    objc_storeWeak((id *)&v27->_delegate, v24);
    v28 = [[SBViewMorphAnimator alloc] initWithUUID:v25 windowScene:v23 direction:a9];
    viewMorphAnimator = v27->_viewMorphAnimator;
    v27->_viewMorphAnimator = v28;

    uint64_t v30 = [v24 dataSourceForMorphAnimatorController:v27];
    viewMorphAnimatorDataSource = v27->_viewMorphAnimatorDataSource;
    v27->_viewMorphAnimatorDataSource = (SBViewMorphAnimatorDataSource *)v30;

    [(SBViewMorphAnimator *)v27->_viewMorphAnimator setDataSource:v27->_viewMorphAnimatorDataSource];
    v32 = v27->_viewMorphAnimator;
    v33 = +[SBPIPSettingsDomain rootSettings];
    v34 = [v33 fluidTransitionsSettings];
    v35 = [v34 targetClippingFluidBehavior];
    [(SBViewMorphAnimator *)v32 setTargetClipAnimationSettings:v35];

    id v22 = v37;
    [(SBViewMorphAnimator *)v27->_viewMorphAnimator addObserver:v27];
  }

  return v27;
}

- (void)setPictureInPictureContainerViewController:(id)a3
{
  id v9 = a3;
  id v4 = objc_storeWeak((id *)&self->_pictureInPictureContainerViewController, v9);
  [v9 transitionAnimationWillBegin];
  if ([(SBViewMorphAnimator *)self->_viewMorphAnimator direction] == 1) {
    [(SBViewMorphAnimator *)self->_viewMorphAnimator setAutomaticallyStartTargetAnimations:0];
  }
  viewMorphAnimator = self->_viewMorphAnimator;
  v6 = [v9 morphAnimatorTargetView];
  [(SBViewMorphAnimator *)viewMorphAnimator setTargetView:v6];

  v7 = self->_viewMorphAnimator;
  v8 = [v9 morphAnimatorTargetContainerView];
  [(SBViewMorphAnimator *)v7 setTargetContentView:v8];
}

- (void)cancel
{
  viewMorphAnimator = self->_viewMorphAnimator;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__SBPIPMorphAnimatorController_cancel__block_invoke;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = self;
  [(SBViewMorphAnimator *)viewMorphAnimator cancel:v3];
}

uint64_t __38__SBPIPMorphAnimatorController_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _terminate];
}

- (void)interrupt
{
}

- (void)_terminate
{
  if (!self->_terminated)
  {
    self->_terminated = 1;
    [(SBPIPMorphAnimatorController *)self _performAnimatorWaitingForExternalAnimationActionBlock];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained morphAnimatorControllerDidTerminate:self];

    id v4 = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
    [v4 transitionAnimationDidEnd];
  }
}

- (void)setAnimatorWaitingForExternalAnimationActionBlock:(id)a3
{
  v8 = (void (**)(void))a3;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBPIPMorphAnimatorController.m", 114, @"Invalid parameter not satisfying: %@", @"animatorWaitingForExternalAnimationActionBlock" object file lineNumber description];
  }
  if ([(SBPIPMorphAnimatorController *)self _isWaitingForExternalAnimationCompletion])
  {
    v8[2]();
  }
  else
  {
    v5 = (void *)MEMORY[0x1D948C7A0](v8);
    id animatorWaitingForExternalAnimationActionBlock = self->_animatorWaitingForExternalAnimationActionBlock;
    self->_id animatorWaitingForExternalAnimationActionBlock = v5;
  }
}

- (BOOL)_isWaitingForExternalAnimationCompletion
{
  return (self->_completedTargetAnimations & 7) == 3;
}

- (void)_performAnimatorWaitingForExternalAnimationActionBlock
{
  uint64_t v5 = MEMORY[0x1D948C7A0](self->_animatorWaitingForExternalAnimationActionBlock, a2);
  id animatorWaitingForExternalAnimationActionBlock = self->_animatorWaitingForExternalAnimationActionBlock;
  self->_id animatorWaitingForExternalAnimationActionBlock = 0;

  id v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    id v4 = (void *)v5;
  }
}

- (void)willStartSourceAnimations:(unint64_t)a3
{
  setupCompletionBlock = (void (**)(void))self->_setupCompletionBlock;
  if (setupCompletionBlock) {
    setupCompletionBlock[2]();
  }
}

- (void)didEndSourceAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  if ((a3 & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
    [WeakRetained transitionAnimationDidEnd];
  }
}

- (BOOL)hasCompletedTargetAnimations
{
  return [(SBViewMorphAnimator *)self->_viewMorphAnimator completedTargetAnimations] == 7;
}

- (BOOL)hasCompletedSourceAnimations
{
  return [(SBViewMorphAnimator *)self->_viewMorphAnimator completedSourceAnimations] == 15;
}

- (void)didEndTargetAnimations:(unint64_t)a3 finished:(BOOL)a4 continueBlock:(id)a5
{
  self->_completedTargetAnimations |= a3;
  if ([(SBPIPMorphAnimatorController *)self _isWaitingForExternalAnimationCompletion])
  {
    [(SBPIPMorphAnimatorController *)self _performAnimatorWaitingForExternalAnimationActionBlock];
  }
  else if (self->_completedTargetAnimations == 7)
  {
    [(SBPIPMorphAnimatorController *)self _terminate];
  }
}

- (void)willRemoveTargeMatchMoveAnimationAtFrame:(CGRect)a3 withinSourceFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  id v40 = [(SBViewMorphAnimator *)self->_viewMorphAnimator dataSource];
  objc_msgSend(v40, "sourceSubviewFrame:inScreenSpaceForAnimator:", self->_viewMorphAnimator, v11, v10, v9, v8);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  objc_msgSend(v40, "sourceSubviewFrame:inScreenSpaceForAnimator:", self->_viewMorphAnimator, x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
  uint64_t v30 = [WeakRetained bundleIdentifier];
  int v31 = [v30 isEqualToString:@"com.apple.InCallService"];

  v32 = [(SBViewMorphAnimator *)self->_viewMorphAnimator windowScene];
  v33 = [v32 switcherController];
  int v34 = [v33 isChamoisWindowingUIEnabled];

  int v35 = v31 ^ 1 | v34;
  if (v35) {
    double v36 = v14;
  }
  else {
    double v36 = v22;
  }
  if (v35) {
    double v37 = v16;
  }
  else {
    double v37 = v24;
  }
  if (v35) {
    double v38 = v18;
  }
  else {
    double v38 = v26;
  }
  if (v35) {
    double v39 = v20;
  }
  else {
    double v39 = v28;
  }
  objc_msgSend(WeakRetained, "forcePictureInPictureToFrame:", v36, v37, v38, v39);
}

- (int)targetProcessIdentifier
{
  return self->_targetProcessIdentifier;
}

- (NSString)scenePersistenceIdentifier
{
  return self->_scenePersistenceIdentifier;
}

- (SBViewMorphAnimator)viewMorphAnimator
{
  return self->_viewMorphAnimator;
}

- (SBViewMorphAnimatorDataSource)viewMorphAnimatorDataSource
{
  return self->_viewMorphAnimatorDataSource;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void)setAppLayout:(id)a3
{
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (CGRect)appLayoutBoundingBox
{
  double x = self->_appLayoutBoundingBox.origin.x;
  double y = self->_appLayoutBoundingBox.origin.y;
  double width = self->_appLayoutBoundingBox.size.width;
  double height = self->_appLayoutBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAppLayoutBoundingBox:(CGRect)a3
{
  self->_appLayoutBoundingBodouble x = a3;
}

- (SBPIPContainerViewController)pictureInPictureContainerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pictureInPictureContainerViewController);
  return (SBPIPContainerViewController *)WeakRetained;
}

- (SBPIPMorphAnimatorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPIPMorphAnimatorControllerDelegate *)WeakRetained;
}

- (id)setupCompletionBlock
{
  return self->_setupCompletionBlock;
}

- (void)setSetupCompletionBlock:(id)a3
{
}

- (id)animatorWaitingForExternalAnimationActionBlock
{
  return self->_animatorWaitingForExternalAnimationActionBlock;
}

- (BOOL)isTerminated
{
  return self->_terminated;
}

- (int64_t)completedTargetAnimations
{
  return self->_completedTargetAnimations;
}

- (void)setCompletedTargetAnimations:(int64_t)a3
{
  self->_completedTargetAnimations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animatorWaitingForExternalAnimationActionBlock, 0);
  objc_storeStrong(&self->_setupCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_pictureInPictureContainerViewController);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_viewMorphAnimatorDataSource, 0);
  objc_storeStrong((id *)&self->_viewMorphAnimator, 0);
  objc_storeStrong((id *)&self->_scenePersistenceIdentifier, 0);
}

@end