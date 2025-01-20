@interface PKPGSVTransitionInterstitialController
+ (id)createInView:(id)a3 withProvider:(id)a4 containerAlpha:(double)a5 deactivationHandler:(id)a6;
- (BOOL)isActive;
- (BOOL)isCurrentProvider:(id)a3;
- (BOOL)isInView:(id)a3;
- (BOOL)isInvalidated;
- (PKPGSVTransitionInterstitialController)init;
- (void)_beginTimeout;
- (void)_createDefaultInterstitialsIn:(void *)a3 forViews:;
- (void)_createPlaceholderInterstitialsIn:(unint64_t)a3 forCount:(int)a4 push:;
- (void)_setNeedsUpdateForCurrentProvider:(uint64_t)a1;
- (void)_updateActive;
- (void)_updateBindings;
- (void)context;
- (void)dealloc;
- (void)invalidate;
- (void)pushProvider:(id)a3 withContainerAlpha:(double)a4 context:(void *)a5;
- (void)setNeedsUpdateForProvider:(id)a3;
- (void)transferToView:(id)a3 withDeactivationHandler:(id)a4;
- (void)updateCurrentProvider:(id)a3 withContainerAlpha:(double)a4;
- (void)updateExistingViewsForCurrentProviderAnimated:(BOOL)a3 withContainerAlpha:(double)a4;
@end

@implementation PKPGSVTransitionInterstitialController

+ (id)createInView:(id)a3 withProvider:(id)a4 containerAlpha:(double)a5 deactivationHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    id v12 = 0;
LABEL_22:

    return v12;
  }
  v13 = [PKPGSVTransitionInterstitialController alloc];
  id v14 = v9;
  id v15 = v10;
  id result = v11;
  id v17 = result;
  if (!v13) {
    goto LABEL_10;
  }
  if (v14 && v15)
  {
    v51.receiver = v13;
    v51.super_class = (Class)PKPGSVTransitionInterstitialController;
    id v18 = objc_msgSendSuper2(&v51, sel_init);
    if (v18)
    {
      uint64_t v19 = (uint64_t)v18;
      v42 = v17;
      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      v21 = *(void **)(v19 + 120);
      *(void *)(v19 + 120) = v20;

      uint64_t v22 = objc_msgSend(MEMORY[0x1E4F28E10], "pk_createStrongPointerPersonalityToStrongObjects");
      v23 = *(void **)(v19 + 32);
      *(void *)(v19 + 32) = v22;

      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v25 = *(void **)(v19 + 72);
      *(void *)(v19 + 72) = v24;

      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v27 = *(void **)(v19 + 80);
      *(void *)(v19 + 80) = v26;

      uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F88168]), "initWithSpringState:", 1.0, 246.820852, 31.4210663, 0.0);
      v29 = *(void **)(v19 + 56);
      *(void *)(v19 + 56) = v28;

      uint64_t v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F88168]), "initWithSpringState:", 2.0, 300.0, 50.0, 0.0);
      v31 = *(void **)(v19 + 64);
      *(void *)(v19 + 64) = v30;

      [*(id *)(v19 + 64) setSpeed:1.6];
      objc_storeWeak((id *)(v19 + 8), v14);
      *(double *)(v19 + 16) = a5;
      *(unsigned char *)(v19 + 106) = 1;
      location = (id *)(v19 + 112);
      objc_storeWeak((id *)(v19 + 112), v15);
      -[PKPGSVTransitionInterstitialController _updateBindings](v19);
      *(unsigned char *)(v19 + 104) = 1;
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __102__PKPGSVTransitionInterstitialController__initInView_withProvider_containerAlpha_deactivationHandler___block_invoke;
      aBlock[3] = &unk_1E59CDB18;
      v46 = &v47;
      id v12 = (id)v19;
      id v45 = v12;
      v32 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
      v33 = [v15 leadingViewsForInterstitialController:v12];
      v43 = (void *)v32[2](v32, v33);

      v34 = [v15 trailingViewsForInterstitialController:v12];
      v35 = (void *)v32[2](v32, v34);

      -[PKPGSVTransitionInterstitialController _createDefaultInterstitialsIn:forViews:]((uint64_t)v12, *(void **)(v19 + 72), v43);
      -[PKPGSVTransitionInterstitialController _createDefaultInterstitialsIn:forViews:]((uint64_t)v12, *(void **)(v19 + 80), v35);
      *(unsigned char *)(v19 + 104) = 0;
      if (*((unsigned char *)v12 + 105))
      {
        id WeakRetained = objc_loadWeakRetained(location);
        if (WeakRetained) {
          [v12 setNeedsUpdateForProvider:WeakRetained];
        }
        else {
          *((unsigned char *)v12 + 105) = 0;
        }
      }
      if (objc_msgSend(*(id *)(v19 + 72), "count", location)
        || [*(id *)(v19 + 80) count]
        || *((unsigned char *)v48 + 24))
      {
        v37 = _Block_copy(v42);
        v38 = (void *)*((void *)v12 + 5);
        *((void *)v12 + 5) = v37;

        -[PKPGSVTransitionInterstitialController _beginTimeout]((uint64_t)v12);
        if (!*((unsigned char *)v12 + 137))
        {
          uint64_t v39 = *((void *)v12 + 5);
          if (v39) {
            (*(void (**)(uint64_t, id))(v39 + 16))(v39, v12);
          }
        }

        _Block_object_dispose(&v47, 8);
      }
      else
      {
        *(unsigned char *)(v19 + 106) = 0;
        objc_storeWeak(locationa, 0);
        -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)v12);

        _Block_object_dispose(&v47, 8);
        id v12 = 0;
      }
      id v17 = v42;
      goto LABEL_21;
    }
