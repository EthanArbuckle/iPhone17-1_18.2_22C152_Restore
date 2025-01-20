@interface UIActionBridge
@end

@implementation UIActionBridge

void __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 56) actionMenuForMenu:a2 firstTarget:*(void *)(a1 + 32) includeHidden:*(unsigned __int8 *)(a1 + 64) validation:*(void *)(a1 + 40)];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 48) addObject:v3];
    v3 = v4;
  }
}

void __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v19 = 0;
  v4 = [v3 _resolvedTargetFromFirstTarget:*(void *)(a1 + 32) sender:0 shouldUseFallbackActionOut:&v19];
  v5 = [*(id *)(a1 + 40) validatedCommandForTarget:v4 command:v3 alternate:0 sender:0];
  if (v5)
  {
    id v6 = v5;
    if (([v5 attributes] & 4) == 0)
    {
      objc_initWeak(&location, v4);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_4;
      aBlock[3] = &unk_1E52EA478;
      char v17 = v19;
      id v15 = v3;
      objc_copyWeak(&v16, &location);
      v7 = _Block_copy(aBlock);
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
      uint64_t v8 = 0;
LABEL_7:
      v9 = NSStringFromSelector((SEL)[v6 action]);
      v10 = [v6 title];
      v11 = [v6 image];
      v12 = +[UIAction actionWithTitle:v10 image:v11 identifier:v9 handler:v7];

      v13 = [v6 discoverabilityTitle];
      [v12 setDiscoverabilityTitle:v13];

      objc_msgSend(v12, "setAttributes:", objc_msgSend(v6, "attributes") | v8);
      objc_msgSend(v12, "setState:", objc_msgSend(v6, "state"));
      v12[72] = [v3 requiresAuthenticatedInput];
      [*(id *)(a1 + 48) addObject:v12];

      goto LABEL_8;
    }
  }
  else
  {
    id v6 = v3;
  }
  v7 = &__block_literal_global_143;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v8 = 4;
    goto LABEL_7;
  }
LABEL_8:
}

void __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_4(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v1) {
    [v2 _performFallbackActionWithSender:0 target:WeakRetained];
  }
  else {
    [v2 performWithSender:0 target:WeakRetained];
  }
}

uint64_t __74___UIActionBridge_actionMenuForMenu_firstTarget_includeHidden_validation___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 56) validatedCommandMenuForMenu:a2 context:*(void *)(a1 + 32) validation:*(void *)(a1 + 40)];
  if (v3)
  {
    id v6 = v3;
    v4 = [v3 children];
    uint64_t v5 = [v4 count];

    id v3 = v6;
    if (v5)
    {
      [*(id *)(a1 + 48) addObject:v6];
      id v3 = v6;
    }
  }
}

void __66___UIActionBridge_validatedCommandMenuForMenu_context_validation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_msgSend(v4, "set_useSenderForResolvingTarget:", objc_msgSend(*(id *)(a1 + 32), "useSenderAsResponderSender"));
    char v18 = 0;
    uint64_t v5 = [*(id *)(a1 + 32) firstResponderTarget];
    id v6 = [*(id *)(a1 + 32) sender];
    v7 = [v4 _resolvedTargetFromFirstTarget:v5 sender:v6 shouldUseFallbackActionOut:&v18];

    if ([*(id *)(a1 + 32) useSenderAsResponderSender])
    {
      if (!v7) {
        goto LABEL_17;
      }
      id v8 = v4;
      if (!v8) {
        goto LABEL_17;
      }
LABEL_11:
      if (v8 == v4)
      {
        [*(id *)(a1 + 48) addObject:v4];
        id v8 = v4;
      }
      else
      {
        v13 = (void *)[v4 copyWithZone:0];
        v14 = [v8 title];
        [v13 setTitle:v14];

        id v15 = [v8 image];
        [v13 setImage:v15];

        id v16 = [v8 discoverabilityTitle];
        [v13 setDiscoverabilityTitle:v16];

        objc_msgSend(v13, "setAttributes:", objc_msgSend(v8, "attributes"));
        objc_msgSend(v13, "setState:", objc_msgSend(v8, "state"));
        [*(id *)(a1 + 48) addObject:v13];
        char v17 = [v4 _getStateObservers];
        [v13 _setStateObservers:v17];
      }
      goto LABEL_17;
    }
    v11 = *(void **)(a1 + 40);
    v12 = [*(id *)(a1 + 32) sender];
    id v8 = [v11 validatedCommandForTarget:v7 command:v4 alternate:0 sender:v12];

    if (v8) {
      goto LABEL_11;
    }
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (([*(id *)(a1 + 32) supportsCustomViewMenuElements] & 1) != 0
      || ([v4 menuElementRepresentation],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          !v9))
    {
      [*(id *)(a1 + 48) addObject:v4];
LABEL_18:

      goto LABEL_19;
    }
    v10 = *(void **)(a1 + 48);
    v7 = [v4 menuElementRepresentation];
    [v10 addObject:v7];
    goto LABEL_17;
  }
  [*(id *)(a1 + 48) addObject:v3];
LABEL_19:
}

@end