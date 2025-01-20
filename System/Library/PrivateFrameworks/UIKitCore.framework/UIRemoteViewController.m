@interface UIRemoteViewController
@end

@implementation UIRemoteViewController

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2;
  block[3] = &unk_1E530D7B8;
  id v12 = v6;
  long long v10 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v10;
  long long v15 = v10;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  if ((v1 & 1) == 0)
  {
    if (*(void *)(a1 + 32))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25ACB0) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v7 = 138543362;
        uint64_t v8 = v4;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Connection handler called with error %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 40) _awakeWithConnectionInfo:*(void *)(a1 + 48)];
      id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25ACB8) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        int v7 = 138543362;
        uint64_t v8 = v6;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Connection handler called with ready view controller %{public}@", (uint8_t *)&v7, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_350(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) invoke];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2_351;
  v7[3] = &unk_1E52E3388;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  [v4 whenCompleteDo:v7];
}

void __124___UIRemoteViewController__requestViewController_traitCollection_fromServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2_351(uint64_t a1)
{
}

void __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = (id)[WeakRetained _terminateWithError:v5];
}

uint64_t __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    [v2 bounds];
    objc_msgSend(v2, "convertRect:toView:", *(void *)(a1 + 32));
  }
  else
  {
    [*(id *)(a1 + 40) bounds];
    +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", *(void *)(a1 + 40));
  }
  double v5 = v3;
  double v6 = v4;
  [*(id *)(a1 + 40) frame];
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1112), "setOrigin:", v5, v6);
  objc_msgSend(*(id *)(*(void *)(a1 + 48) + 1120), "setOrigin:", v5, v6);
  v11 = *(void **)(*(void *)(a1 + 48) + 1128);
  return objc_msgSend(v11, "setOrigin:", v8, v10);
}

uint64_t __52___UIRemoteViewController__awakeWithConnectionInfo___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _terminateUnconditionallyThen:a2];
}

uint64_t __53___UIRemoteViewController__statusBarHeightDidChange___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[133];
  double v3 = [v1 _window];
  double v4 = __UIStatusBarManagerForWindow(v3);
  [v4 statusBarHeight];
  double v6 = v5;

  return objc_msgSend(v2, "__hostDidChangeStatusBarHeight:", v6);
}

uint64_t __59___UIRemoteViewController__applicationWillEnterForeground___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostWillEnterForeground");
  v2 = *(void **)(*(void *)(a1 + 32) + 1080);
  return objc_msgSend(v2, "__hostWillEnterForeground");
}

uint64_t __53___UIRemoteViewController__sceneWillEnterForeground___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostSceneWillEnterForeground");
}

void __66___UIRemoteViewController__snapshotAndRemoveTextEffectsRemoteView__block_invoke()
{
  _UIMainBundleIdentifier();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_68 = [v0 isEqualToString:@"com.apple.Spotlight"];
}

void __54___UIRemoteViewController__applicationWillDeactivate___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1ED3F70F8, &unk_1ED3F7110, &unk_1ED3F7128, &unk_1ED3F7140, &unk_1ED3F7158, &unk_1ED3F7170, &unk_1ED3F7188, &unk_1ED3F71A0, &unk_1ED3F71B8, &unk_1ED3F71D0, &unk_1ED3F71E8, &unk_1ED3F7200, &unk_1ED3F7218, &unk_1ED3F7230, 0);
  unsigned __int8 v1 = (void *)qword_1EB25ACC8;
  qword_1EB25ACC8 = v0;
}