LABEL_10:
    id v12 = 0;
LABEL_21:

    goto LABEL_22;
  }
  __break(1u);
  return result;
}

- (PKPGSVTransitionInterstitialController)init
{
  return 0;
}

- (void)_updateBindings
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [*(id *)(a1 + 120) allObjects];
    v3 = (void *)[v2 mutableCopy];

    if (*(unsigned char *)(a1 + 136))
    {
      id v4 = 0;
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__PKPGSVTransitionInterstitialController__updateBindings__block_invoke;
      aBlock[3] = &unk_1E59CDB40;
      id v37 = v3;
      uint64_t v38 = a1;
      id v4 = v5;
      id v39 = v4;
      v6 = (void (**)(void *, id))_Block_copy(aBlock);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      v6[2](v6, WeakRetained);

      id v8 = objc_loadWeakRetained((id *)(a1 + 112));
      v6[2](v6, v8);
    }
    if ([v3 count])
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v33 != v12) {
              objc_enumerationMutation(v9);
            }
            [*(id *)(a1 + 120) removeObject:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v42 count:16];
        }
        while (v11);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * j) unbindInterstitialController:a1];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v41 count:16];
        }
        while (v16);
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v4;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * k), "bindInterstitialController:", a1, (void)v24);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v40 count:16];
      }
      while (v21);
    }
  }
}

id __102__PKPGSVTransitionInterstitialController__initInView_withProvider_containerAlpha_deactivationHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    __break(1u);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        uint64_t v11 = objc_msgSend(v10, "layer", (void)v21);
        uint64_t v12 = [v11 presentationLayer];
        v13 = (void *)v12;
        if (v12) {
          id v14 = (void *)v12;
        }
        else {
          id v14 = v11;
        }
        id v15 = v14;

        [v15 opacity];
        float v17 = v16;

        double v18 = *(double *)(*(void *)(a1 + 32) + 16) * v17;
        if (v18 > 0.0)
        {
          id v8 = v4;
          goto LABEL_16;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_16:

  id v19 = v8;
  return v19;
}

- (void)_createDefaultInterstitialsIn:(void *)a3 forViews:
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && (uint64_t v7 = v6) != 0)
  {
    unint64_t v8 = [v5 count];
    unint64_t v26 = [v7 count];
    if (v8 < v26)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
      {
        long long v24 = v5;
        objc_initWeak(&location, (id)a1);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __81__PKPGSVTransitionInterstitialController__createDefaultInterstitialsIn_forViews___block_invoke;
        aBlock[3] = &unk_1E59CB100;
        objc_copyWeak(&v28, &location);
        long long v23 = _Block_copy(aBlock);
        double v9 = *MEMORY[0x1E4F1DB30];
        double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        do
        {
          uint64_t v11 = v7;
          uint64_t v12 = [v7 objectAtIndexedSubscript:v8];
          v13 = [*(id *)(a1 + 32) objectForKey:v12];
          if (!v13)
          {
            v13 = -[PKPGSVTransitionInterstitialItem initWithView:]((id *)[PKPGSVTransitionInterstitialItem alloc], v12);
            [*(id *)(a1 + 32) setObject:v13 forKey:v12];
          }
          id v14 = [PKPGSVTransitionInterstitialView alloc];
          id v15 = *(void **)(a1 + 56);
          float v16 = *(void **)(a1 + 64);
          double v17 = *(double *)(a1 + 16);
          id v18 = v13;
          id v19 = WeakRetained;
          id v20 = v15;
          id v21 = v16;
          id v22 = v23;
          if (v14)
          {
            if (!v18) {
              goto LABEL_15;
            }
            id v14 = (PKPGSVTransitionInterstitialView *)[(PKPGSVTransitionInterstitialView *)v14 _initForItem:v19 inView:v20 withSpringFactory:v21 dismissalSpringFactory:v22 defaultSize:v9 containerAlpha:v10 activationObserver:v17];
          }

          [v24 addObject:v14];
          ++v8;
          uint64_t v7 = v11;
        }
        while (v26 != v8);

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        id v5 = v24;
      }
    }
  }
  else
  {
LABEL_15:
    __break(1u);
  }
}

