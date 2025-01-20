@interface UINavigationController(PKPaymentSetupProtocols)
- (uint64_t)_pk_popToViewControllerPresentationMarker:()PKPaymentSetupProtocols animated:;
- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:completion:;
- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:delay:completion:;
- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:performPreflight:completion:;
- (void)_pk_popToViewController:()PKPaymentSetupProtocols animated:;
- (void)_pk_popViewControllersFromViewController:()PKPaymentSetupProtocols toViewController:animated:;
- (void)_pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:performPreflight:delay:completion:;
@end

@implementation UINavigationController(PKPaymentSetupProtocols)

- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:completion:
{
  return objc_msgSend(a1, "_pk_presentPaymentSetupViewController:animated:performPreflight:delay:completion:", a3, a4, 1, 0, a5);
}

- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:performPreflight:completion:
{
  return objc_msgSend(a1, "_pk_presentPaymentSetupViewController:animated:performPreflight:delay:completion:", a3, a4, a5, 0, a6);
}

- (uint64_t)pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:delay:completion:
{
  return objc_msgSend(a1, "_pk_presentPaymentSetupViewController:animated:performPreflight:delay:completion:", a3, a4, 1, a5, a6);
}

- (void)_pk_presentPaymentSetupViewController:()PKPaymentSetupProtocols animated:performPreflight:delay:completion:
{
  id v12 = a3;
  id v13 = a7;
  v14 = v13;
  if (v12)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    v15 = dispatch_group_create();
    v16 = v15;
    if (a6 >= 1)
    {
      dispatch_group_enter(v15);
      dispatch_time_t v17 = dispatch_time(0, a6);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke;
      block[3] = &unk_1E59CA7D0;
      v34 = v16;
      dispatch_after(v17, MEMORY[0x1E4F14428], block);
    }
    if (a5)
    {
      dispatch_group_enter(v16);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_2;
      v30[3] = &unk_1E59CFF08;
      v32 = &v35;
      v31 = v16;
      objc_msgSend(v12, "pk_paymentSetupPreflight:", v30);
    }
    else
    {
      *((unsigned char *)v36 + 24) = 1;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_3;
    aBlock[3] = &unk_1E59CAD18;
    aBlock[4] = a1;
    id v18 = v14;
    id v29 = v18;
    v19 = _Block_copy(aBlock);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __132__UINavigationController_PKPaymentSetupProtocols___pk_presentPaymentSetupViewController_animated_performPreflight_delay_completion___block_invoke_4;
    v21[3] = &unk_1E59D0538;
    v26 = &v35;
    id v22 = v12;
    uint64_t v23 = a1;
    id v24 = v18;
    char v27 = a4;
    id v25 = v19;
    id v20 = v19;
    dispatch_group_notify(v16, MEMORY[0x1E4F14428], v21);

    _Block_object_dispose(&v35, 8);
  }
  else if (v13)
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

- (uint64_t)_pk_popToViewControllerPresentationMarker:()PKPaymentSetupProtocols animated:
{
  uint64_t v4 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = [a1 viewControllers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v19 = a4;
      uint64_t v11 = *(void *)v21;
      id v12 = &selRef_passSupportsDeviceAssessment;
      while (2)
      {
        uint64_t v13 = 0;
        v14 = v12;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v15 = *(id *)(*((void *)&v20 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v15 paymentSetupMarker] == v4)
          {
            [v7 addObject:v15];

            uint64_t v4 = 1;
            goto LABEL_15;
          }
          [v7 addObject:v15];

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        id v12 = v14;
        if (v10) {
          continue;
        }
        break;
      }
      uint64_t v4 = 0;
LABEL_15:
      a4 = v19;
    }
    else
    {
      uint64_t v4 = 0;
    }

    [a1 setViewControllers:v7 animated:a4];
  }
  else
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "%@ called without specified presentation marker, no-op.", buf, 0xCu);

      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (void)_pk_popToViewController:()PKPaymentSetupProtocols animated:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(a1, "viewControllers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*(id *)(*((void *)&v13 + 1) + 8 * i) == v6)
        {
          [v7 addObject:v6];
          goto LABEL_11;
        }
        objc_msgSend(v7, "addObject:");
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  [a1 setViewControllers:v7 animated:a4];
}

- (void)_pk_popViewControllersFromViewController:()PKPaymentSetupProtocols toViewController:animated:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = [a1 viewControllers];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    BOOL v13 = 0;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(id *)(*((void *)&v19 + 1) + 8 * v15);
        if (v13)
        {
          if (v16 != v8 || v16 == v7)
          {
            BOOL v13 = 1;
          }
          else
          {
            [v9 addObject:v8];
            BOOL v13 = 0;
          }
        }
        else
        {
          [v9 addObject:*(void *)(*((void *)&v19 + 1) + 8 * v15)];
          BOOL v13 = v16 == v7;
        }
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
  if ((PKEqualObjects() & 1) == 0) {
    [a1 setViewControllers:v9 animated:a5];
  }
}

@end