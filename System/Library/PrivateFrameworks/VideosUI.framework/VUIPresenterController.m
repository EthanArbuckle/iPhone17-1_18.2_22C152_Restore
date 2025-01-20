@interface VUIPresenterController
+ (BOOL)_setZoomPreferredTransitionForViewController:(id)a3 sourceView:(id)a4;
+ (id)sharedInstance;
+ (void)dismissViewController:(id)a3 completion:(id)a4;
+ (void)popOrDismissViewController:(id)a3 completion:(id)a4;
+ (void)popViewController:(id)a3 completion:(id)a4;
+ (void)presentViewController:(id)a3 fromViewController:(id)a4 WithConfiguration:(id)a5 completion:(id)a6;
+ (void)pushViewController:(id)a3 fromViewController:(id)a4 withZoomTransition:(BOOL)a5 sourceView:(id)a6 presentationSourceID:(id)a7 isAnimated:(BOOL)a8 completion:(id)a9;
- (NSMapTable)presentingSourceViewMapTable;
- (VUIPresenterController)init;
- (void)_controllerDidDisplay:(id)a3;
- (void)setPresentingSourceViewMapTable:(id)a3;
@end

@implementation VUIPresenterController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_23 != -1) {
    dispatch_once(&sharedInstance_onceToken_23, &__block_literal_global_102);
  }
  v2 = (void *)sharedInstance___presenter;
  return v2;
}

void __40__VUIPresenterController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIPresenterController);
  v1 = (void *)sharedInstance___presenter;
  sharedInstance___presenter = (uint64_t)v0;
}

- (VUIPresenterController)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIPresenterController;
  v2 = [(VUIPresenterController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    presentingSourceViewMapTable = v2->_presentingSourceViewMapTable;
    v2->_presentingSourceViewMapTable = (NSMapTable *)v3;
  }
  return v2;
}

+ (void)pushViewController:(id)a3 fromViewController:(id)a4 withZoomTransition:(BOOL)a5 sourceView:(id)a6 presentationSourceID:(id)a7 isAnimated:(BOOL)a8 completion:(id)a9
{
  BOOL v48 = a8;
  BOOL v11 = a5;
  id v47 = a1;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v49 = a9;
  v17 = +[VUIApplicationRouter topMostVisibleViewController];
  v18 = +[VUIInterfaceFactory sharedInstance];
  v19 = [v18 documentCreator];
  int v20 = [v19 isDocumentViewController:v17 equalToViewController:v13];

  if (v20)
  {
    v21 = VUIDefaultLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_INFO, "VUIPresenterController:pushViewController trying to push or zoom the same viewmodel view controller as the existing one on top.", buf, 2u);
    }
    v22 = v16;
    v23 = v15;
    v24 = v49;
    goto LABEL_39;
  }
  if (v14)
  {
    if (v11) {
      goto LABEL_7;
    }
LABEL_23:
    v22 = v16;
    goto LABEL_24;
  }
  v26 = +[VUIApplicationRouter topPresentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v26;
  }
  else
  {
    id v27 = +[VUIApplicationRouter currentNavigationController];
  }
  id v14 = v27;
  v28 = objc_msgSend(v27, "presentedViewController", v47);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v30 = [v14 presentedViewController];

    id v14 = (id)v30;
  }
  v31 = +[VUIPlaybackManager sharedInstance];
  int v32 = [v31 isShowingExtras];

  if (v32)
  {
    v33 = +[VUIPlaybackManager sharedInstance];
    uint64_t v34 = [v33 extrasNavigationController];

    id v14 = (id)v34;
  }

  if (!v11) {
    goto LABEL_23;
  }