- (void)_beginTimeout
{
  if (a1 && !*(unsigned char *)(a1 + 136))
  {
    v2 = *(NSObject **)(a1 + 48);
    if (v2)
    {
      dispatch_source_cancel(v2);
      id v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
    dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    id v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;

    id v6 = *(NSObject **)(a1 + 48);
    dispatch_time_t v7 = dispatch_time(0, 750000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
    objc_initWeak(&location, (id)a1);
    unint64_t v8 = *(NSObject **)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__PKPGSVTransitionInterstitialController__beginTimeout__block_invoke;
    v9[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v8, v9);
    dispatch_resume(*(dispatch_object_t *)(a1 + 48));
    -[PKPGSVTransitionInterstitialController _updateActive](a1);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  timeout = self->_timeout;
  if (timeout)
  {
    dispatch_source_cancel(timeout);
    dispatch_source_t v4 = self->_timeout;
    self->_timeout = 0;
  }
  if (!self->_invalidated)
  {
    id v5 = [(NSMapTable *)self->_items objectEnumerator];
    id v6 = [v5 allObjects];

    if ([v6 count])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__PKPGSVTransitionInterstitialController_dealloc__block_invoke;
      block[3] = &unk_1E59CA7D0;
      id v9 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)PKPGSVTransitionInterstitialController;
  [(PKPGSVTransitionInterstitialController *)&v7 dealloc];
}

void __49__PKPGSVTransitionInterstitialController_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        -[PKPGSVTransitionInterstitialItem invalidate](*(void *)(*((void *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_updateActive
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 136))
    {
      if (!*(unsigned char *)(a1 + 137)) {
        return;
      }
      *(unsigned char *)(a1 + 137) = 0;
      goto LABEL_5;
    }
    if (*(unsigned char *)(a1 + 24)) {
      return;
    }
    if (*(void *)(a1 + 128))
    {
      if (!*(unsigned char *)(a1 + 137)) {
        *(unsigned char *)(a1 + 137) = 1;
      }
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v6 = v5 != 0;
      if (*(unsigned __int8 *)(a1 + 137) != v6)
      {
        *(unsigned char *)(a1 + 137) = v6;
        if (!v5)
        {
          long long v7 = [*(id *)(a1 + 32) keyEnumerator];
          long long v8 = [v7 allObjects];

          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v9 = v8;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v18;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v18 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
                uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v14, (void)v17);
                float v16 = (void *)v15;
                if (!v15 || *(unsigned char *)(v15 + 40) || ![*(id *)(v15 + 32) count])
                {
                  [*(id *)(a1 + 32) removeObjectForKey:v14];
                  -[PKPGSVTransitionInterstitialItem invalidate]((uint64_t)v16);
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
            }
            while (v11);
          }

LABEL_5:
          uint64_t v2 = *(void *)(a1 + 40);
          if (v2)
          {
            uint64_t v3 = *(void (**)(uint64_t, id))(v2 + 16);
            id v4 = (id)a1;
            v3(v2, v4);
          }
        }
      }
    }
  }
}

void __55__PKPGSVTransitionInterstitialController__beginTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[6];
    uint64_t v5 = v2;
    if (v3)
    {
      dispatch_source_cancel(v3);
      id v4 = v5[6];
      v5[6] = 0;

      uint64_t v2 = v5;
    }
    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)v2);
    uint64_t v2 = v5;
  }
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    timeout = self->_timeout;
    if (timeout)
    {
      dispatch_source_cancel(timeout);
      id v4 = self->_timeout;
      self->_timeout = 0;
    }
    -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)self);
    uint64_t v5 = (void *)[(NSMutableArray *)self->_leadingInterstitials copy];
    [(NSMutableArray *)self->_leadingInterstitials removeAllObjects];
    int v6 = (void *)[(NSMutableArray *)self->_trailingInterstitials copy];
    [(NSMutableArray *)self->_trailingInterstitials removeAllObjects];
    long long v7 = [(NSMapTable *)self->_items objectEnumerator];
    long long v8 = [v7 allObjects];

    [(NSMapTable *)self->_items removeAllObjects];
    __52__PKPGSVTransitionInterstitialController_invalidate__block_invoke(v5);
    __52__PKPGSVTransitionInterstitialController_invalidate__block_invoke(v6);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          -[PKPGSVTransitionInterstitialItem invalidate](*(void *)(*((void *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)self);
  }
}

