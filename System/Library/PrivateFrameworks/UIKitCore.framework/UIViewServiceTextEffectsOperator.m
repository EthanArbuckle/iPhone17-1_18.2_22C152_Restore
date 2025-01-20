@interface UIViewServiceTextEffectsOperator
@end

@implementation UIViewServiceTextEffectsOperator

uint64_t __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _prepareForDisconnectionUnconditionallyThen:a2];
}

uint64_t __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateUnconditionallyThen:a2];
}

void __81___UIViewServiceTextEffectsOperator__prepareForDisconnectionUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 168);
  *(void *)(v2 + 168) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v23 = [WeakRetained windowScene];

  v5 = [v23 keyboardSceneDelegate];
  id v6 = +[UIWindow _applicationKeyWindow];
  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  if (v6 != v7)
  {

LABEL_3:
    goto LABEL_4;
  }
  id v17 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  uint64_t v18 = [v17 firstResponder];
  if (!v18)
  {

    goto LABEL_3;
  }
  v19 = (void *)v18;
  id v20 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  v21 = [v20 firstResponder];
  v22 = [v5 responder];

  if (v21 == v22) {
    [v5 _preserveInputViewsWithId:0 animated:0];
  }
LABEL_4:
  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  UIKeyboardSafariDepresentForViewService();

  v9 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  [v5 _clearPreservedInputViewsWithId:v9 clearKeyboard:_activeTextEffectsOperator == *(void *)(a1 + 32)];

  v10 = (void *)_activeTextEffectsOperator;
  uint64_t v11 = *(void *)(a1 + 32);
  if (_activeTextEffectsOperator == v11)
  {
    _activeTextEffectsOperator = 0;

    uint64_t v11 = *(void *)(a1 + 32);
  }
  objc_storeWeak((id *)(v11 + 48), 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v23];
    int v13 = [v12 useHostedInstance];

    if (v13)
    {
      v14 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v23];
      [v14 setUseHostedInstance:0];
    }
  }
  v15 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v15 finishWithHostedWindow];

  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 removeObserver:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 32) invoke];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_2;
  v5[3] = &unk_1E530D828;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 whenCompleteDo:v5];
}

void __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_3;
  block[3] = &unk_1E530D828;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  dispatch_async(v2, block);
}

uint64_t __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
  long long v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v4();
}

void __58___UIViewServiceTextEffectsOperator__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

void __55___UIViewServiceTextEffectsOperator___setWindowOffset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isTextEffectsWindow]) {
    objc_msgSend(v3, "setHostedViewOrigin:", *(double *)(*(void *)(a1 + 32) + 56), *(double *)(*(void *)(a1 + 32) + 64));
  }
}

void __54___UIViewServiceTextEffectsOperator__reloadSafeInsets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _isTextEffectsWindow]
    && [v3 _isHostedInAnotherProcess])
  {
    objc_msgSend(v3, "setHostedSafeInsets:", *(double *)(*(void *)(a1 + 32) + 72), *(double *)(*(void *)(a1 + 32) + 80), *(double *)(*(void *)(a1 + 32) + 88), *(double *)(*(void *)(a1 + 32) + 96));
  }
}

uint64_t __84___UIViewServiceTextEffectsOperator___prepareForDisconnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49___UIViewServiceTextEffectsOperator_XPCInterface__block_invoke()
{
  v0 = objc_alloc_init(_UIViewServiceTextEffectsOperator_XPCInterface);
  v1 = (void *)qword_1EB264E10;
  qword_1EB264E10 = (uint64_t)v0;
}

void __68___UIViewServiceTextEffectsOperator_forceSyncToStatusBarOrientation__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  long long v4 = [v3 visualModeManager];
  int v5 = [v4 shouldShowWithinAppWindow];

  if (v5)
  {
    [*(id *)(a1 + 32) _resetHostedViewSize];
  }
  else
  {
    long long v6 = [v9 screen];
    [v6 _boundsForInterfaceOrientation:*(void *)(a1 + 40)];
    objc_msgSend(v9, "setSize:", v7, v8);
  }
}

void __79___UIViewServiceTextEffectsOperator_setHostedWindow_disableAutomaticBehaviors___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(WeakRetained + 6);
  if (WeakRetained && v2)
  {
    id v3 = [v2 _windowHostingScene];
    long long v4 = [v3 _screen];
    uint64_t v5 = [v4 _userInterfaceIdiom];

    uint64_t v6 = +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, *(_WORD **)(a1 + 32), v5);
    id v7 = WeakRetained[21];
    WeakRetained[21] = (id)v6;
  }
}

void __79___UIViewServiceTextEffectsOperator_willRotateToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 rootViewController];
  [v4 window:v3 willRotateToInterfaceOrientation:*(void *)(a1 + 32) duration:*(double *)(a1 + 40)];
}

void __75___UIViewServiceTextEffectsOperator_rotateToInterfaceOrientation_duration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 rootViewController];
  [v4 window:v3 willAnimateRotationToInterfaceOrientation:*(void *)(a1 + 32) duration:*(double *)(a1 + 40)];

  id v16 = [v3 rootViewController];
  uint64_t v5 = [v16 view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [v3 rootViewController];

  v15 = [v14 view];
  objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);
}

void __76___UIViewServiceTextEffectsOperator_finishRotationFromInterfaceOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 rootViewController];
  [v4 window:v3 didRotateFromInterfaceOrientation:*(void *)(a1 + 32)];
}

@end