uint64_t __78___UIRemoteViewController__setContentOverlayInsets_andLeftMargin_rightMargin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostDidSetContentOverlayInsets:andLeftMargin:rightMargin:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 40) + 984) disconnect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_2;
  v5[3] = &unk_1E530D828;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 whenCompleteDo:v5];
}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_3;
  block[3] = &unk_1E530D828;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_3(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v2 = *(id *)(__UILogGetCategoryCachedImpl("ViewServices", &_UIInternalPreference_RemoteViewControllerSnapshotDelay_block_invoke_3___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      long long v4 = NSString;
      id v5 = v3;
      long long v6 = (objc_class *)objc_opt_class();
      double v7 = NSStringFromClass(v6);
      double v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
    }
    else
    {
      double v8 = @"(nil)";
    }
    *(_DWORD *)buf = 138543362;
    v39 = v8;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Finishing termination for remote view controller: %{public}@", buf, 0xCu);
  }
  double v9 = NSString;
  double v10 = *(void **)(a1 + 40);
  if (v10)
  {
    id v11 = v10;
    id v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = [v9 stringWithFormat:@"<%@: %p>", v13, v11];
  }
  else
  {
    id v14 = @"(nil)";
  }
  long long v15 = [v9 stringWithFormat:@"%@: end for dealloc", v14];

  -[_UIEventDeferringOwnershipToken endEventDeferringWithReason:](*(void *)(*(void *)(a1 + 40) + 1248), (uint64_t)v15);
  uint64_t v16 = *(void *)(a1 + 40);
  v17 = *(void **)(v16 + 1248);
  *(void *)(v16 + 1248) = 0;

  -[_UIEventDeferringOwnershipToken endEventDeferringWithReason:](*(void *)(*(void *)(a1 + 40) + 1272), (uint64_t)v15);
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = *(void **)(v18 + 1272);
  *(void *)(v18 + 1272) = 0;

  uint64_t v20 = *(void *)(a1 + 40);
  v21 = *(void **)(v20 + 1280);
  *(void *)(v20 + 1280) = 0;

  [*(id *)(*(void *)(a1 + 40) + 992) endUsing:&__block_literal_global_474_0];
  v22 = *(os_unfair_lock_s **)(a1 + 40);
  mach_port_name_t os_unfair_lock_opaque = v22[256]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    mach_port_deallocate(*MEMORY[0x1E4F14960], os_unfair_lock_opaque);
    *(_DWORD *)(*(void *)(a1 + 40) + 1024) = 0;
    v22 = *(os_unfair_lock_s **)(a1 + 40);
  }
  os_unfair_lock_lock(v22 + 294);
  id v24 = *(id *)(*(void *)(a1 + 40) + 1184);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 1176));
  [*(id *)(a1 + 40) viewServiceDidTerminateWithError:v24];
  [*(id *)(*(void *)(a1 + 40) + 1200) setDelegate:0];
  [*(id *)(*(void *)(a1 + 40) + 1200) removeFromSuperview];
  uint64_t v25 = *(void *)(a1 + 40);
  v26 = *(void **)(v25 + 1200);
  *(void *)(v25 + 1200) = 0;

  uint64_t v27 = *(void *)(a1 + 40);
  v28 = *(void **)(v27 + 1008);
  *(void *)(v27 + 1008) = 0;

  uint64_t v29 = *(void *)(a1 + 40);
  v30 = *(void **)(v29 + 1000);
  *(void *)(v29 + 1000) = 0;

  uint64_t v31 = *(void *)(a1 + 40);
  v32 = *(void **)(v31 + 1064);
  *(void *)(v31 + 1064) = 0;

  uint64_t v33 = *(void *)(a1 + 40);
  v34 = *(void **)(v33 + 1080);
  *(void *)(v33 + 1080) = 0;

  uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 1416);
  if (v35)
  {
    -[_UISceneKeyboardProxyLayerForwardingPresentationViewService invalidate](v35);
    uint64_t v36 = *(void *)(a1 + 40);
    v37 = *(void **)(v36 + 1416);
    *(void *)(v36 + 1416) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57___UIRemoteViewController__terminateUnconditionallyThen___block_invoke_472(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    id v3 = [v2 userInfo];
    NSLog(&cfstr_ErrorCleaningU.isa, v2, v3);
  }
}

void __48___UIRemoteViewController__objc_initiateDealloc__block_invoke(uint64_t a1)
{
}

void __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke(uint64_t a1)
{
  id v2 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_2;
  v3[3] = &unk_1E52DA040;
  id v4 = *(id *)(a1 + 32);
  [v2 performAsync:v3];
}

uint64_t __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  long long v6 = [(id)UIApp _systemAnimationFenceExemptQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_4;
  v9[3] = &unk_1E52E87F0;
  id v7 = *(id *)(a1 + 32);
  id v10 = v5;
  id v11 = v7;
  char v12 = a2;
  id v8 = v5;
  [v6 performAsync:v9];
}

uint64_t __77___UIRemoteViewController__scrollToTopFromTouchAtViewLocation_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (*(void *)(a1 + 32)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = *(unsigned __int8 *)(a1 + 48) != 0;
    }
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v3);
  }
  return result;
}