LABEL_7:
  v22 = v16;
  if (!_os_feature_enabled_impl())
  {
LABEL_24:
    v23 = v15;
    goto LABEL_37;
  }
  v23 = v15;
  if (v22)
  {
    if (!v15)
    {
      if (v14)
      {
        v23 = [v14 topViewController];

        if (v23)
        {
          v25 = [v14 topViewController];
          if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            v23 = [v25 findPresentationSourceViewWithId:v22];
          }
          else
          {
            v23 = 0;
          }
        }
      }
    }
  }
  if (objc_msgSend(v23, "conformsToProtocol:", &unk_1F4020AC8, v47))
  {
    v35 = [v23 zoomSourceView];
    v36 = v35;
    if (v35)
    {
      id v37 = v35;

      v23 = v37;
    }
  }
  v38 = +[VUIPresenterController sharedInstance];
  v39 = [v38 presentingSourceViewMapTable];

  id v40 = v39;
  objc_sync_enter(v40);
  v41 = [v40 objectForKey:v14];
  if (v41 != v23)
  {
    v42 = objc_opt_class();
    id v43 = v23;
    LODWORD(v42) = [v42 _setZoomPreferredTransitionForViewController:v13 sourceView:v43];

    if (v42)
    {
      if (!v22)
      {
        v44 = [v43 layer];
        [v44 cornerRadius];
      }
      [v40 setObject:v43 forKey:v14];
      v45 = [MEMORY[0x1E4F28EB8] defaultCenter];
      v46 = +[VUIPresenterController sharedInstance];
      [v45 addObserver:v46 selector:sel__controllerDidDisplay_ name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:v14];
    }
  }
  objc_sync_exit(v40);

LABEL_37:
  v24 = v49;
  objc_msgSend(v14, "pushViewController:animated:", v13, v48, v47);
  if (v49)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __137__VUIPresenterController_pushViewController_fromViewController_withZoomTransition_sourceView_presentationSourceID_isAnimated_completion___block_invoke;
    block[3] = &unk_1E6DF3DD0;
    v51 = v49;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v21 = v51;
LABEL_39:
  }
}

uint64_t __137__VUIPresenterController_pushViewController_fromViewController_withZoomTransition_sourceView_presentationSourceID_isAnimated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_controllerDidDisplay:(id)a3
{
  id v7 = [a3 object];
  if (v7)
  {
    v4 = +[VUIPresenterController sharedInstance];
    v5 = [v4 presentingSourceViewMapTable];
    [v5 removeObjectForKey:v7];

    objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"VUITVAppNavigationDidDisplayViewControllerNotification" object:v7];
  }
}