void __52__PKPGSVTransitionInterstitialController_invalidate__block_invoke(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = a1;
  uint64_t v1 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v21;
    long long v18 = v25;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v21 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v5 && !*(unsigned char *)(v5 + 413))
        {
          *(unsigned char *)(v5 + 413) = 1;
          int v6 = objc_msgSend(*(id *)(v5 + 528), "mutableCopy", v18);
          [*(id *)(v5 + 528) removeAllObjects];
          long long v7 = *(const void **)(v5 + 472);
          if (v7)
          {
            long long v8 = _Block_copy(v7);
            [v6 addObject:v8];

            id v9 = *(void **)(v5 + 472);
            *(void *)(v5 + 472) = 0;
          }
          uint64_t v10 = *(const void **)(v5 + 504);
          if (v10)
          {
            uint64_t v11 = _Block_copy(v10);
            [v6 addObject:v11];

            uint64_t v12 = *(void **)(v5 + 504);
            *(void *)(v5 + 504) = 0;
          }
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v26 + 1) + 8 * j) + 16))();
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
            }
            while (v15);
          }

          -[PKPGSVTransitionInterstitialView _updateActive](v5);
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v25[0] = __46__PKPGSVTransitionInterstitialView_invalidate__block_invoke;
          v25[1] = &unk_1E59CA7D0;
          v25[2] = v5;
          [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v24];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v2);
  }
}

void __57__PKPGSVTransitionInterstitialController__updateBindings__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(*(void *)(a1 + 40) + 120) addObject:v5];
      [*(id *)(a1 + 48) addObject:v5];
    }
    else
    {
      [*(id *)(a1 + 32) removeObjectAtIndex:v4];
    }
    id v3 = v5;
  }
}

- (void)_createPlaceholderInterstitialsIn:(unint64_t)a3 forCount:(int)a4 push:
{
  id v7 = a2;
  long long v8 = v7;
  if (!a1)
  {
LABEL_26:

    return;
  }
  if (v7)
  {
    unint64_t v9 = [v7 count];
    if (v9 < a3)
    {
      unint64_t v10 = v9;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
      {
        objc_initWeak(&location, (id)a1);
        uint64_t v29 = MEMORY[0x1E4F143A8];
        uint64_t v30 = 3221225472;
        long long v31 = __90__PKPGSVTransitionInterstitialController__createPlaceholderInterstitialsIn_forCount_push___block_invoke;
        uint64_t v32 = &unk_1E59CB100;
        objc_copyWeak(&v33, &location);
        uint64_t v12 = _Block_copy(&v29);
        unint64_t v13 = 0;
        CGFloat v14 = *MEMORY[0x1E4F1DB20];
        CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        if (v10 && a4)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            uint64_t v19 = objc_msgSend(v8, "objectAtIndexedSubscript:", i, v29, v30, v31, v32);
            CGFloat v14 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v19, 1, v14, v15, v16, v17);
            CGFloat v15 = v20;
            double v16 = v21;
            double v17 = v22;
          }
          unint64_t v13 = v10;
        }
        v35.origin.x = v14;
        v35.origin.y = v15;
        v35.size.width = v16;
        v35.size.height = v17;
        BOOL IsNull = CGRectIsNull(v35);
        unint64_t v24 = a3 - v13;
        if (a3 > v13)
        {
          if (IsNull) {
            double v25 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
          }
          else {
            double v25 = v17;
          }
          if (IsNull) {
            double v26 = *MEMORY[0x1E4F1DB30];
          }
          else {
            double v26 = v16;
          }
          do
          {
            long long v27 = [PKPGSVTransitionInterstitialView alloc];
            if (v27) {
              id v28 = [(PKPGSVTransitionInterstitialView *)v27 _initForItem:WeakRetained inView:*(void **)(a1 + 56) withSpringFactory:*(void **)(a1 + 64) dismissalSpringFactory:v12 defaultSize:v26 containerAlpha:v25 activationObserver:*(double *)(a1 + 16)];
            }
            else {
              id v28 = 0;
            }
            objc_msgSend(v8, "addObject:", v28, v29, v30, v31, v32);
            if (a4) {
              -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v28, 1, v14, v15, v16, v17);
            }

            --v24;
          }
          while (v24);
        }

        objc_destroyWeak(&v33);
        objc_destroyWeak(&location);
      }
    }
    goto LABEL_26;
  }
  __break(1u);
}

