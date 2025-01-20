@interface TVAppDocumentController
@end

@implementation TVAppDocumentController

void __54___TVAppDocumentController__alertControllerWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained navigationController];
    id v3 = (id)[v2 popViewControllerAnimated:1];

    id WeakRetained = v4;
  }
}

uint64_t __74___TVAppDocumentController__updateModalPresentationStateWithTemplateView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", @"select", 1, 1, 0, WeakRetained, 0);
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = [WeakRetained parentViewController];
    if (!v10)
    {
      id v4 = [v9 presentingViewController];
      if (!v4) {
        goto LABEL_15;
      }
    }
    id v11 = [v9 templateViewController];
    if (v11 == v7)
    {

      if (v10) {
        v13 = v10;
      }
      else {
        v13 = v4;
      }
    }
    else
    {
      int v12 = *(unsigned __int8 *)(a1 + 72);

      if (v10)
      {

        if (!v12) {
          goto LABEL_15;
        }
      }
      else
      {

        if (!v12)
        {
LABEL_15:
          [v9 setTransitioning:0];
          goto LABEL_50;
        }
      }
    }
    v115[0] = 1;
    [v9 _willHostTemplateViewController:v7 usesTransitions:v115];
    v14 = [MEMORY[0x263EFF910] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 32)];
    double v16 = v15;

    if (v16 >= 0.25)
    {
      BOOL v79 = 0;
    }
    else
    {
      v17 = [v9 navigationController];
      v18 = [v17 viewControllers];
      BOOL v79 = (unint64_t)[v18 count] > 1;
    }
    v19 = +[_TVAppLoadingView loadingScreen];
    char v78 = [v19 isVisible];

    v20 = [v9 templateViewController];
    int v21 = [v20 conformsToProtocol:&unk_26E601F18];

    if (v21)
    {
      v22 = [v9 mediaQueryEvaluator];
      v23 = [v9 templateViewController];
      [v22 setDelegate:v23];
    }
    [*(id *)(a1 + 40) willMoveToParentViewController:0];
    if (v7) {
      [v9 addChildViewController:v7];
    }
    v24 = [v9 view];
    v25 = [*(id *)(a1 + 40) view];
    v26 = [v7 view];
    double v114 = 0.0;
    v27 = [v26 backgroundColor];
    [v27 getRed:0 green:0 blue:0 alpha:&v114];

    double v28 = v114;
    unsigned __int8 v113 = (v114 != 1.0) & ~a4;
    if (*(unsigned char *)(a1 + 73)) {
      objc_msgSend(v7, "overrideVisualEffectDisablementNeeded:", &v113, v114);
    }
    uint64_t v29 = objc_msgSend(v9, "tabBarController", v28);
    if (v29)
    {
      v30 = (void *)v29;
      int v31 = [v9 _isFlowcaseStack];

      if (v31)
      {
        [v26 setClipsToBounds:0];
        v32 = [v26 subviews];
        v33 = [v32 firstObject];
        [v33 setClipsToBounds:0];
      }
    }
    [v7 preferredContentSize];
    double v35 = *MEMORY[0x263F001B0];
    if (*MEMORY[0x263F001B0] == v36)
    {
      double v37 = *(double *)(MEMORY[0x263F001B0] + 8);
      if (v37 == v34)
      {
        [*(id *)(a1 + 40) preferredContentSize];
        if (v35 == v39 && v37 == v38)
        {
          v40 = [*(id *)(a1 + 48) mediaQueryEvaluator];
          v41 = [v40 windowSizeAdaptor];
          [v41 adjustedWindowSize];
          double v43 = v42;
          double v45 = v44;
        }
        else
        {
          [*(id *)(a1 + 40) preferredContentSize];
          double v43 = v46;
          double v45 = v47;
        }
        objc_msgSend(v26, "setFrame:", 0.0, 0.0, v43, v45);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) markTemplateDidRender];
    v103[0] = MEMORY[0x263EF8330];
    v103[1] = 3221225472;
    v103[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2;
    v103[3] = &unk_264BA7070;
    uint64_t v111 = *(void *)(a1 + 56);
    id v48 = v24;
    id v104 = v48;
    id v105 = *(id *)(a1 + 40);
    v106 = v9;
    id v49 = v25;
    id v107 = v49;
    id v50 = v7;
    id v108 = v50;
    id v51 = v26;
    uint64_t v52 = *(void *)(a1 + 48);
    id v109 = v51;
    uint64_t v110 = v52;
    unsigned __int8 v112 = v113;
    uint64_t v80 = MEMORY[0x230FC9DC0](v103);
    v94[0] = MEMORY[0x263EF8330];
    v94[1] = 3221225472;
    v94[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3;
    v94[3] = &unk_264BA7098;
    v94[4] = v9;
    id v53 = v49;
    id v95 = v53;
    id v96 = *(id *)(a1 + 40);
    unsigned __int8 v101 = v113;
    id v54 = v51;
    id v97 = v54;
    id v55 = v50;
    id v98 = v55;
    id v56 = v48;
    id v99 = v56;
    unsigned __int8 v102 = v115[0];
    long long v100 = *(_OWORD *)(a1 + 48);
    v57 = (void (**)(void))MEMORY[0x230FC9DC0](v94);
    v58 = [v56 window];
    int v59 = v115[0];

    if (v58 && v59)
    {
      if (*(unsigned char *)(a1 + 74))
      {
        id v60 = v53;
        [v60 setShouldShowSpinner:0];
        v61 = (void *)v80;
        (*(void (**)(uint64_t, uint64_t))(v80 + 16))(v80, 1);
        [v54 setAlpha:0.0];
        v62 = (void *)MEMORY[0x263F1CB60];
        if (*(unsigned char *)(a1 + 72)) {
          double v63 = 2.0;
        }
        else {
          double v63 = 0.5;
        }
        v90[0] = MEMORY[0x263EF8330];
        v90[1] = 3221225472;
        v90[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_145;
        v90[3] = &unk_264BA64A0;
        id v91 = v54;
        id v64 = v60;
        id v92 = v64;
        v88[0] = MEMORY[0x263EF8330];
        v88[1] = 3221225472;
        v88[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2_146;
        v88[3] = &unk_264BA70C0;
        v89 = v57;
        [v62 animateWithDuration:6 delay:v90 options:v88 animations:v63 completion:0.0];
        v65 = (void *)MEMORY[0x263F1CB60];
        v86[0] = MEMORY[0x263EF8330];
        v86[1] = 3221225472;
        v86[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3_147;
        v86[3] = &unk_264BA69A0;
        id v87 = v64;
        id v66 = v64;
        [v65 animateWithDuration:v86 animations:0.5];
      }
      else
      {
        if (*(unsigned char *)(a1 + 75)) {
          char v70 = v79 & (v78 ^ 1);
        }
        else {
          char v70 = 1;
        }
        v61 = (void *)v80;
        v71 = *(void (**)(void, void))(v80 + 16);
        if (v70)
        {
          v71(v80, 0);
          v57[2](v57);
        }
        else
        {
          v71(v80, 1);
          double v72 = 0.0;
          [v54 setAlpha:0.0];
          v73 = +[_TVAppLoadingView loadingScreen];
          if ([v73 isVisible])
          {
            v74 = +[_TVAppLoadingView loadingScreen];
            [v74 hideAnimationDuration];
            double v72 = v75 + 0.2;
          }
          v76 = (void *)MEMORY[0x263F1CB60];
          if (*(unsigned char *)(a1 + 72)) {
            double v77 = 0.8;
          }
          else {
            double v77 = 0.5;
          }
          v83[0] = MEMORY[0x263EF8330];
          v83[1] = 3221225472;
          v83[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_4;
          v83[3] = &unk_264BA64A0;
          id v84 = v54;
          id v85 = v53;
          v81[0] = MEMORY[0x263EF8330];
          v81[1] = 3221225472;
          v81[2] = __57___TVAppDocumentController__updateTemplateViewController__block_invoke_5;
          v81[3] = &unk_264BA70C0;
          v82 = v57;
          [v76 animateWithDuration:6 delay:v83 options:v81 animations:v77 completion:v72];
        }
      }
    }
    else
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) markTemplateWillTransition];
      [v9 setTransitioning:0];
      if ([v9 isVisualEffectDisablementNeeded]) {
        +[_TVVisualEffectView removeHostView:v53];
      }
      [v53 removeFromSuperview];
      if (v54)
      {
        [v56 addSubview:v54];
        if (v113) {
          +[_TVVisualEffectView addHostView:v54];
        }
      }
      [*(id *)(a1 + 40) removeFromParentViewController];
      [v55 didMoveToParentViewController:*(void *)(a1 + 48)];
      [v9 setVisualEffectDisablementNeeded:v113];
      [v9 _didHostTemplateViewController:v55 usedTransitions:v115[0]];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) markTemplateDidTransition];
      v67 = (id)TVMLKitSignpostLogObject;
      os_signpost_id_t v68 = os_signpost_id_make_with_pointer((os_log_t)TVMLKitSignpostLogObject, *(const void **)(a1 + 48));
      if (v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v69 = v68;
        if (os_signpost_enabled(v67))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_230B4C000, v67, OS_SIGNPOST_INTERVAL_END, v69, "TVAppDocumentControllerUpdateOffscreen-Loading", (const char *)&unk_230C3F5C6, buf, 2u);
        }
      }

      v61 = (void *)v80;
    }
  }