+ (void)presentViewController:(id)a3 fromViewController:(id)a4 WithConfiguration:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v10)
  {
    id v10 = +[VUIApplicationRouter topPresentedViewController];
  }
  if ([v10 vuiIsBeingDismissed])
  {
    uint64_t v13 = [v10 vuiPresentingViewController];

    id v10 = (id)v13;
  }
  uint64_t v14 = [v11 isAnimated];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v73 = [v11 isModalOverModalAllowed];
  }
  else {
    int v73 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [v10 configuration];
    uint64_t v16 = [v15 type];
    char v17 = v16 == [v11 type] ? v73 : 1;

    if ((v17 & 1) == 0)
    {
      v41 = objc_opt_class();
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke;
      v76[3] = &unk_1E6DF3DD0;
      v77 = (VUINavigationController *)v12;
      [v41 pushViewController:v9 fromViewController:v10 withZoomTransition:0 sourceView:0 presentationSourceID:0 isAnimated:1 completion:v76];
      v19 = v77;
      goto LABEL_62;
    }
  }
  v18 = (double *)MEMORY[0x1E4F1DB30];
  if ([v11 shouldWrapModalInNavigationController])
  {
    v19 = [(_VUITVAppNavigationController *)[VUINavigationController alloc] initWithRootViewController:v9];
    [(VUINavigationController *)v19 setConfiguration:v11];
  }
  else
  {
    v19 = (VUINavigationController *)v9;
  }
  double v21 = *v18;
  double v20 = v18[1];
  if ([v11 type] == 2)
  {
    v22 = v19;
    uint64_t v23 = 0;
LABEL_20:
    [(VUINavigationController *)v22 setModalPresentationStyle:v23];
LABEL_21:
    double v24 = v20;
    double v25 = v21;
    goto LABEL_22;
  }
  if ([v11 type] == 3)
  {
    v22 = v19;
    uint64_t v23 = 8;
    goto LABEL_20;
  }
  if ([v11 type] == 4)
  {
    [(VUINavigationController *)v19 setModalPresentationStyle:2];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_21;
    }
    id v42 = v11;
    id v43 = [(VUINavigationController *)v19 presentationController];
    if ([v42 isTapDismissable]) {
      [v43 _setShouldDismissWhenTappedOutside:1];
    }
    uint64_t v44 = v14;
    if ([v42 prefersGrabberVisible]) {
      [v43 setPrefersGrabberVisible:1];
    }
    v45 = [v42 detents];
    uint64_t v46 = [v45 count];

    if (v46)
    {
      id v47 = [v42 detents];
      [v43 setDetents:v47];
    }
    [v42 preferredSize];
    uint64_t v14 = v44;
    if (v49 != v21 || (double v24 = v20, v25 = v21, v48 != v20))
    {
      [v42 preferredSize];
      double v25 = v50;
      double v24 = v51;
    }
  }
  else
  {
    if ([v11 type] == 9)
    {
      if ([MEMORY[0x1E4FB3C90] isPhone]) {
        uint64_t v52 = 2;
      }
      else {
        uint64_t v52 = 1;
      }
      [(VUINavigationController *)v19 setModalPresentationStyle:v52];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v53 = [(VUINavigationController *)v19 presentationController];
        [v53 _setShouldDismissWhenTappedOutside:0];
        if ([MEMORY[0x1E4FB3C90] isPad]) {
          [v53 _setWantsFullScreen:1];
        }
        [v53 _setAllowsInteractiveDismissWhenFullScreen:1];
      }
      goto LABEL_21;
    }
    if ([v11 type] != 5) {
      goto LABEL_60;
    }
    id v54 = v11;
    v55 = [v54 sourceView];
    [v54 sourceRect];
    if (CGRectIsEmpty(v78)) {
      [v55 bounds];
    }
    else {
      [v54 sourceRect];
    }
    double v60 = v56;
    double v61 = v57;
    double v62 = v58;
    double v63 = v59;
    uint64_t v64 = [v54 popOverArrowDirection];
    [v54 preferredSize];
    if (v66 == v21 && v65 == v20)
    {
      double v25 = 340.0;
      double v24 = 168.0;
    }
    else
    {
      [v54 preferredSize];
      double v25 = v67;
      double v24 = v68;
    }
    unsigned int v71 = v14;
    if ([v54 isPresentationAdjustedToSizeClass])
    {
      v69 = (VUINavigationController *)objc_alloc_init(MEMORY[0x1E4FB1418]);
      objc_msgSend(v9, "setVuiPreferredContentSize:", v25, v24);
      [(VUINavigationController *)v69 setContentViewController:v19];
      [(VUINavigationController *)v69 setPreferredStyle:0];

      v19 = v69;
    }
    [(VUINavigationController *)v19 setModalPresentationStyle:7];
    v70 = [(VUINavigationController *)v19 popoverPresentationController];
    objc_msgSend(v70, "setSourceRect:", v60, v61, v62, v63);
    [v70 setSourceView:v55];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v70 setDelegate:v19];
    }
    [v70 setPermittedArrowDirections:v64];
    [v70 _setCentersPopoverIfSourceViewNotSet:1];

    uint64_t v14 = v71;
  }
LABEL_22:
  if (v25 != v21 || v24 != v20) {
    -[VUINavigationController setVuiPreferredContentSize:](v19, "setVuiPreferredContentSize:", v25, v24);
  }
  v26 = +[VUIPlaybackManager sharedInstance];
  int v27 = [v26 isShowingExtras];

  if (v27)
  {
    v28 = +[VUIPlaybackManager sharedInstance];
    [v28 extrasNavigationController];
    id v72 = v10;
    id v29 = v11;
    uint64_t v30 = v19;
    id v31 = v12;
    id v32 = v9;
    uint64_t v34 = v33 = v14;

    v35 = [v34 topViewController];
    v36 = [v35 presentedViewController];
    id v37 = [v36 presentedViewController];

    BOOL v38 = v37 == 0;
    uint64_t v14 = v33;
    id v9 = v32;
    id v12 = v31;
    v19 = v30;
    id v11 = v29;
    id v10 = v72;
  }
  else
  {
    BOOL v38 = 1;
  }
  v39 = [v10 vuiPresentingViewController];
  if (v39) {
    int v40 = v27;
  }
  else {
    int v40 = 1;
  }

  if (v40 != 1)
  {
    if ((v73 & 1) == 0) {
      goto LABEL_60;
    }
LABEL_35:
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke_2;
    v74[3] = &unk_1E6DF3DD0;
    id v75 = v12;
    objc_msgSend(v10, "vui_presentViewController:animated:completion:", v19, v14, v74);

    goto LABEL_62;
  }
  if ((v38 | v73)) {
    goto LABEL_35;
  }
