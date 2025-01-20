@interface BKAuxiliarySceneMainFlowController
- (BKAuxiliarySceneMainFlowControllerDelegate)delegate;
- (BOOL)coverEffectsNightMode;
- (BOOL)presenterCanShowStoreProductOnCurrentContent;
- (BOOL)presenterShouldOpenBookUsingLargeCover;
- (id)coverEffectRTLOverride;
- (id)presenterFirstVisibleChildConformingToProtocol:(id)a3;
- (id)presenterModalPresentingViewController;
- (id)presenterSceneController;
- (id)presenterViewControllersConformingToProtocol:(id)a3;
- (unint64_t)coverEffectsContent;
- (void)presenterDismissAllModalControllersAnimated:(BOOL)a3 completion:(id)a4;
- (void)presenterDismissModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presenterFinishModalTransitionsWithCompletion:(id)a3;
- (void)presenterShowAlertController:(id)a3 animated:(BOOL)a4;
- (void)presenterShowModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presenterVisibleViewControllerDidChangeAnimated:(BOOL)a3;
- (void)presenterVisibleViewControllerWillChangeAnimated:(BOOL)a3;
- (void)presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BKAuxiliarySceneMainFlowController

- (id)presenterSceneController
{
  v2 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  v3 = [v2 rootViewController];
  v4 = +[BKAppDelegate sceneControllerForViewController:v3];

  return v4;
}

- (void)presenterShowAlertController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  v7 = [v8 rootViewController];
  [v7 presentViewController:v6 animated:v4 completion:0];
}

- (id)presenterModalPresentingViewController
{
  v2 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  v3 = [v2 flowControllerModalPresentingViewController];

  return v3;
}

- (void)presenterShowModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [v8 setTransitioningDelegate:self];
  [(BKAuxiliarySceneMainFlowController *)self presenterModalPresentingViewController];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000DBBA4;
  v16[3] = &unk_100A46188;
  v16[4] = self;
  BOOL v20 = v6;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  id v11 = v9;
  id v12 = v8;
  v13 = objc_retainBlock(v16);
  v14 = [v10 bc_descendentPresentedViewController];

  if (v14)
  {
    v15 = [v10 bc_descendentPresentedViewController];
    [v15 dismissViewControllerAnimated:v6 completion:v13];
  }
  else
  {
    ((void (*)(void *))v13[2])(v13);
  }
}

- (void)presenterDismissModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(BKAuxiliarySceneMainFlowController *)self presenterVisibleViewControllerWillChangeAnimated:v6];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000DBDE0;
  id v17 = &unk_100A43E00;
  id v10 = v8;
  BOOL v21 = v6;
  id v19 = self;
  id v20 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = objc_retainBlock(&v14);
  v13 = [v10 bc_descendentPresentedViewController:v14, v15, v16, v17];
  if (v13) {
    [(BKAuxiliarySceneMainFlowController *)self presenterDismissModalController:v13 animated:v6 completion:v12];
  }
  else {
    ((void (*)(void ***))v12[2])(v12);
  }
}

- (void)presenterDismissAllModalControllersAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  id v8 = [v7 rootViewController];
  id v9 = [v8 bc_descendentPresentedViewController];

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000DC000;
    v12[3] = &unk_100A43E28;
    v12[4] = self;
    BOOL v14 = v4;
    id v13 = v6;
    [(BKAuxiliarySceneMainFlowController *)self presenterDismissModalController:v9 animated:v4 completion:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v6);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (BOOL)presenterShouldOpenBookUsingLargeCover
{
  v2 = [(BKAuxiliarySceneMainFlowController *)self presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
  if (v2)
  {
    char v3 = 0;
  }
  else
  {
    BOOL v4 = +[BKAppDelegate delegate];
    v5 = [v4 appLaunchCoordinator];
    unsigned __int8 v6 = [v5 appLaunchCoordinatorHasAppLaunched];

    char v3 = v6 ^ 1;
  }

  return v3;
}

- (BOOL)presenterCanShowStoreProductOnCurrentContent
{
  return 1;
}

- (void)presenterFinishModalTransitionsWithCompletion:(id)a3
{
  char v3 = (void (**)(void))objc_retainBlock(a3);
  if (v3)
  {
    BOOL v4 = v3;
    v3[2]();
    char v3 = v4;
  }
}

- (void)presenterVisibleViewControllerWillChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  [v5 mainFlowController:self visibleViewControllerWillChangeAnimated:v3];
}

- (void)presenterVisibleViewControllerDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  [v5 mainFlowController:self visibleViewControllerDidChangeAnimated:v3];
}

- (id)presenterFirstVisibleChildConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  unsigned __int8 v6 = [v5 rootViewController];
  v7 = [v6 im_firstVisibleChildConformingToProtocol:v4 includePresented:1];

  return v7;
}

- (id)presenterViewControllersConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v6 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  v7 = [v6 rootViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000DC304;
  v10[3] = &unk_100A46328;
  id v8 = v5;
  id v11 = v8;
  [v7 im_enumerateChildrenConformingToProtocol:v4 block:v10];

  return v8;
}

- (void)presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(BKAuxiliarySceneMainFlowController *)self delegate];
  id v5 = [v6 rootViewController];
  [v5 im_finishOngoingModalTransitionAnimations:v4];
}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  v2 = [(BKAuxiliarySceneMainFlowController *)self presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCUCoverEffectsEnvironment];
  unsigned __int8 v3 = [v2 coverEffectsNightMode];

  return v3;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (BKAuxiliarySceneMainFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKAuxiliarySceneMainFlowControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end