void __90__PKPGSVTransitionInterstitialController__createPlaceholderInterstitialsIn_forCount_push___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[16];
    if (a2)
    {
      uint64_t v5 = 1;
    }
    else
    {
      if (!v4)
      {
        __break(1u);
        return;
      }
      uint64_t v5 = -1;
    }
    WeakRetained[16] = v5 + v4;
    int v6 = WeakRetained;
    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)WeakRetained);
    id WeakRetained = v6;
  }
}

void __81__PKPGSVTransitionInterstitialController__createDefaultInterstitialsIn_forViews___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[16];
    if (a2)
    {
      uint64_t v5 = 1;
    }
    else
    {
      if (!v4)
      {
        __break(1u);
        return;
      }
      uint64_t v5 = -1;
    }
    WeakRetained[16] = v5 + v4;
    int v6 = WeakRetained;
    -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)WeakRetained);
    id WeakRetained = v6;
  }
}

- (void)setNeedsUpdateForProvider:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_invalidated)
    {
      id v7 = v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);

      id v4 = v7;
      if (WeakRetained == v7
        || (v6 = objc_loadWeakRetained((id *)&self->_previousProvider), v6, id v4 = v7, v6 == v7))
      {
        -[PKPGSVTransitionInterstitialController _setNeedsUpdateForCurrentProvider:]((uint64_t)self, WeakRetained == v4);
        id v4 = v7;
      }
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)_setNeedsUpdateForCurrentProvider:(uint64_t)a1
{
  if (a1 && !*(unsigned char *)(a1 + 136))
  {
    if (a2)
    {
      if (*(unsigned char *)(a1 + 104))
      {
        *(unsigned char *)(a1 + 105) = 1;
        return;
      }
      *(_WORD *)(a1 + 104) = 1;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      BOOL v5 = WeakRetained == 0;
    }
    else
    {
      if (*(unsigned char *)(a1 + 88))
      {
        *(unsigned char *)(a1 + 89) = 1;
        return;
      }
      *(_WORD *)(a1 + 88) = 1;
      id v6 = objc_loadWeakRetained((id *)(a1 + 96));
      if (!v6)
      {
        *(unsigned char *)(a1 + 88) = 0;
        return;
      }
      id WeakRetained = v6;
      BOOL v5 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke;
    aBlock[3] = &unk_1E59CDB68;
    char v19 = a2;
    void aBlock[4] = a1;
    id v7 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
    if (v5)
    {
      long long v8 = (void *)MEMORY[0x1E4F1CBF0];
      unint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      unint64_t v10 = [WeakRetained leadingViewsForInterstitialController:a1];
      unint64_t v9 = (void *)v7[2](v7, v10);

      uint64_t v11 = [WeakRetained trailingViewsForInterstitialController:a1];
      long long v8 = (void *)v7[2](v7, v11);
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke_2;
    v16[3] = &unk_1E59CDB90;
    v16[4] = a1;
    char v17 = a2;
    uint64_t v12 = (char *)_Block_copy(v16);
    unint64_t v13 = v12;
    char v14 = *(unsigned char *)(a1 + 24);
    *(unsigned char *)(a1 + 24) = 1;
    if (a2)
    {
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:](a1, *(void **)(a1 + 72), [v9 count], 0);
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:](a1, *(void **)(a1 + 80), [v8 count], 0);
      (*((void (**)(char *, void, void *))v13 + 2))(v13, *(void *)(a1 + 72), v9);
      (*((void (**)(char *, void, void *))v13 + 2))(v13, *(void *)(a1 + 80), v8);
      *(unsigned char *)(a1 + 104) = 0;
      if (!*(unsigned char *)(a1 + 105)) {
        goto LABEL_20;
      }
    }
    else
    {
      CGFloat v15 = (void (**)(char *, void, void *))(v12 + 16);
      (*((void (**)(char *, void, void *))v12 + 2))(v12, *(void *)(a1 + 72), v9);
      (*v15)(v13, *(void *)(a1 + 80), v8);
      *(unsigned char *)(a1 + 88) = 0;
      if (!*(unsigned char *)(a1 + 89))
      {
LABEL_20:
        *(unsigned char *)(a1 + 24) = v14;
        -[PKPGSVTransitionInterstitialController _updateActive](a1);

        return;
      }
    }
    -[PKPGSVTransitionInterstitialController _setNeedsUpdateForCurrentProvider:](a1, a2);
    goto LABEL_20;
  }
}

