@interface UIViewServiceViewControllerOperator
@end

@implementation UIViewServiceViewControllerOperator

uint64_t __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _prepareForDisconnectionUnconditionallyThen:a2];
}

uint64_t __132___UIViewServiceViewControllerOperator_operatorWithRemoteViewControllerProxy_hostPID_hostBundleID_hostAuditToken_sessionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _invalidateUnconditionallyThen:a2];
}

void __61___UIViewServiceViewControllerOperator__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

void __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 992))
  {
    objc_msgSend(*(id *)(v2 + 1072), "_setHostApplicationBundleIdentifier:");
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 1072) _setHostProcessIdentifier:*(unsigned int *)(v2 + 984)];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 1072);
  v3 += 1000;
  long long v5 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)location = *(_OWORD *)v3;
  long long v20 = v5;
  [v4 _setHostAuditToken:location];
  if (*(void *)(a1 + 40))
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    uint64_t v6 = *(void *)(a1 + 40);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke_2;
    v17[3] = &unk_1E530DC50;
    objc_copyWeak(&v18, location);
    uint64_t v7 = +[_UIQueueingProxy proxyWithTarget:v6 shouldSuspendInvocationBlock:v17];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 1056);
    *(void *)(v8 + 1056) = v7;

    [*(id *)(*(void *)(a1 + 32) + 1056) suspend];
    [*(id *)(*(void *)(a1 + 32) + 1072) _setRemoteViewControllerProxy:*(void *)(*(void *)(a1 + 32) + 1056)];
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 1072) performSelector:sel_willAppearInRemoteViewController_ withObject:*(void *)(*(void *)(a1 + 32) + 1056)];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 1072) _willAppearInRemoteViewController:*(void *)(*(void *)(a1 + 32) + 1056)];
  }
  [*(id *)(*(void *)(a1 + 32) + 1072) _willAppearInRemoteViewController];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 1072);
  uint64_t v12 = *(unsigned int *)(v10 + 984);
  v13 = [(id)objc_opt_class() _exportedInterface];
  v14 = [v13 protocol];
  v15 = +[_UIViewServiceUIBehaviorProxy proxyWrappingExportedObject:v11 forCommunicationWithPID:v12 exportedProtocol:v14];

  v16 = +[_UIViewServiceViewControllerDeputy deputyWithViewController:v15];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

