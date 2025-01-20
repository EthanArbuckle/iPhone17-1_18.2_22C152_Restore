@interface UIPhysicalButtonInteractionArbiter
@end

@implementation UIPhysicalButtonInteractionArbiter

uint64_t __61___UIPhysicalButtonInteractionArbiter__resolveConfigurations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPhysicalButtonConfigurations:*(void *)(a1 + 32)];
}

void __188___UIPhysicalButtonInteractionArbiter__enumerateAndValidateInteractionsInWindow_withRequiredBehaviorMask_configurationAcceptanceEvaluator_interactionAcceptanceHandler_shouldStopEvaluator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v7 = [a2 view];
  v8 = [a2 view];
  v9 = [v8 _window];

  int v50 = [a2 _wantsRelaxedVisibilityRequirement];
  [v7 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if ((*(unsigned int (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))())
  {
    v18 = *(void **)(a1 + 40);
    if (!v18 || v9 == v18)
    {
      id v49 = v9;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      objc_msgSend(a2, "_configurationSet", a4);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        double v23 = v11 + v15 * 0.5;
        double v24 = v13 + v17 * 0.5;
        uint64_t v25 = *(void *)v53;
        v48 = v7;
        do
        {
          uint64_t v26 = 0;
          uint64_t v27 = v21;
          do
          {
            if (*(void *)v53 != v25) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v52 + 1) + 8 * v26);
            [v28 _button];
            unint64_t v29 = [v28 _behavior];
            if (v29 >= 3) {
              uint64_t v30 = 0;
            }
            else {
              uint64_t v30 = 1 << v29;
            }
            uint64_t v31 = *(void *)(a1 + 104);
            if (v31) {
              BOOL v32 = v30 == v31;
            }
            else {
              BOOL v32 = 1;
            }
            if (v32)
            {
              if ((v30 & ~v22) != 0)
              {
                uint64_t v21 = v30 | v27;
                if (v29 != 2)
                {
                  uint64_t v33 = *(void *)(*(void *)(a1 + 88) + 8);
                  id v35 = *(id *)(v33 + 40);
                  v34 = (id *)(v33 + 40);
                  if (v49 != v35)
                  {
                    objc_storeStrong(v34, v49);
                    uint64_t v36 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
                    uint64_t v37 = *(void *)(*(void *)(a1 + 96) + 8);
                    v38 = *(void **)(v37 + 40);
                    *(void *)(v37 + 40) = v36;
                  }
                  int v39 = -[UIView _containsView:](*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), (uint64_t)v7);
                  if (((v39 ^ 1 | v50) & 1) == 0) {
                    LOBYTE(v39) = -[UIView _isInVisibleHierarchy]((uint64_t)v7);
                  }
                  if (v39)
                  {
                    v40 = [v7 superview];
                    objc_msgSend(v40, "convertPoint:toCoordinateSpace:", *(void *)(a1 + 48), v23, v24);
                    CGFloat v42 = v41;
                    CGFloat v44 = v43;

                    v7 = v48;
                    [*(id *)(a1 + 48) bounds];
                    v58.x = v42;
                    v58.y = v44;
                    if (!CGRectContainsPoint(v59, v58)) {
                      uint64_t v21 = v27 & ~v30;
                    }
                  }
                  else
                  {
                    uint64_t v21 = v27 & ~v30;
                  }
                }
              }
              else
              {
                uint64_t v21 = v27;
              }
              if ((v30 & ~v21) == 0)
              {
                uint64_t v45 = *(void *)(a1 + 64);
                if (!v45 || (*(unsigned int (**)(uint64_t, void *))(v45 + 16))(v45, v28)) {
                  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                }
              }
              v22 |= v30;
              uint64_t v27 = v21;
            }
            else
            {
              uint64_t v21 = v27;
            }
            ++v26;
          }
          while (v20 != v26);
          uint64_t v20 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
        }
        while (v20);
      }

      a4 = v47;
      v9 = v49;
    }
  }
  uint64_t v46 = *(void *)(a1 + 80);
  if (v46) {
    *a4 = (*(uint64_t (**)(void))(v46 + 16))();
  }
}

BOOL __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v8 = objc_msgSend(v4, "_configurationForButton:", objc_msgSend(a2, "_button"));
  if (!v8) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "_setConfiguration:forButton:", a2, objc_msgSend(a2, "_button"));
  }

  return v8 == 0;
}