void __42___UIRemoteViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1392) = [*(id *)(a1 + 32) _viewControllerUnderlapsStatusBar];
  id v2 = [*(id *)(a1 + 32) _sheetPresentationController];
  BOOL v3 = v2;
  if (v2) {
    [v2 _tryToConnectToRemoteSheet:*(void *)(a1 + 32)];
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[133];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v7 = [v4 _preferredInterfaceOrientation];
  id v8 = *(void **)(a1 + 32);
  double v9 = [v8 traitCollection];
  id v10 = [v8 _traitCollectionForServiceFromTraitCollection:v9];
  id v11 = [*(id *)(a1 + 32) _window];
  char v12 = __UIStatusBarManagerForWindow(v11);
  [v12 statusBarHeight];
  double v14 = v13;

  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(unsigned __int8 *)(v15 + 1392);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42___UIRemoteViewController_viewWillAppear___block_invoke_2;
  v17[3] = &unk_1E52F2248;
  v17[4] = v15;
  objc_msgSend(v5, "__hostViewWillAppear:inInterfaceOrientation:traitCollection:statusBarHeight:underlapsStatusBar:completionHandler:", v6, v7, v10, v16, v17, v14);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "__hostViewWillAppear:", *(unsigned __int8 *)(a1 + 40));
}

void __42___UIRemoteViewController_viewWillAppear___block_invoke_2(uint64_t a1, double a2, double a3)
{
  if (a2 != *MEMORY[0x1E4F1DB30] || a3 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    uint64_t v7 = [(id)UIApp _systemAnimationFenceExemptQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42___UIRemoteViewController_viewWillAppear___block_invoke_3;
    v8[3] = &unk_1E52DD178;
    v8[4] = *(void *)(a1 + 32);
    *(double *)&v8[5] = a2;
    *(double *)&v8[6] = a3;
    [v7 performAsync:v8];
  }
}

uint64_t __42___UIRemoteViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __53___UIRemoteViewController__updateServiceSceneContext__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostDidUpdateSceneContext:", *(void *)(a1 + 40));
}

uint64_t __60___UIRemoteViewController__viewWillMoveFromWindow_toWindow___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1392) = [*(id *)(a1 + 32) _viewControllerUnderlapsStatusBar];
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[133];
  uint64_t v4 = [v2 _preferredInterfaceOrientationForWindow:*(void *)(a1 + 40)];
  id v5 = __UIStatusBarManagerForWindow(*(void **)(a1 + 40));
  [v5 statusBarHeight];
  double v7 = v6;

  uint64_t v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1392);
  return objc_msgSend(v3, "__hostViewWillMoveToWindowInInterfaceOrientation:withStatusBarHeight:underlapsStatusBar:", v4, v8, v7);
}

BOOL __58___UIRemoteViewController__systemReferenceAngleDidChange___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 unsignedIntValue];
  return v3 == [*(id *)(a1 + 32) _contextId];
}

void __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1064) _awaitingReply];
  int v3 = [*(id *)(a1 + 40) displayIdentity];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_2;
  v7[3] = &unk_1E530D878;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "__hostViewDidMoveToScreenWithFBSDisplayIdentity:newHostingHandleReplyHandler:", v3, v7);

  if (objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1080) _awaitingReply];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_4;
    v5[3] = &unk_1E530D8A0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "__hostViewDidMoveToScreenWithNewHostingHandleReplyHandler:", v5);

    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_3;
    v5[3] = &unk_1E52D9F98;
    id v6 = v3;
    id v7 = WeakRetained;
    [WeakRetained performReplyActionsInsideSynchronousReply:v5];
  }
}

uint64_t __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1104), "setHostedWindowHostingHandle:");
  }
  id v2 = *(void **)(a1 + 40);
  return [v2 _updateUnderflowProperties];
}

void __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_5;
    v8[3] = &unk_1E52DCB30;
    id v9 = v5;
    id v10 = WeakRetained;
    id v11 = v6;
    [WeakRetained performReplyActionsInsideSynchronousReply:v8];
  }
}

uint64_t __93___UIRemoteViewController__notifyServiceOfScreenUpdateConsideringDeferringOverridesIfNeeded___block_invoke_5(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32)) {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(result + 40) + 1112), "setHostedWindowHostingHandle:");
  }
  if (*(void *)(v1 + 48))
  {
    id v2 = *(void **)(*(void *)(v1 + 40) + 1128);
    return objc_msgSend(v2, "setHostedWindowHostingHandle:");
  }
  return result;
}

uint64_t __45___UIRemoteViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostViewWillDisappear:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1080), "__hostViewWillDisappear:", *(unsigned __int8 *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 _cancelProxiedEditAlertViewAnimated:v3];
}