BOOL __97___UIViewServiceViewControllerOperator_establishViewControllerDeputyWithProxy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v5 = [(id)objc_opt_class() _remoteViewControllerInterface];
    uint64_t v6 = [v5 protocol];

    BOOL v7 = v6
      && ((unint64_t)protocol_getMethodDescription(v6, (SEL)[v3 selector], 1, 1).name
       || (unint64_t)protocol_getMethodDescription(v6, (SEL)[v3 selector], 0, 1).name);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(id *)(__UILogGetCategoryCachedImpl("ViewServices", _statusBarStateStack_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 56);
    if (v3)
    {
      v4 = NSString;
      id v5 = v3;
      uint64_t v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      uint64_t v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
    }
    else
    {
      uint64_t v8 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    v52 = v8;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Prepare for disconnection of operator: %{public}@", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 56), "__setServiceInPopover:", 0);
  v9 = [*(id *)(*(void *)(a1 + 56) + 1088) windowScene];
  uint64_t v10 = [v9 keyboardSceneDelegate];

  uint64_t v11 = [*(id *)(a1 + 56) _inputViewsKey];
  v42 = v10;
  [v10 _clearPreservedInputViewsWithId:v11 clearKeyboard:0];

  [(id)UIApp _deliverRemainingKeyUpEvents];
  id v12 = *(id *)(*(void *)(a1 + 56) + 1088);
  if (v12)
  {
    [*(id *)(a1 + 32) postNotificationName:@"_UIViewServiceHostedWindowWillDisconnectNotificationName" object:v12];
    v13 = [*(id *)(a1 + 56) _presentationController];
    [v13 completeCurrentTransitionImmediately];

    stopStealingStatusBar(*(void **)(*(void *)(a1 + 56) + 1088));
    -[_UIViewServiceSessionActivityRecord invalidate](*(void *)(*(void *)(a1 + 56) + 1296));
    uint64_t v14 = *(void *)(a1 + 56);
    v15 = *(void **)(v14 + 1296);
    *(void *)(v14 + 1296) = 0;

    if ([*(id *)(*(void *)(a1 + 56) + 1352) isCapturingContentForAdditionalRenderingDestination])
    {
      v16 = NSString;
      v17 = *(void **)(a1 + 40);
      uint64_t v18 = v17[124];
      v19 = v17;
      long long v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = [v16 stringWithFormat:@"<%@: %p>", v21, v19];

      v23 = [v16 stringWithFormat:@"view service connection to %@ disconnecting %@", v18, v22];

      v24 = [v12 _screen];
      -[UIScreen _evaluateCapturedStateForReason:](v24, v23);
    }
    [*(id *)(*(void *)(a1 + 56) + 1312) invalidate];
    uint64_t v25 = *(void *)(a1 + 56);
    v26 = *(void **)(v25 + 1312);
    *(void *)(v25 + 1312) = 0;

    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 56) name:@"_UIHostedWindowDidRegisterScrollToTopViewNotification" object:v12];
    [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 56) name:@"_UIHostedWindowDidUnregisterScrollToTopViewNotification" object:v12];
    uint64_t v27 = *(void *)(a1 + 56);
    v28 = *(void **)(v27 + 1088);
    *(void *)(v27 + 1088) = 0;
  }
  uint64_t v29 = *(void *)(a1 + 56);
  mach_port_name_t v30 = *(_DWORD *)(v29 + 1128);
  if (v30)
  {
    mach_port_deallocate(*MEMORY[0x1E4F14960], v30);
    *(_DWORD *)(*(void *)(a1 + 56) + 1128) = 0;
    uint64_t v29 = *(void *)(a1 + 56);
  }
  [*(id *)(a1 + 32) postNotificationName:@"_UIViewServiceRemoteViewControllerWillDisconnectNotification" object:*(void *)(v29 + 1056)];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v31 = (void *)[*(id *)(*(void *)(a1 + 56) + 1064) copy];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v47 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = [*(id *)(*((void *)&v46 + 1) + 8 * i) identity];
        +[UIScreen _FBSDisplayIdentityDisconnected:v36];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v33);
  }

  uint64_t v37 = *(void *)(a1 + 56);
  v38 = *(void **)(v37 + 1064);
  *(void *)(v37 + 1064) = MEMORY[0x1E4F1CBF0];

  v39 = [*(id *)(a1 + 56) _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_500;
  block[3] = &unk_1E530DC88;
  long long v41 = *(_OWORD *)(a1 + 48);
  id v40 = (id)v41;
  long long v44 = v41;
  uint64_t v45 = *(void *)(a1 + 64);
  dispatch_async(v39, block);
}

void __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_500(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 1048);
  *(void *)(v2 + 1048) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 1056);
  *(void *)(v4 + 1056) = 0;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_2;
  block[3] = &unk_1E530DC88;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v7;
  long long v9 = v7;
  uint64_t v10 = *(void *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84___UIViewServiceViewControllerOperator__prepareForDisconnectionUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 40) + 1072) _setRemoteViewControllerProxy:0];
  [*(id *)(*(void *)(a1 + 40) + 1072) willMoveToParentViewController:0];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 1072) _existingView];
  [v2 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 40) + 1072) removeFromParentViewController];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 40), "childViewControllers", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 willMoveToParentViewController:0];
        long long v9 = [v8 _existingView];
        [v9 removeFromSuperview];

        [v8 removeFromParentViewController];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void **)(v10 + 1072);
  *(void *)(v10 + 1072) = 0;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return [(id)UIApp _endBackgroundTask:*(void *)(a1 + 48)];
}

uint64_t __71___UIViewServiceViewControllerOperator__invalidateUnconditionallyThen___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91___UIViewServiceViewControllerOperator___scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained[155];
    if (v4)
    {
      uint64_t v5 = [v4 _animator];
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      long long v9 = __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke_2;
      uint64_t v10 = &unk_1E52D9F98;
      uint64_t v11 = v3;
      id v12 = *(id *)(a1 + 32);
      [v5 setTransitionActions:&v7];
      objc_msgSend(v5, "animateTransition:", v3[155], v7, v8, v9, v10, v11);
      id v6 = v3[155];
      v3[155] = 0;
    }
    else
    {
      [v3[136] _setHostTraitCollection:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __81___UIViewServiceViewControllerOperator___setHostTraitCollection_deferIfAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1088) _setHostTraitCollection:*(void *)(a1 + 40)];
}