uint64_t __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return [v6 setObject:a2 forKey:a3];
}

BOOL __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_3(uint64_t a1)
{
  return -[_UIPhysicalButtonConfigurationSet _isFull](*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

uint64_t __74___UIPhysicalButtonInteractionArbiter__createEvaluatedObjectCacheIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v4 = [a2 _wantsRelaxedVisibilityRequirement];
    uint64_t v5 = [a2 view];
    uint64_t v6 = [v5 _window];
    if (v4 & 1) == 0 && (([v5 isHidden] & 1) != 0 || (objc_msgSend(v6, "isHidden")))
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = WeakRetained[1];
      if (v8) {
        uint64_t v7 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, a2);
      }
      else {
        uint64_t v7 = 1;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id __188___UIPhysicalButtonInteractionArbiter__enumerateAndValidateInteractionsInWindow_withRequiredBehaviorMask_configurationAcceptanceEvaluator_interactionAcceptanceHandler_shouldStopEvaluator___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 rootViewController];
  v3 = [v2 _effectiveExclusiveCollectionPhysicalButtonConfigurationViewController];

  char v4 = [v3 view];

  return v4;
}

id __53___UIPhysicalButtonInteractionArbiter_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained descriptionBuilderWithMultilinePrefix:&stru_1ED0E84C0];
  v3 = [v2 build];

  return v3;
}

void __74___UIPhysicalButtonInteractionArbiter__registerPhysicalButtonInteraction___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v51 = WeakRetained;
    uint64_t v5 = [WeakRetained _scene];
    id WeakRetained = v51;
    if (v5)
    {
      char v6 = [v5 _hasInvalidated];

      id WeakRetained = v51;
      if ((v6 & 1) == 0)
      {
        uint64_t v7 = *(void **)(a1 + 32);
        uint64_t v8 = [v51 _scene];
        if (v8)
        {
          v9 = v8;
          char v10 = [v8 _hasInvalidated];

          if ((v10 & 1) == 0)
          {
            double v11 = [v7 view];
            double v12 = [v11 _window];

            id v13 = [v12 _windowHostingScene];
            id v14 = objc_loadWeakRetained((id *)v51 + 6);

            if (v13 != v14)
            {
              double v43 = [MEMORY[0x1E4F28B00] currentHandler];
              id v44 = objc_loadWeakRetained((id *)v51 + 6);
              [v43 handleFailureInMethod:sel__unregisterPhysicalButtonInteraction_withRegistrationToken_ object:"-[_UIPhysicalButtonInteractionArbiter _unregisterPhysicalButtonInteraction:withRegistrationToken:]" file:v12 lineNumber:v44 description:v51];
            }
            double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB262F30) + 8);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              double v16 = v15;
              double v17 = [v7 succinctDescription];
              *(_DWORD *)buf = 134349570;
              id v70 = v51;
              __int16 v71 = 2112;
              v72 = v17;
              __int16 v73 = 2112;
              uint64_t v74 = a2;
              _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: unregistering physical button interaction: %@; with registrationToken: %@",
                buf,
                0x20u);
            }
            -[_UIEvaluatedObjectCache removeObject:](*((void *)v51 + 9), (uint64_t)v7);
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            v18 = [v7 _configurationSet];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v60 objects:buf count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v61;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v61 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  double v23 = (void *)*((void *)v51 + 3);
                  double v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * i), "_generation"));
                  [v23 removeObject:v24];
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v60 objects:buf count:16];
              }
              while (v20);
            }

            uint64_t v25 = [MEMORY[0x1E4F29238] valueWithPointer:v12];
            [*((id *)v51 + 11) removeObject:v25];
            if (![*((id *)v51 + 11) countForObject:v25]) {
              [*((id *)v51 + 10) removeObject:v12];
            }
            id v26 = objc_loadWeakRetained((id *)v51 + 7);

            if (!v26)
            {
              [*((id *)v51 + 12) removeObject:v25];
              if (![*((id *)v51 + 12) countForObject:v25])
              {
                [v12 _removeWindowLevelChangedObserver:v51];
                unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &qword_1EB262F70);
                if (*(unsigned char *)CategoryCachedImpl)
                {
                  uint64_t v45 = *(id *)(CategoryCachedImpl + 8);
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                  {
                    if (v12)
                    {
                      uint64_t v46 = NSString;
                      id v47 = v12;
                      v48 = (objc_class *)objc_opt_class();
                      id v49 = NSStringFromClass(v48);
                      int v50 = [v46 stringWithFormat:@"<%@: %p>", v49, v47];
                    }
                    else
                    {
                      int v50 = @"(nil)";
                    }
                    *(_DWORD *)v65 = 134349314;
                    id v66 = v51;
                    __int16 v67 = 2112;
                    v68 = v50;
                    _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter ended observing window level for window: %@", v65, 0x16u);
                  }
                }
              }
            }

            id v28 = objc_loadWeakRetained((id *)v51 + 7);
            if (v28)
            {
              unint64_t v29 = [*((id *)v51 + 16) objectForKey:v12];
              [v29 configurationToInteractionMap];
              long long v56 = 0u;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v65 count:16];
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v57;
                while (2)
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    if (*(void *)v57 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    id v35 = [v30 objectForKey:*(void *)(*((void *)&v56 + 1) + 8 * j)];

                    if (v35 == v7)
                    {
                      char v36 = 1;
                      goto LABEL_33;
                    }
                  }
                  uint64_t v32 = [v30 countByEnumeratingWithState:&v56 objects:v65 count:16];
                  if (v32) {
                    continue;
                  }
                  break;
                }
              }
              char v36 = 0;