void __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v25 = a2;
  uint64_t v3 = +[_UIViewControllerTransitionCoordinatorContextDescription descriptionForTransitionCoordinatorContext:](_UIViewControllerTransitionCoordinatorContextDescription, "descriptionForTransitionCoordinatorContext:");
  [v3 setToOrientation:*(void *)(a1 + 40)];
  [v3 setFromOrientation:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 1136))
  {
    *(unsigned char *)(v4 + 1144) = 1;
    [*(id *)(a1 + 32) _restoreTextEffectsRemoteView];
    uint64_t v4 = *(void *)(a1 + 32);
  }
  [(id)v4 updateTouchInterdictionViewLayout];
  *(unsigned char *)(*(void *)(a1 + 32) + 1392) = [*(id *)(a1 + 32) _viewControllerUnderlapsStatusBar];
  id v5 = (void *)MEMORY[0x18C108260]();
  id v6 = [*(id *)(a1 + 32) _fenceForSynchronizedDrawing];
  __n128 v29 = 0uLL;
  uint64_t v30 = 0;
  if (_UIUpdateCycleEnabled() && v6) {
    *(void *)&double v7 = _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, 0, &v29).n128_u64[0];
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 1064);
  objc_msgSend(*(id *)(v8 + 1096), "_sizeForRemoteViewService", v7);
  double v11 = v10;
  double v13 = v12;
  double v14 = [*(id *)(*(void *)(a1 + 32) + 1096) _boundingPathForRemoteViewService];
  uint64_t v15 = [*(id *)(a1 + 32) _window];
  uint64_t v16 = __UIStatusBarManagerForWindow(v15);
  [v16 statusBarHeight];
  double v18 = v17;

  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(unsigned __int8 *)(v19 + 1392);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v28[3] = &unk_1E530D8C8;
  v28[4] = v19;
  __n128 v26 = v29;
  uint64_t v27 = v30;
  objc_msgSend(v9, "__hostViewWillTransitionToSize:withContextDescription:boundingPath:statusBarHeight:underlapsStatusBar:fence:timing:whenDone:", v3, v14, v20, v6, &v26, v28, v11, v13, v18);

  [*(id *)(*(void *)(a1 + 32) + 1096) _clearNeedsRemoteViewServiceBoundingPathUpdate];
  [v6 invalidate];

  v21 = *(void **)(*(void *)(a1 + 32) + 1096);
  [v21 frame];
  objc_msgSend(v21, "_updateTextEffectsGeometries:");
  v22 = *(void **)(*(void *)(a1 + 32) + 1096);
  v23 = [v22 window];
  id v24 = -[UIWindow _fbsScene](v23);
  [v22 _updateSceneGeometries:v24 forOrientation:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) _endDeferringProxySheetConfigurationUpdates];
}

uint64_t __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  [*(id *)(*(void *)(a1 + 32) + 1096) _sizeForRemoteViewService];
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) _window];
  double v13 = __UIStatusBarManagerForWindow(v12);
  [v13 statusBarHeight];
  double v15 = v14;

  double v16 = vabdd_f64(a2, v9);
  if (vabdd_f64(a3, v11) >= 0.00000011920929 || v16 >= 0.00000011920929 || v15 != a4)
  {
    uint64_t v19 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v21[3] = &unk_1E52D9CD0;
    v21[4] = v19;
    *(double *)&v21[5] = v15;
    [v19 _synchronizeAnimationsInActionsIfNecessary:v21];
  }
  return [*(id *)(a1 + 32) _setIsUpdatingSize:0];
}

uint64_t __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostDidChangeStatusBarHeight:", *(double *)(a1 + 40));
  [*(id *)(a1 + 32) _updateUnderflowProperties];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1064);
  [*(id *)(v2 + 1096) _sizeForRemoteViewService];
  double v5 = v4;
  double v7 = v6;
  double v8 = [*(id *)(*(void *)(a1 + 32) + 1096) _boundingPathForRemoteViewService];
  objc_msgSend(v3, "__setContentSize:boundingPath:", v8, v5, v7);

  [*(id *)(*(void *)(a1 + 32) + 1096) _clearNeedsRemoteViewServiceBoundingPathUpdate];
  double v9 = *(void **)(*(void *)(a1 + 32) + 1096);
  [v9 frame];
  return objc_msgSend(v9, "_updateTextEffectsGeometries:");
}

void __78___UIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[1144])
  {
    [v3 _snapshotAndRemoveTextEffectsRemoteView];
    *(unsigned char *)(*(void *)(a1 + 32) + 1144) = 0;
    uint64_t v3 = *(unsigned char **)(a1 + 32);
  }
  [v3 _setIsUpdatingSizeInHost:0];
  if (_isPerformingSystemSnapshot(*(void **)(a1 + 32))) {
    [MEMORY[0x1E4F29060] sleepForTimeInterval:_UIGetRemoteViewControllerSnapshotDelay()];
  }
}