id __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 1088);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 32) view];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    long long v14 = *(void **)(*(void *)(a1 + 32) + 1240);
    if (v14)
    {
      long long v15 = 0;
    }
    else
    {
      uint64_t v18 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
      [(_UIViewControllerOneToOneTransitionContext *)v18 _setFromViewController:v4];
      [(_UIViewControllerOneToOneTransitionContext *)v18 _setToViewController:0];
      [(_UIViewControllerTransitionContext *)v18 _setContainerView:v3];
      -[_UIViewControllerOneToOneTransitionContext _setFromStartFrame:](v18, "_setFromStartFrame:", v7, v9, v11, v13);
      -[_UIViewControllerOneToOneTransitionContext _setToEndFrame:](v18, "_setToEndFrame:", v7, v9, v11, v13);
      -[_UIViewControllerOneToOneTransitionContext _setToStartFrame:](v18, "_setToStartFrame:", v7, v9, v11, v13);
      -[_UIViewControllerOneToOneTransitionContext _setFromEndFrame:](v18, "_setFromEndFrame:", v7, v9, v11, v13);
      [(_UIViewControllerTransitionContext *)v18 _setRotating:0];
      v19 = +[_UIWindowAnimationController animationControllerWithWindow:v3];
      [(_UIViewControllerTransitionContext *)v18 _setIsAnimated:*(unsigned __int8 *)(a1 + 57)];
      [(_UIViewControllerTransitionContext *)v18 _setAnimator:v19];
      -[_UIViewControllerTransitionContext _setCompletionCurve:](v18, "_setCompletionCurve:", [*(id *)(a1 + 40) completionCurve]);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 1240), v18);
      long long v15 = 0;
      if (!*(unsigned char *)(a1 + 58))
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke_2;
        aBlock[3] = &unk_1E52DCB30;
        id v26 = v19;
        long long v20 = v18;
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v27 = v20;
        uint64_t v28 = v21;
        long long v15 = (void (**)(void))_Block_copy(aBlock);
      }
      long long v14 = *(void **)(*(void *)(a1 + 32) + 1240);
    }
    v17 = [v14 _transitionCoordinator];

    long long v16 = (void **)(a1 + 48);
    [v3 _willTransitionToTraitCollection:*(void *)(a1 + 48) withTransitionCoordinator:v17];
    if (v15)
    {
      v15[2](v15);
    }
  }
  else
  {
    long long v16 = (void **)(a1 + 48);
    [v2 _willTransitionToTraitCollection:*(void *)(a1 + 48) withTransitionCoordinator:0];
    v17 = 0;
  }
  if (*(unsigned char *)(a1 + 56)) {
    v22 = *v16;
  }
  else {
    v22 = 0;
  }
  id v23 = v22;

  return v23;
}

void __139___UIViewServiceViewControllerOperator___hostWillTransitionToTraitCollection_withContextDescription_deferIfAnimated_inRemoteViewHierarchy___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) animateTransition:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(v2 + 1240);
  *(void *)(v2 + 1240) = 0;
}

void __65___UIViewServiceViewControllerOperator__firstResponderDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1272]) {
    WeakRetained[1272] = 0;
  }
}

void __82___UIViewServiceViewControllerOperator__wantsKeyboardEventsWithoutFirstResponder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1272]) {
    WeakRetained[1272] = 0;
  }
}

uint64_t __87___UIViewServiceViewControllerOperator___prepareForDisconnectionWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95___UIViewServiceViewControllerOperator_systemLayoutFittingSizeDidChangeForChildViewController___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18C108260]();
  id v3 = *(void **)(a1 + 32);
  id v4 = [v3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  LODWORD(v5) = 1112014848;
  LODWORD(v7) = 1112014848;
  objc_msgSend(v3, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, v8, v5, v7);
  double v10 = v9;
  double v12 = v11;

  double v13 = [*(id *)(a1 + 40) _window];
  long long v14 = [v13 _windowHostingScene];
  long long v15 = [v14 _synchronizedDrawingFence];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "__viewServiceInstrinsicContentSizeDidChange:fence:", v15, v10, v12);

  [v15 invalidate];
}