id __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    __break(1u);
  }
  id v4 = v3;
  BOOL v5 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v11, (void)v23);
          if (v12)
          {

LABEL_18:
            BOOL v5 = v6;
            goto LABEL_19;
          }
          unint64_t v13 = [v11 layer];
          uint64_t v14 = [v13 presentationLayer];
          CGFloat v15 = (void *)v14;
          if (v14) {
            double v16 = (void *)v14;
          }
          else {
            double v16 = v13;
          }
          id v17 = v16;

          [v17 opacity];
          float v19 = v18;

          double v20 = *(double *)(*(void *)(a1 + 32) + 16) * v19;
          if (v20 > 0.0) {
            goto LABEL_18;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
LABEL_19:
  }
  id v21 = v5;

  return v21;
}

void __76__PKPGSVTransitionInterstitialController__setNeedsUpdateForCurrentProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v32 = a2;
  id v5 = a3;
  unint64_t v6 = [v32 count];
  unint64_t v7 = [v5 count];
  unint64_t v8 = v7;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  CGFloat v11 = *MEMORY[0x1E4F1DB20];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v6 >= v7) {
    unint64_t v15 = v7;
  }
  else {
    unint64_t v15 = v6;
  }
  if (v15)
  {
    uint64_t v16 = 0;
    double v17 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      float v19 = [v32 objectAtIndexedSubscript:v16];
      double v20 = [v5 objectAtIndexedSubscript:v16];
      id v21 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v20];
      if (!v21)
      {
        id v21 = -[PKPGSVTransitionInterstitialItem initWithView:]((id *)[PKPGSVTransitionInterstitialItem alloc], v20);
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v21 forKey:v20];
      }
      if (*(unsigned char *)(a1 + 40))
      {
        double v17 = [(PKPGSVTransitionInterstitialView *)v19 updateCurrentItem:v17 withDefaultSize:v18 containerAlpha:*(double *)(*(void *)(a1 + 32) + 16)];
        double v18 = v22;
        CGFloat v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v19, 1, v11, v12, v13, v14);
        CGFloat v12 = v23;
        CGFloat v13 = v24;
        CGFloat v14 = v25;
      }
      else if (v19)
      {
        [(PKPGSVTransitionInterstitialView *)(uint64_t)v19 _setPreviousItem:0 withDefaultSize:1 force:v9 animated:v10];
      }

      ++v16;
    }
    while (v15 != v16);
  }
  else
  {
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v17 = *MEMORY[0x1E4F1DB30];
  }
  if (v6 > v8)
  {
    do
    {
      long long v26 = [v32 objectAtIndexedSubscript:v15];
      long long v27 = v26;
      if (*(unsigned char *)(a1 + 40))
      {
        double v17 = [(PKPGSVTransitionInterstitialView *)v26 updateCurrentItem:v17 withDefaultSize:v18 containerAlpha:*(double *)(*(void *)(a1 + 32) + 16)];
        double v18 = v28;
        CGFloat v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v27, 1, v11, v12, v13, v14);
        CGFloat v12 = v29;
        CGFloat v13 = v30;
        CGFloat v14 = v31;
      }
      else if (v26)
      {
        [(PKPGSVTransitionInterstitialView *)(uint64_t)v26 _setPreviousItem:0 withDefaultSize:1 force:v9 animated:v10];
      }

      ++v15;
    }
    while (v6 != v15);
  }
}

- (BOOL)isInView:(id)a3
{
  BOOL v3 = 0;
  if (a3 && !self->_invalidated)
  {
    p_container = &self->_container;
    id v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_container);
    BOOL v3 = WeakRetained == v5;
  }
  return v3;
}

- (void)transferToView:(id)a3 withDeactivationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    unint64_t v8 = v7;
    if (!self->_invalidated)
    {
      objc_storeWeak((id *)&self->_container, v6);
      double v9 = _Block_copy(v8);
      id deactivation = self->_deactivation;
      self->_id deactivation = v9;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__PKPGSVTransitionInterstitialController_transferToView_withDeactivationHandler___block_invoke;
      aBlock[3] = &unk_1E59CB328;
      id v13 = v6;
      CGFloat v11 = (void (**)(void *, NSMutableArray *))_Block_copy(aBlock);
      self->_deferUpdateActive = 1;
      v11[2](v11, self->_leadingInterstitials);
      v11[2](v11, self->_trailingInterstitials);
      -[PKPGSVTransitionInterstitialController _beginTimeout]((uint64_t)self);
      self->_deferUpdateActive = 0;
      -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)self);
    }
  }
  else
  {
    __break(1u);
  }
}