uint64_t __114___UIRemoteViewController__willAnimateRotationToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostWillAnimateRotationToInterfaceOrientation:duration:skipSelf:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
}

uint64_t __105___UIRemoteViewController__willRotateToInterfaceOrientation_duration_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostWillRotateToInterfaceOrientation:duration:skipSelf:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
}

uint64_t __97___UIRemoteViewController__didRotateFromInterfaceOrientation_forwardToChildControllers_skipSelf___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__hostDidRotateFromInterfaceOrientation:skipSelf:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __143___UIRemoteViewController___viewServiceDidUpdatePreferredStatusBarStyle_preferredStatusBarVisibility_updateAnimation_currentAnimationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

uint64_t __102___UIRemoteViewController___viewServiceDidUpdatePreferredWhitePointAdaptationStyle_animationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsWhitePointAdaptivityStyleUpdate];
}

uint64_t __68___UIRemoteViewController___viewServiceDidUpdateClientToHostAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendClientToHostAction:*(void *)(a1 + 40)];
}

void __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[_UIViewControllerTransitionCoordinatorContextDescription descriptionForTransitionCoordinatorContext:a2];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2;
  aBlock[3] = &unk_1E52DCB30;
  id v4 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v5 = v3;
  id v9 = v5;
  double v6 = (void (**)(void))_Block_copy(aBlock);
  if (([*(id *)(a1 + 32) _isUpdatingSize] & 1) != 0
    || *(unsigned char *)(a1 + 48) && (objc_msgSend(*(id *)(a1 + 32), "__shouldRemoteViewControllerFenceOperations") & 1) == 0)
  {
    v6[2](v6);
  }
  else
  {
    [*(id *)(a1 + 32) synchronizeAnimationsInActions:v6];
  }
}

void __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = (void *)v2[133];
  uint64_t v6 = _shouldDeferSendingTraitCollectionChangeToService(v2);
  id v8 = [*(id *)(a1 + 32) _existingView];
  double v7 = [v8 window];
  objc_msgSend(v5, "__hostWillTransitionToTraitCollection:withContextDescription:deferIfAnimated:inRemoteViewHierarchy:", v3, v4, v6, v7 != 0);
}

uint64_t __85___UIRemoteViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t result = _isPerformingSystemSnapshot(*(void **)(a1 + 32));
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _isUpdatingSizeInHost];
    if ((result & 1) == 0)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4F29060];
      double v4 = _UIGetRemoteViewControllerSnapshotDelay();
      return [v3 sleepForTimeInterval:v4];
    }
  }
  return result;
}

uint64_t __63___UIRemoteViewController___setSupportedInterfaceOrientations___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1016), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setNeedsUpdateOfSupportedInterfaceOrientations];
}

void __63___UIRemoteViewController___setViewServiceIsDisplayingPopover___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1200);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 40)) {
      return;
    }
    [v2 setDelegate:0];
    [*(id *)(*(void *)(a1 + 32) + 1200) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 1200);
    *(void *)(v3 + 1200) = 0;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 40)) {
      return;
    }
    id v5 = [UIDimmingView alloc];
    uint64_t v6 = -[UIDimmingView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 1200);
    *(void *)(v7 + 1200) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1200), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 1200) setAutoresizingMask:18];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 1200) layer];
    [v9 setHitTestsAsOpaque:0];

    double v10 = [*(id *)(*(void *)(a1 + 32) + 1096) window];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1200), "setFrame:", 0.0, 0.0, v12, v14);
    id v15 = [*(id *)(*(void *)(a1 + 32) + 1096) window];
    [v15 addSubview:*(void *)(*(void *)(a1 + 32) + 1200)];
    double v4 = v15;
  }
}