void __82___UIViewServiceViewControllerOperator_presentationControllerDidAttemptToDismiss___block_invoke(uint64_t a1)
{
  v1 = [[UIPresentationController alloc] initWithPresentedViewController:*(void *)(*(void *)(a1 + 32) + 1072) presentingViewController:0];
  uint64_t v2 = (void *)_MergedGlobals_61_0;
  _MergedGlobals_61_0 = (uint64_t)v1;
}

void __93___UIViewServiceViewControllerOperator_dummyPopoverController_didChangeContentSize_animated___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1168));
  [WeakRetained popoverContentSize];
  if (v6 != a2 || v5 != a3) {
    objc_msgSend(WeakRetained, "_super_setPopoverContentSize:", a2, a3);
  }
}

void __52___UIViewServiceViewControllerOperator_XPCInterface__block_invoke()
{
  v0 = objc_alloc_init(_UIViewServiceViewControllerOperator_XPCInterface);
  v1 = (void *)qword_1EB25B058;
  qword_1EB25B058 = (uint64_t)v0;
}

void __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[1272]) {
    WeakRetained[1272] = 0;
  }
}

uint64_t __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 1072) _preferredInterfaceOrientationGivenCurrentOrientation:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  return result;
}

void __153___UIViewServiceViewControllerOperator___hostViewWillAppear_inInterfaceOrientation_traitCollection_statusBarHeight_underlapsStatusBar_completionHandler___block_invoke_3(void *a1)
{
  v1 = a1;
  uint64_t v2 = a1[5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1168));
  id v4 = (id *)v1[4];
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v1 = objc_loadWeakRetained(v4 + 146);
    [v1 popoverContentSize];
  }
  else
  {
    [v4 preferredContentSize];
  }
  (*(void (**)(uint64_t))(v2 + 16))(v2);
  if (v5) {
}
  }

uint64_t __79___UIViewServiceViewControllerOperator___hostDidMoveToParentSceneWithSettings___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToMutableSettings:a2];
}

uint64_t __69___UIViewServiceViewControllerOperator___hostSceneDidUpdateWithDiff___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToMutableSettings:a2];
}

id __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _traitsWillChangeHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _traitsWillChangeHandler];
    uint64_t v2 = v3[2]();

    [*(id *)(a1 + 32) _setTraitsWillChangeHandler:0];
  }
  -[UIViewController _updateLastKnownInterfaceOrientationOnPresentionStack:](*(void *)(a1 + 32), *(void *)(a1 + 56));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) willRotateToInterfaceOrientation:*(void *)(a1 + 56) duration:*(double *)(a1 + 64)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  *(void *)(*(void *)(a1 + 48) + 576) |= 0x400uLL;
  double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *(void *)(a1 + 48);
  double v11 = (void *)MEMORY[0x1E4F1C9E8];
  double v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"UIWindowNewOrientationUserInfoKey", 0, (void)v15);
  [v9 postNotificationName:@"UIWindowWillRotateNotification" object:v10 userInfo:v13];

  return v2;
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    BOOL v3 = [*(id *)(a1 + 32) count] != 0;
  }
  else {
    BOOL v3 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3;
  v12[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  uint64_t v13 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4;
  v6[3] = &unk_1E530DDA0;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = v13;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  id v8 = *(id *)(a1 + 48);
  +[UIView conditionallyAnimate:v3 withAnimation:v12 layout:v6 completion:0];
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:327684 delay:a2 options:a3 animations:*(double *)(a1 + 32) completion:0.0];
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  +[UIKeyboardSceneDelegate setInterfaceOrientation:*(void *)(a1 + 56)];
  *(void *)(*(void *)(a1 + 32) + 1104) = *(void *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 1112) = *(void *)(a1 + 64);
  uint64_t v2 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
  [(UIStatusBarAnimationParameters *)v2 setDuration:*(double *)(a1 + 72)];
  stealStatusBar(*(void *)(*(void *)(a1 + 32) + 1104), 0, *(void **)(*(void *)(a1 + 32) + 1088), 1);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v7++) rotateToInterfaceOrientation:*(void *)(a1 + 56) duration:*(double *)(a1 + 72)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v11 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  double v12 = objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, @"UIWindowNewOrientationUserInfoKey", 0, (void)v13);
  [v8 postNotificationName:@"UIWindowWillAnimateRotationNotification" object:v9 userInfo:v12];
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_5(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v6++) finishRotationFromInterfaceOrientation:*(void *)(a1 + 64)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }

  *(void *)(*(void *)(a1 + 40) + 576) &= ~0x400uLL;
  [*(id *)(a1 + 40) _setFromWindowOrientation:*(void *)(a1 + 72)];
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 64)];
  uint64_t v11 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"UIWindowOldOrientationUserInfoKey", 0, (void)v23);
  [v7 postNotificationName:@"UIWindowDidRotateNotification" object:v8 userInfo:v11];

  double v12 = [*(id *)(a1 + 48) _traitsDidChangeHandler];

  if (v12)
  {
    long long v13 = [*(id *)(a1 + 48) _traitsDidChangeHandler];
    v13[2]();

    [*(id *)(a1 + 48) _setTraitsDidChangeHandler:0];
  }
  uint64_t v14 = *(void *)(a1 + 56);
  if (v14)
  {
    [*(id *)(a1 + 40) frame];
    double v16 = v15;
    double v18 = v17;
    v19 = [*(id *)(a1 + 48) _window];
    uint64_t v20 = __UIStatusBarManagerForWindow(v19);
    [v20 statusBarHeight];
    double v22 = v21;

    (*(void (**)(uint64_t, double, double, double))(v14 + 16))(v14, v16, v18, v22);
  }
}