void __81__PKPGSVTransitionInterstitialController_transferToView_withDeactivationHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v24;
    id v21 = v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(unsigned char **)(*((void *)&v23 + 1) + 8 * i);
        id v8 = *(id *)(a1 + 32);
        double v9 = v8;
        if (v7)
        {
          if (!v8 || v7[410]) {
            __break(1u);
          }
          v7[410] = 1;
          uint64_t v10 = objc_msgSend(v7, "superview", v21);
          CGFloat v11 = (void *)v10;
          if (v10)
          {
            if ((void *)v10 != v9 && v7[411] != 0)
            {
              [v7 bounds];
              objc_msgSend(v9, "convertRect:fromView:", v7);
              uint64_t v14 = v13;
              uint64_t v16 = v15;
              uint64_t v18 = v17;
              uint64_t v20 = v19;
              [v9 addSubview:v7];
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v28[0] = __51__PKPGSVTransitionInterstitialView_transferToView___block_invoke;
              v28[1] = &unk_1E59CBC90;
              v28[2] = v7;
              v28[3] = v14;
              v28[4] = v16;
              v28[5] = v18;
              v28[6] = v20;
              [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v27];
            }
          }
          else
          {
            [v9 addSubview:v7];
            v7[411] = 0;
          }
          v7[410] = 0;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v4);
  }
}

- (void)pushProvider:(id)a3 withContainerAlpha:(double)a4 context:(void *)a5
{
  id v8 = a3;
  if (self->_updatingCurrentProvider
    || self->_updatingPreviousProvider
    || self->_currentProviderDirty
    || self->_previousProviderDirty)
  {
    __break(1u);
  }
  else
  {
    double v9 = v8;
    if (!self->_invalidated)
    {
      timeout = self->_timeout;
      if (timeout)
      {
        dispatch_source_cancel(timeout);
        CGFloat v11 = self->_timeout;
        self->_timeout = 0;
      }
      self->_alpha = a4;
      self->_context = a5;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_currentProvider);
      objc_storeWeak((id *)&self->_previousProvider, WeakRetained);

      self->_currentProviderExisted = v9 != 0;
      objc_storeWeak((id *)&self->_currentProvider, v9);
      -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)self);
      self->_updatingCurrentProvider = 1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke;
      aBlock[3] = &unk_1E59CDBB8;
      void aBlock[4] = self;
      *(double *)&void aBlock[5] = a4;
      uint64_t v13 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
      if (v9)
      {
        uint64_t v14 = [v9 leadingViewsForInterstitialController:self];
        uint64_t v15 = (void *)v13[2](v13, v14);

        uint64_t v16 = [v9 trailingViewsForInterstitialController:self];
        uint64_t v17 = (void *)v13[2](v13, v16);
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
        uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke_2;
      v20[3] = &unk_1E59CDBE0;
      v20[4] = self;
      *(double *)&v20[5] = a4;
      uint64_t v18 = (void (**)(void *, NSMutableArray *, void *))_Block_copy(v20);
      self->_deferUpdateActive = 1;
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:]((uint64_t)self, self->_leadingInterstitials, [v15 count], 1);
      -[PKPGSVTransitionInterstitialController _createPlaceholderInterstitialsIn:forCount:push:]((uint64_t)self, self->_trailingInterstitials, [v17 count], 1);
      v18[2](v18, self->_leadingInterstitials, v15);
      v18[2](v18, self->_trailingInterstitials, v17);
      self->_updatingCurrentProvider = 0;
      if (self->_currentProviderDirty)
      {
        id v19 = objc_loadWeakRetained((id *)&self->_currentProvider);
        if (v19) {
          [(PKPGSVTransitionInterstitialController *)self setNeedsUpdateForProvider:v19];
        }
        else {
          self->_currentProviderDirty = 0;
        }
      }
      self->_deferUpdateActive = 0;
      -[PKPGSVTransitionInterstitialController _updateActive]((uint64_t)self);
    }
  }
}