void __99___UIRemoteViewController__serviceWantsKeyboardEventsWithPromotedFirstResponder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _existingView];
  id v33 = [v2 window];

  uint64_t v3 = [v33 windowScene];
  uint64_t v4 = [v3 activationState];
  uint64_t v5 = [v3 activationState];
  if (v33) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || (v4 != 1 ? (BOOL v7 = v5 == 0) : (BOOL v7 = 1), !v7))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_56;
  }
  char v8 = [*(id *)(a1 + 32) isFirstResponder];
  id v9 = +[UIWindow _applicationKeyWindow];
  double v10 = [*(id *)(a1 + 32) activePresentationController];

  if (!v10
    || ([*(id *)(a1 + 32) activePresentationController],
        double v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 _wantsAutomaticFirstResponderWhenPresentingRemoteViewController],
        v11,
        v12))
  {
    char v13 = *(unsigned char *)(a1 + 48) ? v8 : 1;
    if ((v13 & 1) == 0)
    {
      double v14 = [v33 windowScene];
      id v15 = [v14 _eventDeferringManager];

      if (v15)
      {
        double v16 = [MEMORY[0x1E4F4F280] keyboardFocusEnvironment];
        BOOL v18 = (unint64_t)(-[_UIEventDeferringManager compareRemoteRuleOwningElement:toTopElementInEnvironment:]((uint64_t)v15, *(id *)(a1 + 32), (uint64_t)v16)+ 1) < 2|| v33 != v9;
      }
      else
      {
        BOOL v18 = 0;
      }
      uint64_t v19 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      uint64_t v20 = [v19 responder];
      v21 = [v20 inputViewController];
      v22 = [v21 view];

      if (+[UIKeyboard usesInputSystemUI] && v18 && v22)
      {
        v23 = [*(id *)(a1 + 32) view];
        char v24 = [v23 isDescendantOfView:v22];

        if (v24) {
          goto LABEL_35;
        }
      }
      else if (!v18)
      {
LABEL_35:

        goto LABEL_36;
      }
      if ([v19 ignoresPinning])
      {
        [*(id *)(a1 + 32) becomeFirstResponder];
      }
      else
      {
        [v19 setIgnoresPinning:1];
        [*(id *)(a1 + 32) becomeFirstResponder];
        [v19 setIgnoresPinning:0];
      }
      goto LABEL_35;
    }
  }
LABEL_36:
  if ([v33 canBecomeKeyWindow] && (objc_msgSend(v33, "_isTextEffectsWindow") & 1) == 0)
  {
    id v26 = v33;
  }
  else
  {
    id v25 = [v33 windowScene];
    -[UIWindowScene _keyWindow](v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v27 = 0;
  if (v26 && v26 != v9)
  {
    if (v9 && (unint64_t)(_UIWindowCompareToWindow(v9, v33) + 1) > 1)
    {
      char v27 = 0;
    }
    else
    {
      [v26 makeKeyWindow];
      char v27 = 1;
    }
  }
  v28 = +[UIWindow _applicationKeyWindow];
  __n128 v29 = [v33 windowScene];
  uint64_t v30 = [v28 windowScene];

  if ((v27 & 1) == 0 && v29 != v30
    || !+[_UIRemoteKeyboards enabled]
    || !objc_msgSend((id)objc_opt_class(), "__shouldHostRemoteTextEffectsWindow"))
  {
    goto LABEL_55;
  }
  if (!+[UIKeyboard inputUIOOP])
  {
    v32 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    -[_UIRemoteKeyboards performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:]((uint64_t)v32, v33, [*(id *)(*(void *)(a1 + 32) + 984) servicePID]);
    goto LABEL_54;
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    uint64_t v31 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v32 = [v31 keyboardArbiterClient];

    -[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateIfPermittedForViewServiceHostWindow:servicePID:](v32, v33, [*(id *)(*(void *)(a1 + 32) + 984) servicePID]);
LABEL_54:
  }
LABEL_55:
  [*(id *)(a1 + 32) _setWantsKeyboardEnvironmentEventDeferring:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_56:
}

void __100___UIRemoteViewController___viewServicePopoverDidChangeContentSize_animated_fence_withReplyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _window];
  uint64_t v3 = [v2 _windowHostingScene];
  [v3 _synchronizeDrawingWithFence:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) invalidate];
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 32) _popoverController];
  uint64_t v5 = [v9 popoverView];
  BOOL v6 = [v5 contentView];
  [v6 bounds];
  (*(void (**)(uint64_t, double, double))(v4 + 16))(v4, v7, v8);
}

uint64_t __76___UIRemoteViewController___viewServicePreferredContentSizeDidChange_fence___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _window];
  uint64_t v3 = [v2 _windowHostingScene];
  [v3 _synchronizeDrawingWithFence:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) invalidate];
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  return objc_msgSend(v4, "setPreferredContentSize:", v5, v6);
}

uint64_t __77___UIRemoteViewController___viewServiceInstrinsicContentSizeDidChange_fence___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _window];
  uint64_t v3 = [v2 _windowHostingScene];
  [v3 _synchronizeDrawingWithFence:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) invalidate];
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = (void *)v4[137];
  objc_msgSend(v4, "intrinsicContentSizeForServiceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(v5, "updateIntrinsicContentSize:");
  double v6 = *(void **)(a1 + 32);
  return [v6 viewDidInvalidateIntrinsicContentSize];
}