id __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _traitsWillChangeHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _traitsWillChangeHandler];
    id v2 = v3[2]();

    [*(id *)(a1 + 32) _setTraitsWillChangeHandler:0];
  }
  return v2;
}

void __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _traitsDidChangeHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _traitsDidChangeHandler];
    v3[2]();

    [*(id *)(a1 + 32) _setTraitsDidChangeHandler:0];
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    [*(id *)(a1 + 40) frame];
    unint64_t v6 = v5;
    unint64_t v8 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) _window];
    uint64_t v10 = __UIStatusBarManagerForWindow(v9);
    [v10 statusBarHeight];
    unint64_t v12 = v11;

    long long v13 = *(void (**)(uint64_t, __n128, __n128, __n128))(v4 + 16);
    v14.n128_u64[0] = v6;
    v15.n128_u64[0] = v8;
    v16.n128_u64[0] = v12;
    v13(v4, v14, v15, v16);
  }
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1240);
  *(void *)(v2 + 1240) = 0;

  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_579(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96)) {
    *(void *)(*(void *)(a1 + 32) + 496) = *(void *)(a1 + 72);
  }
  if ((dyld_program_sdk_at_least() & 1) != 0 || !*(unsigned char *)(a1 + 97)) {
    objc_msgSend(*(id *)(a1 + 40), "__setBoundingPath:", *(void *)(a1 + 48));
  }
  else {
    objc_msgSend(*(id *)(a1 + 40), "__setContentSize:boundingPath:", *(void *)(a1 + 48), *(double *)(a1 + 80), *(double *)(a1 + 88));
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_setHostTraitCollection:");
  }
  return result;
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_2_580(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96)) {
    objc_msgSend(*(id *)(a1 + 32), "__setContentSize:boundingPath:", *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  return objc_msgSend(v2, "__hostWillAnimateRotationToInterfaceOrientation:duration:skipSelf:", v3, 0, v4);
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_3_582(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "__hostDidRotateFromInterfaceOrientation:skipSelf:", *(void *)(a1 + 56), 0);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    [*(id *)(a1 + 40) frame];
    unint64_t v5 = v4;
    unint64_t v7 = v6;
    unint64_t v8 = [*(id *)(a1 + 32) _window];
    uint64_t v9 = __UIStatusBarManagerForWindow(v8);
    [v9 statusBarHeight];
    unint64_t v11 = v10;

    unint64_t v12 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128))(v3 + 16);
    v13.n128_u64[0] = v5;
    v14.n128_u64[0] = v7;
    v15.n128_u64[0] = v11;
    return v12(v3, v13, v14, v15);
  }
  return result;
}

uint64_t __164___UIViewServiceViewControllerOperator___hostViewWillTransitionToSize_withContextDescription_boundingPath_statusBarHeight_underlapsStatusBar_fence_timing_whenDone___block_invoke_4_583(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

uint64_t __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:*(double *)(a1 + 32) completion:0.0];
}