LABEL_33:
            }
            else
            {
              char v36 = 0;
            }
            [*((id *)v51 + 14) configurationToInteractionMap];
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            id v37 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v38 = [v37 countByEnumeratingWithState:&v52 objects:v64 count:16];
            if (v38)
            {
              uint64_t v39 = v38;
              uint64_t v40 = *(void *)v53;
              while (2)
              {
                for (uint64_t k = 0; k != v39; ++k)
                {
                  if (*(void *)v53 != v40) {
                    objc_enumerationMutation(v37);
                  }
                  CGFloat v42 = [v37 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * k)];

                  if (v42 == v7)
                  {

                    goto LABEL_46;
                  }
                }
                uint64_t v39 = [v37 countByEnumeratingWithState:&v52 objects:v64 count:16];
                if (v39) {
                  continue;
                }
                break;
              }
            }

            if (v36)
            {
LABEL_46:
              -[_UIPhysicalButtonInteractionArbiter _addSystemShellWindowRequiringResolutionIfNeeded:]((uint64_t)v51, (uint64_t)v12);
              -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)v51);
            }
          }
        }
        id WeakRetained = v51;
      }
    }
  }
}

uint64_t __80___UIPhysicalButtonInteractionArbiter__setResolutionStrategy_forInitialization___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained && WeakRetained[17])
  {
    uint64_t v5 = [a2 view];
    char v6 = [v5 _window];

    uint64_t v7 = v4[17];
    if (v7) {
      uint64_t v8 = (void *)[*(id *)(v7 + 8) copy];
    }
    else {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [v8 containsObject:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    uint64_t v5 = objc_opt_new();
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  id v8 = [a2 view];
  [v3 addObject:v8];
}

BOOL __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke_2(uint64_t a1)
{
  return *(unsigned char *)(a1 + 40) && [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] != 0;
}

void __68___UIPhysicalButtonInteractionArbiter__registerViewServiceObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _scene];
    if (v5)
    {
      uint64_t v6 = v5;
      char v7 = [v5 _hasInvalidated];

      if ((v7 & 1) == 0)
      {
        if (v4)
        {
          id v8 = [WeakRetained _scene];
          if (v8)
          {
            uint64_t v9 = v8;
            char v10 = [v8 _hasInvalidated];

            if ((v10 & 1) == 0)
            {
              double v11 = *(id *)(__UILogGetCategoryCachedImpl("PhysicalButtonInteraction", &_unregisterViewServiceObserver_withRegistrationToken____s_category)+ 8);
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                double v12 = NSString;
                id v13 = v4;
                id v14 = (objc_class *)objc_opt_class();
                double v15 = NSStringFromClass(v14);
                double v16 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];

                *(_DWORD *)buf = 134349570;
                uint64_t v19 = WeakRetained;
                __int16 v20 = 2112;
                uint64_t v21 = v16;
                __int16 v22 = 2112;
                uint64_t v23 = a2;
                _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: unregistering view service observer: %@; with registrationToken: %@",
                  buf,
                  0x20u);
              }
              [WeakRetained[18] removeObject:v4];
            }
          }
        }
      }
    }
  }
}