uint64_t __91___UIRemoteViewController__updateProxySheetConfigurationIfNeccessaryGivenOldConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__setSheetConfiguration:", *(void *)(a1 + 40));
}

void __97___UIRemoteViewController___viewServiceSheetPresentationClientConfigurationDidChange_attributes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerView];
  uint64_t v1 = [v2 window];
  [v1 layoutIfNeeded];
}

void __82___UIRemoteViewController__setUpHomeAffordanceObserverInteractionForViewIfNeeded___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v10 = WeakRetained;
    objc_msgSend(WeakRetained[133], "__hostHomeAffordanceFrameIntersectionDidChange:", a2, a3, a4, a5);
    id WeakRetained = v10;
  }
}

void __82___UIRemoteViewController__setUpHomeAffordanceObserverInteractionForViewIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    objc_msgSend(WeakRetained[133], "__hostReceivedHomeAffordanceDoubleTapGestureDidSucceed:", a2);
    id WeakRetained = v4;
  }
}

void __66___UIRemoteViewController__initializeAccessibilityPortInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_error_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "AX Exchange error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    mach_port_name_t v8 = [v5 extractPortAndIKnowWhatImDoingISwear];
    if (v8 - 1 <= 0xFFFFFFFD && WeakRetained)
    {
      mach_port_name_t v9 = v8;
      if (mach_port_mod_refs(*MEMORY[0x1E4F14960], v8, 0, 1)) {
        mach_port_name_t v10 = 0;
      }
      else {
        mach_port_name_t v10 = v9;
      }
      WeakRetained[256] = v10;
    }
  }
}

uint64_t __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) view];
    [*(id *)(a1 + 32) setView:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 40) view];
  uint64_t v5 = [v4 _showServiceForType:*(void *)(a1 + 56) withContext:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(void **)(v6 + 1192);
  *(void *)(v6 + 1192) = v5;

  uint64_t v8 = *(void *)(a1 + 40);
  if (*(void *)(v8 + 1192))
  {
    objc_initWeak(&location, (id)v8);
    mach_port_name_t v9 = *(void **)(*(void *)(a1 + 40) + 1192);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke_2;
    v11[3] = &unk_1E530BB48;
    objc_copyWeak(&v12, &location);
    [v9 setDismissedHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(v8 + 1064), "__textServiceDidDismiss");
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __73___UIRemoteViewController___showServiceForType_withContext_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    objc_msgSend(WeakRetained[133], "__textServiceDidDismiss");
    id v2 = v3[149];
    v3[149] = 0;

    id WeakRetained = v3;
  }
}

void __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) CGRectValue];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  mach_port_name_t v10 = *(void **)(a1 + 40);
  if (v10)
  {
    uint64_t v11 = [v10 rangeValue];
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = [*(id *)(a1 + 48) length];
    uint64_t v11 = 0;
  }
  double v14 = [*(id *)(a1 + 56) view];
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = *(void *)(a1 + 48);
  double v17 = [*(id *)(a1 + 56) view];
  uint64_t v18 = objc_msgSend(v14, "_showServiceForText:selectedTextRange:type:fromRect:inView:", v16, v11, v13, v15, v17, v3, v5, v7, v9);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void **)(v19 + 1192);
  *(void *)(v19 + 1192) = v18;

  objc_initWeak(&location, *(id *)(a1 + 56));
  v21 = *(void **)(*(void *)(a1 + 56) + 1192);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  id v26 = __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke_2;
  char v27 = &unk_1E530BB48;
  objc_copyWeak(&v28, &location);
  [v21 setDismissedHandler:&v24];
  uint64_t v22 = *(void *)(a1 + 56);
  if (!*(void *)(v22 + 1192)) {
    objc_msgSend(*(id *)(v22 + 1064), "__textServiceDidDismiss", v24, v25, v26, v27);
  }
  uint64_t v23 = *(void *)(a1 + 64);
  if (v23) {
    (*(void (**)(uint64_t, void, void))(v23 + 16))(v23, 0, 0);
  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __103___UIRemoteViewController___showServiceForText_selectedTextRangeValue_type_fromRectValue_replyHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    objc_msgSend(WeakRetained[133], "__textServiceDidDismiss");
    id v2 = v3[149];
    v3[149] = 0;

    id WeakRetained = v3;
  }
}

uint64_t __63___UIRemoteViewController___dismissTextServiceSessionAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1192) dismissTextServiceAnimated:*(unsigned __int8 *)(a1 + 40)];
}

void __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_2;
  v2[3] = &unk_1E52D9F98;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:v2];
}