void __106___UIViewServiceViewControllerOperator___hostWillAnimateRotationToInterfaceOrientation_duration_skipSelf___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 1120);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "rotateToInterfaceOrientation:duration:", *(void *)(a1 + 40), *(double *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __90___UIViewServiceViewControllerOperator___createViewControllerWithOptions_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v6 = objc_alloc_init(_UIViewServiceControllerOperatorCreateResult);
  id v2 = [*(id *)(a1 + 32) hostingHandle];
  [(_UIViewServiceControllerOperatorCreateResult *)v6 setServiceWindowHostingHandle:v2];

  uint64_t v3 = [*(id *)(a1 + 40) _supportedInterfaceOrientationsForViewController:*(void *)(*(void *)(a1 + 40) + 1072)];
  [(_UIViewServiceControllerOperatorCreateResult *)v6 setSupportedInterfaceOrientations:v3];

  uint64_t v4 = [*(id *)(a1 + 40) _effectiveStatusBarStyleViewController];
  -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarStyle:](v6, "setPreferredStatusBarStyle:", [v4 preferredStatusBarStyle]);

  uint64_t v5 = [*(id *)(a1 + 40) _effectiveStatusBarHiddenViewController];
  -[_UIViewServiceControllerOperatorCreateResult setPreferredStatusBarVisibility:](v6, "setPreferredStatusBarVisibility:", [v5 _preferredStatusBarVisibility]);

  [(_UIViewServiceControllerOperatorCreateResult *)v6 setAccessibilityServerPort:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __72___UIViewServiceViewControllerOperator__showServiceForType_withContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1088) windowScene];
    id v7 = [v5 keyboardSceneDelegate];

    uint64_t v6 = [*(id *)(a1 + 32) _inputViewsKey];
    [v7 _preserveInputViewsWithId:v6 animated:1];
  }
}

void __99___UIViewServiceViewControllerOperator__showServiceForText_selectedTextRange_type_fromRect_inView___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1088) windowScene];
    id v7 = [v5 keyboardSceneDelegate];

    uint64_t v6 = [*(id *)(a1 + 32) _inputViewsKey];
    [v7 _preserveInputViewsWithId:v6 animated:1];
  }
}

void __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_2;
  v10[3] = &unk_1E52F20F8;
  uint64_t v6 = (void *)a1[6];
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v13 = a1[7];
  v10[4] = v7;
  id v11 = v6;
  id v12 = v5;
  id v9 = v5;
  [a2 _timelinesForDateInterval:v8 completion:v10];
}

void __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (pthread_main_np() != 1)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    [v3 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"UIViewServiceViewControllerOperator.m" lineNumber:3606 description:@"Call must be made on main thread"];
  }
  [*(id *)(a1 + 40) addObjectsFromArray:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __78___UIViewServiceViewControllerOperator___timelinesForDateInterval_completion___block_invoke_3(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (pthread_main_np() != 1)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a1[8] object:a1[4] file:@"UIViewServiceViewControllerOperator.m" lineNumber:3611 description:@"Call must be made on main thread"];
  }
  uint64_t v20 = [*(id *)(a1[4] + 1288) specifierAtPresentationDate:*(void *)(a1[4] + 1280)];
  id v2 = objc_msgSend(MEMORY[0x1E4F4F4B0], "constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:", a1[5], a1[6], 0, 30.0);
  [*(id *)(a1[4] + 1288) addSpecifiers:v2];
  uint64_t v3 = [v2 lastObject];
  id v4 = [v3 presentationInterval];
  uint64_t v5 = [v4 startDate];
  double v21 = a1;
  uint64_t v6 = a1[4];
  uint64_t v7 = *(void **)(v6 + 1280);
  *(void *)(v6 + 1280) = v5;

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v2;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        __n128 v14 = *(void **)(*((void *)&v22 + 1) + 8 * v13);
        id v15 = objc_alloc(MEMORY[0x1E4F4F4A0]);
        __n128 v16 = [v14 presentationInterval];
        double v17 = [v16 startDate];
        double v18 = objc_msgSend(v15, "initWithDate:fidelity:", v17, objc_msgSend(v14, "requestedFidelity"));

        [v8 addObject:v18];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  (*(void (**)(void))(v21[7] + 16))();
}

uint64_t __82___UIViewServiceViewControllerOperator___updateWithFrameSpecifierDate_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _updateWithFrameSpecifier:*(void *)(a1 + 32) completion:a3];
}

@end