id __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3) {
    __break(1u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        CGFloat v11 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKey:", v10, (void)v22);
        if (v11)
        {

LABEL_17:
          id v8 = v4;
          goto LABEL_18;
        }
        CGFloat v12 = [v10 layer];
        uint64_t v13 = [v12 presentationLayer];
        uint64_t v14 = (void *)v13;
        if (v13) {
          uint64_t v15 = (void *)v13;
        }
        else {
          uint64_t v15 = v12;
        }
        id v16 = v15;

        [v16 opacity];
        float v18 = v17;

        double v19 = *(double *)(a1 + 40) * v18;
        if (v19 > 0.0) {
          goto LABEL_17;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_18:

  id v20 = v8;
  return v20;
}

void __82__PKPGSVTransitionInterstitialController_pushProvider_withContainerAlpha_context___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v5 = a3;
  unint64_t v6 = [v29 count];
  unint64_t v7 = [v5 count];
  unint64_t v8 = v7;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  CGFloat v11 = *MEMORY[0x1E4F1DB20];
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v6 >= v7) {
    unint64_t v15 = v7;
  }
  else {
    unint64_t v15 = v6;
  }
  if (v15)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      float v17 = [v29 objectAtIndexedSubscript:i];
      float v18 = [v5 objectAtIndexedSubscript:i];
      double v19 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:v18];
      if (!v19)
      {
        double v19 = -[PKPGSVTransitionInterstitialItem initWithView:]((id *)[PKPGSVTransitionInterstitialItem alloc], v18);
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v19 forKey:v18];
      }
      double v9 = [(PKPGSVTransitionInterstitialView *)(uint64_t)v17 pushItem:v9 withDefaultSize:v10 containerAlpha:*(double *)(a1 + 40)];
      double v10 = v20;
      CGFloat v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v17, 1, v11, v12, v13, v14);
      CGFloat v12 = v21;
      CGFloat v13 = v22;
      CGFloat v14 = v23;
    }
  }
  if (v6 > v8)
  {
    do
    {
      long long v24 = [v29 objectAtIndexedSubscript:v15];
      double v9 = [(PKPGSVTransitionInterstitialView *)(uint64_t)v24 pushItem:v9 withDefaultSize:v10 containerAlpha:*(double *)(a1 + 40)];
      double v10 = v25;
      CGFloat v11 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v24, 1, v11, v12, v13, v14);
      CGFloat v12 = v26;
      CGFloat v13 = v27;
      CGFloat v14 = v28;

      ++v15;
    }
    while (v6 != v15);
  }
}

- (BOOL)isCurrentProvider:(id)a3
{
  if (!a3) {
    return !self->_currentProviderExisted;
  }
  p_currentProvider = &self->_currentProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentProvider);
  BOOL v6 = WeakRetained == v4;

  return v6;
}

- (void)updateCurrentProvider:(id)a3 withContainerAlpha:(double)a4
{
  id v6 = a3;
  if (*(_WORD *)&self->_updatingCurrentProvider)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6;
    if (!self->_invalidated)
    {
      self->_alpha = a4;
      self->_currentProviderExisted = v6 != 0;
      id v8 = v6;
      objc_storeWeak((id *)&self->_currentProvider, v6);
      -[PKPGSVTransitionInterstitialController _updateBindings]((uint64_t)self);
      -[PKPGSVTransitionInterstitialController _setNeedsUpdateForCurrentProvider:]((uint64_t)self, 1);
      unint64_t v7 = v8;
    }
  }
}

- (void)updateExistingViewsForCurrentProviderAnimated:(BOOL)a3 withContainerAlpha:(double)a4
{
  if (self->_updatingCurrentProvider || self->_currentProviderDirty)
  {
    __break(1u);
  }
  else if (!self->_invalidated)
  {
    self->_alpha = a4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __107__PKPGSVTransitionInterstitialController_updateExistingViewsForCurrentProviderAnimated_withContainerAlpha___block_invoke;
    v6[3] = &unk_1E59CDC08;
    BOOL v7 = a3;
    v6[4] = self;
    id v5 = (void (**)(void *, NSMutableArray *))_Block_copy(v6);
    v5[2](v5, self->_leadingInterstitials);
    v5[2](v5, self->_trailingInterstitials);
  }
}

void __107__PKPGSVTransitionInterstitialController_updateExistingViewsForCurrentProviderAnimated_withContainerAlpha___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    CGFloat v6 = *MEMORY[0x1E4F1DB20];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v3);
        }
        CGFloat v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        if (v12)
        {
          double v13 = *(double *)(*(void *)(a1 + 32) + 16);
          -[PKPGSVTransitionInterstitialView _updatePositionAnimated:](*(void *)(*((void *)&v17 + 1) + 8 * v11), *(unsigned __int8 *)(a1 + 40));
          -[PKPGSVTransitionInterstitialView _setContainerAlpha:animated:](v12, 1, v13);
        }
        CGFloat v6 = -[PKPGSVTransitionInterstitialView resolveIndeterminatePositionWithPriorItemFrame:animated:]((uint64_t)v12, *(unsigned __int8 *)(a1 + 40), v6, v7, v8, v9);
        CGFloat v7 = v14;
        CGFloat v8 = v15;
        CGFloat v9 = v16;
        ++v11;
      }
      while (v5 != v11);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boundProviders, 0);
  objc_destroyWeak((id *)&self->_currentProvider);
  objc_destroyWeak((id *)&self->_previousProvider);
  objc_storeStrong((id *)&self->_trailingInterstitials, 0);
  objc_storeStrong((id *)&self->_leadingInterstitials, 0);
  objc_storeStrong((id *)&self->_dismissalSpringFactory, 0);
  objc_storeStrong((id *)&self->_springFactory, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong(&self->_deactivation, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_destroyWeak((id *)&self->_container);
}

@end