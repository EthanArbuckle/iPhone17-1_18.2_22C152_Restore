@interface UINavigationController
@end

@implementation UINavigationController

void __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke(uint64_t a1)
{
}

void __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_2(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) navigationBar];
  [v2 setUserInteractionEnabled:1];

  v3 = [*(id *)(a1 + 32) interactivePopGestureRecognizer];
  [v3 setEnabled:1];

  v4 = [*(id *)(a1 + 32) view];
  [v4 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    char v2 = objc_opt_respondsToSelector();
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_69;
      v38[3] = &unk_1E59CAA98;
      id v39 = *(id *)(a1 + 56);
      [v3 presentWithNavigationController:v4 animated:v5 completion:v38];

      return;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_33;
    }
    uint64_t v10 = [*(id *)(a1 + 32) onPresentationRemoveViewControllersAfterMarker];
    if (!v10) {
      goto LABEL_33;
    }
    uint64_t v11 = v10;
    v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412546;
      v43 = v14;
      __int16 v44 = 2048;
      uint64_t v45 = v11;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "%@ asked to remove view controllers after marker: %lu", buf, 0x16u);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v15 = [*(id *)(a1 + 40) viewControllers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      oslog = v12;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v35;
      while (2)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v17 + v18;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v15);
          }
          v22 = *(void **)(*((void *)&v34 + 1) + 8 * v20);
          if ((objc_opt_respondsToSelector() & 1) != 0 && v11 == [v22 paymentSetupMarker])
          {
            uint64_t v21 = v18 + v20;
            if ((objc_opt_respondsToSelector() & 1) != 0
              && [v22 paymentSetupMarkerRemovalIsInclusive])
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v22;
                _os_log_impl(&dword_19F450000, oslog, OS_LOG_TYPE_DEFAULT, "Removal is inclusive of marked view controller: %@", buf, 0xCu);
              }
            }
            else
            {
              ++v21;
            }
            goto LABEL_28;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v41 count:16];
        uint64_t v18 = v21;
        if (v17) {
          continue;
        }
        break;
      }
LABEL_28:

      v12 = oslog;
      if (v21)
      {
        v23 = [*(id *)(a1 + 40) viewControllers];
        uint64_t v24 = [v23 count];

        if (v21 != v24)
        {
          v27 = [*(id *)(a1 + 40) viewControllers];
          v28 = objc_msgSend(v27, "subarrayWithRange:", 0, v21);
          v29 = (void *)[v28 mutableCopy];

          [v29 addObject:*(void *)(a1 + 32)];
          [*(id *)(a1 + 40) setViewControllers:v29 animated:*(unsigned __int8 *)(a1 + 72)];

          goto LABEL_39;
        }
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19F450000, oslog, OS_LOG_TYPE_DEFAULT, "No target or mark found, pushing new view controller onto existing stack. This may be an error.", buf, 2u);
        }

LABEL_33:
        objc_msgSend(*(id *)(a1 + 40), "pushViewController:animated:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 72), oslog);
LABEL_39:
        v30 = objc_msgSend(*(id *)(a1 + 40), "transitionCoordinator", oslog);
        if (v30)
        {
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_76;
          v32[3] = &unk_1E59D04E8;
          id v33 = *(id *)(a1 + 56);
          [v30 animateAlongsideTransition:0 completion:v32];
        }
        else
        {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }

        return;
      }
    }
    else
    {
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "No view controllers remain, setting new view controller as root", buf, 2u);
    }

    v25 = *(void **)(a1 + 40);
    uint64_t v40 = *(void *)(a1 + 32);
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v25 setViewControllers:v26 animated:*(unsigned __int8 *)(a1 + 72)];

    goto LABEL_39;
  }
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Error: Preflight failed for view controller: %@", buf, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

uint64_t __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_76(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end