LABEL_60:
  if (v12) {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
LABEL_62:
}

uint64_t __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __96__VUIPresenterController_presentViewController_fromViewController_WithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

+ (void)dismissViewController:(id)a3 completion:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void (**)(void))a4;
  if (v5
    && ([v5 vuiPresentingViewController],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__VUIPresenterController_dismissViewController_completion___block_invoke;
    v8[3] = &unk_1E6DF3DD0;
    id v9 = v6;
    objc_msgSend(v5, "vui_dismissViewControllerAnimated:completion:", 1, v8);
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

uint64_t __59__VUIPresenterController_dismissViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)popViewController:(id)a3 completion:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void (**)(void))a4;
  id v7 = [v5 vuiNavigationController];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (id v7 = v5) != 0)
  {
    id v8 = (id)[v7 popViewControllerAnimated:1];
    if (v6)
    {
      id v9 = [v7 transitionCoordinator];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __55__VUIPresenterController_popViewController_completion___block_invoke;
      v10[3] = &unk_1E6DF9A98;
      id v11 = v6;
      [v9 animateAlongsideTransition:0 completion:v10];
    }
  }
  else
  {
    if (v6) {
      v6[2](v6);
    }
    id v7 = 0;
  }
}

uint64_t __55__VUIPresenterController_popViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)popOrDismissViewController:(id)a3 completion:(id)a4
{
  id v5 = a3;
  objc_super v6 = (void (**)(void))a4;
  id v7 = [v5 vuiNavigationController];

  if (v7)
  {
    id v8 = [v5 vuiNavigationController];
    id v9 = (id)[v8 popToViewController:v5 animated:1];

    id v10 = [v5 vuiPresentedViewController];

    if (v10)
    {
      id v11 = [v5 vuiPresentedViewController];
      objc_msgSend(v11, "vui_dismissViewControllerAnimated:completion:", 1, 0);
    }
    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke;
      block[3] = &unk_1E6DF3DD0;
      uint64_t v23 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v12 = v23;
LABEL_9:
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v13 = [v5 vuiPresentingViewController];

      if (v13)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_2;
        v20[3] = &unk_1E6DF3DD0;
        double v21 = v6;
        objc_msgSend(v5, "vui_dismissViewControllerAnimated:completion:", 1, v20);
        id v12 = v21;
        goto LABEL_9;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v5;
      id v15 = (id)[v14 popViewControllerAnimated:1];
      if (v6)
      {
        uint64_t v16 = [v14 transitionCoordinator];

        if (v16)
        {
          char v17 = [v14 transitionCoordinator];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_3;
          v18[3] = &unk_1E6DF9A98;
          v19 = v6;
          [v17 animateAlongsideTransition:0 completion:v18];
        }
        else
        {
          v6[2](v6);
        }
      }
    }
    else if (v6)
    {
      v6[2](v6);
    }
  }
}

uint64_t __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __64__VUIPresenterController_popOrDismissViewController_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)_setZoomPreferredTransitionForViewController:(id)a3 sourceView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v6)
  {
LABEL_4:
    LOBYTE(v8) = 0;
    goto LABEL_6;
  }
  id v8 = [v6 window];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__VUIPresenterController__setZoomPreferredTransitionForViewController_sourceView___block_invoke;
      aBlock[3] = &unk_1E6DF9AC0;
      id v12 = v7;
      id v8 = _Block_copy(aBlock);
      id v9 = [MEMORY[0x1E4FB23E0] zoomWithSourceViewProvider:v8];
      [v5 _setPreferredTransition:v9];

      LOBYTE(v8) = 1;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return (char)v8;
}

id __82__VUIPresenterController__setZoomPreferredTransitionForViewController_sourceView___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSMapTable)presentingSourceViewMapTable
{
  return self->_presentingSourceViewMapTable;
}

- (void)setPresentingSourceViewMapTable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end