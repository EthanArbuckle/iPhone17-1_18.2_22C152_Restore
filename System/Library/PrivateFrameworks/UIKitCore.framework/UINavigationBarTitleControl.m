@interface UINavigationBarTitleControl
@end

@implementation UINavigationBarTitleControl

uint64_t __49___UINavigationBarTitleControl_updateConstraints__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _ensureNecessaryViews];
}

id __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    uint64_t v5 = (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v6 = (void *)v5;
    if (!*(void *)(a1 + 32)) {
      goto LABEL_8;
    }
    if (v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (*(void *)(a1 + 32))
  {
LABEL_6:
    v6 = +[UIMenu menuWithChildren:MEMORY[0x1E4F1CBF0]];
LABEL_7:
    objc_initWeak(&location, *(id *)(a1 + 40));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v8[3] = &unk_1E52EC018;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    objc_copyWeak(&v11, &location);
    [v6 setHeaderViewProvider:v8];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&location);
    goto LABEL_8;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

id __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v8[3] = &unk_1E52EBFF0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v6 = [v4 _headerViewForMenuInteraction:v5 sourceViewProvider:v8];
  objc_destroyWeak(&v9);

  return v6;
}

id __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  return WeakRetained;
}

uint64_t __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end