LABEL_50:
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) markTemplateWillTransition];
  [*(id *)(a1 + 32) setUserInteractionEnabled:0];
  [*(id *)(a1 + 40) beginAppearanceTransition:0 animated:a2];
  if ([*(id *)(a1 + 48) isVisualEffectDisablementNeeded]) {
    +[_TVVisualEffectView disableForHostView:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 64) beginAppearanceTransition:1 animated:a2];
  if (*(void *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 80), "_updateModalPresentationStateWithTemplateView:");
    [*(id *)(a1 + 32) insertSubview:*(void *)(a1 + 72) atIndex:0];
    if (*(unsigned char *)(a1 + 96))
    {
      +[_TVVisualEffectView addHostView:*(void *)(a1 + 72)];
      +[_TVVisualEffectView disableForHostView:*(void *)(a1 + 72)];
    }
  }
  id v4 = *(void **)(a1 + 64);
  return [v4 endAppearanceTransition];
}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsFocusUpdate];
  if ([*(id *)(a1 + 32) isVisualEffectDisablementNeeded])
  {
    +[_TVVisualEffectView enableForHostView:*(void *)(a1 + 40)];
    +[_TVVisualEffectView removeHostView:*(void *)(a1 + 40)];
  }
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) endAppearanceTransition];
  [*(id *)(a1 + 48) removeFromParentViewController];
  if (*(unsigned char *)(a1 + 96)) {
    +[_TVVisualEffectView enableForHostView:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 64) didMoveToParentViewController:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setTransitioning:0];
  [*(id *)(a1 + 72) setUserInteractionEnabled:1];
  [*(id *)(a1 + 32) setVisualEffectDisablementNeeded:*(unsigned __int8 *)(a1 + 96)];
  [*(id *)(a1 + 32) _didHostTemplateViewController:*(void *)(a1 + 64) usedTransitions:*(unsigned __int8 *)(a1 + 97)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) markTemplateDidTransition];
  v2 = (id)TVMLKitSignpostLogObject;
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)TVMLKitSignpostLogObject, *(const void **)(a1 + 80));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_230B4C000, v2, OS_SIGNPOST_INTERVAL_END, v4, "TVAppDocumentControllerReplace", (const char *)&unk_230C3F5C6, buf, 2u);
    }
  }

  id v5 = (id)TVMLKitSignpostLogObject;
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer((os_log_t)TVMLKitSignpostLogObject, *(const void **)(a1 + 80));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)double v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_230B4C000, v5, OS_SIGNPOST_INTERVAL_END, v7, "TVAppDocumentControllerUpdate", (const char *)&unk_230C3F5C6, v15, 2u);
    }
  }

  v8 = TVMLKitSignpostLogObject;
  if (os_signpost_enabled((os_log_t)TVMLKitSignpostLogObject))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_230B4C000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerceivedLaunch", (const char *)&unk_230C3F5C6, v14, 2u);
  }
  v9 = (id *)MEMORY[0x263F1D020];
  if ([(id)*MEMORY[0x263F1D020] shouldRecordExtendedLaunchTime])
  {
    id v10 = *v9;
    id v11 = [*v9 _launchTestName];
    LODWORD(v10) = [v10 isRunningTest:v11];

    if (v10)
    {
      id v12 = *v9;
      v13 = [*v9 _launchTestName];
      [v12 finishedTest:v13 extraResults:0];
    }
  }
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_145(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_2_146(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57___TVAppDocumentController__updateTemplateViewController__block_invoke_3_147(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) spinnerView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) loadingTitleLabel];
  [v3 setAlpha:0.0];
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57___TVAppDocumentController__updateTemplateViewController__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

void __68___TVAppDocumentController_updatePreferredFocusedViewStateForFocus___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutBelowIfNeeded];
}

@end