uint64_t __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__cancelAlertActionWithToken:", *(void *)(*(void *)(a1 + 32) + 1344));
  [*(id *)(a1 + 32) _endNoPresentingViewControllerAlertController:*(void *)(a1 + 40)];
  return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"UndoCancel" trigger:@"Shake"];
}

void __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4F143A8];
  uint64_t v3 = 3221225472;
  double v4 = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_4;
  double v5 = &unk_1E52D9F98;
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v1;
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:&v2];
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Undo", @"Shake", v2, v3, v4, v5, v6 trigger];
}

uint64_t __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__undoActionWithToken:", *(void *)(*(void *)(a1 + 32) + 1344));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _endNoPresentingViewControllerAlertController:v3];
}

void __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_5(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_6;
  v2[3] = &unk_1E52D9F98;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  +[UIUndoGestureInteraction presentProductivityGestureTutorialIfNeededWithCompletion:v2];
}

uint64_t __72___UIRemoteViewController___showEditAlertViewWithToken_canUndo_canRedo___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "__redoActionWithToken:", *(void *)(*(void *)(a1 + 32) + 1344));
  [*(id *)(a1 + 32) _endNoPresentingViewControllerAlertController:*(void *)(a1 + 40)];
  return +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Redo" trigger:@"Shake"];
}

void __54___UIRemoteViewController__prepareTouchDeliveryPolicy__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(const char **)(a1 + 40);
  id v4 = a2;
  NSStringFromSelector(v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_SendingTouchDe.isa, v5, *(void *)(a1 + 32), v4);
}

void __71___UIRemoteViewController__cancelTouchesForCurrentEventInHostedContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(const char **)(a1 + 32);
  id v3 = a2;
  NSStringFromSelector(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_SendingCancell.isa, v4, v3);
}

void __64___UIRemoteViewController___trampolineButtonPressData_canceled___block_invoke()
{
  uint64_t v0 = (void *)qword_1EB25ACF8;
  qword_1EB25ACF8 = (uint64_t)&unk_1ED3F1750;
}

void __64___UIRemoteViewController__timelinesForDateInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        mach_port_name_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1E4F4F4B8];
        uint64_t v12 = objc_msgSend(v10, "date", (void)v19);
        uint64_t v13 = objc_msgSend(v11, "entryForPresentationTime:withRequestedFidelity:", v12, objc_msgSend(v10, "fidelity"));

        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  double v14 = (void *)MEMORY[0x1E4F4F4B0];
  uint64_t v15 = [*(id *)(a1 + 32) _timelineID];
  uint64_t v16 = [v14 timelineWithEntries:v4 identifier:v15 configure:0];

  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v23 = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
}

void __56___UIRemoteViewController_removeAppProtectionShieldView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _sheetPresentationController];
  [v2 _tryToConnectToRemoteSheet:*(void *)(a1 + 32)];
}

void __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD20) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = v7;
        double v9 = [WeakRetained serviceBundleIdentifier];
        *(_DWORD *)buf = 138412290;
        id v16 = v9;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Extension authenticated: %@", buf, 0xCu);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke_686;
      block[3] = &unk_1E52D9F70;
      void block[4] = WeakRetained;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      mach_port_name_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD28) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = v10;
        uint64_t v12 = [WeakRetained serviceBundleIdentifier];
        *(_DWORD *)buf = 138412290;
        id v16 = v12;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Extension not authenticated: %@", buf, 0xCu);
      }
    }
    if (v5)
    {
      uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD30) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Error attempting to unlock %@:", buf, 0xCu);
      }
    }
  }
}

uint64_t __57___UIRemoteViewController_shieldViewUnlockButtonPressed___block_invoke_686(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAppProtectionShieldView];
}

void __72___UIRemoteViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [*(id *)(a1 + 32) containsObject:WeakRetained[130]])
  {
    if ([WeakRetained[130] requiresShielding])
    {
      id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD38) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        id v5 = [WeakRetained serviceBundleIdentifier];
        int v9 = 138412290;
        mach_port_name_t v10 = v5;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Extension was locked by monitor %@", (uint8_t *)&v9, 0xCu);
      }
      [WeakRetained presentAppProtectionShieldView];
      [WeakRetained requestAppProtectionAuthIfNecessary];
    }
    else
    {
      uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("ViewServices", &qword_1EB25AD40) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v6;
        uint64_t v8 = [WeakRetained serviceBundleIdentifier];
        int v9 = 138412290;
        mach_port_name_t v10 = v8;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Extension was unlocked by monitor %@", (uint8_t *)&v9, 0xCu);
      }
      [WeakRetained removeAppProtectionShieldView];
    }
  }
}

@end