BOOL __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 _button];
  if (v4 != [*(id *)(a1 + 32) button]) {
    return 0;
  }
  uint64_t v5 = [a2 _behavior];
  if (v5 != [*(id *)(a1 + 32) behavior]) {
    return 0;
  }
  uint64_t v6 = [a2 _generation];
  uint64_t v7 = [*(id *)(a1 + 32) generation];
  return v7 == v6 || v7 == 0x3E1CC2CA76C17F8;
}

void __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke_238(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((*(unsigned int (**)(void))(*(void *)(a1[4] + 16) + 16))())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = objc_msgSend(a2, "_configurationSet", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (-[_UIPhysicalButtonConfiguration _isEqualToConfigurationMinusGeneration:](*(void *)(*((void *)&v9 + 1) + 8 * i), a1[5]))
          {

            uint64_t v4 = -[_UIPhysicalButtonInteraction _bsActionDriver](a2);
            [v4 _handleBSAction:a1[6]];
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 64);
  id v4 = &stru_1ED0E84C0;
  if (v3 == 1) {
    id v4 = @"viewServices";
  }
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @"sceneClientSettings";
  }
  [v2 appendString:v5 withName:@"resolutionStrategy"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));

  if (WeakRetained)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 56));
    if (v8)
    {
      long long v9 = NSString;
      long long v10 = (objc_class *)objc_opt_class();
      long long v11 = NSStringFromClass(v10);
      long long v12 = [v9 stringWithFormat:@"<%@: %p>", v11, v8];
    }
    else
    {
      long long v12 = @"(nil)";
    }

    id v13 = (id)[v7 appendObject:v12 withName:@"systemShellDelegate"];
  }
  id v14 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) >> 3) & 1 withName:@"configurationResolutionPaused" ifEqualTo:1];
  id v15 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) >> 4) & 1 withName:@"needsConfigurationResolutionWhenResumed" ifEqualTo:1];
  id v16 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) >> 1) & 1 withName:@"hasScheduledDeferredConfigurationResolution"];
  id v17 = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 40) >> 2) & 1 withName:@"hasScheduledDeferredConfigurationResolutionForReentrancy"];
  v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(*(void *)(a1 + 40) + 72) succinctDescription];
  id v20 = (id)[v18 appendObject:v19 withName:@"evaluatedObjectCache"];

  uint64_t v21 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(*(void *)(a1 + 40) + 72));
  uint64_t v22 = [v21 count];

  uint64_t v23 = *(void **)(a1 + 32);
  if (v22)
  {
    uint64_t v24 = [*(id *)(a1 + 32) activeMultilinePrefix];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v68[3] = &unk_1E52D9F98;
    int8x16_t v55 = *(int8x16_t *)(a1 + 32);
    id v25 = (id)v55.i64[0];
    int8x16_t v69 = vextq_s8(v55, v55, 8uLL);
    [v23 appendBodySectionWithName:@"registeredAndSortedInteractions" multilinePrefix:v24 block:v68];
  }
  else
  {
    id v26 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"registeredAndSortedInteractions"];
  }
  id v27 = *(id *)(*(void *)(a1 + 40) + 112);
  id v28 = *(void **)(a1 + 32);
  unint64_t v29 = [v27 configurations];
  id v30 = (id)[v28 appendObject:v29 withName:@"resolvedConfigurations"];

  uint64_t v31 = [v27 configurationToInteractionMap];
  uint64_t v32 = [v31 count];
  uint64_t v33 = *(void **)(a1 + 32);
  if (v32)
  {
    v34 = [*(id *)(a1 + 32) activeMultilinePrefix];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v65[3] = &unk_1E52D9F98;
    id v66 = v31;
    id v67 = *(id *)(a1 + 32);
    [v33 appendBodySectionWithName:@"sceneConfigurationToInteractionMap" multilinePrefix:v34 block:v65];
  }
  else
  {
    id v35 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"sceneConfigurationToInteractionMap"];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 80) count]) {
    id v36 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 80), "count"), @"trackedWindowPointers");
  }
  else {
    id v37 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"trackedWindowPointers"];
  }
  uint64_t v38 = [*(id *)(*(void *)(a1 + 40) + 96) count];
  uint64_t v39 = *(void **)(a1 + 32);
  if (v38)
  {
    uint64_t v40 = [*(id *)(a1 + 32) activeMultilinePrefix];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5;
    v63[3] = &unk_1E52D9F98;
    int8x16_t v56 = *(int8x16_t *)(a1 + 32);
    id v41 = (id)v56.i64[0];
    int8x16_t v64 = vextq_s8(v56, v56, 8uLL);
    [v39 appendBodySectionWithName:@"windowPointersObservedForLevelChanges" multilinePrefix:v40 block:v63];
  }
  else
  {
    id v42 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"windowPointersObservedForLevelChanges"];
  }
  uint64_t v43 = [*(id *)(*(void *)(a1 + 40) + 152) count];
  id v44 = *(void **)(a1 + 32);
  if (v43)
  {
    uint64_t v45 = [*(id *)(a1 + 32) activeMultilinePrefix];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6;
    v61[3] = &unk_1E52D9F98;
    int8x16_t v57 = *(int8x16_t *)(a1 + 32);
    id v46 = (id)v57.i64[0];
    int8x16_t v62 = vextq_s8(v57, v57, 8uLL);
    [v44 appendBodySectionWithName:@"eventDeferringTokens" multilinePrefix:v45 block:v61];
  }
  else
  {
    id v47 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"eventDeferringTokens"];
  }
  uint64_t v48 = *(void *)(a1 + 40);
  if (*(void *)(v48 + 64) == 1)
  {
    id v49 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(v48 + 136) withName:@"mostActiveViewServiceSession"];
    uint64_t v50 = [*(id *)(*(void *)(a1 + 40) + 144) count];
    id v51 = *(void **)(a1 + 32);
    if (v50)
    {
      long long v52 = [*(id *)(a1 + 32) activeMultilinePrefix];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_7;
      v59[3] = &unk_1E52D9F98;
      int8x16_t v58 = *(int8x16_t *)(a1 + 32);
      id v53 = (id)v58.i64[0];
      int8x16_t v60 = vextq_s8(v58, v58, 8uLL);
      [v51 appendBodySectionWithName:@"viewServiceObservers" multilinePrefix:v52 block:v59];
    }
    else
    {
      id v54 = (id)[*(id *)(a1 + 32) appendObject:0 withName:@"viewServiceObservers"];
    }
  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = -[_UIEvaluatedObjectCache sortedObjects](*(id **)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v6), "succinctDescription", (void)v10);
        id v9 = (id)[v7 appendObject:v8 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];
        uint64_t v5 = *(void **)(a1 + 40);
        if (v4)
        {
          uint64_t v6 = NSString;
          id v7 = (objc_class *)objc_opt_class();
          id v8 = NSStringFromClass(v7);
          id v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v4];

          if (v3) {
            goto LABEL_8;
          }
        }
        else
        {
          id v9 = @"(nil)";
          if (v3)
          {
LABEL_8:
            long long v10 = NSString;
            id v11 = v3;
            long long v12 = (objc_class *)objc_opt_class();
            long long v13 = NSStringFromClass(v12);
            id v14 = [v10 stringWithFormat:@"<%@: %p>", v13, v11];

            goto LABEL_11;
          }
        }
        id v14 = @"(nil)";
LABEL_11:
        id v15 = (id)[v5 appendObject:v9 withName:v14];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v18);
  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 96) countForObject:v6];
        id v8 = *(void **)(a1 + 40);
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%p count", objc_msgSend(v6, "pointerValue"));
        id v10 = (id)[v8 appendUnsignedInteger:v7 withName:v9];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 152);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "objectForKey:", v7, (void)v13);
        id v9 = *(void **)(a1 + 40);
        id v10 = [v8 succinctDescription];
        id v11 = [v7 description];
        id v12 = (id)[v9 appendObject:v10 withName:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_7(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 144);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        id v8 = *(void **)(a1 + 40);
        if (v7)
        {
          id v9 = NSString;
          id v10 = v7;
          id v11 = (objc_class *)objc_opt_class();
          id v12 = NSStringFromClass(v11);
          long long v13 = [v9 stringWithFormat:@"<%@: %p>", v12, v10, (void)v15];
        }
        else
        {
          long long v13 = @"(nil)";
        }
        id v14 = (id)[v8 appendObject:v13 withName:0];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

@end